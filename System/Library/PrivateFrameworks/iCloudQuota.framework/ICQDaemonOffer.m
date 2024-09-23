@implementation ICQDaemonOffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEligibleAppLaunchLinks, 0);
  objc_storeStrong((id *)&self->_internalAppLaunchLinks, 0);
  objc_storeStrong((id *)&self->_internalFollowupSpecification, 0);
  objc_storeStrong((id *)&self->_internalAlertSpecification, 0);
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
}

- (void)_initSubclassFromServerDictionary
{
  OUTLINED_FUNCTION_0_4(&dword_1CDEBD000, a1, a3, "no followupInfo provided", a5, a6, a7, a8, 0);
}

+ (id)persistenceKey
{
  return CFSTR("_ICQCachedOfferInternal");
}

- (id)appLaunchLinkForBundleID:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray containsObject:](self->_savedEligibleAppLaunchLinks, "containsObject:", v4))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_internalAppLaunchLinks;
    v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "appId", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_13;
          }
        }
        v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (BOOL)isPremiumOffer
{
  void *v2;
  char v3;

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _ICQIsPremiumOfferDictionary(v2);

  return v3;
}

- (BOOL)isDefaultOffer
{
  void *v2;
  char v3;

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _ICQIsDefaultOfferDictionary(v2);

  return v3;
}

- (BOOL)isBuddyOffer
{
  void *v2;
  char v3;

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _ICQIsBuddyOfferDictionary(v2);

  return v3;
}

- (ICQDaemonOffer)initWithDictionary:(id)a3
{
  id v4;
  ICQDaemonOffer *v5;
  uint64_t v6;
  NSArray *savedEligibleAppLaunchLinks;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQDaemonOffer;
  v5 = -[ICQDaemonPersisted initWithDictionary:](&v9, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eligibleAppLaunchLinks"));
    v6 = objc_claimAutoreleasedReturnValue();
    savedEligibleAppLaunchLinks = v5->_savedEligibleAppLaunchLinks;
    v5->_savedEligibleAppLaunchLinks = (NSArray *)v6;

    -[ICQDaemonOffer _initSubclassFromServerDictionary](v5, "_initSubclassFromServerDictionary");
  }

  return v5;
}

- (id)_mutablePersistenceDictionary
{
  void *v3;
  void *v4;
  const __CFString *notificationID;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICQDaemonOffer;
  -[ICQDaemonPersisted _mutablePersistenceDictionary](&v8, sel__mutablePersistenceDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (self->_notificationID)
      notificationID = (const __CFString *)self->_notificationID;
    else
      notificationID = &stru_1E8B3C468;
    objc_msgSend(v3, "setObject:forKey:", notificationID, CFSTR("notificationId"));
    -[ICQDaemonOffer _eligibleAppLaunchLinks](self, "_eligibleAppLaunchLinks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("eligibleAppLaunchLinks"));

  }
  return v4;
}

- (id)_eligibleAppLaunchLinks
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_internalAppLaunchLinks;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEligible", (_QWORD)v13))
        {
          objc_msgSend(v9, "appId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (int64_t)level
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _ICQLevelForString(v3);

  return v4;
}

- (BOOL)isEventOffer
{
  void *v2;
  char v3;

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _ICQIsEventOfferDictionary(v2);

  return v3;
}

- (int64_t)requestType
{
  if (-[ICQDaemonOffer isBuddyOffer](self, "isBuddyOffer"))
    return 4;
  if (-[ICQDaemonOffer isPremiumOffer](self, "isPremiumOffer"))
    return 2;
  if (-[ICQDaemonOffer isDefaultOffer](self, "isDefaultOffer"))
    return 1;
  if (-[ICQDaemonOffer isEventOffer](self, "isEventOffer"))
    return 5;
  return 3;
}

- (void)cacheLiftUIContent
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ICQDaemonOffer internalAppLaunchLinks](self, "internalAppLaunchLinks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cacheLiftUIContentIfNeeded");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_initWithAccount:(id)a3 serverDictionary:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQDaemonOffer;
  return -[ICQDaemonPersisted _initWithAccount:serverDictionary:](&v5, sel__initWithAccount_serverDictionary_, a3, a4);
}

- (id)_initWithAccount:(id)a3 error:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQDaemonOffer;
  return -[ICQDaemonPersisted _initWithAccount:error:](&v5, sel__initWithAccount_error_, a3, a4);
}

- (void)setServerDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQDaemonOffer;
  -[ICQDaemonPersisted setServerDictionary:](&v4, sel_setServerDictionary_, a3);
  -[ICQDaemonOffer _initSubclassFromServerDictionary](self, "_initSubclassFromServerDictionary");
}

- (void)setNotificationID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationID, a3);
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_ICQAlertSpecification)internalAlertSpecification
{
  return self->_internalAlertSpecification;
}

- (void)setInternalAlertSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_internalAlertSpecification, a3);
}

- (_ICQFollowupSpecification)internalFollowupSpecification
{
  return self->_internalFollowupSpecification;
}

- (void)setInternalFollowupSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_internalFollowupSpecification, a3);
}

- (NSArray)internalAppLaunchLinks
{
  return self->_internalAppLaunchLinks;
}

- (void)setInternalAppLaunchLinks:(id)a3
{
  objc_storeStrong((id *)&self->_internalAppLaunchLinks, a3);
}

- (NSArray)savedEligibleAppLaunchLinks
{
  return self->_savedEligibleAppLaunchLinks;
}

- (void)setSavedEligibleAppLaunchLinks:(id)a3
{
  objc_storeStrong((id *)&self->_savedEligibleAppLaunchLinks, a3);
}

- (NSDictionary)lockScreenInfo
{
  void *v2;
  void *v3;

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("lockScreenInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)alertSpecificationForAlertKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inlineAlertInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("alertKey"));
            v13 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && -[NSObject isEqualToString:](v13, "isEqualToString:", v17))
            {
              _ICQAlertSpecificationForServerDict(v12);
              v14 = objc_claimAutoreleasedReturnValue();

              v9 = (void *)v14;
            }
          }
          else
          {
            _ICQGetLogSystem();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v12;
              _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "expected inlineAlertInfo to be NSArray<NSDictionary *> but found %@", buf, 0xCu);
            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v5 = v16;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)placeholderExistsInString:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("%$"));
}

+ (id)defaultPlaceholderKeys
{
  if (defaultPlaceholderKeys_onceToken != -1)
    dispatch_once(&defaultPlaceholderKeys_onceToken, &__block_literal_global_25);
  return (id)defaultPlaceholderKeys_sPlaceholderKeysDefault;
}

void __50__ICQDaemonOffer_Internal__defaultPlaceholderKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("PhotoLibrarySize");
  v4[1] = CFSTR("PhotoLibraryUploadSize");
  v4[2] = CFSTR("PhotosVideosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)defaultPlaceholderKeys_sPlaceholderKeysDefault;
  defaultPlaceholderKeys_sPlaceholderKeysDefault = v2;

}

+ (id)placeholderKeysInString:(id)a3 fromKeys:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("%$"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v8 = (void *)objc_opt_new();
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v9 = 1;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v5;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              if (objc_msgSend(v10, "hasPrefix:", v16))
              {
                objc_msgSend(v8, "addObject:", v16);
                goto LABEL_15;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_15:

        ++v9;
      }
      while (v9 < objc_msgSend(v6, "count"));
    }
    v7 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

+ (id)substitutionForPlaceholderKey:(id)a3 outIsBelowMin:(BOOL *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PhotoLibrarySize")))
  {
    +[ICQDaemonOfferConditions photosLibrarySize](ICQDaemonOfferConditions, "photosLibrarySize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v7 = 1;
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PhotoLibraryUploadSize")))
  {
    +[ICQDaemonOfferConditions photosLibraryUploadSize](ICQDaemonOfferConditions, "photosLibraryUploadSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (!a4 || objc_msgSend(v9, "integerValue") >= 100000000)
      goto LABEL_3;
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2048;
      v19 = 100000000;
      _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "photosLibraryUploadSize: %@ < %lld -- recommending alternate string", (uint8_t *)&v16, 0x16u);
    }

    v7 = 1;
    *a4 = 1;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PhotosVideosCount")))
    {
      v6 = 0;
      goto LABEL_22;
    }
    +[ICQDaemonOfferConditions photosVideosCount](ICQDaemonOfferConditions, "photosVideosCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (a4 && objc_msgSend(v11, "integerValue") <= 0)
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412546;
        v17 = v6;
        v18 = 2048;
        v19 = 1;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "photosVideosCount: %@ < %lld -- recommending alternate string", (uint8_t *)&v16, 0x16u);
      }

      *a4 = 1;
    }
    v7 = 2;
  }
LABEL_4:
  if (!v6)
  {
LABEL_22:
    v8 = 0;
    goto LABEL_23;
  }
  if (v7 == 2)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLocale:", v14);

    objc_msgSend(v13, "setNumberStyle:", 1);
    objc_msgSend(v13, "setUsesGroupingSeparator:", 1);
    objc_msgSend(v13, "setMaximumFractionDigits:", 0);
    objc_msgSend(v13, "stringFromNumber:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v6, "longLongValue"), 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_23:

  return v8;
}

+ (id)substitutionsForPlaceholderKeys:(id)a3 checkIfBelowMin:(BOOL)a4 outIsMissingSubstitution:(BOOL *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  void *v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v25;
    *(_QWORD *)&v11 = 138412546;
    v21 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v23 = 0;
        objc_msgSend(a1, "substitutionForPlaceholderKey:outIsBelowMin:", v15, &v23, v21);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v6 && v23)
        {
          if (a5)
            goto LABEL_15;
        }
        else
        {
          if (v16)
          {
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, v15);
            goto LABEL_16;
          }
          _ICQGetLogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v29 = CFSTR("%$");
            v30 = 2112;
            v31 = v15;
            _os_log_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_DEFAULT, "no substitution for placeholder %@%@", buf, 0x16u);
          }

          if (a5)
LABEL_15:
            *a5 = 1;
        }
LABEL_16:

      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v12);
  }

  v19 = (void *)objc_msgSend(v22, "copy");
  return v19;
}

+ (id)substitutionsForPlaceholderKeys:(id)a3
{
  return (id)objc_msgSend(a1, "substitutionsForPlaceholderKeys:checkIfBelowMin:outIsMissingSubstitution:", a3, 0, 0);
}

+ (id)stringWithPlaceholderFormat:(id)a3
{
  return (id)objc_msgSend(a1, "stringWithPlaceholderFormat:alternateString:", a3, 0);
}

+ (id)stringWithPlaceholderFormat:(id)a3 alternateString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v15;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "placeholderExistsInString:", v6) & 1) != 0)
  {
    objc_msgSend(a1, "defaultPlaceholderKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "placeholderKeysInString:fromKeys:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "substitutionsForPlaceholderKeys:checkIfBelowMin:outIsMissingSubstitution:", v10, v7 != 0, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v15)
    {
      v12 = v7;
    }
    else
    {
      objc_msgSend(a1, "stringWithPlaceholderFormat:substitutions:", v6, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  else
  {
    v13 = v6;
  }

  return v13;
}

+ (id)stringWithPlaceholderFormat:(id)a3 substitutions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("%$"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") > 1)
  {
    v26 = v5;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v11 = 1;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v13 = v6;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v28;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v28 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              if (objc_msgSend(v12, "hasPrefix:", v18))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("%$"), v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                _ICQGetLogSystem();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v13, "objectForKeyedSubscript:", v18);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v32 = v20;
                  v33 = 2112;
                  v34 = v22;
                  _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "substituting for placeholder %{public}@ = %@", buf, 0x16u);

                }
                objc_msgSend(v13, "objectForKeyedSubscript:", v18);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "appendString:", v23);

                objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v18, "length"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "appendString:", v24);

                goto LABEL_19;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v15)
              continue;
            break;
          }
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("%$"), v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        _ICQGetLogSystem();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = v13;
          _os_log_impl(&dword_1CDEBD000, v19, OS_LOG_TYPE_DEFAULT, "missing substitution for substring \"%{public}@\", buf, 0xCu);
        }

        objc_msgSend(v10, "appendString:", v13);
LABEL_19:

        ++v11;
      }
      while (v11 < objc_msgSend(v7, "count"));
    }
    v8 = (id)objc_msgSend(v10, "copy");

    v5 = v26;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)_addSampleAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "mutableCopy");

  if (!-[ICQDaemonOffer level](self, "level"))
  {
    _ICQStringForLevel(2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("type"));

  }
  +[_ICQAlertSpecification alertSpecificationDictionarySampleForLevel:](_ICQAlertSpecification, "alertSpecificationDictionarySampleForLevel:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("alertInfo"));
  v6 = (void *)objc_msgSend(v7, "copy");
  -[ICQDaemonOffer setServerDictionary:](self, "setServerDictionary:", v6);

}

@end
