@implementation WK_RTCVideoDecoderVP8

+ (id)vp8Decoder
{
  WK_RTCWrappedNativeVideoDecoder *v2;
  __n128 v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  WK_RTCWrappedNativeVideoDecoder *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  _QWORD v16[5];
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;

  v2 = [WK_RTCWrappedNativeVideoDecoder alloc];
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  v3 = webrtc::EnvironmentFactory::CreateWithDefaults((uint64_t *)v18, (uint64_t)v16);
  v4 = *(_QWORD *)&v18[0];
  if (*(_QWORD *)&v18[0])
  {
    v5 = (unsigned int *)(*(_QWORD *)&v18[0] + 8);
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
      (*(void (**)(uint64_t, __n128))(*(_QWORD *)v4 + 8))(v4, v3);
  }
  v8 = operator new();
  v17 = webrtc::LibvpxVp8Decoder::LibvpxVp8Decoder(v8, (uint64_t)v16);
  v9 = -[WK_RTCWrappedNativeVideoDecoder initWithNativeDecoder:](v2, "initWithNativeDecoder:", &v17);
  v10 = v17;
  v17 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  v11 = v16[0];
  if (v16[0])
  {
    v12 = (unsigned int *)(v16[0] + 8);
    do
    {
      v13 = __ldaxr(v12);
      v14 = v13 - 1;
    }
    while (__stlxr(v14, v12));
    if (!v14)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  }
  return v9;
}

@end
