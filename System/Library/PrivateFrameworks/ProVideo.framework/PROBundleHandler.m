@implementation PROBundleHandler

- (PROBundleHandler)initWithBundle:(id)a3
{
  return -[PROBundleHandler initWithBundle:actuallyLoad:](self, "initWithBundle:actuallyLoad:", a3, 1);
}

- (PROBundleHandler)initWithBundle:(id)a3 actuallyLoad:(BOOL)a4
{
  _BOOL4 v4;
  PROBundleHandler *v6;
  PROBundleHandler *v7;
  uint64_t v8;
  int v9;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PROBundleHandler;
  v6 = -[PROBundleHandler init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = -[PROBundleHandler zone](v6, "zone");
    v7->bundle = (NSBundle *)a3;
    v7->plugIns = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", v8), "init");
    v7->groups = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v8), "init");
    v7->deferralCompletionBlock = 0;
    v7->deferred = 0;
    if (v4)
      v9 = 4;
    else
      v9 = 0;
    v7->bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&v7->bundleFlags & 0xFFFFFFFB | v9);
    v7->apiAccessPoint = -[PROPlugInFirewall initWithProtectedObject:protocol:secondaryProtocol:errorHandler:]([PROPlugInFirewall alloc], "initWithProtectedObject:protocol:secondaryProtocol:errorHandler:", v7, &unk_1EF0A1C90, 0, v7);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PROBundleHandler;
  -[PROBundleHandler dealloc](&v3, sel_dealloc);
}

- (id)getBundle
{
  return self->bundle;
}

- (void)reportError:(id)a3
{
  -[PROBundleHandlerDelegate bundleHandler:didError:](self->delegate, "bundleHandler:didError:", self, a3);
}

- (BOOL)isEqualToBundleHandler:(id)a3
{
  return self->bundle == (NSBundle *)*((_QWORD *)a3 + 1);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[PROBundleHandler isEqualToBundleHandler:](self, "isEqualToBundleHandler:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return self->bundle == a3;
  v6.receiver = self;
  v6.super_class = (Class)PROBundleHandler;
  return -[PROBundleHandler isEqual:](&v6, sel_isEqual_, a3);
}

- (id)groupsDictionary
{
  return self->groups;
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (PROBundleHandlerDelegate *)a3;
}

- (id)apiManager
{
  return self->apiManager;
}

- (void)setAPIManager:(id)a3
{
  self->apiManager = (PROVersionedAPIAccess *)a3;
}

- (id)plugIns
{
  return self->plugIns;
}

- (BOOL)isPrincipalClassAvailable
{
  NSDictionary *v3;
  id v4;
  uint64_t v5;

  v3 = -[NSBundle infoDictionary](self->bundle, "infoDictionary");
  if (!v3
    || (v4 = -[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("PlugInKit"))) == 0
    || (v5 = objc_msgSend(v4, "objectForKey:", CFSTR("EmbeddedCode"))) != 0)
  {
    -[NSBundle principalClass](self->bundle, "principalClass");
    LOBYTE(v5) = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (id)principalClassInstance
{
  id result;
  objc_class *v4;
  objc_class *v5;
  PROPlugInRegistering *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;

  result = self->principalClassInstance;
  if (result)
    return result;
  v4 = -[NSBundle principalClass](self->bundle, "principalClass");
  if (!v4)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D80]);
    v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Bundle has no principal class specified."), &stru_1E65EDDA0, CFSTR("PROPlug")), *MEMORY[0x1E0CB2D50], self->bundle, CFSTR("NSBundle"), 0);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -502;
LABEL_12:
    -[PROBundleHandler reportError:](self, "reportError:", objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PROPlug"), v10, v8));

    return 0;
  }
  v5 = v4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = CFSTR("Bundle principal class does not responds to +sharedInstance!");
LABEL_11:
    v14 = objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E65EDDA0, CFSTR("PROPlug"));
    v8 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v14, *MEMORY[0x1E0CB2D50], self->bundle, CFSTR("NSBundle"), 0);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -503;
    goto LABEL_12;
  }
  v6 = -[objc_class sharedInstance](v5, "sharedInstance");
  self->principalClassInstance = v6;
  if (!v6)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = CFSTR("Failed creating an instance of bundle's principal class.");
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PROPlugInRegistering setAPIManager:](self->principalClassInstance, "setAPIManager:", self->apiAccessPoint);
  return self->principalClassInstance;
}

- (id)apiManagerForPlugInInstances
{
  return self->apiAccessPoint;
}

- (void)setRegistrationCallbackObject:(id)a3
{
  self->setupCallbackObject = (PROPluginDynamicRegCompletion *)a3;
}

- (BOOL)_plugInHasReservedUUID:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("7D976C6A-7F8E-11D9-AF6C-000A95DF1816"), CFSTR("4894A645-622C-4EAF-B886-8481FC54A9C9"), CFSTR("AD8AC810-D658-4444-94A6-B7C29767A90C"), 0);
  v5 = objc_msgSend((id)objc_msgSend(a3, "infoDictionary"), "objectForKey:", CFSTR("uuid"));
  if (v5)
    LOBYTE(v5) = objc_msgSend(v4, "containsObject:", v5);
  return v5;
}

- (void)addPlugIn:(id)a3
{
  PROBundleHandlerDelegate *delegate;

  delegate = self->delegate;
  if (!delegate
    || -[PROBundleHandlerDelegate bundleHandler:shouldAddPlugIn:](delegate, "bundleHandler:shouldAddPlugIn:", self, a3))
  {
    objc_msgSend((id)-[PROBundleHandler mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("plugIns")), "addObject:", a3);
    -[PROBundleHandlerDelegate bundleHandler:didAddPlugIn:](self->delegate, "bundleHandler:didAddPlugIn:", self, a3);
  }
}

- (void)registerDynamicPlugInsAsynch:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", a3);
  objc_msgSend(v4, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF0B6600));
  objc_msgSend(v4, "resume");
  v5 = (void *)objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_71);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__16;
  v12 = __Block_byref_object_dispose__16;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PROBundleHandler_registerDynamicPlugInsAsynch___block_invoke_91;
  v7[3] = &unk_1E6583758;
  v7[4] = &v14;
  v7[5] = &v8;
  objc_msgSend(v5, "dynamicRegGroupsAndPlugIns:", v7);
  v6 = 0;
  -[PROBundleHandler completeRegistrationWithGroups:plugIns:requestedProtocols:](self, "completeRegistrationWithGroups:plugIns:requestedProtocols:", v15 + 5, v9 + 5, &v6);

  -[PROPluginDynamicRegCompletion finishPluginSetupForBundle:handler:](self->setupCallbackObject, "finishPluginSetupForBundle:handler:", self->bundle, self);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
}

void __49__PROBundleHandler_registerDynamicPlugInsAsynch___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Lost synchronous connection with remote dynamic reg object due to error: %@"), a2);
}

id __49__PROBundleHandler_registerDynamicPlugInsAsynch___block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)dynamicPluginRequestedProtocolArray:(id *)a3 groupArray:(id *)a4 plugInArray:(id *)a5 actuallyLoad:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  if (!a6)
    return 1;
  v10 = -[PROBundleHandler principalClassInstance](self, "principalClassInstance");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = 0;
    *a3 = (id)objc_msgSend(v10, "requestedProtocolsWithError:", &v17);
    if (v17)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D80]);
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = CFSTR("Bundle failed dynamically registering requested protocols");
LABEL_12:
      v15 = objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E65EDDA0, CFSTR("PROPlug"));
      v16 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v15, *MEMORY[0x1E0CB2D50], self->bundle, CFSTR("NSBundle"), v17, *MEMORY[0x1E0CB3388], 0);
      -[PROBundleHandler reportError:](self, "reportError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PROPlug"), -505, v16));

      return 0;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = 0;
    *a4 = (id)objc_msgSend(v10, "registeredPlugInGroupsWithError:", &v17);
    if (v17)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D80]);
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = CFSTR("Bundle failed dynamically registering plug-in groups");
      goto LABEL_12;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = 0;
    *a5 = (id)objc_msgSend(v10, "registeredPlugInsWithError:", &v17);
    if (v17)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D80]);
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = CFSTR("Bundle failed dynamically registering plug-ins");
      goto LABEL_12;
    }
  }
  return 1;
}

- (void)completeRegistrationWithGroups:(id *)a3 plugIns:(id *)a4 requestedProtocols:(id *)a5
{
  char isKindOfClass;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFAllocator *v14;
  uint64_t v15;
  const __CFString *v16;
  CFUUIDRef v17;
  CFUUIDRef v18;
  PROPlugInGroup *v19;
  id v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  PROPlugIn *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _QWORD v40[5];

  if (!*a4)
    *a4 = -[NSBundle objectForInfoDictionaryKey:](self->bundle, "objectForInfoDictionaryKey:", CFSTR("ProPlugPlugInList"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99D80]);
    v21 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = CFSTR("Bundle's plug-in list should be an array, alas it is not.");
LABEL_51:
    v36 = objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_1E65EDDA0, CFSTR("PROPlug"));
    v39 = (id)objc_msgSend(v20, "initWithObjectsAndKeys:", v36, *MEMORY[0x1E0CB2D50], self->bundle, CFSTR("NSBundle"), 0);
    -[PROBundleHandler reportError:](self, "reportError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PROPlug"), -502, v39));

    return;
  }
  if (!*a3)
    *a3 = -[NSBundle objectForInfoDictionaryKey:](self->bundle, "objectForInfoDictionaryKey:", CFSTR("ProPlugPlugInGroupList"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = *a3;
  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "objectEnumerator");
    v38 = -[PROBundleHandler zone](self, "zone");
    v12 = objc_msgSend(v11, "nextObject");
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_17;
        v15 = objc_msgSend(v13, "objectForKey:", CFSTR("groupName"));
        v16 = (const __CFString *)objc_msgSend(v13, "objectForKey:", CFSTR("uuid"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_17;
        v17 = CFUUIDCreateFromString(v14, v16);
        v18 = v17;
        if (v17)
        {
          if (v15)
            break;
        }
        if (v17)
          goto LABEL_16;
LABEL_17:
        v13 = (void *)objc_msgSend(v11, "nextObject");
        if (!v13)
          goto LABEL_22;
      }
      if (!-[NSMutableDictionary objectForKey:](self->groups, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v17)))
      {
        v19 = -[PROPlugInGroup initWithUUID:name:bundle:](+[PROPlugInGroup allocWithZone:](PROPlugInGroup, "allocWithZone:", v38), "initWithUUID:name:bundle:", v18, v15, self->bundle);
        -[NSMutableDictionary setObject:forKey:](self->groups, "setObject:forKey:", v19, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v18));

      }
LABEL_16:
      CFRelease(v18);
      goto LABEL_17;
    }
    goto LABEL_22;
  }
  if (v10)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99D80]);
    v21 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = CFSTR("Bundle's plug-in group list should be an array, alas it is not.");
    goto LABEL_51;
  }
LABEL_22:
  if (!*a5)
    *a5 = -[NSBundle objectForInfoDictionaryKey:](self->bundle, "objectForInfoDictionaryKey:", CFSTR("ProPlugProtocolList"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(*a5, "objectEnumerator");
    while (1)
    {
      v24 = objc_msgSend(v23, "nextObject");
      if (!v24)
        break;
      v25 = (void *)v24;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = objc_alloc(MEMORY[0x1E0C99D80]);
        v21 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = CFSTR("Bundle's protocol list should contain dictionaries.");
        goto LABEL_51;
      }
      objc_msgSend(v25, "objectForKey:", CFSTR("protocolName"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = objc_alloc(MEMORY[0x1E0C99D80]);
        v21 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = CFSTR("Bundle's protocol list dictionaries need protocols names inside.");
        goto LABEL_51;
      }
      v26 = (void *)objc_msgSend(v25, "objectForKey:", CFSTR("versions"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = objc_alloc(MEMORY[0x1E0C99D80]);
        v21 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = CFSTR("Bundle's protocol list dictionaries need a version number array.");
        goto LABEL_51;
      }
      v27 = (void *)objc_msgSend(v26, "objectEnumerator");
      while (objc_msgSend(v27, "nextObject"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = objc_alloc(MEMORY[0x1E0C99D80]);
          v21 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v22 = CFSTR("Bundle's protocol list dictionaries need a version number list with numbers inside.");
          goto LABEL_51;
        }
      }

      v28 = (NSArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", -[PROBundleHandler zone](self, "zone")), "initWithArray:copyItems:", *a5, 1);
      self->requestedProtocols = v28;
      if ((-[PROVersionedAPIAccess validateProtocols:](self->apiManager, "validateProtocols:", v28) & 1) == 0)
      {
        v20 = objc_alloc(MEMORY[0x1E0C99D80]);
        v21 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = CFSTR("Bundle requests protocol that isn't available.");
        goto LABEL_51;
      }
    }
  }
  v29 = (void *)objc_msgSend(*a4, "objectEnumerator");
  v30 = -[PROBundleHandler zone](self, "zone");
  v31 = objc_msgSend(v29, "nextObject");
  if (v31)
  {
    v32 = v31;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = -[PROPlugIn initWithDictionary:bundle:delegate:pluginKitPlug:](+[PROPlugIn allocWithZone:](PROPlugIn, "allocWithZone:", v30), "initWithDictionary:bundle:delegate:pluginKitPlug:", v32, self->bundle, self, 0);
        if (v33)
        {
          v34 = (void *)-[PROBundleHandler mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("plugIns"));
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __78__PROBundleHandler_completeRegistrationWithGroups_plugIns_requestedProtocols___block_invoke;
          v40[3] = &unk_1E6583790;
          v40[4] = v33;
          v35 = objc_msgSend(v34, "indexOfObjectPassingTest:", v40);
          if (-[PROBundleHandler _plugInHasReservedUUID:](self, "_plugInHasReservedUUID:", v33))
          {
            NSLog(CFSTR("The UUID of the plug-in \"%@\" is reserved, and will not be registered. To correct this, edit the \"uuid\" entry in the plug-in's Info.plist file.\n"), -[PROPlugIn displayName](v33, "displayName"), v37);
          }
          else if (v35 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend((id)objc_msgSend(-[PROPlugIn infoDictionary](v33, "infoDictionary"), "objectForKey:", CFSTR("uuid")), "isEqualToString:", CFSTR("69B62B00-9245-4091-9FBC-B4FD82AA3385")))NSLog(CFSTR("Blocked plug-in UUID, skipping loading: %@, %@\n"), -[PROPlugIn uuid](v33, "uuid"), -[PROPlugIn displayName](v33, "displayName"));
            else
              -[PROBundleHandler addPlugIn:](self, "addPlugIn:", v33);
          }
          else
          {
            NSLog(CFSTR("Duplicate plug-in UUID, skipping loading: %@, %@\n"), -[PROPlugIn uuid](v33, "uuid"), -[PROPlugIn displayName](v33, "displayName"));
          }
        }

      }
      v32 = objc_msgSend(v29, "nextObject");
    }
    while (v32);
  }
}

BOOL __78__PROBundleHandler_completeRegistrationWithGroups_plugIns_requestedProtocols___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "uuid");
  return v3 == objc_msgSend(a2, "uuid");
}

- (BOOL)loadingInProMSRendererTool
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.ProMSRendererTool"));
}

- (BOOL)shouldDeferLoading
{
  return 0;
}

- (void)loadDeferredPlugins
{
  -[PROBundleHandler finishRegisteringPlugIns:](self, "finishRegisteringPlugIns:", 1);
}

- (void)setDeferralNotification:(id)a3
{
  self->deferralCompletionBlock = a3;
}

- (void)notifyDeferralComplete
{
  (*((void (**)(void))self->deferralCompletionBlock + 2))();
}

- (BOOL)isDeferred
{
  return self->deferred;
}

- (void)finishRegisteringPlugIns:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  float v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend((id)-[PROBundleHandler mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("plugIns")), "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->groups, "removeAllObjects");
  v5 = -[NSBundle objectForInfoDictionaryKey:](self->bundle, "objectForInfoDictionaryKey:", CFSTR("ProPlugDictionaryVersion"));
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v5, "floatValue"), v6 == 1.0))
  {
    v10 = 0;
    v8 = 0;
    v9 = 0;
    v7 = -[NSBundle objectForInfoDictionaryKey:](self->bundle, "objectForInfoDictionaryKey:", CFSTR("ProPlugDynamicRegistration"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend(v7, "BOOLValue")
      || -[PROBundleHandler dynamicPluginRequestedProtocolArray:groupArray:plugInArray:actuallyLoad:](self, "dynamicPluginRequestedProtocolArray:groupArray:plugInArray:actuallyLoad:", &v8, &v9, &v10, v3))
    {
      -[PROBundleHandler completeRegistrationWithGroups:plugIns:requestedProtocols:](self, "completeRegistrationWithGroups:plugIns:requestedProtocols:", &v9, &v10, &v8);
    }
  }
  else
  {
    -[PROBundleHandler reportError:](self, "reportError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PROPlug"), -502, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Bundle dictionary version is unsupported."), &stru_1E65EDDA0, CFSTR("PROPlug")), *MEMORY[0x1E0CB2D50], self->bundle, CFSTR("NSBundle"),
          0)));
  }
}

- (void)registerPlugIns
{
  -[PROBundleHandler registerAndLoadPlugIns:](self, "registerAndLoadPlugIns:", 1);
}

- (void)registerAndLoadPlugIns:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[PROBundleHandler shouldDeferLoading](self, "shouldDeferLoading"))
    -[PROBundleHandler finishRegisteringPlugIns:](self, "finishRegisteringPlugIns:", v3);
}

- (id)apiForProtocol:(id)a3
{
  const char *Name;
  NSEnumerator *v5;
  id v6;
  void *v7;
  id result;
  id v9;
  PROPlugInFirewall *v10;
  id v11;

  v11 = a3;
  Name = protocol_getName((Protocol *)a3);
  v5 = -[NSArray objectEnumerator](self->requestedProtocols, "objectEnumerator");
  do
  {
    v6 = -[NSEnumerator nextObject](v5, "nextObject");
    v7 = v6;
  }
  while (v6
       && !objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("protocolName")), "isEqualToString:", Name));
  result = (id)-[PROVersionedAPIAccess apiForProtocol:versions:](self->apiManager, "apiForProtocol:versions:", &v11, objc_msgSend(v7, "objectForKey:", CFSTR("versions")));
  if (result)
  {
    v9 = result;
    v10 = [PROPlugInFirewall alloc];
    return -[PROPlugInFirewall initWithProtectedObject:protocol:secondaryProtocol:errorHandler:](v10, "initWithProtectedObject:protocol:secondaryProtocol:errorHandler:", v9, v11, &unk_1EF0A0B68, self);
  }
  return result;
}

- (void)plugInFirewall:(id)a3 receivedBadMessage:(SEL)a4
{
  id v6;
  NSBundle *bundle;
  NSString *v8;
  id v9;

  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  bundle = self->bundle;
  v8 = NSStringFromSelector(a4);
  v9 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", bundle, CFSTR("NSBundle"), v8, CFSTR("Selector"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Plug-In instance sent bad message."), &stru_1E65EDDA0, CFSTR("PROPlug")), *MEMORY[0x1E0CB2D50], 0);
  -[PROBundleHandler reportError:](self, "reportError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PROPlug"), -603, v9));

}

- (void)plugIn:(id)a3 didError:(id)a4
{
  -[PROBundleHandler reportError:](self, "reportError:", a4);
}

- (id)plugInGroupWithUUID:(__CFUUID *)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->groups, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3));
}

- (BOOL)plugInShouldLoadPlugInInstanceForTheFirstTime:(id)a3
{
  $6F21F85482FEA2852DCE6121BD02F1B9 bundleFlags;
  id v4;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  bundleFlags = self->bundleFlags;
  if ((*(_BYTE *)&bundleFlags & 4) != 0)
  {
    if ((*(_BYTE *)&bundleFlags & 2) == 0)
    {
      if (!-[PROBundleHandler isPrincipalClassAvailable](self, "isPrincipalClassAvailable", a3))
      {
        *(_DWORD *)&self->bundleFlags |= 3u;
        LOBYTE(v4) = 1;
        return (char)v4;
      }
      v4 = -[PROBundleHandler principalClassInstance](self, "principalClassInstance");
      if (!v4)
      {
        self->bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&self->bundleFlags & 0xFFFFFFFC | 2);
        return (char)v4;
      }
      v6 = v4;
      v14 = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "shouldLoadFirstInstanceOfPlugInWithError:", &v14);
        v8 = v14;
        bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&self->bundleFlags & 0xFFFFFFFC | v7 | 2);
        self->bundleFlags = bundleFlags;
        if (v8)
        {
          self->bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&bundleFlags & 0xFFFFFFFE);
          v9 = objc_alloc(MEMORY[0x1E0C99D80]);
          v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Bundle failed dynamically registering plug-ins"), &stru_1E65EDDA0, CFSTR("PROPlug"));
          v11 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E0CB2D50], self->bundle, CFSTR("NSBundle"), v14, *MEMORY[0x1E0CB3388], 0);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PROPlug"), -505, v11);
          -[PROBundleHandler reportError:](self, "reportError:", v12);

          bundleFlags = self->bundleFlags;
        }
      }
      else
      {
        bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&self->bundleFlags | 3);
        self->bundleFlags = bundleFlags;
      }
    }
    LOBYTE(v4) = *(_BYTE *)&bundleFlags & 1;
    return (char)v4;
  }
  LOBYTE(v4) = 0;
  return (char)v4;
}

@end
