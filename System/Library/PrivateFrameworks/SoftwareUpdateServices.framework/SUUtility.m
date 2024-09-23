@implementation SUUtility

+ (id)taskQueue
{
  if (taskQueue_queuePredicate != -1)
    dispatch_once(&taskQueue_queuePredicate, &__block_literal_global_16);
  return (id)taskQueue___taskQueue;
}

void __22__SUUtility_taskQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.softwareupdateservices.operationTaskQueue", 0);
  v1 = (void *)taskQueue___taskQueue;
  taskQueue___taskQueue = (uint64_t)v0;

}

+ (id)appDemotionSettingQueue
{
  if (appDemotionSettingQueue_queuePredicate != -1)
    dispatch_once(&appDemotionSettingQueue_queuePredicate, &__block_literal_global_182);
  return (id)appDemotionSettingQueue___appDemotionSettingQueue;
}

void __36__SUUtility_appDemotionSettingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.softwareupdateservices.appDemotionSettingQueue", 0);
  v1 = (void *)appDemotionSettingQueue___appDemotionSettingQueue;
  appDemotionSettingQueue___appDemotionSettingQueue = (uint64_t)v0;

}

+ (id)mainWorkQueue
{
  if (mainWorkQueue_queuePredicate != -1)
    dispatch_once(&mainWorkQueue_queuePredicate, &__block_literal_global_184);
  return (id)mainWorkQueue___mainWorkQueue;
}

void __26__SUUtility_mainWorkQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.softwareupdateservices.mainWorkQueue", v2);
  v1 = (void *)mainWorkQueue___mainWorkQueue;
  mainWorkQueue___mainWorkQueue = (uint64_t)v0;

}

+ (id)fastWorkQueue
{
  if (fastWorkQueue_queuePredicate != -1)
    dispatch_once(&fastWorkQueue_queuePredicate, &__block_literal_global_186);
  return (id)fastWorkQueue___fastWorkQueue;
}

void __26__SUUtility_fastWorkQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.softwareupdateservices.fastWorkQueue", v2);
  v1 = (void *)fastWorkQueue___fastWorkQueue;
  fastWorkQueue___fastWorkQueue = (uint64_t)v0;

}

+ (void)setIsDaemon:(BOOL)a3
{
  __isDaemon = a3;
}

+ (BOOL)isDaemon
{
  return __isDaemon;
}

+ (BOOL)isWiFiCapable
{
  return MGGetBoolAnswer();
}

+ (BOOL)isCellularDataCapable
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasCellularRadio
{
  return MGGetBoolAnswer();
}

+ (BOOL)cellularDataIsEnabled
{
  return CTCellularDataPlanGetIsEnabled() != 0;
}

+ (id)serialNumber
{
  if (serialNumber_serialNumberPredicate != -1)
    dispatch_once(&serialNumber_serialNumberPredicate, &__block_literal_global_193);
  return (id)serialNumber___serialNumber;
}

void __25__SUUtility_serialNumber__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)serialNumber___serialNumber;
      serialNumber___serialNumber = (uint64_t)v1;

    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentProductCategory
{
  if (currentProductCategory_productCategoryPredicate != -1)
    dispatch_once(&currentProductCategory_productCategoryPredicate, &__block_literal_global_196);
  return (id)currentProductCategory___currentProductCategory;
}

void __35__SUUtility_currentProductCategory__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentProductCategory___currentProductCategory;
      currentProductCategory___currentProductCategory = (uint64_t)v1;

    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentHWModelStr
{
  if (currentHWModelStr_modelStrPredicate != -1)
    dispatch_once(&currentHWModelStr_modelStrPredicate, &__block_literal_global_199);
  return (id)currentHWModelStr___currentModelStr;
}

void __30__SUUtility_currentHWModelStr__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentHWModelStr___currentModelStr;
      currentHWModelStr___currentModelStr = (uint64_t)v1;

    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentDeviceName
{
  if (currentDeviceName_deviceNamePredicate != -1)
    dispatch_once(&currentDeviceName_deviceNamePredicate, &__block_literal_global_202);
  return (id)currentDeviceName___currentDeviceName;
}

void __30__SUUtility_currentDeviceName__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentDeviceName___currentDeviceName;
      currentDeviceName___currentDeviceName = (uint64_t)v1;

    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentProductType
{
  if (currentProductType_productTypePredicate != -1)
    dispatch_once(&currentProductType_productTypePredicate, &__block_literal_global_205);
  return (id)currentProductType___currentProductType;
}

void __31__SUUtility_currentProductType__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentProductType___currentProductType;
      currentProductType___currentProductType = (uint64_t)v1;

    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentProductVersion
{
  if (currentProductVersion_productVersionPredicate != -1)
    dispatch_once(&currentProductVersion_productVersionPredicate, &__block_literal_global_208);
  return (id)currentProductVersion___currentProductVersion;
}

void __34__SUUtility_currentProductVersion__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentProductVersion___currentProductVersion;
      currentProductVersion___currentProductVersion = (uint64_t)v1;

    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentProductBuild
{
  if (currentProductBuild_productBuildPredicate != -1)
    dispatch_once(&currentProductBuild_productBuildPredicate, &__block_literal_global_211);
  return (id)currentProductBuild___currentProductBuild;
}

void __32__SUUtility_currentProductBuild__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentProductBuild___currentProductBuild;
      currentProductBuild___currentProductBuild = (uint64_t)v1;

    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (id)currentReleaseType
{
  if (currentReleaseType_releaseTypePredicate != -1)
    dispatch_once(&currentReleaseType_releaseTypePredicate, &__block_literal_global_214);
  return (id)currentReleaseType___currentReleaseType;
}

void __31__SUUtility_currentReleaseType__block_invoke()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = (void *)currentReleaseType___currentReleaseType;
      currentReleaseType___currentReleaseType = (uint64_t)v1;

    }
    else
    {
      CFRelease(v1);
    }
  }
}

+ (BOOL)currentReleaseTypeIsInternal
{
  void *v2;
  char v3;

  +[SUUtility currentReleaseType](SUUtility, "currentReleaseType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Internal"));

  return v3;
}

+ (BOOL)isProductionFused
{
  if (isProductionFused_fusingPredicate != -1)
    dispatch_once(&isProductionFused_fusingPredicate, &__block_literal_global_219);
  return isProductionFused___isProductionFused;
}

void __30__SUUtility_isProductionFused__block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID())
      isProductionFused___isProductionFused = CFBooleanGetValue(v1) != 0;
    CFRelease(v1);
  }
}

+ (BOOL)isVirtualDevice
{
  if (isVirtualDevice_virtualPredicate != -1)
    dispatch_once(&isVirtualDevice_virtualPredicate, &__block_literal_global_222);
  return isVirtualDevice___isVirtualDevice;
}

void __28__SUUtility_isVirtualDevice__block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID())
      isVirtualDevice___isVirtualDevice = CFBooleanGetValue(v1) != 0;
    CFRelease(v1);
  }
}

+ (BOOL)alarmSetBeforeDate:(id)a3
{
  const __CFDate *v3;
  CFArrayRef v4;
  const __CFArray *v5;
  CFTypeID v6;
  CFIndex v7;
  const void *v8;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v10;
  CFTypeID v11;
  const void *Value;
  const void *v13;
  CFTypeID v14;
  const __CFDate *v15;
  const __CFDate *v16;
  CFTypeID v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = (const __CFDate *)a3;
  if (!v3 || (v4 = IOPMCopyScheduledPowerEvents()) == 0)
  {
    v20 = 0;
    goto LABEL_21;
  }
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 != CFArrayGetTypeID() || CFArrayGetCount(v5) < 1)
  {
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  v7 = 0;
  v8 = (const void *)*MEMORY[0x24BDBD270];
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v7);
    if (!ValueAtIndex)
      goto LABEL_17;
    v10 = ValueAtIndex;
    v11 = CFGetTypeID(ValueAtIndex);
    if (v11 != CFDictionaryGetTypeID())
      goto LABEL_17;
    Value = CFDictionaryGetValue(v10, CFSTR("UserVisible"));
    if (!Value)
      goto LABEL_17;
    v13 = Value;
    v14 = CFGetTypeID(Value);
    if (v14 != CFBooleanGetTypeID())
      goto LABEL_17;
    if (v13 != v8)
      goto LABEL_17;
    v15 = (const __CFDate *)CFDictionaryGetValue(v10, CFSTR("time"));
    if (!v15)
      goto LABEL_17;
    v16 = v15;
    v17 = CFGetTypeID(v15);
    if (v17 != CFDateGetTypeID() || CFDateCompare(v16, v3, 0) != kCFCompareLessThan)
      goto LABEL_17;
    CFDictionaryGetValue(v10, CFSTR("scheduledby"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18 || (_eventIsBlacklisted(v18) & 1) == 0)
      break;

LABEL_17:
    if (CFArrayGetCount(v5) <= ++v7)
      goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Event is scheduled before provided time"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v19)
  {
    objc_msgSend(v22, "stringByAppendingFormat:", CFSTR("\nEvent name: %@"), v19);
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }
  objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("\nEvent time:  %@"), v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  SULogInfo(CFSTR("%@"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)v25);
  v20 = 1;
LABEL_19:
  CFRelease(v5);
LABEL_21:

  return v20;
}

+ (int)randomIntWithMinVal:(unsigned int)a3 maxVal:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v11;

  v8 = a4 - a3;
  if (a4 >= a3)
  {
    if (randomIntWithMinVal_maxVal__onceToken != -1)
      dispatch_once(&randomIntWithMinVal_maxVal__onceToken, &__block_literal_global_242);
    return rand() % (v8 + 1) + a3;
  }
  else
  {
    SULogInfo(CFSTR("invalid arguments"), (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7, v11);
    return 0;
  }
}

void __40__SUUtility_randomIntWithMinVal_maxVal___block_invoke()
{
  unsigned int v0;

  v0 = time(0);
  srand(v0);
}

+ (BOOL)isLockdownModeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE60C20], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabled");

  return v3;
}

+ (id)errorWithCode:(int64_t)a3
{
  return +[SUUtility errorWithCode:originalError:](SUUtility, "errorWithCode:originalError:", a3, 0);
}

+ (id)errorWithCode:(int64_t)a3 originalError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x24BDD1398]);
  v8 = +[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal");
  if ((unint64_t)(a3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && v8)
  {
    +[SUUtility internalRecoveryStringForErrorCode:](SUUtility, "internalRecoveryStringForErrorCode:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v14 = *MEMORY[0x24BDD0FF0];
      v15[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEntriesFromDictionary:", v11);

    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), a3, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)updateError:(id)a3 withAdditionalUserInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    v7 = v5;
    if (a4)
    {
      v8 = (void *)MEMORY[0x24BDBCED8];
      v9 = a4;
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithDictionary:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addEntriesFromDictionary:", v9);
      v12 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v6, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v6, "code"), v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

+ (id)errorRemovingUserInfoKey:(id)a3 originalError:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  if (a4)
  {
    v6 = (void *)MEMORY[0x24BDBCED8];
    v7 = a4;
    objc_msgSend(v7, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *MEMORY[0x24BDD1398];
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        +[SUUtility errorRemovingUserInfoKey:originalError:](SUUtility, "errorRemovingUserInfoKey:originalError:", v5, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v10);

      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v5);

    }
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v7, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "code");

    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (void)assignError:(id *)a3 withCode:(int64_t)a4
{
  id v5;

  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility assignError:withError:translate:](SUUtility, "assignError:withError:translate:", a3, v5, 0);

}

+ (void)assignError:(id *)a3 withError:(id)a4 translate:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v7 = a4;
  v8 = v7;
  if (a3 && v7)
  {
    v11 = v7;
    if (a5)
    {
      +[SUUtility translateError:](SUUtility, "translateError:", v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v7;
    }
    v10 = objc_retainAutorelease(v9);
    *a3 = v10;

    v8 = v11;
  }

}

+ (id)translateError:(id)a3
{
  return (id)objc_msgSend(a1, "translateError:withAddedUserInfo:", a3, 0);
}

+ (id)translateError:(id)a3 withAddedUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors"));

    if (v9)
    {
      if (!v7)
      {
        v13 = v6;
        goto LABEL_13;
      }
      v10 = objc_alloc(MEMORY[0x24BDBCED8]);
      objc_msgSend(v6, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithDictionary:", v11);

      objc_msgSend(v12, "addEntriesFromDictionary:", v7);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), objc_msgSend(v6, "code"), v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = objc_msgSend(a1, "translateErrorCodeFromError:", v6);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v7);
      objc_msgSend(v12, "setObject:forKey:", v6, *MEMORY[0x24BDD1398]);
      if (+[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal")
        && (unint64_t)(v14 + 1) >= 2)
      {
        +[SUUtility internalRecoveryStringForErrorCode:](SUUtility, "internalRecoveryStringForErrorCode:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
        {
          v20 = *MEMORY[0x24BDD0FF0];
          v21[0] = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addEntriesFromDictionary:", v17);

        }
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), v14, v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "buildCheckedError:", v18);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  return v13;
}

+ (int64_t)translateErrorCodeFromError:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors"));

  v6 = objc_msgSend(v3, "code");
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = v6;
    goto LABEL_27;
  }
  v9 = (void *)*MEMORY[0x24BE66B18];
  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "isEqualToString:", v10);

  if ((_DWORD)v9)
  {
    if ((unint64_t)(v7 - 1) < 0x16)
    {
      v8 = qword_21297FC70[v7 - 1];
      goto LABEL_27;
    }
LABEL_26:
    v8 = -1;
    goto LABEL_27;
  }
  v11 = (void *)*MEMORY[0x24BE67280];
  objc_msgSend(v3, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v12);

  if ((_DWORD)v11)
  {
    if (v7 != 812)
    {
      if (v7 == 26)
      {
        v8 = 47;
        goto LABEL_27;
      }
      if (v7 == 2)
      {
        v8 = 19;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    objc_msgSend(v3, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.MobileAssetError.Download")))
    {

      goto LABEL_26;
    }
    v18 = objc_msgSend(v16, "code");

    if (v18 == 59)
      v8 = 57;
    else
      v8 = -1;

  }
  else
  {
    objc_msgSend(v3, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEAEB68]);

    if (!v14)
      goto LABEL_26;
    v8 = -1;
    if (v7 <= 8599)
    {
      switch(v7)
      {
        case 8400:
        case 8402:
          v8 = 57;
          break;
        case 8401:
          v8 = 58;
          break;
        case 8403:
          v8 = 80;
          break;
        case 8404:
        case 8405:
          break;
        case 8406:
          v8 = 3;
          break;
        case 8407:
          goto LABEL_16;
        default:
          if ((unint64_t)(v7 - 8102) <= 0xE && ((1 << (v7 + 90)) & 0x5001) != 0)
          {
            v8 = 22;
          }
          else if (!v7)
          {
            v8 = 0;
          }
          break;
      }
    }
    else
    {
      switch(v7)
      {
        case 8600:
          v8 = 43;
          break;
        case 8700:
          v8 = 59;
          break;
        case 9009:
LABEL_16:
          v8 = 38;
          break;
      }
    }
  }
LABEL_27:

  return v8;
}

+ (int64_t)MADownloadErrorCodeToSUDownloadErrorCode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  v8 = a3 - 1;
  if ((unint64_t)(a3 - 1) < 0xD && ((0x1DFFu >> v8) & 1) != 0)
    return qword_21297FD20[v8];
  SULogInfo(CFSTR("Unknown MAError code: %ld"), (uint64_t)a2, a3, v3, v4, v5, v6, v7, a3);
  return 59;
}

+ (id)autoDownloadExpiredError:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v8 = CFSTR("SUAutodownloadWillRetry");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 23, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)internalRecoveryStringForErrorCode:(int64_t)a3
{
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;
  _BOOL4 v7;
  id result;

  v4 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("EnableSso"), CFSTR("com.apple.MobileSoftwareUpdate"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  result = CFSTR("Insufficient space for update. Please free up space on the device and try again.");
  switch(a3)
  {
    case -1:
      return CFSTR("Unknown Error.");
    case 0:
      return CFSTR("No Error.");
    case 1:
    case 26:
    case 27:
    case 40:
      return CFSTR("There was a networking error during the update attempt. Please verify your device has a valid network connection.");
    case 2:
    case 6:
      return result;
    case 3:
      return CFSTR("No update found.");
    case 4:
      return CFSTR("Failed to find a SU documentation asset.");
    case 5:
      return CFSTR("The device found a malformed Software Update asset on the asset server.");
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 28:
    case 29:
    case 30:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 38:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 55:
    case 56:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 76:
      return 0;
    case 17:
      return CFSTR("Failed to prepare update.");
    case 18:
      return CFSTR("SU asset is corrupted. Please delete the update from settings and try downloading again.");
    case 19:
      if (+[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal")
        && +[SUUtility isProductionFused](SUUtility, "isProductionFused")
        && !v7)
      {
        return CFSTR("Installing an internal build on a production fused device requires AppleConnect for personalization. Enable AppleConnect from:\n Settings > Internal Settings > Mobile Software Update > check Use AppleConnect.");
      }
      else
      {
        return CFSTR("Personalization failed. This build might not be nominated for installation yet. Please try installing again later.");
      }
    case 31:
      return CFSTR("Download not allowable.");
    case 37:
      return CFSTR("Remote connection lost.");
    case 47:
      return CFSTR("Missing installation Keybag.");
    case 53:
      return CFSTR("Failed to prepare the update because a root is installed or the system is rooted from live fs. Please try downloading again. The device will automatically try downloading a full replacement asset, which has the ability to prepare when a root is installed.");
    case 54:
      return CFSTR("Failed to load the update brain. Please try again.");
    case 57:
      return CFSTR("Failed to download the Software Update catalog from the internal asset server. Please verify that the device is connected to an internal network or VPN and try again.");
    case 58:
      return CFSTR("Failed to query MobileAsset for Software Update asset. Please try again.");
    case 59:
      return CFSTR("MobileAsset software update download failure.");
    case 66:
      return CFSTR("MobileAsset XPC failure.");
    case 67:
      return CFSTR("MobileAsset staging failure.");
    case 68:
      return CFSTR("MobileAsset data processing failure.");
    case 69:
      return CFSTR("MobileAsset unzip failure.");
    case 70:
      return CFSTR("MobileAsset file move failure.");
    case 71:
      return CFSTR("MobileAsset asset install failure.");
    case 72:
      return CFSTR("mobileassetd exited.");
    case 73:
      return CFSTR("StreamingZip extraction error.");
    case 74:
      return CFSTR("Missing MobileAsset entitlement.");
    case 75:
      return CFSTR("mobileassetd daemon not ready to download. Please try again in a moment.");
    case 77:
      return CFSTR("DAS failed to run auto install activity.");
    default:
      if (a3 == 84)
        return CFSTR("client is not authorised, SoftwareUpdateServicesd is in exclusive mode");
      if (a3 == 107)
        return CFSTR("Failed to load the update brain. Please try again.");
      return 0;
  }
}

+ (int64_t)appDemoteableSpace
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
  int64_t v22;
  uint64_t v24[4];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_opt_new();
  v11 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setVolume:", CFSTR("/private/var"));
    objc_msgSend(v11, "setUrgency:", 4);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE045B8]), "initWithOptions:", v11);
    if (v19)
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = (uint64_t)__31__SUUtility_appDemoteableSpace__block_invoke;
      v24[3] = (uint64_t)&unk_24CE3DB58;
      v26 = &v27;
      v20 = v2;
      v25 = v20;
      objc_msgSend(v19, "startWithCompletionBlock:", v24);
      v21 = dispatch_time(0, 120000000000);
      dispatch_semaphore_wait(v20, v21);
      v22 = v28[3];

    }
    else
    {
      SULogInfo(CFSTR("Failed to create ASDPurgeableAppRequest"), v12, v13, v14, v15, v16, v17, v18, v24[0]);
      v22 = v28[3];
    }

  }
  else
  {
    SULogInfo(CFSTR("Failed to create ASDPurgeableAppRequestOptions"), v4, v5, v6, v7, v8, v9, v10, v24[0]);
    v22 = v28[3];
  }

  _Block_object_dispose(&v27, 8);
  return v22;
}

void __31__SUUtility_appDemoteableSpace__block_invoke(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;

  v16 = a3;
  v14 = a4;
  if (v14)
    SULogInfo(CFSTR("request for purgeable app space failed. Result: %d Error: %@"), v7, v8, v9, v10, v11, v12, v13, a2);
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v16, "purgeableSize");
  v15 = *(NSObject **)(a1 + 32);
  if (v15)
    dispatch_semaphore_signal(v15);

}

+ (unint64_t)totalPurgeableSpace:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v5 = 0;
LABEL_10:
    v6 = 4;
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "siriVoiceDeletionDisabled"))
    v5 = objc_msgSend(v4, "siriVoiceDeletionDisabled");
  else
    v5 = 0;
  if (!objc_msgSend(v4, "cdLevel4Disabled"))
    goto LABEL_10;
  if (objc_msgSend(v4, "cdLevel4Disabled"))
    v6 = 3;
  else
    v6 = 4;
LABEL_11:
  v15[0] = CFSTR("CACHE_DELETE_VOLUME");
  v15[1] = CFSTR("CACHE_DELETE_URGENCY");
  v16[0] = CFSTR("/private/var");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v12 = 0;
    if ((v5 & 1) != 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  v12 = objc_msgSend(v10, "unsignedLongLongValue");
  if ((v5 & 1) == 0)
  {
LABEL_13:
    v13 = purgeableAssetSpaceAvailable(&unk_24CE6E348);
    v12 += v13 + purgeableAssetSpaceAvailableV2(&unk_24CE6E348);
  }
LABEL_14:

  return v12;
}

+ (unint64_t)systemPartitionGrowth:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];
  _QWORD v22[2];
  statfs v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  memset(&v23, 0, 512);
  v4 = objc_msgSend(v3, "minimumSystemPartitionSize");
  objc_msgSend(v3, "systemPartitionPadding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SUUtility devicePadding:](SUUtility, "devicePadding:", v5);

  if (statfs("/", &v23))
  {
    v7 = 0;
  }
  else
  {
    v8 = v4 + 75497472 + v6;
    v21[2] = 0;
    memset(v22, 0, 12);
    v21[0] = 5;
    v21[1] = 2155872256;
    if (getattrlist("/", v21, v22, 0xCuLL, 0))
      v9 = (v23.f_blocks - v23.f_bfree) * v23.f_bsize;
    else
      v9 = *(_QWORD *)((char *)v22 + 4);
    v10 = v8 >= v9;
    v11 = v8 - v9;
    if (v10)
      v7 = v11;
    else
      v7 = 0;
  }
  objc_msgSend(v3, "humanReadableUpdateName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Sytem partition growth for [%@] <%p> = %llu bytes"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);

  return v7;
}

+ (unint64_t)totalDiskSpaceForUpdate:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "totalRequiredFreeSpace");
  v5 = +[SUUtility systemPartitionGrowth:](SUUtility, "systemPartitionGrowth:", v3);

  return v4 + 104857600 + v5;
}

+ (void)enableAppDemotion:(BOOL)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  BOOL v8;

  objc_msgSend(a1, "appDemotionSettingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  objc_msgSend(a1, "appDemotionSettingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SUUtility_enableAppDemotion___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v8 = a3;
  dispatch_async(v6, block);

}

uint64_t __31__SUUtility_enableAppDemotion___block_invoke(uint64_t a1)
{
  CFPropertyListRef *v1;

  v1 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!*(_BYTE *)(a1 + 32))
    v1 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("OffloadUnusedApps"), *v1, CFSTR("com.apple.appstored"));
  return CFPreferencesAppSynchronize(CFSTR("com.apple.appstored"));
}

+ (BOOL)appDemotionIsEnabled
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  objc_msgSend(a1, "appDemotionSettingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(a1, "appDemotionSettingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUUtility_appDemotionIsEnabled__block_invoke;
  block[3] = &unk_24CE3D3C0;
  block[4] = &v7;
  dispatch_sync(v4, block);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v4;
}

uint64_t __33__SUUtility_appDemotionIsEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("OffloadUnusedApps"), CFSTR("com.apple.appstored"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = (_DWORD)result == 0;
  else
    v3 = 1;
  if (!v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

+ (unint64_t)devicePadding:(id)a3
{
  const __CFDictionary *v3;
  mach_port_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_object_t v14;
  CFTypeRef CFProperty;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  CFTypeID v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  size_t Count;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  const void **v42;
  const void **v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const void **v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  const __CFString *v62;
  const __CFNumber *v63;
  int v64;
  BOOL v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t valuePtr;
  char buffer[8];
  __int16 v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFDictionary *)a3;
  valuePtr = 0;
  if (!v3)
    goto LABEL_42;
  v4 = *MEMORY[0x24BDD8B20];
  v5 = IOBSDNameMatching(*MEMORY[0x24BDD8B20], 0, "disk0");
  MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!MatchingService)
  {
    SULogInfo(CFSTR("Could not find service for device with BSD name %s"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"disk0");
LABEL_42:
    v60 = 0;
    goto LABEL_47;
  }
  v14 = MatchingService;
  CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("Size"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v23 = CFProperty;
  if (!CFProperty || (v24 = CFGetTypeID(CFProperty), v24 != CFNumberGetTypeID()))
  {
    SULogInfo(CFSTR("Invalid value '%@' for property key '%@'"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v23);
    v60 = 0;
    goto LABEL_39;
  }
  if (!CFNumberGetValue((CFNumberRef)v23, kCFNumberLongLongType, &valuePtr))
  {
    SULogInfo(CFSTR("Failed to convert '%@' to primitive value"), v25, v26, v27, v28, v29, v30, v31, (uint64_t)v23);
LABEL_45:
    IOObjectRelease(v14);
    v60 = 0;
LABEL_46:
    CFRelease(v23);
    goto LABEL_47;
  }
  if (valuePtr >= 0)
    v32 = valuePtr;
  else
    v32 = valuePtr + 0x3FFFFFFF;
  Count = CFDictionaryGetCount(v3);
  if (!Count)
  {
    SULogInfo(CFSTR("No padding entries, returning default padding value %llu\n"), v34, v35, v36, v37, v38, v39, v40, 0);
    goto LABEL_45;
  }
  v41 = Count;
  v42 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  v43 = (const void **)malloc_type_calloc(v41, 8uLL, 0x6004044C4A2DFuLL);
  v51 = v43;
  if (!v42 || !v43)
  {
    SULogInfo(CFSTR("Failed to allocate key/value buffers to fetch system padding value\n"), v44, v45, v46, v47, v48, v49, v50, v69);
    v60 = 0;
    if (v42)
      goto LABEL_51;
    goto LABEL_52;
  }
  CFDictionaryGetKeysAndValues(v3, v42, v43);
  if (v41 < 1)
  {
    v60 = 0;
    goto LABEL_51;
  }
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v70 = v32 >> 30;
  v71 = 0;
  do
  {
    v62 = (const __CFString *)v42[v59];
    v63 = (const __CFNumber *)v51[v59];
    v73 = 0;
    v72 = 0;
    if (!v62)
    {
      v67 = CFSTR("Failed to get marketing size key from padding dict\n");
LABEL_34:
      SULogInfo(v67, v52, v53, v54, v55, v56, v57, v58, v69);
      goto LABEL_35;
    }
    if (!v63)
    {
      v67 = CFSTR("Failed to get padding size for key in padding dict\n");
      goto LABEL_34;
    }
    v76 = 0;
    *(_QWORD *)buffer = 0;
    if (!CFStringGetCString(v62, buffer, 10, 0x8000100u))
    {
      v67 = CFSTR("Failed to get C string from CFStringRef padding key\n");
      goto LABEL_34;
    }
    if (!sscanf(buffer, "%d", &v72))
    {
      v67 = CFSTR("Failed to parse out padding value from capacity string\n");
      goto LABEL_34;
    }
    if (!CFNumberGetValue(v63, kCFNumberSInt64Type, &v73))
    {
      v67 = CFSTR("Failed to convert CFNumberRef value into int\n");
      goto LABEL_34;
    }
    v64 = v70 - v72;
    if ((int)(v70 - v72) < 0)
      v64 = v72 - v70;
    v65 = v59 == 0 || v64 <= v61;
    if (v59 != 0 && v64 > v61)
      v66 = v71;
    else
      v66 = v72;
    v71 = v66;
    if (v59 == 0 || v64 <= v61)
      v61 = v64;
    if (v65)
      v60 = v73;
LABEL_35:
    ++v59;
  }
  while (v41 != v59);
  if (v61 >= 11)
    SULogInfo(CFSTR("Closest marketing capacity entry for padding was %dGB however this device is %dGB, this might not be optimal\n"), v52, v53, v54, v55, v56, v57, v58, v71);
LABEL_51:
  free(v42);
LABEL_52:
  if (v51)
    free(v51);
LABEL_39:
  IOObjectRelease(v14);
  if (v23)
    goto LABEL_46;
LABEL_47:

  return v60 << 20;
}

+ (void)purgeV1SUAssets
{
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("com.apple.MobileAsset.SoftwareUpdate");
  v3[1] = CFSTR("com.apple.MobileAsset.SoftwareUpdateDocumentation");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  purgeAssets(v2, 1, 0);

}

+ (void)setCacheable:(BOOL)a3
{
  CacheDeleteSetCacheable();
}

+ (id)URLIfFileExists:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "fileExistsAtPath:", v6))
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

+ (id)gregorianCalendar
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDBCE48]);
  v3 = (void *)objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x24BDBD3B8]);
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  return v3;
}

+ (id)addToDate:(id)a3 numberOfDays:(int64_t)a4
{
  CFAbsoluteTime v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CFAbsoluteTime at;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  at = v5;
  if (CFCalendarAddComponents((CFCalendarRef)+[SUUtility gregorianCalendar](SUUtility, "gregorianCalendar"), &at, 0, "d", a4))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", at);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SULogDebug(CFSTR("addToDate:numberOfDays: unable to add %ld days to date: %f"), v6, v7, v8, v9, v10, v11, v12, a4);
    v13 = 0;
  }
  return v13;
}

+ (id)prettyPrintDate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)prettyPrintDate____dateFormatter;
  if (!prettyPrintDate____dateFormatter)
  {
    v5 = objc_opt_new();
    v6 = (void *)prettyPrintDate____dateFormatter;
    prettyPrintDate____dateFormatter = v5;

    objc_msgSend((id)prettyPrintDate____dateFormatter, "setDateStyle:", 1);
    v7 = (void *)prettyPrintDate____dateFormatter;
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v8);

    objc_msgSend((id)prettyPrintDate____dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
    v4 = (void *)prettyPrintDate____dateFormatter;
  }
  objc_msgSend(v4, "stringFromDate:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)systemContainerURL
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  uint64_t v18;

  v2 = (void *)systemContainerURL_systemContainerUrl;
  if (!systemContainerURL_systemContainerUrl)
  {
    v3 = container_system_path_for_identifier();
    if (v3)
    {
      v11 = (void *)v3;
      SULogDebug(CFSTR("System container path is %s"), v4, v5, v6, v7, v8, v9, v10, v3);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v11, 1, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)systemContainerURL_systemContainerUrl;
      systemContainerURL_systemContainerUrl = v12;

      free(v11);
      v14 = systemContainerURL_systemContainerUrl;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend((id)v14, "setResourceValue:forKey:error:", v15, *MEMORY[0x24BDBCC68], 0);

      if ((v14 & 1) != 0)
      {
LABEL_7:
        v2 = (void *)systemContainerURL_systemContainerUrl;
        return v2;
      }
      v16 = CFSTR("failed to exclude system container from backup");
    }
    else
    {
      v18 = 1;
      v16 = CFSTR("Error getting system container: %llu");
    }
    SULogDebug(v16, v4, v5, v6, v7, v8, v9, v10, v18);
    goto LABEL_7;
  }
  return v2;
}

+ (BOOL)writeKeepAliveFilePath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "createFileAtPath:contents:attributes:", v4, 0, 0);

  if (v6)
    v14 = CFSTR("Successfully wrote keep alive file:%@");
  else
    v14 = CFSTR("Failed to write keep alive file:%@");
  SULogDebug(v14, v7, v8, v9, v10, v11, v12, v13, (uint64_t)v4);

  return v6;
}

+ (BOOL)deleteKeepAliveFilePath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, 0) & 1) != 0)
  {
    v29 = 0;
    v12 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v29);
    v20 = v29;
    if (v12)
    {
      SULogDebug(CFSTR("Successfully deleted keep alive file:%@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v3);
    }
    else
    {
      SULogDebug(CFSTR("Failed to delete keep alive file:%@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v3);
      if (v20)
        SULogDebug(CFSTR("Delete error: %@"), v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);
    }

  }
  else
  {
    SULogDebug(CFSTR("No keep alive file found at:%@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v3);
    LOBYTE(v12) = 1;
  }

  return v12;
}

+ (BOOL)writeKeepAliveFile
{
  return +[SUUtility writeKeepAliveFilePath:](SUUtility, "writeKeepAliveFilePath:", CFSTR("/var/mobile/Library/SoftwareUpdate/susdKeepAlive"));
}

+ (BOOL)deleteKeepAliveFile
{
  return +[SUUtility deleteKeepAliveFilePath:](SUUtility, "deleteKeepAliveFilePath:", CFSTR("/var/mobile/Library/SoftwareUpdate/susdKeepAlive"));
}

+ (BOOL)writeAUKeepAliveFile
{
  return +[SUUtility writeKeepAliveFilePath:](SUUtility, "writeKeepAliveFilePath:", CFSTR("/var/mobile/Library/SoftwareUpdate/susdAUKeepAlive"));
}

+ (BOOL)deleteAUKeepAliveFile
{
  return +[SUUtility deleteKeepAliveFilePath:](SUUtility, "deleteKeepAliveFilePath:", CFSTR("/var/mobile/Library/SoftwareUpdate/susdAUKeepAlive"));
}

+ (id)bootTime
{
  int v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  int v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6 = 0;
  *(_QWORD *)v8 = 0x1500000001;
  v7 = 16;
  v2 = sysctl(v8, 2u, &v5, &v7, 0, 0);
  v3 = 0;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(v5 + (int)v6 / 0xF4240uLL));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)isSplatRollbackDirectoryPresent
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  BOOL v14;
  char v16;
  id v17;

  objc_msgSend(MEMORY[0x24BE63540], "sharedDataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v3 = (void *)objc_msgSend(v2, "copyPathForPersistentData:error:", 112, &v17);
  v4 = v17;

  if (v3)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v3, &v16);
    if (v16)
      v14 = v13;
    else
      v14 = 0;

  }
  else
  {
    SULogInfo(CFSTR("Failed to get path to rollback assets: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isSplatOnlyUpdateInstalled
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  int v13;
  uint64_t v14;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fakeSplatInstalled");

  if (v3)
  {
    SULogInfo(CFSTR("Fake splat installed"), v4, v5, v6, v7, v8, v9, v10, v14);
    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasSplatOnlyUpdateInstalled");

    return v13;
  }
}

+ (id)documentationDataForInstalledUpdateType:(int)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  SUDocumentationData *v24;
  uint64_t v25;
  SUDocumentationData *v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  v5 = *(_QWORD *)&a3;
  if (a4)
    *a4 = 0;
  v14 = objc_alloc_init(MEMORY[0x24BEAE810]);
  if (v14)
  {
    v37 = 0;
    objc_msgSend(v14, "getDocumentationDataForInstalledUpdateType:withError:", objc_msgSend(a1, "SUUpdateTypeFromCoreUpdateTypes:", v5), &v37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v37;
    if (!v15)
    {
      SUStringFromOSUpdateType(v5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("SUCoreDocumentationData not found for updateType: %@"), v29, v30, v31, v32, v33, v34, v35, (uint64_t)v28);

      +[SUUtility translateError:](SUUtility, "translateError:", v16);
      v25 = objc_claimAutoreleasedReturnValue();

      v24 = 0;
      v15 = 0;
LABEL_12:
      v16 = (id)v25;
      if (!a4)
        goto LABEL_10;
      goto LABEL_9;
    }
    v24 = -[SUDocumentationData initWithSUCoreDocumentationData:]([SUDocumentationData alloc], "initWithSUCoreDocumentationData:", v15);
    if (!v24)
    {
      SULogInfo(CFSTR("Failed to create SUDocumentationData from SUCoreDocumentationData"), v17, v18, v19, v20, v21, v22, v23, v36);
      +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 38);
      v25 = objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
  }
  else
  {
    SULogInfo(CFSTR("SUCoreDocumentationDataManager failed to initialize"), v7, v8, v9, v10, v11, v12, v13, v36);
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 95);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v15 = 0;
  }
  if (a4)
LABEL_9:
    *a4 = objc_retainAutorelease(v16);
LABEL_10:
  v26 = v24;

  return v26;
}

+ (int64_t)compareRestoreVersion:(id)a3 withRestoreVersion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int64_t v11;

  v5 = (objc_class *)MEMORY[0x24BEAEA88];
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend([v5 alloc], "initWithRestoreVersion:", v7);

  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA88]), "initWithRestoreVersion:", v6);
  if (v8 | v9)
  {
    if (v8)
      v10 = v9 == 0;
    else
      v10 = 0;
    if (v10)
    {
      v11 = 1;
    }
    else if (v8 || !v9)
    {
      v11 = objc_msgSend((id)v8, "compare:", v9);
    }
    else
    {
      v11 = -1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (unint64_t)SUUpdateTypeFromCoreUpdateTypes:(int)a3
{
  return a3 == 1;
}

+ (double)autoScanTimeInterval
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  SULogInfo(CFSTR("[Auto scan] Customer: Scanning every 1 day"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 86400.0;
}

+ (double)autoDownloadTimeInterval
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  double v13;
  int v14;
  BOOL v15;
  uint64_t v17;

  +[SUUtility currentReleaseType](SUUtility, "currentReleaseType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Internal")) & 1) != 0)
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "scanWeeklyInternally");

    if (!v4)
    {
      v12 = CFSTR("[Auto scan] Apple Internal: Downloading every 1 day");
      v13 = 86400.0;
      goto LABEL_11;
    }
  }
  else
  {

  }
  v14 = objc_msgSend((id)objc_opt_class(), "isLockdownModeEnabled");
  v15 = v14 == 0;
  if (v14)
    v12 = CFSTR("[Auto scan]: Lockdown mode enabled: Downloading every 1 day");
  else
    v12 = CFSTR("[Auto scan] Customer: Downloading every 5 days");
  if (v15)
    v13 = 432000.0;
  else
    v13 = 86400.0;
LABEL_11:
  SULogInfo(v12, v5, v6, v7, v8, v9, v10, v11, v17);
  return v13;
}

+ (void)systemRootStatus:(BOOL *)a3 rootsFound:(BOOL *)a4
{
  if (systemRootStatus_rootsFound__onceToken == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&systemRootStatus_rootsFound__onceToken, &__block_literal_global_478);
  if (a3)
LABEL_3:
    *a3 = systemRootStatus_rootsFound__is_live_fs;
LABEL_4:
  if (a4)
    *a4 = systemRootStatus_rootsFound__darwinup;
}

void __41__SUUtility_systemRootStatus_rootsFound___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  statfs v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  bzero(&v22, 0x878uLL);
  if (statfs("/", &v22))
  {
    __error();
    SULogInfo(CFSTR("%s: statfs(\"/\") failed: %d"), v0, v1, v2, v3, v4, v5, v6, (uint64_t)"+[SUUtility systemRootStatus:rootsFound:]_block_invoke");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v22.f_mntfromname);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsString:", CFSTR("darwinup")))
    {
      SULogInfo(CFSTR("%s: rooted from darwinup snapshot %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"+[SUUtility systemRootStatus:rootsFound:]_block_invoke");
      systemRootStatus_rootsFound__darwinup = 1;
    }
    if (objc_msgSend(v7, "hasPrefix:", CFSTR("/dev/disk")))
    {
      SULogInfo(CFSTR("%s: rooted from live fs %@"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)"+[SUUtility systemRootStatus:rootsFound:]_block_invoke");
      systemRootStatus_rootsFound__is_live_fs = 1;
    }

  }
}

@end
