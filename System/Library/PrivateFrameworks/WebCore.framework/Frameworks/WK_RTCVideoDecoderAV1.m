@implementation WK_RTCVideoDecoderAV1

+ (id)av1Decoder
{
  uint64_t v2;
  WK_RTCWrappedNativeVideoDecoder *v3;
  uint64_t v4;
  uint64_t v6;

  v2 = operator new();
  *(_QWORD *)v2 = &off_24C0B5DB8;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 49) = 0u;
  *(_DWORD *)(v2 + 72) = 0;
  *(_QWORD *)(v2 + 88) = v2 + 88;
  *(_QWORD *)(v2 + 96) = v2 + 88;
  *(_QWORD *)(v2 + 104) = 0;
  *(_BYTE *)(v2 + 112) = 0;
  *(_QWORD *)(v2 + 120) = 150;
  *(_QWORD *)(v2 + 128) = 0;
  v6 = v2;
  v3 = -[WK_RTCWrappedNativeVideoDecoder initWithNativeDecoder:]([WK_RTCWrappedNativeVideoDecoder alloc], "initWithNativeDecoder:", &v6);
  v4 = v6;
  v6 = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return v3;
}

@end
