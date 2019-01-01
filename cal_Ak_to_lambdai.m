function [Aki] = cal_Ak_to_lambdai(CCMk,Lambdai,Nr)
%Lambdai�ǵ��û���Lambda(:,:,k);
%CCMkҲ�ǵ��û���CCM��CCM(:,:,k)
%����֤
Aki_ele = zeros(Nr,1);

for i = 1:Nr
    Aki_ele(i) = trace(diag(CCMk(i,:)*Lambdai));
end


Aki = diag(Aki_ele);


end

