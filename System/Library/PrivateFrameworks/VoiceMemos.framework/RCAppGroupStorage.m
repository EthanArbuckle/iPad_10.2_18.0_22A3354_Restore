@implementation RCAppGroupStorage

+ (RCAppGroupStorage)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (RCAppGroupStorage *)(id)sharedInstance_sharedInstance;
}

void __35__RCAppGroupStorage_sharedInstance__block_invoke()
{
  RCAppGroupStorage *v0;
  void *v1;

  v0 = objc_alloc_init(RCAppGroupStorage);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (RCAppGroupStorage)init
{
  RCAppGroupStorage *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCAppGroupStorage;
  v2 = -[RCAppGroupStorage init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.VoiceMemos.shared"));
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (BOOL)transcriptionIsSupported
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("RCTranscriptionIsSupported"));
}

- (void)setTranscriptionIsSupported:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, CFSTR("RCTranscriptionIsSupported"));
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
