@implementation TSUSharedLocale

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSUSharedLocale;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedLocale
{
  id result;
  uint64_t v4;
  id v5;
  uint64_t v6;

  result = (id)sharedLocale_sSingletonInstance;
  if (!sharedLocale_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedLocale_sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedLocale_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUSharedLocale sharedLocale]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocale.m"), 38, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)sharedLocale_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUSharedLocale allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocale.m"), 38, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSUSharedLocale)init
{
  TSUSharedLocale *v2;
  CFLocaleRef v3;
  uint64_t v4;
  NSArray *v5;
  NSArray *v6;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSUSharedLocale;
  v2 = -[TSUSharedLocale init](&v9, sel_init);
  if (v2)
  {
    v3 = CFLocaleCopyCurrent();
    v4 = MEMORY[0x24BDAC760];
    v2->mCurrentLocale = v3;
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __23__TSUSharedLocale_init__block_invoke;
    v8[3] = &unk_24D61ACC0;
    v8[4] = v2;
    v5 = (NSArray *)TSURegisterLocaleChangeObserver((uint64_t)v8);
    v2->mObserverObjects = v5;
    v6 = v5;
  }
  return v2;
}

uint64_t __23__TSUSharedLocale_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "datePreferencesChanged:", a2);
}

- (void)dealloc
{
  __CFLocale *mCurrentLocale;
  objc_super v4;

  mCurrentLocale = self->mCurrentLocale;
  if (mCurrentLocale)
    CFRelease(mCurrentLocale);

  v4.receiver = self;
  v4.super_class = (Class)TSUSharedLocale;
  -[TSUSharedLocale dealloc](&v4, sel_dealloc);
}

- (__CFLocale)currentLocale
{
  __CFLocale *result;
  NSArray *v4;
  NSArray *v5;
  _QWORD v6[5];

  result = self->mCurrentLocale;
  if (!result)
  {
    result = CFLocaleCopyCurrent();
    self->mCurrentLocale = result;
  }
  if (!self->mObserverObjects)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __32__TSUSharedLocale_currentLocale__block_invoke;
    v6[3] = &unk_24D61ACC0;
    v6[4] = self;
    v4 = (NSArray *)TSURegisterLocaleChangeObserver((uint64_t)v6);
    self->mObserverObjects = v4;
    v5 = v4;
    return self->mCurrentLocale;
  }
  return result;
}

uint64_t __32__TSUSharedLocale_currentLocale__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "datePreferencesChanged:", a2);
}

- (void)datePreferencesChanged:(id)a3
{
  TSUSharedLocale *v3;
  __CFLocale *mCurrentLocale;
  NSArray *mObserverObjects;
  TSUSharedLocale *v6;

  v3 = self;
  mCurrentLocale = self->mCurrentLocale;
  v3->mCurrentLocale = 0;
  __dmb(0xBu);
  v6 = v3;
  if (mCurrentLocale)
  {
    CFRelease(mCurrentLocale);
    v3 = v6;
  }
  mObserverObjects = v3->mObserverObjects;
  if (mObserverObjects)
  {
    TSURemoveLocaleChangeObserver(mObserverObjects);

    v3 = v6;
    v6->mObserverObjects = 0;
  }

}

@end
