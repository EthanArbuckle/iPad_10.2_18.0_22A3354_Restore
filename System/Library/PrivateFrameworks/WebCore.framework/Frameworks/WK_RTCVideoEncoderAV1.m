@implementation WK_RTCVideoEncoderAV1

+ (id)av1Encoder
{
  __n128 v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  WK_RTCWrappedNativeVideoEncoder *v11;
  uint64_t v12;
  WK_RTCWrappedNativeVideoEncoder *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD **v18;
  _QWORD *v19[2];
  _QWORD v20[5];
  uint64_t v21;
  _OWORD v22[2];
  uint64_t v23;

  v23 = 0;
  memset(v22, 0, sizeof(v22));
  v2 = webrtc::EnvironmentFactory::CreateWithDefaults((uint64_t *)v22, (uint64_t)v20);
  v3 = *(_QWORD *)&v22[0];
  if (*(_QWORD *)&v22[0])
  {
    v4 = (unsigned int *)(*(_QWORD *)&v22[0] + 8);
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
      (*(void (**)(uint64_t, __n128))(*(_QWORD *)v3 + 8))(v3, v2);
  }
  v19[0] = 0;
  v19[1] = 0;
  v18 = v19;
  webrtc::CreateLibaomAv1Encoder((uint64_t)v20, &v18, &v21);
  std::__tree<sigslot::_signal_base_interface *>::destroy((uint64_t)&v18, v19[0]);
  v7 = v20[0];
  if (v20[0])
  {
    v8 = (unsigned int *)(v20[0] + 8);
    do
    {
      v9 = __ldaxr(v8);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v8));
    if (!v10)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  if (!v21)
    return 0;
  v11 = [WK_RTCWrappedNativeVideoEncoder alloc];
  v12 = v21;
  v21 = 0;
  v17 = v12;
  v13 = -[WK_RTCWrappedNativeVideoEncoder initWithNativeEncoder:](v11, "initWithNativeEncoder:", &v17);
  v14 = v17;
  v17 = 0;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  v15 = v21;
  v21 = 0;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  return v13;
}

@end
