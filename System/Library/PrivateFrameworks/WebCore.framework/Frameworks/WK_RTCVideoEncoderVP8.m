@implementation WK_RTCVideoEncoderVP8

+ (id)vp8Encoder
{
  WK_RTCWrappedNativeVideoEncoder *v2;
  __n128 v3;
  void *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  _QWORD *v8;
  uint64_t v9;
  WK_RTCWrappedNativeVideoEncoder *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v17[5];
  uint64_t v18;
  void *__p[2];
  __int128 v20;
  uint64_t v21;
  _QWORD *v22;

  v2 = [WK_RTCWrappedNativeVideoEncoder alloc];
  v21 = 0;
  *(_OWORD *)__p = 0u;
  v20 = 0u;
  v3 = webrtc::EnvironmentFactory::CreateWithDefaults((uint64_t *)__p, (uint64_t)v17);
  v4 = __p[0];
  if (__p[0])
  {
    v5 = (unsigned int *)((char *)__p[0] + 8);
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
      (*(void (**)(void *, __n128))(*(_QWORD *)v4 + 8))(v4, v3);
  }
  v8 = (_QWORD *)operator new();
  *v8 = &off_24C0B5EC8;
  v9 = operator new();
  __p[1] = 0;
  *(_QWORD *)&v20 = 0;
  __p[0] = 0;
  v22 = v8;
  webrtc::LibvpxVp8Encoder::LibvpxVp8Encoder(v9, v17, (uint64_t)__p, (uint64_t *)&v22);
  if (v22)
    (*(void (**)(_QWORD *))(*v22 + 8))(v22);
  if (__p[0])
    operator delete(__p[0]);
  v18 = v9;
  v10 = -[WK_RTCWrappedNativeVideoEncoder initWithNativeEncoder:](v2, "initWithNativeEncoder:", &v18);
  v11 = v18;
  v18 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  v12 = v17[0];
  if (v17[0])
  {
    v13 = (unsigned int *)(v17[0] + 8);
    do
    {
      v14 = __ldaxr(v13);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, v13));
    if (!v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  }
  return v10;
}

@end
