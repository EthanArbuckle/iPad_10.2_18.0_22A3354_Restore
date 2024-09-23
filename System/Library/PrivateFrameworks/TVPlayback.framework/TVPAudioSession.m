@implementation TVPAudioSession

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__TVPAudioSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sSharedInstance;
}

void __33__TVPAudioSession_sharedInstance__block_invoke(uint64_t a1)
{
  os_log_t v2;
  void *v3;
  id v4;
  void *v5;

  v2 = os_log_create("com.apple.AppleTV.playback", "TVPAudioSession");
  v3 = (void *)sLogObject_6;
  sLogObject_6 = (uint64_t)v2;

  v4 = objc_alloc_init(*(Class *)(a1 + 32));
  v5 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v4;

}

- (TVPAudioSession)init
{
  TVPAudioSession *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVPAudioSession;
  v2 = -[TVPAudioSession init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__mediaServicesReset_, *MEMORY[0x24BDB1610], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVPAudioSession;
  -[TVPAudioSession dealloc](&v4, sel_dealloc);
}

- (void)setConfigurationBlock:(id)a3
{
  void *v4;
  id configurationBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  configurationBlock = self->_configurationBlock;
  self->_configurationBlock = v4;

  -[TVPAudioSession _updateIfNecessary](self, "_updateIfNecessary");
}

- (void)_mediaServicesReset:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Received AVAudioSessionMediaServicesWereResetNotification", v5, 2u);
  }
  -[TVPAudioSession _updateIfNecessary](self, "_updateIfNecessary");
}

- (void)_updateIfNecessary
{
  void (**configurationBlock)(id, id);
  id v3;

  configurationBlock = (void (**)(id, id))self->_configurationBlock;
  if (configurationBlock)
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    configurationBlock[2](configurationBlock, v3);

  }
}

- (id)configurationBlock
{
  return self->_configurationBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationBlock, 0);
}

@end
