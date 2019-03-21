 %% tv algorithm
 if mod(iteration,5)==0
            xg=r_space(mask==1);
            x1=buffer_r_space(mask==1);
            xda=x1-xg;
            da=norm(xda(:));
            a=0.2;
            Ngrad=10;
            tv_parameter_generate;
            for m=1:Ngrad
               v=tv_generate(xg,epsi,hf1x,hf1y,hf2x,hf2y);
               vnorm=v./norm(v(:));
               xg=xg-a*da*vnorm;
           end
             r_space(mask==1)=xg;   
            
end