@implementation TUDynamicCallDisplayContext

- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5
{
  return -[TUDynamicCallDisplayContext initWithCall:contactIdentifier:serialQueue:cacheOnly:](self, "initWithCall:contactIdentifier:serialQueue:cacheOnly:", a3, a4, a5, 1);
}

- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5 cacheOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void (**v13)(void);
  void *v14;
  TUDynamicCallDisplayContext *v15;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "contactsDataSourceCreationBlock");
  v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v13[2]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[TUDynamicCallDisplayContext initWithCall:contactIdentifier:serialQueue:contactsDataSource:cacheOnly:](self, "initWithCall:contactIdentifier:serialQueue:contactsDataSource:cacheOnly:", v12, v11, v10, v14, v6);
  return v15;
}

- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5 contactsDataSource:(id)a6
{
  return -[TUDynamicCallDisplayContext initWithCall:contactIdentifier:serialQueue:contactsDataSource:cacheOnly:](self, "initWithCall:contactIdentifier:serialQueue:contactsDataSource:cacheOnly:", a3, a4, a5, a6, 1);
}

- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5 contactsDataSource:(id)a6 cacheOnly:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  id v14;
  id v15;
  id v16;
  TUDynamicCallDisplayContext *v17;
  NSObject *v18;
  TUContactsDataProvider *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  TUDynamicCallDisplayContext *v27;
  uint64_t v28;

  v7 = a7;
  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)TUDynamicCallDisplayContext;
  v17 = -[TUCallDisplayContext init](&v25, sel_init);
  if (!v17)
    goto LABEL_12;
  if (v13)
  {
    if (v15)
      goto LABEL_4;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("TUDynamicCallDisplayContext.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialQueue != nil"));

    if (v16)
      goto LABEL_5;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("TUDynamicCallDisplayContext.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactsDataSource != nil"));

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("TUDynamicCallDisplayContext.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("call != nil"));

  if (!v15)
    goto LABEL_14;
LABEL_4:
  if (!v16)
    goto LABEL_15;
LABEL_5:
  TUDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[TUDynamicCallDisplayContext initWithCall:contactIdentifier:serialQueue:contactsDataSource:cacheOnly:].cold.1((uint64_t)v16, v18);

  objc_storeStrong((id *)&v17->_serialQueue, a5);
  v19 = -[TUContactsDataProvider initWithContactsDataSource:]([TUContactsDataProvider alloc], "initWithContactsDataSource:", v16);
  -[TUDynamicCallDisplayContext _initializeSynchronousStateWithCall:contactIdentifier:contactsDataProvider:](v17, "_initializeSynchronousStateWithCall:contactIdentifier:contactsDataProvider:", v13, v14, v19);
  if ((objc_msgSend(v13, "isInternational") & 1) == 0)
    -[TUDynamicCallDisplayContext _initializeAsynchronousStateWithCall:cacheOnly:](v17, "_initializeAsynchronousStateWithCall:cacheOnly:", v13, v7);
  TUDefaultLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v17;
    _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "Initialized dynamic display context: %@", buf, 0xCu);
  }

LABEL_12:
  return v17;
}

- (TUDynamicCallDisplayContext)initWithDisplayContext:(id)a3 call:(id)a4 serialQueue:(id)a5
{
  return -[TUDynamicCallDisplayContext initWithDisplayContext:call:serialQueue:cacheOnly:](self, "initWithDisplayContext:call:serialQueue:cacheOnly:", a3, a4, a5, 1);
}

- (TUDynamicCallDisplayContext)initWithDisplayContext:(id)a3 call:(id)a4 serialQueue:(id)a5 cacheOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  TUDynamicCallDisplayContext *v14;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  uint8_t buf[4];
  TUDynamicCallDisplayContext *v37;
  uint64_t v38;

  v6 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v35.receiver = self;
  v35.super_class = (Class)TUDynamicCallDisplayContext;
  v14 = -[TUCallDisplayContext init](&v35, sel_init);
  if (!v14)
    goto LABEL_8;
  if (v12)
  {
    if (v13)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("TUDynamicCallDisplayContext.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialQueue != nil"));

    if (v11)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("TUDynamicCallDisplayContext.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayContext != nil"));

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("TUDynamicCallDisplayContext.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("call != nil"));

  if (!v13)
    goto LABEL_10;
LABEL_4:
  if (!v11)
    goto LABEL_11;
LABEL_5:
  objc_storeStrong((id *)&v14->_serialQueue, a5);
  objc_msgSend(v11, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setName:](v14, "setName:", v15);

  objc_msgSend(v11, "personNameComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setPersonNameComponents:](v14, "setPersonNameComponents:", v16);

  objc_msgSend(v11, "suggestedName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setSuggestedName:](v14, "setSuggestedName:", v17);

  objc_msgSend(v11, "label");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setLabel:](v14, "setLabel:", v18);

  objc_msgSend(v11, "mapName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setMapName:](v14, "setMapName:", v19);

  objc_msgSend(v11, "companyName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCompanyName:](v14, "setCompanyName:", v20);

  objc_msgSend(v11, "companyDepartment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCompanyDepartment:](v14, "setCompanyDepartment:", v21);

  objc_msgSend(v11, "companyLogoURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCompanyLogoURL:](v14, "setCompanyLogoURL:", v22);

  objc_msgSend(v11, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setLocation:](v14, "setLocation:", v23);

  objc_msgSend(v11, "contactName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setContactName:](v14, "setContactName:", v24);

  objc_msgSend(v11, "contactLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setContactLabel:](v14, "setContactLabel:", v25);

  objc_msgSend(v11, "callDirectoryLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCallDirectoryLabel:](v14, "setCallDirectoryLabel:", v26);

  objc_msgSend(v11, "callDirectoryExtensionIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCallDirectoryExtensionIdentifier:](v14, "setCallDirectoryExtensionIdentifier:", v27);

  objc_msgSend(v11, "callDirectoryLocalizedExtensionContainingAppName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCallDirectoryLocalizedExtensionContainingAppName:](v14, "setCallDirectoryLocalizedExtensionContainingAppName:", v28);

  -[TUCallDisplayContext setCallDirectoryIdentityType:](v14, "setCallDirectoryIdentityType:", objc_msgSend(v11, "callDirectoryIdentityType"));
  objc_msgSend(v11, "contactIdentifiers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setContactIdentifiers:](v14, "setContactIdentifiers:", v29);

  -[TUCallDisplayContext setLegacyAddressBookIdentifier:](v14, "setLegacyAddressBookIdentifier:", objc_msgSend(v11, "legacyAddressBookIdentifier"));
  -[TUDynamicCallDisplayContext _initializeAsynchronousStateWithCall:cacheOnly:](v14, "_initializeAsynchronousStateWithCall:cacheOnly:", v12, v6);
  TUDefaultLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v14;
    _os_log_impl(&dword_19A50D000, v30, OS_LOG_TYPE_DEFAULT, "Initialized dynamic display context: %@", buf, 0xCu);
  }

LABEL_8:
  return v14;
}

- (TUDynamicCallDisplayContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUDynamicCallDisplayContext.m"), 137, CFSTR("%s is not available. Use another initializer instead."), "-[TUDynamicCallDisplayContext init]");

  return 0;
}

- (TUDynamicCallDisplayContext)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUDynamicCallDisplayContext.m"), 142, CFSTR("%s is not available. Use another initializer instead."), "-[TUDynamicCallDisplayContext initWithCoder:]");

  return 0;
}

- (void)_initializeSynchronousStateWithCall:(id)a3 contactIdentifier:(id)a4 contactsDataProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  TUContactsDataProviderFetchRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  uint64_t v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  int v75;
  void *v76;
  uint64_t v77;
  TUGeoLocationMetadataCacheDataProvider *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  TUContactsDataProviderFetchRequest *v92;
  void *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  _BYTE v100[18];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "isInternational");
  v12 = -[TUContactsDataProviderFetchRequest initWithCall:]([TUContactsDataProviderFetchRequest alloc], "initWithCall:", v8);
  -[TUContactsDataProviderFetchRequest setContactIdentifier:](v12, "setContactIdentifier:", v9);
  v92 = v12;
  v93 = v10;
  objc_msgSend(v10, "executeFetchRequest:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11)
  {
    objc_msgSend(v8, "remoteParticipantHandles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(v8, "isoCountryCode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      TUFormattedPhoneNumber(v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUCallDisplayContext setName:](self, "setName:", v19);

    }
    objc_msgSend(v14, "contacts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(v14, "localizedName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUCallDisplayContext setSuggestedName:](self, "setSuggestedName:", v22);

    }
  }
  else
  {
    objc_msgSend(v13, "localizedName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setName:](self, "setName:", v23);

    objc_msgSend(v14, "contactLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setLabel:](self, "setLabel:", v24);

    objc_msgSend(v14, "companyName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setCompanyName:](self, "setCompanyName:", v16);
  }

  objc_msgSend(v8, "handle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "siriDisplayName");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    objc_msgSend(v8, "handle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "shouldHideContact");

    if (!v29)
      goto LABEL_12;
    objc_msgSend(v8, "handle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "siriDisplayName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setName:](self, "setName:", v30);

  }
LABEL_12:
  if ((v11 & 1) != 0)
    goto LABEL_27;
  objc_msgSend(v14, "contacts");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v31, "count"))
  {

    goto LABEL_27;
  }
  if ((objc_msgSend(v8, "isConversation") & 1) != 0)
  {
    objc_msgSend(v8, "remoteParticipantHandles");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33 != 1)
      goto LABEL_27;
  }
  else
  {

  }
  v89 = v9;
  objc_msgSend(v14, "contacts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "firstObject");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUCallDisplayContext name](self, "name");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setContactName:](self, "setContactName:", v35);

  -[TUCallDisplayContext label](self, "label");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setContactLabel:](self, "setContactLabel:", v36);

  v37 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v14, "contacts");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v37, "initWithCapacity:", objc_msgSend(v38, "count"));

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  objc_msgSend(v14, "contacts");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v96 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v45);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
    }
    while (v42);
  }

  -[TUCallDisplayContext setContactIdentifiers:](self, "setContactIdentifiers:", v39);
  objc_msgSend(v87, "personNameComponents");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setPersonNameComponents:](self, "setPersonNameComponents:", v46);

  -[TUCallDisplayContext setLegacyAddressBookIdentifier:](self, "setLegacyAddressBookIdentifier:", objc_msgSend(v14, "legacyAddressBookIdentifier"));
  v9 = v89;
LABEL_27:
  -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)MEMORY[0x1E0CB3858];
    -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringFromPersonNameComponents:style:options:", v49, 3, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
  }

  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v51, "count"))
  {

    goto LABEL_35;
  }
  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v52, "count"))
    goto LABEL_66;
  v53 = objc_msgSend(v50, "length");

  if (!v53)
  {
LABEL_35:
    objc_msgSend(v8, "callerNameFromNetwork");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "length"))
    {
      objc_msgSend(v8, "provider");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "isTelephonyProvider");

      if (v55)
        -[TUCallDisplayContext setLabel:](self, "setLabel:", v51);
      else
        -[TUCallDisplayContext setName:](self, "setName:", v51);
    }
    if (!objc_msgSend(v51, "length") && objc_msgSend(v8, "isVoicemail"))
    {
      TUBundle();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("VOICEMAIL"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUCallDisplayContext setName:](self, "setName:", v57);

    }
    if (objc_msgSend(v51, "length"))
      goto LABEL_67;
    objc_msgSend(v8, "handle");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "value");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "length");

    if (!v60)
      goto LABEL_67;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v8, "handle");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "value");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = 0;
      +[TUSuggestionsMetadataCacheDataProvider suggestedNamesForDestinationID:onlySignificant:error:](TUSuggestionsMetadataCacheDataProvider, "suggestedNamesForDestinationID:onlySignificant:error:", v62, 0, &v94);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v94;

      if (v64)
      {
        TUDefaultLog();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v100 = v64;
          _os_log_impl(&dword_19A50D000, v65, OS_LOG_TYPE_DEFAULT, "Suggestions: Could not fetch suggested contact via namesForDetail: %@", buf, 0xCu);
        }
      }
      else
      {
        v90 = v63;
        v66 = objc_msgSend(v63, "count");
        TUDefaultLog();
        v65 = objc_claimAutoreleasedReturnValue();
        v67 = os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
        if (v66)
        {
          if (v67)
          {
            objc_msgSend(v90, "firstObject");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "handle");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "value");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v100 = v68;
            *(_WORD *)&v100[8] = 2112;
            *(_QWORD *)&v100[10] = v69;
            _os_log_impl(&dword_19A50D000, v65, OS_LOG_TYPE_DEFAULT, "Suggestions: Found name '%@' for '%@'", buf, 0x16u);

          }
          v63 = v90;
          objc_msgSend(v90, "firstObject");
          v65 = objc_claimAutoreleasedReturnValue();
          -[TUCallDisplayContext setSuggestedName:](self, "setSuggestedName:", v65);
        }
        else
        {
          if (v67)
          {
            objc_msgSend(v8, "handle");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "value");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v100 = v71;
            _os_log_impl(&dword_19A50D000, v65, OS_LOG_TYPE_DEFAULT, "Suggestions: No suggested names found for '%@'", buf, 0xCu);

          }
          v63 = v90;
        }
      }

    }
    if (objc_msgSend(v8, "isDomestic")
      && (objc_msgSend(v8, "handle"),
          v72 = (void *)objc_claimAutoreleasedReturnValue(),
          v73 = objc_msgSend(v72, "type"),
          v72,
          v73 != 3))
    {
      if (objc_msgSend(v8, "isIncoming"))
      {
        +[TUNicknamesMetadataCacheDataProvider sharedInstance](TUNicknamesMetadataCacheDataProvider, "sharedInstance");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handle");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "normalizedValue");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v80;
        objc_msgSend(v80, "fetchNicknameForHandleValue:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
        {
          -[TUCallDisplayContext setSuggestedName:](self, "setSuggestedName:", v83);
          TUDefaultLog();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v100 = v83;
            _os_log_impl(&dword_19A50D000, v84, OS_LOG_TYPE_DEFAULT, "SNAP Suggestions: found suggestedNickname: %@", buf, 0xCu);
          }
        }
        else
        {
          TUDefaultLog();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "handle");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "value");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v100 = v86;
            _os_log_impl(&dword_19A50D000, v84, OS_LOG_TYPE_DEFAULT, "SNAP Suggestions: No nicknames found for '%@'", buf, 0xCu);

          }
        }

      }
    }
    else
    {
      TUDefaultLog();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        v75 = objc_msgSend(v8, "isDomestic");
        objc_msgSend(v8, "handle");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v76, "type");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v100 = v75;
        *(_WORD *)&v100[4] = 2048;
        *(_QWORD *)&v100[6] = v77;
        _os_log_impl(&dword_19A50D000, v74, OS_LOG_TYPE_DEFAULT, "SNAP Suggestions: Hiding suggested nickname to prevent phishing. (isDomestic = %d, handleType = %ld)", buf, 0x12u);

      }
      objc_msgSend(v8, "isIncoming");
    }
    if (!objc_msgSend(v8, "isIncoming"))
      goto LABEL_67;
    +[TUMetadataDestinationID metadataDestinationIDForCall:](TUMetadataDestinationID, "metadataDestinationIDForCall:", v8);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v78 = objc_alloc_init(TUGeoLocationMetadataCacheDataProvider);
      -[TUGeoLocationMetadataCacheDataProvider locationForMetadataIdentifier:](v78, "locationForMetadataIdentifier:", v52);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (v79)
      {
        -[TUCallDisplayContext setLabel:](self, "setLabel:", v79);
        -[TUCallDisplayContext setLocation:](self, "setLocation:", v79);
      }

    }
LABEL_66:

LABEL_67:
  }

}

- (void)_initializeAsynchronousStateWithCall:(id)a3 cacheOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  TUPhoneNumber *v19;
  void *v20;
  void *v21;
  void *v22;
  TUPhoneNumber *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD *v31;
  _QWORD v32[4];
  id v33;
  TUDynamicCallDisplayContext *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[3];
  char v39;

  v4 = a4;
  v6 = a3;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count")
    || (objc_msgSend(v6, "handle"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

  }
  else
  {
    objc_msgSend(v6, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    if (v10 == 2)
    {
      objc_msgSend(v6, "handle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke;
      v36[3] = &unk_1E38A3B48;
      v36[4] = self;
      v14 = v6;
      v37 = v14;
      TUMapItemForDestinationID(v12, v36);

      if (objc_msgSend(v14, "isIncoming")
        && objc_msgSend(v14, "verificationStatus") == 1
        && objc_msgSend(v14, "junkConfidence") <= 0)
      {
        +[TUBusinessServicesMetadataDataProvider sharedInstance](TUBusinessServicesMetadataDataProvider, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "normalizedValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v13;
        v32[1] = 3221225472;
        v32[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_32;
        v32[3] = &unk_1E38A3B70;
        v35 = v38;
        v33 = v14;
        v34 = self;
        objc_msgSend(v15, "fetchBusinessServiceInformationForHandleValue:completion:", v17, v32);

      }
      v18 = objc_alloc_init((Class)CUTWeakLinkClass());
      -[TUDynamicCallDisplayContext setCallDirectoryManager:](self, "setCallDirectoryManager:", v18);

      v19 = [TUPhoneNumber alloc];
      objc_msgSend(v14, "handle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "isoCountryCode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[TUPhoneNumber initWithDigits:countryCode:](v19, "initWithDigits:countryCode:", v21, v22);

      -[TUPhoneNumber unformattedInternationalRepresentation](v23, "unformattedInternationalRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        v26 = v24;
      }
      else
      {
        objc_msgSend(v14, "handle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "value");
        v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[TUDynamicCallDisplayContext callDirectoryManager](self, "callDirectoryManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v13;
      v29[1] = 3221225472;
      v29[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_40;
      v29[3] = &unk_1E38A3B98;
      v29[4] = self;
      v31 = v38;
      v30 = v14;
      objc_msgSend(v28, "firstIdentificationEntryForEnabledExtensionWithPhoneNumber:cacheOnly:completionHandler:", v26, v4, v29);

    }
  }
  _Block_object_dispose(v38, 8);

}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "serialQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_2;
    block[3] = &unk_1E38A19B8;
    v8 = v3;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    dispatch_async(v4, block);

  }
}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Found map item %@ for call: %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setName:", v5);

  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setMapName:", v6);

  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayContextChanged:", *(_QWORD *)(a1 + 48));

}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Already found call directory identification entry for call: %@, not populating business information.", buf, 0xCu);
    }
  }
  else if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_33;
    block[3] = &unk_1E38A19B8;
    v13 = v4;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v14 = v8;
    v15 = v9;
    dispatch_async(v7, block);

    v5 = v13;
  }
  else
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "handle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "No business information found for '%@'", buf, 0xCu);

    }
  }

}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Found business item %@ for call: %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setLabel:", v5);

  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setCompanyName:", v6);

  objc_msgSend(*(id *)(a1 + 32), "department");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setCompanyDepartment:", v7);

  objc_msgSend(*(id *)(a1 + 32), "logoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setCompanyLogoURL:", v8);

  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayContextChanged:", *(_QWORD *)(a1 + 48));

}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[4];
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_2_41;
    block[3] = &unk_1E38A2F38;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v15 = v11;
    v16 = v10;
    dispatch_async(v8, block);

    v12 = v14;
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_40_cold_1(a1, (uint64_t)v7, v12);
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "setCallDirectoryManager:", 0);

}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_2_41(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Found call directory identification entry %@", (uint8_t *)&v11, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "localizedLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCallDirectoryLabel:", v4);

  objc_msgSend(*(id *)(a1 + 32), "localizedExtensionContainingAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCallDirectoryLocalizedExtensionContainingAppName:", v5);

  objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCallDirectoryExtensionIdentifier:", v6);

  objc_msgSend(*(id *)(a1 + 32), "iconURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCompanyLogoURL:", v7);

  v8 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v8 == 1)
    v9 = 1;
  else
    v9 = 2 * (v8 == 2);
  objc_msgSend(*(id *)(a1 + 40), "setCallDirectoryIdentityType:", v9);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayContextChanged:", *(_QWORD *)(a1 + 40));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" name=%@"), v4);

  -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" personNameComponents=%@"), v5);

  -[TUCallDisplayContext suggestedName](self, "suggestedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" suggestedName=%@"), v6);

  -[TUCallDisplayContext label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" label=%@"), v7);

  -[TUCallDisplayContext companyName](self, "companyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" companyName=%@"), v8);

  -[TUCallDisplayContext companyDepartment](self, "companyDepartment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" companyDepartment=%@"), v9);

  -[TUCallDisplayContext companyLogoURL](self, "companyLogoURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" companyLogoURL=%@"), v10);

  -[TUCallDisplayContext mapName](self, "mapName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" mapName=%@"), v11);

  -[TUCallDisplayContext location](self, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" location=%@"), v12);

  -[TUCallDisplayContext contactName](self, "contactName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" contactName=%@"), v13);

  -[TUCallDisplayContext contactLabel](self, "contactLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" contactLabel=%@"), v14);

  -[TUCallDisplayContext callDirectoryLabel](self, "callDirectoryLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callDirectoryLabel=%@"), v15);

  -[TUCallDisplayContext callDirectoryLocalizedExtensionContainingAppName](self, "callDirectoryLocalizedExtensionContainingAppName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callDirectoryLocalizedExtensionContainingAppName=%@"), v16);

  -[TUCallDisplayContext callDirectoryExtensionIdentifier](self, "callDirectoryExtensionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callDirectoryExtensionIdentifier=%@"), v17);

  objc_msgSend(v3, "appendFormat:", CFSTR(" callDirectoryIdentityType=%ld"), -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

- (TUDynamicCallDisplayContextDelegate)delegate
{
  return (TUDynamicCallDisplayContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (CXCallDirectoryManager)callDirectoryManager
{
  return self->_callDirectoryManager;
}

- (void)setCallDirectoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_callDirectoryManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callDirectoryManager, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithCall:(uint64_t)a1 contactIdentifier:(NSObject *)a2 serialQueue:contactsDataSource:cacheOnly:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_19A50D000, a2, OS_LOG_TYPE_DEBUG, "TUCall contacts data source is a '%{public}@'", (uint8_t *)&v5, 0xCu);

}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_40_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_19A50D000, a3, OS_LOG_TYPE_ERROR, "Error retrieving call directory first identification entry for phone number %@: %@", (uint8_t *)&v7, 0x16u);

}

@end
