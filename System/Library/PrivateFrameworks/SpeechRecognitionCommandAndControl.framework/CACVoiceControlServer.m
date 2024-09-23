@implementation CACVoiceControlServer

+ (id)server
{
  if (server_onceToken != -1)
    dispatch_once(&server_onceToken, &__block_literal_global_9);
  return (id)server___sharedInstance;
}

void __31__CACVoiceControlServer_server__block_invoke()
{
  CACVoiceControlServer *v0;
  void *v1;

  v0 = objc_alloc_init(CACVoiceControlServer);
  v1 = (void *)server___sharedInstance;
  server___sharedInstance = (uint64_t)v0;

}

- (BOOL)_connectIfNecessary
{
  int v3;
  objc_super v5;

  if (_AXSCommandAndControlEnabled() || (v3 = _AXSCommandAndControlCarPlayEnabled()) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)CACVoiceControlServer;
    LOBYTE(v3) = -[AXServer _connectIfNecessary](&v5, sel__connectIfNecessary);
  }
  return v3;
}

- (id)currentlyDisplayedCorrections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[CACVoiceControlServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", +[CACVoiceControlServer _currentDisplayedCorrectionsCommand](CACVoiceControlServer, "_currentDisplayedCorrectionsCommand"), 0);
    -[AXServer client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendMessage:withError:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("result"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v7;
}

- (id)currentlyDisplayedOverlayLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[CACVoiceControlServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", +[CACVoiceControlServer _currentlyDisplayedOverlayLabelsCommand](CACVoiceControlServer, "_currentlyDisplayedOverlayLabelsCommand"), 0);
    -[AXServer client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendMessage:withError:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("result"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v7;
}

+ (id)_serviceName
{
  return CFSTR("com.apple.accessibility.CACVoiceControlServer");
}

- (id)_serviceName
{
  return +[CACVoiceControlServer _serviceName](CACVoiceControlServer, "_serviceName");
}

+ (int)_currentDisplayedCorrectionsCommand
{
  return 1;
}

+ (int)_currentlyDisplayedOverlayLabelsCommand
{
  return 2;
}

@end
