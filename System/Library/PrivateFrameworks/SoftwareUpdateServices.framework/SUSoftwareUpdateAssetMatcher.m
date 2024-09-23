@implementation SUSoftwareUpdateAssetMatcher

+ (id)matcherForCurrentDevice
{
  return +[SUSoftwareUpdateAssetMatcher matcherForCurrentDeviceWithInterestedStates:](SUSoftwareUpdateAssetMatcher, "matcherForCurrentDeviceWithInterestedStates:", 0);
}

+ (id)matcherForCurrentDeviceWithInterestedStates:(int)a3
{
  return -[SUSoftwareUpdateAssetMatcher initWithVersion:build:productType:releaseType:interestedStates:matcherInfo:]([SUSoftwareUpdateAssetMatcher alloc], "initWithVersion:build:productType:releaseType:interestedStates:matcherInfo:", +[SUUtility currentProductVersion](SUUtility, "currentProductVersion"), +[SUUtility currentProductBuild](SUUtility, "currentProductBuild"), +[SUUtility currentProductType](SUUtility, "currentProductType"), +[SUUtility currentReleaseType](SUUtility, "currentReleaseType"), *(_QWORD *)&a3, 0);
}

+ (id)matcherForCurrentDeviceWithInfo:(id)a3
{
  return -[SUSoftwareUpdateAssetMatcher initWithVersion:build:productType:releaseType:interestedStates:matcherInfo:]([SUSoftwareUpdateAssetMatcher alloc], "initWithVersion:build:productType:releaseType:interestedStates:matcherInfo:", +[SUUtility currentProductVersion](SUUtility, "currentProductVersion"), +[SUUtility currentProductBuild](SUUtility, "currentProductBuild"), +[SUUtility currentProductType](SUUtility, "currentProductType"), +[SUUtility currentReleaseType](SUUtility, "currentReleaseType"), 0, a3);
}

- (SUSoftwareUpdateAssetMatcher)initWithVersion:(id)a3 build:(id)a4 productType:(id)a5 releaseType:(id)a6 interestedStates:(int)a7 matcherInfo:(id)a8
{
  SUSoftwareUpdateAssetMatcher *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUSoftwareUpdateAssetMatcher;
  v13 = -[SUAssetStateMatcher initWithType:interestedStates:](&v15, sel_initWithType_interestedStates_, CFSTR("com.apple.MobileAsset.SoftwareUpdate"), *(_QWORD *)&a7);
  if (v13)
  {
    v13->_fromVersion = (NSString *)a3;
    v13->_fromBuild = (NSString *)a4;
    v13->_fromProductType = (NSString *)a5;
    v13->_fromReleaseType = (NSString *)a6;
    v13->_checkTatsu = 1;
    v13->_preferences = +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v13->_matcherInfo = (NSDictionary *)a8;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSoftwareUpdateAssetMatcher;
  -[SUSoftwareUpdateAssetMatcher dealloc](&v3, sel_dealloc);
}

- (id)_findMatchFromCandidates:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v10 = (void *)MEMORY[0x212BF5ECC]();
      v11 = objc_msgSend(a3, "objectAtIndex:", i);
      if (-[SUSoftwareUpdateAssetMatcher _isPossibleSoftwareUpdate:](self, "_isPossibleSoftwareUpdate:", v11))
      {
        if (self->_checkTatsu
          && !-[SUSoftwareUpdateAssetMatcher _isDeviceEligibleForUpdate:](self, "_isDeviceEligibleForUpdate:", v11))
        {
          SULogInfo(CFSTR("Ignoring SU match due to personalization eligibility check: %@"), v12, v13, v14, v15, v16, v17, v18, v11);
        }
        else
        {
          objc_msgSend(v6, "addObject:", v11);
        }
      }
      objc_autoreleasePoolPop(v10);
    }
  }
  v19 = -[SUSoftwareUpdateAssetMatcher _copyMatchingAssetsAfterSortingAndFiltering:](self, "_copyMatchingAssetsAfterSortingAndFiltering:", v6);
  v20 = objc_msgSend(v19, "count");
  if (v19)
    v21 = v20 == 0;
  else
    v21 = 1;
  if (v21)
    goto LABEL_23;
  if (v20 != 1)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v24 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v24)
    {
      v32 = v24;
      v33 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v19);
          objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "attributes"));
        }
        v32 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v32);
    }
    SULogInfo(CFSTR("Unable to find update due to ambiguous results: %@"), v25, v26, v27, v28, v29, v30, v31, (uint64_t)v23);
LABEL_23:
    +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", a4, 3);
    v22 = 0;
    goto LABEL_24;
  }
  v22 = (void *)objc_msgSend(v19, "objectAtIndex:", 0);
LABEL_24:

  return v22;
}

- (void)_modifyMADownloadOptions:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;

  if (MGGetBoolAnswer())
    v5 = 60;
  else
    v5 = 30;
  objc_msgSend(a3, "setTimeoutIntervalForResource:", v5);
  objc_msgSend(a3, "setDiscretionary:", 0);
  objc_msgSend(a3, "setAllowsCellularAccess:", 1);
  objc_msgSend(a3, "setAllowsExpensiveAccess:", 1);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection"), "isSupervised") & 1) != 0)
  {
    objc_msgSend(a3, "setSupervised:", 1);
    v6 = -[NSDictionary objectForKey:](self->_matcherInfo, "objectForKey:", CFSTR("RequestedPMV"));
    if (v6)
    {
      v14 = v6;
      SULogInfo(CFSTR("Requesting PMV %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
      objc_msgSend(a3, "setRequestedProductVersion:", v14);
    }
    v15 = -[NSDictionary objectForKey:](self->_matcherInfo, "objectForKey:", CFSTR("delayPeriod"));
    if (v15)
    {
      v16 = v15;
      if (objc_msgSend(v15, "longValue") >= 1 && objc_msgSend(v16, "longValue") <= 90)
      {
        v17 = objc_msgSend(v16, "longValue");
        SULogInfo(CFSTR("Requesting delay period %lu"), v18, v19, v20, v21, v22, v23, v24, v17);
        objc_msgSend(a3, "setDelayPeriod:", objc_msgSend(v16, "longValue"));
      }
    }
  }
  v25 = -[NSDictionary objectForKey:](self->_matcherInfo, "objectForKey:", kSUScanTypeKey);
  if (v25)
  {
    v26 = v25;
    if (!objc_msgSend(a3, "additionalServerParams"))
      objc_msgSend(a3, "setAdditionalServerParams:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionary"));
    objc_msgSend((id)objc_msgSend(a3, "additionalServerParams"), "setObject:forKey:", v26, CFSTR("DeviceCheck"));
  }
  v27 = -[NSDictionary objectForKey:](self->_matcherInfo, "objectForKey:", kSUSessionIDKey);
  if (v27)
  {
    v28 = v27;
    if (!objc_msgSend(a3, "additionalServerParams"))
      objc_msgSend(a3, "setAdditionalServerParams:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionary"));
    objc_msgSend((id)objc_msgSend(a3, "additionalServerParams"), "setObject:forKey:", v28, CFSTR("SessionId"));
  }
}

- (id)_createCleanOSVersionString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if ((unint64_t)objc_msgSend(a3, "length") >= 4
    && objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("9.9."), 0, 0, 4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = (id)objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_24CE3EA48);
    SULogInfo(CFSTR("9.9. replaced in currSecond. New version string: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }
  return v3;
}

- (unint64_t)_getIndexOfHighestVersionedAsset:(id)a3 usingFirstKey:(id)a4 secondKey:(id)a5
{
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v17;
  uint64_t v18;

  v18 = objc_msgSend(a3, "count");
  if (v18)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v17 = 0;
    while (1)
    {
      v12 = (void *)MEMORY[0x212BF5ECC]();
      v13 = (void *)objc_msgSend(a3, "objectAtIndex:", v7);
      v14 = v13;
      if (a4
        && (v9 = (const __CFString *)objc_msgSend((id)objc_msgSend(v13, "attributes"), "safeObjectForKey:ofClass:", a4, objc_opt_class()), !objc_msgSend(a4, "compare:", CFSTR("OSVersion"))))
      {
        v9 = -[SUSoftwareUpdateAssetMatcher _createCleanOSVersionString:](self, "_createCleanOSVersionString:", v9);
        if (a5)
        {
LABEL_6:
          v8 = (const __CFString *)objc_msgSend((id)objc_msgSend(v14, "attributes"), "safeObjectForKey:ofClass:", a5, objc_opt_class());
          if (!objc_msgSend(a5, "compare:", CFSTR("OSVersion")))
            v8 = -[SUSoftwareUpdateAssetMatcher _createCleanOSVersionString:](self, "_createCleanOSVersionString:", v8);
        }
      }
      else if (a5)
      {
        goto LABEL_6;
      }
      if (!((unint64_t)v11 | (unint64_t)v10)
        || (v9 == v11 || v11 && v9 && (CFStringCompare(v9, v11, 0x40uLL) & 0x8000000000000000) == 0)
        && (v8 == v10 || v10 && v8 && (CFStringCompare(v8, v10, 0x40uLL) & 0x8000000000000000) == 0))
      {
        v17 = v7;
        v11 = v9;
        v10 = v8;
      }
      objc_autoreleasePoolPop(v12);
      if (v18 == ++v7)
        return v17;
    }
  }
  return 0;
}

- (id)_createSortedAndFilteredAssetResults:(id)a3 usingFirstKey:(id)a4 secondKey:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  id v18;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;

  v23 = (void *)objc_msgSend(a3, "objectAtIndex:", -[SUSoftwareUpdateAssetMatcher _getIndexOfHighestVersionedAsset:usingFirstKey:secondKey:](self, "_getIndexOfHighestVersionedAsset:usingFirstKey:secondKey:"));
  v21 = a3;
  v8 = objc_msgSend(a3, "count");
  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = v8;
  if (v8)
  {
    v9 = 0;
    do
    {
      v10 = (void *)MEMORY[0x212BF5ECC]();
      v11 = (void *)objc_msgSend(v21, "objectAtIndex:", v9);
      if (a4)
      {
        v12 = v11;
        v13 = (const __CFString *)objc_msgSend((id)objc_msgSend(v11, "attributes"), "safeObjectForKey:ofClass:", a4, objc_opt_class());
        v14 = (const __CFString *)objc_msgSend((id)objc_msgSend(v23, "attributes"), "safeObjectForKey:ofClass:", a4, objc_opt_class());
        if (!objc_msgSend(a4, "compare:", CFSTR("OSVersion")))
        {
          v13 = -[SUSoftwareUpdateAssetMatcher _createCleanOSVersionString:](self, "_createCleanOSVersionString:", v13);
          v14 = -[SUSoftwareUpdateAssetMatcher _createCleanOSVersionString:](self, "_createCleanOSVersionString:", v14);
        }
        v11 = v12;
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      v22 = v11;
      if (a5)
      {
        v15 = (const __CFString *)objc_msgSend((id)objc_msgSend(v11, "attributes"), "safeObjectForKey:ofClass:", a5, objc_opt_class());
        v16 = (const __CFString *)objc_msgSend((id)objc_msgSend(v23, "attributes"), "safeObjectForKey:ofClass:", a5, objc_opt_class());
        if (!objc_msgSend(a5, "compare:", CFSTR("OSVersion")))
        {
          v15 = -[SUSoftwareUpdateAssetMatcher _createCleanOSVersionString:](self, "_createCleanOSVersionString:", v15);
          v16 = -[SUSoftwareUpdateAssetMatcher _createCleanOSVersionString:](self, "_createCleanOSVersionString:", v16);
        }
      }
      else
      {
        v15 = 0;
        v16 = 0;
      }
      if ((v13 == v14 || v13 && v14 && CFStringCompare(v13, v14, 0x40uLL) == kCFCompareEqualTo)
        && (v15 == v16 || v15 && v16 && CFStringCompare(v15, v16, 0x40uLL) == kCFCompareEqualTo))
      {
        objc_msgSend(v18, "addObject:", v22);
      }
      objc_autoreleasePoolPop(v10);
      ++v9;
    }
    while (v20 != v9);
  }
  return v18;
}

- (id)_copyMatchingAssetsAfterSortingAndFiltering:(id)a3
{
  id v3;
  id v6;
  id v7;

  v3 = a3;
  if (!a3)
    return v3;
  if ((unint64_t)objc_msgSend(a3, "count") <= 1)
    return (id)objc_msgSend(v3, "copy");
  v6 = -[SUSoftwareUpdateAssetMatcher _createSortedAndFilteredAssetResults:usingFirstKey:secondKey:](self, "_createSortedAndFilteredAssetResults:usingFirstKey:secondKey:", -[SUSoftwareUpdateAssetMatcher _filterPatchesIfNecessary:](self, "_filterPatchesIfNecessary:", v3), CFSTR("Build"), CFSTR("OSVersion"));
  v3 = v6;
  if (!v6 || (unint64_t)objc_msgSend(v6, "count") < 2)
    return v3;
  v7 = v3;
  return -[SUSoftwareUpdateAssetMatcher _createSortedAndFilteredAssetResults:usingFirstKey:secondKey:](self, "_createSortedAndFilteredAssetResults:usingFirstKey:secondKey:", v3, CFSTR("PrerequisiteBuild"), CFSTR("PrerequisiteOSVersion"));
}

- (id)_filterPatchesIfNecessary:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = +[SUState currentState](SUState, "currentState");
  v18 = (void *)objc_msgSend(a3, "mutableCopy");
  if (!-[SUPreferences disableFullReplacementFallback](+[SUPreferences sharedInstance](SUPreferences, "sharedInstance"), "disableFullReplacementFallback")&& objc_msgSend(a3, "count"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(a3, "objectAtIndex:", v4);
      v6 = objc_msgSend((id)objc_msgSend(v5, "attributes"), "safeObjectForKey:ofClass:", CFSTR("Build"), objc_opt_class());
      v7 = objc_msgSend((id)objc_msgSend(v5, "attributes"), "safeObjectForKey:ofClass:", CFSTR("PrerequisiteBuild"), objc_opt_class());
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v8 = (void *)objc_msgSend(v19, "failedPatchDescriptors");
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            v14 = objc_msgSend(v13, "productBuildVersion");
            if (v14)
              v15 = v6 == v14;
            else
              v15 = 0;
            if (v15 && v7 != 0)
            {
              objc_msgSend(v18, "removeObject:", v13);
              goto LABEL_19;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v10);
      }
LABEL_19:
      ++v4;
    }
    while (objc_msgSend(a3, "count") > v4);
  }
  return v18;
}

- (BOOL)_isDeviceEligibleForUpdate:(id)a3
{
  const void *v3;
  const void *v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFBoolean *v14;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  char v27;
  const void *v28;
  __CFDictionary *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  if (!objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", CFSTR("UniqueBuildID")))
    return 1;
  v3 = (const void *)MGCopyAnswer();
  v4 = (const void *)MGCopyAnswer();
  v5 = (const void *)MGCopyAnswer();
  v6 = MGCopyAnswer();
  v14 = (const __CFBoolean *)v6;
  if (v3 && v4 && v5 && v6)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v16 = Mutable;
    if (Mutable)
    {
      MEMORY[0x212BF583C](Mutable, *MEMORY[0x24BEDA778], 1);
      CFBooleanGetValue(v14);
      AMAuthInstallSupportDictionarySetBoolean();
      CFDictionarySetValue(v16, (const void *)*MEMORY[0x24BEDA748], v3);
      CFDictionarySetValue(v16, (const void *)*MEMORY[0x24BEDA740], v4);
      CFDictionarySetValue(v16, (const void *)*MEMORY[0x24BEDA738], v5);
      v17 = AMAuthInstallCreate();
      v18 = AMAuthInstallApSetParameters();
      if ((_DWORD)v18)
      {
        SULogInfo(CFSTR("Could not set AP fusings: %d"), v19, v20, v21, v22, v23, v24, v25, v18);
LABEL_26:
        v27 = 0;
LABEL_27:
        CFRelease(v3);
        v26 = v27;
        v28 = (const void *)v17;
        v29 = v16;
        if (!v4)
          goto LABEL_13;
        goto LABEL_12;
      }
      v31 = AMAuthInstallRequestAbbreviatedSendSync();
      if ((_DWORD)v31)
      {
        SULogInfo(CFSTR("Personalization request failed: %d"), v32, v33, v34, v35, v36, v37, v38, v31);
        goto LABEL_26;
      }
      if (!CFDictionaryContainsKey(0, CFSTR("@ServerVersion")) || CFDictionaryGetCount(0) >= 2)
      {
        SULogInfo(CFSTR("Response from tatsu contains more than 1 key. Please file a bug."), v39, v40, v41, v42, v43, v44, v45, v53);
        SULogInfo(CFSTR("Tatsu response: %@"), v46, v47, v48, v49, v50, v51, v52, 0);
      }
      SULogDebug(CFSTR("Tatsu response: %@"), v39, v40, v41, v42, v43, v44, v45, 0);
    }
    else
    {
      v17 = 0;
    }
    v27 = 1;
    goto LABEL_27;
  }
  SULogInfo(CFSTR("Could not gather necessary information for personalization request"), v7, v8, v9, v10, v11, v12, v13, v53);
  v27 = 0;
  v17 = 0;
  v16 = 0;
  v26 = 0;
  v28 = 0;
  v29 = 0;
  if (v3)
    goto LABEL_27;
  if (v4)
LABEL_12:
    CFRelease(v4);
LABEL_13:
  if (v5)
    CFRelease(v5);
  if (v14)
    CFRelease(v14);
  if (v28)
    CFRelease(v28);
  if (v29)
    CFRelease(v29);
  return v26;
}

- (BOOL)_isPossibleSoftwareUpdate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *fromBuild;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  int v44;
  NSString *fromReleaseType;
  const __CFString *v48;
  uint64_t v49;

  v5 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "safeObjectForKey:ofClass:", CFSTR("OSVersion"), objc_opt_class());
  if (!v5)
  {
    SULogDebug(CFSTR("Missing key %@ from asset map entry or type wasn't a string"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)CFSTR("OSVersion"));
LABEL_19:
    LOBYTE(v44) = 0;
    return v44;
  }
  v13 = -[SUSoftwareUpdateAssetMatcher _createCleanOSVersionString:](self, "_createCleanOSVersionString:", v5);
  v14 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "safeObjectForKey:ofClass:", CFSTR("Build"), objc_opt_class());
  if (!v14)
  {
    SULogDebug(CFSTR("Missing key %@ from asset map entry or type wasn't a string."), v15, v16, v17, v18, v19, v20, v21, (uint64_t)CFSTR("Build"));
    goto LABEL_19;
  }
  v22 = (void *)v14;
  v23 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", CFSTR("ReleaseType"));
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v48 = CFSTR("ReleaseType");
LABEL_17:
      v43 = CFSTR("Mistyped key %@ from asset map entry (expected string)");
      goto LABEL_18;
    }
  }
  v31 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "safeObjectForKey:ofClass:", CFSTR("SupportedDevices"), objc_opt_class());
  if (!v31)
  {
    SULogDebug(CFSTR("Missing key %@ from asset map entry or type wasn't an array"), v32, v33, v34, v35, v36, v37, v38, (uint64_t)CFSTR("SupportedDevices"));
    goto LABEL_19;
  }
  v39 = (void *)v31;
  v40 = CFSTR("PrerequisiteBuild");
  v41 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", CFSTR("PrerequisiteBuild"));
  if (v41 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v40 = CFSTR("PrerequisiteOSVersion"),
        (v42 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", CFSTR("PrerequisiteOSVersion"))) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v48 = v40;
    goto LABEL_17;
  }
  if ((v41 != 0) != (v42 != 0))
  {
    v43 = CFSTR("Cannot have prerequisite version or build without it's sibling.");
LABEL_18:
    SULogDebug(v43, v24, (uint64_t)fromBuild, v26, v27, v28, v29, v30, (uint64_t)v48);
    goto LABEL_19;
  }
  if (!self->_fromVersion)
  {
    v43 = CFSTR("No version to search from");
    goto LABEL_18;
  }
  fromBuild = self->_fromBuild;
  if (!fromBuild)
  {
    v43 = CFSTR("No build to search from");
    goto LABEL_18;
  }
  if (!self->_fromProductType)
  {
    v43 = CFSTR("No product type to search for");
    goto LABEL_18;
  }
  v49 = objc_msgSend(v22, "compareNumerically:");
  if (!-[SUPreferences disableBuildNumberComparison](self->_preferences, "disableBuildNumberComparison"))
  {
    if (objc_msgSend(v13, "compareNumerically:", self->_fromVersion) == -1)
      goto LABEL_19;
    if (!(-[SUPreferences allowSameBuildUpdates](self->_preferences, "allowSameBuildUpdates") ? v49 != -1 : v49 == 1))
      goto LABEL_19;
  }
  v44 = objc_msgSend(v39, "containsObject:", self->_fromProductType);
  if (!v44)
    return v44;
  if (v41 && objc_msgSend(v41, "compareNumerically:", self->_fromBuild)
    || v42 && objc_msgSend(v42, "compareNumerically:", self->_fromVersion))
  {
    goto LABEL_19;
  }
  fromReleaseType = self->_fromReleaseType;
  if (fromReleaseType == (NSString *)v23)
    goto LABEL_39;
  LOBYTE(v44) = 0;
  if (v23 && fromReleaseType)
  {
    if (-[NSString compare:](self->_fromReleaseType, "compare:", v23))
      goto LABEL_19;
LABEL_39:
    LOBYTE(v44) = 1;
  }
  return v44;
}

- (NSString)fromBuild
{
  return self->_fromBuild;
}

- (NSString)fromVersion
{
  return self->_fromVersion;
}

- (NSString)fromProductType
{
  return self->_fromProductType;
}

- (NSString)fromReleaseType
{
  return self->_fromReleaseType;
}

- (BOOL)compareWithTatsuForEligibility
{
  return self->_checkTatsu;
}

- (void)setCompareWithTatsuForEligibility:(BOOL)a3
{
  self->_checkTatsu = a3;
}

- (SUPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSDictionary)matcherInfo
{
  return self->_matcherInfo;
}

@end
