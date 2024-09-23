@implementation WK_RTCVideoDecoderVP9

+ (id)vp9Decoder
{
  WK_RTCWrappedNativeVideoDecoder *v2;
  uint64_t v3;
  WK_RTCWrappedNativeVideoDecoder *v4;
  uint64_t v5;
  uint64_t v7;
  pthread_mutexattr_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = [WK_RTCWrappedNativeVideoDecoder alloc];
  v3 = operator new();
  *(_QWORD *)v3 = &off_24C0B6118;
  pthread_mutexattr_init(&v8);
  pthread_mutexattr_setpolicy_np(&v8, 3);
  pthread_mutex_init((pthread_mutex_t *)(v3 + 8), &v8);
  pthread_mutexattr_destroy(&v8);
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  *(_QWORD *)(v3 + 88) = 0;
  *(_QWORD *)(v3 + 96) = 68;
  *(_QWORD *)(v3 + 104) = 0;
  *(_BYTE *)(v3 + 112) = 0;
  *(_QWORD *)(v3 + 120) = 0;
  *(_BYTE *)(v3 + 128) = 1;
  *(_BYTE *)(v3 + 132) = 0;
  *(_BYTE *)(v3 + 136) = 0;
  *(_OWORD *)(v3 + 140) = xmmword_208F05120;
  v7 = v3;
  v4 = -[WK_RTCWrappedNativeVideoDecoder initWithNativeDecoder:](v2, "initWithNativeDecoder:", &v7);
  v5 = v7;
  v7 = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  return v4;
}

@end
