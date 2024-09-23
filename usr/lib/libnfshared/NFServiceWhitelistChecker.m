@implementation NFServiceWhitelistChecker

- (NSString)clientName
{
  return self->_clientName;
}

- (BOOL)internalAccess
{
  return self->_internalAccess;
}

- (id)_stringValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4
{
  void *v4;
  void *v5;
  CFTypeID v6;

  v4 = -[NFServiceWhitelistChecker _copyValueOfEntitlement:secTask:](self, "_copyValueOfEntitlement:secTask:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != CFStringGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

- (NFServiceWhitelistChecker)initWithConnection:(id)a3 coreNFCConnection:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v7;
  NFServiceWhitelistChecker *v8;
  int v9;
  uint64_t v10;
  NSString *clientName;
  uint64_t v12;
  NSMutableArray *iso15693TagAccessFilters;
  uint64_t v14;
  NSMutableOrderedSet *trustedISO7816AidList;
  const __CFAllocator *v16;
  SecTaskRef v17;
  SecTaskRef v18;
  BOOL v19;
  void *v20;
  char *v21;
  void *v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  NFServiceWhitelistChecker *v33;
  char *v34;
  void *specific;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  const char *v47;
  const char *ClassName;
  const char *v49;
  const char *Name;
  audit_token_t token;
  objc_super v52;
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  const __CFString *v62;
  _OWORD buffer[16];
  uint64_t v64;

  v4 = a4;
  v64 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v52.receiver = self;
  v52.super_class = (Class)NFServiceWhitelistChecker;
  v8 = -[NFServiceWhitelistChecker init](&v52, sel_init);
  if (!v8)
    goto LABEL_37;
  v9 = -[__CFString processIdentifier](v7, "processIdentifier");
  v8->_clientProcessIdentifier = v9;
  memset(buffer, 0, 255);
  proc_name(v9, buffer, 0xFEu);
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", buffer);
  clientName = v8->_clientName;
  v8->_clientName = (NSString *)v10;

  v12 = objc_opt_new();
  iso15693TagAccessFilters = v8->_iso15693TagAccessFilters;
  v8->_iso15693TagAccessFilters = (NSMutableArray *)v12;

  v14 = objc_opt_new();
  trustedISO7816AidList = v8->_trustedISO7816AidList;
  v8->_trustedISO7816AidList = (NSMutableOrderedSet *)v14;

  v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v7)
    -[__CFString auditToken](v7, "auditToken");
  else
    memset(&token, 0, sizeof(token));
  v17 = SecTaskCreateWithAuditToken(v16, &token);
  if (v17)
  {
    v18 = v17;
    v8->_internalAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.hwmanager"), v17);
    v8->_seshatAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.seshat"), v18);
    v8->_miniNVWriteAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.mininv.write"), v18);
    v8->_lpmFactoryTest = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.lpm.factorytest"), v18);
    v8->_remoteAdminAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.seld.tsmmanager"), v18);
    v19 = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.UIKit.vends-view-services"), v18);
    v8->_allowBackgroundedSession = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.internal.nfc.allow.backgrounded.session"), v18)&& v19;
    v8->_ignoreAppStateMonitor = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.internal.nfc.ignore.appstate"), v18);
    v8->_singleUserAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.singleUser"), v18);
    v8->_purpleTrustAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.session.trust"), v18);
    v8->_surfSessionAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.session.peerpayment"), v18);
    v8->_eCommerceAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.session.ecommerce"), v18);
    v8->_seSessionAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.session.se"), v18);
    v8->_seLoggingSessionAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.session.selogging"), v18);
    v8->_lpemConfigSessionAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.session.lpemConfig"), v18);
    v8->_readerInternalAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.session.reader.internal"), v18);
    v8->_cardModeAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.session.fieldOperations"), v18);
    v8->_hceAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.hce"), v18);
    v8->_radioToggle = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.radio.powertoggle"), v18);
    v8->_dontResetAssertion = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.assertion.dontreset"), v18);
    v8->_pollingProfileUpdate = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.session.reader.internal.update.polling.profile"), v18);
    v8->_bgTagReadingAssertion = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.assertion.tagreading"), v18);
    v8->_chAssertion = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.nfcd.assertion.handover"), v18);
    if (v4)
      -[NFServiceWhitelistChecker _initCoreNFCEntitlements:secTask:](v8, "_initCoreNFCEntitlements:secTask:", v7, v18);
    v8->_useUnfilteredApplets = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](v8, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.internal.nfc.use.unfiltered.applets"), v18);
    -[NFServiceWhitelistChecker _stringValueOfEntitlement:secTask:](v8, "_stringValueOfEntitlement:secTask:", CFSTR("application-identifier"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[NFServiceWhitelistChecker setApplicationIdentifier:](v8, "setApplicationIdentifier:", v20);
LABEL_36:
      CFRelease(v18);

LABEL_37:
      v33 = v8;
      goto LABEL_38;
    }
    v34 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v36 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v36)
      {
        Class = object_getClass(v8);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v8);
        Name = sel_getName(a2);
        v39 = 45;
        if (isMetaClass)
          v39 = 43;
        v36(6, "%c[%{public}s %{public}s]:%i Missing or invalid entitlement %{public}@ to be of type <string>, ignoring", v39, ClassName, Name, 353, CFSTR("application-identifier"));
        v34 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v40 = dispatch_get_specific(v34);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v41 = (id)_NFSharedLogClient[(_QWORD)v40];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = object_getClass(v8);
        if (class_isMetaClass(v42))
          v43 = 43;
        else
          v43 = 45;
        v44 = object_getClassName(v8);
        v45 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v54 = v43;
        v55 = 2082;
        v56 = v44;
        v57 = 2082;
        v58 = v45;
        v59 = 1024;
        v60 = 353;
        v61 = 2114;
        v62 = CFSTR("application-identifier");
        _os_log_impl(&dword_1C34DB000, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing or invalid entitlement %{public}@ to be of type <string>, ignoring", buf, 0x2Cu);
      }

      goto LABEL_36;
    }
LABEL_39:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v22 >= 4)
    goto LABEL_39;
  v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v22);
  if (v23)
  {
    v24 = object_getClass(v8);
    v25 = class_isMetaClass(v24);
    v47 = object_getClassName(v8);
    v49 = sel_getName(a2);
    v26 = 45;
    if (v25)
      v26 = 43;
    v23(3, "%c[%{public}s %{public}s]:%i Cannot create SecTaskRef with XPC Connection: %{public}@", v26, v47, v49, 314, v7);
    v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v27 = dispatch_get_specific(v21);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v28 = (id)_NFSharedLogClient[(_QWORD)v27];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = object_getClass(v8);
    if (class_isMetaClass(v29))
      v30 = 43;
    else
      v30 = 45;
    v31 = object_getClassName(v8);
    v32 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v54 = v30;
    v55 = 2082;
    v56 = v31;
    v57 = 2082;
    v58 = v32;
    v59 = 1024;
    v60 = 314;
    v61 = 2114;
    v62 = v7;
    _os_log_impl(&dword_1C34DB000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Cannot create SecTaskRef with XPC Connection: %{public}@", buf, 0x2Cu);
  }

  v33 = 0;
LABEL_38:

  return v33;
}

- (BOOL)_BOOLValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4
{
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;

  v4 = -[NFServiceWhitelistChecker _copyValueOfEntitlement:secTask:](self, "_copyValueOfEntitlement:secTask:", a3, a4);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFGetTypeID(v4);
  v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
  CFRelease(v5);
  return v7;
}

- (void)_copyValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4
{
  CFTypeRef v6;
  char *v7;
  void *specific;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  CFErrorRef error;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  CFErrorRef v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  error = 0;
  v6 = SecTaskCopyValueForEntitlement(a4, (CFStringRef)a3, &error);
  if (error)
  {
    v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v9)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Failed to get entitlements: %{public}@", v14, ClassName, Name, 65, error);
      v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v15 = dispatch_get_specific(v7);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v16 = (id)_NFSharedLogClient[(_QWORD)v15];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(self);
      v20 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v24 = v18;
      v25 = 2082;
      v26 = v19;
      v27 = 2082;
      v28 = v20;
      v29 = 1024;
      v30 = 65;
      v31 = 2114;
      v32 = error;
      _os_log_impl(&dword_1C34DB000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get entitlements: %{public}@", buf, 0x2Cu);
    }

    CFRelease(error);
  }
  return (void *)v6;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (BOOL)chAssertion
{
  return self->_chAssertion;
}

- (id)_arrayValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4
{
  void *v4;
  void *v5;
  CFTypeID v6;

  v4 = -[NFServiceWhitelistChecker _copyValueOfEntitlement:secTask:](self, "_copyValueOfEntitlement:secTask:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != CFArrayGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

- (id)_createAccessDictionaryFromICCode:(id)a3 serialNumber:(id)a4 maximumFilterStringLength:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v24;
  unsigned int v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789abcdefABCDEF*"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") <= 2)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "scanHexInt:", &v25);

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v13, "scanCharactersFromSet:intoString:", v10, &v24);
      v14 = v24;

      if (objc_msgSend(v14, "length") <= a5)
      {
        v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("*"));
        v16 = objc_msgSend(v14, "hasSuffix:", CFSTR("*"));
        v17 = v16;
        if (!v15 || (v16 & 1) == 0)
        {
          if ((v15 | v16) == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("*%@"), v19);

              v19 = (void *)v20;
            }
            if (v17)
            {
              v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@*"), v19);

            }
            else
            {
              v14 = v19;
            }
          }
          v26[0] = CFSTR("TagManufacturerCode");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v26[1] = CFSTR("TagSerialNumber");
          v27[0] = v21;
          v27[1] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addEntriesFromDictionary:", v22);

        }
      }

    }
  }

  return v9;
}

- (void)_initISO15693TagSpecifier:(id)a3
{
  -[NFServiceWhitelistChecker _initTagSpecifier:maximumFilterStringLength:](self, "_initTagSpecifier:maximumFilterStringLength:", a3, 12);
}

- (void)_initTagSpecifier:(id)a3 maximumFilterStringLength:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v6;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v8)
      goto LABEL_23;
    v9 = v8;
    v10 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "NF_stringForKey:", CFSTR("TagManufacturerCode"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "NF_stringForKey:", CFSTR("TagSerialNumber"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13)
            v16 = v14 == 0;
          else
            v16 = 1;
          if (v16)
          {

            v19 = 0;
          }
          else
          {
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v13, v14, 0);

LABEL_18:
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NFServiceWhitelistChecker _createAccessDictionaryFromICCode:serialNumber:maximumFilterStringLength:](self, "_createAccessDictionaryFromICCode:serialNumber:maximumFilterStringLength:", v20, v21, a4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v13, "count"))
              -[NSMutableArray addObject:](self->_iso15693TagAccessFilters, "addObject:", v13);
          }

          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = 0;
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(":"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "count") == 2)
          goto LABEL_18;
LABEL_21:

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v9)
      {
LABEL_23:

        v6 = v22;
        break;
      }
    }
  }

}

- (BOOL)_isAIDStringValid:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char *v9;
  void *specific;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  char *v20;
  void *v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;
  int v28;
  unint64_t v29;
  char v30;
  char *v31;
  void *v32;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  objc_class *v38;
  int v39;
  const char *ClassName;
  const char *v42;
  const char *v43;
  const char *Name;
  const char *v45;
  const char *v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3500];
  v6 = a3;
  objc_msgSend(v5, "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEF"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v8, "length") <= 9)
  {
    v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v11)
      {
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(5, "%c[%{public}s %{public}s]:%i Identifier string does not meet the minimum required length, %{public}@", v14, ClassName, Name, 195, v8);
        v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v15 = dispatch_get_specific(v9);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v16 = (id)_NFSharedLogClient[(_QWORD)v15];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67110146;
      v48 = v18;
      v49 = 2082;
      v50 = object_getClassName(self);
      v51 = 2082;
      v52 = sel_getName(a2);
      v53 = 1024;
      v54 = 195;
      v55 = 2114;
      v56 = v8;
      v19 = "%c[%{public}s %{public}s]:%i Identifier string does not meet the minimum required length, %{public}@";
LABEL_45:
      _os_log_impl(&dword_1C34DB000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x2Cu);
LABEL_46:

      v30 = 0;
      goto LABEL_47;
    }
    goto LABEL_49;
  }
  if ((unint64_t)objc_msgSend(v8, "length") >= 0x21)
  {
    v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v21 < 4)
    {
      v22 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v21);
      if (v22)
      {
        v23 = object_getClass(self);
        v24 = class_isMetaClass(v23);
        v42 = object_getClassName(self);
        v45 = sel_getName(a2);
        v25 = 45;
        if (v24)
          v25 = 43;
        v22(5, "%c[%{public}s %{public}s]:%i Identifier string exceeds the maximum length, %{public}@", v25, v42, v45, 198, v8);
        v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v26 = dispatch_get_specific(v20);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v16 = (id)_NFSharedLogClient[(_QWORD)v26];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
      v27 = object_getClass(self);
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      *(_DWORD *)buf = 67110146;
      v48 = v28;
      v49 = 2082;
      v50 = object_getClassName(self);
      v51 = 2082;
      v52 = sel_getName(a2);
      v53 = 1024;
      v54 = 198;
      v55 = 2114;
      v56 = v8;
      v19 = "%c[%{public}s %{public}s]:%i Identifier string exceeds the maximum length, %{public}@";
      goto LABEL_45;
    }
    goto LABEL_49;
  }
  if ((objc_msgSend(v8, "length") & 1) != 0)
  {
    v31 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v32 < 4)
    {
      v33 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v32);
      if (v33)
      {
        v34 = object_getClass(self);
        v35 = class_isMetaClass(v34);
        v43 = object_getClassName(self);
        v46 = sel_getName(a2);
        v36 = 45;
        if (v35)
          v36 = 43;
        v33(5, "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@", v36, v43, v46, 201, v8);
        v31 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v37 = dispatch_get_specific(v31);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v16 = (id)_NFSharedLogClient[(_QWORD)v37];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
      v38 = object_getClass(self);
      if (class_isMetaClass(v38))
        v39 = 43;
      else
        v39 = 45;
      *(_DWORD *)buf = 67110146;
      v48 = v39;
      v49 = 2082;
      v50 = object_getClassName(self);
      v51 = 2082;
      v52 = sel_getName(a2);
      v53 = 1024;
      v54 = 201;
      v55 = 2114;
      v56 = v8;
      v19 = "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@";
      goto LABEL_45;
    }
LABEL_49:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  if (objc_msgSend(v8, "length"))
  {
    v29 = 0;
    do
    {
      v30 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v29));
      if ((v30 & 1) == 0)
        break;
      ++v29;
    }
    while (v29 < objc_msgSend(v8, "length"));
  }
  else
  {
    v30 = 1;
  }
LABEL_47:

  return v30;
}

- (void)_initCoreNFCEntitlements:(id)a3 secTask:(__SecTask *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NFServiceWhitelistChecker getAppInfoDictionary](self, "getAppInfoDictionary", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "NF_stringForKey:", CFSTR("NFCReaderUsageDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    objc_storeStrong((id *)&self->_readerPurposeString, v5);
  v13 = v5;
  -[NFServiceWhitelistChecker _arrayValueOfEntitlement:secTask:](self, "_arrayValueOfEntitlement:secTask:", CFSTR("com.apple.developer.nfc.readersession.formats"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("NDEF")))
          {
            self->_ndefReaderAccess = 1;
          }
          else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ISO15693")))
          {
            -[NFServiceWhitelistChecker _arrayValueOfEntitlement:secTask:](self, "_arrayValueOfEntitlement:secTask:", CFSTR("com.apple.developer.nfc.readersession.iso15693.tag-identifiers"), a4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[NFServiceWhitelistChecker _initISO15693TagSpecifier:](self, "_initISO15693TagSpecifier:", v12);
            self->_iso15693ReaderAccess = 1;

          }
          else if (objc_msgSend(v11, "isEqualToString:", CFSTR("VAS")))
          {
            self->_vasReaderAccess = 1;
          }
          else if (objc_msgSend(v11, "isEqualToString:", CFSTR("TAG")))
          {
            *(_WORD *)&self->_ndefReaderAccess = 257;
          }
          else if (objc_msgSend(v11, "isEqualToString:", CFSTR("PACE")))
          {
            self->_tagReaderAccess = 1;
            self->_nfcTagReaderPACEPollingAllow = 1;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  -[NFServiceWhitelistChecker _initISO7816PermissibleAIDListWithSecTask:infoPlist:](self, "_initISO7816PermissibleAIDListWithSecTask:infoPlist:", a4, v14);
  -[NFServiceWhitelistChecker _initCardSessionEntitlementsWithSecTask:](self, "_initCardSessionEntitlementsWithSecTask:", a4);

}

- (void)_initISO7816PermissibleAIDListWithSecTask:(__SecTask *)a3 infoPlist:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NFServiceWhitelistChecker _arrayValueOfEntitlement:secTask:](self, "_arrayValueOfEntitlement:secTask:", CFSTR("com.apple.developer.nfc.readersession.iso7816.select-identifiers.trusted"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && -[NFServiceWhitelistChecker _isAIDStringValid:](self, "_isAIDStringValid:", v10))
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length") && (unint64_t)objc_msgSend(v11, "length") <= 0x10)
            -[NSMutableOrderedSet addObject:](self->_trustedISO7816AidList, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_initCardSessionEntitlementsWithSecTask:(__SecTask *)a3
{
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *nfcCardSessionAIDPrefixList;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  char *v15;
  void *specific;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  NSMutableOrderedSet *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  NSMutableOrderedSet *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  self->_nfcCardSessionAccess = -[NFServiceWhitelistChecker _BOOLValueOfEntitlement:secTask:](self, "_BOOLValueOfEntitlement:secTask:", CFSTR("com.apple.developer.nfc.hce"), a3);
  v6 = (NSMutableOrderedSet *)objc_opt_new();
  nfcCardSessionAIDPrefixList = self->_nfcCardSessionAIDPrefixList;
  self->_nfcCardSessionAIDPrefixList = v6;

  -[NFServiceWhitelistChecker _arrayValueOfEntitlement:secTask:](self, "_arrayValueOfEntitlement:secTask:", CFSTR("com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && -[NFServiceWhitelistChecker _isAIDStringValid:](self, "_isAIDStringValid:", v13))
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "length") && (unint64_t)objc_msgSend(v14, "length") <= 0x10)
            -[NSMutableOrderedSet addObject:](self->_nfcCardSessionAIDPrefixList, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    }
    while (v10);
  }
  if (self->_nfcCardSessionAccess && -[NSMutableOrderedSet count](self->_nfcCardSessionAIDPrefixList, "count"))
  {
    v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v17 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v17)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v22 = 45;
      if (isMetaClass)
        v22 = 43;
      v17(5, "%c[%{public}s %{public}s]:%i com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes={public}%@", v22, ClassName, Name, 290, self->_nfcCardSessionAIDPrefixList);
      v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v23 = dispatch_get_specific(v15);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v24 = (id)_NFSharedLogClient[(_QWORD)v23];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = object_getClass(self);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(self);
      v28 = sel_getName(a2);
      v29 = self->_nfcCardSessionAIDPrefixList;
      *(_DWORD *)buf = 67110146;
      v35 = v26;
      v36 = 2082;
      v37 = v27;
      v38 = 2082;
      v39 = v28;
      v40 = 1024;
      v41 = 290;
      v42 = 2112;
      v43 = v29;
      _os_log_impl(&dword_1C34DB000, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes={public}%@", buf, 0x2Cu);
    }

  }
}

- (NFServiceWhitelistChecker)initWithConnection:(id)a3
{
  return -[NFServiceWhitelistChecker initWithConnection:coreNFCConnection:](self, "initWithConnection:coreNFCConnection:", a3, 0);
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_clientName, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v6;

    *(_BYTE *)(v5 + 65) = self->_internalAccess;
    *(_BYTE *)(v5 + 60) = self->_iso15693ReaderAccess;
    *(_BYTE *)(v5 + 66) = self->_seshatAccess;
    *(_BYTE *)(v5 + 67) = self->_miniNVWriteAccess;
    *(_BYTE *)(v5 + 68) = self->_lpmFactoryTest;
    *(_BYTE *)(v5 + 69) = self->_remoteAdminAccess;
    v8 = -[NSMutableArray copyWithZone:](self->_iso15693TagAccessFilters, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v8;

    *(_BYTE *)(v5 + 62) = self->_ndefReaderAccess;
    v10 = -[NSString copyWithZone:](self->_readerPurposeString, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    *(_BYTE *)(v5 + 70) = self->_allowBackgroundedSession;
    *(_BYTE *)(v5 + 71) = self->_ignoreAppStateMonitor;
    *(_BYTE *)(v5 + 61) = self->_vasReaderAccess;
    v12 = -[NSString copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    v14 = -[NSMutableOrderedSet copyWithZone:](self->_trustedISO7816AidList, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v14;

    *(_BYTE *)(v5 + 63) = self->_tagReaderAccess;
    *(_DWORD *)(v5 + 56) = self->_clientProcessIdentifier;
    *(_BYTE *)(v5 + 86) = self->_dontResetAssertion;
    *(_BYTE *)(v5 + 74) = self->_singleUserAccess;
    *(_BYTE *)(v5 + 75) = self->_purpleTrustAccess;
    *(_BYTE *)(v5 + 76) = self->_surfSessionAccess;
    *(_BYTE *)(v5 + 77) = self->_eCommerceAccess;
    *(_BYTE *)(v5 + 78) = self->_seSessionAccess;
    *(_BYTE *)(v5 + 79) = self->_seLoggingSessionAccess;
    *(_BYTE *)(v5 + 80) = self->_lpemConfigSessionAccess;
    *(_BYTE *)(v5 + 81) = self->_readerInternalAccess;
    *(_BYTE *)(v5 + 82) = self->_cardModeAccess;
    *(_BYTE *)(v5 + 83) = self->_hceAccess;
    *(_BYTE *)(v5 + 84) = self->_radioToggle;
    *(_BYTE *)(v5 + 85) = self->_pollingProfileUpdate;
    *(_BYTE *)(v5 + 73) = self->_useUnfilteredApplets;
    *(_BYTE *)(v5 + 72) = self->_nfcTagReaderPACEPollingAllow;
    *(_BYTE *)(v5 + 87) = self->_bgTagReadingAssertion;
    *(_BYTE *)(v5 + 88) = self->_chAssertion;
    *(_BYTE *)(v5 + 64) = self->_nfcCardSessionAccess;
    v16 = -[NSMutableOrderedSet copyWithZone:](self->_nfcCardSessionAIDPrefixList, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v16;

  }
  return (id)v5;
}

- (unsigned)validateISO15693TagAcesssWithUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  unsigned int v9;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  if (objc_msgSend(v4, "length") == 8 && *(unsigned __int8 *)(v5 + 7) == 224)
  {
    if (-[NSMutableArray count](self->_iso15693TagAccessFilters, "count"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 6);
      v7 = *(unsigned __int8 *)(v5 + 6);
      for (i = 5; i != -1; --i)
        objc_msgSend(v6, "appendBytes:length:", v5 + i, 1);
      v9 = -[NFServiceWhitelistChecker validateISO15693TagAccessWithManufacturerCode:serialNumber:](self, "validateISO15693TagAccessWithManufacturerCode:serialNumber:", v7, v6);

    }
    else
    {
      v9 = 27;
    }
  }
  else
  {
    v9 = 10;
  }

  return v9;
}

- (unsigned)validateISO15693TagAccessWithManufacturerCode:(unint64_t)a3 serialNumber:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unsigned int v20;
  NSMutableArray *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "NF_asHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = self->_iso15693TagAccessFilters;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TagManufacturerCode"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        if (v13 != a3)
          goto LABEL_19;
        objc_msgSend(v11, "NF_stringForKey:", CFSTR("TagSerialNumber"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "hasPrefix:", CFSTR("*")))
        {
          objc_msgSend(v14, "substringWithRange:", 1, objc_msgSend(v14, "length") - 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");
          if (v16 <= objc_msgSend(v6, "length"))
          {
            objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v6, "length") - objc_msgSend(v15, "length"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "caseInsensitiveCompare:", v15);

            goto LABEL_17;
          }
        }
        else
        {
          if (!objc_msgSend(v14, "hasSuffix:", CFSTR("*")))
          {
            if (!objc_msgSend(v6, "caseInsensitiveCompare:", v14))
              goto LABEL_23;
            goto LABEL_18;
          }
          objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "length") - 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v15, "length");
          if (v19 <= objc_msgSend(v6, "length"))
          {
            v18 = objc_msgSend(v6, "compare:options:range:", v15, 1, 0, objc_msgSend(v15, "length"));
LABEL_17:

            if (!v18)
            {
LABEL_23:

              v20 = 0;
              goto LABEL_24;
            }
            goto LABEL_18;
          }
        }

LABEL_18:
LABEL_19:
        if (v8 == ++v10)
        {
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }
    v20 = 32;
LABEL_24:

  }
  else
  {
    v20 = 10;
  }

  return v20;
}

- (unsigned)validateISO15693TagAccessWithManufacturerCode:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_iso15693TagAccessFilters;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("TagManufacturerCode"), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "unsignedIntegerValue");

        if (v10 == a3)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 32;
LABEL_11:

  return v11;
}

- (id)getAppInfoDictionary
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  const __CFURL *v6;
  void *v7;
  _BYTE buffer[4096];
  uint64_t v10;

  v2 = MEMORY[0x1E0C80A78](self, a2);
  v10 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x1000uLL);
  v3 = proc_pidpath(*(_DWORD *)(v2 + 56), buffer, 0x1000u);
  if (v3 < 1)
    goto LABEL_8;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v3, 4);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v7 = CFBundleCopyInfoDictionaryForURL((CFURLRef)v5)) == 0)
  {
    if (v6)
      v7 = CFBundleCopyInfoDictionaryInDirectory(v6);
    else
      v7 = 0;
  }

  if (!v7)
LABEL_8:
    v7 = (void *)objc_opt_new();
  return v7;
}

- (double)sessionTimeLimit
{
  double v3;
  void *v6;
  int v7;
  char *v8;
  void *specific;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_iso15693ReaderAccess
    || self->_ndefReaderAccess
    || self->_vasReaderAccess
    || self->_tagReaderAccess
    || self->_nfcCardSessionAccess)
  {
    return 60.0;
  }
  v3 = 0.0;
  if (!self->_internalAccess)
    return v3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("BurnoutTimerDisable"));

  if (!v7)
    return 60.0;
  v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4)
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v10 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
  if (v10)
  {
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i Disabled", v14, ClassName, Name, 514);
    v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v15 = dispatch_get_specific(v8);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v16 = (id)_NFSharedLogClient[(_QWORD)v15];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    *(_DWORD *)buf = 67109890;
    v21 = v18;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 514;
    _os_log_impl(&dword_1C34DB000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disabled", buf, 0x22u);
  }

  return v3;
}

- (BOOL)nfcISO15693ReaderAccess
{
  return self->_iso15693ReaderAccess && -[NSMutableArray count](self->_iso15693TagAccessFilters, "count") != 0;
}

- (BOOL)nfcVASReaderAccess
{
  return self->_vasReaderAccess;
}

- (BOOL)nfcNDEFReaderAccess
{
  return self->_ndefReaderAccess;
}

- (BOOL)externalReaderAccessAllow
{
  _BOOL4 v3;

  if (-[NFServiceWhitelistChecker nfcNDEFReaderAccess](self, "nfcNDEFReaderAccess")
    || -[NFServiceWhitelistChecker nfcISO15693ReaderAccess](self, "nfcISO15693ReaderAccess")
    || -[NFServiceWhitelistChecker nfcTagReaderAccess](self, "nfcTagReaderAccess")
    || (v3 = -[NFServiceWhitelistChecker nfcVASReaderAccess](self, "nfcVASReaderAccess")))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)nfcTagReaderAccess
{
  return self->_tagReaderAccess;
}

- (NSOrderedSet)trustedISO7816AidList
{
  return (NSOrderedSet *)self->_trustedISO7816AidList;
}

- (id)_stringFromArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    while (1)
    {
      if (v5)
        objc_msgSend(v4, "appendString:", CFSTR(", "));
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@"), v7);
        goto LABEL_9;
      }
LABEL_10:

      if (objc_msgSend(v3, "count") <= (unint64_t)++v5)
        goto LABEL_11;
    }
    objc_msgSend(v6, "NF_asHexString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v7);
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(v4, "appendString:", CFSTR("]"));

  return v4;
}

- (id)_stringFromISO15693AccessFilterList
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
  if (-[NSMutableArray count](self->_iso15693TagAccessFilters, "count"))
  {
    v4 = 0;
    do
    {
      if (v4)
        objc_msgSend(v3, "appendString:", CFSTR(", "));
      -[NSMutableArray objectAtIndexedSubscript:](self->_iso15693TagAccessFilters, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TagManufacturerCode"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_iso15693TagAccessFilters, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TagSerialNumber"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("{%@=%@, %@=%@}"), CFSTR("TagManufacturerCode"), v6, CFSTR("TagSerialNumber"), v8);

      ++v4;
    }
    while (-[NSMutableArray count](self->_iso15693TagAccessFilters, "count") > v4);
  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Application Identifier: %@"), self->_applicationIdentifier);
  objc_msgSend(v3, "addObject:", v4);

  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_ndefReaderAccess)
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("NDEF: %@"), v6);
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PollingProfileUpdate: %d"), self->_pollingProfileUpdate);
  objc_msgSend(v3, "addObject:", v8);

  if (-[NSMutableArray count](self->_iso15693TagAccessFilters, "count"))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NFServiceWhitelistChecker _stringFromISO15693AccessFilterList](self, "_stringFromISO15693AccessFilterList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("Legacy ISO15693 filter List=%@"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  if (-[NSMutableOrderedSet count](self->_trustedISO7816AidList, "count"))
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSMutableOrderedSet array](self->_trustedISO7816AidList, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFServiceWhitelistChecker _stringFromArray:](self, "_stringFromArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("ISO7816 Set=%@"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_vasReaderAccess)
    v17 = CFSTR("Y");
  else
    v17 = CFSTR("N");
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("VAS: %@"), v17);
  objc_msgSend(v3, "addObject:", v18);

  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_tagReaderAccess)
    v20 = CFSTR("Y");
  else
    v20 = CFSTR("N");
  v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("TAG: %@"), v20);
  objc_msgSend(v3, "addObject:", v21);

  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_nfcTagReaderPACEPollingAllow)
    v23 = CFSTR("Y");
  else
    v23 = CFSTR("N");
  v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("PACEPoll: %@"), v23);
  objc_msgSend(v3, "addObject:", v24);

  v25 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_nfcCardSessionAccess)
    v26 = CFSTR("Y");
  else
    v26 = CFSTR("N");
  v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("CardSession: %@"), v26);
  objc_msgSend(v3, "addObject:", v27);

  v28 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSMutableOrderedSet array](self->_nfcCardSessionAIDPrefixList, "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFServiceWhitelistChecker _stringFromArray:](self, "_stringFromArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("CardSessionAIDPrefixList: %@"), v30);
  objc_msgSend(v3, "addObject:", v31);

  objc_msgSend(v3, "description");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (BOOL)nfcCardSessionAccess
{
  return self->_nfcCardSessionAccess;
}

- (NSOrderedSet)nfcCardSessionAIDPrefixList
{
  return (NSOrderedSet *)self->_nfcCardSessionAIDPrefixList;
}

- (NSString)readerPurposeString
{
  return self->_readerPurposeString;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (BOOL)seshatAccess
{
  return self->_seshatAccess;
}

- (BOOL)miniNVWriteAccess
{
  return self->_miniNVWriteAccess;
}

- (BOOL)lpmFactoryTest
{
  return self->_lpmFactoryTest;
}

- (BOOL)remoteAdminAccess
{
  return self->_remoteAdminAccess;
}

- (BOOL)allowBackgroundedSession
{
  return self->_allowBackgroundedSession;
}

- (BOOL)ignoreAppStateMonitor
{
  return self->_ignoreAppStateMonitor;
}

- (BOOL)nfcTagReaderPACEPollingAllow
{
  return self->_nfcTagReaderPACEPollingAllow;
}

- (BOOL)useUnfilteredApplets
{
  return self->_useUnfilteredApplets;
}

- (BOOL)singleUserAccess
{
  return self->_singleUserAccess;
}

- (BOOL)purpleTrustAccess
{
  return self->_purpleTrustAccess;
}

- (BOOL)surfSessionAccess
{
  return self->_surfSessionAccess;
}

- (BOOL)eCommerceAccess
{
  return self->_eCommerceAccess;
}

- (BOOL)seSessionAccess
{
  return self->_seSessionAccess;
}

- (BOOL)seLoggingSessionAccess
{
  return self->_seLoggingSessionAccess;
}

- (BOOL)lpemConfigSessionAccess
{
  return self->_lpemConfigSessionAccess;
}

- (BOOL)readerInternalAccess
{
  return self->_readerInternalAccess;
}

- (BOOL)cardModeAccess
{
  return self->_cardModeAccess;
}

- (BOOL)hceAccess
{
  return self->_hceAccess;
}

- (BOOL)radioToggle
{
  return self->_radioToggle;
}

- (BOOL)pollingProfileUpdate
{
  return self->_pollingProfileUpdate;
}

- (BOOL)dontResetAssertion
{
  return self->_dontResetAssertion;
}

- (BOOL)bgTagReadingAssertion
{
  return self->_bgTagReadingAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_readerPurposeString, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_nfcCardSessionAIDPrefixList, 0);
  objc_storeStrong((id *)&self->_trustedISO7816AidList, 0);
  objc_storeStrong((id *)&self->_iso15693TagAccessFilters, 0);
}

@end
