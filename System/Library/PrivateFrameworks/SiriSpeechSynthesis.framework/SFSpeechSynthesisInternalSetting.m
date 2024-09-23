@implementation SFSpeechSynthesisInternalSetting

- (SFSpeechSynthesisInternalSetting)init
{
  SFSpeechSynthesisInternalSetting *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSpeechSynthesisInternalSetting;
  v2 = -[SFSpeechSynthesisInternalSetting init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.speech.speechsynthesis"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (NSString)ospreyEndpointURL
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("ospreyEndpointUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
  {
    v4 = v3;
  }
  else if (+[SFSpeechSynthesisUtils isInternalBuild](SFSpeechSynthesisUtils, "isInternalBuild"))
  {
    v4 = CFSTR("https://carry-dejavu.siri.apple.com");
  }
  else
  {
    v4 = CFSTR("https://dejavu.apple.com");
  }

  return (NSString *)v4;
}

- (id)ospreyEndpointURLByType:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) < 7 && ((0x5Fu >> v3) & 1) != 0)
  {
    v4 = off_24E246CF8[v3];
  }
  else
  {
    -[SFSpeechSynthesisInternalSetting ospreyEndpointURL](self, "ospreyEndpointURL");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSString)deviceId
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("deviceId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v5, CFSTR("deviceId"));
    -[NSUserDefaults synchronize](self->_defaults, "synchronize");
  }

  return (NSString *)v5;
}

- (BOOL)disableCaching
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("disableCaching"));
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1606 != -1)
    dispatch_once(&sharedInstance_onceToken_1606, &__block_literal_global_1607);
  return (id)sharedInstance___standardInstance;
}

void __50__SFSpeechSynthesisInternalSetting_sharedInstance__block_invoke()
{
  SFSpeechSynthesisInternalSetting *v0;
  void *v1;

  v0 = objc_alloc_init(SFSpeechSynthesisInternalSetting);
  v1 = (void *)sharedInstance___standardInstance;
  sharedInstance___standardInstance = (uint64_t)v0;

}

@end
