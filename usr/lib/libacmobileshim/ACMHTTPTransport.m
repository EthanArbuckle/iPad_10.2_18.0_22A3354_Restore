@implementation ACMHTTPTransport

- (void)updateBackgroundTask
{
  void *v3;
  BOOL v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD v7[5];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = -[ACFHTTPTransport hasFinishedServerInvocations](self, "hasFinishedServerInvocations");
  v5 = -[ACMHTTPTransport identifier](self, "identifier");
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
          ACFLog(6, (uint64_t)"-[ACMHTTPTransport updateBackgroundTask]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTransport.m", 43, 0, "Finishing background task");
      }
      objc_msgSend(v3, "endBackgroundTask:", -[ACMHTTPTransport identifier](self, "identifier"));
      -[ACMHTTPTransport setIdentifier:](self, "setIdentifier:", 0);
    }
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __40__ACMHTTPTransport_updateBackgroundTask__block_invoke;
    v7[3] = &unk_24FCE4FA8;
    v7[4] = self;
    -[ACMHTTPTransport setIdentifier:](self, "setIdentifier:", objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", v7));
    if (v6)
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACMHTTPTransport updateBackgroundTask]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTransport.m", 33, 0, "Relaunched background task");
      objc_msgSend(v3, "endBackgroundTask:", v6);
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMHTTPTransport updateBackgroundTask]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTransport.m", 38, 0, "Launched background task");
    }
  }
}

uint64_t __40__ACMHTTPTransport_updateBackgroundTask__block_invoke(uint64_t a1)
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACMHTTPTransport updateBackgroundTask]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTransport.m", 27, 0, "Handling background task expiration");
  return objc_msgSend(*(id *)(a1 + 32), "updateBackgroundTask");
}

- (void)didStart
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACMHTTPTransport;
  -[ACFHTTPTransport didStart](&v3, sel_didStart);
  -[ACMHTTPTransport updateBackgroundTask](self, "updateBackgroundTask");
}

- (void)didEnd
{
  objc_super v3;

  -[ACMHTTPTransport updateBackgroundTask](self, "updateBackgroundTask");
  v3.receiver = self;
  v3.super_class = (Class)ACMHTTPTransport;
  -[ACFHTTPTransport didEnd](&v3, sel_didEnd);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

@end
