@implementation ContextAwareThermalManager

- (int)getContextState:(int)a3
{
  CFIndex v5;
  void *ValueAtIndex;
  NSObject *v7;
  uint8_t v9[16];

  if (CFArrayGetCount(self->ctxObjects) < 1)
  {
LABEL_5:
    if (byte_1000A2480)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Cannot get ContextValue", v9, 2u);
      }
    }
    return -1;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->ctxObjects, v5);
      if (objc_msgSend(ValueAtIndex, "ctxType") == a3)
        return objc_msgSend(ValueAtIndex, "getContextState");
      if (CFArrayGetCount(self->ctxObjects) <= ++v5)
        goto LABEL_5;
    }
  }
}

- (BOOL)isContextTriggered:(int)a3
{
  CFIndex v5;
  void *ValueAtIndex;
  NSObject *v7;
  uint8_t v9[16];

  if (CFArrayGetCount(self->ctxObjects) < 1)
  {
LABEL_5:
    if (byte_1000A2480)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> No ContextTriggered Match", v9, 2u);
      }
    }
    return 0;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->ctxObjects, v5);
      if (objc_msgSend(ValueAtIndex, "ctxType") == a3)
        return objc_msgSend(ValueAtIndex, "isContextTriggered");
      if (CFArrayGetCount(self->ctxObjects) <= ++v5)
        goto LABEL_5;
    }
  }
}

- (void)iterateAndUpdateContexts
{
  CFIndex v3;

  if (CFArrayGetCount(self->ctxObjects) >= 1)
  {
    v3 = 0;
    do
      objc_msgSend((id)CFArrayGetValueAtIndex(self->ctxObjects, v3++), "synchContext");
    while (CFArrayGetCount(self->ctxObjects) > v3);
  }
}

+ (id)sharedInstance
{
  if (qword_1000A1D98 != -1)
    dispatch_once(&qword_1000A1D98, &stru_10007DD10);
  return (id)qword_1000A1DA0;
}

- (ContextAwareThermalManager)init
{
  ContextAwareThermalManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ContextAwareThermalManager;
  v2 = -[ContextAwareThermalManager init](&v4, "init");
  if (v2)
    v2->ctxObjects = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  return v2;
}

- (id)createNewSolarContext:(BOOL)a3
{
  __objc2_class **v5;
  id v6;
  NSObject *v7;

  v5 = &off_10007C580;
  if (!a3)
    v5 = off_10007C4C0;
  v6 = objc_alloc_init(*v5);
  if (v6)
  {
    CFArrayAppendValue(self->ctxObjects, v6);
    CFRelease(v6);
  }
  else
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005103C(a3, v7);
  }
  return v6;
}

- (id)createNewInPocketContext:(id)a3
{
  ContextInPocket *v4;
  NSObject *v5;

  v4 = -[ContextInPocket initWithParams:]([ContextInPocket alloc], "initWithParams:", a3);
  if (v4)
  {
    CFArrayAppendValue(self->ctxObjects, v4);
    CFRelease(v4);
  }
  else
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000510B4(v5);
  }
  return v4;
}

- (void)updateSystemPowerState:(BOOL)a3
{
  _BOOL8 v3;
  CFIndex v5;

  v3 = a3;
  if (CFArrayGetCount(self->ctxObjects) >= 1)
  {
    v5 = 0;
    do
      objc_msgSend((id)CFArrayGetValueAtIndex(self->ctxObjects, v5++), "updateSystemPowerState:", v3);
    while (CFArrayGetCount(self->ctxObjects) > v5);
  }
}

- (void)setInfoOnlySensorsActive:(BOOL)a3
{
  _BOOL8 v3;
  CFIndex v5;

  v3 = a3;
  if (CFArrayGetCount(self->ctxObjects) >= 1)
  {
    v5 = 0;
    do
      objc_msgSend((id)CFArrayGetValueAtIndex(self->ctxObjects, v5++), "setInfoOnlySensorsActive:", v3);
    while (CFArrayGetCount(self->ctxObjects) > v5);
  }
}

@end
