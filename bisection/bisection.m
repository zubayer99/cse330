function [root, iter , err] = bisection( f , xlow , xup , tol )
%root, iter , error is the output,
%bisection is the function name, 
%the parameters are the input
    
    %no roots
    if f(xup) * f(xlow) > 0
        disp('No roots');
        root = Inf;
        iter = 0;
        err = Inf;
        return; %breaks function
    end

    
    iter = 1;
    root = (xup + xlow) / 2;
    f_low = f(xlow);
    f_up = f(xup);
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
        root = (xup + xlow) / 2;
        f_root = f(root);
        
        err = abs((root - root_prev) / root);
        
        
        if err < tol    %breaks while loop
            break;
        end
        
    end
    
end