@implementation TIAppAutofillManager

+ (id)sharedInstance
{
  void *v2;
  uint64_t *v3;

  v2 = (void *)__testingInstance;
  if (!__testingInstance)
  {
    v3 = &+[TILanguageModelLoaderManager recipientRecords]::__recipientRecords;
    v2 = (void *)instance;
    if (!instance)
    {
      if (sharedInstance_onceToken != -1)
      {
        dispatch_once(&sharedInstance_onceToken, &__block_literal_global_148);
        v3 = &+[TILanguageModelLoaderManager recipientRecords]::__recipientRecords;
      }
      v2 = (void *)v3[214];
    }
  }
  return v2;
}

- (void)pushQueuedCredentialIfNecessaryForKeyboardState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[TIAppAutofillManager queuedCustomInfo](self, "queuedCustomInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v14, "needAutofill") & 1) == 0
    && objc_msgSend(v14, "autofillMode") != 1
    && objc_msgSend(v14, "autofillMode") != 3)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v14, "documentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAppAutofillManager queuedCustomInfo](self, "queuedCustomInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    +[TIKeyboardInputManagerLoader sharedLoader](TIKeyboardInputManagerLoader, "sharedLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "interactingConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "remoteObjectProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAppAutofillManager queuedCustomInfo](self, "queuedCustomInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "customInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "processPayloadInfo:", v12);

      -[TIAppAutofillManager setQueuedCustomInfo:](self, "setQueuedCustomInfo:", 0);
    }
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v14, "clientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAppAutofillManager setClientIdentifierForLastKeyboardSync:](self, "setClientIdentifierForLastKeyboardSync:", v13);

}

- (TICredentialCustomInfo)queuedCustomInfo
{
  return self->_queuedCustomInfo;
}

- (void)setClientIdentifierForLastKeyboardSync:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifierForLastKeyboardSync, a3);
}

- (void)reset
{
  -[SFAppAutoFillOneTimeCodeProvider removeObserverForOneTimeCode:](self->_oneTimeCodeProvider, "removeObserverForOneTimeCode:", self);
}

- (id)initPrivate
{
  TIAppAutofillManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *privateQueue;
  TIKeyboardSecureCandidateRenderer *v6;
  TIKeyboardSecureCandidateRenderer *secureCandidateRenderer;
  SFAppAutoFillOneTimeCodeProvider *v8;
  SFAppAutoFillOneTimeCodeProvider *oneTimeCodeProvider;
  void *v10;
  objc_class *v11;
  SFAppAutoFillPasskeyProvider *v12;
  SFAppAutoFillPasskeyProvider *passkeyProvider;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v15.receiver = self;
  v15.super_class = (Class)TIAppAutofillManager;
  v2 = -[TIAppAutofillManager init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.TextInput.appAutofillManager", v3);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TIKeyboardSecureCandidateRenderer);
    secureCandidateRenderer = v2->_secureCandidateRenderer;
    v2->_secureCandidateRenderer = v6;

    v8 = (SFAppAutoFillOneTimeCodeProvider *)objc_alloc_init(MEMORY[0x1E0D8A018]);
    oneTimeCodeProvider = v2->_oneTimeCodeProvider;
    v2->_oneTimeCodeProvider = v8;

    -[SFAppAutoFillOneTimeCodeProvider addObserver:](v2->_oneTimeCodeProvider, "addObserver:", v2);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v10 = (void *)getSFAppAutoFillPasskeyProviderClass_softClass;
    v20 = getSFAppAutoFillPasskeyProviderClass_softClass;
    if (!getSFAppAutoFillPasskeyProviderClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getSFAppAutoFillPasskeyProviderClass_block_invoke;
      v16[3] = &unk_1EA107058;
      v16[4] = &v17;
      __getSFAppAutoFillPasskeyProviderClass_block_invoke((uint64_t)v16);
      v10 = (void *)v18[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v17, 8);
    v12 = (SFAppAutoFillPasskeyProvider *)objc_alloc_init(v11);
    passkeyProvider = v2->_passkeyProvider;
    v2->_passkeyProvider = v12;

  }
  return v2;
}

- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer
{
  return self->_secureCandidateRenderer;
}

- (void)obtainCredential:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  TICredentialCustomInfo *v12;
  TICredentialCustomInfo *v13;
  id v14;

  -[TIAppAutofillManager customInfoFromCredential:](self, "customInfoFromCredential:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[TIKeyboardInputManagerLoader sharedLoader](TIKeyboardInputManagerLoader, "sharedLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactingConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[TIXPCUtils obtainBundleIdentifierFromConnection:](TIXPCUtils, "obtainBundleIdentifierFromConnection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  -[TIAppAutofillManager clientIdentifierForLastKeyboardSync](self, "clientIdentifierForLastKeyboardSync");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAppAutofillManager clientIdentifierForLastAutofillGeneration](self, "clientIdentifierForLastAutofillGeneration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
  {

    goto LABEL_6;
  }
  -[TIAppAutofillManager clientIdentifierForLastKeyboardSync](self, "clientIdentifierForLastKeyboardSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if (!v10)
  {
LABEL_6:
    v12 = [TICredentialCustomInfo alloc];
    -[TIAppAutofillManager documentIdentifierForLastAutofillGeneration](self, "documentIdentifierForLastAutofillGeneration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TICredentialCustomInfo initWithCustomInfo:documentIdentifier:](v12, "initWithCustomInfo:documentIdentifier:", v14, v11);
    -[TIAppAutofillManager setQueuedCustomInfo:](self, "setQueuedCustomInfo:", v13);

    goto LABEL_7;
  }
  objc_msgSend(v5, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processPayloadInfo:", v14);
LABEL_7:

}

- (BOOL)isValidedString:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  if (isValidedString__onceToken != -1)
  {
    dispatch_once(&isValidedString__onceToken, &__block_literal_global_100);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", isValidedString__invalidCharacterSet) == 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return v5;
}

- (id)customInfoFromCredential:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIAppAutofillManager isValidedString:](self, "isValidedString:", v5))
  {
    objc_msgSend(v4, "user");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1EA1081D0;
  }

  objc_msgSend(v4, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIAppAutofillManager isValidedString:](self, "isValidedString:", v7))
  {
    objc_msgSend(v4, "password");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1EA1081D0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v4, "oneTimeCode"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = -[TIAppAutofillManager isValidedString:](self, "isValidedString:", v9),
        v9,
        v10))
  {
    v11 = *MEMORY[0x1E0DBE350];
    v18[0] = *MEMORY[0x1E0DBE370];
    v18[1] = v11;
    v19[0] = v6;
    v19[1] = v8;
    v18[2] = *MEMORY[0x1E0DBE340];
    objc_msgSend(v4, "oneTimeCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = *MEMORY[0x1E0DBE350];
    v16[0] = *MEMORY[0x1E0DBE370];
    v16[1] = v14;
    v17[0] = v6;
    v17[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)localizedCellularAutofillStringForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {
    TIAppAutofillOSLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Localized Cellular autofill text is nil"), "-[TIAppAutofillManager localizedCellularAutofillStringForKey:defaultValue:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    v11 = v6;

    v9 = v11;
  }

  return v9;
}

- (BOOL)hasAutofillContextEntitlementForConnection:(id)a3
{
  id v3;
  void *v4;
  __SecTask *v5;
  __SecTask *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v11;
  CFErrorRef error;
  audit_token_t token;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(&token, 0, sizeof(token));
  v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    v6 = v5;
    error = 0;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, CFSTR("com.apple.textInput.autofillContext"), &error);
    v8 = objc_msgSend(v7, "BOOLValue");

    if (error)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Cannot obtain autofill context: %@"), "-[TIAppAutofillManager hasAutofillContextEntitlementForConnection:]", error);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasCoreTelephonyEntitlementForConnection:(id)a3
{
  id v3;
  void *v4;
  __SecTask *v5;
  __SecTask *v6;
  void *v7;
  NSObject *v8;
  char v9;
  void *v11;
  _QWORD v12[5];
  CFErrorRef error;
  audit_token_t token;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(&token, 0, sizeof(token));
  v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    v6 = v5;
    error = 0;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, CFSTR("com.apple.CommCenter.fine-grained"), &error);
    if (error)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Cannot obtain core telephony entitlement: %@"), "-[TIAppAutofillManager hasCoreTelephonyEntitlementForConnection:]", error);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      CFRelease(error);
    }
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __65__TIAppAutofillManager_hasCoreTelephonyEntitlementForConnection___block_invoke;
        v12[3] = &unk_1EA0F9E78;
        v12[4] = &v15;
        objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
      }
    }
    CFRelease(v6);

  }
  v9 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  id location;
  _QWORD aBlock[4];
  id v55;
  id v56;
  uint8_t buf[16];
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TIAppAutofillManager privateQueue](self, "privateQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke;
  aBlock[3] = &unk_1EA100CE0;
  v12 = v11;
  v55 = v12;
  v13 = v10;
  v56 = v13;
  v14 = _Block_copy(aBlock);
  objc_msgSend(v9, "documentIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TIAppAutofillManager setDocumentIdentifierForLastAutofillGeneration:](self, "setDocumentIdentifierForLastAutofillGeneration:", 0);
    -[TIAppAutofillManager setClientIdentifierForLastAutofillGeneration:](self, "setClientIdentifierForLastAutofillGeneration:", 0);
    if (+[TIAppAutofillManager _simulatesAutofillCandidates](TIAppAutofillManager, "_simulatesAutofillCandidates")|| (objc_msgSend(MEMORY[0x1E0D8A060], "isAppAutoFillAvailable") & 1) != 0)
    {
      v40 = v14;
      v41 = v13;
      v43 = v8;
      objc_msgSend(v9, "documentIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v16, "copy");

      objc_msgSend(v9, "clientIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v17, "copy");

      objc_msgSend(v9, "textInputTraits");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textContentType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "copy");

      objc_msgSend(v9, "autofillContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "copy");

      -[TIAppAutofillManager passkeyProvider](self, "passkeyProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      *(_OWORD *)buf = 0u;
      v58 = 0u;
      if (v24)
        objc_msgSend(v24, "auditToken");
      objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0DBE418]);
      v26 = objc_claimAutoreleasedReturnValue();
      v42 = v12;
      if (v26)
      {
        v27 = (void *)v26;
        +[TIXPCUtils obtainBundleIdentifierFromConnection:](TIXPCUtils, "obtainBundleIdentifierFromConnection:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0
          || -[TIAppAutofillManager hasAutofillContextEntitlementForConnection:](self, "hasAutofillContextEntitlementForConnection:", v25))
        {

LABEL_16:
          objc_initWeak(&location, self);
          -[TIAppAutofillManager privateQueue](self, "privateQueue");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = *(_OWORD *)buf;
          v44 = v23;
          v45 = v22;
          v46 = v20;
          v47 = v27;
          v52 = v58;
          v37 = v27;
          v36 = v20;
          v31 = v22;
          v32 = v23;
          objc_copyWeak(&v50, &location);
          v8 = v43;
          v48 = v43;
          v14 = v40;
          v49 = v40;
          v33 = v38;
          v34 = v39;
          TIDispatchAsync();

          objc_destroyWeak(&v50);
          objc_destroyWeak(&location);

          v13 = v41;
          v12 = v42;
          goto LABEL_17;
        }

      }
      +[TIXPCUtils obtainApplicationIdentifierFromConnection:](TIXPCUtils, "obtainApplicationIdentifierFromConnection:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else
  {
    TIAppAutofillOSLogFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s The documentIdentifier is nil, do not try to generate autofill suggestions."), "-[TIAppAutofillManager generateAutofillFormCandidatesWithRenderTraits:withKeyboardState:completion:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v35;
      _os_log_debug_impl(&dword_1DA6F2000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  (*((void (**)(void *, _QWORD))v14 + 2))(v14, MEMORY[0x1E0C9AA60]);
LABEL_17:

}

- (void)_finishAutofillFormCandidatesOnMainThreadWithCredentials:(id)a3 renderTraits:(id)a4 documentIdentifier:(id)a5 clientIdentifier:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  TIAppAutofillManager *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void (**v47)(id, void *);
  id v48;
  void *v49;
  void *v50;
  __CFString *v51;
  id v52;
  id v53;
  void *v54;
  void *v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v48 = a6;
  v47 = (void (**)(id, void *))a7;
  v14 = objc_msgSend(v11, "count");
  v49 = v13;
  if (v14 >= objc_msgSend(v12, "maxCellCount"))
  {
    v15 = objc_msgSend(v12, "maxCellCount");
    objc_msgSend(v12, "setCellRenderingStyle:", 1);
  }
  else
  {
    v15 = objc_msgSend(v11, "count");
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("SAFARI_CREDENTIAL_SITE_LONG");
  if (v15 <= 1)
  {
    v17 = CFSTR("SAFARI_PASSKEY_SITE_LONG");
  }
  else
  {
    v16 = CFSTR("SAFARI_CREDENTIAL_SITE_SHORT");
    v17 = CFSTR("SAFARI_CREDENTIAL_SITE_SHORT");
  }
  v18 = v16;
  v51 = v17;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2050000000;
  v19 = (void *)getSFAutoFillPasskeyClass_softClass;
  v61 = getSFAutoFillPasskeyClass_softClass;
  if (!getSFAutoFillPasskeyClass_softClass)
  {
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __getSFAutoFillPasskeyClass_block_invoke;
    v57[3] = &unk_1EA107058;
    v57[4] = &v58;
    __getSFAutoFillPasskeyClass_block_invoke((uint64_t)v57);
    v19 = (void *)v59[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v58, 8);
  v21 = objc_msgSend(v11, "count");
  if (v21)
  {
    v22 = v21;
    for (i = 0; v22 != i; ++i)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[TIAppAutofillManager _secureCandidateForPasswordCredential:fromLocalizedStringKey:](self, "_secureCandidateForPasswordCredential:fromLocalizedStringKey:", v24, v18);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v20 || (objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_17;
        -[TIAppAutofillManager _secureCandidateForPasskey:fromLocalizedStringKey:](self, "_secureCandidateForPasskey:fromLocalizedStringKey:", v24, v51);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v26 = (void *)v25;
      objc_msgSend(v56, "addObject:", v25);

LABEL_17:
    }
  }
  v46 = v18;
  +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "clearRegistrations");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v56, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v12;
  objc_msgSend(v29, "slotIDsFromSecureCandidates:withRenderTraits:outWidths:", v56, v12, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v30, "count"))
  {
    v31 = 0;
    v52 = v20;
    v53 = v11;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndex:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      v33 = self;
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = 0;
          goto LABEL_26;
        }
        -[TIAppAutofillManager _autoFillPayloadForPasskey:keyboardInfoType:](self, "_autoFillPayloadForPasskey:keyboardInfoType:", v32, v57);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
LABEL_26:
      objc_msgSend(v30, "objectAtIndex:", v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0DBDBE8], "secureCandidateForInput:slotID:customInfoType:", &stru_1EA1081D0, v36, v57[0]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count") <= v31)
      {
        objc_msgSend(v37, "setSecureCandidateWidth:", 0.0);
      }
      else
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", v31);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "floatValue");
        objc_msgSend(v37, "setSecureCandidateWidth:", v39);

      }
      objc_msgSend(v56, "objectAtIndexedSubscript:", v31);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSecureCandidateHash:", objc_msgSend(v40, "candidateHash"));

      objc_msgSend(v54, "addObject:", v37);
      -[TIAppAutofillManager secureCandidateRenderer](v33, "secureCandidateRenderer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "secureCandidateCache");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v36);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setObject:forKey:", v20, v43);

      +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "registerSlotID:", v36);

      ++v31;
      v20 = v52;
      v11 = v53;
      if (v31 >= objc_msgSend(v30, "count"))
        goto LABEL_32;
    }
    v33 = self;
    -[TIAppAutofillManager _autoFillPayloadForPasswordCredential:keyboardInfoType:](self, "_autoFillPayloadForPasswordCredential:keyboardInfoType:", v32, v57);
    v34 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v20 = (id)v34;
    goto LABEL_26;
  }
LABEL_32:
  -[TIAppAutofillManager setDocumentIdentifierForLastAutofillGeneration:](self, "setDocumentIdentifierForLastAutofillGeneration:", v49);
  -[TIAppAutofillManager setClientIdentifierForLastAutofillGeneration:](self, "setClientIdentifierForLastAutofillGeneration:", v48);
  objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:customInfoType:", &stru_1EA1081D0, &stru_1EA1081D0, 32);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v45);
  v47[2](v47, v54);

}

- (id)generateOneTimeCodeCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  float v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  char v54;
  SFAppAutoFillOneTimeCodeProvider *oneTimeCodeProvider;
  uint64_t v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  objc_class *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  float v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  _BOOL4 v105;
  void *v106;
  id v107;
  void *v108;
  NSObject *group;
  _OWORD v110[2];
  _QWORD v111[4];
  NSObject *v112;
  __int128 *p_buf;
  void *v114;
  void *v115;
  uint8_t v116[16];
  __int128 buf;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "autofillContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("_WebViewURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }
  objc_msgSend(v7, "textInputTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("one-time-code"));

  -[TIAppAutofillManager dateOfLastPasswordAutoFill](self, "dateOfLastPasswordAutoFill");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAppAutofillManager dateOfLastPasswordAutoFill](self, "dateOfLastPasswordAutoFill");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v15);
    v17 = v16 <= 30.0;

  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIXPCUtils obtainApplicationIdentifierFromConnection:](TIXPCUtils, "obtainApplicationIdentifierFromConnection:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.InputUI"));
  TIAppAutofillOSLogFacility();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v20)
  {
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Grabbing application identifier from keyboardState.autofillContext."), "-[TIAppAutofillManager generateOneTimeCodeCandidatesWithRenderTraits:withKeyboardState:]");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v92;
      _os_log_debug_impl(&dword_1DA6F2000, v21, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(v7, "autofillContext");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v21, "objectForKey:", *MEMORY[0x1E0DBE418]);
    v23 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v23;
  }
  else if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Grabbing application identifier from xpc connection."), "-[TIAppAutofillManager generateOneTimeCodeCandidatesWithRenderTraits:withKeyboardState:]");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v93;
    _os_log_debug_impl(&dword_1DA6F2000, v21, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

  }
  if (v19)
  {
    v105 = v17;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v118 = 0x3032000000;
    v119 = __Block_byref_object_copy__77;
    v120 = __Block_byref_object_dispose__78;
    v121 = 0;
    objc_msgSend(v7, "autofillContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE420]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    group = dispatch_group_create();
    objc_opt_class();
    v108 = v25;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_group_enter(group);
      v26 = (void *)MEMORY[0x1E0D8A060];
      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __88__TIAppAutofillManager_generateOneTimeCodeCandidatesWithRenderTraits_withKeyboardState___block_invoke;
      v111[3] = &unk_1EA0F9F18;
      p_buf = &buf;
      v27 = group;
      v112 = v27;
      objc_msgSend(v26, "getOneTimeCodeCredentialsForAppWithAppID:externallyVerifiedAndApprovedSharedWebCredentialDomains:websiteURL:completionHandler:", v19, v25, v9, v111);
      v28 = dispatch_time(0, 200000000);
      if (dispatch_group_wait(v27, v28))
      {
        TIAppAutofillOSLogFacility();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Timed out while fetching external one time code credential identities"), "-[TIAppAutofillManager generateOneTimeCodeCandidatesWithRenderTraits:withKeyboardState:]");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v116 = 138412290;
          *(_QWORD *)&v116[4] = v95;
          _os_log_error_impl(&dword_1DA6F2000, v29, OS_LOG_TYPE_ERROR, "%@", v116, 0xCu);

        }
      }
      v30 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      if (v30)
      {
        v99 = v19;
        v101 = v18;
        v103 = v9;
        v31 = (void *)MEMORY[0x1E0C99D20];
        -[TIAppAutofillManager _secureCandidateForPasswordCredential:fromLocalizedStringKey:](self, "_secureCandidateForPasswordCredential:fromLocalizedStringKey:", v30, CFSTR("SAFARI_CREDENTIAL_SITE_SHORT"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "arrayWithObject:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)v116 = 0;
        -[TIAppAutofillManager _autoFillPayloadForPasswordCredential:keyboardInfoType:](self, "_autoFillPayloadForPasswordCredential:keyboardInfoType:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v116);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v33, "count"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "slotIDsFromSecureCandidates:withRenderTraits:outWidths:", v33, v6, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v106 = v7;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "unsignedIntValue");

        objc_msgSend(MEMORY[0x1E0DBDBE8], "secureCandidateForInput:slotID:customInfoType:", &stru_1EA1081D0, v39, *(_QWORD *)v116);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "firstObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "floatValue");
        objc_msgSend(v40, "setSecureCandidateWidth:", v42);

        objc_msgSend(v33, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setSecureCandidateHash:", objc_msgSend(v43, "candidateHash"));

        -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "secureCandidateCache");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v39);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKey:", v34, v46);

        v7 = v106;
        +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "registerSlotID:", v39);

        objc_msgSend(v106, "documentIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v48, "copy");
        -[TIAppAutofillManager setDocumentIdentifierForLastAutofillGeneration:](self, "setDocumentIdentifierForLastAutofillGeneration:", v49);

        objc_msgSend(v106, "clientIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v50, "copy");
        -[TIAppAutofillManager setClientIdentifierForLastAutofillGeneration:](self, "setClientIdentifierForLastAutofillGeneration:", v51);

        if (v40)
        {
          v115 = v40;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v52 = 0;
        }
        v18 = v101;

        v58 = v112;
        v9 = v103;
        v19 = v99;
        v25 = v108;
        goto LABEL_50;
      }

    }
    v54 = objc_opt_respondsToSelector();
    oneTimeCodeProvider = self->_oneTimeCodeProvider;
    if ((v54 & 1) != 0)
    {
      if (v12 | v105)
        v56 = 2;
      else
        v56 = 0;
      -[SFAppAutoFillOneTimeCodeProvider currentOneTimeCodesWithAppIdentifier:website:usernameHint:fieldClassification:](self->_oneTimeCodeProvider, "currentOneTimeCodesWithAppIdentifier:website:usernameHint:fieldClassification:", v19, v9, self->_lastAutofilledUsername, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "firstObject");
      v58 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = v6;
      v60 = v19;
      +[TIKeyboardInputManagerLoader sharedLoader](TIKeyboardInputManagerLoader, "sharedLoader");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "interactingConnection");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (v61)
        objc_msgSend(v61, "auditToken");
      else
        memset(v110, 0, sizeof(v110));
      if (v12 | v105)
        v63 = 2;
      else
        v63 = 0;
      -[SFAppAutoFillOneTimeCodeProvider currentOneTimeCodesWithAuditToken:website:usernameHint:fieldClassification:](oneTimeCodeProvider, "currentOneTimeCodesWithAuditToken:website:usernameHint:fieldClassification:", v110, v9, self->_lastAutofilledUsername, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "firstObject");
      v58 = (id)objc_claimAutoreleasedReturnValue();

      v19 = v60;
      v6 = v59;
      v25 = v108;
    }

    if (!v58)
    {
      v52 = (void *)MEMORY[0x1E0C9AA60];
LABEL_51:

      _Block_object_dispose(&buf, 8);
      goto LABEL_52;
    }
    v100 = v19;
    v102 = v18;
    v104 = v9;
    v107 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedTitleForContext:", 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "displayCode");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedSubtitleForContext:", 0);
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = (void *)v68;
    if (v67)
      v70 = v67;
    else
      v70 = (void *)v68;
    v71 = (objc_class *)MEMORY[0x1E0DBDDD8];
    v72 = v70;
    v73 = (void *)objc_msgSend([v71 alloc], "initWithSecureHeader:secureContent:secureFormattedContent:input:truncationSentinel:", v66, v72, v69, &stru_1EA1081D0, 0);

    objc_msgSend(v65, "addObject:", v73);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v65, "count"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v6;
    objc_msgSend(v75, "slotIDsFromSecureCandidates:withRenderTraits:outWidths:", v65, v6, v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "code");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v76;
    objc_msgSend(v76, "firstObject");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "unsignedIntegerValue");

    v80 = objc_msgSend(v58, "source");
    v81 = 0;
    if (v80 <= 2)
      v81 = qword_1DA90F448[v80];
    objc_msgSend(MEMORY[0x1E0DBDBE8], "secureCandidateForInput:slotID:customInfoType:", v77, v79, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v74;
    objc_msgSend(v74, "firstObject");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "floatValue");
    objc_msgSend(v82, "setSecureCandidateWidth:", v84);

    objc_msgSend(v65, "firstObject");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setSecureCandidateHash:", objc_msgSend(v85, "candidateHash"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setObject:forKeyedSubscript:", v77, *MEMORY[0x1E0DBE340]);
    -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "secureCandidateCache");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v79);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setObject:forKey:", v86, v89);

    +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "registerSlotID:", v79);

    -[SFAppAutoFillOneTimeCodeProvider addObserver:forOneTimeCode:](self->_oneTimeCodeProvider, "addObserver:forOneTimeCode:", self, v58);
    if (v82)
    {
      v114 = v82;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = 0;
    }
    v9 = v104;
    v25 = v108;

    v6 = v98;
    v19 = v100;
    v7 = v107;
    v18 = v102;
LABEL_50:

    goto LABEL_51;
  }
  TIAppAutofillOSLogFacility();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s The application has no appID."), "-[TIAppAutofillManager generateOneTimeCodeCandidatesWithRenderTraits:withKeyboardState:]");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v94;
    _os_log_error_impl(&dword_1DA6F2000, v53, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

  }
  v52 = (void *)MEMORY[0x1E0C9AA60];
LABEL_52:

  return v52;
}

- (id)generateCellularCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  id v29;
  objc_class *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  id *v42;
  id v43;
  void *v44;
  void *v45;
  float v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  objc_class *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  id *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  NSObject *v81;
  __CFString *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  __int128 buf;
  Class (*v95)(uint64_t);
  void *v96;
  uint64_t *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "textInputTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textContentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DBE998];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DBE998]))
  {

    goto LABEL_4;
  }
  objc_msgSend(v7, "textInputTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textContentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0DBE9A0]);

  if ((v13 & 1) != 0)
  {
LABEL_4:
    deviceClassString();
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInputTraits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textContentType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v10);

    v18 = (void *)MEMORY[0x1E0CB3940];
    v80 = (void *)v14;
    if (v17)
    {
      -[TIAppAutofillManager localizedCellularAutofillStringForKey:defaultValue:](self, "localizedCellularAutofillStringForKey:defaultValue:", CFSTR("AUTOFILL_CELLULAR_EID_TITLE"), *MEMORY[0x1E0DBE3D8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 0;
      v20 = (id *)&v88;
      objc_msgSend(v18, "stringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), &v88, v14);
    }
    else
    {
      -[TIAppAutofillManager localizedCellularAutofillStringForKey:defaultValue:](self, "localizedCellularAutofillStringForKey:defaultValue:", CFSTR("AUTOFILL_CELLULAR_IMEI_TITLE"), *MEMORY[0x1E0DBE3E0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 0;
      v20 = (id *)&v87;
      objc_msgSend(v18, "stringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), &v87, v14);
    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v79 = *v20;
    v22 = &stru_1EA1081D0;
    if (v21)
      v22 = v21;
    v82 = v22;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAppAutofillManager coreTelephonyMockObject](self, "coreTelephonyMockObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "textInputTraits");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "textContentType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", v10);
    v84 = v7;
    if (v23)
    {
      v27 = v26 ^ 1u;

      -[TIAppAutofillManager coreTelephonyMockObject](self, "coreTelephonyMockObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "retrieveDeviceIdentifier:", v27);
      v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

      objc_msgSend(v6, "setShouldForceDoubleLineCandidateForCellularAutofill:", 1);
      v30 = (objc_class *)MEMORY[0x1E0DBDDD8];
      v29 = v29;
      v77 = objc_msgSend([v30 alloc], "initWithSecureHeader:secureContent:secureFormattedContent:input:truncationSentinel:", v82, v29, v29, v29, 0);
      objc_msgSend(v83, "addObject:");
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v83, "count"));
      v31 = objc_claimAutoreleasedReturnValue();
      -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v6;
      objc_msgSend(v32, "slotIDsFromSecureCandidates:withRenderTraits:outWidths:", v83, v6, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "unsignedIntegerValue");

      objc_msgSend(v84, "textInputTraits");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "textContentType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "isEqualToString:", v10))
        v38 = 0x2000;
      else
        v38 = 0x4000;

      objc_msgSend(v84, "textInputTraits");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "textContentType");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqualToString:", v10);
      v42 = (id *)MEMORY[0x1E0DBE318];
      if (!v41)
        v42 = (id *)MEMORY[0x1E0DBE320];
      v43 = *v42;

      objc_msgSend(MEMORY[0x1E0DBDBE8], "secureCandidateForInput:slotID:customInfoType:", v29, v35, v38);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v31;
      -[NSObject firstObject](v31, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "floatValue");
      objc_msgSend(v44, "setSecureCandidateWidth:", v46);

      objc_msgSend(v83, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setSecureCandidateHash:", objc_msgSend(v47, "candidateHash"));

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v29, v43);

      -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "secureCandidateCache");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v35);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setObject:forKey:", v48, v51);

      +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "registerSlotID:", v35);

      if (v44)
      {
        v93 = v44;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = 0;
      }
      v66 = v79;
      v65 = v80;

      v6 = v76;
      v55 = (void *)v77;
LABEL_36:
      v64 = v82;
      v7 = v84;
LABEL_37:

      goto LABEL_38;
    }
    if (v26)
      v54 = 1;
    else
      v54 = 2;

    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[TIAppAutofillManager hasCoreTelephonyEntitlementForConnection:](self, "hasCoreTelephonyEntitlementForConnection:", v55))
    {
      TIAppAutofillOSLogFacility();
      v67 = objc_claimAutoreleasedReturnValue();
      v81 = v67;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s The application does not have the required entitlement."), "-[TIAppAutofillManager generateCellularCandidatesWithRenderTraits:withKeyboardState:]");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v73;
        _os_log_error_impl(&dword_1DA6F2000, v67, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

      }
      v29 = 0;
      v53 = (void *)MEMORY[0x1E0C9AA60];
      v66 = v79;
      v65 = v80;
      goto LABEL_36;
    }
    v78 = v55;
    v89 = 0;
    v90 = &v89;
    v91 = 0x2050000000;
    v56 = (void *)getCoreTelephonyClientClass_softClass;
    v92 = getCoreTelephonyClientClass_softClass;
    if (!getCoreTelephonyClientClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v95 = __getCoreTelephonyClientClass_block_invoke;
      v96 = &unk_1EA107058;
      v97 = &v89;
      __getCoreTelephonyClientClass_block_invoke((uint64_t)&buf);
      v56 = (void *)v90[3];
    }
    v57 = objc_retainAutorelease(v56);
    _Block_object_dispose(&v89, 8);
    v58 = [v57 alloc];
    v59 = objc_msgSend(v58, "initWithQueue:", MEMORY[0x1E0C80D38]);
    objc_msgSend(v84, "autofillContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKey:", *MEMORY[0x1E0DBE428]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
    {
      +[TIXPCUtils obtainBundleIdentifierFromConnection:](TIXPCUtils, "obtainBundleIdentifierFromConnection:", v78);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v81 = v59;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v86 = 0;
      v62 = (id *)&v86;
      -[NSObject retrieveDeviceIdentifier:clientBundleIdentifier:showAlert:error:](v59, "retrieveDeviceIdentifier:clientBundleIdentifier:showAlert:error:", v54, v61, 0, &v86);
      v63 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        TIAppAutofillOSLogFacility();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Could not link CoreTelephony."), "-[TIAppAutofillManager generateCellularCandidatesWithRenderTraits:withKeyboardState:]");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v75;
          _os_log_error_impl(&dword_1DA6F2000, v70, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

        }
        v29 = 0;
        v66 = v79;
        v65 = v80;
        v64 = v82;
        v7 = v84;
        goto LABEL_49;
      }
      v85 = 0;
      v62 = (id *)&v85;
      -[NSObject retrieveDeviceIdentifier:error:](v59, "retrieveDeviceIdentifier:error:", v54, &v85);
      v63 = objc_claimAutoreleasedReturnValue();
    }
    v29 = (id)v63;
    v69 = *v62;
    v7 = v84;
    if (!v69)
    {

      v28 = v78;
      goto LABEL_11;
    }
    v70 = v69;
    TIAppAutofillOSLogFacility();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CoreTelephony client returned error on retrieveDeviceIdentifier:error: ERROR:%@"), "-[TIAppAutofillManager generateCellularCandidatesWithRenderTraits:withKeyboardState:]", v70);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v74;
      _os_log_error_impl(&dword_1DA6F2000, v71, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

    }
    v66 = v79;
    v65 = v80;
    v64 = v82;
LABEL_49:

    v53 = (void *)MEMORY[0x1E0C9AA60];
    v55 = v78;
    goto LABEL_37;
  }
  TIAppAutofillOSLogFacility();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s The text field has no text content type."), "-[TIAppAutofillManager generateCellularCandidatesWithRenderTraits:withKeyboardState:]");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v72;
    _os_log_error_impl(&dword_1DA6F2000, v64, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

  }
  v53 = (void *)MEMORY[0x1E0C9AA60];
LABEL_38:

  return v53;
}

- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  TIAppAutofillManager *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  char v31;
  unint64_t v32;
  _BOOL4 v33;
  uint64_t i;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  float v56;
  void *v57;
  void *v58;
  float v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void (**v75)(_QWORD, _QWORD);
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  TIAppAutofillManager *v83;
  void *v84;
  _QWORD v85[5];
  id v86;
  id v87;
  void (**v88)(_QWORD, _QWORD);
  _QWORD v89[4];
  dispatch_semaphore_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint8_t buf[4];
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TIAppAutofillManager setDocumentIdentifierForLastAutofillGeneration:](self, "setDocumentIdentifierForLastAutofillGeneration:", 0);
  v83 = self;
  -[TIAppAutofillManager setClientIdentifierForLastAutofillGeneration:](self, "setClientIdentifierForLastAutofillGeneration:", 0);
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__77;
  v96 = __Block_byref_object_dispose__78;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D8A060], "isAppAutoFillAvailable"))
  {
    v11 = dispatch_semaphore_create(0);
    objc_msgSend(v9, "textInputTraits");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "keyboardType") == 7;

    objc_msgSend(MEMORY[0x1E0D8A070], "sharedProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __114__TIAppAutofillManager_generateAutofillFormSuggestedUsernameWithRenderTraits_withKeyboardState_completionHandler___block_invoke;
    v89[3] = &unk_1EA0F9F18;
    v90 = v11;
    v91 = &v92;
    v15 = v11;
    objc_msgSend(v14, "suggestedUsersOfType:completionHandler:", v13, v89);

    v16 = dispatch_time(0, 200000000);
    dispatch_semaphore_wait(v15, v16);

  }
  if (_os_feature_enabled_impl() && objc_msgSend(v9, "autofillSubMode") == 7)
  {
    -[TIAppAutofillManager secureCandidateRenderer](v83, "secureCandidateRenderer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[TIAppAutofillManager secureCandidateRenderer](v83, "secureCandidateRenderer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:", CFSTR("SAFARI_HIDE_MY_EMAIL_SUGGESTION"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 && objc_msgSend(v19, "length"))
      {
LABEL_15:
        objc_msgSend(v8, "setHideMyEmailLocalizedText:", v19);
        objc_msgSend((id)v93[5], "insertObject:atIndex:", v19, 0);

        goto LABEL_16;
      }
    }
    else
    {
      TIAppAutofillOSLogFacility();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s self.secureCandidateRenderer is nil"), "-[TIAppAutofillManager generateAutofillFormSuggestedUsernameWithRenderTraits:withKeyboardState:completionHandler:]");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v99 = v74;
        _os_log_debug_impl(&dword_1DA6F2000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      v19 = 0;
    }
    TIAppAutofillOSLogFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Localized Hide My Email text is nil"), "-[TIAppAutofillManager generateAutofillFormSuggestedUsernameWithRenderTraits:withKeyboardState:completionHandler:]");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v99 = v73;
      _os_log_debug_impl(&dword_1DA6F2000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v22 = (id)*MEMORY[0x1E0DBE3E8];

    v19 = v22;
    goto LABEL_15;
  }
LABEL_16:
  v23 = objc_msgSend((id)v93[5], "count");
  v75 = (void (**)(_QWORD, _QWORD))v10;
  v76 = v8;
  if (v23 >= objc_msgSend(v8, "maxCellCount"))
    v24 = objc_msgSend(v8, "maxCellCount");
  else
    v24 = objc_msgSend((id)v93[5], "count");
  v25 = v24;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v24);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v25);
  v81 = objc_claimAutoreleasedReturnValue();
  v78 = v9;
  v26 = v83;
  if (v25)
  {
    objc_msgSend((id)v93[5], "objectAtIndex:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "containsString:", CFSTR("@"));

    if (v28)
    {
      v29 = 1;
      while (v25 != v29)
      {
        objc_msgSend((id)v93[5], "objectAtIndex:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "containsString:", CFSTR("@"));

        ++v29;
        if ((v31 & 1) == 0)
        {
          v32 = v29 - 1;
          goto LABEL_27;
        }
      }
      v32 = v25;
LABEL_27:
      v9 = v78;
      v33 = v32 < v25;
    }
    else
    {
      v33 = 1;
    }
    for (i = 0; i != v25; ++i)
    {
      objc_msgSend((id)v93[5], "objectAtIndex:", i);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = &stru_1EA1081D0;
      if (v33)
      {
        -[TIAppAutofillManager secureCandidateRenderer](v26, "secureCandidateRenderer");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:", CFSTR("SAFARI_CREDENTIAL_SUGGESTED_USERNAME"));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      if (_os_feature_enabled_impl() && objc_msgSend(v9, "autofillSubMode") == 7)
      {
        -[TIAppAutofillManager secureCandidateRenderer](v26, "secureCandidateRenderer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForKey:", CFSTR("SAFARI_HIDE_MY_EMAIL_SUGGESTION"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v35, "isEqualToString:", v39);

        if (v40)
        {

          v36 = &stru_1EA1081D0;
        }
        v9 = v78;
        v26 = v83;
      }
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD8]), "initWithSecureHeader:secureContent:secureFormattedContent:input:truncationSentinel:", v36, v35, v35, &stru_1EA1081D0, 0);
      objc_msgSend(v84, "addObject:", v41);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v84, "count"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAppAutofillManager secureCandidateRenderer](v26, "secureCandidateRenderer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "slotIDsFromSecureCandidates:withRenderTraits:outWidths:", v84, v76, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = v42;
  v82 = v44;
  if (objc_msgSend(v44, "count"))
  {
    v45 = 0;
    v77 = 0;
    v46 = 0;
    v79 = *MEMORY[0x1E0DBE368];
    v47 = 0.0;
    v48 = (void *)v81;
    do
    {
      objc_msgSend((id)v93[5], "objectAtIndex:", v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndex:", v45);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "unsignedIntegerValue");

      if (_os_feature_enabled_impl()
        && objc_msgSend(v78, "autofillSubMode") == 7
        && (-[TIAppAutofillManager secureCandidateRenderer](v83, "secureCandidateRenderer"),
            v52 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v52, "localizedStringForKey:", CFSTR("SAFARI_HIDE_MY_EMAIL_SUGGESTION")),
            v53 = (void *)objc_claimAutoreleasedReturnValue(),
            v54 = objc_msgSend(v49, "isEqualToString:", v53),
            v53,
            v52,
            v54))
      {
        v47 = 0.0;
        if (objc_msgSend(v42, "count") > v45)
        {
          objc_msgSend(v42, "objectAtIndexedSubscript:", v45);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "floatValue");
          v47 = v56;

        }
        objc_msgSend(v84, "objectAtIndexedSubscript:", v45);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v57, "candidateHash");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DBDBE8], "secureCandidateForInput:slotID:customInfoType:applicationKey:applicationBundleId:altDSID:", &stru_1EA1081D0, v51, 128, &stru_1EA1081D0, &stru_1EA1081D0, &stru_1EA1081D0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v42, "count") <= v45)
        {
          objc_msgSend(v57, "setSecureCandidateWidth:", 0.0);
        }
        else
        {
          objc_msgSend(v42, "objectAtIndexedSubscript:", v45);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "floatValue");
          objc_msgSend(v57, "setSecureCandidateWidth:", v59);

        }
        objc_msgSend(v84, "objectAtIndexedSubscript:", v45);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setSecureCandidateHash:", objc_msgSend(v60, "candidateHash"));

        objc_msgSend(v48, "addObject:", v57);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setObject:forKey:", v49, v79);
        -[TIAppAutofillManager secureCandidateRenderer](v83, "secureCandidateRenderer");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "secureCandidateCache");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v51);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setObject:forKey:", v61, v64);

        v48 = (void *)v81;
        +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "registerSlotID:", v51);

        v51 = v46;
        v42 = v80;
      }
      v44 = v82;

      ++v45;
      v46 = v51;
    }
    while (v45 < objc_msgSend(v82, "count"));
  }
  else
  {
    v51 = 0;
    v77 = 0;
    v47 = 0.0;
    v48 = (void *)v81;
  }
  if ((_os_feature_enabled_impl() & 1) == 0 || objc_msgSend(v78, "autofillSubMode") != 7 || !(_DWORD)v51)
    goto LABEL_63;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "autofillContext");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "objectForKey:", *MEMORY[0x1E0DBE418]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v68)
  {
    +[TIXPCUtils obtainApplicationIdentifierFromConnection:](TIXPCUtils, "obtainApplicationIdentifierFromConnection:", v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v78, "autofillContext");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", *MEMORY[0x1E0DBE428]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v70)
  {
    +[TIXPCUtils obtainBundleIdentifierFromConnection:](TIXPCUtils, "obtainBundleIdentifierFromConnection:", v66);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v70 || !v68)
  {

LABEL_63:
    objc_msgSend(v78, "documentIdentifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAppAutofillManager setDocumentIdentifierForLastAutofillGeneration:](v83, "setDocumentIdentifierForLastAutofillGeneration:", v71);

    objc_msgSend(v78, "clientIdentifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAppAutofillManager setClientIdentifierForLastAutofillGeneration:](v83, "setClientIdentifierForLastAutofillGeneration:", v72);

    ((void (**)(_QWORD, void *))v75)[2](v75, v48);
    goto LABEL_64;
  }
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __114__TIAppAutofillManager_generateAutofillFormSuggestedUsernameWithRenderTraits_withKeyboardState_completionHandler___block_invoke_220;
  v85[3] = &unk_1EA0FAD00;
  v85[4] = v83;
  v86 = v78;
  v87 = v48;
  v88 = v75;
  -[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:](v83, "generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:", v51, v70, v68, v86, v77, v85, v47);

LABEL_64:
  _Block_object_dispose(&v92, 8);

}

- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  float v40;
  double v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  void (**v62)(_QWORD, _QWORD);
  void *v63;
  void *v64;
  void *v65;
  id v66;
  _QWORD v67[5];
  id v68;
  void (**v69)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[TIAppAutofillManager setDocumentIdentifierForLastAutofillGeneration:](self, "setDocumentIdentifierForLastAutofillGeneration:", 0);
  -[TIAppAutofillManager setClientIdentifierForLastAutofillGeneration:](self, "setClientIdentifierForLastAutofillGeneration:", 0);
  if (v12)
  {
    v66 = v12;
    -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (id *)MEMORY[0x1E0DBE3E8];
    v63 = v13;
    if (v17)
    {
      -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:", CFSTR("SAFARI_HIDE_MY_EMAIL_SUGGESTION"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 && objc_msgSend(v20, "length"))
      {
LABEL_15:
        objc_msgSend(v66, "setHideMyEmailLocalizedText:", v20);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD8]), "initWithSecureHeader:secureContent:secureFormattedContent:input:truncationSentinel:", &stru_1EA1081D0, v20, v20, &stru_1EA1081D0, 0);
        objc_msgSend(v25, "addObject:");
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v25, "count"));
        v26 = objc_claimAutoreleasedReturnValue();
        -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)v26;
        objc_msgSend(v27, "slotIDsFromSecureCandidates:withRenderTraits:outWidths:", v25, v66, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v61 = v15;
          v62 = (void (**)(_QWORD, _QWORD))v16;
          v13 = v63;
          v59 = v12;
          v60 = v28;
          objc_msgSend(v28, "objectAtIndex:", 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v20)
            v33 = v20;
          else
            v33 = (void *)*MEMORY[0x1E0DBE3E8];
          objc_msgSend(v31, "setObject:forKey:", v33, *MEMORY[0x1E0DBE368]);
          -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "secureCandidateCache");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKey:", v32, v36);

          +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "registerSlotID:", v30);

          v38 = _os_feature_enabled_impl();
          if (v14 && v61 && v38)
          {
            objc_msgSend(v65, "firstObject");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "floatValue");
            v41 = v40;
            objc_msgSend(v25, "firstObject");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v42, "candidateHash");
            v67[0] = MEMORY[0x1E0C809B0];
            v67[1] = 3221225472;
            v67[2] = __148__TIAppAutofillManager_generateJustHMEAutofillFormSuggestionWithRenderTraits_withKeyboardState_applicationID_applicationBundleID_completionHandler___block_invoke;
            v67[3] = &unk_1EA0F9F40;
            v67[4] = self;
            v68 = v63;
            v69 = v62;
            v43 = v30;
            v15 = v61;
            -[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:](self, "generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:", v43, v61, v14, v68, v58, v67, v41);

            v12 = v59;
          }
          else
          {
            objc_msgSend(v63, "documentIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIAppAutofillManager setDocumentIdentifierForLastAutofillGeneration:](self, "setDocumentIdentifierForLastAutofillGeneration:", v45);

            objc_msgSend(v63, "clientIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIAppAutofillManager setClientIdentifierForLastAutofillGeneration:](self, "setClientIdentifierForLastAutofillGeneration:", v46);

            v62[2](v62, 0);
            v12 = v59;
            v15 = v61;
          }

          v16 = v62;
          v28 = v60;
        }
        else
        {
          TIAppAutofillOSLogFacility();
          v44 = objc_claimAutoreleasedReturnValue();
          v13 = v63;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s slotIDs are nil"), "-[TIAppAutofillManager generateJustHMEAutofillFormSuggestionWithRenderTraits:withKeyboardState:applicationID:applicationBundleID:completionHandler:]");
            v56 = v16;
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v71 = v57;
            _os_log_error_impl(&dword_1DA6F2000, v44, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            v16 = v56;
          }

          (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
        }

        goto LABEL_29;
      }
    }
    else
    {
      TIAppAutofillOSLogFacility();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s self.secureCandidateRenderer is nil"), "-[TIAppAutofillManager generateJustHMEAutofillFormSuggestionWithRenderTraits:withKeyboardState:applicationID:applicationBundleID:completionHandler:]");
        v53 = v16;
        v54 = v15;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v71 = v55;
        _os_log_debug_impl(&dword_1DA6F2000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        v15 = v54;
        v16 = v53;
      }

      v20 = 0;
    }
    TIAppAutofillOSLogFacility();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Localized Hide My Email text is nil"), "-[TIAppAutofillManager generateJustHMEAutofillFormSuggestionWithRenderTraits:withKeyboardState:applicationID:applicationBundleID:completionHandler:]");
      v47 = v16;
      v48 = v15;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v71 = v49;
      _os_log_debug_impl(&dword_1DA6F2000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      v15 = v48;
      v16 = v47;
    }

    v24 = *v18;
    v20 = v24;
    goto LABEL_15;
  }
  TIAppAutofillOSLogFacility();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s secureCandidateRenderTraits is nil"), "-[TIAppAutofillManager generateJustHMEAutofillFormSuggestionWithRenderTraits:withKeyboardState:applicationID:applicationBundleID:completionHandler:]");
    v50 = v16;
    v51 = v15;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v71 = v52;
    _os_log_error_impl(&dword_1DA6F2000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    v15 = v51;
    v16 = v50;
  }

  (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
LABEL_29:

}

- (void)generateHideMyEmailCandidateWithSlotID:(unsigned int)a3 applicationBundleId:(id)a4 applicationId:(id)a5 keyboardState:(id)a6 secureCandidateWidth:(double)a7 secureCandidateHash:(unint64_t)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  dispatch_semaphore_t v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  id v23;
  void (**v24)(id, _QWORD);
  void *v25;
  uint64_t v26;
  id v27;
  void (**v28)(id, _QWORD);
  void *v29;
  void *v30;
  void (**v31)(id, _QWORD);
  id v32;
  dispatch_time_t v33;
  void *v34;
  void (**v35)(id, _QWORD);
  void *v36;
  void *v37;
  id v39;
  _QWORD block[4];
  void (**v41)(id, _QWORD);
  _QWORD *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  __int128 *v50;
  id v51;
  unsigned int v52;
  _QWORD v53[4];
  id v54;
  id v55;
  TIAppAutofillManager *v56;
  id v57;
  id v58;
  _QWORD *v59;
  __int128 *p_buf;
  _QWORD *v61;
  unsigned int v62;
  _QWORD aBlock[4];
  id v64;
  id v65;
  TIAppAutofillManager *v66;
  id v67;
  _QWORD *v68;
  _QWORD *v69;
  double v70;
  unint64_t v71;
  unsigned int v72;
  _QWORD v73[4];
  char v74;
  id location;
  _QWORD v76[5];
  id v77;
  _QWORD v78[4];
  NSObject *v79;
  _QWORD *v80;
  _QWORD v81[5];
  id v82;
  __int128 buf;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, _QWORD))a9;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy__77;
  v81[4] = __Block_byref_object_dispose__78;
  v82 = 0;
  v17 = dispatch_semaphore_create(0);
  v18 = (void *)objc_opt_class();
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke;
  v78[3] = &unk_1EA0F9F18;
  v80 = v81;
  v19 = v17;
  v79 = v19;
  objc_msgSend(v18, "getApprovedSharedWebCredentialsEntriesForAppWithAppID:completionHandler:", v15, v78);
  v20 = dispatch_time(0, 200000000);
  if (dispatch_semaphore_wait(v19, v20))
  {
    TIAppAutofillOSLogFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s HME: Timeout on getApprovedSharedWebCredentialsEntriesForAppWithAppID:completionHandler:"), "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v34;
      _os_log_error_impl(&dword_1DA6F2000, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

    }
    v16[2](v16, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__77;
    v86 = __Block_byref_object_dispose__78;
    v87 = objc_alloc_init(MEMORY[0x1E0D00258]);
    objc_msgSend(v37, "primaryAuthKitAccount");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = 0;
    v76[1] = v76;
    v76[2] = 0x3032000000;
    v76[3] = __Block_byref_object_copy__77;
    v76[4] = __Block_byref_object_dispose__78;
    objc_msgSend(v37, "altDSIDForAccount:", v36);
    v77 = (id)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x2810000000;
    v73[3] = "";
    v74 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_231;
    aBlock[3] = &unk_1EA0F9F90;
    v22 = v14;
    v64 = v22;
    v23 = v15;
    v65 = v23;
    v66 = self;
    v72 = a3;
    v70 = a7;
    v71 = a8;
    v68 = v76;
    v69 = v73;
    v24 = v16;
    v67 = v24;
    v25 = _Block_copy(aBlock);
    v35 = v16;
    v26 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_235;
    v53[3] = &unk_1EA0F9FE0;
    v54 = v23;
    v59 = v76;
    v27 = v22;
    v55 = v27;
    v56 = self;
    v62 = a3;
    p_buf = &buf;
    v61 = v73;
    v28 = v24;
    v57 = v28;
    v58 = v25;
    v39 = v25;
    v29 = _Block_copy(v53);
    v30 = (void *)MEMORY[0x1E0D116A0];
    v43[0] = v26;
    v43[1] = 3221225472;
    v43[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_240;
    v43[3] = &unk_1EA0FA058;
    v47 = v73;
    v31 = v28;
    v45 = v31;
    v48 = v81;
    v49 = v76;
    v44 = v27;
    v50 = &buf;
    objc_copyWeak(&v51, &location);
    v52 = a3;
    v46 = v29;
    v32 = v29;
    objc_msgSend(v30, "requestFeatureWithId:completion:", CFSTR("mail.hide-my-email.create"), v43);
    v33 = dispatch_time(0, 200000000);
    block[0] = v26;
    v16 = v35;
    block[1] = 3221225472;
    block[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_259;
    block[3] = &unk_1EA102A48;
    v42 = v73;
    v41 = v31;
    dispatch_after(v33, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v51);
    _Block_object_dispose(v73, 8);
    objc_destroyWeak(&location);
    _Block_object_dispose(v76, 8);

    _Block_object_dispose(&buf, 8);
  }

  _Block_object_dispose(v81, 8);
}

- (BOOL)shouldAuthenticateToAcceptAutofill
{
  void *v2;
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  BOOL result;
  TIAppAutofillManager *v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  v22 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = (uint64_t)__getMCProfileConnectionClass_block_invoke;
    v17 = &unk_1EA107058;
    v18 = &v19;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v14);
    v2 = (void *)v20[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v3, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = (uint64_t)&v14;
  v16 = 0x2020000000;
  v5 = (_QWORD *)getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr;
  v17 = (void *)getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr;
  if (!getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr)
  {
    v6 = (void *)ManagedConfigurationLibrary();
    v5 = dlsym(v6, "MCFeatureAuthenticationBeforeAutoFillRequired");
    *(_QWORD *)(v15 + 24) = v5;
    getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v14, 8);
  if (v5)
  {
    v7 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *v5) == 1;

    return v7;
  }
  else
  {
    dlerror();
    v9 = (TIAppAutofillManager *)abort_report_np();
    -[TIAppAutofillManager shouldAcceptAutofill:withPayload:completion:](v9, v10, v11, v12, v13);
  }
  return result;
}

- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  _BOOL4 v26;
  int v27;
  void *v28;
  void *v29;
  objc_class *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __CFString *v37;
  id v38;
  __CFString *v39;
  __CFString *v40;
  NSObject *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  __CFString *v57;
  void *v58;
  int v59;
  id v60;
  int v61;
  void *v62;
  void *v63;
  uint64_t v64;
  TICredentialCustomInfo *v65;
  void *v66;
  TICredentialCustomInfo *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  TIAppAutofillManager *v79;
  _QWORD v80[5];
  id v81;
  char v82;
  id v83;
  id v84;
  id v85;
  id v86;
  _QWORD aBlock[5];
  id v88;
  id v89;
  id v90;
  id v91;
  BOOL v92;
  BOOL v93;
  BOOL v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD v99[2];
  _QWORD v100[2];
  __int128 buf;
  Class (*v102)(uint64_t);
  void *v103;
  uint64_t *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v79 = self;
      v12 = objc_msgSend(v8, "customInfoType");
      if (v12 == 24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE370]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIAppAutofillManager setLastAutofilledUsername:](self, "setLastAutofilledUsername:", v13);

        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE330]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      v15 = objc_msgSend(v8, "customInfoType");
      v16 = v15 == 264;
      if (v15 == 264 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v17 = v9;
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE328]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v18, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }

        v9 = v17;
      }
      else
      {
        v19 = 0;
      }
      v20 = objc_msgSend(v8, "customInfoType");
      v21 = objc_msgSend(v8, "customInfoType");
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke;
      aBlock[3] = &unk_1EA0FA080;
      v92 = v12 == 24;
      aBlock[4] = self;
      v22 = v14;
      v88 = v22;
      v93 = v16;
      v23 = v19;
      v24 = v23;
      v26 = v12 == 24 || v20 == 512;
      v89 = v23;
      v94 = v21 == 2056;
      v27 = v21 == 2056 || v26;
      v77 = v9;
      v90 = v77;
      v91 = v11;
      v78 = _Block_copy(aBlock);
      if (!-[TIAppAutofillManager shouldAuthenticateToAcceptAutofill](self, "shouldAuthenticateToAcceptAutofill")
        || !v27)
      {
        v43 = v78;
        (*((void (**)(void *, uint64_t, _QWORD))v78 + 2))(v78, 1, 0);
LABEL_79:

        goto LABEL_80;
      }
      v71 = v9;
      v72 = v24;
      v73 = v22;
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[TIXPCUtils obtainBundleIdentifierFromConnection:](TIXPCUtils, "obtainBundleIdentifierFromConnection:", v28);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v95 = 0;
      v96 = &v95;
      v97 = 0x2050000000;
      v29 = (void *)getLAContextClass_softClass;
      v98 = getLAContextClass_softClass;
      if (!getLAContextClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v102 = __getLAContextClass_block_invoke;
        v103 = &unk_1EA107058;
        v104 = &v95;
        __getLAContextClass_block_invoke((uint64_t)&buf);
        v29 = (void *)v96[3];
      }
      v30 = objc_retainAutorelease(v29);
      _Block_object_dispose(&v95, 8);
      v31 = objc_alloc_init(v30);
      -[TIAppAutofillManager setLaContext:](self, "setLaContext:", v31);

      v32 = -[TIKeyboardSecureCandidateRenderer initForLocalizedStrings]([TIKeyboardSecureCandidateRenderer alloc], "initForLocalizedStrings");
      deviceClassString();
      v33 = objc_claimAutoreleasedReturnValue();
      v75 = (void *)v33;
      if (v12 == 24)
      {
        v34 = v33;
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v32, "localizedStringForKey:", CFSTR("AUTOFILL_AUTH_PASSCODE_TITLE"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = 0;
        objc_msgSend(v35, "stringWithValidatedFormat:validFormatSpecifiers:error:", v36, CFSTR("%@"), &v86, v34);
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v38 = v86;
        v39 = &stru_1EA1081D0;
        if (v37)
          v39 = v37;
        v40 = v39;

        if (!v38)
        {
          v42 = CFSTR("AUTOFILL_AUTH_ALERT_TITLE");
          goto LABEL_61;
        }
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        TIOSLogFacility();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ERROR: invalid localized format for key AUTOFILL_AUTH_PASSCODE_TITLE: %@"), "-[TIAppAutofillManager shouldAcceptAutofill:withPayload:completion:]", v38);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v68;
          _os_log_debug_impl(&dword_1DA6F2000, v41, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

        }
        v42 = CFSTR("AUTOFILL_AUTH_ALERT_TITLE");
      }
      else if (v20 == 512)
      {
        v44 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v32, "localizedStringForKey:", CFSTR("TOTP_AUTOFILL_AUTH_PASSCODE_TITLE"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = 0;
        objc_msgSend(v44, "stringWithValidatedFormat:validFormatSpecifiers:error:", v45, CFSTR("%@"), &v85, v75);
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v38 = v85;
        v47 = &stru_1EA1081D0;
        if (v46)
          v47 = v46;
        v40 = v47;

        if (!v38)
        {
          v42 = CFSTR("TOTP_AUTOFILL_AUTH_ALERT_TITLE");
          goto LABEL_61;
        }
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        TIOSLogFacility();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ERROR: invalid localized format for key TOTP_AUTOFILL_AUTH_PASSCODE_TITLE: %@"), "-[TIAppAutofillManager shouldAcceptAutofill:withPayload:completion:]", v38);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v69;
          _os_log_debug_impl(&dword_1DA6F2000, v41, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

        }
        v42 = CFSTR("TOTP_AUTOFILL_AUTH_ALERT_TITLE");
      }
      else
      {
        if (v21 != 2056)
        {
          v40 = 0;
          v52 = 0;
LABEL_62:
          v99[0] = &unk_1EA140258;
          v99[1] = &unk_1EA140270;
          v100[0] = v52;
          v100[1] = v40;
          v53 = 2;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
          v74 = objc_claimAutoreleasedReturnValue();
          if (_os_feature_enabled_impl())
          {
            v95 = 0;
            v96 = &v95;
            v97 = 0x2050000000;
            v54 = (void *)getLARatchetManagerClass_softClass;
            v98 = getLARatchetManagerClass_softClass;
            if (!getLARatchetManagerClass_softClass)
            {
              *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
              *((_QWORD *)&buf + 1) = 3221225472;
              v102 = __getLARatchetManagerClass_block_invoke;
              v103 = &unk_1EA107058;
              v104 = &v95;
              __getLARatchetManagerClass_block_invoke((uint64_t)&buf);
              v54 = (void *)v96[3];
            }
            v55 = objc_retainAutorelease(v54);
            _Block_object_dispose(&v95, 8);
            objc_msgSend(v55, "sharedInstance");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v56, "isFeatureEnabled"))
              v53 = 1025;
            else
              v53 = 2;

          }
          v57 = v40;
          -[TIAppAutofillManager laContext](v79, "laContext");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = 0;
          v59 = objc_msgSend(v58, "canEvaluatePolicy:error:", v53, &v83);
          v60 = v83;

          if (v59)
          {
            if (objc_msgSend(v76, "isEqualToString:", CFSTR("com.apple.springboard"))
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              (*((void (**)(void *, _QWORD, _QWORD))v78 + 2))(v78, 0, 0);
              v61 = 1;
            }
            else
            {
              v61 = 0;
            }
            v9 = v71;
            -[TIAppAutofillManager laContext](v79, "laContext");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v80[0] = MEMORY[0x1E0C809B0];
            v80[1] = 3221225472;
            v80[2] = __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke_290;
            v80[3] = &unk_1EA0FA0A8;
            v80[4] = v79;
            v82 = v61;
            v81 = v78;
            v64 = v53;
            v62 = (void *)v74;
            objc_msgSend(v63, "evaluatePolicy:options:reply:", v64, v74, v80);

            if (v61)
            {
              v65 = [TICredentialCustomInfo alloc];
              -[TIAppAutofillManager documentIdentifierForLastAutofillGeneration](v79, "documentIdentifierForLastAutofillGeneration");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = -[TICredentialCustomInfo initWithCustomInfo:documentIdentifier:](v65, "initWithCustomInfo:documentIdentifier:", v77, v66);
              -[TIAppAutofillManager setQueuedUnauthenticatedCustomInfo:](v79, "setQueuedUnauthenticatedCustomInfo:", v67);

              v62 = (void *)v74;
            }

            v24 = v72;
            v43 = v78;
          }
          else
          {
            -[TIAppAutofillManager setLaContext:](v79, "setLaContext:", 0);
            v43 = v78;
            (*((void (**)(void *, uint64_t, _QWORD))v78 + 2))(v78, 1, 0);
            v9 = v71;
            v24 = v72;
            v62 = (void *)v74;
          }

          v22 = v73;
          goto LABEL_79;
        }
        v48 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v32, "localizedStringForKey:", CFSTR("PASSKEY_AUTOFILL_AUTH_PASSCODE_TITLE"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0;
        objc_msgSend(v48, "stringWithValidatedFormat:validFormatSpecifiers:error:", v49, CFSTR("%@"), &v84, v75);
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v38 = v84;
        v51 = &stru_1EA1081D0;
        if (v50)
          v51 = v50;
        v40 = v51;

        if (!v38)
        {
          v42 = CFSTR("PASSKEY_AUTOFILL_AUTH_ALERT_TITLE");
          goto LABEL_61;
        }
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        TIOSLogFacility();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ERROR: invalid localized format for key PASSKEY_AUTOFILL_AUTH_PASSCODE_TITLE: %@"), "-[TIAppAutofillManager shouldAcceptAutofill:withPayload:completion:]", v38);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v70;
          _os_log_debug_impl(&dword_1DA6F2000, v41, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

        }
        v42 = CFSTR("PASSKEY_AUTOFILL_AUTH_ALERT_TITLE");
      }

LABEL_61:
      objc_msgSend(v32, "localizedStringForKey:", v42);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_62;
    }
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
LABEL_80:

}

- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    if (v8)
    {
      -[TIAppAutofillManager setLastAutofilledUsername:](self, "setLastAutofilledUsername:", 0);
      if (objc_msgSend(v8, "customInfoType") == 64)
        -[SFAppAutoFillOneTimeCodeProvider consumeCurrentOneTimeCode](self->_oneTimeCodeProvider, "consumeCurrentOneTimeCode");
      -[SFAppAutoFillOneTimeCodeProvider removeObserverForOneTimeCode:](self->_oneTimeCodeProvider, "removeObserverForOneTimeCode:", self);
    }
  }

}

- (void)presentHideMyEmailUI:(id)a3 keyboardState:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a5;
  v8 = objc_alloc_init(MEMORY[0x1E0D00258]);
  objc_msgSend(v6, "altDSID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
  v10 = (void *)v9;
  objc_msgSend(v6, "applicationKey");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

    goto LABEL_6;
  }
  v12 = (void *)v11;
  objc_msgSend(v6, "applicationBundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_6:
    v7[2](v7, 0);
    goto LABEL_7;
  }
  v14 = objc_alloc(MEMORY[0x1E0D00250]);
  objc_msgSend(v6, "applicationKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationBundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithKey:altDSID:clientAppBundleId:", v15, v16, v17);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__TIAppAutofillManager_presentHideMyEmailUI_keyboardState_completion___block_invoke;
  v19[3] = &unk_1EA0FA0D0;
  v20 = v7;
  objc_msgSend(v8, "fetchPrivateEmailWithContext:completion:", v18, v19);

LABEL_7:
}

- (void)oneTimeCodeProviderReceivedCode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0DBE338];
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIKeyboardInputManagerLoader sharedLoader](TIKeyboardInputManagerLoader, "sharedLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactingConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processPayloadInfo:", v3);

  }
}

- (void)oneTimeCodeProvider:(id)a3 didUpdateOneTimeCode:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0DBE338];
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIKeyboardInputManagerLoader sharedLoader](TIKeyboardInputManagerLoader, "sharedLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactingConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processPayloadInfo:", v4);

  }
}

- (id)_secureCandidateForPasswordCredential:(id)a3 fromLocalizedStringKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;
  __CFString *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  id v29;
  __CFString *v30;
  NSObject *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "site");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isExternal") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "textSuggestionHeaderForExternalCredential:", v6);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = v11;
    goto LABEL_7;
  }
  if (v10)
  {
    v11 = v10;
    goto LABEL_6;
  }
  -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v9)
  {
    objc_msgSend(v25, "localizedStringForKey:", v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v27, CFSTR("%@"), &v36, v9);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v29 = v36;
    v30 = &stru_1EA1081D0;
    if (v28)
      v30 = v28;
    v12 = v30;

    if (v29)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ERROR: invalid localized format for key %@: %@"), "-[TIAppAutofillManager _secureCandidateForPasswordCredential:fromLocalizedStringKey:]", v7, v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v34;
        _os_log_debug_impl(&dword_1DA6F2000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }

  }
  else
  {
    objc_msgSend(v25, "localizedStringForKey:", CFSTR("SAFARI_KEYCHAIN"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(v6, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:", CFSTR("SAFARI_CREDENTIAL_DATE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0CB3578];
      objc_msgSend(v6, "creationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringFromDate:dateStyle:timeStyle:", v17, 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), &v35, v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v20 = v35;
      v21 = &stru_1EA1081D0;
      if (v19)
        v21 = v19;
      v33 = v21;

      if (v20)
      {
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        TIOSLogFacility();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ERROR: invalid localized format for key SAFARI_CREDENTIAL_DATE: %@"), "-[TIAppAutofillManager _secureCandidateForPasswordCredential:fromLocalizedStringKey:]", v20);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v32;
          _os_log_debug_impl(&dword_1DA6F2000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
      }

      v8 = v33;
    }
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD8]), "initWithSecureHeader:secureContent:secureFormattedContent:input:truncationSentinel:", v12, v8, v8, &stru_1EA1081D0, 0);

  return v23;
}

- (id)_autoFillPayloadForPasswordCredential:(id)a3 keyboardInfoType:(unint64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  v5 = a3;
  objc_msgSend(v5, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isExternal"))
  {
    *a4 = 264;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (_QWORD *)MEMORY[0x1E0DBE328];
  }
  else
  {
    *a4 = 24;
    objc_msgSend(v8, "setObject:forKey:", v6, *MEMORY[0x1E0DBE370]);
    objc_msgSend(v8, "setObject:forKey:", v7, *MEMORY[0x1E0DBE350]);
    objc_msgSend(v5, "site");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (_QWORD *)MEMORY[0x1E0DBE330];
  }
  objc_msgSend(v8, "setObject:forKey:", v9, *v10);

  return v8;
}

- (id)_secureCandidateForPasskey:(id)a3 fromLocalizedStringKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAppAutofillManager secureCandidateRenderer](self, "secureCandidateRenderer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  v23 = 0;
  objc_msgSend(v6, "relyingPartyIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), &v23, v12);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  v15 = &stru_1EA1081D0;
  if (v13)
    v15 = v13;
  v16 = v15;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "customTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "customTitle");
      v18 = objc_claimAutoreleasedReturnValue();

      v16 = (__CFString *)v18;
    }
  }
  if (v14)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ERROR: invalid localized format for key %@: %@"), "-[TIAppAutofillManager _secureCandidateForPasskey:fromLocalizedStringKey:]", v7, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_debug_impl(&dword_1DA6F2000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD8]), "initWithSecureHeader:secureContent:secureFormattedContent:input:truncationSentinel:", v16, v8, v8, &stru_1EA1081D0, 0);

  return v20;
}

- (id)_autoFillPayloadForPasskey:(id)a3 keyboardInfoType:(unint64_t *)a4
{
  uint64_t *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t *)MEMORY[0x1E0DBE348];
  *a4 = 2056;
  v9 = *v4;
  v10[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasOneTimeCode
{
  return self->hasOneTimeCode;
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (NSUUID)documentIdentifierForLastAutofillGeneration
{
  return self->_documentIdentifierForLastAutofillGeneration;
}

- (void)setDocumentIdentifierForLastAutofillGeneration:(id)a3
{
  objc_storeStrong((id *)&self->_documentIdentifierForLastAutofillGeneration, a3);
}

- (NSString)clientIdentifierForLastAutofillGeneration
{
  return self->_clientIdentifierForLastAutofillGeneration;
}

- (void)setClientIdentifierForLastAutofillGeneration:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifierForLastAutofillGeneration, a3);
}

- (NSString)clientIdentifierForLastKeyboardSync
{
  return self->_clientIdentifierForLastKeyboardSync;
}

- (void)setQueuedCustomInfo:(id)a3
{
  objc_storeStrong((id *)&self->_queuedCustomInfo, a3);
}

- (TICredentialCustomInfo)queuedUnauthenticatedCustomInfo
{
  return self->_queuedUnauthenticatedCustomInfo;
}

- (void)setQueuedUnauthenticatedCustomInfo:(id)a3
{
  objc_storeStrong((id *)&self->_queuedUnauthenticatedCustomInfo, a3);
}

- (NSDate)dateOfLastPasswordAutoFill
{
  return self->_dateOfLastPasswordAutoFill;
}

- (void)setDateOfLastPasswordAutoFill:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfLastPasswordAutoFill, a3);
}

- (NSString)lastAutofilledUsername
{
  return self->_lastAutofilledUsername;
}

- (void)setLastAutofilledUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLaContext:(id)a3
{
  objc_storeStrong((id *)&self->_laContext, a3);
}

- (SFAppAutoFillPasskeyProvider)passkeyProvider
{
  return self->_passkeyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyProvider, 0);
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_lastAutofilledUsername, 0);
  objc_storeStrong((id *)&self->_dateOfLastPasswordAutoFill, 0);
  objc_storeStrong((id *)&self->_queuedUnauthenticatedCustomInfo, 0);
  objc_storeStrong((id *)&self->_queuedCustomInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifierForLastKeyboardSync, 0);
  objc_storeStrong((id *)&self->_clientIdentifierForLastAutofillGeneration, 0);
  objc_storeStrong((id *)&self->_documentIdentifierForLastAutofillGeneration, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyMockObject, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeProvider, 0);
  objc_storeStrong((id *)&self->_secureCandidateRenderer, 0);
}

void __70__TIAppAutofillManager_presentHideMyEmailUI_keyboardState_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = objc_alloc(MEMORY[0x1E0DBDBE8]);
    objc_msgSend(v5, "privateEmailAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCandidate:", v9);

    objc_msgSend(v10, "setCustomInfoType:", 1024);
    v15 = *(id *)(a1 + 32);
    v11 = v10;
    TIDispatchAsync();

LABEL_7:
    goto LABEL_8;
  }
  if (v6)
  {
    TIAppAutofillOSLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s HME: UI service returned error: %@"), "-[TIAppAutofillManager presentHideMyEmailUI:keyboardState:completion:]_block_invoke", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_error_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    v14 = *(id *)(a1 + 32);
    TIDispatchAsync();
    v11 = v14;
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __70__TIAppAutofillManager_presentHideMyEmailUI_keyboardState_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __70__TIAppAutofillManager_presentHideMyEmailUI_keyboardState_completion___block_invoke_295(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;

  v5 = a3;
  if (!*(_BYTE *)(a1 + 72))
  {
    if (*(_BYTE *)(a1 + 73))
    {
      if (!*(_QWORD *)(a1 + 48)
        || (objc_msgSend(*(id *)(a1 + 32), "passkeyProvider"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_opt_respondsToSelector(),
            v15,
            (v16 & 1) == 0))
      {
LABEL_11:
        if (!a2)
          goto LABEL_14;
        goto LABEL_12;
      }
      objc_msgSend(*(id *)(a1 + 32), "passkeyProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "clientIdentifierForLastKeyboardSync");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "didFillExternalCredential:inAppWithBundleIdentifier:", v18, v19);

    }
    else
    {
      v20 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v20 + 88);
      *(_QWORD *)(v20 + 88) = 0;
    }

    goto LABEL_11;
  }
  if (!a2)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 88);
  *(_QWORD *)(v7 + 88) = v6;

  objc_msgSend(*(id *)(a1 + 32), "passkeyProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "passkeyProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastAutofilledUsername");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "clientIdentifierForLastKeyboardSync");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didFillCredentialForUsername:forHost:inAppWithBundleIdentifier:", v12, v13, v14);

  }
LABEL_12:
  if (*(_BYTE *)(a1 + 74))
  {
    objc_msgSend(*(id *)(a1 + 32), "privateQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(id *)(a1 + 56);
    v23 = v5;
    TIDispatchAsync();

  }
LABEL_14:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke_290(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  TICredentialCustomInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TICredentialCustomInfo *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queuedUnauthenticatedCustomInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v3 && *(_BYTE *)(a1 + 48))
    {
      v5 = [TICredentialCustomInfo alloc];
      objc_msgSend(*(id *)(a1 + 32), "queuedUnauthenticatedCustomInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "customInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "queuedUnauthenticatedCustomInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "documentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[TICredentialCustomInfo initWithCustomInfo:documentIdentifier:](v5, "initWithCustomInfo:documentIdentifier:", v7, v9);
      objc_msgSend(*(id *)(a1 + 32), "setQueuedCustomInfo:", v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "setQueuedUnauthenticatedCustomInfo:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "laContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 48))
  {
    v14 = *(id *)(a1 + 40);
    v12 = v3;
    v13 = v11;
    TIDispatchAsync();

  }
  objc_msgSend(*(id *)(a1 + 32), "setLaContext:", 0);

}

uint64_t __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke_2_291(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(a1[6] + 16))(a1[6], a1[4] != 0, a1[5]);
}

void __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "passkeyProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *MEMORY[0x1E0DBE348]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userSelectedPasskey:authenticatedLAContext:", v2, *(_QWORD *)(a1 + 48));

}

intptr_t __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99D20];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithArray:", v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_231(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  v2 = (void *)MEMORY[0x1E0D8A060];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2;
  v10[3] = &unk_1EA0F9F68;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v11 = v4;
  v12 = v5;
  v18 = *(_DWORD *)(a1 + 96);
  v6 = *(id *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 80);
  v17 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 72);
  v13 = v6;
  v15 = v7;
  v9 = *(_OWORD *)(a1 + 56);
  v8 = (id)v9;
  v14 = v9;
  objc_msgSend(v2, "bestDomainForAppID:completionHandler:", v3, v10);

}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_235(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00250]), "initWithKey:altDSID:clientAppBundleId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40));
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2_237;
  v7[3] = &unk_1EA0F9FB8;
  v7[4] = *(_QWORD *)(a1 + 48);
  v14 = *(_DWORD *)(a1 + 96);
  v8 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 72);
  v9 = v4;
  v6 = *(_QWORD *)(a1 + 88);
  v12 = v5;
  v13 = v6;
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  objc_msgSend(v3, "lookupPrivateEmailWithContext:completion:", v2, v7);

}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_240(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  unsigned __int8 *v11;
  unsigned __int8 v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  __int128 *p_buf;
  uint64_t v31;
  uint64_t v32;
  id v33;
  int v34;
  __int128 buf;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    TIAppAutofillOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v11 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(1u, v11));
      if ((v12 & 1) == 0)
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s HME: %@ on requestFeatureWithId:completion: HideMyEmail"), "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
LABEL_22:
    _os_log_error_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

    goto LABEL_11;
  }
  if (objc_msgSend(v5, "status") == 2 || objc_msgSend(v5, "status") == 3 || objc_msgSend(v5, "status") == 4)
  {
    v9 = objc_msgSend(v5, "status") - 2;
    if (v9 > 2)
      v10 = 0;
    else
      v10 = off_1EA0FA150[v9];
    TIAppAutofillOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s HME: feature is %@ for user"), "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    goto LABEL_22;
  }
  if (!objc_msgSend(v5, "status") || objc_msgSend(v5, "status") == 1)
  {
    v13 = objc_msgSend(v5, "status");
    TIAppAutofillOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v22 = CFSTR("available and unlimited");
      if (v13 != 1)
        v22 = 0;
      if (!v13)
        v22 = CFSTR("available");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s HME: feature is %@ for user"), "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0x2020000000;
    v37 = 0;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    {
      v15 = *(_QWORD *)(a1 + 72);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_255;
      v24[3] = &unk_1EA0FA030;
      v17 = *(void **)(v16 + 40);
      v24[1] = 3221225472;
      v28 = v15;
      v18 = *(id *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 80);
      v25 = v18;
      v29 = v19;
      p_buf = &buf;
      objc_copyWeak(&v33, (id *)(a1 + 88));
      v34 = *(_DWORD *)(a1 + 96);
      v31 = *(_QWORD *)(a1 + 56);
      v20 = *(id *)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 64);
      v26 = v20;
      v32 = v21;
      v27 = *(id *)(a1 + 48);
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v24);

      objc_destroyWeak(&v33);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    _Block_object_dispose(&buf, 8);
  }
LABEL_15:

}

uint64_t __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_259(uint64_t result)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;

  v1 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(1u, v1));
  if ((v2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_255(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29[3];
  int v30;

  v7 = a2;
  v8 = objc_alloc(MEMORY[0x1E0D00250]);
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:altDSID:clientAppBundleId:", v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32));

  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2_256;
  v20[3] = &unk_1EA0FA008;
  v13 = *(void **)(v12 + 40);
  v20[1] = 3221225472;
  v25 = v11;
  v29[1] = a4;
  objc_copyWeak(v29, (id *)(a1 + 96));
  v30 = *(_DWORD *)(a1 + 104);
  v21 = v7;
  v14 = *(id *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 56);
  v22 = v14;
  v16 = *(_QWORD *)(a1 + 80);
  v26 = v15;
  v27 = v16;
  v17 = *(id *)(a1 + 40);
  v29[2] = a3;
  v18 = *(_QWORD *)(a1 + 88);
  v23 = v17;
  v28 = v18;
  v24 = *(id *)(a1 + 48);
  v19 = v7;
  objc_msgSend(v13, "lookupPrivateEmailWithContext:completion:", v10, v20);

  objc_destroyWeak(v29);
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2_256(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 *v11;
  unsigned __int8 v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "privateEmailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    **(_BYTE **)(a1 + 104) = 1;
    v4 = (void *)MEMORY[0x1E0DBDBE8];
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    objc_msgSend(WeakRetained, "secureCandidateRenderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:", CFSTR("SAFARI_HIDE_MY_EMAIL_SUGGESTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned int *)(a1 + 120);
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secureCandidateForInput:slotID:customInfoType:applicationKey:applicationBundleId:altDSID:", v7, v8, 1024, v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(1u, v11));
    if ((v12 & 1) != 0)
    {
      TIAppAutofillOSLogFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Timeout before handler completed"), "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke_2");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v15;
        _os_log_error_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 112);
    if (v13 == objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count") - 1
      && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2_237(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;
  unsigned __int8 v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "privateEmailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DBDBE8];
    objc_msgSend(*(id *)(a1 + 32), "secureCandidateRenderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:", CFSTR("SAFARI_HIDE_MY_EMAIL_SUGGESTION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secureCandidateForInput:slotID:customInfoType:applicationKey:applicationBundleId:altDSID:", v6, *(unsigned int *)(a1 + 88), 1024, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(1u, v8));
    if ((v9 & 1) != 0)
    {
      TIAppAutofillOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Timeout before handler completed"), "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke_2");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v11;
        _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 *v10;
  unsigned __int8 v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
    v4 = *(void **)(a1 + 32);
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0DBDBE8];
  objc_msgSend(*(id *)(a1 + 40), "secureCandidateRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("SAFARI_HIDE_MY_EMAIL_SUGGESTION"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureCandidateForInput:slotID:customInfoType:applicationKey:applicationBundleId:altDSID:", v8, *(unsigned int *)(a1 + 96), 1024, v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSecureCandidateWidth:", *(double *)(a1 + 80));
  objc_msgSend(v9, "setSecureCandidateHash:", *(_QWORD *)(a1 + 88));
  v10 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(1u, v10));
  if ((v11 & 1) != 0)
  {
    TIAppAutofillOSLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Timeout before handler completed"), "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke_2");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __148__TIAppAutofillManager_generateJustHMEAutofillFormSuggestionWithRenderTraits_withKeyboardState_applicationID_applicationBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "documentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDocumentIdentifierForLastAutofillGeneration:", v4);

  objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setClientIdentifierForLastAutofillGeneration:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __114__TIAppAutofillManager_generateAutofillFormSuggestedUsernameWithRenderTraits_withKeyboardState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __114__TIAppAutofillManager_generateAutofillFormSuggestedUsernameWithRenderTraits_withKeyboardState_completionHandler___block_invoke_220(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 40), "documentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDocumentIdentifierForLastAutofillGeneration:", v3);

  objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setClientIdentifierForLastAutofillGeneration:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __88__TIAppAutofillManager_generateOneTimeCodeCandidatesWithRenderTraits_withKeyboardState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  TIDispatchAsync();

}

void __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_152(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_2_153;
  v8[3] = &unk_1EA0FAEB0;
  objc_copyWeak(&v13, (id *)(a1 + 96));
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v11 = *(id *)(a1 + 80);
  v12 = *(id *)(a1 + 88);
  v6 = *(_OWORD *)(a1 + 120);
  v7[0] = *(_OWORD *)(a1 + 104);
  v7[1] = v6;
  +[TIAppAutofillManager _fetchCredentialsWithPasskeyProvider:autofillContext:textContentType:applicationIdentifier:auditToken:completion:](TIAppAutofillManager, "_fetchCredentialsWithPasskeyProvider:autofillContext:textContentType:applicationIdentifier:auditToken:completion:", v2, v3, v4, v5, v7, v8);

  objc_destroyWeak(&v13);
}

void __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_2_153(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_copyWeak(&v9, a1 + 8);
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v4 = v3;
  TIDispatchAsync();

  objc_destroyWeak(&v9);
}

void __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_finishAutofillFormCandidatesOnMainThreadWithCredentials:renderTraits:documentIdentifier:clientIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

uint64_t __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__TIAppAutofillManager_hasCoreTelephonyEntitlementForConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", CFSTR("public-cellular-plan"));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __40__TIAppAutofillManager_isValidedString___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3780], "illegalCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isValidedString__invalidCharacterSet;
  isValidedString__invalidCharacterSet = v0;

  v2 = (void *)isValidedString__invalidCharacterSet;
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  v4 = (void *)isValidedString__invalidCharacterSet;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v5);

}

+ (BOOL)_simulatesAutofillCandidates
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE408]);

  return v3;
}

+ (void)getCredentialsWithApplicationIdentifier:(id)a3 autofillContext:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (+[TIAppAutofillManager _simulatesAutofillCandidates](TIAppAutofillManager, "_simulatesAutofillCandidates")&& objc_msgSend(MEMORY[0x1E0D8A058], "instancesRespondToSelector:", sel_initWithUser_password_site_creationDate_))
  {
    v10 = objc_alloc(MEMORY[0x1E0D8A058]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithUser:password:site:creationDate:", CFSTR("simulateduser573"), CFSTR("thisisasimulatedcandidate"), CFSTR("apple.com"), v11);

    v13 = objc_alloc(MEMORY[0x1E0D8A058]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithUser:password:site:creationDate:", CFSTR("Pablo 黑客 Jjyy"), CFSTR("ascenders & descenders"), CFSTR("jjyyPP.apple.com"), v14);

    v19[0] = v12;
    v19[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v16);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE420]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend((id)objc_opt_class(), "getCredentialsForAppWithAppID:externallyVerifiedAndApprovedSharedWebCredentialDomains:completionHandler:", v7, v17, v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("_WebViewURL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v18 = 0;
      }
      objc_msgSend((id)objc_opt_class(), "getCredentialsForAppWithAppID:websiteURL:completionHandler:", v7, v18, v9);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D8A060], "getCredentialsForAppWithAppID:completionHandler:", v7, v9);
    }
  }

}

+ (void)_fetchCredentialsWithPasskeyProvider:(id)a3 autofillContext:(id)a4 textContentType:(id)a5 applicationIdentifier:(id)a6 auditToken:(id *)a7 completion:(id)a8
{
  id v12;
  id v13;
  void (**v14)(id, void *);
  id v15;
  NSObject *v16;
  id v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void (*v24)(uint64_t, void *);
  uint64_t *v25;
  id v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void **v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  NSObject *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v44 = a6;
  v14 = (void (**)(id, void *))a8;
  v15 = a5;
  v16 = dispatch_group_create();
  v17 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__77;
  v61 = __Block_byref_object_dispose__78;
  v62 = 0;
  v18 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0DBEA40]);

  if ((v18 & 1) != 0)
  {
    v19 = v12;
    if (!v12)
      goto LABEL_13;
    v20 = *MEMORY[0x1E0DBE430];
    goto LABEL_6;
  }
  v19 = v12;
  v20 = *MEMORY[0x1E0DBE430];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE430]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("webauthn")))
  {

    if (!v12)
      goto LABEL_13;
LABEL_6:
    dispatch_group_enter(v16);
    objc_msgSend(v13, "objectForKeyedSubscript:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", CFSTR("webauthn")))
    {
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) != 0)
      {
        v56 = MEMORY[0x1E0C809B0];
        v24 = __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke;
        v25 = &v56;
LABEL_11:
        v25[1] = 3221225472;
        v25[2] = (uint64_t)v24;
        v25[3] = (uint64_t)&unk_1EA0F9EF0;
        v25[4] = (uint64_t)v17;
        v25[6] = (uint64_t)&v57;
        v25[5] = (uint64_t)v16;
        objc_msgSend(v19, "getAvailablePasskeysForApplicationIdentifier:completionHandler:", v44, v25);

        v21 = (void *)v25[4];
        goto LABEL_12;
      }
    }
    else
    {

    }
    v55 = MEMORY[0x1E0C809B0];
    v24 = __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke_2;
    v25 = &v55;
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__77;
  v53 = __Block_byref_object_dispose__78;
  v54 = 0;
  dispatch_group_enter(v16);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke_3;
  v45[3] = &unk_1EA0F9EF0;
  v26 = v17;
  v46 = v26;
  v48 = &v49;
  v27 = v16;
  v47 = v27;
  +[TIAppAutofillManager getCredentialsWithApplicationIdentifier:autofillContext:withCompletionHandler:](TIAppAutofillManager, "getCredentialsWithApplicationIdentifier:autofillContext:withCompletionHandler:", v44, v13, v45);
  v28 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v27, v28))
  {
    TIAppAutofillOSLogFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Timeout while waiting for credentials"), "+[TIAppAutofillManager _fetchCredentialsWithPasskeyProvider:autofillContext:textContentType:applicationIdentifier:auditToken:completion:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v66 = v43;
      _os_log_error_impl(&dword_1DA6F2000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  objc_msgSend(v26, "lock");
  v30 = objc_msgSend((id)v58[5], "copy");
  v31 = (void *)v30;
  v32 = (void *)MEMORY[0x1E0C9AA60];
  if (v30)
    v33 = (void *)v30;
  else
    v33 = (void *)MEMORY[0x1E0C9AA60];
  v34 = v33;

  v35 = objc_msgSend((id)v50[5], "copy");
  v36 = (void *)v35;
  if (v35)
    v37 = (void *)v35;
  else
    v37 = v32;
  v38 = v37;

  objc_msgSend(v26, "unlock");
  if (objc_msgSend(v34, "count"))
  {
    objc_msgSend(v34, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v39;
    v40 = &v64;
  }
  else
  {
    objc_msgSend(v38, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      v42 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v38, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v39;
    v40 = &v63;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  v14[2](v14, v42);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v57, 8);

}

void __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "lock");
  v5 = objc_msgSend(v4, "copy");

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __38__TIAppAutofillManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[TIAppAutofillManager initPrivate]([TIAppAutofillManager alloc], "initPrivate");
  v1 = (void *)instance;
  instance = (uint64_t)v0;

}

- (CoreTelephonyMockObject)coreTelephonyMockObject
{
  return self->_coreTelephonyMockObject;
}

- (void)setCoreTelephonyMockObject:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyMockObject, a3);
}

+ (void)setSharedAppAutofillManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance, a3);
    v4 = v5;
  }

}

@end
