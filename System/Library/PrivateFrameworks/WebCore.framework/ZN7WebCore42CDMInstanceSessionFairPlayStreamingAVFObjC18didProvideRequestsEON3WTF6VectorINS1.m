@implementation ZN7WebCore42CDMInstanceSessionFairPlayStreamingAVFObjC18didProvideRequestsEON3WTF6VectorINS1

uint64_t *___ZN7WebCore42CDMInstanceSessionFairPlayStreamingAVFObjC18didProvideRequestsEON3WTF6VectorINS1_9RetainPtrI19AVContentKeyRequestEELm0ENS1_15CrashOnOverflowELm16ENS1_10FastMallocEEE_block_invoke(uint64_t a1, CFTypeRef cf)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  CFTypeRef v6;
  void *v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef v12;
  _QWORD *v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  v10 = v2;
  v11 = v3;
  v12 = cf;
  if (cf)
    CFRetain(cf);
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v4 = off_1E31F7AF0;
  v4[1] = v10;
  v5 = v11;
  v10 = 0;
  v11 = 0;
  v4[2] = v5;
  v6 = v12;
  v12 = 0;
  v4[3] = v6;
  v13 = v4;
  WTF::callOnMainThread();
  v8 = v13;
  v13 = 0;
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
  return WebCore::CDMInstanceSessionFairPlayStreamingAVFObjC::didProvideRequests(WTF::Vector<WTF::RetainPtr<AVContentKeyRequest>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &&)::$_1::operator()(NSData *,NSError *)::{lambda(void)#1}::~NSError(&v10, v7);
}

@end
