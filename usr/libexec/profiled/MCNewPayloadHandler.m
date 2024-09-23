@implementation MCNewPayloadHandler

- (MCNewPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v7;
  id v8;
  MCNewPayloadHandler *v9;
  MCNewPayloadHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCNewPayloadHandler;
  v9 = -[MCNewPayloadHandler init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payload, a3);
    objc_storeWeak((id *)&v10->_profileHandler, v8);
  }

  return v10;
}

- (id)userInputFields
{
  return +[NSArray array](NSArray, "array");
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  return 1;
}

- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  return 1;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return 1;
}

- (BOOL)isInstalled
{
  return 1;
}

- (void)setAsideWithInstaller:(id)a3
{
  -[MCNewPayloadHandler setAside](self, "setAside", a3);
}

- (void)_touchDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v7, v6);
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v7, v6);

}

- (void)_touchDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 personaID:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:](self, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:", v10, v9, 1, 0, v8);
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:](self, "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:", v10, v9, 1, 0, v8);

}

- (void)_touchDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:", v11, v10, v7, v6);
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:", v11, v10, v7, v6);

}

- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4
{
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:", a3, a4, 1, 0);
}

- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:](self, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:", a3, a4, a5, a6, 0);
}

- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6 personaID:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void **v14;
  void *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a6;
  v9 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(a7, "length");
  v14 = (void **)&kMCDMCertificateToPayloadUUIDDependencyKey;
  if (v13)
    v14 = (void **)&kMCDMEnterpriseCertificateToPayloadUUIDDependencyKey;
  v15 = *v14;
  if (v13)
    v16 = (id *)&kMCDMPayloadUUIDToEnterpriseCertificateDependencyKey;
  else
    v16 = (id *)&kMCDMPayloadUUIDToCertificateDependencyKey;
  v20 = v15;
  v17 = *v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MCHexString"));

  objc_msgSend(v18, "addDependent:ofParent:inDomain:reciprocalDomain:toSystem:user:", v11, v19, v20, v17, v9, v8);
}

- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4
{
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:", a3, a4, 1, 0);
}

- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:](self, "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:", a3, a4, a5, a6, 0);
}

- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6 personaID:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void **v14;
  void *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a6;
  v9 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(a7, "length");
  v14 = (void **)&kMCDMCertificateToPayloadUUIDDependencyKey;
  if (v13)
    v14 = (void **)&kMCDMEnterpriseCertificateToPayloadUUIDDependencyKey;
  v15 = *v14;
  if (v13)
    v16 = (id *)&kMCDMPayloadUUIDToEnterpriseCertificateDependencyKey;
  else
    v16 = (id *)&kMCDMPayloadUUIDToCertificateDependencyKey;
  v20 = v15;
  v17 = *v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MCHexString"));

  objc_msgSend(v18, "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:", v11, v19, v20, v17, v9, v8);
}

- (id)_temporaryPersistentIDForIdentityUUID:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  const void *v24;
  id v25;
  uint8_t buf[4];
  id v27;

  v6 = a3;
  if (!v6
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloadHandlerWithUUID:", v6)),
        v7,
        !v8))
  {
    v10 = 0;
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "certificatePersistentID"));
  if (v10)
  {
LABEL_14:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUID"));
    -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v10, v21);

    goto LABEL_15;
  }
  v25 = 0;
  v11 = objc_msgSend(v8, "copyIdentityImmediatelyWithInteractionClient:outError:", 0, &v25);
  v12 = v25;
  v13 = v12;
  if (!v12 && v11)
  {
    v24 = v11;
    v14 = objc_msgSend(v8, "accessibility");
    v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Getting temporary persistent ID for identity, storing with accessibility %@", buf, 0xCu);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUID"));
    v17 = kMCAppleIdentitiesKeychainGroup;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "profile"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v24, v16, v17, objc_msgSend(v19, "isInstalledForSystem"), v14));

    CFRelease(v24);
    goto LABEL_14;
  }
  if (!v12)
  {
    v10 = 0;
    goto LABEL_14;
  }

  if (a4)
  {
    v13 = objc_retainAutorelease(v13);
    v10 = 0;
    *a4 = v13;
  }
  else
  {
    v10 = 0;
  }
LABEL_16:

  return v10;
}

+ (id)promptDictionaryForKey:(id)a3 title:(id)a4 description:(id)a5 retypeDescription:(id)a6 finePrint:(id)a7 defaultValue:(id)a8 placeholderValue:(id)a9 minimumLength:(unint64_t)a10 fieldType:(int)a11 flags:(int)a12
{
  return +[MCPayloadUserPromptUtilities promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCPayloadUserPromptUtilities, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", a3, a4, a5, a6, a7, a8);
}

+ (id)prioritizeUserInput:(id)a3 key:(id)a4 overField:(id)a5
{
  return +[MCPayloadUserPromptUtilities prioritizeUserInput:key:overField:](MCPayloadUserPromptUtilities, "prioritizeUserInput:key:overField:", a3, a4, a5);
}

- (MCPayload)payload
{
  return self->_payload;
}

- (MCProfileHandler)profileHandler
{
  return (MCProfileHandler *)objc_loadWeakRetained((id *)&self->_profileHandler);
}

- (NSArray)userInputResponses
{
  return self->_userInputResponses;
}

- (void)setUserInputResponses:(id)a3
{
  objc_storeStrong((id *)&self->_userInputResponses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInputResponses, 0);
  objc_destroyWeak((id *)&self->_profileHandler);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
