@implementation ACMAppleConnectImpl

- (ACMAppleConnectImpl)init
{
  ACMAppleConnectImpl *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACMAppleConnectImpl;
  v2 = -[ACMAppleConnectImpl init](&v7, sel_init);
  if (v2)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACMAppleConnectImpl init]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 37, 0, "Creating instance...");
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Out of Memory"));
    v2->_memoryError = (NSError *)(id)objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(v4, "dictionaryWithObject:forKey:", v5, *MEMORY[0x24BDD0FC8]));
    -[ACMAppleConnectImpl updateLogLevel](v2, "updateLogLevel");
    -[ACMAppleConnectImplComponents setUIControllerDelegate:](-[ACMAppleConnectImpl components](v2, "components"), "setUIControllerDelegate:", v2);
  }
  return v2;
}

- (ACMAppleConnectImplComponents)components
{
  return (ACMAppleConnectImplComponents *)+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components");
}

- (BOOL)shouldReleaseOnMemoryWarning
{
  NSMutableSet *handlers;
  BOOL v4;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACMAppleConnectImpl shouldReleaseOnMemoryWarning]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 53, 0, "Memory Warning is received, cleaning up... ");
  objc_sync_enter(self);
  -[ACMAppleConnectImplComponents cleanupOnMemoryWarning](-[ACMAppleConnectImpl components](self, "components"), "cleanupOnMemoryWarning");
  handlers = self->_handlers;
  if (handlers)
    v4 = -[NSMutableSet count](handlers, "count") == 0;
  else
    v4 = 1;
  objc_sync_exit(self);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_memoryError = 0;
  -[ACMAppleConnectImplComponents setUIControllerDelegate:](-[ACMAppleConnectImpl components](self, "components"), "setUIControllerDelegate:", 0);
  -[ACMAppleConnectImpl unscheduleAllHandlers](self, "unscheduleAllHandlers");
  v3.receiver = self;
  v3.super_class = (Class)ACMAppleConnectImpl;
  -[ACMAppleConnectImpl dealloc](&v3, sel_dealloc);
}

- (id)memoryError
{
  return self->_memoryError;
}

- (unint64_t)signInDialogContentStyle
{
  return 0;
}

- (UIView)managerApprovalDialogSummaryView
{
  return 0;
}

- (NSMutableSet)handlers
{
  NSMutableSet *handlers;

  objc_sync_enter(self);
  handlers = self->_handlers;
  if (!handlers)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACMAppleConnectImpl handlers]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 102, 0, "Creating HTTP handlers pool");
    handlers = (NSMutableSet *)objc_opt_new();
    self->_handlers = handlers;
  }
  objc_sync_exit(self);
  return handlers;
}

- (void)scheduleHandler:(id)a3 withCompletionBlock:(id)a4
{
  _QWORD v7[6];

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMAppleConnectImpl scheduleHandler:withCompletionBlock:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 112, 0, "Scheduling HTTP handler %p for url %@", a3, objc_msgSend((id)objc_msgSend(a3, "transport"), "requestURLTemplate"));
  objc_sync_enter(self);
  if (a3)
  {
    if (!-[NSMutableSet count](-[ACMAppleConnectImpl handlers](self, "handlers"), "count"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "setNetworkActivityIndicatorVisible:", 1);
    -[NSMutableSet addObject:](-[ACMAppleConnectImpl handlers](self, "handlers"), "addObject:", a3);
    objc_msgSend(a3, "performRequestWithCompletionBlock:", a4);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__ACMAppleConnectImpl_scheduleHandler_withCompletionBlock___block_invoke;
    v7[3] = &unk_24FCE5100;
    v7[4] = self;
    v7[5] = a3;
    objc_msgSend(a3, "setFinalizeBlock:", v7);
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
  {
    ACFLog(3, (uint64_t)"-[ACMAppleConnectImpl scheduleHandler:withCompletionBlock:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 130, 0, "Trying to schedule nil handler");
  }
  objc_sync_exit(self);
}

uint64_t __59__ACMAppleConnectImpl_scheduleHandler_withCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unscheduleHandler:", *(_QWORD *)(a1 + 40));
}

- (void)unscheduleHandler:(id)a3
{
  objc_sync_enter(self);
  if (-[NSMutableSet containsObject:](-[ACMAppleConnectImpl handlers](self, "handlers"), "containsObject:", a3))
  {
    -[NSMutableSet removeObject:](-[ACMAppleConnectImpl handlers](self, "handlers"), "removeObject:", a3);
    objc_msgSend(a3, "setFinalizeBlock:", 0);
    if (!-[NSMutableSet count](-[ACMAppleConnectImpl handlers](self, "handlers"), "count"))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "setNetworkActivityIndicatorVisible:", 0);

      self->_handlers = 0;
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
  {
    ACFLog(6, (uint64_t)"-[ACMAppleConnectImpl unscheduleHandler:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 152, 0, "HTTP handler %p is not found, probably it was already removed", a3);
  }
  objc_sync_exit(self);
}

- (void)unscheduleAllHandlers
{
  ACMAppleConnectImpl *v2;
  NSMutableSet *handlers;

  v2 = self;
  while (-[NSMutableSet count](-[ACMAppleConnectImpl handlers](self, "handlers"), "count"))
  {
    -[ACMAppleConnectImpl unscheduleHandler:](v2, "unscheduleHandler:", -[NSMutableSet anyObject](-[ACMAppleConnectImpl handlers](v2, "handlers"), "anyObject"));
    self = v2;
  }
  handlers = v2->_handlers;
  if (handlers)
  {

    v2->_handlers = 0;
  }
}

- (void)authenticate:(id)a3
{
  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0)
    ACFProfileStart((uint64_t)"-[ACMAppleConnectImpl authenticate:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 174, 0, 0);
  -[ACMAppleConnectImpl performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_authenticateRunningOnMainThreadWithRequest_, a3, 1);
  if (ACFProfileEnd)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x100) != 0)
      ACFProfileEnd((uint64_t)"-[ACMAppleConnectImpl authenticate:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 178, 0, 0);
  }
}

- (void)changeUserPasswordWithRequest:(id)a3 isGesture:(BOOL)a4
{
  _BOOL4 v4;
  char **v7;

  v4 = a4;
  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0)
    ACFProfileStart((uint64_t)"-[ACMAppleConnectImpl changeUserPasswordWithRequest:isGesture:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 201, 0, 0);
  v7 = &selRef_changeGestureRunningOnMainThreadWithRequest_;
  if (!v4)
    v7 = &selRef_changePasswordRunningOnMainThreadWithRequest_;
  -[ACMAppleConnectImpl performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", *v7, a3, 1);
  if (ACFProfileEnd)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x100) != 0)
      ACFProfileEnd((uint64_t)"-[ACMAppleConnectImpl changeUserPasswordWithRequest:isGesture:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 206, 0, 0);
  }
}

- (void)updateLogLevel
{
  ACFLogSettingsSetLevel(-[ACMAppleConnectImpl logLevel](self, "logLevel"));
}

- (int64_t)logLevel
{
  return -[ACMAppleConnectPreferences logLevel](-[ACMAppleConnectImplComponents preferences](-[ACMAppleConnectImpl components](self, "components"), "preferences"), "logLevel");
}

- (void)setLogLevel:(int64_t)a3
{
  -[ACMAppleConnectPreferences setLogLevel:](-[ACMAppleConnectImplComponents preferences](-[ACMAppleConnectImpl components](self, "components"), "preferences"), "setLogLevel:", a3);
}

- (void)uiControllerOnLogOut:(id)a3
{
  -[ACMAppleConnectImpl logoutUser:inRealm:](self, "logoutUser:inRealm:", 0, 0);
}

@end
