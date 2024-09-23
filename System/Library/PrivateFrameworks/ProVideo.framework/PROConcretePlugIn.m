@implementation PROConcretePlugIn

- (PROConcretePlugIn)initWithDictionary:(id)a3 bundle:(id)a4 delegate:(id)a5
{
  return -[PROConcretePlugIn initWithDictionary:bundle:delegate:pluginKitPlug:](self, "initWithDictionary:bundle:delegate:pluginKitPlug:", a3, a4, a5, 0);
}

- (PROConcretePlugIn)initWithDictionary:(id)a3 bundle:(id)a4 delegate:(id)a5 pluginKitPlug:(id)a6
{
  PROConcretePlugIn *v10;
  const __CFString *v11;
  const __CFAllocator *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  uint64_t v25;
  const __CFString *v26;
  CFUUIDRef v27;
  CFUUIDRef v28;
  PROPlugInGroup *v29;
  void *v30;
  void *v31;
  PROPlugInDelegate *v32;
  objc_class *v33;
  const __CFString *v34;
  PROPlugInDelegate *v35;
  uint64_t v36;
  PROPlugInDelegate *delegate;
  objc_class *v38;
  PROConcretePlugIn *v39;
  uint64_t v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)PROConcretePlugIn;
  v10 = -[PROConcretePlugIn init](&v42, sel_init);
  if (!v10)
    return v10;
  v10->infoDictionary = (NSDictionary *)objc_msgSend(a3, "copy");
  v10->bundle = (NSBundle *)a4;
  v10->delegate = (PROPlugInDelegate *)a5;
  v10->pluginKitPlug = (PKPlugIn *)a6;
  v10->entirelyOutOfProcess = -[NSBundle objectForInfoDictionaryKey:](v10->bundle, "objectForInfoDictionaryKey:", CFSTR("PlugInKit")) != 0;
  v10->_isBlocked = 0;
  v11 = -[NSDictionary objectForKey:](v10->infoDictionary, "objectForKey:", CFSTR("uuid"));
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (!v11)
  {
    v10->uuidRef = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    delegate = v10->delegate;
    v38 = (objc_class *)objc_opt_class();
    v36 = MalformedKeyError((uint64_t)v10, (uint64_t)CFSTR("uuid"), v38, (uint64_t)v10->infoDictionary);
    v35 = delegate;
    goto LABEL_26;
  }
  v10->uuidRef = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11);
  v41 = 0;
  v13 = (objc_class *)objc_opt_class();
  if (!RequiredKeyIsPresent((uint64_t)v10, (uint64_t)CFSTR("uuid"), v13, a3, &v41))
    goto LABEL_24;
  v14 = (objc_class *)objc_opt_class();
  if (!RequiredKeyIsPresent((uint64_t)v10, (uint64_t)CFSTR("displayName"), v14, a3, &v41))
    goto LABEL_24;
  v15 = (objc_class *)objc_opt_class();
  if (!RequiredKeyIsPresent((uint64_t)v10, (uint64_t)CFSTR("className"), v15, a3, &v41))
    goto LABEL_24;
  v16 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, (uint64_t)CFSTR("group"), v16, a3, &v41))
    goto LABEL_24;
  v17 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, (uint64_t)CFSTR("protocolNames"), v17, a3, &v41))
    goto LABEL_24;
  v18 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, (uint64_t)CFSTR("infoString"), v18, a3, &v41))
    goto LABEL_24;
  v19 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, (uint64_t)CFSTR("iconFileName"), v19, a3, &v41))
    goto LABEL_24;
  v20 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, (uint64_t)CFSTR("helpURL"), v20, a3, &v41))
    goto LABEL_24;
  v21 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, (uint64_t)CFSTR("vendorName"), v21, a3, &v41))
    goto LABEL_24;
  v22 = (objc_class *)objc_opt_class();
  if ((OptionalKeyIsWellFormed((uint64_t)v10, (uint64_t)CFSTR("version"), v22, a3, &v41) & 1) == 0)
  {
    v23 = (objc_class *)objc_opt_class();
    if (!OptionalKeyIsWellFormed((uint64_t)v10, (uint64_t)CFSTR("version"), v23, a3, &v41))
      goto LABEL_24;
  }
  v24 = (objc_class *)objc_opt_class();
  if ((OptionalKeyIsWellFormed((uint64_t)v10, (uint64_t)CFSTR("stringsFileName"), v24, a3, &v41) & 1) == 0)
  {
LABEL_24:
    v35 = v10->delegate;
    v36 = v41;
    goto LABEL_26;
  }
  v25 = objc_msgSend(a3, "objectForKey:", CFSTR("group"));
  if (v25)
  {
    v26 = (const __CFString *)v25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = CFUUIDCreateFromString(v12, v26);
      if (v27)
      {
        v28 = v27;
        v29 = (PROPlugInGroup *)-[PROPlugInDelegate plugInGroupWithUUID:](v10->delegate, "plugInGroupWithUUID:", v27);
        v10->group = v29;
        -[PROPlugInGroup addPlugIn:](v29, "addPlugIn:", v10);
        CFRelease(v28);
        goto LABEL_19;
      }
    }
    v32 = v10->delegate;
    v33 = (objc_class *)objc_opt_class();
    v34 = CFSTR("group");
LABEL_29:
    v36 = MalformedKeyError((uint64_t)v10, (uint64_t)v34, v33, (uint64_t)a3);
    v35 = v32;
LABEL_26:
    -[PROPlugInDelegate plugInCouldNotInitialize:](v35, "plugInCouldNotInitialize:", v36);
    v39 = v10;
    return 0;
  }
LABEL_19:
  v30 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("protocolNames"));
  if (v30)
  {
    v31 = (void *)objc_msgSend(v30, "objectEnumerator");
    while (objc_msgSend(v31, "nextObject"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v32 = v10->delegate;
        v33 = (objc_class *)objc_opt_class();
        v34 = CFSTR("protocolNames");
        goto LABEL_29;
      }
    }
  }
  v10->localizationTableName = (NSString *)objc_msgSend(-[NSDictionary objectForKey:](v10->infoDictionary, "objectForKey:", CFSTR("stringsFileName")), "copy");
  return v10;
}

- (void)dealloc
{
  __CFUUID *uuidRef;
  objc_super v4;

  uuidRef = self->uuidRef;
  if (uuidRef)
    CFRelease(uuidRef);

  v4.receiver = self;
  v4.super_class = (Class)PROConcretePlugIn;
  -[PROConcretePlugIn dealloc](&v4, sel_dealloc);
}

- (id)bundle
{
  return self->bundle;
}

- (BOOL)isEqualToPlugIn:(id)a3
{
  __CFUUID *uuidRef;

  uuidRef = self->uuidRef;
  return uuidRef == (__CFUUID *)objc_msgSend(a3, "uuid");
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PROConcretePlugIn isEqualToPlugIn:](self, "isEqualToPlugIn:", a3);
  v6.receiver = self;
  v6.super_class = (Class)PROConcretePlugIn;
  return -[PROConcretePlugIn isEqual:](&v6, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  return (unint64_t)self->uuidRef >> 2;
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (PROPlugInDelegate *)a3;
}

- (id)pluginKitPlug
{
  return self->pluginKitPlug;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (id)blockedLookupKey
{
  return self->_blockedLookupKey;
}

- (void)setBlockedLookupKey:(id)a3 pluginName:(id)a4 version:(id)a5
{
  self->_blockedLookupKey = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingString:", a4), "stringByAppendingString:", a5);
}

- (__CFUUID)uuid
{
  return self->uuidRef;
}

- (id)uuidString
{
  return -[NSDictionary objectForKey:](self->infoDictionary, "objectForKey:", CFSTR("uuid"));
}

- (void)reportError:(id)a3
{
  -[PROPlugInDelegate plugIn:didError:](self->delegate, "plugIn:didError:", self, a3);
}

- (id)sharedPlugInInstance
{
  id result;

  result = self->sharedInstance;
  if (!result)
  {
    result = -[PROConcretePlugIn plugInInstance](self, "plugInInstance");
    self->sharedInstance = result;
  }
  return result;
}

- (id)className
{
  return -[NSDictionary objectForKey:](self->infoDictionary, "objectForKey:", CFSTR("className"));
}

- (Class)plugInClass
{
  char plugInFlags;
  NSString *v4;
  Class result;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  plugInFlags = (char)self->plugInFlags;
  if ((plugInFlags & 1) == 0)
  {
    if (!-[PROPlugInDelegate plugInShouldLoadPlugInInstanceForTheFirstTime:](self->delegate, "plugInShouldLoadPlugInInstanceForTheFirstTime:", self))return 0;
    plugInFlags = (char)self->plugInFlags;
  }
  *(_BYTE *)&self->plugInFlags = plugInFlags | 1;
  v4 = -[PROConcretePlugIn className](self, "className");
  v11 = 0;
  if (-[NSBundle loadAndReturnError:](self->bundle, "loadAndReturnError:", &v11))
  {
    result = NSClassFromString(v4);
    if (result)
      return result;
    v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", self, CFSTR("PROPlugIn"), v4, CFSTR("ClassName"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Plug-In failed to find the plug-in's class."), &stru_1E65EDDA0, CFSTR("PROPlug")), *MEMORY[0x1E0CB2D50], 0);
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = -601;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Plug-In failed to load bundle."), &stru_1E65EDDA0, CFSTR("PROPlug"));
    v6 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", self, CFSTR("PROPlugIn"), v10, *MEMORY[0x1E0CB2D50], v11, *MEMORY[0x1E0CB3388], 0);
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = -600;
  }
  -[PROConcretePlugIn reportError:](self, "reportError:", objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PROPlug"), v8, v6));
  return 0;
}

- (id)plugInInstance
{
  char plugInFlags;
  id result;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;

  plugInFlags = (char)self->plugInFlags;
  if ((plugInFlags & 1) == 0)
  {
    if (!-[PROPlugInDelegate plugInShouldLoadPlugInInstanceForTheFirstTime:](self->delegate, "plugInShouldLoadPlugInInstanceForTheFirstTime:", self))return 0;
    plugInFlags = (char)self->plugInFlags;
  }
  *(_BYTE *)&self->plugInFlags = plugInFlags | 1;
  result = -[PROConcretePlugIn plugInClass](self, "plugInClass");
  if (result)
  {
    v5 = (objc_class *)result;
    v6 = objc_msgSend(result, "instancesRespondToSelector:", sel_initWithAPIManager_)
       ? (id)objc_msgSend([v5 alloc], "initWithAPIManager:", -[PROPlugInDelegate apiManagerForPlugInInstances](self->delegate, "apiManagerForPlugInInstances")): objc_alloc_init(v5);
    result = v6;
    if (!result)
    {
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = -[NSDictionary objectForKey:](self->infoDictionary, "objectForKey:", CFSTR("className"));
      -[PROConcretePlugIn reportError:](self, "reportError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PROPlug"), -602, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", self, CFSTR("PROPlugIn"), v8, CFSTR("ClassName"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Plug-In failed create instance of its class."), &stru_1E65EDDA0,
              CFSTR("PROPlug")),
            *MEMORY[0x1E0CB2D50],
            0)));
      return 0;
    }
  }
  return result;
}

- (id)group
{
  return self->group;
}

- (id)displayName
{
  _BOOL4 entirelyOutOfProcess;
  NSBundle *bundle;
  id v5;
  const __CFString *localizationTableName;

  entirelyOutOfProcess = self->entirelyOutOfProcess;
  bundle = self->bundle;
  v5 = -[NSDictionary objectForKey:](self->infoDictionary, "objectForKey:", CFSTR("displayName"));
  if (entirelyOutOfProcess)
    localizationTableName = CFSTR("InfoPlist");
  else
    localizationTableName = (const __CFString *)self->localizationTableName;
  return -[NSBundle localizedStringForKey:value:table:](bundle, "localizedStringForKey:value:table:", v5, 0, localizationTableName);
}

- (id)helpURL
{
  id result;
  id v4;
  id v5;
  __CFString *v6;
  NSString *v7;

  result = self->helpURL;
  if (!result)
  {
    if ((*(_BYTE *)&self->plugInFlags & 4) != 0)
      return 0;
    *(_BYTE *)&self->plugInFlags |= 4u;
    v4 = -[NSDictionary objectForKey:](self->infoDictionary, "objectForKey:", CFSTR("helpURL"));
    if (!v4)
    {
      v5 = -[PROConcretePlugIn displayName](self, "displayName");
      goto LABEL_10;
    }
    v5 = v4;
    if (objc_msgSend(v4, "rangeOfString:", CFSTR("://")) == 0x7FFFFFFFFFFFFFFFLL
      || (result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "allocWithZone:", -[PROConcretePlugIn zone](self, "zone")), "initWithString:", v5), (self->helpURL = (NSURL *)result) == 0))
    {
      v6 = (__CFString *)objc_msgSend(v5, "pathExtension");
      if (-[__CFString length](v6, "length"))
      {
        v5 = (id)objc_msgSend(v5, "stringByDeletingPathExtension");
        goto LABEL_11;
      }
LABEL_10:
      v6 = CFSTR("html");
LABEL_11:
      v7 = -[NSBundle pathForResource:ofType:](self->bundle, "pathForResource:ofType:", v5, v6);
      if (v7)
      {
        result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "allocWithZone:", -[PROConcretePlugIn zone](self, "zone")), "initFileURLWithPath:", v7);
        self->helpURL = (NSURL *)result;
      }
      else
      {
        return self->helpURL;
      }
    }
  }
  return result;
}

- (id)version
{
  return -[NSBundle localizedStringForKey:value:table:](self->bundle, "localizedStringForKey:value:table:", -[NSDictionary objectForKey:](self->infoDictionary, "objectForKey:", CFSTR("version")), 0, self->localizationTableName);
}

- (id)infoString
{
  return -[NSBundle localizedStringForKey:value:table:](self->bundle, "localizedStringForKey:value:table:", -[NSDictionary objectForKey:](self->infoDictionary, "objectForKey:", CFSTR("infoString")), 0, self->localizationTableName);
}

- (id)vendorName
{
  return -[NSBundle localizedStringForKey:value:table:](self->bundle, "localizedStringForKey:value:table:", -[NSDictionary objectForKey:](self->infoDictionary, "objectForKey:", CFSTR("vendorName")), 0, self->localizationTableName);
}

- (id)description
{
  id result;
  objc_class *v3;

  result = -[PROConcretePlugIn displayName](self, "displayName");
  if (!result)
  {
    v3 = (objc_class *)objc_opt_class();
    return NSStringFromClass(v3);
  }
  return result;
}

- (id)implementedProtocols
{
  return -[NSDictionary objectForKey:](self->infoDictionary, "objectForKey:", CFSTR("protocolNames"));
}

- (id)infoDictionary
{
  return self->infoDictionary;
}

- (id)apiUsedByPlugInForProtocol:(id)a3
{
  return (id)-[PROPlugInDelegate apiForProtocol:](self->delegate, "apiForProtocol:", a3);
}

- (BOOL)is3rdParty
{
  return !-[NSString hasPrefix:](-[NSBundle bundleIdentifier](self->bundle, "bundleIdentifier"), "hasPrefix:", CFSTR("com.apple."));
}

@end
