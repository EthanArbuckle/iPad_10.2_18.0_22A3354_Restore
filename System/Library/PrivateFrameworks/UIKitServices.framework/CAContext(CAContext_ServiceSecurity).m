@implementation CAContext(CAContext_ServiceSecurity)

- (void)_notifyIfChangedFromSecure:()CAContext_ServiceSecurity
{
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  id v8;

  objc_getAssociatedObject(a1, &_notifyIfChangedFromSecure___UIServiceContextIsInsecureKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  if (((v6 ^ a3) & 1) == 0)
  {
    if (a3)
    {
      objc_setAssociatedObject(a1, &_notifyIfChangedFromSecure___UIServiceContextIsInsecureKey, 0, 0);
      v7 = CFSTR("UISServiceContextDidBecomeSecureNotification");
    }
    else
    {
      objc_setAssociatedObject(a1, &_notifyIfChangedFromSecure___UIServiceContextIsInsecureKey, MEMORY[0x1E0C9AAB0], (void *)1);
      v7 = CFSTR("UISServiceContextDidBecomeInsecureNotification");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", v7, a1);

  }
}

@end
