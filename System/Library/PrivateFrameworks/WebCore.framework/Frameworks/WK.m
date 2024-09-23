@implementation WK

void __66__WK_RTCLocalVideoH264H265VP9Decoder_initH264DecoderWithCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "buffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v4, "pixelBuffer"), objc_msgSend(v5, "timeStamp"), objc_msgSend(v5, "timeStampNs"));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __66__WK_RTCLocalVideoH264H265VP9Decoder_initH265DecoderWithCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "buffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v4, "pixelBuffer"), objc_msgSend(v5, "timeStamp"), objc_msgSend(v5, "timeStampNs"));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __65__WK_RTCLocalVideoH264H265VP9Decoder_initVP9DecoderWithCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "buffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v4, "pixelBuffer"), objc_msgSend(v5, "timeStamp"), objc_msgSend(v5, "timeStampNs"));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end
