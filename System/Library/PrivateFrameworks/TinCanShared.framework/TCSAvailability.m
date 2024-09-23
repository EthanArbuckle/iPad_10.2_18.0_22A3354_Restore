@implementation TCSAvailability

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  return (id)sharedInstance_sSharedAvailability;
}

void __33__TCSAvailability_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sSharedAvailability;
  sharedInstance_sSharedAvailability = v0;

}

- (TCSAvailability)init
{
  TCSAvailability *v2;
  uint64_t v3;
  NSUserDefaults *tinCanDefaults;
  uint64_t v5;
  NPSManager *npsManager;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TCSAvailability;
  v2 = -[TCSAvailability init](&v10, sel_init);
  if (v2)
  {
    +[TCSTinCanUserDefaults defaults](TCSTinCanUserDefaults, "defaults");
    v3 = objc_claimAutoreleasedReturnValue();
    tinCanDefaults = v2->_tinCanDefaults;
    v2->_tinCanDefaults = (NSUserDefaults *)v3;

    v5 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v5;

    if (!+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot](TCSBehavior, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[TCSBehavior sharedBehavior](TCSBehavior, "sharedBehavior");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleDeviceFirstUnlock, CFSTR("TCSFirstUnlockNotification"), v8);

    }
    v2->_shouldShowStatusIndicator = -[TCSAvailability _calculateShouldShowStatusIndicator](v2, "_calculateShouldShowStatusIndicator");
    -[TCSAvailability setShouldObserveUnavailabilityDefaultChanges:](v2, "setShouldObserveUnavailabilityDefaultChanges:", 1);
    -[TCSAvailability setShouldObserveFriendListDefaultChanges:](v2, "setShouldObserveFriendListDefaultChanges:", 1);
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

  -[TCSAvailability setShouldObserveUnavailabilityDefaultChanges:](self, "setShouldObserveUnavailabilityDefaultChanges:", 0);
  -[TCSAvailability setShouldObserveFriendListDefaultChanges:](self, "setShouldObserveFriendListDefaultChanges:", 0);
  v4.receiver = self;
  v4.super_class = (Class)TCSAvailability;
  -[TCSAvailability dealloc](&v4, sel_dealloc);
}

- (void)setShouldObserveFriendListDefaultChanges:(BOOL)a3
{
  _BOOL4 v3;
  NSUserDefaults *tinCanDefaults;
  uint64_t v6;
  id v7;

  if (self->_shouldObserveFriendListDefaultChanges != a3)
  {
    v3 = a3;
    self->_shouldObserveFriendListDefaultChanges = a3;
    tinCanDefaults = self->_tinCanDefaults;
    +[TCSTinCanUserDefaults allowListKey](TCSTinCanUserDefaults, "allowListKey");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v6;
    if (v3)
      -[NSUserDefaults addObserver:forKeyPath:options:context:](tinCanDefaults, "addObserver:forKeyPath:options:context:", self, v6, 1, TCSFriendListObservationContext);
    else
      -[NSUserDefaults removeObserver:forKeyPath:context:](tinCanDefaults, "removeObserver:forKeyPath:context:", self, v6, TCSFriendListObservationContext);

  }
}

- (void)setShouldObserveUnavailabilityDefaultChanges:(BOOL)a3
{
  NSUserDefaults *tinCanDefaults;

  if (self->_shouldObserveUnavailabilityDefaultChanges != a3)
  {
    self->_shouldObserveUnavailabilityDefaultChanges = a3;
    tinCanDefaults = self->_tinCanDefaults;
    if (a3)
      -[NSUserDefaults addObserver:forKeyPath:options:context:](tinCanDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("Unavailable"), 1, TCSAvailabilityObservationContext);
    else
      -[NSUserDefaults removeObserver:forKeyPath:context:](tinCanDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("Unavailable"), TCSAvailabilityObservationContext);
  }
}

- (void)setShouldShowStatusIndicator:(BOOL)a3
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_shouldShowStatusIndicator != a3)
  {
    self->_shouldShowStatusIndicator = a3;
    _TCSInitializeLogging();
    v4 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldShowStatusIndicator)
        v5 = &stru_24CFC2D40;
      else
        v5 = CFSTR("not ");
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_21342E000, v4, OS_LOG_TYPE_DEFAULT, "Walkie-Talkie status indicator should %@be shown.", (uint8_t *)&v6, 0xCu);
    }
    -[TCSAvailability _postNotificationName:](self, "_postNotificationName:", CFSTR("TCSStatusIndicatorStateDidChangeNotification"));
  }
}

+ (BOOL)isUserAvailable
{
  void *v2;
  char v3;

  +[TCSAvailability sharedInstance](TCSAvailability, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isUserUnavailable") ^ 1;

  return v3;
}

+ (void)setUserAvailable:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  +[TCSAvailability sharedInstance](TCSAvailability, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setUserUnavailable:", !v3);

}

+ (BOOL)shouldShowWalkieTalkieStatusIndicator
{
  void *v2;
  char v3;

  +[TCSAvailability sharedInstance](TCSAvailability, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowStatusIndicator");

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v14;
  _QWORD v15[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)TCSAvailabilityObservationContext == a6 || TCSFriendListObservationContext == (_QWORD)a6)
  {
    if ((void *)TCSAvailabilityObservationContext == a6)
      -[TCSAvailability _postNotificationName:](self, "_postNotificationName:", CFSTR("TCSAvailabilityDidChangeNotification"));
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __66__TCSAvailability_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v15[3] = &unk_24CFC2498;
    v15[4] = self;
    TCSGuaranteeMainThread(v15);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TCSAvailability;
    -[TCSAvailability observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __66__TCSAvailability_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowStatusIndicator:", objc_msgSend(*(id *)(a1 + 32), "_calculateShouldShowStatusIndicator"));
}

- (BOOL)_isUserUnavailable
{
  return !+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot](TCSBehavior, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot")|| -[NSUserDefaults BOOLForKey:](self->_tinCanDefaults, "BOOLForKey:", CFSTR("Unavailable"));
}

- (void)_setUserUnavailable:(BOOL)a3
{
  _BOOL8 v3;
  NSUserDefaults *tinCanDefaults;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NPSManager *npsManager;
  void *v11;
  _BOOL8 v12;
  int v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot](TCSBehavior, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot"))
  {
    if (-[TCSAvailability _isUserUnavailable](self, "_isUserUnavailable") != v3)
    {
      -[TCSAvailability setShouldObserveUnavailabilityDefaultChanges:](self, "setShouldObserveUnavailabilityDefaultChanges:", 0);
      tinCanDefaults = self->_tinCanDefaults;
      if (v3)
        -[NSUserDefaults setBool:forKey:](tinCanDefaults, "setBool:forKey:", 1, CFSTR("Unavailable"));
      else
        -[NSUserDefaults removeObjectForKey:](tinCanDefaults, "removeObjectForKey:", CFSTR("Unavailable"));
      -[TCSAvailability setShouldObserveUnavailabilityDefaultChanges:](self, "setShouldObserveUnavailabilityDefaultChanges:", 1);
      _TCSInitializeLogging();
      v7 = (void *)TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        -[TCSAvailability _unavailabilityText:](self, "_unavailabilityText:", v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_21342E000, v8, OS_LOG_TYPE_DEFAULT, "User has become %@ for Walkie-Talkie communication.", (uint8_t *)&v13, 0xCu);

      }
      -[TCSAvailability _postNotificationName:](self, "_postNotificationName:", CFSTR("TCSAvailabilityDidChangeNotification"));
      if (NPSHasCompletedInitialSync())
      {
        npsManager = self->_npsManager;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("Unavailable"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPSManager synchronizeUserDefaultsDomain:keys:](npsManager, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.tincan"), v11);

      }
      v12 = !v3 && -[TCSAvailability _calculateShouldShowStatusIndicator](self, "_calculateShouldShowStatusIndicator");
      -[TCSAvailability setShouldShowStatusIndicator:](self, "setShouldShowStatusIndicator:", v12);
    }
  }
  else
  {
    _TCSInitializeLogging();
    v6 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSAvailability _setUserUnavailable:].cold.1(v6);
  }
}

- (BOOL)_calculateShouldShowStatusIndicator
{
  _BOOL4 v3;
  NSUserDefaults *tinCanDefaults;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;

  if (!+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot](TCSBehavior, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot"))return 0;
  v3 = -[TCSAvailability _hasConnectivity](self, "_hasConnectivity");
  tinCanDefaults = self->_tinCanDefaults;
  +[TCSTinCanUserDefaults allowListKey](TCSTinCanUserDefaults, "allowListKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults dictionaryForKey:](tinCanDefaults, "dictionaryForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;

  +[TCSContacts validatedAllowlistFromDictionary:](TCSContacts, "validatedAllowlistFromDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[TCSContacts _destinationsFromAllowlistDictionary:onlyAccepted:](TCSContacts, "_destinationsFromAllowlistDictionary:onlyAccepted:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = (v13 != 0) & ~-[TCSAvailability _isUserUnavailable](self, "_isUserUnavailable");
  if (v3)
    v9 = v14;
  else
    v9 = 0;

  return v9;
}

- (void)_handleDeviceFirstUnlock
{
  NSObject *v3;
  uint8_t v4[16];

  _TCSInitializeLogging();
  v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSAvailability was notified of first device unlock.", v4, 2u);
  }
  -[TCSAvailability setShouldShowStatusIndicator:](self, "setShouldShowStatusIndicator:", -[TCSAvailability _calculateShouldShowStatusIndicator](self, "_calculateShouldShowStatusIndicator"));
  if (!-[TCSAvailability _isUserUnavailable](self, "_isUserUnavailable"))
    -[TCSAvailability _postNotificationName:](self, "_postNotificationName:", CFSTR("TCSAvailabilityDidChangeNotification"));
}

- (BOOL)_hasConnectivity
{
  return 1;
}

- (void)_postNotificationName:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__TCSAvailability__postNotificationName___block_invoke;
  block[3] = &unk_24CFC2498;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __41__TCSAvailability__postNotificationName___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *(_QWORD *)(a1 + 32), 0);

}

- (id)_unavailabilityText:(BOOL)a3
{
  if (a3)
    return CFSTR("unavailable");
  else
    return CFSTR("available");
}

- (BOOL)shouldObserveFriendListDefaultChanges
{
  return self->_shouldObserveFriendListDefaultChanges;
}

- (BOOL)shouldObserveUnavailabilityDefaultChanges
{
  return self->_shouldObserveUnavailabilityDefaultChanges;
}

- (BOOL)shouldShowStatusIndicator
{
  return self->_shouldShowStatusIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_tinCanDefaults, 0);
}

- (void)_setUserUnavailable:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21342E000, log, OS_LOG_TYPE_ERROR, "Attempt to set user availability flag before device first unlock.", v1, 2u);
}

@end
