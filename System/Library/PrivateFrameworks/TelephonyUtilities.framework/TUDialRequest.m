@implementation TUDialRequest

+ (int64_t)dialRequestTTYTypeForCHRecentCallTTYType:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
    return a3 + 1;
  else
    return 0;
}

- (BOOL)isRTTAvailable
{
  void *v3;
  void *v4;
  char v5;

  -[TUDialRequest senderIdentityClient](self, "senderIdentityClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isRTTAvailableForSenderIdentityUUID:", v4);

  return v5;
}

- (BOOL)isTTYAvailable
{
  void *v3;
  void *v4;
  char v5;

  -[TUDialRequest senderIdentityClient](self, "senderIdentityClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isTTYAvailableForSenderIdentityUUID:", v4);

  return v5;
}

- (TUDialRequest)initWithProvider:(id)a3
{
  id v6;
  TUDialRequest *v7;
  TUDialRequest *v8;
  void *v9;
  uint64_t v10;
  NSString *uniqueProxyIdentifier;
  void *v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUDialRequest.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider != nil"));

  }
  v14.receiver = self;
  v14.super_class = (Class)TUDialRequest;
  v7 = -[TUDialRequest init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_provider, a3);
    *(_WORD *)&v8->_performDialAssist = 257;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueProxyIdentifier = v8->_uniqueProxyIdentifier;
    v8->_uniqueProxyIdentifier = (NSString *)v10;

    *(_WORD *)&v8->_hostOnCurrentDevice = 257;
  }

  return v8;
}

- (TUDialRequest)initWithService:(int)a3
{
  uint64_t v3;
  void (**v5)(void);
  void *v6;
  void *v7;
  TUDialRequest *v8;
  BOOL v10;

  v3 = *(_QWORD *)&a3;
  v10 = 0;
  objc_msgSend((id)objc_opt_class(), "callProviderManagerGeneratorBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "providerWithService:video:", v3, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (v8 = -[TUDialRequest initWithProvider:](self, "initWithProvider:", v7), (self = v8) != 0))
  {
    v8->_video = v10;
  }
  else
  {

    self = 0;
  }

  return self;
}

- (TUDialRequest)initWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TUDialRequest *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  NSSet *handles;
  uint64_t v16;
  NSString *contactIdentifier;
  void (**v18)(uint64_t, void *, int);
  void *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  uint64_t v23;
  NSString *providerCustomIdentifier;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSUUID *localSenderIdentityUUID;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSUUID *localSenderIdentityAccountUUID;
  void *v35;
  uint64_t v36;
  NSString *audioSourceIdentifier;
  void *v38;
  uint64_t v39;
  NSString *endpointIDSDestinationURI;
  void *v41;
  uint64_t v42;
  NSString *endpointRapportMediaSystemIdentifier;
  void *v44;
  uint64_t v45;
  NSString *endpointRapportEffectiveIdentifier;
  void *v47;
  uint64_t v48;
  NSString *hostIDSIdentifier;
  _BOOL4 v50;
  void *v51;
  uint64_t v52;
  NSString *successNotification;
  void *v54;
  uint64_t v55;
  NSString *failureNotification;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  BOOL v66;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
  v66 = 0;
  -[TUDialRequest callProviderFromURLComponents:video:](self, "callProviderFromURLComponents:video:", v5, &v66);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = 0;
    goto LABEL_27;
  }
  v7 = -[TUDialRequest initWithProvider:](self, "initWithProvider:", v6);
  if (!v7)
  {
    self = 0;
    goto LABEL_27;
  }
  objc_msgSend(v5, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "TUDialRequestSchemeTelephony");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", v9))
  {

    goto LABEL_9;
  }
  v10 = objc_msgSend(v5, "containsQueryItemWithName:", CFSTR("isVoicemail"));

  if (!v10)
  {
LABEL_9:
    objc_msgSend(v5, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("telemergencycall"));

    if (v12)
      v7->_dialType = 1;
    -[TUDialRequest handleFromURL:](v7, "handleFromURL:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    handles = v7->_handles;
    v7->_handles = (NSSet *)v14;

    goto LABEL_15;
  }
  v7->_dialType = 2;
LABEL_15:
  -[TUDialRequest contactIdentifierFromURLComponents:](v7, "contactIdentifierFromURLComponents:", v5);
  v16 = objc_claimAutoreleasedReturnValue();
  contactIdentifier = v7->_contactIdentifier;
  v7->_contactIdentifier = (NSString *)v16;

  if (!v7->_contactIdentifier)
  {
    v18 = (void (**)(uint64_t, void *, int))legacyAddressBookIdentifierToContactIdentifierTransformBlock;
    objc_msgSend((id)objc_opt_class(), "contactStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2]((uint64_t)v18, v19, -[TUDialRequest legacyAddressBookIdentifierFromURLComponents:](v7, "legacyAddressBookIdentifierFromURLComponents:", v5));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v7->_contactIdentifier;
    v7->_contactIdentifier = (NSString *)v20;

  }
  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("providerCustomIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "value");
  v23 = objc_claimAutoreleasedReturnValue();
  providerCustomIdentifier = v7->_providerCustomIdentifier;
  v7->_providerCustomIdentifier = (NSString *)v23;

  v25 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("localSenderIdentityUUID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "value");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v25, "initWithUUIDString:", v27);
  localSenderIdentityUUID = v7->_localSenderIdentityUUID;
  v7->_localSenderIdentityUUID = (NSUUID *)v28;

  v30 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("localSenderIdentityAccountUUID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "value");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v30, "initWithUUIDString:", v32);
  localSenderIdentityAccountUUID = v7->_localSenderIdentityAccountUUID;
  v7->_localSenderIdentityAccountUUID = (NSUUID *)v33;

  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("TUCallSourceIdentifierKey"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "value");
  v36 = objc_claimAutoreleasedReturnValue();
  audioSourceIdentifier = v7->_audioSourceIdentifier;
  v7->_audioSourceIdentifier = (NSString *)v36;

  v7->_sos = -[TUDialRequest BOOLValueForQueryItemWithName:inURLComponents:](v7, "BOOLValueForQueryItemWithName:inURLComponents:", CFSTR("sos"), v5);
  v7->_redial = -[TUDialRequest BOOLValueForQueryItemWithName:inURLComponents:](v7, "BOOLValueForQueryItemWithName:inURLComponents:", CFSTR("redial"), v5);
  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("endpointIDSDestinationURI"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "value");
  v39 = objc_claimAutoreleasedReturnValue();
  endpointIDSDestinationURI = v7->_endpointIDSDestinationURI;
  v7->_endpointIDSDestinationURI = (NSString *)v39;

  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("endpointRapportMediaSystemIdentifier"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "value");
  v42 = objc_claimAutoreleasedReturnValue();
  endpointRapportMediaSystemIdentifier = v7->_endpointRapportMediaSystemIdentifier;
  v7->_endpointRapportMediaSystemIdentifier = (NSString *)v42;

  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("endpointRapportEffectiveIdentifier"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "value");
  v45 = objc_claimAutoreleasedReturnValue();
  endpointRapportEffectiveIdentifier = v7->_endpointRapportEffectiveIdentifier;
  v7->_endpointRapportEffectiveIdentifier = (NSString *)v45;

  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("relayHostIdentifier"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "value");
  v48 = objc_claimAutoreleasedReturnValue();
  hostIDSIdentifier = v7->_hostIDSIdentifier;
  v7->_hostIDSIdentifier = (NSString *)v48;

  v7->_performDialAssist = !-[TUDialRequest BOOLValueForQueryItemWithName:inURLComponents:](v7, "BOOLValueForQueryItemWithName:inURLComponents:", CFSTR("suppressAssist"), v5);
  if (-[TUDialRequest BOOLValueForQueryItemWithName:inURLComponents:](v7, "BOOLValueForQueryItemWithName:inURLComponents:", CFSTR("suppressAssist"), v5))
  {
    LOBYTE(v50) = 0;
  }
  else
  {
    v50 = !-[TUDialRequest BOOLValueForQueryItemWithName:inURLComponents:](v7, "BOOLValueForQueryItemWithName:inURLComponents:", CFSTR("forceAssist"), v5);
  }
  v7->_performLocalDialAssist = v50;
  v7->_dialAssisted = -[TUDialRequest BOOLValueForQueryItemWithName:inURLComponents:](v7, "BOOLValueForQueryItemWithName:inURLComponents:", CFSTR("wasAssisted"), v5);
  v7->_video = v66;
  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("successNotification"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "value");
  v52 = objc_claimAutoreleasedReturnValue();
  successNotification = v7->_successNotification;
  v7->_successNotification = (NSString *)v52;

  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("failureNotification"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "value");
  v55 = objc_claimAutoreleasedReturnValue();
  failureNotification = v7->_failureNotification;
  v7->_failureNotification = (NSString *)v55;

  objc_msgSend(v5, "scheme");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "isEqualToIgnoringCase:", CFSTR("facetime-prompt")))
  {
    v7->_showUIPrompt = 1;
  }
  else
  {
    objc_msgSend(v5, "scheme");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v58, "isEqualToIgnoringCase:", CFSTR("facetime-audio-prompt")) & 1) != 0)
    {
      v7->_showUIPrompt = 1;
    }
    else
    {
      objc_msgSend(v5, "scheme");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_showUIPrompt = objc_msgSend(v59, "isEqualToIgnoringCase:", CFSTR("telprompt"));

    }
  }

  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("ttyType"));
  self = (TUDialRequest *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_opt_class();
  -[TUDialRequest value](self, "value");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_ttyType = objc_msgSend(v60, "ttyTypeForString:", v61);

  objc_msgSend(v5, "firstQueryItemWithName:", CFSTR("originatingUI"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_opt_class();
  objc_msgSend(v62, "value");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_originatingUIType = objc_msgSend(v63, "originatingUITypeForString:", v64);

  v7->_shouldSuppressInCallUI = -[TUDialRequest BOOLValueForQueryItemWithName:inURLComponents:](v7, "BOOLValueForQueryItemWithName:inURLComponents:", CFSTR("shouldSuppressInCallUI"), v5);
LABEL_27:

  return v7;
}

- (TUDialRequest)initWithUserActivity:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  TUDialRequest *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "callProviderManagerGeneratorBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TUDialRequest initWithUserActivity:providerManager:](self, "initWithUserActivity:providerManager:", v4, v6);

  return v7;
}

- (TUDialRequest)initWithUserActivity:(id)a3 providerManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TUDialRequest *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TUDialRequest initWithUserActivity:providerManager:contactsDataSource:senderIdentityClient:](self, "initWithUserActivity:providerManager:contactsDataSource:senderIdentityClient:", v7, v6, v8, 0);

  return v9;
}

- (TUDialRequest)initWithUserActivity:(id)a3 providerManager:(id)a4 contactsDataSource:(id)a5 senderIdentityClient:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  TUDialRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSUUID *localSenderIdentityUUID;
  void *v27;
  uint64_t v28;
  NSUUID *localSenderIdentityAccountUUID;
  void *v30;
  uint64_t v31;
  NSString *audioSourceIdentifier;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  objc_msgSend(v10, "interaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "intent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TUDialRequest initWithDialIntent:providerManager:contactsDataSource:senderIdentityClient:](self, "initWithDialIntent:providerManager:contactsDataSource:senderIdentityClient:", v15, v11, v13, v12);

  if (v16)
  {
    objc_msgSend(v10, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("providerIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v11, "providerWithIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_storeStrong((id *)&v16->_provider, v19);
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("sos"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("sos"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16->_sos = objc_msgSend(v21, "BOOLValue");

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("redial"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("redial"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v16->_redial = objc_msgSend(v23, "BOOLValue");

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("localSenderIdentityUUID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("localSenderIdentityUUID"));
      v25 = objc_claimAutoreleasedReturnValue();
      localSenderIdentityUUID = v16->_localSenderIdentityUUID;
      v16->_localSenderIdentityUUID = (NSUUID *)v25;

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("localSenderIdentityAccountUUID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("localSenderIdentityAccountUUID"));
      v28 = objc_claimAutoreleasedReturnValue();
      localSenderIdentityAccountUUID = v16->_localSenderIdentityAccountUUID;
      v16->_localSenderIdentityAccountUUID = (NSUUID *)v28;

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TUCallSourceIdentifierKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TUCallSourceIdentifierKey"));
      v31 = objc_claimAutoreleasedReturnValue();
      audioSourceIdentifier = v16->_audioSourceIdentifier;
      v16->_audioSourceIdentifier = (NSString *)v31;

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("performDialAssist"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("performDialAssist"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v16->_performDialAssist = objc_msgSend(v34, "BOOLValue");

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("performLocalDialAssist"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("performLocalDialAssist"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v16->_performLocalDialAssist = objc_msgSend(v36, "BOOLValue");

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("dialAssisted"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("dialAssisted"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v16->_dialAssisted = objc_msgSend(v38, "BOOLValue");

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("originatingUI"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v40 = (void *)objc_opt_class();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("originatingUI"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v16->_originatingUIType = objc_msgSend(v40, "originatingUITypeForString:", v41);

    }
  }

  return v16;
}

- (TUDialRequest)initWithDialIntent:(id)a3 providerManager:(id)a4 contactsDataSource:(id)a5 senderIdentityClient:(id)a6
{
  return -[TUDialRequest initWithDialIntent:providerManager:contactsDataSource:senderIdentityClient:isEmergencyServicesOverrideEnabled:](self, "initWithDialIntent:providerManager:contactsDataSource:senderIdentityClient:isEmergencyServicesOverrideEnabled:", a3, a4, a5, a6, 0);
}

- (TUDialRequest)initWithDialIntent:(id)a3 providerManager:(id)a4 contactsDataSource:(id)a5 senderIdentityClient:(id)a6 isEmergencyServicesOverrideEnabled:(BOOL)a7
{
  TUDialRequest *v11;
  id v12;
  NSObject *v13;
  _QWORD *v14;
  TUDialRequest *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  TUDialRequest *v33;
  NSObject *v34;
  id *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  id *v42;
  NSObject *v43;
  TUDialRequest *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  TUDialRequest *v56;
  void *v57;
  TUDialRequest *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  __CFString *v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  id v102;
  void *v103;
  TUDialRequest *v104;
  id v105;
  NSObject *v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  TUDialRequest *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  uint64_t v121;
  TUDialRequest *v122;
  void *v123;
  NSObject *v124;
  id v125;
  NSObject *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  TUDialRequest *v132;
  TUDialRequest *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  TUDialRequest *v139;
  id v140;
  TUDialRequest *v141;
  uint64_t v142;
  BOOL v143;
  char v144;
  int v145;
  id obj;
  _BOOL4 v147;
  void *v148;
  id v149;
  id v150;
  id v151;
  TUDialRequest *v152;
  TUDialRequest *v153;
  id v154;
  id v155;
  id v156;
  id v157;
  void *v158;
  void *v159;
  uint8_t buf[4];
  TUDialRequest *v161;
  __int16 v162;
  uint64_t v163;
  __int16 v164;
  uint64_t v165;
  __int16 v166;
  void *v167;
  uint64_t v168;

  v147 = a7;
  v168 = *MEMORY[0x1E0C80C00];
  v11 = (TUDialRequest *)a3;
  v154 = a4;
  v12 = a5;
  obj = a6;
  v149 = a6;
  TUDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v161 = v11;
    v162 = 2048;
    v163 = -[TUDialRequest triggerMethod](v11, "triggerMethod");
    _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "intent: %@ intent.triggerMethod: %ld", buf, 0x16u);
  }

  v145 = objc_msgSend((id)objc_opt_class(), "originatingUITypeForExecutionContext:", -[TUDialRequest _executionContext](v11, "_executionContext"));
  CUTWeakLinkClass();
  CUTWeakLinkClass();
  CUTWeakLinkClass();
  v14 = (_QWORD *)CUTWeakLinkSymbol();
  if (-[TUDialRequest _idiom](v11, "_idiom") != 4)
  {
    v22 = 0;
    v153 = 0;
    v151 = 0;
    v144 = 1;
    goto LABEL_23;
  }
  v15 = self;
  -[TUDialRequest _originatingDeviceIDSIdentifier](v11, "_originatingDeviceIDSIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    -[TUDialRequest _isOwnedByCurrentUser](v11, "_isOwnedByCurrentUser");
    v17 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    v12 = v17;
    if (v19)
    {
      -[TUDialRequest _originatingDeviceIDSIdentifier](v11, "_originatingDeviceIDSIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();
      TUDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v151 = (id)v20;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v161 = (TUDialRequest *)v20;
        _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "Intent contains an originatingDeviceIDSIdentifier: %@", buf, 0xCu);
      }
      v22 = 0;
      v153 = 0;
      goto LABEL_20;
    }
  }
  else
  {

  }
  -[TUDialRequest _originatingDeviceRapportMediaSystemIdentifier](v11, "_originatingDeviceRapportMediaSystemIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v23 == 0;
  if (v23)
  {
    -[TUDialRequest _originatingDeviceRapportMediaSystemIdentifier](v11, "_originatingDeviceRapportMediaSystemIdentifier");
    v153 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();
    TUDefaultLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v161 = v153;
      _os_log_impl(&dword_19A50D000, v25, OS_LOG_TYPE_DEFAULT, "Intent contains an _originatingDeviceRapportMediaSystemIdentifier: %@", buf, 0xCu);
    }

  }
  else
  {
    v153 = 0;
  }
  -[TUDialRequest _originatingDeviceRapportEffectiveIdentifier](v11, "_originatingDeviceRapportEffectiveIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v144 = v24;
    v22 = 0;
    v151 = 0;
    goto LABEL_22;
  }
  -[TUDialRequest _originatingDeviceRapportEffectiveIdentifier](v11, "_originatingDeviceRapportEffectiveIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v161 = (TUDialRequest *)v22;
    _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "Intent contains an originatingDeviceRapportEffectiveIdentifier: %@", buf, 0xCu);
  }
  v151 = 0;
LABEL_20:

  v144 = 0;
LABEL_22:
  self = v15;
LABEL_23:
  v152 = self;
  v150 = (id)v22;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v11;
    TUDefaultLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = -[NSObject audioRoute](v27, "audioRoute");
      v30 = -[NSObject ttyType](v27, "ttyType");
      v31 = -[NSObject preferredCallProvider](v27, "preferredCallProvider");
      *(_DWORD *)buf = 134218496;
      v161 = (TUDialRequest *)v29;
      self = v152;
      v162 = 2048;
      v163 = v30;
      v164 = 2048;
      v165 = v31;
      _os_log_impl(&dword_19A50D000, v28, OS_LOG_TYPE_DEFAULT, "Start call intent has audioRoute: %ld ttyType: %ld preferredCallProvider: %ld", buf, 0x20u);
    }

    -[NSObject contacts](v27, "contacts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();

    v143 = -[NSObject callCapability](v27, "callCapability") == 2;
    if (-[NSObject audioRoute](v27, "audioRoute") == 1)
    {
      TUDefaultLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v34, OS_LOG_TYPE_DEFAULT, "Intent contains a speakerphone audio route, setting audioSourceIdentifier to TUCallSourceIdentifierSpeakerRoute", buf, 2u);
      }

      v35 = (id *)&TUCallSourceIdentifierSpeakerRoute;
    }
    else
    {
      if (!v14 || -[NSObject audioRoute](v27, "audioRoute") != *v14)
      {
        -[NSObject recordDeviceUID](v27, "recordDeviceUID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "UUIDString");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "length");

        if (v50)
        {
          -[NSObject recordDeviceUID](v27, "recordDeviceUID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "UUIDString");
          v44 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();

          TUDefaultLog();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v161 = v44;
            _os_log_impl(&dword_19A50D000, v52, OS_LOG_TYPE_DEFAULT, "Intent contains a recordDeviceUID, setting audioSourceIdentifier to \"%@\", buf, 0xCu);
          }

        }
        else
        {
          -[NSObject recordDeviceIdentifier](v27, "recordDeviceIdentifier");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "length");

          if (v65)
          {
            -[NSObject recordDeviceIdentifier](v27, "recordDeviceIdentifier");
            v44 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();
            TUDefaultLog();
            v66 = objc_claimAutoreleasedReturnValue();
            self = v152;
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v161 = v44;
              _os_log_impl(&dword_19A50D000, v66, OS_LOG_TYPE_DEFAULT, "Intent contains a recordDeviceIdentifier, setting audioSourceIdentifier to \"%@\", buf, 0xCu);
            }

LABEL_68:
            v47 = objc_msgSend((id)objc_opt_class(), "dialRequestTypeForIntentDestinationType:", -[NSObject destinationType](v27, "destinationType"));
            if (_TUIsInternalInstall()
              && v147
              && -[NSObject destinationType](v27, "destinationType") == 2)
            {
              TUDefaultLog();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19A50D000, v67, OS_LOG_TYPE_DEFAULT, "Emergency override enabled on internal build, and dial request dial type is emergency. Overriding destination type to normal to bypass dialRequest validation check for emergency calls.", buf, 2u);
              }

              v47 = 0;
            }
            v68 = objc_msgSend((id)objc_opt_class(), "ttyTypeForIntentTTYType:", -[NSObject ttyType](v27, "ttyType"));
            if (!v68)
            {
              if (-[NSObject _idiom](v27, "_idiom") == 4)
              {
                TUDefaultLog();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19A50D000, v69, OS_LOG_TYPE_DEFAULT, "Request is from a homepod, setting ttyType to none", buf, 2u);
                }

                v68 = 1;
              }
              else
              {
                v68 = 0;
              }
            }
            v142 = v68;
            -[TUDialRequest personHandle](v33, "personHandle");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "emergencyType");

            if (v71 == 1)
            {
              objc_msgSend(v154, "emergencyProvider");
              v46 = objc_claimAutoreleasedReturnValue();
              if (_TUIsInternalInstall()
                && v147
                && -[NSObject destinationType](v27, "destinationType") == 2)
              {
                TUDefaultLog();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19A50D000, v72, OS_LOG_TYPE_DEFAULT, "Emergency override enabled on internal build, and dial request dial type is emergency. Overriding destination type to normal to bypass dialRequest validation check for emergency calls.", buf, 2u);
                }

LABEL_91:
                v47 = 0;
LABEL_101:
                TUDefaultLog();
                v80 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v161 = (TUDialRequest *)v46;
                  _os_log_impl(&dword_19A50D000, v80, OS_LOG_TYPE_DEFAULT, "Determined call intent provider: %@", buf, 0xCu);
                }

                goto LABEL_139;
              }
            }
            else
            {
              if (v47 == 2)
              {
                objc_msgSend(v154, "voicemailProvider");
                v46 = objc_claimAutoreleasedReturnValue();
                goto LABEL_101;
              }
              if (v47 != 1)
              {
                if (v47)
                {
                  v46 = 0;
                  goto LABEL_101;
                }
                v73 = (void *)objc_opt_class();
                v74 = -[NSObject preferredCallProvider](v27, "preferredCallProvider");
                -[NSObject callRecordToCallBack](v27, "callRecordToCallBack");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "providerId");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "providerForIntentPreferredCallProvider:recentCallProviderId:callCapability:providerManager:", v74, v76, -[NSObject callCapability](v27, "callCapability"), v154);
                v77 = objc_claimAutoreleasedReturnValue();

                self = v152;
                v46 = v77;
                goto LABEL_91;
              }
              objc_msgSend(v154, "emergencyProvider");
              v46 = objc_claimAutoreleasedReturnValue();
            }
            if (-[NSObject triggerMethod](v27, "triggerMethod") == 4 && !-[TUDialRequest length](v44, "length"))
            {
              TUDefaultLog();
              v78 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19A50D000, v78, OS_LOG_TYPE_DEFAULT, "It's an emergency call. Siri was triggered by HeySiri, and audioSourceIdentifier isn't set already. setting audioSourceIdentifier to speaker phone.", buf, 2u);
              }

              v79 = CFSTR("TUCallSourceIdentifierSpeakerRoute");
              v47 = 1;
              v44 = (TUDialRequest *)v79;
            }
            else
            {
              v47 = 1;
            }
            goto LABEL_101;
          }
          v44 = 0;
        }
        self = v152;
        goto LABEL_68;
      }
      TUDefaultLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v43, OS_LOG_TYPE_DEFAULT, "Intent contains a Hey Siri audio route, setting audioSourceIdentifier to TUCallSourceIdentifierHeySiri", buf, 2u);
      }

      v35 = (id *)&TUCallSourceIdentifierHeySiri;
    }
    v44 = (TUDialRequest *)*v35;
    goto LABEL_68;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v11;
    TUDefaultLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = -[NSObject audioRoute](v27, "audioRoute");
      v38 = -[NSObject ttyType](v27, "ttyType");
      v39 = -[NSObject preferredCallProvider](v27, "preferredCallProvider");
      *(_DWORD *)buf = 134218496;
      v161 = (TUDialRequest *)v37;
      self = v152;
      v162 = 2048;
      v163 = v38;
      v164 = 2048;
      v165 = v39;
      _os_log_impl(&dword_19A50D000, v36, OS_LOG_TYPE_DEFAULT, "Start call audio intent has audioRoute: %ld ttyType: %ld preferredCallProvider: %ld", buf, 0x20u);
    }

    -[NSObject contacts](v27, "contacts");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "firstObject");
    v33 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();

    if (-[NSObject audioRoute](v27, "audioRoute") == 1)
    {
      TUDefaultLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v41, OS_LOG_TYPE_DEFAULT, "Intent contains a speakerphone audio route, setting audioSourceIdentifier to TUCallSourceIdentifierSpeakerRoute", buf, 2u);
      }

      v42 = (id *)&TUCallSourceIdentifierSpeakerRoute;
    }
    else
    {
      if (!v14 || -[NSObject audioRoute](v27, "audioRoute") != *v14)
      {
        -[NSObject recordDeviceUID](v27, "recordDeviceUID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "UUIDString");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "length");

        if (v61)
        {
          -[NSObject recordDeviceUID](v27, "recordDeviceUID");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "UUIDString");
          v44 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();

          TUDefaultLog();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v161 = v44;
            _os_log_impl(&dword_19A50D000, v63, OS_LOG_TYPE_DEFAULT, "Intent contains a recordDeviceUID, setting audioSourceIdentifier to \"%@\", buf, 0xCu);
          }

        }
        else
        {
          -[NSObject recordDeviceIdentifier](v27, "recordDeviceIdentifier");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "length");

          if (v82)
          {
            -[NSObject recordDeviceIdentifier](v27, "recordDeviceIdentifier");
            v44 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();
            TUDefaultLog();
            v83 = objc_claimAutoreleasedReturnValue();
            self = v152;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v161 = v44;
              _os_log_impl(&dword_19A50D000, v83, OS_LOG_TYPE_DEFAULT, "Intent contains a recordDeviceIdentifier, setting audioSourceIdentifier to \"%@\", buf, 0xCu);
            }

LABEL_108:
            v47 = objc_msgSend((id)objc_opt_class(), "dialRequestTypeForIntentDestinationType:", -[NSObject destinationType](v27, "destinationType"));
            if (_TUIsInternalInstall()
              && v147
              && -[NSObject destinationType](v27, "destinationType") == 2)
            {
              TUDefaultLog();
              v84 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19A50D000, v84, OS_LOG_TYPE_DEFAULT, "Emergency override enabled on internal build, and dial request dial type is emergency. Overriding destination type to normal to bypass dialRequest validation check for emergency calls.", buf, 2u);
              }

              v47 = 0;
            }
            v85 = objc_msgSend((id)objc_opt_class(), "ttyTypeForIntentTTYType:", -[NSObject ttyType](v27, "ttyType"));
            if (!v85)
            {
              if (-[NSObject _idiom](v27, "_idiom") == 4)
              {
                TUDefaultLog();
                v86 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19A50D000, v86, OS_LOG_TYPE_DEFAULT, "Request is from a homepod, setting ttyType to none", buf, 2u);
                }

                v85 = 1;
              }
              else
              {
                v85 = 0;
              }
            }
            v142 = v85;
            -[TUDialRequest personHandle](v33, "personHandle");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "emergencyType");

            if (v88 == 1)
            {
              objc_msgSend(v154, "emergencyProvider");
              v46 = objc_claimAutoreleasedReturnValue();
              v47 = 1;
              if (_TUIsInternalInstall() && v147)
              {
                if (-[NSObject destinationType](v27, "destinationType") == 2)
                {
                  TUDefaultLog();
                  v89 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19A50D000, v89, OS_LOG_TYPE_DEFAULT, "Emergency override enabled on internal build, and dial request dial type is emergency. Overriding destination type to normal to bypass dialRequest validation check for emergency calls.", buf, 2u);
                  }

                  v47 = 0;
                }
                else
                {
                  v47 = 1;
                }
              }
              goto LABEL_136;
            }
            if (v47 == 2)
            {
              objc_msgSend(v154, "voicemailProvider");
              v90 = objc_claimAutoreleasedReturnValue();
            }
            else if (v47 == 1)
            {
              objc_msgSend(v154, "emergencyProvider");
              v90 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v47)
              {
                v46 = 0;
                goto LABEL_136;
              }
              objc_msgSend((id)objc_opt_class(), "providerForIntentPreferredCallProvider:recentCallProviderId:callCapability:providerManager:", -[NSObject preferredCallProvider](v27, "preferredCallProvider"), 0, 1, v154);
              v90 = objc_claimAutoreleasedReturnValue();
            }
            v46 = v90;
LABEL_136:
            TUDefaultLog();
            v91 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v161 = (TUDialRequest *)v46;
              _os_log_impl(&dword_19A50D000, v91, OS_LOG_TYPE_DEFAULT, "Determined audio call intent provider: %@", buf, 0xCu);
            }

            v143 = 0;
            goto LABEL_139;
          }
          v44 = 0;
        }
        self = v152;
        goto LABEL_108;
      }
      TUDefaultLog();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v53, OS_LOG_TYPE_DEFAULT, "Intent contains a Hey Siri audio route, setting audioSourceIdentifier to TUCallSourceIdentifierHeySiri", buf, 2u);
      }

      v42 = (id *)&TUCallSourceIdentifierHeySiri;
    }
    v44 = (TUDialRequest *)*v42;
    goto LABEL_108;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v33 = 0;
    v54 = v12;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v46 = 0;
    goto LABEL_183;
  }
  -[TUDialRequest contacts](v11, "contacts");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "firstObject");
  v33 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v154, "faceTimeProvider");
  v46 = objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v161 = (TUDialRequest *)v46;
    _os_log_impl(&dword_19A50D000, v27, OS_LOG_TYPE_DEFAULT, "Determined video call intent provider: %@", buf, 0xCu);
  }
  v44 = 0;
  v47 = 0;
  v142 = 0;
  v143 = 1;
LABEL_139:

  if (!v46)
  {
    v101 = v12;
    v56 = v44;
    v54 = v101;
    v55 = 0;
    v57 = 0;
    v58 = 0;
    goto LABEL_183;
  }
  v148 = (void *)v46;
  TUDefaultLog();
  v92 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    -[TUDialRequest personHandle](v33, "personHandle");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUDialRequest personHandle](v33, "personHandle");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "value");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUDialRequest contactIdentifier](v33, "contactIdentifier");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v161 = v33;
    v162 = 2112;
    v163 = (uint64_t)v93;
    v164 = 2112;
    v165 = (uint64_t)v95;
    v166 = 2112;
    v167 = v96;
    _os_log_impl(&dword_19A50D000, v92, OS_LOG_TYPE_DEFAULT, "Determining destinationID and contactIdentifier for INPerson: %@ (personHandle=%@, personHandle.value=%@, contactIdentifier=%@)", buf, 0x2Au);

    self = v152;
  }

  -[TUDialRequest personHandle](v33, "personHandle");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "value");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v98, "length"))
  {
    -[TUDialRequest contactIdentifier](v33, "contactIdentifier");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "length");

    if (v100)
    {
      +[TUHandle handleWithPerson:](TUHandle, "handleWithPerson:", v33);
      v58 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();
      -[TUDialRequest contactIdentifier](v33, "contactIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_155;
    }
  }
  else
  {

  }
  if (v33)
  {
    if (v12)
    {
      v102 = v12;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "contactStore");
      v102 = (id)objc_claimAutoreleasedReturnValue();
    }
    v103 = v102;
    v157 = 0;
    -[TUDialRequest _contactFromINPerson:contactsDataSource:bestGuessHandle:](self, "_contactFromINPerson:contactsDataSource:bestGuessHandle:", v33, v102, &v157);
    v104 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();
    v105 = v157;
    TUDefaultLog();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v161 = v104;
      _os_log_impl(&dword_19A50D000, v106, OS_LOG_TYPE_DEFAULT, "Obtained CNContact from INPerson: %@", buf, 0xCu);
    }

    v58 = (TUDialRequest *)v105;
    -[TUDialRequest identifier](v104, "identifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v57 = 0;
    v58 = 0;
  }
LABEL_155:
  TUDefaultLog();
  v107 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v161 = v58;
    v162 = 2112;
    v163 = (uint64_t)v57;
    _os_log_impl(&dword_19A50D000, v107, OS_LOG_TYPE_DEFAULT, "Using the following handle and contactIdentifier: %@, %@", buf, 0x16u);
  }
  v141 = v33;

  objc_msgSend(v154, "telephonyProvider");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v109 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v108, "prioritizedSenderIdentities");
    v110 = (TUDialRequest *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v161 = v110;
    _os_log_impl(&dword_19A50D000, v109, OS_LOG_TYPE_DEFAULT, "Sender identities the device holds %@", buf, 0xCu);

    self = v152;
  }
  v111 = v12;

  v138 = v108;
  objc_msgSend(v108, "prioritizedSenderIdentities");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v11;
  v140 = v12;
  if ((unint64_t)objc_msgSend(v112, "count") < 2)
  {
    v56 = v44;
    v122 = self;
    self = 0;
    v136 = 0;
    v137 = 0;
    v125 = 0;
LABEL_176:

    goto LABEL_177;
  }
  v113 = objc_msgSend(v57, "length");

  if (v113)
  {
    v134 = v44;
    v135 = v47;
    v114 = (void *)MEMORY[0x1E0C97200];
    v159 = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v159, 1);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "predicateForContactsWithIdentifiers:", v115);
    v116 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97310], "descriptorForRequiredKeys");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = v117;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v158, 1);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    v156 = 0;
    objc_msgSend(v111, "unifiedContactsMatchingPredicate:keysToFetch:error:", v116, v112, &v156);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v156;
    v137 = (void *)v116;
    if (!v118)
    {
      v120 = 0;
      v122 = v152;
      TUDefaultLog();
      v124 = objc_claimAutoreleasedReturnValue();
      v56 = v134;
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v161 = v141;
        v162 = 2112;
        v163 = (uint64_t)v119;
        _os_log_impl(&dword_19A50D000, v124, OS_LOG_TYPE_DEFAULT, "[WARN] Error obtaining contact from INPerson %@: %@", buf, 0x16u);
      }
      self = 0;
      v136 = 0;
      v125 = v119;
      goto LABEL_175;
    }
    v120 = v118;
    objc_msgSend(v118, "firstObject");
    v121 = objc_claimAutoreleasedReturnValue();
    v122 = v152;
    -[TUDialRequest contactGeminiManager](v152, "contactGeminiManager");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = v119;
    v136 = (void *)v121;
    objc_msgSend(v123, "bestSenderIdentityForContact:error:", v121, &v155);
    v124 = objc_claimAutoreleasedReturnValue();
    v125 = v155;

    if (v124)
    {
      -[NSObject accountUUID](v124, "accountUUID");
      self = (TUDialRequest *)objc_claimAutoreleasedReturnValue();
      TUDefaultLog();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v161 = self;
        _os_log_impl(&dword_19A50D000, v126, OS_LOG_TYPE_DEFAULT, "Contact preferred accountUUIDData %@", buf, 0xCu);
      }
    }
    else
    {
      if (!v125)
      {
        v56 = v134;
        self = 0;
        goto LABEL_175;
      }
      TUDefaultLog();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        -[TUDialRequest initWithDialIntent:providerManager:contactsDataSource:senderIdentityClient:isEmergencyServicesOverrideEnabled:].cold.1((uint64_t)v125, v126);
      self = 0;
    }
    v56 = v134;

LABEL_175:
    v47 = v135;
    goto LABEL_176;
  }
  v56 = v44;
  v122 = self;
  self = 0;
  v136 = 0;
  v137 = 0;
  v125 = 0;
LABEL_177:
  v33 = v141;
  -[TUDialRequest displayName](v141, "displayName");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest setSiriDisplayName:](v58, "setSiriDisplayName:", v127);

  v46 = -[TUDialRequest initWithProvider:](v122, "initWithProvider:", v148);
  v11 = v139;
  if (v46)
  {
    if (v58)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v58);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v128 = objc_claimAutoreleasedReturnValue();
    v129 = *(void **)(v46 + 64);
    *(_QWORD *)(v46 + 64) = v128;

    objc_storeStrong((id *)(v46 + 72), v57);
    -[TUDialRequest customIdentifier](v141, "customIdentifier");
    v130 = objc_claimAutoreleasedReturnValue();
    v131 = *(void **)(v46 + 80);
    *(_QWORD *)(v46 + 80) = v130;

    *(_BYTE *)(v46 + 8) = v143;
    *(_QWORD *)(v46 + 56) = v47;
    *(_QWORD *)(v46 + 96) = v142;
    *(_DWORD *)(v46 + 20) = v145;
    objc_storeStrong((id *)(v46 + 88), v56);
    objc_storeStrong((id *)(v46 + 32), obj);
    objc_storeStrong((id *)(v46 + 136), v151);
    objc_storeStrong((id *)(v46 + 144), v153);
    objc_storeStrong((id *)(v46 + 152), v150);
    *(_BYTE *)(v46 + 14) = v144;
    objc_storeStrong((id *)(v46 + 176), self);
  }

  v54 = v140;
  v55 = v148;
LABEL_183:

  v132 = (TUDialRequest *)(id)v46;
  return v132;
}

- (TUDialRequest)init
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TUDialRequest init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Don't call %@, call designated initializer instead."), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("** TUAssertion failure: %@"), v6);

  if (_TUAssertShouldCrashApplication())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TUDialRequest init]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUDialRequest.m"), 604, CFSTR("Don't call %@, call designated initializer instead."), v8);

  }
  return 0;
}

- (TUHandle)handle
{
  void *v2;
  void *v3;

  -[TUDialRequest handles](self, "handles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUHandle *)v3;
}

- (void)setHandle:(id)a3
{
  id v4;

  if (a3)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest setHandles:](self, "setHandles:", v4);

}

- (NSString)description
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
  uint64_t v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringForDialType:", -[TUDialRequest dialType](self, "dialType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dialType=%@"), v4);

  -[TUDialRequest handles](self, "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handles=%@"), v5);

  -[TUDialRequest contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" contactIdentifier=%@"), v6);

  -[TUDialRequest providerCustomIdentifier](self, "providerCustomIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" providerCustomIdentifier=%@"), v7);

  -[TUDialRequest localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localSenderIdentityUUID=%@"), v8);

  -[TUDialRequest localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localSenderIdentityAccountUUID=%@"), v9);

  -[TUDialRequest audioSourceIdentifier](self, "audioSourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" audioSourceIdentifier=%@"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR(" video=%d"), -[TUDialRequest isVideo](self, "isVideo"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" performDialAssist=%d"), -[TUDialRequest performDialAssist](self, "performDialAssist"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" performLocalDialAssist=%d"), -[TUDialRequest performLocalDialAssist](self, "performLocalDialAssist"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" dialAssisted=%d"), -[TUDialRequest isDialAssisted](self, "isDialAssisted"));
  objc_msgSend((id)objc_opt_class(), "stringForTTYType:", -[TUDialRequest ttyType](self, "ttyType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" ttyType=%@"), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR(" showUIPrompt=%d"), -[TUDialRequest showUIPrompt](self, "showUIPrompt"));
  -[TUDialRequest uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" uniqueProxyIdentifier=%@"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR(" hostOnCurrentDevice=%d"), -[TUDialRequest hostOnCurrentDevice](self, "hostOnCurrentDevice"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" endpointOnCurrentDevice=%d"), -[TUDialRequest endpointOnCurrentDevice](self, "endpointOnCurrentDevice"));
  -[TUDialRequest endpointIDSDestinationURI](self, "endpointIDSDestinationURI");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" endpointIDSDestinationURI=%@"), v13);

  -[TUDialRequest endpointRapportMediaSystemIdentifier](self, "endpointRapportMediaSystemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" endpointRapportMediaSystemIdentifier=%@"), v14);

  -[TUDialRequest endpointRapportEffectiveIdentifier](self, "endpointRapportEffectiveIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" endpointRapportEffectiveIdentifier=%@"), v15);

  objc_msgSend(v3, "appendFormat:", CFSTR(" originatingUI=%ld"), -[TUDialRequest originatingUIType](self, "originatingUIType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sos=%d"), -[TUDialRequest isSOS](self, "isSOS"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" shouldSuppressInCallUI=%d"), -[TUDialRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" valid=%d"), -[TUDialRequest isValid](self, "isValid"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" redial=%d"), -[TUDialRequest isRedial](self, "isRedial"));
  -[TUDialRequest provider](self, "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" provider=%@"), v16);

  -[TUDialRequest validityErrors](self, "validityErrors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[TUDialRequest validityErrors](self, "validityErrors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" validityErrors=%@"), v20);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

+ (id)stringForDialType:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
    return off_1E38A3EC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown value: %ld>"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)handleTypeForQueryItem:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("handleType"));

  if (v5)
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("emailAddress")) & 1) != 0)
      {
        v8 = 3;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("generic")) & 1) != 0)
      {
        v8 = 1;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("phoneNumber")))
      {
        v8 = 2;
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

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)stringForTTYType:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return off_1E38A3ED8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown value: %ld>"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)ttyTypeForString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("direct")) & 1) != 0)
    {
      v5 = 2;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("relay")))
    {
      v5 = 3;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)dialRequestTypeForIntentDestinationType:(int64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

+ (int64_t)intentTTYTypeForTTYType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (int64_t)ttyTypeForIntentTTYType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (id)providerForIntentPreferredCallProvider:(int64_t)a3 recentCallProviderId:(id)a4 callCapability:(int64_t)a5 providerManager:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  v9 = a4;
  v10 = a6;
  v11 = v10;
  switch(a3)
  {
    case 0:
      if ((unint64_t)a5 < 2)
      {
        objc_msgSend(v10, "defaultProvider");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      if (a5 != 2)
        goto LABEL_12;
      goto LABEL_10;
    case 1:
      objc_msgSend(v10, "telephonyProvider");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
LABEL_10:
      objc_msgSend(v10, "faceTimeProvider");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v13 = (void *)v12;
      break;
    case 3:
      if (!v9)
        goto LABEL_12;
      objc_msgSend(v10, "providerWithIdentifier:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      TUDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        +[TUDialRequest providerForIntentPreferredCallProvider:recentCallProviderId:callCapability:providerManager:].cold.1(v13, v14);

      break;
    default:
LABEL_12:
      v13 = 0;
      break;
  }

  return v13;
}

+ (int)originatingUITypeForExecutionContext:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA)
    return 11;
  else
    return dword_19A65DDC4[a3];
}

+ (id)stringForOriginatingUIType:(int)a3
{
  if ((a3 - 1) > 0x1F)
    return 0;
  else
    return off_1E38A3EF8[a3 - 1];
}

- (void)setOriginatingUIType:(int)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Setting originating UI type to =%d", (uint8_t *)v6, 8u);
  }

  self->_originatingUIType = a3;
}

+ (int)originatingUITypeForString:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dialer")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("emergencyDialerLockscreen")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("sideButtonPresses")) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("volumeLockHold")) & 1) != 0)
    {
      v5 = 4;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("sideButtonHold")) & 1) != 0)
    {
      v5 = 5;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fallDetection")) & 1) != 0)
    {
      v5 = 6;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fallDetectionUserResponsive")) & 1) != 0)
    {
      v5 = 13;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ecg")) & 1) != 0)
    {
      v5 = 7;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("phoneRecents")) & 1) != 0)
    {
      v5 = 8;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("phoneFavorites")) & 1) != 0)
    {
      v5 = 9;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("facetimeRecents")) & 1) != 0)
    {
      v5 = 14;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("facetimeLink")) & 1) != 0)
    {
      v5 = 15;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("contactCard")) & 1) != 0)
    {
      v5 = 16;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("messagesContactCard")) & 1) != 0)
    {
      v5 = 17;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("messagesAvatarBar")) & 1) != 0)
    {
      v5 = 18;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("messagesBubble")) & 1) != 0)
    {
      v5 = 19;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("facetimeMissedCallNotification")) & 1) != 0)
    {
      v5 = 23;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("facetimeGFTNotification")) & 1) != 0)
    {
      v5 = 24;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("facetimeOngoing")) & 1) != 0)
    {
      v5 = 20;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("facetimeSpotlight")) & 1) != 0)
    {
      v5 = 22;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("facetimeCreateCall")) & 1) != 0)
    {
      v5 = 21;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("crashDetection")) & 1) != 0)
    {
      v5 = 10;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("crashDetectionUserResponsive")) & 1) != 0)
    {
      v5 = 12;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("siri")) & 1) != 0)
    {
      v5 = 11;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("dialerCallButtonDoubleTap")))
    {
      v5 = 26;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)service
{
  TUDialRequest *v2;
  void *v3;

  v2 = self;
  -[TUDialRequest provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = +[TUCallProviderManager serviceForProvider:video:](TUCallProviderManager, "serviceForProvider:video:", v3, -[TUDialRequest isVideo](v2, "isVideo"));

  return (int)v2;
}

- (BOOL)useTTY
{
  return (-[TUDialRequest ttyType](self, "ttyType") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)contactStore
{
  return +[TUCallCenter sharedContactStore](TUCallCenter, "sharedContactStore");
}

- (TUSenderIdentity)localSenderIdentity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUDialRequest localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (-[TUDialRequest provider](self, "provider"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "senderIdentityForAccountUUID:", v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    -[TUDialRequest provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prioritizedSenderIdentities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (TUSenderIdentity *)v5;
}

- (TUSenderIdentityClient)senderIdentityClient
{
  TUSenderIdentityClient *senderIdentityClient;
  TUSenderIdentityClient *v4;
  TUSenderIdentityClient *v5;

  senderIdentityClient = self->_senderIdentityClient;
  if (!senderIdentityClient)
  {
    v4 = objc_alloc_init(TUSenderIdentityClient);
    v5 = self->_senderIdentityClient;
    self->_senderIdentityClient = v4;

    senderIdentityClient = self->_senderIdentityClient;
  }
  return senderIdentityClient;
}

- (id)isEmergencyNumberBlock
{
  id isEmergencyNumberBlock;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;

  isEmergencyNumberBlock = self->_isEmergencyNumberBlock;
  if (!isEmergencyNumberBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__TUDialRequest_isEmergencyNumberBlock__block_invoke;
    v7[3] = &unk_1E38A3E40;
    objc_copyWeak(&v8, &location);
    v4 = _Block_copy(v7);
    v5 = self->_isEmergencyNumberBlock;
    self->_isEmergencyNumberBlock = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    isEmergencyNumberBlock = self->_isEmergencyNumberBlock;
  }
  return _Block_copy(isEmergencyNumberBlock);
}

uint64_t __39__TUDialRequest_isEmergencyNumberBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "senderIdentityClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEmergencyNumberForDigits:senderIdentityUUID:", v5, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)isEmergencyNumberOrIsWhitelistedBlock
{
  id isEmergencyNumberOrIsWhitelistedBlock;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;

  isEmergencyNumberOrIsWhitelistedBlock = self->_isEmergencyNumberOrIsWhitelistedBlock;
  if (!isEmergencyNumberOrIsWhitelistedBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__TUDialRequest_isEmergencyNumberOrIsWhitelistedBlock__block_invoke;
    v7[3] = &unk_1E38A3E40;
    objc_copyWeak(&v8, &location);
    v4 = _Block_copy(v7);
    v5 = self->_isEmergencyNumberOrIsWhitelistedBlock;
    self->_isEmergencyNumberOrIsWhitelistedBlock = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    isEmergencyNumberOrIsWhitelistedBlock = self->_isEmergencyNumberOrIsWhitelistedBlock;
  }
  return _Block_copy(isEmergencyNumberOrIsWhitelistedBlock);
}

uint64_t __54__TUDialRequest_isEmergencyNumberOrIsWhitelistedBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "senderIdentityClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isWhitelistedEmergencyNumberForDigits:senderIdentityUUID:", v5, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)destinationID
{
  void *v2;
  void *v3;

  -[TUDialRequest handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDestinationID:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[TUDialRequest handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = TUStringsAreEqualOrNil((unint64_t)v5, (uint64_t)v8);

  if ((v6 & 1) == 0)
  {
    if (v8)
    {
      +[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUDialRequest setHandle:](self, "setHandle:", v7);

    }
    else
    {
      -[TUDialRequest setHandle:](self, "setHandle:");
    }
  }

}

- (IDSDestination)endpointIDSDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest endpointIDSDestinationURI](self, "endpointIDSDestinationURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D34D18];
    -[TUDialRequest endpointIDSDestinationURI](self, "endpointIDSDestinationURI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destinationWithURI:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (IDSDestination *)v6;
}

- (NSUUID)localSenderIdentityUUID
{
  NSUUID *localSenderIdentityUUID;
  void *v4;
  void *v5;
  NSUUID *v6;
  NSUUID *v7;

  localSenderIdentityUUID = self->_localSenderIdentityUUID;
  if (!localSenderIdentityUUID)
  {
    if (self->_localSenderIdentityAccountUUID)
    {
      -[TUDialRequest provider](self, "provider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "senderIdentityForAccountUUID:", self->_localSenderIdentityAccountUUID);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v7 = self->_localSenderIdentityUUID;
      self->_localSenderIdentityUUID = v6;

      localSenderIdentityUUID = self->_localSenderIdentityUUID;
    }
    else
    {
      localSenderIdentityUUID = 0;
    }
  }
  return localSenderIdentityUUID;
}

- (NSUUID)localSenderIdentityAccountUUID
{
  NSUUID *localSenderIdentityAccountUUID;
  void *v4;
  void *v5;
  NSUUID *v6;
  NSUUID *v7;

  localSenderIdentityAccountUUID = self->_localSenderIdentityAccountUUID;
  if (!localSenderIdentityAccountUUID)
  {
    if (self->_localSenderIdentityUUID)
    {
      -[TUDialRequest provider](self, "provider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "senderIdentityForUUID:", self->_localSenderIdentityUUID);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountUUID");
      v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v7 = self->_localSenderIdentityAccountUUID;
      self->_localSenderIdentityAccountUUID = v6;

      localSenderIdentityAccountUUID = self->_localSenderIdentityAccountUUID;
    }
    else
    {
      localSenderIdentityAccountUUID = 0;
    }
  }
  return localSenderIdentityAccountUUID;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[TUDialRequest provider](self, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sanitizedHandles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TUDialRequest handles](self, "handles", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "normalizedValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v12, "length"))
        {
          objc_msgSend(v9, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v15;
        }
        if (objc_msgSend(v12, "length"))
          objc_msgSend(v3, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (id)contactNamesByHandleWithContactsDataSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v4 = (void *)MEMORY[0x1E0C99E08];
  -[TUDialRequest handles](self, "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[TUDialRequest sanitizedHandles](self, "sanitizedHandles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "length"))
        {
          -[TUDialRequest contactIdentifier](self, "contactIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v15)
          {
            -[TUDialRequest contactIdentifier](self, "contactIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "contactForIdentifier:keysToFetch:", v16, v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v23, "contactForDestinationId:keysToFetch:", v11, v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v17, "displayName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "length"))
            v19 = v18;
          else
            v19 = v11;
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v20 = (void *)objc_msgSend(v6, "copy");
  return v20;
}

+ (id)callProviderManagerGeneratorBlock
{
  return _Block_copy((const void *)callProviderManagerGeneratorBlock);
}

+ (void)setCallProviderManagerGeneratorBlock:(id)a3
{
  void *v3;
  void *v4;

  v3 = _Block_copy(a3);
  v4 = (void *)callProviderManagerGeneratorBlock;
  callProviderManagerGeneratorBlock = (uint64_t)v3;

}

- (CNGeminiManager)contactGeminiManager
{
  CNGeminiManager *contactGeminiManager;
  id v4;
  void (**v5)(void);
  void *v6;
  CNGeminiManager *v7;
  CNGeminiManager *v8;

  contactGeminiManager = self->_contactGeminiManager;
  if (!contactGeminiManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0C97310]);
    objc_msgSend((id)objc_opt_class(), "callProviderManagerGeneratorBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CNGeminiManager *)objc_msgSend(v4, "initWithCallProviderManager:", v6);
    v8 = self->_contactGeminiManager;
    self->_contactGeminiManager = v7;

    contactGeminiManager = self->_contactGeminiManager;
  }
  return contactGeminiManager;
}

+ (void)setLegacyAddressBookIdentifierToContactIdentifierTransformBlock:(id)a3
{
  void *v3;
  void *v4;

  v3 = _Block_copy(a3);
  v4 = legacyAddressBookIdentifierToContactIdentifierTransformBlock;
  legacyAddressBookIdentifierToContactIdentifierTransformBlock = v3;

}

+ (id)legacyAddressBookIdentifierToContactIdentifierTransformBlock
{
  return _Block_copy(legacyAddressBookIdentifierToContactIdentifierTransformBlock);
}

- (BOOL)BOOLValueForQueryItemWithName:(id)a3 inURLComponents:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a4, "firstQueryItemWithName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (id)callProviderFromURLComponents:(id)a3 video:(BOOL *)a4
{
  id v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  void *v21;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "callProviderManagerGeneratorBlock");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "TUDialRequestSchemeTelephony");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToIgnoringCase:", v10) & 1) != 0
    || (objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("telprompt")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("telemergencycall")) & 1) != 0)
  {

LABEL_5:
    objc_msgSend(v8, "telephonyProvider");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = (void *)v11;
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v15 = objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("callto"));

  if ((v15 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0C99E98], "TUDialRequestSchemeFaceTimeAudio");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToIgnoringCase:", v16) & 1) != 0
    || (objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("facetime-audio-prompt")) & 1) != 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "TUDialRequestSchemeFaceTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToIgnoringCase:", v17))
  {

LABEL_16:
    goto LABEL_17;
  }
  v20 = objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("facetime-prompt"));

  if ((v20 & 1) == 0)
  {
    if (!objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("tincan")))
    {
      if ((objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("superbox-audio")) & 1) != 0
        || objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("superbox-video")))
      {
        objc_msgSend(v8, "superboxProvider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("superbox-video"));
      }
      else if ((objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("callkit-audio")) & 1) != 0
             || objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("callkit-video")))
      {
        -[TUDialRequest callProviderIdentiferFromURLComponents:](self, "callProviderIdentiferFromURLComponents:", v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length"))
        {
          objc_msgSend(v8, "providerWithIdentifier:", v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("callkit-video"));
        }
        else
        {
          v13 = 0;
          v12 = 0;
        }

      }
      else
      {
        v13 = 0;
        v12 = 0;
      }
      goto LABEL_8;
    }
    objc_msgSend(v8, "tinCanProvider");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_17:
  objc_msgSend(v8, "faceTimeProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "TUDialRequestSchemeFaceTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToIgnoringCase:", v18) & 1) != 0)
  {

  }
  else
  {
    v19 = objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("facetime-prompt"));

    if ((v19 & 1) == 0)
      goto LABEL_7;
  }
  v13 = 1;
LABEL_8:
  if (a4)
    *a4 = v13;

  return v12;
}

- (id)destinationIDFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)IMCopyStringWithLatinNumbers();

    objc_msgSend(v3, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "user");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@@%@"), v9, v6);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    objc_msgSend(v3, "fragment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "fragment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@#%@"), v6, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
    }
    if (v6)
      goto LABEL_7;
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "_destinationIDConvertingNumbersToLatin:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_9;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v16;
}

- (id)handleFromURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  TUHandle *v9;

  v4 = a3;
  -[TUDialRequest destinationIDFromURL:](self, "destinationIDFromURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
    objc_msgSend(v6, "firstQueryItemWithName:", CFSTR("handleType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (v8 = objc_msgSend((id)objc_opt_class(), "handleTypeForQueryItem:", v7)) == 0
      || (v9 = -[TUHandle initWithType:value:]([TUHandle alloc], "initWithType:value:", v8, v5)) == 0)
    {
      +[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v5);
      v9 = (TUHandle *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)contactIdentifierFromURLComponents:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "firstQueryItemWithName:", CFSTR("contactIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)callProviderIdentiferFromURLComponents:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "firstQueryItemWithName:", CFSTR("providerIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)legacyAddressBookIdentifierFromURLComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[TUDialRequest legacyAddressBookIdentifierQueryItemName](self, "legacyAddressBookIdentifierQueryItemName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstQueryItemWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (id)legacyAddressBookIdentifierQueryItemName
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  -[TUDialRequest provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTelephonyProvider");

  if ((v4 & 1) != 0)
    return CFSTR("abuid");
  -[TUDialRequest provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFaceTimeProvider");

  if (v7)
    return CFSTR("uid");
  else
    return 0;
}

- (NSURL)URL
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (-[TUDialRequest isValid](self, "isValid"))
  {
    -[TUDialRequest URLScheme](self, "URLScheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUDialRequest URLHost](self, "URLHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUDialRequest URLQueryItems](self, "URLQueryItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v6, "setScheme:", v3);
      objc_msgSend(v6, "setEncodedHost:", v4);
      objc_msgSend(v6, "setQueryItems:", v5);
      objc_msgSend(v6, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return (NSURL *)v7;
}

- (id)URLScheme
{
  void *v3;
  int v4;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  __CFString *v14;
  const __CFString *v15;

  -[TUDialRequest provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTelephonyProvider");

  if (v4)
  {
    if (-[TUDialRequest dialType](self, "dialType") == 1)
      return CFSTR("telemergencycall");
    objc_msgSend(MEMORY[0x1E0C99E98], "TUDialRequestSchemeTelephony");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[TUDialRequest showUIPrompt](self, "showUIPrompt"))
    {

      return CFSTR("telprompt");
    }
  }
  else
  {
    -[TUDialRequest provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isFaceTimeProvider");

    if (v7)
    {
      if (-[TUDialRequest isVideo](self, "isVideo"))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "TUDialRequestSchemeFaceTime");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[TUDialRequest showUIPrompt](self, "showUIPrompt"))
        {

          return CFSTR("facetime-prompt");
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "TUDialRequestSchemeFaceTimeAudio");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[TUDialRequest showUIPrompt](self, "showUIPrompt"))
        {

          return CFSTR("facetime-audio-prompt");
        }
      }
    }
    else
    {
      -[TUDialRequest provider](self, "provider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isTinCanProvider");

      if ((v10 & 1) != 0)
        return CFSTR("tincan");
      -[TUDialRequest provider](self, "provider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isSuperboxProvider");

      v13 = -[TUDialRequest isVideo](self, "isVideo");
      if (v12)
      {
        v14 = CFSTR("superbox-audio");
        v15 = CFSTR("superbox-video");
      }
      else
      {
        v14 = CFSTR("callkit-audio");
        v15 = CFSTR("callkit-video");
      }
      if (v13)
        v14 = (__CFString *)v15;
      v8 = v14;
    }
  }
  return v8;
}

- (id)URLHost
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;

  -[TUDialRequest handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v4, "length"))
  {
    -[TUDialRequest handle](self, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type");

    if (v6 == 2)
    {
      TUURLHostForTelephoneNumber(v4);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString length](v7, "length")
        && (-[TUDialRequest service](self, "service") == 2 || -[TUDialRequest service](self, "service") == 3))
      {
        IMFormatPhoneNumber();
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = v7;
      }
    }
  }
  if (-[__CFString length](v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "removeCharactersInString:", CFSTR("[]:"));
    -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v10;
  }
  if (v4)
    v11 = v4;
  else
    v11 = &stru_1E38A53C8;
  v12 = v11;

  return v12;
}

- (id)URLQueryItems
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  -[TUDialRequest handleTypeURLQueryItem](self, "handleTypeURLQueryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);
  }
  else
  {
    v4 = 0;
  }

  -[TUDialRequest isVoicemailURLQueryItem](self, "isVoicemailURLQueryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v5);
  }

  -[TUDialRequest providerCustomIdentifierURLQueryItem](self, "providerCustomIdentifierURLQueryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v6);
  }

  -[TUDialRequest localSenderIdentityUUIDURLQueryItem](self, "localSenderIdentityUUIDURLQueryItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v7);
  }

  -[TUDialRequest localSenderIdentityAccountUUIDURLQueryItem](self, "localSenderIdentityAccountUUIDURLQueryItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v8);
  }

  -[TUDialRequest contactIdentifierURLQueryItem](self, "contactIdentifierURLQueryItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v9);
  }

  -[TUDialRequest callProviderIdentifierURLQueryItem](self, "callProviderIdentifierURLQueryItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v10);
  }

  -[TUDialRequest audioSourceIdentifierURLQueryItem](self, "audioSourceIdentifierURLQueryItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v11);
  }

  -[TUDialRequest forceAssistURLQueryItem](self, "forceAssistURLQueryItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v12);
  }

  -[TUDialRequest suppressAssistURLQueryItem](self, "suppressAssistURLQueryItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v13);
  }

  -[TUDialRequest dialAssistedURLQueryItem](self, "dialAssistedURLQueryItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v14);
  }

  -[TUDialRequest ttyTypeURLQueryItem](self, "ttyTypeURLQueryItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v15);
  }

  -[TUDialRequest originatingUIURLQueryItem](self, "originatingUIURLQueryItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v16);
  }

  -[TUDialRequest noPromptURLQueryItem](self, "noPromptURLQueryItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v17);
  }

  -[TUDialRequest sosURLQueryItem](self, "sosURLQueryItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v18);
  }

  -[TUDialRequest redialURLQueryItem](self, "redialURLQueryItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v19);
  }

  -[TUDialRequest endpointIDSDestinationURIQueryItem](self, "endpointIDSDestinationURIQueryItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v20);
  }

  -[TUDialRequest endpointRapportMediaSystemIdentifierQueryItem](self, "endpointRapportMediaSystemIdentifierQueryItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v21);
  }

  -[TUDialRequest endpointRapportEffectiveIdentifierQueryItem](self, "endpointRapportEffectiveIdentifierQueryItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v22);
  }

  -[TUDialRequest shouldSuppressInCallUIQueryItem](self, "shouldSuppressInCallUIQueryItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v23);
  }

  -[TUDialRequest successNotificationQueryItem](self, "successNotificationQueryItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v24);
  }

  -[TUDialRequest failureNotificationQueryItem](self, "failureNotificationQueryItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", v25);
  }

  v26 = (void *)objc_msgSend(v4, "copy");
  return v26;
}

- (id)isVoicemailURLQueryItem
{
  void *v3;

  if (-[TUDialRequest service](self, "service") == 1 && -[TUDialRequest dialType](self, "dialType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("isVoicemail"), CFSTR("1"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)contactIdentifierURLQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest contactIdentifier](self, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest contactIdentifier](self, "contactIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("contactIdentifier"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)callProviderIdentifierURLQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[TUDialRequest provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isSystemProvider") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[TUDialRequest provider](self, "provider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v4 = 0;
      return v4;
    }
    v7 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest provider](self, "provider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryItemWithName:value:", CFSTR("providerIdentifier"), v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)providerCustomIdentifierURLQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest providerCustomIdentifier](self, "providerCustomIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest providerCustomIdentifier](self, "providerCustomIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("providerCustomIdentifier"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)localSenderIdentityUUIDURLQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUDialRequest localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest localSenderIdentityUUID](self, "localSenderIdentityUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("localSenderIdentityUUID"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)localSenderIdentityAccountUUIDURLQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUDialRequest localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("localSenderIdentityAccountUUID"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)audioSourceIdentifierURLQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest audioSourceIdentifier](self, "audioSourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest audioSourceIdentifier](self, "audioSourceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("TUCallSourceIdentifierKey"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)forceAssistURLQueryItem
{
  void *v3;

  if (-[TUDialRequest performDialAssist](self, "performDialAssist")
    && !-[TUDialRequest performLocalDialAssist](self, "performLocalDialAssist"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("forceAssist"), CFSTR("1"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)suppressAssistURLQueryItem
{
  void *v3;

  if (-[TUDialRequest performDialAssist](self, "performDialAssist")
    || -[TUDialRequest performLocalDialAssist](self, "performLocalDialAssist"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("suppressAssist"), CFSTR("1"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)dialAssistedURLQueryItem
{
  void *v2;

  if (-[TUDialRequest isDialAssisted](self, "isDialAssisted"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("wasAssisted"), CFSTR("1"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)handleTypeURLQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest handle](self, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemForHandleType:", objc_msgSend(v5, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)ttyTypeURLQueryItem
{
  void *v3;
  void *v4;
  void *v5;

  if (-[TUDialRequest ttyType](self, "ttyType"))
  {
    v3 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend((id)objc_opt_class(), "stringForTTYType:", -[TUDialRequest ttyType](self, "ttyType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "queryItemWithName:value:", CFSTR("ttyType"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)originatingUIURLQueryItem
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "stringForOriginatingUIType:", -[TUDialRequest originatingUIType](self, "originatingUIType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("originatingUI"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)noPromptURLQueryItem
{
  return 0;
}

- (id)sosURLQueryItem
{
  void *v2;

  if (-[TUDialRequest isSOS](self, "isSOS"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("sos"), CFSTR("1"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)redialURLQueryItem
{
  void *v2;

  if (-[TUDialRequest isRedial](self, "isRedial"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("redial"), CFSTR("1"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)endpointIDSDestinationURIQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest endpointIDSDestinationURI](self, "endpointIDSDestinationURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest endpointIDSDestinationURI](self, "endpointIDSDestinationURI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("endpointIDSDestinationURI"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)endpointRapportMediaSystemIdentifierQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest endpointRapportMediaSystemIdentifier](self, "endpointRapportMediaSystemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest endpointRapportMediaSystemIdentifier](self, "endpointRapportMediaSystemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("endpointRapportMediaSystemIdentifier"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)endpointRapportEffectiveIdentifierQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest endpointRapportEffectiveIdentifier](self, "endpointRapportEffectiveIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest endpointRapportEffectiveIdentifier](self, "endpointRapportEffectiveIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("endpointRapportEffectiveIdentifier"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)shouldSuppressInCallUIQueryItem
{
  void *v2;

  if (-[TUDialRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("shouldSuppressInCallUI"), CFSTR("1"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)successNotificationQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest successNotification](self, "successNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest successNotification](self, "successNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("successNotification"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)failureNotificationQueryItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUDialRequest failureNotification](self, "failureNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[TUDialRequest failureNotification](self, "failureNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("failureNotification"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSUserActivity)userActivity
{
  return (NSUserActivity *)-[TUDialRequest userActivityUsingDeprecatedCallingIntents:](self, "userActivityUsingDeprecatedCallingIntents:", 0);
}

- (id)userActivityUsingDeprecatedCallingIntents:(BOOL)a3
{
  _BOOL4 v3;
  TUDialRequest *v4;
  void *v5;
  uint64_t v6;
  TUDialRequest *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  id obj;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v3 = a3;
  v4 = self;
  v75 = *MEMORY[0x1E0C80C00];
  if (!-[TUDialRequest isValid](self, "isValid"))
    return 0;
  -[TUDialRequest handles](v4, "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v67 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v7 = v4;
    -[TUDialRequest handles](v4, "handles");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v71;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v71 != v10)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v11), "personHandle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc((Class)CUTWeakLinkClass());
          -[TUDialRequest contactIdentifier](v7, "contactIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUDialRequest providerCustomIdentifier](v7, "providerCustomIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v13, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v12, 0, 0, 0, v14, v15);

          objc_msgSend(v69, "addObject:", v16);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v9);
    }

    v4 = v7;
    v3 = v67;
  }
  else
  {
    v69 = 0;
  }
  -[TUDialRequest provider](v4, "provider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isSystemProvider");

  if (v19)
  {
    v20 = -[TUDialRequest dialType](v4, "dialType");
    if (v20 < 3)
      v21 = v20 + 1;
    else
      v21 = 0;
    v22 = objc_msgSend((id)objc_opt_class(), "intentTTYTypeForTTYType:", -[TUDialRequest ttyType](v4, "ttyType"));
  }
  else
  {
    v22 = 0;
    v21 = 0;
  }
  v23 = 1;
  if (-[TUDialRequest isVideo](v4, "isVideo"))
    v24 = 2;
  else
    v24 = 1;
  -[TUDialRequest provider](v4, "provider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isTelephonyProvider");

  if ((v26 & 1) == 0)
  {
    -[TUDialRequest provider](v4, "provider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isFaceTimeProvider");

    if (v28)
      v23 = 2;
    else
      v23 = 0;
  }
  if (!-[NSString isEqualToString:](v4->_audioSourceIdentifier, "isEqualToString:", CFSTR("TUCallSourceIdentifierSpeakerRoute")))
  {
    if (-[NSString isEqualToString:](v4->_audioSourceIdentifier, "isEqualToString:", CFSTR("TUCallSourceIdentifierHeySiri"))&& (v30 = (uint64_t *)CUTWeakLinkSymbol()) != 0)
    {
      v29 = *v30;
      if (v3)
        goto LABEL_40;
    }
    else
    {
      v29 = 0;
      if (v3)
        goto LABEL_40;
    }
LABEL_32:
    v31 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:preferredCallProvider:contacts:ttyType:callCapability:", 0, 0, v29, v21, v23, v69, v22, v24);
    -[TUDialRequest provider](v4, "provider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_metadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setLaunchId:", v33);

    -[TUDialRequest endpointIDSDestinationURI](v4, "endpointIDSDestinationURI");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");

    if (v36)
    {
      -[TUDialRequest endpointIDSDestinationURI](v4, "endpointIDSDestinationURI");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_setOriginatingDeviceIdsIdentifier:", v37);

    }
    -[TUDialRequest endpointRapportMediaSystemIdentifier](v4, "endpointRapportMediaSystemIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "length");

    if (v39)
    {
      -[TUDialRequest endpointRapportMediaSystemIdentifier](v4, "endpointRapportMediaSystemIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_setOriginatingDeviceRapportMediaSystemIdentifier:", v40);

    }
    -[TUDialRequest endpointRapportEffectiveIdentifier](v4, "endpointRapportEffectiveIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "length");

    if (v42)
    {
      -[TUDialRequest endpointRapportEffectiveIdentifier](v4, "endpointRapportEffectiveIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_setOriginatingDeviceRapportEffectiveIdentifier:", v43);

    }
    v44 = CFSTR("INStartCallIntent");
    goto LABEL_43;
  }
  v29 = 1;
  if (!v3)
    goto LABEL_32;
LABEL_40:
  if (-[TUDialRequest isVideo](v4, "isVideo"))
  {
    v44 = CFSTR("INStartVideoCallIntent");
    v31 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithContacts:", v69);
    -[TUDialRequest provider](v4, "provider");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bundleIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_metadata");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setLaunchId:", v46);

  }
  else
  {
    v44 = CFSTR("INStartAudioCallIntent");
    v31 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithDestinationType:contacts:", v21, v69);
    -[TUDialRequest provider](v4, "provider");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bundleIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_metadata");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setLaunchId:", v49);

    objc_msgSend(v31, "setTTYType:", v22);
    objc_msgSend(v31, "setPreferredCallProvider:", v23);
  }
LABEL_43:
  v51 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithIntent:response:", v31, 0);
  objc_msgSend(v51, "setDirection:", 1);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", v44);
  objc_msgSend(v52, "_setInteraction:donate:", v51, 0);
  -[TUDialRequest provider](v4, "provider");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isSystemProvider");

  if (v54)
  {
    v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TUDialRequest isSOS](v4, "isSOS"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v56, CFSTR("sos"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TUDialRequest isRedial](v4, "isRedial"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v57, CFSTR("redial"));

    -[TUDialRequest provider](v4, "provider");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "identifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v59, CFSTR("providerIdentifier"));

    -[TUDialRequest localSenderIdentityUUID](v4, "localSenderIdentityUUID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v60, CFSTR("localSenderIdentityUUID"));

    -[TUDialRequest localSenderIdentityAccountUUID](v4, "localSenderIdentityAccountUUID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v61, CFSTR("localSenderIdentityAccountUUID"));

    -[TUDialRequest audioSourceIdentifier](v4, "audioSourceIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v62, CFSTR("TUCallSourceIdentifierKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TUDialRequest performDialAssist](v4, "performDialAssist"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v63, CFSTR("performDialAssist"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TUDialRequest performLocalDialAssist](v4, "performLocalDialAssist"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v64, CFSTR("performLocalDialAssist"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TUDialRequest isDialAssisted](v4, "isDialAssisted"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v65, CFSTR("dialAssisted"));

    objc_msgSend((id)objc_opt_class(), "stringForOriginatingUIType:", -[TUDialRequest originatingUIType](v4, "originatingUIType"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v66, CFSTR("originatingUI"));

    objc_msgSend(v52, "setUserInfo:", v55);
  }

  return v52;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[TUDialRequest validityErrors](self, "validityErrors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)_validityErrorsForRelay:(BOOL)a3
{
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest validityErrorForUnspecifiedProvider](self, "validityErrorForUnspecifiedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  -[TUDialRequest validityErrorForDestinationIDWithVoicemail](self, "validityErrorForDestinationIDWithVoicemail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "addObject:", v6);
  -[TUDialRequest validityErrorForNonNormalDialTypeWithoutTelephony](self, "validityErrorForNonNormalDialTypeWithoutTelephony");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "addObject:", v7);
  -[TUDialRequest validityErrorForEndpointNotOnCurrentDeviceForNonRelayableService](self, "validityErrorForEndpointNotOnCurrentDeviceForNonRelayableService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v4, "addObject:", v8);
  -[TUDialRequest validityErrorForEmergencyCall](self, "validityErrorForEmergencyCall");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v4, "addObject:", v9);
  -[TUDialRequest validityErrorForVideoUnsupported](self, "validityErrorForVideoUnsupported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v4, "addObject:", v10);
  -[TUDialRequest validityErrorForNormalDialTypeWithUnknownDestination](self, "validityErrorForNormalDialTypeWithUnknownDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v4, "addObject:", v11);
  -[TUDialRequest validityErrorForUnsupportedHandleType](self, "validityErrorForUnsupportedHandleType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v4, "addObject:", v12);
  -[TUDialRequest validityErrorForSOS](self, "validityErrorForSOS");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v4, "addObject:", v13);
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

- (NSArray)validityErrors
{
  void *v3;
  void *v4;

  -[TUDialRequest hostIDSIdentifier](self, "hostIDSIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest _validityErrorsForRelay:](self, "_validityErrorsForRelay:", v3 != 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)validityErrorForUnspecifiedProvider
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[TUDialRequest provider](self, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 0;
  v7 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No provider specified"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUDialRequestValidityErrorDomain"), 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)validityErrorForDestinationIDWithVoicemail
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[TUDialRequest handle](self, "handle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = -[TUDialRequest dialType](self, "dialType");

  if (v5 != 2)
    return 0;
  v12 = *MEMORY[0x1E0CB2D50];
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[TUDialRequest handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("handle is non-nil (%@) and dialType is Voicemail"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUDialRequestValidityErrorDomain"), 2, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)validityErrorForNonNormalDialTypeWithoutTelephony
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[TUDialRequest service](self, "service") == 1 || !-[TUDialRequest dialType](self, "dialType"))
    return 0;
  v7 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dialType (%lu) is not Normal but service (%d) is not Telephony"), -[TUDialRequest dialType](self, "dialType"), -[TUDialRequest service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUDialRequestValidityErrorDomain"), 3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)validityErrorForEndpointNotOnCurrentDeviceForNonRelayableService
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[TUDialRequest service](self, "service") != 3
    || -[TUDialRequest endpointOnCurrentDevice](self, "endpointOnCurrentDevice"))
  {
    return 0;
  }
  v7 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("service (%d) is not relayable but endpointOnCurrentDevice is set"), -[TUDialRequest service](self, "service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUDialRequestValidityErrorDomain"), 4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)validityErrorForEmergencyCall
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v8;
  uint64_t (**v9)(void *, void *, id);
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  id v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  -[TUDialRequest handle](self, "handle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = -[TUDialRequest dialType](self, "dialType");

  if (v5 != 1)
    return 0;
  if (-[TUDialRequest originatingUIType](self, "originatingUIType") == 2 || -[TUDialRequest isSOS](self, "isSOS"))
  {
    -[TUDialRequest isEmergencyNumberOrIsWhitelistedBlock](self, "isEmergencyNumberOrIsWhitelistedBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUDialRequest isEmergencyNumberBlock](self, "isEmergencyNumberBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;
  v9 = (uint64_t (**)(void *, void *, id))_Block_copy(v6);

  -[TUDialRequest localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    -[TUDialRequest provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "senderIdentityForAccountUUID:", v58);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[TUDialRequest handle](self, "handle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v77 = v13;
      v78 = 2112;
      v79 = v11;
      _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Checking whether %@ is an emergency number for sender identity %@", buf, 0x16u);

    }
    if (v11)
    {
      -[TUDialRequest handle](self, "handle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v9[2](v9, v15, v11);

      if ((v16 & 1) != 0)
        goto LABEL_30;
    }

  }
  -[TUDialRequest provider](self, "provider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "prioritizedSenderIdentities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "count");
  TUDefaultLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      -[TUDialRequest handle](self, "handle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v77 = v22;
      v78 = 2112;
      v79 = v18;
      _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "Checking whether %@ is an emergency number for any of the following sender identities %@", buf, 0x16u);

    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v23 = v18;
    v11 = (id)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    if (v11)
    {
      v24 = *(_QWORD *)v68;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v68 != v24)
            objc_enumerationMutation(v23);
          v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
          -[TUDialRequest handle](self, "handle");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "value");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v9[2](v9, v28, v26);

          if (v29)
          {
            v11 = v26;

            goto LABEL_30;
          }
        }
        v11 = (id)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
        if (v11)
          continue;
        break;
      }
    }

    v57 = 0;
    goto LABEL_33;
  }
  if (v21)
  {
    -[TUDialRequest provider](self, "provider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v77 = v30;
    _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "No sender identities found on provider %@", buf, 0xCu);

  }
  -[TUDialRequest handle](self, "handle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "value");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v9[2](v9, v32, 0);

  v11 = 0;
  if ((v33 & 1) != 0)
  {
LABEL_30:
    TUDefaultLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v11;
      _os_log_impl(&dword_19A50D000, v34, OS_LOG_TYPE_DEFAULT, "Emergency or whitelisted number detected; updating dial request with emergency sender identity %@",
        buf,
        0xCu);
    }

    objc_msgSend(v11, "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUDialRequest setLocalSenderIdentityUUID:](self, "setLocalSenderIdentityUUID:", v35);

    objc_msgSend(v11, "accountUUID");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[TUDialRequest setLocalSenderIdentityAccountUUID:](self, "setLocalSenderIdentityAccountUUID:", v23);
    v57 = 1;
LABEL_33:

    goto LABEL_34;
  }
  v57 = 0;
LABEL_34:
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[TUDialRequest provider](self, "provider");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "emergencyLabeledHandles");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v64;
LABEL_36:
    v41 = 0;
    while (1)
    {
      if (*(_QWORD *)v64 != v40)
        objc_enumerationMutation(v37);
      v42 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v41);
      -[TUDialRequest handle](self, "handle");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqualToHandle:", v44);

      if ((v45 & 1) != 0)
        goto LABEL_52;
      if (v39 == ++v41)
      {
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
        if (v39)
          goto LABEL_36;
        break;
      }
    }
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[TUDialRequest provider](self, "provider");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "emergencyHandles");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v60;
LABEL_44:
    v50 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v49)
        objc_enumerationMutation(v37);
      v51 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v50);
      -[TUDialRequest handle](self, "handle");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v51) = objc_msgSend(v52, "isEqualToHandle:", v51);

      if ((v51 & 1) != 0)
        break;
      if (v48 == ++v50)
      {
        v48 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
        if (v48)
          goto LABEL_44;
        goto LABEL_50;
      }
    }
LABEL_52:
    v53 = 0;
LABEL_53:

    goto LABEL_54;
  }
LABEL_50:

  if ((v57 & 1) == 0)
  {
    v71 = *MEMORY[0x1E0CB2D50];
    v54 = (void *)MEMORY[0x1E0CB3940];
    -[TUDialRequest handle](self, "handle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringWithFormat:", CFSTR("handle (%@) for emergency call dial request is not an emergency number (isEmergencyOrWhitelistedSOSNumber=%d isTelephonyApprovedEmergencyHandle=%d originatingUIType=%ld)"), v55, 0, 0, -[TUDialRequest originatingUIType](self, "originatingUIType"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v56;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUDialRequestValidityErrorDomain"), 5, v37);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  v53 = 0;
LABEL_54:

  return v53;
}

- (id)validityErrorForVideoUnsupported
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!-[TUDialRequest isVideo](self, "isVideo"))
    return 0;
  -[TUDialRequest provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAudioAndVideo");

  if ((v4 & 1) != 0)
    return 0;
  v9 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requested video for a provider which doesn't support it"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUDialRequestValidityErrorDomain"), 6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)validityErrorForNormalDialTypeWithUnknownDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[TUDialRequest handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    goto LABEL_4;
  -[TUDialRequest contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {

LABEL_4:
    goto LABEL_5;
  }
  v8 = -[TUDialRequest dialType](self, "dialType");

  if (!v8)
  {
    v11 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("destinationID and contactIdentifier are both nil/empty and dialType is Normal"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUDialRequestValidityErrorDomain"), 7, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
LABEL_5:
  v6 = 0;
  return v6;
}

- (id)validityErrorForUnsupportedHandleType
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[TUDialRequest handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TUDialRequest provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUDialRequest handle](self, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "supportsHandleType:", objc_msgSend(v5, "type"));

    if ((v6 & 1) != 0)
      return 0;
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provider does not support the specified handle type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUDialRequestValidityErrorDomain"), 8, v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)validityErrorForSOS
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[TUDialRequest dialType](self, "dialType") == 1 || !-[TUDialRequest isSOS](self, "isSOS"))
    return 0;
  v7 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requested SOS for non emergency dialType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TUDialRequestValidityErrorDomain"), 9, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dialRequestByReplacingProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[TUDialRequest copy](self, "copy");
  objc_msgSend(v5, "setProvider:", v4);

  return v5;
}

- (id)_contactFromINPerson:(id)a3 contactsDataSource:(id)a4 bestGuessHandle:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  TUHandle *v38;
  id v39;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  TUHandle *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  int v55;
  NSObject *v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  *a5 = 0;
  objc_msgSend(v7, "contactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v7, "contactIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateForContactsWithIdentifiers:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v15 = (void *)v14;
LABEL_4:

    goto LABEL_5;
  }
  objc_msgSend(v7, "personHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (!v25)
  {
    objc_msgSend(v7, "displayName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");

    if (!v32)
      goto LABEL_22;
    v33 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v7, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "predicateForContactsMatchingName:", v12);
    v34 = objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  objc_msgSend(v7, "personHandle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "personHandle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "type");

  if (v28)
  {
    if (v28 != 1)
    {
      if (v28 == 2)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v12);
        if (!v13)
        {
          TUDefaultLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v60 = (uint64_t)v12;
            v30 = "[WARN] Could not create CNPhoneNumber from personHandle.value with phone number type: %@";
LABEL_54:
            _os_log_impl(&dword_19A50D000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
            goto LABEL_55;
          }
          goto LABEL_55;
        }
        goto LABEL_43;
      }
      goto LABEL_51;
    }
    goto LABEL_46;
  }
  TUDefaultLog();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = (uint64_t)v7;
    _os_log_impl(&dword_19A50D000, v52, OS_LOG_TYPE_DEFAULT, "[WARN] INPersonHandle has no type, attempting to infer from value %@", buf, 0xCu);
  }

  if (objc_msgSend(v12, "_appearsToBePhoneNumber"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v12);
    if (!v13)
    {
      TUDefaultLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = (uint64_t)v12;
        v30 = "[WARN] Could not create CNPhoneNumber from personHandle.value with unknown type: %@";
        goto LABEL_54;
      }
LABEL_55:

      v15 = 0;
      goto LABEL_4;
    }
LABEL_43:
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(v7, "personHandle");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "value");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "_appearsToBeEmail");

  if (v55)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v12);
    v34 = objc_claimAutoreleasedReturnValue();
LABEL_47:
    v15 = (void *)v34;
    goto LABEL_5;
  }
  TUDefaultLog();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "personHandle");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = (uint64_t)v57;
    _os_log_impl(&dword_19A50D000, v56, OS_LOG_TYPE_DEFAULT, "[WARN] Could not infer INPersonHandleType for person %@", buf, 0xCu);

  }
LABEL_51:
  v15 = 0;
LABEL_5:

  if (v15)
  {
    v16 = *MEMORY[0x1E0C967C0];
    v63[0] = *MEMORY[0x1E0C966A8];
    v63[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v17 = objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(v8, "unifiedContactsMatchingPredicate:keysToFetch:error:", v15, v17, &v58);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v58;
    if (v18)
    {
      objc_msgSend(v18, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      TUDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 134218242;
        v60 = v22;
        v61 = 2112;
        v62 = v20;
        _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "Found %ld contacts matching INPerson, using %@", buf, 0x16u);
      }
    }
    else
    {
      TUDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v60 = (uint64_t)v7;
        v61 = 2112;
        v62 = v19;
        _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Error obtaining contact from INPerson %@: %@", buf, 0x16u);
      }
      v20 = 0;
    }

    goto LABEL_25;
  }
LABEL_22:
  TUDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = (uint64_t)v7;
    _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Could not create contact search predicate for INPerson: %@", buf, 0xCu);
  }
  v15 = 0;
  v19 = 0;
  v20 = 0;
LABEL_25:

  objc_msgSend(v7, "personHandle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "value");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length");

  if (!v37)
  {
    objc_msgSend(v20, "phoneNumbers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (v42)
    {
      objc_msgSend(v20, "phoneNumbers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "value");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringValue");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = 2;
    }
    else
    {
      objc_msgSend(v20, "emailAddresses");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "count");

      if (!v49)
      {
        v46 = 0;
        v47 = 1;
LABEL_34:
        if (objc_msgSend(v46, "length"))
        {
          v50 = [TUHandle alloc];
          objc_msgSend(v7, "displayName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[TUHandle initWithType:value:siriDisplayName:](v50, "initWithType:value:siriDisplayName:", v47, v46, v51);

        }
        else
        {
          v38 = 0;
        }

        if (v38)
          goto LABEL_27;
        goto LABEL_28;
      }
      objc_msgSend(v20, "emailAddresses");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "value");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 3;
    }

    goto LABEL_34;
  }
  +[TUHandle handleWithPerson:](TUHandle, "handleWithPerson:", v7);
  v38 = (TUHandle *)objc_claimAutoreleasedReturnValue();
  if (v38)
LABEL_27:
    *a5 = objc_retainAutorelease(v38);
LABEL_28:
  v39 = v20;

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TUDialRequest isEqualToDialRequest:](self, "isEqualToDialRequest:", v4);

  return v5;
}

- (BOOL)isEqualToDialRequest:(id)a3
{
  id v4;
  int v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  BOOL v19;
  char v20;
  int v21;
  int v22;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  int v37;
  int v38;
  int64_t v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v4 = a3;
  v5 = -[TUDialRequest service](self, "service");
  if (v5 == objc_msgSend(v4, "service"))
  {
    v6 = -[TUDialRequest dialType](self, "dialType");
    if (v6 == objc_msgSend(v4, "dialType"))
    {
      -[TUDialRequest handle](self, "handle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
      {
        v20 = 0;
LABEL_34:

        goto LABEL_35;
      }
      -[TUDialRequest contactIdentifier](self, "contactIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contactIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!TUStringsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        v20 = 0;
LABEL_33:

        goto LABEL_34;
      }
      -[TUDialRequest providerCustomIdentifier](self, "providerCustomIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "providerCustomIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!TUStringsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
      {
        v20 = 0;
LABEL_32:

        goto LABEL_33;
      }
      -[TUDialRequest localSenderIdentityUUID](self, "localSenderIdentityUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localSenderIdentityUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!TUObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v14))
      {
        v20 = 0;
LABEL_31:

        goto LABEL_32;
      }
      v48 = v13;
      -[TUDialRequest localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localSenderIdentityAccountUUID");
      v47 = (void *)v15;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!TUObjectsAreEqualOrNil(v15, (uint64_t)v46))
      {
        v20 = 0;
        v13 = v48;
LABEL_30:

        goto LABEL_31;
      }
      -[TUDialRequest audioSourceIdentifier](self, "audioSourceIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "audioSourceIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)v16;
      if (!TUStringsAreEqualOrNil(v16, (uint64_t)v44))
      {
        v20 = 0;
        v13 = v48;
LABEL_29:

        goto LABEL_30;
      }
      -[TUDialRequest contactIdentifier](self, "contactIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contactIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)v17;
      if (!TUStringsAreEqualOrNil(v17, (uint64_t)v42))
        goto LABEL_26;
      v18 = -[TUDialRequest performDialAssist](self, "performDialAssist");
      v19 = v18 == objc_msgSend(v4, "performDialAssist");
      v13 = v48;
      if (!v19
        || (v37 = -[TUDialRequest performLocalDialAssist](self, "performLocalDialAssist"),
            v37 != objc_msgSend(v4, "performLocalDialAssist"))
        || (v38 = -[TUDialRequest isDialAssisted](self, "isDialAssisted"),
            v38 != objc_msgSend(v4, "isDialAssisted"))
        || (v39 = -[TUDialRequest ttyType](self, "ttyType"), v39 != objc_msgSend(v4, "ttyType"))
        || (v40 = -[TUDialRequest showUIPrompt](self, "showUIPrompt"),
            v40 != objc_msgSend(v4, "showUIPrompt")))
      {
        v20 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v21 = -[TUDialRequest isVideo](self, "isVideo");
      if (v21 == objc_msgSend(v4, "isVideo")
        && (v22 = -[TUDialRequest isSOS](self, "isSOS"), v22 == objc_msgSend(v4, "isSOS")))
      {
        -[TUDialRequest uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uniqueProxyIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUStringsAreEqualOrNil((unint64_t)v24, (uint64_t)v41)
          && (v33 = -[TUDialRequest hostOnCurrentDevice](self, "hostOnCurrentDevice"),
              v33 == objc_msgSend(v4, "hostOnCurrentDevice"))
          && (v34 = -[TUDialRequest originatingUIType](self, "originatingUIType"),
              v34 == objc_msgSend(v4, "originatingUIType"))
          && (v35 = -[TUDialRequest endpointOnCurrentDevice](self, "endpointOnCurrentDevice"),
              v35 == objc_msgSend(v4, "endpointOnCurrentDevice")))
        {
          -[TUDialRequest endpointIDSDestinationURI](self, "endpointIDSDestinationURI");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "endpointIDSDestinationURI");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (TUStringsAreEqualOrNil((unint64_t)v36, (uint64_t)v32))
          {
            -[TUDialRequest endpointRapportMediaSystemIdentifier](self, "endpointRapportMediaSystemIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "endpointRapportMediaSystemIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (TUStringsAreEqualOrNil((unint64_t)v31, (uint64_t)v30))
            {
              -[TUDialRequest endpointRapportEffectiveIdentifier](self, "endpointRapportEffectiveIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "endpointRapportEffectiveIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (TUStringsAreEqualOrNil((unint64_t)v29, (uint64_t)v28)
                && (v26 = -[TUDialRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"),
                    v26 == objc_msgSend(v4, "shouldSuppressInCallUI")))
              {
                -[TUDialRequest hostIDSIdentifier](self, "hostIDSIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "hostIDSIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = TUStringsAreEqualOrNil((unint64_t)v27, (uint64_t)v25);

              }
              else
              {
                v20 = 0;
              }

            }
            else
            {
              v20 = 0;
            }

          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
LABEL_26:
        v20 = 0;
      }
      v13 = v48;
      goto LABEL_28;
    }
  }
  v20 = 0;
LABEL_35:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;

  v3 = -[TUDialRequest service](self, "service");
  v4 = -[TUDialRequest dialType](self, "dialType") - v3 + 32 * v3;
  -[TUDialRequest handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[TUDialRequest contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[TUDialRequest providerCustomIdentifier](self, "providerCustomIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  -[TUDialRequest localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v10 + 32 * v10;

  -[TUDialRequest localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash") - v12 + 32 * v12;

  -[TUDialRequest audioSourceIdentifier](self, "audioSourceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash") - v14 + 32 * v14;

  if (-[TUDialRequest performDialAssist](self, "performDialAssist"))
    v17 = 1231;
  else
    v17 = 1237;
  v18 = v17 - v16 + 32 * v16;
  if (-[TUDialRequest performLocalDialAssist](self, "performLocalDialAssist"))
    v19 = 1231;
  else
    v19 = 1237;
  v20 = v19 - v18 + 32 * v18;
  if (-[TUDialRequest isDialAssisted](self, "isDialAssisted"))
    v21 = 1231;
  else
    v21 = 1237;
  v22 = -[TUDialRequest ttyType](self, "ttyType") - (v21 - v20 + 32 * v20) + 32 * (v21 - v20 + 32 * v20);
  if (-[TUDialRequest showUIPrompt](self, "showUIPrompt"))
    v23 = 1231;
  else
    v23 = 1237;
  v24 = v23 - v22 + 32 * v22;
  if (-[TUDialRequest isVideo](self, "isVideo"))
    v25 = 1231;
  else
    v25 = 1237;
  v26 = v25 - v24 + 32 * v24;
  -[TUDialRequest uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hash") - v26 + 32 * v26;

  if (-[TUDialRequest hostOnCurrentDevice](self, "hostOnCurrentDevice"))
    v29 = 1231;
  else
    v29 = 1237;
  v30 = 31 * (v29 - v28 + 32 * v28) + -[TUDialRequest originatingUIType](self, "originatingUIType");
  if (-[TUDialRequest isSOS](self, "isSOS"))
    v31 = 1231;
  else
    v31 = 1237;
  v32 = v31 - v30 + 32 * v30;
  if (-[TUDialRequest isRedial](self, "isRedial"))
    v33 = 1231;
  else
    v33 = 1237;
  v34 = v33 - v32 + 32 * v32;
  if (-[TUDialRequest endpointOnCurrentDevice](self, "endpointOnCurrentDevice"))
    v35 = 1231;
  else
    v35 = 1237;
  v36 = v35 - v34 + 32 * v34;
  -[TUDialRequest endpointIDSDestinationURI](self, "endpointIDSDestinationURI");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "hash") - v36 + 32 * v36;

  -[TUDialRequest endpointRapportMediaSystemIdentifier](self, "endpointRapportMediaSystemIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "hash") - v38 + 32 * v38;

  -[TUDialRequest endpointRapportEffectiveIdentifier](self, "endpointRapportEffectiveIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "hash") - v40 + 32 * v40;

  if (-[TUDialRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"))
    v43 = 1231;
  else
    v43 = 1237;
  return v43 - v42 + 32 * v42 - 0x46BECE987BCFB2FFLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUDialRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  TUDialRequest *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *handles;
  void *v13;
  uint64_t v14;
  NSString *audioSourceIdentifier;
  void *v16;
  uint64_t v17;
  NSString *contactIdentifier;
  void *v19;
  uint64_t v20;
  NSString *providerCustomIdentifier;
  void *v22;
  uint64_t v23;
  NSUUID *localSenderIdentityUUID;
  void *v25;
  uint64_t v26;
  NSUUID *localSenderIdentityAccountUUID;
  uint64_t v28;
  NSString *uniqueProxyIdentifier;
  uint64_t v30;
  NSString *endpointIDSDestinationURI;
  uint64_t v32;
  NSString *endpointRapportMediaSystemIdentifier;
  uint64_t v34;
  NSString *endpointRapportEffectiveIdentifier;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSDate *dateDialed;
  uint64_t v44;
  BSProcessHandle *processHandle;
  uint64_t v46;
  NSString *hostIDSIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUDialRequest initWithProvider:](self, "initWithProvider:", v5);

  if (v6)
  {
    v6->_dialType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dialType"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    NSStringFromSelector(sel_handles);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    handles = v6->_handles;
    v6->_handles = (NSSet *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioSourceIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    audioSourceIdentifier = v6->_audioSourceIdentifier;
    v6->_audioSourceIdentifier = (NSString *)v14;

    v6->_video = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("video"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    contactIdentifier = v6->_contactIdentifier;
    v6->_contactIdentifier = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerCustomIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    providerCustomIdentifier = v6->_providerCustomIdentifier;
    v6->_providerCustomIdentifier = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localSenderIdentityUUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    localSenderIdentityUUID = v6->_localSenderIdentityUUID;
    v6->_localSenderIdentityUUID = (NSUUID *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localSenderIdentityAccountUUID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    localSenderIdentityAccountUUID = v6->_localSenderIdentityAccountUUID;
    v6->_localSenderIdentityAccountUUID = (NSUUID *)v26;

    v6->_performDialAssist = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performDialAssist"));
    v6->_performLocalDialAssist = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performLocalDialAssist"));
    v6->_dialAssisted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dialAssisted"));
    v6->_ttyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ttyType"));
    v6->_showUIPrompt = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showUIPrompt"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueProxyIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    uniqueProxyIdentifier = v6->_uniqueProxyIdentifier;
    v6->_uniqueProxyIdentifier = (NSString *)v28;

    v6->_hostOnCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hostOnCurrentDevice"));
    v6->_originatingUIType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("originatingUIType"));
    v6->_sos = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sos"));
    v6->_redial = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("redial"));
    v6->_endpointOnCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("endpointOnCurrentDevice"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpointIDSDestinationURI"));
    v30 = objc_claimAutoreleasedReturnValue();
    endpointIDSDestinationURI = v6->_endpointIDSDestinationURI;
    v6->_endpointIDSDestinationURI = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpointRapportMediaSystemIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    endpointRapportMediaSystemIdentifier = v6->_endpointRapportMediaSystemIdentifier;
    v6->_endpointRapportMediaSystemIdentifier = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpointRapportEffectiveIdentifier"));
    v34 = objc_claimAutoreleasedReturnValue();
    endpointRapportEffectiveIdentifier = v6->_endpointRapportEffectiveIdentifier;
    v6->_endpointRapportEffectiveIdentifier = (NSString *)v34;

    v6->_shouldSuppressInCallUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSuppressInCallUI"));
    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("localLandscapeAspectRatio"));
    v6->_localLandscapeAspectRatio.width = v36;
    v6->_localLandscapeAspectRatio.height = v37;
    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("localPortraitAspectRatio"));
    v6->_localPortraitAspectRatio.width = v38;
    v6->_localPortraitAspectRatio.height = v39;
    v40 = objc_opt_class();
    NSStringFromSelector(sel_dateDialed);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v40, v41);
    v42 = objc_claimAutoreleasedReturnValue();
    dateDialed = v6->_dateDialed;
    v6->_dateDialed = (NSDate *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processHandle"));
    v44 = objc_claimAutoreleasedReturnValue();
    processHandle = v6->_processHandle;
    v6->_processHandle = (BSProcessHandle *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostIDSIdentifier"));
    v46 = objc_claimAutoreleasedReturnValue();
    hostIDSIdentifier = v6->_hostIDSIdentifier;
    v6->_hostIDSIdentifier = (NSString *)v46;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  TUCallProvider *provider;
  void *v5;
  void *v6;
  NSDate *dateDialed;
  void *v8;
  id v9;

  provider = self->_provider;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", provider, CFSTR("provider"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_dialType, CFSTR("dialType"));
  -[NSSet allObjects](self->_handles, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handles);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, v6);

  objc_msgSend(v9, "encodeObject:forKey:", self->_audioSourceIdentifier, CFSTR("audioSourceIdentifier"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_video, CFSTR("video"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_providerCustomIdentifier, CFSTR("providerCustomIdentifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_localSenderIdentityUUID, CFSTR("localSenderIdentityUUID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_localSenderIdentityAccountUUID, CFSTR("localSenderIdentityAccountUUID"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_performDialAssist, CFSTR("performDialAssist"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_performLocalDialAssist, CFSTR("performLocalDialAssist"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_dialAssisted, CFSTR("dialAssisted"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_ttyType, CFSTR("ttyType"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_showUIPrompt, CFSTR("showUIPrompt"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_uniqueProxyIdentifier, CFSTR("uniqueProxyIdentifier"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_hostOnCurrentDevice, CFSTR("hostOnCurrentDevice"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_originatingUIType, CFSTR("originatingUIType"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_sos, CFSTR("sos"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_redial, CFSTR("redial"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_endpointOnCurrentDevice, CFSTR("endpointOnCurrentDevice"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_endpointIDSDestinationURI, CFSTR("endpointIDSDestinationURI"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_endpointRapportMediaSystemIdentifier, CFSTR("endpointRapportMediaSystemIdentifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_endpointRapportEffectiveIdentifier, CFSTR("endpointRapportEffectiveIdentifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_hostIDSIdentifier, CFSTR("hostIDSIdentifier"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_shouldSuppressInCallUI, CFSTR("shouldSuppressInCallUI"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_successNotification, CFSTR("successNotification"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_failureNotification, CFSTR("failureNotification"));
  objc_msgSend(v9, "encodeSize:forKey:", CFSTR("localLandscapeAspectRatio"), self->_localLandscapeAspectRatio.width, self->_localLandscapeAspectRatio.height);
  objc_msgSend(v9, "encodeSize:forKey:", CFSTR("localPortraitAspectRatio"), self->_localPortraitAspectRatio.width, self->_localPortraitAspectRatio.height);
  dateDialed = self->_dateDialed;
  NSStringFromSelector(sel_dateDialed);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", dateDialed, v8);

  objc_msgSend(v9, "encodeObject:forKey:", self->_processHandle, CFSTR("processHandle"));
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUDialRequest provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithProvider:", v6);

  if (v7)
  {
    objc_msgSend(v7, "setDialType:", -[TUDialRequest dialType](self, "dialType"));
    -[TUDialRequest handles](self, "handles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
    objc_msgSend(v7, "setHandles:", v9);

    -[TUDialRequest contactIdentifier](self, "contactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
    objc_msgSend(v7, "setContactIdentifier:", v11);

    -[TUDialRequest providerCustomIdentifier](self, "providerCustomIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
    objc_msgSend(v7, "setProviderCustomIdentifier:", v13);

    -[TUDialRequest localSenderIdentityUUID](self, "localSenderIdentityUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
    objc_msgSend(v7, "setLocalSenderIdentityUUID:", v15);

    -[TUDialRequest localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
    objc_msgSend(v7, "setLocalSenderIdentityAccountUUID:", v17);

    -[TUDialRequest audioSourceIdentifier](self, "audioSourceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
    objc_msgSend(v7, "setAudioSourceIdentifier:", v19);

    objc_msgSend(v7, "setVideo:", -[TUDialRequest isVideo](self, "isVideo"));
    objc_msgSend(v7, "setPerformDialAssist:", -[TUDialRequest performDialAssist](self, "performDialAssist"));
    objc_msgSend(v7, "setPerformLocalDialAssist:", -[TUDialRequest performLocalDialAssist](self, "performLocalDialAssist"));
    objc_msgSend(v7, "setDialAssisted:", -[TUDialRequest isDialAssisted](self, "isDialAssisted"));
    objc_msgSend(v7, "setTtyType:", -[TUDialRequest ttyType](self, "ttyType"));
    objc_msgSend(v7, "setShowUIPrompt:", -[TUDialRequest showUIPrompt](self, "showUIPrompt"));
    -[TUDialRequest uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
    objc_msgSend(v7, "setUniqueProxyIdentifier:", v21);

    objc_msgSend(v7, "setHostOnCurrentDevice:", -[TUDialRequest hostOnCurrentDevice](self, "hostOnCurrentDevice"));
    objc_msgSend(v7, "setOriginatingUIType:", -[TUDialRequest originatingUIType](self, "originatingUIType"));
    objc_msgSend(v7, "setSOS:", -[TUDialRequest isSOS](self, "isSOS"));
    objc_msgSend(v7, "setRedial:", -[TUDialRequest isRedial](self, "isRedial"));
    objc_msgSend(v7, "setEndpointOnCurrentDevice:", -[TUDialRequest endpointOnCurrentDevice](self, "endpointOnCurrentDevice"));
    -[TUDialRequest endpointIDSDestinationURI](self, "endpointIDSDestinationURI");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
    objc_msgSend(v7, "setEndpointIDSDestinationURI:", v23);

    -[TUDialRequest endpointRapportMediaSystemIdentifier](self, "endpointRapportMediaSystemIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
    objc_msgSend(v7, "setEndpointRapportMediaSystemIdentifier:", v25);

    -[TUDialRequest endpointRapportEffectiveIdentifier](self, "endpointRapportEffectiveIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
    objc_msgSend(v7, "setEndpointRapportEffectiveIdentifier:", v27);

    -[TUDialRequest hostIDSIdentifier](self, "hostIDSIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copyWithZone:", a3);
    objc_msgSend(v7, "setHostIDSIdentifier:", v29);

    objc_msgSend(v7, "setShouldSuppressInCallUI:", -[TUDialRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
    -[TUDialRequest successNotification](self, "successNotification");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSuccessNotification:", v30);

    -[TUDialRequest failureNotification](self, "failureNotification");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFailureNotification:", v31);

    -[TUDialRequest dateDialed](self, "dateDialed");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateDialed:", v32);

    -[TUDialRequest processHandle](self, "processHandle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProcessHandle:", v33);

  }
  return v7;
}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CGSize)localPortraitAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localPortraitAspectRatio.width;
  height = self->_localPortraitAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (CGSize)localLandscapeAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localLandscapeAspectRatio.width;
  height = self->_localLandscapeAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (void)setContactGeminiManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactGeminiManager, a3);
}

- (TUCallProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (int64_t)dialType
{
  return self->_dialType;
}

- (void)setDialType:(int64_t)a3
{
  self->_dialType = a3;
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)providerCustomIdentifier
{
  return self->_providerCustomIdentifier;
}

- (void)setProviderCustomIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (NSString)audioSourceIdentifier
{
  return self->_audioSourceIdentifier;
}

- (void)setAudioSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)performDialAssist
{
  return self->_performDialAssist;
}

- (void)setPerformDialAssist:(BOOL)a3
{
  self->_performDialAssist = a3;
}

- (BOOL)performLocalDialAssist
{
  return self->_performLocalDialAssist;
}

- (void)setPerformLocalDialAssist:(BOOL)a3
{
  self->_performLocalDialAssist = a3;
}

- (BOOL)isDialAssisted
{
  return self->_dialAssisted;
}

- (void)setDialAssisted:(BOOL)a3
{
  self->_dialAssisted = a3;
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int64_t)a3
{
  self->_ttyType = a3;
}

- (BOOL)showUIPrompt
{
  return self->_showUIPrompt;
}

- (void)setShowUIPrompt:(BOOL)a3
{
  self->_showUIPrompt = a3;
}

- (TUCallProviderManager)providerManager
{
  return self->_providerManager;
}

- (void)setIsEmergencyNumberBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setIsEmergencyNumberOrIsWhitelistedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)dateDialed
{
  return self->_dateDialed;
}

- (void)setDateDialed:(id)a3
{
  objc_storeStrong((id *)&self->_dateDialed, a3);
}

- (BOOL)hostOnCurrentDevice
{
  return self->_hostOnCurrentDevice;
}

- (void)setHostOnCurrentDevice:(BOOL)a3
{
  self->_hostOnCurrentDevice = a3;
}

- (BOOL)endpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
}

- (NSString)endpointIDSDestinationURI
{
  return self->_endpointIDSDestinationURI;
}

- (void)setEndpointIDSDestinationURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)endpointRapportMediaSystemIdentifier
{
  return self->_endpointRapportMediaSystemIdentifier;
}

- (void)setEndpointRapportMediaSystemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)endpointRapportEffectiveIdentifier
{
  return self->_endpointRapportEffectiveIdentifier;
}

- (void)setEndpointRapportEffectiveIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)hostIDSIdentifier
{
  return self->_hostIDSIdentifier;
}

- (void)setHostIDSIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (BOOL)isSOS
{
  return self->_sos;
}

- (void)setSOS:(BOOL)a3
{
  self->_sos = a3;
}

- (BOOL)isRedial
{
  return self->_redial;
}

- (void)setRedial:(BOOL)a3
{
  self->_redial = a3;
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (NSString)successNotification
{
  return self->_successNotification;
}

- (void)setSuccessNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)failureNotification
{
  return self->_failureNotification;
}

- (void)setFailureNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
  objc_storeStrong((id *)&self->_processHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_failureNotification, 0);
  objc_storeStrong((id *)&self->_successNotification, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityAccountUUID, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_hostIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointRapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointRapportMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIDSDestinationURI, 0);
  objc_storeStrong((id *)&self->_dateDialed, 0);
  objc_storeStrong(&self->_isEmergencyNumberOrIsWhitelistedBlock, 0);
  objc_storeStrong(&self->_isEmergencyNumberBlock, 0);
  objc_storeStrong((id *)&self->_providerManager, 0);
  objc_storeStrong((id *)&self->_audioSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_providerCustomIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_contactGeminiManager, 0);
  objc_storeStrong((id *)&self->_senderIdentityClient, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
}

- (void)initWithDialIntent:(uint64_t)a1 providerManager:(NSObject *)a2 contactsDataSource:senderIdentityClient:isEmergencyServicesOverrideEnabled:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "Could not find sender identity for contact %@", (uint8_t *)&v2, 0xCu);
}

+ (void)providerForIntentPreferredCallProvider:(void *)a1 recentCallProviderId:(NSObject *)a2 callCapability:providerManager:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_19A50D000, a2, OS_LOG_TYPE_DEBUG, "Using third-party provider: %@", (uint8_t *)&v4, 0xCu);

}

@end
