@implementation WCM_IOKitWrapper

- (WCM_IOKitWrapper)init
{
  WCM_IOKitWrapper *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WCM_IOKitWrapper;
  v2 = -[WCM_IOKitWrapper init](&v8, "init");
  v7 = 0uLL;
  sub_100020AA4((uint64_t)&v2->mIOKitNotifier, &v7);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
  if (*((_QWORD *)&v7 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v2->mPlatformId = 0;
  return v2;
}

- (WCM_IOKitWrapper)initWithPlatformId:(unint64_t)a3
{
  WCM_IOKitWrapper *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WCM_IOKitWrapper;
  v4 = -[WCM_IOKitWrapper init](&v10, "init");
  v9 = 0uLL;
  sub_100020AA4((uint64_t)&v4->mIOKitNotifier, &v9);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v4->mPlatformId = a3;
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WCM_IOKitWrapper;
  -[WCM_IOKitWrapper dealloc](&v2, "dealloc");
}

- (BOOL)isFaceIdSupported
{
  return self->mPlatformId - 50 < 8;
}

- (BOOL)isFrontCameraSupported
{
  return 0;
}

- (BOOL)isBackTeleCameraSupported
{
  return self->mPlatformId == 52;
}

- (BOOL)isBackSuperWideCameraSupported
{
  return 0;
}

- (BOOL)isPencilIndicationSupported
{
  return 0;
}

- (void)registerIOkitStateEvent
{
  uint64_t *p_mIOKitNotifier;
  WCM_IOKitEventNotifier *ptr;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  __int128 v10;

  p_mIOKitNotifier = (uint64_t *)&self->mIOKitNotifier;
  ptr = self->mIOKitNotifier.__ptr_;
  if (ptr)
    goto LABEL_8;
  sub_100044DE0(&v10);
  sub_100020AA4((uint64_t)p_mIOKitNotifier, &v10);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  ptr = (WCM_IOKitEventNotifier *)*p_mIOKitNotifier;
  if (*p_mIOKitNotifier)
  {
LABEL_8:
    sub_100044E1C((uint64_t)ptr, -[WCM_IOKitWrapper isFaceIdSupported](self, "isFaceIdSupported"));
    sub_100044E24((uint64_t)self->mIOKitNotifier.__ptr_, -[WCM_IOKitWrapper isFrontCameraSupported](self, "isFrontCameraSupported"));
    sub_100044E2C((uint64_t)self->mIOKitNotifier.__ptr_, -[WCM_IOKitWrapper isBackTeleCameraSupported](self, "isBackTeleCameraSupported"));
    sub_100044E34((uint64_t)self->mIOKitNotifier.__ptr_, -[WCM_IOKitWrapper isBackSuperWideCameraSupported](self, "isBackSuperWideCameraSupported"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("IOKit state registration: register WCM_IOKitEventNotifier callback result: 0x%x"), sub_10004531C((uint64_t)self->mIOKitNotifier.__ptr_));
    if (-[WCM_IOKitWrapper isPencilIndicationSupported](self, "isPencilIndicationSupported"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("YYDebug_ Pencil Coex is supported 3"));
      sub_100044E3C(*p_mIOKitNotifier, 1);
      sub_100045074(*p_mIOKitNotifier);
    }
    else
    {
      sub_100044E3C(*p_mIOKitNotifier, 0);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("YYDebug_ Pencil Coex is not supported"));
    }
    v9 = sub_100045D98((_QWORD *)*p_mIOKitNotifier);
    v8 = CFSTR("IOKit state registration: Start WCM_IOKitEventNotifier result: 0x%x");
  }
  else
  {
    v8 = CFSTR("IOKit State registration: Failed to create WCM_IOKitEventNotifier object");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v8, v9);
}

- (void).cxx_destruct
{
  sub_10002C2C4((uint64_t)&self->mIOKitNotifier);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
