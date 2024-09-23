@implementation APOdmlDefaults

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B69DAECC;
  block[3] = &unk_1E6A291E0;
  block[4] = a1;
  if (qword_1ED532F50 != -1)
    dispatch_once(&qword_1ED532F50, block);
  return (id)qword_1ED532F38;
}

- (APOdmlDefaults)init
{
  APOdmlDefaults *v2;
  uint64_t v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *factoryDefaults;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)APOdmlDefaults;
  v2 = -[APOdmlDefaults init](&v13, sel_init);
  if (v2)
  {
    v3 = CPCopySharedResourcesPreferencesDomainForDomain();
    v2->_defaultsBundleID = (__CFString *)v3;
    if (!v3)
      APOdmlSimulateCrash(5, CFSTR("Unable to initialize the defaults domain bundle identifier."), 0);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    factoryDefaults = v2->_factoryDefaults;
    v2->_factoryDefaults = v4;

    if (MGGetBoolAnswer())
    {
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v6, (uint64_t)&stru_1E6A29F10, CFSTR("ODMLpTTROverride"));
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v7, (uint64_t)&stru_1E6A29F10, CFSTR("ODMLAppVectorVersionOverride"));
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v8, (uint64_t)&stru_1E6A29F10, CFSTR("ODMLAppVectorVectorOverride"));
      v9 = MEMORY[0x1E0C9AAA0];
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v10, MEMORY[0x1E0C9AAA0], CFSTR("ODMLEnableOverrides"));
      objc_msgSend_setObject_forKeyedSubscript_(v2->_factoryDefaults, v11, v9, CFSTR("VerboseLogging"));
    }
  }
  return v2;
}

+ (id)_defaultValueForKey:(id)a3 valueClass:(Class)a4
{
  __CFString *v4;
  const char *v5;
  uint64_t v6;
  CFStringRef *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void **v11;
  const char *v12;

  v4 = (__CFString *)a3;
  objc_msgSend_sharedInstance(APOdmlDefaults, v5, v6);
  v7 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)CFPreferencesCopyAppValue(v4, v7[2]);

  if (!v8)
  {
    objc_msgSend_sharedInstance(APOdmlDefaults, v9, v10);
    v11 = (void **)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11[1], v12, (uint64_t)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }

  return v8;
}

+ (void)_setDefaultValue:(id)a3 forKey:(id)a4
{
  __CFString *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  CFStringRef *v9;
  const char *v10;
  uint64_t v11;
  CFStringRef *v12;

  v5 = (__CFString *)a4;
  v6 = a3;
  objc_msgSend_sharedInstance(APOdmlDefaults, v7, v8);
  v9 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v5, v6, v9[2]);

  objc_msgSend_sharedInstance(APOdmlDefaults, v10, v11);
  v12 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(v12[2]);

}

+ (BOOL)BOOLForKey:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend_BOOLValue(v7, v8, v9);
  return v10;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  const char *v8;
  const char *v9;
  id v10;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend_numberWithBool_(v6, v8, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setDefaultValue_forKey_(a1, v9, (uint64_t)v10, v7);

}

+ (int64_t)integerForKey:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int64_t v10;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend_integerValue(v7, v8, v9);
  return v10;
}

+ (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  const char *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend_numberWithInteger_(v6, v8, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setDefaultValue_forKey_(a1, v9, (uint64_t)v10, v7);

}

+ (double)doubleForKey:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_doubleValue(v7, v8, v9);
  v11 = v10;

  return v11;
}

+ (void)setDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend_numberWithDouble_(v6, v8, v9, a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setDefaultValue_forKey_(a1, v10, (uint64_t)v11, v7);

}

+ (id)stringForKey:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)arrayForKey:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend__defaultValueForKey_valueClass_(a1, v6, (uint64_t)v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableDictionary)factoryDefaults
{
  return self->_factoryDefaults;
}

- (void)setFactoryDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_factoryDefaults, a3);
}

- (__CFString)defaultsBundleID
{
  return self->_defaultsBundleID;
}

- (void)setDefaultsBundleID:(__CFString *)a3
{
  self->_defaultsBundleID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoryDefaults, 0);
}

@end
