@implementation SiriUIPreferences

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_6);
  return (id)sharedPreferences_sharedInstance;
}

void __38__SiriUIPreferences_sharedPreferences__block_invoke()
{
  SiriUIPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(SiriUIPreferences);
  v1 = (void *)sharedPreferences_sharedInstance;
  sharedPreferences_sharedInstance = (uint64_t)v0;

}

- (SiriUIPreferences)init
{
  SiriUIPreferences *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUIPreferences;
  v2 = -[SiriUIPreferences init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.carDND"));
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (id)previousSiriRequestErrorTimestamp
{
  NSDate *previousSiriRequestErrorTimestamp;
  NSDate *v4;
  NSDate *v5;

  previousSiriRequestErrorTimestamp = self->_previousSiriRequestErrorTimestamp;
  if (!previousSiriRequestErrorTimestamp)
  {
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("previousSiriRequestErrorTimestamp"));
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_previousSiriRequestErrorTimestamp;
    self->_previousSiriRequestErrorTimestamp = v4;

    previousSiriRequestErrorTimestamp = self->_previousSiriRequestErrorTimestamp;
  }
  return previousSiriRequestErrorTimestamp;
}

- (void)setPreviousSiriRequestErrorTimestamp:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_previousSiriRequestErrorTimestamp, a3);
  v5 = a3;
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v5, CFSTR("previousSiriRequestErrorTimestamp"));

}

- (int64_t)siriRequestErrorCount
{
  int64_t result;

  result = self->_siriRequestErrorCount;
  if (!result)
  {
    result = -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("siriRequestErrorCount"));
    self->_siriRequestErrorCount = result;
  }
  return result;
}

- (void)setSiriRequestErrorCount:(int64_t)a3
{
  self->_siriRequestErrorCount = a3;
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:");
}

- (BOOL)voiceRequestMadeWhileInCarDND
{
  BOOL result;

  if (self->_voiceRequestMadeWhileInCarDND)
    return 1;
  result = -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("voiceRequestMadeWhileInCarDND"));
  self->_voiceRequestMadeWhileInCarDND = result;
  return result;
}

- (void)setVoiceRequestMadeWhileInCarDND:(BOOL)a3
{
  self->_voiceRequestMadeWhileInCarDND = a3;
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:");
}

- (int64_t)numberOfTimesCarDNDSiriCardShown
{
  int64_t result;

  result = self->_numberOfTimesSiriCardShown;
  if (!result)
  {
    result = -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("carDNDNumberOfTimesCardShown"));
    self->_numberOfTimesSiriCardShown = result;
  }
  return result;
}

- (void)setNumberOfTimesCarDNDSiriCardShown:(int64_t)a3
{
  self->_numberOfTimesSiriCardShown = a3;
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:");
}

- (int64_t)integerForKey:(id)a3
{
  return -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", a3);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:", a3, a4);
}

- (BOOL)BOOLForKey:(id)a3
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", a3);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, a4);
}

- (id)objectForKey:(id)a3
{
  return -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSiriRequestErrorTimestamp, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
