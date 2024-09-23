@implementation RBSProcessIdentity

- (NSString)embeddedApplicationIdentifier
{
  return 0;
}

- (BOOL)isApplication
{
  return 0;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (NSString)shortDescription
{
  return self->_description;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSProcessIdentity;
  return -[RBSProcessIdentity init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessIdentity *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (RBSProcessIdentity *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && -[RBSProcessIdentity isEqualToIdentity:](self, "isEqualToIdentity:", v4);
  }

  return v6;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  RBSProcessIdentity *v4;
  RBSProcessIdentity *v5;
  BOOL v6;

  v4 = (RBSProcessIdentity *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = self->_hash == v4->_hash
      && self->_pid == v4->_pid
      && -[RBSProcessIdentity _matchesIdentity:](self, "_matchesIdentity:", v4);

  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (RBSProcessIdentifier)hostIdentifier
{
  return 0;
}

- (BOOL)isXPCService
{
  return 0;
}

- (unsigned)osServiceType
{
  return 0;
}

+ (id)identityForAngelJobLabel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[RBSOSServiceProcessIdentity _initAngelWithJobLabel:]([RBSOSServiceProcessIdentity alloc], "_initAngelWithJobLabel:", v3);

  return v4;
}

+ (id)identityForLaunchdJobLabel:(id)a3 isMultiInstance:(BOOL)a4 pid:(int)a5 auid:(unsigned int)a6
{
  _BOOL4 v7;
  id v8;
  void *v9;
  NSObject *v10;
  RBSOSServiceProcessIdentity *v11;
  uint64_t v12;
  id v13;

  v7 = a4;
  v8 = a3;
  v9 = v8;
  if (!a5 && v7)
  {
    rbs_process_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[RBSProcessIdentity identityForLaunchdJobLabel:isMultiInstance:pid:auid:].cold.1();
LABEL_12:

    v13 = 0;
    goto LABEL_13;
  }
  if (!v8)
  {
    rbs_process_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[RBSProcessIdentity identityForLaunchdJobLabel:isMultiInstance:pid:auid:].cold.2(v10);
    goto LABEL_12;
  }
  v11 = [RBSOSServiceProcessIdentity alloc];
  if (v7)
    v12 = a5;
  else
    v12 = 0;
  v13 = -[RBSOSServiceProcessIdentity _initDaemonWithJobLabel:pid:auid:](v11, "_initDaemonWithJobLabel:pid:auid:", v9, v12, 0);
LABEL_13:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationToken, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_angelJobLabel, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

+ (id)identityOfCurrentProcess
{
  void *v2;
  void *v3;

  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection identity]((uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasConsistentLaunchdJob
{
  return 0;
}

- (NSString)applicationJobLabel
{
  return 0;
}

+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    v11 = 0;
    goto LABEL_5;
  }
  v17 = 0;
  +[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v8, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    objc_msgSend(v10, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessInstance instanceWithIdentifier:identity:](RBSProcessInstance, "instanceWithIdentifier:identity:", v8, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v13;
LABEL_5:
    +[RBSProcessIdentity identityForXPCServiceIdentifier:hostInstance:UUID:variant:](RBSProcessIdentity, "identityForXPCServiceIdentifier:hostInstance:UUID:variant:", v7, v11, v9, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  rbs_process_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:].cold.1();

  v14 = 0;
LABEL_9:

  return v14;
}

+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 variant:(int64_t)a6
{
  return (id)objc_msgSend(a1, "identityForXPCServiceIdentifier:hostInstance:UUID:persona:validationToken:variant:", a3, a4, a5, 0, 0, a6);
}

+ (id)extensionIdentityForBundleIdentifier:(id)a3 persona:(id)a4 instanceUUID:(id)a5 hostIdentifier:(id)a6 validationToken:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v14)
  {
    v17 = 0;
    goto LABEL_5;
  }
  v23 = 0;
  +[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v14, &v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v23;
  if (v16)
  {
    objc_msgSend(v16, "identity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessInstance instanceWithIdentifier:identity:](RBSProcessInstance, "instanceWithIdentifier:identity:", v14, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v19;
LABEL_5:
    +[RBSProcessIdentity identityForXPCServiceIdentifier:hostInstance:UUID:persona:validationToken:variant:](RBSProcessIdentity, "identityForXPCServiceIdentifier:hostInstance:UUID:persona:validationToken:variant:", v11, v17, v13, v12, v15, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  rbs_process_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:].cold.1();

  v20 = 0;
LABEL_9:

  return v20;
}

+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 persona:(id)a6 validationToken:(id)a7 variant:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;

  v15 = a3;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSProcessIdentity.m"), 293, CFSTR("Invalid condition not satisfying: %@"), CFSTR("object != nil"));

  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSProcessIdentity.m"), 293, CFSTR("Invalid condition not satisfying: %@"), CFSTR("[object isKindOfClass:NSStringClass]"));

  }
  v20 = 3;
  if (v19)
    v20 = 1;
  if (a8 <= 1)
    v21 = 0;
  else
    v21 = v20;
  +[RBSXPCServiceDefinition definitionWithIdentifier:variant:scope:](RBSXPCServiceDefinition, "definitionWithIdentifier:variant:scope:", v15, a8, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSXPCServiceIdentity identityWithDefinition:sessionID:host:UUID:persona:validationToken:](RBSXPCServiceIdentity, "identityWithDefinition:sessionID:host:UUID:persona:validationToken:", v22, 0, v19, v18, v17, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[RBSXPCServiceProcessIdentity _initWithXPCServiceID:pid:auid:]([RBSXPCServiceProcessIdentity alloc], "_initWithXPCServiceID:pid:auid:", v23, 0, 0);
  return v24;
}

- (NSString)xpcServiceIdentifier
{
  return 0;
}

- (BOOL)isExtension
{
  return 0;
}

- (BOOL)isDext
{
  return 0;
}

- (RBSProcessIdentity)hostIdentity
{
  return 0;
}

- (NSString)consistentLaunchdJobLabel
{
  return 0;
}

- (int)platform
{
  return 0;
}

- (BOOL)isEmbeddedApplication
{
  return 0;
}

- (NSString)personaString
{
  return 0;
}

- (unsigned)defaultManageFlags
{
  return 0;
}

- (BOOL)isDaemon
{
  return 0;
}

+ (id)identityForPlugInKitIdentifier:(id)a3
{
  return +[RBSProcessIdentity _identityForXPCServiceIdentifier:variant:](RBSProcessIdentity, "_identityForXPCServiceIdentifier:variant:", a3, 2);
}

- (unsigned)auid
{
  return 0;
}

+ (id)identityForApplicationJobLabel:(id)a3 bundleID:(id)a4 platform:(int)a5
{
  id v5;
  id v6;

  v5 = a4;
  v6 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithBundleID:]([RBSEmbeddedAppProcessIdentity alloc], "_initEmbeddedAppWithBundleID:", v5);

  return v6;
}

+ (id)identityForUnbundledMacApplicationJobLabel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[RBSOSServiceProcessIdentity _initUnknownOSServiceWithJobLabel:]([RBSOSServiceProcessIdentity alloc], "_initUnknownOSServiceWithJobLabel:", v3);

  return v4;
}

+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 jobLabel:(id)a4 auid:(unsigned int)a5 platform:(int)a6
{
  id v6;
  id v7;

  v6 = a3;
  v7 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithBundleID:]([RBSEmbeddedAppProcessIdentity alloc], "_initEmbeddedAppWithBundleID:", v6);

  return v7;
}

+ (id)identityForWrappedInfoProvider:(id)a3 uuid:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(a3, "fetchWrappedInfoWithError:", &v12, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    objc_msgSend(v4, "persistentJobLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "persistentJobLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSProcessIdentity identityForUnknownServiceWithJobLabel:](RBSProcessIdentity, "identityForUnknownServiceWithJobLabel:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithAppInfo:]([RBSEmbeddedAppProcessIdentity alloc], "_initEmbeddedAppWithAppInfo:", v4);
    }
  }
  else
  {
    rbs_general_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_190CD6000, v9, OS_LOG_TYPE_DEFAULT, "_initEmbeddedAppWithAppInfoProvider failed due to %{public}@", buf, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

+ (id)identityForWrappedInfoProvider:(id)a3
{
  return +[RBSProcessIdentity identityForWrappedInfoProvider:uuid:](RBSProcessIdentity, "identityForWrappedInfoProvider:uuid:", a3, 0);
}

+ (id)identityForEmbeddedApplicationIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "identityForEmbeddedApplicationIdentifier:auid:", a3, 0);
}

+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 auid:(unsigned int)a4
{
  return +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:jobLabel:auid:platform:](RBSProcessIdentity, "identityForEmbeddedApplicationIdentifier:jobLabel:auid:platform:", a3, 0, *(_QWORD *)&a4, 6);
}

+ (id)identityForLSApplicationIdentity:(id)a3
{
  return +[RBSProcessIdentity identityForWrappedInfoProvider:](RBSProcessIdentity, "identityForWrappedInfoProvider:", a3);
}

+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4
{
  void *v4;
  void *v5;

  +[RBSIdentityAndRecordInfoProvider _providerWithIdentity:record:](RBSIdentityAndRecordInfoProvider, "_providerWithIdentity:record:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessIdentity identityForWrappedInfoProvider:](RBSProcessIdentity, "identityForWrappedInfoProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4 uuid:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  +[RBSIdentityAndRecordInfoProvider _providerWithIdentity:record:](RBSIdentityAndRecordInfoProvider, "_providerWithIdentity:record:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessIdentity identityForWrappedInfoProvider:uuid:](RBSProcessIdentity, "identityForWrappedInfoProvider:uuid:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)identityForUnknownServiceWithJobLabel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[RBSOSServiceProcessIdentity _initUnknownOSServiceWithJobLabel:]([RBSOSServiceProcessIdentity alloc], "_initUnknownOSServiceWithJobLabel:", v3);

  return v4;
}

+ (id)identityForApplicationJobLabel:(id)a3
{
  return +[RBSProcessIdentity identityForApplicationJobLabel:bundleID:platform:](RBSProcessIdentity, "identityForApplicationJobLabel:bundleID:platform:", a3, a3, 0);
}

+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 platform:(int)a5
{
  return +[RBSProcessIdentity identityForLSApplicationIdentity:](RBSProcessIdentity, "identityForLSApplicationIdentity:", a4);
}

+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 bundleID:(id)a5 platform:(int)a6
{
  return +[RBSProcessIdentity identityForLSApplicationIdentity:](RBSProcessIdentity, "identityForLSApplicationIdentity:", a4);
}

+ (id)identityForDaemonJobLabel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[RBSOSServiceProcessIdentity _initDaemonWithJobLabel:pid:auid:]([RBSOSServiceProcessIdentity alloc], "_initDaemonWithJobLabel:pid:auid:", v3, 0, 0);

  return v4;
}

+ (id)identityForDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RBSDextProcessIdentity _initDextWithServerName:tagString:containingAppBundleID:]([RBSDextProcessIdentity alloc], "_initDextWithServerName:tagString:containingAppBundleID:", v9, v8, v7);

  return v10;
}

- (RBSProcessIdentity)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessIdentity.m"), 248, CFSTR("-init is not allowed on RBSProcessIdentity"));

  return 0;
}

- (id)copyWithAuid:(unsigned int)a3
{
  id v3;
  id result;

  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v3 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  result = (id)_os_crash_msg();
  __break(1u);
  return result;
}

+ (id)identityForExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  RBSOpaqueProcessIdentity *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = [RBSOpaqueProcessIdentity alloc];
  objc_msgSend(v7, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[RBSOpaqueProcessIdentity _initOpaqueWithPid:name:auid:](v8, "_initOpaqueWithPid:name:auid:", v6, v9, v5);
  return v10;
}

+ (id)_identityForXPCServiceIdentifier:(id)a3 variant:(int64_t)a4
{
  return +[RBSProcessIdentity identityForXPCServiceIdentifier:hostInstance:UUID:variant:](RBSProcessIdentity, "identityForXPCServiceIdentifier:hostInstance:UUID:variant:", a3, 0, 0, a4);
}

+ (id)identityForXPCServiceIdentifier:(id)a3
{
  return +[RBSProcessIdentity _identityForXPCServiceIdentifier:variant:](RBSProcessIdentity, "_identityForXPCServiceIdentifier:variant:", a3, 0);
}

+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    v11 = 0;
    goto LABEL_5;
  }
  v17 = 0;
  +[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v8, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    objc_msgSend(v10, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessInstance instanceWithIdentifier:identity:](RBSProcessInstance, "instanceWithIdentifier:identity:", v8, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v13;
LABEL_5:
    +[RBSProcessIdentity identityForXPCServiceIdentifier:hostInstance:UUID:variant:](RBSProcessIdentity, "identityForXPCServiceIdentifier:hostInstance:UUID:variant:", v7, v11, v9, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  rbs_process_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:].cold.1();

  v14 = 0;
LABEL_9:

  return v14;
}

+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6
{
  return (id)objc_msgSend(a1, "extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:", a3, a5, a6);
}

+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6
{
  return (id)objc_msgSend(a1, "externalExtensionIdentityForExtensionKitIdentifier:hostIdentifier:UUID:", a3, a5, a6);
}

+ (id)identityForXPCServiceExecutablePath:(id)a3 host:(id)a4
{
  return +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:](RBSProcessIdentity, "identityForXPCServiceExecutablePath:pid:auid:host:UUID:", a3, 0, 0, a4, 0);
}

+ (id)identityForXPCServiceExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5 host:(id)a6 UUID:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t error;
  uint64_t v19;
  NSObject *v20;
  id v21;
  char *string;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  int v44;
  char *v45;
  void *v46;
  uint8_t buf[4];
  char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  id v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v9 = *(_QWORD *)&a4;
  v63 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v12;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSProcessIdentity.m"), 386, CFSTR("Invalid condition not satisfying: %@"), CFSTR("object != nil"));

  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSProcessIdentity.m"), 386, CFSTR("Invalid condition not satisfying: %@"), CFSTR("[object isKindOfClass:NSStringClass]"));

  }
  v16 = objc_retainAutorelease(v15);
  objc_msgSend(v16, "UTF8String");
  v17 = (void *)xpc_bundle_create();
  error = xpc_bundle_get_error();
  if (!(_DWORD)error)
  {
    xpc_bundle_get_info_dictionary();
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      string = (char *)xpc_dictionary_get_string(v20, (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0C9AE78]), "UTF8String"));
      if (string)
        string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
      v23 = _CFXPCCreateCFObjectFromXPCObject();
      v24 = v23;
      if (string)
      {
        if (v23)
        {
          RBSDictionaryForKey(v23, CFSTR("XPCService"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          RBSExtensionPointFromBundleDict(v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v46 = v25;
            if (v13)
              v27 = 1;
            else
              v27 = 3;
            v28 = 2;
            goto LABEL_31;
          }
          if (v25)
          {
            RBSStringForKey(v25, CFSTR("ServiceType"));
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = v29;
            v46 = v25;
            if (!v29 || (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Application")) & 1) != 0)
            {
              v31 = 1;
LABEL_30:
              v43 = v31;

              v28 = 1;
              v27 = v43;
LABEL_31:
              v44 = v27;
              +[RBSXPCServiceDefinition definitionWithIdentifier:variant:scope:](RBSXPCServiceDefinition, "definitionWithIdentifier:variant:scope:", string, v28);
              v30 = objc_claimAutoreleasedReturnValue();
              v45 = string;
              if (v30)
              {
                v42 = v30;
                +[RBSXPCServiceIdentity identityWithDefinition:sessionID:host:UUID:persona:validationToken:](RBSXPCServiceIdentity, "identityWithDefinition:sessionID:host:UUID:persona:validationToken:", v30, 0, v13, v14, 0, 0);
                v41 = objc_claimAutoreleasedReturnValue();
                rbs_process_log();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v16, "lastPathComponent");
                  v40 = v28;
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138545154;
                  v48 = string;
                  v49 = 2114;
                  v50 = v33;
                  v51 = 1024;
                  v52 = objc_msgSend(v13, "rbs_pid");
                  v53 = 1024;
                  v54 = v40;
                  v55 = 1024;
                  v56 = v44;
                  v57 = 2112;
                  v58 = v14;
                  v59 = 1024;
                  v60 = v9;
                  v61 = 1024;
                  v62 = 0;
                  _os_log_impl(&dword_190CD6000, v32, OS_LOG_TYPE_DEFAULT, "Resolved XPC Service %{public}@ (%{public}@) with host pid %d, variant %d, scope %d, uuid %@, pid %d, and auid %d", buf, 0x3Eu);

                }
                v34 = v41;
                v21 = -[RBSXPCServiceProcessIdentity _initWithXPCServiceID:pid:auid:]([RBSXPCServiceProcessIdentity alloc], "_initWithXPCServiceID:pid:auid:", v41, v9, 0);
                v35 = v46;
                v30 = v42;
              }
              else
              {
                rbs_process_log();
                v34 = objc_claimAutoreleasedReturnValue();
                v35 = v46;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.4(v16, v34);
                v21 = 0;
              }

              v25 = v35;
              string = v45;
              goto LABEL_39;
            }
            if ((-[NSObject isEqualToString:](v30, "isEqualToString:", CFSTR("System")) & 1) != 0)
            {
              v31 = 3;
              goto LABEL_30;
            }
            if ((-[NSObject isEqualToString:](v30, "isEqualToString:", CFSTR("User")) & 1) != 0)
            {
              v31 = 2;
              goto LABEL_30;
            }
            rbs_process_log();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.5();

          }
          else
          {
            rbs_process_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.3();
          }
          v21 = 0;
LABEL_39:

          goto LABEL_40;
        }
        rbs_process_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.2();
LABEL_23:
        v21 = 0;
LABEL_40:

        goto LABEL_41;
      }
      string = (char *)v23;
    }
    else
    {
      string = 0;
    }
    rbs_process_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.1();
    goto LABEL_23;
  }
  v19 = error;
  rbs_process_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.6(v19, (uint64_t)v16, v20);
  v21 = 0;
LABEL_41:

  return v21;
}

- (BOOL)isMultiInstanceExtension
{
  return 0;
}

- (BOOL)isExternal
{
  return 0;
}

+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3
{
  return +[RBSXPCServiceProcessIdentity shouldManageExtensionWithExtensionPoint:](RBSXPCServiceProcessIdentity, "shouldManageExtensionWithExtensionPoint:", a3);
}

- (BOOL)isAngel
{
  return 0;
}

- (BOOL)isAnonymous
{
  return 1;
}

- (NSString)daemonJobLabel
{
  return 0;
}

- (NSUUID)uuid
{
  return 0;
}

- (NSString)dextServerName
{
  return 0;
}

- (NSString)dextLabel
{
  return 0;
}

- (NSString)dextContainingAppBundleID
{
  return 0;
}

- (BOOL)supportsLaunchingDirectly
{
  return 0;
}

- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3
{
  return 0;
}

- (id)encodeForJob
{
  id v2;
  id result;

  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v2 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  result = (id)_os_crash_msg();
  __break(1u);
  return result;
}

- (RBSProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v5;
  id v6;
  id v7;
  RBSProcessIdentity *result;

  v5 = a3;
  v6 = a4;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v7 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  result = (RBSProcessIdentity *)_os_crash_msg();
  __break(1u);
  return result;
}

+ (id)decodeFromJob:(id)a3 uuid:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  objc_class *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = xpc_dictionary_get_int64(v5, "TYPE") - 1;
  if (v7 <= 6
    && ((0x7Bu >> v7) & 1) != 0
    && (objc_opt_class(), (v8 = (objc_class *)(id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)objc_msgSend([v8 alloc], "initWithDecodeFromJob:uuid:", v5, v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_matchesIdentity:(id)a3
{
  return self->_pid == *((_DWORD *)a3 + 2);
}

- (BOOL)matchesProcess:(id)a3
{
  void *v4;

  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RBSProcessIdentity _matchesIdentity:](self, "_matchesIdentity:", v4);

  return (char)self;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentity:](RBSProcessPredicate, "predicateMatchingIdentity:", self);
}

- (BOOL)inheritsCoalitionBand
{
  return 0;
}

- (NSString)debugDescription
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSString *description;
  uint64_t pid;
  const __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v3 = -[RBSProcessIdentity auid](self, "auid");
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  description = self->_description;
  pid = self->_pid;
  if ((int)pid <= 0)
    v8 = &stru_1E2D183D0;
  else
    v8 = CFSTR(" pid=");
  if ((int)pid < 1)
  {
    v9 = &stru_1E2D183D0;
    if ((_DWORD)v3)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", pid);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v4)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@%@%@%@>"), description, v8, v9, CFSTR(" AUID="), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@%@%@%@>"), description, v8, v9, &stru_1E2D183D0, &stru_1E2D183D0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  if ((int)pid >= 1)

  return (NSString *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v4 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

- (RBSProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v3;
  id v4;
  RBSProcessIdentity *result;

  v3 = a3;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v4 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  result = (RBSProcessIdentity *)_os_crash_msg();
  __break(1u);
  return result;
}

- (NSString)angelJobLabel
{
  return self->_angelJobLabel;
}

- (NSString)persona
{
  return self->_persona;
}

- (NSData)validationToken
{
  return self->_validationToken;
}

+ (void)identityForLaunchdJobLabel:isMultiInstance:pid:auid:.cold.1()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  v2 = 1024;
  v3 = 0;
  _os_log_error_impl(&dword_190CD6000, v0, OS_LOG_TYPE_ERROR, "invalid pid (0) for multi-instance job: %@, auid: %d", v1, 0x12u);
  OUTLINED_FUNCTION_0();
}

+ (void)identityForLaunchdJobLabel:(os_log_t)log isMultiInstance:pid:auid:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190CD6000, log, OS_LOG_TYPE_ERROR, "identityForDaemonLaunchProperties called with nil job label", v1, 2u);
}

+ (void)extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_190CD6000, v0, v1, "Could not get process handle for host process: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_190CD6000, v0, v1, "No bundle ID found for: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_190CD6000, v0, v1, "Could not load info.plist into NSDictionary for path %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_190CD6000, v0, v1, "The info.plist in %{public}@ does not contain a \"NSExtension\", \"XPCService\", or \"EXAppExtensionAttributes\" key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)identityForXPCServiceExecutablePath:(void *)a1 pid:(NSObject *)a2 auid:host:UUID:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_190CD6000, a2, OS_LOG_TYPE_ERROR, "Couldn't generate XPCService definition for %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_0_1();
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_190CD6000, v0, v1, "Could not rationalize xpc service at: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)identityForXPCServiceExecutablePath:(NSObject *)a3 pid:auid:host:UUID:.cold.6(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  xpc_strerror();
  OUTLINED_FUNCTION_5_0();
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_190CD6000, a3, OS_LOG_TYPE_ERROR, "Error (%{public}s) creating xpc service bundle for %{public}@", v5, 0x16u);
  OUTLINED_FUNCTION_0_1();
}

@end
