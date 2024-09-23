@implementation MCKeybagUnlockAssertion

+ (id)assertionHoldQueue
{
  if (qword_1000FDA00 != -1)
    dispatch_once(&qword_1000FDA00, &stru_1000E4450);
  return (id)qword_1000FD9F8;
}

+ (void)holdAssertion
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "assertionHoldQueue"));
  dispatch_async(v2, &stru_1000E4470);

}

+ (void)releaseAssertion
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "assertionHoldQueue"));
  dispatch_sync(v2, &stru_1000E44A0);

}

- (MCKeybagUnlockAssertion)init
{
  MCKeybagUnlockAssertion *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCKeybagUnlockAssertion;
  v2 = -[MCKeybagUnlockAssertion init](&v4, "init");
  if (v2)
    +[MCKeybagUnlockAssertion holdAssertion](MCKeybagUnlockAssertion, "holdAssertion");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  +[MCKeybagUnlockAssertion releaseAssertion](MCKeybagUnlockAssertion, "releaseAssertion");
  v3.receiver = self;
  v3.super_class = (Class)MCKeybagUnlockAssertion;
  -[MCKeybagUnlockAssertion dealloc](&v3, "dealloc");
}

@end
