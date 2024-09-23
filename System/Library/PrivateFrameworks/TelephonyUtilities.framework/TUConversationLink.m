@implementation TUConversationLink

+ (id)baseURLStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("facetime.apple.com/join");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_TUIsInternalInstall())
  {
    objc_msgSend(a1, "userConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationLinkBaseURLString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1, "userConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "conversationLinkBaseURLString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v3);
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v9;
    }
  }
  return v3;
}

+ (TUUserConfiguration)userConfiguration
{
  if (userConfiguration_onceToken != -1)
    dispatch_once(&userConfiguration_onceToken, &__block_literal_global_29);
  return (TUUserConfiguration *)(id)userConfiguration_sUserConfiguration;
}

void __39__TUConversationLink_userConfiguration__block_invoke()
{
  TUUserConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(TUUserConfiguration);
  v1 = (void *)userConfiguration_sUserConfiguration;
  userConfiguration_sUserConfiguration = (uint64_t)v0;

}

+ (id)featureFlags
{
  if (featureFlags_onceToken != -1)
    dispatch_once(&featureFlags_onceToken, &__block_literal_global_40_0);
  return (id)featureFlags_flags;
}

void __34__TUConversationLink_featureFlags__block_invoke()
{
  TUFeatureFlags *v0;
  void *v1;

  v0 = objc_alloc_init(TUFeatureFlags);
  v1 = (void *)featureFlags_flags;
  featureFlags_flags = (uint64_t)v0;

}

- (NSString)linkName
{
  void *v3;
  int v4;
  NSString *v5;

  +[TUConversationLink featureFlags](TUConversationLink, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "linkNamesEnabled");

  if (v4)
    v5 = self->_linkName;
  else
    v5 = 0;
  return v5;
}

- (NSString)displayName
{
  id v3;
  void *v4;

  -[TUConversationLink linkName](self, "linkName");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUConversationLink generateDisplayName](self, "generateDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v3 = v4;
    else
      v3 = 0;

  }
  return (NSString *)v3;
}

- (id)generateDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  if (-[TUConversationLink isLocallyCreated](self, "isLocallyCreated")
    && (-[TUConversationLink linkName](self, "linkName"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[TUConversationLink linkName](self, "linkName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUConversationLink fetchedResults](self, "fetchedResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TUConversationLink allInvitedMembersInContactsChecking:](self, "allInvitedMembersInContactsChecking:", v5))
    {
      -[TUConversationLink linkName](self, "linkName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)fetchedResults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  TUContactsDataProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (*v15)(void);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  char v31;
  TUContactsDataProviderFetchRequest *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C972A0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("com.apple.facetime");
  objc_msgSend(v3, "tu_contactStoreConfigurationForBundleIdentifier:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v8);
  v10 = -[TUContactsDataProvider initWithContactsDataSource:]([TUContactsDataProvider alloc], "initWithContactsDataSource:", v9);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v9;
  v37 = (void *)v8;
  if (fetchedResults__pred_IMPreferredAccountForServiceIMCore != -1)
    dispatch_once(&fetchedResults__pred_IMPreferredAccountForServiceIMCore, &__block_literal_global_48_2);
  v12 = (void *)CUTWeakLinkClass();
  v13 = (void *)CUTWeakLinkClass();
  if (v13)
  {
    objc_msgSend(v13, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "blockUntilConnected");

  }
  v15 = (void (*)(void))fetchedResults__IMPreferredAccountForService;
  objc_msgSend(v12, "facetimeService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E60];
  if (v17)
  {
    objc_msgSend(v17, "aliases");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)objc_opt_new();
  }
  -[TUConversationLink invitedMemberHandles](self, "invitedMemberHandles", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  -[TUConversationLink originatorHandle](self, "originatorHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v23);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v29, "value");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v20, "containsObject:", v30);

        if ((v31 & 1) == 0)
        {
          v32 = -[TUContactsDataProviderFetchRequest initWithHandle:]([TUContactsDataProviderFetchRequest alloc], "initWithHandle:", v29);
          objc_msgSend(v11, "addObject:", v32);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v26);
  }

  -[TUContactsDataProvider executeBatchFetchRequests:](v10, "executeBatchFetchRequests:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

void *__36__TUConversationLink_fetchedResults__block_invoke()
{
  void *result;

  result = (void *)CUTWeakLinkSymbol();
  fetchedResults__IMPreferredAccountForService = result;
  return result;
}

- (BOOL)allInvitedMembersInContactsChecking:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__TUConversationLink_allInvitedMembersInContactsChecking___block_invoke;
  v6[3] = &unk_1E38A2E70;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__TUConversationLink_allInvitedMembersInContactsChecking___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)canCreateConversations
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[TUConversationLink isLocallyCreated](self, "isLocallyCreated"))
    return 1;
  -[TUConversationLink groupUUID](self, "groupUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUConversationLink originatorHandle](self, "originatorHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[TUConversationLink invitedMemberHandles](self, "invitedMemberHandles");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v6 != 0;

    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (TUConversationLink)initWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  TUConversationLink *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "pseudonym");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publicKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deletionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invitedHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") != 0;
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "linkLifetimeScope");
  v12 = objc_msgSend(v4, "deleteReason");

  LOBYTE(v14) = v9;
  v15 = -[TUConversationLink initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMemberHandles:locallyCreated:linkName:linkLifetimeScope:deleteReason:](self, "initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMemberHandles:locallyCreated:linkName:linkLifetimeScope:deleteReason:", v20, v19, v18, v17, v16, v5, v6, v7, v14, v10, v11, v12);

  return v15;
}

- (TUConversationLink)initWithPseudonym:(id)a3 publicKey:(id)a4 groupUUID:(id)a5 originatorHandle:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[TUConversationLink initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMemberHandles:locallyCreated:linkName:linkLifetimeScope:deleteReason:](self, "initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMemberHandles:locallyCreated:linkName:linkLifetimeScope:deleteReason:", a3, a4, a5, a6, 0, 0, 0, 0, v7, 0, 0, 0);
}

- (TUConversationLink)initWithPseudonym:(id)a3 publicKey:(id)a4 groupUUID:(id)a5 originatorHandle:(id)a6 creationDate:(id)a7 deletionDate:(id)a8 expirationDate:(id)a9 invitedMemberHandles:(id)a10 locallyCreated:(BOOL)a11 linkName:(id)a12 linkLifetimeScope:(int64_t)a13 deleteReason:(int64_t)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  TUConversationLink *v27;
  uint64_t v28;
  NSString *pseudonym;
  uint64_t v30;
  NSData *publicKey;
  uint64_t v32;
  NSDate *creationDate;
  uint64_t v34;
  NSDate *deletionDate;
  uint64_t v36;
  NSDate *expirationDate;
  uint64_t v38;
  NSSet *invitedMemberHandles;
  uint64_t v40;
  NSString *linkName;
  void *v43;
  void *v44;
  id v46;
  id v47;
  objc_super v48;

  v20 = a3;
  v21 = a4;
  v47 = a5;
  v46 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a12;
  if (v20 && (objc_msgSend(v20, "destinationIdIsPseudonym") & 1) != 0)
  {
    if (v21)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUConversationLink.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pseudonym != nil && pseudonym.destinationIdIsPseudonym"));

    if (v21)
    {
LABEL_4:
      if (objc_msgSend(v21, "length"))
        goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUConversationLink.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("publicKey != nil && publicKey.length >= 1"));

LABEL_5:
  v48.receiver = self;
  v48.super_class = (Class)TUConversationLink;
  v27 = -[TUConversationLink init](&v48, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v20, "copy");
    pseudonym = v27->_pseudonym;
    v27->_pseudonym = (NSString *)v28;

    v30 = objc_msgSend(v21, "copy");
    publicKey = v27->_publicKey;
    v27->_publicKey = (NSData *)v30;

    objc_storeStrong((id *)&v27->_groupUUID, a5);
    objc_storeStrong((id *)&v27->_originatorHandle, a6);
    v32 = objc_msgSend(v22, "copy");
    creationDate = v27->_creationDate;
    v27->_creationDate = (NSDate *)v32;

    v34 = objc_msgSend(v23, "copy");
    deletionDate = v27->_deletionDate;
    v27->_deletionDate = (NSDate *)v34;

    v36 = objc_msgSend(v24, "copy");
    expirationDate = v27->_expirationDate;
    v27->_expirationDate = (NSDate *)v36;

    v38 = objc_msgSend(v25, "copy");
    invitedMemberHandles = v27->_invitedMemberHandles;
    v27->_invitedMemberHandles = (NSSet *)v38;

    v27->_locallyCreated = a11;
    v40 = objc_msgSend(v26, "copy");
    linkName = v27->_linkName;
    v27->_linkName = (NSString *)v40;

    v27->_linkLifetimeScope = a13;
    v27->_deleteReason = a14;
  }

  return v27;
}

+ (id)conversationLinkComponentsFromURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44 = a1;
  if (objc_msgSend((id)objc_opt_class(), "checkMatchingConversationLinkCriteriaForURL:", v4))
  {
    v5 = (void *)MEMORY[0x1E0CB3998];
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "fragment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("?%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v43 = v4;
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v42 = v9;
      objc_msgSend(v9, "queryItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (!v12)
        goto LABEL_30;
      v13 = v12;
      v14 = *(_QWORD *)v46;
      while (1)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v46 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToIgnoringCase:", CFSTR("v"));

          if (v18)
          {
            objc_msgSend(v16, "value");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "integerValue");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = v10;
            v23 = v21;
            v24 = CFSTR("v");
LABEL_24:
            objc_msgSend(v22, "setObject:forKey:", v23, v24);
            goto LABEL_25;
          }
          objc_msgSend(v16, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToIgnoringCase:", CFSTR("p"));

          if (v26)
          {
            objc_msgSend(v16, "value");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "prefixedPseudonymFor:", v27);
            v21 = objc_claimAutoreleasedReturnValue();

            if (!v21)
              goto LABEL_25;
            v22 = v10;
            v23 = v21;
            v24 = CFSTR("p");
            goto LABEL_24;
          }
          objc_msgSend(v16, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToIgnoringCase:", CFSTR("k"));

          if (v29)
          {
            objc_msgSend(v16, "value");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "publicKeyForBase64EncodedString:", v30);
            v21 = objc_claimAutoreleasedReturnValue();

            if (!v21)
              goto LABEL_25;
            v22 = v10;
            v23 = v21;
            v24 = CFSTR("k");
            goto LABEL_24;
          }
          objc_msgSend(v16, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqualToIgnoringCase:", CFSTR("n"));

          if (v32)
          {
            TUDefaultLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "value");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v50 = v34;
              _os_log_impl(&dword_19A50D000, v33, OS_LOG_TYPE_DEFAULT, "Link had a nickname to pre-fill for the web (%@); we have no use for it, so ignoring",
                buf,
                0xCu);

            }
            objc_msgSend(v16, "value");
            v21 = objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              v22 = v10;
              v23 = v21;
              v24 = CFSTR("n");
              goto LABEL_24;
            }
          }
          else
          {
            objc_msgSend(v16, "name");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isEqualToIgnoringCase:", CFSTR("l"));

            if (v36)
            {
              objc_msgSend(v16, "value");
              v21 = objc_claimAutoreleasedReturnValue();
              if (!v21)
                goto LABEL_25;
              v22 = v10;
              v23 = v21;
              v24 = CFSTR("l");
              goto LABEL_24;
            }
            TUDefaultLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "name");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "value");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v50 = v37;
              v51 = 2112;
              v52 = v38;
              _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring unrecognized conversation link fragment query item: \"%@\"=>\"%@\", buf, 0x16u);

            }
          }
LABEL_25:

          ++v15;
        }
        while (v13 != v15);
        v39 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        v13 = v39;
        if (!v39)
        {
LABEL_30:

          v40 = (void *)objc_msgSend(v10, "copy");
          v9 = v42;
          v4 = v43;
          goto LABEL_33;
        }
      }
    }
    v40 = 0;
LABEL_33:

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

+ (id)conversationLinkForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  TUConversationLink *v12;
  uint64_t v14;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "checkMatchingConversationLinkCriteriaForURL:", v4))
  {
    objc_msgSend(a1, "conversationLinkComponentsFromURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      v12 = 0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("v"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("p"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("k"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("l"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_12;
    v12 = 0;
    if (objc_msgSend((id)objc_opt_class(), "conversationLinkVersion") < v8 || !v9 || !v10)
      goto LABEL_13;
    if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
    {
      LOBYTE(v14) = 0;
      v12 = -[TUConversationLink initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMemberHandles:locallyCreated:linkName:linkLifetimeScope:deleteReason:]([TUConversationLink alloc], "initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMemberHandles:locallyCreated:linkName:linkLifetimeScope:deleteReason:", v9, v10, 0, 0, 0, 0, 0, 0, v14, v11, 0, 0);
    }
    else
    {
LABEL_12:
      v12 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (NSURL)URL
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  id v13;
  int v14;
  TUConversationLink *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[TUConversationLink pseudonym](self, "pseudonym");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {

    return (NSURL *)0;
  }
  -[TUConversationLink publicKey](self, "publicKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    return (NSURL *)0;
  -[TUConversationLink URLFragment](self, "URLFragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "preferredBaseURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "baseURLComponentsForURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setFragment:", v6);
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Cannot return URL; missing URL fragment for %@",
        (uint8_t *)&v14,
        0xCu);
    }

    v10 = 0;
  }
  v13 = v10;

  return (NSURL *)v13;
}

+ (id)baseURLs
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "baseURLStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@"), CFSTR("https"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLWithString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v13, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v11 = (void *)objc_msgSend(v13, "copy");
  return v11;
}

+ (id)preferredBaseURLString
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "baseURLStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "baseURLStrings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)preferredBaseURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "baseURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "baseURLs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)baseURLComponentsForURL:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[TUConversationLink baseURLComponentsForURL:].cold.1((uint64_t)v3, v5);

  }
  return v4;
}

- (NSString)URLFragment
{
  void *v3;
  id v4;
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
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend((id)objc_opt_class(), "conversationLinkVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("v"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB39D8];
  -[TUConversationLink unprefixedPseudonym](self, "unprefixedPseudonym");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("p"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  v9 = (void *)MEMORY[0x1E0CB39D8];
  -[TUConversationLink base64PublicKey](self, "base64PublicKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryItemWithName:value:", CFSTR("k"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUConversationLink linkName](self, "linkName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB39D8];
    -[TUConversationLink linkName](self, "linkName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queryItemWithName:value:", CFSTR("l"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v17, "addObject:", v16);

    v12 = v17;
  }
  objc_msgSend(v4, "setQueryItems:", v12);
  objc_msgSend(v4, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "absoluteString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?"), &stru_1E38A53C8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v18, "stringByRemovingPercentEncoding");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

+ (unint64_t)conversationLinkVersion
{
  return 1;
}

- (id)unprefixedPseudonym
{
  void *v2;
  void *v3;

  -[TUConversationLink pseudonym](self, "pseudonym");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("pseud:"), &stru_1E38A53C8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)base64PublicKey
{
  void *v2;
  void *v3;

  -[TUConversationLink publicKey](self, "publicKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tu_URLSafeBase64EncodedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)prefixedPseudonymFor:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("pseud:"), a3);
}

+ (id)publicKeyForBase64EncodedString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "tu_dataForURLSafeBase64EncodedString:", a3);
}

+ (BOOL)checkMatchingConversationLinkCriteriaForURL:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  objc_msgSend(v26, "fragment");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(a1, "baseURLs"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        v7))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(a1, "baseURLs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v10 = v26;
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v30;
      v25 = *(_QWORD *)v30;
      do
      {
        v13 = 0;
        v28 = v11;
        do
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(a1, "baseURLComponentsForURL:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13), v25);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "scheme");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "scheme");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!TUStringsAreCaseInsensitiveEqualOrNil(v15, v16))
            goto LABEL_13;
          objc_msgSend(v14, "host");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "host");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!TUStringsAreCaseInsensitiveEqualOrNil(v17, v18))
          {

            v11 = v28;
LABEL_13:

            goto LABEL_14;
          }
          objc_msgSend(v14, "path");
          v19 = v8;
          v20 = a1;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = TUStringsAreCaseInsensitiveEqualOrNil(v21, v22);

          v10 = v26;
          a1 = v20;
          v8 = v19;
          v12 = v25;

          v11 = v28;
          if (v27)
          {
            v23 = 1;
            goto LABEL_18;
          }
LABEL_14:
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }
    v23 = 0;
LABEL_18:

  }
  else
  {
    v23 = 0;
    v10 = v26;
  }

  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLink pseudonym](self, "pseudonym");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" pseudonym=%@"), v4);

  -[TUConversationLink publicKey](self, "publicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" publicKey=%@"), v5);

  -[TUConversationLink URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" URL=%@"), v6);

  -[TUConversationLink linkName](self, "linkName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" linkName=%@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(" isLocallyCreated=%d"), -[TUConversationLink isLocallyCreated](self, "isLocallyCreated"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" linkLifetimeScope=%ld"), -[TUConversationLink linkLifetimeScope](self, "linkLifetimeScope"));
  v8 = -[TUConversationLink canCreateConversations](self, "canCreateConversations");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR(" canCreateConversations=%@"), v9);
  -[TUConversationLink deletionDate](self, "deletionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" deletionDate=%@"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR(" deleteReason=%ld"), -[TUConversationLink deleteReason](self, "deleteReason"));
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "groupUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "groupUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" self.groupUUID=%@"), v14);

  }
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "originatorHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "originatorHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" self.originatorHandle=%@"), v18);

  }
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "invitedMemberHandles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "invitedMemberHandles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" self.invitedMemberHandles=%@"), v22);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v23 = (void *)objc_msgSend(v3, "copy");

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationLink isEqualToConversationLink:](self, "isEqualToConversationLink:", v4);

  return v5;
}

- (BOOL)isEquivalentToConversationLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "pseudonym");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[TUConversationLink isEquivalentToPseudonym:andPublicKey:](self, "isEquivalentToPseudonym:andPublicKey:", v5, v6);
  return (char)self;
}

- (BOOL)isEquivalentToPseudonym:(id)a3 andPublicKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;

  v6 = a4;
  v7 = a3;
  -[TUConversationLink pseudonym](self, "pseudonym");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = TUStringsAreEqualOrNil((unint64_t)v8, (uint64_t)v7);

  if (v9)
  {
    -[TUConversationLink publicKey](self, "publicKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = TUObjectsAreEqualOrNil((unint64_t)v10, (uint64_t)v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualToConversationLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  int64_t v19;
  BOOL v20;
  int64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  -[TUConversationLink pseudonym](self, "pseudonym");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pseudonym");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUStringsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[TUConversationLink publicKey](self, "publicKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publicKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[TUConversationLink groupUUID](self, "groupUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "groupUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        -[TUConversationLink originatorHandle](self, "originatorHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "originatorHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
        {
          v29 = v11;
          -[TUConversationLink invitedMemberHandles](self, "invitedMemberHandles");
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "invitedMemberHandles");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)v13;
          if (TUObjectsAreEqualOrNil(v13, (uint64_t)v30))
          {
            -[TUConversationLink creationDate](self, "creationDate");
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "creationDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)v14;
            if (TUObjectsAreEqualOrNil(v14, (uint64_t)v27))
            {
              -[TUConversationLink deletionDate](self, "deletionDate");
              v15 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "deletionDate");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)v15;
              if (TUObjectsAreEqualOrNil(v15, (uint64_t)v25))
              {
                -[TUConversationLink linkName](self, "linkName");
                v16 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "linkName");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = (void *)v16;
                if (TUObjectsAreEqualOrNil(v16, (uint64_t)v23)
                  && (v22 = -[TUConversationLink isLocallyCreated](self, "isLocallyCreated"),
                      v22 == objc_msgSend(v4, "isLocallyCreated")))
                {
                  v19 = -[TUConversationLink linkLifetimeScope](self, "linkLifetimeScope");
                  v20 = v19 == objc_msgSend(v4, "linkLifetimeScope");
                  v11 = v29;
                  if (v20)
                  {
                    v21 = -[TUConversationLink deleteReason](self, "deleteReason");
                    v17 = v21 == objc_msgSend(v4, "deleteReason");
                  }
                  else
                  {
                    v17 = 0;
                  }
                }
                else
                {
                  v17 = 0;
                  v11 = v29;
                }

              }
              else
              {
                v17 = 0;
                v11 = v29;
              }

            }
            else
            {
              v17 = 0;
              v11 = v29;
            }

          }
          else
          {
            v17 = 0;
            v11 = v29;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  void *v23;

  -[TUConversationLink pseudonym](self, "pseudonym");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v23, "hash");
  -[TUConversationLink publicKey](self, "publicKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[TUConversationLink groupUUID](self, "groupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[TUConversationLink originatorHandle](self, "originatorHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[TUConversationLink invitedMemberHandles](self, "invitedMemberHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[TUConversationLink creationDate](self, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[TUConversationLink deletionDate](self, "deletionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  -[TUConversationLink linkName](self, "linkName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  v18 = -[TUConversationLink isLocallyCreated](self, "isLocallyCreated");
  v19 = 1237;
  if (v18)
    v19 = 1231;
  v20 = v15 ^ v17 ^ v19 ^ -[TUConversationLink linkLifetimeScope](self, "linkLifetimeScope");
  v21 = v20 ^ -[TUConversationLink deleteReason](self, "deleteReason");

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPseudonym:publicKey:groupUUID:originatorHandle:", self->_pseudonym, self->_publicKey, self->_groupUUID, self->_originatorHandle);
  v6 = -[NSSet copyWithZone:](self->_invitedMemberHandles, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v6;

  v8 = -[NSDate copyWithZone:](self->_creationDate, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSDate copyWithZone:](self->_deletionDate, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_linkName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v12;

  *(_BYTE *)(v5 + 8) = -[TUConversationLink isLocallyCreated](self, "isLocallyCreated");
  *(_QWORD *)(v5 + 64) = -[TUConversationLink linkLifetimeScope](self, "linkLifetimeScope");
  *(_QWORD *)(v5 + 72) = -[TUConversationLink deleteReason](self, "deleteReason");
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationLink)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  TUConversationLink *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSSet *invitedMemberHandles;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSDate *creationDate;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSDate *deletionDate;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSString *linkName;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_pseudonym);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_publicKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_groupUUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_originatorHandle);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[TUConversationLink initWithPseudonym:publicKey:groupUUID:originatorHandle:](self, "initWithPseudonym:publicKey:groupUUID:originatorHandle:", v7, v10, v13, v16);
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_invitedMemberHandles);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    invitedMemberHandles = v17->_invitedMemberHandles;
    v17->_invitedMemberHandles = (NSSet *)v22;

    v24 = objc_opt_class();
    NSStringFromSelector(sel_creationDate);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    creationDate = v17->_creationDate;
    v17->_creationDate = (NSDate *)v26;

    v28 = objc_opt_class();
    NSStringFromSelector(sel_deletionDate);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    deletionDate = v17->_deletionDate;
    v17->_deletionDate = (NSDate *)v30;

    v32 = objc_opt_class();
    NSStringFromSelector(sel_linkName);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    linkName = v17->_linkName;
    v17->_linkName = (NSString *)v34;

    NSStringFromSelector(sel_isLocallyCreated);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_locallyCreated = objc_msgSend(v4, "decodeBoolForKey:", v36);

    NSStringFromSelector(sel_linkLifetimeScope);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_linkLifetimeScope = objc_msgSend(v4, "decodeIntegerForKey:", v37);

    NSStringFromSelector(sel_deleteReason);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_deleteReason = objc_msgSend(v4, "decodeIntegerForKey:", v38);

  }
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *pseudonym;
  id v5;
  void *v6;
  NSData *publicKey;
  void *v8;
  NSUUID *groupUUID;
  void *v10;
  TUHandle *originatorHandle;
  void *v12;
  NSSet *invitedMemberHandles;
  void *v14;
  NSDate *creationDate;
  void *v16;
  NSDate *deletionDate;
  void *v18;
  NSString *linkName;
  void *v20;
  _BOOL8 locallyCreated;
  void *v22;
  int64_t linkLifetimeScope;
  void *v24;
  int64_t deleteReason;
  id v26;

  pseudonym = self->_pseudonym;
  v5 = a3;
  NSStringFromSelector(sel_pseudonym);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", pseudonym, v6);

  publicKey = self->_publicKey;
  NSStringFromSelector(sel_publicKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", publicKey, v8);

  groupUUID = self->_groupUUID;
  NSStringFromSelector(sel_groupUUID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", groupUUID, v10);

  originatorHandle = self->_originatorHandle;
  NSStringFromSelector(sel_originatorHandle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", originatorHandle, v12);

  invitedMemberHandles = self->_invitedMemberHandles;
  NSStringFromSelector(sel_invitedMemberHandles);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", invitedMemberHandles, v14);

  creationDate = self->_creationDate;
  NSStringFromSelector(sel_creationDate);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", creationDate, v16);

  deletionDate = self->_deletionDate;
  NSStringFromSelector(sel_deletionDate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", deletionDate, v18);

  linkName = self->_linkName;
  NSStringFromSelector(sel_linkName);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", linkName, v20);

  locallyCreated = self->_locallyCreated;
  NSStringFromSelector(sel_isLocallyCreated);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", locallyCreated, v22);

  linkLifetimeScope = self->_linkLifetimeScope;
  NSStringFromSelector(sel_linkLifetimeScope);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", linkLifetimeScope, v24);

  deleteReason = self->_deleteReason;
  NSStringFromSelector(sel_deleteReason);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", deleteReason, v26);

}

- (id)valueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("pseudonym")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("publicKey")))
    {
      -[TUConversationLink publicKey](self, "publicKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("groupUUID")))
      {
        if (!objc_msgSend(v4, "isEqualToString:", CFSTR("originatorHandle")))
        {
          v6 = 0;
          goto LABEL_9;
        }
        -[TUConversationLink originatorHandle](self, "originatorHandle");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      -[TUConversationLink groupUUID](self, "groupUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v8;

    goto LABEL_9;
  }
  -[TUConversationLink pseudonym](self, "pseudonym");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v6 = (void *)v5;
LABEL_9:

  return v6;
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)deletionDate
{
  return self->_deletionDate;
}

- (void)setDeletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_deletionDate, a3);
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_groupUUID, a3);
}

- (BOOL)isLocallyCreated
{
  return self->_locallyCreated;
}

- (void)setLocallyCreated:(BOOL)a3
{
  self->_locallyCreated = a3;
}

- (TUHandle)originatorHandle
{
  return self->_originatorHandle;
}

- (void)setOriginatorHandle:(id)a3
{
  objc_storeStrong((id *)&self->_originatorHandle, a3);
}

- (int64_t)linkLifetimeScope
{
  return self->_linkLifetimeScope;
}

- (void)setLinkLifetimeScope:(int64_t)a3
{
  self->_linkLifetimeScope = a3;
}

- (int64_t)deleteReason
{
  return self->_deleteReason;
}

- (void)setDeleteReason:(int64_t)a3
{
  self->_deleteReason = a3;
}

- (void)setURLFragment:(id)a3
{
  objc_storeStrong((id *)&self->_URLFragment, a3);
}

- (void)setLinkName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSSet)invitedMemberHandles
{
  return self->_invitedMemberHandles;
}

- (void)setInvitedMemberHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedMemberHandles, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_linkName, 0);
  objc_storeStrong((id *)&self->_URLFragment, 0);
  objc_storeStrong((id *)&self->_originatorHandle, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);
}

+ (void)baseURLComponentsForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "Failed to parse URL components for %@", (uint8_t *)&v2, 0xCu);
}

@end
