@implementation VCAccessSpecifier

- (BOOL)allowWriteAccessToSuggestionsWithBundleIdentifier:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess"))
  {
    v5 = 1;
  }
  else
  {
    -[VCAccessSpecifier associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v4);

  }
  return v5;
}

- (BOOL)allowUnrestrictedAccess
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 1);
}

+ (id)accessSpecifierForCurrentProcess
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VCAccessSpecifier_accessSpecifierForCurrentProcess__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessSpecifierForCurrentProcess_onceToken != -1)
    dispatch_once(&accessSpecifierForCurrentProcess_onceToken, block);
  return (id)accessSpecifierForCurrentProcess_accessSpecifier;
}

- (BOOL)allowConnection
{
  BOOL v3;
  void *v4;

  if (-[VCAccessSpecifier entitlements](self, "entitlements"))
    return 1;
  -[VCAccessSpecifier associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

- (NSString)associatedAppBundleIdentifier
{
  NSString *associatedAppBundleIdentifier;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  associatedAppBundleIdentifier = self->_associatedAppBundleIdentifier;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (associatedAppBundleIdentifier == v4)
  {
    v5 = 0;
  }
  else if (associatedAppBundleIdentifier)
  {
    associatedAppBundleIdentifier = associatedAppBundleIdentifier;
    v5 = associatedAppBundleIdentifier;
  }
  else
  {
    -[VCAccessSpecifier associatedAppBundleIdentifierFromBundleRecord](self, "associatedAppBundleIdentifierFromBundleRecord");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    associatedAppBundleIdentifier = self->_associatedAppBundleIdentifier;
    self->_associatedAppBundleIdentifier = v7;
  }

  return v5;
}

- (BOOL)hasEntitlements:(int64_t)a3
{
  return (a3 & ~-[VCAccessSpecifier entitlements](self, "entitlements")) == 0;
}

- (int64_t)entitlements
{
  return self->_entitlements;
}

+ (id)accessSpecifierForTask:(__SecTask *)a3 auditToken:(id)a4 sandboxCapabilities:(int64_t)a5
{
  uint64_t v6;
  void *v7;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  int v40;
  void *v41;
  void *v42;
  id v43;
  int v44;
  void *v45;
  void *v46;
  id v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  int v52;
  void *v53;
  void *v54;
  id v55;
  int v56;
  void *v57;
  void *v58;
  id v59;
  int v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  int v66;
  uint64_t v67;
  void *v68;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  unsigned int v77;
  const __CFArray *v78;
  id v79;
  __SecTask *v81;
  _QWORD v83[17];

  v83[15] = *MEMORY[0x1E0C80C00];
  v83[0] = CFSTR("com.apple.siri.VoiceShortcuts.xpc");
  v83[1] = CFSTR("com.apple.shortcuts.library-read-access");
  v6 = *MEMORY[0x1E0CBD4A8];
  v83[2] = CFSTR("com.apple.shortcuts.home-resident");
  v83[3] = v6;
  v83[4] = CFSTR("com.apple.shortcuts.health-access");
  v83[5] = CFSTR("com.apple.shortcuts.background-running");
  v83[6] = CFSTR("com.apple.shortcuts.contextual-actions-client");
  v83[7] = CFSTR("com.apple.shortcuts.import-shortcuts");
  v83[8] = CFSTR("com.apple.rootless.storage.shortcuts");
  v83[9] = CFSTR("com.apple.shortcuts.on-screen-content-service");
  v83[10] = CFSTR("com.apple.shortcuts.background-runner");
  v83[11] = CFSTR("com.apple.shortcuts.test-harness-runner");
  v83[12] = CFSTR("com.apple.shortcuts.droplet-creation");
  v83[13] = CFSTR("com.apple.shortcuts.stepwise-execution");
  v83[14] = CFSTR("com.apple.shortcuts.variable-injection");
  v7 = (void *)MEMORY[0x1E0C99D20];
  v79 = a4;
  objc_msgSend(v7, "arrayWithObjects:count:", v83, 15);
  v81 = a3;
  v78 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v8 = SecTaskCopyValuesForEntitlements(a3, v78, 0);
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.siri.VoiceShortcuts.xpc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v77 = objc_msgSend(v11, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.library-read-access"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  v76 = objc_msgSend(v14, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.home-resident"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  v75 = objc_msgSend(v17, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  v74 = objc_msgSend(v20, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.health-access"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  v73 = objc_msgSend(v23, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.background-running"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
  }
  else
  {
    v25 = 0;
  }
  v26 = v25;

  v72 = objc_msgSend(v26, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.contextual-actions-client"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
  }
  else
  {
    v28 = 0;
  }
  v29 = v28;

  v71 = objc_msgSend(v29, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.import-shortcuts"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
  }
  else
  {
    v31 = 0;
  }
  v32 = v31;

  v70 = objc_msgSend(v32, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.rootless.storage.shortcuts"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
  }
  else
  {
    v34 = 0;
  }
  v35 = v34;

  v36 = objc_msgSend(v35, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.on-screen-content-service"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v37;
    else
      v38 = 0;
  }
  else
  {
    v38 = 0;
  }
  v39 = v38;

  v40 = objc_msgSend(v39, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.automation-confirmation-reset"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v41;
    else
      v42 = 0;
  }
  else
  {
    v42 = 0;
  }
  v43 = v42;

  v44 = objc_msgSend(v43, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.background-runner"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v46 = v45;
    else
      v46 = 0;
  }
  else
  {
    v46 = 0;
  }
  v47 = v46;

  v48 = objc_msgSend(v47, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.test-harness-runner"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v50 = v49;
    else
      v50 = 0;
  }
  else
  {
    v50 = 0;
  }
  v51 = v50;

  v52 = objc_msgSend(v51, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.droplet-creation"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v54 = v53;
    else
      v54 = 0;
  }
  else
  {
    v54 = 0;
  }
  v55 = v54;

  v56 = objc_msgSend(v55, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.stepwise-execution"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v58 = v57;
    else
      v58 = 0;
  }
  else
  {
    v58 = 0;
  }
  v59 = v58;

  v60 = objc_msgSend(v59, "BOOLValue");
  -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.shortcuts.variable-injection"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v62 = v61;
    else
      v62 = 0;
  }
  else
  {
    v62 = 0;
  }
  v63 = v77;
  if (v76)
    v63 = v77 | 4;
  if (v75)
    v63 |= 8uLL;
  if (v74)
    v63 |= 0x10uLL;
  if (v73)
    v63 |= 0x20uLL;
  if (v72)
    v63 |= 0x40uLL;
  if (v71)
    v63 |= 0x80uLL;
  if (v70)
    v63 |= 0x100uLL;
  if (v36)
    v63 |= 0x200uLL;
  if (v40)
    v63 |= 0x400uLL;
  if (v44)
    v63 |= 0x800uLL;
  if (v48)
    v63 |= 0x1000uLL;
  if (v52)
    v63 |= 0x2000uLL;
  if (v56)
    v63 |= 0x4000uLL;
  if (v60)
    v64 = v63 | 0x8000;
  else
    v64 = v63;
  v65 = v62;

  v66 = objc_msgSend(v65, "BOOLValue");
  if (v66)
    v67 = v64 | 0x10000;
  else
    v67 = v64;

  v68 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSecTask:auditToken:bundleIdentifier:associatedAppBundleIdentifier:entitlements:sandboxCapabilities:", v81, v79, 0, 0, v67, a5);
  return v68;
}

- (VCAccessSpecifier)initWithSecTask:(__SecTask *)a3 auditToken:(id)a4 bundleIdentifier:(id)a5 associatedAppBundleIdentifier:(id)a6 entitlements:(int64_t)a7 sandboxCapabilities:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  VCAccessSpecifier *v18;
  VCAccessSpecifier *v19;
  uint64_t v20;
  NSString *bundleIdentifier;
  uint64_t v22;
  NSString *associatedAppBundleIdentifier;
  VCAccessSpecifier *v24;
  objc_super v26;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v26.receiver = self;
  v26.super_class = (Class)VCAccessSpecifier;
  v18 = -[VCAccessSpecifier init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_task = a3;
    if (a3)
      CFRetain(a3);
    objc_storeStrong((id *)&v19->_auditToken, a4);
    v20 = objc_msgSend(v16, "copy");
    bundleIdentifier = v19->_bundleIdentifier;
    v19->_bundleIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v17, "copy");
    associatedAppBundleIdentifier = v19->_associatedAppBundleIdentifier;
    v19->_associatedAppBundleIdentifier = (NSString *)v22;

    v19->_entitlements = a7;
    v19->_sandboxCapabilities = a8;
    v24 = v19;
  }

  return v19;
}

+ (id)accessSpecifierForXPCConnection:(id)a3
{
  _OWORD v5[2];

  if (a3)
    objc_msgSend(a3, "auditToken");
  else
    memset(v5, 0, sizeof(v5));
  objc_msgSend(a1, "accessSpecifierForAuditToken:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)accessSpecifierForAuditToken:(id *)a3
{
  __int128 v5;
  SecTaskRef v6;
  SecTaskRef v7;
  __int128 v8;
  void *v9;
  void *v10;
  audit_token_t v12;

  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v12.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v12.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(0, &v12);
  if (v6)
  {
    v7 = v6;
    v8 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v12.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v12.val[4] = v8;
    objc_msgSend(MEMORY[0x1E0D016E0], "tokenFromAuditToken:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "accessSpecifierForTask:auditToken:sandboxCapabilities:", v7, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v7);
    return v10;
  }
  else
  {
    objc_msgSend(a1, "accessSpecifierWithNoAccess");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __53__VCAccessSpecifier_accessSpecifierForCurrentProcess__block_invoke(uint64_t a1)
{
  SecTaskRef v2;
  void *v3;
  SecTaskRef v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _OWORD v13[2];

  v2 = SecTaskCreateFromSelf(0);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = v2;
    v5 = (void *)MEMORY[0x1E0D016E0];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "if_auditToken");
    else
      memset(v13, 0, sizeof(v13));
    objc_msgSend(v5, "tokenFromAuditToken:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessSpecifierForTask:auditToken:sandboxCapabilities:", v4, v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)accessSpecifierForCurrentProcess_accessSpecifier;
    accessSpecifierForCurrentProcess_accessSpecifier = v11;

    CFRelease(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accessSpecifierWithNoAccess");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)accessSpecifierForCurrentProcess_accessSpecifier;
    accessSpecifierForCurrentProcess_accessSpecifier = v8;

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  int64_t v18;
  _QWORD v19[11];
  _QWORD v20[12];

  v20[11] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VCAccessSpecifier entitlements](self, "entitlements");
  v19[0] = &unk_1E5FFEC38;
  v19[1] = &unk_1E5FFEC50;
  v20[0] = CFSTR("unrestricted");
  v20[1] = CFSTR("library-read");
  v19[2] = &unk_1E5FFEC68;
  v19[3] = &unk_1E5FFEC80;
  v20[2] = CFSTR("home-resident");
  v20[3] = CFSTR("import-shortcuts");
  v19[4] = &unk_1E5FFEC98;
  v19[5] = &unk_1E5FFECB0;
  v20[4] = CFSTR("on-screen-content-service");
  v20[5] = CFSTR("automation-confirmation-reset");
  v19[6] = &unk_1E5FFECC8;
  v19[7] = &unk_1E5FFECE0;
  v20[6] = CFSTR("background-runner");
  v20[7] = CFSTR("test-harness-runner");
  v19[8] = &unk_1E5FFECF8;
  v19[9] = &unk_1E5FFED10;
  v20[8] = CFSTR("droplet-creation");
  v20[9] = CFSTR("stepwise-execution");
  v19[10] = &unk_1E5FFED28;
  v20[10] = CFSTR("variable-injection");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __VCDescriptionOfEntitlements_block_invoke;
  v16 = &unk_1E5FC5578;
  v17 = v8;
  v18 = v6;
  v9 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v13);
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p entitlements=%@>"), v5, self, v10, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)associatedAppBundleIdentifierFromBundleRecord
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[VCAccessSpecifier bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v2, 0, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v3)
    {
      VCAppBundleIdentifierForBundleRecord(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getWFVoiceShortcutClientLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[VCAccessSpecifier associatedAppBundleIdentifierFromBundleRecord]";
        v11 = 2114;
        v12 = v4;
        _os_log_impl(&dword_1AF681000, v6, OS_LOG_TYPE_INFO, "%s Couldn't get LSBundleRecord from task, leaving associated app bundle identifier as nil (%{public}@)", buf, 0x16u);
      }

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)bundleIdentifier
{
  NSString *bundleIdentifier;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  bundleIdentifier = self->_bundleIdentifier;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (bundleIdentifier == v4)
  {
    v5 = 0;
  }
  else if (bundleIdentifier)
  {
    bundleIdentifier = bundleIdentifier;
    v5 = bundleIdentifier;
  }
  else
  {
    -[VCAccessSpecifier bundleIdentifierFromTask](self, "bundleIdentifierFromTask");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v7;
  }

  return v5;
}

- (id)bundleIdentifierFromTask
{
  __SecTask *task;
  __SecTask *v3;
  int v4;

  task = self->_task;
  if (task)
  {
    task = (__SecTask *)SecTaskCopyValueForEntitlement(task, CFSTR("application-identifier"), 0);
    if (task)
    {
      v3 = task;
      v4 = CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
      CFRelease(v3);
      if (!v4)
        return 0;
      task = 0;
    }
  }
  return task;
}

- (VCAccessSpecifier)init
{
  return -[VCAccessSpecifier initWithSecTask:auditToken:bundleIdentifier:associatedAppBundleIdentifier:entitlements:sandboxCapabilities:](self, "initWithSecTask:auditToken:bundleIdentifier:associatedAppBundleIdentifier:entitlements:sandboxCapabilities:", 0, 0, 0, 0, 0, 0);
}

- (void)dealloc
{
  __SecTask *task;
  objc_super v4;

  task = self->_task;
  if (task)
    CFRelease(task);
  v4.receiver = self;
  v4.super_class = (Class)VCAccessSpecifier;
  -[VCAccessSpecifier dealloc](&v4, sel_dealloc);
}

- (BOOL)hasSandboxCapabilities:(int64_t)a3
{
  return (a3 & ~-[VCAccessSpecifier sandboxCapabilities](self, "sandboxCapabilities")) == 0;
}

- (BOOL)allowShortcutImport
{
  return -[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess")
      || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 256);
}

- (BOOL)allowReadAccessToSingleStepShortcutsWithBundleIdentifier:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess")
    || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 4))
  {
    v5 = 1;
  }
  else
  {
    -[VCAccessSpecifier associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v4);

  }
  return v5;
}

- (BOOL)allowReadAccessToSuggestionsWithBundleIdentifier:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess"))
  {
    v5 = 1;
  }
  else
  {
    -[VCAccessSpecifier associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_msgSend(v6, "isEqualToString:", v4) & 1) != 0
      || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 32);

  }
  return v5;
}

- (BOOL)allowReadAccessToShortcutsLibrary
{
  return -[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess")
      || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 4);
}

- (BOOL)allowBackgroundShortcutRunning
{
  return -[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess")
      || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 64)
      || -[VCAccessSpecifier allowReadAccessForSleepWorkflows](self, "allowReadAccessForSleepWorkflows")
      || -[VCAccessSpecifier allowReadAccessForContextualActions](self, "allowReadAccessForContextualActions");
}

- (BOOL)allowBackgroundShortcutRunningWithAssociatedBundleIdentifier:(id)a3
{
  id v4;
  char v5;
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

  v4 = a3;
  if (-[VCAccessSpecifier allowBackgroundShortcutRunning](self, "allowBackgroundShortcutRunning"))
  {
    v5 = 1;
  }
  else
  {
    -[VCAccessSpecifier auditToken](self, "auditToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValues:", 1);
      v8 = (void *)MEMORY[0x1E0D87DB8];
      v9 = (void *)MEMORY[0x1E0D87DA0];
      v10 = (void *)MEMORY[0x1E0D87DF8];
      -[VCAccessSpecifier auditToken](self, "auditToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "targetWithPid:", objc_msgSend(v11, "pid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateMatchingTarget:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "statesForPredicate:withDescriptor:error:", v13, v7, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v15, "taskState");

      if ((_DWORD)v12 == 4)
      {
        -[VCAccessSpecifier associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v16, "isEqualToString:", v4);

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
  }

  return v5;
}

- (BOOL)allowHomeResidentShortcutRunning
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 8);
}

- (BOOL)allowWriteAccessForSleepWorkflows
{
  return -[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess")
      || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 32);
}

- (BOOL)allowReadAccessForSleepWorkflows
{
  return -[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess")
      || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 32);
}

- (BOOL)allowReadAccessForDonations
{
  return -[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess")
      || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 32);
}

- (BOOL)isSettingsApp
{
  void *v2;
  char v3;

  -[VCAccessSpecifier associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Preferences"));

  return v3;
}

- (BOOL)isSpringBoard
{
  void *v2;
  char v3;

  -[VCAccessSpecifier associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.springboard"));

  return v3;
}

- (BOOL)isRemovalService
{
  void *v2;
  char v3;

  -[VCAccessSpecifier bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.shortcuts.appremoval"));

  return v3;
}

- (BOOL)allowIntentsExtensionDiscovery
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 16);
}

- (BOOL)allowReadAccessForContextualActions
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 128);
}

- (BOOL)allowRootlessShortcutStorageAccess
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 512);
}

- (BOOL)allowReadingOnScreenContent
{
  return -[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess")
      || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 1024);
}

- (BOOL)allowResettingAutomationConfirmationLevel
{
  return -[VCAccessSpecifier allowUnrestrictedAccess](self, "allowUnrestrictedAccess")
      || -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 2048);
}

- (BOOL)isBackgroundShortcutRunner
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 4096);
}

- (BOOL)allowRunningTestHarnessTests
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 0x2000);
}

- (BOOL)allowDropletCreation
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 0x4000);
}

- (BOOL)allowStepwiseExecution
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 0x8000);
}

- (BOOL)allowVariableInjection
{
  return -[VCAccessSpecifier hasEntitlements:](self, "hasEntitlements:", 0x10000);
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (__SecTask)task
{
  return self->_task;
}

- (int64_t)sandboxCapabilities
{
  return self->_sandboxCapabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (id)accessSpecifierUnrestricted
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSecTask:auditToken:bundleIdentifier:associatedAppBundleIdentifier:entitlements:sandboxCapabilities:", 0, 0, 0, 0, 1, 0);
}

+ (id)accessSpecifierUnrestrictedWithAssociatedAppBundleIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSecTask:auditToken:bundleIdentifier:associatedAppBundleIdentifier:entitlements:sandboxCapabilities:", 0, 0, v6, v7, 1, 0);

  return v8;
}

+ (id)accessSpecifierFilteredForAssociatedAppBundleIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCAccessSpecifier.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("associatedAppBundleIdentifier"));

  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSecTask:auditToken:bundleIdentifier:associatedAppBundleIdentifier:entitlements:sandboxCapabilities:", 0, 0, v8, v7, 0, 0);

  return v9;
}

+ (id)accessSpecifierWithNoAccess
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSecTask:auditToken:bundleIdentifier:associatedAppBundleIdentifier:entitlements:sandboxCapabilities:", 0, 0, 0, 0, 0, 0);
}

+ (id)accessSpecifierWithNoAccessForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSecTask:auditToken:bundleIdentifier:associatedAppBundleIdentifier:entitlements:sandboxCapabilities:", 0, 0, v4, 0, 0, 0);

  return v5;
}

+ (id)accessSpecifierForCurrentConnection
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "accessSpecifierForXPCConnection:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
