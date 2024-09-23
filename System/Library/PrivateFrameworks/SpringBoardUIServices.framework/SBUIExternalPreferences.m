@implementation SBUIExternalPreferences

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_44);
  return (id)sharedInstance___instance;
}

void __41__SBUIExternalPreferences_sharedInstance__block_invoke()
{
  SBUIExternalPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(SBUIExternalPreferences);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (SBUIExternalPreferences)init
{
  SBUIExternalPreferences *v2;
  uint64_t v3;
  NSUserDefaults *soundDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUIExternalPreferences;
  v2 = -[SBUIExternalPreferences init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.preferences.sounds"));
    soundDefaults = v2->_soundDefaults;
    v2->_soundDefaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (BOOL)keyboardPlaysSounds
{
  void *v3;
  void *v4;
  int v5;

  -[NSUserDefaults dictionaryRepresentation](self->_soundDefaults, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("keyboard"));

  return !v5 || -[NSUserDefaults BOOLForKey:](self->_soundDefaults, "BOOLForKey:", CFSTR("keyboard"));
}

- (void)setKeyboardPlaysSounds:(BOOL)a3
{
  self->_keyboardPlaysSounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundDefaults, 0);
}

@end
