function [x] = haralickTextureFeatures(coOcMat, xFeatures)

if ~(ismatrix(coOcMat))
    error(['\coOcMatInput harus dua dimensi , ' ...
        'dimensi yang diberikan adalah %s.', ndims(coOcMat)']);
end

x = zeros(14,1);

coOcMat =  coOcMat./sum(coOcMat(:));

if sum(xFeatures == 2) == 1 | ...
        sum(xFeatures == 3) == 1 | ...
        sum(xFeatures == 4) == 1 | ...
        sum(xFeatures == 5) == 1 | ...
        sum(xFeatures == 6) == 1 | ...
        sum(xFeatures == 7) == 1 | ...
        sum(xFeatures == 8) == 1 | ...
        sum(xFeatures == 10) == 1 | ...
        sum(xFeatures == 11) == 1 | ...
        sum(xFeatures == 14) == 1 
    
    sizecoOcMat =  size(coOcMat);
    [col, row] = meshgrid(1:sizecoOcMat(1), 1:sizecoOcMat(2));
end

if sum(xFeatures == 3) ==1 | ...
        sum(xFeatures == 10) ==1
    rowMean =  sum(row(:).*coOcMat(:));
    colMean =  sum(col(:).*coOcMat(:));
    rowStd = sqrt(sum( (row(:)-rowMean).^2 .* coOcMat(:)));
    colStd = sqrt(sum( (col(:)-colMean).^2 .* coOcMat(:)));
end

if sum(xFeatures == 12) == 1 |...
        sum(xFeatures == 13) == 1 |...
        sum(xFeatures == 14) == 1 
    rowCoOcMat = sum(coOcMat, 2);
    colCoOcMat =  sum(coOcMat);
end

if sum(xFeatures == 6) == 1 |...
        sum(xFeatures == 7) == 1 |...
        sum(xFeatures == 8) == 1
    
    start =  -(sizecoOcMat(1) - 1);
    stop = sizecoOcMat(1) - 1;
    
    coOcMat90 = rot90(coOcMat);
    
    p_XplusY = zeros((2*sizecoOcMat(1)) - 1, 1);
    
    k=1;
    for index = start : stop
        p_XplusY(k) = sum(diag(coOcMat90, index));
        k = k +1;
    end
end

if sum(xFeatures == 10) == 1 |...
        sum(xFeatures == 11) == 1 
    
    start =1;
    stop = sizecoOcMat(1) - 1;
    
    p_XminusY = zeros(sizecoOcMat(1),1);
    p_XminusY(1) = sum(diag(coOcMat, 0));
    
    k = 2;
    for index =  start : stop
        p_XminusY = sum([diag(coOcMat, index);
            diag(coOcMat, -index)]);
        k = k + 1;
    end
end

for f = xFeatures
    switch f
        case 1
            x(1) = sum(coOcMat(:).^2);
            
        case 2
            matrix = (abs(row - col ).^2) .* coOcMat;
            x(2) = sum(matrix(:));
            
        case 3
            zaehler = sum((row(:) - rowMean).* ...
                (col(:) - colMean) .* coOcMat(:));
            denominator =  rowStd * colStd;
            x(3) =  zaehler/denominator;
            
        case 4
            x(4) = sum((row(:) - mean(coOcMat(:))).^2 .*coOcMat(:));
            
        case 5
            x(5) = sum(coOcMat(:) ./ (1 + (row(:) - col(:)).^2));
            
        case 6
            x(6) = sum ( (2:(2*sizecoOcMat(1)))'.*p_XplusY);
            
        case 7
            x(8) = - sum( p_XplusY(p_XplusY~=0).* ...
                log(p_XplusY(p_XplusY~=0)));
            
            x(7) = sum (((2:(2*sizecoOcMat(1)))' -...
                x(12)).^2 .* p_XplusY);
        case 8 
            if ~x(8)
            x(8) = - sum( p_XplusY(p_XplusY~=0).* ...
                log(p_XplusY(p_XplusY~=0)));
            end
        case 9
            x(9) = - sum( coOcMat(coOcMat~=0).* ...
                log(coOcMat(coOcMat~=0)));
            
        case 10
            x(10) = sum (((0:sizecoOcMat(1)-1)' -...
                mean(p_XminusY)).^2 .* p_XminusY);
            
        case 11
            x(11) = - sum( p_XminusY(p_XminusY~=0).* ...
                log(p_XminusY(p_XminusY~=0)));
            
        case 12
            
            x(9) = - sum( coOcMat(coOcMat~=0).* ...
                log(coOcMat(coOcMat~=0)));
            
            logrc = log2(rowCoOcMat*colCoOcMat);
            
            logrc(logrc == -Inf) = 0;
            HXY1 = - sum( coOcMat(:).* logrc(:));
            
            numerator = x(9) -  HXY1;
            
            logc = log2(colCoOcMat);
            logc(logc == -Inf) = 0;
            HX = - sum(colCoOcMat .* logc);
            
            logr = log2(rowCoOcMat);
            logr(logr == -Inf) = 0;
            HY = - sum(rowCoOcMat .* logr);
            
            
            denominator =  max([HX HY]);
            x(12) = numerator / denominator;
            
        case 13
            if x(9)
                x(9) = - sum( coOcMat(coOcMat~=0).* ...
                log(coOcMat(coOcMat~=0)));
            end
            logrc = log(rowCoOcMat*colCoOcMat);
            
            logrc(logrc == -Inf) = 0;
            HXY2 = - sum ( sum ((rowCoOcMat * colCoOcMat) .*logrc));
            x(13) = ((1 - exp(-2*(HXY2 - x(9))))).^(1/2);
            
        case 14
            
            Q =  zeros(sizecoOcMat(1), sizecoOcMat(2));
            
            for i = 1: sizecoOcMat(1)
                Q(i,:) = (coOcMat(i,:)./rowCoOcMat(i) ).*...
                    sum(coOcMat(i,:).*colCoOcMat);
            end
            
            Q(isnan(Q)) = 0;
            
            eigenvec = eig(Q);
            
            eigenvec(eigenvec==max(eigenvec)) = [];
            
            x(14) = sqrt(max(eigenvec));
            
            if imag(x(14))
                x(14) = abs(x(14));
            end
            
    end
end

x = [x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8) x(9) x(10) x(11) x(12) x(13) x(14)];
            
end
