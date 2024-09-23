@implementation SL_AFPreferences

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global);
  return (id)sharedPreferences_sPreferences;
}

- (SL_AFPreferences)init
{
  SL_AFPreferences *v2;
  void *v3;
  id v4;
  uint64_t v5;
  AFPreferences *afPrefs;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)SL_AFPreferences;
  v2 = -[SL_AFPreferences init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getAFPreferencesClass_softClass;
    v13 = getAFPreferencesClass_softClass;
    if (!getAFPreferencesClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getAFPreferencesClass_block_invoke;
      v9[3] = &unk_251BAD050;
      v9[4] = &v10;
      __getAFPreferencesClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v4, "sharedPreferences");
    v5 = objc_claimAutoreleasedReturnValue();
    afPrefs = v2->_afPrefs;
    v2->_afPrefs = (AFPreferences *)v5;

  }
  return v2;
}

- (id)languageCode
{
  void *v2;
  void *v3;

  -[SL_AFPreferences afPrefs](self, "afPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AFPreferences)afPrefs
{
  return self->_afPrefs;
}

- (void)setAfPrefs:(id)a3
{
  objc_storeStrong((id *)&self->_afPrefs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afPrefs, 0);
}

@end
