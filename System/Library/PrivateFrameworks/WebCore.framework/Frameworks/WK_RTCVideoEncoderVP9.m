@implementation WK_RTCVideoEncoderVP9

+ (id)vp9Encoder:(id)a3
{
  WK_RTCWrappedNativeVideoEncoder *v3;
  __n128 v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  _QWORD *v9;
  uint64_t v10;
  WK_RTCWrappedNativeVideoEncoder *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  _QWORD v18[5];
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;

  v3 = [WK_RTCWrappedNativeVideoEncoder alloc];
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  v4 = webrtc::EnvironmentFactory::CreateWithDefaults((uint64_t *)v20, (uint64_t)v18);
  v5 = *(_QWORD *)&v20[0];
  if (*(_QWORD *)&v20[0])
  {
    v6 = (unsigned int *)(*(_QWORD *)&v20[0] + 8);
    do
    {
      v7 = __ldaxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
      (*(void (**)(uint64_t, __n128))(*(_QWORD *)v5 + 8))(v5, v4);
  }
  v9 = (_QWORD *)operator new();
  *v9 = &off_24C0B5EC8;
  v10 = operator new();
  *(_QWORD *)&v20[0] = v9;
  webrtc::LibvpxVp9Encoder::LibvpxVp9Encoder(v10, (uint64_t)v18, 0, (uint64_t *)v20);
  if (*(_QWORD *)&v20[0])
    (*(void (**)(_QWORD))(**(_QWORD **)&v20[0] + 8))(*(_QWORD *)&v20[0]);
  v19 = v10;
  v11 = -[WK_RTCWrappedNativeVideoEncoder initWithNativeEncoder:](v3, "initWithNativeEncoder:", &v19);
  v12 = v19;
  v19 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  v13 = v18[0];
  if (v18[0])
  {
    v14 = (unsigned int *)(v18[0] + 8);
    do
    {
      v15 = __ldaxr(v14);
      v16 = v15 - 1;
    }
    while (__stlxr(v16, v14));
    if (!v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  }
  return v11;
}

@end
