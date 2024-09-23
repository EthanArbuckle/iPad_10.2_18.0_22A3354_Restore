@implementation SUScriptDevice

- (SUScriptDevice)init
{
  SUScriptDevice *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptDevice;
  v2 = -[SUScriptObject init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__autoDownloadKindsChangedNotification_, *MEMORY[0x24BEB21D8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessibilitySettingsChangedNotification_, *MEMORY[0x24BDF7200], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessibilitySettingsChangedNotification_, *MEMORY[0x24BDF7230], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessibilitySettingsChangedNotification_, *MEMORY[0x24BDF7448], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessibilitySettingsChangedNotification_, *MEMORY[0x24BDF7318], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessibilitySettingsChangedNotification_, *MEMORY[0x24BDF7338], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessibilitySettingsChangedNotification_, *MEMORY[0x24BDF7440], 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB21D8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7200], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7230], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7448], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7318], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7338], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7440], 0);
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_scriptFunctions, "makeObjectsPerformSelector:withObject:", sel_setThisObject_, 0);

  v4.receiver = self;
  v4.super_class = (Class)SUScriptDevice;
  -[SUScriptObject dealloc](&v4, sel_dealloc);
}

- (int64_t)BOOLValueForRestriction:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection"), "effectiveBoolValueForSetting:", a3);
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  return 0;
}

- (id)checkCapabilitiesPropertyListString:(id)a3 showFailureDialog:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  int v8;
  id *v9;
  id v11;

  v4 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v7 = SUScriptPropertyListFromString(a3);
  if (v7)
  {
    v11 = 0;
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance"), "checkCapabilities:withMismatches:", v7, &v11);
    if ((v8 & 1) == 0 && v4)
      WebThreadRunOnMainThread();

    v9 = (id *)MEMORY[0x24BDBD270];
    if (!v8)
      v9 = (id *)MEMORY[0x24BDBD268];
  }
  else
  {

    v9 = (id *)MEMORY[0x24BDBD268];
  }
  return *v9;
}

void __72__SUScriptDevice_checkCapabilitiesPropertyListString_showFailureDialog___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8C18]), "initWithRequiredCapabilities:mismatches:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v1);

}

- (id)getMachineIdentifierForAccountIdentifier:(id)a3
{
  uint64_t v4;
  SUScriptDictionary *v5;
  id v6;
  id v8;
  id v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(a3, "unsignedLongLongValue"));
  else
    v4 = 0;
  v9 = 0;
  v5 = 0;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice", 0), "getMachineIdentifier:otp:forAccountIdentifier:", &v9, &v8, v4))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v9)
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v9, "base64EncodedStringWithOptions:", 0), CFSTR("mid"));
    if (v8)
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v8, "base64EncodedStringWithOptions:", 0), CFSTR("otp"));
    v5 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v6);

  }
  return v5;
}

- (id)hasCapability:(id)a3
{
  id *v5;
  int64_t v6;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  CFTypeID v10;
  int Value;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameEmail](self, "capabilityNameEmail")))
    {
      if (!CPCanSendMail())
        goto LABEL_6;
LABEL_13:
      v5 = (id *)MEMORY[0x24BDBD270];
      return *v5;
    }
    if (objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameExplicitMedia](self, "capabilityNameExplicitMedia")))
    {
      if ((SSRestrictionsShouldRestrictExplicitContent() & 1) == 0)
        goto LABEL_13;
    }
    else
    {
      if ((objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNamePodcasts](self, "capabilityNamePodcasts")) & 1) != 0)goto LABEL_13;
      v6 = -[SUScriptDevice _deviceCapabilityForString:](self, "_deviceCapabilityForString:", a3);
      if (v6 == -1)
      {
        v8 = (const __CFBoolean *)MGCopyAnswer();
        if (v8)
        {
          v9 = v8;
          v10 = CFGetTypeID(v8);
          if (v10 == CFBooleanGetTypeID())
          {
            Value = CFBooleanGetValue(v9);
            CFRelease(v9);
            if (!Value)
              goto LABEL_6;
            goto LABEL_13;
          }
          CFRelease(v9);
        }
      }
      else if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "supportsDeviceCapability:", v6) & 1) != 0)
      {
        goto LABEL_13;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
LABEL_6:
  v5 = (id *)MEMORY[0x24BDBD268];
  return *v5;
}

- (id)isRestrictionLockedDown:(id)a3
{
  int v4;
  id *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection"), "isBoolSettingLockedDownByRestrictions:", a3);
    v5 = (id *)MEMORY[0x24BDBD270];
    if (!v4)
      v5 = (id *)MEMORY[0x24BDBD268];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v5 = (id *)MEMORY[0x24BDBD268];
  }
  return *v5;
}

- (void)requestFreeSpaceWithBytes:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  SUScriptFunction *v9;
  char isKindOfClass;
  id v11;
  uint64_t v12;
  void *v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = 0;
    if (a5 && (isKindOfClass & 1) == 0)
      v9 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a5);
  }
  -[SUScriptDevice _addScriptFunction:](self, "_addScriptFunction:", v9);
  if (a4)
    a4 = (id)objc_msgSend(a4, "safeValueForKey:", -[SUScriptDevice freeSpaceOptionEffortLevel](self, "freeSpaceOptionEffortLevel"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_alloc(MEMORY[0x24BDBCE70]);
    v12 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a4, "intValue"));
    v13 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v12, *MEMORY[0x24BE047C0], 0);
  }
  else
  {
    v13 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "unsignedLongLongValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      strtoull((const char *)objc_msgSend(a3, "UTF8String"), 0, 10);
  }
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock();

}

uint64_t __70__SUScriptDevice_requestFreeSpaceWithBytes_options_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2 != 0);
  objc_msgSend(v5, "callWithArguments:", objc_msgSend(v6, "arrayWithObjects:", v7, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3), 0));
  return objc_msgSend(*(id *)(a1 + 40), "_removeScriptFunction:", *(_QWORD *)(a1 + 32));
}

- (id)restrictionLevelForType:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", -[SUScriptDevice restrictionTypeApplications](self, "restrictionTypeApplications"))|| objc_msgSend(a3, "isEqual:", -[SUScriptDevice restrictionTypeMovies](self, "restrictionTypeMovies"))|| objc_msgSend(a3, "isEqual:", -[SUScriptDevice restrictionTypeTelevision](self, "restrictionTypeTelevision")))
  {
    return (id)SSRestrictionsCopyRankForMediaType();
  }
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  return 0;
}

- (void)setAutomaticDownloadKinds:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  v7 = objc_msgSend(a3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
  if (v7)
  {
    v8 = (void *)v7;
    if (a4)
      a4 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a4);
    -[SUScriptDevice _addScriptFunction:](self, "_addScriptFunction:", a4);
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
    v10 = objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __66__SUScriptDevice_setAutomaticDownloadKinds_withCompletionHandler___block_invoke;
    v11[3] = &unk_24DE7CE08;
    v11[4] = a4;
    v11[5] = self;
    objc_msgSend(v9, "setAutomaticDownloadKinds:withCompletionBlock:", v10, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __66__SUScriptDevice_setAutomaticDownloadKinds_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2)));
  return objc_msgSend(*(id *)(a1 + 40), "_removeScriptFunction:", *(_QWORD *)(a1 + 32));
}

- (void)setValueForRestriction:(id)a3 enabled:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection"), "setBoolValue:forSetting:", objc_msgSend(a4, "BOOLValue"), a3);
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (id)UTIForURL:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3)) != 0)
  {
    v5 = v4;
    v6 = (id)SUCopyUTIForFilePath((void *)objc_msgSend(v4, "path"), 1);

    return (id)v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    return 0;
  }
}

- (id)valueForRestriction:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection"), "effectiveValueForSetting:", a3);
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  return 0;
}

- (id)accessibilityBoldTextEnabled
{
  _BOOL4 IsBoldTextEnabled;
  id *v3;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!IsBoldTextEnabled)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)accessibilityButtonShapesEnabled
{
  int v2;
  id *v3;

  v2 = _UIAccessibilityButtonShapesEnabled();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)accessibilityDarkenSystemColors
{
  _BOOL4 v2;
  id *v3;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)accessibilityEnhanceBackgroundContrast
{
  _BOOL4 IsReduceTransparencyEnabled;
  id *v3;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!IsReduceTransparencyEnabled)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)accessibilityMotionAutoPlayVideo
{
  _BOOL4 IsVideoAutoplayEnabled;
  id *v3;

  IsVideoAutoplayEnabled = UIAccessibilityIsVideoAutoplayEnabled();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!IsVideoAutoplayEnabled)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)accessibilitySingleColorSelected
{
  int IsSingleColorSelected;
  id *v3;

  IsSingleColorSelected = _UIAccessibilityIsSingleColorSelected();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!IsSingleColorSelected)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (SUScriptColor)accessibilitySingleColor
{
  return -[SUScriptColor initWithUIColor:]([SUScriptColor alloc], "initWithUIColor:", _UIAccessibilitySingleSystemColor());
}

- (id)accessibilityUseDarkerKeyboard
{
  int v2;
  id *v3;

  v2 = _UIAccessibilityUseDarkerKeyboard();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (int64_t)activeNetworkType
{
  uint64_t v3;
  int64_t result;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "networkType");
  switch(v3)
  {
    case 1:
      result = -[SUScriptDevice networkType2G](self, "networkType2G");
      break;
    case 2:
      result = -[SUScriptDevice networkType3G](self, "networkType3G");
      break;
    case 3:
      result = -[SUScriptDevice networkType4G](self, "networkType4G");
      break;
    case 4:
      result = -[SUScriptDevice networkType5G](self, "networkType5G");
      break;
    case 5:
      result = -[SUScriptDevice networkType6G](self, "networkType6G");
      break;
    case 6:
      result = -[SUScriptDevice networkType7G](self, "networkType7G");
      break;
    case 7:
      result = -[SUScriptDevice networkType8G](self, "networkType8G");
      break;
    case 8:
      result = -[SUScriptDevice networkType9G](self, "networkType9G");
      break;
    default:
      if (v3 == 1000)
        result = -[SUScriptDevice networkTypeWiFi](self, "networkTypeWiFi");
      else
        result = -[SUScriptDevice networkTypeNone](self, "networkTypeNone");
      break;
  }
  return result;
}

- (NSArray)automaticDownloadMediaTypes
{
  return (NSArray *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "automaticDownloadKinds"), "allObjects"), "sortedArrayUsingSelector:", sel_compare_);
}

- (id)_className
{
  return CFSTR("iTunesDevice");
}

- (unsigned)deviceTypeIdentifier
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "deviceTypeIdentifier");
}

- (NSNumber)diskSpaceAvailable
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSNumber *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__38;
  v13 = __Block_byref_object_dispose__38;
  v14 = 0;
  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v4 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v3, *MEMORY[0x24BE047C0], 0);
  v5 = dispatch_semaphore_create(0);
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);

  v6 = (id)v10[5];
  v7 = (NSNumber *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v7;
}

intptr_t __36__SUScriptDevice_diskSpaceAvailable__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", a3);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (SUScriptDictionary)diskUsageDictionary
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  SUScriptDictionary *v13;
  _QWORD v15[11];

  v15[10] = *MEMORY[0x24BDAC8D0];
  v2 = MGCopyAnswer();
  if (!v2)
    return (SUScriptDictionary *)0;
  v3 = (void *)v2;
  v4 = *MEMORY[0x24BED86E0];
  v15[0] = CFSTR("totalSystemCapacity");
  v15[1] = v4;
  v5 = *MEMORY[0x24BED86D8];
  v15[2] = CFSTR("totalSystemAvailable");
  v15[3] = v5;
  v6 = *MEMORY[0x24BED86B8];
  v15[4] = CFSTR("totalDataCapacity");
  v15[5] = v6;
  v7 = *MEMORY[0x24BED86A8];
  v15[6] = CFSTR("totalDataAvailable");
  v15[7] = v7;
  v8 = *MEMORY[0x24BED86C0];
  v15[8] = CFSTR("totalDiskCapacity");
  v15[9] = v8;
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  for (i = 0; i != 10; i += 2)
  {
    v11 = v15[i];
    v12 = objc_msgSend(v3, "objectForKey:", v15[i + 1]);
    if (v12)
      objc_msgSend(v9, "setObject:forKey:", v12, v11);
  }
  v13 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v9);

  CFRelease(v3);
  return v13;
}

- (int64_t)hardwareType
{
  uint64_t v3;
  int64_t result;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "deviceType");
  if (v3 <= 1999)
  {
    switch(v3)
    {
      case 1000:
        result = -[SUScriptDevice hardwareTypeWildcatK48](self, "hardwareTypeWildcatK48");
        break;
      case 1001:
        result = -[SUScriptDevice hardwareTypeIPadK93](self, "hardwareTypeIPadK93");
        break;
      case 1002:
        result = -[SUScriptDevice hardwareTypeIPadK93a](self, "hardwareTypeIPadK93a");
        break;
      case 1003:
        result = -[SUScriptDevice hardwareTypeIPadK94](self, "hardwareTypeIPadK94");
        break;
      case 1004:
        result = -[SUScriptDevice hardwareTypeIPadK95](self, "hardwareTypeIPadK95");
        break;
      case 1005:
        result = -[SUScriptDevice hardwareTypeIPadJ1](self, "hardwareTypeIPadJ1");
        break;
      case 1006:
        result = -[SUScriptDevice hardwareTypeIPadJ2](self, "hardwareTypeIPadJ2");
        break;
      case 1007:
        result = -[SUScriptDevice hardwareTypeIPadJ2a](self, "hardwareTypeIPadJ2a");
        break;
      default:
LABEL_29:
        result = -[SUScriptDevice hardwareTypeUnknown](self, "hardwareTypeUnknown");
        break;
    }
  }
  else if (v3 <= 2999)
  {
    switch(v3)
    {
      case 2000:
        result = -[SUScriptDevice hardwareTypeIPhoneM68](self, "hardwareTypeIPhoneM68");
        break;
      case 2001:
        result = -[SUScriptDevice hardwareTypeIPhoneN82](self, "hardwareTypeIPhoneN82");
        break;
      case 2002:
        result = -[SUScriptDevice hardwareTypeIPhoneN88](self, "hardwareTypeIPhoneN88");
        break;
      case 2003:
        result = -[SUScriptDevice hardwareTypeIPhoneN90](self, "hardwareTypeIPhoneN90");
        break;
      case 2005:
        result = -[SUScriptDevice hardwareTypeIPhoneN92](self, "hardwareTypeIPhoneN92");
        break;
      case 2006:
        result = -[SUScriptDevice hardwareTypeIPhoneN94](self, "hardwareTypeIPhoneN94");
        break;
      default:
        goto LABEL_29;
    }
  }
  else
  {
    switch(v3)
    {
      case 3000:
        result = -[SUScriptDevice hardwareTypeIPodTouchN45](self, "hardwareTypeIPodTouchN45");
        break;
      case 3001:
      case 3002:
        result = -[SUScriptDevice hardwareTypeIPodTouchN72](self, "hardwareTypeIPodTouchN72");
        break;
      case 3003:
        result = -[SUScriptDevice hardwareTypeIPodTouchN18](self, "hardwareTypeIPodTouchN18");
        break;
      case 3004:
        result = -[SUScriptDevice hardwareTypeIPodTouchN81](self, "hardwareTypeIPodTouchN81");
        break;
      case 3005:
        result = -[SUScriptDevice hardwareTypeIPodTouchN81a](self, "hardwareTypeIPodTouchN81a");
        break;
      default:
        if (v3 == 4000)
        {
          result = -[SUScriptDevice hardwareTypeAppleTVK66](self, "hardwareTypeAppleTVK66");
        }
        else
        {
          if (v3 != 4001)
            goto LABEL_29;
          result = -[SUScriptDevice hardwareTypeAppleTVJ33](self, "hardwareTypeAppleTVJ33");
        }
        break;
    }
  }
  return result;
}

- (NSNumber)mainScreenScale
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  *(float *)&v3 = v3;
  return (NSNumber *)objc_msgSend(v2, "numberWithFloat:", v3);
}

- (NSNumber)metricsPostFrequencyOverride
{
  NSObject *v2;
  NSNumber *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  v11 = 0;
  v2 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__SUScriptDevice_metricsPostFrequencyOverride__block_invoke;
  v5[3] = &unk_24DE7D190;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(MEMORY[0x24BEB1ED0], "getReportingFrequencyOverrideWithCompletionBlock:", v5);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
  v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

intptr_t __46__SUScriptDevice_metricsPostFrequencyOverride__block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)needsToneRegrantOption
{
  id v2;
  int v3;
  id *v4;

  v2 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  v3 = objc_msgSend(v2, "_wasAffectedByAccidentalToneDeletion");

  v4 = (id *)MEMORY[0x24BDBD270];
  if (!v3)
    v4 = (id *)MEMORY[0x24BDBD268];
  return *v4;
}

- (void)setDiskUsageDictionary:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("diskUsage")));
}

- (NSString)capabilityNameEmail
{
  return (NSString *)CFSTR("email");
}

- (NSString)capabilityNameExplicitMedia
{
  return (NSString *)CFSTR("explicit");
}

- (NSString)capabilityNameHDVideo
{
  return (NSString *)CFSTR("hd-video");
}

- (NSString)capabilityNameHDVideo1080p
{
  return (NSString *)CFSTR("hd-video-1080p");
}

- (NSString)capabilityNameHDVideo720p
{
  return (NSString *)CFSTR("hd-video-720p");
}

- (NSString)capabilityNamePodcasts
{
  return (NSString *)CFSTR("podcasts");
}

- (NSString)capabilityNameWiFi
{
  return (NSString *)CFSTR("wifi");
}

- (int64_t)hardwareTypeAppleTVJ33
{
  return 22;
}

- (int64_t)hardwareTypeAppleTVK66
{
  return 21;
}

- (int64_t)hardwareTypeIPadJ1
{
  return 15;
}

- (int64_t)hardwareTypeIPadJ2
{
  return 16;
}

- (int64_t)hardwareTypeIPadJ2a
{
  return 17;
}

- (int64_t)hardwareTypeIPadK93
{
  return 10;
}

- (int64_t)hardwareTypeIPadK93a
{
  return 18;
}

- (int64_t)hardwareTypeIPadK94
{
  return 11;
}

- (int64_t)hardwareTypeIPadK95
{
  return 12;
}

- (int64_t)hardwareTypeIPhoneM68
{
  return 1;
}

- (int64_t)hardwareTypeIPhoneN82
{
  return 3;
}

- (int64_t)hardwareTypeIPhoneN88
{
  return 4;
}

- (int64_t)hardwareTypeIPhoneN90
{
  return 8;
}

- (int64_t)hardwareTypeIPhoneN92
{
  return 9;
}

- (int64_t)hardwareTypeIPhoneN94
{
  return 13;
}

- (int64_t)hardwareTypeIPodTouchN45
{
  return 2;
}

- (int64_t)hardwareTypeIPodTouchN72
{
  return 5;
}

- (int64_t)hardwareTypeIPodTouchN18
{
  return 6;
}

- (int64_t)hardwareTypeIPodTouchN81
{
  return 8;
}

- (int64_t)hardwareTypeIPodTouchN81a
{
  return 14;
}

- (int64_t)hardwareTypeUnknown
{
  return 0;
}

- (int64_t)hardwareTypeWildcatK48
{
  return 7;
}

- (int64_t)networkTypeNone
{
  return 0;
}

- (int64_t)networkType2G
{
  return 1;
}

- (int64_t)networkType3G
{
  return 2;
}

- (int64_t)networkType4G
{
  return 4;
}

- (int64_t)networkType5G
{
  return 5;
}

- (int64_t)networkType6G
{
  return 6;
}

- (int64_t)networkType7G
{
  return 7;
}

- (int64_t)networkType8G
{
  return 8;
}

- (int64_t)networkType9G
{
  return 9;
}

- (int64_t)networkTypeWiFi
{
  return 3;
}

- (NSString)orientationStringLandscapeLeft
{
  return (NSString *)CFSTR("landscape-left");
}

- (NSString)orientationStringLandscapeRight
{
  return (NSString *)CFSTR("landscape-right");
}

- (NSString)orientationStringPortrait
{
  return (NSString *)CFSTR("portrait");
}

- (NSString)orientationStringPortraitUpsideDown
{
  return (NSString *)CFSTR("portrait-upside-down");
}

- (int64_t)freeSpaceEffortLevelDoNothing
{
  return 0;
}

- (int64_t)freeSpaceEffortLevelAutomaticOnly
{
  return 1;
}

- (int64_t)freeSpaceEffortLevelManualSpaceManagement
{
  return 3;
}

- (int64_t)freeSpaceEffortLevelPromptUser
{
  return 2;
}

- (NSString)freeSpaceOptionEffortLevel
{
  return (NSString *)*MEMORY[0x24BE047C0];
}

- (int64_t)restrictionBoolNo
{
  return 2;
}

- (int64_t)restrictionBoolNoData
{
  return 0;
}

- (int64_t)restrictionBoolYes
{
  return 1;
}

- (NSString)restrictionAccountModificationAllowed
{
  return (NSString *)*MEMORY[0x24BE63770];
}

- (NSString)restrictionAllowGlobalBackgroundFetchWhenRoaming
{
  return (NSString *)*MEMORY[0x24BE63780];
}

- (NSString)restrictionAllowVoiceDialing
{
  return (NSString *)*MEMORY[0x24BE63788];
}

- (NSString)restrictionAppInstallationAllowed
{
  return (NSString *)*MEMORY[0x24BE637B0];
}

- (NSString)restrictionAppRemovalAllowed
{
  return (NSString *)*MEMORY[0x24BE637B8];
}

- (NSString)restrictionBookStoreAllowed
{
  return (NSString *)*MEMORY[0x24BE63828];
}

- (NSString)restrictionBookStoreEroticaAllowed
{
  return (NSString *)*MEMORY[0x24BE63830];
}

- (NSString)restrictionCameraAllowed
{
  return (NSString *)*MEMORY[0x24BE63838];
}

- (NSString)restrictionCellularHDUploadsAllowed
{
  return (NSString *)*MEMORY[0x24BE63848];
}

- (id)restrictionExplicitMedia
{
  return (id)*MEMORY[0x24BE63918];
}

- (NSString)restrictionITunesAllowed
{
  return (NSString *)*MEMORY[0x24BE63968];
}

- (NSString)restrictionITunesSocialAllowed
{
  return (NSString *)*MEMORY[0x24BE63970];
}

- (NSString)restrictionMultiplayerGamingAllowed
{
  return (NSString *)*MEMORY[0x24BE63A00];
}

- (NSString)restrictionSafariAllowed
{
  return (NSString *)*MEMORY[0x24BE63A88];
}

- (NSString)restrictionScreenShotAllowed
{
  return (NSString *)*MEMORY[0x24BE63AA0];
}

- (NSString)restrictionTypeApplications
{
  return (NSString *)CFSTR("applications");
}

- (NSString)restrictionTypeMovies
{
  return (NSString *)CFSTR("movies");
}

- (NSString)restrictionTypeTelevision
{
  return (NSString *)CFSTR("television");
}

- (NSString)restrictionVideoConferencingAllowed
{
  return (NSString *)*MEMORY[0x24BE63B00];
}

- (NSString)restrictionYouTubeAllowed
{
  return (NSString *)*MEMORY[0x24BE63B28];
}

- (NSString)UTIImage
{
  return (NSString *)*MEMORY[0x24BDC17A0];
}

- (NSString)UTIMovie
{
  return (NSString *)*MEMORY[0x24BDC1800];
}

- (NSString)UTIText
{
  return (NSString *)*MEMORY[0x24BDC1888];
}

- (void)_accessibilitySettingsChangedNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("accessibilitysettingschange"));
}

- (void)_autoDownloadKindsChangedNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("automaticdownloadtypeschange"));
}

- (void)_addScriptFunction:(id)a3
{
  NSMutableArray *scriptFunctions;

  if (a3)
  {
    objc_msgSend(a3, "setThisObject:", self);
    -[SUScriptObject lock](self, "lock");
    scriptFunctions = self->_scriptFunctions;
    if (!scriptFunctions)
    {
      scriptFunctions = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->_scriptFunctions = scriptFunctions;
    }
    -[NSMutableArray addObject:](scriptFunctions, "addObject:", a3);
    -[SUScriptObject unlock](self, "unlock");
  }
}

- (int64_t)_deviceCapabilityForString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameHDVideo](self, "capabilityNameHDVideo")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameHDVideo1080p](self, "capabilityNameHDVideo1080p")) & 1) != 0)return 2;
  if ((objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameHDVideo720p](self, "capabilityNameHDVideo720p")) & 1) != 0)return 1;
  else
    return objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameWiFi](self, "capabilityNameWiFi"))- 1;
}

- (void)_removeScriptFunction:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "setThisObject:", 0);
    -[SUScriptObject lock](self, "lock");
    -[NSMutableArray removeObjectIdenticalTo:](self->_scriptFunctions, "removeObjectIdenticalTo:", a3);
    -[SUScriptObject unlock](self, "unlock");
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_50, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDevice;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_38, 11);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDevice;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptDevice;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_50, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_38 = (uint64_t)sel_BOOLValueForRestriction_;
    unk_255186B70 = CFSTR("BOOLValueForRestriction");
    qword_255186B78 = (uint64_t)sel_checkCapabilitiesPropertyListString_showFailureDialog_;
    unk_255186B80 = CFSTR("checkApplicationCapabilities");
    qword_255186B88 = (uint64_t)sel_getMachineIdentifierForAccountIdentifier_;
    unk_255186B90 = CFSTR("getMachineID");
    qword_255186B98 = (uint64_t)sel_hasCapability_;
    unk_255186BA0 = CFSTR("hasCapability");
    qword_255186BA8 = (uint64_t)sel_isRestrictionLockedDown_;
    unk_255186BB0 = CFSTR("isRestrictionLockedDown");
    qword_255186BB8 = (uint64_t)sel_requestFreeSpaceWithBytes_options_completionHandler_;
    unk_255186BC0 = CFSTR("requestFreeSpace");
    qword_255186BC8 = (uint64_t)sel_restrictionLevelForType_;
    unk_255186BD0 = CFSTR("restrictionLevelForType");
    qword_255186BD8 = (uint64_t)sel_setAutomaticDownloadKinds_withCompletionHandler_;
    unk_255186BE0 = CFSTR("setAutomaticDownloadMediaTypes");
    qword_255186BE8 = (uint64_t)sel_setValueForRestriction_enabled_;
    unk_255186BF0 = CFSTR("setValueForRestriction");
    qword_255186BF8 = (uint64_t)sel_UTIForURL_;
    unk_255186C00 = CFSTR("UTIForURL");
    qword_255186C08 = (uint64_t)sel_valueForRestriction_;
    unk_255186C10 = CFSTR("valueForRestriction");
    __KeyMapping_50 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("accessibilityBoldTextEnabled"), CFSTR("accessibilityButtonShapesEnabled"), CFSTR("accessibilityButtonShapesEnabled"), CFSTR("accessibilityDarkenSystemColors"), CFSTR("accessibilityDarkenSystemColors"), CFSTR("accessibilityEnhanceBackgroundContrast"), CFSTR("accessibilityEnhanceBackgroundContrast"), CFSTR("accessibilityMotionAutoPlayVideo"), CFSTR("accessibilityMotionAutoPlayVideo"), CFSTR("accessibilitySingleColorSelected"), CFSTR("accessibilitySingleColorSelected"), CFSTR("accessibilitySingleColor"), CFSTR("accessibilitySingleColor"), CFSTR("accessibilityUseDarkerKeyboard"), CFSTR("accessibilityUseDarkerKeyboard"), CFSTR("activeNetworkType"), CFSTR("activeNetworkType"),
                        CFSTR("automaticDownloadMediaTypes"),
                        CFSTR("automaticDownloadMediaTypes"),
                        CFSTR("deviceTypeIdentifier"),
                        CFSTR("deviceTypeIdentifier"),
                        CFSTR("diskSpaceAvailable"),
                        CFSTR("diskSpaceAvailable"),
                        CFSTR("diskUsage"),
                        CFSTR("diskUsageDictionary"),
                        CFSTR("hardwareType"),
                        CFSTR("hardwareType"),
                        CFSTR("mainScreenScale"),
                        CFSTR("mainScreenScale"),
                        CFSTR("metricsPostFrequencyOverride"),
                        CFSTR("metricsPostFrequencyOverride"),
                        CFSTR("needsToneRegrantOption"),
                        CFSTR("needsToneRegrantOption"),
                        CFSTR("CAPABILITY_EMAIL"),
                        CFSTR("capabilityNameEmail"),
                        CFSTR("CAPABILITY_EXPLICIT_MEDIA"),
                        CFSTR("capabilityNameExplicitMedia"),
                        CFSTR("CAPABILITY_HD_VIDEO"),
                        CFSTR("capabilityNameHDVideo"),
                        CFSTR("CAPABILITY_HD_VIDEO_1080P"),
                        CFSTR("capabilityNameHDVideo1080p"),
                        CFSTR("CAPABILITY_HD_VIDEO_720P"),
                        CFSTR("capabilityNameHDVideo720p"),
                        CFSTR("CAPABILITY_PODCASTS"),
                        CFSTR("capabilityNamePodcasts"),
                        CFSTR("CAPABILITY_WIFI"),
                        CFSTR("capabilityNameWiFi"),
                        CFSTR("FREE_SPACE_EFFORT_DO_NOTHING"),
                        CFSTR("freeSpaceEffortLevelDoNothing"),
                        CFSTR("FREE_SPACE_EFFORT_AUTOMATIC_ONLY"),
                        CFSTR("freeSpaceEffortLevelAutomaticOnly"),
                        CFSTR("FREE_SPACE_EFFORT_MANUAL"),
                        CFSTR("freeSpaceEffortLevelManualSpaceManagement"),
                        CFSTR("FREE_SPACE_EFFORT_PROMPT_USER"),
                        CFSTR("freeSpaceEffortLevelPromptUser"),
                        CFSTR("FREE_SPACE_OPTION_EFFORT_LEVEL"),
                        CFSTR("freeSpaceOptionEffortLevel"),
                        CFSTR("HARDWARE_TYPE_APPLETV_J33"),
                        CFSTR("hardwareTypeAppleTVJ33"),
                        CFSTR("HARDWARE_TYPE_APPLETV_K66"),
                        CFSTR("hardwareTypeAppleTVK66"));
  }
}

@end
