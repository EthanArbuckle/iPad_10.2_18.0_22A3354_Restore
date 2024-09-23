@implementation SUScriptCarrierBundlingController

- (id)_className
{
  return CFSTR("iTunesCarrierBundling");
}

- (NSString)provisioningStyleAlways
{
  return (NSString *)CFSTR("always");
}

- (NSString)provisioningStyleNever
{
  return (NSString *)CFSTR("never");
}

- (NSString)provisioningStyleOnce
{
  return (NSString *)CFSTR("once");
}

- (NSString)statusEligible
{
  return (NSString *)CFSTR("eligible");
}

- (NSString)statusNeedsManualVerification
{
  return (NSString *)CFSTR("needsManualVerification");
}

- (NSString)statusNotEligible
{
  return (NSString *)CFSTR("notEligible");
}

- (NSString)statusUnknown
{
  return (NSString *)CFSTR("unknown");
}

- (NSString)statusUnlinked
{
  return (NSString *)CFSTR("unlinked");
}

- (void)updateLastKnownStatus:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_23, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCarrierBundlingController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_18, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCarrierBundlingController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptCarrierBundlingController;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_23, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_18 = (uint64_t)sel_updateLastKnownStatus_;
    *(_QWORD *)algn_255186448 = CFSTR("updateLastKnownStatus");
    __KeyMapping_23 = &unk_24DEDC658;
  }
}

@end
