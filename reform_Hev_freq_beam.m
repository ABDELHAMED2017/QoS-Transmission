function [Hev_freq_beam_test,CCMev_test] = reform_Hev_freq_beam(CCMev,Nt,Nr,NumSamples)
%REFORM_H_FREQ_BEAM �������е�ͳ�����ԣ����ɷ����ֵǡ����������ͳ�����Ը�˹�ŵ�
j = sqrt(-1);
NumLinks = 1;
Hev_freq_beam_test = zeros(Nr,Nt,1,NumSamples,NumLinks);
CCMev_test = zeros(Nr,Nt,NumLinks); 
for link_n = 1:NumLinks
    for sample_n = 1:NumSamples
        Hev_freq_beam_test(:,:,1,sample_n,link_n) = ...
        sqrt(0.5*CCMev(:,:,link_n)).*(randn(Nr,Nt) + j*randn(Nr,Nt));
    end
end
for link_n = 1:NumLinks
    for sample_n = 1:NumSamples
        CCMev_test(:,:,link_n) = ... 
        CCMev_test(:,:,link_n) + Hev_freq_beam_test(:,:,:,sample_n,link_n).*conj(Hev_freq_beam_test(:,:,:,sample_n,link_n));
    end
    CCMev_test(:,:,link_n) = CCMev_test(:,:,link_n)/NumSamples;
end
end
