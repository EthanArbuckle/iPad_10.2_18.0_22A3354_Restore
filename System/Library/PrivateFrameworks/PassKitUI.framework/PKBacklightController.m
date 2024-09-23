@implementation PKBacklightController

+ (id)sharedInstance
{
  if (_MergedGlobals_677 != -1)
    dispatch_once(&_MergedGlobals_677, &__block_literal_global_118);
  return (id)qword_1ED06C750;
}

void __39__PKBacklightController_sharedInstance__block_invoke()
{
  PKBacklightController *v0;
  void *v1;

  v0 = objc_alloc_init(PKBacklightController);
  v1 = (void *)qword_1ED06C750;
  qword_1ED06C750 = (uint64_t)v0;

}

- (PKBacklightController)init
{
  PKBacklightController *v2;
  BrightnessSystemClient *v3;
  BrightnessSystemClient *brightnessClient;
  uint64_t v5;
  NSHashTable *requesters;
  uint64_t v7;
  NSHashTable *allowers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKBacklightController;
  v2 = -[PKBacklightController init](&v10, sel_init);
  if (v2)
  {
    v3 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E0D15710]);
    brightnessClient = v2->_brightnessClient;
    v2->_brightnessClient = v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = objc_claimAutoreleasedReturnValue();
    requesters = v2->_requesters;
    v2->_requesters = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v7 = objc_claimAutoreleasedReturnValue();
    allowers = v2->_allowers;
    v2->_allowers = (NSHashTable *)v7;

  }
  return v2;
}

- (void)beginAllowingBacklightRamping:(id)a3
{
  NSObject *v4;
  NSHashTable *allowers;
  NSHashTable *requesters;
  int v7;
  NSHashTable *v8;
  __int16 v9;
  NSHashTable *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSHashTable addObject:](self->_allowers, "addObject:", a3);
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    requesters = self->_requesters;
    allowers = self->_allowers;
    v7 = 138412546;
    v8 = allowers;
    v9 = 2112;
    v10 = requesters;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Backlight ramping allowed: allowers = %@\nrequesters = %@", (uint8_t *)&v7, 0x16u);
  }

  -[PKBacklightController _changeBacklightMinimumEnabledIfNecessary](self, "_changeBacklightMinimumEnabledIfNecessary");
}

- (void)_changeBacklightMinimumEnabledIfNecessary
{
  NSUInteger v3;
  NSUInteger v4;
  double v5;
  BOOL v6;
  _BOOL8 v7;

  v3 = -[NSHashTable count](self->_allowers, "count");
  v4 = -[NSHashTable count](self->_requesters, "count");
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (!self->_isBacklightRamped == v7)
  {
    LODWORD(v5) = 1127299088;
    if (!v7)
      *(float *)&v5 = 0.0;
    -[PKBacklightController _updateBacklightNits:period:disableWhitePointShift:](self, "_updateBacklightNits:period:disableWhitePointShift:", v7, v5, 0.4);
    self->_isBacklightRamped = v7;
  }
}

- (void)endAllowingBacklightRamping:(id)a3
{
  NSUInteger v4;
  NSObject *v5;
  const __CFString *v6;
  NSHashTable *allowers;
  NSHashTable *requesters;
  int v9;
  const __CFString *v10;
  __int16 v11;
  NSHashTable *v12;
  __int16 v13;
  NSHashTable *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSHashTable removeObject:](self->_allowers, "removeObject:", a3);
  v4 = -[NSHashTable count](self->_allowers, "count");
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("allowed");
    requesters = self->_requesters;
    allowers = self->_allowers;
    if (!v4)
      v6 = CFSTR("disallowed");
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = allowers;
    v13 = 2112;
    v14 = requesters;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Backlight ramping %@: allowers = %@\nrequesters = %@", (uint8_t *)&v9, 0x20u);
  }

  -[PKBacklightController _changeBacklightMinimumEnabledIfNecessary](self, "_changeBacklightMinimumEnabledIfNecessary");
}

- (void)beginRequestingBacklightRamping:(id)a3
{
  NSObject *v4;
  NSHashTable *allowers;
  NSHashTable *requesters;
  int v7;
  NSHashTable *v8;
  __int16 v9;
  NSHashTable *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSHashTable addObject:](self->_requesters, "addObject:", a3);
  -[PKBacklightController _changeBacklightMinimumEnabledIfNecessary](self, "_changeBacklightMinimumEnabledIfNecessary");
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    requesters = self->_requesters;
    allowers = self->_allowers;
    v7 = 138412546;
    v8 = allowers;
    v9 = 2112;
    v10 = requesters;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Backlight ramping requested: allowers = %@\nrequesters = %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)endRequestingBacklightRamping:(id)a3
{
  NSObject *v4;
  NSHashTable *allowers;
  NSHashTable *requesters;
  int v7;
  NSHashTable *v8;
  __int16 v9;
  NSHashTable *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSHashTable removeObject:](self->_requesters, "removeObject:", a3);
  -[PKBacklightController _changeBacklightMinimumEnabledIfNecessary](self, "_changeBacklightMinimumEnabledIfNecessary");
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    requesters = self->_requesters;
    allowers = self->_allowers;
    v7 = 138412546;
    v8 = allowers;
    v9 = 2112;
    v10 = requesters;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Backlight ramping unrequested: allowers = %@\nrequesters = %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)_updateBacklightNits:(float)a3 period:(double)a4 disableWhitePointShift:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v5 = a5;
  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("nits");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("period");
  v21[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = CFSTR("DisableWPShift");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[BrightnessSystemClient setProperty:forKey:](self->_brightnessClient, "setProperty:forKey:", v10, CFSTR("MinNits"));
  -[BrightnessSystemClient setProperty:forKey:](self->_brightnessClient, "setProperty:forKey:", v12, CFSTR("CoreBrightnessFeaturesDisabled"));
  PKLogFacilityTypeGetObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Updating backlight settings: %@, disabled: %@", (uint8_t *)&v14, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowers, 0);
  objc_storeStrong((id *)&self->_requesters, 0);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

@end
