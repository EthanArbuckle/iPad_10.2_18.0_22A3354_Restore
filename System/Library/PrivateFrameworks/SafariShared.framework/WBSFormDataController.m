@implementation WBSFormDataController

+ (id)dontSaveMarker
{
  return (id)objc_msgSend(MEMORY[0x1E0D89BE0], "dontSaveMarker");
}

+ (BOOL)convertNumber:(id)a3 toAutoFillFormType:(unint64_t *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  unint64_t v8;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (v5 && a4)
  {
    v8 = objc_msgSend(v5, "unsignedIntegerValue");
    if (v8 > 5)
    {
      v7 = 0;
    }
    else
    {
      *a4 = v8;
      v7 = 1;
    }
  }

  return v7;
}

+ (id)_metadataForControlWithUniqueID:(id)a3 inForm:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a4, "controls", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "uniqueID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v5);

          if ((v12 & 1) != 0)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

+ (id)valueOfControlWithUniqueID:(id)a3 inForm:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_metadataForControlWithUniqueID:inForm:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)autoFillActionForFormType:(unint64_t)a3 onURL:(id)a4 shouldSubmitAfterFilling:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  int64_t v9;

  v5 = a5;
  v8 = a4;
  v9 = 0;
  if (a3 == 3 && v5)
    v9 = -[WBSAutoFillQuirksManager isAutomaticLoginDisallowedOnURL:](self->_autoFillQuirksManager, "isAutomaticLoginDisallowedOnURL:", v8) ^ 1;

  return v9;
}

- (BOOL)shouldSubmitForm:(id)a3 withUser:(id)a4 password:(id)a5 onURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[WBSFormDataController _removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission](self, "_removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission");
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safari_highLevelDomainFromHost");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WBSFormDataController _formKeyForMapOfHighLevelDomainToLastAutomaticFormSubmission:formMetadata:](self, "_formKeyForMapOfHighLevelDomainToLastAutomaticFormSubmission:formMetadata:", v12, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_mapOfHighLevelDomainToLastAutomaticFormSubmission, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      && -[WBSFormDataController _dateIsWithinGracePeriodForNotAutomaticallySubmittingLoginForms:](self, "_dateIsWithinGracePeriodForNotAutomaticallySubmittingLoginForms:", v16)|| objc_msgSend(v10, "type") != 3)
    {
      goto LABEL_9;
    }
    v17 = objc_msgSend(v10, "isEligibleForAutomaticLogin") ^ 1;
    if (!a5)
      LOBYTE(v17) = 1;
    if ((v17 & 1) != 0)
LABEL_9:
      v18 = 0;
    else
      v18 = objc_msgSend(v11, "length") != 0;

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (void)didAutomaticallySubmitFormWhenFillingOnURL:(id)a3 formMetadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_highLevelDomainFromHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WBSFormDataController _formKeyForMapOfHighLevelDomainToLastAutomaticFormSubmission:formMetadata:](self, "_formKeyForMapOfHighLevelDomainToLastAutomaticFormSubmission:formMetadata:", v11, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mapOfHighLevelDomainToLastAutomaticFormSubmission, "setObject:forKeyedSubscript:", v10, v9);

  }
}

- (id)_formKeyForMapOfHighLevelDomainToLastAutomaticFormSubmission:(id)a3 formMetadata:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = a4;
  objc_msgSend(a3, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_highLevelDomainFromHost");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "userNameElementUniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "passwordElementUniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v22, "controls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "uniqueID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "length") && objc_msgSend(v15, "isEqualToString:", v6))
        {
          v9 = objc_msgSend(v14, "isVisible");
        }
        else if (objc_msgSend(v7, "length") && objc_msgSend(v15, "isEqualToString:", v7))
        {
          v10 = objc_msgSend(v14, "isVisible");
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v6, "length");
  v17 = objc_msgSend(v7, "length");
  if ((v17 != 0) & v10 | !((v16 != 0) & v9))
    v18 = CFSTR("%@|U|P");
  else
    v18 = CFSTR("%@|U");
  if (!((v17 != 0) & v10) | (v16 != 0) & v9)
    v19 = v18;
  else
    v19 = CFSTR("%@|P");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v19, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission
{
  NSMutableDictionary *mapOfHighLevelDomainToLastAutomaticFormSubmission;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  _QWORD v7[5];

  mapOfHighLevelDomainToLastAutomaticFormSubmission = self->_mapOfHighLevelDomainToLastAutomaticFormSubmission;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__WBSFormDataController__removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission__block_invoke;
  v7[3] = &unk_1E4B39960;
  v7[4] = self;
  -[NSMutableDictionary safari_mapAndFilterKeysAndObjectsUsingBlock:](mapOfHighLevelDomainToLastAutomaticFormSubmission, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  v6 = self->_mapOfHighLevelDomainToLastAutomaticFormSubmission;
  self->_mapOfHighLevelDomainToLastAutomaticFormSubmission = v5;

}

id __97__WBSFormDataController__removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_dateIsWithinGracePeriodForNotAutomaticallySubmittingLoginForms:", v4))v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (BOOL)_dateIsWithinGracePeriodForNotAutomaticallySubmittingLoginForms:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSinceNow");
  return v3 > -300.0;
}

+ (id)fieldToFocusBeforeSubmittingForm:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "passwordElementUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "userNameElementUniqueID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (WBSFormDataController)init
{
  return -[WBSFormDataController initWithAggressiveKeychainCaching:](self, "initWithAggressiveKeychainCaching:", 0);
}

- (WBSFormDataController)initWithAggressiveKeychainCaching:(BOOL)a3
{
  WBSFormDataController *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *internalQueue;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  WBSAutoFillQuirksManager *autoFillQuirksManager;
  NSMutableDictionary *v18;
  NSMutableDictionary *mapOfHighLevelDomainToLastAutomaticFormSubmission;
  WBSAuthenticationServicesAgentProxy *v20;
  WBSAuthenticationServicesAgentProxy *agentProxy;
  WBSFormDataController *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)WBSFormDataController;
  v3 = -[WBSFormDataController init](&v24, sel_init, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__currentLocaleDidChange_, *MEMORY[0x1E0C99720], 0);

    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.internalQueue"), v7, v3);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc(MEMORY[0x1E0D89BA8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariCoreBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLForResource:withExtension:", CFSTR("WBSAutoFillQuirks"), CFSTR("plist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safari_autoFillQuirksDownloadDirectoryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "initWithBuiltInQuirksURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:", v13, v15, CFSTR("AutoFillQuirks"), CFSTR("1"), *MEMORY[0x1E0D89F20], 86400.0);
    autoFillQuirksManager = v3->_autoFillQuirksManager;
    v3->_autoFillQuirksManager = (WBSAutoFillQuirksManager *)v16;

    -[WBSAutoFillQuirksManager beginLoadingQuirksFromDisk](v3->_autoFillQuirksManager, "beginLoadingQuirksFromDisk");
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mapOfHighLevelDomainToLastAutomaticFormSubmission = v3->_mapOfHighLevelDomainToLastAutomaticFormSubmission;
    v3->_mapOfHighLevelDomainToLastAutomaticFormSubmission = v18;

    v20 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E0D89BA0]);
    agentProxy = v3->_agentProxy;
    v3->_agentProxy = v20;

    v22 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  id keybagCallbackToken;
  objc_super v5;

  -[WBSKeychainCredentialNotificationMonitor removeObserverForToken:](self->_keychainMonitor, "removeObserverForToken:", self->_keychainNotificationRegistrationToken);
  -[WBSAutoFillQuirksManager prepareForTermination](self->_autoFillQuirksManager, "prepareForTermination");
  if (self->_keybagCallbackToken)
  {
    objc_msgSend(MEMORY[0x1E0D89C00], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeKeyBagLockStatusChangedObserver:", self->_keybagCallbackToken);

    keybagCallbackToken = self->_keybagCallbackToken;
    self->_keybagCallbackToken = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)WBSFormDataController;
  -[WBSFormDataController dealloc](&v5, sel_dealloc);
}

- (void)_loadCompletionDBIfNeededOnInternalQueue
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Attempt to read saved form values from %@ failed", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)loadCompletionDBIfNeeded
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WBSFormDataController_loadCompletionDBIfNeeded__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __49__WBSFormDataController_loadCompletionDBIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadCompletionDBIfNeededOnInternalQueue");
}

- (void)pruneCompletionDB
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__WBSFormDataController_pruneCompletionDB__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __42__WBSFormDataController_pruneCompletionDB__block_invoke(uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  NSArray *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD block[5];
  char v29;
  id v30;
  id v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t *v41;
  uint64_t v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v2 = a1;
  v45 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v42 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_loadCompletionDBIfNeededOnInternalQueue");
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(*(id *)(v2 + 32), "_domainsWithPreviousDataOnInternalQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v3)
  {
    v25 = v2;
    v26 = *(_QWORD *)v38;
    do
    {
      v27 = v3;
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 32), "safari_dictionaryForKey:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "count"))
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v6 = v5;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v7)
          {
            v8 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v7; ++j)
              {
                if (*(_QWORD *)v34 != v8)
                  objc_enumerationMutation(v6);
                v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
                v30 = 0;
                v31 = 0;
                v30 = v4;
                objc_storeStrong(&v31, v10);
                objc_msgSend(v6, "safari_arrayForKey:", v10);
                v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
                v32 = timestampForCompletionValues(v11);

                if (HIDWORD(v42) == (_DWORD)v42)
                {
                  WTF::Vector<SortEntry,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,SortEntry&>((uint64_t)&v41, (unint64_t)&v30);
                }
                else
                {
                  v12 = &v41[3 * HIDWORD(v42)];
                  *v12 = (uint64_t)v30;
                  v12[1] = (uint64_t)v31;
                  *((_DWORD *)v12 + 4) = v32;
                  ++HIDWORD(v42);
                }

              }
              v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
            }
            while (v7);
          }

        }
        v2 = v25;
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v3);
  }
  v13 = v2;

  v30 = &__block_literal_global_48;
  v14 = 126 - 2 * __clz(HIDWORD(v42));
  if (HIDWORD(v42))
    v15 = v14;
  else
    v15 = 0;
  std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(SortEntry const&,SortEntry const&),SortEntry*,false>(v41, &v41[3 * HIDWORD(v42)], (uint64_t *)&v30, v15, 1);

  LODWORD(i) = vcvtps_s32_f32((float)HIDWORD(v42) * 0.1);
  if ((int)i < 1)
  {
    v17 = 0;
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v18 = 1;
    do
    {
      if (v16 >= HIDWORD(v42)
        || (v19 = (id)v41[v18 - 1],
            objc_msgSend(*(id *)(*(_QWORD *)(v13 + 32) + 32), "safari_dictionaryForKey:", v19),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 >= HIDWORD(v42)))
      {
        __break(0xC471u);
        JUMPOUT(0x1A3E140B4);
      }
      v21 = v20;
      objc_msgSend(v20, "removeObjectForKey:", v41[v18]);
      if (!objc_msgSend(v21, "count"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(v13 + 32) + 32), "removeObjectForKey:", v19);
        v17 = 1;
      }

      ++v16;
      v18 += 3;
    }
    while (i != v16);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__WBSFormDataController_pruneCompletionDB__block_invoke_3;
  block[3] = &unk_1E4B2AED8;
  v29 = v17 & 1;
  block[4] = *(_QWORD *)(v13 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  return WTF::Vector<SortEntry,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v41, v22);
}

BOOL __42__WBSFormDataController_pruneCompletionDB__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_DWORD *)(a2 + 16) < *(_DWORD *)(a3 + 16);
}

uint64_t __42__WBSFormDataController_pruneCompletionDB__block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "domainsWithPreviousDataChanged");
  return result;
}

- (id)_completionDB
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__WBSFormDataController__completionDB__block_invoke;
  v5[3] = &unk_1E4B2BDF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__WBSFormDataController__completionDB__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allFormDataForSaving
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v12;

  if (self->_completionDBSize > 0x7D000)
    -[WBSFormDataController pruneCompletionDB](self, "pruneCompletionDB");
  v3 = (void *)MEMORY[0x1E0CB38B0];
  -[WBSFormDataController _completionDB](self, "_completionDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (v5)
  {
    -[WBSFormDataController encryptOrDecryptData:encrypt:](self, "encryptOrDecryptData:encrypt:", v5, 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSFormDataController allFormDataForSaving].cold.1((uint64_t)v6, v8, v9);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

  return v10;
}

- (id)_domainsWithPreviousDataOnInternalQueue
{
  void *v3;

  v3 = (void *)-[NSMutableDictionary count](self->_valuesDB, "count");
  if (v3)
  {
    -[NSMutableDictionary allKeys](self->_valuesDB, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)domainsWithPreviousData
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__WBSFormDataController_domainsWithPreviousData__block_invoke;
  v5[3] = &unk_1E4B2BE20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__WBSFormDataController_domainsWithPreviousData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadCompletionDBIfNeededOnInternalQueue");
  objc_msgSend(*(id *)(a1 + 32), "_domainsWithPreviousDataOnInternalQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)clearPreviousDataForDomain:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WBSFormDataController_clearPreviousDataForDomain___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __52__WBSFormDataController_clearPreviousDataForDomain___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_loadCompletionDBIfNeededOnInternalQueue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__WBSFormDataController_clearPreviousDataForDomain___block_invoke_2;
    block[3] = &unk_1E4B2A2C8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __52__WBSFormDataController_clearPreviousDataForDomain___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "domainsWithPreviousDataChanged");
  return objc_msgSend(*(id *)(a1 + 32), "saveCompletionDBSoon");
}

- (void)clearPreviousDataDatabaseItemsAddedAfterDate:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__WBSFormDataController_clearPreviousDataDatabaseItemsAddedAfterDate___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __70__WBSFormDataController_clearPreviousDataDatabaseItemsAddedAfterDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t j;
  uint64_t v8;
  NSArray *v9;
  int v10;
  void *v11;
  id obj;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  char v17;
  _QWORD block[5];
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_domainsWithPreviousDataOnInternalQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v2)
  {
    v17 = 0;
    v13 = *(_QWORD *)v25;
    v14 = v2;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "safari_dictionaryForKey:");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "count"))
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v3, "allKeys");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v5)
          {
            v6 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v5; ++j)
              {
                if (*(_QWORD *)v21 != v6)
                  objc_enumerationMutation(v4);
                v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
                objc_msgSend(v3, "safari_arrayForKey:", v8);
                v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
                v10 = timestampForCompletionValues(v9);

                objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v10);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v11, "compare:", *(_QWORD *)(a1 + 40)) == 1)
                {
                  objc_msgSend(v3, "removeObjectForKey:", v8);
                  v17 = 1;
                }

              }
              v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v5);
          }

          if (!objc_msgSend(v3, "count"))
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v15);
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v15);
          v17 = 1;
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v14);
  }
  else
  {
    v17 = 0;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WBSFormDataController_clearPreviousDataDatabaseItemsAddedAfterDate___block_invoke_2;
  block[3] = &unk_1E4B2AED8;
  v19 = v17 & 1;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __70__WBSFormDataController_clearPreviousDataDatabaseItemsAddedAfterDate___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "saveCompletionDBSoon");
    return objc_msgSend(*(id *)(v1 + 32), "domainsWithPreviousDataChanged");
  }
  return result;
}

- (id)infoForDomain:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WBSFormDataController_infoForDomain___block_invoke;
  block[3] = &unk_1E4B399C8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __39__WBSFormDataController_infoForDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadCompletionDBIfNeededOnInternalQueue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "safari_dictionaryForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setInfo:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WBSFormDataController_setInfo_forDomain___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __43__WBSFormDataController_setInfo_forDomain___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "setValue:forKey:", a1[5], a1[6]);
}

- (id)uniqueIDOfContact:(id)a3
{
  objc_msgSend(a3, "identifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setPreferredIdentifier:(id)a3 forProperty:(id)a4 withContact:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__WBSFormDataController_setPreferredIdentifier_forProperty_withContact___block_invoke;
  v15[3] = &unk_1E4B399F0;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(internalQueue, v15);

}

void __72__WBSFormDataController_setPreferredIdentifier_forProperty_withContact___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_loadCompletionDBIfNeededOnInternalQueue");
  objc_msgSend(*(id *)(a1 + 32), "uniqueIDOfContact:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v3 = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v4, v5);
  }

}

- (id)preferredIdentifierForProperty:(id)a3 withContact:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__WBSFormDataController_preferredIdentifierForProperty_withContact___block_invoke;
  v13[3] = &unk_1E4B39A18;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(internalQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __68__WBSFormDataController_preferredIdentifierForProperty_withContact___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_loadCompletionDBIfNeededOnInternalQueue");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[9];
  objc_msgSend(v2, "uniqueIDOfContact:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dictionaryForKey:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safari_stringForKey:", *(_QWORD *)(a1 + 48));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)preferredIdentifierExistsForProperty:(id)a3 withContact:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__WBSFormDataController_preferredIdentifierExistsForProperty_withContact___block_invoke;
  v12[3] = &unk_1E4B39A18;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = &v16;
  v9 = v6;
  v10 = v7;
  dispatch_sync(internalQueue, v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

void __74__WBSFormDataController_preferredIdentifierExistsForProperty_withContact___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_loadCompletionDBIfNeededOnInternalQueue");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[9];
  objc_msgSend(v2, "uniqueIDOfContact:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dictionaryForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 48));

}

- (id)_recentlyUsedAutoFillDictionaries
{
  -[WBSFormDataController loadCompletionDBIfNeeded](self, "loadCompletionDBIfNeeded");
  return (id)-[NSMutableArray copy](self->_recentlyUsedAutoFillSets, "copy");
}

- (void)addRecentlyUsedAutoFillSet:(id)a3 appendToTheEnd:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableArray *recentlyUsedAutoFillSets;
  id v7;

  v4 = a4;
  v7 = a3;
  -[WBSFormDataController loadCompletionDBIfNeeded](self, "loadCompletionDBIfNeeded");
  recentlyUsedAutoFillSets = self->_recentlyUsedAutoFillSets;
  if (v4)
  {
    -[NSMutableArray addObject:](recentlyUsedAutoFillSets, "addObject:", v7);
    if ((unint64_t)-[NSMutableArray count](self->_recentlyUsedAutoFillSets, "count") >= 2)
      -[NSMutableArray removeObjectAtIndex:](self->_recentlyUsedAutoFillSets, "removeObjectAtIndex:", 0);
  }
  else
  {
    -[NSMutableArray insertObject:atIndex:](recentlyUsedAutoFillSets, "insertObject:atIndex:", v7, 0);
    if ((unint64_t)-[NSMutableArray count](self->_recentlyUsedAutoFillSets, "count") >= 2)
      -[NSMutableArray removeLastObject](self->_recentlyUsedAutoFillSets, "removeLastObject");
    -[WBSFormDataController saveCompletionDBSoon](self, "saveCompletionDBSoon");
  }

}

- (id)recentlyUsedAutoFillSets
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  WBSRecentlyUsedAutoFillSet *v19;
  id obj;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[WBSFormDataController _recentlyUsedAutoFillDictionaries](self, "_recentlyUsedAutoFillDictionaries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v4)
  {
    v22 = *(_QWORD *)v37;
    do
    {
      v24 = v4;
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recentlyUsedAutoFillSetArray"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recentlyUsedAutoFillSetDoNotFillArray"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recentlyUsedAutoFillSetLabel"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = v26;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v33 != v11)
                objc_enumerationMutation(v9);
              +[WBSAddressBookMatch addressBookMatchWithDictionaryRepresentation:](WBSAddressBookMatch, "addressBookMatchWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v13);

            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          }
          while (v10);
        }

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v14 = v25;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v29;
          do
          {
            for (k = 0; k != v15; ++k)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v14);
              +[WBSAddressBookMatch addressBookMatchWithDictionaryRepresentation:](WBSAddressBookMatch, "addressBookMatchWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v18);

            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          }
          while (v15);
        }

        v19 = -[WBSRecentlyUsedAutoFillSet initWithFillMatches:skipMatches:label:]([WBSRecentlyUsedAutoFillSet alloc], "initWithFillMatches:skipMatches:label:", v7, v8, v27);
        objc_msgSend(v23, "addObject:", v19);

      }
      v3 = obj;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v4);
  }

  return v23;
}

+ (BOOL)stringLooksLikeCreditCardNumber:(id)a3
{
  return WBSCreditCardTypeFromNumber() != 0;
}

+ (BOOL)formContainsCreditCardData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "controls", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length")
          && ((objc_msgSend(v8, "looksLikeCreditCardNumberField") & 1) != 0
           || (objc_msgSend(v8, "looksLikeCreditCardSecurityCodeField") & 1) != 0
           || objc_msgSend(a1, "stringLooksLikeCreditCardNumber:", v9)))
        {

          v10 = 1;
          goto LABEL_15;
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

+ (BOOL)formContainsCreditCardNumberField:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "controls", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "looksLikeCreditCardNumberField") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)formContainsCreditCardNumberOrCardSecurityCodeField:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "controls", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "looksLikeCreditCardNumberField") & 1) != 0
          || (objc_msgSend(v7, "looksLikeCreditCardSecurityCodeField") & 1) != 0)
        {
          v8 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void)addPreviousDataMatchesForFieldWithName:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 toArray:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  WBSUserTypedFormString *v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v20, "length") && objc_msgSend(v10, "length"))
  {
    -[WBSFormDataController loadCompletionDBIfNeeded](self, "loadCompletionDBIfNeeded");
    -[WBSFormDataController infoForDomain:](self, "infoForDomain:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_arrayForKey:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = objc_msgSend(v14, "count");
      if (v16 - 2 >= 0)
      {
        v17 = v16 - 1;
        do
        {
          objc_msgSend(v15, "safari_stringAtIndex:", --v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18
            && !+[WBSFormDataController stringLooksLikeCreditCardNumber:](WBSFormDataController, "stringLooksLikeCreditCardNumber:", v18)&& ((objc_msgSend(v18, "safari_hasLocalizedCaseInsensitivePrefix:", v11) & 1) != 0|| !objc_msgSend(v11, "length")))
          {
            v19 = -[WBSUserTypedFormString initWithUserTypedString:]([WBSUserTypedFormString alloc], "initWithUserTypedString:", v18);
            objc_msgSend(v12, "insertObject:atIndex:", v19, 0);

          }
        }
        while (v17 > 0);
      }
    }

  }
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5
{
  -[WBSFormDataController addressBookMatchesForProperty:key:label:partialString:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "addressBookMatchesForProperty:key:label:partialString:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, a5, 0, 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5 partialString:(id)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  return 0;
}

- (void)addABMatchesForValueSpecifier:(id)a3 matchingPartialString:(id)a4 toArray:(id)a5 preferredLabel:(id)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  char v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id obj;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  _BYTE v85[128];
  _QWORD v86[4];
  _QWORD v87[4];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v8 = a8;
  v90 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v70 = a5;
  v69 = a6;
  v58 = a7;
  v65 = v13;
  objc_msgSend(v13, "property");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (!v16)
    goto LABEL_58;
  objc_msgSend(v65, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {

    v69 = 0;
  }
  objc_msgSend(v65, "property");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "component");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormDataController addressBookMatchesForProperty:key:label:partialString:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "addressBookMatchesForProperty:key:label:partialString:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v19, v20, v21, v14, v58, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v22;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
  if (v23)
  {
    v67 = *(_QWORD *)v80;
    v63 = *MEMORY[0x1E0D89D60];
    v24 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v80 != v67)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        objc_msgSend(v26, "stringValue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "length")
          || (objc_msgSend(v27, "safari_hasLocalizedCaseInsensitivePrefix:", v14) & 1) != 0)
        {
LABEL_22:
          if (objc_msgSend(v69, "length"))
          {
            objc_msgSend(v26, "label");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v35, "length"))
            {
              objc_msgSend(v26, "label");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "isEqualToString:", v69);

              if ((v37 & 1) == 0)
                goto LABEL_30;
            }
            else
            {

            }
          }
          objc_msgSend(v26, "stringValue");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v83[0] = v24;
          v83[1] = 3221225472;
          v83[2] = ___ZL17findLiteralStringP7NSArrayP8NSString_block_invoke;
          v83[3] = &unk_1E4B39C20;
          v84 = v38;
          v39 = v38;
          v40 = objc_msgSend(v70, "indexOfObjectPassingTest:", v83);

          if (v40 == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v70, "addObject:", v26);
          else
            objc_msgSend(v70, "replaceObjectAtIndex:withObject:", v40, v26);
        }
        else
        {
          objc_msgSend(v65, "property");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", v63);

          if ((v29 & 1) != 0)
          {
            -[WBSFormDataController _singleFieldPhoneNumberCandidates:](self, "_singleFieldPhoneNumberCandidates:", v27);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = 0u;
            v78 = 0u;
            v75 = 0u;
            v76 = 0u;
            v31 = v30;
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
            if (v32)
            {
              v33 = *(_QWORD *)v76;
              while (2)
              {
                for (j = 0; j != v32; ++j)
                {
                  if (*(_QWORD *)v76 != v33)
                    objc_enumerationMutation(v31);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * j), "safari_hasLocalizedCaseInsensitivePrefix:", v14) & 1) != 0)
                  {

                    goto LABEL_22;
                  }
                }
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
                if (v32)
                  continue;
                break;
              }
            }

          }
        }
LABEL_30:

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    }
    while (v23);
  }

  v86[0] = CFSTR("_$!<Mobile>!$_");
  v86[1] = CFSTR("iPhone");
  v87[0] = &unk_1E4B87A60;
  v87[1] = &unk_1E4B87A78;
  v86[2] = CFSTR("_$!<Home>!$_");
  v86[3] = CFSTR("_$!<Work>!$_");
  v87[2] = &unk_1E4B87A90;
  v87[3] = &unk_1E4B87AA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "count"))
    goto LABEL_57;
  objc_msgSend(v65, "property");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0D89D60]);

  if ((v42 & 1) == 0)
    goto LABEL_57;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v59 = obj;
  v43 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
  if (!v43)
  {

    goto LABEL_55;
  }
  v68 = 0;
  v60 = *(_QWORD *)v72;
  do
  {
    v62 = v43;
    for (k = 0; k != v62; ++k)
    {
      if (*(_QWORD *)v72 != v60)
        objc_enumerationMutation(v59);
      v45 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
      v46 = objc_msgSend(v14, "length");
      if (v46)
      {
        objc_msgSend(v45, "stringValue");
        v42 = objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend((id)v42, "safari_hasLocalizedCaseInsensitivePrefix:", v14))
        {
          v49 = (void *)v42;
LABEL_49:

          continue;
        }
      }
      objc_msgSend(v45, "label");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {

        if (!v48)
          continue;
      }
      else if (!v48)
      {
        continue;
      }
      if (!v68)
        goto LABEL_48;
      objc_msgSend(v45, "label");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "integerValue");
      objc_msgSend(v68, "label");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v52 < objc_msgSend(v54, "integerValue");

      if (v55)
      {
LABEL_48:
        v56 = v45;
        v49 = v68;
        v68 = v56;
        goto LABEL_49;
      }
    }
    v43 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
  }
  while (v43);

  if (v68)
  {
    objc_msgSend(v70, "addObject:");
    v57 = v68;
    goto LABEL_56;
  }
LABEL_55:
  v57 = 0;
LABEL_56:

LABEL_57:
LABEL_58:

}

+ (id)addressBookAddressPropertyKey
{
  return (id)*MEMORY[0x1E0D89D38];
}

+ (id)allAddressBookAddressComponentKeys
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("City");
  v3[1] = CFSTR("State");
  v3[2] = CFSTR("Street");
  v3[3] = CFSTR("ZIP");
  v3[4] = CFSTR("Country");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)allAddressBookNonAddressPropertyKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D89D70];
  v7[0] = *MEMORY[0x1E0D89D68];
  v7[1] = v2;
  v3 = *MEMORY[0x1E0D89D48];
  v7[2] = *MEMORY[0x1E0D89D80];
  v7[3] = v3;
  v4 = *MEMORY[0x1E0D89D50];
  v7[4] = *MEMORY[0x1E0D89D60];
  v7[5] = v4;
  v5 = *MEMORY[0x1E0D89D40];
  v7[6] = *MEMORY[0x1E0D89D58];
  v7[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)specifierForAddressBookLabel:(id)a3
{
  +[WBSFormToABBinder specifierForLabel:](WBSFormToABBinder, "specifierForLabel:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)allSynonymsForMatch:(id)a3
{
  id v3;
  NSString *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "stringValue");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  +[WBSFormToABBinder allSynonymsForMatch:formAppearsToBeChinese:](WBSFormToABBinder, "allSynonymsForMatch:formAppearsToBeChinese:", v3, languageOfTextIsChinese(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)formContainsDateFields:(id)a3 matchingAddressBookMatch:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  id v21;
  id v22;
  id v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "controls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (objc_msgSend(v6, "dateValue"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    objc_msgSend(v5, "controls");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = 0;
    v21 = 0;
    identifyDateFields(v9, &v23, &v22, &v21);
    v10 = v23;
    v11 = v22;
    v12 = v21;

    objc_msgSend(v6, "dateValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = stringContainsDateComponentValue(v14, 0, v13);

    if ((v15 & 1) != 0
      && (objc_msgSend(v11, "value"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = stringContainsDateComponentValue(v16, 1, v13),
          v16,
          (v17 & 1) != 0))
    {
      objc_msgSend(v12, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = stringContainsDateComponentValue(v18, 2, v13);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_currentLocaleDidChange:(id)a3
{
  WBSPair *cachedBirthdayAndLocalizedStrings;

  cachedBirthdayAndLocalizedStrings = self->_cachedBirthdayAndLocalizedStrings;
  self->_cachedBirthdayAndLocalizedStrings = 0;

}

- (id)_cachedLocalizedStringsForBirthdate:(id)a3
{
  id v4;
  WBSPair *cachedBirthdayAndLocalizedStrings;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WBSPair *v13;
  WBSPair *v14;
  id v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    cachedBirthdayAndLocalizedStrings = self->_cachedBirthdayAndLocalizedStrings;
    v16 = 0;
    v17 = 0;
    -[WBSPair getFirst:second:](cachedBirthdayAndLocalizedStrings, "getFirst:second:", &v17, &v16);
    v6 = v17;
    v7 = v16;
    if (objc_msgSend(v6, "isEqualToDate:", v4))
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "safari_localeIdentifiersForMostWidelyUsedLanguages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setByAddingObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "safari_stringsFromDateForLocaleIdentifiers:", v12);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (WBSPair *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C18]), "initWithFirst:second:", v4, v8);
      v14 = self->_cachedBirthdayAndLocalizedStrings;
      self->_cachedBirthdayAndLocalizedStrings = v13;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bestAddressBookLabelForFormMetadata:(id)a3 formControlValue:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t k;
  void *v32;
  id v33;
  __CFString *v34;
  id obj;
  uint64_t i;
  uint64_t v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v6 = a4;
  if (!v6)
  {
    v34 = 0;
    goto LABEL_50;
  }
  objc_msgSend((id)objc_opt_class(), "addressBookAddressPropertyKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend((id)objc_opt_class(), "allAddressBookAddressComponentKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (!v28)
    goto LABEL_19;
  v33 = *(id *)v53;
  do
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(id *)v53 != v33)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v30 = v7;
      -[WBSFormDataController addressBookMatchesForProperty:key:label:](self, "addressBookMatchesForProperty:key:label:", v32);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      if (!v8)
        goto LABEL_17;
      v9 = *(_QWORD *)v49;
      while (2)
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v49 != v9)
            objc_enumerationMutation(v39);
          v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(v11, "stringValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && !objc_msgSend(v12, "caseInsensitiveCompare:", v6))
          {
            objc_msgSend(v30, "lowercaseString");
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_48:

            goto LABEL_49;
          }
          objc_msgSend((id)objc_opt_class(), "allSynonymsForMatch:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "safari_setByApplyingBlock:", &__block_literal_global_157_0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "lowercaseString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_1E4B40D18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "containsObject:", v17);

          if (v18)
          {
            objc_msgSend(v30, "lowercaseString");
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_47:

            goto LABEL_48;
          }

        }
        v8 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
        if (v8)
          continue;
        break;
      }
LABEL_17:

    }
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  }
  while (v28);
LABEL_19:

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend((id)objc_opt_class(), "allAddressBookNonAddressPropertyKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v27)
  {
    v29 = *(_QWORD *)v45;
    v37 = *MEMORY[0x1E0D89D40];
    v34 = &stru_1E4B40D18;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        -[WBSFormDataController addressBookMatchesForProperty:key:label:](self, "addressBookMatchesForProperty:key:label:", v19, 0, 0);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v41;
          while (2)
          {
            for (m = 0; m != v20; ++m)
            {
              if (*(_QWORD *)v41 != v21)
                objc_enumerationMutation(v39);
              v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * m);
              objc_msgSend(v23, "stringValue");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v24;
              if (v24 && !objc_msgSend(v24, "caseInsensitiveCompare:", v6))
              {
                objc_msgSend(v19, "lowercaseString");
                v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
                goto LABEL_48;
              }
              objc_msgSend(v23, "dateValue");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15 && objc_msgSend(v19, "isEqualToString:", v37))
              {
                -[WBSFormDataController _cachedLocalizedStringsForBirthdate:](self, "_cachedLocalizedStringsForBirthdate:", v15);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v25, "containsObject:", v6)
                  || (objc_msgSend((id)objc_opt_class(), "formContainsDateFields:matchingAddressBookMatch:", v38, v23) & 1) != 0)
                {
                  objc_msgSend(v19, "lowercaseString");
                  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_47;
                }

              }
            }
            v20 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
            if (v20)
              continue;
            break;
          }
        }

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    }
    while (v27);
  }
  else
  {
    v34 = &stru_1E4B40D18;
  }
LABEL_49:

LABEL_50:
  return v34;
}

id __78__WBSFormDataController_bestAddressBookLabelForFormMetadata_formControlValue___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "lowercaseString");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)addressBookHasDataForLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForAddressBookLabel:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "property");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "component");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSFormDataController addressBookMatchesForProperty:key:label:](self, "addressBookMatchesForProperty:key:label:", v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "count") != 0;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)shouldDisplayOneTimeCodeForControl:(id)a3 inForm:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    if ((objc_msgSend(v5, "looksLikeOneTimeCodeField") & 1) != 0)
    {
      v9 = 1;
      goto LABEL_14;
    }
    objc_msgSend(v5, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userNameElementUniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
      goto LABEL_6;
    objc_msgSend(v6, "passwordElementUniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v13) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "oldPasswordElementUniqueID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", v14) & 1) != 0)
        goto LABEL_10;
      objc_msgSend(v6, "confirmPasswordElementUniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "isEqualToString:", v16);

      if ((v17 & 1) != 0)
      {
LABEL_6:
        v9 = 0;
LABEL_13:

        goto LABEL_14;
      }
      +[WBSFormDataController specifierForControl:](WBSFormDataController, "specifierForControl:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "property");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D89D60]);

      if ((v19 & 1) != 0)
      {
        v9 = 1;
        goto LABEL_12;
      }
      objc_msgSend(v13, "property");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D89D38]))
      {
LABEL_10:
        v9 = 0;
      }
      else
      {
        objc_msgSend(v13, "component");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v20, "isEqualToString:", CFSTR("ZIP"));

      }
    }
LABEL_12:

    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

+ (BOOL)shouldDisplayHideMyEmailForControl:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    +[WBSFormDataController specifierForControl:](WBSFormDataController, "specifierForControl:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "property");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D89D48]);

  }
  return v6;
}

+ (id)specifierForControl:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "classification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classificationHints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedParts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSFormToABBinder specifierForClassification:hints:orderedParts:](WBSFormToABBinder, "specifierForClassification:hints:orderedParts:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v3, "autocompleteTokens", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        +[WBSFormToABBinder specifierForAutocompleteToken:](WBSFormToABBinder, "specifierForAutocompleteToken:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (v8)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v10)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      objc_msgSend(v3, "addressBookLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        +[WBSFormToABBinder specifierForLabel:](WBSFormToABBinder, "specifierForLabel:", v9);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }

  }
  return v8;
}

+ (id)stringWithAddressBookValue:(id)a3 key:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (id)matchesForControl:(id)a3 atURL:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v12 = a3;
  v13 = a5;
  +[WBSFormDataController domainFromURL:](WBSFormDataController, "domainFromURL:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = a7;
  -[WBSFormDataController _matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v12, v14, v13, a6, 0, 0, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)matchesForControl:(id)a3 atURL:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  +[WBSFormDataController domainFromURL:](WBSFormDataController, "domainFromURL:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = a8;
  -[WBSFormDataController _matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v14, v17, v15, a6, 0, v16, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_matchesForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  -[WBSFormDataController _matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, a5, a6, a7, 0, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_matchesForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 contact:(id)a8 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  if ((objc_msgSend(v15, "looksLikeCreditCardNumberField") & 1) == 0
    && (objc_msgSend(v15, "looksLikeCreditCardSecurityCodeField") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fieldName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = !-[WBSFormDataController shouldAutoFillFromPreviousData](self, "shouldAutoFillFromPreviousData");
    if ((unint64_t)(a6 - 1) > 1)
      LOBYTE(v22) = 1;
    if ((v22 & 1) == 0)
      -[WBSFormDataController addPreviousDataMatchesForFieldWithName:inDomain:matchingPartialString:toArray:](self, "addPreviousDataMatchesForFieldWithName:inDomain:matchingPartialString:toArray:", v37, v16, v17, v21);
    v23 = !-[WBSFormDataController shouldAutoFillFromAddressBook](self, "shouldAutoFillFromAddressBook");
    if ((a6 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      LOBYTE(v23) = 1;
    if ((v23 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "specifierForControl:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        v36 = v24;
        objc_msgSend(v24, "property");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D89D48]);

        if (((objc_msgSend(v15, "isLabeledUsernameField") ^ 1 | v27) & 1) == 0)
        {

          v20 = 0;
          goto LABEL_19;
        }
        -[WBSFormDataController addABMatchesForValueSpecifier:matchingPartialString:toArray:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "addABMatchesForValueSpecifier:matchingPartialString:toArray:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v36, v17, v21, v18, v19, a9);
        v25 = v36;
        if (v27)
        {
          objc_msgSend(v16, "safari_substringFromPrefix:", CFSTR("."));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (!v28)
            v28 = v16;
          objc_msgSend(v28, "safari_bestURLForUserTypedString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = objc_alloc(MEMORY[0x1E0D89CF0]);
          -[WBSFormDataController autoFillQuirksManager](self, "autoFillQuirksManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "associatedDomainsManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v30, "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v35, 35, v17, v31, 0);

          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __179__WBSFormDataController__matchesForControl_inDomain_matchingPartialString_autoFillDataType_preferredLabel_contact_allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier___block_invoke;
          v38[3] = &unk_1E4B39A80;
          v39 = v21;
          -[WBSFormDataController getSavedAccountMatchesWithCriteria:synchronously:completionHandler:](self, "getSavedAccountMatchesWithCriteria:synchronously:completionHandler:", v33, 1, v38);

        }
      }

    }
    v20 = v21;
LABEL_19:

    goto LABEL_20;
  }
  v20 = 0;
LABEL_20:

  return v20;
}

void __179__WBSFormDataController__matchesForControl_inDomain_matchingPartialString_autoFillDataType_preferredLabel_contact_allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WBSAddressBookMatch *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a2, "matchesForPasswordAutoFill", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    v6 = *MEMORY[0x1E0D89D48];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "user");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "safari_looksLikeEmailAddress") & 1) != 0)
        {
          objc_msgSend(v8, "savedAccount");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "credentialTypes");

          if ((unint64_t)(v11 - 2) < 2 || v11 == 1)
          {
            _WBSLocalizedString();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = 0;
          }
          v13 = *(void **)(a1 + 32);
          v14 = -[WBSAddressBookMatch initWithValue:property:key:identifier:label:]([WBSAddressBookMatch alloc], "initWithValue:property:key:identifier:label:", v9, v6, 0, 0, v12);
          objc_msgSend(v13, "addObject:", v14);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

- (id)cascadingAddressMatchesForMatch:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  char v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("City"));

  if ((v9 & 1) != 0
    || (objc_msgSend(v6, "key"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Street")),
        v10,
        (v11 & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFormDataController addAllAddressDataIfNecessary:contactLabel:contact:](self, "addAllAddressDataIfNecessary:contactLabel:contact:", v12, v13, v7);

    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__WBSFormDataController_cascadingAddressMatchesForMatch_contact___block_invoke;
    v18[3] = &unk_1E4B39AA8;
    v19 = v14;
    v20 = v9;
    v15 = v14;
    objc_msgSend(v12, "safari_filterObjectsUsingBlock:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

uint64_t __65__WBSFormDataController_cascadingAddressMatchesForMatch_contact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v3, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("City")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("State")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("ZIP")) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Country"));
      }

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)bestMatchForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  -[WBSFormDataController bestMatchForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "bestMatchForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, a5, a6, a7, 0, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bestMatchForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 contact:(id)a8 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a9
{
  void *v9;
  void *v10;
  uint64_t v12;

  LOBYTE(v12) = a9;
  -[WBSFormDataController _matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, a5, a6, a7, a8, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)continuingFieldsInFormControls:(id)a3 startingAtIndex:(unint64_t)a4 textFieldsOnly:(BOOL)a5 ignorePositioning:(BOOL)a6
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  WBSFormControlMetadata *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  WBSFormControlMetadata *v17;
  id v18;
  WBSFormControlMetadata *v19;
  void *v20;
  WBSFormControlMetadata *v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  WBSFormControlMetadata *v26;
  WBSFormControlMetadata *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  WBSFormControlMetadata *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  BOOL v42;
  WBSFormControlMetadata *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  BOOL v50;
  void *v51;
  char v52;
  WBSFormControlMetadata *v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double MinY;
  double v68;
  double MinX;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  uint64_t v82;
  id v84;
  _BOOL4 v85;
  double v86;
  CGFloat rect;
  id v88;
  id v89;
  WBSFormControlMetadata *v90;
  void *v91;
  unint64_t v92;
  void *v93;
  CGFloat v94;
  void *v95;
  CGFloat v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v85 = a5;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v88 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObject:", v8);

  v82 = *MEMORY[0x1E0D89D60];
  v9 = a4 + 1;
  v84 = v7;
  while (v9 < objc_msgSend(v7, "count"))
  {
    v92 = v9;
    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v85 && (objc_msgSend(v10, "isTextField") & 1) == 0)
      goto LABEL_68;
    v12 = v11;
    v13 = v88;
    if (!-[WBSFormControlMetadata isTextField](v12, "isTextField")
      && (-[WBSFormControlMetadata tagName](v12, "tagName"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "safari_isCaseInsensitiveEqualToString:", CFSTR("select")),
          v14,
          (v15 & 1) == 0)
      || (uniqueIDForAutoFillOfControl(v12, 7),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          !v16))
    {
LABEL_67:

LABEL_68:
      break;
    }
    v90 = v12;
    v91 = v11;
    v17 = v12;
    v89 = v13;
    v18 = v13;
    objc_msgSend(v18, "lastObject");
    v19 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
    -[WBSFormControlMetadata addressBookLabel](v19, "addressBookLabel");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFormControlMetadata addressBookLabel](v17, "addressBookLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v93;
    v22 = v20;
    v23 = v22;
    v95 = v22;
    if (!v21 || !v22)
      goto LABEL_20;
    if ((-[WBSFormControlMetadata isEqualToString:](v21, "isEqualToString:", v22) & 1) != 0)
    {
      v24 = 1;
      v25 = v95;
      v26 = v21;
LABEL_44:

      goto LABEL_45;
    }
    +[WBSFormToABBinder specifierForLabel:](WBSFormToABBinder, "specifierForLabel:", v21);
    v27 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
    v23 = v95;
    if (!v27)
      goto LABEL_20;
    +[WBSFormToABBinder specifierForLabel:](WBSFormToABBinder, "specifierForLabel:", v95);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
      goto LABEL_42;
    -[WBSFormControlMetadata property](v27, "property");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "property");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqualToString:", v30);

    if ((v31 & 1) == 0)
    {

      v23 = v95;
LABEL_20:

LABEL_21:
      if (fieldLooksLikeDateField(v19) && (fieldLooksLikeDateField(v17) & 1) != 0)
        goto LABEL_32;
      v35 = v17;
      v36 = v18;
      if ((unint64_t)objc_msgSend(v36, "count") <= 4)
      {
        objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addressBookLabel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        +[WBSFormToABBinder specifierForLabel:](WBSFormToABBinder, "specifierForLabel:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "property");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "isEqualToString:", v82);

        if ((v41 & 1) != 0)
        {
          v42 = fieldLooksLikeItExpectsDataOfSize(v35, 5);

          if (v42)
            goto LABEL_32;
          goto LABEL_29;
        }

      }
LABEL_29:
      v43 = v35;
      v44 = v36;
      if ((unint64_t)objc_msgSend(v44, "count") > 2)
        goto LABEL_34;
      objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addressBookLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      +[WBSFormToABBinder specifierForLabel:](WBSFormToABBinder, "specifierForLabel:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "component");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("ZIP"));

      if ((v49 & 1) == 0)
      {

LABEL_34:
LABEL_35:
        v26 = v43;
        v25 = v44;
        if ((unint64_t)objc_msgSend(v25, "count") > 3
          || (objc_msgSend(v25, "firstObject"),
              v51 = (void *)objc_claimAutoreleasedReturnValue(),
              v52 = objc_msgSend(v51, "looksLikeCreditCardNumberField"),
              v51,
              (v52 & 1) == 0)
          || -[WBSFormControlMetadata maxLength](v26, "maxLength") == 2)
        {
LABEL_38:
          v24 = 0;
          goto LABEL_44;
        }
        if (-[WBSFormControlMetadata looksLikeCreditCardNumberField](v26, "looksLikeCreditCardNumberField"))
        {
          v24 = 1;
          goto LABEL_44;
        }
        if (-[WBSFormControlMetadata looksLikeCreditCardSecurityCodeField](v26, "looksLikeCreditCardSecurityCodeField")
          || -[WBSFormControlMetadata looksLikeCreditCardCompositeExpirationDateField](v26, "looksLikeCreditCardCompositeExpirationDateField"))
        {
          goto LABEL_38;
        }
        objc_msgSend(v25, "lastObject");
        v27 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
        v24 = fieldLooksLikeItExpectsDataOfSize(v26, 6) && fieldLooksLikeItExpectsDataOfSize(v27, 6);
LABEL_43:

        goto LABEL_44;
      }
      v50 = fieldLooksLikeItExpectsDataOfSize(v43, 6);

      if (!v50)
        goto LABEL_35;
      goto LABEL_32;
    }
    -[WBSFormControlMetadata component](v27, "component");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "component");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v32, "length") || !objc_msgSend(v33, "length"))
    {

LABEL_42:
      v24 = 1;
      v25 = v95;
      v26 = v21;
      goto LABEL_43;
    }
    v34 = objc_msgSend(v32, "isEqualToString:", v33);

    if ((v34 & 1) == 0)
      goto LABEL_21;
LABEL_32:
    v24 = 1;
LABEL_45:

    if (!v24 || a6)
    {

      v7 = v84;
      v11 = v91;
      if (!v24)
        goto LABEL_68;
    }
    else
    {
      v7 = v84;
      objc_msgSend(v18, "lastObject");
      v53 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
      v13 = v89;
      v12 = v90;
      v54 = elementBounds(v53);
      v94 = v56;
      v96 = v55;
      v57 = v54;
      v59 = v58;

      v11 = v91;
      v60 = elementBounds(v17);
      rect = v61;
      v62 = v60;
      v64 = v63;
      v66 = v65;
      v97.origin.x = v57;
      v97.origin.y = v59;
      v97.size.height = v94;
      v97.size.width = v96;
      MinY = CGRectGetMinY(v97);
      v98.origin.x = v62;
      v98.origin.y = v64;
      v98.size.width = v66;
      v98.size.height = rect;
      if (vabdd_f64(MinY, CGRectGetMinY(v98)) > 3.0)
        goto LABEL_67;
      v86 = v57;
      v99.origin.x = v57;
      v68 = v59;
      v99.origin.y = v59;
      v99.size.height = v94;
      v99.size.width = v96;
      MinX = CGRectGetMinX(v99);
      v100.origin.x = v62;
      v100.origin.y = v64;
      v100.size.width = v66;
      v100.size.height = rect;
      v70 = CGRectGetMinX(v100);
      v71 = v86;
      if (MinX >= v70)
      {
        v72 = v59;
      }
      else
      {
        v71 = v62;
        v72 = v64;
      }
      v74 = v94;
      v73 = v96;
      if (MinX < v70)
      {
        v73 = v66;
        v74 = rect;
      }
      v75 = CGRectGetMinX(*(CGRect *)&v71);
      v76 = v86;
      if (MinX < v70)
      {
        v77 = v68;
      }
      else
      {
        v76 = v62;
        v77 = v64;
      }
      v79 = v94;
      v78 = v96;
      if (MinX >= v70)
      {
        v78 = v66;
        v79 = rect;
      }
      v80 = v75 - CGRectGetMaxX(*(CGRect *)&v76);

      if (v80 > 60.0)
        goto LABEL_68;
    }
    objc_msgSend(v18, "addObject:", v17);

    v9 = v92 + 1;
  }

  return v88;
}

+ (BOOL)canAutocompleteTextField:(id)a3 inForm:(id)a4
{
  id v5;
  id v6;
  int v7;
  unint64_t v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isSecureTextField") & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v8 = objc_msgSend(v6, "type");
    LOBYTE(v7) = 0;
    if (v8 <= 5 && ((1 << v8) & 0x3A) != 0)
      v7 = objc_msgSend(v5, "disallowsAutocomplete") ^ 1;
  }

  return v7;
}

+ (int64_t)availableManualAutoFillActionForTextField:(id)a3 form:(id)a4 outUsernameElementUniqueID:(id *)a5 outPasswordElementUniqueID:(id *)a6 outConfirmPasswordElementUniqueID:(id *)a7
{
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int64_t v20;
  void *v22;
  void *v23;
  int v24;
  void *v26;
  void *v27;

  v11 = a3;
  v12 = a4;
  v27 = v11;
  v13 = objc_msgSend(v11, "isSecureTextField");
  if (v13)
    objc_msgSend(v11, "uniqueID");
  else
    objc_msgSend(v12, "passwordElementUniqueID");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userNameElementUniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)v14;
  objc_msgSend(v12, "passwordElementUniqueID", a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToString:", v17);

  if (v18)
  {
    objc_msgSend(v12, "confirmPasswordElementUniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_6;
  }
  else
  {
    v19 = 0;
    if (!v13)
    {
LABEL_6:
      v20 = 0;
      if (!a6)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  objc_msgSend(v26, "valueOfControlWithUniqueID:inForm:", v16, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
  {
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v26, "_metadataForControlWithUniqueID:inForm:", v16, v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isAutoFilledTextField");

      v20 = v24 ^ 1u;
    }
    else
    {
      v20 = 1;
    }
  }
  else
  {
    v20 = 2;
  }

  if (a6)
LABEL_7:
    *a6 = objc_retainAutorelease(v16);
LABEL_8:
  if (a5)
    *a5 = objc_retainAutorelease(v15);
  if (a7)
    *a7 = objc_retainAutorelease(v19);

  return v20;
}

- (BOOL)shouldForceUSLocaleForAutoFillFillingTest
{
  return 0;
}

- (void)addAllAddressDataIfNecessary:(id)a3 contactLabel:(id)a4 contact:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  const __CFString *obj;
  id obja;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[7];

  v51[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a4;
  v35 = a5;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  v10 = v8;
  if (v9)
  {
    v11 = *(_QWORD *)v45;
    obj = CFSTR("th");
    v12 = *MEMORY[0x1E0D89D38];
    v13 = 1;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v15, "stringValue", obj);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v16, "safari_bestLanguageTag");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v16) = objc_msgSend(v17, "isEqualToString:", obj);
        objc_msgSend(v15, "property");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v12);

        v13 &= v16 ^ 1;
        if ((v19 & 1) != 0)
        {

          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          if (v13)
            v20 = CFSTR("City");
          else
            v20 = CFSTR("State");
          v51[0] = CFSTR("Street");
          v51[1] = v20;
          if (v13)
            v21 = CFSTR("State");
          else
            v21 = CFSTR("City");
          v51[2] = v21;
          v51[3] = CFSTR("ZIP");
          v51[4] = CFSTR("Country");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          if (v22)
          {
            obja = v10;
            v23 = 0;
            v24 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v41 != v24)
                  objc_enumerationMutation(obja);
                -[WBSFormDataController addressBookMatchesForProperty:key:label:partialString:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "addressBookMatchesForProperty:key:label:partialString:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v12, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j), v34, 0, v35, 1, obja);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                v38 = 0u;
                v39 = 0u;
                v36 = 0u;
                v37 = 0u;
                v23 = v26;
                v27 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                if (v27)
                {
                  v28 = *(_QWORD *)v37;
                  do
                  {
                    for (k = 0; k != v27; ++k)
                    {
                      if (*(_QWORD *)v37 != v28)
                        objc_enumerationMutation(v23);
                      v30 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k);
                      if ((objc_msgSend(v8, "containsObject:", v30) & 1) == 0)
                        objc_msgSend(v8, "addObject:", v30);
                    }
                    v27 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                  }
                  while (v27);
                }

              }
              v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
            }
            while (v22);

            v10 = obja;
          }
          goto LABEL_33;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v9)
        continue;
      break;
    }
    v10 = v8;
  }
LABEL_33:

}

- (id)_singleFieldPhoneNumberCandidates:(id)a3
{
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;

  v3 = (NSString *)a3;
  v4 = (void *)objc_opt_new();
  phoneNumberWithoutFormatting(v3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  unprefixedPhoneNumber(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "addObject:", v6);

  if (-[NSString hasPrefix:](v5, "hasPrefix:", CFSTR("+")))
  {
    -[NSString substringFromIndex:](v5, "substringFromIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  else
  {
    objc_msgSend(v4, "addObject:", v5);
  }

  return v4;
}

- (id)_phoneNumberCandidates:(id)a3 fillingMultipleFields:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  {
    v7 = -[WBSFormDataController _phoneNumberCandidates:fillingMultipleFields:]::extensionMarkers;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("xp-,"));
    v7 = objc_claimAutoreleasedReturnValue();
    -[WBSFormDataController _phoneNumberCandidates:fillingMultipleFields:]::extensionMarkers = v7;
  }
  v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:", v7, 4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
    if (v4)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(v6, "substringToIndex:", v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      phoneNumberWithoutFormatting((NSString *)v6);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      unprefixedPhoneNumber(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

      if (v9)
      {
        phoneNumberWithoutFormatting(v9);
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        unprefixedPhoneNumber(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

LABEL_10:
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  -[WBSFormDataController _singleFieldPhoneNumberCandidates:](self, "_singleFieldPhoneNumberCandidates:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[WBSFormDataController _singleFieldPhoneNumberCandidates:](self, "_singleFieldPhoneNumberCandidates:", v9);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v13);
    goto LABEL_10;
  }
LABEL_11:

  return v10;
}

- (void)_fillPhoneNumber:(id)a3 intoValues:(id)a4 controls:(id)a5 formTextSample:(id)a6 multiRoundAutoFillManager:(id)a7
{
  NSMutableDictionary *v12;
  id v13;
  int IsChinese;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSString *v21;
  WBSFormControlMetadata *v22;
  BOOL v23;
  NSMutableDictionary *v24;
  NSString *v25;
  NSString *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  WBSFormControlMetadata *v32;
  NSString *v33;
  WBSFormControlMetadata *v34;
  NSMutableDictionary *v35;
  NSString *v36;
  id v37;
  NSString *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  BOOL v53;
  NSString *v54;
  WBSFormControlMetadata *v55;
  NSString *v56;
  WBSFormControlMetadata *v57;
  NSString *v58;
  WBSFormControlMetadata *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  NSString *v64;
  id v65;
  NSString *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v66 = (NSString *)a3;
  v12 = (NSMutableDictionary *)a4;
  v13 = a5;
  v64 = (NSString *)a6;
  v65 = a7;
  IsChinese = languageOfTextIsChinese(v64);
  if (IsChinese)
  {
    phoneNumberWithoutFormatting(v66);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WBSFormDataController _phoneNumberCandidates:fillingMultipleFields:](self, "_phoneNumberCandidates:fillingMultipleFields:", v66, (unint64_t)objc_msgSend(v13, "count") > 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (!v18)
    goto LABEL_33;
  v19 = *(_QWORD *)v68;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v68 != v19)
        objc_enumerationMutation(v17);
      v21 = *(NSString **)(*((_QWORD *)&v67 + 1) + 8 * i);
      if (objc_msgSend(v13, "count") == 1)
      {
        objc_msgSend(v13, "objectAtIndex:", 0);
        v22 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
        v23 = fillSingleFieldValue(v12, v21, v22);

        if (v23)
          goto LABEL_33;
      }
      if ((unint64_t)objc_msgSend(v13, "count") >= 2 && valueFitsInFields(v21, v13))
      {
        if (IsChinese)
        {
          v24 = v12;
          v25 = v21;
          v61 = v13;
          v26 = v25;
          if (-[NSString hasPrefix:](v26, "hasPrefix:", CFSTR("1"))
            && !-[NSString hasPrefix:](v26, "hasPrefix:", CFSTR("10")))
          {

          }
          else
          {

            objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "maxLength");

            if (v28 < 8)
              v29 = 7;
            else
              v29 = 8;
            v30 = -[NSString length](v26, "length") - v29;
            if (v30 > 1)
            {
              -[NSString substringWithRange:](v26, "substringWithRange:", 0, v30);
              v31 = (NSString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
              v32 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
              recordValueForTextField(v24, v31, v32);

              -[NSString substringWithRange:](v26, "substringWithRange:", v30, v29);
              v33 = (NSString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
              v34 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
              recordValueForTextField(v24, v33, v34);
              goto LABEL_24;
            }
          }

        }
        v35 = v12;
        v36 = v21;
        v37 = v13;
        v38 = v36;
        v39 = v37;
        if (objc_msgSend(v39, "count") != 3 && objc_msgSend(v39, "count") != 4)
          goto LABEL_31;
        if (-[NSString length](v38, "length") < 0xA)
          goto LABEL_31;
        objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v40, "maxLength");

        objc_msgSend(v39, "objectAtIndexedSubscript:", 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v41, "maxLength");

        objc_msgSend(v39, "objectAtIndexedSubscript:", 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "maxLength");

        if (v62 < 3)
          goto LABEL_31;
        if (v60 >= 3
          && v43 >= 4
          && (-[NSString length](v38, "length") < 0xB
           || objc_msgSend(v39, "count") == 4
           && (objc_msgSend(v39, "objectAtIndexedSubscript:", 3),
               v44 = (void *)objc_claimAutoreleasedReturnValue(),
               v45 = objc_msgSend(v44, "maxLength"),
               v44,
               v45 >= 1)
           && v45 >= -[NSString length](v38, "length") - 10))
        {
          if (v62 == 3 && v60 == 3 && v43 == 4)
          {

LABEL_55:
            -[NSString substringWithRange:](v38, "substringWithRange:", 0, 3);
            v54 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndex:", 0);
            v55 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
            recordValueForTextField(v35, v54, v55);

            -[NSString substringWithRange:](v38, "substringWithRange:", 3, 3);
            v56 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndex:", 1);
            v57 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
            recordValueForTextField(v35, v56, v57);

            -[NSString substringWithRange:](v38, "substringWithRange:", 6, 4);
            v58 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndex:", 2);
            v59 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
            recordValueForTextField(v35, v58, v59);

            if (objc_msgSend(v39, "count") != 4 || -[NSString length](v38, "length") < 0xB)
              goto LABEL_25;
            -[NSString substringFromIndex:](v38, "substringFromIndex:", 10);
            v33 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndex:", 3);
            v34 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
            recordValueForTextField(v35, v33, v34);
LABEL_24:

LABEL_25:
            goto LABEL_33;
          }
          objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v46, "size");

          objc_msgSend(v39, "objectAtIndexedSubscript:", 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "size");

          objc_msgSend(v39, "objectAtIndexedSubscript:", 2);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "size");

          v53 = v63 == 3 && v48 == 3 && v50 == 4;
          if (v53)
            goto LABEL_55;
        }
        else
        {
LABEL_31:

        }
        fillMultiFieldValue(v35, v38, v39, v65);
        goto LABEL_33;
      }
    }
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v18)
      continue;
    break;
  }
LABEL_33:

}

- (unint64_t)addValuesForStandardFormControlsInForm:(id)a3 startingAtIndex:(unint64_t)a4 fromAutoFillItem:(id)a5 toDictionary:(id)a6 multiRoundAutoFillManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "controls");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textSample");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WBSFormDataController addValuesForStandardFormControls:startingAtIndex:fromAutoFillItem:toDictionary:formTextSample:multiRoundAutoFillManager:](self, "addValuesForStandardFormControls:startingAtIndex:fromAutoFillItem:toDictionary:formTextSample:multiRoundAutoFillManager:", v16, a4, v13, v14, v17, v15);

  return v18;
}

- (unint64_t)addValuesForStandardFormControls:(id)a3 startingAtIndex:(unint64_t)a4 fromAutoFillItem:(id)a5 toDictionary:(id)a6 formTextSample:(id)a7 multiRoundAutoFillManager:(id)a8
{
  id v14;
  id v15;
  NSMutableDictionary *v16;
  WBSFormControlMetadata *v17;
  unsigned __int8 isKindOfClass;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  unint64_t v23;
  _BOOL4 v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  char v29;
  int v30;
  uint64_t IsChinese;
  NSArray *v32;
  id v33;
  NSArray *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  NSString *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  int v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSMutableDictionary *v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  NSString *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = (NSMutableDictionary *)a6;
  v70 = (NSString *)a7;
  v69 = a8;
  if (v15)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
    v17 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v19 = v15;
    else
      v19 = 0;
    v66 = v19;
    -[WBSFormControlMetadata selectElementInfo](v17, "selectElementInfo");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v15, "property");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D89D40]);

      if (v21)
      {
        objc_msgSend(v15, "dateValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = fillDateUsingClassification(v16, v14, a4, v22);

LABEL_57:
        goto LABEL_58;
      }
    }
    -[WBSFormControlMetadata tagName](v17, "tagName");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WBSFormControlMetadata isTextField](v17, "isTextField");
    if ((objc_msgSend(v67, "safari_isCaseInsensitiveEqualToString:", CFSTR("input")) & v24) == 1)
    {
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v15, "property");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D89D60]);

        if ((v26 & 1) != 0)
          goto LABEL_25;
        objc_msgSend(v15, "property");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = *MEMORY[0x1E0D89D38];
        if ((objc_msgSend(v27, "isEqualToString:") & 1) != 0)
        {
          objc_msgSend(v15, "key");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("ZIP"));

          if ((v29 & 1) != 0)
          {
            v30 = 1;
LABEL_26:
            +[WBSFormDataController continuingFieldsInFormControls:startingAtIndex:textFieldsOnly:ignorePositioning:](WBSFormDataController, "continuingFieldsInFormControls:startingAtIndex:textFieldsOnly:ignorePositioning:", v14, a4, 1, 0);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              objc_msgSend(v15, "stringValue");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[WBSFormDataController _fillPhoneNumber:intoValues:controls:formTextSample:multiRoundAutoFillManager:](self, "_fillPhoneNumber:intoValues:controls:formTextSample:multiRoundAutoFillManager:", v42, v16, v41, v70, v69);
            }
            else
            {
              objc_msgSend(v15, "stringValue");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
                fillPostCode(v16, v42, v41, v69);
              else
                fillInstantMessageUsername(v16, v42, v41);
            }

            v23 = objc_msgSend(v41, "count");
            goto LABEL_56;
          }
        }
        else
        {

        }
        objc_msgSend(v15, "property");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0D89D50]);

        if (v40)
        {
LABEL_25:
          v30 = 0;
          goto LABEL_26;
        }
        objc_msgSend(v15, "property");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v43, "isEqualToString:", v64) & 1) != 0)
        {
          objc_msgSend(v15, "key");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("Street"));

          if (v45)
          {
            objc_msgSend(v15, "stringValue");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = v16;
            v65 = v46;
            v63 = v69;
            +[WBSFormDataController continuingFieldsInFormControls:startingAtIndex:textFieldsOnly:ignorePositioning:](WBSFormDataController, "continuingFieldsInFormControls:startingAtIndex:textFieldsOnly:ignorePositioning:", v14, a4, 1, 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v47, "count") == 1)
            {
              objc_msgSend(v47, "objectAtIndex:", 0);
              v71 = 0u;
              v72 = 0u;
              v73 = 0u;
              v74 = 0u;
              v61 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "autocompleteTokens");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
              if (v49)
              {
                v50 = *(_QWORD *)v72;
                while (2)
                {
                  for (i = 0; i != v49; ++i)
                  {
                    if (*(_QWORD *)v72 != v50)
                      objc_enumerationMutation(v48);
                    v52 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("street-address")) & 1) != 0)
                    {
                      v55 = 4;
                      goto LABEL_72;
                    }
                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("address-line1")) & 1) != 0)
                      goto LABEL_67;
                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("address-line2")) & 1) != 0)
                    {
LABEL_64:
                      v55 = 1;
                      goto LABEL_72;
                    }
                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("address-line3")) & 1) != 0
                      || (objc_msgSend(v52, "isEqualToString:", CFSTR("address-level1")) & 1) != 0)
                    {
                      v55 = 2;
                      goto LABEL_72;
                    }
                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("address-level2")) & 1) != 0)
                      goto LABEL_64;
                  }
                  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
                  if (v49)
                    continue;
                  break;
                }
              }

              objc_msgSend(v61, "fieldName");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v48, "rangeOfString:", CFSTR("1"));
              v54 = objc_msgSend(v48, "rangeOfString:", CFSTR("2"));
              if (v53 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (v54 == 0x7FFFFFFFFFFFFFFFLL)
                  v55 = 4;
                else
                  v55 = 3;
              }
              else if (v54 == 0x7FFFFFFFFFFFFFFFLL)
              {
LABEL_67:
                v55 = 0;
              }
              else if (v53 >= v54)
              {
                v55 = 3;
              }
              else
              {
                v55 = 0;
              }
LABEL_72:

              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, v55, v61, v63);
              goto LABEL_73;
            }
            if (objc_msgSend(v47, "count") == 2)
            {
              objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 0, v57, v63);

              objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 3, v58, v63);
            }
            else
            {
              if ((unint64_t)objc_msgSend(v47, "count") < 3)
              {
LABEL_73:
                v23 = objc_msgSend(v47, "count");

                goto LABEL_56;
              }
              objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 0, v59, v63);

              objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 1, v60, v63);

              objc_msgSend(v47, "objectAtIndexedSubscript:", 2);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 2, v58, v63);
            }

            goto LABEL_73;
          }
        }
        else
        {

        }
      }
      objc_msgSend(v15, "completion");
      v38 = (NSString *)objc_claimAutoreleasedReturnValue();
      recordValueForTextField(v16, v38, v17);
    }
    else
    {
      if ((isKindOfClass & (v68 != 0)) == 1)
      {
        IsChinese = languageOfTextIsChinese(v70);
        v32 = v68;
        v33 = v66;
        +[WBSFormToABBinder allSynonymsForMatch:formAppearsToBeChinese:](WBSFormToABBinder, "allSynonymsForMatch:formAppearsToBeChinese:", v33, IsChinese);
        v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          v35 = (void *)MEMORY[0x1E0C99D20];
          objc_msgSend(v33, "stringValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "arrayWithObject:", v36);
          v34 = (NSArray *)objc_claimAutoreleasedReturnValue();

        }
        v37 = indexOfItemInSelectElement(v32, v34);

        if (v37 != 0x7FFFFFFFFFFFFFFFLL)
          recordIndexForSelectElement(v16, v37, v17);
        goto LABEL_55;
      }
      if ((isKindOfClass & 1) == 0
        || !objc_msgSend(v67, "safari_isCaseInsensitiveEqualToString:", CFSTR("textarea")))
      {
LABEL_55:
        v23 = 1;
LABEL_56:

        goto LABEL_57;
      }
      objc_msgSend(v15, "completion");
      v38 = (NSString *)objc_claimAutoreleasedReturnValue();
      recordValueForTextarea(v16, v38, v17);
    }

    goto LABEL_55;
  }
  v23 = 0;
LABEL_58:

  return v23;
}

+ (BOOL)textFieldLooksLikeCreditCardFormField:(id)a3 inForm:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "formContainsCreditCardNumberOrCardSecurityCodeField:", v7) & 1) != 0)
  {
    if ((objc_msgSend(v6, "looksLikeCreditCardCardholderField") & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(a1, "textFieldLooksLikeCreditCardNumericFormField:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)textFieldLooksLikeCreditCardNumericFormField:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "looksLikeCreditCardNumberField") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "looksLikeCreditCardSecurityCodeField");

  return v4;
}

- (void)getFormFieldValues:(id *)a3 andFieldToFocus:(id *)a4 andCreditCardDataTypesThatWillBeFilled:(id *)a5 forCreditCardForm:(id)a6 fromCreditCardData:(id)a7
{
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSString *v20;
  WBSFormControlMetadata *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  NSString *v46;
  void *v47;
  NSString *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  WBSFormControlMetadata *v58;
  id v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSString *v67;
  uint64_t v68;
  uint64_t v69;
  id *v70;
  void *v71;
  id v72;
  id *v73;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  unint64_t v81;
  void *v82;
  void *v83;
  WBSFormControlMetadata *v84;
  unint64_t v85;
  id v86;
  id v87;
  NSMutableDictionary *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v73 = a3;
  v104 = *MEMORY[0x1E0C80C00];
  v76 = a6;
  v86 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v88 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v87 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "controls");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v82, "count");
  if (!v8)
  {
    v11 = 0;
    v10 = 0;
    *v73 = objc_retainAutorelease(v88);
    v70 = a4;
    if (!a4)
      goto LABEL_80;
    goto LABEL_78;
  }
  v81 = v8;
  v9 = 0;
  v77 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v78 = 0x7FFFFFFFFFFFFFFFLL;
  v79 = 0;
  do
  {
    v85 = v12;
    objc_msgSend(v82, "objectAtIndexedSubscript:", v73);
    v84 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
    uniqueIDForAutoFillOfControl(v84, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
    {
      -[WBSFormControlMetadata classification](v84, "classification");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v9 & 1) != 0 || !objc_msgSend(v83, "isEqualToString:", CFSTR("cc-name")))
      {
        if ((v79 & 0x100000000) != 0 || !objc_msgSend(v83, "isEqualToString:", CFSTR("cc-number")))
        {
          if ((v79 & 1) != 0 || !objc_msgSend(v83, "isEqualToString:", CFSTR("cc-exp")))
          {
            if ((v77 & 0x100000000) != 0 || !objc_msgSend(v83, "isEqualToString:", CFSTR("cc-csc")))
            {
              if ((v77 & 1) != 0 || !objc_msgSend(v83, "isEqualToString:", CFSTR("cc-type")))
              {
                if (v78 == 0x7FFFFFFFFFFFFFFFLL && ((v9 | HIDWORD(v79)) & 1) != 0)
                {
                  if (!-[WBSFormControlMetadata isTextField](v84, "isTextField")
                    || (-[WBSFormControlMetadata value](v84, "value"),
                        v51 = (void *)objc_claimAutoreleasedReturnValue(),
                        v52 = objc_msgSend(v51, "length") == 0,
                        v51,
                        v52))
                  {
                    v53 = v85;
                  }
                  else
                  {
                    v53 = 0x7FFFFFFFFFFFFFFFLL;
                  }
                  v78 = v53;
                }
              }
              else
              {
                objc_msgSend(v86, "cardNumber");
                v48 = (NSString *)objc_claimAutoreleasedReturnValue();
                v49 = fillCreditCardType(v88, v84, v48);

                if (v49)
                {
                  -[WBSFormControlMetadata uniqueID](v84, "uniqueID");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  recordTypeForFieldIfFilled(v88, v87, v50, 4);

                  LOBYTE(v77) = 1;
                }
                else
                {
                  LOBYTE(v77) = 0;
                }
              }
            }
            else
            {
              objc_msgSend(v86, "cardSecurityCode");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "length") == 0;

              if (!v45)
              {
                objc_msgSend(v86, "cardSecurityCode");
                v46 = (NSString *)objc_claimAutoreleasedReturnValue();
                recordValueForTextField(v88, v46, v84);

                -[WBSFormControlMetadata uniqueID](v84, "uniqueID");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                recordTypeForFieldIfFilled(v88, v87, v47, 1);

              }
              BYTE4(v77) = 1;
            }
          }
          else
          {
            allControlsContinuationStartingAtIndex(v82, v85);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "expirationDate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v35 == 0;

            if (!v36)
            {
              objc_msgSend(v86, "expirationDate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              fillDateUsingClassification(v88, v34, 0, v37);

              v91 = 0u;
              v92 = 0u;
              v89 = 0u;
              v90 = 0u;
              v38 = v34;
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
              if (v39)
              {
                v40 = *(_QWORD *)v90;
                do
                {
                  for (i = 0; i != v39; ++i)
                  {
                    if (*(_QWORD *)v90 != v40)
                      objc_enumerationMutation(v38);
                    objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "uniqueID");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    recordTypeForFieldIfFilled(v88, v87, v42, 2);

                  }
                  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
                }
                while (v39);
              }

            }
            v43 = objc_msgSend(v34, "count");

            v85 = v85 + v43 - 1;
            LOBYTE(v79) = 1;
          }
        }
        else
        {
          allControlsContinuationStartingAtIndex(v82, v85);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "cardNumber");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = valueFitsInFields(v25, v24);

          if (v26)
          {
            objc_msgSend(v86, "cardNumber");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            fillMultiFieldValue(v88, v27, v24, 0);

            v95 = 0u;
            v96 = 0u;
            v93 = 0u;
            v94 = 0u;
            v28 = v24;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
            if (v29)
            {
              v30 = *(_QWORD *)v94;
              do
              {
                for (j = 0; j != v29; ++j)
                {
                  if (*(_QWORD *)v94 != v30)
                    objc_enumerationMutation(v28);
                  objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * j), "uniqueID");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  recordTypeForFieldIfFilled(v88, v87, v32, 0);

                }
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
              }
              while (v29);
            }

          }
          v33 = objc_msgSend(v24, "count");

          v85 = v85 + v33 - 1;
          HIDWORD(v79) = 1;
        }
      }
      else
      {
        allControlsContinuationStartingAtIndex(v82, v85);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "cardholderName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length") == 0;

        if (v16)
        {
          v68 = v78;
          if (v78 == 0x7FFFFFFFFFFFFFFFLL)
            v68 = v85;
          v78 = v68;
        }
        else if (objc_msgSend(v80, "count") == 1
               && (objc_msgSend(v80, "firstObject"),
                   v17 = (void *)objc_claimAutoreleasedReturnValue(),
                   objc_msgSend(v17, "orderedParts"),
                   v18 = (void *)objc_claimAutoreleasedReturnValue(),
                   v19 = objc_msgSend(v18, "count") == 3,
                   v18,
                   v17,
                   v19))
        {
          objc_msgSend(v86, "cardholderName");
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "firstObject");
          v21 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
          recordValueForTextField(v88, v20, v21);

          objc_msgSend(v80, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "uniqueID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          recordTypeForFieldIfFilled(v88, v87, v23, 3);

        }
        else
        {
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v54 = v80;
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
          if (v55)
          {
            v56 = *(_QWORD *)v98;
            do
            {
              for (k = 0; k != v55; ++k)
              {
                if (*(_QWORD *)v98 != v56)
                  objc_enumerationMutation(v54);
                v58 = *(WBSFormControlMetadata **)(*((_QWORD *)&v97 + 1) + 8 * k);
                if (!v10 || !v11)
                {
                  v59 = objc_alloc_init(MEMORY[0x1E0CB3858]);

                  objc_msgSend(v59, "setStyle:", 3);
                  objc_msgSend(v86, "cardholderName");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "personNameComponentsFromString:", v60);
                  v61 = objc_claimAutoreleasedReturnValue();

                  v11 = (void *)v61;
                  v10 = v59;
                }
                v62 = objc_alloc_init(MEMORY[0x1E0CB3850]);
                -[WBSFormControlMetadata orderedParts](v58, "orderedParts");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v63, "containsObject:", CFSTR("cc-given-name")))
                {
                  objc_msgSend(v11, "givenName");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "setGivenName:", v64);

                }
                if (objc_msgSend(v63, "containsObject:", CFSTR("cc-additional-name")))
                {
                  objc_msgSend(v11, "middleName");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "setMiddleName:", v65);

                }
                if (objc_msgSend(v63, "containsObject:", CFSTR("cc-family-name")))
                {
                  objc_msgSend(v11, "familyName");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "setFamilyName:", v66);

                }
                objc_msgSend(v10, "stringFromPersonNameComponents:", v62);
                v67 = (NSString *)objc_claimAutoreleasedReturnValue();
                recordValueForTextField(v88, v67, v58);

              }
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
            }
            while (v55);
          }

        }
        v69 = objc_msgSend(v80, "count");

        v85 = v85 + v69 - 1;
        v9 = 1;
      }

    }
    v12 = v85 + 1;
  }
  while (v85 + 1 < v81);
  *v73 = objc_retainAutorelease(v88);
  if (a4)
  {
    if (v78 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v70 = a4;
LABEL_78:
      *v70 = 0;
      goto LABEL_80;
    }
    objc_msgSend(v82, "objectAtIndexedSubscript:");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "uniqueID");
    v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v72;

  }
LABEL_80:
  if (a5)
    *a5 = objc_retainAutorelease(v87);

}

- (unint64_t)_indexForControlWithUniqueID:(id)a3 inForm:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  objc_msgSend(a4, "controls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v5);

      if ((v11 & 1) != 0)
        break;
      if (v7 == ++v8)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)_nextFieldToFocusAfterFillingFieldAtIndex:(unint64_t)a3 inForm:(id)a4
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a4, "controls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = a3 + 1;
  if (a3 + 1 >= v6)
  {
LABEL_4:
    v11 = 0;
  }
  else
  {
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (!v10)
        break;

      if (v6 == ++v7)
        goto LABEL_4;
    }
    objc_msgSend(v8, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)getFormFieldValues:(id *)a3 andFieldToFocus:(id *)a4 withSingleCreditCardData:(id)a5 inField:(id)a6 inForm:(id)a7
{
  id v12;
  WBSFormControlMetadata *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSString *v27;
  uint64_t v28;
  NSMutableDictionary *v29;
  BOOL v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  __CFString *v35;
  uint64_t v36;
  __CFString *v37;
  void *v38;
  NSString *v39;
  uint64_t v40;
  uint64_t v41;
  NSString *v42;
  NSObject *v43;
  uint64_t v44;
  NSString *v45;
  __CFString *v46;
  unint64_t v47;
  void *v48;
  NSString *v49;
  NSString *v50;
  id v51;
  __CFString *v52;
  id v53;
  id v54;
  WBSFormControlMetadata *v55;
  WBSFormControlMetadata *v56;
  id v57;
  void *v58;
  NSMutableDictionary *v59;
  id v60;
  id v61;
  void *v62;
  NSMutableDictionary *v63;
  void *v64;
  id v65;
  id v66;
  id v67[4];

  v67[2] = *(id *)MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = (WBSFormControlMetadata *)a6;
  v14 = a7;
  objc_msgSend(v14, "controls");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormControlMetadata uniqueID](v13, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WBSFormDataController _indexForControlWithUniqueID:inForm:](self, "_indexForControlWithUniqueID:inForm:", v16, v14);

  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3)
      *a3 = (id)MEMORY[0x1E0C9AA70];
    if (a4)
      *a4 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v63 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v12, "type"))
  {
    case 0:
      v18 = v64;
      objc_msgSend((id)objc_opt_class(), "continuingFieldsInFormControls:startingAtIndex:textFieldsOnly:ignorePositioning:", v15, v17, 1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (valueFitsInFields(v18, v19))
        fillMultiFieldValue(v63, v18, v19, 0);
      v17 = v17 + objc_msgSend(v19, "count") - 1;

      goto LABEL_23;
    case 1:
    case 3:
      v20 = v63;
      recordValueForTextField(v63, (NSString *)v64, v13);
      goto LABEL_24;
    case 2:
      v57 = v64;
      WBSLocaleForCreditCardExpirationDate();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v63;
      v22 = v15;
      v61 = v57;
      v60 = v21;
      v58 = v22;
      +[WBSFormDataController continuingFieldsInFormControls:startingAtIndex:textFieldsOnly:ignorePositioning:](WBSFormDataController, "continuingFieldsInFormControls:startingAtIndex:textFieldsOnly:ignorePositioning:", v22, v17, 0, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v62, "count") >= 4)
      {
        v23 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[WBSFormDataController getFormFieldValues:andFieldToFocus:withSingleCreditCardData:inField:inForm:].cold.1((uint64_t)v67, objc_msgSend(v62, "count"), v23);

        goto LABEL_21;
      }
      if (!v61)
      {
LABEL_21:
        v28 = objc_msgSend(v62, "count");
        goto LABEL_22;
      }
      if (objc_msgSend(v62, "count") == 1)
      {
        objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
        v55 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
        if (-[WBSFormControlMetadata isTextField](v55, "isTextField"))
        {
          v53 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          -[WBSFormControlMetadata requiredFormatForDateTimeInput](v55, "requiredFormatForDateTimeInput");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "length");

          if (v25)
          {
            -[WBSFormControlMetadata requiredFormatForDateTimeInput](v55, "requiredFormatForDateTimeInput");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setDateFormat:", v26);

            objc_msgSend(v53, "stringFromDate:", v61);
            v27 = (NSString *)objc_claimAutoreleasedReturnValue();
            recordValueForTextField(v59, v27, v55);

          }
          else
          {
            v47 = -[WBSFormControlMetadata maxLength](v55, "maxLength");
            -[WBSFormControlMetadata placeholder](v55, "placeholder");
            v34 = (NSString *)objc_claimAutoreleasedReturnValue();
            canonicalizedDateTemplate(v34);
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v46 = v35;
            v36 = -[__CFString length](v35, "length");
            v37 = CFSTR("MMyy");
            if (v36)
              v37 = v35;
            v52 = v37;
            objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setDateFormat:");
            objc_msgSend(v53, "stringFromDate:", v61);
            v49 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (-[NSString length](v49, "length") <= v47)
            {
              v42 = v49;
            }
            else
            {

              objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v53, "setDateFormat:", v38);
              objc_msgSend(v53, "stringFromDate:", v61);
              v39 = (NSString *)objc_claimAutoreleasedReturnValue();

              if (-[NSString length](v39, "length") <= v47)
              {
                v52 = CFSTR("MMyy");
                v48 = v38;
                v42 = v39;
              }
              else
              {
                v45 = v39;
                objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:");
                v40 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v53, "setDateFormat:", v40);
                objc_msgSend(v53, "stringFromDate:", v61);
                v41 = objc_claimAutoreleasedReturnValue();

                v52 = CFSTR("Myy");
                v48 = (void *)v40;
                v42 = (NSString *)v41;
              }
            }
            v50 = v42;
            if (-[NSString length](v42, "length") <= v47)
            {
              recordValueForTextField(v59, v50, v55);
            }
            else
            {
              v43 = WBS_LOG_CHANNEL_PREFIXAutoFill();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                -[WBSFormDataController getFormFieldValues:andFieldToFocus:withSingleCreditCardData:inField:inForm:].cold.2(v47, v43, v44);
            }

          }
        }
        else
        {
          v31 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[WBSFormDataController getFormFieldValues:andFieldToFocus:withSingleCreditCardData:inField:inForm:].cold.3(v31, v32, v33);
        }

        v28 = 1;
      }
      else
      {
        v66 = 0;
        v67[0] = 0;
        v65 = 0;
        v30 = identifyDateFields(v62, v67, &v66, &v65);
        v56 = (WBSFormControlMetadata *)v67[0];
        v54 = v66;
        v51 = v65;
        if (v30 && (!v56 || v54))
        {
          if (v56)
            recordValueForDateField(v59, 0, v61, v56);
          if (v54)
            recordValueForDateField(v59, 1, v61, v54);
          if (v51)
            recordValueForDateField(v59, 2, v61, v51);
        }
        v28 = objc_msgSend(v62, "count");

      }
LABEL_22:

      v17 = v17 + v28 - 1;
LABEL_23:
      v20 = v63;
LABEL_24:
      v29 = objc_retainAutorelease(v20);
      *a3 = v29;
      if (a4)
      {
        -[WBSFormDataController _nextFieldToFocusAfterFillingFieldAtIndex:inForm:](self, "_nextFieldToFocusAfterFillingFieldAtIndex:inForm:", v17, v14);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_27:
      return;
    case 4:
      v20 = v63;
      fillCreditCardType(v63, v13, (NSString *)v64);
      goto LABEL_24;
    default:
      goto LABEL_23;
  }
}

- (BOOL)isControlASelectElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "tagName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", CFSTR("select"));

  return v4;
}

- (NSLocale)locale
{
  NSLocale *locale;
  NSLocale *v4;
  NSLocale *v5;

  locale = self->_locale;
  if (!locale)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    v5 = self->_locale;
    self->_locale = v4;

    locale = self->_locale;
  }
  return locale;
}

+ (id)domainFromURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_web_domainFromHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)nextFieldAfterControls:(id)a3 inForm:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  _BOOL4 v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(a4, "controls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
      objc_msgSend(v11, "nextControlUniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
      {
        objc_msgSend(v11, "uniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "containsObject:", v13);

        if ((v14 & 1) != 0)
        {
          v15 = v12;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = ___ZL43controlsContainTextFieldWithControlUniqueIDP7NSArrayIP22WBSFormControlMetadataEP8NSString_block_invoke;
          v24[3] = &unk_1E4B39C70;
          v25 = v15;
          v16 = v15;
          v17 = objc_msgSend(v5, "indexOfObjectPassingTest:", v24) == 0x7FFFFFFFFFFFFFFFLL;

          if (!v17)
            break;
        }
      }

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v16 = 0;
  }

  return v16;
}

+ (id)lastFieldInControls:(id)a3 inForm:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "controls", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "uniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "containsObject:", v13);

        if (v14)
        {
          objc_msgSend(v12, "uniqueID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

+ (id)controlsConsideredByAutoFillInForm:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "controls", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        uniqueIDForAutoFillOfControl(*(WBSFormControlMetadata **)(*((_QWORD *)&v11 + 1) + 8 * v8), 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v4;
}

+ (BOOL)isNameProperty:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  {
    v4 = (void *)+[WBSFormDataController isNameProperty:]::namePropertiesSet;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D89D68], *MEMORY[0x1E0D89D78], *MEMORY[0x1E0D89D70], *MEMORY[0x1E0D89D80], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSFormDataController isNameProperty:]::namePropertiesSet = (uint64_t)v4;
  }
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (id)localizedLowercaseContactProperty:(id)a3
{
  return 0;
}

- (id)_autoFillSetFromMatches:(id)a3 label:(id)a4 contact:(id)a5 form:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  WBSRecentlyUsedAutoFillSet *v20;
  WBSRecentlyUsedAutoFillSet *v21;
  WBSContactAutoFillSet *v22;
  void *v23;
  WBSContactAutoFillSet *v24;
  id v26;
  id v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v28 = a4;
  v26 = a5;
  v27 = a6;
  v29 = v10;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = 0;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "property", v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);
          if (!+[WBSFormDataController isNameProperty:](WBSFormDataController, "isNameProperty:", v18))
          {
            objc_msgSend((id)objc_opt_class(), "localizedLowercaseContactProperty:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v19);

            v15 = 1;
          }

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);

      if ((v15 & 1) == 0)
      {
        v24 = 0;
        goto LABEL_17;
      }
      v20 = [WBSRecentlyUsedAutoFillSet alloc];
      v21 = -[WBSRecentlyUsedAutoFillSet initWithFillMatches:skipMatches:label:](v20, "initWithFillMatches:skipMatches:label:", v13, MEMORY[0x1E0C9AA60], v28);
      -[WBSFormDataController valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:](self, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:", v27, 0, 0, v21, v26);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v22 = [WBSContactAutoFillSet alloc];
      objc_msgSend(v11, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[WBSContactAutoFillSet initWithControlIDToValueMap:label:fillDisplayProperties:skipDisplayProperties:propertiesToFillOrSkip:](v22, "initWithControlIDToValueMap:label:fillDisplayProperties:skipDisplayProperties:propertiesToFillOrSkip:", v13, v28, v23, 0, v12);

    }
    else
    {
      v24 = 0;
    }

LABEL_17:
    goto LABEL_18;
  }
  v24 = 0;
LABEL_18:

  return v24;
}

- (id)orderedHomeAndWorkSetsForContact:(id)a3 form:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WBSFormDataController *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v30 = a4;
  v38 = 0;
  v6 = -[WBSFormDataController valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:](self, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:", v30, &v38, 0, 0, v29);
  v27 = self;
  v28 = v38;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v28;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v35;
    v10 = *MEMORY[0x1E0D89D40];
    v31 = *MEMORY[0x1E0D89D58];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
        objc_msgSend(v12, "property");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[WBSFormDataController isNameProperty:](WBSFormDataController, "isNameProperty:", v13))
        {

LABEL_9:
          objc_msgSend(v33, "addObject:", v12);
LABEL_10:
          objc_msgSend(v7, "addObject:", v12);
          goto LABEL_11;
        }
        objc_msgSend(v12, "property");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v10);

        if (v15)
          goto LABEL_9;
        objc_msgSend(v12, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("_$!<Home>!$_"));

        if (v17)
          objc_msgSend(v33, "addObject:", v12);
        objc_msgSend(v12, "label");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("_$!<Work>!$_")))
        {

          goto LABEL_10;
        }
        objc_msgSend(v12, "property");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v31);

        if (v20)
          goto LABEL_10;
LABEL_11:
        ++v11;
      }
      while (v8 != v11);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      v8 = v21;
    }
    while (v21);
  }

  -[WBSFormDataController _autoFillSetFromMatches:label:contact:form:](v27, "_autoFillSetFromMatches:label:contact:form:", v33, CFSTR("_$!<Home>!$_"), v29, v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormDataController _autoFillSetFromMatches:label:contact:form:](v27, "_autoFillSetFromMatches:label:contact:form:", v7, CFSTR("_$!<Work>!$_"), v29, v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v22)
    objc_msgSend(v24, "addObject:", v22);
  if (v23)
    objc_msgSend(v25, "addObject:", v23);

  return v25;
}

- (id)contactAutoFillSetForRecentlyUsedAutoFillSet:(id)a3 contact:(id)a4 form:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  WBSContactAutoFillSet *v17;
  void *v18;
  void *v19;
  WBSContactAutoFillSet *v20;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = a4;
  v23 = a5;
  objc_msgSend(v8, "fillMatches");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "skipMatches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v34 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormDataController valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:](self, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:", v23, &v34, 0, v8, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v34;
  +[WBSContactAutoFillSet displayStringsForFillMatches:skipMatches:matchesForForm:label:formDataController:](WBSContactAutoFillSet, "displayStringsForFillMatches:skipMatches:matchesForForm:label:formDataController:", v24, v9, v10, v26, self);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSContactAutoFillSet displayStringsForSkipMatches:matchesForForm:formDataController:](WBSContactAutoFillSet, "displayStringsForSkipMatches:matchesForForm:formDataController:", v9, v10, self);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.property"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v15), "property");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v13);
  }

  v17 = [WBSContactAutoFillSet alloc];
  objc_msgSend(v28, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[WBSContactAutoFillSet initWithControlIDToValueMap:label:fillDisplayProperties:skipDisplayProperties:propertiesToFillOrSkip:](v17, "initWithControlIDToValueMap:label:fillDisplayProperties:skipDisplayProperties:propertiesToFillOrSkip:", v27, v26, v18, v19, v11);

  return v20;
}

- (id)valuesForStandardForm:(id)a3 inDomain:(id)a4 autoFillDataType:(int64_t)a5 matches:(id *)a6 preferredLabel:(id)a7 multiRoundAutoFillManager:(id)a8 contact:(id)a9 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a10
{
  uint64_t v11;
  uint64_t v12;

  BYTE1(v12) = a10;
  LOBYTE(v12) = 0;
  LOBYTE(v11) = 0;
  -[WBSFormDataController _valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, a5, a6, a7, a8, v11, a9, 0, v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForStandardForm:(id)a3 inDomain:(id)a4 autoFillDataType:(int64_t)a5 matches:(id *)a6 preferredLabel:(id)a7 multiRoundAutoFillManager:(id)a8
{
  uint64_t v9;
  uint64_t v10;

  LOWORD(v10) = 256;
  LOBYTE(v9) = 0;
  -[WBSFormDataController _valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, a5, a6, a7, a8, v9, 0, 0, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_valuesForStandardForm:(id)a3 inDomain:(id)a4 autoFillDataType:(int64_t)a5 matches:(id *)a6 preferredLabel:(id)a7 multiRoundAutoFillManager:(id)a8 wantAllMatches:(BOOL)a9 contact:(id)a10 existingMatches:(id)a11 shouldUseExistingMatchesToFillFocusedField:(BOOL)a12 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a13
{
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  WBSFormControlMetadata *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  unint64_t v39;
  int v40;
  const __CFString *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  unint64_t v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  __CFString *v73;
  void *v74;
  int v75;
  unint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  WBSFormControlMetadata *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v66 = a4;
  v67 = a7;
  v18 = a8;
  v71 = a10;
  v70 = a11;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a6)
    *a6 = objc_retainAutorelease(v20);
  v69 = objc_msgSend(v81, "type");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "controls");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v77, "count");
  objc_msgSend(v70, "fillMatches");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  v24 = (uint64_t *)MEMORY[0x1E0D89D60];
  if (v23 == 1)
  {
    objc_msgSend(v70, "fillMatches");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "property");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v27, "isEqualToString:", *v24);

  }
  else
  {
    v75 = 0;
  }

  if (v76)
  {
    v63 = 0;
    v28 = 0;
    v72 = *v24;
    v64 = *MEMORY[0x1E0D89D48];
    while (1)
    {
      objc_msgSend(v77, "objectAtIndexedSubscript:", v28);
      v29 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
      v80 = v29;
      objc_msgSend((id)objc_opt_class(), "specifierForControl:", v29);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        objc_msgSend(v79, "property");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", v72);

        if (v31)
          v32 = 7;
        else
          v32 = 3;
      }
      else
      {
        v32 = 3;
      }
      uniqueIDForAutoFillOfControl(v29, v32);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v78
        || objc_msgSend(v18, "currentAutoFillAttemptTrigger") == 1
        && (objc_msgSend(v18, "shouldControlBeIgnoredByFollowUpAutoFill:", v78) & 1) != 0)
      {
        goto LABEL_22;
      }
      if (v69 != 4)
        goto LABEL_23;
      -[WBSFormControlMetadata classification](v29, "classification");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "isEqualToString:", CFSTR("username")))
        break;
      v34 = -[WBSFormControlMetadata isLabeledUsernameField](v29, "isLabeledUsernameField");

      if (v34)
        goto LABEL_20;
LABEL_21:
      -[WBSFormControlMetadata classification](v29, "classification");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("new-password"));

      if ((v38 & 1) == 0)
      {
LABEL_23:
        -[WBSFormControlMetadata tagName](v29, "tagName");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v74, "safari_isCaseInsensitiveEqualToString:", CFSTR("input")) & 1) != 0
          || (v40 = objc_msgSend(v74, "safari_isCaseInsensitiveEqualToString:", CFSTR("textarea")),
              v41 = &stru_1E4B40D18,
              v40))
        {
          -[WBSFormControlMetadata value](v29, "value");
          v41 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
        v73 = (__CFString *)v41;
        if (a9)
        {
          LOBYTE(v60) = a13;
          -[WBSFormDataController _matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v29, v66, v60);
          v42 = (id)objc_claimAutoreleasedReturnValue();
          LOBYTE(v61) = a13;
          -[WBSFormDataController _matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v29, v66, &stru_1E4B40D18, a5, v67, v71, v61);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (v42)
          {
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v42);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObjectsFromArray:", v44);
            objc_msgSend(v45, "array");
            v46 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v44 = v43;
            v46 = v44;
          }
          goto LABEL_43;
        }
        objc_msgSend(v18, "addressSetLabelUsedDuringFirstAutoFillPass");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)v47;
        v49 = v67;
        if (v47)
          v49 = (void *)v47;
        v42 = v49;

        LOBYTE(v60) = a13;
        -[WBSFormDataController bestMatchForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "bestMatchForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v29, v66, v73, a5, v42, v71, v60);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "specifierForControl:", v80);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (!a13)
        {
          objc_msgSend(v50, "property");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqualToString:", v72);

          if (v63 & 1 | ((v53 & 1) == 0))
          {
            if ((v53 & v63 & 1) != 0)
            {
              v63 = 1;
              goto LABEL_40;
            }
          }
          else
          {
            v63 = 1;
          }
        }
        if (-[WBSFormDataController _matchHasPreferredIdentifierOrShouldBeFilledInMultiRoundAutoFill:specifier:multiRoundAutoFillManager:contact:](self, "_matchHasPreferredIdentifierOrShouldBeFilledInMultiRoundAutoFill:specifier:multiRoundAutoFillManager:contact:", v44, v51, v18, v71))
        {
          if (v44)
          {
            v87[0] = v44;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v46 = 0;
          }

LABEL_43:
          if (v70)
          {
            LOBYTE(v62) = a12;
            v39 = -[WBSFormDataController _addMatchesForControl:startingAtIndex:formMetadata:fromExistingMatches:fromAllMatchesIfNecessary:addToFoundMatches:addToAutoFillValues:multiRoundAutoFillManager:propertyToIdentifierMapForFoundMatches:shouldUseExistingMatchesToFillFocusedField:](self, "_addMatchesForControl:startingAtIndex:formMetadata:fromExistingMatches:fromAllMatchesIfNecessary:addToFoundMatches:addToAutoFillValues:multiRoundAutoFillManager:propertyToIdentifierMapForFoundMatches:shouldUseExistingMatchesToFillFocusedField:", v80, v28, v81, v70, v46, v21, v19, v18, v65, v62);
LABEL_56:

            goto LABEL_57;
          }
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v42 = v46;
          v54 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
          if (v54)
          {
            v55 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v54; ++i)
              {
                if (*(_QWORD *)v83 != v55)
                  objc_enumerationMutation(v42);
                v57 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
                objc_msgSend(v21, "addObject:", v57);
                v58 = -[WBSFormDataController addValuesForStandardFormControlsInForm:startingAtIndex:fromAutoFillItem:toDictionary:multiRoundAutoFillManager:](self, "addValuesForStandardFormControlsInForm:startingAtIndex:fromAutoFillItem:toDictionary:multiRoundAutoFillManager:", v81, v28, v57, v19, v18);
              }
              v39 = v58;
              v54 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
            }
            while (v54);
          }
          else
          {
            v39 = 1;
          }
          v46 = v42;
        }
        else
        {
LABEL_40:

          v46 = 0;
          v39 = 1;
        }

        goto LABEL_56;
      }
LABEL_22:
      v39 = 1;
LABEL_57:

      v28 += v39;
      if (v28 >= v76)
        goto LABEL_58;
    }

LABEL_20:
    objc_msgSend(v79, "property");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", v64);

    if ((v36 & 1) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_58:

  return v19;
}

- (BOOL)_matchHasPreferredIdentifierOrShouldBeFilledInMultiRoundAutoFill:(id)a3 specifier:(id)a4 multiRoundAutoFillManager:(id)a5 contact:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;
  void *v26;
  _BOOL4 v27;
  void *v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v10;
    objc_msgSend(v12, "addressBookPropertiesThatCanBeFilled");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v12, "addressBookPropertiesThatCanBeFilled");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "property");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "containsObject:", v17);

      if ((v18 & 1) == 0)
      {
        v25 = 0;
        goto LABEL_14;
      }
    }
    objc_msgSend(v12, "addressSetLabelUsedDuringFirstAutoFillPass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19
      && (objc_msgSend(v14, "property"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D89D38]),
          v20,
          v19,
          v21))
    {
      objc_msgSend(v14, "label");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addressSetLabelUsedDuringFirstAutoFillPass");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);
    }
    else
    {
      if (!v11
        || (objc_msgSend(v11, "property"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = -[WBSFormDataController preferredIdentifierExistsForProperty:withContact:](self, "preferredIdentifierExistsForProperty:withContact:", v26, v13), v26, !v27))
      {
        v25 = 1;
        goto LABEL_14;
      }
      objc_msgSend(v11, "property");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSFormDataController preferredIdentifierForProperty:withContact:](self, "preferredIdentifierForProperty:withContact:", v28, v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", v22);
    }
    v25 = v24;

LABEL_14:
    goto LABEL_15;
  }
  v25 = 1;
LABEL_15:

  return v25;
}

- (unint64_t)_addMatchesForControl:(id)a3 startingAtIndex:(unint64_t)a4 formMetadata:(id)a5 fromExistingMatches:(id)a6 fromAllMatchesIfNecessary:(id)a7 addToFoundMatches:(id)a8 addToAutoFillValues:(id)a9 multiRoundAutoFillManager:(id)a10 propertyToIdentifierMapForFoundMatches:(id)a11 shouldUseExistingMatchesToFillFocusedField:(BOOL)a12
{
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  id v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  unsigned int (**v78)(_QWORD, _QWORD);
  id obj;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[5];
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  uint64_t *v106;
  __int128 *v107;
  unint64_t v108;
  BOOL v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v18 = a5;
  v73 = a6;
  v70 = a7;
  v67 = a8;
  v71 = a9;
  v68 = a10;
  v69 = a11;
  v65 = v18;
  if (a12)
  {
    v19 = v18;
    if (objc_msgSend(v19, "containsActiveElement"))
    {
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v74 = v19;
      objc_msgSend(v19, "controls");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v110, &v117, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v111;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v111 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v24, "isActive"))
            {
              v21 = (void *)objc_msgSend(v24, "copy");
              goto LABEL_15;
            }
          }
          v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v110, &v117, 16);
          if (v21)
            continue;
          break;
        }
      }
LABEL_15:

      v19 = v74;
    }
    else
    {
      v21 = 0;
    }

    objc_msgSend(v21, "uniqueID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }
  *(_QWORD *)&v110 = 0;
  *((_QWORD *)&v110 + 1) = &v110;
  *(_QWORD *)&v111 = 0x2020000000;
  *((_QWORD *)&v111 + 1) = 1;
  v117 = 0;
  v118 = &v117;
  v119 = 0x3032000000;
  v120 = __Block_byref_object_copy__12;
  v121 = __Block_byref_object_dispose__12;
  v122 = 0;
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __268__WBSFormDataController__addMatchesForControl_startingAtIndex_formMetadata_fromExistingMatches_fromAllMatchesIfNecessary_addToFoundMatches_addToAutoFillValues_multiRoundAutoFillManager_propertyToIdentifierMapForFoundMatches_shouldUseExistingMatchesToFillFocusedField___block_invoke;
  v99[3] = &unk_1E4B39AD0;
  v106 = &v117;
  v107 = &v110;
  v99[4] = self;
  v63 = v65;
  v100 = v63;
  v108 = a4;
  v64 = v68;
  v101 = v64;
  v109 = a12;
  v76 = v66;
  v102 = v76;
  v75 = v25;
  v103 = v75;
  v77 = v67;
  v104 = v77;
  v72 = v69;
  v105 = v72;
  v78 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1A8599ED0](v99);
  objc_msgSend((id)objc_opt_class(), "specifierForControl:", v76);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26
    || (v86 = v26,
        objc_msgSend(v26, "property"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v28 = v27 == 0,
        v27,
        v26 = v86,
        v28))
  {
    v51 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 24);
  }
  else
  {
    objc_msgSend(v73, "fillMatches");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "skipMatches");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "label", v29);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v31 = v29;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v96;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v96 != v33)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * j), "property");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v35);

        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
      }
      while (v32);
    }

    objc_msgSend(v86, "property");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectForKeyedSubscript:", v36);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    obj = v62;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v115, 16);
    if (v37)
    {
      v81 = 0;
      v82 = *(_QWORD *)v92;
LABEL_28:
      v84 = (id)v37;
      v38 = 0;
      while (1)
      {
        if (*(_QWORD *)v92 != v82)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v38);
        objc_msgSend(v86, "property");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "property");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "isEqualToString:", v41);

        if ((v42 & 1) == 0)
          goto LABEL_41;
        objc_msgSend(v39, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (!v83 || (objc_msgSend(v43, "isEqualToString:", v83) & 1) != 0)
        {
          v45 = v44;

          v81 = v45;
          objc_msgSend(v86, "component");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v46)
            goto LABEL_39;
          objc_msgSend(v39, "key");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v47)
          {

LABEL_39:
            if (((unsigned int (**)(_QWORD, void *))v78)[2](v78, v39))
            {
              objc_msgSend(v71, "addEntriesFromDictionary:", v118[5]);
              v51 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 24);

              goto LABEL_67;
            }
            goto LABEL_40;
          }
          objc_msgSend(v86, "component");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "key");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v48, "isEqualToString:", v49);

          if ((v50 & 1) != 0)
            goto LABEL_39;
        }
LABEL_40:

LABEL_41:
        if (v84 == (id)++v38)
        {
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v115, 16);
          if (v37)
            goto LABEL_28;
          goto LABEL_47;
        }
      }
    }
    v81 = 0;
LABEL_47:

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v85 = v70;
    v52 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v87, v114, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v88;
      while (2)
      {
        for (k = 0; k != v52; ++k)
        {
          if (*(_QWORD *)v88 != v53)
            objc_enumerationMutation(v85);
          v55 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v56 = v55;
            if (!objc_msgSend(v80, "length"))
            {
              objc_msgSend(v56, "property");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v30, "containsObject:", v57);

              if (v58)
              {
                objc_msgSend(v77, "addObject:", v56);
              }
              else
              {
                objc_msgSend(v56, "identifier");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v59;
                if ((!v81 || (objc_msgSend(v59, "isEqualToString:", v81) & 1) != 0)
                  && (!v83 || objc_msgSend(v60, "isEqualToString:", v83))
                  && ((unsigned int (**)(_QWORD, id))v78)[2](v78, v56))
                {
                  objc_msgSend(v71, "addEntriesFromDictionary:", v118[5]);
                  v51 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 24);

                  goto LABEL_67;
                }

              }
            }

          }
        }
        v52 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v87, v114, 16);
        if (v52)
          continue;
        break;
      }
    }

    v51 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 24);
LABEL_67:

    v26 = v86;
  }

  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v110, 8);

  return v51;
}

uint64_t __268__WBSFormDataController__addMatchesForControl_startingAtIndex_formMetadata_fromExistingMatches_fromAllMatchesIfNecessary_addToFoundMatches_addToAutoFillValues_multiRoundAutoFillManager_propertyToIdentifierMapForFoundMatches_shouldUseExistingMatchesToFillFocusedField___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "addValuesForStandardFormControlsInForm:startingAtIndex:fromAutoFillItem:toDictionary:multiRoundAutoFillManager:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 104), v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)+ 40), *(_QWORD *)(a1 + 48));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count"))
  {
    if (!*(_BYTE *)(a1 + 112)
      || (objc_msgSend(*(id *)(a1 + 56), "uniqueID"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 64)),
          v11,
          (v12 & 1) != 0))
    {
      v7 = 0;
      goto LABEL_13;
    }
    v7 = 0;
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
    goto LABEL_13;
  }
  if (*(_BYTE *)(a1 + 112))
  {
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "objectForKeyedSubscript:");
      v7 = objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_12;
    }
  }
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v3);
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = *(void **)(a1 + 80);
    objc_msgSend(v3, "property");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  v7 = 1;
LABEL_13:

  return v7;
}

- (void)saveRecentlyUsedAutoFillSetWithMatchesToFill:(id)a3 matchesForDoNotFill:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "dictionaryRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v16);
  }

  v29[0] = CFSTR("recentlyUsedAutoFillSetArray");
  v29[1] = CFSTR("recentlyUsedAutoFillSetDoNotFillArray");
  v30[0] = v8;
  v30[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormDataController addRecentlyUsedAutoFillSet:appendToTheEnd:](self, "addRecentlyUsedAutoFillSet:appendToTheEnd:", v20, 0);

}

- (id)valuesForContactFormWithMetadata:(id)a3 inDomain:(id)a4 matches:(id *)a5 multiRoundAutoFillManager:(id)a6
{
  -[WBSFormDataController valuesForContactFormWithMetadata:inDomain:matches:multiRoundAutoFillManager:contact:](self, "valuesForContactFormWithMetadata:inDomain:matches:multiRoundAutoFillManager:contact:", a3, a4, a5, a6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForContactFormWithMetadata:(id)a3 inDomain:(id)a4 matches:(id *)a5 multiRoundAutoFillManager:(id)a6 contact:(id)a7
{
  uint64_t v8;
  uint64_t v9;

  LOWORD(v9) = 0;
  LOBYTE(v8) = 1;
  -[WBSFormDataController _valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, 0, a5, 0, a6, v8, a7, 0, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForContactFormWithMetadata:(id)a3 matches:(id *)a4 multiRoundAutoFillManager:(id)a5 existingMatches:(id)a6 contact:(id)a7
{
  -[WBSFormDataController valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:shouldUseExistingMatchesToFillFocusedField:contact:](self, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:shouldUseExistingMatchesToFillFocusedField:contact:", a3, a4, a5, a6, 0, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForContactFormWithMetadata:(id)a3 matches:(id *)a4 multiRoundAutoFillManager:(id)a5 existingMatches:(id)a6 shouldUseExistingMatchesToFillFocusedField:(BOOL)a7 contact:(id)a8
{
  uint64_t v9;
  uint64_t v10;

  LOWORD(v10) = a7;
  LOBYTE(v9) = 1;
  -[WBSFormDataController _valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, 0, 0, a4, 0, a5, v9, a8, a6, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)exactFQDNAndHighLevelDomainSavedAccountMatchesForForm:(id)a3 atURL:(id)a4 webFrameIdentifier:(id)a5 savedAccountContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "userNameElementUniqueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v16 = 0;
    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "_metadataForControlWithUniqueID:inForm:", v14, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
LABEL_9:
    v20 = &stru_1E4B40D18;
    goto LABEL_10;
  }
  objc_msgSend(v15, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isVisible");
  v19 = objc_msgSend(v16, "isReadOnly");
  if ((v18 ^ 1 | v19 | objc_msgSend(v16, "claimsToBeUsernameViaAutocompleteAttribute")) == 1
    && objc_msgSend(v17, "length")
    && (objc_msgSend(v17, "hasPrefix:", CFSTR("@")) & 1) == 0)
  {
    v20 = v17;
  }
  else
  {
    v20 = &stru_1E4B40D18;
  }

LABEL_10:
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__12;
  v36 = __Block_byref_object_dispose__12;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__12;
  v30 = __Block_byref_object_dispose__12;
  v31 = 0;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CF0]), "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v11, 1, v20, 0, v12);
  objc_msgSend(v21, "setContext:", v13);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __124__WBSFormDataController_exactFQDNAndHighLevelDomainSavedAccountMatchesForForm_atURL_webFrameIdentifier_savedAccountContext___block_invoke;
  v25[3] = &unk_1E4B39AF8;
  v25[4] = &v32;
  v25[5] = &v26;
  -[WBSFormDataController getSavedAccountMatchesWithCriteria:synchronously:completionHandler:](self, "getSavedAccountMatchesWithCriteria:synchronously:completionHandler:", v21, 1, v25);
  v22 = objc_alloc(MEMORY[0x1E0D89C18]);
  v23 = (void *)objc_msgSend(v22, "initWithFirst:second:", v33[5], v27[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __124__WBSFormDataController_exactFQDNAndHighLevelDomainSavedAccountMatchesForForm_atURL_webFrameIdentifier_savedAccountContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "exactMatches");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v9, "potentialMatches");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

+ (id)valuesFromUser:(id)a3 password:(id)a4 forLoginOrChangePasswordForm:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  int v16;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = a4;
  v18 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v18, "controls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "classification");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("username")))
        {
          v14 = objc_msgSend(v7, "length") == 0;

          if (!v14)
          {
            objc_msgSend(v12, "uniqueID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v7, v15);
            goto LABEL_14;
          }
        }
        else
        {

        }
        objc_msgSend(v12, "classification");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("current-password"))
          && objc_msgSend(v20, "length"))
        {
          v16 = objc_msgSend(v12, "isSecureTextField");

          if (!v16)
            continue;
          objc_msgSend(v12, "uniqueID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v15);
        }
LABEL_14:

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  return v19;
}

- (id)valuesForFormWithMetadata:(id)a3 hideMyEmailRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  WBSAddressBookMatch *v15;
  void *v16;
  WBSAddressBookMatch *v17;
  WBSRecentlyUsedAutoFillSet *v18;
  void *v19;
  WBSRecentlyUsedAutoFillSet *v20;
  void *v22;
  id v23;
  WBSAddressBookMatch *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "state"))
  {
    objc_msgSend(v8, "privateEmailAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0C97360]);
    v11 = objc_alloc(MEMORY[0x1E0C97338]);
    v12 = *MEMORY[0x1E0C97000];
    v25[0] = objc_msgSend(v11, "initWithLabel:value:", *MEMORY[0x1E0C97000], v10);
    v22 = (void *)v25[0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setEmailAddresses:", v13);

    v14 = v23;
    v15 = [WBSAddressBookMatch alloc];
    objc_msgSend(v14, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WBSAddressBookMatch initWithValue:property:key:identifier:label:](v15, "initWithValue:property:key:identifier:label:", v10, *MEMORY[0x1E0D89D48], 0, v16, v12);

    v18 = [WBSRecentlyUsedAutoFillSet alloc];
    v24 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WBSRecentlyUsedAutoFillSet initWithFillMatches:skipMatches:label:](v18, "initWithFillMatches:skipMatches:label:", v19, MEMORY[0x1E0C9AA60], v12);
    -[WBSFormDataController valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:shouldUseExistingMatchesToFillFocusedField:contact:](self, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:shouldUseExistingMatchesToFillFocusedField:contact:", v6, 0, 0, v20, 1, v14);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  }

  return v9;
}

- (id)annotationsFromUsername:(id)a3 forLoginOrChangePasswordForm:(id)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = a4;
  objc_msgSend(v6, "userNameElementUniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    if (v5)
      v9 = v5;
    else
      v9 = &stru_1E4B40D18;
    v11 = CFSTR("Username");
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_lastUsedUsernameForDomain:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->_domainToLastUsedUsernameAndProtectionSpace, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setLastUsedUsername:(id)a3 andProtectionSpace:(id)a4 forDomain:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *domainToLastUsedUsernameAndProtectionSpace;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  domainToLastUsedUsernameAndProtectionSpace = self->_domainToLastUsedUsernameAndProtectionSpace;
  if (!domainToLastUsedUsernameAndProtectionSpace)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = self->_domainToLastUsedUsernameAndProtectionSpace;
    self->_domainToLastUsedUsernameAndProtectionSpace = v12;

    domainToLastUsedUsernameAndProtectionSpace = self->_domainToLastUsedUsernameAndProtectionSpace;
  }
  v15[0] = v8;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](domainToLastUsedUsernameAndProtectionSpace, "setObject:forKey:", v14, v10);

}

- (id)lastUsedUsernameWithPasswordForURL:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  void *v19;
  void *v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[WBSFormDataController shouldAutoFillPasswords](self, "shouldAutoFillPasswords"))
  {
    +[WBSFormDataController domainFromURL:](WBSFormDataController, "domainFromURL:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
    {
      v11 = 0;
LABEL_26:

      goto LABEL_27;
    }
    -[WBSFormDataController _lastUsedUsernameForDomain:](self, "_lastUsedUsernameForDomain:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
LABEL_25:

      goto LABEL_26;
    }
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__12;
    v39 = __Block_byref_object_dispose__12;
    v40 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__12;
    v33 = __Block_byref_object_dispose__12;
    v34 = 0;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CF0]), "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v6, 17, &stru_1E4B40D18, 0, 0);
    objc_msgSend(v23, "setContext:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __70__WBSFormDataController_lastUsedUsernameWithPasswordForURL_inContext___block_invoke;
    v28[3] = &unk_1E4B39AF8;
    v28[4] = &v35;
    v28[5] = &v29;
    -[WBSFormDataController getSavedAccountMatchesWithCriteria:synchronously:completionHandler:](self, "getSavedAccountMatchesWithCriteria:synchronously:completionHandler:", v23, 1, v28);
    if ((unint64_t)objc_msgSend((id)v36[5], "count") > 1)
      goto LABEL_8;
    if (objc_msgSend((id)v36[5], "count") == 1)
    {
      objc_msgSend((id)v36[5], "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "user");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v12, "copy");
    }
    else
    {
      if (!objc_msgSend((id)v30[5], "count"))
      {
LABEL_8:
        v11 = 0;
LABEL_24:

        _Block_object_dispose(&v29, 8);
        _Block_object_dispose(&v35, 8);

        goto LABEL_25;
      }
      objc_msgSend((id)v30[5], "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "user");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = (id)v30[5];
      obj = v13;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v41, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "user");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", v12);

            if ((v18 & 1) == 0)
            {
              v11 = 0;
              v19 = obj;
              goto LABEL_22;
            }
          }
          v13 = obj;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v41, 16);
          if (v14)
            continue;
          break;
        }
      }

      objc_msgSend(v21, "user");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v19, "copy");
LABEL_22:

    }
    goto LABEL_24;
  }
  v11 = 0;
LABEL_27:

  return v11;
}

void __70__WBSFormDataController_lastUsedUsernameWithPasswordForURL_inContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "exactMatches");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v9, "potentialMatches");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)_knownUsernamesWithPasswordsForURL:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CF0]), "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v6, 17, &stru_1E4B40D18, 0, 0);
  objc_msgSend(v8, "setContext:", v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__WBSFormDataController__knownUsernamesWithPasswordsForURL_inContext___block_invoke;
  v11[3] = &unk_1E4B39B20;
  v11[4] = &v12;
  -[WBSFormDataController getSavedAccountMatchesWithCriteria:synchronously:completionHandler:](self, "getSavedAccountMatchesWithCriteria:synchronously:completionHandler:", v8, 1, v11);
  objc_msgSend((id)v13[5], "safari_setByApplyingBlock:", &__block_literal_global_187);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __70__WBSFormDataController__knownUsernamesWithPasswordsForURL_inContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "exactMatches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "potentialMatches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id __70__WBSFormDataController__knownUsernamesWithPasswordsForURL_inContext___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "user");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didFillPasswordForUsername:(id)a3 fromProviderWithBundleIdentifier:(id)a4 inTabWithID:(id)a5 currentURL:(id)a6 isPrivate:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  NSMutableArray *v16;
  NSMutableArray *recentAutoFillEvents;
  void *v18;
  void *v19;
  id keybagCallbackToken;
  NSMutableArray *v21;
  WBSAutoFillEvent *v22;
  WBSAuthenticationServicesAgentProxy *agentProxy;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!self->_recentAutoFillEvents)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    recentAutoFillEvents = self->_recentAutoFillEvents;
    self->_recentAutoFillEvents = v16;

  }
  if (!self->_keybagCallbackToken)
  {
    objc_msgSend(MEMORY[0x1E0D89C00], "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __118__WBSFormDataController_didFillPasswordForUsername_fromProviderWithBundleIdentifier_inTabWithID_currentURL_isPrivate___block_invoke;
    v26[3] = &unk_1E4B2A2C8;
    v26[4] = self;
    objc_msgSend(v18, "addKeyBagLockStatusChangedObserverWithHandler:", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    keybagCallbackToken = self->_keybagCallbackToken;
    self->_keybagCallbackToken = v19;

  }
  -[WBSFormDataController _removeExpiredAutoFillEvents:](self, "_removeExpiredAutoFillEvents:", self->_recentAutoFillEvents);
  v21 = self->_recentAutoFillEvents;
  v22 = -[WBSAutoFillEvent initWithUsername:tabID:isPrivateTab:url:]([WBSAutoFillEvent alloc], "initWithUsername:tabID:isPrivateTab:url:", v12, v14, v7, v15);
  -[NSMutableArray addObject:](v21, "addObject:", v22);

  agentProxy = self->_agentProxy;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bundleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSAuthenticationServicesAgentProxy didFillCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:](agentProxy, "didFillCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:", v12, v15, v13, v25);

}

void __118__WBSFormDataController_didFillPasswordForUsername_fromProviderWithBundleIdentifier_inTabWithID_currentURL_isPrivate___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__WBSFormDataController_didFillPasswordForUsername_fromProviderWithBundleIdentifier_inTabWithID_currentURL_isPrivate___block_invoke_2;
  block[3] = &unk_1E4B2A2C8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __118__WBSFormDataController_didFillPasswordForUsername_fromProviderWithBundleIdentifier_inTabWithID_currentURL_isPrivate___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0D89C00], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyBagLockStatus");

  if ((unint64_t)(v3 - 1) <= 1)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
}

- (void)canAutomaticallyRegisterPasskeyForUsername:(id)a3 inTabWithID:(id)a4 currentURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t);
  void *v14;
  void *v15;
  void *v16;
  WBSAuthenticationServicesAgentProxy *agentProxy;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, uint64_t);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t))a6;
  if (-[WBSFormDataController _hasMatchingAutoFillEventForUsername:withinTimeInterval:inTabWithID:currentURL:shouldAllowPrivateTabs:shouldRemoveMatchingEvent:](self, "_hasMatchingAutoFillEventForUsername:withinTimeInterval:inTabWithID:currentURL:shouldAllowPrivateTabs:shouldRemoveMatchingEvent:", v10, v11, v12, 0, 1, 300.0))
  {
    v13[2](v13, 1);
  }
  else
  {
    -[NSMutableArray lastObject](self->_recentAutoFillEvents, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v12, "host");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safari_highLevelDomainForPasswordManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      agentProxy = self->_agentProxy;
      objc_msgSend(v14, "url");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "absoluteString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __109__WBSFormDataController_canAutomaticallyRegisterPasskeyForUsername_inTabWithID_currentURL_completionHandler___block_invoke;
      v20[3] = &unk_1E4B39B88;
      v21 = v13;
      -[WBSAuthenticationServicesAgentProxy isOrigin:relatedToRelyingPartyIdentifier:completionHandler:](agentProxy, "isOrigin:relatedToRelyingPartyIdentifier:completionHandler:", v19, v16, v20);

    }
    else
    {
      v13[2](v13, 0);
    }

  }
}

uint64_t __109__WBSFormDataController_canAutomaticallyRegisterPasskeyForUsername_inTabWithID_currentURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)canApplyAutoFillGracePeriodForUsername:(id)a3 inTabWithID:(id)a4 currentURL:(id)a5
{
  return -[WBSFormDataController _hasMatchingAutoFillEventForUsername:withinTimeInterval:inTabWithID:currentURL:shouldAllowPrivateTabs:shouldRemoveMatchingEvent:](self, "_hasMatchingAutoFillEventForUsername:withinTimeInterval:inTabWithID:currentURL:shouldAllowPrivateTabs:shouldRemoveMatchingEvent:", a3, a4, a5, 1, 0, 60.0);
}

- (BOOL)_hasMatchingAutoFillEventForUsername:(id)a3 withinTimeInterval:(double)a4 inTabWithID:(id)a5 currentURL:(id)a6 shouldAllowPrivateTabs:(BOOL)a7 shouldRemoveMatchingEvent:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  NSMutableArray *recentAutoFillEvents;
  uint64_t v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  BOOL v26;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  if (-[NSMutableArray count](self->_recentAutoFillEvents, "count"))
  {
    -[WBSFormDataController _removeExpiredAutoFillEvents:](self, "_removeExpiredAutoFillEvents:", self->_recentAutoFillEvents);
    recentAutoFillEvents = self->_recentAutoFillEvents;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __153__WBSFormDataController__hasMatchingAutoFillEventForUsername_withinTimeInterval_inTabWithID_currentURL_shouldAllowPrivateTabs_shouldRemoveMatchingEvent___block_invoke;
    v21[3] = &unk_1E4B39BB0;
    v22 = v14;
    v23 = v15;
    v24 = v16;
    v25 = (unint64_t)(a4 * 1000000000.0);
    v26 = a7;
    v18 = -[NSMutableArray indexOfObjectPassingTest:](recentAutoFillEvents, "indexOfObjectPassingTest:", v21);
    v19 = v18 != 0x7FFFFFFFFFFFFFFFLL;
    if (v18 != 0x7FFFFFFFFFFFFFFFLL && a8)
      -[NSMutableArray removeObjectAtIndex:](self->_recentAutoFillEvents, "removeObjectAtIndex:", v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __153__WBSFormDataController__hasMatchingAutoFillEventForUsername_withinTimeInterval_inTabWithID_currentURL_shouldAllowPrivateTabs_shouldRemoveMatchingEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "tabID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == *(void **)(a1 + 40))
    {
      objc_msgSend(v3, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safari_highLevelDomainForPasswordManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_highLevelDomainForPasswordManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v11)
        && (unint64_t)objc_msgSend(v3, "timeIntervalSinceTimestamp") <= *(_QWORD *)(a1 + 56))
      {
        if (*(_BYTE *)(a1 + 64))
          v6 = 1;
        else
          v6 = objc_msgSend(v3, "isPrivateTab") ^ 1;
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_removeExpiredAutoFillEvents:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__WBSFormDataController__removeExpiredAutoFillEvents___block_invoke;
  v3[3] = &__block_descriptor_40_e33_B32__0__WBSAutoFillEvent_8Q16_B24l;
  v3[4] = 300000000000;
  objc_msgSend(a3, "safari_removeObjectsPassingTest:", v3);
}

BOOL __54__WBSFormDataController__removeExpiredAutoFillEvents___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "timeIntervalSinceTimestamp") > *(_QWORD *)(a1 + 32);
}

- (BOOL)shouldAutoFillFromAddressBook
{
  return 0;
}

- (BOOL)shouldAutoFillFromPreviousData
{
  return 0;
}

- (BOOL)shouldAutoFillPasswords
{
  return 0;
}

- (BOOL)hasUserDeniedAccessToCredential:(id)a3 inProtectionSpace:(id)a4
{
  return 0;
}

- (id)completionDBPath
{
  return 0;
}

- (id)encryptOrDecryptData:(id)a3 encrypt:(BOOL)a4
{
  return (id)objc_msgSend(a3, "copy");
}

- (void)getSavedAccountMatchesWithCriteria:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (-[WBSFormDataController shouldAutoFillPasswords](self, "shouldAutoFillPasswords"))
  {
    -[WBSAutoFillQuirksManager associatedDomainsManager](self->_autoFillQuirksManager, "associatedDomainsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssociatedDomainsManager:", v9);

    objc_msgSend(MEMORY[0x1E0D89CF8], "sharedStore");
    if (v6)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v11, v8);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "savedAccountsMatchingCriteria:withCompletionHandler:", v11, v8);
    }

  }
  else
  {
    v8[2](v8, 0);
  }

}

- (id)metadataOfActiveFormOrBestFormForPageLevelAutoFill:(id)a3 frame:(OpaqueFormAutoFillFrame *)a4
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__WBSFormDataController_metadataOfActiveFormOrBestFormForPageLevelAutoFill_frame___block_invoke;
  v7[3] = &unk_1E4B39BF8;
  v7[4] = &v8;
  v7[5] = &v14;
  objc_msgSend(a3, "enumerateFormsUsingBlock:", v7);
  if (a4)
    *a4 = (OpaqueFormAutoFillFrame *)v15[3];
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __82__WBSFormDataController_metadataOfActiveFormOrBestFormForPageLevelAutoFill_frame___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "containsActiveElement"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  else if (objc_msgSend(v8, "isBestForPageLevelAutoFill"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (id)metadataOfBestFormForStreamlinedLogin:(id)a3 frame:(OpaqueFormAutoFillFrame *)a4
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__WBSFormDataController_metadataOfBestFormForStreamlinedLogin_frame___block_invoke;
  v7[3] = &unk_1E4B39BF8;
  v7[4] = &v8;
  v7[5] = &v14;
  objc_msgSend(a3, "enumerateFormsUsingBlock:", v7);
  if (a4)
    *a4 = (OpaqueFormAutoFillFrame *)v15[3];
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __69__WBSFormDataController_metadataOfBestFormForStreamlinedLogin_frame___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isBestForStreamlinedLogin"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }

}

- (BOOL)isPasswordFieldForUserCredentialsWithMetadata:(id)a3 formMetadata:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "type");
  if ((unint64_t)(v7 - 6) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(v5, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "passwordElementUniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v9);

    if ((v11 & 1) != 0)
    {
      v8 = 1;
    }
    else if (v7 == 3)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v6, "confirmPasswordElementUniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "isEqualToString:", v9);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)willSubmitFormWithCredentials:(id)a3 shouldPreferAnnotatedCredentials:(BOOL)a4 atURL:(id)a5 username:(id *)a6 password:(id *)a7 inContext:(id)a8 shouldShowPasswordsAppOnboarding:(BOOL)a9
{
  self->_shouldShowPasswordsAppOnboarding = a9;
  -[WBSFormDataController updateLastUsedUsernameAndExtractUsernameAndPasswordFromForm:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:](self, "updateLastUsedUsernameAndExtractUsernameAndPasswordFromForm:shouldPreferAnnotatedCredentials:atURL:username:password:inContext:", a3, a4, a5, a6, a7, a8);
}

- (void)updateLastUsedUsernameAndExtractUsernameAndPasswordFromForm:(id)a3 shouldPreferAnnotatedCredentials:(BOOL)a4 atURL:(id)a5 username:(id *)a6 password:(id *)a7 inContext:(id)a8
{
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  int v26;
  int v27;
  char v28;
  char v29;
  void *v30;
  char v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  int v53;
  int v54;
  id *v55;
  void *v56;
  void *v57;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id *v63;
  id v64;
  WBSFormDataController *v65;
  id v66;
  id obj;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v64 = a5;
  v62 = a8;
  v63 = a6;
  *a6 = 0;
  v55 = a7;
  *a7 = 0;
  v65 = self;
  if (!-[WBSFormDataController shouldAutoFillPasswords](self, "shouldAutoFillPasswords")
    && !self->_shouldShowPasswordsAppOnboarding)
  {
    goto LABEL_70;
  }
  objc_msgSend(v66, "userNameElementUniqueID");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "domainFromURL:", v64);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v57, "length"))
    goto LABEL_69;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "annotations");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "safari_stringForKey:", CFSTR("Username"));
  v59 = (id)objc_claimAutoreleasedReturnValue();
  if (v59)
    objc_msgSend(v60, "addObject:", v59);
  -[WBSFormDataController _knownUsernamesWithPasswordsForURL:inContext:](self, "_knownUsernamesWithPasswordsForURL:inContext:", v64, v62);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "unionSet:", v13);

  if (!objc_msgSend(v61, "length"))
    goto LABEL_45;
  objc_msgSend((id)objc_opt_class(), "_metadataForControlWithUniqueID:inForm:", v61, v66);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "value");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v60, "containsObject:") & 1) != 0)
  {
    v14 = v70;
    goto LABEL_42;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v60;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (!v15)
  {
    v18 = v70;
    goto LABEL_41;
  }
  v68 = *(_QWORD *)v73;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v73 != v68)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v16);
      v18 = v70;
      v19 = v17;
      v20 = v69;
      if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) != 0
        || (v21 = objc_msgSend(v18, "length"), v22 = objc_msgSend(v19, "length"), !v21)
        || (v23 = v22) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      if (v21 == v22)
      {
        v24 = 0;
        v25 = 0;
        do
        {
          v26 = objc_msgSend(v18, "characterAtIndex:", v24);
          v27 = objc_msgSend(v19, "characterAtIndex:", v24);
          if ((v26 != 42 || v27 == 42) && (v26 != 8226 || v27 == 8226))
          {
            if (v26 != v27)
              goto LABEL_15;
          }
          else
          {
            v25 = 1;
          }
          ++v24;
        }
        while (v21 != v24);

        if ((v25 & 1) != 0)
        {
LABEL_39:
          v33 = v19;

          v18 = v33;
          goto LABEL_41;
        }
      }
      else
      {
        v28 = objc_msgSend(v20, "isUserEditedTextField");
        if (v21 <= v23 + 1)
          v29 = 1;
        else
          v29 = v28;
        if ((v29 & 1) != 0)
          goto LABEL_15;
        objc_msgSend(CFSTR("_"), "stringByAppendingString:", v19);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v18, "hasSuffix:", v30);

        if ((v31 & 1) != 0)
          goto LABEL_39;
      }
LABEL_16:
      ++v16;
    }
    while (v16 != v15);
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    v15 = v32;
  }
  while (v32);
LABEL_41:

  v14 = v18;
LABEL_42:
  v71 = v14;
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", v64);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFormDataController _setLastUsedUsername:andProtectionSpace:forDomain:](v65, "_setLastUsedUsername:andProtectionSpace:forDomain:", v71, v34, v57);

    *v63 = objc_retainAutorelease(v71);
  }

LABEL_45:
  v35 = objc_msgSend(*v63, "length");
  if (v59 && !v35)
    *v63 = objc_retainAutorelease(v59);
  objc_msgSend(v66, "passwordElementUniqueID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_metadataForControlWithUniqueID:inForm:", v36, v66);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*v63, "length"))
  {
    objc_msgSend(v37, "associatedUsername");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "length"))
      *v63 = objc_retainAutorelease(v38);

  }
  if (!objc_msgSend(*v63, "length") && objc_msgSend(v66, "type") != 4)
  {
    -[WBSFormDataController lastUsedUsernameWithPasswordForURL:inContext:](v65, "lastUsedUsernameWithPasswordForURL:inContext:", v64, v62);
    *v63 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v37, "value");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v40 = CFSTR("NewPassword");
  }
  else
  {
    -[WBSFormDataController _keyToLookUpInAnnotationsForPasswordForFormMetadata:](v65, "_keyToLookUpInAnnotationsForPasswordForFormMetadata:", v66);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v41 = v40;
  objc_msgSend(v56, "safari_stringForKey:", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v39;
  v44 = v42;
  v45 = v37;
  if ((objc_msgSend(v43, "isEqualToString:", v44) & 1) != 0
    || (v50 = objc_msgSend(v43, "length"), v51 = objc_msgSend(v44, "length"), !v50)
    || !v51
    || v50 != v51)
  {

    v46 = v43;
    goto LABEL_60;
  }
  if ((objc_msgSend(v45, "isUserEditedTextField") & 1) == 0)
  {
    v76 = 0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v43);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "scanInteger:", &v76);
    v53 = objc_msgSend(v52, "isAtEnd");

    if (v53)
    {

      goto LABEL_78;
    }
  }
  v54 = objc_msgSend(v43, "safari_looksLikeObscuredPassword");

  if (v54)
  {
LABEL_78:
    v46 = v44;
LABEL_60:

    v43 = v46;
  }
  v47 = v44;
  if (!a4)
  {
    v48 = objc_msgSend(v43, "length");
    if (v44)
      v49 = v48 == 0;
    else
      v49 = 0;
    if (v49)
      v47 = v44;
    else
      v47 = v43;
  }
  *v55 = objc_retainAutorelease(v47);

LABEL_69:
LABEL_70:

}

- (id)_keyToLookUpInAnnotationsForPasswordForFormMetadata:(id)a3
{
  __CFString **v3;

  if ((objc_msgSend(a3, "type") & 0xFFFFFFFFFFFFFFFELL) == 4)
    v3 = WBSFormAnnotationNewPasswordKey;
  else
    v3 = WBSFormAnnotationCurrentPasswordKey;
  return *v3;
}

- (id)substituteCredential:(id)a3 inProtectionSpace:(id)a4
{
  return a3;
}

- (id)savedAccountUsingDomainsToConsiderIdenticalWithUsername:(id)a3 url:(id *)a4 host:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[WBSFormDataController autoFillQuirksManager](self, "autoFillQuirksManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associatedDomainsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domainsToConsiderIdenticalToDomain:", *a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", *a4, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(MEMORY[0x1E0D89CF8], "sharedStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "savedAccounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v24;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sites");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v16);

        objc_msgSend(v15, "intersectSet:", v8);
        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v15, "anyObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setHost:", v18);
          objc_msgSend(v21, "URL");
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          v19 = objc_retainAutorelease(v18);
          *a5 = v19;
          v17 = v14;

          goto LABEL_11;
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)autoGeneratedPasswordForURL:(id)a3 respectingPasswordRequirements:(id)a4 maxLength:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  -[WBSFormDataController autoFillQuirksManager](self, "autoFillQuirksManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passwordGenerationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v12 = v9;
  }
  else
  {
    objc_msgSend(v11, "defaultRequirementsForURL:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  objc_msgSend(v11, "updatedRequirements:respectingMaxLength:", v12, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "passwordGenerationIsDisallowedByRequirements:", v14) & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v11, "generatedPasswordMatchingRequirements:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (BOOL)contactIsMe:(id)a3
{
  return 0;
}

+ (id)contactKeyForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[12];
  _QWORD v22[13];

  v22[12] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  {
    v4 = (void *)+[WBSFormDataController contactKeyForString:]::map;
  }
  else
  {
    v9 = *MEMORY[0x1E0C967F0];
    v21[0] = CFSTR("Address");
    v21[1] = CFSTR("Birthday");
    v10 = *MEMORY[0x1E0C96670];
    v22[0] = v9;
    v22[1] = v10;
    v11 = *MEMORY[0x1E0C966A8];
    v21[2] = CFSTR("Email");
    v21[3] = CFSTR("First");
    v12 = *MEMORY[0x1E0C966D0];
    v22[2] = v11;
    v22[3] = v12;
    v13 = *MEMORY[0x1E0C96740];
    v21[4] = CFSTR("InstantMessage");
    v21[5] = CFSTR("JobTitle");
    v14 = *MEMORY[0x1E0C96758];
    v22[4] = v13;
    v22[5] = v14;
    v15 = *MEMORY[0x1E0C966C0];
    v21[6] = CFSTR("Last");
    v21[7] = CFSTR("Middle");
    v16 = *MEMORY[0x1E0C96780];
    v22[6] = v15;
    v22[7] = v16;
    v17 = *MEMORY[0x1E0C967B8];
    v21[8] = CFSTR("Organization");
    v21[9] = CFSTR("Phone");
    v18 = *MEMORY[0x1E0C967C0];
    v22[8] = v17;
    v22[9] = v18;
    v19 = *MEMORY[0x1E0C968A0];
    v20 = *MEMORY[0x1E0D89D80];
    v21[10] = CFSTR("URLs");
    v21[11] = v20;
    v22[10] = v19;
    v22[11] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSFormDataController contactKeyForString:]::map = (uint64_t)v4;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (id)addressBookMatchesForFullNameForContact:(id)a3
{
  id v3;
  void *v4;
  WBSAddressBookMatch *v5;
  void *v6;
  WBSAddressBookMatch *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = [WBSAddressBookMatch alloc];
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WBSAddressBookMatch initWithValue:property:key:identifier:label:uniqueID:](v5, "initWithValue:property:key:identifier:label:uniqueID:", v4, *MEMORY[0x1E0D89D80], 0, 0, 0, v6);
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)notifyKeychainWasDirectlyAffectedBySafari
{
  -[WBSKeychainCredentialNotificationMonitor triggerExternalNotification](self->_keychainMonitor, "triggerExternalNotification");
}

- (BOOL)textFieldMetadataMeetsRequirementsForAutomaticStrongPasswordTreatment:(id)a3 form:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "classification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("new-password"));

    if ((v10 & 1) != 0
      && (v11 = objc_msgSend(v5, "maxLength"), v11 >= objc_msgSend(MEMORY[0x1E0D89C88], "minimumPasswordLength")))
    {
      objc_msgSend(v5, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "length") == 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)textFieldIsEligibleForAutomaticStrongPassword:(id)a3 form:(id)a4 ignorePreviousDecision:(BOOL)a5 textFieldCurrentlyContainsStrongPassword:(BOOL *)a6
{
  id v10;
  id v11;
  uint64_t v12;

  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v10, "autoFillButtonType");
  if (a6)
    *a6 = v12 == 3;
  if (v12 == 3)
  {
    a5 = 1;
  }
  else if (-[WBSFormDataController textFieldMetadataMeetsRequirementsForAutomaticStrongPasswordTreatment:form:](self, "textFieldMetadataMeetsRequirementsForAutomaticStrongPasswordTreatment:form:", v10, v11))
  {
    if (objc_msgSend(v10, "lastAutoFillButtonType") != 3)
      a5 = 1;
  }
  else
  {
    a5 = 0;
  }

  return a5;
}

- (BOOL)frameIsKnownToAskForCredentialsFromOtherServicesFromAncestorFrameURLs:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_highLevelDomainForPasswordManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_highLevelDomainForPasswordManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
      v5 = 0;
    else
      v5 = -[WBSAutoFillQuirksManager isDomainKnownToAskForCredentialsForOtherServicesWhenEmbeddedAsThirdParty:](self->_autoFillQuirksManager, "isDomainKnownToAskForCredentialsForOtherServicesWhenEmbeddedAsThirdParty:", v9);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)password:(id)a3 shouldBeConsideredEqualToExistingPassword:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = (objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0
    || +[WBSFormDataController _password:appearsToBeASixDigitCodeAppendedToPassword:](WBSFormDataController, "_password:appearsToBeASixDigitCodeAppendedToPassword:", v5, v6)|| +[WBSFormDataController _password:appearsToBeMoreThanOneSymbolAppendedToPassword:](WBSFormDataController, "_password:appearsToBeMoreThanOneSymbolAppendedToPassword:", v5, v6);

  return v7;
}

+ (BOOL)_password:(id)a3 appearsToBeASixDigitCodeAppendedToPassword:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length") && !objc_msgSend(v5, "rangeOfString:", v6))
  {
    objc_msgSend(v5, "substringFromIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length") == 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invertedSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v11) == 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_password:(id)a3 appearsToBeMoreThanOneSymbolAppendedToPassword:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v5, "length") && !objc_msgSend(v5, "rangeOfString:", v6))
  {
    objc_msgSend(v5, "substringFromIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "length") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("@"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v14 = v13;
      v8 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
      {
        v15 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v14);
            objc_msgSend(v10, "stringByTrimmingCharactersInSet:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "length") == 0;

            if (v18)
            {
              LOBYTE(v8) = 1;
              goto LABEL_18;
            }
          }
          v8 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_18:

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)isFieldUnidentified:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  objc_msgSend(v3, "addressBookLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || (objc_msgSend(v3, "looksLikePasswordCredentialField") & 1) != 0)
    LOBYTE(v5) = 0;
  else
    v5 = objc_msgSend(v3, "looksLikeIgnoredDataTypeField") ^ 1;

  return v5;
}

- (WBSAutoFillQuirksManager)autoFillQuirksManager
{
  return self->_autoFillQuirksManager;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_agentProxy, 0);
  objc_storeStrong(&self->_keybagCallbackToken, 0);
  objc_storeStrong((id *)&self->_recentAutoFillEvents, 0);
  objc_storeStrong((id *)&self->_mapOfHighLevelDomainToLastAutomaticFormSubmission, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_cachedBirthdayAndLocalizedStrings, 0);
  objc_storeStrong((id *)&self->_preferredLabelForUniqueIDOfPersonMap, 0);
  objc_storeStrong((id *)&self->_recentlyUsedAutoFillSets, 0);
  objc_storeStrong((id *)&self->_domainToLastUsedUsernameAndProtectionSpace, 0);
  objc_storeStrong((id *)&self->_preferredLabelsMap, 0);
  objc_storeStrong((id *)&self->_valuesDB, 0);
  objc_storeStrong((id *)&self->_completionDB, 0);
  objc_storeStrong(&self->_keychainNotificationRegistrationToken, 0);
  objc_storeStrong((id *)&self->_keychainMonitor, 0);
}

- (void)allFormDataForSaving
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Serialization of completion DB to property list failed with error: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)getFormFieldValues:(NSObject *)a3 andFieldToFocus:withSingleCreditCardData:inField:inForm:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a3, (uint64_t)a3, "Found %lu controls, but expected 3 or fewer.", (uint8_t *)a1);
}

- (void)getFormFieldValues:(uint64_t)a3 andFieldToFocus:withSingleCreditCardData:inField:inForm:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Could not fill date into field with max length %lu.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)getFormFieldValues:(uint64_t)a3 andFieldToFocus:withSingleCreditCardData:inField:inForm:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1A3D90000, a1, a3, "Could not fill date into single non-text field", v3);
}

@end
