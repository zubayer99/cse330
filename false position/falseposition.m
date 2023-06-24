function [root, iter , err] = falseposition( f , xlow , xup , tol )
    
    %no roots
    if f(xup) * f(xlow) > 0
        disp('No roots');
        root = Inf;
        iter = 0;
        err = Inf;
        return; %breaks function
    end

    
    iter = 1;
    f_low = f(xlow);
    f_up = f(xup);
    root = xup -(f_up.*(xlow-xup)) / (f_low-f_up);
    f_root = f(root);
    err = Inf;
    
    
    while(1)  %1 means true, the loop will run infinitly
        iter = iter + 1;
        root_prev = root;
        
        if f_low * f_root < 0
            xup = root;
        elseif f_up * f_root < 0
            xlow = root;
        elseif f_up * f_root == 0
            root = xup;
        elseif f_low * f_root == 0
            root = xlow;
        end
        
        
        f_up = f(xup);   %updating the function values with new acquired values
        f_low = f(xlow);
        root = xup -(f_up.*(xlow-xup)) / (f_low- f_up);
        f_root = f(root);
        
        err = abs((root - root_prev) / root);
        
        
        if err < tol    %breaks while loop
            break;
        end
        
    end
    
end