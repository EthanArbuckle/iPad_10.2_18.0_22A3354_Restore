@implementation SUScriptSubscriptionStatusCoordinator

- (id)_className
{
  return CFSTR("iTunesSubscriptionStatusCoordinator");
}

- (void)invalidateLastKnownStatus
{
  uint64_t v2;

  v2 = -[objc_class autoupdatingActiveAccount](getICUserIdentityClass(), "autoupdatingActiveAccount");
  objc_msgSend((id)-[objc_class sharedMonitorForIdentity:](getICMusicSubscriptionStatusMonitorClass(), "sharedMonitorForIdentity:", v2), "refreshSubscriptionStatus");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_1, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusCoordinator;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusCoordinator;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptSubscriptionStatusCoordinator;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_1, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping = (uint64_t)sel_invalidateLastKnownStatus;
    unk_2551854E0 = CFSTR("invalidateLastKnownStatus");
    __KeyMapping_1 = (uint64_t)MEMORY[0x24BDBD1B8];
  }
}

@end
