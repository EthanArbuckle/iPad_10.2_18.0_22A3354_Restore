void sub_1B86C82EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void SSScreenTimeStatusClearCache()
{
  if (onceCacheToken != -1)
    dispatch_once(&onceCacheToken, &__block_literal_global_459);
  os_unfair_lock_lock((os_unfair_lock_t)&screenTimeCacheLock);
  objc_msgSend((id)checkedScreenTimeStatusCache, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)&screenTimeCacheLock);
}

void __initCacheOnce_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;

  v0 = objc_opt_new();
  v1 = (void *)checkedScreenTimeStatusCache;
  checkedScreenTimeStatusCache = v0;

  v2 = objc_opt_new();
  v3 = (void *)screenTimeStatusForBundleCache;
  screenTimeStatusForBundleCache = v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("screenTimeStatusBundleFetchQueue", v6);
  v5 = (void *)screenTimeStatusFetchQueue;
  screenTimeStatusFetchQueue = (uint64_t)v4;

}

id SSDefaultsGetResources()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)sSRResources;
  if (!sSRResources)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "processName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 && objc_msgSend(v2, "length"))
    {
      v8 = CFSTR("SRResourcesOwner");
      v9[0] = v2;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DA9C88], "sharedResourcesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourcesForClient:options:", CFSTR("Spotlight"), v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)sSRResources;
    sSRResources = v5;

    v0 = (void *)sSRResources;
  }
  return v0;
}

id SSGeneralLog()
{
  uint64_t *v0;

  v0 = &updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken;
  if (SSLogHandles[0])
    return (id)SSLogHandles[0];
  if (SSInitLogging_once != -1)
  {
    dispatch_once(&SSInitLogging_once, &__block_literal_global_20);
    v0 = &updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken;
  }
  return (id)v0[31];
}

void sub_1B86CA1F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PRSLogCategoryDefault()
{
  if (PRSLogCategoryDefault_onceToken != -1)
    dispatch_once(&PRSLogCategoryDefault_onceToken, &__block_literal_global_51);
  return (id)PRSLogCategoryDefault_defaultLog;
}

void sub_1B86CA550(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SSResultTypeIsSuggestion(unsigned int a1)
{
  return (a1 < 0x27) & (0x4FF8038000uLL >> a1);
}

id SSGetDisabledBundleSet()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E20];
  v1 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledBundles"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObject:", CFSTR("com.apple.application"));
    objc_msgSend(v2, "removeObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    objc_msgSend(v2, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
    objc_msgSend(v2, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
    objc_msgSend(v2, "removeObject:", CFSTR("com.apple.FileProvider.LocalStorage"));
    if (objc_msgSend(v1, "containsObject:", CFSTR("com.apple.DocumentsApp")))
    {
      objc_msgSend(v2, "addObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
      objc_msgSend(v2, "addObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
      objc_msgSend(v2, "addObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
      objc_msgSend(v2, "addObject:", CFSTR("com.apple.FileProvider.LocalStorage"));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v0, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

CFPropertyListRef SICreateDictionaryWithContentsOfURL(const __CFURL *a1, __CFError **a2)
{
  return _createDictionaryWithContentsOfURL(a1, 0, a2);
}

CFPropertyListRef _createDictionaryWithContentsOfURL(CFURLRef fileURL, int a2, __CFError **a3)
{
  __CFReadStream *v6;
  __CFReadStream *v7;
  CFOptionFlags v8;
  CFPropertyListRef v9;
  CFTypeID v10;
  const __CFString *v11;

  v6 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x1E0C9AE00], fileURL);
  if (!v6)
  {
    if (a3)
    {
      v11 = CFSTR("File at URL is not readable");
      goto LABEL_15;
    }
    return 0;
  }
  v7 = v6;
  if (!CFReadStreamOpen(v6))
  {
    CFRelease(v7);
    goto LABEL_13;
  }
  if (a2)
    v8 = 2;
  else
    v8 = 0;
  v9 = CFPropertyListCreateWithStream(0, v7, 0, v8, 0, 0);
  CFReadStreamClose(v7);
  CFRelease(v7);
  if (!v9)
  {
LABEL_13:
    if (a3)
    {
      v11 = CFSTR("File at URL is not a valid property list");
      goto LABEL_15;
    }
    return 0;
  }
  v10 = CFGetTypeID(v9);
  if (v10 != CFDictionaryGetTypeID())
  {
    if (a3)
    {
      v11 = CFSTR("Property list at URL is not a dictionary");
LABEL_15:
      v9 = 0;
      *a3 = _createErrorWithMessageAndURL(v11, fileURL);
      return v9;
    }
    return 0;
  }
  return v9;
}

CFPropertyListRef SICreateMutableDictionaryWithContentsOfURL(const __CFURL *a1, __CFError **a2)
{
  return _createDictionaryWithContentsOfURL(a1, 1, a2);
}

CFErrorRef _createErrorWithMessageAndURL(const __CFString *a1, CFURLRef anURL)
{
  CFStringRef v3;
  const __CFAllocator *v4;
  CFStringRef v5;
  CFStringRef v6;
  __CFDictionary *Mutable;
  CFErrorRef v8;

  if (anURL)
    v3 = CFURLCopyPath(anURL);
  else
    v3 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@: %@"), a1, v3);
  if (!v5)
  {
    v8 = 0;
    if (!v3)
      return v8;
    goto LABEL_6;
  }
  v6 = v5;
  Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9AFE0], v6);
  v8 = CFErrorCreate(v4, CFSTR("com.apple.SpotlightIndex.ErrorDomain"), 0, Mutable);
  CFRelease(v6);
  if (v3)
LABEL_6:
    CFRelease(v3);
  return v8;
}

size_t doBlockCompression(const uint8_t *a1, size_t a2, uint8_t **a3, compression_algorithm a4)
{
  size_t v8;
  uint8_t *v9;

  v8 = a2 + 4096;
  v9 = (uint8_t *)malloc_type_malloc(a2 + 4096, 0xA8E18B33uLL);
  *a3 = v9;
  return compression_encode_buffer(v9, v8, a1, a2, 0, a4);
}

size_t doBlockDecompression(const uint8_t *a1, size_t a2, size_t a3, uint8_t **a4, compression_algorithm a5, int *a6)
{
  int TemporaryFileOfSize;
  int v13;
  uint8_t *v14;
  size_t result;

  *a6 = -1;
  TemporaryFileOfSize = allocateTemporaryFileOfSize(a3, 2);
  if ((TemporaryFileOfSize & 0x80000000) == 0)
  {
    v13 = TemporaryFileOfSize;
    v14 = (uint8_t *)mmap(0, a3, 3, 1, TemporaryFileOfSize, 0);
    *a4 = v14;
    if (v14 != (uint8_t *)-1)
    {
      result = compression_decode_buffer(v14, a3, a1, a2, 0, a5);
      if (result)
      {
        *a6 = v13;
        return result;
      }
    }
    close(v13);
  }
  return 0;
}

uint64_t allocateTemporaryFileOfSize(off_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[4];
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15[0] = 0x300000002;
  v15[1] = 0;
  v15[2] = a1;
  v15[3] = 0;
  NSHomeDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/Library/Spotlight/Backup/temp_%lu.dat"), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = open((const char *)objc_msgSend(v7, "UTF8String"), 514, 384);
  if ((v8 & 0x80000000) != 0)
  {
    PRSLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      allocateTemporaryFileOfSize_cold_1();

    goto LABEL_13;
  }
  v9 = v8;
  if (fcntl(v8, 42, v15) == -1)
  {
    PRSLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *__error();
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl(&dword_1B86C5000, v10, OS_LOG_TYPE_INFO, "preallocated temporary file failed. %d\n", buf, 8u);
    }

  }
  if (ftruncate(v9, a1) == -1)
  {
    PRSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      allocateTemporaryFileOfSize_cold_2(v12);

    close(v9);
LABEL_13:
    v9 = 0xFFFFFFFFLL;
  }

  return v9;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1B86CF894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 96), 8);
  _Block_object_dispose((const void *)(v10 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B86CFC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 120), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

const char *isEventSearchIntent()
{
  const char *result;
  const char *v1;

  result = (const char *)intentLabel();
  if (result)
  {
    v1 = result;
    if (!strncmp(result, "INTENT_FLIGHT", 0xDuLL) || !strncmp(v1, "INTENT_HOTEL", 0xCuLL))
      return (const char *)1;
    else
      return (const char *)(strncmp(v1, "INTENT_RESTAURANT", 0x11uLL) == 0);
  }
  return result;
}

uint64_t translateKey(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("default")) & 1) != 0)
  {
    v2 = 0x7FFFFFFFFFFFFFFELL;
  }
  else
  {
    v3 = objc_msgSend(v1, "integerValue");
    if ((unint64_t)(v3 - 1) >= 0x3FF)
      v2 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v2 = v3;
  }

  return v2;
}

uint64_t indexForItem(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 == 0x7FFFFFFFFFFFFFFELL)
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "count");
    v5 = objc_msgSend(v3, "lastIndex");
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = 1;
    else
      v6 = v5 + 1;
    objc_msgSend(v3, "addIndex:", v6);
  }
  else
  {
    v4 = objc_msgSend(a2, "countOfIndexesInRange:", 0, a1);
  }

  return v4;
}

uint64_t isQUIntentMatchBundle(int a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString **v6;
  const char *v7;
  const char *v8;

  v3 = a2;
  v4 = v3;
  if (a1 <= 21)
  {
    v5 = 0;
    switch(a1)
    {
      case 0:
        goto LABEL_22;
      case 1:
        if ((SSSectionIsSyndicatedPhotos(v3) & 1) == 0)
          goto LABEL_16;
        goto LABEL_15;
      case 2:
        v6 = PRSRankingMailBundleString;
        goto LABEL_14;
      case 3:
        v6 = PRSRankingMessagesBundleString;
        goto LABEL_14;
      case 4:
        v6 = PRSRankingNotesBundleString;
        goto LABEL_14;
      case 5:
        if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.documents")) & 1) != 0
          || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.DocumentsApp")) & 1) != 0
          || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0
          || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0)
        {
          goto LABEL_15;
        }
        v6 = SSResultBundleIdFileProviderManagedDocument;
        goto LABEL_14;
      default:
        goto LABEL_16;
    }
  }
  switch(a1)
  {
    case 22:
      v6 = PRSRankingSafariBundleString;
      break;
    case 23:
      v6 = PRSRankingCalendarBundleString;
      break;
    case 24:
      v6 = PRSRankingRemindersBundleString;
      break;
    default:
      goto LABEL_16;
  }
LABEL_14:
  if ((objc_msgSend(v4, "isEqualToString:", *v6) & 1) != 0)
  {
LABEL_15:
    v5 = 1;
    goto LABEL_22;
  }
LABEL_16:
  v7 = (const char *)intentLabel();
  if (v7
    && ((v8 = v7, !strncmp(v7, "INTENT_FLIGHT", 0xDuLL))
     || !strncmp(v8, "INTENT_HOTEL", 0xCuLL)
     || !strncmp(v8, "INTENT_RESTAURANT", 0x11uLL)))
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.spotlight.events"));
  }
  else
  {
    v5 = 0;
  }
LABEL_22:

  return v5;
}

void sub_1B86DB780(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B86DE5A8(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x420], 8);
  _Block_object_dispose(&STACK[0x450], 8);
  _Unwind_Resume(a1);
}

uint64_t SPSpamDemotionDisabled()
{
  if (SPSpamDemotionDisabled_onceToken != -1)
    dispatch_once(&SPSpamDemotionDisabled_onceToken, &__block_literal_global_330);
  return SPSpamDemotionDisabled__spamDemotionDisabled;
}

uint64_t SPBlockGroupingEnabled()
{
  if (SPBlockGroupingEnabled_onceToken != -1)
    dispatch_once(&SPBlockGroupingEnabled_onceToken, &__block_literal_global_335);
  return SPBlockGroupingEnabled__blockGroupingEnabled;
}

uint64_t SPExperimentalScoringEnabled()
{
  if (SPExperimentalScoringEnabled_onceToken != -1)
    dispatch_once(&SPExperimentalScoringEnabled_onceToken, &__block_literal_global_338);
  return SPExperimentalScoringEnabled__experimentalScoringEnabled;
}

float SPRankingTopHitMustBeOverrideMinScore()
{
  if (SPRankingTopHitMustBeOverrideMinScore_onceToken != -1)
    dispatch_once(&SPRankingTopHitMustBeOverrideMinScore_onceToken, &__block_literal_global_341);
  return *(float *)&SPRankingTopHitMustBeOverrideMinScore__topHitMustBeOverrideMinScore;
}

float SPRankingTopHitMustBeOverrideMinFileScore()
{
  if (SPRankingTopHitMustBeOverrideMinFileScore_onceToken != -1)
    dispatch_once(&SPRankingTopHitMustBeOverrideMinFileScore_onceToken, &__block_literal_global_344);
  return *(float *)&SPRankingTopHitMustBeOverrideMinFileScore__topHitMustBeOverrideMinFileScore;
}

float SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore()
{
  if (SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore_onceToken != -1)
    dispatch_once(&SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore_onceToken, &__block_literal_global_347);
  return *(float *)&SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore__topHitMustBeOverrideMinSpellCorrectedAppScore;
}

BOOL preferShortCutOverFile(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  _BOOL8 v13;

  v3 = a1;
  v4 = a2;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v3, "attributes"), 7uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v4, "attributes"), 7uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    objc_msgSend(v3, "L2FeatureVector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scoreForFeature:", 165);
    v9 = v8;

    objc_msgSend(v4, "L2FeatureVector");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scoreForFeature:", 165);
    v12 = v11;

    v13 = v9 == v12 && v9 != 2147500000.0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t preferContactOverMusic(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  uint64_t v24;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "L2FeatureVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scoreForFeature:", 165);
  v7 = v6;

  v8 = SSMinContactsTopHitScore();
  if (v7 == 2147500000.0)
    goto LABEL_7;
  objc_msgSend(v3, "L2FeatureVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originalL2Score");
  v11 = v10;

  if (v11 <= v8)
    goto LABEL_7;
  objc_msgSend(v4, "L2FeatureVector");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scoreForFeature:", 167);
  v14 = v13;

  objc_msgSend(v4, "L2FeatureVector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scoreForFeature:", 185);
  v17 = v16;

  objc_msgSend(v4, "L2FeatureVector");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scoreForFeature:", 181);
  v20 = v19;

  objc_msgSend(v4, "L2FeatureVector");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scoreForFeature:", 876);
  v23 = v22;

  if (v14 != 2147500000.0 || v17 != 2147500000.0 || (v24 = 1, v20 == 2147500000.0) && v23 == 2147500000.0)
LABEL_7:
    v24 = 0;

  return v24;
}

BOOL preferAppOverPhotosApp(void *a1)
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "L2FeatureVector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scoreForFeature:", 165);
  v3 = v2;

  return v3 != 2147500000.0;
}

void logRule(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  id v18;
  id v19;

  v19 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 && isInternalDevice)
  {
    if (v7 && v8)
    {
      v10 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("item1=%@ item2=%@"), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!v7)
        goto LABEL_12;
      v14 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("item=%@"), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[__CFString objectForKey:](v9, "objectForKey:", v19);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      v17 = CFSTR("1");
      v18 = v13;
    }
    else
    {
      v16 = (__CFString *)objc_opt_new();
      -[__CFString setObject:forKey:](v16, "setObject:forKey:", CFSTR("1"), v13);
      v15 = v9;
      v17 = v16;
      v18 = v19;
    }
    -[__CFString setObject:forKey:](v15, "setObject:forKey:", v17, v18);

  }
LABEL_12:

}

uint64_t compareBestLocalResultsWithRules(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  float v20;
  _BOOL4 v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  _BOOL4 v28;
  void *v29;
  float v30;
  float v31;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "rankingItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rankingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rankingItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldHideUnderShowMore");

  objc_msgSend(v6, "rankingItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldHideUnderShowMore");

  if ((v11 & 1) != 0 || !v13)
  {
    if (((v11 ^ 1 | v13) & 1) == 0)
    {
      v22 = CFSTR("rule:l3_local:should_hide_under_show_more");
      v23 = v5;
      goto LABEL_10;
    }
    objc_msgSend(v8, "L2FeatureVector");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v8, "L2FeatureVector");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scoreForFeature:", 3234);
      v21 = v20 != 0.0;

    }
    else
    {
      v21 = 0;
    }

    objc_msgSend(v8, "L2FeatureVector");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v9, "L2FeatureVector");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "scoreForFeature:", 3234);
      v28 = v27 != 0.0;

    }
    else
    {
      v28 = 0;
    }

    if ((objc_msgSend(v8, "bundleIDType") & 0x200000) == 0 || (objc_msgSend(v9, "bundleIDType") & 0x800) == 0)
    {
      if ((objc_msgSend(v8, "bundleIDType") & 0x800) != 0 && (objc_msgSend(v9, "bundleIDType") & 0x200000) != 0)
      {
        if (!preferShortCutOverFile(v9, v8))
          goto LABEL_52;
        v22 = CFSTR("rule:l3_local:prefer_shortcut_over_file");
      }
      else
      {
        if ((objc_msgSend(v8, "bundleIDType") & 4) != 0 && (objc_msgSend(v9, "bundleIDType") & 0x200) != 0)
        {
          if (!preferContactOverMusic(v8, v9))
            goto LABEL_52;
          v14 = CFSTR("rule:l3_local:prefer_contact_over_music");
          goto LABEL_39;
        }
        if ((objc_msgSend(v8, "bundleIDType") & 0x200) == 0 || (objc_msgSend(v9, "bundleIDType") & 4) == 0)
        {
          if ((objc_msgSend(v8, "bundleIDType") & 0x100) == 0 && (objc_msgSend(v8, "bundleIDType") & 0x10000) == 0
            || (objc_msgSend(v9, "bundleIDType") & 0x40000) == 0)
          {
            if ((objc_msgSend(v8, "bundleIDType") & 0x40000) != 0
              && ((objc_msgSend(v9, "bundleIDType") & 0x100) != 0 || (objc_msgSend(v9, "bundleIDType") & 0x10000) != 0))
            {
              if (preferAppOverPhotosApp(v9))
              {
                v22 = CFSTR("rule:l3_local:prefer_apps_over_photosapp");
                goto LABEL_46;
              }
LABEL_52:
              v17 = 0;
              goto LABEL_53;
            }
            if ((objc_msgSend(v8, "bundleIDType") & 4) != 0 && objc_msgSend(v8, "isPerfectMatch"))
            {
              v14 = CFSTR("rule:l3_local:contact_is_perfect_match");
LABEL_55:
              v15 = v5;
              goto LABEL_4;
            }
            if ((objc_msgSend(v9, "bundleIDType") & 4) != 0 && objc_msgSend(v9, "isPerfectMatch"))
            {
              v22 = CFSTR("rule:l3_local:contact_is_perfect_match");
            }
            else
            {
              if (v21 && !v28)
              {
                v14 = CFSTR("rule:l3_local:contact_is_associate_with_tophit_contact");
                goto LABEL_55;
              }
              if (!v28 || v21)
                goto LABEL_52;
              v22 = CFSTR("rule:l3_local:contact_is_associate_with_tophit_contact");
            }
            v23 = v6;
LABEL_10:
            v24 = 0;
LABEL_11:
            logRule(v22, v23, v24, v7);
            v17 = -1;
            goto LABEL_53;
          }
          objc_msgSend(v8, "L2FeatureVector");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "scoreForFeature:", 165);
          v31 = v30;

          if (v31 == 2147500000.0)
            goto LABEL_52;
          v14 = CFSTR("rule:l3_local:prefer_apps_over_photosapp");
LABEL_39:
          v15 = v5;
          v16 = v6;
          goto LABEL_5;
        }
        if (!preferContactOverMusic(v9, v8))
          goto LABEL_52;
        v22 = CFSTR("rule:l3_local:prefer_contact_over_music");
      }
LABEL_46:
      v23 = v6;
      v24 = v5;
      goto LABEL_11;
    }
    if (!preferShortCutOverFile(v8, v9))
      goto LABEL_52;
    v14 = CFSTR("rule:l3_local:prefer_shortcut_over_file");
    goto LABEL_39;
  }
  v14 = CFSTR("rule:l3_local:should_hide_under_show_more");
  v15 = v6;
LABEL_4:
  v16 = 0;
LABEL_5:
  logRule(v14, v15, v16, v7);
  v17 = 1;
LABEL_53:

  return v17;
}

void sub_1B86E6C04(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x750], 8);
  _Block_object_dispose(&STACK[0x9B0], 8);
  _Block_object_dispose(&STACK[0x9D0], 8);
  _Block_object_dispose(&STACK[0x9F0], 8);
  _Block_object_dispose(&STACK[0xA10], 8);
  _Block_object_dispose(&STACK[0xA30], 8);
  _Block_object_dispose(&STACK[0xA50], 8);
  _Block_object_dispose(&STACK[0xA70], 8);
  _Block_object_dispose(&STACK[0x1540], 8);
  _Block_object_dispose(&STACK[0xB00], 8);
  _Unwind_Resume(a1);
}

void sub_1B86E9484(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B86E9840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B86EA72C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

id getTrialDictionaryForLengthAndTermCount(id *a1, unint64_t a2, unint64_t a3)
{
  id *v4;
  void *v5;

  -[SSCompactValueArray objectAtIndex:](a1, a3);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[SSCompactValueArray objectAtIndex:](v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

double SSRankingManagerTopHitThreshold(void *a1, unint64_t a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v5 = a1;
  +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v5, a2, a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = v6;
  }
  else
  {
    +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v5, a2, a3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "count"))
    {
      v10 = 2.0;
      goto LABEL_6;
    }
    v6 = v7;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

LABEL_6:
  return v10;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t json_writer_init_with_buffer(uint64_t result, unint64_t a2)
{
  if (a2 < 0x21)
    return 0;
  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_QWORD *)result = 0xFFFFFFFFLL;
  *(_QWORD *)(result + 16) = a2 - 32;
  *(_QWORD *)(result + 24) = result + 32;
  *(_WORD *)(result + 8) = 1;
  *(_BYTE *)(result + 10) = 1;
  return result;
}

_BYTE *json_writer_create_with_path(const char *a1, uint64_t a2)
{
  unint64_t v3;
  _BYTE *v4;
  int v5;

  v3 = a2 + 32;
  v4 = malloc_type_malloc(a2 + 32, 0xABF88379uLL);
  if (!json_writer_init_with_buffer((uint64_t)v4, v3) || (v5 = open(a1, 1537, 438), *(_DWORD *)v4 = v5, v5 == -1))
  {
    free(v4);
    return 0;
  }
  else
  {
    v4[10] = 0;
  }
  return v4;
}

void json_writer_dispose(int *a1)
{
  int v2;

  if (a1)
  {
    v2 = *a1;
    if (v2 != -1)
    {
      if (!a1[1])
      {
        json_writer_flush((ssize_t)a1);
        v2 = *a1;
      }
      close(v2);
    }
    free(a1);
  }
}

ssize_t json_writer_flush(ssize_t result)
{
  ssize_t v1;
  int v2;

  if (!*(_DWORD *)(result + 4))
  {
    v1 = result;
    if (!*(_BYTE *)(result + 10))
    {
      result = write(*(_DWORD *)result, (const void *)(result + 32), *(_QWORD *)(result + 24) - (result + 32));
      if (result == -1)
      {
        result = (ssize_t)__error();
        v2 = *(_DWORD *)result;
        if (!*(_DWORD *)result)
          v2 = -1;
        *(_DWORD *)(v1 + 4) = v2;
      }
      *(_QWORD *)(v1 + 24) = v1 + 32;
    }
  }
  return result;
}

uint64_t json_writer_get_data(uint64_t result, _QWORD *a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 4))
    {
      return 0;
    }
    else
    {
      if (a2)
        *a2 = result + 32;
      return *(_QWORD *)(result + 24) - result - 32;
    }
  }
  return result;
}

uint64_t json_writer_get_err(uint64_t a1)
{
  if (a1)
    return *(unsigned int *)(a1 + 4);
  else
    return 0xFFFFFFFFLL;
}

uint64_t json_writer_get_fd(unsigned int *a1)
{
  if (a1)
    return *a1;
  else
    return 0xFFFFFFFFLL;
}

_DWORD *json_writer_add_raw_value(uint64_t a1, char *__src, size_t __n)
{
  _DWORD *result;

  if (!*(_WORD *)(a1 + 8))
    _json_writer_add((_DWORD *)a1, ",", 1uLL);
  if (__n == -1)
    __n = strlen(__src);
  result = _json_writer_add((_DWORD *)a1, __src, __n);
  *(_WORD *)(a1 + 8) = 0;
  return result;
}

_DWORD *_json_writer_add(_DWORD *result, char *__src, size_t __n)
{
  _DWORD *v3;
  size_t v4;
  char *v6;
  size_t v7;
  int v8;

  if (__n)
  {
    v3 = result;
    if (!result[1])
    {
      v4 = __n;
      v6 = (char *)(result + 8);
      result = (_DWORD *)*((_QWORD *)result + 3);
      while (1)
      {
        v7 = v6 - (char *)result + *((_QWORD *)v3 + 2);
        if (v4 <= v7)
        {
          result = memcpy(result, __src, v4);
          *((_QWORD *)v3 + 3) += v4;
          return result;
        }
        if (*((_BYTE *)v3 + 10))
        {
          v8 = 7;
          goto LABEL_13;
        }
        memcpy(result, __src, v7);
        if (write(*v3, v3 + 8, *((_QWORD *)v3 + 2)) == -1)
          break;
        *((_QWORD *)v3 + 3) = v6;
        __src += v7;
        result = v3 + 8;
        v4 -= v7;
        if (!v4)
          return result;
      }
      result = __error();
      v8 = *result;
      if (!*result)
        v8 = -1;
LABEL_13:
      v3[1] = v8;
    }
  }
  return result;
}

_DWORD *json_writer_add_true(uint64_t a1)
{
  return json_writer_add_raw_value(a1, "true", 4uLL);
}

_DWORD *json_writer_add_false(uint64_t a1)
{
  return json_writer_add_raw_value(a1, "false", 5uLL);
}

_DWORD *json_writer_add_null(uint64_t a1)
{
  return json_writer_add_raw_value(a1, "null", 4uLL);
}

_DWORD *json_writer_add_uint64(uint64_t a1, uint64_t a2)
{
  char __str[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)__str = 0u;
  v5 = 0u;
  snprintf(__str, 0x80uLL, "%llu", a2);
  return json_writer_add_raw_value(a1, __str, 0xFFFFFFFFFFFFFFFFLL);
}

_DWORD *json_writer_add_int64(uint64_t a1, uint64_t a2)
{
  char __str[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)__str = 0u;
  v5 = 0u;
  snprintf(__str, 0x80uLL, "%lld", a2);
  return json_writer_add_raw_value(a1, __str, 0xFFFFFFFFFFFFFFFFLL);
}

_DWORD *json_writer_add_double(_DWORD *result, double a2)
{
  uint64_t v2;
  char __str[16];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v2 = (uint64_t)result;
  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    result[1] = 22;
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    *(_OWORD *)__str = 0u;
    v4 = 0u;
    snprintf(__str, 0x80uLL, "%.*g", 17, a2);
    return json_writer_add_raw_value(v2, __str, 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

_DWORD *json_writer_add_uint32(uint64_t a1, int a2)
{
  char __str[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)__str = 0u;
  v5 = 0u;
  snprintf(__str, 0x80uLL, "%u", a2);
  return json_writer_add_raw_value(a1, __str, 0xFFFFFFFFFFFFFFFFLL);
}

_DWORD *json_writer_begin_array(uint64_t a1)
{
  _DWORD *result;

  if (!*(_BYTE *)(a1 + 8) && !*(_BYTE *)(a1 + 9))
    _json_writer_add((_DWORD *)a1, ",", 1uLL);
  result = _json_writer_add((_DWORD *)a1, "[", 1uLL);
  *(_WORD *)(a1 + 8) = 1;
  return result;
}

_DWORD *json_writer_end_array(uint64_t a1)
{
  _DWORD *result;

  result = _json_writer_add((_DWORD *)a1, "]", 1uLL);
  *(_WORD *)(a1 + 8) = 0;
  return result;
}

_DWORD *json_writer_begin_dictionary(uint64_t a1)
{
  _DWORD *result;

  if (!*(_BYTE *)(a1 + 8) && !*(_BYTE *)(a1 + 9))
    _json_writer_add((_DWORD *)a1, ",", 1uLL);
  result = _json_writer_add((_DWORD *)a1, "{", 1uLL);
  *(_WORD *)(a1 + 8) = 1;
  return result;
}

_DWORD *json_writer_end_dictionary(uint64_t a1)
{
  _DWORD *result;

  result = _json_writer_add((_DWORD *)a1, "}", 1uLL);
  *(_WORD *)(a1 + 8) = 0;
  return result;
}

_DWORD *json_writer_add_key(uint64_t a1, char *a2, size_t a3, int a4)
{
  _DWORD *result;

  if (*(_BYTE *)(a1 + 9) && !*(_DWORD *)(a1 + 4))
    *(_DWORD *)(a1 + 4) = -1;
  if (!*(_BYTE *)(a1 + 8))
    _json_writer_add((_DWORD *)a1, ",", 1uLL);
  _json_writer_add((_DWORD *)a1, "\"", 1uLL);
  if (a4)
  {
    if (a3 == -1)
      a3 = strlen(a2);
    _json_writer_add((_DWORD *)a1, a2, a3);
  }
  else
  {
    if (a3 == -1)
      a3 = strlen(a2);
    _json_writer_add_string_escaping((_DWORD *)a1, a2, a3);
  }
  result = _json_writer_add((_DWORD *)a1, "\":", 2uLL);
  *(_BYTE *)(a1 + 9) = 1;
  return result;
}

_DWORD *_json_writer_add_string_escaping(_DWORD *result, char *a2, uint64_t a3)
{
  uint64_t v3;
  _DWORD *v4;
  char *v5;
  char *v6;
  int v7;
  int v8;
  int v9;
  char v10;
  char __src[2];

  __src[0] = 92;
  if (a3)
  {
    v3 = a3;
    v4 = result;
    v5 = a2;
    v6 = a2;
    do
    {
      v8 = *v6++;
      v7 = v8;
      if ((v8 & 0x80) == 0)
      {
        v9 = v7 - 8;
        v10 = 98;
        switch(v9)
        {
          case 0:
            goto LABEL_9;
          case 1:
            v10 = 116;
            goto LABEL_9;
          case 2:
            v10 = 110;
            goto LABEL_9;
          case 4:
            v10 = 102;
            goto LABEL_9;
          case 5:
            v10 = 114;
LABEL_9:
            __src[1] = v10;
            _json_writer_add(v4, a2, v5 - a2);
            result = _json_writer_add(v4, __src, 2uLL);
            a2 = v6;
            break;
          default:
            break;
        }
      }
      ++v5;
      --v3;
    }
    while (v3);
    if (v6 != a2)
      return _json_writer_add(v4, a2, v5 - a2);
  }
  return result;
}

_DWORD *json_writer_add_string(uint64_t a1, char *a2, size_t a3, int a4)
{
  _DWORD *result;

  if (!*(_BYTE *)(a1 + 8) && !*(_BYTE *)(a1 + 9))
    _json_writer_add((_DWORD *)a1, ",", 1uLL);
  _json_writer_add((_DWORD *)a1, "\"", 1uLL);
  if (a4)
  {
    if (a3 == -1)
      a3 = strlen(a2);
    _json_writer_add((_DWORD *)a1, a2, a3);
  }
  else
  {
    if (a3 == -1)
      a3 = strlen(a2);
    _json_writer_add_string_escaping((_DWORD *)a1, a2, a3);
  }
  result = _json_writer_add((_DWORD *)a1, "\"", 1uLL);
  *(_WORD *)(a1 + 8) = 0;
  return result;
}

BOOL SSThresholdRankedItem(void *a1, void *a2, uint64_t a3, char a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  char v17;
  float v18;
  float v19;
  __CFString *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a5;
  objc_msgSend(v11, "sectionBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (_os_feature_enabled_impl())
  {

    goto LABEL_18;
  }
  if ((objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
    || (objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
    || (v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), a6 == 12)
    || (v16 & 1) != 0)
  {
    v17 = _os_feature_enabled_impl();

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {

  }
  if (SSSectionIsMailOrPommesCTL(v14))
  {
    objc_msgSend(v11, "pommesL1Score");
    if (v18 < 0.001)
    {
      objc_msgSend(v11, "embeddingSimilarity");
      if (v19 < 0.6)
      {
        v20 = CFSTR("[L1]");
        goto LABEL_19;
      }
    }
    goto LABEL_18;
  }
  if ((a4 & 1) != 0 || !objc_msgSend(MEMORY[0x1E0DA9B68], "isCalendarBundle:", v14))
  {
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v11, "attributes"), 0x12uLL);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21 && (objc_msgSend(v21, "timeIntervalSinceNow"), *(float *)&v23 = v23 / -86400.0, *(float *)&v23 > 30.0))
    v20 = CFSTR("[Freshness]");
  else
    v20 = 0;

LABEL_19:
  v24 = -[__CFString length](v20, "length");
  if (v24)
  {
    SSPommesRankerLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      SSRedactString(v12, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138413314;
      v30 = v14;
      v31 = 2048;
      v32 = a3;
      v33 = 2112;
      v34 = v27;
      v35 = 2112;
      v36 = v20;
      v37 = 2112;
      v38 = v28;
      _os_log_debug_impl(&dword_1B86C5000, v25, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"][thresholded] %@ item: %@", (uint8_t *)&v29, 0x34u);

    }
  }

  return v24 != 0;
}

void updateSafariRankingItemScore(void *a1, void *a2, uint64_t a3, double a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  char **__ptr32 *v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  double v34;
  double v35;
  float v36;
  float v37;
  double v38;
  float v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  int v57;
  float v58;
  double v59;
  float v60;
  double v61;
  float v62;
  id v64;
  void *v65;
  void *v66;
  int v67;
  int v68;
  int v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  _QWORD v75[3];
  _QWORD v76[3];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  __int16 v95;
  int v96;
  __int16 v97;
  int v98;
  uint8_t v99[4];
  void *v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  int v108;
  __int16 v109;
  double v110;
  __int16 v111;
  double v112;
  __int16 v113;
  double v114;
  __int16 v115;
  double v116;
  __int16 v117;
  double v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = a2;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v6, "attributes"), 0x69uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interestingDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = 0.0;
  v12 = exp(trunc(fmax(a4 - v10, 0.0)) / 86400.0 * -1.39 / 30.0);

  v13 = v6;
  v14 = v7;
  v74 = 0;
  SSCompactRankingAttrsGetFloat(objc_msgSend(v13, "attributes"), 0x10AuLL, (_DWORD *)&v74 + 1);
  SSCompactRankingAttrsGetFloat(objc_msgSend(v13, "attributes"), 0x41uLL, &v74);
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v13, "attributes"), 0x3CuLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.safari.bookmark"));
  v69 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.safari.readinglist"));
  v18 = &off_1B87DE000;
  v19 = 0.0;
  if (objc_msgSend(v15, "count"))
  {
    v67 = v17;
    v64 = v14;
    v65 = v8;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v21 = v15;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v99, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v71 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "timeIntervalSinceReferenceDate");
          v27 = trunc(fmax(a4 - v26, 0.0)) / 86400.0;
          if (v27 <= 30.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v28);

            v19 = v19 + exp(v27 * -0.23);
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v99, 16);
      }
      while (v23);
    }

    if (objc_msgSend(v20, "count"))
    {
      v19 = fmin(v19, 1.0);
      v18 = &off_1B87DE000;
      v11 = fmin(log((double)(unint64_t)(objc_msgSend(v20, "count") + 1)) / 2.7080502, 1.0);
      v14 = v64;
      v8 = v65;
      v17 = v67;
    }
    else
    {
      v14 = v64;
      v8 = v65;
      v17 = v67;
      v18 = &off_1B87DE000;
    }

  }
  if (*((float *)&v74 + 1) <= 0.0)
    v29 = *(float *)&v74;
  else
    v29 = *((float *)&v74 + 1) / 100.0;
  v30 = fmin(log(v29 + 1.0) / *((double *)v18 + 500), 1.0);
  objc_msgSend(v13, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "length");

  if (v32)
  {
    SSPommesRankerLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "sectionBundleIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      SSRedactString(v14, 0);
      v68 = v17;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v51 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414850;
      v78 = v66;
      v79 = 2048;
      v80 = a3;
      v81 = 2112;
      v82 = v50;
      v83 = 2112;
      v84 = v51;
      v52 = (void *)v51;
      v85 = 2048;
      v86 = *((float *)&v74 + 1);
      v87 = 2048;
      v88 = *(float *)&v74;
      v89 = 2048;
      v90 = v30;
      v91 = 2048;
      v92 = v11;
      v93 = 2048;
      v94 = v19;
      v95 = 1024;
      v96 = v68;
      v97 = 1024;
      v98 = v69;
      _os_log_debug_impl(&dword_1B86C5000, v33, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] Engagement break down for item %@: visit count score=%.04f, used count=%.04f (normed: %.04f), distinct dates score=%.04f, decayed engagement dates score=%.04f (bookmark=%d, readinglist=%d)", buf, 0x68u);

      v17 = v68;
    }

  }
  v34 = v11 * 0.15 + v30 * 0.4 + v19 * 0.45 + 0.65;
  if (v34 > 1.0)
    v34 = 1.0;
  if (v17 | v69)
    v35 = v34;
  else
    v35 = v11 * 0.15 + v30 * 0.4 + v19 * 0.45;

  objc_msgSend(v13, "pommesL1Score");
  v37 = v36;
  v38 = v36;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v13, "embeddingSimilarity");
    if (v37 >= v39)
      v40 = v38;
    else
      v40 = v39;
    v38 = fmin(v40, 1.0);
  }
  v41 = v12 * 0.14 + v38 * 0.5 + v35 * 0.36;
  *(float *)&v41 = v41;
  objc_msgSend(v13, "setL2Score:", v41);
  objc_msgSend(v13, "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "length");

  if (v43)
  {
    SSPommesRankerLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "sectionBundleIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      SSRedactString(v14, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v55 = v14;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v8, "unsignedIntValue");
      objc_msgSend(v13, "pommesL1Score");
      v59 = v58;
      objc_msgSend(v13, "embeddingSimilarity");
      v61 = v60;
      objc_msgSend(v13, "l2Score");
      *(_DWORD *)v99 = 138414594;
      v100 = v53;
      v101 = 2048;
      v102 = a3;
      v103 = 2112;
      v104 = v54;
      v105 = 2112;
      v106 = v56;
      v107 = 1024;
      v108 = v57;
      v109 = 2048;
      v110 = v59;
      v111 = 2048;
      v112 = v61;
      v113 = 2048;
      v114 = v12;
      v115 = 2048;
      v116 = v35;
      v117 = 2048;
      v118 = v62;
      _os_log_debug_impl(&dword_1B86C5000, v44, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] item %@ (%d): L1=%.04f, embSim=%.04f, freshness=%.04f, engagement=%.04f, L2=%.04f", v99, 0x62u);

      v14 = v55;
    }

  }
  v75[0] = CFSTR("embSim");
  v45 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "embeddingSimilarity");
  objc_msgSend(v45, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v46;
  v75[1] = CFSTR("freshness");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v47;
  v75[2] = CFSTR("engagement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setL2Features:", v49);

}

void updateCalendarRankingItemScore(void *a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  float v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  float v33;
  double v34;
  float v35;
  double v36;
  float v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v7, "attributes"), 0x69uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pommesL1Score");
  v11 = v10;
  v12 = v10;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v7, "embeddingSimilarity");
    if (v11 >= v13)
      v14 = v12;
    else
      v14 = v13;
    v12 = fmin(v14, 1.0);
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v7, "attributes"), 0x11uLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v18 = fmax(exp((v17 - a4) / 86400.0 * dbl_1B87DF010[(v17 - a4) / 86400.0 > 0.0]), 0.0);
  }
  else
  {
    v18 = 0.0;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v7, "attributes"), 0x12uLL);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    v18 = fmax(v18, exp((v21 - a4) / 86400.0 * dbl_1B87DF010[(v21 - a4) / 86400.0 > 0.0]));
  }
  v22 = v18 * 0.8 + v12 * 0.2;
  *(float *)&v22 = v22;
  objc_msgSend(v7, "setL2Score:", v22);
  objc_msgSend(v7, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    SSPommesRankerLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "sectionBundleIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      SSRedactString(v8, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v9, "unsignedIntValue");
      objc_msgSend(v7, "pommesL1Score");
      v34 = v33;
      objc_msgSend(v7, "embeddingSimilarity");
      v36 = v35;
      objc_msgSend(v7, "l2Score");
      *(_DWORD *)buf = 138414338;
      v42 = v30;
      v43 = 2048;
      v44 = a3;
      v45 = 2112;
      v46 = v38;
      v47 = 2112;
      v48 = v31;
      v49 = 1024;
      v50 = v32;
      v51 = 2048;
      v52 = v34;
      v53 = 2048;
      v54 = v36;
      v55 = 2048;
      v56 = v18;
      v57 = 2048;
      v58 = v37;
      _os_log_debug_impl(&dword_1B86C5000, v25, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] item %@ (%d): L1=%.04f, embSim=%.04f, freshness=%.04f, L2=%.04f", buf, 0x58u);

    }
  }
  v39[0] = CFSTR("embSim");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "embeddingSimilarity");
  objc_msgSend(v26, "numberWithFloat:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = CFSTR("freshness");
  v40[0] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setL2Features:", v29);

}

void updateMessagesRankingItemScore(void *a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  float v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  float v31;
  double v32;
  float v33;
  double v34;
  float v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v7, "attributes"), 0x69uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pommesL1Score");
  v11 = v10;
  v12 = v10;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v7, "embeddingSimilarity");
    if (v11 >= v13)
      v14 = v12;
    else
      v14 = v13;
    v12 = fmin(v14, 1.0);
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v7, "attributes"), 0x20uLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v18 = exp(trunc(fmax(a4 - v17, 0.0)) / 86400.0 * -0.25 / 30.0);
  }
  else
  {
    v18 = 0.0;
  }
  v19 = v18 * 0.2 + v12 * 0.8;
  *(float *)&v19 = v19;
  objc_msgSend(v7, "setL2Score:", v19);
  objc_msgSend(v7, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    SSPommesRankerLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "sectionBundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      SSRedactString(v8, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v9, "unsignedIntValue");
      objc_msgSend(v7, "pommesL1Score");
      v32 = v31;
      objc_msgSend(v7, "embeddingSimilarity");
      v34 = v33;
      objc_msgSend(v7, "l2Score");
      *(_DWORD *)buf = 138414594;
      v39 = v27;
      v40 = 2048;
      v41 = a3;
      v42 = 2112;
      v43 = v28;
      v44 = 2112;
      v45 = v29;
      v46 = 1024;
      v47 = v30;
      v48 = 2048;
      v49 = v32;
      v50 = 2048;
      v51 = v34;
      v52 = 2112;
      v53 = v16;
      v54 = 2048;
      v55 = v18;
      v56 = 2048;
      v57 = v35;
      _os_log_debug_impl(&dword_1B86C5000, v22, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] item %@ (%d): L1=%.04f, embSim=%.04f, creationDate=%@, freshness=%.04f, L2=%.04f", buf, 0x62u);

    }
  }
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "embeddingSimilarity", CFSTR("embSim"));
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = CFSTR("freshness");
  v37[0] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setL2Features:", v26);

}

void updateMailRankingItemScore(void *a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  double v25;
  double v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  float v38;
  int v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  float v57;
  double v58;
  float v59;
  double v60;
  float v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  float v71;
  uint64_t v72;
  _QWORD v73[3];
  _QWORD v74[3];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  uint8_t v95[4];
  void *v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  int v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  __int16 v111;
  double v112;
  __int16 v113;
  double v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v7, "attributes"), 0x69uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = 0.0;
  v13 = exp(trunc(fmax(a4 - v11, 0.0)) / 86400.0 * -0.25 / 30.0);

  v14 = v7;
  v15 = v8;
  v72 = 0;
  v71 = 0.0;
  SSCompactRankingAttrsGetFloat(objc_msgSend(v14, "attributes"), 0x122uLL, (_DWORD *)&v72 + 1);
  SSCompactRankingAttrsGetFloat(objc_msgSend(v14, "attributes"), 0x120uLL, &v72);
  SSCompactRankingAttrsGetFloat(objc_msgSend(v14, "attributes"), 0x41uLL, &v71);
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v14, "attributes"), 0x3CuLL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0.0;
  if (objc_msgSend(v16, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v16, "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
    if (v20)
    {
      v21 = v20;
      v62 = a3;
      v63 = v15;
      v64 = v9;
      v22 = 0;
      v23 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v68 != v23)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "timeIntervalSinceReferenceDate");
          v26 = trunc(fmax(a4 - v25, 0.0)) / 86400.0;
          if (v26 <= 30.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v27);

            v17 = v17 + exp(v26 * -0.14);
            ++v22;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
      }
      while (v21);

      if (v22 < 1)
      {
        v12 = 0.0;
      }
      else
      {
        v17 = v17 / (double)v22;
        v12 = fmin(log((double)(unint64_t)(objc_msgSend(v18, "count") + 1)) / 1.60943791, 1.0);
      }
      v15 = v63;
      v9 = v64;
      a3 = v62;
    }
    else
    {

    }
  }
  v28 = fmin(log((float)(v71 + 1.0)) / 2.99573227, 1.0);
  v29 = v72;
  objc_msgSend(v14, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "length");

  if (v31)
  {
    SSPommesRankerLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v14, "sectionBundleIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      SSRedactString(v15, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v52 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414594;
      v76 = v65;
      v77 = 2048;
      v78 = a3;
      v79 = 2112;
      v80 = v51;
      v81 = 2112;
      v82 = v52;
      v53 = (void *)v52;
      v83 = 2048;
      v84 = *((float *)&v72 + 1);
      v85 = 2048;
      v86 = *(float *)&v72;
      v87 = 2048;
      v88 = v71;
      v89 = 2048;
      v90 = v28;
      v91 = 2048;
      v92 = v12;
      v93 = 2048;
      v94 = v17;
      _os_log_debug_impl(&dword_1B86C5000, v32, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] Engagement break down for item %@: replied=%.04f, flagged=%.04f, used count=%.04f (normed: %.04f), distinct dates=%.04f, decayed engagement=%.04f", buf, 0x66u);

    }
  }
  v33 = *(float *)&v29 * 0.3 + *((float *)&v29 + 1) * 0.2 + v28 * 0.15 + v12 * 0.1 + v17 * 0.25;

  objc_msgSend(v14, "pommesL1Score");
  v35 = v34;
  objc_msgSend(v14, "embeddingSimilarity");
  v37 = v36;
  if ((objc_msgSend(v9, "integerValue") & 2) != 0)
  {
    objc_msgSend(v14, "embeddingSimilarity");
    if (v38 < 0.75)
      v37 = v37 * 0.01;
  }
  v39 = _os_feature_enabled_impl();
  if (v37 <= v35)
    v40 = v35;
  else
    v40 = v37;
  v41 = fmin(v40, 1.0);
  if (!v39)
    v41 = v35;
  v42 = v13 * 0.26 + v41 * 0.55 + v33 * 0.19;
  *(float *)&v42 = v42;
  objc_msgSend(v14, "setL2Score:", v42);
  objc_msgSend(v14, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "length");

  if (v44)
  {
    SSPommesRankerLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v14, "sectionBundleIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      SSRedactString(v15, 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v9, "unsignedIntValue");
      objc_msgSend(v14, "pommesL1Score");
      v58 = v57;
      objc_msgSend(v14, "embeddingSimilarity");
      v60 = v59;
      objc_msgSend(v14, "l2Score");
      *(_DWORD *)v95 = 138414594;
      v96 = v54;
      v97 = 2048;
      v98 = a3;
      v99 = 2112;
      v100 = v66;
      v101 = 2112;
      v102 = v55;
      v103 = 1024;
      v104 = v56;
      v105 = 2048;
      v106 = v58;
      v107 = 2048;
      v108 = v60;
      v109 = 2048;
      v110 = v13;
      v111 = 2048;
      v112 = v33;
      v113 = 2048;
      v114 = v61;
      _os_log_debug_impl(&dword_1B86C5000, v45, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] item %@ (%d): L1=%.04f, embSim=%.04f, freshness = %.04f, engagement = %.04f, L2=%.04f", v95, 0x62u);

    }
  }
  v73[0] = CFSTR("embSim");
  v46 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "embeddingSimilarity");
  objc_msgSend(v46, "numberWithFloat:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v47;
  v73[1] = CFSTR("freshness");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v48;
  v73[2] = CFSTR("engagement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setL2Features:", v50);

}

void sub_1B86FB3CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t openbyid()
{
  uint64_t v0;
  NSObject *v1;

  if (device_id_onceToken != -1)
    dispatch_once(&device_id_onceToken, &__block_literal_global_7);
  v0 = openbyid_np();
  if ((v0 & 0x80000000) != 0)
  {
    PRSLogCategoryDefault();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      openbyid_cold_1();

  }
  return v0;
}

void __device_id_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  stat v4;

  memset(&v4, 0, sizeof(v4));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForDirectory:inDomains:", 5, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_retainAutorelease(v2);
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v4))
    __device_id_block_invoke_cold_1();
  device_id_deviceID = v4.st_dev;

}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

int *OUTLINED_FUNCTION_5()
{
  return __error();
}

char *OUTLINED_FUNCTION_6(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_7()
{
  return __error();
}

void __68__spotlight_l3_1_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  spotlight_l3_1 *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[spotlight_l3_1 initWithMLModel:]([spotlight_l3_1 alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __59__spotlight_l3_1_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  spotlight_l3_1Output *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  spotlight_l3_1Output *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, spotlight_l3_1Output *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [spotlight_l3_1Output alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("y"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "featureValueForName:", CFSTR("id_features"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "multiArrayValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[spotlight_l3_1Output initWithY:id_features:](v6, "initWithY:id_features:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, spotlight_l3_1Output *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void __67__spotlight_l3_1_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  spotlight_l3_1Output *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  spotlight_l3_1Output *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, spotlight_l3_1Output *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [spotlight_l3_1Output alloc];
    objc_msgSend(v14, "featureValueForName:", CFSTR("y"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "featureValueForName:", CFSTR("id_features"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "multiArrayValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[spotlight_l3_1Output initWithY:id_features:](v6, "initWithY:id_features:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, spotlight_l3_1Output *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

id removeLeadingSpaces(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_8;
  v4 = 0;
  while (objc_msgSend(v3, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", v4)))
  {
    if (v2 == ++v4)
    {
      v4 = v2;
      break;
    }
  }
  if (v4)
  {
    objc_msgSend(v1, "substringFromIndex:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    v5 = v1;
  }
  v6 = v5;

  return v6;
}

void sub_1B87094F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  id *v15;

  v15 = v14;
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1B870D804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B870DD6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  void *v19;

  objc_sync_exit(v19);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1B870DED8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8713300(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B87133B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8713458(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B871351C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8713748(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8715CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1B871798C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SSDefaultQueryParseResultsForQueryString(void *a1, uint64_t a2, char a3, int a4, int a5, int a6, uint64_t a7, int a8, unsigned __int8 a9, unsigned __int8 a10, char a11, char a12)
{
  id v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  _BOOL4 v18;
  int v19;
  _BOOL4 v20;
  int v21;
  _BOOL4 v22;
  int v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  _BOOL4 v30;
  int v31;
  __CFString *v32;
  __CFString *v33;
  _BOOL4 v34;
  int v35;
  int v36;
  char *v37;
  unsigned int v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  unsigned int v44;
  char v45;
  unsigned int v46;
  BOOL v47;
  BOOL v48;
  __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  char v52;
  int v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v61;
  __CFString *v63;
  int v64;
  __CFString *v66;
  __CFString *v67;
  __CFString *v69;
  unint64_t v70;
  void *v71;
  unsigned int v72;
  _BOOL4 v73;
  id v74[2];

  v14 = a1;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setObject:forKey:", &stru_1E6E549F0, CFSTR("completionString"));
  objc_msgSend(v15, "setObject:forKey:", &stru_1E6E549F0, CFSTR("query"));
  objc_msgSend(v15, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("isMath"));
  v16 = v14;
  v70 = objc_msgSend(v16, "length");
  v17 = SSStringStartsWithDoubleQuote(v16);
  v18 = SSStringEndsWithDoubleQuote(v16);
  v19 = SSStringEndsWithSpace(v16);
  if (a11)
    v72 = looksLikeMath(v16);
  else
    v72 = 0;
  v20 = hasDigit(v16);
  v73 = v18;
  v21 = v19;
  if ((a3 & 1) != 0)
  {
    v22 = v17;
    v23 = 1;
  }
  else
  {
    v24 = v18 | v19;
    v22 = v17;
    v23 = v17 & v24;
  }
  v74[0] = 0;
  SSPhraseQueryEscapeString(v16, v74);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v74[0];
  v27 = (void *)objc_opt_new();
  v71 = v26;
  if (!objc_msgSend(v26, "count"))
    goto LABEL_71;
  if (v23)
  {
    v28 = CFSTR("cwd");
    if (a4)
      v28 = CFSTR("cwds");
    v29 = v28;
    objc_msgSend(v27, "appendString:", CFSTR("("));
    appendMainQueryString(v27, v25, v29, 0, a9, 1, v70 > 3);

    objc_msgSend(v27, "appendFormat:", CFSTR(" || _kMDItemLaunchString=\"%@\"cwd"), v25);
LABEL_17:
    objc_msgSend(v27, "appendString:", CFSTR(")"));
    goto LABEL_71;
  }
  v30 = v22;
  v31 = v21;
  if (v30 && (v73 & v21 & 1) == 0)
  {
    v22 = v30;
    v32 = CFSTR("cwd");
    if (a4)
      v32 = CFSTR("cwds");
    v33 = v32;
    objc_msgSend(v27, "appendString:", CFSTR("("));
    appendMainQueryString(v27, v25, v33, 1, a9, 1, v70 > 3);

    goto LABEL_17;
  }
  v61 = a5;
  if (a5)
  {
    v34 = v70 > 3;
    if (v70 > 3)
      v35 = v72 ^ 1;
    else
      v35 = 0;
  }
  else
  {
    v34 = v70 > 3;
    v35 = 0;
  }
  if (v70 > 2)
    v36 = 1;
  else
    v36 = v35;
  if ((v36 | v31 | a10) != 1 || (v72 & v20) != 0)
  {
    if (!v70)
      goto LABEL_53;
    v37 = (char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    if (!v37)
      goto LABEL_53;
    v38 = *v37;
    if (*v37 < 0)
    {
      v39 = (unint64_t)*v37 >> 4;
      v40 = ~(_BYTE)v39;
      v41 = utf8_byte_length_utf8_len_table[v39];
      v38 &= utf8_to_code_point_utf8_first_char_mask[v41];
      if ((v40 & 0xC) == 0)
      {
        v41 = v41 <= 2 ? 2 : v41;
        v42 = v41 - 1;
        v43 = v37 + 1;
        do
        {
          v44 = v38;
          v45 = *v43++;
          v38 = v45 & 0x3F | (v38 << 6);
          --v42;
        }
        while (v42);
        if (v38 >> 8 >= 0x11 && ((v44 & 0x3FFFFFC) == 0x44 || ((v44 << 6) - 11904) >> 7 < 0x197 || v38 - 65376 < 0x50))
          goto LABEL_54;
      }
    }
    v46 = v38 & 0xFFFFFF00;
    v47 = v38 - 127462 < 0x1A || v46 == 129280;
    v48 = v47 || (v38 & 0xFFFFFFF0) == 65024;
    if (v48 || v38 - 9984 < 0xC0 || v46 == 9728 || v38 - 127744 < 0x350 || (v38 & 0xFFFFFF80) == 0x1F680)
    {
LABEL_54:
      v64 = 1;
      v34 = 1;
    }
    else
    {
LABEL_53:
      v64 = 0;
      v34 = 0;
    }
  }
  else
  {
    v64 = 1;
  }
  v49 = CFSTR("cwdt");
  if (a4)
    v49 = CFSTR("cwdts");
  v69 = v49;
  v50 = CFSTR("false");
  if (v61 && a8)
  {
    SSDisplayNameAdditionsQuery(v25, v69, v35);
    v50 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v63 = (__CFString *)v50;
  if ((v35 & a6) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((kMDItemContentURL=\"%@*\"%@f070 || kMDItemTitle=\"%@*\"%@f070 || kMDItemContentURL=\"*%@*\"%@ || kMDItemTitle=\"*%@*\"%@) && _kMDItemBundleID=\"com.apple.mobilesafari\")"), v25, v69, v25, v69, v25, v69, v25, v69);
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = CFSTR("false");
  }
  if ((v35 & a12) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(**=\"%@*\"%@f070)"), v25, v69);
    v51 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v51 = CFSTR("false");
  }
  v52 = 1;
  v67 = (__CFString *)v51;
  v21 = v31;
  v22 = v30;
  if ((unint64_t)objc_msgSend(v26, "count") > 1)
  {
    v53 = a9;
  }
  else
  {
    v53 = a9;
    if ((v64 & v34 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v54, "characterIsMember:", objc_msgSend(v16, "characterAtIndex:", objc_msgSend(v16, "length") - 1));

    }
  }
  objc_msgSend(v27, "appendString:", CFSTR("("));
  appendMainQueryString(v27, v25, v69, 1, v53, v64 | v52, v70 > 3);
  objc_msgSend(v27, "appendFormat:", CFSTR(" || %@ || %@ || %@)"), v63, v66, v67);

LABEL_71:
  if ((v21 | (v22 && v73)) == 1)
  {
    v55 = v25;
  }
  else
  {
    objc_msgSend(v25, "stringByAppendingString:", CFSTR("*"));
    v55 = (id)objc_claimAutoreleasedReturnValue();
  }
  v56 = v55;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stringByTrimmingCharactersInSet:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKey:", v58, CFSTR("completionString"));
  objc_msgSend(v15, "setObject:forKey:", v27, CFSTR("query"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v72);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v59, CFSTR("isMath"));

  return v15;
}

void appendMainQueryString(void *a1, void *a2, void *a3, int a4, int a5, char a6, int a7)
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const __CFString *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  id v28;

  v28 = a1;
  v13 = a2;
  v14 = a3;
  objc_msgSend(v14, "stringByAppendingString:", CFSTR("i"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = "";
  if (a4)
    v17 = "*";
  if ((a6 & 1) != 0)
  {
    if (!a5)
    {
      objc_msgSend(v28, "appendFormat:", CFSTR("(**=\"%@%s\"%@)"), v13, v17, v14, v20, v22, v24, v26);
      goto LABEL_11;
    }
    v25 = v15;
    v27 = CFSTR("com.apple.mobileslideshow");
    v21 = v13;
    v23 = v17;
    v19 = v14;
    v18 = CFSTR("(*=\"%@%s\"%@) || (kMDItemTextContent=\"%@%s\"%@ && _kMDItemBundleID!=\"%@\"i)");
  }
  else
  {
    if (!a7)
    {
      objc_msgSend(v28, "appendFormat:", CFSTR("(*=\"%@%s\"%@)"), v13, v17, v14, v20, v22, v24, v26);
      goto LABEL_11;
    }
    v25 = v15;
    v27 = CFSTR("com.apple.MobileSMS");
    v21 = v13;
    v23 = v17;
    v19 = v14;
    v18 = CFSTR("(*=\"%@%s\"%@) || (kMDItemTextContent=\"%@%s\"%@ && _kMDItemBundleID=\"%@\"i)");
  }
  objc_msgSend(v28, "appendFormat:", v18, v13, v17, v19, v21, v23, v25, v27);
LABEL_11:

}

id SSQueryParseResultsForQueryString(void *a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  void *QueryDictionaryWithOptionsDict;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  __CFString *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  unint64_t v65;
  NSObject *v66;
  NSObject *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  unint64_t v79;
  objc_class *v80;
  id v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  __CFString *v119;
  void *v120;
  id v121;
  uint64_t v122;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  const __CFString *v129;
  id v130;
  uint8_t buf[4];
  const __CFString *v132;
  __int16 v133;
  const __CFString *v134;
  __int16 v135;
  const __CFString *v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v11 = (void *)__MDQueryCopyTextTerms();
    if (!objc_msgSend(v11, "length") && objc_msgSend(v9, "length"))
    {
      v12 = v9;

      v11 = v12;
    }
  }
  else
  {
    objc_msgSend(0, "length");
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF matches %@"), CFSTR("^([0-9]+(\\.[0-9]*)?)([\\+|-|\\*|/]([0-9]+(\\.[0-9]*)?))*[ ]*$"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
    objc_msgSend(v13, "evaluateWithObject:", v9);
  v115 = v11;
  v109 = v8;
  v106 = v14;
  if (SSQueryParseResultsForQueryString_onceToken != -1)
    dispatch_once(&SSQueryParseResultsForQueryString_onceToken, &__block_literal_global_19);
  v15 = objc_msgSend(MEMORY[0x1E0D26210], "currentWithUseCaseIdentifiers:", &unk_1E6E9B4A0);
  v16 = v15;
  if (SSQueryParseResultsForQueryString_isFeatureFlagsEnabled)
    v17 = v15 > 1;
  else
    v17 = 1;
  v18 = v17;
  SSGeneralLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = CFSTR("allowing");
    if (v18)
      v20 = CFSTR("disallowing");
    v21 = CFSTR("YES");
    if (SSQueryParseResultsForQueryString_isFeatureFlagsEnabled)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v132 = v20;
    v133 = 2112;
    v134 = v22;
    if (v16 > 1)
      v21 = CFSTR("NO");
    v135 = 2112;
    v136 = v21;
    _os_log_impl(&dword_1B86C5000, v19, OS_LOG_TYPE_INFO, "SSQueryParser: %@ semantic search, isFeatureFlagsEnabled: %@, isGMOptedIn: %@", buf, 0x20u);
  }

  if (a5 | v18)
    v23 = MEMORY[0x1E0C9AAA0];
  else
    v23 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v10, "setValue:forKey:", v23, CFSTR("kMDQueryOptionEmbeddingEnabledKey"));
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMDQueryOptionContextIdentifier"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v10;
  QueryDictionaryWithOptionsDict = (void *)__MDQueryCreateQueryDictionaryWithOptionsDict();
  v25 = QueryDictionaryWithOptionsDict;
  v110 = v7;
  v108 = v9;
  if (!QueryDictionaryWithOptionsDict)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v115);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = CFSTR("kMDUserQueryDictionaryQueryConfidenceNoneValue");
    v53 = objc_msgSend(CFSTR("kMDUserQueryDictionaryQueryConfidenceNoneValue"), "isEqualToString:", CFSTR("kMDUserQueryDictionaryQueryConfidenceHighValue"));
    v113 = 0;
    v120 = 0;
    v121 = 0;
    v54 = 0;
    v55 = 0;
    v111 = &unk_1E6E97A88;
    v56 = (void *)MEMORY[0x1E0C9AA70];
    v112 = (id)MEMORY[0x1E0C9AA60];
    v57 = (void *)MEMORY[0x1E0C9AA60];
    v58 = (void *)MEMORY[0x1E0C9AA70];
    v116 = (void *)MEMORY[0x1E0C9AA70];
    v104 = (id)MEMORY[0x1E0C9AA60];
    v105 = (id)MEMORY[0x1E0C9AA60];
    v59 = v117;
    goto LABEL_106;
  }
  objc_msgSend(QueryDictionaryWithOptionsDict, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryInputAttributesKey"));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  v28 = (void *)MEMORY[0x1E0C9AA70];
  if (v26)
    v29 = (void *)v26;
  else
    v29 = (void *)MEMORY[0x1E0C9AA70];
  v103 = v29;

  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryTokenCountKey"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryStringKey"));
  v121 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryDefaultStringKey"));
  v122 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryRankingTermsKey"));
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v30)
    v32 = (void *)v30;
  else
    v32 = v28;
  v118 = v32;

  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryRankingCategoriesKey"));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (void *)v33;
  else
    v35 = v28;
  v36 = v35;

  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryAttributedInputKey"));
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  v39 = (void *)MEMORY[0x1E0C9AA60];
  if (v37)
    v40 = (void *)v37;
  else
    v40 = (void *)MEMORY[0x1E0C9AA60];
  v112 = v40;

  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQuerySuggestionsKey"));
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  if (v41)
    v43 = (void *)v41;
  else
    v43 = v39;
  v105 = v43;

  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryAdvancedComponentsKey"));
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v44)
    v46 = (void *)v44;
  else
    v46 = v39;
  v104 = v46;

  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryUnderstandingOutputKey"));
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v47;
  if (v47)
    v49 = (void *)v47;
  else
    v49 = v28;
  v50 = v49;

  v116 = v50;
  if (objc_msgSend(v50, "count"))
  {
    v51 = (void *)v122;
  }
  else
  {
    SSGeneralLog();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B86C5000, v60, OS_LOG_TYPE_INFO, "[Pommes] SSQueryParseResultsForQueryString: Got empty queryUnderstandingOutput from parse", buf, 2u);
    }

    v51 = (void *)v122;
    if (objc_msgSend(v112, "count"))
    {
      v129 = CFSTR("attributedParses");
      v130 = v112;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
      v61 = objc_claimAutoreleasedReturnValue();

      v116 = (void *)v61;
    }
  }
  v102 = v36;
  if ((v18 & 1) == 0)
  {
    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("embeddingResultKey"));
    v64 = (id)objc_claimAutoreleasedReturnValue();
    if (v64 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v65 = objc_msgSend(v9, "length");
      SSGeneralLog();
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = v66;
      if (v65 < 2)
      {
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          SSQueryParseResultsForQueryString_cold_3(v9, v67);
      }
      else
      {
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          SSRedactString(v9, 1);
          v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v132 = v68;
          _os_log_impl(&dword_1B86C5000, v67, OS_LOG_TYPE_INFO, "[Pommes] [Photos] Getting embedding for query: %@", buf, 0xCu);

        }
        v69 = (void *)objc_msgSend(v116, "mutableCopy");
        objc_msgSend(v69, "setObject:forKey:", v64, CFSTR("kQPQueryEmbeddingEncodedData"));
        v67 = v69;

        v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6BA0]), "initWithEncodedData:", v64);
        v71 = v70;
        if (v70)
        {
          objc_msgSend(v70, "properties");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKey:", CFSTR("vec_scale"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v71, "properties");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKey:", CFSTR("vec_bias"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73 && v75)
          {
            -[NSObject setValue:forKey:](v67, "setValue:forKey:", v73, CFSTR("embeddingScale"));
            -[NSObject setValue:forKey:](v67, "setValue:forKey:", v75, CFSTR("embeddingBias"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v71, "version"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setValue:forKey:](v67, "setValue:forKey:", v76, CFSTR("embeddingVersion"));

          }
        }

        v116 = v67;
      }
      v63 = v121;
      v51 = (void *)v122;

      if ((a5 & 1) == 0 && _os_feature_enabled_impl())
      {
        v78 = v7;
        if (objc_msgSend(v111, "unsignedIntValue") <= 1)
        {

        }
        else
        {
          v79 = objc_msgSend(v78, "composedLength");

          if (v79 >= 5)
          {
            v80 = (objc_class *)MEMORY[0x1E0CA6BA0];
            v81 = v64;
            v82 = (void *)objc_msgSend([v80 alloc], "initWithEncodedData:", v81);

            if (v82)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aNN.data(%@, 0, %ld, %f, %u)"), CFSTR("_kMDItemPrimaryTextEmbedding"), 100, 0x3FEE147AE0000000, 0);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              SSGeneralLog();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                SSQueryParseResultsForQueryString_cold_2((uint64_t)v120, v83);
            }
            else
            {
              SSGeneralLog();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                SSQueryParseResultsForQueryString_cold_1(v83);
              v120 = 0;
            }
            v62 = v117;
            v58 = v118;

            v64 = v81;
            v77 = v64;
            v51 = (void *)v122;
            goto LABEL_82;
          }
        }
      }
      v120 = 0;
      v77 = 0;
      v62 = v117;
      v58 = v118;
    }
    else
    {

      v64 = 0;
      v120 = 0;
      v77 = 0;
      v62 = v117;
      v58 = v118;
      v63 = v121;
    }
LABEL_82:

    v54 = v77;
    goto LABEL_83;
  }
  v120 = 0;
  v54 = 0;
  v62 = v117;
  v58 = v118;
  v63 = v121;
LABEL_83:
  if (!objc_msgSend(v51, "length"))
  {
    objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryNLPStringKey"));
    v84 = objc_claimAutoreleasedReturnValue();

    v51 = (void *)v84;
  }
  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryKindKey"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryConfidenceKey"));
  v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v123 = v51;
  if (-[__CFString isEqualToString:](v52, "isEqualToString:", CFSTR("kMDUserQueryDictionaryQueryConfidenceHighValue"))&& v63&& !objc_msgSend(v63, "isEqualToString:", v51))
  {
    v114 = v85;
    v119 = v52;
    v87 = (void *)objc_msgSend(v58, "mutableCopy");
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v88 = v58;
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v124, v128, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v125;
      do
      {
        for (i = 0; i != v90; ++i)
        {
          if (*(_QWORD *)v125 != v91)
            objc_enumerationMutation(v88);
          v93 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * i);
          objc_msgSend(v88, "objectForKey:", v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)objc_msgSend(v94, "intValue") < 100 || (int)objc_msgSend(v94, "intValue") >= 201)
            objc_msgSend(v87, "removeObjectForKey:", v93);

        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v124, v128, 16);
      }
      while (v90);
    }

    if (!objc_msgSend(v87, "count"))
      objc_msgSend(v87, "setValue:forKey:", &unk_1E6E97AA0, v121);
    v63 = v87;

    objc_msgSend(v63, "keysSortedByValueUsingComparator:", &__block_literal_global_120);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v63;
    v62 = v117;
    v52 = v119;
    v85 = v114;
  }
  else
  {
    v86 = v51;
    v57 = (void *)MEMORY[0x1E0C9AA60];
    v121 = v86;
  }

  v53 = -[__CFString isEqualToString:](v52, "isEqualToString:", CFSTR("kMDUserQueryDictionaryQueryConfidenceHighValue"));
  if (v85)
  {
    v113 = v85;
    v55 = objc_msgSend(v85, "isEqualToString:", CFSTR("kMDQueryAdvancedSyntaxQuery"));
  }
  else
  {
    v113 = 0;
    v55 = 0;
  }
  v59 = v62;
  v56 = v102;
LABEL_106:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v59, "isEqualToString:", CFSTR("com.apple.Spotlight")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(_kMDItemBundleID!=\"%@\" || kMDItemMailboxes!=\"mailbox.junk\")"), CFSTR("com.apple.mobilemail"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v96);

  }
  v97 = (void *)objc_opt_new();
  objc_msgSend(v97, "setObject:forKey:", v121, CFSTR("nlQuery"));
  objc_msgSend(v97, "setObject:forKey:", v123, CFSTR("defaultQuery"));
  if (objc_msgSend(v120, "length"))
  {
    objc_msgSend(v97, "setObject:forKey:", v120, CFSTR("annQuery"));
    objc_msgSend(v97, "setObject:forKey:", v54, CFSTR("embedding"));
  }
  objc_msgSend(v97, "setObject:forKey:", v105, CFSTR("suggestions"));
  objc_msgSend(v97, "setObject:forKey:", v56, CFSTR("rankCategories"));
  objc_msgSend(v97, "setObject:forKey:", v58, CFSTR("rankTerms"));
  objc_msgSend(v97, "setObject:forKey:", v57, CFSTR("queryTerms"));
  objc_msgSend(v97, "setObject:forKey:", v112, CFSTR("attributedParses"));
  objc_msgSend(v97, "setObject:forKey:", v104, CFSTR("advancedComponents"));
  objc_msgSend(v97, "setObject:forKey:", v52, CFSTR("confidence"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v53);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setObject:forKey:", v98, CFSTR("isNLQuery"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v55);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setObject:forKey:", v99, CFSTR("isAdvancedSyntax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setObject:forKey:", v100, CFSTR("hasTargetApplicationURL"));

  objc_msgSend(v97, "setObject:forKey:", v116, CFSTR("queryUnderstandingOutput"));
  objc_msgSend(v97, "setObject:forKey:", v95, CFSTR("filterQueries"));

  return v97;
}

id SSParseResultsForTopHitQueryWithString(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, int a8, unsigned __int8 a9, char a10, unsigned __int8 a11, unsigned __int8 a12, unsigned __int8 a13, char a14)
{
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;

  v17 = a2;
  v18 = a1;
  v19 = (void *)objc_opt_new();
  v20 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v19, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("isNLQuery"));
  objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("isAdvancedSyntax"));
  objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("isMath"));
  v21 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v19, "setObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("suggestions"));
  v22 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v19, "setObject:forKey:", MEMORY[0x1E0C9AA70], CFSTR("rankCategories"));
  objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("rankTerms"));
  objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("queryTerms"));
  objc_msgSend(v19, "setObject:forKey:", &stru_1E6E549F0, CFSTR("query"));
  SSQueryParseResultsForQueryString(v18, v17, a7, a5, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  SSDefaultQueryParseResultsForQueryString(v18, 0, a6, a7, a8, a9, 0, a11, a12, a13, 0, a14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("nlQuery"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("isNLQuery"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("isNLQuery"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

    }
    else
    {
      v28 = 0;
    }

    if (v24)
    {
LABEL_9:
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("query"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("isMath"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("isMath"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v32, "BOOLValue");

      }
      else
      {
        v30 = 0;
      }

      if (!v25)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v28 = 0;
    if (v24)
      goto LABEL_9;
  }
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("defaultQuery"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  if (!v25)
    goto LABEL_15;
LABEL_13:
  if (v29)
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("defaultQuery"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v25, "isEqualToString:", v33);

    if ((v34 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || %@)"), v25, v29);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v30 & ~(_DWORD)v28;
      if (!v24)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
LABEL_15:
  v35 = v29;
  if (v24)
LABEL_16:
    objc_msgSend(v19, "setValuesForKeysWithDictionary:", v24);
LABEL_17:
  objc_msgSend(v19, "setValuesForKeysWithDictionary:", v23);
  objc_msgSend(v19, "setObject:forKey:", v35, CFSTR("query"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v36, CFSTR("isNLQuery"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v37, CFSTR("isMath"));

  return v19;
}

id SSQueryParserStripKindFromString(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[6];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v29 = a1;
  v30 = a2;
  SSQueryParseResultsForQueryString(v29, v30, 0, 0, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__2;
  v61 = __Block_byref_object_dispose__2;
  v62 = 0;
  v62 = (id)objc_opt_new();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("attributedParses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("attributedParses"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  v6 = objc_msgSend(v5, "length");
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __SSQueryParserStripKindFromString_block_invoke;
  v54[3] = &unk_1E6E44048;
  v55 = v5;
  v56 = &v57;
  v28 = v55;
  objc_msgSend(v55, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v54);
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("advancedComponents"));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v51;
    v36 = *MEMORY[0x1E0CB2D28];
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v51 != v33)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v47 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
              objc_msgSend(v8, "objectForKeyedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TYPE"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TYPE"));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("KINDS:IMAGES"));

                if ((v16 & 1) != 0)
                {
                  v40 = 0;
                  v41 = &v40;
                  v42 = 0x3032000000;
                  v43 = __Block_byref_object_copy__2;
                  v44 = __Block_byref_object_dispose__2;
                  v45 = 0;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v45 = (id)objc_claimAutoreleasedReturnValue();
                  v17 = objc_msgSend(v12, "length");
                  v39[0] = MEMORY[0x1E0C809B0];
                  v39[1] = 3221225472;
                  v39[2] = __SSQueryParserStripKindFromString_block_invoke_2;
                  v39[3] = &unk_1E6E44070;
                  v39[4] = v12;
                  v39[5] = &v40;
                  objc_msgSend(v12, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v17, v36, 4, 0, v39);
                  v18 = (void *)MEMORY[0x1E0CB38E8];
                  objc_msgSend((id)v41[5], "componentsJoinedByString:", &stru_1E6E549F0);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = 0;
                  objc_msgSend(v18, "regularExpressionWithPattern:options:error:", v19, 1, &v38);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = v38;

                  v22 = (void *)v58[5];
                  v23 = objc_msgSend(v22, "length");
                  v37[0] = MEMORY[0x1E0C809B0];
                  v37[1] = 3221225472;
                  v37[2] = __SSQueryParserStripKindFromString_block_invoke_3;
                  v37[3] = &unk_1E6E44098;
                  v37[4] = &v57;
                  objc_msgSend(v20, "enumerateMatchesInString:options:range:usingBlock:", v22, 0, 0, v23, v37);

                  _Block_object_dispose(&v40, 8);
                }
              }

            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
          }
          while (v9);
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v34);
  }

  v24 = (void *)v58[5];
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByTrimmingCharactersInSet:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v57, 8);
  return v26;
}

void sub_1B8719948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

id SSRedactString(void *a1, int a2)
{
  id v3;
  unint64_t v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  if (v4 > 4)
  {
    v6 = v4;
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "substringToIndex:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (a2)
    {
      objc_msgSend(v3, "substringFromIndex:", v6 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@...%@<%lu chars>"), v9, v10, v6);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@...<%lu chars>"), v8, v6);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

id SSRedactSuggestionIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "length")
    && objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"))
    && objc_msgSend(v3, "length")
    && (v5 = objc_msgSend(v3, "rangeOfString:", CFSTR(":")), v5 != 0x7FFFFFFFFFFFFFFFLL)
    && (v6 = v5, v5 < objc_msgSend(v3, "length") - 1))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "substringToIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", v6 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SSRedactString(v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@"), v8, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v3;
  }

  return v11;
}

void SSInitLogging()
{
  if (SSInitLogging_once != -1)
    dispatch_once(&SSInitLogging_once, &__block_literal_global_20);
}

id SSPommesRankerLog()
{
  uint64_t *v0;

  v0 = &updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken;
  if (qword_1ED55F100)
    return (id)qword_1ED55F100;
  if (SSInitLogging_once != -1)
  {
    dispatch_once(&SSInitLogging_once, &__block_literal_global_20);
    v0 = &updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken;
  }
  return (id)v0[32];
}

id SSRecentResultsLog()
{
  uint64_t *v0;

  v0 = &updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken;
  if (qword_1ED55F108)
    return (id)qword_1ED55F108;
  if (SSInitLogging_once != -1)
  {
    dispatch_once(&SSInitLogging_once, &__block_literal_global_20);
    v0 = &updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken;
  }
  return (id)v0[33];
}

uint64_t localeChangeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "update");
}

void sub_1B8720EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t isMacOS()
{
  return 0;
}

uint64_t isIpad()
{
  if (isIpad_onceToken != -1)
    dispatch_once(&isIpad_onceToken, &__block_literal_global_22);
  return isIpad_isIpad;
}

uint64_t __isIpad_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  isIpad_isIpad = (_DWORD)result == 3;
  return result;
}

id SSBundleIdentifiersForSyndicatedPhotos()
{
  _QWORD v1[8];

  v1[7] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("com.apple.mobileslideshow");
  v1[1] = CFSTR("com.apple.plphotosctl");
  v1[2] = CFSTR("com.apple.searchd.syndicatedPhotos");
  v1[3] = CFSTR("com.apple.searchd.syndicatedPhotos.MobileSMS");
  v1[4] = CFSTR("com.apple.searchd.syndicatedPhotos.mobilenotes");
  v1[5] = CFSTR("com.apple.spotlight.syndicatedPhotos.fileProvider");
  v1[6] = CFSTR("com.apple.searchd.syndicatedPhotos.mobileslideshow");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t SSSectionIsSyndicatedPhotos(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = SSSectionIsSyndicatedPhotos_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&SSSectionIsSyndicatedPhotos_onceToken, &__block_literal_global_213);
  v3 = objc_msgSend((id)SSSectionIsSyndicatedPhotos_photosBundleIdentifiers, "containsObject:", v2);

  return v3;
}

uint64_t SSSectionIsMailOrPommesCTL(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.pommesctl"));

  return v2;
}

uint64_t SSPommesRankingForSectionBundle(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((SSSectionIsMailOrPommesCTL(v1) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.argos.BlendABApp2")) & 1) != 0)
  {
LABEL_5:
    v2 = _os_feature_enabled_impl();
    goto LABEL_6;
  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) == 0
    && (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) == 0
    && (SSSectionIsSyndicatedPhotos(v1) & 1) == 0)
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.spotlight.events")) & 1) == 0
      && (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) == 0
      && (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) == 0
      && (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) == 0
      && (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) == 0
      && !objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
    {
      v2 = 0;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_2:
  v2 = 1;
LABEL_6:

  return v2;
}

id SSStringFromTopHit(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (SSStringFromTopHit_onceToken != -1)
    dispatch_once(&SSStringFromTopHit_onceToken, &__block_literal_global_233);
  v2 = (void *)SSStringFromTopHit__topHitValueStrings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown SFTopHit Value: %d"), a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

id SSStringFromTopHitReasonType(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (SSStringFromTopHitReasonType_onceToken != -1)
    dispatch_once(&SSStringFromTopHitReasonType_onceToken, &__block_literal_global_245);
  v2 = (void *)SSStringFromTopHitReasonType__topHitReasonStrings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown TopHitReason: %d"), a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

void SSLogTopHitWithReasonType(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7;
  id v8;

  v7 = a2;
  SSStringFromTopHitReasonType(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  SSLogTopHitWithReasonString(a1, v7, v8, a4);

}

void SSLogTopHitWithReasonString(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "rankingItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v7, "sectionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
  {
    v12 = CFSTR("(private)");
  }
  else
  {
    SSRedactString(v10, 1);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  SSStringFromTopHit(a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SSGeneralLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "sectionBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationBundleIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v19 = 138413570;
    v18 = &stru_1E6E549F0;
    v20 = v15;
    v21 = 2112;
    if (a4)
      v18 = CFSTR("[Classic Spotlight] ");
    v22 = v16;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v18;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_1B86C5000, v14, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][TopHit Rules] result.sectionBundleIdentifier: %@, result.applicationBundleIdentifier: %@, Title: %@, TopHit: %@, Reason: %@%@", (uint8_t *)&v19, 0x3Eu);

  }
}

uint64_t SSSetTopHitWithReasonString(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a2;
  objc_msgSend(v8, "setTopHit:", a1);
  SSLogTopHitWithReasonString(a1, v8, v7, a4);

  return a1;
}

uint64_t SSSetTopHitWithReasonType(uint64_t a1, void *a2, uint64_t a3, int a4, int a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a2;
  objc_msgSend(v9, "setTopHit:", a1);
  if (a5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      objc_msgSend(v10, "rankingItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v10, "rankingItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTopHitReason:", a3);

      }
    }
  }
  SSLogTopHitWithReasonType(a1, v9, a3, a4);

  return a1;
}

uint64_t SSResultTypeIsServer(unsigned int a1)
{
  return (a1 < 0x1C) & (0xC020002u >> a1);
}

uint64_t SSResultTypeIsLocalSuggestion(unsigned int a1)
{
  return (a1 < 0x28) & (0xCD80008000uLL >> a1);
}

uint64_t SSSuggestionTypeForResultType(int a1)
{
  int v1;
  uint64_t result;

  v1 = a1 - 15;
  result = 6;
  switch(v1)
  {
    case 2:
      result = 1;
      break;
    case 12:
      result = 11;
      break;
    case 13:
      result = 12;
      break;
    case 14:
      result = 14;
      break;
    case 15:
      return result;
    case 17:
      result = 5;
      break;
    case 18:
      result = 13;
      break;
    default:
      result = 7;
      break;
  }
  return result;
}

id SSRoundDouble(int a1, double a2)
{
  BOOL v2;
  void *v3;
  double v6;
  double v7;
  double v8;

  v2 = a2 < 0.0;
  if (a2 == 0.0)
  {
    v3 = &unk_1E6E97AB8;
  }
  else
  {
    v6 = -a2;
    if (!v2)
      v6 = a2;
    v7 = log10(v6);
    v8 = __exp10((double)(int)(a1 - vcvtpd_s64_f64(v7)));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(uint64_t)round(v8 * a2) / v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t SSRoundUInt64(unint64_t a1)
{
  unint64_t v1;

  if (a1 >= 0x3E9)
    v1 = 10000 * (a1 / 0x2710);
  else
    v1 = a1;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v1);
}

id SSValuesFromPlistWithPath(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  id v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "fileExistsAtPath:", v1),
        v2,
        v3))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v1, 8, 0);
    if (!objc_msgSend(v4, "length"))
      goto LABEL_17;
    v5 = objc_retainAutorelease(v4);
    objc_msgSend(v5, "bytes");
    objc_msgSend(v5, "length");
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __SSValuesFromPlistWithPath_block_invoke;
    v25 = &__block_descriptor_40_e5_v8__0l;
    v26 = v5;
    v6 = _MDPlistContainerCreateWithBytesAndDeallocator();
    if (v6)
    {
      v7 = (const void *)v6;
      v8 = (void *)_MDPlistContainerCopyRootObject();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v9, "addEntriesFromDictionary:", v15, (_QWORD)v18);
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        }
        while (v12);
      }

      if (objc_msgSend(v9, "count"))
        v16 = v9;
      else
        v16 = 0;
      CFRelease(v7);

    }
    else
    {
LABEL_17:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t SSScreenTimeStatusForApplicationPathWithCompletionHandler(uint64_t a1, uint64_t a2)
{
  if (a2)
    (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, 0);
  return 0;
}

uint64_t SSScreenTimeStatusForFilePathWithCompletionHandler()
{
  return 0;
}

uint64_t SSScreenTimeStatusForBundleIDWithCompletionHandler(void *a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  if (onceCacheToken == -1)
  {
    if (v3)
    {
LABEL_3:
      os_unfair_lock_lock((os_unfair_lock_t)&screenTimeCacheLock);
      v5 = objc_msgSend((id)checkedScreenTimeStatusCache, "containsObject:", v3);
      if (v4 || (v5 & 1) == 0)
      {
        objc_msgSend((id)checkedScreenTimeStatusCache, "addObject:", v3);
        v6 = objc_msgSend((id)screenTimeStatusForBundleCache, "containsObject:", v3);
        os_unfair_lock_unlock((os_unfair_lock_t)&screenTimeCacheLock);
        v7 = v3;
        v8 = v4;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __updateScreenTimeStatusForBundleId_block_invoke;
        v10[3] = &unk_1E6E446A8;
        v11 = v7;
        v12 = v8;
        dispatch_async((dispatch_queue_t)screenTimeStatusFetchQueue, v10);

      }
      else
      {
        v6 = objc_msgSend((id)screenTimeStatusForBundleCache, "containsObject:", v3);
        os_unfair_lock_unlock((os_unfair_lock_t)&screenTimeCacheLock);
      }
      goto LABEL_11;
    }
  }
  else
  {
    dispatch_once(&onceCacheToken, &__block_literal_global_459);
    if (v3)
      goto LABEL_3;
  }
  if (v4)
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  v6 = 0;
LABEL_11:

  return v6;
}

id strippedURL(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = a1;
  if (strippedURL_onceToken != -1)
    dispatch_once(&strippedURL_onceToken, &__block_literal_global_314);
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("http://www.")))
  {
    objc_msgSend(v1, "substringFromIndex:", 11);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("https://www.")))
  {
    objc_msgSend(v1, "substringFromIndex:", 12);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("https://")))
  {
    objc_msgSend(v1, "substringFromIndex:", 8);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v4;
  }
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("http://")))
  {
    objc_msgSend(v1, "substringFromIndex:", 7);
    v5 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v5;
  }
  objc_msgSend(v1, "stringByTrimmingCharactersInSet:", strippedURL_trimSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __strippedURL_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)strippedURL_trimSet;
  strippedURL_trimSet = v0;

}

void handleHiddenResult(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a1;
  v5 = a2;
  if (v5 != v12)
  {
    v6 = a3;
    objc_msgSend(v6, "hiddenExtResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHiddenExtResults:", v8);

    objc_msgSend(v5, "setNoGoTakeover:", objc_msgSend(v12, "noGoTakeover") | objc_msgSend(v5, "noGoTakeover"));
    objc_msgSend(v5, "duplicatedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v5, "setDuplicatedItems:", v10);

    }
    objc_msgSend(v5, "duplicatedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
}

id SSGetCurrentLocale(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[7];
  _QWORD v8[4];
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a1;
  if (SSGetCurrentLocale_onceToken != -1)
    dispatch_once(&SSGetCurrentLocale_onceToken, &__block_literal_global_326);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__3;
  v9[4] = __Block_byref_object_dispose__3;
  v10 = 0;
  v4 = v3;
  v10 = v4;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __SSGetCurrentLocale_block_invoke_2;
  v7[3] = &unk_1E6E44588;
  v7[4] = v9;
  v7[5] = v8;
  v7[6] = &v11;
  objc_msgSend((id)SSGetCurrentLocale_localeObserver, "currentLocaleWithPreferredLanguagesBlock:", v7);
  v5 = (id)v12[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(&v11, 8);
  return v5;
}

void sub_1B872289C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t SSSplitCounts(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8, uint64_t *a9, _QWORD *a10)
{
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;

  if (a2 == 0x7FFFFFFF || (v10 = result, result >= a2) && (v10 = result, a2 >= 1))
    v10 = a2;
  if (a5 == 0x7FFFFFFF || (v11 = a4, a4 >= a5) && (v11 = a4, a5 >= 1))
    v11 = a5;
  if (v10 && v11)
  {
    v12 = (uint64_t)((double)a7 * 0.5);
    if (a7 <= 2)
      v12 = 1;
    if (v12 < v10)
      v10 = v12;
    v13 = a7 - v11;
    if (a7 - v10 <= v11)
      v13 = v10;
    if (a7 - v10 < v11)
      v11 = a7 - v10;
  }
  else
  {
    if (v11 >= a7)
      v14 = a7;
    else
      v14 = v11;
    if (v11)
      v11 = v14;
    else
      v11 = 0;
    if (v10 >= a7)
      v13 = a7;
    else
      v13 = v10;
    if (v10)
      v11 = 0;
    else
      v13 = 0;
  }
  if (v13 >= result)
    v13 = result;
  if (v13 >= a2)
    v13 = a2;
  if (v11 >= a4)
    v11 = a4;
  if (v11 >= a5)
    v15 = a5;
  else
    v15 = v11;
  v16 = a3 - 1;
  if (a3 - 1 >= (unint64_t)(v13 - 1))
    v16 = v13 - 1;
  v17 = v13 - 1 - v16;
  v18 = ~v16 + a7;
  if (a3 < 1)
  {
    v17 = v13;
    v18 = a7;
  }
  if (!v13)
  {
    v17 = 0;
    v18 = a7;
  }
  v19 = a6 - 1;
  if (a6 - 1 >= (unint64_t)(v15 - 1))
    v19 = v15 - 1;
  v20 = v15 - 1 - v19;
  v21 = v18 + ~v19;
  if (a6 < 1)
  {
    v20 = v15;
    v21 = v18;
  }
  if (v15)
    v18 = v21;
  else
    v20 = 0;
  if (a2 >= result)
    v22 = result;
  else
    v22 = a2;
  if (a5 >= a4)
    v23 = a4;
  else
    v23 = a5;
  while (v20 + v17 < v18)
  {
    if (a2 && v17 >= v22)
    {
      v24 = 1;
      if (a5 && v20 >= v23)
        break;
    }
    else
    {
      ++v17;
      if (a5)
        v25 = v20 < v23;
      else
        v25 = 1;
      v24 = v25;
    }
    v20 += v24;
  }
  if (a8)
    *a8 = v17;
  if (a9)
    *a9 = v20;
  if (a10)
    *a10 = v20 + v17;
  return result;
}

BOOL _SSGetMDPlistObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return 0;
  if (_SSGetMDPlistObject_oncePathCacheToken != -1)
    dispatch_once(&_SSGetMDPlistObject_oncePathCacheToken, &__block_literal_global_329);
  return _SSGetMDPlistObject_sAppExtrasContainer && _MDPlistDictionaryGetPlistObjectForKey() != 0;
}

uint64_t SSExtraApplicationVersion()
{
  _BOOL4 v0;
  uint64_t result;
  __int128 v2;
  uint64_t v3;

  v2 = 0uLL;
  v3 = 0;
  v0 = _SSGetMDPlistObject((uint64_t)"v", 1, (uint64_t)&v2);
  result = 0;
  if (v0)
  {
    if (_MDPlistGetPlistObjectType() == 226
      || _MDPlistGetPlistObjectType() == 35
      || _MDPlistGetPlistObjectType() == 227
      || _MDPlistGetPlistObjectType() == 51)
    {
      return _MDPlistNumberGetIntValue();
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t SSApplicationHasExtraInformation(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v1 = a1;
  v9 = 0uLL;
  v10 = 0;
  v2 = 0;
  if (_SSGetMDPlistObject((uint64_t)"n", 1, (uint64_t)&v9))
  {
    v5 = v9;
    v7 = v10;
    if (_MDPlistGetPlistObjectType() == 241)
    {
      v2 = objc_msgSend(objc_retainAutorelease(v1), "UTF8String", v5, v7);
      if (v2 && _MDPlistDictionaryGetPlistObjectForKey())
        goto LABEL_12;
    }
    else
    {
      v2 = 0;
    }
  }
  if (!_SSGetMDPlistObject((uint64_t)"k", 1, (uint64_t)&v9)
    || (v6 = v9, v8 = v10, _MDPlistGetPlistObjectType() != 241)
    || !v2 && !objc_msgSend(objc_retainAutorelease(v1), "UTF8String", v6, v8)
    || !_MDPlistDictionaryGetPlistObjectForKey())
  {
    v3 = 0;
    goto LABEL_14;
  }
LABEL_12:
  v3 = 1;
LABEL_14:

  return v3;
}

id SSBuildExtraApplicationAlternateNames(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  id v22;
  unsigned int v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  __int128 v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  __n128 (*v50)(_QWORD *, uint64_t, uint64_t, __n128 *);
  void *v51;
  uint64_t *v52;
  __int128 *v53;
  __int128 *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  int v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  uint8_t v63[128];
  _BYTE buf[24];
  void *v65;
  _BYTE v66[128];
  void *v67;
  _QWORD v68[6];
  _QWORD v69[5];
  _QWORD v70[4];
  _QWORD v71[3];
  _QWORD v72[2];
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (!v5)
    goto LABEL_9;
  v61 = 0uLL;
  v62 = 0;
  if (!_SSGetMDPlistObject((uint64_t)"n", 1, (uint64_t)&v61))
    goto LABEL_9;
  v74 = v61;
  *(_QWORD *)&v75 = v62;
  if (_MDPlistGetPlistObjectType() != 241)
    goto LABEL_9;
  v59 = 0uLL;
  v60 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v34 = objc_retainAutorelease(v5);
  objc_msgSend(v34, "UTF8String");
  v74 = v61;
  *(_QWORD *)&v75 = v62;
  if (_MDPlistDictionaryGetPlistObjectForKey()
    && (v74 = v59, *(_QWORD *)&v75 = v60, _MDPlistGetPlistObjectType() == 241))
  {
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v74 = 0u;
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    v48 = MEMORY[0x1E0C809B0];
    v49 = 3221225472;
    v50 = __SSBuildExtraApplicationAlternateNames_block_invoke;
    v51 = &unk_1E6E445D0;
    v52 = &v55;
    v53 = &v83;
    v54 = &v74;
    *(_OWORD *)buf = v59;
    *(_QWORD *)&buf[16] = v60;
    _MDPlistDictionaryIterate();
    switch(*((_DWORD *)v56 + 6))
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v83);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v83);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v72[0] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v83 + 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v72[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v83);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v83 + 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v71[1] = v11;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v84);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v71[2] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v83);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v83 + 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v11;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v84);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v70[2] = v12;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v84 + 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v70[3] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 5:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v83);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v83 + 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v11;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v84);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v69[2] = v12;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v84 + 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v69[3] = v13;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v85);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v69[4] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 6:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v83);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v83 + 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v68[1] = v11;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v84);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v68[2] = v12;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v84 + 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v68[3] = v13;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v85);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v68[4] = v14;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v85 + 1));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v68[5] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

LABEL_19:
LABEL_20:

LABEL_21:
        if (*((_DWORD *)v56 + 6))
        {
          if ((a3 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
            v16 = (void *)MDRetrieveBestAvailableLanguage();
            v67 = v16;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
            v17 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v17;
          }
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          obj = v8;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v66, 16);
          if (!v18)
            goto LABEL_59;
          v36 = *(_QWORD *)v45;
          *(_QWORD *)&v19 = 138412802;
          v33 = v19;
LABEL_26:
          v37 = v18;
          v20 = 0;
          while (1)
          {
            if (*(_QWORD *)v45 != v36)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v20);
            v42 = 0uLL;
            v43 = 0;
            if (!v21)
              goto LABEL_57;
            v22 = objc_retainAutorelease(v21);
            objc_msgSend(v22, "UTF8String");
            *(_OWORD *)buf = v59;
            *(_QWORD *)&buf[16] = v60;
            if (!_MDPlistDictionaryGetPlistObjectForKey())
              goto LABEL_57;
            *(_OWORD *)buf = v42;
            *(_QWORD *)&buf[16] = v43;
            v23 = _MDPlistGetPlistObjectType() - 240;
            if (v23 > 5 || ((1 << v23) & 0x31) == 0)
              goto LABEL_57;
            *(_OWORD *)buf = v42;
            *(_QWORD *)&buf[16] = v43;
            v24 = (void *)_MDPlistContainerCopyObject();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v33;
              *(_QWORD *)&buf[4] = v22;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v34;
              *(_WORD *)&buf[22] = 2112;
              v65 = v24;
              _os_log_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "adding name %@ %@ %@", buf, 0x20u);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = v24;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              v41 = 0u;
              v27 = v26;
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v63, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v39;
                do
                {
                  for (i = 0; i != v28; ++i)
                  {
                    if (*(_QWORD *)v39 != v29)
                      objc_enumerationMutation(v27);
                    v31 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v32 = v31;
                      if (objc_msgSend(v32, "length"))
                      {
                        if (!v6)
                        {
                          objc_msgSend(MEMORY[0x1E0C99E20], "set");
                          v6 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        objc_msgSend(v6, "addObject:", v32, v33);
                      }

                    }
                  }
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v63, 16);
                }
                while (v28);
              }

              goto LABEL_55;
            }
LABEL_56:

LABEL_57:
            if (++v20 == v37)
            {
              v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v66, 16);
              if (!v18)
              {
LABEL_59:

                v9 = v6;
                goto LABEL_61;
              }
              goto LABEL_26;
            }
          }
          v25 = v24;
          if (objc_msgSend(v25, "length"))
          {
            if (!v6)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v6 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v6, "addObject:", v25, v33);
          }
LABEL_55:

          goto LABEL_56;
        }
        v9 = v6;

LABEL_61:
        _Block_object_dispose(&v55, 8);
        break;
      default:
        v9 = v6;
        goto LABEL_61;
    }
  }
  else
  {
LABEL_9:
    v9 = v6;
  }

  return v9;
}

void sub_1B87237B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

id SSAllLocalizedExtraApplicationKeywords(void *a1)
{
  id v1;
  void *v2;
  __int128 v4;
  uint64_t v5;

  v1 = a1;
  if (!v1)
    goto LABEL_7;
  v4 = 0uLL;
  v5 = 0;
  v2 = 0;
  if (_SSGetMDPlistObject((uint64_t)"k", 1, (uint64_t)&v4))
  {
    if (_MDPlistGetPlistObjectType() == 241)
    {
      objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
      if (_MDPlistDictionaryGetPlistObjectForKey())
      {
        if (_MDPlistGetPlistObjectType() == 241)
        {
          v2 = (void *)_MDPlistContainerCopyObject();
          goto LABEL_8;
        }
      }
    }
LABEL_7:
    v2 = 0;
  }
LABEL_8:

  return v2;
}

id SSExtraApplicationKeywords(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint8_t buf[24];
  void *v24;
  _QWORD v25[6];
  _QWORD v26[5];
  _QWORD v27[4];
  _QWORD v28[3];
  _QWORD v29[2];
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    goto LABEL_8;
  v21 = 0uLL;
  v22 = 0;
  if (!_SSGetMDPlistObject((uint64_t)"k", 1, (uint64_t)&v21))
    goto LABEL_8;
  v31 = v21;
  *(_QWORD *)&v32 = v22;
  if (_MDPlistGetPlistObjectType() != 241)
    goto LABEL_8;
  v19 = 0uLL;
  v20 = 0;
  v2 = objc_retainAutorelease(v1);
  objc_msgSend(v2, "UTF8String");
  v31 = v21;
  *(_QWORD *)&v32 = v22;
  if (!_MDPlistDictionaryGetPlistObjectForKey())
    goto LABEL_8;
  v31 = v19;
  *(_QWORD *)&v32 = v20;
  if (_MDPlistGetPlistObjectType() == 241)
  {
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    *(_OWORD *)buf = v19;
    *(_QWORD *)&buf[16] = v20;
    _MDPlistDictionaryIterate();
    switch(*((_DWORD *)v16 + 6))
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v40);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v3;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v40);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v3;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v40 + 1));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v40);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v3;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v40 + 1));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v28[1] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v41);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v28[2] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v40);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v3;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v40 + 1));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v41);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2] = v8;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v41 + 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v27[3] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 5:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v40);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v3;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v40 + 1));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v41);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = v8;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v41 + 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26[3] = v9;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v42);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v26[4] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 6:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v40);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v3;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v40 + 1));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v41);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2] = v8;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v41 + 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25[3] = v9;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (_QWORD)v42);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25[4] = v10;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)&v42 + 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25[5] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
LABEL_17:

LABEL_18:
LABEL_19:

LABEL_20:
        if (*((_DWORD *)v16 + 6))
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
          v12 = (void *)MDRetrieveBestAvailableLanguage();
          v13 = v12;
          if (v12
            && (v14 = objc_retainAutorelease(v12),
                objc_msgSend(v14, "UTF8String"),
                *(_OWORD *)buf = v19,
                *(_QWORD *)&buf[16] = v20,
                _MDPlistDictionaryGetPlistObjectForKey())
            && (memset(buf, 0, sizeof(buf)), (_MDPlistGetPlistObjectType() & 0xFFFFFFFE) == 0xF4))
          {
            memset(buf, 0, sizeof(buf));
            v5 = (void *)_MDPlistContainerCopyObject();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v14;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v2;
              *(_WORD *)&buf[22] = 2112;
              v24 = v5;
              _os_log_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "adding keyword %@ %@ %@", buf, 0x20u);
            }
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
        break;
      default:
        v5 = 0;
        v4 = 0;
        break;
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
LABEL_8:
    v5 = 0;
  }

  return v5;
}

void sub_1B8723F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _SSGetAbbreviationsMDPlistObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return 0;
  if (_SSGetAbbreviationsMDPlistObject_oncePathCacheToken != -1)
    dispatch_once(&_SSGetAbbreviationsMDPlistObject_oncePathCacheToken, &__block_literal_global_337);
  return _SSGetAbbreviationsMDPlistObject_sAbbreviationsContainer
      && _MDPlistDictionaryGetPlistObjectForKey() != 0;
}

uint64_t SSAbbreviationsVersion()
{
  _BOOL4 v0;
  uint64_t result;
  __int128 v2;
  uint64_t v3;

  v2 = 0uLL;
  v3 = 0;
  v0 = _SSGetAbbreviationsMDPlistObject((uint64_t)"v", 1, (uint64_t)&v2);
  result = 0;
  if (v0)
  {
    if (_MDPlistGetPlistObjectType() == 226
      || _MDPlistGetPlistObjectType() == 35
      || _MDPlistGetPlistObjectType() == 227
      || _MDPlistGetPlistObjectType() == 51)
    {
      return _MDPlistNumberGetIntValue();
    }
    else
    {
      return 0;
    }
  }
  return result;
}

id SSAllLengthyOriginals(void *a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __int128 v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v3 = a2;
  objc_msgSend(a1, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || -[__CFString hasPrefix:](v5, "hasPrefix:", CFSTR("en"))
    && (unint64_t)-[__CFString length](v5, "length") >= 3)
  {

    v5 = CFSTR("en");
  }
  v9 = 0uLL;
  v10 = 0;
  v6 = objc_retainAutorelease(v5);
  v7 = 0;
  if (_SSGetAbbreviationsMDPlistObject(-[__CFString UTF8String](v6, "UTF8String"), -[__CFString length](v6, "length"), (uint64_t)&v9))
  {
    if (_MDPlistGetPlistObjectType() == 241
      && (objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), _MDPlistDictionaryGetPlistObjectForKey())
      && _MDPlistGetPlistObjectType() == 240)
    {
      v7 = (void *)_MDPlistContainerCopyObject();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

id SSBuildTTRURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  id obj;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[8];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v48 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Build>"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)_CFCopySupplementalVersionDictionary();
  objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v8;
  if (v8)
  {
    v9 = v8;

    v7 = v9;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v7;
  objc_msgSend(v10, "appendFormat:", CFSTR("Build: %@\n\n"), v7);
  v47 = v5;
  objc_msgSend(v10, "appendFormat:", CFSTR("Query: %@\n\n"), v5);
  objc_msgSend(v10, "appendString:", CFSTR("Results:\n"));
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v11)
  {
    v12 = v11;
    v50 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v57 != v50)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v10, "appendString:", CFSTR("\n"));
        objc_msgSend(v14, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendFormat:", CFSTR("%@ <%@> maxInitiallyVisibleResults: %lu, isInitiallyHidden; %d\n"),
          v15,
          v16,
          objc_msgSend(v14, "maxInitiallyVisibleResults"),
          objc_msgSend(v14, "isInitiallyHidden"));

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend(v14, "results");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v53 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "ttrDescription");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "appendFormat:", CFSTR("\t%@"), v22);

              objc_msgSend(v10, "appendString:", CFSTR("\n"));
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          }
          while (v19);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Problem Summary: \n\nSteps to Reproduce: \n\nRegression Information: \n\n*** Note: Debug info contains the titles of items in the UI. Please review for confidential information. ***\n\n===  DEBUG INFO  ===\n\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("%@\n\n"), v10);
  v24 = &stru_1E6E549F0;
  if (v48)
    v24 = v48;
  objc_msgSend(v23, "appendFormat:", CFSTR("%@\n\n"), v24);
  SSDefaultsGetResources();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "getTTRLogs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v23;
  objc_msgSend(v23, "appendString:", v26);

  SSExtensionIdentifiersForSections(obj);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v27, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Spotlight (New Bugs)"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v51;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v42;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("312963"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v41;
  v28 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v43, "componentsJoinedByString:", CFSTR(","));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "queryItemWithName:value:", CFSTR("ExtensionIdentifiers"), v40);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v29;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v30;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v31;
  v32 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), v46);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "queryItemWithName:value:", CFSTR("Title"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v34;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), v23);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v60[7] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setQueryItems:", v36);

  objc_msgSend(v27, "URL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

id SSExtensionIdentifiersForSections(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  int IsSyndicatedPhotos;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    v5 = &unk_1E6E9B578;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "bundleIdentifier", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v7);

        if (IsSyndicatedPhotos)
        {
          objc_msgSend(&unk_1E6E9B578, "arrayByAddingObject:", CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v5 = &unk_1E6E9B578;
  }
LABEL_12:

  return v5;
}

uint64_t isImageOrVideoContentType(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC520]);

  return v2;
}

uint64_t isMessagesAttachmentCoreSpotlightId(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("at_"));
}

id SSAppNameForBundleId(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v7;

  v1 = a1;
  v7 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v1, 1, &v7);
  v3 = v7;
  objc_msgSend(v2, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    SSGeneralLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      SSAppNameForBundleId_cold_1((uint64_t)v1, (uint64_t)v3, v5);

  }
  return v4;
}

id SSBundlesDonatingPhotos()
{
  if (SSBundlesDonatingPhotos_onceToken != -1)
    dispatch_once(&SSBundlesDonatingPhotos_onceToken, &__block_literal_global_411_0);
  return (id)SSBundlesDonatingPhotos_bundlesDonatingPhotos;
}

uint64_t utf32BEToHex(unsigned int *a1)
{
  return bswap32(*a1);
}

uint64_t syllableToConsonant(uint64_t result)
{
  if ((result - 4352) >= 0x13)
  {
    if ((result - 44032) >> 2 > 0xAE8)
    {
      if ((result - 12593) > 0x1D)
        return 0;
      else
        return dword_1B87DF22C[(int)result - 12593];
    }
    else
    {
      return ((28533 * (unsigned __int16)(result + 21504)) >> 24) | 0x1100;
    }
  }
  return result;
}

uint64_t syllableToConsonantCompatibility(uint64_t a1)
{
  uint64_t result;

  result = syllableToConsonant(a1);
  if ((_DWORD)result)
    return koreanConsonantTable[(result - 4352)];
  return result;
}

uint64_t addUtf32BEToBufferAtIndexFromHex(uint64_t result, _QWORD *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (*a2)++;
  *(_BYTE *)(result + v3) = HIBYTE(a3);
  v4 = (*a2)++;
  *(_BYTE *)(result + v4) = BYTE2(a3);
  v5 = (*a2)++;
  *(_BYTE *)(result + v5) = BYTE1(a3);
  v6 = (*a2)++;
  *(_BYTE *)(result + v6) = a3;
  return result;
}

CFStringRef createConsonantsStringForKorean(const __CFString *a1, int a2)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  size_t v6;
  char *v7;
  char *v8;
  UInt8 *v9;
  UInt8 *v10;
  CFIndex v11;
  unsigned int *v12;
  unsigned int *v13;
  unsigned int v14;
  NSObject *v15;
  const char *v16;
  CFStringRef v17;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0xC000100u);
  v6 = MaximumSizeForEncoding + 1;
  v7 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x1C3FB025uLL);
  if (!v7)
  {
    SSGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v19 = 138412290;
    v20 = a1;
    v16 = "[consonantString] Failed malloc for bufferUtf32, string: %@";
LABEL_23:
    _os_log_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0xCu);
    goto LABEL_24;
  }
  v8 = v7;
  if (!CFStringGetCString(a1, v7, v6, 0x18000100u))
  {
    free(v8);
    SSGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v19 = 138412290;
    v20 = a1;
    v16 = "[consonantString] Failed to get utf32be for string: %@";
    goto LABEL_23;
  }
  v9 = (UInt8 *)malloc_type_malloc(v6, 0xBD6FFC35uLL);
  if (!v9)
  {
    SSGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v19 = 138412290;
    v20 = a1;
    v16 = "[consonantString] Failed malloc for consonantsBuffer, string: %@";
    goto LABEL_23;
  }
  v10 = v9;
  if (MaximumSizeForEncoding >= 1)
  {
    v11 = 0;
    v12 = (unsigned int *)&v8[MaximumSizeForEncoding];
    v13 = (unsigned int *)v8;
    while (1)
    {
      v14 = syllableToConsonant(bswap32(*v13));
      if (!a2)
        goto LABEL_9;
      if (v14)
        break;
LABEL_11:
      if (++v13 >= v12)
        goto LABEL_20;
    }
    v14 = koreanConsonantTable[v14 - 4352];
LABEL_9:
    if (v14)
    {
      *(_DWORD *)&v10[v11] = bswap32(v14);
      v11 += 4;
    }
    goto LABEL_11;
  }
  v11 = 0;
  v13 = (unsigned int *)v8;
LABEL_20:
  *(_BYTE *)v13 = 0;
  free(v8);
  v17 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, v11, 0x18000100u, 0);
  free(v10);
  if (!v17)
  {
    SSGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = a1;
      v16 = "[consonantString] consonantsString is null for string: %@";
      goto LABEL_23;
    }
LABEL_24:

    return 0;
  }
  return v17;
}

uint64_t SSSnippetModernizationEnabled()
{
  void *v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v5;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v1 = objc_msgSend(v0, "BOOLeanForKey:didFailWithError:", CFSTR("SnippetModernization"), &v5);
  v2 = v5;

  if (v2)
    v3 = 1;
  else
    v3 = v1;
  return _os_feature_enabled_impl() & v3;
}

uint64_t SSAppTopHitWithShortcutsEnabled()
{
  void *v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v5;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v1 = objc_msgSend(v0, "BOOLeanForKey:didFailWithError:", CFSTR("AppTopHitWithShortcuts"), &v5);
  v2 = v5;

  if (v2)
    v3 = 1;
  else
    v3 = v1;
  return _os_feature_enabled_impl() & v3;
}

uint64_t SSShortcutsAppSectionEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t SSAppVendedTopHitViewsEnabled()
{
  void *v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v5;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v1 = objc_msgSend(v0, "BOOLeanForKey:didFailWithError:", CFSTR("AppVendedTopHits"), &v5);
  v2 = v5;

  if (v2)
    v3 = 1;
  else
    v3 = v1;
  return _os_feature_enabled_impl() & v3;
}

uint64_t SSPriorityIndexFastPathEnabled()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  id v5;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v1 = objc_msgSend(v0, "BOOLeanForKey:didFailWithError:", CFSTR("EnablePriorityIndexFastPath"), &v5);
  v2 = v5;

  if (v2)
  {
    SSGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      SSPriorityIndexFastPathEnabled_cold_1();

    v1 = 1;
  }

  return v1;
}

uint64_t SSPriorityIndexLimitBundles()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  id v5;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v1 = objc_msgSend(v0, "BOOLeanForKey:didFailWithError:", CFSTR("PriorityIndexLimitBundles"), &v5);
  v2 = v5;

  if (v2)
  {
    SSGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      SSPriorityIndexLimitBundles_cold_1();

    v1 = 1;
  }

  return v1;
}

uint64_t SSPriorityIndexDelayMilliseconds()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v1 = objc_msgSend(v0, "longForKey:didFailWithError:", CFSTR("PriorityIndexDelayMilliseconds"), &v11);
  v2 = v11;

  if (v2)
  {
    SSGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      SSPriorityIndexDelayMilliseconds_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

    v1 = 0;
  }

  return v1;
}

uint64_t SSIsCounterFactual()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v1 = objc_msgSend(v0, "BOOLeanForKey:didFailWithError:", CFSTR("IsCounterFactual"), &v11);
  v2 = v11;

  if (v2)
  {
    SSGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      SSIsCounterFactual_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

    v1 = 0;
  }

  return v1;
}

id SSFetchAttributeValueIsValid(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = v2;
            goto LABEL_14;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }

    v7 = 0;
LABEL_14:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t SSPrepareItemsLimit(void *a1, void *a2)
{
  id v3;
  unint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {
    v4 = objc_msgSend(v3, "length");
    if (v4 <= 6)
      v5 = 25;
    else
      v5 = 40;
    if (v4 == 8)
      v6 = 50;
    else
      v6 = v5;
    if (v4 <= 8)
      v7 = v6;
    else
      v7 = 65;
    if (v4 >= 5)
      v8 = v7;
    else
      v8 = 20;
  }
  else
  {
    v8 = 20;
  }

  return v8;
}

uint64_t SSSpotlightL1Compare(void *a1, void *a2, double *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;

  v5 = a1;
  v6 = a2;
  v7 = objc_msgSend(v5, "test_indexScore");
  v9 = v8;
  v10 = objc_msgSend(v6, "test_indexScore");
  if (v7 | v9 && v10 | v11)
  {
    if (__PAIR128__(v11, v10) < __PAIR128__(v9, v7))
      v12 = -1;
    else
      v12 = 1;
    if (v9 == v11 && v7 == v10)
      v14 = -1;
    else
      v14 = v12;
  }
  else
  {
    v15 = *a3;
    objc_msgSend(v5, "interestingDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v18 = vabdd_f64(v15, v17);

    v19 = *a3;
    objc_msgSend(v6, "interestingDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = vabdd_f64(v19, v21);

    v23 = -1;
    if (v18 >= v22)
      v23 = 1;
    if (v18 == v22)
      v23 = 0;
    v14 = v23;
  }

  return v14;
}

void SSBinaryHeapApplierFunction(uint64_t a1, uint64_t a2)
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  char v4;

  v3 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCB38DC](a2);
  v4 = 0;
  ((void (**)(_QWORD, uint64_t, char *))v3)[2](v3, a1, &v4);

}

void __updateScreenTimeStatusForBundleId_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  v3 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v10);
  v5 = v10;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __updateScreenTimeStatusForBundleId_block_invoke_2;
    v7[3] = &unk_1E6E44680;
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "getDeviceManagementPolicyWithCompletionHandler:", v7);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }

}

void __updateScreenTimeStatusForBundleId_block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;

  v4 = a2 != 0;
  os_unfair_lock_lock((os_unfair_lock_t)&screenTimeCacheLock);
  v5 = *(_QWORD *)(a1 + 32);
  if (a2)
    objc_msgSend((id)screenTimeStatusForBundleCache, "addObject:", v5);
  else
    objc_msgSend((id)screenTimeStatusForBundleCache, "removeObject:", v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&screenTimeCacheLock);
  if (*(_QWORD *)(a1 + 40))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __updateScreenTimeStatusForBundleId_block_invoke_3;
    v6[3] = &unk_1E6E44658;
    v7 = *(id *)(a1 + 40);
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __updateScreenTimeStatusForBundleId_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

CFTypeRef SSBinaryHeapRetainFunction(int a1, CFTypeRef cf)
{
  return CFRetain(cf);
}

void SSBinaryHeapReleaseFunction(int a1, CFTypeRef cf)
{
  CFRelease(cf);
}

uint64_t SSBinaryHeapCompareInternal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a3 + 16) + 16))();
  v4 = 1;
  if (v3 != -1)
    v4 = -1;
  if (v3)
    return v4;
  else
    return 0;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id comparatorWithBlock_block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)MEMORY[0x1BCCB38DC](a2);
}

id comparatorForDateAttribute_block_invoke_2(uint64_t a1, int a2)
{
  _QWORD v3[4];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = comparatorForDateAttribute_block_invoke_3;
  v3[3] = &__block_descriptor_36_e11_q24__0_8_16l;
  v4 = a2;
  return (id)MEMORY[0x1BCCB38DC](v3);
}

uint64_t comparatorForDateAttribute_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int8x8_t *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;

  v5 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(a2, "attributes"), *(int *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int8x8_t *)objc_msgSend(v5, "attributes");

  SSCompactRankingAttrsGetValue(v7, *(int *)(a1 + 32));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    objc_opt_class();
    v10 = objc_opt_isKindOfClass() ^ 1;
    if (v9)
    {
LABEL_3:
      objc_opt_class();
      v11 = objc_opt_isKindOfClass() ^ 1;
      goto LABEL_6;
    }
  }
  else
  {
    v10 = 0;
    if (v8)
      goto LABEL_3;
  }
  v11 = 0;
LABEL_6:
  if (((v10 | v11) & 1) != 0)
  {
    getpid();
    SimulateCrash();
    if (((v10 ^ 1 | v11) & 1) != 0)
      v12 = v11 & (v10 ^ 1) & 1;
    else
      v12 = -1;
  }
  else
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    if (v14 < v15)
      v12 = -1;
    else
      v12 = v14 > v15;
  }

  return v12;
}

void *comparatorForPastDateRecency_block_invoke_4()
{
  return &__block_literal_global_16;
}

uint64_t comparatorForPastDateRecency_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "mostRecentUsedDate");
  v7 = v6;
  objc_msgSend(v5, "mostRecentUsedDate");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "mostRecentUsedDate");
    v11 = v10;
    objc_msgSend(v5, "mostRecentUsedDate");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void *comparatorForFutureDateRecency_block_invoke_6()
{
  return &__block_literal_global_18;
}

uint64_t comparatorForFutureDateRecency_block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "closestUpComingDate");
  v7 = v6;
  objc_msgSend(v5, "closestUpComingDate");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "closestUpComingDate");
    v11 = v10;
    objc_msgSend(v5, "closestUpComingDate");
    v9 = v11 < v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void sub_1B87284DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getFilteredSuggestionResults(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v15;
LABEL_5:
      v11 = 0;
      v12 = v9 + v8;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        if ((a2 & 0x8000000000000000) == 0 && v9 + v11 >= a2)
          break;
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), (_QWORD)v14);
        if (v8 == v11)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          v9 = v12;
          if (v8)
            goto LABEL_5;
          break;
        }
      }
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

void __getFeaturesForSuggestionResult_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)getFeaturesForSuggestionResult_sFeatureClasses;
  getFeaturesForSuggestionResult_sFeatureClasses = v2;

}

uint64_t assetIsValid(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Canned")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Experimental"));
  }

  return v2;
}

uint64_t getAssetTypeForName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Canned")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Experimental")))
  {
    v2 = 2;
  }
  else
  {
    v2 = -1;
  }

  return v2;
}

void SSDefaultsSetResources(id obj)
{
  objc_storeStrong((id *)&sSRResources, obj);
}

void SSDefaultsLogForTrigger(void *a1, uint64_t a2)
{
  id v3;
  id v4;

  v3 = a1;
  SSDefaultsGetResources();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logForTrigger:queryID:", v3, a2);

}

id SSDefaultsGetAssetPath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v1 = a1;
  SSDefaultsGetResources();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filePathArrayForKey:", CFSTR("SpotlightServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __SSDefaultsGetAssetPath_block_invoke;
  v7[3] = &unk_1E6E44C08;
  v4 = v1;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1B872F0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t SSDefaultsSetBullseyeForTesting(uint64_t result)
{
  state_enabled_bullseye_testing = result;
  return result;
}

BOOL SSDefaultsGetState(unint64_t a1)
{
  unint64_t v2;
  _QWORD block[5];

  if (state_enabled_bullseye_testing)
    return 1;
  if (a1 > 6)
    return 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SSDefaultsGetState_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (state_once_tokens[a1] != -1)
  {
    v2 = a1;
    dispatch_once(&state_once_tokens[a1], block);
    a1 = v2;
  }
  return state_enabled_values[a1] != 0;
}

uint64_t SSEnableLocalDetailText()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("LocalDetailText"));

  return v1;
}

uint64_t SSEnableSpotlightKnowledge()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("EnableSpotlightKnowledge"));

  return v1;
}

uint64_t SSPreferLocalResultsOnLocalEngagment()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("PreferLocalResultsOnEngagment"));

  return v1;
}

uint64_t SSCreateAsTypedSuggestion()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("CreateAsTypedSuggestion"));

  return v1;
}

uint64_t SSShowSearchInApps()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("ShowSearchInApps"));

  return v1;
}

uint64_t SSShowMusicRec()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("MusicRecTest"));

  return v1;
}

uint64_t SSDisplayLateServerSuggestions()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("DisplayLateServerSuggestions"));

  return v1;
}

uint64_t SSIgnoreMaxCountForSingleSuggestionsType()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLeanForKey:", CFSTR("IgnoreMaxCountForSingleSuggestionsType"));

  return v1;
}

uint64_t SSMaxLocalSuggestionCount()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("MaxSuggestionCount"));

  return v1;
}

uint64_t SSMaxServerSuggestionCount()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("MaxServerSuggestionCount"));

  return v1;
}

uint64_t SSMaxTotalSuggestions()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("MaxTotalSuggestions"));

  return v1;
}

uint64_t SSMaxSectionsBelowSuggestions()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("MaxSectionsBelowSuggestions"));

  return v1;
}

uint64_t SSLocalDisplayPosition()
{
  void *v0;
  uint64_t v1;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "longForKey:", CFSTR("LocalDisplayPosition"));

  return v1;
}

float SSMinTopHitScore()
{
  void *v0;
  double v1;
  float v2;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("MinTopHitScore"));
  v2 = v1;

  return v2;
}

float SSMinSpellCorrectedAppTopHitScore()
{
  void *v0;
  double v1;
  float v2;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("MinSpellCorrectedAppTopHitScore"));
  v2 = v1;

  return v2;
}

double SSLocalSuggestionThreshold()
{
  void *v0;
  double v1;
  double v2;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("LocalSuggestionThreshold"));
  v2 = v1;

  return v2;
}

double SSServerSuggestionThreshold()
{
  void *v0;
  double v1;
  double v2;

  SSDefaultsGetResources();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "doubleForKey:", CFSTR("ServerSuggestionThreshold"));
  v2 = v1;

  return v2;
}

BOOL SSEnableSpotlightTopHitPersonalizedRanking()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  if (SSEnableSpotlightTopHitPersonalizedRanking_onceToken != -1)
    dispatch_once(&SSEnableSpotlightTopHitPersonalizedRanking_onceToken, &__block_literal_global_27);
  if (!SSEnableSpotlightTopHitPersonalizedRanking_expirationDate
    || (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        v1 = objc_msgSend(v0, "compare:", SSEnableSpotlightTopHitPersonalizedRanking_expirationDate),
        v0,
        v1 == 1))
  {
    SSDefaultsGetResources();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      v4 = objc_msgSend(v2, "BOOLeanForKey:", CFSTR("EnableSpotlightTopHitPersonalizedRanking"));
    else
      v4 = 1;
    SSEnableSpotlightTopHitPersonalizedRanking_runtimeEnabled = v4;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)SSEnableSpotlightTopHitPersonalizedRanking_expirationDate;
    SSEnableSpotlightTopHitPersonalizedRanking_expirationDate = v5;

  }
  if (SSEnableSpotlightTopHitPersonalizedRanking_featureEnabled)
    v7 = SSEnableSpotlightTopHitPersonalizedRanking_runtimeEnabled == 0;
  else
    v7 = 1;
  return !v7;
}

uint64_t SSEnableSpotlightPersonalizedRanking2024()
{
  if (testingDefaults
    && objc_msgSend((id)testingDefaults, "BOOLForKey:", CFSTR("PersonalizedRanking2024Override")))
  {
    return objc_msgSend((id)testingDefaults, "BOOLForKey:", CFSTR("PersonalizedRanking2024Enabled"));
  }
  if (SSEnableSpotlightPersonalizedRanking2024_onceToken != -1)
    dispatch_once(&SSEnableSpotlightPersonalizedRanking2024_onceToken, &__block_literal_global_76);
  return SSEnableSpotlightPersonalizedRanking2024_enabled;
}

uint64_t SSEnableSpotlightIntentModeling()
{
  if (testingDefaults
    && objc_msgSend((id)testingDefaults, "BOOLForKey:", CFSTR("SpotlightIntentModelingOverride")))
  {
    return objc_msgSend((id)testingDefaults, "BOOLForKey:", CFSTR("SpotlightIntentModelingEnabled"));
  }
  if (SSEnableSpotlightIntentModeling_onceToken != -1)
    dispatch_once(&SSEnableSpotlightIntentModeling_onceToken, &__block_literal_global_82);
  return SSEnableSpotlightIntentModeling_enabled;
}

BOOL SSEnableSpotlightFullPageRanking()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  if (SSEnableSpotlightFullPageRanking_onceToken != -1)
    dispatch_once(&SSEnableSpotlightFullPageRanking_onceToken, &__block_literal_global_84);
  if (!SSEnableSpotlightFullPageRanking_expirationDate
    || (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        v1 = objc_msgSend(v0, "compare:", SSEnableSpotlightFullPageRanking_expirationDate),
        v0,
        v1 == 1))
  {
    SSDefaultsGetResources();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      v4 = objc_msgSend(v2, "BOOLeanForKey:", CFSTR("SpotlightFullPageRankingDisabled")) ^ 1;
    else
      v4 = 1;
    SSEnableSpotlightFullPageRanking_runtimeEnabled = v4;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)SSEnableSpotlightFullPageRanking_expirationDate;
    SSEnableSpotlightFullPageRanking_expirationDate = v5;

  }
  if (SSEnableSpotlightFullPageRanking_featureEnabled)
    v7 = SSEnableSpotlightFullPageRanking_runtimeEnabled == 0;
  else
    v7 = 1;
  return !v7;
}

BOOL SSEnableAppSearchV2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  if (SSEnableAppSearchV2_onceToken != -1)
    dispatch_once(&SSEnableAppSearchV2_onceToken, &__block_literal_global_88_0);
  if (!SSEnableAppSearchV2_expirationDate
    || (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        v1 = objc_msgSend(v0, "compare:", SSEnableAppSearchV2_expirationDate),
        v0,
        v1 == 1))
  {
    SSDefaultsGetResources();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      v4 = objc_msgSend(v2, "BOOLeanForKey:", CFSTR("AppSearchV2"));
    else
      v4 = 1;
    SSEnableAppSearchV2_runtimeEnabled = v4;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)SSEnableAppSearchV2_expirationDate;
    SSEnableAppSearchV2_expirationDate = v5;

  }
  if (SSEnableAppSearchV2_featureEnabled)
    v7 = SSEnableAppSearchV2_runtimeEnabled == 0;
  else
    v7 = 1;
  return !v7;
}

uint64_t SSEnableSpotlightPersonalizedRankingFeedbackLogging()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;

  if (!SSEnableSpotlightPersonalizedRankingFeedbackLogging_expirationDate
    || (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        v1 = objc_msgSend(v0, "compare:", SSEnableSpotlightPersonalizedRankingFeedbackLogging_expirationDate),
        v0,
        v1 == 1))
  {
    SSDefaultsGetResources();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      v4 = objc_msgSend(v2, "BOOLeanForKey:", CFSTR("EnableSpotlightPersonalizedRankingFeedbackLogging"));
    else
      v4 = 1;
    SSEnableSpotlightPersonalizedRankingFeedbackLogging_enabled = v4;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)SSEnableSpotlightPersonalizedRankingFeedbackLogging_expirationDate;
    SSEnableSpotlightPersonalizedRankingFeedbackLogging_expirationDate = v5;

  }
  return SSEnableSpotlightPersonalizedRankingFeedbackLogging_enabled;
}

float SSMinFileTopHitScore()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  int v5;

  +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, CFSTR("com.apple.DocumentsApp"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "doubleValue");
    v4 = v3;

  }
  else
  {
    v4 = 2.22507386e-308;
  }
  if (SSMinFileTopHitScore_onceToken != -1)
    dispatch_once(&SSMinFileTopHitScore_onceToken, &__block_literal_global_95);
  if (v4 == 2.22507386e-308)
  {
    v5 = SSMinFileTopHitScore_sMinFileTopHitScore;
  }
  else
  {
    *(float *)&v5 = v4;
    SSMinFileTopHitScore_sMinFileTopHitScore = v5;
  }

  return *(float *)&v5;
}

float SSMinRemindersTopHitScore()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  int v5;

  +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, CFSTR("com.apple.reminders"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "doubleValue");
    v4 = v3;

  }
  else
  {
    v4 = -1.79769313e308;
  }
  if (SSMinRemindersTopHitScore_onceToken != -1)
    dispatch_once(&SSMinRemindersTopHitScore_onceToken, &__block_literal_global_98);
  if (v4 == -1.79769313e308)
  {
    v5 = SSMinRemindersTopHitScore_sMinRemindersTopHitScore;
  }
  else
  {
    *(float *)&v5 = v4;
    SSMinRemindersTopHitScore_sMinRemindersTopHitScore = v5;
  }

  return *(float *)&v5;
}

float SSMinNotesTopHitScore()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  int v5;

  +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, CFSTR("com.apple.mobilenotes"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "doubleValue");
    v4 = v3;

  }
  else
  {
    v4 = -1.79769313e308;
  }
  if (SSMinNotesTopHitScore_onceToken != -1)
    dispatch_once(&SSMinNotesTopHitScore_onceToken, &__block_literal_global_101);
  if (v4 == -1.79769313e308)
  {
    v5 = SSMinNotesTopHitScore_sMinNotesTopHitScore;
  }
  else
  {
    *(float *)&v5 = v4;
    SSMinNotesTopHitScore_sMinNotesTopHitScore = v5;
  }

  return *(float *)&v5;
}

float SSMinContactsTopHitScore()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  int v5;

  +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, CFSTR("com.apple.MobileAddressBook"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "doubleValue");
    v4 = v3;

  }
  else
  {
    v4 = -1.79769313e308;
  }
  if (SSMinContactsTopHitScore_onceToken != -1)
    dispatch_once(&SSMinContactsTopHitScore_onceToken, &__block_literal_global_104);
  if (v4 == -1.79769313e308)
  {
    v5 = SSMinContactsTopHitScore_sMinContactsTopHitScore;
  }
  else
  {
    *(float *)&v5 = v4;
    SSMinContactsTopHitScore_sMinContactsTopHitScore = v5;
  }

  return *(float *)&v5;
}

float SSMinSMSTopHitScore()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  int v5;

  +[SSRankingManager getTopHitsThresholdsForBundleId:]((uint64_t)SSRankingManager, CFSTR("com.apple.MobileSMS"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "doubleValue");
    v4 = v3;

  }
  else
  {
    v4 = -1.79769313e308;
  }
  if (SSMinSMSTopHitScore_onceToken != -1)
    dispatch_once(&SSMinSMSTopHitScore_onceToken, &__block_literal_global_107_0);
  if (v4 == -1.79769313e308)
  {
    v5 = SSMinSMSTopHitScore_sMinSMSTopHitScore;
  }
  else
  {
    *(float *)&v5 = v4;
    SSMinSMSTopHitScore_sMinSMSTopHitScore = v5;
  }

  return *(float *)&v5;
}

BOOL SSDemoteNonExactMatchBundle()
{
  void *v0;
  void *v1;
  void *v2;
  float v3;
  float v4;
  float v5;
  _BOOL8 v6;

  +[SSRankingManager getDemoteNonExactMatchBundle]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "floatValue");
    v4 = v3;

  }
  else
  {
    v4 = 1.0;
  }
  v5 = *(float *)&SSDemoteNonExactMatchBundle_sDemoteNonExactMatchBundle;
  if (v4 != *(float *)&SSDemoteNonExactMatchBundle_sDemoteNonExactMatchBundle)
  {
    SSDemoteNonExactMatchBundle_sDemoteNonExactMatchBundle = LODWORD(v4);
    v5 = v4;
  }
  v6 = v5 == 1.0;

  return v6;
}

void SSInitNSUserDefaultsForTesting()
{
  if (SSInitNSUserDefaultsForTesting_onceToken != -1)
    dispatch_once(&SSInitNSUserDefaultsForTesting_onceToken, &__block_literal_global_110_0);
}

char *PRSModelManagerAssociatedObjectKeyForType(uint64_t a1)
{
  return off_1E6E44D88[a1];
}

void sub_1B873218C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B87322E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B87333F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

float sMaxPicker_block_invoke(float result, float a2)
{
  if (result < a2)
    return a2;
  return result;
}

float sMinPicker_block_invoke_2(float result, float a2)
{
  if (result >= a2)
    return a2;
  return result;
}

id lowercase_keys(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v8, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

id PRSDirectivesManagerDescriptorsForModelInputScore()
{
  _QWORD v1[48];

  v1[47] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("kMDItemUserIsSender");
  v1[1] = CFSTR("kMDItemContentCreationRecent");
  v1[2] = CFSTR("kMDItemEscapedWord");
  v1[3] = CFSTR("kMDItemCreationDateThisYear");
  v1[4] = CFSTR("kMDItemLastUsedDateThisYear");
  v1[5] = CFSTR("kMDItemContentCreationThisMonth");
  v1[6] = CFSTR("kMDItemLastUsedDateThisMonth");
  v1[7] = CFSTR("kMDItemContentCreationThisWeek");
  v1[8] = CFSTR("kMDItemLastUsedDateThisWeek");
  v1[9] = CFSTR("kMDItemEventTodayToNextYear");
  v1[10] = CFSTR("kMDItemEventLastMonthToToday");
  v1[11] = CFSTR("kMDItemEventTodayToNextMonth");
  v1[12] = CFSTR("kMDItemEventTodayToNextWeek");
  v1[13] = CFSTR("kMDItemEventTodayToLastWeek");
  v1[14] = CFSTR("kMDItemEventYesterdayToToday");
  v1[15] = CFSTR("kMDItemEventToday");
  v1[16] = CFSTR("kMDItemTextContentTokenizedMatch");
  v1[17] = CFSTR("kMDItemAuthorsOrRecipientsTokenizedPrefixMatch");
  v1[18] = CFSTR("kMDItemDescriptionTokenizedPrefixMatch");
  v1[19] = CFSTR("kMDItemAlbumTokenizedPrefixMatch");
  v1[20] = CFSTR("kMDItemAuthorsOrRecipientsNonTokenizedPrefixMatch");
  v1[21] = CFSTR("kMDItemDescriptionPrefixWordMatch");
  v1[22] = CFSTR("kMDItemAlbumPrefixWordMatch");
  v1[23] = CFSTR("kMDItemAuthorsOrRecipientsPrefixWordMatch");
  v1[24] = CFSTR("kMDItemDescriptionExactPrefixMatch");
  v1[25] = CFSTR("kMDItemAlbumNonTokenizedPrefixMatch");
  v1[26] = CFSTR("kMDItemAuthorsOrRecipientsExactMatch");
  v1[27] = CFSTR("kMDItemDescriptionNonTokenizedWordMatch");
  v1[28] = CFSTR("kMDItemAlbumNonTokenizedWordMatch");
  v1[29] = CFSTR("kMDItemUserActivity");
  v1[30] = CFSTR("kMDItemAlternateNameNonTokenizedWordMatch");
  v1[31] = CFSTR("kMDItemAlternateNamePrefixWordMatch");
  v1[32] = CFSTR("kMDItemAlternateNameExactMatch");
  v1[33] = CFSTR("kMDItemShortcutRecent");
  v1[34] = CFSTR("kMDItemDueDateInLastOneToNextTwentyFourHours");
  v1[35] = CFSTR("kMDItemDueDateInLastOneToNextOneHour");
  v1[36] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch");
  v1[37] = CFSTR("kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch");
  v1[38] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch");
  v1[39] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch");
  v1[40] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleExactMatch");
  v1[41] = CFSTR("kMDItemSpecialCondition1");
  v1[42] = CFSTR("kMDItemSpecialCondition2");
  v1[43] = CFSTR("kMDItemSpecialCondition3");
  v1[44] = CFSTR("kMDItemSpecialCondition4");
  v1[45] = CFSTR("kMDItemSpecialCondition5");
  v1[46] = CFSTR("kMDItemShortcutWithinBagParamValue");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 47);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t getBinForValue(uint64_t a1, uint64_t a2, unint64_t a3, float a4)
{
  unint64_t v4;
  uint64_t v5;
  float v6;

  if (*(float *)(a1 + 4 * a2) >= a4)
    return a2;
  while (a3 != 1)
  {
    v4 = a3;
    a3 >>= 1;
    v5 = a2 + (v4 >> 1);
    v6 = *(float *)(a1 + 4 * v5);
    if (v6 <= a4)
    {
      a3 = v4 - a3;
      a2 += v4 >> 1;
      if (v6 >= a4)
        return v5;
    }
  }
  return a2 + 1;
}

id whiteSpaceCharacterSet()
{
  if (whiteSpaceCharacterSet_onceToken != -1)
    dispatch_once(&whiteSpaceCharacterSet_onceToken, &__block_literal_global_31);
  return (id)whiteSpaceCharacterSet_sTrimSet;
}

uint64_t __whiteSpaceCharacterSet_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)whiteSpaceCharacterSet_sTrimSet;
  whiteSpaceCharacterSet_sTrimSet = v0;

  return objc_msgSend((id)whiteSpaceCharacterSet_sTrimSet, "addCharactersInRange:", 65532, 0xFFFFLL);
}

id reorderRanges(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __reorderRanges_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "rangeValue");
  if (v6 > objc_msgSend(v5, "rangeValue"))
    goto LABEL_5;
  v7 = objc_msgSend(v4, "rangeValue");
  if (v7 < objc_msgSend(v5, "rangeValue"))
  {
    v8 = -1;
    goto LABEL_6;
  }
  objc_msgSend(v4, "rangeValue");
  v10 = v9;
  objc_msgSend(v5, "rangeValue");
  if (v10 < v11)
  {
LABEL_5:
    v8 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v4, "rangeValue");
  v14 = v13;
  objc_msgSend(v5, "rangeValue");
  if (v14 <= v15)
    v8 = 0;
  else
    v8 = -1;
LABEL_6:

  return v8;
}

void mergeRanges(void *a1)
{
  void *v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a1;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v2 = 1;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v2 - 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "rangeValue");

      objc_msgSend(v7, "objectAtIndexedSubscript:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "rangeValue");

      if (v4 == v6)
        objc_msgSend(v1, "addIndex:", v2);
      ++v2;
    }
    while (v2 < objc_msgSend(v7, "count"));
  }
  if (objc_msgSend(v1, "count"))
    objc_msgSend(v7, "removeObjectsAtIndexes:", v1);

}

id getMatchedRanges(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a1;
  v4 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  if (objc_msgSend(v3, "length"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getMatchedRanges_block_invoke;
    v15[3] = &unk_1E6E45008;
    v15[4] = &v16;
    objc_msgSend(v4, "evaluateAttribute:ignoreSubtokens:skipTranscriptions:withHandler:", v3, 1, 1, v15);
    if (!objc_msgSend((id)v17[5], "count"))
    {
      objc_msgSend(v4, "queryString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "localizedStandardRangeOfString:", v5);
      v8 = v7;

      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = (void *)v17[5];
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v6, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

      }
    }
    reorderRanges((void *)v17[5]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v17[5];
    v17[5] = v11;

    mergeRanges((void *)v17[5]);
  }
  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void sub_1B8739C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __getMatchedRanges_block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

id getFormattedTexts(void *a1, void *a2)
{
  return getFormattedTextsWithHeadTruncation(a1, a2, 1);
}

id getFormattedTextsWithHeadTruncation(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v38;
  id obj;
  int v40;
  uint64_t v41;
  id v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a1;
  v42 = (id)objc_opt_new();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[\t\n]"), CFSTR(" "), 1024, 0, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v8)
  {
    v40 = 0;
    v9 = 0;
    v41 = *(_QWORD *)v51;
    v38 = a3 ^ 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(obj);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "rangeValue");
        v13 = v12;
        v14 = objc_msgSend(v7, "length");
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = v11 - v9;
          v16 = v11 == v9 || v15 > v14;
          if (!v16 && v11 <= v14)
          {
            if (((v38 | v40) & 1) == 0 && v15 >= 0xB)
            {
              if ((unint64_t)objc_msgSend(v7, "length") < 0x15)
              {
                v40 = 0;
              }
              else
              {
                v44 = 0;
                v45 = &v44;
                v46 = 0x3010000000;
                v47 = "";
                v48 = 0;
                v49 = 0;
                v43[0] = MEMORY[0x1E0C809B0];
                v43[1] = 3221225472;
                v43[2] = __getFormattedTextsWithHeadTruncation_block_invoke;
                v43[3] = &unk_1E6E43FC0;
                v43[4] = &v44;
                objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", v9, v11 - v9, 1283, v43);
                v9 = v45[4];
                v15 = v45[5];
                objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", CFSTR("…"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "addObject:", v18);

                _Block_object_dispose(&v44, 8);
                v40 = 1;
              }
            }
            v19 = (void *)MEMORY[0x1E0D8C3D0];
            objc_msgSend(v7, "substringWithRange:", v9, v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "textWithString:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v42, "addObject:", v21);
          }
        }
        v22 = objc_msgSend(v7, "length");
        v9 = v11 + v13;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0 && v13 <= v22 && v9 <= v22)
        {
          v26 = (void *)MEMORY[0x1E0D8C3D0];
          objc_msgSend(v7, "substringWithRange:", v11, v13);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "textWithString:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "setIsEmphasized:", 1);
          objc_msgSend(v42, "addObject:", v30);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v31 = objc_msgSend(v7, "length");
  if (v9)
  {
    v32 = v31;
    v33 = objc_msgSend(v7, "length");
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v32 != v9 && v32 - v9 <= v33 && v32 <= v33)
    {
      v34 = (void *)MEMORY[0x1E0D8C3D0];
      objc_msgSend(v7, "substringWithRange:", v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "textWithString:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "addObject:", v36);
    }
  }

  return v42;
}

void sub_1B873A0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void removeMatchedRangesFromStringInTitle(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v30 = v10;
    if (removeMatchedRangesFromStringInTitle_onceToken[0] != -1)
      dispatch_once(removeMatchedRangesFromStringInTitle_onceToken, &__block_literal_global_7);
    v31 = v7;
    v32 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "rangeValue");
          v18 = v17;
          v19 = objc_msgSend(v8, "length");
          if (v16 != 0x7FFFFFFFFFFFFFFFLL && v18 != 0 && v18 <= v19 && v16 + v18 <= v19)
          {
            v23 = objc_msgSend(v15, "rangeValue");
            objc_msgSend(v8, "substringWithRange:", v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "rangeOfCharacterFromSet:", removeMatchedRangesFromStringInTitle_symbolsAndPunctuations) != 0x7FFFFFFFFFFFFFFFLL)
            {

              v29 = v32;
              goto LABEL_27;
            }
            whiteSpaceCharacterSet();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringByTrimmingCharactersInSet:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v9, "localizedCaseInsensitiveContainsString:", v27);

            if (v28)
              objc_msgSend(v32, "addObject:", v15);

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v12)
          continue;
        break;
      }
    }

    v29 = v32;
    objc_msgSend(obj, "removeObjectsInArray:", v32);
LABEL_27:

    v10 = v30;
    v7 = v31;
  }

}

void __removeMatchedRangesFromStringInTitle_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)removeMatchedRangesFromStringInTitle_symbolsAndPunctuations;
  removeMatchedRangesFromStringInTitle_symbolsAndPunctuations = v1;

  v3 = (void *)removeMatchedRangesFromStringInTitle_symbolsAndPunctuations;
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v4);

}

id formattedTextsForStringWithMatchesFromEvaluator(void *a1, void *a2, void *a3)
{
  return formattedTextsForStringWithMatchesFromEvaluatorWithHeadTruncaction(a1, a2, a3, 1);
}

id formattedTextsForStringWithMatchesFromEvaluatorWithHeadTruncaction(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = a1;
  v10 = objc_msgSend(v8, "containsString:", v9);
  objc_msgSend(v9, "precomposedStringWithCanonicalMapping");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v10 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    getMatchedRanges(v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  removeMatchedRangesFromStringInTitle(v12, v11, v8, v7);
  getFormattedTextsWithHeadTruncation(v11, v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id getHighlightedRichText(void *a1, void *a2, void *a3, int a4)
{
  void *v4;
  void *v5;

  formattedTextsForStringWithMatchesFromEvaluatorWithHeadTruncaction(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setFormattedTextPieces:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __getFormattedTextsWithHeadTruncation_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) += a6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = a5;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) >= 0xAuLL)
    *a7 = 1;
  return result;
}

double getSpecialThreshold(void *a1, unint64_t a2, unint64_t a3, int a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;

  v9 = a1;
  +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v9, a2, a3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") <= (unint64_t)a4)
  {
    +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v9, a2, a3, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") > (unint64_t)a4)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      a5 = v14;

    }
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    a5 = v12;
  }

  return a5;
}

void sub_1B8747568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

uint64_t __57__rankingSceneClassification_updateBoundingBoxOfDetector__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(unsigned int *)(a3 + 8));
  objc_msgSend(*(id *)(a1 + 32), "sceneReferenceDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneReferenceDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 || (objc_msgSend(v7, "boundingBoxRatio"), v8 == 0.0))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "boundingBox");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setBoundingBox:", v9);

      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __72__rankingSceneClassification_matchScoreWhenLabelMatched_userQueryToken___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double matched;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  id v24;

  v24 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "tokenMatchForMatchInfoToken:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "exactSceneMatch");
    if ((v4 & 1) != 0 || !objc_msgSend(v3, "exactMatchAtFirstPosition"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setExactSceneMatch:", v4);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "original");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");
      objc_msgSend(v24, "original");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == objc_msgSend(v7, "length"))
      {
        objc_msgSend(v24, "original");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");
        objc_msgSend(*(id *)(a1 + 40), "original");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setExactSceneMatch:", v9 == objc_msgSend(v10, "length"));

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "setExactSceneMatch:", 0);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "boundingBoxRatio");
    if (v11 == 0.0)
      objc_msgSend(*(id *)(a1 + 32), "updateBoundingBoxOfDetector");
    matched = tokenMatchRatio(v24, *(void **)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(a1 + 32), "matchedBoundingBoxScore");
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "boundingBoxRatio");
    v16 = matched * v15;
    if (v14 >= v16)
      v16 = v14;
    objc_msgSend(*(id *)(a1 + 32), "setMatchedBoundingBoxScore:", v16);
    objc_msgSend(*(id *)(a1 + 32), "matchedConfidenceScore");
    v18 = v17;
    objc_msgSend(*(id *)(a1 + 32), "confidence");
    v20 = matched * v19;
    if (v18 >= v20)
      v20 = v18;
    objc_msgSend(*(id *)(a1 + 32), "setMatchedConfidenceScore:", v20);
    v21 = *(void **)(a1 + 32);
    v22 = 1.0 / (double)(unint64_t)objc_msgSend(v21, "totalLabels");
    objc_msgSend(v21, "matchedSceneLabelRatio");
    objc_msgSend(v21, "setMatchedSceneLabelRatio:", v23 + matched * v22);
  }

}

double tokenMatchRatio(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = a2;
  objc_msgSend(a1, "tokenize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = (double)(unint64_t)objc_msgSend(v4, "count");
    v7 = v6 / (double)(unint64_t)objc_msgSend(v5, "count");
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

void __75__rankingSceneClassification_matchScoreWhenSynonymsMatched_userQueryToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__6;
  v10[4] = __Block_byref_object_dispose__6;
  v11 = 0;
  v11 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__rankingSceneClassification_matchScoreWhenSynonymsMatched_userQueryToken___block_invoke_2;
  v6[3] = &unk_1E6E453D8;
  v6[4] = v3;
  v9 = v10;
  v5 = v11;
  v7 = v5;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  _Block_object_dispose(v10, 8);
}

void sub_1B8747BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __75__rankingSceneClassification_matchScoreWhenSynonymsMatched_userQueryToken___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double matched;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  id v30;

  v30 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  v4 = v3 > objc_msgSend(v30, "unsignedLongValue");
  v5 = v30;
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndexedSubscript:", objc_msgSend(v30, "unsignedLongValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tokenMatchForMatchInfoToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "type"))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "exactSceneMatch");
      if ((v8 & 1) != 0 || !objc_msgSend(v7, "exactMatchAtFirstPosition"))
      {
        objc_msgSend(*(id *)(a1 + 32), "setExactSceneMatch:", v8);
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "tokens");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");
        objc_msgSend(*(id *)(a1 + 40), "tokens");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == objc_msgSend(v11, "count"))
        {
          objc_msgSend(*(id *)(a1 + 40), "tokens");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");
          objc_msgSend(*(id *)(a1 + 48), "tokens");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setExactSceneMatch:", v13 == objc_msgSend(v14, "count"));

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "setExactSceneMatch:", 0);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "boundingBoxRatio");
      if (v15 == 0.0)
        objc_msgSend(*(id *)(a1 + 32), "updateBoundingBoxOfDetector");
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndexedSubscript:", objc_msgSend(v30, "unsignedLongValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      matched = tokenMatchRatio(v16, v17);

      objc_msgSend(*(id *)(a1 + 32), "matchedBoundingBoxScore");
      v20 = v19;
      objc_msgSend(*(id *)(a1 + 32), "boundingBoxRatio");
      v22 = matched * v21;
      if (v20 >= v22)
        v22 = v20;
      objc_msgSend(*(id *)(a1 + 32), "setMatchedBoundingBoxScore:", v22);
      objc_msgSend(*(id *)(a1 + 32), "matchedConfidenceScore");
      v24 = v23;
      objc_msgSend(*(id *)(a1 + 32), "confidence");
      v26 = matched * v25;
      if (v24 >= v26)
        v26 = v24;
      objc_msgSend(*(id *)(a1 + 32), "setMatchedConfidenceScore:", v26);
      v27 = *(void **)(a1 + 32);
      v28 = 1.0 / (double)(unint64_t)objc_msgSend(v27, "totalSynonyms");
      objc_msgSend(v27, "matchedSceneSynonymsRatio");
      objc_msgSend(v27, "setMatchedSceneSynonymsRatio:", v29 + matched * v28);
    }

    v5 = v30;
  }

}

void SSRearrangeDuplicatesInSection(void *a1)
{
  id v1;
  void *v2;
  int IsSyndicatedPhotos;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v2);

  if (IsSyndicatedPhotos)
  {
    objc_msgSend(v1, "resultSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "count");
    if (v6 > objc_msgSend(v1, "maxInitiallyVisibleResults"))
    {
      objc_msgSend(v1, "resultSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      if (objc_msgSend(v7, "count"))
      {
        v11 = 0;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "rankingItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v13, "attributes"), 3uLL);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            if (objc_msgSend(v8, "containsObject:", v14))
            {
              objc_msgSend(v9, "addIndex:", v11);
              SSPommesRankerLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v13, "identifier");
                v20 = v10;
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v23 = v16;
                v24 = 2112;
                v25 = v14;
                _os_log_debug_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_DEBUG, "[Pommes-L2] found near duplicate photo: %@, container: %@", buf, 0x16u);

                v10 = v20;
              }

            }
            else
            {
              objc_msgSend(v8, "addObject:", v14);
            }
          }

          ++v11;
        }
        while (v11 < objc_msgSend(v7, "count"));
      }

      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v1, "resultSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectsAtIndexes:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v1, "resultSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObjectsAtIndexes:", v9);

      }
    }

  }
}

void sub_1B8749B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Unwind_Resume(a1);
}

void sub_1B8749D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B874A01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMatchInfoDictionary_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(v12, "containsString:", CFSTR("kMD")))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v7 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*"), &stru_1E6E549F0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

    }
    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getMatchInfoDictionary_block_invoke_2;
    v13[3] = &unk_1E6E45598;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v14 = v9;
    v15 = v10;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

LABEL_7:
  }

}

void __getMatchInfoDictionary_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*"), &stru_1E6E549F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v5);
}

void __getMatchInfoDictionary_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a2;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  v19 = (id)objc_opt_new();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_422);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __getMatchInfoDictionary_block_invoke_5;
  v11 = &unk_1E6E45650;
  v13 = &v14;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v8);
  if (objc_msgSend((id)v15[5], "count", v8, v9, v10, v11))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15[5], v5);

  _Block_object_dispose(&v14, 8);
}

void sub_1B874BE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getMatchInfoDictionary_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "length");
  v6 = objc_msgSend(v4, "length");

  if (v5 < v6)
    return 1;
  else
    return -1;
}

void __getMatchInfoDictionary_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  SSTokenizedString *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*"), &stru_1E6E549F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __getMatchInfoDictionary_block_invoke_6;
  v11 = &unk_1E6E45628;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v8);
  if (*((_BYTE *)v15 + 24) && objc_msgSend(v6, "length", v8, v9, v10, v11))
  {
    v7 = -[SSTokenizedString initWithString:locale:]([SSTokenizedString alloc], "initWithString:locale:", v6, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

  }
  _Block_object_dispose(&v14, 8);

}

void sub_1B874C00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMatchInfoDictionary_block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "original");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __computeSceneClassificationSignals_block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  int v4;
  void *v5;
  double *v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  char v14;
  uint64_t v15;
  double v16;
  id v17;

  v17 = a3;
  v4 = objc_msgSend(v17, "sceneMatchedType");
  v5 = v17;
  if (v4)
  {
    objc_msgSend(v17, "matchScoreFromMatchInfo:userQueryToken:", a1[4], a1[5]);
    objc_msgSend(v17, "matchedBoundingBoxScore");
    v6 = *(double **)(*(_QWORD *)(a1[6] + 8) + 24);
    *v6 = v7 + *v6;
    objc_msgSend(v17, "matchedConfidenceScore");
    v8 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    *(double *)(v8 + 8) = v9 + *(double *)(v8 + 8);
    objc_msgSend(v17, "matchedSceneLabelRatio");
    v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    *(double *)(v10 + 16) = v11 + *(double *)(v10 + 16);
    objc_msgSend(v17, "matchedSceneSynonymsRatio");
    v12 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    *(double *)(v12 + 24) = v13 + *(double *)(v12 + 24);
    v14 = objc_msgSend(v17, "exactSceneMatch");
    v15 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v16 = 1.0;
    if ((v14 & 1) == 0)
      v16 = *(double *)(v15 + 32);
    *(double *)(v15 + 32) = v16;
    v5 = v17;
  }

}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

uint64_t json_utf8_string(uint64_t result, _BYTE *a2, unint64_t a3)
{
  char *v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  char v13;
  unsigned __int8 *v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned __int8 *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t i;
  uint64_t v40;
  _BYTE *v41;
  unint64_t v42;
  char v43;

  if (result)
  {
    v3 = *(char **)(result + 8);
    if (*(_DWORD *)result == 5)
    {
      v4 = *(_QWORD *)(result + 16);
      v5 = (unint64_t)&a2[a3];
      v6 = a2;
      if (v4 >= 1)
      {
        v7 = (unint64_t)&v3[v4];
        v8 = a2;
        do
        {
          v9 = *v3;
          if ((json_char_table[v9] & 0x40) != 0)
          {
            v14 = (unsigned __int8 *)(v3 + 2);
            v15 = v3[1];
            v16 = json_char_table[v15];
            if ((v16 & 0x10000) != 0)
            {
              if ((v16 & 0x40) != 0)
              {
                do
                {
                  if ((unint64_t)v14 >= v7)
                    break;
                  v19 = *v14++;
                }
                while ((json_char_table[v19] & 0x40) != 0);
              }
              if ((unint64_t)v14 <= v7 - 4)
              {
                v20 = 0;
                v21 = 0;
                do
                {
                  v22 = v14[v20];
                  v23 = (char)v22;
                  v24 = json_char_table[v22];
                  v25 = (v23 - 87) | (16 * v21);
                  if ((v24 & 0x10) == 0)
                    v25 = v21;
                  if ((v24 & 8) != 0)
                    v25 = (v23 - 55) | (16 * v21);
                  v21 = (v23 - 48) | (16 * v21);
                  if ((v24 & 2) == 0)
                    v21 = v25;
                  ++v20;
                }
                while ((_DWORD)v20 != 4);
                v26 = (unsigned __int16)v21;
                if ((uint64_t)(v7 - (_QWORD)v14) < 5)
                {
                  v11 = v14;
                }
                else
                {
                  v11 = v14 + 4;
                  if ((unint64_t)(v14 + 5) < v7
                    && (unsigned __int16)((unsigned __int16)v21 >> 11) >= 0x1Bu
                    && (unsigned __int16)((unsigned __int16)v21 >> 10) <= 0x36u
                    && (json_char_table[*v11] & 0x40) != 0
                    && (uint64_t)(v7 - (_QWORD)v11) >= 3
                    && (json_char_table[v14[5]] & 0x10000) != 0)
                  {
                    v27 = 0;
                    v28 = 0;
                    v11 = v14 + 6;
                    do
                    {
                      v29 = v11[v27];
                      v30 = (char)v29;
                      v31 = json_char_table[v29];
                      v32 = (v30 - 87) | (16 * v28);
                      if ((v31 & 0x10) == 0)
                        v32 = v28;
                      if ((v31 & 8) != 0)
                        v32 = (v30 - 55) | (16 * v28);
                      v28 = (v30 - 48) | (16 * v28);
                      if ((v31 & 2) == 0)
                        v28 = v32;
                      ++v27;
                    }
                    while ((_DWORD)v27 != 4);
                    v33 = (unsigned __int16)v28 >> 10;
                    v34 = ((unsigned __int16)v28 + 9216) | ((v26 << 10) - 56623104);
                    v35 = v14 + 12;
                    if ((uint64_t)(v7 - (_QWORD)v11) <= 6)
                      v35 = v11;
                    if (v33 == 55)
                    {
                      v11 = v35;
                      v26 = v34;
                    }
                  }
                }
                if ((int)v26 >= 128)
                {
                  if (v26 >= 0x800)
                  {
                    v37 = 4 * (v26 < 0x110000);
                    if (v26 < 0x10000)
                      v37 = 3;
                    v6 = &v8[v37];
                    if ((unint64_t)&v8[v37] < v5)
                    {
                      if (!HIWORD(v26))
                      {
                        v8[2] = v26 & 0x3F | 0x80;
                        v8[1] = (v26 >> 6) & 0x3F | 0x80;
                        v26 = (v26 >> 12) | 0xFFFFFFE0;
                        v36 = 3;
                        goto LABEL_75;
                      }
                      if (HIWORD(v26) > 0x10u)
                      {
                        v36 = 0;
                      }
                      else
                      {
                        v8[3] = v26 & 0x3F | 0x80;
                        v8[2] = (v26 >> 6) & 0x3F | 0x80;
                        v8[1] = (v26 >> 12) & 0x3F | 0x80;
                        v26 = (v26 >> 18) | 0xFFFFFFF0;
                        v36 = 4;
LABEL_75:
                        *v8 = v26;
                      }
                      v6 = &v8[v36];
                      goto LABEL_77;
                    }
                  }
                  else
                  {
                    v6 = v8 + 2;
                    if ((unint64_t)(v8 + 2) < v5)
                    {
                      v8[1] = v26 & 0x3F | 0x80;
                      v26 = (v26 >> 6) | 0xFFFFFFC0;
                      v36 = 2;
                      goto LABEL_75;
                    }
                  }
                }
                else
                {
                  v6 = v8 + 1;
                  if ((unint64_t)(v8 + 1) < v5)
                  {
                    v36 = 1;
                    goto LABEL_75;
                  }
                }
                if (v8 + 1 == (_BYTE *)v5)
                {
LABEL_72:
                  *v8 = 0;
                  goto LABEL_77;
                }
              }
              else
              {
                v11 = v14;
              }
              v6 = v8;
            }
            else
            {
              if ((v16 & 0x1E0) != 0)
              {
                HIDWORD(v18) = v15;
                LODWORD(v18) = v15 - 98;
                v17 = v18 >> 1;
                if (v17 <= 9 && ((0x345u >> v17) & 1) != 0)
                  LOBYTE(v15) = byte_1B87DF4C8[v17];
              }
              v6 = v8 + 1;
              if ((unint64_t)(v8 + 1) >= v5)
              {
                if (v8 + 1 == (_BYTE *)v5)
                {
                  *v8 = 0;
                  v11 = v14;
                  v6 = (_BYTE *)v5;
                  goto LABEL_77;
                }
              }
              else
              {
                *v8 = v15;
              }
              v11 = v14;
            }
          }
          else
          {
            v10 = utf8_byte_length_noerror_utf8_len_table[v9 >> 4];
            v6 = &v8[v10];
            v11 = (unsigned __int8 *)&v3[v10];
            if ((unint64_t)&v8[v10] < v5 && (unint64_t)v11 <= v7)
            {
              do
              {
                v13 = *v3++;
                *v8++ = v13;
                --v10;
              }
              while (v10);
              goto LABEL_77;
            }
            if (v8 + 1 == (_BYTE *)v5)
              goto LABEL_72;
          }
LABEL_77:
          v8 = v6;
          v3 = (char *)v11;
        }
        while ((unint64_t)v11 < v7);
      }
      if ((unint64_t)v6 < v5)
        *v6 = 0;
      v40 = v6 - a2;
      return v40 + 1;
    }
    if (v3)
    {
      v38 = *(_QWORD *)(result + 16);
      if (v38)
      {
        if (v38 >= a3)
        {
          if (!a3)
          {
LABEL_99:
            v40 = *(_QWORD *)(result + 16);
            return v40 + 1;
          }
          v38 = a3 - 1;
          if (a3 != 1)
          {
            v41 = a2;
            v42 = a3 - 1;
            do
            {
              v43 = *v3++;
              *v41++ = v43;
              --v42;
            }
            while (v42);
          }
        }
        else
        {
          for (i = 0; i != v38; ++i)
            a2[i] = v3[i];
        }
        a2[v38] = 0;
        goto LABEL_99;
      }
    }
    result = 0;
    if (!a2)
      return result;
  }
  else if (!a2)
  {
    return result;
  }
  if (a3)
  {
    result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t json_parse()
{
  char *v0;
  size_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  char v6;
  char v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  char *v16;
  void (*v17)(uint64_t, uint64_t, uint64_t *, char *);
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  size_t v54;
  char *v55;
  char *v56;
  _DWORD v57[1024];
  uint64_t v58;

  v0 = (char *)MEMORY[0x1E0C80A78]();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = v0;
  v58 = *MEMORY[0x1E0C80C00];
  v53 = v0;
  v54 = 0;
  v55 = 0;
  v56 = v0;
  if ((v1 & 0x8000000000000000) != 0)
  {
    if (!v0)
    {
      v9 = 0;
      v55 = 0;
      v50 = 0;
      v51 = 0;
      v52 = 0;
      v49 = 0;
LABEL_236:
      v11 = v8;
LABEL_237:
      if (v9 == v11)
        goto LABEL_250;
      while (1)
      {
        v47 = v11 >= v9 ? 0 : *v11;
        if ((json_char_table[v47] & 1) == 0)
          break;
        if (v9 - v11 >= 1)
          v53 = ++v11;
      }
      if ((v7 & 1) != 0)
      {
LABEL_250:
        v9 = v11;
      }
      else if (v9 != v11)
      {
        goto LABEL_246;
      }
      if (v5)
        *v5 = v9 - v8;
      return 1;
    }
    v1 = strlen(v0);
  }
  v9 = &v8[v1];
  v54 = v1;
  v55 = &v8[v1];
  v50 = 0;
  v51 = 0;
  v52 = 0;
  v49 = 0;
  if (!v1)
    goto LABEL_236;
  bzero(v57, 0x1000uLL);
  LODWORD(v10) = 0;
  while (1)
  {
    v11 = v53;
    v12 = v55;
    if (v53 >= v55)
      v13 = 0;
    else
      v13 = *v53;
    v14 = json_char_table[v13];
    if ((v14 & 0x20) != 0)
    {
      if (!jscon_scan_string(&v53, (uint64_t)&v50))
        goto LABEL_248;
      if ((int)v10 >= 1023)
      {
        v11 = v53;
        goto LABEL_246;
      }
      goto LABEL_16;
    }
    if ((v14 & 0x202) != 0)
      break;
    if (v13 == 91)
    {
      if (v55 - v53 >= 1)
        v11 = ++v53;
      if ((int)v10 >= 1023)
        goto LABEL_246;
      v10 = (int)v10 + 1;
      v57[v10] = 2;
      (*(void (**)(uint64_t, uint64_t, _QWORD, char *))(v3 + 16))(v3, 4, 0, &v49);
      if (v11 >= v12)
        v41 = 0;
      else
        v41 = *v11;
      if ((json_char_table[v41] & 1) != 0)
      {
        v42 = v53;
        while (1)
        {
          if (v11 >= v12)
          {
            if ((json_char_table[0] & 1) == 0)
            {
              v53 = v42;
              goto LABEL_151;
            }
          }
          else
          {
            v41 = *v11;
            if ((json_char_table[v41] & 1) == 0)
            {
              v53 = v42;
              break;
            }
          }
          if (v12 - v11 >= 1)
            v42 = ++v11;
        }
      }
      if (v41 != 93)
        goto LABEL_151;
      if (v12 - v11 >= 1)
        v53 = v11 + 1;
      v57[v10] = 1;
      v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
      v19 = v3;
      v20 = 5;
      goto LABEL_189;
    }
    if (v13 != 123)
    {
      if ((v14 & 0xE000) == 0)
      {
        if ((v14 & 1) == 0)
          goto LABEL_246;
        v44 = v53;
        while (1)
        {
          v45 = v11 >= v55 ? 0 : *v11;
          if ((json_char_table[v45] & 1) == 0)
            break;
          if (v55 - v11 >= 1)
            v44 = ++v11;
        }
        v53 = v44;
        goto LABEL_151;
      }
      v51 = v53;
      if (v55 - v53 < 5)
      {
        if (v55 - v53 != 4)
          goto LABEL_246;
LABEL_200:
        if (*(_DWORD *)v53 == 1702195828)
        {
          LODWORD(v50) = 2;
        }
        else
        {
          if (*(_DWORD *)v53 != 1819047278)
            goto LABEL_246;
          LODWORD(v50) = 1;
        }
        v52 = 4;
        v11 = v53 + 4;
      }
      else
      {
        if (*(_DWORD *)v53 != 1936482662 || v53[4] != 101)
          goto LABEL_200;
        LODWORD(v50) = 3;
        v52 = 5;
        v11 = v53 + 5;
      }
      v53 = v11;
      if ((int)v10 >= 1023)
        goto LABEL_246;
LABEL_16:
      v10 = (int)v10 + 1;
      v57[v10] = 1;
      v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
      v18 = &v50;
      v19 = v3;
      v20 = 6;
LABEL_17:
      v17(v19, v20, v18, &v49);
      goto LABEL_78;
    }
    if (v55 - v53 >= 1)
      v11 = ++v53;
    if ((int)v10 >= 1023)
      goto LABEL_246;
    v10 = (int)v10 + 1;
    v57[v10] = 3;
    (*(void (**)(uint64_t, uint64_t, _QWORD, char *))(v3 + 16))(v3, 1, 0, &v49);
    if (v11 >= v12)
      v21 = 0;
    else
      v21 = *v11;
    v22 = json_char_table[v21];
    if ((v22 & 1) == 0)
      goto LABEL_179;
    v23 = v53;
    while (v11 < v12)
    {
      v21 = *v11;
      v22 = json_char_table[v21];
      if ((v22 & 1) == 0)
      {
        v53 = v23;
LABEL_179:
        if ((v22 & 0x20) != 0)
          goto LABEL_218;
        if (v21 != 125)
          goto LABEL_246;
        if (v12 - v11 >= 1)
          v53 = v11 + 1;
        v57[v10] = 1;
        v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
        v19 = v3;
        v20 = 3;
LABEL_189:
        v18 = 0;
        goto LABEL_17;
      }
LABEL_29:
      if (v12 - v11 >= 1)
        v23 = ++v11;
    }
    if ((json_char_table[0] & 1) != 0)
      goto LABEL_29;
    v53 = v23;
    if ((json_char_table[0] & 0x20) == 0)
      goto LABEL_246;
LABEL_218:
    if (!jscon_scan_string(&v53, (uint64_t)&v50))
      goto LABEL_248;
    v11 = v53;
    if (v53 >= v55)
      v46 = 0;
    else
      v46 = *v53;
    if ((json_char_table[v46] & 1) != 0)
    {
      v38 = v53;
      while (1)
      {
        if (v11 >= v55)
        {
          if ((json_char_table[0] & 1) == 0)
          {
LABEL_258:
            v53 = v38;
            goto LABEL_246;
          }
        }
        else
        {
          v46 = *v11;
          if ((json_char_table[v46] & 1) == 0)
          {
            v53 = v38;
            break;
          }
        }
        if (v55 - v11 >= 1)
          v38 = ++v11;
      }
    }
    if (v46 != 58)
      goto LABEL_246;
    if (v55 - v11 >= 1)
      v53 = v11 + 1;
LABEL_150:
    v57[v10] = 4;
    (*(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16))(v3, 2, &v50, &v49);
LABEL_151:
    if (v49)
      return 0;
  }
  v51 = v53;
  LODWORD(v50) = 6;
  if (v53 >= v55)
    v15 = 0;
  else
    v15 = *v53;
  if ((json_char_table[v15] & 0x200) != 0)
  {
    v16 = v53;
    if (v55 - v53 >= 1)
      v16 = ++v53;
    if (v16 >= v55)
      v15 = 0;
    else
      v15 = *v16;
  }
  else
  {
    v16 = v53;
  }
  if ((json_char_table[v15] & 4) != 0)
  {
    if (v55 - v16 >= 1)
      v53 = ++v16;
    if (v16 >= v55)
      v26 = 0;
    else
      v26 = *v16;
    v27 = json_char_table[v26];
    if ((v27 & 0x800) != 0)
    {
      if (v55 - v16 <= 0)
        goto LABEL_61;
      goto LABEL_60;
    }
    if ((v27 & 0x1000) == 0)
    {
      if ((v27 & 2) == 0)
        goto LABEL_74;
      if (v55 - v16 > 0)
        ++v16;
LABEL_256:
      LODWORD(v50) = 0;
      v11 = v16;
      goto LABEL_247;
    }
    if (v55 - v16 <= 0)
      goto LABEL_129;
LABEL_128:
    v53 = ++v16;
    goto LABEL_129;
  }
  LOWORD(v24) = json_char_table[0];
  while (2)
  {
    v25 = v55 - v16;
LABEL_40:
    if (v16 >= v55)
    {
      if ((json_char_table[0] & 2) == 0)
        goto LABEL_55;
LABEL_42:
      if (v25 >= 1)
      {
        v53 = ++v16;
        continue;
      }
      goto LABEL_40;
    }
    break;
  }
  if ((json_char_table[*v16] & 2) != 0)
    goto LABEL_42;
  v24 = json_char_table[*v16];
LABEL_55:
  if ((v24 & 0x1000) != 0)
  {
    if (v25 <= 0)
    {
LABEL_129:
      LODWORD(v50) = 7;
      if (v16 >= v55)
        v39 = 0;
      else
        v39 = *v16;
      if (v55 - v16 >= 1 && (json_char_table[v39] & 0x600) != 0)
LABEL_133:
        v53 = ++v16;
      while (1)
      {
        v40 = v16 >= v55 ? 0 : *v16;
        if ((json_char_table[v40] & 2) == 0)
          goto LABEL_74;
        if (v55 - v16 >= 1)
          goto LABEL_133;
      }
    }
    goto LABEL_128;
  }
  if ((v24 & 0x800) == 0)
    goto LABEL_74;
  if (v25 >= 1)
LABEL_60:
    v53 = ++v16;
LABEL_61:
  LODWORD(v50) = 7;
  if (v16 >= v55)
  {
    v28 = 0;
  }
  else
  {
    v53 = v16 + 1;
    v28 = *v16++;
  }
  if ((json_char_table[v28] & 2) == 0)
    goto LABEL_256;
  LOWORD(v29) = json_char_table[0];
  while (2)
  {
    v30 = v55 - v16;
LABEL_66:
    if (v16 >= v55)
    {
      if ((json_char_table[0] & 2) == 0)
        goto LABEL_73;
LABEL_68:
      if (v30 >= 1)
      {
        v53 = ++v16;
        continue;
      }
      goto LABEL_66;
    }
    break;
  }
  if ((json_char_table[*v16] & 2) != 0)
    goto LABEL_68;
  v29 = json_char_table[*v16];
LABEL_73:
  if ((v29 & 0x1000) != 0)
  {
    if (v30 < 1)
      goto LABEL_129;
    goto LABEL_128;
  }
LABEL_74:
  if (v16 > v55)
  {
    v53 = v55;
    v16 = v55;
  }
  v52 = v16 - v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16))(v3, 6, &v50, &v49);
  if ((int)v10 >= 1023)
    goto LABEL_256;
  v10 = (int)v10 + 1;
  v57[v10] = 1;
LABEL_78:
  v9 = v55;
  v11 = v53;
  while (2)
  {
    if (v11 >= v9)
      v31 = 0;
    else
      v31 = *v11;
    if ((json_char_table[v31] & 1) != 0)
    {
      while (1)
      {
        v32 = v11 >= v9 ? 0 : *v11;
        if ((json_char_table[v32] & 1) == 0)
          break;
        if (v9 - v11 >= 1)
          v53 = ++v11;
      }
      if (v11 < v9)
      {
        v31 = *v11;
        break;
      }
      v31 = 0;
LABEL_91:
      v33 = v57[v10 - 1];
      if (v33 == 2)
      {
        if (v31 != 93)
          goto LABEL_151;
        if (v9 - v11 >= 1)
          v53 = ++v11;
        v34 = 5;
      }
      else
      {
        if (v33 != 4)
        {
          if (v33)
            goto LABEL_151;
          goto LABEL_237;
        }
        if (v31 != 125)
          goto LABEL_151;
        if (v9 - v11 >= 1)
          v53 = ++v11;
        v34 = 3;
      }
      v57[v10 - 1] = 1;
      (*(void (**)(uint64_t, uint64_t, _QWORD, char *))(v3 + 16))(v3, v34, 0, &v49);
      --v10;
      continue;
    }
    break;
  }
  if (v31 != 44)
    goto LABEL_91;
  v10 = (int)v10 - 1;
  v35 = v57[v10];
  if (v35 == 2)
  {
    if (v9 - v11 >= 1)
      v53 = v11 + 1;
    goto LABEL_151;
  }
  if (v35 == 4)
  {
    if (v9 - v11 >= 1)
      v53 = ++v11;
    v57[v10] = 3;
    if (v11 >= v9)
      v36 = 0;
    else
      v36 = *v11;
    if ((json_char_table[v36] & 1) != 0)
    {
      while (1)
      {
        if (v11 >= v9)
        {
          if ((json_char_table[0] & 1) == 0)
          {
            v36 = 0;
            break;
          }
        }
        else
        {
          v36 = *v11;
          if ((json_char_table[v36] & 1) == 0)
            break;
        }
        if (v9 - v11 >= 1)
          v53 = ++v11;
      }
    }
    if ((json_char_table[v36] & 0x20) != 0)
    {
      if (!jscon_scan_string(&v53, (uint64_t)&v50))
        goto LABEL_248;
      v11 = v53;
      if (v53 >= v55)
        v37 = 0;
      else
        v37 = *v53;
      if ((json_char_table[v37] & 1) != 0)
      {
        v38 = v53;
        while (1)
        {
          if (v11 >= v55)
          {
            if ((json_char_table[0] & 1) == 0)
              goto LABEL_258;
          }
          else
          {
            v37 = *v11;
            if ((json_char_table[v37] & 1) == 0)
            {
              v53 = v38;
              break;
            }
          }
          if (v55 - v11 >= 1)
            v38 = ++v11;
        }
      }
      if (v37 == 58)
      {
        if (v55 - v11 >= 1)
          v53 = v11 + 1;
        goto LABEL_150;
      }
    }
  }
LABEL_246:
  LODWORD(v50) = 0;
LABEL_247:
  v51 = v11;
  v52 = 0;
LABEL_248:
  (*(void (**)(uint64_t, _QWORD, uint64_t *, char *))(v3 + 16))(v3, 0, &v50, &v49);
  return 0;
}

uint64_t jscon_scan_string(char **a1, uint64_t a2)
{
  char *v4;
  char *v5;
  void *v6;
  char *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  unsigned __int8 *v12;
  uint64_t i;
  char *v14;
  int v15;

  v4 = a1[2];
  v5 = *a1;
  if (v4 - *a1 >= 1)
    *a1 = ++v5;
  *(_QWORD *)(a2 + 8) = v5;
  *(_DWORD *)a2 = 4;
  v6 = v5;
  while (1)
  {
    v7 = (char *)memchr(v6, 34, v4 - (_BYTE *)v6);
    if (!v7)
    {
      *(_DWORD *)a2 = 0;
      *(_QWORD *)(a2 + 8) = v6;
      v11 = (_QWORD *)(a2 + 16);
      goto LABEL_29;
    }
    v8 = (unsigned __int8 *)v7;
    v6 = v7 + 1;
    *a1 = v7 + 1;
    if (*(v7 - 1) != 92)
      break;
    *(_DWORD *)a2 = 5;
    if (*(v7 - 2) == 92)
    {
      v9 = 0;
      do
        v10 = v7[v9-- - 3];
      while (v10 == 92);
      if (((1 - (_DWORD)v9) & 1) == 0)
        break;
    }
  }
  *(_QWORD *)(a2 + 16) = v7 - v5;
  v11 = (_QWORD *)(a2 + 16);
  v12 = (unsigned __int8 *)memchr(v5, 92, v7 - v5);
  for (i = 1; v12 && v12 < v8; i = 1)
  {
    *(_DWORD *)a2 = 5;
    v14 = (char *)(v12 + 2);
    v15 = json_char_table[v12[1]];
    if ((v15 & 0x1E0) == 0)
    {
      if ((v15 & 0x10000) == 0 || v8 - (unsigned __int8 *)v14 < 4)
        goto LABEL_28;
      if ((json_char_table[v12[2]] & 0x1A) == 0)
      {
        v14 = (char *)(v12 + 3);
        goto LABEL_28;
      }
      if ((json_char_table[v12[3]] & 0x1A) == 0)
      {
        v14 = (char *)(v12 + 4);
        goto LABEL_28;
      }
      if ((json_char_table[v12[4]] & 0x1A) == 0)
      {
        v14 = (char *)(v12 + 5);
LABEL_28:
        *(_DWORD *)a2 = 0;
        *(_QWORD *)(a2 + 8) = v14 - 1;
LABEL_29:
        i = 0;
        *v11 = 0;
        return i;
      }
      v14 = (char *)(v12 + 6);
      if ((json_char_table[v12[5]] & 0x1A) == 0)
        goto LABEL_28;
    }
    v12 = (unsigned __int8 *)memchr(v14, 92, v8 - (unsigned __int8 *)v14);
  }
  return i;
}

void sub_1B874EC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

float timeDecay(void *a1, float a2)
{
  id v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  int v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v44;

  v3 = a1;
  v4 = v3;
  v5 = 0.0;
  if (a2 >= 0.0)
  {
    v6 = a2 / 1440.0;
    if ((float)(a2 / 1440.0) < 1.0)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v5 = 1.0 - (float)(v6 * (float)(1.0 - v8));
LABEL_20:

      goto LABEL_21;
    }
    if (v6 < 3.0)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v10 = v9;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v13 = v12;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v16 = v13 - v15;
      v17 = v6 + -1.0;
      v18 = -0.5;
LABEL_8:
      v23 = v16 * v18;
LABEL_19:
      v5 = v10 + (float)(v23 * v17);

      goto LABEL_20;
    }
    if (v6 < 7.0)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v10 = v19;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v21 = v20;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v16 = v21 - v22;
      v17 = v6 + -3.0;
      v18 = -0.25;
      goto LABEL_8;
    }
    if (v6 < 30.0)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v10 = v24;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v26 = v25;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v28 = v26 - v27;
      v17 = v6 + -7.0;
      v29 = -23.0;
LABEL_18:
      v23 = v28 / v29;
      goto LABEL_19;
    }
    if (v6 >= 90.0)
    {
      if (v6 < 365.0)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "floatValue");
        v10 = v35;
        objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v37 = v36;
        objc_msgSend(v4, "objectAtIndexedSubscript:", 5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        v28 = v37 - v38;
        v17 = v6 + -90.0;
        v29 = -275.0;
        goto LABEL_18;
      }
      if (v6 >= 540.0)
      {
        if (v6 >= 1095.0)
          goto LABEL_21;
        objc_msgSend(v3, "objectAtIndexedSubscript:", 6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "floatValue");
        v5 = (float)((float)(1095.0 - v6) * v44) / 555.0;
        goto LABEL_20;
      }
      objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v10 = v39;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v41 = v40;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v28 = v41 - v42;
      v17 = v6 + -365.0;
      *(float *)&v34 = -175.0;
    }
    else
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v10 = v30;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v32 = v31;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v28 = v32 - v33;
      v17 = v6 + -30.0;
      *(float *)&v34 = -60.0;
    }
    v29 = *(float *)&v34;
    goto LABEL_18;
  }
LABEL_21:

  return v5;
}

void sub_1B8753AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1B8754048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B87548A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8754BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B87556F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1B8755E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1B8756180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8756434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8756B70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t chooseTopicality()
{
  uint64_t result;

  if (!_os_feature_enabled_impl()
    || !_os_feature_enabled_impl()
    || (result = _os_feature_enabled_impl(), !(_DWORD)result))
  {
    if (!_os_feature_enabled_impl())
      return _os_feature_enabled_impl();
    result = _os_feature_enabled_impl();
    if (!(_DWORD)result)
      return _os_feature_enabled_impl();
  }
  return result;
}

id extractStringFromArray(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  char isKindOfClass;

  v1 = a1;
  if (!v1)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v1, "count"))
  {
LABEL_9:
    v3 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v3 = 0;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v3 = v2;
LABEL_10:

  return v3;
}

void sub_1B87588E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B87653B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

id rankingAttributeNameArray()
{
  if (rankingAttributeNameArray_onceToken != -1)
    dispatch_once(&rankingAttributeNameArray_onceToken, &__block_literal_global_46);
  return (id)rankingAttributeNameArray_rankingAttributeNames;
}

void __rankingAttributeNameArray_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[320];

  v34[319] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6380];
  v34[0] = *MEMORY[0x1E0CA60F8];
  v34[1] = v0;
  v1 = *MEMORY[0x1E0CA60C8];
  v34[2] = *MEMORY[0x1E0CA6978];
  v34[3] = v1;
  v2 = *MEMORY[0x1E0CA6048];
  v34[4] = *MEMORY[0x1E0CA68D8];
  v34[5] = v2;
  v3 = *MEMORY[0x1E0CA6158];
  v34[6] = *MEMORY[0x1E0CA60F0];
  v34[7] = v3;
  v4 = *MEMORY[0x1E0CA6450];
  v34[8] = *MEMORY[0x1E0CA6A80];
  v34[9] = v4;
  v5 = *MEMORY[0x1E0CA69B0];
  v34[10] = *MEMORY[0x1E0CA6060];
  v34[11] = v5;
  v6 = *MEMORY[0x1E0CA6108];
  v34[12] = *MEMORY[0x1E0CA6968];
  v34[13] = v6;
  v7 = *MEMORY[0x1E0CA6800];
  v34[14] = *MEMORY[0x1E0CA69A8];
  v34[15] = v7;
  v8 = *MEMORY[0x1E0CA68C8];
  v34[16] = *MEMORY[0x1E0CA68C0];
  v34[17] = v8;
  v9 = *MEMORY[0x1E0CA61A8];
  v34[18] = *MEMORY[0x1E0CA61C8];
  v34[19] = v9;
  v10 = *MEMORY[0x1E0CA6998];
  v34[20] = *MEMORY[0x1E0CA64A0];
  v34[21] = v10;
  v11 = *MEMORY[0x1E0CA6960];
  v34[22] = *MEMORY[0x1E0CA69A0];
  v34[23] = v11;
  v12 = *MEMORY[0x1E0CA60E0];
  v34[24] = *MEMORY[0x1E0CA6138];
  v34[25] = v12;
  v13 = *MEMORY[0x1E0CA6100];
  v34[26] = *MEMORY[0x1E0CA5F80];
  v34[27] = v13;
  v14 = *MEMORY[0x1E0CA61A0];
  v34[28] = *MEMORY[0x1E0CA60A0];
  v34[29] = v14;
  v15 = *MEMORY[0x1E0CA6150];
  v34[30] = *MEMORY[0x1E0CA5F30];
  v34[31] = v15;
  v16 = *MEMORY[0x1E0CA6010];
  v34[32] = *MEMORY[0x1E0CA60D0];
  v34[33] = v16;
  v17 = *MEMORY[0x1E0CA6030];
  v34[34] = *MEMORY[0x1E0CA6950];
  v34[35] = v17;
  v18 = *MEMORY[0x1E0CA5FF0];
  v34[36] = *MEMORY[0x1E0CA62E8];
  v34[37] = v18;
  v19 = *MEMORY[0x1E0CA6570];
  v34[38] = *MEMORY[0x1E0CA5F50];
  v34[39] = v19;
  v20 = *MEMORY[0x1E0CA68F0];
  v34[40] = *MEMORY[0x1E0CA61B8];
  v34[41] = v20;
  v21 = *MEMORY[0x1E0CA6470];
  v34[42] = *MEMORY[0x1E0CA6458];
  v34[43] = v21;
  v22 = *MEMORY[0x1E0CA5F48];
  v34[44] = *MEMORY[0x1E0CA68E8];
  v34[45] = v22;
  v23 = *MEMORY[0x1E0CA6028];
  v34[46] = *MEMORY[0x1E0CA6898];
  v34[47] = v23;
  v24 = *MEMORY[0x1E0CA63D8];
  v34[48] = *MEMORY[0x1E0CA67C8];
  v34[49] = v24;
  v25 = *MEMORY[0x1E0CA62F8];
  v34[50] = *MEMORY[0x1E0CA6198];
  v34[51] = v25;
  v26 = *MEMORY[0x1E0CA6320];
  v34[52] = *MEMORY[0x1E0CA6520];
  v34[53] = v26;
  v27 = *MEMORY[0x1E0CA6770];
  v34[54] = *MEMORY[0x1E0CA6160];
  v34[55] = v27;
  v28 = *MEMORY[0x1E0CA6318];
  v34[56] = *MEMORY[0x1E0CA64C8];
  v34[57] = v28;
  v29 = *MEMORY[0x1E0CA5F90];
  v34[58] = *MEMORY[0x1E0CA6460];
  v34[59] = v29;
  v30 = *MEMORY[0x1E0CA5F88];
  v34[60] = *MEMORY[0x1E0CA6988];
  v34[61] = v30;
  v31 = *MEMORY[0x1E0CA6428];
  v34[62] = *MEMORY[0x1E0CA5F98];
  v34[63] = v31;
  v34[64] = *MEMORY[0x1E0CA69E8];
  v34[65] = *MEMORY[0x1E0CA6980];
  v34[66] = *MEMORY[0x1E0CA6018];
  v34[67] = *MEMORY[0x1E0CA6760];
  v34[68] = *MEMORY[0x1E0CA6768];
  v34[69] = *MEMORY[0x1E0CA6080];
  v34[70] = *MEMORY[0x1E0CA6078];
  v34[71] = *MEMORY[0x1E0CA6430];
  v34[72] = *MEMORY[0x1E0CA67F0];
  v34[73] = *MEMORY[0x1E0CA64D0];
  v34[74] = *MEMORY[0x1E0CA63B8];
  v34[75] = *MEMORY[0x1E0CA6508];
  v34[76] = *MEMORY[0x1E0CA6388];
  v34[77] = *MEMORY[0x1E0CA6A70];
  v34[78] = *MEMORY[0x1E0CA64D8];
  v34[79] = *MEMORY[0x1E0CA6720];
  v34[80] = *MEMORY[0x1E0CA6728];
  v34[81] = *MEMORY[0x1E0CA69F8];
  v34[82] = *MEMORY[0x1E0CA68A0];
  v34[83] = *MEMORY[0x1E0CA6310];
  v34[84] = *MEMORY[0x1E0CA6140];
  v34[85] = *MEMORY[0x1E0CA6308];
  v34[86] = *MEMORY[0x1E0CA6090];
  v34[87] = *MEMORY[0x1E0CA6818];
  v34[88] = *MEMORY[0x1E0CA61D0];
  v34[89] = *MEMORY[0x1E0CA6058];
  v34[90] = *MEMORY[0x1E0CA6730];
  v34[91] = *MEMORY[0x1E0CA60C0];
  v34[92] = *MEMORY[0x1E0CA6928];
  v34[93] = *MEMORY[0x1E0CA6540];
  v34[94] = *MEMORY[0x1E0CA6548];
  v34[95] = *MEMORY[0x1E0CA6550];
  v34[96] = *MEMORY[0x1E0CA60B0];
  v34[97] = *MEMORY[0x1E0CA66C0];
  v34[98] = *MEMORY[0x1E0CA66C8];
  v34[99] = *MEMORY[0x1E0CA66E0];
  v34[100] = *MEMORY[0x1E0CA6970];
  v34[101] = *MEMORY[0x1E0CA6A58];
  v34[102] = *MEMORY[0x1E0CA6900];
  v34[103] = CFSTR("kMDQueryResultTextContentDistances");
  v34[104] = *MEMORY[0x1E0CA6A60];
  v34[105] = *MEMORY[0x1E0CA6A90];
  v34[106] = *MEMORY[0x1E0CA6918];
  v34[107] = *MEMORY[0x1E0CA6AA8];
  v34[108] = *MEMORY[0x1E0CA6790];
  v34[109] = *MEMORY[0x1E0CA67A0];
  v34[110] = *MEMORY[0x1E0CA67B0];
  v34[111] = *MEMORY[0x1E0CA6798];
  v34[112] = *MEMORY[0x1E0CA67A8];
  v34[113] = *MEMORY[0x1E0CA67B8];
  v34[114] = *MEMORY[0x1E0CA6778];
  v34[115] = *MEMORY[0x1E0CA6780];
  v34[116] = *MEMORY[0x1E0CA6788];
  v34[117] = *MEMORY[0x1E0CA66B8];
  v34[118] = *MEMORY[0x1E0CA6400];
  v34[119] = *MEMORY[0x1E0CA6350];
  v34[120] = *MEMORY[0x1E0CA65C8];
  v34[121] = *MEMORY[0x1E0CA6618];
  v34[122] = *MEMORY[0x1E0CA6588];
  v34[123] = *MEMORY[0x1E0CA6580];
  v34[124] = *MEMORY[0x1E0CA6610];
  v34[125] = *MEMORY[0x1E0CA65B0];
  v34[126] = *MEMORY[0x1E0CA65A8];
  v34[127] = *MEMORY[0x1E0CA65B8];
  v34[128] = *MEMORY[0x1E0CA6630];
  v34[129] = *MEMORY[0x1E0CA6678];
  v34[130] = *MEMORY[0x1E0CA6670];
  v34[131] = *MEMORY[0x1E0CA66A0];
  v34[132] = *MEMORY[0x1E0CA6668];
  v34[133] = *MEMORY[0x1E0CA6688];
  v34[134] = *MEMORY[0x1E0CA66A8];
  v34[135] = *MEMORY[0x1E0CA65D0];
  v34[136] = *MEMORY[0x1E0CA65F8];
  v34[137] = *MEMORY[0x1E0CA65D8];
  v34[138] = *MEMORY[0x1E0CA65E8];
  v34[139] = *MEMORY[0x1E0CA66B0];
  v34[140] = *MEMORY[0x1E0CA6598];
  v34[141] = *MEMORY[0x1E0CA6650];
  v34[142] = *MEMORY[0x1E0CA5F38];
  v34[143] = *MEMORY[0x1E0CA5F40];
  v34[144] = *MEMORY[0x1E0CA6128];
  v34[145] = *MEMORY[0x1E0CA5F78];
  v34[146] = *MEMORY[0x1E0CA66D0];
  v34[147] = *MEMORY[0x1E0CA66D8];
  v34[148] = *MEMORY[0x1E0CA6A50];
  v34[149] = *MEMORY[0x1E0CA67F8];
  v34[150] = *MEMORY[0x1E0CA5FC8];
  v34[151] = *MEMORY[0x1E0CA6020];
  v34[152] = *MEMORY[0x1E0CA5FD0];
  v34[153] = *MEMORY[0x1E0CA5FC0];
  v34[154] = *MEMORY[0x1E0CA5FE8];
  v34[155] = *MEMORY[0x1E0CA68E0];
  v34[156] = *MEMORY[0x1E0CA60B8];
  v34[157] = *MEMORY[0x1E0CA6008];
  v34[158] = *MEMORY[0x1E0CA6000];
  v34[159] = *MEMORY[0x1E0CA6718];
  v34[160] = *MEMORY[0x1E0CA6A98];
  v34[161] = *MEMORY[0x1E0CA6648];
  v34[162] = *MEMORY[0x1E0CA6848];
  v34[163] = *MEMORY[0x1E0CA6828];
  v34[164] = *MEMORY[0x1E0CA6850];
  v34[165] = *MEMORY[0x1E0CA6860];
  v34[166] = *MEMORY[0x1E0CA6868];
  v34[167] = *MEMORY[0x1E0CA6838];
  v34[168] = *MEMORY[0x1E0CA6858];
  v34[169] = *MEMORY[0x1E0CA6830];
  v34[170] = *MEMORY[0x1E0CA6870];
  v34[171] = *MEMORY[0x1E0CA6888];
  v34[172] = *MEMORY[0x1E0CA6880];
  v34[173] = *MEMORY[0x1E0CA6840];
  v34[174] = *MEMORY[0x1E0CA6878];
  v34[175] = *MEMORY[0x1E0CA65A0];
  v34[176] = *MEMORY[0x1E0CA6938];
  v34[177] = *MEMORY[0x1E0CA6940];
  v34[178] = *MEMORY[0x1E0CA6418];
  v34[179] = *MEMORY[0x1E0CA6050];
  v34[180] = *MEMORY[0x1E0CA6958];
  v34[181] = *MEMORY[0x1E0CA6070];
  v34[182] = *MEMORY[0x1E0CA6660];
  v34[183] = *MEMORY[0x1E0CA6690];
  v34[184] = *MEMORY[0x1E0CA6640];
  v34[185] = *MEMORY[0x1E0CA6680];
  v34[186] = *MEMORY[0x1E0CA6698];
  v34[187] = *MEMORY[0x1E0CA6188];
  v34[188] = *MEMORY[0x1E0CA6190];
  v34[189] = *MEMORY[0x1E0CA6180];
  v34[190] = *MEMORY[0x1E0CA6170];
  v34[191] = *MEMORY[0x1E0CA6178];
  v34[192] = *MEMORY[0x1E0CA6168];
  v34[193] = *MEMORY[0x1E0CA6990];
  v34[194] = *MEMORY[0x1E0CA6358];
  v34[195] = *MEMORY[0x1E0CA6098];
  v34[196] = *MEMORY[0x1E0CA6808];
  v34[197] = *MEMORY[0x1E0CA6810];
  v34[198] = *MEMORY[0x1E0CA65E0];
  v34[199] = *MEMORY[0x1E0CA65F0];
  v34[200] = *MEMORY[0x1E0CA64C0];
  v34[201] = *MEMORY[0x1E0CA64B8];
  v34[202] = *MEMORY[0x1E0CA64B0];
  v34[203] = *MEMORY[0x1E0CA64A8];
  v34[204] = *MEMORY[0x1E0CA6560];
  v34[205] = *MEMORY[0x1E0CA6558];
  v34[206] = *MEMORY[0x1E0CA6568];
  v34[207] = *MEMORY[0x1E0CA6260];
  v34[208] = *MEMORY[0x1E0CA6270];
  v34[209] = *MEMORY[0x1E0CA5F70];
  v34[210] = *MEMORY[0x1E0CA6088];
  v34[211] = *MEMORY[0x1E0CA6118];
  v34[212] = *MEMORY[0x1E0CA6120];
  v34[213] = *MEMORY[0x1E0CA6328];
  v34[214] = *MEMORY[0x1E0CA6340];
  v34[215] = *MEMORY[0x1E0CA63C8];
  v34[216] = *MEMORY[0x1E0CA6620];
  v34[217] = *MEMORY[0x1E0CA66F0];
  v34[218] = *MEMORY[0x1E0CA6710];
  v34[219] = *MEMORY[0x1E0CA67C0];
  v34[220] = *MEMORY[0x1E0CA67D0];
  v34[221] = *MEMORY[0x1E0CA68D0];
  v34[222] = *MEMORY[0x1E0CA6910];
  v34[223] = *MEMORY[0x1E0CA6490];
  v34[224] = *MEMORY[0x1E0CA63D0];
  v34[225] = *MEMORY[0x1E0CA6530];
  v34[226] = *MEMORY[0x1E0CA6538];
  v34[227] = *MEMORY[0x1E0CA6A38];
  v34[228] = *MEMORY[0x1E0CA62E0];
  v34[229] = *MEMORY[0x1E0CA6A68];
  v34[230] = *MEMORY[0x1E0CA6240];
  v34[231] = *MEMORY[0x1E0CA6248];
  v34[232] = *MEMORY[0x1E0CA6210];
  v34[233] = *MEMORY[0x1E0CA61F8];
  v34[234] = *MEMORY[0x1E0CA6200];
  v34[235] = *MEMORY[0x1E0CA6208];
  v34[236] = *MEMORY[0x1E0CA61F0];
  v34[237] = *MEMORY[0x1E0CA6238];
  v34[238] = *MEMORY[0x1E0CA61D8];
  v34[239] = *MEMORY[0x1E0CA61E0];
  v34[240] = *MEMORY[0x1E0CA6220];
  v34[241] = *MEMORY[0x1E0CA6228];
  v34[242] = *MEMORY[0x1E0CA6218];
  v34[243] = *MEMORY[0x1E0CA6250];
  v34[244] = *MEMORY[0x1E0CA6258];
  v34[245] = *MEMORY[0x1E0CA61E8];
  v34[246] = *MEMORY[0x1E0CA6230];
  v34[247] = *MEMORY[0x1E0CA6288];
  v34[248] = *MEMORY[0x1E0CA6298];
  v34[249] = *MEMORY[0x1E0CA6290];
  v34[250] = *MEMORY[0x1E0CA6268];
  v34[251] = *MEMORY[0x1E0CA6278];
  v34[252] = *MEMORY[0x1E0CA6280];
  v34[253] = *MEMORY[0x1E0CA62C8];
  v34[254] = *MEMORY[0x1E0CA62D8];
  v34[255] = *MEMORY[0x1E0CA62D0];
  v34[256] = *MEMORY[0x1E0CA62A8];
  v34[257] = *MEMORY[0x1E0CA62B8];
  v34[258] = *MEMORY[0x1E0CA62C0];
  v34[259] = *MEMORY[0x1E0CA62B0];
  v34[260] = *MEMORY[0x1E0CA6478];
  v34[261] = *MEMORY[0x1E0CA5FA0];
  v34[262] = *MEMORY[0x1E0CA5FA8];
  v34[263] = *MEMORY[0x1E0CA6890];
  v34[264] = *MEMORY[0x1E0CA6908];
  v34[265] = *MEMORY[0x1E0CA62A0];
  v34[266] = *MEMORY[0x1E0CA6130];
  v34[267] = *MEMORY[0x1E0CA67D8];
  v34[268] = *MEMORY[0x1E0CA60A8];
  v34[269] = *MEMORY[0x1E0CA63C0];
  v34[270] = *MEMORY[0x1E0CA6330];
  v34[271] = *MEMORY[0x1E0CA6498];
  v34[272] = *MEMORY[0x1E0CA6740];
  v34[273] = *MEMORY[0x1E0CA6750];
  v34[274] = *MEMORY[0x1E0CA6748];
  v34[275] = *MEMORY[0x1E0CA6758];
  v34[276] = *MEMORY[0x1E0CA6398];
  v34[277] = *MEMORY[0x1E0CA64E8];
  v34[278] = *MEMORY[0x1E0CA60E8];
  v34[279] = *MEMORY[0x1E0CA69C8];
  v34[280] = *MEMORY[0x1E0CA69B8];
  v34[281] = *MEMORY[0x1E0CA69C0];
  v34[282] = *MEMORY[0x1E0CA6738];
  v34[283] = *MEMORY[0x1E0CA67E8];
  v34[284] = *MEMORY[0x1E0CA5FB0];
  v34[285] = *MEMORY[0x1E0CA6A08];
  v34[286] = *MEMORY[0x1E0CA6A00];
  v34[287] = *MEMORY[0x1E0CA6480];
  v34[288] = *MEMORY[0x1E0CA6A18];
  v34[289] = *MEMORY[0x1E0CA6A40];
  v34[290] = *MEMORY[0x1E0CA6A48];
  v34[291] = *MEMORY[0x1E0CA67E0];
  v34[292] = *MEMORY[0x1E0CA5FF8];
  v34[293] = *MEMORY[0x1E0CA66F8];
  v34[294] = *MEMORY[0x1E0CA5F58];
  v34[295] = *MEMORY[0x1E0CA6360];
  v34[296] = *MEMORY[0x1E0CA69F0];
  v34[297] = *MEMORY[0x1E0CA6A30];
  v34[298] = *MEMORY[0x1E0CA6A28];
  v34[299] = *MEMORY[0x1E0CA6A20];
  v34[300] = *MEMORY[0x1E0CA6AB0];
  v34[301] = *MEMORY[0x1E0CA63A8];
  v34[302] = *MEMORY[0x1E0CA64F8];
  v34[303] = *MEMORY[0x1E0CA63B0];
  v34[304] = *MEMORY[0x1E0CA6500];
  v34[305] = *MEMORY[0x1E0CA6390];
  v34[306] = *MEMORY[0x1E0CA64E0];
  v34[307] = *MEMORY[0x1E0CA63A0];
  v34[308] = *MEMORY[0x1E0CA64F0];
  v34[309] = *MEMORY[0x1E0CA69E0];
  v34[310] = *MEMORY[0x1E0CA6148];
  v34[311] = *MEMORY[0x1E0CA60D8];
  v34[312] = *MEMORY[0x1E0CA6920];
  v34[313] = *MEMORY[0x1E0CA69D0];
  v34[314] = *MEMORY[0x1E0CA69D8];
  v34[315] = *MEMORY[0x1E0CA6348];
  v34[316] = *MEMORY[0x1E0CA6438];
  v34[317] = *MEMORY[0x1E0CA6338];
  v34[318] = *MEMORY[0x1E0CA68F8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 319);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)rankingAttributeNameArray_rankingAttributeNames;
  rankingAttributeNameArray_rankingAttributeNames = v32;

}

id rankingPrefetchedAttributesArray()
{
  if (rankingPrefetchedAttributesArray_onceToken != -1)
    dispatch_once(&rankingPrefetchedAttributesArray_onceToken, &__block_literal_global_10_0);
  return (id)rankingPrefetchedAttributesArray_prefetchedAttributeNames;
}

void __rankingPrefetchedAttributesArray_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  rankingAttributeNameArray();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subarrayWithRange:", 0, 267);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rankingPrefetchedAttributesArray_prefetchedAttributeNames;
  rankingPrefetchedAttributesArray_prefetchedAttributeNames = v0;

}

id rankingExtraPrefetchedAttributesArray()
{
  if (rankingExtraPrefetchedAttributesArray_onceToken != -1)
    dispatch_once(&rankingExtraPrefetchedAttributesArray_onceToken, &__block_literal_global_11_0);
  return (id)rankingExtraPrefetchedAttributesArray_extraPrefetchedAttributeNames;
}

void __rankingExtraPrefetchedAttributesArray_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _QWORD v48[319];
  _QWORD v49[320];

  v49[319] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6380];
  v48[0] = *MEMORY[0x1E0CA60F8];
  v48[1] = v0;
  v49[0] = &unk_1E6E98280;
  v49[1] = &unk_1E6E98280;
  v1 = *MEMORY[0x1E0CA60C8];
  v48[2] = *MEMORY[0x1E0CA6978];
  v48[3] = v1;
  v49[2] = &unk_1E6E98280;
  v49[3] = &unk_1E6E98280;
  v2 = *MEMORY[0x1E0CA6048];
  v48[4] = *MEMORY[0x1E0CA68D8];
  v48[5] = v2;
  v49[4] = &unk_1E6E98280;
  v49[5] = &unk_1E6E98280;
  v3 = *MEMORY[0x1E0CA6158];
  v48[6] = *MEMORY[0x1E0CA60F0];
  v48[7] = v3;
  v49[6] = &unk_1E6E98280;
  v49[7] = &unk_1E6E98280;
  v4 = *MEMORY[0x1E0CA6450];
  v48[8] = *MEMORY[0x1E0CA6A80];
  v48[9] = v4;
  v49[8] = &unk_1E6E98280;
  v49[9] = &unk_1E6E98280;
  v5 = *MEMORY[0x1E0CA69B0];
  v48[10] = *MEMORY[0x1E0CA6060];
  v48[11] = v5;
  v49[10] = &unk_1E6E98280;
  v49[11] = &unk_1E6E98280;
  v6 = *MEMORY[0x1E0CA6108];
  v48[12] = *MEMORY[0x1E0CA6968];
  v48[13] = v6;
  v49[12] = &unk_1E6E98280;
  v49[13] = &unk_1E6E98280;
  v7 = *MEMORY[0x1E0CA6800];
  v48[14] = *MEMORY[0x1E0CA69A8];
  v48[15] = v7;
  v49[14] = &unk_1E6E98280;
  v49[15] = &unk_1E6E98280;
  v8 = *MEMORY[0x1E0CA68C8];
  v48[16] = *MEMORY[0x1E0CA68C0];
  v48[17] = v8;
  v49[16] = &unk_1E6E98280;
  v49[17] = &unk_1E6E98280;
  v9 = *MEMORY[0x1E0CA61A8];
  v48[18] = *MEMORY[0x1E0CA61C8];
  v48[19] = v9;
  v49[18] = &unk_1E6E98280;
  v49[19] = &unk_1E6E98280;
  v10 = *MEMORY[0x1E0CA6998];
  v48[20] = *MEMORY[0x1E0CA64A0];
  v48[21] = v10;
  v49[20] = &unk_1E6E98280;
  v49[21] = &unk_1E6E98280;
  v11 = *MEMORY[0x1E0CA6960];
  v48[22] = *MEMORY[0x1E0CA69A0];
  v48[23] = v11;
  v49[22] = &unk_1E6E98280;
  v49[23] = &unk_1E6E98280;
  v12 = *MEMORY[0x1E0CA60E0];
  v48[24] = *MEMORY[0x1E0CA6138];
  v48[25] = v12;
  v49[24] = &unk_1E6E98280;
  v49[25] = &unk_1E6E98280;
  v13 = *MEMORY[0x1E0CA6100];
  v48[26] = *MEMORY[0x1E0CA5F80];
  v48[27] = v13;
  v49[26] = &unk_1E6E98280;
  v49[27] = &unk_1E6E98280;
  v14 = *MEMORY[0x1E0CA61A0];
  v48[28] = *MEMORY[0x1E0CA60A0];
  v48[29] = v14;
  v49[28] = &unk_1E6E98280;
  v49[29] = &unk_1E6E98280;
  v15 = *MEMORY[0x1E0CA6150];
  v48[30] = *MEMORY[0x1E0CA5F30];
  v48[31] = v15;
  v49[30] = &unk_1E6E98280;
  v49[31] = &unk_1E6E98280;
  v16 = *MEMORY[0x1E0CA6010];
  v48[32] = *MEMORY[0x1E0CA60D0];
  v48[33] = v16;
  v49[32] = &unk_1E6E98280;
  v49[33] = &unk_1E6E98280;
  v17 = *MEMORY[0x1E0CA6030];
  v48[34] = *MEMORY[0x1E0CA6950];
  v48[35] = v17;
  v49[34] = &unk_1E6E98280;
  v49[35] = &unk_1E6E98280;
  v18 = *MEMORY[0x1E0CA5FF0];
  v48[36] = *MEMORY[0x1E0CA62E8];
  v48[37] = v18;
  v49[36] = &unk_1E6E98280;
  v49[37] = &unk_1E6E98280;
  v19 = *MEMORY[0x1E0CA6570];
  v48[38] = *MEMORY[0x1E0CA5F50];
  v48[39] = v19;
  v49[38] = &unk_1E6E98280;
  v49[39] = &unk_1E6E98280;
  v20 = *MEMORY[0x1E0CA68F0];
  v48[40] = *MEMORY[0x1E0CA61B8];
  v48[41] = v20;
  v49[40] = &unk_1E6E98280;
  v49[41] = &unk_1E6E98280;
  v21 = *MEMORY[0x1E0CA6470];
  v48[42] = *MEMORY[0x1E0CA6458];
  v48[43] = v21;
  v49[42] = &unk_1E6E98280;
  v49[43] = &unk_1E6E98280;
  v22 = *MEMORY[0x1E0CA5F48];
  v48[44] = *MEMORY[0x1E0CA68E8];
  v48[45] = v22;
  v49[44] = &unk_1E6E98280;
  v49[45] = &unk_1E6E98280;
  v23 = *MEMORY[0x1E0CA6028];
  v48[46] = *MEMORY[0x1E0CA6898];
  v48[47] = v23;
  v49[46] = &unk_1E6E98280;
  v49[47] = &unk_1E6E98280;
  v24 = *MEMORY[0x1E0CA63D8];
  v48[48] = *MEMORY[0x1E0CA67C8];
  v48[49] = v24;
  v49[48] = &unk_1E6E98280;
  v49[49] = &unk_1E6E98280;
  v25 = *MEMORY[0x1E0CA62F8];
  v48[50] = *MEMORY[0x1E0CA6198];
  v48[51] = v25;
  v49[50] = &unk_1E6E98280;
  v49[51] = &unk_1E6E98280;
  v26 = *MEMORY[0x1E0CA6320];
  v48[52] = *MEMORY[0x1E0CA6520];
  v48[53] = v26;
  v49[52] = &unk_1E6E98280;
  v49[53] = &unk_1E6E98280;
  v27 = *MEMORY[0x1E0CA6770];
  v48[54] = *MEMORY[0x1E0CA6160];
  v48[55] = v27;
  v49[54] = &unk_1E6E98280;
  v49[55] = &unk_1E6E98280;
  v28 = *MEMORY[0x1E0CA6318];
  v48[56] = *MEMORY[0x1E0CA64C8];
  v48[57] = v28;
  v49[56] = &unk_1E6E98280;
  v49[57] = &unk_1E6E98280;
  v29 = *MEMORY[0x1E0CA5F90];
  v48[58] = *MEMORY[0x1E0CA6460];
  v48[59] = v29;
  v49[58] = &unk_1E6E98280;
  v49[59] = &unk_1E6E98280;
  v30 = *MEMORY[0x1E0CA5F88];
  v48[60] = *MEMORY[0x1E0CA6988];
  v48[61] = v30;
  v49[60] = &unk_1E6E98280;
  v49[61] = &unk_1E6E98280;
  v31 = *MEMORY[0x1E0CA6428];
  v48[62] = *MEMORY[0x1E0CA5F98];
  v48[63] = v31;
  v49[62] = &unk_1E6E98280;
  v49[63] = &unk_1E6E98280;
  v48[64] = *MEMORY[0x1E0CA69E8];
  v49[64] = &unk_1E6E98280;
  v48[65] = *MEMORY[0x1E0CA6980];
  v49[65] = &unk_1E6E98280;
  v48[66] = *MEMORY[0x1E0CA6018];
  v49[66] = &unk_1E6E98280;
  v48[67] = *MEMORY[0x1E0CA6760];
  v49[67] = &unk_1E6E98280;
  v48[68] = *MEMORY[0x1E0CA6768];
  v49[68] = &unk_1E6E98280;
  v48[69] = *MEMORY[0x1E0CA6080];
  v49[69] = &unk_1E6E98280;
  v48[70] = *MEMORY[0x1E0CA6078];
  v49[70] = &unk_1E6E98280;
  v48[71] = *MEMORY[0x1E0CA6430];
  v49[71] = &unk_1E6E98280;
  v48[72] = *MEMORY[0x1E0CA67F0];
  v49[72] = &unk_1E6E98280;
  v48[73] = *MEMORY[0x1E0CA64D0];
  v49[73] = &unk_1E6E98280;
  v48[74] = *MEMORY[0x1E0CA63B8];
  v49[74] = &unk_1E6E98280;
  v48[75] = *MEMORY[0x1E0CA6508];
  v49[75] = &unk_1E6E98280;
  v48[76] = *MEMORY[0x1E0CA6388];
  v49[76] = &unk_1E6E98280;
  v48[77] = *MEMORY[0x1E0CA6A70];
  v49[77] = &unk_1E6E98280;
  v48[78] = *MEMORY[0x1E0CA64D8];
  v49[78] = &unk_1E6E98280;
  v48[79] = *MEMORY[0x1E0CA6720];
  v49[79] = &unk_1E6E98280;
  v48[80] = *MEMORY[0x1E0CA6728];
  v49[80] = &unk_1E6E98280;
  v48[81] = *MEMORY[0x1E0CA69F8];
  v49[81] = &unk_1E6E98280;
  v48[82] = *MEMORY[0x1E0CA68A0];
  v49[82] = &unk_1E6E98280;
  v48[83] = *MEMORY[0x1E0CA6310];
  v49[83] = &unk_1E6E98280;
  v48[84] = *MEMORY[0x1E0CA6140];
  v49[84] = &unk_1E6E98280;
  v48[85] = *MEMORY[0x1E0CA6308];
  v49[85] = &unk_1E6E98280;
  v48[86] = *MEMORY[0x1E0CA6090];
  v49[86] = &unk_1E6E98280;
  v48[87] = *MEMORY[0x1E0CA6818];
  v49[87] = &unk_1E6E98280;
  v48[88] = *MEMORY[0x1E0CA61D0];
  v49[88] = &unk_1E6E98280;
  v48[89] = *MEMORY[0x1E0CA6058];
  v49[89] = &unk_1E6E98280;
  v48[90] = *MEMORY[0x1E0CA6730];
  v49[90] = &unk_1E6E98280;
  v48[91] = *MEMORY[0x1E0CA60C0];
  v49[91] = &unk_1E6E98280;
  v48[92] = *MEMORY[0x1E0CA6928];
  v49[92] = &unk_1E6E98280;
  v48[93] = *MEMORY[0x1E0CA6540];
  v49[93] = &unk_1E6E98280;
  v48[94] = *MEMORY[0x1E0CA6548];
  v49[94] = &unk_1E6E98280;
  v48[95] = *MEMORY[0x1E0CA6550];
  v49[95] = &unk_1E6E98280;
  v48[96] = *MEMORY[0x1E0CA60B0];
  v49[96] = &unk_1E6E98280;
  v48[97] = *MEMORY[0x1E0CA66C0];
  v49[97] = &unk_1E6E98280;
  v48[98] = *MEMORY[0x1E0CA66C8];
  v49[98] = &unk_1E6E98280;
  v48[99] = *MEMORY[0x1E0CA66E0];
  v49[99] = &unk_1E6E98280;
  v48[100] = *MEMORY[0x1E0CA6970];
  v49[100] = &unk_1E6E98280;
  v48[101] = *MEMORY[0x1E0CA6A58];
  v49[101] = &unk_1E6E98280;
  v48[102] = *MEMORY[0x1E0CA6900];
  v49[102] = &unk_1E6E98280;
  v48[103] = CFSTR("kMDQueryResultTextContentDistances");
  v49[103] = &unk_1E6E98280;
  v48[104] = *MEMORY[0x1E0CA6A60];
  v49[104] = &unk_1E6E98280;
  v48[105] = *MEMORY[0x1E0CA6A90];
  v48[106] = *MEMORY[0x1E0CA6918];
  v48[107] = *MEMORY[0x1E0CA6AA8];
  v48[108] = *MEMORY[0x1E0CA6790];
  v48[109] = *MEMORY[0x1E0CA67A0];
  v48[110] = *MEMORY[0x1E0CA67B0];
  v48[111] = *MEMORY[0x1E0CA6798];
  v48[112] = *MEMORY[0x1E0CA67A8];
  v48[113] = *MEMORY[0x1E0CA67B8];
  v48[114] = *MEMORY[0x1E0CA6778];
  v48[115] = *MEMORY[0x1E0CA6780];
  v48[116] = *MEMORY[0x1E0CA6788];
  v48[117] = *MEMORY[0x1E0CA66B8];
  v48[118] = *MEMORY[0x1E0CA6400];
  v48[119] = *MEMORY[0x1E0CA6350];
  v48[120] = *MEMORY[0x1E0CA65C8];
  v48[121] = *MEMORY[0x1E0CA6618];
  v48[122] = *MEMORY[0x1E0CA6588];
  v48[123] = *MEMORY[0x1E0CA6580];
  v48[124] = *MEMORY[0x1E0CA6610];
  v48[125] = *MEMORY[0x1E0CA65B0];
  v48[127] = *MEMORY[0x1E0CA65B8];
  v48[130] = *MEMORY[0x1E0CA6670];
  v48[133] = *MEMORY[0x1E0CA6688];
  v48[136] = *MEMORY[0x1E0CA65F8];
  v48[139] = *MEMORY[0x1E0CA66B0];
  v48[142] = *MEMORY[0x1E0CA5F38];
  v48[145] = *MEMORY[0x1E0CA5F78];
  v48[148] = *MEMORY[0x1E0CA6A50];
  v48[151] = *MEMORY[0x1E0CA6020];
  v48[154] = *MEMORY[0x1E0CA5FE8];
  v48[157] = *MEMORY[0x1E0CA6008];
  v48[160] = *MEMORY[0x1E0CA6A98];
  v48[163] = *MEMORY[0x1E0CA6828];
  v48[166] = *MEMORY[0x1E0CA6868];
  v48[169] = *MEMORY[0x1E0CA6830];
  v48[172] = *MEMORY[0x1E0CA6880];
  v48[175] = *MEMORY[0x1E0CA65A0];
  v48[178] = *MEMORY[0x1E0CA6418];
  v48[181] = *MEMORY[0x1E0CA6070];
  v48[184] = *MEMORY[0x1E0CA6640];
  v48[187] = *MEMORY[0x1E0CA6188];
  v48[190] = *MEMORY[0x1E0CA6170];
  v48[189] = *MEMORY[0x1E0CA6180];
  v49[188] = &unk_1E6E98280;
  v49[189] = &unk_1E6E98280;
  v49[105] = &unk_1E6E98280;
  v48[188] = *MEMORY[0x1E0CA6190];
  v49[187] = &unk_1E6E98280;
  v48[186] = *MEMORY[0x1E0CA6698];
  v49[185] = &unk_1E6E98280;
  v49[186] = &unk_1E6E98280;
  v49[106] = &unk_1E6E98280;
  v48[185] = *MEMORY[0x1E0CA6680];
  v49[184] = &unk_1E6E98280;
  v48[183] = *MEMORY[0x1E0CA6690];
  v49[182] = &unk_1E6E98280;
  v49[183] = &unk_1E6E98280;
  v49[107] = &unk_1E6E98280;
  v48[182] = *MEMORY[0x1E0CA6660];
  v49[181] = &unk_1E6E98280;
  v48[180] = *MEMORY[0x1E0CA6958];
  v49[179] = &unk_1E6E98280;
  v49[180] = &unk_1E6E98280;
  v49[108] = &unk_1E6E98280;
  v48[179] = *MEMORY[0x1E0CA6050];
  v49[178] = &unk_1E6E98280;
  v48[177] = *MEMORY[0x1E0CA6940];
  v49[176] = &unk_1E6E98280;
  v49[177] = &unk_1E6E98280;
  v49[109] = &unk_1E6E98280;
  v48[176] = *MEMORY[0x1E0CA6938];
  v49[175] = &unk_1E6E98280;
  v48[174] = *MEMORY[0x1E0CA6878];
  v49[173] = &unk_1E6E98280;
  v49[174] = &unk_1E6E98280;
  v49[110] = &unk_1E6E98280;
  v48[173] = *MEMORY[0x1E0CA6840];
  v49[172] = &unk_1E6E98280;
  v48[171] = *MEMORY[0x1E0CA6888];
  v49[170] = &unk_1E6E98280;
  v49[171] = &unk_1E6E98280;
  v49[111] = &unk_1E6E98280;
  v48[170] = *MEMORY[0x1E0CA6870];
  v49[169] = &unk_1E6E98280;
  v48[168] = *MEMORY[0x1E0CA6858];
  v49[167] = &unk_1E6E98280;
  v49[168] = &unk_1E6E98280;
  v49[112] = &unk_1E6E98280;
  v48[167] = *MEMORY[0x1E0CA6838];
  v49[166] = &unk_1E6E98280;
  v48[165] = *MEMORY[0x1E0CA6860];
  v49[164] = &unk_1E6E98280;
  v49[165] = &unk_1E6E98280;
  v49[113] = &unk_1E6E98280;
  v48[164] = *MEMORY[0x1E0CA6850];
  v49[163] = &unk_1E6E98280;
  v48[162] = *MEMORY[0x1E0CA6848];
  v49[161] = &unk_1E6E98280;
  v49[162] = &unk_1E6E98280;
  v49[114] = &unk_1E6E98280;
  v48[161] = *MEMORY[0x1E0CA6648];
  v49[160] = &unk_1E6E98280;
  v48[159] = *MEMORY[0x1E0CA6718];
  v49[158] = &unk_1E6E98280;
  v49[159] = &unk_1E6E98280;
  v49[115] = &unk_1E6E98280;
  v48[158] = *MEMORY[0x1E0CA6000];
  v49[157] = &unk_1E6E98280;
  v48[156] = *MEMORY[0x1E0CA60B8];
  v49[155] = &unk_1E6E98280;
  v49[156] = &unk_1E6E98280;
  v49[116] = &unk_1E6E98280;
  v48[155] = *MEMORY[0x1E0CA68E0];
  v49[154] = &unk_1E6E98280;
  v48[153] = *MEMORY[0x1E0CA5FC0];
  v49[152] = &unk_1E6E98280;
  v49[153] = &unk_1E6E98280;
  v49[117] = &unk_1E6E98280;
  v48[152] = *MEMORY[0x1E0CA5FD0];
  v49[151] = &unk_1E6E98280;
  v48[150] = *MEMORY[0x1E0CA5FC8];
  v49[149] = &unk_1E6E98280;
  v49[150] = &unk_1E6E98280;
  v49[118] = &unk_1E6E98280;
  v48[149] = *MEMORY[0x1E0CA67F8];
  v49[148] = &unk_1E6E98280;
  v48[147] = *MEMORY[0x1E0CA66D8];
  v49[146] = &unk_1E6E98280;
  v49[147] = &unk_1E6E98280;
  v49[119] = &unk_1E6E98280;
  v48[146] = *MEMORY[0x1E0CA66D0];
  v49[145] = &unk_1E6E98280;
  v48[144] = *MEMORY[0x1E0CA6128];
  v49[143] = &unk_1E6E98280;
  v49[144] = &unk_1E6E98280;
  v49[120] = &unk_1E6E98280;
  v48[143] = *MEMORY[0x1E0CA5F40];
  v49[142] = &unk_1E6E98280;
  v48[141] = *MEMORY[0x1E0CA6650];
  v49[140] = &unk_1E6E98280;
  v49[141] = &unk_1E6E98280;
  v49[121] = &unk_1E6E98280;
  v48[140] = *MEMORY[0x1E0CA6598];
  v49[139] = &unk_1E6E98280;
  v48[138] = *MEMORY[0x1E0CA65E8];
  v49[137] = &unk_1E6E98280;
  v49[138] = &unk_1E6E98280;
  v49[122] = &unk_1E6E98280;
  v48[137] = *MEMORY[0x1E0CA65D8];
  v49[136] = &unk_1E6E98280;
  v48[135] = *MEMORY[0x1E0CA65D0];
  v49[134] = &unk_1E6E98280;
  v49[135] = &unk_1E6E98280;
  v49[123] = &unk_1E6E98280;
  v48[134] = *MEMORY[0x1E0CA66A8];
  v49[133] = &unk_1E6E98280;
  v48[132] = *MEMORY[0x1E0CA6668];
  v49[131] = &unk_1E6E98280;
  v49[132] = &unk_1E6E98280;
  v49[124] = &unk_1E6E98280;
  v48[131] = *MEMORY[0x1E0CA66A0];
  v49[130] = &unk_1E6E98280;
  v48[129] = *MEMORY[0x1E0CA6678];
  v49[128] = &unk_1E6E98280;
  v49[129] = &unk_1E6E98280;
  v49[125] = &unk_1E6E98280;
  v48[128] = *MEMORY[0x1E0CA6630];
  v49[127] = &unk_1E6E98280;
  v48[126] = *MEMORY[0x1E0CA65A8];
  v49[126] = &unk_1E6E98280;
  v49[190] = &unk_1E6E98280;
  v48[191] = *MEMORY[0x1E0CA6178];
  v49[191] = &unk_1E6E98280;
  v48[192] = *MEMORY[0x1E0CA6168];
  v49[192] = &unk_1E6E98280;
  v48[193] = *MEMORY[0x1E0CA6990];
  v49[193] = &unk_1E6E98280;
  v48[194] = *MEMORY[0x1E0CA6358];
  v49[194] = &unk_1E6E98280;
  v48[195] = *MEMORY[0x1E0CA6098];
  v49[195] = &unk_1E6E98280;
  v48[196] = *MEMORY[0x1E0CA6808];
  v49[196] = &unk_1E6E98280;
  v48[197] = *MEMORY[0x1E0CA6810];
  v49[197] = &unk_1E6E98280;
  v48[198] = *MEMORY[0x1E0CA65E0];
  v49[198] = &unk_1E6E98280;
  v48[199] = *MEMORY[0x1E0CA65F0];
  v49[199] = &unk_1E6E98280;
  v48[200] = *MEMORY[0x1E0CA64C0];
  v49[200] = &unk_1E6E98280;
  v48[201] = *MEMORY[0x1E0CA64B8];
  v49[201] = &unk_1E6E98280;
  v48[202] = *MEMORY[0x1E0CA64B0];
  v49[202] = &unk_1E6E98280;
  v48[203] = *MEMORY[0x1E0CA64A8];
  v49[203] = &unk_1E6E98280;
  v48[204] = *MEMORY[0x1E0CA6560];
  v49[204] = &unk_1E6E98280;
  v48[205] = *MEMORY[0x1E0CA6558];
  v49[205] = &unk_1E6E98280;
  v48[206] = *MEMORY[0x1E0CA6568];
  v49[206] = &unk_1E6E98280;
  v48[207] = *MEMORY[0x1E0CA6260];
  v49[207] = &unk_1E6E98280;
  v48[208] = *MEMORY[0x1E0CA6270];
  v49[208] = &unk_1E6E98280;
  v48[209] = *MEMORY[0x1E0CA5F70];
  v49[209] = &unk_1E6E98280;
  v48[210] = *MEMORY[0x1E0CA6088];
  v49[210] = &unk_1E6E98280;
  v48[211] = *MEMORY[0x1E0CA6118];
  v49[211] = &unk_1E6E98280;
  v48[212] = *MEMORY[0x1E0CA6120];
  v49[212] = &unk_1E6E98280;
  v48[213] = *MEMORY[0x1E0CA6328];
  v49[213] = &unk_1E6E98280;
  v48[214] = *MEMORY[0x1E0CA6340];
  v49[214] = &unk_1E6E98280;
  v48[215] = *MEMORY[0x1E0CA63C8];
  v49[215] = &unk_1E6E98280;
  v48[216] = *MEMORY[0x1E0CA6620];
  v49[216] = &unk_1E6E98280;
  v48[217] = *MEMORY[0x1E0CA66F0];
  v49[217] = &unk_1E6E98280;
  v48[218] = *MEMORY[0x1E0CA6710];
  v49[218] = &unk_1E6E98280;
  v48[219] = *MEMORY[0x1E0CA67C0];
  v49[219] = &unk_1E6E98280;
  v48[220] = *MEMORY[0x1E0CA67D0];
  v49[220] = &unk_1E6E98280;
  v48[221] = *MEMORY[0x1E0CA68D0];
  v49[221] = &unk_1E6E98280;
  v48[222] = *MEMORY[0x1E0CA6910];
  v49[222] = &unk_1E6E98280;
  v48[223] = *MEMORY[0x1E0CA6490];
  v49[223] = &unk_1E6E98280;
  v48[224] = *MEMORY[0x1E0CA63D0];
  v49[224] = &unk_1E6E98280;
  v48[225] = *MEMORY[0x1E0CA6530];
  v49[225] = &unk_1E6E98280;
  v48[226] = *MEMORY[0x1E0CA6538];
  v49[226] = &unk_1E6E98280;
  v48[227] = *MEMORY[0x1E0CA6A38];
  v49[227] = &unk_1E6E98280;
  v48[228] = *MEMORY[0x1E0CA62E0];
  v49[228] = &unk_1E6E98280;
  v48[229] = *MEMORY[0x1E0CA6A68];
  v49[229] = &unk_1E6E98280;
  v48[230] = *MEMORY[0x1E0CA6240];
  v49[230] = &unk_1E6E98280;
  v48[231] = *MEMORY[0x1E0CA6248];
  v49[231] = &unk_1E6E98280;
  v48[232] = *MEMORY[0x1E0CA6210];
  v49[232] = &unk_1E6E98280;
  v48[233] = *MEMORY[0x1E0CA61F8];
  v49[233] = &unk_1E6E98280;
  v48[234] = *MEMORY[0x1E0CA6200];
  v49[234] = &unk_1E6E98280;
  v48[235] = *MEMORY[0x1E0CA6208];
  v49[235] = &unk_1E6E98280;
  v48[236] = *MEMORY[0x1E0CA61F0];
  v49[236] = &unk_1E6E98280;
  v48[237] = *MEMORY[0x1E0CA6238];
  v49[237] = &unk_1E6E98280;
  v48[238] = *MEMORY[0x1E0CA61D8];
  v49[238] = &unk_1E6E98280;
  v48[239] = *MEMORY[0x1E0CA61E0];
  v49[239] = &unk_1E6E98280;
  v48[240] = *MEMORY[0x1E0CA6220];
  v49[240] = &unk_1E6E98280;
  v48[241] = *MEMORY[0x1E0CA6228];
  v49[241] = &unk_1E6E98280;
  v48[242] = *MEMORY[0x1E0CA6218];
  v49[242] = &unk_1E6E98280;
  v48[243] = *MEMORY[0x1E0CA6250];
  v49[243] = &unk_1E6E98280;
  v48[244] = *MEMORY[0x1E0CA6258];
  v49[244] = &unk_1E6E98280;
  v48[245] = *MEMORY[0x1E0CA61E8];
  v49[245] = &unk_1E6E98280;
  v48[246] = *MEMORY[0x1E0CA6230];
  v49[246] = &unk_1E6E98280;
  v48[247] = *MEMORY[0x1E0CA6288];
  v49[247] = &unk_1E6E98280;
  v48[248] = *MEMORY[0x1E0CA6298];
  v49[248] = &unk_1E6E98280;
  v48[249] = *MEMORY[0x1E0CA6290];
  v49[249] = &unk_1E6E98280;
  v48[250] = *MEMORY[0x1E0CA6268];
  v49[250] = &unk_1E6E98280;
  v48[251] = *MEMORY[0x1E0CA6278];
  v49[251] = &unk_1E6E98280;
  v48[252] = *MEMORY[0x1E0CA6280];
  v49[252] = &unk_1E6E98280;
  v48[253] = *MEMORY[0x1E0CA62C8];
  v49[253] = &unk_1E6E98280;
  v48[254] = *MEMORY[0x1E0CA62D8];
  v49[254] = &unk_1E6E98280;
  v48[255] = *MEMORY[0x1E0CA62D0];
  v49[255] = &unk_1E6E98280;
  v48[256] = *MEMORY[0x1E0CA62A8];
  v49[256] = &unk_1E6E98280;
  v48[257] = *MEMORY[0x1E0CA62B8];
  v49[257] = &unk_1E6E98280;
  v48[258] = *MEMORY[0x1E0CA62C0];
  v49[258] = &unk_1E6E98280;
  v48[259] = *MEMORY[0x1E0CA62B0];
  v49[259] = &unk_1E6E98280;
  v48[260] = *MEMORY[0x1E0CA6478];
  v49[260] = &unk_1E6E98280;
  v48[261] = *MEMORY[0x1E0CA5FA0];
  v49[261] = &unk_1E6E98280;
  v48[262] = *MEMORY[0x1E0CA5FA8];
  v49[262] = &unk_1E6E98280;
  v48[263] = *MEMORY[0x1E0CA6890];
  v49[263] = &unk_1E6E98280;
  v48[264] = *MEMORY[0x1E0CA6908];
  v49[264] = &unk_1E6E98280;
  v48[265] = *MEMORY[0x1E0CA62A0];
  v48[266] = *MEMORY[0x1E0CA6130];
  v49[265] = &unk_1E6E98280;
  v49[266] = &unk_1E6E98298;
  v48[267] = *MEMORY[0x1E0CA67D8];
  v49[267] = &unk_1E6E98280;
  v48[268] = *MEMORY[0x1E0CA60A8];
  v49[268] = &unk_1E6E98280;
  v48[269] = *MEMORY[0x1E0CA63C0];
  v49[269] = &unk_1E6E98280;
  v48[270] = *MEMORY[0x1E0CA6330];
  v49[270] = &unk_1E6E98280;
  v48[271] = *MEMORY[0x1E0CA6498];
  v49[271] = &unk_1E6E98280;
  v48[272] = *MEMORY[0x1E0CA6740];
  v49[272] = &unk_1E6E98280;
  v48[273] = *MEMORY[0x1E0CA6750];
  v49[273] = &unk_1E6E98280;
  v48[274] = *MEMORY[0x1E0CA6748];
  v49[274] = &unk_1E6E98280;
  v48[275] = *MEMORY[0x1E0CA6758];
  v49[275] = &unk_1E6E98280;
  v48[276] = *MEMORY[0x1E0CA6398];
  v49[276] = &unk_1E6E98280;
  v48[277] = *MEMORY[0x1E0CA64E8];
  v49[277] = &unk_1E6E98280;
  v48[278] = *MEMORY[0x1E0CA60E8];
  v49[278] = &unk_1E6E98280;
  v48[279] = *MEMORY[0x1E0CA69C8];
  v49[279] = &unk_1E6E98280;
  v48[280] = *MEMORY[0x1E0CA69B8];
  v49[280] = &unk_1E6E98280;
  v48[281] = *MEMORY[0x1E0CA69C0];
  v49[281] = &unk_1E6E98280;
  v48[282] = *MEMORY[0x1E0CA6738];
  v49[282] = &unk_1E6E98280;
  v48[283] = *MEMORY[0x1E0CA67E8];
  v49[283] = &unk_1E6E98280;
  v48[284] = *MEMORY[0x1E0CA5FB0];
  v49[284] = &unk_1E6E98280;
  v48[285] = *MEMORY[0x1E0CA6A08];
  v49[285] = &unk_1E6E98280;
  v48[286] = *MEMORY[0x1E0CA6A00];
  v49[286] = &unk_1E6E98280;
  v48[287] = *MEMORY[0x1E0CA6480];
  v49[287] = &unk_1E6E98280;
  v48[288] = *MEMORY[0x1E0CA6A18];
  v49[288] = &unk_1E6E98280;
  v48[289] = *MEMORY[0x1E0CA6A40];
  v49[289] = &unk_1E6E98280;
  v48[290] = *MEMORY[0x1E0CA6A48];
  v49[290] = &unk_1E6E98280;
  v48[291] = *MEMORY[0x1E0CA67E0];
  v49[291] = &unk_1E6E98280;
  v48[292] = *MEMORY[0x1E0CA5FF8];
  v49[292] = &unk_1E6E98280;
  v48[293] = *MEMORY[0x1E0CA66F8];
  v49[293] = &unk_1E6E98280;
  v48[294] = *MEMORY[0x1E0CA5F58];
  v49[294] = &unk_1E6E98280;
  v48[295] = *MEMORY[0x1E0CA6360];
  v49[295] = &unk_1E6E98280;
  v48[296] = *MEMORY[0x1E0CA69F0];
  v49[296] = &unk_1E6E98280;
  v48[297] = *MEMORY[0x1E0CA6A30];
  v49[297] = &unk_1E6E98280;
  v48[298] = *MEMORY[0x1E0CA6A28];
  v49[298] = &unk_1E6E98280;
  v48[299] = *MEMORY[0x1E0CA6A20];
  v49[299] = &unk_1E6E98280;
  v48[300] = *MEMORY[0x1E0CA6AB0];
  v49[300] = &unk_1E6E98280;
  v48[301] = *MEMORY[0x1E0CA63A8];
  v49[301] = &unk_1E6E98280;
  v48[302] = *MEMORY[0x1E0CA64F8];
  v49[302] = &unk_1E6E98280;
  v48[303] = *MEMORY[0x1E0CA63B0];
  v49[303] = &unk_1E6E98280;
  v48[304] = *MEMORY[0x1E0CA6500];
  v49[304] = &unk_1E6E98280;
  v48[305] = *MEMORY[0x1E0CA6390];
  v49[305] = &unk_1E6E98280;
  v48[306] = *MEMORY[0x1E0CA64E0];
  v49[306] = &unk_1E6E98280;
  v48[307] = *MEMORY[0x1E0CA63A0];
  v49[307] = &unk_1E6E98280;
  v48[308] = *MEMORY[0x1E0CA64F0];
  v49[308] = &unk_1E6E98280;
  v48[309] = *MEMORY[0x1E0CA69E0];
  v49[309] = &unk_1E6E98280;
  v48[310] = *MEMORY[0x1E0CA6148];
  v49[310] = &unk_1E6E98280;
  v48[311] = *MEMORY[0x1E0CA60D8];
  v49[311] = &unk_1E6E98280;
  v48[312] = *MEMORY[0x1E0CA6920];
  v49[312] = &unk_1E6E98280;
  v48[313] = *MEMORY[0x1E0CA69D0];
  v48[314] = *MEMORY[0x1E0CA69D8];
  v48[315] = *MEMORY[0x1E0CA6348];
  v48[316] = *MEMORY[0x1E0CA6438];
  v48[317] = *MEMORY[0x1E0CA6338];
  v48[318] = *MEMORY[0x1E0CA68F8];
  v49[313] = &unk_1E6E98280;
  v49[314] = &unk_1E6E98280;
  v49[315] = &unk_1E6E98280;
  v49[316] = &unk_1E6E98280;
  v49[317] = &unk_1E6E98280;
  v49[318] = &unk_1E6E98280;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 319);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = (void *)rankingExtraPrefetchedAttributesArray_extraPrefetchedAttributeNames;
  rankingExtraPrefetchedAttributesArray_extraPrefetchedAttributeNames = (uint64_t)v33;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  rankingAttributeNameArray();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v44 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v32, "objectForKeyedSubscript:", v40, (_QWORD)v43);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v41 && objc_msgSend(v41, "intValue") == 2)
          objc_msgSend((id)rankingExtraPrefetchedAttributesArray_extraPrefetchedAttributeNames, "addObject:", v40);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v37);
  }

}

uint64_t rankingAttributeIndexForName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (rankingAttributeIndexForName_onceToken != -1)
    dispatch_once(&rankingAttributeIndexForName_onceToken, &__block_literal_global_17_0);
  objc_msgSend((id)rankingAttributeIndexForName_attributeToRankingIndexMap, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

void __rankingAttributeIndexForName_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v22;
  uint64_t v23;
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
  void *v49;
  _QWORD v50[319];
  _QWORD v51[321];

  v51[319] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6380];
  v50[0] = *MEMORY[0x1E0CA60F8];
  v50[1] = v0;
  v51[0] = &unk_1E6E982B0;
  v51[1] = &unk_1E6E982C8;
  v1 = *MEMORY[0x1E0CA60C8];
  v50[2] = *MEMORY[0x1E0CA6978];
  v50[3] = v1;
  v51[2] = &unk_1E6E982E0;
  v51[3] = &unk_1E6E982F8;
  v2 = *MEMORY[0x1E0CA6048];
  v50[4] = *MEMORY[0x1E0CA68D8];
  v50[5] = v2;
  v51[4] = &unk_1E6E98310;
  v51[5] = &unk_1E6E98328;
  v3 = *MEMORY[0x1E0CA6158];
  v50[6] = *MEMORY[0x1E0CA60F0];
  v50[7] = v3;
  v51[6] = &unk_1E6E98340;
  v51[7] = &unk_1E6E98358;
  v4 = *MEMORY[0x1E0CA6450];
  v50[8] = *MEMORY[0x1E0CA6A80];
  v50[9] = v4;
  v51[8] = &unk_1E6E98370;
  v51[9] = &unk_1E6E98388;
  v5 = *MEMORY[0x1E0CA69B0];
  v50[10] = *MEMORY[0x1E0CA6060];
  v50[11] = v5;
  v51[10] = &unk_1E6E983A0;
  v51[11] = &unk_1E6E983B8;
  v6 = *MEMORY[0x1E0CA6108];
  v50[12] = *MEMORY[0x1E0CA6968];
  v50[13] = v6;
  v51[12] = &unk_1E6E983D0;
  v51[13] = &unk_1E6E983E8;
  v7 = *MEMORY[0x1E0CA6800];
  v50[14] = *MEMORY[0x1E0CA69A8];
  v50[15] = v7;
  v51[14] = &unk_1E6E98400;
  v51[15] = &unk_1E6E98418;
  v8 = *MEMORY[0x1E0CA68C8];
  v50[16] = *MEMORY[0x1E0CA68C0];
  v50[17] = v8;
  v51[16] = &unk_1E6E98430;
  v51[17] = &unk_1E6E98448;
  v9 = *MEMORY[0x1E0CA61A8];
  v50[18] = *MEMORY[0x1E0CA61C8];
  v50[19] = v9;
  v51[18] = &unk_1E6E98460;
  v51[19] = &unk_1E6E98478;
  v10 = *MEMORY[0x1E0CA6998];
  v50[20] = *MEMORY[0x1E0CA64A0];
  v50[21] = v10;
  v51[20] = &unk_1E6E98490;
  v51[21] = &unk_1E6E984A8;
  v11 = *MEMORY[0x1E0CA6960];
  v50[22] = *MEMORY[0x1E0CA69A0];
  v50[23] = v11;
  v51[22] = &unk_1E6E984C0;
  v51[23] = &unk_1E6E984D8;
  v12 = *MEMORY[0x1E0CA60E0];
  v50[24] = *MEMORY[0x1E0CA6138];
  v50[25] = v12;
  v51[24] = &unk_1E6E984F0;
  v51[25] = &unk_1E6E98508;
  v13 = *MEMORY[0x1E0CA6100];
  v50[26] = *MEMORY[0x1E0CA5F80];
  v50[27] = v13;
  v51[26] = &unk_1E6E98520;
  v51[27] = &unk_1E6E98538;
  v14 = *MEMORY[0x1E0CA61A0];
  v50[28] = *MEMORY[0x1E0CA60A0];
  v50[29] = v14;
  v51[28] = &unk_1E6E98550;
  v51[29] = &unk_1E6E98568;
  v15 = *MEMORY[0x1E0CA6150];
  v50[30] = *MEMORY[0x1E0CA5F30];
  v50[31] = v15;
  v51[30] = &unk_1E6E98580;
  v51[31] = &unk_1E6E98598;
  v16 = *MEMORY[0x1E0CA6010];
  v50[32] = *MEMORY[0x1E0CA60D0];
  v50[33] = v16;
  v51[32] = &unk_1E6E985B0;
  v51[33] = &unk_1E6E985C8;
  v17 = *MEMORY[0x1E0CA6030];
  v50[34] = *MEMORY[0x1E0CA6950];
  v50[35] = v17;
  v51[34] = &unk_1E6E985E0;
  v51[35] = &unk_1E6E985F8;
  v18 = *MEMORY[0x1E0CA5FF0];
  v50[36] = *MEMORY[0x1E0CA62E8];
  v50[37] = v18;
  v51[36] = &unk_1E6E98610;
  v51[37] = &unk_1E6E98628;
  v19 = *MEMORY[0x1E0CA6570];
  v50[38] = *MEMORY[0x1E0CA5F50];
  v50[39] = v19;
  v51[38] = &unk_1E6E98640;
  v51[39] = &unk_1E6E98658;
  v20 = *MEMORY[0x1E0CA68F0];
  v50[40] = *MEMORY[0x1E0CA61B8];
  v50[41] = v20;
  v51[40] = &unk_1E6E98670;
  v51[41] = &unk_1E6E98688;
  v21 = *MEMORY[0x1E0CA6470];
  v50[42] = *MEMORY[0x1E0CA6458];
  v50[43] = v21;
  v51[42] = &unk_1E6E986A0;
  v51[43] = &unk_1E6E986B8;
  v22 = *MEMORY[0x1E0CA5F48];
  v50[44] = *MEMORY[0x1E0CA68E8];
  v50[45] = v22;
  v51[44] = &unk_1E6E986D0;
  v51[45] = &unk_1E6E986E8;
  v23 = *MEMORY[0x1E0CA6028];
  v50[46] = *MEMORY[0x1E0CA6898];
  v50[47] = v23;
  v51[46] = &unk_1E6E98700;
  v51[47] = &unk_1E6E98718;
  v24 = *MEMORY[0x1E0CA63D8];
  v50[48] = *MEMORY[0x1E0CA67C8];
  v50[49] = v24;
  v51[48] = &unk_1E6E98730;
  v51[49] = &unk_1E6E98748;
  v25 = *MEMORY[0x1E0CA62F8];
  v50[50] = *MEMORY[0x1E0CA6198];
  v50[51] = v25;
  v51[50] = &unk_1E6E98760;
  v51[51] = &unk_1E6E98778;
  v26 = *MEMORY[0x1E0CA6320];
  v50[52] = *MEMORY[0x1E0CA6520];
  v50[53] = v26;
  v51[52] = &unk_1E6E98790;
  v51[53] = &unk_1E6E987A8;
  v27 = *MEMORY[0x1E0CA6770];
  v50[54] = *MEMORY[0x1E0CA6160];
  v50[55] = v27;
  v51[54] = &unk_1E6E987C0;
  v51[55] = &unk_1E6E987D8;
  v28 = *MEMORY[0x1E0CA6318];
  v50[56] = *MEMORY[0x1E0CA64C8];
  v50[57] = v28;
  v51[56] = &unk_1E6E987F0;
  v51[57] = &unk_1E6E98808;
  v29 = *MEMORY[0x1E0CA5F90];
  v50[58] = *MEMORY[0x1E0CA6460];
  v50[59] = v29;
  v51[58] = &unk_1E6E98820;
  v51[59] = &unk_1E6E98838;
  v30 = *MEMORY[0x1E0CA5F88];
  v50[60] = *MEMORY[0x1E0CA6988];
  v50[61] = v30;
  v51[60] = &unk_1E6E98850;
  v51[61] = &unk_1E6E98868;
  v31 = *MEMORY[0x1E0CA6428];
  v50[62] = *MEMORY[0x1E0CA5F98];
  v50[63] = v31;
  v51[62] = &unk_1E6E98880;
  v51[63] = &unk_1E6E98898;
  v50[64] = *MEMORY[0x1E0CA69E8];
  v51[64] = &unk_1E6E988B0;
  v50[65] = *MEMORY[0x1E0CA6980];
  v51[65] = &unk_1E6E988C8;
  v50[66] = *MEMORY[0x1E0CA6018];
  v51[66] = &unk_1E6E988E0;
  v50[67] = *MEMORY[0x1E0CA6760];
  v51[67] = &unk_1E6E988F8;
  v50[68] = *MEMORY[0x1E0CA6768];
  v51[68] = &unk_1E6E98910;
  v50[69] = *MEMORY[0x1E0CA6080];
  v51[69] = &unk_1E6E98928;
  v50[70] = *MEMORY[0x1E0CA6078];
  v51[70] = &unk_1E6E98940;
  v50[71] = *MEMORY[0x1E0CA6430];
  v51[71] = &unk_1E6E98958;
  v50[72] = *MEMORY[0x1E0CA67F0];
  v51[72] = &unk_1E6E98970;
  v50[73] = *MEMORY[0x1E0CA64D0];
  v51[73] = &unk_1E6E98988;
  v50[74] = *MEMORY[0x1E0CA63B8];
  v51[74] = &unk_1E6E989A0;
  v50[75] = *MEMORY[0x1E0CA6508];
  v51[75] = &unk_1E6E989B8;
  v50[76] = *MEMORY[0x1E0CA6388];
  v51[76] = &unk_1E6E989D0;
  v50[77] = *MEMORY[0x1E0CA6A70];
  v51[77] = &unk_1E6E989E8;
  v50[78] = *MEMORY[0x1E0CA64D8];
  v51[78] = &unk_1E6E98A00;
  v50[79] = *MEMORY[0x1E0CA6720];
  v51[79] = &unk_1E6E98A18;
  v50[80] = *MEMORY[0x1E0CA6728];
  v51[80] = &unk_1E6E98A30;
  v50[81] = *MEMORY[0x1E0CA69F8];
  v51[81] = &unk_1E6E98A48;
  v50[82] = *MEMORY[0x1E0CA68A0];
  v51[82] = &unk_1E6E98A60;
  v50[83] = *MEMORY[0x1E0CA6310];
  v51[83] = &unk_1E6E98A78;
  v50[84] = *MEMORY[0x1E0CA6140];
  v51[84] = &unk_1E6E98A90;
  v50[85] = *MEMORY[0x1E0CA6308];
  v51[85] = &unk_1E6E98AA8;
  v50[86] = *MEMORY[0x1E0CA6090];
  v51[86] = &unk_1E6E98AC0;
  v50[87] = *MEMORY[0x1E0CA6818];
  v51[87] = &unk_1E6E98AD8;
  v50[88] = *MEMORY[0x1E0CA61D0];
  v51[88] = &unk_1E6E98AF0;
  v50[89] = *MEMORY[0x1E0CA6058];
  v51[89] = &unk_1E6E98B08;
  v50[90] = *MEMORY[0x1E0CA6730];
  v51[90] = &unk_1E6E98B20;
  v50[91] = *MEMORY[0x1E0CA60C0];
  v51[91] = &unk_1E6E98B38;
  v50[92] = *MEMORY[0x1E0CA6928];
  v51[92] = &unk_1E6E98B50;
  v50[93] = *MEMORY[0x1E0CA6540];
  v51[93] = &unk_1E6E98B68;
  v50[94] = *MEMORY[0x1E0CA6548];
  v51[94] = &unk_1E6E98B80;
  v50[95] = *MEMORY[0x1E0CA6550];
  v51[95] = &unk_1E6E98B98;
  v50[96] = *MEMORY[0x1E0CA60B0];
  v51[96] = &unk_1E6E98BB0;
  v50[97] = *MEMORY[0x1E0CA66C0];
  v51[97] = &unk_1E6E98BC8;
  v50[98] = *MEMORY[0x1E0CA66C8];
  v51[98] = &unk_1E6E98BE0;
  v50[99] = *MEMORY[0x1E0CA66E0];
  v51[99] = &unk_1E6E98BF8;
  v50[100] = *MEMORY[0x1E0CA6970];
  v51[100] = &unk_1E6E98C10;
  v50[101] = *MEMORY[0x1E0CA6A58];
  v51[101] = &unk_1E6E98C28;
  v50[102] = *MEMORY[0x1E0CA6900];
  v51[102] = &unk_1E6E98C40;
  v50[103] = CFSTR("kMDQueryResultTextContentDistances");
  v51[103] = &unk_1E6E98C58;
  v50[104] = *MEMORY[0x1E0CA6A60];
  v51[104] = &unk_1E6E98C70;
  v50[105] = *MEMORY[0x1E0CA6A90];
  v51[105] = &unk_1E6E98C88;
  v50[106] = *MEMORY[0x1E0CA6918];
  v51[106] = &unk_1E6E98CA0;
  v50[107] = *MEMORY[0x1E0CA6AA8];
  v51[107] = &unk_1E6E98CB8;
  v50[108] = *MEMORY[0x1E0CA6790];
  v51[108] = &unk_1E6E98CD0;
  v50[109] = *MEMORY[0x1E0CA67A0];
  v51[109] = &unk_1E6E98CE8;
  v50[110] = *MEMORY[0x1E0CA67B0];
  v51[110] = &unk_1E6E98D00;
  v50[187] = *MEMORY[0x1E0CA6188];
  v50[189] = *MEMORY[0x1E0CA6180];
  v50[190] = *MEMORY[0x1E0CA6170];
  v51[189] = &unk_1E6E99468;
  v50[188] = *MEMORY[0x1E0CA6190];
  v51[188] = &unk_1E6E99450;
  v51[187] = &unk_1E6E99438;
  v50[181] = *MEMORY[0x1E0CA6070];
  v51[186] = &unk_1E6E99420;
  v51[185] = &unk_1E6E99408;
  v50[186] = *MEMORY[0x1E0CA6698];
  v50[185] = *MEMORY[0x1E0CA6680];
  v50[183] = *MEMORY[0x1E0CA6690];
  v50[184] = *MEMORY[0x1E0CA6640];
  v51[184] = &unk_1E6E993F0;
  v51[183] = &unk_1E6E993D8;
  v50[182] = *MEMORY[0x1E0CA6660];
  v51[182] = &unk_1E6E993C0;
  v51[181] = &unk_1E6E993A8;
  v50[175] = *MEMORY[0x1E0CA65A0];
  v51[180] = &unk_1E6E99390;
  v51[179] = &unk_1E6E99378;
  v50[180] = *MEMORY[0x1E0CA6958];
  v50[179] = *MEMORY[0x1E0CA6050];
  v50[177] = *MEMORY[0x1E0CA6940];
  v50[178] = *MEMORY[0x1E0CA6418];
  v51[178] = &unk_1E6E99360;
  v51[177] = &unk_1E6E99348;
  v50[176] = *MEMORY[0x1E0CA6938];
  v51[176] = &unk_1E6E99330;
  v32 = *MEMORY[0x1E0CA6798];
  v51[175] = &unk_1E6E99318;
  v50[111] = v32;
  v51[174] = &unk_1E6E99300;
  v51[172] = &unk_1E6E992D0;
  v51[173] = &unk_1E6E992E8;
  v50[174] = *MEMORY[0x1E0CA6878];
  v50[173] = *MEMORY[0x1E0CA6840];
  v50[172] = *MEMORY[0x1E0CA6880];
  v51[111] = &unk_1E6E98D18;
  v50[171] = *MEMORY[0x1E0CA6888];
  v51[171] = &unk_1E6E992B8;
  v33 = *MEMORY[0x1E0CA67A8];
  v51[170] = &unk_1E6E992A0;
  v50[112] = v33;
  v51[169] = &unk_1E6E99288;
  v50[170] = *MEMORY[0x1E0CA6870];
  v50[169] = *MEMORY[0x1E0CA6830];
  v51[112] = &unk_1E6E98D30;
  v50[168] = *MEMORY[0x1E0CA6858];
  v51[168] = &unk_1E6E99270;
  v34 = *MEMORY[0x1E0CA67B8];
  v51[167] = &unk_1E6E99258;
  v50[113] = v34;
  v51[166] = &unk_1E6E99240;
  v50[167] = *MEMORY[0x1E0CA6838];
  v50[166] = *MEMORY[0x1E0CA6868];
  v51[113] = &unk_1E6E98D48;
  v50[165] = *MEMORY[0x1E0CA6860];
  v51[165] = &unk_1E6E99228;
  v35 = *MEMORY[0x1E0CA6778];
  v51[164] = &unk_1E6E99210;
  v50[114] = v35;
  v51[163] = &unk_1E6E991F8;
  v50[164] = *MEMORY[0x1E0CA6850];
  v50[163] = *MEMORY[0x1E0CA6828];
  v51[114] = &unk_1E6E98D60;
  v50[162] = *MEMORY[0x1E0CA6848];
  v51[162] = &unk_1E6E991E0;
  v36 = *MEMORY[0x1E0CA6780];
  v51[161] = &unk_1E6E991C8;
  v50[115] = v36;
  v51[160] = &unk_1E6E991B0;
  v50[161] = *MEMORY[0x1E0CA6648];
  v50[160] = *MEMORY[0x1E0CA6A98];
  v51[115] = &unk_1E6E98D78;
  v50[159] = *MEMORY[0x1E0CA6718];
  v51[159] = &unk_1E6E99198;
  v37 = *MEMORY[0x1E0CA6788];
  v51[158] = &unk_1E6E99180;
  v50[116] = v37;
  v51[157] = &unk_1E6E99168;
  v50[158] = *MEMORY[0x1E0CA6000];
  v50[157] = *MEMORY[0x1E0CA6008];
  v51[116] = &unk_1E6E98D90;
  v50[156] = *MEMORY[0x1E0CA60B8];
  v51[156] = &unk_1E6E99150;
  v38 = *MEMORY[0x1E0CA66B8];
  v51[155] = &unk_1E6E99138;
  v50[117] = v38;
  v51[154] = &unk_1E6E99120;
  v50[155] = *MEMORY[0x1E0CA68E0];
  v50[154] = *MEMORY[0x1E0CA5FE8];
  v51[117] = &unk_1E6E98DA8;
  v50[153] = *MEMORY[0x1E0CA5FC0];
  v51[153] = &unk_1E6E99108;
  v39 = *MEMORY[0x1E0CA6400];
  v51[152] = &unk_1E6E990F0;
  v50[118] = v39;
  v51[151] = &unk_1E6E990D8;
  v50[152] = *MEMORY[0x1E0CA5FD0];
  v50[151] = *MEMORY[0x1E0CA6020];
  v51[118] = &unk_1E6E98DC0;
  v50[150] = *MEMORY[0x1E0CA5FC8];
  v51[150] = &unk_1E6E990C0;
  v40 = *MEMORY[0x1E0CA6350];
  v51[149] = &unk_1E6E990A8;
  v50[119] = v40;
  v51[148] = &unk_1E6E99090;
  v50[149] = *MEMORY[0x1E0CA67F8];
  v50[148] = *MEMORY[0x1E0CA6A50];
  v51[119] = &unk_1E6E98DD8;
  v50[147] = *MEMORY[0x1E0CA66D8];
  v51[147] = &unk_1E6E99078;
  v41 = *MEMORY[0x1E0CA65C8];
  v51[146] = &unk_1E6E99060;
  v50[120] = v41;
  v51[145] = &unk_1E6E99048;
  v50[146] = *MEMORY[0x1E0CA66D0];
  v50[145] = *MEMORY[0x1E0CA5F78];
  v51[120] = &unk_1E6E98DF0;
  v50[144] = *MEMORY[0x1E0CA6128];
  v51[144] = &unk_1E6E99030;
  v42 = *MEMORY[0x1E0CA6618];
  v51[143] = &unk_1E6E99018;
  v50[121] = v42;
  v51[142] = &unk_1E6E99000;
  v50[143] = *MEMORY[0x1E0CA5F40];
  v50[142] = *MEMORY[0x1E0CA5F38];
  v51[121] = &unk_1E6E98E08;
  v50[141] = *MEMORY[0x1E0CA6650];
  v51[141] = &unk_1E6E98FE8;
  v43 = *MEMORY[0x1E0CA6588];
  v51[140] = &unk_1E6E98FD0;
  v50[122] = v43;
  v51[139] = &unk_1E6E98FB8;
  v50[140] = *MEMORY[0x1E0CA6598];
  v50[139] = *MEMORY[0x1E0CA66B0];
  v51[122] = &unk_1E6E98E20;
  v50[138] = *MEMORY[0x1E0CA65E8];
  v51[138] = &unk_1E6E98FA0;
  v44 = *MEMORY[0x1E0CA6580];
  v51[137] = &unk_1E6E98F88;
  v50[123] = v44;
  v51[136] = &unk_1E6E98F70;
  v50[137] = *MEMORY[0x1E0CA65D8];
  v50[136] = *MEMORY[0x1E0CA65F8];
  v51[123] = &unk_1E6E98E38;
  v50[135] = *MEMORY[0x1E0CA65D0];
  v51[135] = &unk_1E6E98F58;
  v45 = *MEMORY[0x1E0CA6610];
  v51[134] = &unk_1E6E98F40;
  v50[124] = v45;
  v51[133] = &unk_1E6E98F28;
  v50[134] = *MEMORY[0x1E0CA66A8];
  v50[133] = *MEMORY[0x1E0CA6688];
  v51[124] = &unk_1E6E98E50;
  v50[132] = *MEMORY[0x1E0CA6668];
  v51[132] = &unk_1E6E98F10;
  v46 = *MEMORY[0x1E0CA65B0];
  v51[131] = &unk_1E6E98EF8;
  v50[125] = v46;
  v51[130] = &unk_1E6E98EE0;
  v50[131] = *MEMORY[0x1E0CA66A0];
  v50[130] = *MEMORY[0x1E0CA6670];
  v51[125] = &unk_1E6E98E68;
  v50[129] = *MEMORY[0x1E0CA6678];
  v51[129] = &unk_1E6E98EC8;
  v47 = *MEMORY[0x1E0CA65A8];
  v51[128] = &unk_1E6E98EB0;
  v50[126] = v47;
  v51[127] = &unk_1E6E98E98;
  v50[128] = *MEMORY[0x1E0CA6630];
  v50[127] = *MEMORY[0x1E0CA65B8];
  v51[126] = &unk_1E6E98E80;
  v51[190] = &unk_1E6E99480;
  v50[191] = *MEMORY[0x1E0CA6178];
  v51[191] = &unk_1E6E99498;
  v50[192] = *MEMORY[0x1E0CA6168];
  v51[192] = &unk_1E6E994B0;
  v50[193] = *MEMORY[0x1E0CA6990];
  v51[193] = &unk_1E6E994C8;
  v50[194] = *MEMORY[0x1E0CA6358];
  v51[194] = &unk_1E6E994E0;
  v50[195] = *MEMORY[0x1E0CA6098];
  v51[195] = &unk_1E6E994F8;
  v50[196] = *MEMORY[0x1E0CA6808];
  v51[196] = &unk_1E6E99510;
  v50[197] = *MEMORY[0x1E0CA6810];
  v51[197] = &unk_1E6E99528;
  v50[198] = *MEMORY[0x1E0CA65E0];
  v51[198] = &unk_1E6E99540;
  v50[199] = *MEMORY[0x1E0CA65F0];
  v51[199] = &unk_1E6E99558;
  v50[200] = *MEMORY[0x1E0CA64C0];
  v51[200] = &unk_1E6E99570;
  v50[201] = *MEMORY[0x1E0CA64B8];
  v51[201] = &unk_1E6E99588;
  v50[202] = *MEMORY[0x1E0CA64B0];
  v51[202] = &unk_1E6E995A0;
  v50[203] = *MEMORY[0x1E0CA64A8];
  v51[203] = &unk_1E6E995B8;
  v50[204] = *MEMORY[0x1E0CA6560];
  v51[204] = &unk_1E6E995D0;
  v50[205] = *MEMORY[0x1E0CA6558];
  v51[205] = &unk_1E6E995E8;
  v50[206] = *MEMORY[0x1E0CA6568];
  v51[206] = &unk_1E6E99600;
  v50[207] = *MEMORY[0x1E0CA6260];
  v51[207] = &unk_1E6E99618;
  v50[208] = *MEMORY[0x1E0CA6270];
  v51[208] = &unk_1E6E99630;
  v50[209] = *MEMORY[0x1E0CA5F70];
  v51[209] = &unk_1E6E99648;
  v50[210] = *MEMORY[0x1E0CA6088];
  v51[210] = &unk_1E6E99660;
  v50[211] = *MEMORY[0x1E0CA6118];
  v51[211] = &unk_1E6E99678;
  v50[212] = *MEMORY[0x1E0CA6120];
  v51[212] = &unk_1E6E99690;
  v50[213] = *MEMORY[0x1E0CA6328];
  v51[213] = &unk_1E6E996A8;
  v50[214] = *MEMORY[0x1E0CA6340];
  v51[214] = &unk_1E6E996C0;
  v50[215] = *MEMORY[0x1E0CA63C8];
  v51[215] = &unk_1E6E996D8;
  v50[216] = *MEMORY[0x1E0CA6620];
  v51[216] = &unk_1E6E996F0;
  v50[217] = *MEMORY[0x1E0CA66F0];
  v51[217] = &unk_1E6E99708;
  v50[218] = *MEMORY[0x1E0CA6710];
  v51[218] = &unk_1E6E99720;
  v50[219] = *MEMORY[0x1E0CA67C0];
  v51[219] = &unk_1E6E99738;
  v50[220] = *MEMORY[0x1E0CA67D0];
  v51[220] = &unk_1E6E99750;
  v50[221] = *MEMORY[0x1E0CA68D0];
  v51[221] = &unk_1E6E99768;
  v50[222] = *MEMORY[0x1E0CA6910];
  v51[222] = &unk_1E6E99780;
  v50[223] = *MEMORY[0x1E0CA6490];
  v51[223] = &unk_1E6E99798;
  v50[224] = *MEMORY[0x1E0CA63D0];
  v51[224] = &unk_1E6E997B0;
  v50[225] = *MEMORY[0x1E0CA6530];
  v51[225] = &unk_1E6E997C8;
  v50[226] = *MEMORY[0x1E0CA6538];
  v51[226] = &unk_1E6E997E0;
  v50[227] = *MEMORY[0x1E0CA6A38];
  v51[227] = &unk_1E6E997F8;
  v50[228] = *MEMORY[0x1E0CA62E0];
  v51[228] = &unk_1E6E99810;
  v50[229] = *MEMORY[0x1E0CA6A68];
  v51[229] = &unk_1E6E99828;
  v50[230] = *MEMORY[0x1E0CA6240];
  v51[230] = &unk_1E6E99840;
  v50[231] = *MEMORY[0x1E0CA6248];
  v51[231] = &unk_1E6E99858;
  v50[232] = *MEMORY[0x1E0CA6210];
  v51[232] = &unk_1E6E99870;
  v50[233] = *MEMORY[0x1E0CA61F8];
  v51[233] = &unk_1E6E99888;
  v50[234] = *MEMORY[0x1E0CA6200];
  v51[234] = &unk_1E6E998A0;
  v50[235] = *MEMORY[0x1E0CA6208];
  v51[235] = &unk_1E6E998B8;
  v50[236] = *MEMORY[0x1E0CA61F0];
  v51[236] = &unk_1E6E998D0;
  v50[237] = *MEMORY[0x1E0CA6238];
  v51[237] = &unk_1E6E998E8;
  v50[238] = *MEMORY[0x1E0CA61D8];
  v51[238] = &unk_1E6E99900;
  v50[239] = *MEMORY[0x1E0CA61E0];
  v51[239] = &unk_1E6E99918;
  v50[240] = *MEMORY[0x1E0CA6220];
  v51[240] = &unk_1E6E99930;
  v50[241] = *MEMORY[0x1E0CA6228];
  v51[241] = &unk_1E6E99948;
  v50[242] = *MEMORY[0x1E0CA6218];
  v51[242] = &unk_1E6E99960;
  v50[243] = *MEMORY[0x1E0CA6250];
  v51[243] = &unk_1E6E99978;
  v50[244] = *MEMORY[0x1E0CA6258];
  v51[244] = &unk_1E6E99990;
  v50[245] = *MEMORY[0x1E0CA61E8];
  v51[245] = &unk_1E6E999A8;
  v50[246] = *MEMORY[0x1E0CA6230];
  v51[246] = &unk_1E6E999C0;
  v50[247] = *MEMORY[0x1E0CA6288];
  v51[247] = &unk_1E6E999D8;
  v50[248] = *MEMORY[0x1E0CA6298];
  v51[248] = &unk_1E6E999F0;
  v50[249] = *MEMORY[0x1E0CA6290];
  v51[249] = &unk_1E6E99A08;
  v50[250] = *MEMORY[0x1E0CA6268];
  v51[250] = &unk_1E6E99A20;
  v50[251] = *MEMORY[0x1E0CA6278];
  v51[251] = &unk_1E6E99A38;
  v50[252] = *MEMORY[0x1E0CA6280];
  v51[252] = &unk_1E6E99A50;
  v50[253] = *MEMORY[0x1E0CA62C8];
  v51[253] = &unk_1E6E99A68;
  v50[254] = *MEMORY[0x1E0CA62D8];
  v51[254] = &unk_1E6E99A80;
  v50[255] = *MEMORY[0x1E0CA62D0];
  v51[255] = &unk_1E6E99A98;
  v50[256] = *MEMORY[0x1E0CA62A8];
  v51[256] = &unk_1E6E99AB0;
  v50[257] = *MEMORY[0x1E0CA62B8];
  v51[257] = &unk_1E6E99AC8;
  v50[258] = *MEMORY[0x1E0CA62C0];
  v51[258] = &unk_1E6E99AE0;
  v50[259] = *MEMORY[0x1E0CA62B0];
  v51[259] = &unk_1E6E99AF8;
  v50[260] = *MEMORY[0x1E0CA6478];
  v51[260] = &unk_1E6E99B10;
  v50[261] = *MEMORY[0x1E0CA5FA0];
  v51[261] = &unk_1E6E99B28;
  v50[262] = *MEMORY[0x1E0CA5FA8];
  v51[262] = &unk_1E6E99B40;
  v50[263] = *MEMORY[0x1E0CA6890];
  v51[263] = &unk_1E6E99B58;
  v50[264] = *MEMORY[0x1E0CA6908];
  v51[264] = &unk_1E6E99B70;
  v50[265] = *MEMORY[0x1E0CA62A0];
  v51[265] = &unk_1E6E99B88;
  v50[266] = *MEMORY[0x1E0CA6130];
  v51[266] = &unk_1E6E99BA0;
  v50[267] = *MEMORY[0x1E0CA67D8];
  v51[267] = &unk_1E6E99BB8;
  v50[268] = *MEMORY[0x1E0CA60A8];
  v51[268] = &unk_1E6E99BD0;
  v50[269] = *MEMORY[0x1E0CA63C0];
  v51[269] = &unk_1E6E99BE8;
  v50[270] = *MEMORY[0x1E0CA6330];
  v51[270] = &unk_1E6E99C00;
  v50[271] = *MEMORY[0x1E0CA6498];
  v51[271] = &unk_1E6E99C18;
  v50[272] = *MEMORY[0x1E0CA6740];
  v51[272] = &unk_1E6E99C30;
  v50[273] = *MEMORY[0x1E0CA6750];
  v51[273] = &unk_1E6E99C48;
  v50[274] = *MEMORY[0x1E0CA6748];
  v51[274] = &unk_1E6E99C60;
  v50[275] = *MEMORY[0x1E0CA6758];
  v51[275] = &unk_1E6E99C78;
  v50[276] = *MEMORY[0x1E0CA6398];
  v51[276] = &unk_1E6E99C90;
  v50[277] = *MEMORY[0x1E0CA64E8];
  v51[277] = &unk_1E6E99CA8;
  v50[278] = *MEMORY[0x1E0CA60E8];
  v51[278] = &unk_1E6E99CC0;
  v50[279] = *MEMORY[0x1E0CA69C8];
  v51[279] = &unk_1E6E99CD8;
  v50[280] = *MEMORY[0x1E0CA69B8];
  v51[280] = &unk_1E6E99CF0;
  v50[281] = *MEMORY[0x1E0CA69C0];
  v51[281] = &unk_1E6E99D08;
  v50[282] = *MEMORY[0x1E0CA6738];
  v51[282] = &unk_1E6E99D20;
  v50[283] = *MEMORY[0x1E0CA67E8];
  v51[283] = &unk_1E6E99D38;
  v50[284] = *MEMORY[0x1E0CA5FB0];
  v51[284] = &unk_1E6E99D50;
  v50[285] = *MEMORY[0x1E0CA6A08];
  v51[285] = &unk_1E6E99D68;
  v50[286] = *MEMORY[0x1E0CA6A00];
  v51[286] = &unk_1E6E99D80;
  v50[287] = *MEMORY[0x1E0CA6480];
  v51[287] = &unk_1E6E99D98;
  v50[288] = *MEMORY[0x1E0CA6A18];
  v51[288] = &unk_1E6E99DB0;
  v50[289] = *MEMORY[0x1E0CA6A40];
  v51[289] = &unk_1E6E99DC8;
  v50[290] = *MEMORY[0x1E0CA6A48];
  v51[290] = &unk_1E6E99DE0;
  v50[291] = *MEMORY[0x1E0CA67E0];
  v51[291] = &unk_1E6E99DF8;
  v50[292] = *MEMORY[0x1E0CA5FF8];
  v51[292] = &unk_1E6E99E10;
  v50[293] = *MEMORY[0x1E0CA66F8];
  v51[293] = &unk_1E6E99E28;
  v50[294] = *MEMORY[0x1E0CA5F58];
  v51[294] = &unk_1E6E99E40;
  v50[295] = *MEMORY[0x1E0CA6360];
  v51[295] = &unk_1E6E99E58;
  v50[296] = *MEMORY[0x1E0CA69F0];
  v51[296] = &unk_1E6E99E70;
  v50[297] = *MEMORY[0x1E0CA6A30];
  v51[297] = &unk_1E6E99E88;
  v50[298] = *MEMORY[0x1E0CA6A28];
  v51[298] = &unk_1E6E99EA0;
  v50[299] = *MEMORY[0x1E0CA6A20];
  v51[299] = &unk_1E6E99EB8;
  v50[300] = *MEMORY[0x1E0CA6AB0];
  v51[300] = &unk_1E6E99ED0;
  v50[301] = *MEMORY[0x1E0CA63A8];
  v51[301] = &unk_1E6E99EE8;
  v50[302] = *MEMORY[0x1E0CA64F8];
  v51[302] = &unk_1E6E99F00;
  v50[303] = *MEMORY[0x1E0CA63B0];
  v51[303] = &unk_1E6E99F18;
  v50[304] = *MEMORY[0x1E0CA6500];
  v51[304] = &unk_1E6E99F30;
  v50[305] = *MEMORY[0x1E0CA6390];
  v51[305] = &unk_1E6E99F48;
  v50[306] = *MEMORY[0x1E0CA64E0];
  v51[306] = &unk_1E6E99F60;
  v50[307] = *MEMORY[0x1E0CA63A0];
  v51[307] = &unk_1E6E99F78;
  v50[308] = *MEMORY[0x1E0CA64F0];
  v51[308] = &unk_1E6E99F90;
  v50[309] = *MEMORY[0x1E0CA69E0];
  v51[309] = &unk_1E6E99FA8;
  v50[310] = *MEMORY[0x1E0CA6148];
  v51[310] = &unk_1E6E99FC0;
  v50[311] = *MEMORY[0x1E0CA60D8];
  v51[311] = &unk_1E6E99FD8;
  v50[312] = *MEMORY[0x1E0CA6920];
  v51[312] = &unk_1E6E99FF0;
  v50[313] = *MEMORY[0x1E0CA69D0];
  v51[313] = &unk_1E6E9A008;
  v50[314] = *MEMORY[0x1E0CA69D8];
  v51[314] = &unk_1E6E9A020;
  v50[315] = *MEMORY[0x1E0CA6348];
  v51[315] = &unk_1E6E9A038;
  v50[316] = *MEMORY[0x1E0CA6438];
  v51[316] = &unk_1E6E9A050;
  v50[317] = *MEMORY[0x1E0CA6338];
  v51[317] = &unk_1E6E9A068;
  v50[318] = *MEMORY[0x1E0CA68F8];
  v51[318] = &unk_1E6E9A080;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 319);
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)rankingAttributeIndexForName_attributeToRankingIndexMap;
  rankingAttributeIndexForName_attributeToRankingIndexMap = v48;

}

_QWORD *SSCompactRankingAttrsAlloc(uint64_t a1)
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 8 * a1 + 128, 0xE9BCF18uLL);
  *result = -1;
  return result;
}

void SSCompactRankingAttrsDealloc(char *a1)
{
  unsigned int v2;
  int8x8_t *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  int8x8_t *v10;
  int8x8_t v11;
  uint8x8_t v12;
  uint8x8_t v13;
  uint64_t v14;

  if (a1)
  {
    v2 = 0;
    v3 = (int8x8_t *)(a1 + 8);
    while (1)
    {
      v4 = 1 << v2;
      if (v2 >= 0x40)
        break;
      v5 = *((_QWORD *)a1 + 1);
      if ((v5 & v4) != 0)
      {
        v6 = 0;
        v7 = 0;
LABEL_17:
        v13 = (uint8x8_t)vcnt_s8((int8x8_t)(v5 & (v4 - 1)));
        v13.i16[0] = vaddlv_u8(v13);
        v14 = v13.u32[0] + v7;
        if (v14 >= 0)
        {
          if ((*(_QWORD *)&a1[8 * v6 + 48] & v4) != 0)
          {
            free(*(void **)&a1[8 * v14 + 128]);
          }
          else if ((*(_QWORD *)&a1[8 * v6 + 88] & v4) != 0)
          {
            CFRelease(*(CFTypeRef *)&a1[8 * v14 + 128]);
          }
        }
      }
LABEL_22:
      if (++v2 == 320)
      {
        free(a1);
        return;
      }
    }
    if (v2 < 0x100)
      v8 = 3;
    else
      v8 = 4;
    if (v2 < 0xC0)
      v8 = 2;
    if (v2 >= 0x80)
      v6 = v8;
    else
      v6 = 1;
    v5 = *(_QWORD *)&a1[8 * v6 + 8];
    if ((v5 & v4) == 0)
      goto LABEL_22;
    v7 = 0;
    v9 = v6;
    v10 = v3;
    do
    {
      v11 = *v10++;
      v12 = (uint8x8_t)vcnt_s8(v11);
      v12.i16[0] = vaddlv_u8(v12);
      v7 += v12.u32[0];
      --v9;
    }
    while (v9);
    goto LABEL_17;
  }
}

int8x8_t *SSCompactRankingAttrsCopy(uint64_t a1)
{
  uint8x8_t v2;
  size_t v3;
  int8x8_t *v4;
  unint64_t v5;
  uint64_t v6;
  int8x8_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  int8x8_t *v12;
  int8x8_t v13;
  uint8x8_t v14;
  uint8x8_t v15;
  uint64_t v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  size_t v24;
  _QWORD *v25;

  if (a1)
  {
    v2 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(a1 + 40));
    v2.i16[0] = vaddlv_u8(v2);
    v3 = 8
       * (vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 8))))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 24))))))+ v2.u32[0])+ 128;
    v4 = (int8x8_t *)malloc_type_calloc(1uLL, v3, 0xE9BCF18uLL);
    *v4 = (int8x8_t)-1;
    memcpy(v4, (const void *)a1, v3);
    v5 = 0;
    while (1)
    {
      v6 = 1 << v5;
      if (v5 >= 0x40)
        break;
      v7 = v4[1];
      if ((*(_QWORD *)&v7 & v6) != 0)
      {
        v8 = 0;
        v9 = 0;
LABEL_17:
        v15 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v7 & (v6 - 1)));
        v15.i16[0] = vaddlv_u8(v15);
        v16 = v15.u32[0] + v9;
        if (v16 >= 0)
        {
          if ((*(_QWORD *)(a1 + 8 * v8 + 48) & v6) != 0)
          {
            v17 = _SpotlightDefineRankingTypes_[v5];
            if (v17 != 16)
            {
              if (v17 == 32)
              {
                v22 = *(uint64_t **)(a1 + 8 * v16 + 128);
                v23 = *v22;
                v24 = 8 * *v22;
                v25 = malloc_type_malloc(v24 + 8, 0x9418A366uLL);
                *v25 = v23;
                memcpy(v25 + 1, v22 + 1, v24);
                v4[v16 + 16] = (int8x8_t)v25;
              }
              else
              {
                if (v17 != 64)
                  SSCompactRankingAttrsCopy_cold_1();
                v18 = *(uint64_t **)(a1 + 8 * v16 + 128);
                v19 = *v18;
                v20 = v18[1];
                v21 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
                *v21 = v19;
                v21[1] = v20;
                v4[v16 + 16] = (int8x8_t)v21;
              }
            }
          }
          else if ((*(_QWORD *)(a1 + 8 * v8 + 88) & v6) != 0)
          {
            CFRetain(*(CFTypeRef *)(a1 + 8 * v16 + 128));
          }
        }
      }
LABEL_26:
      if (++v5 == 320)
        return v4;
    }
    if (v5 < 0x100)
      v10 = 3;
    else
      v10 = 4;
    if (v5 < 0xC0)
      v10 = 2;
    if (v5 >= 0x80)
      v8 = v10;
    else
      v8 = 1;
    v7 = v4[v8 + 1];
    if ((*(_QWORD *)&v7 & v6) == 0)
      goto LABEL_26;
    v9 = 0;
    v11 = v8;
    v12 = v4 + 1;
    do
    {
      v13 = *v12++;
      v14 = (uint8x8_t)vcnt_s8(v13);
      v14.i16[0] = vaddlv_u8(v14);
      v9 += v14.u32[0];
      --v11;
    }
    while (v11);
    goto LABEL_17;
  }
  return 0;
}

void SSCompactRankingAttrsAddValue(int8x8_t *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  switch(_SpotlightDefineRankingTypes_[a2])
  {
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xD:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_3;
      break;
    default:
LABEL_3:
      v5 = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 0, 1);
      if (v5 != -1)
        a1[v5 + 16] = (int8x8_t)v6;
      break;
  }

}

uint64_t _SSCompactRankingAttrsDataIndexForInsert(int8x8_t *a1, uint64_t a2, int a3, int a4)
{
  uint8x8_t v4;
  uint64_t v5;
  uint8x8_t v6;
  uint64_t v7;
  uint8x8_t v8;
  uint64_t v9;
  uint8x8_t v10;
  uint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int8x8_t *v18;
  int8x8_t *v19;

  if (*(_QWORD *)a1 >= a2)
    return -1;
  v4 = (uint8x8_t)vcnt_s8(a1[1]);
  v4.i16[0] = vaddlv_u8(v4);
  v5 = v4.u32[0];
  v6 = (uint8x8_t)vcnt_s8(a1[2]);
  v6.i16[0] = vaddlv_u8(v6);
  v7 = v6.u32[0];
  v8 = (uint8x8_t)vcnt_s8(a1[3]);
  v8.i16[0] = vaddlv_u8(v8);
  v9 = v8.u32[0];
  v10 = (uint8x8_t)vcnt_s8(a1[4]);
  v10.i16[0] = vaddlv_u8(v10);
  v11 = v7 + v5 + v9 + v10.u32[0];
  v12 = (uint8x8_t)vcnt_s8(a1[5]);
  v12.i16[0] = vaddlv_u8(v12);
  v13 = v11 + v12.u32[0];
  v14 = 1 << a2;
  v15 = 1;
  v16 = 2;
  v17 = 3;
  if ((unint64_t)a2 >= 0x100)
    v17 = 4;
  if ((unint64_t)a2 >= 0xC0)
    v16 = v17;
  if ((unint64_t)a2 >= 0x80)
    v15 = v16;
  if (a2 < 64)
    v15 = 0;
  v18 = &a1[v15];
  *(_QWORD *)&v18[1] |= v14;
  if (a3)
  {
    v19 = v18 + 6;
LABEL_14:
    *(_QWORD *)v19 |= v14;
    goto LABEL_15;
  }
  if (a4)
  {
    v19 = &a1[v15 + 11];
    goto LABEL_14;
  }
LABEL_15:
  *a1 = (int8x8_t)a2;
  return v13;
}

uint64_t SSCompactRankingAttrsAddFloat(int8x8_t *a1, uint64_t a2, float a3)
{
  uint64_t result;

  if ((_SpotlightDefineRankingTypes_[a2] & 0x10) == 0)
    SSCompactRankingAttrsAddFloat_cold_1();
  result = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 0, 0);
  if (result != -1)
    *(float *)a1[result + 16].i32 = a3;
  return result;
}

uint64_t SSCompactRankingAttrsAddInt64Array(int8x8_t *a1, uint64_t a2, const void *a3, int a4)
{
  _QWORD *v8;
  uint64_t result;

  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0)
    SSCompactRankingAttrsAddInt64Array_cold_1();
  v8 = malloc_type_malloc(8 * (a4 + 1), 0x100004000313F17uLL);
  *v8 = a4;
  memcpy(v8 + 1, a3, 8 * a4);
  result = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 1, 0);
  if (result != -1)
    a1[result + 16] = (int8x8_t)v8;
  return result;
}

void SSCompactRankingAttrsAddInt64ArrayFromNSArray(int8x8_t *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0)
    SSCompactRankingAttrsAddInt64ArrayFromNSArray_cold_1();
  v6 = v5;
  v7 = objc_msgSend(v5, "count");
  v8 = malloc_type_malloc(8 * v7 + 8, 0x100004000313F17uLL);
  *v8 = v7;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = 1;
    do
    {
      v14 = 0;
      v15 = v13;
      v16 = &v8[v13];
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v16[v14] = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "integerValue", (_QWORD)v18);
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v13 = v15 + v14;
    }
    while (v11);
  }

  v17 = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 1, 0);
  if (v17 != -1)
    a1[v17 + 16] = (int8x8_t)v8;

}

uint64_t SSCompactRankingAttrsAddInt128(int8x8_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  uint64_t result;

  if ((_SpotlightDefineRankingTypes_[a2] & 0x40) == 0)
    SSCompactRankingAttrsAddInt128_cold_1();
  v8 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  *v8 = a3;
  v8[1] = a4;
  result = _SSCompactRankingAttrsDataIndexForInsert(a1, a2, 1, 0);
  if (result != -1)
    a1[result + 16] = (int8x8_t)v8;
  return result;
}

void SSCompactRankingAttrsUpdateValue(int8x8_t *a1, unint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  int8x8_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int8x8_t *v12;
  int8x8_t v13;
  uint8x8_t v14;
  uint8x8_t v15;
  uint64_t v16;
  int8x8_t *v17;
  id v18;

  v5 = a3;
  if (!a1)
    goto LABEL_17;
  v6 = 1 << a2;
  if ((uint64_t)a2 < 64)
  {
    v7 = a1[1];
    if ((*(_QWORD *)&v7 & v6) == 0)
      goto LABEL_17;
    v8 = 0;
    goto LABEL_15;
  }
  v9 = 2;
  v10 = 3;
  if (a2 >= 0x100)
    v10 = 4;
  if (a2 >= 0xC0)
    v9 = v10;
  if (a2 >= 0x80)
    v11 = v9;
  else
    v11 = 1;
  v7 = a1[v11 + 1];
  if ((*(_QWORD *)&v7 & v6) != 0)
  {
    v8 = 0;
    v12 = a1 + 1;
    do
    {
      v13 = *v12++;
      v14 = (uint8x8_t)vcnt_s8(v13);
      v14.i16[0] = vaddlv_u8(v14);
      v8 += v14.u32[0];
      --v11;
    }
    while (v11);
LABEL_15:
    v15 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v7 & (v6 - 1)));
    v15.i16[0] = vaddlv_u8(v15);
    v16 = v15.u32[0] + v8;
    if (v16 != -1)
    {
      v17 = &a1[v16];
      v18 = v5;
      CFRelease(*(CFTypeRef *)&v17[16]);
      v17[16] = (int8x8_t)v18;
      v5 = v18;
    }
  }
LABEL_17:

}

int8x8_t *SSCompactRankingAttrsUpdateFloat(int8x8_t *result, unint64_t a2, float a3)
{
  uint64_t v3;
  int8x8_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x8_t *v9;
  int8x8_t v10;
  uint8x8_t v11;
  uint8x8_t v12;
  uint64_t v13;

  if ((_SpotlightDefineRankingTypes_[a2] & 0x10) == 0)
    SSCompactRankingAttrsUpdateFloat_cold_1();
  if (result)
  {
    v3 = 1 << a2;
    if ((uint64_t)a2 < 64)
    {
      v4 = result[1];
      if ((*(_QWORD *)&v4 & v3) == 0)
        return result;
      v5 = 0;
      goto LABEL_16;
    }
    v6 = 2;
    v7 = 3;
    if (a2 >= 0x100)
      v7 = 4;
    if (a2 >= 0xC0)
      v6 = v7;
    if (a2 >= 0x80)
      v8 = v6;
    else
      v8 = 1;
    v4 = result[v8 + 1];
    if ((*(_QWORD *)&v4 & v3) != 0)
    {
      v5 = 0;
      v9 = result + 1;
      do
      {
        v10 = *v9++;
        v11 = (uint8x8_t)vcnt_s8(v10);
        v11.i16[0] = vaddlv_u8(v11);
        v5 += v11.u32[0];
        --v8;
      }
      while (v8);
LABEL_16:
      v12 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v4 & (v3 - 1)));
      v12.i16[0] = vaddlv_u8(v12);
      v13 = v12.u32[0] + v5;
      if (v13 != -1)
        *(float *)result[v13 + 16].i32 = a3;
    }
  }
  return result;
}

void SSCompactRankingAttrsUpdateInt64Array(int8x8_t *a1, unint64_t a2, const void *a3, int a4)
{
  uint64_t v7;
  int8x8_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int8x8_t *v13;
  int8x8_t v14;
  uint8x8_t v15;
  uint8x8_t v16;
  uint64_t v17;
  _QWORD *v18;
  int8x8_t *v19;

  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0)
    SSCompactRankingAttrsUpdateInt64Array_cold_1();
  if (a1)
  {
    v7 = 1 << a2;
    if ((uint64_t)a2 < 64)
    {
      v8 = a1[1];
      if ((*(_QWORD *)&v8 & v7) == 0)
        return;
      v9 = 0;
      goto LABEL_16;
    }
    v10 = 2;
    v11 = 3;
    if (a2 >= 0x100)
      v11 = 4;
    if (a2 >= 0xC0)
      v10 = v11;
    if (a2 >= 0x80)
      v12 = v10;
    else
      v12 = 1;
    v8 = a1[v12 + 1];
    if ((*(_QWORD *)&v8 & v7) != 0)
    {
      v9 = 0;
      v13 = a1 + 1;
      do
      {
        v14 = *v13++;
        v15 = (uint8x8_t)vcnt_s8(v14);
        v15.i16[0] = vaddlv_u8(v15);
        v9 += v15.u32[0];
        --v12;
      }
      while (v12);
LABEL_16:
      v16 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v8 & (v7 - 1)));
      v16.i16[0] = vaddlv_u8(v16);
      v17 = v16.u32[0] + v9;
      if (v17 != -1)
      {
        v18 = malloc_type_malloc(8 * (a4 + 1), 0x100004000313F17uLL);
        *v18 = a4;
        memcpy(v18 + 1, a3, 8 * a4);
        v19 = &a1[v17];
        free(*(void **)&v19[16]);
        v19[16] = (int8x8_t)v18;
      }
    }
  }
}

void SSCompactRankingAttrsUpdateInt64ArrayFromNSArray(int8x8_t *a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  int8x8_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int8x8_t *v13;
  int8x8_t v14;
  uint8x8_t v15;
  uint8x8_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  _QWORD *v27;
  int8x8_t *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0)
    SSCompactRankingAttrsUpdateInt64ArrayFromNSArray_cold_1();
  v6 = v5;
  if (a1)
  {
    v7 = 1 << a2;
    if ((uint64_t)a2 < 64)
    {
      v8 = a1[1];
      if ((*(_QWORD *)&v8 & v7) == 0)
        goto LABEL_25;
      v9 = 0;
      goto LABEL_16;
    }
    v10 = 2;
    v11 = 3;
    if (a2 >= 0x100)
      v11 = 4;
    if (a2 >= 0xC0)
      v10 = v11;
    if (a2 >= 0x80)
      v12 = v10;
    else
      v12 = 1;
    v8 = a1[v12 + 1];
    if ((*(_QWORD *)&v8 & v7) != 0)
    {
      v9 = 0;
      v13 = a1 + 1;
      do
      {
        v14 = *v13++;
        v15 = (uint8x8_t)vcnt_s8(v14);
        v15.i16[0] = vaddlv_u8(v15);
        v9 += v15.u32[0];
        --v12;
      }
      while (v12);
LABEL_16:
      v16 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v8 & (v7 - 1)));
      v16.i16[0] = vaddlv_u8(v16);
      v17 = v16.u32[0] + v9;
      if (v17 != -1)
      {
        v18 = objc_msgSend(v5, "count");
        v19 = malloc_type_malloc(8 * v18 + 8, 0x100004000313F17uLL);
        *v19 = v18;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v20 = v6;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v30;
          v24 = 1;
          do
          {
            v25 = 0;
            v26 = v24;
            v27 = &v19[v24];
            do
            {
              if (*(_QWORD *)v30 != v23)
                objc_enumerationMutation(v20);
              v27[v25] = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v25), "integerValue", (_QWORD)v29);
              ++v25;
            }
            while (v22 != v25);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            v24 = v26 + v25;
          }
          while (v22);
        }

        v28 = &a1[v17];
        free(*(void **)&v28[16]);
        v28[16] = (int8x8_t)v19;
      }
    }
  }
LABEL_25:

}

void SSCompactRankingAttrsUpdateInt128(int8x8_t *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  int8x8_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int8x8_t *v13;
  int8x8_t v14;
  uint8x8_t v15;
  uint8x8_t v16;
  uint64_t v17;
  _QWORD *v18;
  int8x8_t *v19;

  if ((_SpotlightDefineRankingTypes_[a2] & 0x40) == 0)
    SSCompactRankingAttrsUpdateInt128_cold_1();
  if (a1)
  {
    v7 = 1 << a2;
    if ((uint64_t)a2 < 64)
    {
      v8 = a1[1];
      if ((*(_QWORD *)&v8 & v7) == 0)
        return;
      v9 = 0;
      goto LABEL_16;
    }
    v10 = 2;
    v11 = 3;
    if (a2 >= 0x100)
      v11 = 4;
    if (a2 >= 0xC0)
      v10 = v11;
    if (a2 >= 0x80)
      v12 = v10;
    else
      v12 = 1;
    v8 = a1[v12 + 1];
    if ((*(_QWORD *)&v8 & v7) != 0)
    {
      v9 = 0;
      v13 = a1 + 1;
      do
      {
        v14 = *v13++;
        v15 = (uint8x8_t)vcnt_s8(v14);
        v15.i16[0] = vaddlv_u8(v15);
        v9 += v15.u32[0];
        --v12;
      }
      while (v12);
LABEL_16:
      v16 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v8 & (v7 - 1)));
      v16.i16[0] = vaddlv_u8(v16);
      v17 = v16.u32[0] + v9;
      if (v17 != -1)
      {
        v18 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
        *v18 = a3;
        v18[1] = a4;
        v19 = &a1[v17];
        free(*(void **)&v19[16]);
        v19[16] = (int8x8_t)v18;
      }
    }
  }
}

int8x8_t *SSCompactRankingAttrsDoesItemExist(int8x8_t *result, unint64_t a2)
{
  uint64_t v2;
  int8x8_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint8x8_t v11;

  if (result)
  {
    v2 = 1 << a2;
    if ((uint64_t)a2 >= 64)
    {
      v5 = 2;
      v6 = 3;
      if (a2 >= 0x100)
        v6 = 4;
      if (a2 >= 0xC0)
        v5 = v6;
      if (a2 >= 0x80)
        v7 = v5;
      else
        v7 = 1;
      v3 = result[v7 + 1];
      if ((*(_QWORD *)&v3 & v2) != 0)
      {
        v4 = 0;
        v8 = result + 1;
        do
        {
          v9 = *v8++;
          v10 = (uint8x8_t)vcnt_s8(v9);
          v10.i16[0] = vaddlv_u8(v10);
          v4 += v10.u32[0];
          --v7;
        }
        while (v7);
        goto LABEL_15;
      }
    }
    else
    {
      v3 = result[1];
      if ((*(_QWORD *)&v3 & v2) != 0)
      {
        v4 = 0;
LABEL_15:
        v11 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v3 & (v2 - 1)));
        v11.i16[0] = vaddlv_u8(v11);
        return (int8x8_t *)(v11.u32[0] + v4 >= 0);
      }
    }
    return 0;
  }
  return result;
}

int8x8_t *SSCompactRankingAttrsGetValue(int8x8_t *a1, unint64_t a2)
{
  uint64_t v2;
  int8x8_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint8x8_t v11;

  if (!a1)
    return a1;
  v2 = 1 << a2;
  if ((uint64_t)a2 >= 64)
  {
    v5 = 2;
    v6 = 3;
    if (a2 >= 0x100)
      v6 = 4;
    if (a2 >= 0xC0)
      v5 = v6;
    if (a2 >= 0x80)
      v7 = v5;
    else
      v7 = 1;
    v3 = a1[v7 + 1];
    if ((*(_QWORD *)&v3 & v2) == 0)
      return (int8x8_t *)0;
    v4 = 0;
    v8 = a1 + 1;
    do
    {
      v9 = *v8++;
      v10 = (uint8x8_t)vcnt_s8(v9);
      v10.i16[0] = vaddlv_u8(v10);
      v4 += v10.u32[0];
      --v7;
    }
    while (v7);
  }
  else
  {
    v3 = a1[1];
    if ((*(_QWORD *)&v3 & v2) == 0)
      return (int8x8_t *)0;
    v4 = 0;
  }
  v11 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_QWORD *)&v3 & (v2 - 1)));
  v11.i16[0] = vaddlv_u8(v11);
  if (v11.u32[0] + v4 >= 0)
  {
    a1 = (int8x8_t *)a1[v11.u32[0] + 16 + v4];
    return a1;
  }
  return (int8x8_t *)0;
}

uint64_t SSCompactRankingAttrsGetFloat(uint64_t result, unint64_t a2, _DWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x8_t *v9;
  int8x8_t v10;
  uint8x8_t v11;
  uint8x8_t v12;

  if ((_SpotlightDefineRankingTypes_[a2] & 0x10) == 0)
    SSCompactRankingAttrsGetFloat_cold_1();
  if (result)
  {
    v3 = 1 << a2;
    if ((uint64_t)a2 >= 64)
    {
      v6 = 2;
      v7 = 3;
      if (a2 >= 0x100)
        v7 = 4;
      if (a2 >= 0xC0)
        v6 = v7;
      if (a2 >= 0x80)
        v8 = v6;
      else
        v8 = 1;
      v4 = *(_QWORD *)(result + 8 * v8 + 8);
      if ((v4 & v3) != 0)
      {
        v5 = 0;
        v9 = (int8x8_t *)(result + 8);
        do
        {
          v10 = *v9++;
          v11 = (uint8x8_t)vcnt_s8(v10);
          v11.i16[0] = vaddlv_u8(v11);
          v5 += v11.u32[0];
          --v8;
        }
        while (v8);
LABEL_16:
        v12 = (uint8x8_t)vcnt_s8((int8x8_t)(v4 & (v3 - 1)));
        v12.i16[0] = vaddlv_u8(v12);
        if (v12.u32[0] + v5 >= 0)
        {
          *a3 = *(_DWORD *)(result + 8 * (v12.u32[0] + v5) + 128);
          return 1;
        }
      }
    }
    else
    {
      v4 = *(_QWORD *)(result + 8);
      if ((v4 & v3) != 0)
      {
        v5 = 0;
        goto LABEL_16;
      }
    }
    return 0;
  }
  return result;
}

uint64_t SSCompactRankingAttrsGetInt128(uint64_t result, unint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x8_t *v9;
  int8x8_t v10;
  uint8x8_t v11;
  uint8x8_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((_SpotlightDefineRankingTypes_[a2] & 0x40) == 0)
    SSCompactRankingAttrsGetInt128_cold_1();
  if (result)
  {
    v3 = 1 << a2;
    if ((uint64_t)a2 >= 64)
    {
      v6 = 2;
      v7 = 3;
      if (a2 >= 0x100)
        v7 = 4;
      if (a2 >= 0xC0)
        v6 = v7;
      if (a2 >= 0x80)
        v8 = v6;
      else
        v8 = 1;
      v4 = *(_QWORD *)(result + 8 * v8 + 8);
      if ((v4 & v3) != 0)
      {
        v5 = 0;
        v9 = (int8x8_t *)(result + 8);
        do
        {
          v10 = *v9++;
          v11 = (uint8x8_t)vcnt_s8(v10);
          v11.i16[0] = vaddlv_u8(v11);
          v5 += v11.u32[0];
          --v8;
        }
        while (v8);
LABEL_16:
        v12 = (uint8x8_t)vcnt_s8((int8x8_t)(v4 & (v3 - 1)));
        v12.i16[0] = vaddlv_u8(v12);
        v13 = v12.u32[0] + v5;
        if (v13 >= 0)
        {
          v14 = *(_QWORD *)(*(_QWORD *)(result + 8 * v13 + 128) + 8);
          *a3 = **(_QWORD **)(result + 8 * v13 + 128);
          a3[1] = v14;
          return 1;
        }
      }
    }
    else
    {
      v4 = *(_QWORD *)(result + 8);
      if ((v4 & v3) != 0)
      {
        v5 = 0;
        goto LABEL_16;
      }
    }
    return 0;
  }
  return result;
}

uint64_t SSCompactRankingAttrsGetArrayInt64(uint64_t result, unint64_t a2, void *__dst, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int8x8_t *v10;
  int8x8_t v11;
  uint8x8_t v12;
  uint8x8_t v13;
  _QWORD *v14;

  if ((_SpotlightDefineRankingTypes_[a2] & 0x20) == 0)
    SSCompactRankingAttrsGetArrayInt64_cold_1();
  if (result)
  {
    v4 = 1 << a2;
    if ((uint64_t)a2 >= 64)
    {
      v7 = 2;
      v8 = 3;
      if (a2 >= 0x100)
        v8 = 4;
      if (a2 >= 0xC0)
        v7 = v8;
      if (a2 >= 0x80)
        v9 = v7;
      else
        v9 = 1;
      v5 = *(_QWORD *)(result + 8 * v9 + 8);
      if ((v5 & v4) != 0)
      {
        v6 = 0;
        v10 = (int8x8_t *)(result + 8);
        do
        {
          v11 = *v10++;
          v12 = (uint8x8_t)vcnt_s8(v11);
          v12.i16[0] = vaddlv_u8(v12);
          v6 += v12.u32[0];
          --v9;
        }
        while (v9);
LABEL_16:
        v13 = (uint8x8_t)vcnt_s8((int8x8_t)(v5 & (v4 - 1)));
        v13.i16[0] = vaddlv_u8(v13);
        if (v13.u32[0] + v6 >= 0)
        {
          v14 = *(_QWORD **)(result + 8 * (v13.u32[0] + v6) + 128);
          if (*v14 == a4)
          {
            memcpy(__dst, v14 + 1, 8 * *v14);
            return 1;
          }
        }
      }
    }
    else
    {
      v5 = *(_QWORD *)(result + 8);
      if ((v5 & v4) != 0)
      {
        v6 = 0;
        goto LABEL_16;
      }
    }
    return 0;
  }
  return result;
}

uint64_t SSCompactRankingAttrsGetCount(uint64_t result)
{
  uint64_t v1;
  int64x2_t v2;

  if (result)
  {
    v1 = 0;
    v2 = 0uLL;
    do
    {
      v2 = (int64x2_t)vpadalq_u32((uint64x2_t)v2, vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(result + 8 + v1)))));
      v1 += 16;
    }
    while (v1 != 32);
    return vaddvq_s64(v2);
  }
  return result;
}

void SSCompactRankingAttrsInsertValue(int8x8_t *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  float v8;
  id v9;
  void *v10;
  char isKindOfClass;
  id v12;
  const void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = v5;
  v7 = _SpotlightDefineRankingTypes_[a2];
  if (v7 > 15)
  {
    switch(v7)
    {
      case 16:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "floatValue");
          SSCompactRankingAttrsAddFloat(a1, a2, v8);
        }
        break;
      case 32:
        v9 = v5;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v9, "count")
          && (objc_msgSend(v9, "objectAtIndexedSubscript:", 0),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v10,
              (isKindOfClass & 1) != 0))
        {
          SSCompactRankingAttrsAddInt64ArrayFromNSArray(a1, a2, v9);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = objc_retainAutorelease(v9);
            v13 = (const void *)objc_msgSend(v12, "bytes");
            v14 = objc_msgSend(v12, "length");

            SSCompactRankingAttrsAddInt64Array(a1, a2, v13, v14 >> 3);
          }
        }

        break;
      case 64:
        v15 = 0;
        v16 = 0;
        ranking_index_score_init(&v15, v5);
        SSCompactRankingAttrsAddInt128(a1, a2, v15, v16);
        break;
    }
  }
  else if ((v7 - 8) < 6)
  {
    SSCompactRankingAttrsAddValue(a1, a2, v5);
  }

}

uint64_t _featureInfoEqual(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, "isEqualToString:", *a2);
}

CFHashCode _featureInfoHash(CFTypeRef *a1)
{
  return CFHash(*a1);
}

void sub_1B87740F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

BOOL getBoolFromFlaggedFeature(int a1, int a2, int a3)
{
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  int v7;

  if (a1 == 1965)
    v3 = 4;
  else
    v3 = a1 == 1931;
  if (a1 == 1966)
    v4 = 2;
  else
    v4 = v3;
  if (a1 == 1854)
    v5 = 32;
  else
    v5 = 0;
  if (a1 == 1853)
    v6 = 8;
  else
    v6 = v5;
  if (a1 == 1852)
    v7 = 16;
  else
    v7 = v6;
  if (a1 <= 1930)
    v4 = v7;
  return (a3 & (v4 >> 1)) != 0 && (v4 & a2) != 0;
}

void decodeRankingScores(unsigned __int8 *a1, int a2, char *__dst)
{
  uint64_t v6;
  int v7;
  unsigned __int8 *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  float v13;
  unsigned int v14;

  memcpy(__dst, sDefaultScores, 0x328CuLL);
  if (a2)
  {
    v6 = 0;
    v7 = 0;
    v8 = a1;
    do
    {
      v10 = *v8++;
      v9 = v10;
      v11 = v10 & 0xC0;
      v12 = v10 & 0x3F;
      if (v11 == 64)
      {
        v13 = (float)v12;
        if (v12 == 63)
          v13 = 2147500000.0;
        *(float *)&__dst[4 * v6] = v13;
        goto LABEL_16;
      }
      if (v12)
      {
        v14 = v9 & 0x1F;
        if ((v9 & 0x20) != 0)
        {
          v8 = a1 + 2;
          v14 = a1[1] | (v14 << 8);
        }
        if (v11)
        {
LABEL_11:
          if (v9 >= 0xC0)
            bzero(&__dst[4 * v6], 4 * v14 + 4);
          goto LABEL_15;
        }
      }
      else
      {
        v14 = 0;
        if (v11)
          goto LABEL_11;
      }
      memcpy(&__dst[4 * v6], v8, 4 * v14 + 4);
      v8 += 4 * v14 + 4;
LABEL_15:
      v7 += v14;
LABEL_16:
      v6 = (unsigned __int16)++v7;
      a1 = v8;
    }
    while ((unsigned __int16)v7 < 0xCA3u);
  }
}

void sub_1B8776850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

id operatorCharacterSet()
{
  if (operatorCharacterSet_onceToken != -1)
    dispatch_once(&operatorCharacterSet_onceToken, &__block_literal_global_49);
  return (id)operatorCharacterSet_operatorCharSet;
}

void __operatorCharacterSet_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("()/*+-"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)operatorCharacterSet_operatorCharSet;
  operatorCharacterSet_operatorCharSet = v0;

}

id suffixTrimSetForMathQueries()
{
  if (suffixTrimSetForMathQueries_onceToken != -1)
    dispatch_once(&suffixTrimSetForMathQueries_onceToken, &__block_literal_global_24);
  return (id)suffixTrimSetForMathQueries_sMathCharacterSet;
}

void __suffixTrimSetForMathQueries_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v0, "mutableCopy");

  operatorCharacterSet();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v1);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v2);

  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)suffixTrimSetForMathQueries_sMathCharacterSet;
  suffixTrimSetForMathQueries_sMathCharacterSet = v3;

}

uint64_t looksLikeMath(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = a1;
  if (looksLikeMath_onceToken != -1)
    dispatch_once(&looksLikeMath_onceToken, &__block_literal_global_25_1);
  v2 = objc_msgSend(v1, "rangeOfCharacterFromSet:", looksLikeMath_alphaCharacterSet);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v1, "rangeOfCharacterFromSet:", looksLikeMath_mathCharacterSet) != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      v6 = 1;
      goto LABEL_17;
    }
  }
  else if (v2 || v3 != objc_msgSend(v1, "length"))
  {
    suffixTrimSetForMathQueries();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v1, "rangeOfCharacterFromSet:", v4);

    if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 != objc_msgSend(v1, "length") - 1)
      goto LABEL_8;
  }
  v7 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:", looksLikeMath_numbersCharacterSet, 8);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7 + v8;
    if (v7 + v8 < (unint64_t)objc_msgSend(v1, "length"))
    {
      while (1)
      {
        v10 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:range:", looksLikeMath_xCharacterSet, 8, v9, objc_msgSend(v1, "length") - v9);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v12 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:range:", looksLikeMath_numbersCharacterSet, 8, v10 + v11, objc_msgSend(v1, "length") - (v10 + v11));
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v14 = v12;
        v9 = v12 + v13;
        if (v12 + v13 >= (unint64_t)objc_msgSend(v1, "length"))
        {
          v6 = v14 != 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_17;
        }
      }
    }
  }
  v6 = 0;
LABEL_17:
  v15 = v6 & (objc_msgSend(v1, "hasPrefix:", CFSTR("0x")) ^ 1);

  return v15;
}

void __looksLikeMath_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  suffixTrimSetForMathQueries();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "formUnionWithCharacterSet:", v1);

  v2 = objc_msgSend(v12, "copy");
  v3 = (void *)looksLikeMath_mathCharacterSet;
  looksLikeMath_mathCharacterSet = v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)looksLikeMath_alphaCharacterSet;
  looksLikeMath_alphaCharacterSet = v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("x"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)looksLikeMath_xCharacterSet;
  looksLikeMath_xCharacterSet = v6;

  objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)looksLikeMath_numbersCharacterSet;
  looksLikeMath_numbersCharacterSet = v8;

  v10 = (void *)looksLikeMath_numbersCharacterSet;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".,"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "formUnionWithCharacterSet:", v11);

}

BOOL looksLikeURL(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v1 = a1;
  if (objc_msgSend(v1, "rangeOfString:", CFSTR(" ")) != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("://"));
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "substringFromIndex:", v2 + v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v4;
  }
  v5 = objc_msgSend(v1, "rangeOfString:", CFSTR("/"));
  if (objc_msgSend(v1, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v1, "substringToIndex:", v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v7;
    }
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = _CFHostIsDomainTopLevel() != 0;
  }
  else
  {
LABEL_5:
    v6 = 0;
  }

  return v6;
}

BOOL hasDigit(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = hasDigit_digitsOnceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&hasDigit_digitsOnceToken, &__block_literal_global_40);
  v3 = objc_msgSend(v2, "rangeOfCharacterFromSet:", hasDigit_digits);

  return v3 != 0x7FFFFFFFFFFFFFFFLL;
}

void __hasDigit_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hasDigit_digits;
  hasDigit_digits = v0;

}

id SSDisplayNameFuzzyQuery(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("cwdt");
  v5 = a1;
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("f070"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), *MEMORY[0x1E0CA6158], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id SSDisplayNameAdditionsQuery(void *a1, void *a2, char a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a1;
  v6 = a2;
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("cwdt");
  v8 = (void *)MEMORY[0x1E0CB3940];
  if ((a3 & 1) != 0)
  {
    SSDisplayNameFuzzyQuery(v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("(kMDItemDisplayNameCorrections=\"%@*\"%@ || %@)"), v5, CFSTR("cd"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemDisplayNameCorrections=\"%@*\"%@)"), v5, CFSTR("cd"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id SSNormalizedQueryString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v1, "stringByFoldingWithOptions:locale:", 385, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "length", (_QWORD)v14))
          objc_msgSend(v2, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id SSEscapedStringForSearchQuery(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "decomposedStringWithCanonicalMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\""), CFSTR("\\\""), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("\\'"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("*"), CFSTR("\\*"), 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

BOOL SSStringStartsWithDoubleQuote(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
    v2 = objc_msgSend(v1, "characterAtIndex:", 0) == 34
      || objc_msgSend(v1, "characterAtIndex:", 0) == 8220;
  else
    v2 = 0;

  return v2;
}

BOOL SSStringEndsWithDoubleQuote(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") < 2)
    v2 = 0;
  else
    v2 = objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1) == 34
      || objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1) == 8221;

  return v2;
}

uint64_t SSStringEndsWithSpace(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1));

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id SSQueryEscapeString(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "escapedStringForSearchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapNonEmpty:", &__block_literal_global_57_1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_retainAutorelease(v6);
    *a2 = v7;

  }
  return v3;
}

id SSPhraseQueryEscapeString(void *a1, _QWORD *a2)
{
  id v3;
  _BOOL4 v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a1;
  v4 = SSStringStartsWithDoubleQuote(v3);
  v5 = SSStringEndsWithDoubleQuote(v3);
  if (v4)
  {
    if (v5)
      objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 2);
    else
      objc_msgSend(v3, "substringFromIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v6 = (void *)objc_msgSend(v3, "copy");
  }
  objc_msgSend(v6, "escapedStringForSearchQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mapNonEmpty:", &__block_literal_global_58_1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    *a2 = v12;

  }
  return v8;
}

id SSPhraseQueryUnquoteString(void *a1)
{
  id v1;
  _BOOL4 v2;
  BOOL v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = SSStringStartsWithDoubleQuote(v1);
  v3 = SSStringEndsWithDoubleQuote(v1);
  if (v2)
  {
    if (v3)
      objc_msgSend(v1, "substringWithRange:", 1, objc_msgSend(v1, "length") - 2);
    else
      objc_msgSend(v1, "substringFromIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v4 = (void *)objc_msgSend(v1, "copy");
  }

  return v4;
}

id SSQueryDisplayNameFuzzyQuery(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("cwdt");
  v5 = a1;
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("f070"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@*\"%@"), *MEMORY[0x1E0CA6158], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t findIndexOfFirstGreaterOrEqualInRange(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;

  while (a3 <= a4)
  {
    v4 = (a4 + a3) >> 1;
    if (*(_QWORD *)(a2 + 8 * v4) >= a1)
    {
      if (a4 + a3 < 2)
        return v4;
      a4 = v4 - 1;
      if (*(_QWORD *)(a2 + 8 * (v4 - 1)) < a1)
        return v4;
    }
    else
    {
      a3 = v4 + 1;
    }
  }
  return 0x7FFFFFFFLL;
}

uint64_t findMin(uint64_t result, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;

  if (a2)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0x7FFFFFFFLL;
    do
    {
      if (v4)
        v7 = *(_QWORD *)(result + 8 * v4) >= v5;
      else
        v7 = 0;
      if (!v7)
      {
        v5 = *(_QWORD *)(result + 8 * v4);
        v6 = v4;
      }
      ++v4;
    }
    while (a2 != v4);
  }
  else
  {
    v5 = 0;
    v6 = 0x7FFFFFFFLL;
  }
  *a3 = v5;
  *a4 = v6;
  return result;
}

uint64_t minSpanLenContainingPair(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = 0x7FFFFFFFLL;
  if (a2 && a4)
  {
    v5 = 0;
    v6 = 0;
    v9 = *a3;
    v7 = a3 + 1;
    v8 = v9;
    v4 = -1;
    while (1)
    {
      v10 = *(_QWORD *)(a1 + 8 * v5);
      while (1)
      {
        v11 = v8 - v10;
        if (v10 > v8)
          v11 = v10 - v8;
        if (v11 < v4 || v4 == -1)
          v4 = v11;
        if (v10 < v8)
          break;
        if (a4 - 1 == v6)
          return v4;
        v8 = v7[v6++];
      }
      if (v5 == a2 - 1)
        break;
      ++v5;
    }
  }
  return v4;
}

id PRSLogCategoryAnonymousPipeline()
{
  if (PRSLogCategoryAnonymousPipeline_onceToken != -1)
    dispatch_once(&PRSLogCategoryAnonymousPipeline_onceToken, &__block_literal_global_2);
  return (id)PRSLogCategoryAnonymousPipeline_anonymousPipelineLog;
}

void sub_1B877D148(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B877D7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void ranking_index_score_init(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "length") == 16)
    {
      v3 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
      v4 = v3[1];
      *a1 = *v3;
      a1[1] = v4;
    }
  }

}

float getNumReviews(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  int v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  float v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  float v33;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v16 = -1.0;
    goto LABEL_54;
  }
  v3 = objc_msgSend(v1, "length");
  if (v3 < 2)
  {
    objc_msgSend(v2, "floatValue");
    v16 = v17;
    goto LABEL_54;
  }
  v4 = v3;
  v5 = v3 - 1;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:", v6, 4);

  if (v7 + 1 < v4)
    v8 = v7 + 1;
  else
    v8 = v5;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = v5;
  else
    v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 <= v4)
    v11 = v4;
  else
    v11 = v9;
  while (v11 != v9)
  {
    v12 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v2, "characterAtIndex:", v9));
    v13 = v9 + 1;
    if (v5 != v9)
    {
      ++v9;
      if ((v12 & 1) != 0)
        continue;
    }
    v11 = v13 - 1;
    break;
  }
  v14 = objc_msgSend(v2, "characterAtIndex:", v11);
  if (v14 > 76)
  {
    if (v14 == 84)
    {
      v15 = 1.0e12;
      goto LABEL_47;
    }
    if (v14 == 77)
    {
      v15 = 1000000.0;
      goto LABEL_47;
    }
LABEL_27:
    v15 = 1.0;
    if (v11 < v4)
    {
      v18 = 0;
      while (1)
      {
        v19 = sLargeNumberStringList[v18];
        if (!-[__CFString length](v19, "length"))
        {

          v15 = 1.0;
          goto LABEL_47;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", v19, &stru_1E6E549F0, CFSTR("LargeNumberMultipliers"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = 1.0;
        if (!v21 || !objc_msgSend(v21, "length") || (objc_msgSend(v21, "isEqualToString:", v19) & 1) != 0)
          break;
        if (objc_msgSend(v21, "length") + v11 <= v4)
        {
          objc_msgSend(v2, "substringWithRange:", v11, objc_msgSend(v21, "length"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "hasPrefix:", v21))
          {
            v23 = sLargeNumberMultiplierList[v18];
            if (-[__CFString length](v23, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "localizedStringForKey:value:table:", v23, &stru_1E6E549F0, CFSTR("LargeNumberMultipliers"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25 && objc_msgSend(v25, "length") && (objc_msgSend(v25, "isEqualToString:", v23) & 1) == 0)
              {
                objc_msgSend(v25, "floatValue");
                v15 = v26;
              }

            }
            break;
          }

        }
        if (++v18 == 5)
          goto LABEL_47;
      }

    }
    goto LABEL_47;
  }
  if (v14 == 66)
  {
    v15 = 1000000000.0;
    goto LABEL_47;
  }
  if (v14 != 75)
    goto LABEL_27;
  v15 = 1000.0;
LABEL_47:
  if (v11 >= v5)
    v27 = v5;
  else
    v27 = v11;
  if (v15 == 1.0)
    v28 = v27 + 1;
  else
    v28 = v27;
  objc_msgSend(v2, "substringWithRange:", 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLocale:", v31);

  objc_msgSend(v30, "setNumberStyle:", 1);
  objc_msgSend(v30, "numberFromString:", v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "floatValue");
  v16 = v15 * v33;

LABEL_54:
  return v16;
}

float getNumReviewsInParens(void *a1)
{
  id v1;
  void *v2;
  float NumReviews;
  int v4;
  int v5;
  void *v6;

  v1 = a1;
  v2 = v1;
  NumReviews = -1.0;
  if (v1)
  {
    if ((unint64_t)objc_msgSend(v1, "length") >= 3)
    {
      v4 = objc_msgSend(v2, "characterAtIndex:", 0);
      v5 = objc_msgSend(v2, "characterAtIndex:", objc_msgSend(v2, "length") - 1);
      if (v4 == 40 && v5 == 41)
      {
        objc_msgSend(v2, "substringWithRange:", 1, objc_msgSend(v2, "length") - 2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        NumReviews = getNumReviews(v6);

      }
    }
  }

  return NumReviews;
}

float getReviewRating(void *a1)
{
  id v1;
  void *v2;
  float v3;
  void *v4;
  void *v5;
  float v6;

  v1 = a1;
  v2 = v1;
  v3 = -1.0;
  if (v1
    && (unint64_t)objc_msgSend(v1, "length") >= 2
    && objc_msgSend(v2, "characterAtIndex:", objc_msgSend(v2, "length") - 1) == 37)
  {
    objc_msgSend(v2, "substringWithRange:", 0, objc_msgSend(v2, "length") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length"))
    {
      objc_msgSend(v5, "floatValue");
      v3 = v6 * 0.01;
    }

  }
  return v3;
}

id getDetailedRowCardSection(void *a1, unint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a1;
  objc_msgSend(v3, "inlineCard");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "inlineCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSections");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      goto LABEL_8;
    }
    v8 = (void *)v7;
    objc_msgSend(v3, "inlineCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 > a2)
    {
      objc_msgSend(v3, "inlineCard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cardSections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v5;
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      v14 = 0;
      goto LABEL_9;
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

id getDetailedRowCardSectionTitle(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  getDetailedRowCardSection(a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    goto LABEL_5;
  objc_msgSend(v1, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v2, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "text");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_5:
    v3 = 0;
  }
LABEL_6:

  return v3;
}

id getDetailedRowCardSectionDescription(void *a1, unint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  getDetailedRowCardSection(a1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(v3, "descriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "descriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a2)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "descriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

LABEL_9:
  return v5;
}

id getDetailedRowCardSectionDescriptionRichText(void *a1, unint64_t a2, unint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  getDetailedRowCardSection(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  objc_msgSend(v4, "descriptions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_9;
  objc_msgSend(v5, "descriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "descriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v10;
  else
    v6 = 0;

LABEL_9:
  return v6;
}

id getDetailedRowCardSectionFootnoteRichText(void *a1, unint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  getDetailedRowCardSection(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "footnote"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    objc_msgSend(v3, "footnote");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id getDetailedRowCardSectionDescriptionRichTextText(void *a1, unint64_t a2, unint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  getDetailedRowCardSectionDescriptionRichText(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id getDetailedRowCardSectionDescriptionFormattedText(void *a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  getDetailedRowCardSectionDescriptionRichText(a1, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "formattedTextPieces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_9;
  objc_msgSend(v6, "formattedTextPieces");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= a4)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "formattedTextPieces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

LABEL_9:
  return v7;
}

id getDetailedRowCardSectionDescriptionMultipleFormattedTexts(void *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;

  getDetailedRowCardSectionDescriptionRichText(a1, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (objc_msgSend(v7, "formattedTextPieces"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9)
    && (objc_msgSend(v8, "formattedTextPieces"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11))
  {
    objc_msgSend(v8, "formattedTextPieces");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count") - 1;

    if (!a5)
    {
      objc_msgSend(v8, "formattedTextPieces");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      a5 = objc_msgSend(v14, "count");

    }
    objc_msgSend(v8, "formattedTextPieces");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 <= a4)
      a4 = 0;
    v17 = a4 + a5;
    objc_msgSend(v8, "formattedTextPieces");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v17 <= v19)
      v20 = v17;
    else
      v20 = v13;
    v21 = (void *)objc_opt_new();
    if (a4 < v20)
    {
      do
      {
        objc_msgSend(v8, "formattedTextPieces");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndex:", a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v23, "text");
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)v24;
            objc_msgSend(v23, "text");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "length");

            if (v27)
            {
              objc_msgSend(v23, "text");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "appendString:", v28);

            }
          }
        }

        ++a4;
      }
      while (v20 != a4);
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id getRichTitleCardSection(void *a1, unint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a1;
  objc_msgSend(v3, "inlineCard");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "inlineCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSections");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      goto LABEL_8;
    }
    v8 = (void *)v7;
    objc_msgSend(v3, "inlineCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 > a2)
    {
      objc_msgSend(v3, "inlineCard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cardSections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v5;
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      v14 = 0;
      goto LABEL_9;
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

id getRichTitleCardSectionTitle(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  getRichTitleCardSection(a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "title");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id getRichTitleCardSectionSubtitle(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  getRichTitleCardSection(a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "subtitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "subtitle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t getSocialMediaPostCardSection()
{
  return 0;
}

uint64_t getSocialMediaPostCardSectionName()
{
  return 0;
}

uint64_t getSocialMediaPostCardSectionPostRichText()
{
  return 0;
}

uint64_t getSocialMediaPostCardSectionPostFormattedText()
{
  return 0;
}

id getResultTitle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v1, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v1, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "text");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

id getResultURL(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v1 = a1;
  objc_msgSend(v1, "url");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(v1, "url"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        v3,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v1, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E6E549F0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("://"), &stru_1E6E549F0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && objc_msgSend(v11, "length"))
      v12 = v11;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id getDescriptionCardSection(void *a1, unint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a1;
  objc_msgSend(v3, "inlineCard");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "inlineCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSections");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      goto LABEL_8;
    }
    v8 = (void *)v7;
    objc_msgSend(v3, "inlineCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 > a2)
    {
      objc_msgSend(v3, "inlineCard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cardSections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v5;
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      v14 = 0;
      goto LABEL_9;
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

id getDescriptionCardSectionDescription(void *a1, unint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;

  getDescriptionCardSection(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_6;
  objc_msgSend(v2, "descriptionText");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  objc_msgSend(v3, "descriptionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "descriptionText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
LABEL_6:
    v9 = 0;
  }

  return v9;
}

id getCardSection(void *a1, unint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a1;
  objc_msgSend(v3, "inlineCard");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "inlineCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSections");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      goto LABEL_8;
    }
    v8 = (void *)v7;
    objc_msgSend(v3, "inlineCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 > a2)
    {
      objc_msgSend(v3, "inlineCard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cardSections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v5;
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      v14 = 0;
      goto LABEL_9;
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

id getScoreboardCardSection(void *a1, unint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a1;
  objc_msgSend(v3, "inlineCard");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "inlineCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSections");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      goto LABEL_8;
    }
    v8 = (void *)v7;
    objc_msgSend(v3, "inlineCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 > a2)
    {
      objc_msgSend(v3, "inlineCard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cardSections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v5;
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      v14 = 0;
      goto LABEL_9;
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

id getScoreboardCardSectionTitle(void *a1, unint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  getScoreboardCardSection(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "accessibilityDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "accessibilityDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id getDetailedRowCardSectionFootnoteText(void *a1, unint64_t a2)
{
  void *v2;
  void *v3;

  getDetailedRowCardSectionFootnoteRichText(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id getSecondNumberStr(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1;
  v4 = v3;
  if (v3
    && objc_msgSend(v3, "length")
    && (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5),
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v4, "substringFromIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v10);

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v9, "substringFromIndex:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v12);

        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v9, "substringFromIndex:", v11);
        else
          objc_msgSend(v7, "substringToIndex:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v14;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id getSecondLineFirstNumberStr(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1;
  v4 = v3;
  if (v3
    && objc_msgSend(v3, "length")
    && (objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5),
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v4, "substringFromIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v10);

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v9, "substringFromIndex:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v12);

        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v9, "substringFromIndex:", v11);
        else
          objc_msgSend(v7, "substringToIndex:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v14;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id getSuffixYearStr(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v1 = a1;
  v2 = v1;
  if (!v1
    || !objc_msgSend(v1, "length")
    || (objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:", v3, 4),
        v3,
        v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v5 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v2, "substringToIndex:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 4;
  v9 = v7;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:", v10, 4);
    v13 = v12;

    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 != 1)
      goto LABEL_14;
    if (v8 == 1)
      break;
    objc_msgSend(v9, "substringToIndex:", v11);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
LABEL_14:
    if (!--v8)
    {
      v5 = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend(v7, "substringWithRange:", v11, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_5:
  return v5;
}

float getNumYearsAgo(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  float v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = (float)(objc_msgSend(v4, "component:fromDate:", 4, v2) - a1);

  return v5;
}

id getPrefixYearStr(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v1 = a1;
  v2 = v1;
  if (!v1
    || !objc_msgSend(v1, "length")
    || (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v2, "rangeOfCharacterFromSet:", v3),
        v3,
        v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v5 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v2, "substringToIndex:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v7, "length"))
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = v7;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v12);

      if (v13)
      {
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_23;
        v10 = v13 + v8;
        v14 = v13 + 1;
        if (v14 < objc_msgSend(v11, "length"))
        {
          objc_msgSend(v11, "substringFromIndex:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          v9 = 1;
LABEL_19:

          v11 = (void *)v15;
          goto LABEL_20;
        }
        v9 = 1;
      }
      else
      {
        if ((unint64_t)objc_msgSend(v11, "length") < 2)
        {
          v15 = (uint64_t)v11;
        }
        else
        {
          objc_msgSend(v11, "substringFromIndex:", 1);
          v15 = objc_claimAutoreleasedReturnValue();

        }
        if (++v9 == 4)
        {
          objc_msgSend(v7, "substringWithRange:", v10, 4);
          v11 = v5;
          v14 = 1;
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        v11 = (void *)v15;
        v14 = 1;
      }
LABEL_20:
      v8 += v14;
      if (v8 >= objc_msgSend(v7, "length"))
        goto LABEL_23;
    }
  }
  v11 = v7;
LABEL_23:

LABEL_5:
  return v5;
}

id getCompletedQuery(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "completedQuery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "completedQuery");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id getCorrectedQuery(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "correctedQuery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "correctedQuery");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id getTextAfterDateAndSeparator(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v1 = a1;
  v2 = v1;
  if (v1
    && objc_msgSend(v1, "length")
    && (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v2, "rangeOfCharacterFromSet:", v3),
        v3,
        v4 != 0x7FFFFFFFFFFFFFFFLL)
    && (v5 = v4 + 1, v5 < objc_msgSend(v2, "length")))
  {
    objc_msgSend(v2, "substringFromIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v7);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL || (v9 = v8 + 1, v9 >= objc_msgSend(v6, "length")))
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v6, "substringFromIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v11);

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(v10, "substringToIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

float sMeanAccumulator_block_invoke(uint64_t a1, float *a2)
{
  uint64_t v2;
  int v3;
  float v4;
  float v5;
  float v6;
  BOOL v7;

  v2 = sRequiredAttributesCount;
  if (sRequiredAttributesCount)
  {
    v3 = 0;
    v4 = 0.0;
    do
    {
      v5 = *a2++;
      v6 = v5;
      v7 = v5 == -100.0;
      if (v5 == -100.0)
        v6 = -0.0;
      v4 = v4 + v6;
      if (!v7)
        ++v3;
      --v2;
    }
    while (v2);
  }
  else
  {
    v3 = 0;
    v4 = 0.0;
  }
  if (v3 <= 1)
    v3 = 1;
  return v4 / (float)v3;
}

double sMaxAccumulator_block_invoke_2(uint64_t a1, float *a2)
{
  uint64_t v2;
  double result;
  float v4;
  float v5;

  v2 = sRequiredAttributesCount;
  if (!sRequiredAttributesCount)
    return -3.53369685e72;
  result = -3.53369685e72;
  do
  {
    v4 = *a2++;
    v5 = v4;
    if (v4 > *(float *)&result && v5 != -100.0)
      *(float *)&result = v5;
    --v2;
  }
  while (v2);
  return result;
}

double sMinAccumulator_block_invoke_3(uint64_t a1, float *a2)
{
  uint64_t v2;
  double result;
  float v4;
  float v5;

  v2 = sRequiredAttributesCount;
  if (!sRequiredAttributesCount)
    return 3.53369517e72;
  result = 3.53369517e72;
  do
  {
    v4 = *a2++;
    v5 = v4;
    if (v4 < *(float *)&result && v5 != -100.0)
      *(float *)&result = v5;
    --v2;
  }
  while (v2);
  return result;
}

float defaultValueForCrossAttributeFeature(uint64_t a1)
{
  float result;

  result = 2147500000.0;
  if ((unint64_t)(a1 - 18) >= 0xA)
    return 0.0;
  return result;
}

char *requiredParsecTextTypes()
{
  return &sParsecTextTypesList;
}

id PRSRankingItemRequiredAttributes()
{
  if (PRSRankingItemRequiredAttributes_onceToken != -1)
    dispatch_once(&PRSRankingItemRequiredAttributes_onceToken, &__block_literal_global_123);
  return (id)PRSRankingItemRequiredAttributes_sRequiredAttributes;
}

id requiredTextFeatureAttributes()
{
  if (requiredTextFeatureAttributes_onceToken != -1)
    dispatch_once(&requiredTextFeatureAttributes_onceToken, &__block_literal_global_937);
  return (id)requiredTextFeatureAttributes_attrs;
}

id requiredContactAttributes()
{
  if (requiredContactAttributes_onceToken != -1)
    dispatch_once(&requiredContactAttributes_onceToken, &__block_literal_global_938);
  return (id)requiredContactAttributes_attrs;
}

uint64_t updateVIPList(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  pthread_mutex_lock(&sVIPLock);
  v5 = (void *)sVipList;
  sVipList = (uint64_t)v3;
  v6 = v3;

  v7 = (void *)sVipEmails;
  sVipEmails = (uint64_t)v4;

  return pthread_mutex_unlock(&sVIPLock);
}

uint64_t updateMeEmailAddresses(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  pthread_mutex_lock(&sVIPLock);
  v2 = (void *)sMeEmailAddresses;
  sMeEmailAddresses = (uint64_t)v1;

  return pthread_mutex_unlock(&sVIPLock);
}

BOOL shouldUpdateCrossAttributeFeature(unint64_t a1, float a2, float a3)
{
  if (a1 < 0x12)
    return a3 > a2;
  if (a1 - 18 >= 0xA)
    shouldUpdateCrossAttributeFeature_cold_1();
  return a3 < a2;
}

unint64_t updatedCrossAttributeFeature(unint64_t result, uint64_t a2, float a3)
{
  float v3;

  v3 = *(float *)(a2 + 4 * result);
  if (result < 0x12)
  {
    if (v3 >= a3)
      return result;
    goto LABEL_3;
  }
  if (result - 18 > 9)
    shouldUpdateCrossAttributeFeature_cold_1();
  if (v3 > a3)
LABEL_3:
    *(float *)(a2 + 4 * result) = a3;
  return result;
}

unint64_t numBitsSet(unint64_t result, unint64_t a2)
{
  uint64_t v2;
  float v3;
  uint64_t v4;

  v2 = 0;
  v3 = 0.0;
  do
  {
    v4 = ((2 * a2) << ~(_BYTE)v2) | (result >> v2);
    if ((v2 & 0x40) != 0)
      v4 = a2 >> v2;
    if ((v4 & 1) != 0)
      v3 = v3 + 1.0;
    ++v2;
  }
  while (v2 != 128);
  return result;
}

uint64_t maskFromRankingDescriptors(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v1);
        objc_msgSend((id)sRankingQueryIndexDictionary, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "unsignedIntegerValue");
        v10 = 1 << v9;
        if ((v9 & 0x40) != 0)
          v11 = 0;
        else
          v11 = 1 << v9;
        if ((v9 & 0x40) == 0)
          v10 = 0;
        v5 |= v10;
        v4 |= v11;

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

float sqDistancesToCosine(void *a1)
{
  id v1;
  float v2;
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  float v7;
  float v8;

  v1 = a1;
  v2 = 0.0;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v1;
      if (objc_msgSend(v3, "count") == 3)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "floatValue");
          v8 = v7;

          if (v8 >= 0.0 && v8 <= 4.0)
            v2 = (float)(v8 * -0.5) + 1.0;
        }
      }

    }
  }

  return v2;
}

uint64_t countsArrayComparator_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  void *v22;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "count") != 8 || objc_msgSend(v4, "count") != 8)
    countsArrayComparator_block_invoke_4_cold_1();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

    if (!v8)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "compare:", v12);

      if (!v8)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v13, "compare:", v14);

        if (!v8)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v15, "compare:", v16);

          if (!v8)
          {
            objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v17, "compare:", v18);

            if (!v8)
            {
              objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = objc_msgSend(v19, "compare:", v20);

              if (!v8)
              {
                objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = objc_msgSend(v21, "compare:", v22);

              }
            }
          }
        }
      }
    }
  }

  return v8;
}

float calibrateMD4DenseScore(unint64_t a1, unint64_t a2, float a3)
{
  float v3;
  BOOL v4;
  float v5;
  _BOOL4 v6;
  float *v7;
  BOOL v8;

  if (a2 >= 0xB)
  {
    if (a1 > 0xA)
    {
      v3 = 0.92;
      return v3 * a3;
    }
    if (a1 > 7)
    {
      v3 = 0.94;
      return v3 * a3;
    }
    if (a1 > 5)
    {
      v3 = 0.96;
      return v3 * a3;
    }
    if (a1 > 3)
    {
      v3 = 0.98;
      return v3 * a3;
    }
    v3 = flt_1B87DF8E8[a1 == 2];
    v4 = a1 == 3;
    v5 = 1.03;
    goto LABEL_31;
  }
  if (a2 < 6)
  {
    if (a2 < 3)
    {
      if (a1 < 0xB)
      {
        v3 = 1.0;
        if (a1 < 6)
          return v3 * a3;
        v6 = a2 == 1;
        v7 = (float *)&unk_1B87DF8D8;
      }
      else
      {
        v6 = a2 == 1;
        v7 = (float *)&unk_1B87DF8E0;
      }
      v3 = v7[v6];
      return v3 * a3;
    }
    if (a1 >= 0xB)
    {
      v4 = a2 == 5;
      v3 = 1.02;
      v5 = 1.0;
LABEL_31:
      if (v4)
        v3 = v5;
      return v3 * a3;
    }
    v3 = 1.0;
    if (a1 < 6)
      return v3 * a3;
    v8 = a2 > 3;
    v3 = 1.22;
  }
  else
  {
    v3 = 1.0;
    if (a1 > 0xA)
      return v3 * a3;
    if (a1 > 5)
    {
      v3 = 0.9;
      return v3 * a3;
    }
    if (a1 < 2)
    {
      v3 = 1.36;
      return v3 * a3;
    }
    v8 = a1 > 3;
    v3 = 1.01;
  }
  if (v8)
    v3 = 1.0;
  return v3 * a3;
}

float calibrateMD3DenseScore(unint64_t a1, unint64_t a2, uint64_t a3, float a4)
{
  float v4;
  unint64_t v5;
  NSObject *v9;
  float v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1 >= 7 && a2 > 9)
  {
    v4 = 1.03;
    return v4 * a4;
  }
  if (a1 - 5 <= 1 && a2 > 9)
  {
    v4 = 1.18;
    return v4 * a4;
  }
  if (a1 - 3 <= 1 && a2 > 9)
  {
    v4 = 1.96;
    return v4 * a4;
  }
  if (a1 == 2 && a2 > 9)
  {
    v4 = 1.95;
    return v4 * a4;
  }
  if (a1 == 1 && a2 > 9)
  {
    v4 = 1.15;
    return v4 * a4;
  }
  v5 = a2 - 4;
  if (a1 < 4 || (v4 = 0.75, v5 >= 6))
  {
    if (a1 == 3 && v5 < 6)
    {
      v4 = 1.08;
      return v4 * a4;
    }
    if (a1 == 2 && v5 < 6)
    {
      v4 = 1.1;
      return v4 * a4;
    }
    if (a1 == 1 && v5 < 6)
    {
      v4 = 1.04;
      return v4 * a4;
    }
    if (a1 >= 4 && a2 == 3)
    {
      v4 = 0.8;
      return v4 * a4;
    }
    v4 = 0.98;
    if (a1 < 4 || a2 != 2)
    {
      if (a1 >= 4 && a2 == 1)
      {
        v4 = 0.66;
        return v4 * a4;
      }
      if (a1 == 1 && a2 == 1)
      {
        v4 = 0.63;
        return v4 * a4;
      }
      if (a1 == 1 && a2 == 2)
      {
        v4 = 0.64;
        return v4 * a4;
      }
      if (a1 != 1 || a2 != 3)
      {
        v11 = a4;
        if (a1 == 2 && a2 - 1 < 2)
        {
          v4 = 0.64;
LABEL_59:
          a4 = v11;
          return v4 * a4;
        }
        if (a1 == 2 && a2 == 3)
        {
          v4 = 0.85;
          goto LABEL_59;
        }
        if (a1 == 3 && a2 == 1)
        {
          v4 = 0.58;
          goto LABEL_59;
        }
        if (a1 != 3 || (v4 = 0.64, a2 != 2))
        {
          if (a1 != 3 || (v4 = 0.8, a2 != 3))
          {
            SSGeneralLog();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218496;
              v13 = a3;
              v14 = 2048;
              v15 = a1;
              v16 = 2048;
              v17 = a2;
              _os_log_error_impl(&dword_1B86C5000, v9, OS_LOG_TYPE_ERROR, "qid=%ld - Error: invalid token length combination (query_token_len = %ld, doc_token_length = %ld)", buf, 0x20u);
            }

            v4 = 1.0;
            goto LABEL_59;
          }
        }
      }
    }
  }
  return v4 * a4;
}

void initQueryTermMatchCounts_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t v4;
  void *v5;

  if (a2)
  {
    if (a3)
    {
      v4 = 2 * a2;
      v5 = malloc_type_malloc(2 * a2, 0x1000040BDFB0063uLL);
      *(_QWORD *)a3 = v5;
      bzero(v5, v4);
      *(_WORD *)(a3 + 8) = 0;
    }
  }
}

BOOL hasAllQueryTermMatchCounts_block_invoke_6(uint64_t a1, uint64_t a2, unsigned __int16 **a3)
{
  uint64_t v3;
  unsigned __int16 *v4;

  if (!a2 || !a3)
    return 1;
  v3 = a2 - 1;
  if (a2 != 1)
  {
    v4 = *a3;
    do
    {
      if (!*v4++)
        return 0;
    }
    while (--v3);
  }
  return *((_WORD *)a3 + 4) != 0;
}

void destroyQueryTermMatchCounts_block_invoke_7(uint64_t a1, uint64_t a2, void **a3)
{
  if (a2 && a3)
  {
    if (*a3)
      free(*a3);
  }
}

uint64_t updateMatchCountsQueryMatchCounts_block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4, _WORD *a5, uint64_t a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t i;
  unsigned __int16 *v24;
  _WORD *v25;
  int v26;
  uint64_t v28;
  id v29;
  char *v30;
  id v31;
  id v32;
  id v33;
  char *v34;
  char *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  objc_msgSend(v10, "queryTerms");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  MDTokenizerCreate();
  v15 = (void *)objc_opt_new();
  MDTokenizerGetTokens();
  MDTokenizerDispose();
  v29 = v15;
  v32 = v11;
  v16 = objc_msgSend(v15, "count");
  v28 = (uint64_t)&v28;
  v17 = (2 * v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  v35 = (char *)&v28 - v17;
  bzero((char *)&v28 - v17, 2 * v16);
  v34 = (char *)&v28 - v17;
  bzero((char *)&v28 - v17, 2 * v16);
  v18 = (2 * v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  v30 = (char *)&v28 - v18;
  bzero((char *)&v28 - v18, 2 * v14);
  v33 = v10;
  bzero((char *)&v28 - v18, 2 * v14);
  v31 = v12;
  bzero((char *)&v28 - v18, 2 * v14);
  bzero((char *)&v28 - v18, 2 * v14);
  bzero(v35, 2 * v16);
  bzero(v34, 2 * v16);
  v19 = v30;
  bzero(v30, 2 * v14);
  bzero((char *)&v28 - v18, 2 * v14);
  bzero((char *)&v28 - v18, 2 * v14);
  bzero((char *)&v28 - v18, 2 * v14);
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = v35;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = v34;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = v19;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = (char *)&v28 - v18;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = (char *)&v28 - v18;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = (char *)&v28 - v18;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = updateMatchCountsQueryMatchCounts_block_invoke_9;
  v36[3] = &unk_1E6E52DC0;
  v45 = v14;
  v20 = v31;
  v37 = v20;
  v35 = (char *)v32;
  v38 = v35;
  v39 = &v59;
  v40 = &v55;
  v41 = &v67;
  v42 = &v63;
  v43 = &v51;
  v21 = v33;
  v46 = v16;
  v44 = &v47;
  v22 = objc_msgSend(v33, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:", v20, 1, 1, 0, v36);
  a5[6] = v22;
  if (v14)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_WORD *)(v60[3] + 2 * i) == 1)
        ++a5[2];
      if (*(_WORD *)(v56[3] + 2 * i) == 1)
        ++a5[3];
      if (*(_WORD *)(v52[3] + 2 * i))
      {
        ++a5[4];
        if (a6)
          ++*(_WORD *)(a6 + 8);
      }
      if (*(_WORD *)(v48[3] + 2 * i))
      {
        ++a5[5];
        if (a6)
        {
          if (*(_QWORD *)a6)
            ++*(_WORD *)(*(_QWORD *)a6 + 2 * i);
        }
      }
    }
  }
  if (v16)
  {
    v24 = (unsigned __int16 *)v68[3];
    v25 = (_WORD *)v64[3];
    do
    {
      v26 = *v24++;
      if (v26 == 1)
        ++*a5;
      if (*v25 == 1)
        ++a5[1];
      ++v25;
      --v16;
    }
    while (v16);
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);

  return v22;
}

void sub_1B878DE9C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v1 + 176), 8);
  _Block_object_dispose((const void *)(v1 + 208), 8);
  _Block_object_dispose((const void *)(v2 - 224), 8);
  _Block_object_dispose((const void *)(v2 - 192), 8);
  _Block_object_dispose((const void *)(v2 - 160), 8);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void copyValueTokensCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v6, "stringWithCharacters:length:", a1, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decomposedStringWithCanonicalMapping");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v9);
}

void updateMatchCountsQueryMatchCounts_block_invoke_9(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  int v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if ((a2 & 5) == 1)
  {
    if (*(_QWORD *)(a1 + 96) <= a6)
    {
      PRSLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(a1 + 96);
        v23 = objc_msgSend(*(id *)(a1 + 32), "length");
        v24 = *(_QWORD *)(a1 + 40);
        v36 = 134220034;
        v37 = a6;
        v38 = 2048;
        v39 = v22;
        v40 = 2048;
        v41 = v23;
        v42 = 2112;
        v43 = v24;
        v44 = 2048;
        v45 = a2;
        v46 = 2048;
        v47 = a3;
        v48 = 2048;
        v49 = a4;
        v50 = 2048;
        v51 = a5;
        v52 = 2048;
        v53 = a7;
        _os_log_error_impl(&dword_1B86C5000, v14, OS_LOG_TYPE_ERROR, "matchedQueryTermIndex (%lu) >= queryTermCount (%lu), value.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", (uint8_t *)&v36, 0x5Cu);
      }

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v25 = *(_QWORD *)(a1 + 96);
        v26 = objc_msgSend(*(id *)(a1 + 32), "length");
        v27 = *(_QWORD *)(a1 + 40);
        v36 = 134220034;
        v37 = a6;
        v38 = 2048;
        v39 = v25;
        v40 = 2048;
        v41 = v26;
        v42 = 2112;
        v43 = v27;
        v44 = 2048;
        v45 = a2;
        v46 = 2048;
        v47 = a3;
        v48 = 2048;
        v49 = a4;
        v50 = 2048;
        v51 = a5;
        v52 = 2048;
        v53 = a7;
        _os_log_fault_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "matchedQueryTermIndex (%lu) >= queryTermCount (%lu), value.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", (uint8_t *)&v36, 0x5Cu);
      }
    }
    if (*(_QWORD *)(a1 + 104) <= a7)
    {
      PRSLogCategoryDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v29 = *(_QWORD *)(a1 + 96);
        v28 = *(_QWORD *)(a1 + 104);
        v30 = objc_msgSend(*(id *)(a1 + 32), "length");
        v31 = *(_QWORD *)(a1 + 40);
        v36 = 134220290;
        v37 = a7;
        v38 = 2048;
        v39 = v28;
        v40 = 2048;
        v41 = v29;
        v42 = 2048;
        v43 = v30;
        v44 = 2112;
        v45 = v31;
        v46 = 2048;
        v47 = a2;
        v48 = 2048;
        v49 = a3;
        v50 = 2048;
        v51 = a4;
        v52 = 2048;
        v53 = a5;
        v54 = 2048;
        v55 = a6;
        _os_log_error_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_ERROR, "matchedTokenIndex (%lu) >= valueTermCount (%lu), queryTermCount = %lu, value.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedQueryTermIndex: %lu", (uint8_t *)&v36, 0x66u);
      }

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v33 = *(_QWORD *)(a1 + 96);
        v32 = *(_QWORD *)(a1 + 104);
        v34 = objc_msgSend(*(id *)(a1 + 32), "length");
        v35 = *(_QWORD *)(a1 + 40);
        v36 = 134220290;
        v37 = a7;
        v38 = 2048;
        v39 = v32;
        v40 = 2048;
        v41 = v33;
        v42 = 2048;
        v43 = v34;
        v44 = 2112;
        v45 = v35;
        v46 = 2048;
        v47 = a2;
        v48 = 2048;
        v49 = a3;
        v50 = 2048;
        v51 = a4;
        v52 = 2048;
        v53 = a5;
        v54 = 2048;
        v55 = a6;
        _os_log_fault_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "matchedTokenIndex (%lu) >= valueTermCount (%lu), queryTermCount = %lu, value.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedQueryTermIndex: %lu", (uint8_t *)&v36, 0x66u);
      }
    }
    v16 = *(_QWORD *)(a1 + 96);
    if (v16)
    {
      if (v16 > a6 && *(_QWORD *)(a1 + 104) > a7)
      {
        if (a7 == a6)
        {
          if ((a2 & 2) == 0)
          {
            if (v16 - 1 == a6)
            {
              v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
              ++*(_WORD *)(v17 + 2 * a6);
            }
            goto LABEL_20;
          }
          v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          ++*(_WORD *)(v20 + 2 * a6);
        }
        else if ((a2 & 2) == 0)
        {
LABEL_20:
          v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          ++*(_WORD *)(v18 + 2 * a7);
          if (v16 - 1 != a6)
            return;
          v19 = *(_QWORD *)(a1 + 80);
LABEL_25:
          ++*(_WORD *)(*(_QWORD *)(*(_QWORD *)(v19 + 8) + 24) + 2 * a6);
          return;
        }
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        ++*(_WORD *)(v21 + 2 * a7);
        if (v16 - 1 == a6)
          return;
        v19 = *(_QWORD *)(a1 + 88);
        goto LABEL_25;
      }
    }
  }
}

uint64_t updateMatchCounts_block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4, _WORD *a5)
{
  return (*((uint64_t (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
          + 2))((uint64_t)updateMatchCountsQueryMatchCounts, a2, a3, a4, a5, 0);
}

BOOL hasMatchWithCounts_block_invoke_11(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5, char a6, int a7)
{
  _BOOL8 result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  char v12;
  BOOL v13;

  result = 0;
  if (!a2)
    return result;
  v8 = WORD2(a4);
  if (!WORD2(a4))
    return result;
  v9 = HIWORD(a3);
  if (a7)
    return WORD2(a4) == a2 && WORD2(a4) == v9;
  v11 = WORD2(a3);
  if (WORD2(a4) == 1)
  {
    if ((_WORD)a3)
      v12 = a5;
    else
      v12 = 1;
    if (WORD2(a3))
      v13 = a2 == 1;
    else
      v13 = 0;
    result = 1;
    if (v13 || (v12 & 1) == 0)
      return result;
    return 0;
  }
  if ((a6 & 1) == 0)
    return (WORD2(a3) | (unint64_t)(unsigned __int16)a3) != 0;
  if (a5)
    v8 = a2;
  else
    v11 = (unsigned __int16)a3;
  if (v11 != v8)
    return 0;
  if (!a5)
    v9 = WORD1(a3);
  result = 1;
  if (v9 != v11 && v9 != v11 - 1)
    return 0;
  return result;
}

uint64_t hasAsTypedMatchWithCounts_block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a2 == 1)
  {
    if (!((unsigned __int16)a4 | (unint64_t)HIWORD(a4)))
      return 0;
  }
  else if (((_WORD)a4 || HIWORD(a4) != a2) && ((unsigned __int16)a4 != 1 || HIWORD(a4) != a2 - 1))
  {
    return 0;
  }
  return 1;
}

void sub_1B8791A40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1B8793E8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 + 512), 8);
  _Unwind_Resume(a1);
}

uint64_t prs_feature_population_ctx_reset_for_item(uint64_t result)
{
  uint64_t v1;
  int64x2_t v2;
  int64x2_t v3;
  uint64x2_t v4;
  int64x2_t v5;
  int64x2_t v6;
  int8x16_t v7;

  v1 = 0;
  *(_DWORD *)(result + 156) = 0;
  *(_OWORD *)(result + 140) = xmmword_1B87DF890;
  v2 = (int64x2_t)xmmword_1B87DF3B0;
  v3 = vdupq_n_s64(0xFFFFFFFFFFFFFFEELL);
  v4 = (uint64x2_t)vdupq_n_s64(0xAuLL);
  v5 = (int64x2_t)xmmword_1B87DF3C0;
  v6 = vdupq_n_s64(4uLL);
  v7.i64[0] = 0x4F0000004F000000;
  v7.i64[1] = 0x4F0000004F000000;
  do
  {
    *(int8x16_t *)(result + 28 + v1) = vandq_s8(v7, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v4, (uint64x2_t)vaddq_s64(v5, v3)), (int32x4_t)vcgtq_u64(v4, (uint64x2_t)vaddq_s64(v2, v3))));
    v2 = vaddq_s64(v2, v6);
    v5 = vaddq_s64(v5, v6);
    v1 += 16;
  }
  while (v1 != 112);
  *(_QWORD *)(result + 160) = 0;
  *(_QWORD *)(result + 168) = 0;
  return result;
}

void prs_feature_population_ctx_reset_for_property(uint64_t a1, const __CFString *a2, char a3)
{
  const __CFArray *v6;
  CFIndex Count;
  uint64_t v8;
  CFIndex v9;
  const __CFString *ValueAtIndex;

  *(_QWORD *)(a1 + 184) = 0x7FFFFFFFFFFFFFFFLL;
  v6 = *(const __CFArray **)(a1 + 16);
  Count = CFArrayGetCount(v6);
  v8 = Count;
  if ((a3 & 1) != 0)
  {
    if (Count < 1)
      goto LABEL_11;
  }
  else if (CFStringCompare(CFSTR("kMDItemDescription"), a2, 0) == kCFCompareEqualTo || v8 <= 0)
  {
    goto LABEL_11;
  }
  v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v9);
    if (CFStringCompare(a2, ValueAtIndex, 0) == kCFCompareEqualTo)
      break;
    if (v8 == ++v9)
      goto LABEL_11;
  }
  *(_QWORD *)(a1 + 184) = v9;
LABEL_11:
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)a1);
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 8));
}

void sub_1B8795978(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 + 440), 8);
  _Block_object_dispose((const void *)(v1 + 472), 8);
  _Block_object_dispose((const void *)(v1 + 504), 8);
  _Block_object_dispose((const void *)(v1 + 536), 8);
  _Block_object_dispose((const void *)(v1 + 568), 8);
  _Block_object_dispose((const void *)(v1 + 600), 8);
  _Unwind_Resume(a1);
}

uint64_t statisticsFromValues(uint64_t result, unint64_t a2, float *a3, float *a4, float *a5, float *a6, float *a7, int a8, double a9, double a10, double a11, float a12, double a13, double a14, double a15)
{
  uint64_t v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  float v20;
  float v21;
  float v22;

  if (result)
  {
    if (a2)
    {
      v15 = 0;
      v16 = 0.0;
      v17 = 2147500000.0;
      v18 = 0.0;
      do
      {
        if (a8)
        {
          a12 = *(float *)(result + 4 * v15);
        }
        else
        {
          LOWORD(a12) = *(_WORD *)(result + 2 * v15);
          a12 = (float)LODWORD(a12);
        }
        if (v17 >= a12)
          v17 = a12;
        if (v18 < a12)
          v18 = a12;
        v16 = v16 + a12;
        ++v15;
      }
      while (a2 != v15);
      v19 = 0;
      v20 = 0.0;
      if (v17 == 2147500000.0)
        v17 = 0.0;
      v21 = (float)a2;
      v22 = v16 / (float)a2;
      do
      {
        if (a8)
        {
          LODWORD(a15) = *(_DWORD *)(result + 4 * v19);
        }
        else
        {
          LOWORD(a15) = *(_WORD *)(result + 2 * v19);
          *(float *)&a15 = (float)LODWORD(a15);
        }
        a15 = (float)(v22 - *(float *)&a15) * (float)(v22 - *(float *)&a15);
        v20 = a15 + v20;
        ++v19;
      }
      while (a2 != v19);
    }
    else
    {
      v21 = (float)0;
      v17 = 0.0;
      v22 = 0.0 / (float)0;
      v16 = 0.0;
      v18 = 0.0;
      v20 = 0.0;
    }
    *a5 = v20 / v21;
    *a3 = v16;
    *a4 = v22;
    *a6 = v17;
    *a7 = v18;
  }
  return result;
}

id getResultPropertyValue(void *a1, char a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = v4;
    if ((a2 & 2) != 0)
    {
      objc_msgSend(v4, "PRSRankingItemAdditions_title");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else if ((a2 & 4) != 0)
    {
      objc_msgSend(v4, "PRSRankingItemAdditions_description");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else if ((a2 & 8) != 0)
    {
      objc_msgSend(v4, "PRSRankingItemAdditions_url");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else if ((a2 & 0x10) != 0)
    {
      objc_msgSend(v4, "PRSRankingItemAdditions_completedQuery");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((a2 & 0x20) == 0)
      {
        v6 = 0;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v4, "PRSRankingItemAdditions_correctedQuery");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v7;
    goto LABEL_15;
  }
  v6 = 0;
LABEL_16:

  return v6;
}

uint64_t comparePreferences_block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  BOOL v18;
  uint64_t v19;
  BOOL v20;
  double v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  float v45;
  float v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  float v51;
  float v52;
  void *v53;
  float v54;
  float v55;
  void *v56;
  float v57;
  float v58;
  uint64_t v59;
  uint64_t v60;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "L2FeatureVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scoreForFeature:", 97);
  v8 = v7;

  objc_msgSend(v5, "L2FeatureVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scoreForFeature:", 97);
  v11 = v10;

  objc_msgSend(v4, "L2FeatureVector");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scoreForFeature:", 109);
  v14 = v13;

  objc_msgSend(v5, "L2FeatureVector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scoreForFeature:", 109);
  v17 = v16;

  v18 = v14 <= 0.0 && v8 <= 0.0;
  if (!v18 && v11 <= 0.0 && v17 <= 0.0)
    goto LABEL_7;
  v20 = v17 <= 0.0 && v11 <= 0.0;
  if (!v20 && v8 <= 0.0 && v14 <= 0.0)
  {
LABEL_14:
    v19 = -1;
    goto LABEL_15;
  }
  v60 = 0;
  SSCompactRankingAttrsGetFloat(objc_msgSend(v4, "attributes"), 0x11AuLL, (_DWORD *)&v60 + 1);
  SSCompactRankingAttrsGetFloat(objc_msgSend(v5, "attributes"), 0x11AuLL, &v60);
  LODWORD(v22) = HIDWORD(v60);
  if (*((float *)&v60 + 1) > *(float *)&v60)
    goto LABEL_7;
  if (*((float *)&v60 + 1) < *(float *)&v60)
    goto LABEL_14;
  objc_msgSend(v4, "L2FeatureVector", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scoreForFeature:", 41);
  v25 = v24;

  objc_msgSend(v5, "L2FeatureVector");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scoreForFeature:", 41);
  v28 = v27;

  if (v25 > v28)
    goto LABEL_7;
  if (v25 < v28)
    goto LABEL_14;
  objc_msgSend(v4, "L2FeatureVector");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scoreForFeature:", 213);
  v31 = v30;

  objc_msgSend(v5, "L2FeatureVector");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scoreForFeature:", 213);
  v34 = v33;

  if (v31 < v34)
    goto LABEL_7;
  if (v31 > v34)
    goto LABEL_14;
  objc_msgSend(v4, "L2FeatureVector");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "scoreForFeature:", 212);
  v37 = v36;

  objc_msgSend(v5, "L2FeatureVector");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "scoreForFeature:", 212);
  v40 = v39;

  if (v37 < v40)
    goto LABEL_7;
  if (v37 > v40)
    goto LABEL_14;
  objc_msgSend(v4, "L2FeatureVector");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "scoreForFeature:", 134);
  v43 = v42;

  objc_msgSend(v5, "L2FeatureVector");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "scoreForFeature:", 134);
  v46 = v45;

  if (v43 > v46)
    goto LABEL_7;
  if (v43 < v46)
    goto LABEL_14;
  objc_msgSend(v4, "L2FeatureVector");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "scoreForFeature:", 135);
  v49 = v48;

  objc_msgSend(v5, "L2FeatureVector");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "scoreForFeature:", 135);
  v52 = v51;

  if (v49 > v52)
  {
LABEL_7:
    v19 = 1;
    goto LABEL_15;
  }
  if (v49 < v52)
    goto LABEL_14;
  objc_msgSend(v4, "L2FeatureVector");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "scoreForFeature:", 79);
  v55 = v54;

  objc_msgSend(v5, "L2FeatureVector");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "scoreForFeature:", 79);
  v58 = v57;

  if (v55 >= v58)
    v59 = 0;
  else
    v59 = -1;
  if (v55 > v58)
    v19 = 1;
  else
    v19 = v59;
LABEL_15:

  return v19;
}

uint64_t compareSafariResults_block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isSafariTopHit");
  v7 = objc_msgSend(v5, "isSafariTopHit");
  if (((v6 ^ 1) & 1) != 0 || v7)
  {
    if ((v7 ^ 1 | v6) == 1)
    {
      if (((v6 ^ 1 | v7 ^ 1) & 1) != 0)
        goto LABEL_10;
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v4, "attributes"), 0xDuLL);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v5, "attributes"), 0xDuLL);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "length");
      v12 = objc_msgSend(v10, "length");

      v8 = v11 > v12 ? 1 : -1;
      if (v11 == v12)
LABEL_10:
        v8 = 0;
    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t compareShortcuts_block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  uint64_t v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v17;

  v4 = a2;
  v5 = a3;
  v17 = 0;
  SSCompactRankingAttrsGetFloat(objc_msgSend(v4, "attributes"), 0x11AuLL, (_DWORD *)&v17 + 1);
  SSCompactRankingAttrsGetFloat(objc_msgSend(v5, "attributes"), 0x11AuLL, &v17);
  LODWORD(v6) = HIDWORD(v17);
  if (*((float *)&v17 + 1) <= *(float *)&v17)
  {
    if (*((float *)&v17 + 1) < *(float *)&v17)
    {
      v7 = -1;
    }
    else
    {
      objc_msgSend(v4, "L2FeatureVector", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scoreForFeature:", 165);
      v10 = v9;

      objc_msgSend(v5, "L2FeatureVector");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scoreForFeature:", 165);
      v13 = v12 == 0.0 && v10 != 0.0;
      v14 = v12 != 0.0 && v10 == 0.0;
      v15 = v13 << 63 >> 63;
      if (v14)
        v7 = 1;
      else
        v7 = v15;

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t compareShortcutsNames_block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "L2FeatureVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scoreForFeature:", 165);
  v7 = v6;

  objc_msgSend(v4, "L2FeatureVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "scoreForFeature:", 165);
  v10 = v9 == 0.0 && v7 != 0.0;
  v11 = v9 != 0.0 && v7 == 0.0;
  v12 = v10 << 63 >> 63;
  if (v11)
    v13 = 1;
  else
    v13 = v12;

  return v13;
}

uint64_t compareApplications_block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;

  v4 = a3;
  objc_msgSend(a2, "L2FeatureVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppInDock");

  objc_msgSend(v4, "L2FeatureVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isAppInDock");
  if (v6 ^ 1 | v8)
    return (uint64_t)((unint64_t)(v8 & (v6 ^ 1u)) << 63) >> 63;
  else
    return 1;
}

CFMutableArrayRef prs_feature_population_ctx_init(uint64_t a1, CFIndex capacity)
{
  char v2;
  CFIndex v4;
  const CFArrayCallBacks *v5;
  CFMutableArrayRef result;
  uint64_t v7;
  int64x2_t v8;
  int64x2_t v9;
  uint64x2_t v10;
  int64x2_t v11;
  int64x2_t v12;
  int8x16_t v13;

  v2 = capacity;
  v4 = capacity;
  v5 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  *(_QWORD *)a1 = CFArrayCreateMutable(0, capacity, MEMORY[0x1E0C9B378]);
  result = CFArrayCreateMutable(0, v4, v5);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = v2;
  *(_DWORD *)(a1 + 156) = 0;
  *(_OWORD *)(a1 + 140) = xmmword_1B87DF890;
  v8 = (int64x2_t)xmmword_1B87DF3B0;
  v9 = vdupq_n_s64(0xFFFFFFFFFFFFFFEELL);
  v10 = (uint64x2_t)vdupq_n_s64(0xAuLL);
  v11 = (int64x2_t)xmmword_1B87DF3C0;
  v12 = vdupq_n_s64(4uLL);
  v13.i64[0] = 0x4F0000004F000000;
  v13.i64[1] = 0x4F0000004F000000;
  do
  {
    *(int8x16_t *)(a1 + 28 + v7) = vandq_s8(v13, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v10, (uint64x2_t)vaddq_s64(v11, v9)), (int32x4_t)vcgtq_u64(v10, (uint64x2_t)vaddq_s64(v8, v9))));
    v8 = vaddq_s64(v8, v12);
    v11 = vaddq_s64(v11, v12);
    v7 += 16;
  }
  while (v7 != 112);
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  return result;
}

CFIndex prs_feature_population_ctx_reset_with_important_properties(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  CFIndex result;

  v4 = *(const void **)(a1 + 16);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 16) = CFRetain(cf);
  result = CFArrayGetCount((CFArrayRef)cf);
  *(_QWORD *)(a1 + 176) = result;
  return result;
}

void prs_feature_population_ctx_destroy(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)a1;
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 8);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void __requiredTextFeatureAttributes_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  void *v20;
  _QWORD v21[18];
  uint64_t v22;
  uint64_t v23;
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

  v46 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6968];
  v21[0] = *MEMORY[0x1E0CA6158];
  v21[1] = v0;
  v1 = *MEMORY[0x1E0CA6048];
  v21[2] = *MEMORY[0x1E0CA68D8];
  v21[3] = v1;
  v2 = *MEMORY[0x1E0CA67D8];
  v21[4] = *MEMORY[0x1E0CA5FF0];
  v21[5] = v2;
  v3 = *MEMORY[0x1E0CA64A0];
  v21[6] = *MEMORY[0x1E0CA5F80];
  v21[7] = v3;
  v4 = *MEMORY[0x1E0CA60F0];
  v21[8] = *MEMORY[0x1E0CA5F90];
  v21[9] = v4;
  v5 = *MEMORY[0x1E0CA64D0];
  v21[10] = *MEMORY[0x1E0CA6150];
  v21[11] = v5;
  v6 = *MEMORY[0x1E0CA60A8];
  v21[12] = *MEMORY[0x1E0CA6428];
  v21[13] = v6;
  v7 = *MEMORY[0x1E0CA6330];
  v21[14] = *MEMORY[0x1E0CA63C0];
  v21[15] = v7;
  v8 = *MEMORY[0x1E0CA5FF8];
  v21[16] = *MEMORY[0x1E0CA6498];
  v21[17] = v8;
  v22 = *MEMORY[0x1E0CA6030];
  v23 = v22;
  v24 = *MEMORY[0x1E0CA66F8];
  v25 = v24;
  v9 = *MEMORY[0x1E0CA6588];
  v26 = *MEMORY[0x1E0CA6618];
  v27 = v9;
  v10 = *MEMORY[0x1E0CA6610];
  v28 = *MEMORY[0x1E0CA6580];
  v29 = v10;
  v11 = *MEMORY[0x1E0CA65A8];
  v30 = *MEMORY[0x1E0CA65B0];
  v31 = v11;
  v12 = *MEMORY[0x1E0CA6630];
  v32 = *MEMORY[0x1E0CA65B8];
  v33 = v12;
  v13 = *MEMORY[0x1E0CA6688];
  v34 = *MEMORY[0x1E0CA6678];
  v35 = v13;
  v14 = *MEMORY[0x1E0CA65D0];
  v36 = *MEMORY[0x1E0CA66A8];
  v37 = v14;
  v15 = *MEMORY[0x1E0CA65D8];
  v38 = *MEMORY[0x1E0CA65F8];
  v39 = v15;
  v16 = *MEMORY[0x1E0CA6598];
  v40 = *MEMORY[0x1E0CA66B0];
  v41 = v16;
  v17 = *MEMORY[0x1E0CA5F40];
  v42 = *MEMORY[0x1E0CA5F38];
  v43 = v17;
  v18 = *MEMORY[0x1E0CA69E0];
  v44 = *MEMORY[0x1E0CA6320];
  v45 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 42);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)requiredTextFeatureAttributes_attrs;
  requiredTextFeatureAttributes_attrs = v19;

}

void __requiredContactAttributes_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6508];
  v4[0] = *MEMORY[0x1E0CA63B8];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0CA64D8];
  v4[2] = *MEMORY[0x1E0CA6388];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)requiredContactAttributes_attrs;
  requiredContactAttributes_attrs = v2;

}

void __requiredParsecTextFeatureAttributes_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6150];
  v3[0] = *MEMORY[0x1E0CA6968];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0CA6970];
  v3[3] = CFSTR("kParsecCompletedQuery");
  v3[4] = CFSTR("kParsecCorrectedQuery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)requiredParsecTextFeatureAttributes_attrs;
  requiredParsecTextFeatureAttributes_attrs = v1;

}

id WorldClockDebugLog()
{
  if (WorldClockDebugLog_onceToken != -1)
    dispatch_once(&WorldClockDebugLog_onceToken, &__block_literal_global_313_0);
  return (id)WorldClockDebugLog_log;
}

void sub_1B87A03A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

BOOL gShouldUpdateOnMax_block_invoke(float a1, float a2)
{
  return a2 < 2147500000.0 && a2 > a1;
}

BOOL gShouldUpdateOnMin_block_invoke_2(float a1, float a2)
{
  return a2 > -1.0 && a2 < a1;
}

void updateVIPRankingQuery(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v2 = (void *)objc_opt_new();
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_opt_new();
    objc_msgSend(v2, "appendFormat:", CFSTR("FieldMatch(%@,"), *MEMORY[0x1E0CA6030]);
    objc_msgSend(v3, "appendFormat:", CFSTR("FieldMatch(%@,"), *MEMORY[0x1E0CA66F8]);
    objc_msgSend(v4, "appendFormat:", CFSTR("FieldMatch(%@,"), *MEMORY[0x1E0CA61B8]);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = v1;
    obj = v1;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v32;
      v23 = *(_QWORD *)v32;
LABEL_4:
      v9 = 0;
      v24 = v6;
      while (1)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        if (v7 == 20)
          break;
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = v7;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v10, "objectForKey:", CFSTR("emailAddresses"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v28 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
                objc_msgSend(v2, "appendFormat:", CFSTR("\"%@\","), v16);
                objc_msgSend(v3, "appendFormat:", CFSTR("\"%@\","), v16);
                objc_msgSend(v4, "appendFormat:", CFSTR("\"%@\","), v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v13);
          }

          v7 = v26;
          v8 = v23;
          v6 = v24;
        }
        else
        {
          objc_msgSend(v2, "appendFormat:", CFSTR("\"%@\","), v10);
          objc_msgSend(v3, "appendFormat:", CFSTR("\"%@\","), v10);
          objc_msgSend(v4, "appendFormat:", CFSTR("\"%@\","), v10);
        }
        ++v7;
        if (++v9 == v6)
        {
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

    replaceLastCharacterOfString(v2);
    replaceLastCharacterOfString(v3);
    replaceLastCharacterOfString(v4);
    pthread_mutex_lock(&sVIPLock_0);
    v17 = (void *)sReceiverInVIPQuery;
    sReceiverInVIPQuery = (uint64_t)v3;
    v18 = v3;

    v19 = (void *)sSenderInVIPQuery;
    sSenderInVIPQuery = (uint64_t)v2;
    v20 = v2;

    v21 = (void *)sEmailAddressInVIPQuery;
    sEmailAddressInVIPQuery = (uint64_t)v4;

    pthread_mutex_unlock(&sVIPLock_0);
    v1 = v22;
  }

}

void replaceLastCharacterOfString(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "replaceCharactersInRange:withString:", objc_msgSend(v1, "length") - 1, 1, CFSTR(")"));

}

void updatePhoneFavoritesQuery(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v2 = (void *)objc_opt_new();
    v3 = (void *)objc_opt_new();
    objc_msgSend(v2, "appendFormat:", CFSTR("FieldMatch(%@,"), *MEMORY[0x1E0CA6028]);
    objc_msgSend(v3, "appendFormat:", CFSTR("FieldMatch(%@,"), *MEMORY[0x1E0CA67C8]);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v18;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        if (v7 + (_DWORD)v9 == 20)
          break;
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_msgSend(v2, "appendFormat:", CFSTR("%@,"), v10);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@,"), v10);
        if (v6 == ++v9)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          v7 += v9;
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

    replaceLastCharacterOfString(v2);
    replaceLastCharacterOfString(v3);
    pthread_mutex_lock(&sVIPLock_0);
    v11 = (void *)sSenderInPhoneFavoritesQuery;
    sSenderInPhoneFavoritesQuery = (uint64_t)v2;
    v12 = v2;

    v13 = (void *)sReceiverInPhoneFavoritesQuery;
    sReceiverInPhoneFavoritesQuery = (uint64_t)v3;
    v14 = v3;

    v15 = objc_msgSend(v4, "copy");
    v16 = (void *)sPhoneFavorites;
    sPhoneFavorites = v15;

    pthread_mutex_unlock(&sVIPLock_0);
  }

}

BOOL addEndChar(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a1;
  v4 = a2;
  v5 = ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA6030]) & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA66F8]))
    && !objc_msgSend(v4, "containsString:", CFSTR("@"));

  return v5;
}

void PRSRankingQueryInfoAdd(_QWORD *a1, int a2, uint64_t a3, void *a4)
{
  id v8;
  id v9;

  v8 = a4;
  if ((a2 & 1) == 0 && *a1 <= 0xFFuLL)
  {
    *((_DWORD *)a1 + *a1 + 2) = a2;
    a1[*a1 + 129] = a3;
    v9 = v8;
    objc_storeStrong((id *)&a1[*a1 + 385], a4);
    v8 = v9;
    ++*a1;
  }

}

uint64_t PRSRankingQueryImportantBits(int a1)
{
  uint64_t *v1;

  v1 = &sPRSImportantBitsSuggestions;
  if (a1)
    v1 = &sPRSImportantBitsSearch;
  return *v1;
}

id PRSRankingItemRankerAddJunkFilter(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("false")))
          {
            v10 = v2;
            v11 = CFSTR("false");
          }
          else
          {
            if (!objc_msgSend(v9, "isEqualToString:", CFSTR("true")))
            {
              v15 = objc_msgSend(v9, "hasPrefix:", CFSTR("$"));
              v16 = objc_alloc(MEMORY[0x1E0CB3940]);
              v17 = v16;
              if ((v15 & 1) != 0)
              {
                objc_msgSend(v9, "substringFromIndex:", 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("$(kMDItemIsLikelyJunk!=*||InRange(kMDItemIsLikelyJunk,0,0)) && (%@)"), v18);
                objc_msgSend(v2, "addObject:", v19);

              }
              else
              {
                v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("(!InRange(kMDItemIsLikelyJunk,1,1)) && (%@)"), v9);
                objc_msgSend(v2, "addObject:", v18);
              }

              goto LABEL_21;
            }
            v10 = v2;
            v11 = CFSTR("(!InRange(kMDItemIsLikelyJunk,1,1)");
          }
          objc_msgSend(v10, "addObject:", v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v2, "addObject:", v8);
            goto LABEL_22;
          }
          v12 = v8;
          objc_msgSend(v12, "objectForKey:", CFSTR("kCIMatchArray"));
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v13 = (void *)objc_msgSend(v12, "mutableCopy");

            PRSRankingItemRankerAddJunkFilter(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("kCIMatchArray"));

            v12 = v13;
          }
          objc_msgSend(v2, "addObject:", v12);

        }
LABEL_21:

LABEL_22:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  return v2;
}

id _PRSRankingQueries(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, char a10, void *a11, uint64_t a12, unsigned __int8 a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  dispatch_group_t v34;
  void *v35;
  id v36;
  _QWORD *v37;
  NSObject *v38;
  NSObject *v39;
  qos_class_t v40;
  dispatch_block_t v41;
  void *v42;
  dispatch_time_t v43;
  NSObject *v44;
  int v45;
  const char *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t i;
  const __CFString *v62;
  void *v63;
  uint64_t v64;
  __CFString *v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t v68;
  __CFString *v69;
  uint64_t v70;
  __CFString *v71;
  uint64_t v72;
  __CFString *v73;
  uint64_t v74;
  __CFString *v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  __CFString *v83;
  uint64_t v84;
  void *v85;
  __CFString *v86;
  uint64_t v87;
  void *v88;
  __CFString *v89;
  uint64_t v90;
  void *v91;
  __CFString *v92;
  uint64_t v93;
  void *v94;
  __CFString *v95;
  uint64_t v96;
  void *v97;
  __CFString *v98;
  uint64_t v99;
  void *v100;
  __CFString *v101;
  uint64_t v102;
  void *v103;
  __CFString *v104;
  uint64_t v105;
  void *v106;
  __CFString *v107;
  uint64_t v108;
  void *v109;
  __CFString *v110;
  uint64_t v111;
  void *v112;
  __CFString *v113;
  uint64_t v114;
  void *v115;
  __CFString *v116;
  uint64_t v117;
  void *v118;
  __CFString *v119;
  uint64_t v120;
  void *v121;
  __CFString *v122;
  uint64_t v123;
  void *v124;
  __CFString *v125;
  uint64_t v126;
  void *v127;
  __CFString *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  __CFString *v132;
  uint64_t v133;
  void *v134;
  __CFString *v135;
  uint64_t v136;
  void *v137;
  __CFString *v138;
  uint64_t v139;
  void *v140;
  __CFString *v141;
  uint64_t v142;
  void *v143;
  __CFString *v144;
  uint64_t v145;
  void *v146;
  __CFString *v147;
  uint64_t v148;
  void *v149;
  __CFString *v150;
  uint64_t v151;
  void *v152;
  __CFString *v153;
  uint64_t v154;
  void *v155;
  __CFString *v156;
  uint64_t v157;
  void *v158;
  __CFString *v159;
  uint64_t v160;
  void *v161;
  __CFString *v162;
  uint64_t v163;
  void *v164;
  __CFString *v165;
  uint64_t v166;
  void *v167;
  __CFString *v168;
  uint64_t v169;
  void *v170;
  __CFString *v171;
  uint64_t v172;
  void *v173;
  __CFString *v174;
  uint64_t v175;
  void *v176;
  __CFString *v177;
  uint64_t v178;
  void *v179;
  __CFString *v180;
  uint64_t v181;
  void *v182;
  __CFString *v183;
  uint64_t v184;
  void *v185;
  __CFString *v186;
  uint64_t v187;
  void *v188;
  __CFString *v189;
  uint64_t v190;
  void *v191;
  __CFString *v192;
  uint64_t v193;
  void *v194;
  __CFString *v195;
  uint64_t v196;
  void *v197;
  __CFString *v198;
  uint64_t v199;
  void *v200;
  __CFString *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  __CFString *v205;
  uint64_t v206;
  void *v207;
  __CFString *v208;
  uint64_t v209;
  void *v210;
  __CFString *v211;
  uint64_t v212;
  void *v213;
  __CFString *v214;
  uint64_t v215;
  void *v216;
  __CFString *v217;
  uint64_t v218;
  void *v219;
  __CFString *v220;
  uint64_t v221;
  void *v222;
  __CFString *v223;
  uint64_t v224;
  void *v225;
  __CFString *v226;
  uint64_t v227;
  void *v228;
  __CFString *v229;
  uint64_t v230;
  void *v231;
  __CFString *v232;
  uint64_t v233;
  void *v234;
  __CFString *v235;
  uint64_t v236;
  void *v237;
  __CFString *v238;
  uint64_t v239;
  void *v240;
  __CFString *v241;
  uint64_t v242;
  void *v243;
  __CFString *v244;
  uint64_t v245;
  void *v246;
  __CFString *v247;
  uint64_t v248;
  void *v249;
  __CFString *v250;
  uint64_t v251;
  void *v252;
  __CFString *v253;
  uint64_t v254;
  void *v255;
  __CFString *v256;
  uint64_t v257;
  void *v258;
  __CFString *v259;
  uint64_t v260;
  void *v261;
  __CFString *v262;
  uint64_t v263;
  void *v264;
  __CFString *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  __CFString *v274;
  void *v275;
  __CFString *v276;
  __CFString *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  unint64_t v287;
  unint64_t v288;
  void *v289;
  void *v290;
  __CFString *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  void *v316;
  id v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  uint64_t v322;
  uint64_t v323;
  double v324;
  uint64_t v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  id v335;
  id v336;
  id v337;
  id v338;
  id v339;
  id v340;
  uint64_t v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  unint64_t v357;
  uint64_t v358;
  uint64_t *v359;
  void *v360;
  void *v361;
  id v362;
  void *v363;
  uint64_t v364;
  uint64_t v365;
  int v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  int v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  uint64_t j;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  __CFString *v387;
  __CFString *v388;
  __CFString *v389;
  __CFString *v390;
  id v391;
  id v392;
  id v393;
  id v394;
  __CFString *v395;
  __CFString *v396;
  __CFString *v397;
  __CFString *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  __CFString *v413;
  __CFString *v414;
  __CFString *v415;
  __CFString *v416;
  void *v417;
  void *v418;
  void *v419;
  __CFString *v420;
  __CFString *v421;
  __CFString *v422;
  __CFString *v423;
  __CFString *v424;
  __CFString *v425;
  __CFString *v426;
  __CFString *v427;
  __CFString *v428;
  __CFString *v429;
  __CFString *v430;
  __CFString *v431;
  __CFString *v432;
  __CFString *v433;
  __CFString *v434;
  __CFString *v435;
  __CFString *v436;
  __CFString *v437;
  __CFString *v438;
  __CFString *v439;
  __CFString *v440;
  __CFString *v441;
  __CFString *v442;
  __CFString *v443;
  __CFString *v444;
  __CFString *v445;
  __CFString *v446;
  __CFString *v447;
  __CFString *v448;
  __CFString *v449;
  id v450;
  uint64_t v451;
  __CFString *v452;
  id v453;
  id v454;
  __CFString *v455;
  __CFString *v456;
  id v457;
  __CFString *v458;
  __CFString *v459;
  __CFString *v460;
  __CFString *v461;
  __CFString *v462;
  __CFString *v463;
  __CFString *v464;
  __CFString *v465;
  __CFString *v466;
  __CFString *v467;
  __CFString *v468;
  __CFString *v469;
  __CFString *v470;
  __CFString *v471;
  __CFString *v472;
  id v473;
  __CFString *v474;
  __CFString *v475;
  __CFString *v476;
  __CFString *v477;
  id v478;
  __CFString *v479;
  __CFString *v480;
  __CFString *v481;
  __CFString *v482;
  __CFString *v483;
  __CFString *v484;
  __CFString *v485;
  __CFString *v486;
  __CFString *v487;
  __CFString *v488;
  __CFString *v489;
  _BOOL4 v490;
  __CFString *v491;
  _BOOL4 v492;
  __CFString *v493;
  void *v494;
  void *v495;
  const char *v496;
  void *v497;
  uint64_t v498;
  unint64_t v499;
  void *v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  void *v504;
  __CFString *v505;
  void *v506;
  void *v507;
  void *v508;
  uint64_t v509;
  void *v510;
  __CFString *v511;
  id v512;
  void *v513;
  id v514;
  unint64_t v515;
  unint64_t *v516;
  uint64_t v517;
  uint64_t (*v518)(uint64_t, uint64_t);
  void (*v519)(uint64_t);
  id v520;
  _QWORD v521[256];
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int16 v526[8];
  _QWORD v527[4];
  id v528;
  unint64_t *v529;
  _QWORD v530[7];
  _QWORD v531[8];
  _QWORD v532[2];
  _QWORD v533[2];
  _QWORD v534[2];
  const __CFString *v535;
  uint64_t v536;
  void *v537;
  _QWORD v538[23];
  _BYTE v539[128];
  _QWORD v540[11];

  v15 = (void *)MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, a8);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v540[8] = *MEMORY[0x1E0C80C00];
  v394 = v15;
  v478 = v29;
  v514 = v27;
  v30 = v25;
  v512 = v23;
  v393 = v21;
  v392 = v19;
  v453 = v17;
  v454 = a9;
  v457 = a11;
  v31 = a14;
  v391 = a15;
  v507 = v30;
  v380 = v31;
  if ((objc_msgSend(v391, "isEqualToString:", CFSTR("com.apple.searchd")) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0DA9B68], "usingPommesRankingForClientBundle:", v391))
  {
    v32 = v457;
    if (((v394 != 0) & a13) != 0)
      v32 = v394;
    v33 = v32;
    if (getPortraitPeopleQueryWithTimeout_once != -1)
      dispatch_once(&getPortraitPeopleQueryWithTimeout_once, &__block_literal_global_987);
    v515 = 0;
    v516 = &v515;
    v517 = 0x3032000000;
    v518 = __Block_byref_object_copy__11;
    v519 = __Block_byref_object_dispose__11;
    v520 = 0;
    v34 = dispatch_group_create();
    v35 = (void *)getPortraitPeopleQueryWithTimeout_portraitQueue;
    v527[0] = MEMORY[0x1E0C809B0];
    v527[1] = 3221225472;
    v527[2] = __getPortraitPeopleQueryWithTimeout_block_invoke_2;
    v527[3] = &unk_1E6E438D0;
    v529 = &v515;
    v36 = v33;
    v528 = v36;
    v37 = v527;
    v38 = v35;
    v39 = v34;
    v40 = qos_class_self();
    if (v40 < 0x1A)
      v41 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37);
    else
      v41 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v40, 0, v37);
    v42 = v41;

    dispatch_group_async(v39, v38, v42);
    v43 = dispatch_time(0, 20000000);
    if (dispatch_group_wait(v39, v43))
    {
      PRSLogCategoryDefault();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v526[0] = 0;
        _os_log_impl(&dword_1B86C5000, v44, OS_LOG_TYPE_DEFAULT, "Portrait query timed out", (uint8_t *)v526, 2u);
      }

      v449 = CFSTR("false");
    }
    else
    {
      v449 = (__CFString *)(id)v516[5];
    }

    _Block_object_dispose(&v515, 8);
  }
  else
  {
    v449 = CFSTR("false");
  }
  if (v478)
  {
    v492 = SSStringStartsWithDoubleQuote(v478);
    v490 = SSStringEndsWithDoubleQuote(v478);
    v45 = SSStringEndsWithSpace(v478);
  }
  else
  {
    v492 = 0;
    v490 = 0;
    v45 = 0;
  }
  v499 = objc_msgSend(v30, "length");
  v46 = "**";
  if (v499 < 4)
    v46 = "*";
  v496 = v46;
  if (v512 && objc_msgSend(v512, "count"))
  {
    objc_msgSend(v512, "componentsJoinedByString:", CFSTR(" "));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SSPhraseQueryEscapeString(v478, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v473 = v47;

  _recencyInterval(CFSTR("-1Y"), CFSTR("-1M"), CFSTR("+1Y"), CFSTR("-1M"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v540[0] = v48;
  _recencyInterval(CFSTR("-270d"), CFSTR("-1d"), CFSTR("+1Y"), CFSTR("-1M"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v540[1] = v49;
  _recencyInterval(CFSTR("-180d"), CFSTR("-1d"), CFSTR("+6M"), CFSTR("-1M"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v540[2] = v50;
  _recencyInterval(CFSTR("-90d"), CFSTR("-1d"), CFSTR("+3M"), CFSTR("-1M"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v540[3] = v51;
  _recencyInterval(CFSTR("-30d"), CFSTR("-1d"), CFSTR("+1M"), CFSTR("-1M"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v540[4] = v52;
  _recencyInterval(CFSTR("-15d"), CFSTR("-1d"), CFSTR("+2w"), CFSTR("-1M"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v540[5] = v53;
  _recencyInterval(CFSTR("-7d"), CFSTR("-1d"), CFSTR("+1w"), CFSTR("-2w"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v540[6] = v54;
  _recencyInterval(CFSTR("-1d"), CFSTR("-1d"), CFSTR("+1d"), CFSTR("-1d"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v540[7] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v540, 8);
  v508 = (void *)objc_claimAutoreleasedReturnValue();

  if (sMeCardEmailsQuery)
  {
LABEL_27:
    v450 = 0;
    goto LABEL_45;
  }
  if (!objc_msgSend(v393, "count"))
  {
    if (objc_msgSend(v392, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\")"), *MEMORY[0x1E0CA6028], v392);
      v450 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("(FieldMatch(%@,"), *MEMORY[0x1E0CA6030]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v524 = 0u;
  v525 = 0u;
  v522 = 0u;
  v523 = 0u;
  v57 = v393;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v522, v539, 16);
  if (v58)
  {
    v59 = 0;
    v60 = *(_QWORD *)v523;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v523 != v60)
          objc_enumerationMutation(v57);
        v62 = CFSTR("\"%@\"");
        if (v59 + (_DWORD)i)
        {
          if (v59 + (_DWORD)i == 20)
            goto LABEL_39;
          v62 = CFSTR(",\"%@\"");
        }
        objc_msgSend(v56, "appendFormat:", v62, *(_QWORD *)(*((_QWORD *)&v522 + 1) + 8 * i));
      }
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v522, v539, 16);
      v59 += i;
    }
    while (v58);
  }
LABEL_39:

  if (objc_msgSend(v392, "length"))
    objc_msgSend(v56, "appendFormat:", CFSTR(")||%@=\"%@\")"), *MEMORY[0x1E0CA6028], v392);
  else
    objc_msgSend(v56, "appendString:", CFSTR(")"));
  v450 = v56;

LABEL_45:
  if (objc_msgSend(v454, "count") && !sSenderInVIPQuery)
    updateVIPRankingQuery(v454);
  if (objc_msgSend(v453, "count") && !sSenderInPhoneFavoritesQuery)
    updatePhoneFavoritesQuery(v453);
  pthread_mutex_lock(&sVIPLock_0);
  if (sMeCardEmailsQuery)
    v63 = (void *)sMeCardEmailsQuery;
  else
    v63 = v450;
  objc_storeStrong((id *)&sMeCardEmailsQuery, v63);
  v64 = objc_msgSend((id)sMeCardEmailsQuery, "length");
  v65 = (__CFString *)sMeCardEmailsQuery;
  if (!v64)
    v65 = CFSTR("false");
  v511 = v65;
  v66 = objc_msgSend((id)sReceiverInVIPQuery, "length");
  v67 = (__CFString *)sReceiverInVIPQuery;
  if (!v66)
    v67 = CFSTR("false");
  v455 = v67;
  v68 = objc_msgSend((id)sSenderInVIPQuery, "length");
  v69 = (__CFString *)sSenderInVIPQuery;
  if (!v68)
    v69 = CFSTR("false");
  v489 = v69;
  v70 = objc_msgSend((id)sEmailAddressInVIPQuery, "length");
  v71 = (__CFString *)sEmailAddressInVIPQuery;
  if (!v70)
    v71 = CFSTR("false");
  v448 = v71;
  v72 = objc_msgSend((id)sSenderInPhoneFavoritesQuery, "length");
  v73 = (__CFString *)sSenderInPhoneFavoritesQuery;
  if (!v72)
    v73 = CFSTR("false");
  v477 = v73;
  v74 = objc_msgSend((id)sReceiverInPhoneFavoritesQuery, "length");
  v75 = (__CFString *)sReceiverInPhoneFavoritesQuery;
  if (!v74)
    v75 = CFSTR("false");
  v447 = v75;
  pthread_mutex_unlock(&sVIPLock_0);
  v76 = -[__CFString length](v489, "length");
  v77 = (_QWORD *)MEMORY[0x1E0CA6A18];
  if (v76 || -[__CFString length](v477, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InRange(%@,1,1)"), *v77);
    v505 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v489, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) || (%@))"), v505, v489);
      v78 = objc_claimAutoreleasedReturnValue();

      v505 = (__CFString *)v78;
    }
    if (-[__CFString length](v477, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ || %@"), v505, v477);
      v79 = objc_claimAutoreleasedReturnValue();

      v505 = (__CFString *)v79;
    }
    if (objc_msgSend((id)sReceiverInVIPQuery, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) || (%@))"), v505, v455);
      v80 = objc_claimAutoreleasedReturnValue();

      v505 = (__CFString *)v80;
    }
  }
  else
  {
    v505 = CFSTR("false");
  }
  v503 = *MEMORY[0x1E0CA6158];
  v81 = __MDQueryStringCreateForRanking();
  v82 = (void *)v81;
  if (v81)
    v83 = (__CFString *)v81;
  else
    v83 = CFSTR("false");
  v467 = v83;

  v84 = __MDQueryStringCreateForRanking();
  v85 = (void *)v84;
  if (v84)
    v86 = (__CFString *)v84;
  else
    v86 = CFSTR("false");
  v468 = v86;

  v87 = __MDQueryStringCreateForRanking();
  v88 = (void *)v87;
  if (v87)
    v89 = (__CFString *)v87;
  else
    v89 = CFSTR("false");
  v472 = v89;

  v90 = __MDQueryStringCreateForRanking();
  v91 = (void *)v90;
  if (v90)
    v92 = (__CFString *)v90;
  else
    v92 = CFSTR("false");
  v485 = v92;

  v93 = __MDQueryStringCreateForRanking();
  v94 = (void *)v93;
  if (v93)
    v95 = (__CFString *)v93;
  else
    v95 = CFSTR("false");
  v469 = v95;

  v96 = __MDQueryStringCreateForRanking();
  v97 = (void *)v96;
  if (v96)
    v98 = (__CFString *)v96;
  else
    v98 = CFSTR("false");
  v442 = v98;

  v502 = *MEMORY[0x1E0CA68D8];
  v99 = __MDQueryStringCreateForRanking();
  v100 = (void *)v99;
  if (v99)
    v101 = (__CFString *)v99;
  else
    v101 = CFSTR("false");
  v462 = v101;

  v102 = __MDQueryStringCreateForRanking();
  v103 = (void *)v102;
  if (v102)
    v104 = (__CFString *)v102;
  else
    v104 = CFSTR("false");
  v464 = v104;

  v105 = __MDQueryStringCreateForRanking();
  v106 = (void *)v105;
  if (v105)
    v107 = (__CFString *)v105;
  else
    v107 = CFSTR("false");
  v470 = v107;

  v108 = __MDQueryStringCreateForRanking();
  v109 = (void *)v108;
  if (v108)
    v110 = (__CFString *)v108;
  else
    v110 = CFSTR("false");
  v484 = v110;

  v111 = __MDQueryStringCreateForRanking();
  v112 = (void *)v111;
  if (v111)
    v113 = (__CFString *)v111;
  else
    v113 = CFSTR("false");
  v466 = v113;

  v501 = *MEMORY[0x1E0CA6048];
  v114 = __MDQueryStringCreateForRanking();
  v115 = (void *)v114;
  if (v114)
    v116 = (__CFString *)v114;
  else
    v116 = CFSTR("false");
  v446 = v116;

  v117 = __MDQueryStringCreateForRanking();
  v118 = (void *)v117;
  if (v117)
    v119 = (__CFString *)v117;
  else
    v119 = CFSTR("false");
  v486 = v119;

  v120 = __MDQueryStringCreateForRanking();
  v121 = (void *)v120;
  if (v120)
    v122 = (__CFString *)v120;
  else
    v122 = CFSTR("false");
  v488 = v122;

  v123 = __MDQueryStringCreateForRanking();
  v124 = (void *)v123;
  if (v123)
    v125 = (__CFString *)v123;
  else
    v125 = CFSTR("false");
  v487 = v125;

  v126 = __MDQueryStringCreateForRanking();
  v127 = (void *)v126;
  if (v126)
    v128 = (__CFString *)v126;
  else
    v128 = CFSTR("false");
  v471 = v128;

  v129 = *MEMORY[0x1E0CA6630];
  v130 = __MDQueryStringCreateForRanking();
  v131 = (void *)v130;
  if (v130)
    v132 = (__CFString *)v130;
  else
    v132 = CFSTR("false");
  v461 = v132;

  v133 = __MDQueryStringCreateForRanking();
  v134 = (void *)v133;
  if (v133)
    v135 = (__CFString *)v133;
  else
    v135 = CFSTR("false");
  v480 = v135;

  v136 = __MDQueryStringCreateForRanking();
  v137 = (void *)v136;
  if (v136)
    v138 = (__CFString *)v136;
  else
    v138 = CFSTR("false");
  v483 = v138;

  v139 = __MDQueryStringCreateForRanking();
  v140 = (void *)v139;
  if (v139)
    v141 = (__CFString *)v139;
  else
    v141 = CFSTR("false");
  v481 = v141;

  v142 = __MDQueryStringCreateForRanking();
  v143 = (void *)v142;
  if (v142)
    v144 = (__CFString *)v142;
  else
    v144 = CFSTR("false");
  v479 = v144;

  v498 = *MEMORY[0x1E0CA67D8];
  v145 = __MDQueryStringCreateForRanking();
  v146 = (void *)v145;
  if (v145)
    v147 = (__CFString *)v145;
  else
    v147 = CFSTR("false");
  v456 = v147;

  v148 = __MDQueryStringCreateForRanking();
  v149 = (void *)v148;
  if (v148)
    v150 = (__CFString *)v148;
  else
    v150 = CFSTR("false");
  v474 = v150;

  v151 = __MDQueryStringCreateForRanking();
  v152 = (void *)v151;
  if (v151)
    v153 = (__CFString *)v151;
  else
    v153 = CFSTR("false");
  v476 = v153;

  v154 = __MDQueryStringCreateForRanking();
  v155 = (void *)v154;
  if (v154)
    v156 = (__CFString *)v154;
  else
    v156 = CFSTR("false");
  v475 = v156;

  v157 = __MDQueryStringCreateForRanking();
  v158 = (void *)v157;
  if (v157)
    v159 = (__CFString *)v157;
  else
    v159 = CFSTR("false");
  v452 = v159;

  v509 = *MEMORY[0x1E0CA6968];
  v160 = __MDQueryStringCreateForRanking();
  v161 = (void *)v160;
  if (v160)
    v162 = (__CFString *)v160;
  else
    v162 = CFSTR("false");
  v458 = v162;

  v163 = __MDQueryStringCreateForRanking();
  v164 = (void *)v163;
  if (v163)
    v165 = (__CFString *)v163;
  else
    v165 = CFSTR("false");
  v459 = v165;

  v166 = __MDQueryStringCreateForRanking();
  v167 = (void *)v166;
  if (v166)
    v168 = (__CFString *)v166;
  else
    v168 = CFSTR("false");
  v463 = v168;

  v169 = __MDQueryStringCreateForRanking();
  v170 = (void *)v169;
  if (v169)
    v171 = (__CFString *)v169;
  else
    v171 = CFSTR("false");
  v482 = v171;

  v172 = __MDQueryStringCreateForRanking();
  v173 = (void *)v172;
  if (v172)
    v174 = (__CFString *)v172;
  else
    v174 = CFSTR("false");
  v460 = v174;

  v175 = __MDQueryStringCreateForRanking();
  v176 = (void *)v175;
  if (v175)
    v177 = (__CFString *)v175;
  else
    v177 = CFSTR("false");
  v465 = v177;

  v178 = __MDQueryStringCreateForRanking();
  v179 = (void *)v178;
  if (v178)
    v180 = (__CFString *)v178;
  else
    v180 = CFSTR("false");
  v445 = v180;

  v181 = __MDQueryStringCreateForRanking();
  v182 = (void *)v181;
  if (v181)
    v183 = (__CFString *)v181;
  else
    v183 = CFSTR("false");
  v444 = v183;

  v184 = __MDQueryStringCreateForRanking();
  v185 = (void *)v184;
  if (v184)
    v186 = (__CFString *)v184;
  else
    v186 = CFSTR("false");
  v443 = v186;

  v187 = __MDQueryStringCreateForRanking();
  v188 = (void *)v187;
  if (v187)
    v189 = (__CFString *)v187;
  else
    v189 = CFSTR("false");
  v441 = v189;

  v190 = __MDQueryStringCreateForRanking();
  v191 = (void *)v190;
  if (v190)
    v192 = (__CFString *)v190;
  else
    v192 = CFSTR("false");
  v440 = v192;

  v193 = __MDQueryStringCreateForRanking();
  v194 = (void *)v193;
  if (v193)
    v195 = (__CFString *)v193;
  else
    v195 = CFSTR("false");
  v439 = v195;

  v196 = __MDQueryStringCreateForRanking();
  v197 = (void *)v196;
  if (v196)
    v198 = (__CFString *)v196;
  else
    v198 = CFSTR("false");
  v438 = v198;

  v199 = __MDQueryStringCreateForRanking();
  v200 = (void *)v199;
  if (v199)
    v201 = (__CFString *)v199;
  else
    v201 = CFSTR("false");
  v437 = v201;

  v202 = *MEMORY[0x1E0CA5FF8];
  v203 = __MDQueryStringCreateForRanking();
  v204 = (void *)v203;
  if (v203)
    v205 = (__CFString *)v203;
  else
    v205 = CFSTR("false");
  v388 = v205;

  v206 = __MDQueryStringCreateForRanking();
  v207 = (void *)v206;
  if (v206)
    v208 = (__CFString *)v206;
  else
    v208 = CFSTR("false");
  v389 = v208;

  v209 = __MDQueryStringCreateForRanking();
  v210 = (void *)v209;
  if (v209)
    v211 = (__CFString *)v209;
  else
    v211 = CFSTR("false");
  v420 = v211;

  v212 = __MDQueryStringCreateForRanking();
  v213 = (void *)v212;
  if (v212)
    v214 = (__CFString *)v212;
  else
    v214 = CFSTR("false");
  v390 = v214;

  v215 = __MDQueryStringCreateForRanking();
  v216 = (void *)v215;
  if (v215)
    v217 = (__CFString *)v215;
  else
    v217 = CFSTR("false");
  v387 = v217;

  if (objc_msgSend(v514, "length"))
  {
    v218 = __MDQueryStringCreateForRanking();
    v219 = (void *)v218;
    if (v218)
      v220 = (__CFString *)v218;
    else
      v220 = CFSTR("false");
    v436 = v220;

  }
  else
  {
    v436 = CFSTR("false");
  }
  v221 = __MDQueryStringCreateForRanking();
  v222 = (void *)v221;
  if (v221)
    v223 = (__CFString *)v221;
  else
    v223 = CFSTR("false");
  v435 = v223;

  v224 = __MDQueryStringCreateForRanking();
  v225 = (void *)v224;
  if (v224)
    v226 = (__CFString *)v224;
  else
    v226 = CFSTR("false");
  v431 = v226;

  v227 = __MDQueryStringCreateForRanking();
  v228 = (void *)v227;
  if (v227)
    v229 = (__CFString *)v227;
  else
    v229 = CFSTR("false");
  v434 = v229;

  v230 = __MDQueryStringCreateForRanking();
  v231 = (void *)v230;
  if (v230)
    v232 = (__CFString *)v230;
  else
    v232 = CFSTR("false");
  v433 = v232;

  v233 = __MDQueryStringCreateForRanking();
  v234 = (void *)v233;
  if (v233)
    v235 = (__CFString *)v233;
  else
    v235 = CFSTR("false");
  v427 = v235;

  v236 = __MDQueryStringCreateForRanking();
  v237 = (void *)v236;
  if (v236)
    v238 = (__CFString *)v236;
  else
    v238 = CFSTR("false");
  v429 = v238;

  v239 = __MDQueryStringCreateForRanking();
  v240 = (void *)v239;
  if (v239)
    v241 = (__CFString *)v239;
  else
    v241 = CFSTR("false");
  v432 = v241;

  v242 = __MDQueryStringCreateForRanking();
  v243 = (void *)v242;
  if (v242)
    v244 = (__CFString *)v242;
  else
    v244 = CFSTR("false");
  v430 = v244;

  v245 = __MDQueryStringCreateForRanking();
  v246 = (void *)v245;
  if (v245)
    v247 = (__CFString *)v245;
  else
    v247 = CFSTR("false");
  v424 = v247;

  v248 = __MDQueryStringCreateForRanking();
  v249 = (void *)v248;
  if (v248)
    v250 = (__CFString *)v248;
  else
    v250 = CFSTR("false");
  v428 = v250;

  v251 = __MDQueryStringCreateForRanking();
  v252 = (void *)v251;
  if (v251)
    v253 = (__CFString *)v251;
  else
    v253 = CFSTR("false");
  v426 = v253;

  v254 = __MDQueryStringCreateForRanking();
  v255 = (void *)v254;
  if (v254)
    v256 = (__CFString *)v254;
  else
    v256 = CFSTR("false");
  v425 = v256;

  v257 = __MDQueryStringCreateForRanking();
  v258 = (void *)v257;
  if (v257)
    v259 = (__CFString *)v257;
  else
    v259 = CFSTR("false");
  v423 = v259;

  v260 = __MDQueryStringCreateForRanking();
  v261 = (void *)v260;
  if (v260)
    v262 = (__CFString *)v260;
  else
    v262 = CFSTR("false");
  v422 = v262;

  v263 = __MDQueryStringCreateForRanking();
  v264 = (void *)v263;
  if (v263)
    v265 = (__CFString *)v263;
  else
    v265 = CFSTR("false");
  v421 = v265;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) || (%@)) && (!InRange(_kMDItemShortcutLastUsedDate, 0, $time.now(-%dd)))"), v465, v445, 150);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  bzero(&v515, 0x1408uLL);
  if (-[__CFString length](v511, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)) && (%@)"), v472, v470, v488, v476, v511, v483, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v463, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) || ((%@ || %@ || %@) && %@) || (%@)) && (%@)"), v472, v470, v488, v483, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v463, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemSpecialCondition1"), v266);

  if (-[__CFString length](v511, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)) && (%@)"), v485, v484, v487, v475, v511, v481, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v482, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) || ((%@ || %@ || %@) && %@) || (%@)) && (%@)"), v485, v484, v487, v481, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v482, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemSpecialCondition2"), v267);

  if (-[__CFString length](v511, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)"), v469, v466, v471, v452, v511, v479, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v460);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) || ((%@ || %@ || %@) && %@) || (%@)"), v469, v466, v471, v479, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v460);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemSpecialCondition3"), v268);

  if (-[__CFString length](v511, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)"), v468, v464, v486, v474, v511, v480, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v459);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) || ((%@ || %@ || %@) && %@) || (%@)"), v468, v464, v486, v480, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v459);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemSpecialCondition4"), v269);

  if (-[__CFString length](v511, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) || (((%@ || %@) || (%@ && %@) || %@) && %@) || (%@)"), v467, v462, v446, v456, v511, v461, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v458);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) || ((%@ || %@ || %@) && %@) || (%@)"), v467, v462, v446, v461, CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemInterestingDate_Ranking,$time.today(-15d),$time.now(+1d)))"), v458);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemSpecialCondition5"), v270);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InRange(%@,1,1) || kMDItemUserTags=\"*\""), *v77);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("ItemIsFlagged"), v271);

  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PortraitImportantPeople"), v449);
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PhoneFavoritesInReceivers"), v447);
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PhoneFavoritesInSender"), v477);
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("VIPInEmails"), v448);
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("receiver_is_vip2"), v455);
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("sender_is_vip2"), v489);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemNamedLocationExactWord"), v441);
  PRSRankingQueryInfoAdd(&v515, 8, (uint64_t)CFSTR("kMDItemNamedLocationExactPrefix"), v443);
  PRSRankingQueryInfoAdd(&v515, 16, (uint64_t)CFSTR("kMDItemNamedLocationExact"), v444);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemArtistPrefixTokenized"), v439);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemArtistPrefixWord"), v438);
  PRSRankingQueryInfoAdd(&v515, 4, (uint64_t)CFSTR("kMDItemArtistExactWord"), v437);
  PRSRankingQueryInfoAdd(&v515, 8, (uint64_t)CFSTR("kMDItemArtistExactPrefix"), v440);
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemAuthorsPrefixTokenized"), v488);
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemRecipientsPrefixTokenized"), v476);
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemAuthorsPrefixWord"), v487);
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemRecipientsPrefixWord"), v475);
  PRSRankingQueryInfoAdd(&v515, 64, (uint64_t)CFSTR("kMDItemAuthorsExactPrefix"), v486);
  PRSRankingQueryInfoAdd(&v515, 64, (uint64_t)CFSTR("kMDItemRecipientsExactPrefix"), v474);
  PRSRankingQueryInfoAdd(&v515, 128, (uint64_t)CFSTR("kMDItemAuthorsExact"), v486);
  PRSRankingQueryInfoAdd(&v515, 128, (uint64_t)CFSTR("kMDItemRecipientsExact"), v456);
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemDisplayNamePrefixWord"), v485);
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemSubjectPrefixWord"), v484);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) && (%@)"), v482, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemTitlePrefixWord"), v272);

  if (v473)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@*\"cd"), CFSTR("kMDItemUserTags"), v473);
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemRankingTagMatch"), v273);

  }
  else
  {
    PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemRankingTagMatch"), CFSTR("false"));
  }
  if (-[__CFString length](v511, "length"))
    v274 = v511;
  else
    v274 = CFSTR("false");
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemUserIsSender"), v274);
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemContentCreationRecent"), CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemDateAdded_Ranking,$time.today(-15d),$time.now(+1d)) || InRange(kMDItemMailDateReceived_Ranking,$time.today(-7d),$time.now(+1d)))"));
  if (v473)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s=\"%@*\"cwdt"), v496, v473);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemEscapedWord"), v275);

  }
  else
  {
    PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemEscapedWord"), CFSTR("false"));
  }
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemCreationDateThisYear"), CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-1Y),$time.now) || InRange(kMDItemDateAdded_Ranking, $time.today(-1Y), $time.now))"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemLastUsedDateThisYear"), CFSTR("InRange(kMDItemLastUsedDate_Ranking,$time.today(-1Y),$time.now)"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemContentCreationThisMonth"), CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-1M),$time.now) || InRange(kMDItemDateAdded_Ranking, $time.today(-1M), $time.now))"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemLastUsedDateThisMonth"), CFSTR("InRange(kMDItemLastUsedDate_Ranking,$time.today(-1M),$time.now)"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemContentCreationThisWeek"), CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(-1w),$time.now) || InRange(kMDItemDateAdded_Ranking, $time.today(-1w), $time.now))"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemLastUsedDateThisWeek"), CFSTR("InRange(kMDItemLastUsedDate_Ranking,$time.today(-1w),$time.now)"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemEventTodayToNextYear"), CFSTR("InRange(kMDItemStartDate_Ranking,$time.today,$time.today(+1Y))"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemEventLastMonthToToday"), CFSTR("InRange(kMDItemStartDate_Ranking,$time.today(-1M),$time.today)"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemEventTodayToNextMonth"), CFSTR("InRange(kMDItemStartDate_Ranking,$time.today,$time.today(+1M))"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemEventTodayToNextWeek"), CFSTR("InRange(kMDItemStartDate_Ranking,$time.today,$time.today(+1w))"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemEventTodayToLastWeek"), CFSTR("InRange(kMDItemStartDate_Ranking,$time.today(-1w),$time.today)"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemEventYesterdayToToday"), CFSTR("InRange(kMDItemStartDate,$time.today(-1d),$time.today)"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemEventToday"), CFSTR("InRange(kMDItemStartDate,$time.today,$time.today(+1d))"));
  if (v499 >= 4)
    v276 = v435;
  else
    v276 = CFSTR("false");
  if (v499 >= 4)
    v277 = v436;
  else
    v277 = CFSTR("false");
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemTextContentTokenizedMatch"), v276);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemTextContentMatch"), v277);
  if (-[__CFString length](v511, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || (%@ && %@) || %@)"), v488, v476, v511, v483);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || %@)"), v488, v483);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemAuthorsOrRecipientsTokenizedPrefixMatch"), v278);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v434);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemDescriptionTokenizedPrefixMatch"), v279);

  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemAlbumTokenizedPrefixMatch"), v432);
  if (-[__CFString length](v511, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || (%@ && %@) || %@)"), v487, v475, v511, v481);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || %@)"), v487, v481);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemAuthorsOrRecipientsNonTokenizedPrefixMatch"), v280);

  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemDescriptionPrefixWordMatch"), v433);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemComposerPrefixWordMatch"), v426);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemAlbumPrefixWordMatch"), v430);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemComposerNonTokenizedPrefixMatch"), v428);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemComposerNonTokenizedWordMatch"), v425);
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemAppSBLaunchedDateLastWeek"), CFSTR("InRange(_kMDItemApplicationLastLaunchedDate,$time.today(-7d),$time.today(+1d))"));
  if (-[__CFString length](v511, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || (%@ && %@) || %@)"), v486, v474, v511, v480);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || %@)"), v486, v480);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 64, (uint64_t)CFSTR("kMDItemAuthorsOrRecipientsPrefixWordMatch"), v281);

  PRSRankingQueryInfoAdd(&v515, 64, (uint64_t)CFSTR("kMDItemDescriptionExactPrefixMatch"), v431);
  PRSRankingQueryInfoAdd(&v515, 64, (uint64_t)CFSTR("kMDItemAlbumNonTokenizedPrefixMatch"), v429);
  if (-[__CFString length](v511, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || (%@ && %@) || %@)"), v471, v452, v511, v479);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ || %@"), v471, v479);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 32, (uint64_t)CFSTR("kMDItemAuthorsOrRecipientsExactMatch"), v282);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v427);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemDescriptionNonTokenizedWordMatch"), v283);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v424);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 4, (uint64_t)CFSTR("kMDItemAlbumNonTokenizedWordMatch"), v284);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(_kMDItemUserActivityEligibleForPublicIndexing=1 || _kMDItemUserActivityEligibleForPublicIndexing=0)"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemUserActivity"), v285);

  PRSRankingQueryInfoAdd(&v515, 32, (uint64_t)CFSTR("kMDItemAlternateNameNonTokenizedWordMatch"), v421);
  PRSRankingQueryInfoAdd(&v515, 64, (uint64_t)CFSTR("kMDItemAlternateNamePrefixWordMatch"), v422);
  PRSRankingQueryInfoAdd(&v515, 128, (uint64_t)CFSTR("kMDItemAlternateNameExactMatch"), v423);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ && (_kMDItemShortcutLastUsedDate>$time.now(-3d))"), v465);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemShortcutRecent"), v286);

  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemDueDateInLastOneToNextTwentyFourHours"), CFSTR("InRange(kMDItemDueDate,$time.today(-1h),$time.today(+1d))"));
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemDueDateInLastOneToNextOneHour"), CFSTR("InRange(kMDItemDueDate,$time.now(-1h),$time.now(+1h))"));
  v287 = objc_msgSend(v457, "length");
  v288 = +[PRSRankingItemRanker spellCorrectedAppMinQueryLen](PRSRankingItemRanker, "spellCorrectedAppMinQueryLen");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v442);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2 * (v287 > v288), (uint64_t)CFSTR("kMDItemDisplayNameCorrections"), v289);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) || (%@) || (%@) || (%@)) && (%@)"), v472, v470, v463, v483, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch"), v290);

  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemContentCreationDateToday"), CFSTR("(InRange(kMDItemContentCreationDate,$time.today(-1d),$time.now) || InRange(kMDItemDateAdded, $time.today(-1d), $time.now) || InRange(com_apple_mail_dateReceived, $time.today(-1d), $time.now))"));
  if (v505)
    v291 = v505;
  else
    v291 = CFSTR("false");
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemBoostedVIPFavorites"), v291);
  if (v505)
  {
    v292 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v508, "objectAtIndexedSubscript:", 4);
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v292, "stringWithFormat:", CFSTR("(%@ && %@)"), v505, v293);
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemBoostedVIPFavoritesRecent"), v294);

  }
  else
  {
    PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("kMDItemBoostedVIPFavoritesRecent"), CFSTR("false"));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) || (%@) || (%@) || (%@)) && (%@)"), v485, v484, v482, v481, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 512, (uint64_t)CFSTR("kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch"), v295);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) || (%@) || (%@) || (%@)) && (%@)"), v469, v466, v460, v479, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 32, (uint64_t)CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch"), v296);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) || (%@) || (%@) || (%@)"), v468, v464, v459, v480);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 64, (uint64_t)CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch"), v297);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) || (%@) || (%@) || (%@)"), v467, v462, v458, v461);
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 128, (uint64_t)CFSTR("kMDItemDisplayNameOrSubjectOrTitleExactMatch"), v298);

  objc_msgSend(v508, "objectAtIndexedSubscript:", 0);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PRSRankingRecency365Days"), v299);

  objc_msgSend(v508, "objectAtIndexedSubscript:", 1);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PRSRankingRecency270Days"), v300);

  objc_msgSend(v508, "objectAtIndexedSubscript:", 2);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PRSRankingRecency180Days"), v301);

  objc_msgSend(v508, "objectAtIndexedSubscript:", 3);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PRSRankingRecency90Days"), v302);

  objc_msgSend(v508, "objectAtIndexedSubscript:", 4);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PRSRankingRecency30Days"), v303);

  objc_msgSend(v508, "objectAtIndexedSubscript:", 5);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PRSRankingRecency15Days"), v304);

  objc_msgSend(v508, "objectAtIndexedSubscript:", 6);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PRSRankingRecency7Days"), v305);

  objc_msgSend(v508, "objectAtIndexedSubscript:", 7);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 0, (uint64_t)CFSTR("PRSRankingRecency1Days"), v306);

  v307 = *MEMORY[0x1E0CA6030];
  v538[0] = v501;
  v451 = v307;
  v538[1] = v307;
  v538[2] = v503;
  v538[3] = v502;
  v538[4] = v509;
  v538[5] = v129;
  v308 = *MEMORY[0x1E0CA65D0];
  v538[6] = *MEMORY[0x1E0CA6618];
  v538[7] = v308;
  v309 = *MEMORY[0x1E0CA65F8];
  v538[8] = *MEMORY[0x1E0CA66A8];
  v538[9] = v309;
  v310 = *MEMORY[0x1E0CA65B0];
  v538[10] = *MEMORY[0x1E0CA65B8];
  v538[11] = v310;
  v311 = *MEMORY[0x1E0CA6678];
  v538[12] = *MEMORY[0x1E0CA6588];
  v538[13] = v311;
  v312 = *MEMORY[0x1E0CA65A8];
  v538[14] = *MEMORY[0x1E0CA6688];
  v538[15] = v312;
  v313 = *MEMORY[0x1E0CA6610];
  v538[16] = *MEMORY[0x1E0CA6580];
  v538[17] = v313;
  v314 = *MEMORY[0x1E0CA65E8];
  v538[18] = *MEMORY[0x1E0CA65D8];
  v538[19] = v314;
  v315 = *MEMORY[0x1E0CA6598];
  v538[20] = *MEMORY[0x1E0CA66B0];
  v538[21] = v315;
  v538[22] = *MEMORY[0x1E0CA5F40];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v538, 23);
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  v536 = v509;
  v535 = CFSTR("com.apple.mobilemail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v535, 1);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  v537 = v316;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v537, &v536, 1);
  v500 = (void *)objc_claimAutoreleasedReturnValue();

  v533[0] = v202;
  v533[1] = v129;
  v534[0] = &stru_1E6E549F0;
  v534[1] = &stru_1E6E549F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v534, v533, 2);
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  v532[0] = v202;
  v532[1] = v129;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v532, 2);
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  v317 = v512;
  _countingRankingQueryArray(v317, v497, 1);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  _countingRankingQueryArray(v317, v497, 0);
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  v318 = (void *)MEMORY[0x1E0CB3940];
  v513 = v317;
  _rankingQueryPolicyComposite(v317, v497, v500, 0);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v318, "stringWithFormat:", CFSTR("((%@) && (kMDItemInterestingDate_Ranking==*))"), v319);
  v412 = (void *)objc_claimAutoreleasedReturnValue();

  v320 = (void *)MEMORY[0x1E0CB3940];
  _rankingQueryPolicyComposite(v513, v497, v500, 1);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v320, "stringWithFormat:", CFSTR("((%@) && (kMDItemInterestingDate_Ranking==*))"), v321);
  v411 = (void *)objc_claimAutoreleasedReturnValue();

  PRSRankingQueryInfoAdd(&v515, 1024, (uint64_t)CFSTR("PRSRankingPrefixCount"), v419);
  PRSRankingQueryInfoAdd(&v515, 2048, (uint64_t)CFSTR("PRSRankingExactCount"), v418);
  _rankingPhraseQueryPolicyComposite(v513, v507, v497, v500, v492, v490, v45, a12);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  v322 = v509;
  v323 = v202;
  if ((unint64_t)objc_msgSend(v513, "count") < 6)
  {
    v325 = 7;
  }
  else
  {
    v324 = (double)(unint64_t)objc_msgSend(v513, "count") * 1.5;
    if (v324 < 20.0)
      v324 = 20.0;
    v325 = (int)v324;
  }
  if ((unint64_t)objc_msgSend(v513, "count") < 2)
  {
    v416 = v390;
  }
  else
  {
    _rankingTCNearQueryHelper(v513, v507, v494, v495, 7u, v492, v490, v45, a12, 0);
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, v325, 0, 1u);
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, v325, 0, 2u);
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingJoinedTCClauses(v326, v327, v328, v325);
    v416 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v322 = v509;
    v323 = v202;
  }
  if ((unint64_t)objc_msgSend(v513, "count") < 2)
  {
    v415 = v420;
  }
  else
  {
    _rankingTCNearQueryHelper(v513, v507, v494, v495, 7u, v492, v490, v45, a12, 1);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, v325, 1, 1u);
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, v325, 1, 2u);
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingJoinedTCClauses(v329, v330, v331, v325);
    v415 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v322 = v509;
    v323 = v202;
  }
  if ((unint64_t)objc_msgSend(v513, "count") < 2)
  {
    v414 = v420;
  }
  else
  {
    _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, v492, v490, v45, a12, 1);
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, 0, 1, 1u);
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, v492, v490, v45, a12, 0, 1, 2u);
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingJoinedTCClauses(v332, v333, v334, 0);
    v414 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v322 = v509;
    v323 = v202;
  }
  _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, v325, 0, 1u);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, v325, 1, 1u);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, 0, 1, 1u);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, v325, 0, 1u);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, v325, 1, 1u);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, 0, 1, 1u);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, 1, 0, v45, a12, 0, 1, 1u);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, v325, 0, 2u);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, v325, 1, 2u);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, v492, v490, v45, a12, 0, 1, 2u);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, v325, 0, 2u);
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, v325, 1, 2u);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, 1, 1u, v45, a12, 0, 1, 2u);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiPhraseQueryComposite(v513, 1, 0, v45, a12, 0, 1, 2u);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v513, "count") < 2)
  {
    v493 = CFSTR("false");
  }
  else
  {
    v335 = v386;
    v336 = v385;
    _rankingJoinedTCClauses(v335, v336, CFSTR("false"), v325);
    v493 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v322 = v509;
    v323 = v202;
  }
  if ((unint64_t)objc_msgSend(v513, "count") < 2)
  {
    v491 = CFSTR("false");
  }
  else
  {
    v337 = v383;
    v338 = v384;
    _rankingJoinedTCClauses(v337, v338, CFSTR("false"), v325);
    v491 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v322 = v509;
    v323 = v202;
  }
  if ((unint64_t)objc_msgSend(v513, "count") < 2)
  {
    v413 = CFSTR("false");
  }
  else
  {
    v339 = v382;
    v340 = v381;
    _rankingJoinedTCClauses(v339, v340, CFSTR("false"), v325);
    v413 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v322 = v509;
    v323 = v202;
  }
  v531[0] = v501;
  v531[1] = v451;
  v341 = *MEMORY[0x1E0CA66F8];
  v531[2] = v498;
  v531[3] = v341;
  v531[4] = v502;
  v531[5] = v322;
  v531[6] = v503;
  v531[7] = v323;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v531, 8);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiFieldsTCNearQueryCombo(v513, v401, v500, 255, 0, v45, a12, 1);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingMostlyExactMultiFieldsDomainTCMatch"), v379);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTCNearMatch"), v416);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingOneTwoTermsMultiPhraseTCNearMatch"), v493);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTCOrderedMatch"), v415);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingOneTwoTermsMultiPhraseTCOrderedMatch"), v491);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTCOrderedPhraseMatch"), v414);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingOneTwoTermsMultiPhraseTCOrderedPhraseMatch"), v413);
  _rankingPhraseQueryPolicyComposite(v513, v507, v497, v500, 1, 1, v45, a12);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingPhraseQueryPolicyComposite(v513, v507, v497, v500, 1, 0, v45, a12);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v513, "count") < 2)
  {
    v398 = v389;
  }
  else
  {
    _rankingTCNearQueryHelper(v513, v507, v494, v495, v325, 1, 1, v45, a12, 0);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, v325, 0, 1u);
    v343 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, v325, 0, 2u);
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingJoinedTCClauses(v342, v343, v344, v325);
    v398 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v322 = v509;
    v323 = v202;
  }
  if ((unint64_t)objc_msgSend(v513, "count") < 2)
  {
    v397 = v388;
  }
  else
  {
    _rankingTCNearQueryHelper(v513, v507, v494, v495, v325, 1, 1, v45, a12, 1);
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, v325, 1, 1u);
    v346 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, v325, 1, 2u);
    v347 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingJoinedTCClauses(v345, v346, v347, v325);
    v397 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v322 = v509;
    v323 = v202;
  }
  if ((unint64_t)objc_msgSend(v513, "count") >= 2)
  {
    _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, 1, 1, v45, a12, 1);
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, 0, 1, 1u);
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, 1, 1u, v45, a12, 0, 1, 2u);
    v350 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingJoinedTCClauses(v348, v349, v350, 0);
    v396 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_342:
    v322 = v509;
    v323 = v202;
    goto LABEL_344;
  }
  if ((unint64_t)objc_msgSend(v507, "length") >= 3)
  {
    _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, 1, 1, v45, a12, 1);
    v351 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingJoinedTCClauses(v351, CFSTR("false"), CFSTR("false"), 0);
    v396 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_342;
  }
  v396 = v387;
LABEL_344:
  if ((unint64_t)objc_msgSend(v513, "count") < 2)
  {
    if ((unint64_t)objc_msgSend(v507, "length") < 3)
    {
      v395 = v387;
      goto LABEL_350;
    }
    _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, 1, 0, v45, a12, 1);
    v355 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingJoinedTCClauses(v355, CFSTR("false"), CFSTR("false"), 0);
    v395 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rankingTCNearQueryHelper(v513, v507, v494, v495, 0, 1, 0, v45, a12, 1);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, 1, 0, v45, a12, 0, 1, 1u);
    v353 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseTCQueryComposite(v513, 1, 0, v45, a12, 0, 1, 2u);
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingJoinedTCClauses(v352, v353, v354, 0);
    v395 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v322 = v509;
  v323 = v202;
LABEL_350:
  _rankingMultiFieldsTCNearQueryCombo(v513, v401, v500, 255, 0, v45, a12, 0);
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingMostlyExactMultiFieldsTCMatch"), v378);
  _rankingMultiFieldsTCNearQueryCombo(v513, v401, v500, v325, 0, v45, a12, 0);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingMostlyExactMultiFieldsTCNearMatch"), v377);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTCMostlyExactOrderedPhraseMatch"), v395);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingOneTermMultiPhraseTCMostlyExactOrderedPhraseMatch"), v409);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTwoTermsMultiPhraseTCMostlyExactOrderedPhraseMatch"), v408);
  v530[0] = v501;
  v530[1] = v451;
  v530[2] = v498;
  v530[3] = v502;
  v530[4] = v322;
  v530[5] = v503;
  v530[6] = v323;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v530, 7);
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  _rankingMultiFieldsTCNearQueryCombo(v513, v504, v500, v325, 1u, v45, a12, 0);
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingExactMultiFieldsTCNearMatch"), v506);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTCExactNearMatch"), v398);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingOneTermMultiPhraseTCExactNearMatch"), v405);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTwoTermsMultiPhraseTCExactNearMatch"), v403);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTCExactOrderedMatch"), v397);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingOneTermMultiPhraseTCExactOrderedMatch"), v404);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch"), v406);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTCExactOrderedPhraseMatch"), v396);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingOneTermMultiPhraseTCExactOrderedPhraseMatch"), v407);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSRankingTwoTermsMultiPhraseTCExactOrderedPhraseMatch"), v402);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSPolicyFieldsPrefixMatch"), v412);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSPolicyFieldsPhraseMatchBit"), v410);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSPolicyFieldsMostlyExactPhraseMatchBit"), v399);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("exact_policy_flag_bit"), v411);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("PRSPolicyFieldsExactPhraseMatchBit"), v400);
  PRSRankingQueryInfoAdd(&v515, 2, (uint64_t)CFSTR("kMDItemShortcutWithinBagParamValue"), v417);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v521, v515);
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a10)
    goto LABEL_381;
  v356 = (void *)objc_opt_new();
  if (!v515)
    goto LABEL_379;
  v357 = 0;
  v358 = 0;
  do
  {
    v359 = (uint64_t *)(&v515 + v357);
    if (objc_msgSend((id)v359[129], "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v358);
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v356, "setObject:forKeyedSubscript:", v360, v359[129]);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v358);
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unused%d"), v357);
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v356, "setObject:forKeyedSubscript:", v360, v361);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v362 = (id)v521[v357];
      objc_msgSend(v362, "objectForKeyedSubscript:", CFSTR("kCIBitCount"));
      v363 = (void *)objc_claimAutoreleasedReturnValue();
      v364 = objc_msgSend(v363, "integerValue");

      if (v364 <= 1)
        v365 = 1;
      else
        v365 = v364;

    }
    else
    {
      v365 = 1;
    }
    v366 = *((_DWORD *)&v515 + v357 + 2) & 0x2FE;
    v368 = sPRSImportantBitsSuggestions;
    v367 = *(_QWORD *)algn_1ED55EF08;
    v370 = sPRSImportantBitsSearch;
    v369 = *(_QWORD *)algn_1ED55EEF8;
    v371 = *((_DWORD *)&v515 + v357 + 2) & 0xC00;
    do
    {
      if (v366)
      {
        v372 = 1 << v358;
        if ((v358 & 0x40) != 0)
          v373 = 1 << v358;
        else
          v373 = 0;
        if ((v358 & 0x40) != 0)
          v372 = 0;
        v368 |= v372;
        v367 |= v373;
        sPRSImportantBitsSuggestions = v368;
        *(_QWORD *)algn_1ED55EF08 = v367;
      }
      else
      {
        if (!v371)
          goto LABEL_377;
        v372 = 1 << v358;
        if ((v358 & 0x40) != 0)
          v373 = 1 << v358;
        else
          v373 = 0;
        if ((v358 & 0x40) != 0)
          v372 = 0;
      }
      v369 |= v373;
      v370 |= v372;
      sPRSImportantBitsSearch = v370;
      *(_QWORD *)algn_1ED55EEF8 = v369;
LABEL_377:
      ++v358;
      --v365;
    }
    while (v365);
    ++v357;
  }
  while (v515 > v357);
LABEL_379:
  if (sRankingQueryIndexDictionary_0)
    __assert_rtn("_PRSRankingQueries", "PRSRankingItemRanker.m", 2921, "sRankingQueryIndexDictionary == nil");
  objc_storeStrong((id *)&sRankingQueryIndexDictionary_0, v356);

LABEL_381:
  PRSRankingItemRankerAddJunkFilter(v510);
  v374 = (void *)objc_claimAutoreleasedReturnValue();

  for (j = 3080; j != 5128; j += 8)
  return v374;
}

void sub_1B87A8430(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x468], 8);
  _Unwind_Resume(a1);
}

id _recencyInterval(void *a1, void *a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;

  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v59 = a4;
  v51 = a3;
  v45 = a2;
  v8 = a1;
  v60 = (void *)objc_msgSend([v7 alloc], "initWithCapacity:", 4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(InRange(kMDItemInterestingDate_Ranking,$time.today(%@),$time.now(%@)))"), v8, CFSTR("+1d"));
  v62 = v9;
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v63);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(!FieldMatch(%@, %@, %@, %@))"), CFSTR("_kMDItemBundleID"), CFSTR("com.apple.mobilecal"), CFSTR("com.apple.reminders"), CFSTR("com.apple.mobilemail"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" && "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("(%@)"), v12);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(InRange(kMDItemContentCreationDate_Ranking,$time.today(%@),$time.now(%@)))"), v8, CFSTR("+1d"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v61);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ == \"%@\")"), CFSTR("_kMDItemBundleID"), CFSTR("com.apple.mobilemail"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v13;
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemUserSharedReceivedDate != *)"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v15);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemUserSharedSentDate != *)"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" && "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("(%@)"), v18);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(InRange(kMDItemUserSharedReceivedDate,$time.today(%@),$time.now(%@)))"), v8, CFSTR("+1d"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(InRange(kMDItemUserSharedSentDate,$time.today(%@),$time.now(%@)))"), v8, CFSTR("+1d"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v20;
  objc_msgSend(v20, "addObject:", v56);
  objc_msgSend(v20, "addObject:", v54);
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" || "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("(%@)"), v22);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v19;
  objc_msgSend(v19, "addObject:", v50);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ == \"%@\")"), CFSTR("_kMDItemBundleID"), CFSTR("com.apple.mobilemail"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v23);

  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" && "));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("(%@)"), v25);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(InRange(kMDItemInterestingDate_Ranking,$time.today(%@),$time.now(%@)))"), v45, v51);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "addObject:", v48);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@ == \"%@\") && (kMDItemDueDate == *))"), CFSTR("_kMDItemBundleID"), CFSTR("com.apple.reminders"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v27;
  objc_msgSend(v27, "addObject:", v28);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ == \"%@\")"), CFSTR("_kMDItemBundleID"), CFSTR("com.apple.mobilecal"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v29);

  v30 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v27, "componentsJoinedByString:", CFSTR(" || "));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("(%@)"), v31);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "addObject:", v52);
  v32 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v26, "componentsJoinedByString:", CFSTR(" && "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("(%@)"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(InRange(kMDItemContentModificationDate_Ranking,$time.today(%@),$time.now(%@)))"), v59, CFSTR("+1d"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "addObject:", CFSTR("(kMDItemDueDate != *)"));
  objc_msgSend(v35, "addObject:", v36);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ == \"%@\")"), CFSTR("_kMDItemBundleID"), CFSTR("com.apple.reminders"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObject:", v37);

  v38 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v35, "componentsJoinedByString:", CFSTR(" && "));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("(%@)"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v60, "addObject:", v57);
  objc_msgSend(v60, "addObject:", v53);
  objc_msgSend(v60, "addObject:", v47);
  objc_msgSend(v60, "addObject:", v34);
  objc_msgSend(v60, "addObject:", v40);
  v41 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v60, "componentsJoinedByString:", CFSTR(" || "));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("(%@)"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

id _countingRankingQueryArray(void *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  id obj;
  const __CFString *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v35 = a2;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v7 = objc_msgSend(v5, "count");
  if (v7 >= 1)
  {
    v8 = v7;
    v9 = 0;
    v10 = CFSTR("*");
    if (!a3)
      v10 = &stru_1E6E549F0;
    v40 = v10;
    v33 = v6;
    v34 = v5;
    v32 = v7;
    do
    {
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      if (v9 < objc_msgSend(v5, "count"))
      {
        v36 = v9;
        objc_msgSend(v5, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        obj = v35;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v42;
          do
          {
            v16 = 0;
            v38 = v14;
            do
            {
              if (*(_QWORD *)v42 != v15)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
              if (addEndChar(v17, v11))
              {
                v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@%@@\"%@)"), v17, v11, &stru_1E6E549F0, CFSTR("cwd"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v19);

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@%@.*\"%@)"), v17, v11, v40, CFSTR("cd"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v20);

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@%@_*\"%@)"), v17, v11, v40, CFSTR("cd"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v21);

                v22 = (void *)MEMORY[0x1E0CB3940];
                v14 = v38;
                objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" || "));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "stringWithFormat:", CFSTR("(%@)"), v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@%@\"%@)"), v17, v11, v40, CFSTR("cwd"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v12, "addObject:", v24);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
          }
          while (v14);
        }

        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" || "));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v25);

        }
        v6 = v33;
        v5 = v34;
        v8 = v32;
        v9 = v36;
      }
      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR(" || "));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("(%@) && %@"), v27, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "addObject:", v28);
      ++v9;
    }
    while (v9 != v8);
  }
  v45[0] = CFSTR("kCIMatchArray");
  v45[1] = CFSTR("kCIBitCount");
  v46[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

__CFString *_rankingQueryPolicyComposite(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  void *v44;
  unint64_t v45;
  BOOL v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  id v76;
  id obj;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v60 = a2;
  v76 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = v7;
  v59 = objc_msgSend(v7, "count");
  if (v59 < 1)
    goto LABEL_53;
  v9 = 0;
  v73 = *MEMORY[0x1E0CA61B8];
  v72 = *MEMORY[0x1E0CA6030];
  v70 = *MEMORY[0x1E0CA66F8];
  v68 = *MEMORY[0x1E0CA5F58];
  v66 = *MEMORY[0x1E0CA6360];
  v64 = *MEMORY[0x1E0CA6368];
  v65 = *MEMORY[0x1E0CA5F60];
  v67 = *MEMORY[0x1E0CA6700];
  v69 = *MEMORY[0x1E0CA6038];
  v71 = *MEMORY[0x1E0CA61C0];
  v57 = *MEMORY[0x1E0CA6150];
  v56 = *MEMORY[0x1E0CA65A0];
  v75 = a4;
  v58 = v8;
  v74 = *MEMORY[0x1E0CA6060];
  do
  {
    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v63 = v9;
    objc_msgSend(v61, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v60, "count"));
    objc_msgSend(v76, "allKeys");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = v60;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    if (!v11)
      goto LABEL_40;
    v12 = v11;
    v13 = *(_QWORD *)v81;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v81 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v14);
        if (objc_msgSend(v78, "containsObject:", v15))
        {
          objc_msgSend(v76, "valueForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count"))
          {
            v17 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringWithFormat:", CFSTR("(!FieldMatch(%@,%@))"), v74, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }
        v20 = addEndChar(v15, v10);
        if (a4)
        {
          if (v20)
          {
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v15, v10, CFSTR("cwd"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v22);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@.*\"%@)"), v15, v10, CFSTR("cd"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v23);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@_*\"%@)"), v15, v10, CFSTR("cd"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v24);

            v25 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v21, "componentsJoinedByString:", CFSTR(" || "));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("(%@)"), v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            a4 = v75;
            if (v19)
              goto LABEL_24;
            goto LABEL_25;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v15, v10, CFSTR("cwd"));
LABEL_23:
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
            goto LABEL_25;
LABEL_24:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), v27, v19);
          v31 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v31;
          goto LABEL_25;
        }
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v15, v10, CFSTR("cwd"));
          goto LABEL_23;
        }
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
        if (objc_msgSend(v15, "isEqualToString:", v73))
        {
          v29 = (void *)MEMORY[0x1E0CB3940];
          v55 = v10;
          v30 = v71;
LABEL_35:
          objc_msgSend(v29, "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v30, v55, CFSTR("cwd"));
          goto LABEL_36;
        }
        if (objc_msgSend(v15, "isEqualToString:", v72))
        {
          v29 = (void *)MEMORY[0x1E0CB3940];
          v55 = v10;
          v30 = v69;
          goto LABEL_35;
        }
        if (objc_msgSend(v15, "isEqualToString:", v70))
        {
          v29 = (void *)MEMORY[0x1E0CB3940];
          v55 = v10;
          v30 = v67;
          goto LABEL_35;
        }
        if (objc_msgSend(v15, "isEqualToString:", v68))
        {
          v29 = (void *)MEMORY[0x1E0CB3940];
          v55 = v10;
          v30 = v65;
          goto LABEL_35;
        }
        v32 = objc_msgSend(v15, "isEqualToString:", v66);
        v29 = (void *)MEMORY[0x1E0CB3940];
        if (v32)
        {
          v55 = v10;
          v30 = v64;
          goto LABEL_35;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*@\"%@)"), v15, v10, CFSTR("cwd"));
LABEL_36:
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v33);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*.*\"%@)"), v15, v10, CFSTR("cd"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v34);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*_*\"%@)"), v15, v10, CFSTR("cd"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v35);

        v36 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR(" || "));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("(%@)"), v37);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        a4 = v75;
        if (v19)
          goto LABEL_24;
LABEL_25:
        objc_msgSend(v79, "addObject:", v27);

        ++v14;
      }
      while (v12 != v14);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
      v12 = v38;
    }
    while (v38);
LABEL_40:

    if (a4)
    {
      v39 = v74;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@=\"%@\") && (%@=\"%@\"%@))"), v74, CFSTR("com.apple.mobileslideshow"), v57, v10, CFSTR("cwd"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v79;
      objc_msgSend(v79, "addObject:", v40);

      v42 = CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))");
      v43 = v63;
    }
    else
    {
      v39 = v74;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@=\"%@\") && (%@=\"%@*\"%@))"), v74, CFSTR("com.apple.mobileslideshow"), v57, v10, CFSTR("cwd"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v79;
      objc_msgSend(v79, "addObject:", v44);

      v45 = objc_msgSend(v10, "length");
      v43 = v63;
      v46 = v45 == 2 && v63 == v59 - 1;
      v47 = CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))");
      if (v46)
        v47 = CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@*\"%@))");
      if (v45 <= 2)
        v42 = v47;
      else
        v42 = CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@*\"%@))");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v42, v39, CFSTR("com.apple.mobileslideshow"), v56, CFSTR("_kMDItemOCRContentLevel1"), v10, CFSTR("cwd"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v48);

    if (objc_msgSend(v41, "count"))
    {
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR(" || "));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "addObject:", v49);

    }
    v50 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v62, "componentsJoinedByString:", CFSTR(" || "));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringWithFormat:", CFSTR("(%@) && %@"), v51, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v58;
    objc_msgSend(v58, "addObject:", v52);

    v9 = v43 + 1;
  }
  while (v9 != v59);
LABEL_53:
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" && "));
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = CFSTR("false");
  }

  return v53;
}

__CFString *_rankingPhraseQueryPolicyComposite(void *a1, void *a2, void *a3, void *a4, char a5, int a6, unsigned __int8 a7, uint64_t a8)
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  __CFString *v48;
  char v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t i;
  void *v56;
  void *v57;
  uint64_t j;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t m;
  id v64;
  void *v65;
  unint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  unint64_t v70;
  const __CFString *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t k;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unsigned __int8 v82;
  void *v83;
  id v84;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  id v96;
  id v98;
  id obj;
  void *v100;
  char v101;
  char v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = a2;
  v15 = a3;
  v98 = a4;
  if (!objc_msgSend(v14, "length"))
  {
    v48 = CFSTR("false");
    goto LABEL_109;
  }
  v16 = objc_msgSend(v13, "count");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v96 = v14;
  v86 = v16;
  v83 = v13;
  v82 = a7;
  if ((a8 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    v49 = (a6 | a7) & a5;
    if ((a5 & 1) != 0)
    {
      v50 = 0;
      if ((v49 & 1) != 0)
      {
        v101 = 1;
        v88 = 0;
        v89 = 0;
        v94 = 0;
        v90 = 0;
        v87 = 0;
        goto LABEL_5;
      }
      v90 = 0;
      v94 = 0;
    }
    else
    {
      v102 = (a6 | a7) & a5;
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v14, "length") + v16);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 >= 1)
      {
        for (i = 0; i != v16; ++i)
        {
          objc_msgSend(v13, "objectAtIndex:", i);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (i)
            objc_msgSend(v94, "appendString:", CFSTR(" "));
          objc_msgSend(v94, "appendString:", v56);
          objc_msgSend(v94, "appendString:", CFSTR("*"));

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v14, "length") + v16);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 >= 1)
      {
        for (j = 0; j != v16; ++j)
        {
          objc_msgSend(v13, "objectAtIndex:", j);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (j)
            objc_msgSend(v57, "appendString:", CFSTR("_"));
          objc_msgSend(v57, "appendString:", v59);
          if (v16 - 1 != j)
            objc_msgSend(v57, "appendString:", CFSTR("*"));

        }
      }
      v88 = v57;
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v14, "length") + v16);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v16 - 1;
      if (v16 >= 1)
      {
        v61 = 0;
        do
        {
          objc_msgSend(v13, "objectAtIndex:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (v61)
            objc_msgSend(v90, "appendString:", CFSTR("."));
          objc_msgSend(v90, "appendString:", v62);
          if (v60 != v61)
            objc_msgSend(v90, "appendString:", CFSTR("*"));

          ++v61;
          v16 = v86;
        }
        while (v86 != v61);
      }
      if ((v102 & 1) != 0)
      {
        v89 = 0;
        goto LABEL_4;
      }
      v50 = v88;
    }
    v88 = v50;
    if (a6 && (v82 & 1) != 0)
    {
      v89 = 0;
      v101 = 0;
      v87 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v14, "length") + v16);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 >= 1)
      {
        v72 = 0;
        do
        {
          objc_msgSend(v13, "objectAtIndex:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
            objc_msgSend(v89, "appendString:", CFSTR("_"));
          objc_msgSend(v89, "appendString:", v73);

          ++v72;
        }
        while (v86 != v72);
      }
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v14, "length") + v86);
      v74 = objc_claimAutoreleasedReturnValue();
      v87 = (void *)v74;
      if (v86 >= 1)
      {
        v75 = (void *)v74;
        for (k = 0; k != v86; ++k)
        {
          objc_msgSend(v13, "objectAtIndex:", k);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (k)
            objc_msgSend(v75, "appendString:", CFSTR("."));
          objc_msgSend(v75, "appendString:", v77);

        }
      }
      v101 = 0;
    }
    goto LABEL_5;
  }
  v88 = 0;
  v89 = 0;
  v94 = 0;
  v90 = 0;
LABEL_4:
  v87 = 0;
  v101 = 1;
LABEL_5:
  objc_msgSend(v98, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v84 = v15;
  obj = v15;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
  v20 = 0x1E0CB3000uLL;
  v100 = v17;
  v93 = v18;
  if (!v19)
    goto LABEL_36;
  v21 = v19;
  v22 = *(_QWORD *)v104;
  v95 = *MEMORY[0x1E0CA6060];
  v92 = *(_QWORD *)v104;
  do
  {
    v23 = 0;
    v91 = v21;
    do
    {
      if (*(_QWORD *)v104 != v22)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v23);
      if (objc_msgSend(v18, "containsObject:", v24))
      {
        objc_msgSend(v98, "valueForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "count"))
        {
          v26 = *(void **)(v20 + 2368);
          objc_msgSend(v25, "componentsJoinedByString:", CFSTR(","));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("(!FieldMatch(%@,%@))"), v95, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v28 = 0;
        }

        v17 = v100;
      }
      else
      {
        v28 = 0;
      }
      if ((v101 & 1) == 0)
      {
        if ((a5 & 1) != 0)
        {
          v32 = addEndChar(v24, v14);
          if ((a6 & v82 & 1) != 0)
          {
            if (!v32)
            {
LABEL_22:
              objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v24, v14, CFSTR("cwd"));
              goto LABEL_30;
            }
LABEL_26:
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
            objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v24, v89, CFSTR("cwd"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v36);

            v22 = v92;
            objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v24, v87, CFSTR("cwd"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v37);

            v18 = v93;
            objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v24, v89, CFSTR("cd"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v38);

            v20 = 0x1E0CB3000uLL;
            v21 = v91;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v24, v87, CFSTR("cd"));
            goto LABEL_27;
          }
          if (v32)
            goto LABEL_26;
          objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v24, v14, CFSTR("cwd"));
        }
        else
        {
          if (addEndChar(v24, v94))
          {
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
            objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v24, v88, CFSTR("cwd"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v33);

            v22 = v92;
            objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v24, v90, CFSTR("cwd"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v34);

            objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v24, v88, CFSTR("cd"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v35);

            v20 = 0x1E0CB3000;
            v18 = v93;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v24, v90, CFSTR("cd"));
            goto LABEL_27;
          }
          objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v24, v94, CFSTR("cwd"));
        }
LABEL_30:
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_32;
LABEL_31:
        objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@ && %@)"), v42, v28);
        v43 = objc_claimAutoreleasedReturnValue();

        v42 = (void *)v43;
        goto LABEL_32;
      }
      if (!addEndChar(v24, v14))
        goto LABEL_22;
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
      objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v24, v14, CFSTR("cwd"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v30);

      objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("(%@=\"%@.*\"%@)"), v24, v14, CFSTR("cd"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v31);

      v20 = 0x1E0CB3000;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@_*\"%@)"), v24, v14, CFSTR("cd"));
LABEL_27:
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v39);

      v40 = *(void **)(v20 + 2368);
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR(" || "));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("(%@)"), v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v96;
      v17 = v100;
      if (v28)
        goto LABEL_31;
LABEL_32:
      objc_msgSend(v17, "addObject:", v42);

      ++v23;
    }
    while (v21 != v23);
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
    v21 = v44;
  }
  while (v44);
LABEL_36:

  if ((v101 & 1) != 0)
  {
    v45 = *MEMORY[0x1E0CA6060];
    objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("((%@=\"%@\") && (%@=\"%@\"%@))"), *MEMORY[0x1E0CA6060], CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA6150], v14, CFSTR("cwd"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v46);

    objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))"), v45, CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA65A0], CFSTR("_kMDItemOCRContentLevel1"), v14, CFSTR("cwd"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v47);
    v13 = v83;
    v15 = v84;
    goto LABEL_108;
  }
  v13 = v83;
  v15 = v84;
  if ((a5 & 1) == 0)
  {

    if (v86 <= 1)
    {
      v47 = 0;
      v67 = *MEMORY[0x1E0CA6060];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(0, "length"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v94, "length"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      for (m = 0; m != v86; ++m)
      {
        v64 = v13;
        objc_msgSend(v13, "objectAtIndex:", m);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "length");
        if (m)
        {
          objc_msgSend(v94, "appendString:", CFSTR(" "));
          objc_msgSend(v47, "appendString:", CFSTR(" "));
        }
        objc_msgSend(v94, "appendString:", v65);
        objc_msgSend(v47, "appendString:", v65);
        objc_msgSend(v94, "appendString:", CFSTR("*"));
        if (v66 > 2 || v86 - 1 == m && v66 == 2)
          objc_msgSend(v47, "appendString:", CFSTR("*"));

        v13 = v64;
      }
      v67 = *MEMORY[0x1E0CA6060];
      v14 = v96;
      if (v94)
      {
        objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("((%@=\"%@\") && (%@=\"%@\"%@))"), v67, CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA6150], v94, CFSTR("cwd"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v84;
        v17 = v100;
        goto LABEL_104;
      }
      v15 = v84;
      v17 = v100;
    }
    objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("((%@=\"%@\") && (%@=\"%@\"%@))"), v67, CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA6150], v14, CFSTR("cwd"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0;
LABEL_104:
    objc_msgSend(v17, "addObject:", v68);

    if (v47)
      objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))"), v67, CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA65A0], CFSTR("_kMDItemOCRContentLevel1"), v47, CFSTR("cwd"));
    else
      objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))"), v67, CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA65A0], CFSTR("_kMDItemOCRContentLevel1"), v14, CFSTR("cwd"));
    goto LABEL_107;
  }
  v51 = *(void **)(v20 + 2368);
  v52 = *MEMORY[0x1E0CA6060];
  v53 = *MEMORY[0x1E0CA6150];
  if (a6 && (v82 & 1) != 0)
  {
    objc_msgSend(v51, "stringWithFormat:", CFSTR("((%@=\"%@\") && (%@=\"%@\"%@))"), v52, CFSTR("com.apple.mobileslideshow"), v53, v14, CFSTR("cwd"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v54);

    objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))"), v52, CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA65A0], CFSTR("_kMDItemOCRContentLevel1"), v14, CFSTR("cwd"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v47);
    goto LABEL_108;
  }
  objc_msgSend(v51, "stringWithFormat:", CFSTR("((%@=\"%@\") && (%@=\"%@*\"%@))"), v52, CFSTR("com.apple.mobileslideshow"), v53, v14, CFSTR("cwd"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v69);

  objc_msgSend(v83, "lastObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v47, "length");
  if (v47 && (v70 > 2 || v86 >= 2 && v70 == 2))
    v71 = CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@*\"%@))");
  else
    v71 = CFSTR("((%@=\"%@\" || %@>0) && (%@=\"%@\"%@))");
  objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", v71, v52, CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA65A0], CFSTR("_kMDItemOCRContentLevel1"), v14, CFSTR("cwd"));
LABEL_107:
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v78);

LABEL_108:
  v79 = *(void **)(v20 + 2368);
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" || "));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "stringWithFormat:", CFSTR("(%@) && %@"), v80, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_109:
  return v48;
}

__CFString *_rankingMultiPhraseTCQueryComposite(void *a1, char a2, unsigned __int8 a3, unsigned __int8 a4, uint64_t a5, unsigned __int8 a6, char a7, unsigned int a8)
{
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v15 = a1;
  if (objc_msgSend(v15, "count") <= (unint64_t)a8)
  {
    v22 = CFSTR("false");
  }
  else
  {
    v16 = a8;
    v17 = *MEMORY[0x1E0CA6030];
    v28[0] = *MEMORY[0x1E0CA6048];
    v28[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0CA5FF8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = a2;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v15);
    objc_msgSend(v18, "removeObjectsInRange:", v16, objc_msgSend(v18, "count") - v16);
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v15);
    objc_msgSend(v20, "removeObjectsInRange:", 0, v16);
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseQueryCompositeHelper(v18, v19, v26, v20, v21, v25, v20, v21, a6, a7, v24, a3, a4, a5, 1u);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

__CFString *_rankingJoinedTCClauses(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  if (v7 && (objc_msgSend(v7, "isEqualToString:", CFSTR("false")) & 1) == 0)
    objc_msgSend(v10, "addObject:", v7);
  if (v8 && (objc_msgSend(v8, "isEqualToString:", CFSTR("false")) & 1) == 0)
    objc_msgSend(v10, "addObject:", v8);
  if (v9 && (objc_msgSend(v9, "isEqualToString:", CFSTR("false")) & 1) == 0)
    objc_msgSend(v10, "addObject:", v9);
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v12 = v11;
    v13 = objc_alloc(MEMORY[0x1E0CB37A0]);
    if (a4)
      v14 = CFSTR("$");
    else
      v14 = &stru_1E6E549F0;
    v15 = (__CFString *)objc_msgSend(v13, "initWithString:", v14);
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" || "));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v12 == 1)
      v19 = CFSTR("%@");
    else
      v19 = CFSTR("(%@)");
    objc_msgSend(v16, "stringWithFormat:", v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v15, "appendString:", v20);

  }
  else
  {
    v15 = CFSTR("false");
  }

  return v15;
}

__CFString *_rankingMultiPhraseQueryComposite(void *a1, char a2, unsigned __int8 a3, unsigned __int8 a4, uint64_t a5, unsigned __int8 a6, char a7, unsigned int a8)
{
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  char v25;
  void *v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v15 = a1;
  if (objc_msgSend(v15, "count") <= (unint64_t)a8)
  {
    v23 = CFSTR("false");
  }
  else
  {
    v16 = a8;
    v17 = *MEMORY[0x1E0CA6030];
    v29[0] = *MEMORY[0x1E0CA6048];
    v29[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CA68D8];
    v28[0] = *MEMORY[0x1E0CA6158];
    v28[1] = v18;
    v28[2] = *MEMORY[0x1E0CA6968];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = a2;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v15);
    objc_msgSend(v19, "removeObjectsInRange:", v16, objc_msgSend(v19, "count") - v16);
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v15);
    objc_msgSend(v21, "removeObjectsInRange:", 0, v16);
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(" "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _rankingMultiPhraseQueryCompositeHelper(v19, v20, v27, v21, v22, v26, v21, v22, a6, a7, v25, a3, a4, a5, 0);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

__CFString *_rankingMultiFieldsTCNearQueryCombo(void *a1, void *a2, void *a3, uint64_t a4, unsigned int a5, int a6, uint64_t a7, char a8)
{
  id v12;
  __CFString *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id obj;
  unsigned __int8 v82;
  uint64_t v83;
  void *v84;
  void *v85;
  _BYTE v87[12];
  void *v90;
  uint64_t v91;
  BOOL v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v12 = a1;
  v76 = a2;
  v75 = a3;
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    v74 = v12;
    if ((unint64_t)objc_msgSend(v12, "count") >= 9)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v76);
      v91 = *MEMORY[0x1E0CA6910];
      if ((objc_msgSend(v14, "containsObject:") & 1) == 0)
        objc_msgSend(v14, "addObject:", v91);
      v15 = v12;
      v16 = v14;
      v17 = v75;
      if ((unint64_t)objc_msgSend(v15, "count") >= 2)
      {
        v37 = objc_msgSend(v15, "count");
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v37);
        v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
        if ((a7 & 0xFFFFFFFFFFFFFFFELL) == 4)
          v39 = 1;
        else
          v39 = a6;
        v78 = v17;
        objc_msgSend(v17, "allKeys");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v37;
        if (v37 < 1)
        {
          *(_QWORD *)&v87[4] = 0;
        }
        else
        {
          v40 = 0;
          *(_DWORD *)&v87[8] = 0;
          *(_QWORD *)v87 = v39 | a5;
          v83 = *MEMORY[0x1E0CA6060];
          v77 = *MEMORY[0x1E0CA61B0];
          v71 = v16;
          v72 = v15;
          v70 = v38;
          do
          {
            objc_msgSend(v85, "removeAllObjects");
            objc_msgSend(v15, "objectAtIndex:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = 0u;
            v94 = 0u;
            v95 = 0u;
            v96 = 0u;
            obj = v16;
            v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
            v73 = v40;
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v94;
              v79 = v40 + 1;
              v45 = v85;
              do
              {
                for (i = 0; i != v43; ++i)
                {
                  if (*(_QWORD *)v94 != v44)
                    objc_enumerationMutation(obj);
                  v47 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
                  if (objc_msgSend(v90, "containsObject:", v47))
                  {
                    objc_msgSend(v78, "valueForKey:", v47);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v48, "count"))
                    {
                      v49 = (void *)MEMORY[0x1E0CB3940];
                      objc_msgSend(v48, "componentsJoinedByString:", CFSTR(","));
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = v49;
                      v45 = v85;
                      objc_msgSend(v51, "stringWithFormat:", CFSTR("(!FieldMatch(%@,%@))"), v83, v50);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v52 = 0;
                    }

                  }
                  else
                  {
                    v52 = 0;
                  }
                  if (objc_msgSend(v47, "isEqualToString:", v91))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(!FieldMatch(%@,%@))"), v83, CFSTR("com.apple.mobileslideshow"));
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(!%@>0)"), v77);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), v53, v54);
                    v55 = objc_claimAutoreleasedReturnValue();

                    v52 = (void *)v55;
                    v45 = v85;
                  }
                  if ((v87[0] & 1) != 0)
                  {
                    v56 = v41;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v41, "length"));
                    v56 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v56, "appendString:", v41);
                    if (v79 == v80
                      && (!objc_msgSend(v47, "isEqualToString:", v91)
                       || (unint64_t)objc_msgSend(v41, "length") >= 3))
                    {
                      objc_msgSend(v56, "appendString:", CFSTR("*"));
                    }
                    *(_QWORD *)&v87[4] = v56;
                  }
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v47, v56, CFSTR("cwd"));
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v52)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), v57, v52);
                    v58 = objc_claimAutoreleasedReturnValue();

                    v57 = (void *)v58;
                  }
                  objc_msgSend(v45, "addObject:", v57);

                }
                v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
              }
              while (v43);
            }
            else
            {
              v45 = v85;
            }

            if ((unint64_t)objc_msgSend(v45, "count") < 2)
            {
              objc_msgSend(v45, "firstObject");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v59 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v45, "componentsJoinedByString:", CFSTR(" || "));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "stringWithFormat:", CFSTR("(%@)"), v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v16 = v71;
            v15 = v72;
            v38 = v70;
            objc_msgSend(v70, "addObject:", v61);

            v40 = v73 + 1;
          }
          while (v73 + 1 != v80);
        }
        v66 = objc_msgSend(v38, "count");
        v67 = (void *)MEMORY[0x1E0CB3940];
        if (v66 <= 1)
        {
          objc_msgSend(v38, "firstObject");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "stringWithFormat:", CFSTR("%@"), v68);
        }
        else
        {
          objc_msgSend(v38, "componentsJoinedByString:", CFSTR(" && "));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "stringWithFormat:", CFSTR("(%@)"), v68);
        }
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v12 = v74;

        v17 = v78;
      }
      else
      {
        v13 = CFSTR("false");
      }

      goto LABEL_78;
    }
    v18 = objc_msgSend(v12, "count");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18);
    v16 = v19;
    if (v18)
    {
      v84 = v19;
      v20 = 0;
      v92 = 0;
      v82 = a4 + 1;
      v21 = -1;
      do
      {
        ++v20;
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v74);
        objc_msgSend(v22, "removeObjectsInRange:", v20, objc_msgSend(v22, "count") + v21);
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v74);
        objc_msgSend(v23, "removeObjectsInRange:", 0, v20);
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR(" "));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _rankingMultiFieldsTCNearQuery(v22, v76, v75, v23, v24, a4, a5, a6, a7, 1, a8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25 && (objc_msgSend(v25, "isEqualToString:", CFSTR("false")) & 1) == 0)
        {
          if (v82 >= 2u && !v92)
            v92 = (unint64_t)objc_msgSend(v23, "count") > 1;
          objc_msgSend(v84, "addObject:", v26);
        }

        --v21;
      }
      while (v18 != v20);
      if (v18 >= 2)
      {
        v27 = -1;
        for (j = 1; j != v18; ++j)
        {
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v74);
          objc_msgSend(v29, "removeObjectsInRange:", j, objc_msgSend(v29, "count") + v27);
          objc_msgSend(v29, "componentsJoinedByString:", CFSTR(" "));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v74);
          objc_msgSend(v31, "removeObjectsInRange:", 0, j);
          _rankingMultiFieldsTCNearQuery(v31, v76, v75, v29, v30, a4, a5, a6, a7, 0, a8);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v32 && (objc_msgSend(v32, "isEqualToString:", CFSTR("false")) & 1) == 0)
          {
            if (v82 >= 2u && !v92)
              v92 = (unint64_t)objc_msgSend(v29, "count") > 1;
            objc_msgSend(v84, "addObject:", v33);
          }

          --v27;
        }
      }
      v16 = v84;
      v34 = objc_msgSend(v84, "count");
      if (v34)
      {
        v35 = v34;
        if (v92)
          v36 = CFSTR("$");
        else
          v36 = &stru_1E6E549F0;
        v12 = v74;
        goto LABEL_67;
      }
      v13 = CFSTR("false");
      v12 = v74;
    }
    else
    {
      v62 = objc_msgSend(v19, "count");
      if (v62)
      {
        v35 = v62;
        v36 = &stru_1E6E549F0;
LABEL_67:
        v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v36);
        v63 = (void *)MEMORY[0x1E0CB3940];
        if (v35 < 2)
        {
          objc_msgSend(v16, "firstObject");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "stringWithFormat:", CFSTR("%@"), v64);
        }
        else
        {
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" || "));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "stringWithFormat:", CFSTR("(%@)"), v64);
        }
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString appendString:](v13, "appendString:", v65);

        goto LABEL_78;
      }
      v13 = CFSTR("false");
    }
LABEL_78:

    goto LABEL_79;
  }
  v13 = CFSTR("false");
LABEL_79:

  return v13;
}

__CFString *_rankingTCNearQueryHelper(void *a1, void *a2, void *a3, void *a4, unsigned int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  id v14;
  id v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  int v19;
  uint64_t i;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void (**v33)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  const __CFString *v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v59;
  void *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  _QWORD v64[5];
  _QWORD v65[3];
  char v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v55 = a1;
  v14 = a2;
  v15 = a3;
  v59 = a4;
  v60 = v14;
  v53 = v15;
  if (objc_msgSend(v14, "length"))
  {
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count") + 2);
    if ((a10 & 1) != 0)
    {
      v61 = CFSTR("cwd");
    }
    else
    {
      objc_msgSend(CFSTR("cwd"), "stringByAppendingFormat:", CFSTR("%c"), 116);
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      v18 = 110;
      if (a10)
        v18 = 111;
      objc_msgSend(CFSTR("cwd"), "stringByAppendingFormat:", CFSTR("%c(%d)"), v18, a5);
      v52 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = CFSTR("cwd");
    }
    v54 = objc_msgSend(v55, "count");
    if ((a9 & 0xFFFFFFFFFFFFFFFELL) == 4)
      v19 = 1;
    else
      v19 = (a7 | a8) & a6;
    objc_msgSend(v59, "allKeys");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (((v19 | a6) & 1) != 0)
    {
      v57 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v14, "length") + v54);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54 >= 1)
      {
        for (i = 0; i != v54; ++i)
        {
          objc_msgSend(v55, "objectAtIndex:", i);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (i)
            objc_msgSend(v57, "appendString:", CFSTR(" "));
          objc_msgSend(v57, "appendString:", v21);
          objc_msgSend(v57, "appendString:", CFSTR("*"));

        }
      }
    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v22 = v15;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v68;
      v56 = *MEMORY[0x1E0CA6060];
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v68 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
          if (objc_msgSend(v62, "containsObject:", v26))
          {
            objc_msgSend(v59, "valueForKey:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27 && objc_msgSend(v27, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@==%@)"), v56, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v29 = 0;
            }

          }
          else
          {
            v29 = 0;
          }
          if ((v19 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v26, v60, v61);
            v30 = objc_claimAutoreleasedReturnValue();
          }
          else if ((a6 & 1) != 0)
          {
            if ((a7 & a8 & 1) != 0)
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v26, v60, v61);
            else
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v26, v60, v61);
            v30 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v26, v57, v61);
            v30 = objc_claimAutoreleasedReturnValue();
          }
          v31 = (void *)v30;
          if (v29)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), v30, v29);
            v32 = objc_claimAutoreleasedReturnValue();

            v31 = (void *)v32;
          }
          objc_msgSend(v63, "addObject:", v31);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      }
      while (v23);
    }

    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x2020000000;
    v66 = 0;
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = ___rankingTCNearQueryHelper_block_invoke;
    v64[3] = &unk_1E6E53D58;
    v64[4] = v65;
    v33 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1BCCB38DC](v64);
    if ((v19 & 1) != 0)
      goto LABEL_46;
    if ((a6 & 1) == 0)
    {

      if (v54 < 2)
        goto LABEL_62;
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(0, "length"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      do
      {
        objc_msgSend(v55, "objectAtIndex:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          objc_msgSend(v57, "appendString:", CFSTR(" "));
        objc_msgSend(v57, "appendString:", v37);
        if ((unint64_t)objc_msgSend(v37, "length") > 2
          || (v38 = v36 + 1, v36 + 1 == v54) && (unint64_t)objc_msgSend(v37, "length") >= 2)
        {
          objc_msgSend(v57, "appendString:", CFSTR("*"));
          v38 = v36 + 1;
        }

        v36 = v38;
      }
      while (v38 != v54);
      if (v57)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), *MEMORY[0x1E0CA6910], v57, v52);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *, _QWORD))v33)[2](v33, v63, v39, 0);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), CFSTR("_kMDItemOCRContentLevel1"), v57, v52);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(_QWORD, void *, void *, uint64_t))v33)[2](v33, v63, v35, 1);
      }
      else
      {
LABEL_62:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), *MEMORY[0x1E0CA6910], v60, v52);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *, _QWORD))v33)[2](v33, v63, v40, 0);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), CFSTR("_kMDItemOCRContentLevel1"), v60, v52);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(_QWORD, void *, void *, uint64_t))v33)[2](v33, v63, v35, 1);
        v57 = 0;
      }
      goto LABEL_76;
    }
    if (a7 && (a8 & 1) != 0)
    {
LABEL_46:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), *MEMORY[0x1E0CA6910], v60, v52);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v33)[2](v33, v63, v34, 0);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), CFSTR("_kMDItemOCRContentLevel1"), v60, v52);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *, void *, uint64_t))v33)[2](v33, v63, v35, 1);
    }
    else
    {
      objc_msgSend(v55, "lastObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "length");
      v43 = v42;
      if (v41 && (v42 > 2 || v54 >= 2 && v42 == 2))
        v44 = CFSTR("(%@=\"%@*\"%@)");
      else
        v44 = CFSTR("(%@=\"%@\"%@)");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v44, *MEMORY[0x1E0CA6910], v60, v52);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v33)[2](v33, v63, v45, 0);
      if (v41 && (v43 > 2 || v54 >= 2 && v43 == 2))
        v46 = CFSTR("(%@=\"%@*\"%@)");
      else
        v46 = CFSTR("(%@=\"%@\"%@)");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v46, CFSTR("_kMDItemOCRContentLevel1"), v60, v52);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *, void *, uint64_t))v33)[2](v33, v63, v35, 1);
    }
LABEL_76:

    v47 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v63, "componentsJoinedByString:", CFSTR(" || "));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("(%@)"), v48);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v65, 8);
    v17 = (__CFString *)v52;
    goto LABEL_77;
  }
  v16 = CFSTR("false");
  v17 = CFSTR("cwd");
LABEL_77:

  return v16;
}

void sub_1B87AC120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

id PRSRankingQueryIndexDictionary()
{
  if (PRSRankingQueryIndexDictionary_onceToken != -1)
    dispatch_once(&PRSRankingQueryIndexDictionary_onceToken, &__block_literal_global_490);
  return (id)sRankingQueryIndexDictionary_0;
}

id PRSRankingQueriesWithUserQuery(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, uint64_t a11, unsigned __int8 a12, void *a13, void *a14)
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v30;
  id v31;
  id v32;
  id v34;
  id v36;
  id v38;
  id v39;

  v36 = a14;
  v34 = a13;
  v18 = a10;
  v31 = a9;
  v32 = a8;
  v39 = a7;
  v19 = a6;
  v20 = a5;
  v30 = a4;
  v21 = a3;
  v22 = a2;
  v38 = a1;
  v23 = PRSRankingQueryIndexDictionary();
  v24 = (uint64_t)v20;
  v25 = v20;
  v26 = v19;
  _PRSRankingQueries((uint64_t)v38, (uint64_t)v22, (uint64_t)v21, (uint64_t)v30, v24, (uint64_t)v19, (uint64_t)v39, (uint64_t)v32, v31, 0, v18, a11, a12, v34, v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t bundleFeatureHasAssociatedResultSetFeature(unint64_t a1)
{
  return (a1 < 0x2C) & (0x9F000FFFFFFuLL >> a1);
}

uint64_t comp(_QWORD *a1, _QWORD *a2)
{
  if (*a1 > *a2)
    return 0xFFFFFFFFLL;
  else
    return *a1 != *a2;
}

uint64_t shouldUpdateFuncForSnippetFeature(unint64_t a1)
{
  if (a1 >= 0x2C)
    shouldUpdateFuncForSnippetFeature_cold_1();
  return (uint64_t)*(&off_1E6E53D78 + a1);
}

uint64_t associatedResultSetL2FeatureFromSnippetFeature(unint64_t a1)
{
  if (a1 >= 0x2C)
    associatedResultSetL2FeatureFromSnippetFeature_cold_1();
  return word_1B87E0FFC[a1];
}

uint64_t associatedL2FeatureFromSnippetFeature(unint64_t a1)
{
  if (a1 >= 0x2C)
    associatedL2FeatureFromSnippetFeature_cold_1();
  return word_1B87E1054[a1];
}

float defaultValueForResultSetSnippetFeature(unint64_t a1)
{
  if (a1 >= 0x2C)
    defaultValueForResultSetSnippetFeature_cold_1();
  return flt_1B87E10AC[a1];
}

float resultset_computation_ctx_init(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  float result;

  v2 = malloc_type_malloc(0xACuLL, 0x3E2B0C0BuLL);
  *(_QWORD *)a1 = v2;
  memset_pattern16(v2, &unk_1B87DEF60, 0xACuLL);
  v3 = 0;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 12) = 0;
  do
  {
    if (v3 >= 0x2C)
      defaultValueForResultSetSnippetFeature_cold_1();
    result = flt_1B87E10AC[v3];
    *(float *)(a1 + 24 + 4 * v3++) = result;
  }
  while (v3 != 44);
  return result;
}

void resultset_computation_ctx_destroy(void **a1)
{
  void *v1;

  v1 = *a1;
  if (v1)
    free(v1);
}

uint64_t PRSRankingSDEnabledFlagState()
{
  if (PRSRankingSDEnabledFlagState_onceToken != -1)
    dispatch_once(&PRSRankingSDEnabledFlagState_onceToken, &__block_literal_global_649);
  return PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags;
}

uint64_t hasPolicyPhraseMatch(void *a1, unint64_t a2, int a3)
{
  id v5;
  uint64_t v6;
  char *v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v13;
  void *v14;
  BOOL v15;
  unsigned int v16;
  uint64_t v17;
  float v18;
  float v19;
  float v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  char *v26;
  void *v27;
  float v28;
  float v29;
  void *v31;
  void *v32;
  uint64_t v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  float v47;
  _BOOL4 v48;
  int v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  void *v53;
  float v54;
  float v55;
  void *v57;
  unint64_t v58;
  void *v59;
  float v60;
  float v61;
  void *v62;
  float v63;
  float v64;
  void *v65;
  float v66;
  float v67;
  void *v68;
  float v69;
  float v70;
  _BOOL4 v71;
  void *v72;
  float v73;
  float v74;
  void *v75;
  float v76;
  float v77;
  void *v78;
  float v79;
  float v80;
  void *v81;
  float v82;
  float v83;
  void *v84;
  float v85;
  float v86;
  void *v87;
  float v88;
  float v89;
  void *v90;
  float v91;
  float v92;
  void *v93;
  float v94;
  float v95;
  void *v96;
  float v97;
  float v98;
  void *v99;
  float v100;
  float v101;
  void *v102;
  float v103;
  float v104;
  void *v105;
  float v106;
  float v107;
  void *v108;
  float v109;
  float v110;
  int v111;
  void *v112;
  float v113;
  float v114;
  void *v115;
  float v116;
  float v117;
  void *v118;
  float v119;
  float v120;

  v5 = a1;
  v6 = 0;
  if (a3)
    v7 = (char *)&sPhrasePolicyWordFeatureList;
  else
    v7 = (char *)&sPhrasePolicyFeatureList;
  v8 = 2147500000.0;
  do
  {
    objc_msgSend(v5, "L2FeatureVector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scoreForFeature:", *(unsigned __int16 *)&v7[v6]);
    v11 = v10;

    if (v11 < v8 && v11 > 0.0)
      v8 = v11;
    v6 += 2;
  }
  while (v6 != 8);
  if ((objc_msgSend(v5, "bundleIDType") & 8) != 0)
  {
    objc_msgSend(v5, "L2FeatureVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = a3 == 0;
    v16 = 278;
    goto LABEL_21;
  }
  if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
    goto LABEL_20;
  if ((objc_msgSend(v5, "bundleIDType") & 0x200) != 0)
  {
    v25 = 0;
    if (a3)
      v26 = (char *)&sMusicPhrasePolicyWordFeatureList;
    else
      v26 = (char *)&sMusicPhrasePolicyFeatureList;
    do
    {
      objc_msgSend(v5, "L2FeatureVector");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "scoreForFeature:", *(unsigned __int16 *)&v26[v25]);
      v29 = v28;

      if (v29 < v8 && v29 > 0.0)
        v8 = v29;
      v25 += 2;
    }
    while (v25 != 6);
    goto LABEL_29;
  }
  if ((objc_msgSend(v5, "bundleIDType") & 0x10) != 0)
  {
LABEL_20:
    objc_msgSend(v5, "L2FeatureVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = a3 == 0;
    v16 = 284;
    goto LABEL_21;
  }
  if ((objc_msgSend(v5, "bundleIDType") & 0x40000) == 0 && (objc_msgSend(v5, "bundleIDType") & 0x2000000) == 0)
  {
    if ((objc_msgSend(v5, "bundleIDType") & 0x20) == 0)
      goto LABEL_29;
    objc_msgSend(v5, "L2FeatureVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = a3 == 0;
    v16 = 266;
    goto LABEL_21;
  }
  v51 = 0;
  if (a3)
    v52 = (char *)&sPhotosAppPhrasePolicyWordFeatureList;
  else
    v52 = (char *)&sPhotosAppPhrasePolicyFeatureList;
  do
  {
    objc_msgSend(v5, "L2FeatureVector");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "scoreForFeature:", *(unsigned __int16 *)&v52[v51]);
    v55 = v54;

    if (v55 < v8 && v55 > 0.0)
      v8 = v55;
    v51 += 2;
  }
  while (v51 != 30);
  objc_msgSend(v5, "exactMatchedKeyword");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "length");

  if (v58 > 2)
  {
    objc_msgSend(v5, "L2FeatureVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = a3 == 0;
    v16 = 296;
LABEL_21:
    if (v15)
      v17 = v16;
    else
      v17 = v16 + 1;
    objc_msgSend(v13, "scoreForFeature:", v17);
    v19 = v18;

    if (v19 < v8 && v19 > 0.0)
      v8 = v19;
  }
LABEL_29:
  v21 = ((double)a2 + 1.0) / (double)a2;
  if (v8 == v21 || v8 < 2147500000.0 && v8 < v21 && v8 > 0.0)
    goto LABEL_33;
  if ((objc_msgSend(v5, "bundleIDType") & 0x100000) != 0)
  {
    if (a2 < 2)
    {
LABEL_102:
      if ((objc_msgSend(v5, "bundleIDType") & 0x40000) != 0)
      {
        if (a2 < 2)
        {
LABEL_108:
          v22 = 0;
          goto LABEL_34;
        }
      }
      else
      {
        v111 = objc_msgSend(v5, "bundleIDType");
        if (a2 < 2 || (v111 & 0x2000000) == 0)
          goto LABEL_108;
      }
      objc_msgSend(v5, "L2FeatureVector");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "scoreForFeature:", 2366);
      v114 = v113;

      if (v114 == 0.0)
        goto LABEL_108;
LABEL_33:
      v22 = 1;
      goto LABEL_34;
    }
  }
  else
  {
    v24 = objc_msgSend(v5, "bundleIDType");
    if (a2 < 2 || (v24 & 8) == 0)
      goto LABEL_102;
  }
  objc_msgSend(v5, "L2FeatureVector");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (a3)
    v33 = 279;
  else
    v33 = 278;
  objc_msgSend(v31, "scoreForFeature:", v33);
  v35 = v34;

  if (v35 > 0.0 && v35 < 2147500000.0)
    goto LABEL_33;
  objc_msgSend(v5, "L2FeatureVector");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scoreForFeature:", 2364);
  v38 = v37;

  objc_msgSend(v5, "L2FeatureVector");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "scoreForFeature:", 2365);
  v41 = v40;

  objc_msgSend(v5, "L2FeatureVector");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "scoreForFeature:", 2366);
  v44 = v43;

  objc_msgSend(v5, "L2FeatureVector");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "scoreForFeature:", 2);
  v47 = v46;

  v48 = v38 != 0.0;
  if (v41 != 0.0)
    v48 = 1;
  if (v44 != 0.0)
    v48 = 1;
  v49 = v47 != 0.0 || v48;
  if ((a3 & 1) != 0)
  {
    if (!v49)
      goto LABEL_87;
    if (-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100008008, a2) >= a2)
      goto LABEL_33;
    v50 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 49160, a2);
  }
  else
  {
    objc_msgSend(v5, "L2FeatureVector");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "scoreForFeature:", 2356);
    v61 = v60;

    objc_msgSend(v5, "L2FeatureVector");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "scoreForFeature:", 2357);
    v64 = v63;

    objc_msgSend(v5, "L2FeatureVector");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "scoreForFeature:", 2358);
    v67 = v66;

    objc_msgSend(v5, "L2FeatureVector");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "scoreForFeature:", 2362);
    v70 = v69;

    v71 = v61 != 0.0;
    if (v64 != 0.0)
      v71 = 1;
    if (v67 != 0.0)
      v71 = 1;
    if (v70 != 0.0)
      v71 = 1;
    if (((v71 | v49) & 1) == 0)
      goto LABEL_87;
    if (-[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 0x100008008, a2) >= a2)
      goto LABEL_33;
    v50 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 49160, a2);
  }
  if (v50 >= a2)
    goto LABEL_33;
LABEL_87:
  objc_msgSend(v5, "L2FeatureVector");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "scoreForFeature:", 2372);
  v74 = v73;

  objc_msgSend(v5, "L2FeatureVector");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "scoreForFeature:", 2373);
  v77 = v76;

  objc_msgSend(v5, "L2FeatureVector");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "scoreForFeature:", 2374);
  v80 = v79;

  objc_msgSend(v5, "L2FeatureVector");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "scoreForFeature:", 2375);
  v83 = v82;

  objc_msgSend(v5, "L2FeatureVector");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "scoreForFeature:", 2376);
  v86 = v85;

  objc_msgSend(v5, "L2FeatureVector");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "scoreForFeature:", 2377);
  v89 = v88;

  v22 = 1;
  if (v74 == 0.0 && v77 == 0.0 && v80 == 0.0 && v83 == 0.0 && v86 == 0.0 && v89 == 0.0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_99;
    objc_msgSend(v5, "L2FeatureVector");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "scoreForFeature:", 2367);
    v92 = v91;

    objc_msgSend(v5, "L2FeatureVector");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "scoreForFeature:", 2368);
    v95 = v94;

    objc_msgSend(v5, "L2FeatureVector");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "scoreForFeature:", 2369);
    v98 = v97;

    objc_msgSend(v5, "L2FeatureVector");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "scoreForFeature:", 2370);
    v101 = v100;

    objc_msgSend(v5, "L2FeatureVector");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "scoreForFeature:", 2371);
    v104 = v103;

    v22 = 1;
    if (v92 == 0.0 && v95 == 0.0 && v98 == 0.0 && v101 == 0.0 && v104 == 0.0)
    {
LABEL_99:
      objc_msgSend(v5, "L2FeatureVector");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "scoreForFeature:", 1929);
      v107 = v106;

      if (v107 != 0.0)
        goto LABEL_33;
      objc_msgSend(v5, "L2FeatureVector");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "scoreForFeature:", 2363);
      v110 = v109;

      if (v110 != 0.0)
        goto LABEL_33;
      if ((a3 & 1) == 0)
      {
        objc_msgSend(v5, "L2FeatureVector");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "scoreForFeature:", 1928);
        v117 = v116;

        if (v117 != 0.0)
          goto LABEL_33;
        objc_msgSend(v5, "L2FeatureVector");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "scoreForFeature:", 2361);
        v120 = v119;

        if (v120 != 0.0)
          goto LABEL_33;
      }
      goto LABEL_102;
    }
  }
LABEL_34:

  return v22;
}

uint64_t get_thread_count()
{
  if (get_thread_count_onceToken != -1)
    dispatch_once(&get_thread_count_onceToken, &__block_literal_global_656);
  return get_thread_count_batch_size;
}

uint64_t __get_thread_count_block_invoke()
{
  size_t v1;
  int v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v2 = 0x1900000006;
  v1 = 4;
  return sysctl(v2, 2u, &get_thread_count_batch_size, &v1, 0, 0);
}

BOOL hasPolicyNearMatch(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  _BOOL8 v8;

  v3 = a1;
  v4 = v3;
  v8 = 0;
  if (a2 >= 2)
  {
    objc_msgSend(v3, "L2FeatureVector");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scoreForFeature:", 2356);
    v7 = v6;

    if (v7 != 0.0)
      v8 = 1;
  }

  return v8;
}

BOOL hasPolicySecondaryMatch(void *a1, unint64_t a2, unint64_t a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  _BOOL8 v14;
  id v15;
  void *v16;
  float v17;
  float v18;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  float v39;
  float v40;
  unint64_t v41;
  char v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  float v47;
  float v48;
  void *v49;
  float v50;
  float v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  float v72;
  float v73;
  _QWORD block[4];
  id v75;

  v11 = a1;
  v12 = a4;
  v13 = a6;
  if ((objc_msgSend(v11, "bundleIDType") & 0x100000) != 0
    || (objc_msgSend(v11, "bundleIDType") & 8) != 0
    || (objc_msgSend(v11, "bundleIDType") & 2) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __hasPolicySecondaryMatch_block_invoke;
    block[3] = &unk_1E6E42FD8;
    v15 = v13;
    v75 = v15;
    if (hasPolicySecondaryMatch_onceToken != -1)
      dispatch_once(&hasPolicySecondaryMatch_onceToken, block);
    objc_msgSend(v11, "L2FeatureVector");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scoreForFeature:", 2);
    v18 = v17;

    if (v18 != 0.0)
      goto LABEL_8;
    objc_msgSend(v11, "L2FeatureVector");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scoreForFeature:", 2364);
    v22 = v21;

    objc_msgSend(v11, "L2FeatureVector");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scoreForFeature:", 2365);
    v25 = v24;

    objc_msgSend(v11, "L2FeatureVector");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scoreForFeature:", 2366);
    v28 = v27;

    v14 = 1;
    if (v22 != 0.0)
      goto LABEL_9;
    if (v25 != 0.0)
      goto LABEL_9;
    if (v28 != 0.0)
      goto LABEL_9;
    if ((a5 & 1) == 0)
    {
      objc_msgSend(v11, "L2FeatureVector");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "scoreForFeature:", 2356);
      v31 = v30;

      objc_msgSend(v11, "L2FeatureVector");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "scoreForFeature:", 2357);
      v34 = v33;

      objc_msgSend(v11, "L2FeatureVector");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "scoreForFeature:", 2358);
      v37 = v36;

      objc_msgSend(v11, "L2FeatureVector");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "scoreForFeature:", 2362);
      v40 = v39;

      v14 = 1;
      if (v31 != 0.0 || v34 != 0.0 || v37 != 0.0 || v40 != 0.0)
        goto LABEL_9;
    }
    v41 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v11, 0x10005C02CLL, a2);
    if ((objc_msgSend(v11, "bundleIDType") & 2) != 0)
      v41 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v11, 0x1000004002, a2);
    if (v41 >= a2)
      goto LABEL_8;
    v42 = hasPolicySecondaryMatch_bit1;
    v43 = -[PRSRankingItem indexScore]((uint64_t)v11);
    v45 = ((2 * v44) << ~v42) | (v43 >> v42);
    if ((v42 & 0x40) != 0)
      v45 = v44 >> v42;
    if ((v45 & 1) != 0)
    {
      objc_msgSend(v11, "L2FeatureVector");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "scoreForFeature:", 210);
      v48 = v47;

      if (v48 > 0.0 && v48 < 2147500000.0)
        goto LABEL_8;
      if ((objc_msgSend(v11, "bundleIDType") & 2) != 0)
      {
        objc_msgSend(v11, "L2FeatureVector");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "scoreForFeature:", 198);
        v73 = v72;

        if (v73 > 0.0 && v73 < 2147500000.0)
          goto LABEL_8;
      }
      objc_msgSend(v11, "L2FeatureVector");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "scoreForFeature:", 1036);
      v51 = v50;

      if (v51 > 0.0 && v51 < 2147500000.0)
        goto LABEL_8;
    }
    v14 = 1;
    v52 = 1 << hasPolicySecondaryMatch_bit2;
    if ((hasPolicySecondaryMatch_bit2 & 0x40) != 0)
      v53 = 1 << hasPolicySecondaryMatch_bit2;
    else
      v53 = 0;
    if ((hasPolicySecondaryMatch_bit2 & 0x40) != 0)
      v52 = 0;
    v54 = 1 << hasPolicySecondaryMatch_bit3;
    if ((hasPolicySecondaryMatch_bit3 & 0x40) != 0)
      v55 = 1 << hasPolicySecondaryMatch_bit3;
    else
      v55 = 0;
    if ((hasPolicySecondaryMatch_bit3 & 0x40) != 0)
      v54 = 0;
    v56 = v54 | v52;
    v57 = v55 | v53;
    v58 = 1 << hasPolicySecondaryMatch_bit5;
    if ((hasPolicySecondaryMatch_bit5 & 0x40) != 0)
      v59 = 0;
    else
      v59 = 1 << hasPolicySecondaryMatch_bit5;
    if ((hasPolicySecondaryMatch_bit5 & 0x40) == 0)
      v58 = 0;
    v60 = 1 << hasPolicySecondaryMatch_bit6;
    if ((hasPolicySecondaryMatch_bit6 & 0x40) != 0)
      v61 = 1 << hasPolicySecondaryMatch_bit6;
    else
      v61 = 0;
    if ((hasPolicySecondaryMatch_bit6 & 0x40) != 0)
      v60 = 0;
    v62 = v56 | v59 | v60;
    v63 = v57 | v58 | v61;
    v64 = -[PRSRankingItem indexScore]((uint64_t)v11);
    if (v62 & v64 | v63 & v65)
      goto LABEL_9;
    if ((isUpper5_c(v11, v65, v15) & 1) != 0
      || isUpper6_r(v11, v66, a3, v12, v15)
      || (isUpper7_0(v11, v67, v15) & 1) != 0
      || (isUpper7_0(v11, v68, v15) & 1) != 0
      || isUpper7(v11, v69, v15)
      || isUpper7_r(v11, a2, a3, v12)
      || isLowerScore_c0(v11, a2, v15))
    {
LABEL_8:
      v14 = 1;
    }
    else
    {
      v14 = isLowerScore_c(v11, v70, v15);
    }
LABEL_9:

    goto LABEL_10;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

void __hasPolicySecondaryMatch_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCNearMatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hasPolicySecondaryMatch_bit1 = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("exact_policy_flag_bit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  hasPolicySecondaryMatch_bit2 = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  hasPolicySecondaryMatch_bit3 = objc_msgSend(v4, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCExactOrderedMatch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCExactNearMatch"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  hasPolicySecondaryMatch_bit5 = objc_msgSend(v6, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCExactNearMatch"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  hasPolicySecondaryMatch_bit6 = objc_msgSend(v7, "integerValue");

}

uint64_t isUpper5_c(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD block[4];
  id v15;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper5_c_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v15 = v4;
  v5 = isUpper5_c_onceToken;
  v6 = v4;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&isUpper5_c_onceToken, block);
  v8 = isUpper5_c_upperBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  v11 = v10;

  if ((v8 & 0x40) != 0)
    v12 = v11 >> v8;
  else
    v12 = ((2 * v11) << ~v8) | (v9 >> v8);

  return v12 & 1;
}

BOOL isUpper6_r(void *a1, uint64_t a2, unint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  _QWORD block[4];
  id v19;

  v8 = a1;
  v9 = a4;
  v10 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper6_r_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v11 = v10;
  v19 = v11;
  if (isUpper6_r_onceToken != -1)
    dispatch_once(&isUpper6_r_onceToken, block);
  if ((isUpper6_r_upperBit & 0x40) != 0)
    v12 = 0;
  else
    v12 = 1 << isUpper6_r_upperBit;
  if ((isUpper6_r_upperBit & 0x40) != 0)
    v13 = 1 << isUpper6_r_upperBit;
  else
    v13 = 0;
  v14 = -[PRSRankingItem indexScore]((uint64_t)v8);
  v16 = a3 >= 2
     && v12 & v14 | v13 & v15
     && (objc_msgSend(v9, "isEqualToString:", CFSTR("co")) & 1) == 0
     && !objc_msgSend(v9, "isEqualToString:", CFSTR("com"));

  return v16;
}

uint64_t isUpper7_0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD block[4];
  id v15;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper7_0_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v15 = v4;
  v5 = isUpper7_0_onceToken;
  v6 = v4;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&isUpper7_0_onceToken, block);
  v8 = isUpper7_0_policyPhraseBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  v11 = v10;

  if ((v8 & 0x40) != 0)
    v12 = v11 >> v8;
  else
    v12 = ((2 * v11) << ~v8) | (v9 >> v8);

  return v12 & 1;
}

BOOL isUpper7(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[4];
  id v19;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper7_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v19 = v4;
  v5 = isUpper7_onceToken;
  v6 = v4;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&isUpper7_onceToken, block);
  v8 = 1 << isUpper7_policyBit;
  if ((isUpper7_policyBit & 0x40) != 0)
    v9 = 1 << isUpper7_policyBit;
  else
    v9 = 0;
  if ((isUpper7_policyBit & 0x40) != 0)
    v8 = 0;
  v10 = 1 << isUpper7_prefixBit;
  if ((isUpper7_prefixBit & 0x40) != 0)
    v11 = 1 << isUpper7_prefixBit;
  else
    v11 = 0;
  if ((isUpper7_prefixBit & 0x40) != 0)
    v10 = 0;
  v12 = v10 | v8;
  v13 = v11 | v9;
  v14 = -[PRSRankingItem indexScore]((uint64_t)v7);
  v16 = v15;

  return (v12 & v14 | v13 & v16) != 0;
}

BOOL isUpper7_r(void *a1, unint64_t a2, unint64_t a3, void *a4)
{
  id v7;
  id v8;
  unint64_t v9;
  _BOOL8 v10;

  v7 = a1;
  v8 = a4;
  v10 = 1;
  if (-[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v7, 32, a2) < a2)
  {
    v9 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v7, 393216, a2);
    if (a3 < 2
      || v9 < a2
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("co")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("com")))
    {
      v10 = 0;
    }
  }

  return v10;
}

BOOL isLowerScore_c0(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  _BOOL8 v15;
  _QWORD block[4];
  id v18;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isLowerScore_c0_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v18 = v7;
  if (isLowerScore_c0_onceToken != -1)
    dispatch_once(&isLowerScore_c0_onceToken, block);
  v8 = isLowerScore_c0_bit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0)
    v11 = v10 >> v8;
  v15 = 1;
  if ((v11 & 1) == 0
    || !-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100000000, a2)
    && ((objc_msgSend(v5, "bundleIDType") & 2) == 0
     || !-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000000000, a2)))
  {
    objc_msgSend(v5, "L2FeatureVector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scoreForFeature:", 18);
    v14 = v13;

    if (v14 != 1.0 || !-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100000000, a2))
      v15 = 0;
  }

  return v15;
}

BOOL isLowerScore_c(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  float v13;
  float v14;
  _QWORD block[4];
  id v17;

  v4 = a1;
  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isLowerScore_c_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v6 = v5;
  v17 = v6;
  if (isLowerScore_c_onceToken != -1)
    dispatch_once(&isLowerScore_c_onceToken, block);
  v7 = isLowerScore_c_bit;
  v8 = -[PRSRankingItem indexScore]((uint64_t)v4);
  v10 = ((2 * v9) << ~v7) | (v8 >> v7);
  if ((v7 & 0x40) != 0)
    v10 = v9 >> v7;
  if ((v10 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v4, "L2FeatureVector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scoreForFeature:", 18);
    v14 = v13;

    v11 = v14 == 1.0;
  }

  return v11;
}

BOOL isUpper1_0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
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
  _QWORD block[4];
  id v23;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper1_0_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v23 = v4;
  v5 = isUpper1_0_onceToken;
  v6 = v4;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&isUpper1_0_onceToken, block);
  v8 = 1 << isUpper1_0_bit1;
  if ((isUpper1_0_bit1 & 0x40) != 0)
    v9 = 0;
  else
    v9 = 1 << isUpper1_0_bit1;
  if ((isUpper1_0_bit1 & 0x40) == 0)
    v8 = 0;
  v10 = 1 << isUpper1_0_bit2;
  if ((isUpper1_0_bit2 & 0x40) != 0)
    v11 = 0;
  else
    v11 = 1 << isUpper1_0_bit2;
  if ((isUpper1_0_bit2 & 0x40) == 0)
    v10 = 0;
  v12 = v10 | v8;
  v13 = v11 | v9;
  v14 = 1 << isUpper1_0_bit3;
  if ((isUpper1_0_bit3 & 0x40) != 0)
    v15 = 1 << isUpper1_0_bit3;
  else
    v15 = 0;
  if ((isUpper1_0_bit3 & 0x40) != 0)
    v14 = 0;
  v16 = v13 | v14;
  v17 = v12 | v15;
  v18 = -[PRSRankingItem indexScore]((uint64_t)v7);
  v20 = v19;

  return (v16 & v18 | v17 & v20) != 0;
}

void __isUpper1_0_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsExactPhraseMatchBit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper1_0_bit1 = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCExactOrderedPhraseMatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper1_0_bit2 = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCExactOrderedPhraseMatch"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  isUpper1_0_bit3 = objc_msgSend(v4, "integerValue");

}

BOOL isUpper1(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  _QWORD block[4];
  id v24;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper1_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v24 = v7;
  if (isUpper1_onceToken != -1)
    dispatch_once(&isUpper1_onceToken, block);
  if ((isUpper1_bit & 0x40) != 0)
    v8 = 0;
  else
    v8 = 1 << isUpper1_bit;
  if ((isUpper1_bit & 0x40) != 0)
    v9 = 1 << isUpper1_bit;
  else
    v9 = 0;
  v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v12 = v8 & v10 | v9 & v11;
  if (v12)
  {
    v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100008008, a2);
    v14 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32776, a2);
    v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100000000, a2);
    if (!v14 || v15 < 2 || v13 < a2)
    {
      v16 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 49160, a2);
      if (!-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32776, a2) || v16 < a2)
      {
        objc_msgSend(v5, "L2FeatureVector");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "scoreForFeature:", 1044);
        v19 = v18;

        v20 = ((double)a2 + 1.0) / (double)a2;
        if (v19 != v20 && (v19 >= 2147500000.0 || v19 >= v20 || v19 <= 0.0))
        {
          objc_msgSend(v5, "L2FeatureVector");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scoreForFeature:", 279);

        }
      }
    }
  }

  return v12 != 0;
}

void __isUpper1_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCExactOrderedPhraseMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper1_bit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper2_0_2(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
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
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  float v35;
  float v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  float v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  void *v51;
  float v52;
  float v53;
  _QWORD block[4];
  id v56;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (a2 >= 2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __isUpper2_0_2_block_invoke;
    block[3] = &unk_1E6E42FD8;
    v56 = v6;
    if (isUpper2_0_2_onceToken != -1)
      dispatch_once(&isUpper2_0_2_onceToken, block);
    v9 = 1 << isUpper2_0_2_bit2;
    if ((isUpper2_0_2_bit2 & 0x40) != 0)
      v10 = 1 << isUpper2_0_2_bit2;
    else
      v10 = 0;
    if ((isUpper2_0_2_bit2 & 0x40) != 0)
      v9 = 0;
    v11 = 1 << isUpper2_0_2_bit5;
    if ((isUpper2_0_2_bit5 & 0x40) != 0)
      v12 = 1 << isUpper2_0_2_bit5;
    else
      v12 = 0;
    if ((isUpper2_0_2_bit5 & 0x40) != 0)
      v11 = 0;
    v13 = v11 | v9;
    v14 = v12 | v10;
    v15 = -[PRSRankingItem indexScore]((uint64_t)v5);
    if (v13 & v15 | v14 & v16)
    {
      objc_msgSend(v5, "L2FeatureVector");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scoreForFeature:", 2439);
      v19 = v18;

      if (v19 > 0.0)
        goto LABEL_49;
      if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      {
        objc_msgSend(v5, "L2FeatureVector");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "scoreForFeature:", 2431);
        v22 = v21;

        if (v22 > 0.0)
          goto LABEL_49;
      }
    }
    v23 = 1 << isUpper2_0_2_bit3;
    if ((isUpper2_0_2_bit3 & 0x40) != 0)
      v24 = 1 << isUpper2_0_2_bit3;
    else
      v24 = 0;
    if ((isUpper2_0_2_bit3 & 0x40) != 0)
      v23 = 0;
    v25 = 1 << isUpper2_0_2_bit6;
    if ((isUpper2_0_2_bit6 & 0x40) != 0)
      v26 = 1 << isUpper2_0_2_bit6;
    else
      v26 = 0;
    if ((isUpper2_0_2_bit6 & 0x40) != 0)
      v25 = 0;
    v27 = v25 | v23;
    v28 = v26 | v24;
    v29 = -[PRSRankingItem indexScore]((uint64_t)v5);
    if (v27 & v29 | v28 & v30)
    {
      objc_msgSend(v5, "L2FeatureVector");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "scoreForFeature:", 2439);
      v33 = v32;

      if (v33 > 0.0)
        goto LABEL_49;
      if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      {
        objc_msgSend(v5, "L2FeatureVector");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "scoreForFeature:", 2431);
        v36 = v35;

        if (v36 > 0.0)
          goto LABEL_49;
      }
    }
    v37 = isUpper2_0_2_bit1;
    v38 = -[PRSRankingItem indexScore]((uint64_t)v5);
    v40 = ((2 * v39) << ~v37) | (v38 >> v37);
    if ((v37 & 0x40) != 0)
      v40 = v39 >> v37;
    if ((v40 & 1) == 0)
      goto LABEL_52;
    objc_msgSend(v5, "L2FeatureVector");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "scoreForFeature:", 217);
    v43 = v42;

    v44 = ((double)a2 + 2.0) / (double)a2;
    if (v43 < 2147500000.0 && v43 <= v44 && v43 > 0.0)
      goto LABEL_49;
    objc_msgSend(v5, "L2FeatureVector");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "scoreForFeature:", 223);
    v47 = v46;

    if (v47 < 2147500000.0 && v47 <= v44 && v47 > 0.0)
      goto LABEL_49;
    objc_msgSend(v5, "L2FeatureVector");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "scoreForFeature:", 211);
    v50 = v49;

    if (v50 < 2147500000.0 && v50 <= v44 && v50 > 0.0)
      goto LABEL_49;
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0
      && (objc_msgSend(v5, "L2FeatureVector"),
          v51 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v51, "scoreForFeature:", 199),
          v53 = v52,
          v51,
          v53 < 2147500000.0)
      && v53 <= v44
      && v53 > 0.0)
    {
LABEL_49:
      v8 = 1;
    }
    else
    {
LABEL_52:
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __isUpper2_0_2_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("exact_policy_flag_bit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_2_bit1 = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_2_bit2 = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCExactOrderedMatch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_2_bit3 = objc_msgSend(v4, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCExactNearMatch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_2_bit5 = objc_msgSend(v5, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCExactNearMatch"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_0_2_bit6 = objc_msgSend(v6, "integerValue");

}

uint64_t isUpper2_0_3(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
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
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  float v35;
  float v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  float v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  void *v51;
  float v52;
  float v53;
  _QWORD block[4];
  id v56;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (a2 >= 3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __isUpper2_0_3_block_invoke;
    block[3] = &unk_1E6E42FD8;
    v56 = v6;
    if (isUpper2_0_3_onceToken != -1)
      dispatch_once(&isUpper2_0_3_onceToken, block);
    v9 = 1 << isUpper2_0_3_bit2;
    if ((isUpper2_0_3_bit2 & 0x40) != 0)
      v10 = 1 << isUpper2_0_3_bit2;
    else
      v10 = 0;
    if ((isUpper2_0_3_bit2 & 0x40) != 0)
      v9 = 0;
    v11 = 1 << isUpper2_0_3_bit5;
    if ((isUpper2_0_3_bit5 & 0x40) != 0)
      v12 = 1 << isUpper2_0_3_bit5;
    else
      v12 = 0;
    if ((isUpper2_0_3_bit5 & 0x40) != 0)
      v11 = 0;
    v13 = v11 | v9;
    v14 = v12 | v10;
    v15 = -[PRSRankingItem indexScore]((uint64_t)v5);
    if (v13 & v15 | v14 & v16)
    {
      objc_msgSend(v5, "L2FeatureVector");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scoreForFeature:", 2440);
      v19 = v18;

      if (v19 > 0.0)
        goto LABEL_49;
      if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      {
        objc_msgSend(v5, "L2FeatureVector");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "scoreForFeature:", 2432);
        v22 = v21;

        if (v22 > 0.0)
          goto LABEL_49;
      }
    }
    v23 = 1 << isUpper2_0_3_bit3;
    if ((isUpper2_0_3_bit3 & 0x40) != 0)
      v24 = 1 << isUpper2_0_3_bit3;
    else
      v24 = 0;
    if ((isUpper2_0_3_bit3 & 0x40) != 0)
      v23 = 0;
    v25 = 1 << isUpper2_0_3_bit6;
    if ((isUpper2_0_3_bit6 & 0x40) != 0)
      v26 = 1 << isUpper2_0_3_bit6;
    else
      v26 = 0;
    if ((isUpper2_0_3_bit6 & 0x40) != 0)
      v25 = 0;
    v27 = v25 | v23;
    v28 = v26 | v24;
    v29 = -[PRSRankingItem indexScore]((uint64_t)v5);
    if (v27 & v29 | v28 & v30)
    {
      objc_msgSend(v5, "L2FeatureVector");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "scoreForFeature:", 2440);
      v33 = v32;

      if (v33 > 0.0)
        goto LABEL_49;
      if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      {
        objc_msgSend(v5, "L2FeatureVector");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "scoreForFeature:", 2432);
        v36 = v35;

        if (v36 > 0.0)
          goto LABEL_49;
      }
    }
    v37 = isUpper2_0_3_bit1;
    v38 = -[PRSRankingItem indexScore]((uint64_t)v5);
    v40 = ((2 * v39) << ~v37) | (v38 >> v37);
    if ((v37 & 0x40) != 0)
      v40 = v39 >> v37;
    if ((v40 & 1) == 0)
      goto LABEL_52;
    objc_msgSend(v5, "L2FeatureVector");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "scoreForFeature:", 217);
    v43 = v42;

    v44 = ((double)a2 + 3.0) / (double)a2;
    if (v43 < 2147500000.0 && v43 <= v44 && v43 > 0.0)
      goto LABEL_49;
    objc_msgSend(v5, "L2FeatureVector");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "scoreForFeature:", 223);
    v47 = v46;

    if (v47 < 2147500000.0 && v47 <= v44 && v47 > 0.0)
      goto LABEL_49;
    objc_msgSend(v5, "L2FeatureVector");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "scoreForFeature:", 211);
    v50 = v49;

    if (v50 < 2147500000.0 && v50 <= v44 && v50 > 0.0)
      goto LABEL_49;
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0
      && (objc_msgSend(v5, "L2FeatureVector"),
          v51 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v51, "scoreForFeature:", 199),
          v53 = v52,
          v51,
          v53 < 2147500000.0)
      && v53 <= v44
      && v53 > 0.0)
    {
LABEL_49:
      v8 = 1;
    }
    else
    {
LABEL_52:
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __isUpper2_0_3_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("exact_policy_flag_bit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_3_bit1 = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_3_bit2 = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCExactOrderedMatch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_3_bit3 = objc_msgSend(v4, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCExactNearMatch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_3_bit5 = objc_msgSend(v5, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCExactNearMatch"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_0_3_bit6 = objc_msgSend(v6, "integerValue");

}

uint64_t isUpper2_0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
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
  char v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  float v36;
  float v37;
  _QWORD block[4];
  id v40;

  v4 = a1;
  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper2_0_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v6 = v5;
  v40 = v6;
  if (isUpper2_0_onceToken != -1)
    dispatch_once(&isUpper2_0_onceToken, block);
  v7 = 1;
  v8 = 1 << isUpper2_0_bit2;
  if ((isUpper2_0_bit2 & 0x40) != 0)
    v9 = 1 << isUpper2_0_bit2;
  else
    v9 = 0;
  if ((isUpper2_0_bit2 & 0x40) != 0)
    v8 = 0;
  v10 = 1 << isUpper2_0_bit3;
  if ((isUpper2_0_bit3 & 0x40) != 0)
    v11 = 1 << isUpper2_0_bit3;
  else
    v11 = 0;
  if ((isUpper2_0_bit3 & 0x40) != 0)
    v10 = 0;
  v12 = v10 | v8;
  v13 = v11 | v9;
  v14 = 1 << isUpper2_0_bit5;
  if ((isUpper2_0_bit5 & 0x40) != 0)
    v15 = 0;
  else
    v15 = 1 << isUpper2_0_bit5;
  if ((isUpper2_0_bit5 & 0x40) == 0)
    v14 = 0;
  v16 = 1 << isUpper2_0_bit6;
  if ((isUpper2_0_bit6 & 0x40) != 0)
    v17 = 1 << isUpper2_0_bit6;
  else
    v17 = 0;
  if ((isUpper2_0_bit6 & 0x40) != 0)
    v16 = 0;
  v18 = v12 | v15 | v16;
  v19 = v13 | v14 | v17;
  v20 = -[PRSRankingItem indexScore]((uint64_t)v4);
  if (!(v18 & v20 | v19 & v21))
  {
    v22 = isUpper2_0_bit1;
    v23 = -[PRSRankingItem indexScore]((uint64_t)v4);
    v25 = ((2 * v24) << ~v22) | (v23 >> v22);
    if ((v22 & 0x40) != 0)
      v25 = v24 >> v22;
    if ((v25 & 1) == 0)
      goto LABEL_37;
    objc_msgSend(v4, "L2FeatureVector");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scoreForFeature:", 217);
    v28 = v27;

    if (v28 > 0.0 && v28 < 2147500000.0)
      goto LABEL_33;
    objc_msgSend(v4, "L2FeatureVector");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scoreForFeature:", 223);
    v31 = v30;

    if (v31 > 0.0 && v31 < 2147500000.0)
      goto LABEL_33;
    objc_msgSend(v4, "L2FeatureVector");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scoreForFeature:", 211);
    v34 = v33;

    if (v34 > 0.0 && v34 < 2147500000.0)
      goto LABEL_33;
    if ((objc_msgSend(v4, "bundleIDType") & 2) != 0
      && (objc_msgSend(v4, "L2FeatureVector"),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v35, "scoreForFeature:", 199),
          v37 = v36,
          v35,
          v37 > 0.0)
      && v37 < 2147500000.0)
    {
LABEL_33:
      v7 = 1;
    }
    else
    {
LABEL_37:
      v7 = 0;
    }
  }

  return v7;
}

void __isUpper2_0_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("exact_policy_flag_bit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_bit1 = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_bit2 = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCExactOrderedMatch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_bit3 = objc_msgSend(v4, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCExactNearMatch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_0_bit5 = objc_msgSend(v5, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCExactNearMatch"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_0_bit6 = objc_msgSend(v6, "integerValue");

}

uint64_t isUpper2(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  uint64_t v26;
  unint64_t v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  _QWORD block[4];
  id v36;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper2_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v36 = v7;
  if (isUpper2_onceToken != -1)
    dispatch_once(&isUpper2_onceToken, block);
  v8 = 1 << isUpper2_bit4;
  if ((isUpper2_bit4 & 0x40) != 0)
    v9 = 1 << isUpper2_bit4;
  else
    v9 = 0;
  if ((isUpper2_bit4 & 0x40) != 0)
    v8 = 0;
  v10 = 1 << isUpper2_bit7;
  if ((isUpper2_bit7 & 0x40) != 0)
    v11 = 1 << isUpper2_bit7;
  else
    v11 = 0;
  if ((isUpper2_bit7 & 0x40) != 0)
    v10 = 0;
  v12 = v10 | v8;
  v13 = v11 | v9;
  v14 = -[PRSRankingItem indexScore]((uint64_t)v5);
  if (!(v12 & v14 | v13 & v15))
    goto LABEL_25;
  v16 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100008008, a2);
  v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32776, a2);
  v18 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x100000000, a2);
  if (v17 && v18 >= 2 && v16 >= a2)
    goto LABEL_23;
  v19 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 49160, a2);
  if (v17)
  {
    if (v19 >= a2)
      goto LABEL_23;
  }
  objc_msgSend(v5, "L2FeatureVector");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scoreForFeature:", 1043);
  v22 = v21;

  if (v22 > 0.0 && v22 < 2147500000.0)
    goto LABEL_23;
  objc_msgSend(v5, "L2FeatureVector");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scoreForFeature:", 277);
  v25 = v24;

  if (v25 > 0.0 && v25 < 2147500000.0)
    goto LABEL_23;
  if ((objc_msgSend(v5, "bundleIDType") & 2) == 0)
  {
LABEL_25:
    v26 = 0;
    goto LABEL_26;
  }
  v28 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000000000, a2);
  if ((unint64_t)-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000000000, a2) >= 2
    && v28 >= a2)
  {
    goto LABEL_23;
  }
  objc_msgSend(v5, "L2FeatureVector");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scoreForFeature:", 1043);
  v31 = v30;

  if (v31 > 0.0 && v31 < 2147500000.0)
    goto LABEL_23;
  objc_msgSend(v5, "L2FeatureVector");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scoreForFeature:", 283);
  v34 = v33;

  v26 = 0;
  if (v34 > 0.0 && v34 < 2147500000.0)
LABEL_23:
    v26 = 1;
LABEL_26:

  return v26;
}

void __isUpper2_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCExactOrderedMatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper2_bit4 = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCExactNearMatch"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_bit7 = objc_msgSend(v3, "integerValue");

}

uint64_t isUpper3_0(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
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
  char v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  float v28;
  float v29;
  float v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  float v34;
  float v35;
  float v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  float v40;
  float v41;
  float v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  float v46;
  float v47;
  float v48;
  _QWORD block[4];
  id v51;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper3_0_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v51 = v7;
  if (isUpper3_0_onceToken != -1)
    dispatch_once(&isUpper3_0_onceToken, block);
  v8 = 1;
  v9 = 1 << isUpper3_0_almostExactBit1;
  if ((isUpper3_0_almostExactBit1 & 0x40) != 0)
    v10 = 0;
  else
    v10 = 1 << isUpper3_0_almostExactBit1;
  if ((isUpper3_0_almostExactBit1 & 0x40) == 0)
    v9 = 0;
  v11 = 1 << isUpper3_0_almostExactBit2;
  if ((isUpper3_0_almostExactBit2 & 0x40) != 0)
    v12 = 0;
  else
    v12 = 1 << isUpper3_0_almostExactBit2;
  if ((isUpper3_0_almostExactBit2 & 0x40) == 0)
    v11 = 0;
  v13 = v11 | v9;
  v14 = v12 | v10;
  v15 = 1 << isUpper3_0_almostExactBit3;
  if ((isUpper3_0_almostExactBit3 & 0x40) != 0)
    v16 = 1 << isUpper3_0_almostExactBit3;
  else
    v16 = 0;
  if ((isUpper3_0_almostExactBit3 & 0x40) != 0)
    v15 = 0;
  v17 = v14 | v15;
  v18 = v13 | v16;
  v19 = -[PRSRankingItem indexScore]((uint64_t)v5);
  if (!(v17 & v19 | v18 & v20))
  {
    v21 = isUpper3_0_policyBit;
    v22 = -[PRSRankingItem indexScore]((uint64_t)v5);
    v24 = ((2 * v23) << ~v21) | (v22 >> v21);
    if ((v21 & 0x40) != 0)
      v24 = v23 >> v21;
    if ((v24 & 1) == 0)
      goto LABEL_56;
    v25 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 4, a2);
    v26 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 4, a2);
    if (v25)
    {
      if (v25 >= a2 - 1)
      {
        if (v26)
        {
          if (v26 >= a2)
          {
            objc_msgSend(v5, "L2FeatureVector");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "scoreForFeature:", 212);
            v29 = v28;

            v30 = ((double)a2 + 1.0) / (double)a2;
            if (v29 == v30 || v29 < 2147500000.0 && v29 < v30 && v29 > 0.0)
              goto LABEL_55;
          }
        }
      }
    }
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
    {
      v31 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
      v32 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 2, a2);
      if (v31)
      {
        if (v31 >= a2 - 1)
        {
          if (v32)
          {
            if (v32 >= a2)
            {
              objc_msgSend(v5, "L2FeatureVector");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "scoreForFeature:", 212);
              v35 = v34;

              v36 = ((double)a2 + 1.0) / (double)a2;
              if (v35 == v36 || v35 < 2147500000.0 && v35 < v36 && v35 > 0.0)
                goto LABEL_55;
            }
          }
        }
      }
    }
    v37 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 8, a2);
    v38 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 8, a2);
    if (v37)
    {
      if (v37 >= a2 - 1)
      {
        if (v38)
        {
          if (v38 >= a2)
          {
            objc_msgSend(v5, "L2FeatureVector");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "scoreForFeature:", 218);
            v41 = v40;

            v42 = ((double)a2 + 1.0) / (double)a2;
            if (v41 == v42 || v41 < 2147500000.0 && v41 < v42 && v41 > 0.0)
              goto LABEL_55;
          }
        }
      }
    }
    v43 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x8000, a2);
    v44 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 0x8000, a2);
    if (!v43)
    {
LABEL_56:
      v8 = 0;
      goto LABEL_57;
    }
    v8 = 0;
    if (v43 >= a2 - 1)
    {
      if (v44)
      {
        if (v44 >= a2)
        {
          objc_msgSend(v5, "L2FeatureVector");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "scoreForFeature:", 218);
          v47 = v46;

          v48 = ((double)a2 + 1.0) / (double)a2;
          if (v47 == v48 || (v8 = 0, v47 < 2147500000.0) && v47 < v48 && v47 > 0.0)
LABEL_55:
            v8 = 1;
        }
      }
    }
  }
LABEL_57:

  return v8;
}

void __isUpper3_0_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTwoTermsMultiPhraseTCMostlyExactOrderedPhraseMatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper3_0_almostExactBit1 = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingOneTermMultiPhraseTCMostlyExactOrderedPhraseMatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper3_0_almostExactBit2 = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsMostlyExactPhraseMatchBit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper3_0_almostExactBit3 = objc_msgSend(v4, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  isUpper3_0_policyBit = objc_msgSend(v5, "integerValue");

}

uint64_t isUpper3(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  void *v33;
  float v34;
  float v35;
  _QWORD block[4];
  id v38;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper3_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v38 = v7;
  if (isUpper3_onceToken != -1)
    dispatch_once(&isUpper3_onceToken, block);
  v8 = isUpper3_policyBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0)
    v11 = v10 >> v8;
  if ((v11 & 1) == 0)
    goto LABEL_9;
  v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
  if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
    v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
  v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 8, a2);
  v14 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x8000, a2);
  if (v12 < a2 - 1)
    goto LABEL_9;
  v16 = v14;
  objc_msgSend(v5, "L2FeatureVector");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scoreForFeature:", 212);
  v19 = v18;

  v20 = ((double)a2 + 1.0) / (double)a2;
  if (v19 == v20 || v19 < 2147500000.0 && v19 < v20 && v19 > 0.0)
    goto LABEL_50;
  if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
  {
    objc_msgSend(v5, "L2FeatureVector");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scoreForFeature:", 200);
    v35 = v34;

    if (v35 == v20 || v35 < 2147500000.0 && v35 < v20 && v35 > 0.0)
      goto LABEL_50;
  }
  objc_msgSend(v5, "L2FeatureVector");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scoreForFeature:", 218);
  v23 = v22;

  if (v23 == v20 || v23 < 2147500000.0 && v23 < v20 && v23 > 0.0)
    goto LABEL_50;
  if (a2 >= 3 && v13
    || a2 >= 4 && v13 > 1
    || (objc_msgSend(v5, "L2FeatureVector"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v24, "scoreForFeature:", 224),
        v26 = v25,
        v24,
        v26 == v20))
  {
LABEL_50:
    v15 = 1;
    goto LABEL_51;
  }
  v27 = a2 <= 2 || v16 == 0;
  v28 = !v27;
  v29 = a2 > 3 && v16 > 1;
  v30 = v29;
  v31 = v26 > 0.0 && v26 < v20;
  v32 = v31 && v26 < 2147500000.0;
  v15 = 1;
  if (!v32 && !v28 && !v30)
LABEL_9:
    v15 = 0;
LABEL_51:

  return v15;
}

void __isUpper3_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsPrefixMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper3_policyBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper4_0(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD block[4];
  id v17;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper4_0_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v17 = v7;
  if (isUpper4_0_onceToken != -1)
    dispatch_once(&isUpper4_0_onceToken, block);
  v8 = isUpper4_0_upperBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0)
    v11 = v10 >> v8;
  if ((v11 & 1) == 0)
    goto LABEL_15;
  v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x10000C00CLL, a2);
  if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
    v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000000002, a2);
  if (!a2)
    goto LABEL_15;
  if (a2 != 1)
  {
    v14 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 0x10000C00CLL, a2);
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      v14 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 0x1000000002, a2);
    if (v14 >= a2)
      goto LABEL_11;
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  if (!v12)
    goto LABEL_15;
LABEL_11:
  v13 = 1;
LABEL_16:

  return v13;
}

void __isUpper4_0_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCMostlyExactOrderedPhraseMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper4_0_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD block[4];
  id v15;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper4_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v15 = v4;
  v5 = isUpper4_onceToken;
  v6 = v4;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&isUpper4_onceToken, block);
  v8 = isUpper4_upperBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  v11 = v10;

  if ((v8 & 0x40) != 0)
    v12 = v11 >> v8;
  else
    v12 = ((2 * v11) << ~v8) | (v9 >> v8);

  return v12 & 1;
}

void __isUpper4_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCMostlyExactOrderedPhraseMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper4_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper2_1(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD block[4];
  id v16;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper2_1_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v16 = v7;
  if (isUpper2_1_onceToken != -1)
    dispatch_once(&isUpper2_1_onceToken, block);
  v8 = isUpper2_1_upperBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0)
    v11 = v10 >> v8;
  if ((v11 & 1) == 0)
    goto LABEL_9;
  v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
  if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
    v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
  if (v12 >= a2)
    v13 = 1;
  else
LABEL_9:
    v13 = 0;

  return v13;
}

void __isUpper2_1_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_1_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper2_1_2(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  _QWORD block[4];
  id v28;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (a2 >= 2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __isUpper2_1_2_block_invoke;
    block[3] = &unk_1E6E42FD8;
    v28 = v6;
    if (isUpper2_1_2_onceToken != -1)
      dispatch_once(&isUpper2_1_2_onceToken, block);
    v9 = isUpper2_1_2_upperBit;
    v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
    v12 = ((2 * v11) << ~v9) | (v10 >> v9);
    if ((v9 & 0x40) != 0)
      v12 = v11 >> v9;
    if ((v12 & 1) == 0)
      goto LABEL_11;
    v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
    if (v13 < a2)
      goto LABEL_11;
    objc_msgSend(v5, "L2FeatureVector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scoreForFeature:", 2443);
    v17 = v16;

    objc_msgSend(v5, "L2FeatureVector");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scoreForFeature:", 2503);
    v20 = v19;

    objc_msgSend(v5, "L2FeatureVector");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scoreForFeature:", 2439);
    v23 = v22;

    v8 = 1;
    if (v17 > 0.0 || v20 > 0.0 || v23 > 0.0)
      goto LABEL_12;
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0
      && (objc_msgSend(v5, "L2FeatureVector"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v24, "scoreForFeature:", 2431),
          v26 = v25,
          v24,
          v26 > 0.0))
    {
      v8 = 1;
    }
    else
    {
LABEL_11:
      v8 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

void __isUpper2_1_2_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_1_2_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper2_1_3(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  _QWORD block[4];
  id v28;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (a2 >= 3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __isUpper2_1_3_block_invoke;
    block[3] = &unk_1E6E42FD8;
    v28 = v6;
    if (isUpper2_1_3_onceToken != -1)
      dispatch_once(&isUpper2_1_3_onceToken, block);
    v9 = isUpper2_1_3_upperBit;
    v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
    v12 = ((2 * v11) << ~v9) | (v10 >> v9);
    if ((v9 & 0x40) != 0)
      v12 = v11 >> v9;
    if ((v12 & 1) == 0)
      goto LABEL_11;
    v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      v13 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
    if (v13 < a2)
      goto LABEL_11;
    objc_msgSend(v5, "L2FeatureVector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scoreForFeature:", 2444);
    v17 = v16;

    objc_msgSend(v5, "L2FeatureVector");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scoreForFeature:", 2504);
    v20 = v19;

    objc_msgSend(v5, "L2FeatureVector");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scoreForFeature:", 2440);
    v23 = v22;

    v8 = 1;
    if (v17 > 0.0 || v20 > 0.0 || v23 > 0.0)
      goto LABEL_12;
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0
      && (objc_msgSend(v5, "L2FeatureVector"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v24, "scoreForFeature:", 2432),
          v26 = v25,
          v24,
          v26 > 0.0))
    {
      v8 = 1;
    }
    else
    {
LABEL_11:
      v8 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

void __isUpper2_1_3_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_1_3_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper2_2_2(void *a1, unint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  float v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  float v35;
  float v36;
  void *v37;
  float v38;
  float v39;
  _QWORD block[4];
  id v42;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper2_2_2_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v10 = v8;
  v42 = v10;
  if (isUpper2_2_2_onceToken != -1)
    dispatch_once(&isUpper2_2_2_onceToken, block);
  v11 = isUpper2_2_2_upperBit;
  v12 = -[PRSRankingItem indexScore]((uint64_t)v7);
  v14 = ((2 * v13) << ~v11) | (v12 >> v11);
  if ((v11 & 0x40) != 0)
    v14 = v13 >> v11;
  if ((v14 & 1) == 0)
    goto LABEL_19;
  v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x10000C00CLL, a2);
  if ((objc_msgSend(v7, "bundleIDType") & 2) != 0)
    v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x1000004002, a2);
  if (!objc_msgSend(v9, "count"))
    goto LABEL_19;
  objc_msgSend(v9, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  v18 = 0;
  if (v15 >= a2 && v17 >= 2)
  {
    objc_msgSend(v7, "L2FeatureVector");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scoreForFeature:", 2443);
    v21 = v20;

    objc_msgSend(v7, "L2FeatureVector");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scoreForFeature:", 2503);
    v24 = v23;

    objc_msgSend(v7, "L2FeatureVector");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scoreForFeature:", 2439);
    v27 = v26;

    objc_msgSend(v7, "L2FeatureVector");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scoreForFeature:", 2467);
    v30 = v29;

    objc_msgSend(v7, "L2FeatureVector");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scoreForFeature:", 2499);
    v33 = v32;

    v18 = 1;
    if (v21 <= 0.0 && v24 <= 0.0 && v27 <= 0.0 && v30 <= 0.0 && v33 <= 0.0)
    {
      if ((objc_msgSend(v7, "bundleIDType") & 2) == 0)
        goto LABEL_19;
      objc_msgSend(v7, "L2FeatureVector");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "scoreForFeature:", 2431);
      v36 = v35;

      objc_msgSend(v7, "L2FeatureVector");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "scoreForFeature:", 2471);
      v39 = v38;

      if (v36 <= 0.0 && v39 <= 0.0)
LABEL_19:
        v18 = 0;
    }
  }

  return v18;
}

void __isUpper2_2_2_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_2_2_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper2_2_3(void *a1, unint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  _QWORD block[4];
  id v41;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  if (a2 >= 3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __isUpper2_2_3_block_invoke;
    block[3] = &unk_1E6E42FD8;
    v41 = v8;
    if (isUpper2_2_3_onceToken != -1)
      dispatch_once(&isUpper2_2_3_onceToken, block);
    v11 = isUpper2_2_3_upperBit;
    v12 = -[PRSRankingItem indexScore]((uint64_t)v7);
    v14 = ((2 * v13) << ~v11) | (v12 >> v11);
    if ((v11 & 0x40) != 0)
      v14 = v13 >> v11;
    if ((v14 & 1) == 0)
      goto LABEL_21;
    v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x10000C00CLL, a2);
    if ((objc_msgSend(v7, "bundleIDType") & 2) != 0)
      v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x1000004002, a2);
    if (!objc_msgSend(v9, "count"))
      goto LABEL_21;
    objc_msgSend(v9, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    v10 = 0;
    if (v15 >= a2 && v17 >= 2)
    {
      objc_msgSend(v7, "L2FeatureVector");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scoreForFeature:", 2444);
      v20 = v19;

      objc_msgSend(v7, "L2FeatureVector");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scoreForFeature:", 2504);
      v23 = v22;

      objc_msgSend(v7, "L2FeatureVector");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "scoreForFeature:", 2440);
      v26 = v25;

      objc_msgSend(v7, "L2FeatureVector");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "scoreForFeature:", 2468);
      v29 = v28;

      objc_msgSend(v7, "L2FeatureVector");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "scoreForFeature:", 2500);
      v32 = v31;

      v10 = 1;
      if (v20 <= 0.0 && v23 <= 0.0 && v26 <= 0.0 && v29 <= 0.0 && v32 <= 0.0)
      {
        if ((objc_msgSend(v7, "bundleIDType") & 2) == 0)
          goto LABEL_21;
        objc_msgSend(v7, "L2FeatureVector");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "scoreForFeature:", 2432);
        v35 = v34;

        objc_msgSend(v7, "L2FeatureVector");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "scoreForFeature:", 2472);
        v38 = v37;

        if (v35 <= 0.0 && v38 <= 0.0)
LABEL_21:
          v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __isUpper2_2_3_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_2_3_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper2_2(void *a1, unint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD block[4];
  id v21;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper2_2_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v10 = v8;
  v21 = v10;
  if (isUpper2_2_onceToken != -1)
    dispatch_once(&isUpper2_2_onceToken, block);
  v11 = isUpper2_2_upperBit;
  v12 = -[PRSRankingItem indexScore]((uint64_t)v7);
  v14 = ((2 * v13) << ~v11) | (v12 >> v11);
  if ((v11 & 0x40) != 0)
    v14 = v13 >> v11;
  if ((v14 & 1) == 0)
    goto LABEL_12;
  v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x10000C00CLL, a2);
  if ((objc_msgSend(v7, "bundleIDType") & 2) != 0)
    v15 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v7, 0x1000004002, a2);
  if (objc_msgSend(v9, "count")
    && (objc_msgSend(v9, "lastObject"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "length"),
        v16,
        v15 >= a2)
    && v17 > 1)
  {
    v18 = 1;
  }
  else
  {
LABEL_12:
    v18 = 0;
  }

  return v18;
}

void __isUpper2_2_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper2_2_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper5_0(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD block[4];
  id v17;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper5_0_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v17 = v7;
  if (isUpper5_0_onceToken != -1)
    dispatch_once(&isUpper5_0_onceToken, block);
  v8 = isUpper5_0_upperBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0)
    v11 = v10 >> v8;
  if ((v11 & 1) == 0)
    goto LABEL_16;
  v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 32780, a2);
  if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
    v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
  if (!a2)
    goto LABEL_16;
  if (a2 != 1)
  {
    if (v12 < a2 - 1)
      goto LABEL_16;
    v13 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 32780, a2);
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      v13 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 2, a2);
    if (v13 < a2)
      goto LABEL_16;
LABEL_18:
    v14 = 1;
    goto LABEL_17;
  }
  if (v12)
    goto LABEL_18;
LABEL_16:
  v14 = 0;
LABEL_17:

  return v14;
}

void __isUpper5_0_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper5_0_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper5_0r(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD block[4];
  id v17;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper5_0r_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v17 = v7;
  if (isUpper5_0r_onceToken != -1)
    dispatch_once(&isUpper5_0r_onceToken, block);
  v8 = isUpper5_0r_upperBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0)
    v11 = v10 >> v8;
  if ((v11 & 1) == 0)
    goto LABEL_16;
  v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 294956, a2);
  if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
    v12 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 2, a2);
  if (!a2)
    goto LABEL_16;
  if (a2 != 1)
  {
    if (v12 < a2 - 1)
      goto LABEL_16;
    v13 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 294956, a2);
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      v13 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 2, a2);
    if (v13 < a2)
      goto LABEL_16;
LABEL_18:
    v14 = 1;
    goto LABEL_17;
  }
  if (v12)
    goto LABEL_18;
LABEL_16:
  v14 = 0;
LABEL_17:

  return v14;
}

void __isUpper5_0r_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper5_0r_upperBit = objc_msgSend(v1, "integerValue");

}

BOOL isUpper5_s(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  _QWORD block[4];
  id v16;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper5_s_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v16 = v7;
  if (isUpper5_s_onceToken != -1)
    dispatch_once(&isUpper5_s_onceToken, block);
  v8 = isUpper5_s_upperBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0)
    v11 = v10 >> v8;
  v13 = 0;
  if ((v11 & 1) != 0)
  {
    v12 = (objc_msgSend(v5, "bundleIDType") & 2) != 0 ? 0x1000004002 : 0x10000C00CLL;
    if (-[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, v12, a2) >= a2 - 1
      && -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, v12, a2) >= a2)
    {
      v13 = 1;
    }
  }

  return v13;
}

void __isUpper5_s_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper5_s_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper5__2(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  double v39;
  void *v40;
  float v41;
  float v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  float v47;
  float v48;
  float v50;
  _QWORD block[4];
  id v52;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (a2 >= 2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __isUpper5__2_block_invoke;
    block[3] = &unk_1E6E42FD8;
    v52 = v6;
    if (isUpper5__2_onceToken != -1)
      dispatch_once(&isUpper5__2_onceToken, block);
    v9 = isUpper5__2_upperBit;
    v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
    v12 = ((2 * v11) << ~v9) | (v10 >> v9);
    if ((v9 & 0x40) != 0)
      v12 = v11 >> v9;
    if ((v12 & 1) == 0)
      goto LABEL_21;
    objc_msgSend(v5, "L2FeatureVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scoreForFeature:", 2597);
    v50 = v14;

    objc_msgSend(v5, "L2FeatureVector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scoreForFeature:", 2627);
    v17 = v16;

    objc_msgSend(v5, "L2FeatureVector");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scoreForFeature:", 2611);
    v20 = v19;

    objc_msgSend(v5, "L2FeatureVector");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scoreForFeature:", 2599);
    v23 = v22;

    objc_msgSend(v5, "L2FeatureVector");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scoreForFeature:", 2629);
    v26 = v25;

    objc_msgSend(v5, "L2FeatureVector");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scoreForFeature:", 2631);
    v29 = v28;

    objc_msgSend(v5, "L2FeatureVector");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scoreForFeature:", 2603);
    v32 = v31;

    objc_msgSend(v5, "L2FeatureVector");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scoreForFeature:", 2633);
    v35 = v34;

    objc_msgSend(v5, "L2FeatureVector");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scoreForFeature:", 2635);
    v38 = v37;

    v8 = 1;
    *(float *)&v39 = v50;
    if (v50 <= 0.0
      && v17 <= 0.0
      && v20 <= 0.0
      && v23 <= 0.0
      && v26 <= 0.0
      && v29 <= 0.0
      && v32 <= 0.0
      && v35 <= 0.0
      && v38 <= 0.0)
    {
      if ((objc_msgSend(v5, "bundleIDType", v39) & 2) == 0)
        goto LABEL_21;
      objc_msgSend(v5, "L2FeatureVector");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "scoreForFeature:", 2593);
      v42 = v41;

      objc_msgSend(v5, "L2FeatureVector");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "scoreForFeature:", 2627);
      v45 = v44;

      objc_msgSend(v5, "L2FeatureVector");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "scoreForFeature:", 2613);
      v48 = v47;

      v8 = 1;
      if (v42 <= 0.0 && v45 <= 0.0 && v48 <= 0.0)
LABEL_21:
        v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __isUpper5__2_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper5__2_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper5__3(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  double v39;
  void *v40;
  float v41;
  float v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  float v47;
  float v48;
  float v50;
  _QWORD block[4];
  id v52;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (a2 >= 3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __isUpper5__3_block_invoke;
    block[3] = &unk_1E6E42FD8;
    v52 = v6;
    if (isUpper5__3_onceToken != -1)
      dispatch_once(&isUpper5__3_onceToken, block);
    v9 = isUpper5__3_upperBit;
    v10 = -[PRSRankingItem indexScore]((uint64_t)v5);
    v12 = ((2 * v11) << ~v9) | (v10 >> v9);
    if ((v9 & 0x40) != 0)
      v12 = v11 >> v9;
    if ((v12 & 1) == 0)
      goto LABEL_21;
    objc_msgSend(v5, "L2FeatureVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scoreForFeature:", 2598);
    v50 = v14;

    objc_msgSend(v5, "L2FeatureVector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scoreForFeature:", 2628);
    v17 = v16;

    objc_msgSend(v5, "L2FeatureVector");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scoreForFeature:", 2612);
    v20 = v19;

    objc_msgSend(v5, "L2FeatureVector");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scoreForFeature:", 2600);
    v23 = v22;

    objc_msgSend(v5, "L2FeatureVector");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scoreForFeature:", 2630);
    v26 = v25;

    objc_msgSend(v5, "L2FeatureVector");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scoreForFeature:", 2632);
    v29 = v28;

    objc_msgSend(v5, "L2FeatureVector");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scoreForFeature:", 2604);
    v32 = v31;

    objc_msgSend(v5, "L2FeatureVector");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scoreForFeature:", 2634);
    v35 = v34;

    objc_msgSend(v5, "L2FeatureVector");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scoreForFeature:", 2636);
    v38 = v37;

    v8 = 1;
    *(float *)&v39 = v50;
    if (v50 <= 0.0
      && v17 <= 0.0
      && v20 <= 0.0
      && v23 <= 0.0
      && v26 <= 0.0
      && v29 <= 0.0
      && v32 <= 0.0
      && v35 <= 0.0
      && v38 <= 0.0)
    {
      if ((objc_msgSend(v5, "bundleIDType", v39) & 2) == 0)
        goto LABEL_21;
      objc_msgSend(v5, "L2FeatureVector");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "scoreForFeature:", 2594);
      v42 = v41;

      objc_msgSend(v5, "L2FeatureVector");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "scoreForFeature:", 2628);
      v45 = v44;

      objc_msgSend(v5, "L2FeatureVector");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "scoreForFeature:", 2614);
      v48 = v47;

      v8 = 1;
      if (v42 <= 0.0 && v45 <= 0.0 && v48 <= 0.0)
LABEL_21:
        v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __isUpper5__3_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper5__3_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper5(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD block[4];
  id v15;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper5_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v15 = v4;
  v5 = isUpper5_onceToken;
  v6 = v4;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&isUpper5_onceToken, block);
  v8 = isUpper5_upperBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  v11 = v10;

  if ((v8 & 0x40) != 0)
    v12 = v11 >> v8;
  else
    v12 = ((2 * v11) << ~v8) | (v9 >> v8);

  return v12 & 1;
}

void __isUpper5_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper5_upperBit = objc_msgSend(v1, "integerValue");

}

void __isUpper5_c_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsTCMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper5_c_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper5_1(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD block[4];
  id v16;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper5_1_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v16 = v7;
  if (isUpper5_1_onceToken != -1)
    dispatch_once(&isUpper5_1_onceToken, block);
  v8 = isUpper5_1_upperBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v11 = ((2 * v10) << ~v8) | (v9 >> v8);
  if ((v8 & 0x40) != 0)
    v11 = v10 >> v8;
  if ((v11 & 1) == 0)
    goto LABEL_9;
  v12 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 0x10001C00CLL, a2);
  if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
    v12 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v5, 0x1000004002, a2);
  if (v12 >= a2)
    v13 = 1;
  else
LABEL_9:
    v13 = 0;

  return v13;
}

void __isUpper5_1_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsTCNearMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper5_1_upperBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper6(void *a1, unint64_t a2, unint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD block[4];
  id v23;

  v9 = a1;
  v10 = a4;
  v11 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper6_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v12 = v11;
  v23 = v12;
  if (isUpper6_onceToken != -1)
    dispatch_once(&isUpper6_onceToken, block);
  v13 = isUpper6_upperBit;
  v14 = -[PRSRankingItem indexScore]((uint64_t)v9);
  v16 = ((2 * v15) << ~v13) | (v14 >> v13);
  if ((v13 & 0x40) != 0)
    v16 = v15 >> v13;
  if ((v16 & 1) == 0)
    goto LABEL_22;
  v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v9, 0x10007C02CLL, a2);
  if ((objc_msgSend(v9, "bundleIDType") & 2) != 0)
    v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v9, 0x1000004002, a2);
  if (!a2)
    goto LABEL_22;
  if (a2 != 1)
  {
    if (v17 < a2 - 1)
      goto LABEL_22;
    v19 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v9, 0x10007C02CLL, a2);
    if ((objc_msgSend(v9, "bundleIDType") & 2) != 0)
      v19 = -[PRSRankingItem attrCountPrefixLast:queryTermCount:]((uint64_t)v9, 0x1000004002, a2);
    if (a3 < 2 || v19 < a2)
      goto LABEL_22;
LABEL_20:
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("co")) & 1) == 0
      && !objc_msgSend(v10, "isEqualToString:", CFSTR("com")))
    {
      goto LABEL_11;
    }
LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
  if (!v17)
  {
    v20 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v9, 0x10000, 1);
    if (a3 < 2 || !v20)
      goto LABEL_22;
    goto LABEL_20;
  }
LABEL_11:
  v18 = 1;
LABEL_23:

  return v18;
}

void __isUpper6_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsDomainTCMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper6_upperBit = objc_msgSend(v1, "integerValue");

}

void __isUpper6_r_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingMostlyExactMultiFieldsDomainTCMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper6_r_upperBit = objc_msgSend(v1, "integerValue");

}

void __isUpper7_0_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsPhraseMatchBit"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper7_0_policyPhraseBit = objc_msgSend(v1, "integerValue");

}

uint64_t isUpper7_1(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD block[4];
  id v15;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isUpper7_1_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v15 = v4;
  v5 = isUpper7_1_onceToken;
  v6 = v4;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&isUpper7_1_onceToken, block);
  v8 = isUpper7_1_prefixBit;
  v9 = -[PRSRankingItem indexScore]((uint64_t)v7);
  v11 = v10;

  if ((v8 & 0x40) != 0)
    v12 = v11 >> v8;
  else
    v12 = ((2 * v11) << ~v8) | (v9 >> v8);

  return v12 & 1;
}

void __isUpper7_1_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isUpper7_1_prefixBit = objc_msgSend(v1, "integerValue");

}

void __isUpper7_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isUpper7_prefixBit = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsPrefixMatch"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  isUpper7_policyBit = objc_msgSend(v3, "integerValue");

}

uint64_t isLowerScore_0(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD block[4];
  id v22;

  v5 = a1;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isLowerScore_0_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v7 = v6;
  v22 = v7;
  if (isLowerScore_0_onceToken != -1)
    dispatch_once(&isLowerScore_0_onceToken, block);
  if ((isLowerScore_0_topBit & 0x40) != 0)
    v8 = -1 << isLowerScore_0_topBit;
  else
    v8 = (-1 << isLowerScore_0_topBit) | (0x7FFFFFFFFFFFFFFFuLL >> ~(_BYTE)isLowerScore_0_topBit);
  if ((isLowerScore_0_topBit & 0x40) != 0)
    v9 = 0;
  else
    v9 = -1 << isLowerScore_0_topBit;
  v10 = isLowerScore_0_lowerBit;
  v11 = -[PRSRankingItem indexScore]((uint64_t)v5);
  v13 = v12 & ~v8;
  v14 = v13 >> v10;
  v15 = ((2 * v13) << ~v10) | ((v11 & (unint64_t)~v9) >> v10);
  if ((v10 & 0x40) != 0)
  {
    v15 = v14;
    v16 = 0;
  }
  else
  {
    v16 = v14;
  }
  if (!(v15 | v16))
    goto LABEL_22;
  v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x10000C00CLL, a2);
  if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
    v17 = -[PRSRankingItem attrCountWord:queryTermCount:]((uint64_t)v5, 0x1000004002, a2);
  if (!a2)
    goto LABEL_22;
  if (a2 != 1)
  {
    v19 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 0x10000C00CLL, a2);
    if ((objc_msgSend(v5, "bundleIDType") & 2) != 0)
      v19 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v5, 0x1000004002, a2);
    if (v19 >= a2)
      goto LABEL_18;
LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
  if (!v17)
    goto LABEL_22;
LABEL_18:
  v18 = 1;
LABEL_23:

  return v18;
}

void __isLowerScore_0_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("kMDItemShortcutWithinBagParamValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isLowerScore_0_topBit = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCNearMatch"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  isLowerScore_0_lowerBit = objc_msgSend(v3, "integerValue");

}

void __isLowerScore_c0_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("kMDItemTextContentTokenizedMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isLowerScore_c0_bit = objc_msgSend(v1, "integerValue");

}

void __isLowerScore_c_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("kMDItemTextContentTokenizedMatch"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isLowerScore_c_bit = objc_msgSend(v1, "integerValue");

}

BOOL isLowerScore(void *a1, unint64_t a2, unint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  float v26;
  float v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  _QWORD block[4];
  id v37;

  v9 = a1;
  v10 = a4;
  v11 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __isLowerScore_block_invoke;
  block[3] = &unk_1E6E42FD8;
  v12 = v11;
  v37 = v12;
  if (isLowerScore_onceToken[0] != -1)
    dispatch_once(isLowerScore_onceToken, block);
  if ((isLowerScore_topBit & 0x40) != 0)
    v13 = -1 << isLowerScore_topBit;
  else
    v13 = (-1 << isLowerScore_topBit) | (0x7FFFFFFFFFFFFFFFuLL >> ~(_BYTE)isLowerScore_topBit);
  if ((isLowerScore_topBit & 0x40) != 0)
    v14 = 0;
  else
    v14 = -1 << isLowerScore_topBit;
  v15 = isLowerScore_lowerBit;
  v16 = -[PRSRankingItem indexScore]((uint64_t)v9);
  v18 = v17 & ~v13;
  v19 = v18 >> v15;
  v20 = ((2 * v18) << ~v15) | ((v16 & (unint64_t)~v14) >> v15);
  if ((v15 & 0x40) != 0)
  {
    v20 = v19;
    v21 = 0;
  }
  else
  {
    v21 = v19;
  }
  if (v20 | v21)
    goto LABEL_26;
  objc_msgSend(v9, "L2FeatureVector");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scoreForFeature:", 278);
  v24 = v23;

  if (v24 > 0.0 && v24 < 2147500000.0)
    goto LABEL_26;
  objc_msgSend(v9, "L2FeatureVector");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scoreForFeature:", 1037);
  v27 = v26;

  if (v27 > 0.0 && v27 < 2147500000.0)
    goto LABEL_26;
  v28 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v9, 0x10005C02CLL, a2);
  if ((objc_msgSend(v9, "bundleIDType") & 2) != 0)
    v28 = -[PRSRankingItem attrCountPrefix:queryTermCount:]((uint64_t)v9, 0x1000004002, a2);
  if (v28 >= a2
    || isUpper6_r(v9, v29, a3, v10, v12)
    || (isUpper7_0(v9, v30, v12) & 1) != 0
    || (isUpper7_1(v9, v31, v12) & 1) != 0
    || isUpper7(v9, v32, v12)
    || isUpper7_r(v9, a2, a3, v10)
    || isLowerScore_c0(v9, a2, v12))
  {
LABEL_26:
    v34 = 1;
  }
  else
  {
    v34 = isLowerScore_c(v9, v33, v12);
  }

  return v34;
}

void __isLowerScore_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("kMDItemShortcutWithinBagParamValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isLowerScore_topBit = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCNearMatch"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  isLowerScore_lowerBit = objc_msgSend(v3, "integerValue");

}

void updateBatch(void *a1, unint64_t *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, double a8)
{
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;

  v36 = a1;
  v15 = a5;
  v35 = a6;
  v16 = a7;
  if (!a2)
    goto LABEL_30;
  v17 = objc_msgSend(v36, "count");
  if (*a2 >= v17)
    goto LABEL_30;
  v18 = v17;
  v19 = (double)a4;
  v34 = v16;
  while (1)
  {
    objc_msgSend(v36, "objectAtIndex:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "containsObject:", v20))
      break;
    ++*a2;
LABEL_26:

    if (*a2 >= v18)
      goto LABEL_30;
  }
  if ((_DWORD)a3)
  {
    objc_msgSend(v20, "L2FeatureVector");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scoreForFeature:", a3);
    v23 = v22;

    if (v23 == 0.0)
      goto LABEL_29;
LABEL_19:
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v20, "attributes"), 0x51uLL);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      if (objc_msgSend(v35, "containsObject:", v31))
      {
        ++*a2;
        objc_msgSend(v16, "addObject:", v20);
LABEL_25:

        goto LABEL_26;
      }
      objc_msgSend(v15, "addObject:", v20);
      v32 = v35;
      v33 = v31;
    }
    else
    {
      v32 = v15;
      v33 = v20;
    }
    objc_msgSend(v32, "addObject:", v33);
    ++*a2;
    goto LABEL_25;
  }
  if (!a4)
    goto LABEL_19;
  v24 = a4;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v20, "attributes"), 0x139uLL);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v20, "attributes"), 0x13AuLL);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v25 = v26;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
  }
  v27 = v25;
  if (!v27)
  {
    v26 = 0;
LABEL_15:
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v20, "attributes"), 0x20uLL);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    goto LABEL_16;
  }
  v28 = v27;
  objc_msgSend(v27, "lastObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v28;
LABEL_16:
  if (v29)
  {
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    if (v30 - a8 >= v19)
    {

      a4 = v24;
      v16 = v34;
      goto LABEL_19;
    }
  }

  v16 = v34;
LABEL_29:

LABEL_30:
}

BOOL hasParsecPolicyPhraseMatch(void *a1, unint64_t a2, int a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  float v12;

  objc_msgSend(a1, "L2FeatureVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    v7 = 2100;
  else
    v7 = 2099;
  objc_msgSend(v5, "scoreForFeature:", v7);
  v9 = v8;

  v10 = 2147500000.0;
  if (v9 < 2147500000.0 && v9 > 0.0)
    v10 = v9;
  v12 = ((double)a2 + 1.0) / (double)a2;
  return v10 == v12;
}

void sub_1B87C1920(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (v1)
  {
    v4 = *(_QWORD *)(v2 - 296) - 48;
    do
    {
      __destructor_8_s0_s16_s40((id *)(v4 + v1));
      v1 -= 48;
    }
    while (v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __destructor_8_s0_s16_s40(id *a1)
{

}

void __getPortraitPeopleQueryWithTimeout_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.searchd.portraitQueue", v2);
  v1 = (void *)getPortraitPeopleQueryWithTimeout_portraitQueue;
  getPortraitPeopleQueryWithTimeout_portraitQueue = (uint64_t)v0;

}

void __getPortraitPeopleQueryWithTimeout_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t matched;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_QWORD *, void *, _BYTE *);
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  id v34;
  _QWORD v35[4];
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  char v39[8192];
  uint64_t v40;

  v8 = MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, a8);
  v40 = *MEMORY[0x1E0C80C00];
  v9 = *(id *)(v8 + 32);
  if (getPortraitPeopleQuery_once != -1)
    dispatch_once(&getPortraitPeopleQuery_once, &__block_literal_global_989);
  v10 = objc_alloc_init(MEMORY[0x1E0D70B18]);
  objc_msgSend(v10, "setTargetBundleIdentifier:", CFSTR("com.apple.Spotlight"));
  objc_msgSend(v10, "setContext:", v9);
  objc_msgSend(v10, "setOnlyQueryMostRelevantContacts:", 1);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v14 = (void *)getPortraitPeopleQuery_ppContactStore;
  v34 = 0;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __getPortraitPeopleQuery_block_invoke_2;
  v29 = &unk_1E6E53D30;
  v15 = v12;
  v30 = v15;
  v16 = v11;
  v31 = v16;
  v17 = v13;
  v32 = v17;
  v33 = v35;
  objc_msgSend(v14, "iterRankedContactsWithQuery:error:block:", v10, &v34, &v26);
  v18 = v34;
  bzero(v39, 0x2000uLL);
  v19 = *MEMORY[0x1E0CA6030];
  v38[0] = *MEMORY[0x1E0CA67D0];
  v38[1] = v19;
  v37 = *MEMORY[0x1E0CA6570];
  v36 = *MEMORY[0x1E0CA5F28];
  matched = addFieldMatchQuery((uint64_t)v38, 2, v16, v39, 4096, 1);
  v21 = addFieldMatchQuery((uint64_t)&v37, 1, v15, &v39[2 * matched], 4096 - matched, matched == 0) + matched;
  v22 = addFieldMatchQuery((uint64_t)&v36, 1, v17, &v39[2 * v21], 4096 - v21, v21 == 0) + v21;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v39, v22, v26, v27, v28, v29, v30, v31);
    v23 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("false");
  }

  _Block_object_dispose(v35, 8);
  v24 = *(_QWORD *)(*(_QWORD *)(v8 + 40) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

}

void sub_1B87C20AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPortraitPeopleQuery_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D70B20]);
  v1 = (void *)getPortraitPeopleQuery_ppContactStore;
  getPortraitPeopleQuery_ppContactStore = (uint64_t)v0;

}

void __getPortraitPeopleQuery_block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;

  objc_msgSend(a2, "contact");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)a1[4];
  objc_msgSend(v13, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v7 = (void *)a1[5];
  objc_msgSend(v13, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  v9 = (void *)a1[6];
  objc_msgSend(v13, "socialProfiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(_QWORD *)(v11 + 24) + 1;
  *(_QWORD *)(v11 + 24) = v12;
  if (v12 >= 0x41)
    *a3 = 1;

}

uint64_t addFieldMatchQuery(uint64_t a1, uint64_t a2, void *a3, char *a4, uint64_t a5, char a6)
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _DWORD *v27;
  _WORD *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  char *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;

  v10 = a3;
  v31 = objc_msgSend(CFSTR("FieldMatch("), "length");
  v11 = objc_msgSend(v10, "count");
  v35 = a4;
  if (!a2)
    goto LABEL_30;
  v12 = v11;
  v13 = 0;
  v38 = (unint64_t)&a4[2 * a5 - 2];
  v30 = a2;
  v14 = 0x1E0D70000uLL;
  do
  {
    v15 = *(id *)(a1 + 8 * v13);
    v16 = objc_msgSend(v15, "length");
    if (v16)
      v17 = v12 == 0;
    else
      v17 = 1;
    if (v17)
      goto LABEL_27;
    v32 = v13;
    v18 = 0;
    v19 = 0;
    v34 = v16;
    v36 = v15;
    v37 = v31 + 1 + v16;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v18, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_24;
      objc_msgSend(v20, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v14;
        v23 = objc_msgSend(v21, "length");
        v24 = v23 + 3;
        if (v19)
        {
          if ((unint64_t)&a4[2 * v24] >= v38)
            goto LABEL_22;
        }
        else
        {
          v25 = v37 + v24;
          if (a4 != v35)
            v25 += 2;
          if ((unint64_t)&a4[2 * v25] >= v38)
          {
            v19 = 0;
LABEL_22:
            v14 = v22;
            goto LABEL_23;
          }
          if ((a6 & 1) == 0)
          {
            *(_DWORD *)a4 = 8126588;
            a4 += 4;
          }
          objc_msgSend(CFSTR("FieldMatch("), "getCharacters:range:", a4, 0, v31);
          v26 = &a4[2 * v31];
          objc_msgSend(v36, "getCharacters:range:", v26, 0, v34);
          a4 = &v26[2 * v34];
          a6 = 0;
        }
        *(_DWORD *)a4 = 2228268;
        v27 = a4 + 4;
        objc_msgSend(v21, "getCharacters:range:", v27, 0, v23);
        v28 = (_WORD *)v27 + v23;
        *v28 = 34;
        a4 = (char *)(v28 + 1);
        if (v19 == 20)
        {

          a2 = v30;
          v14 = v22;
          v13 = v32;
          v15 = v36;
          goto LABEL_26;
        }
        ++v19;
        goto LABEL_22;
      }
LABEL_23:

LABEL_24:
      ++v18;
    }
    while (v12 != v18);
    a2 = v30;
    v13 = v32;
    v15 = v36;
    if (!v19)
      goto LABEL_27;
LABEL_26:
    *(_WORD *)a4 = 41;
    a4 += 2;
LABEL_27:

    ++v13;
  }
  while (v13 != a2);
LABEL_30:

  return (a4 - v35) >> 1;
}

__CFString *_rankingMultiPhraseQueryCompositeHelper(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, unsigned __int8 a9, char a10, char a11, unsigned __int8 a12, unsigned __int8 a13, uint64_t a14, unsigned __int8 a15)
{
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  void *v32;
  const __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t ii;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t jj;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  const __CFString *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t i;
  void *v86;
  uint64_t j;
  void *v88;
  uint64_t k;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t m;
  void *v98;
  uint64_t n;
  void *v100;
  const __CFString *v101;
  uint64_t kk;
  void *v103;
  unint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v114;
  const __CFString *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  id v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  id v134;
  __CFString *v135;
  void *v136;
  char v137;
  uint64_t v138;
  void *v139;
  id obj;
  id obja;
  id v142;
  void *v143;
  uint64_t v144;
  void *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v22 = a1;
  v23 = a2;
  v24 = a3;
  v128 = a4;
  v142 = a5;
  v25 = a6;
  v127 = a7;
  v126 = a8;
  if (objc_msgSend(v23, "length"))
  {
    v26 = objc_msgSend(v22, "count");
    v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v25, "count") + 1);
    v134 = v23;
    v125 = v25;
    v122 = v24;
    if ((a14 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v130 = 0;
      v133 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 1;
      v31 = 1;
LABEL_4:
      v32 = v128;
      goto LABEL_5;
    }
    if ((a11 & 1) != 0)
    {
      v29 = 0;
      v32 = v128;
      if (((a12 | a13) & a11 & 1) != 0)
      {
        v30 = 1;
        v133 = 0;
        v31 = 1;
        v27 = 0;
        v28 = 0;
        v130 = 0;
        goto LABEL_5;
      }
      v28 = 0;
      v27 = 0;
      v133 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 >= 1)
      {
        for (i = 0; i != v26; ++i)
        {
          objc_msgSend(v22, "objectAtIndex:", i);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (i)
            objc_msgSend(v27, "appendString:", CFSTR(" "));
          objc_msgSend(v27, "appendString:", v86);
          objc_msgSend(v27, "appendString:", CFSTR("*"));

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 >= 1)
      {
        for (j = 0; j != v26; ++j)
        {
          objc_msgSend(v22, "objectAtIndex:", j);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          if (j)
            objc_msgSend(v133, "appendString:", CFSTR("_"));
          objc_msgSend(v133, "appendString:", v88);
          if (v26 - 1 != j)
            objc_msgSend(v133, "appendString:", CFSTR("*"));

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 >= 1)
      {
        for (k = 0; k != v26; ++k)
        {
          objc_msgSend(v22, "objectAtIndex:", k);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (k)
            objc_msgSend(v28, "appendString:", CFSTR("."));
          objc_msgSend(v28, "appendString:", v90);
          if (v26 - 1 != k)
            objc_msgSend(v28, "appendString:", CFSTR("*"));

        }
      }
      if (((a12 | a13) & a11 & 1) != 0)
      {
        v130 = 0;
        v30 = 0;
        v29 = 0;
        v31 = 1;
        goto LABEL_4;
      }
      v32 = v128;
    }
    if (a12 && (a13 & 1) != 0)
    {
      v130 = 0;
      v31 = 0;
      v29 = 0;
      v30 = a11;
    }
    else
    {
      v95 = v27;
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 >= 1)
      {
        for (m = 0; m != v26; ++m)
        {
          objc_msgSend(v22, "objectAtIndex:", m);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          if (m)
            objc_msgSend(v96, "appendString:", CFSTR("_"));
          objc_msgSend(v96, "appendString:", v98);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v23, "length") + v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = v96;
      if (v26 >= 1)
      {
        for (n = 0; n != v26; ++n)
        {
          objc_msgSend(v22, "objectAtIndex:", n);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          if (n)
            objc_msgSend(v29, "appendString:", CFSTR("."));
          objc_msgSend(v29, "appendString:", v100);

        }
      }
      v31 = 0;
      v32 = v128;
      v27 = v95;
      v30 = a11;
    }
LABEL_5:
    v129 = v29;
    v132 = v28;
    v136 = v27;
    v121 = v22;
    if ((a10 & 1) != 0)
    {
      v33 = CFSTR("cwd");
    }
    else
    {
      objc_msgSend(CFSTR("cwd"), "stringByAppendingFormat:", CFSTR("%c"), 116);
      v33 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    v123 = objc_msgSend(v32, "count");
    v124 = objc_msgSend(v127, "count");
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    obj = v24;
    v135 = (__CFString *)v33;
    v39 = v134;
    v139 = v38;
    v144 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, v155, 16);
    if (v144)
    {
      v120 = v30;
      v40 = 0;
      v41 = a15;
      if (v124)
        v41 = 0;
      v42 = *(_QWORD *)v151;
      if (v123)
        v43 = v41;
      else
        v43 = 1;
      if (v26 <= 1)
        v43 = 0;
      v131 = v43;
      v138 = *(_QWORD *)v151;
      v137 = v31;
      while (1)
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v151 != v42)
            objc_enumerationMutation(obj);
          v45 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * v44);
          if ((v31 & 1) != 0)
          {
            v46 = addEndChar(*(void **)(*((_QWORD *)&v150 + 1) + 8 * v44), v39);
LABEL_26:
            if (v46)
            {
              v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v45, v39, v33);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v48);

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@.*\"%@)"), v45, v39, CFSTR("cd"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v49);

              v31 = v137;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@_*\"%@)"), v45, v39, CFSTR("cd"));
LABEL_36:
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v56);

              v57 = (void *)MEMORY[0x1E0CB3940];
              v42 = v138;
              objc_msgSend(v47, "componentsJoinedByString:", CFSTR(" || "));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "stringWithFormat:", CFSTR("(%@)"), v58);
              v59 = objc_claimAutoreleasedReturnValue();

              v40 = (void *)v59;
              v38 = v139;
              goto LABEL_39;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v45, v39, v33);
            goto LABEL_38;
          }
          if ((a11 & 1) == 0)
          {
            if (addEndChar(*(void **)(*((_QWORD *)&v150 + 1) + 8 * v44), v136))
            {
              v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v45, v133, v33);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v53);

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v45, v132, v33);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v54);

              v39 = v134;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v45, v133, CFSTR("cd"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v55);

              v31 = v137;
              v33 = v135;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v45, v132, CFSTR("cd"));
              goto LABEL_36;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v45, v136, v33);
            goto LABEL_38;
          }
          v46 = addEndChar(*(void **)(*((_QWORD *)&v150 + 1) + 8 * v44), v39);
          if ((a12 & a13 & 1) != 0 || !v131)
            goto LABEL_26;
          if (v46)
          {
            v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v45, v130, v33);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v50);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v45, v129, v135);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v51);

            v33 = v135;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v45, v130, CFSTR("cd"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v52);

            v31 = v137;
            v39 = v134;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v45, v129, CFSTR("cd"));
            goto LABEL_36;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v45, v39, v33);
LABEL_38:
          v47 = v40;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

          objc_msgSend(v38, "addObject:", v40);
          ++v44;
        }
        while (v144 != v44);
        v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, v155, 16);
        v144 = v60;
        if (!v60)
        {

          v32 = v128;
          v30 = v120;
          break;
        }
      }
    }

    v61 = objc_msgSend(v38, "count");
    v62 = (void *)MEMORY[0x1E0CB3940];
    if (v61 < 2)
    {
      objc_msgSend(v38, "firstObject");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringWithFormat:", CFSTR("%@"), v63);
    }
    else
    {
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR(" || "));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringWithFormat:", CFSTR("(%@)"), v63);
    }
    obja = (id)objc_claimAutoreleasedReturnValue();

    if ((v30 & 1) != 0)
    {
      v64 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v142, "length") + v123);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v123 >= 1)
      {
        for (ii = 0; ii != v123; ++ii)
        {
          objc_msgSend(v32, "objectAtIndex:", ii);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (ii)
            objc_msgSend(v64, "appendString:", CFSTR(" "));
          objc_msgSend(v64, "appendString:", v66);
          objc_msgSend(v64, "appendString:", CFSTR("*"));

        }
      }
    }
    v145 = v64;
    if ((a10 & 1) != 0)
    {
      v36 = CFSTR("cwd");
    }
    else
    {
      objc_msgSend(CFSTR("cwd"), "stringByAppendingFormat:", CFSTR("%c"), 116);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    v67 = v125;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v146, v154, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v147;
      do
      {
        for (jj = 0; jj != v69; ++jj)
        {
          if (*(_QWORD *)v147 != v70)
            objc_enumerationMutation(v67);
          v72 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * jj);
          if ((v31 & 1) != 0)
          {
LABEL_63:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v72, v142, v36);
            goto LABEL_68;
          }
          if ((a11 & 1) != 0)
          {
            if ((a12 & a13 & 1) != 0)
              goto LABEL_63;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v72, v142, v36);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v72, v64, v36);
          }
LABEL_68:
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "addObject:", v73);

        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v146, v154, 16);
      }
      while (v69);
    }

    if (a15 && v124 > 1)
    {
      v74 = v143;
      if (a9)
      {
        v75 = 110;
        if (a10)
          v75 = 111;
        objc_msgSend(CFSTR("cwd"), "stringByAppendingFormat:", CFSTR("%c(%d)"), v75, a9);
        v76 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        if ((v31 & 1) != 0)
          goto LABEL_76;
      }
      else
      {
        v76 = CFSTR("cwd");
        if ((v31 & 1) != 0)
        {
LABEL_76:
          v77 = v126;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), *MEMORY[0x1E0CA6910], v126, v76);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v78;
          goto LABEL_77;
        }
      }
      if ((a11 & 1) != 0)
      {
        v25 = v125;
        if (a12 && (a13 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), *MEMORY[0x1E0CA6910], v126, v76);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          ___rankingMultiPhraseQueryCompositeHelper_block_invoke((uint64_t)v93, v143, v93, 0);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), CFSTR("_kMDItemOCRContentLevel1"), v126, v76);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v94, v143, v80, 1);
        }
        else
        {
          objc_msgSend(v127, "lastObject");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v114, "length") <= 1 || v114 == 0)
            v116 = CFSTR("(%@=\"%@\"%@)");
          else
            v116 = CFSTR("(%@=\"%@*\"%@)");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v116, *MEMORY[0x1E0CA6910], v126, v76);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          ___rankingMultiPhraseQueryCompositeHelper_block_invoke((uint64_t)v117, v143, v117, 0);
          ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v118, v143, v117, 0);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v116, CFSTR("_kMDItemOCRContentLevel1"), v126, v76);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v119, v143, v80, 1);
          v74 = v143;
        }
LABEL_138:

        v35 = (__CFString *)v76;
        v23 = v134;
        if ((unint64_t)objc_msgSend(v74, "count") < 2)
        {
          v111 = objc_msgSend(v74, "count");
          v112 = (void *)MEMORY[0x1E0CB3940];
          if (v111 != 1)
          {
            v84 = obja;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), obja, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_144;
          }
          objc_msgSend(v74, "componentsJoinedByString:", CFSTR(" || "));
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = obja;
          objc_msgSend(v112, "stringWithFormat:", CFSTR("(%@ && %@ && %@)"), obja, v110, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
        }
        else
        {
          v109 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v74, "componentsJoinedByString:", CFSTR(" || "));
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = obja;
          objc_msgSend(v109, "stringWithFormat:", CFSTR("(%@ && (%@) && %@)"), obja, v110, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
        }
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_144:
        v22 = v121;
        v24 = v122;
        goto LABEL_145;
      }
      v101 = v76;
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(0, "length"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      for (kk = 0; kk != v124; ++kk)
      {
        objc_msgSend(v127, "objectAtIndex:", kk);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v103, "length");
        if (kk)
          objc_msgSend(v80, "appendString:", CFSTR(" "));
        objc_msgSend(v80, "appendString:", v103);
        if (v104 > 2 || v124 - 1 == kk && v104 == 2)
          objc_msgSend(v80, "appendString:", CFSTR("*"));

      }
      v105 = *MEMORY[0x1E0CA6910];
      v76 = v101;
      if (v80)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v105, v80, v101);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v143;
        ___rankingMultiPhraseQueryCompositeHelper_block_invoke((uint64_t)v106, v143, v106, 0);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), CFSTR("_kMDItemOCRContentLevel1"), v80, v76);
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v108, v143, v107, 1);
        goto LABEL_137;
      }
      v77 = v126;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v105, v126, v101);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v78;
      v74 = v143;
LABEL_77:
      ___rankingMultiPhraseQueryCompositeHelper_block_invoke((uint64_t)v78, v74, v78, 0);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), CFSTR("_kMDItemOCRContentLevel1"), v77, v76);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      ___rankingMultiPhraseQueryCompositeHelper_block_invoke(v81, v74, v80, 1);
LABEL_137:
      v25 = v125;
      goto LABEL_138;
    }
    v74 = v143;
    v23 = v134;
    if ((unint64_t)objc_msgSend(v143, "count") < 2)
    {
      v91 = objc_msgSend(v143, "count");
      v92 = (void *)MEMORY[0x1E0CB3940];
      v84 = obja;
      if (v91 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), obja, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_115;
      }
      objc_msgSend(v143, "componentsJoinedByString:", CFSTR(" || "));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "stringWithFormat:", CFSTR("(%@ && %@ && %@)"), obja, v83, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
    }
    else
    {
      v82 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v143, "componentsJoinedByString:", CFSTR(" || "));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = obja;
      objc_msgSend(v82, "stringWithFormat:", CFSTR("(%@ && (%@) && %@)"), obja, v83, CFSTR("!(FieldMatch(_kMDItemDomainIdentifier, com.apple.siri.interactions, com.apple.siri.interactions, com.apple.siri.upcomingmedia))"));
    }
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_115:
    v35 = CFSTR("cwd");
    v22 = v121;
    v24 = v122;
    v25 = v125;
LABEL_145:

    v37 = v135;
    goto LABEL_146;
  }
  v34 = CFSTR("false");
  v35 = CFSTR("cwd");
  v36 = CFSTR("cwd");
  v37 = CFSTR("cwd");
LABEL_146:

  return v34;
}

void ___rankingMultiPhraseQueryCompositeHelper_block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *MEMORY[0x1E0CA6060];
  if (a4)
  {
    v7 = *MEMORY[0x1E0CA65A0];
    v8 = a3;
    v9 = a2;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("(%@==\"%@\" || %@>0)"), v6, CFSTR("com.apple.mobileslideshow"), v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), v8, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v10);
  }
  else
  {
    v11 = a3;
    v12 = a2;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("(!FieldMatch(%@,%@))"), v6, CFSTR("com.apple.mobileslideshow"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(!%@>0)"), *MEMORY[0x1E0CA61B0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@ && %@)"), v11, v13, v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addObject:", v9);
  }

}

__CFString *_rankingMultiFieldsTCNearQuery(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, char a7, char a8, uint64_t a9, char a10, char a11)
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  char v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void (**v62)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  unint64_t v67;
  BOOL v68;
  const __CFString *v69;
  void *v70;
  BOOL v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  const __CFString *v84;
  void *v85;
  void *v86;
  id v87;
  __int128 v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  _BOOL4 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  id v98;
  id obj;
  void *v100;
  void *v101;
  _QWORD v102[5];
  _QWORD v103[3];
  char v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v18 = a1;
  v19 = a2;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = v18;
  v24 = v19;
  v25 = v23;
  v26 = v24;
  v98 = v20;
  v27 = v21;
  v87 = v22;
  v90 = v26;
  v91 = v25;
  v85 = v27;
  if (!objc_msgSend(v25, "count"))
  {
    v29 = CFSTR("false");
    v30 = CFSTR("cwd");
    goto LABEL_118;
  }
  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v25, "count"));
  v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
  v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v28 = objc_msgSend(v27, "count");
  *(_QWORD *)&v88 = v28;
  if ((_DWORD)a6)
  {
    v84 = CFSTR("cwd");
    if (v28 >= 2)
    {
      if ((_DWORD)a6 == 255)
        objc_msgSend(CFSTR("cwd"), "stringByAppendingString:", CFSTR("t"));
      else
        objc_msgSend(CFSTR("cwd"), "stringByAppendingFormat:", CFSTR("%c(%d)"), 110, a6);
      v84 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v84 = CFSTR("cwd");
  }
  *((_QWORD *)&v88 + 1) = objc_msgSend(v25, "count");
  if ((a9 & 0xFFFFFFFFFFFFFFFELL) == 4)
    v31 = 1;
  else
    v31 = a8;
  objc_msgSend(v98, "allKeys");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 | a7;
  v94 = *((_QWORD *)&v88 + 1) - 1;
  if (*((uint64_t *)&v88 + 1) >= 1)
  {
    v95 = 0;
    v97 = a7 & a8;
    v96 = *MEMORY[0x1E0CA6060];
    v92 = *MEMORY[0x1E0CA66F8];
    do
    {
      objc_msgSend(v101, "removeAllObjects");
      objc_msgSend(v91, "objectAtIndex:", v95);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      obj = v90;
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
      if (!v34)
        goto LABEL_68;
      v35 = *(_QWORD *)v106;
      v37 = v95 == v94 && (_QWORD)v88 == 0;
      v93 = v37;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v106 != v35)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
          if (objc_msgSend(v100, "containsObject:", v39))
          {
            objc_msgSend(v98, "valueForKey:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v40, "count"))
            {
              v41 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v40, "componentsJoinedByString:", CFSTR(","));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "stringWithFormat:", CFSTR("(!FieldMatch(%@,%@))"), v96, v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v43 = 0;
            }

          }
          else
          {
            v43 = 0;
          }
          if ((v32 & 1) != 0)
          {
            if (a11 || !addEndChar(v39, v33))
              goto LABEL_52;
LABEL_39:
            v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@@\"%@)"), v39, v33, CFSTR("cwd"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v45);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@.*\"%@)"), v39, v33, CFSTR("cd"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v46);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@_*\"%@)"), v39, v33, CFSTR("cd"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v47);

            v48 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v44, "componentsJoinedByString:", CFSTR(" || "));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "stringWithFormat:", CFSTR("(%@)"), v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_40;
          }
          if ((v97 & 1) != 0)
          {
            if (a11 || !addEndChar(v39, v33))
              goto LABEL_52;
            goto LABEL_39;
          }
          if (a10)
          {
            if (!v93 || (objc_msgSend(v39, "isEqualToString:", v92) & 1) != 0)
              goto LABEL_51;
            if (a11 || !addEndChar(v39, v33))
              goto LABEL_63;
          }
          else
          {
            if (v95 != v94 || (objc_msgSend(v39, "isEqualToString:", v92) & 1) != 0)
            {
LABEL_51:
              if (a11 || !addEndChar(v39, v33))
              {
LABEL_52:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), v39, v33, CFSTR("cwd"));
                v51 = objc_claimAutoreleasedReturnValue();
                goto LABEL_64;
              }
              goto LABEL_39;
            }
            if (a11 || !addEndChar(v39, v33))
            {
LABEL_63:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*\"%@)"), v39, v33, CFSTR("cwd"));
              v51 = objc_claimAutoreleasedReturnValue();
LABEL_64:
              v50 = (void *)v51;
              if (!v43)
                goto LABEL_66;
LABEL_65:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), v50, v43);
              v58 = objc_claimAutoreleasedReturnValue();

              v50 = (void *)v58;
              goto LABEL_66;
            }
          }
          v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*@\"%@)"), v39, v33, CFSTR("cwd"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v53);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*.*\"%@)"), v39, v33, CFSTR("cd"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v54);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@*_*\"%@)"), v39, v33, CFSTR("cd"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v55);

          v56 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v52, "componentsJoinedByString:", CFSTR(" || "));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "stringWithFormat:", CFSTR("(%@)"), v57);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
          if (v43)
            goto LABEL_65;
LABEL_66:
          objc_msgSend(v101, "addObject:", v50);

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
      }
      while (v34);
LABEL_68:

      if ((unint64_t)objc_msgSend(v101, "count") < 2)
      {
        objc_msgSend(v101, "firstObject");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v59 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v101, "componentsJoinedByString:", CFSTR(" || "));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "stringWithFormat:", CFSTR("(%@)"), v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v89, "addObject:", v61);

      ++v95;
    }
    while (v95 != *((_QWORD *)&v88 + 1));
  }
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x2020000000;
  v104 = 0;
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = ___rankingMultiFieldsTCNearQueryHelper_block_invoke;
  v102[3] = &unk_1E6E53D58;
  v102[4] = v103;
  v62 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1BCCB38DC](v102);
  if ((_QWORD)v88)
  {
    if ((v32 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), *MEMORY[0x1E0CA6910], v87, v84);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v62)[2](v62, v86, v63, 0);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=\"%@\"%@)"), CFSTR("_kMDItemOCRContentLevel1"), v87, v84);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *, void *, uint64_t))v62)[2](v62, v86, v64, 1);
LABEL_100:

      goto LABEL_101;
    }
    objc_msgSend(v85, "lastObject");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "length");
    v67 = v66;
    if (a10)
    {
      v68 = (uint64_t)v88 > 1;
      v69 = CFSTR("(%@=\"%@*\"%@)");
      if (v66 != 2)
        v68 = 0;
      if (v66 > 2 || v68)
      {
LABEL_87:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v69, *MEMORY[0x1E0CA6910], v87, v84);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *, _QWORD))v62)[2](v62, v86, v70, 0);
        if (a10)
        {
          v71 = (uint64_t)v88 > 1;
          v72 = CFSTR("(%@=\"%@*\"%@)");
          if (v67 != 2)
            v71 = 0;
          if (v67 > 2 || v71)
            goto LABEL_99;
        }
        else if ((v67 > 2 || (uint64_t)v88 >= 2 && v67 == 2) && !*((_QWORD *)&v88 + 1))
        {
          v72 = CFSTR("(%@=\"%@*\"%@)");
          goto LABEL_99;
        }
        v72 = CFSTR("(%@=\"%@\"%@)");
LABEL_99:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v72, CFSTR("_kMDItemOCRContentLevel1"), v87, v84);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(_QWORD, void *, void *, uint64_t))v62)[2](v62, v86, v64, 1);
        goto LABEL_100;
      }
    }
    else if ((v66 > 2 || (uint64_t)v88 >= 2 && v66 == 2) && !*((_QWORD *)&v88 + 1))
    {
      v69 = CFSTR("(%@=\"%@*\"%@)");
      goto LABEL_87;
    }
    v69 = CFSTR("(%@=\"%@\"%@)");
    goto LABEL_87;
  }
LABEL_101:
  if ((unint64_t)objc_msgSend(v86, "count") >= 2)
  {
    v73 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v86, "componentsJoinedByString:", CFSTR(" || "));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "stringWithFormat:", CFSTR("(%@)"), v74);
    v75 = objc_claimAutoreleasedReturnValue();
    goto LABEL_105;
  }
  if (objc_msgSend(v86, "count") == 1)
  {
    v76 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v86, "firstObject");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "stringWithFormat:", CFSTR("%@"), v74);
    v75 = objc_claimAutoreleasedReturnValue();
LABEL_105:
    v77 = (void *)v75;

    if (v77)
      objc_msgSend(v89, "addObject:", v77);
    goto LABEL_108;
  }
  v77 = 0;
LABEL_108:
  v78 = objc_msgSend(v89, "count");
  v79 = (void *)MEMORY[0x1E0CB3940];
  if (v78 < 2)
  {
    objc_msgSend(v89, "firstObject");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "stringWithFormat:", CFSTR("%@"), v80);
  }
  else
  {
    objc_msgSend(v89, "componentsJoinedByString:", CFSTR(" && "));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "stringWithFormat:", CFSTR("(%@)"), v80);
  }
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88 == 0)
  {
    v29 = CFSTR("false");
  }
  else
  {
    if (*((_QWORD *)&v88 + 1))
      v82 = v81;
    else
      v82 = v77;
    v29 = v82;
  }

  _Block_object_dispose(v103, 8);
  v30 = (__CFString *)v84;
LABEL_118:

  return v29;
}

void sub_1B87C4818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void ___rankingMultiFieldsTCNearQueryHelper_block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@==\"%@\" || %@>0)"), *MEMORY[0x1E0CA6060], CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA65A0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v9);
LABEL_5:

    goto LABEL_6;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(!FieldMatch(%@,%@))"), *MEMORY[0x1E0CA6060], CFSTR("com.apple.mobileslideshow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(!%@>0)"), *MEMORY[0x1E0CA61B0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@ && %@)"), v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

    goto LABEL_5;
  }
LABEL_6:

}

void ___rankingTCNearQueryHelper_block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@==\"%@\" || %@>0)"), *MEMORY[0x1E0CA6060], CFSTR("com.apple.mobileslideshow"), *MEMORY[0x1E0CA65A0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v9);
LABEL_5:

    goto LABEL_6;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(!FieldMatch(%@,%@))"), *MEMORY[0x1E0CA6060], CFSTR("com.apple.mobileslideshow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(!%@>0)"), *MEMORY[0x1E0CA61B0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@ && %@)"), v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

    goto LABEL_5;
  }
LABEL_6:

}

uint64_t NextTermResultCompare(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;

  v4 = *(id *)(a1 + 16);
  v5 = *(id *)(a2 + 16);
  if (!objc_msgSend(v4, "type") && objc_msgSend(v5, "type") == 1)
    goto LABEL_6;
  if (!objc_msgSend(v5, "type") && objc_msgSend(v4, "type") == 1)
    goto LABEL_10;
  objc_msgSend(v4, "distance");
  v7 = v6;
  objc_msgSend(v5, "distance");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "distance");
    v11 = v10;
    objc_msgSend(v5, "distance");
    if (v11 <= v12)
    {
      v13 = objc_msgSend(v4, "position");
      if (v13 < objc_msgSend(v5, "position"))
        goto LABEL_6;
      v14 = objc_msgSend(v4, "position");
      if (v14 <= objc_msgSend(v5, "position"))
      {
        v16 = *(void **)(a1 + 40);
        objc_msgSend(v4, "neighbor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "hasPrefix:", v17) & 1) != 0)
        {
          v18 = *(void **)(a2 + 40);
          objc_msgSend(v5, "neighbor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v18) = objc_msgSend(v18, "hasPrefix:", v19);

          if (!(_DWORD)v18)
            goto LABEL_6;
        }
        else
        {

        }
        v20 = *(void **)(a1 + 40);
        objc_msgSend(v4, "neighbor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "hasPrefix:", v21))
        {

        }
        else
        {
          v22 = *(void **)(a2 + 40);
          objc_msgSend(v5, "neighbor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v22) = objc_msgSend(v22, "hasPrefix:", v23);

          if ((v22 & 1) != 0)
            goto LABEL_10;
        }
        v24 = *(_QWORD *)(a1 + 32);
        v25 = *(_QWORD *)(a2 + 32);
        if (v24 <= v25)
        {
          v9 = v24 < v25;
          goto LABEL_11;
        }
        goto LABEL_6;
      }
    }
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
LABEL_6:
  v9 = -1;
LABEL_11:

  return v9;
}

void OUTLINED_FUNCTION_0_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a2;
}

id spotlightSuggestionWithCurrentSuggestion(void *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  void *v18;
  _QWORD v19[22];

  v19[21] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  v7 = a1;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = &unk_1E6E9A158;
  v19[2] = &unk_1E6E9A170;
  v19[3] = &unk_1E6E9A158;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v9;
  v19[5] = &unk_1E6E9A188;
  v19[6] = &unk_1E6E9A188;
  v19[7] = &unk_1E6E9A3F0;
  v19[8] = &unk_1E6E9A3F0;
  v19[9] = &unk_1E6E9A3F0;
  v19[10] = &unk_1E6E9A3F0;
  v19[11] = &unk_1E6E9A400;
  v19[12] = &unk_1E6E9A3F0;
  v19[13] = &unk_1E6E9A3F0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[14] = v10;
  v19[15] = &unk_1E6E9A188;
  v19[16] = MEMORY[0x1E0C9AAA0];
  v19[17] = MEMORY[0x1E0C9AAB0];
  v19[18] = MEMORY[0x1E0C9AAB0];
  v19[19] = MEMORY[0x1E0C9AAB0];
  v19[20] = &unk_1E6E9A188;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isMacOS() & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    SSBundlesDonatingPhotos();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)MEMORY[0x1E0CA6B70];
  v17 = CFSTR("photosBundleIDs");
  v18 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "suggestionWithCurrentSuggestion:userQueryString:completion:attributes:scores:options:", v7, v6, v6, MEMORY[0x1E0C9AA60], v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void sub_1B87CB8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B87CC52C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1B87CCDF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1B87CCF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, uint64_t a11)
{
  uint64_t v11;

  *(_OWORD *)v11 = a9;
  *(_OWORD *)(v11 + 16) = a10;
  *(_QWORD *)(v11 + 32) = a11;
  _Unwind_Resume(a1);
}

void sub_1B87CE960(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id SSMarketplaceKitUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SSMarketplaceKitUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SSMarketplaceKitUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SSMarketplaceKitUtilities()
{
  return objc_opt_self();
}

id SSMarketplaceKitUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SSMarketplaceKitUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SSMarketplaceKitUtilities()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SSMarketplaceKitUtilities.distributorPriorityList()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static SSMarketplaceKitUtilities.distributorPriorityListChangedNotifationName()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

void allocateTemporaryFileOfSize_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B86C5000, v0, v1, "Error in opening temporary file.\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void allocateTemporaryFileOfSize_cold_2(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1B86C5000, a1, OS_LOG_TYPE_ERROR, "Serious error in writing temporary file. %d\n", (uint8_t *)v3, 8u);
}

void openbyid_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B86C5000, v1, v2, "openbyid_np failed, errno:%d(%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

void __device_id_block_invoke_cold_1()
{
  __assert_rtn("device_id_block_invoke", "NSURL+SPAdditions.m", 32, "stat(path, &st) == 0 && \"could not get device ID\"");
}

void SSQueryParseResultsForQueryString_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B86C5000, log, OS_LOG_TYPE_DEBUG, "SSQueryParser: semanticQuery failed to generate", v1, 2u);
}

void SSQueryParseResultsForQueryString_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_DEBUG, "SSQueryParser: semanticQuery, using <%@>", (uint8_t *)&v2, 0xCu);
}

void SSQueryParseResultsForQueryString_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SSRedactString(a1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_ERROR, "[Pommes] [Photos] Not getting embedding for query: %@", (uint8_t *)&v4, 0xCu);

}

void SSAppNameForBundleId_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_4(&dword_1B86C5000, a3, (uint64_t)a3, "Error getting appName for bundleId:%@ with error:%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

void SSPriorityIndexFastPathEnabled_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B86C5000, v0, v1, "Error retrieving %@ value: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_8();
}

void SSPriorityIndexLimitBundles_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B86C5000, v0, v1, "Error retrieving %@ value: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_8();
}

void SSPriorityIndexDelayMilliseconds_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, a2, a3, "Error retrieving PriorityIndexDelayMilliseconds value: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void SSIsCounterFactual_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, a2, a3, "Error retrieving IsCounterFactual value: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void SSCompactRankingAttrsCopy_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsCopy", "SSCompactRankingAttrsData.m", 319, "0");
}

void SSCompactRankingAttrsAddFloat_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsAddFloat", "SSCompactRankingAttrsData.m", 365, "(rankingIndexTypeOf(attrIndex) & RankingTypeFloat) != 0");
}

void SSCompactRankingAttrsAddInt64Array_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsAddInt64Array", "SSCompactRankingAttrsData.m", 376, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void SSCompactRankingAttrsAddInt64ArrayFromNSArray_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsAddInt64ArrayFromNSArray", "SSCompactRankingAttrsData.m", 391, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void SSCompactRankingAttrsAddInt128_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsAddInt128", "SSCompactRankingAttrsData.m", 413, "(rankingIndexTypeOf(attrIndex) & RankingTypeInt128) != 0");
}

void SSCompactRankingAttrsUpdateFloat_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsUpdateFloat", "SSCompactRankingAttrsData.m", 452, "(rankingIndexTypeOf(attrIndex) & RankingTypeFloat) != 0");
}

void SSCompactRankingAttrsUpdateInt64Array_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsUpdateInt64Array", "SSCompactRankingAttrsData.m", 463, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void SSCompactRankingAttrsUpdateInt64ArrayFromNSArray_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsUpdateInt64ArrayFromNSArray", "SSCompactRankingAttrsData.m", 480, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void SSCompactRankingAttrsUpdateInt128_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsUpdateInt128", "SSCompactRankingAttrsData.m", 503, "(rankingIndexTypeOf(attrIndex) & RankingTypeInt128) != 0");
}

void SSCompactRankingAttrsGetFloat_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsGetFloat", "SSCompactRankingAttrsData.m", 543, "(rankingIndexTypeOf(attrIndex) & RankingTypeFloat) != 0");
}

void SSCompactRankingAttrsGetInt128_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsGetInt128", "SSCompactRankingAttrsData.m", 556, "(rankingIndexTypeOf(attrIndex) & RankingTypeInt128) != 0");
}

void SSCompactRankingAttrsGetArrayInt64_cold_1()
{
  __assert_rtn("SSCompactRankingAttrsGetArrayInt64", "SSCompactRankingAttrsData.m", 569, "(rankingIndexTypeOf(attrIndex) & RankingTypeIntArray) != 0");
}

void shouldUpdateCrossAttributeFeature_cold_1()
{
  __assert_rtn("shouldUpdateCrossAttributeFeature", "PRSRankingItem.m", 5325, "false");
}

void countsArrayComparator_block_invoke_4_cold_1()
{
  __assert_rtn("countsArrayComparator_block_invoke_4", "PRSRankingItem.m", 5841, "array1.count == 8 && array1.count == 8");
}

void shouldUpdateFuncForSnippetFeature_cold_1()
{
  __assert_rtn("shouldUpdateFuncForSnippetFeature", "PRSRankingItemRanker.m", 4127, "false");
}

void associatedResultSetL2FeatureFromSnippetFeature_cold_1()
{
  __assert_rtn("associatedResultSetL2FeatureFromSnippetFeature", "PRSRankingItemRanker.m", 4246, "false");
}

void associatedL2FeatureFromSnippetFeature_cold_1()
{
  __assert_rtn("associatedL2FeatureFromSnippetFeature", "PRSRankingItemRanker.m", 4344, "false");
}

void defaultValueForResultSetSnippetFeature_cold_1()
{
  __assert_rtn("defaultValueForResultSetSnippetFeature", "PRSRankingItemRanker.m", 4400, "false");
}

uint64_t sub_1B87D2300()
{
  return MEMORY[0x1E0CC1AC0]();
}

uint64_t sub_1B87D230C()
{
  return MEMORY[0x1E0CC1AC8]();
}

uint64_t sub_1B87D2318()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF63A0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x1E0C97F08](heap, value);
}

void CFBinaryHeapApplyFunction(CFBinaryHeapRef heap, CFBinaryHeapApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97F10](heap, applier, context);
}

Boolean CFBinaryHeapContainsValue(CFBinaryHeapRef heap, const void *value)
{
  return MEMORY[0x1E0C97F18](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x1E0C97F20](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x1E0C97F28](heap);
}

CFIndex CFBinaryHeapGetCountOfValue(CFBinaryHeapRef heap, const void *value)
{
  return MEMORY[0x1E0C97F30](heap, value);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x1E0C97F38](heap);
}

void CFBinaryHeapRemoveAllValues(CFBinaryHeapRef heap)
{
  MEMORY[0x1E0C97F40](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
  MEMORY[0x1E0C97F48](heap);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

uint64_t CS_simplifyItemArray()
{
  return MEMORY[0x1E0CA5F20]();
}

uint64_t DDResultGetShipmentTrackingUrlString()
{
  return MEMORY[0x1E0D1CCE0]();
}

uint64_t DDResultHasProperties()
{
  return MEMORY[0x1E0D1CD10]();
}

uint64_t DDResultIsPastDate()
{
  return MEMORY[0x1E0D1CD28]();
}

uint64_t DDResultIsValidPhoneNumber()
{
  return MEMORY[0x1E0D1CD30]();
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return MEMORY[0x1E0D1BCD0]();
}

uint64_t GEOUsageSearchFoundationFeedbackDataForMapsData()
{
  return MEMORY[0x1E0D26C30]();
}

uint64_t GSLibraryResolveDocumentId2()
{
  return MEMORY[0x1E0D25D20]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1E0D36890]();
}

uint64_t MDRetrieveBestAvailableLanguage()
{
  return MEMORY[0x1E0D4D940]();
}

uint64_t MDTokenizerCreate()
{
  return MEMORY[0x1E0D4D948]();
}

uint64_t MDTokenizerDispose()
{
  return MEMORY[0x1E0D4D950]();
}

uint64_t MDTokenizerGetTokens()
{
  return MEMORY[0x1E0D4D968]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

uint64_t PFSceneTaxonomyNodeVisitDetectors()
{
  return MEMORY[0x1E0D75908]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x1E0DAB5F8]();
}

uint64_t SILanguageModelCreateWithOptions()
{
  return MEMORY[0x1E0DA9BC8]();
}

uint64_t SILanguageModelIsContentTokenInString()
{
  return MEMORY[0x1E0DA9BF0]();
}

uint64_t SimulateCrash()
{
  return MEMORY[0x1E0D1BD30]();
}

uint64_t TUFormattedPhoneNumber()
{
  return MEMORY[0x1E0DBD620]();
}

uint64_t TUNetworkCountryCode()
{
  return MEMORY[0x1E0DBD680]();
}

uint64_t WFTopHitContextualActionTypeForBundleIdentifier()
{
  return MEMORY[0x1E0DC83D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1E0C9A0C8]();
}

uint64_t _CFHostIsDomainTopLevel()
{
  return MEMORY[0x1E0C92EA8]();
}

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x1E0C9A628]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1E0C9A718]();
}

uint64_t _MDPlistArrayGetCount()
{
  return MEMORY[0x1E0D4DA30]();
}

uint64_t _MDPlistArrayGetPlistObjectAtIndex()
{
  return MEMORY[0x1E0D4DA38]();
}

uint64_t _MDPlistBooleanGetValue()
{
  return MEMORY[0x1E0D4DA48]();
}

uint64_t _MDPlistBytesCopyPlistAtIndex()
{
  return MEMORY[0x1E0D4DAE8]();
}

uint64_t _MDPlistBytesCreateTrusted()
{
  return MEMORY[0x1E0D4DB18]();
}

uint64_t _MDPlistContainerAddCString()
{
  return MEMORY[0x1E0D4DB50]();
}

uint64_t _MDPlistContainerAddDoubleValue()
{
  return MEMORY[0x1E0D4DB68]();
}

uint64_t _MDPlistContainerBeginContainer()
{
  return MEMORY[0x1E0D4DB98]();
}

uint64_t _MDPlistContainerBeginDictionary()
{
  return MEMORY[0x1E0D4DBA0]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x1E0D4DBB0]();
}

uint64_t _MDPlistContainerCopyRootObject()
{
  return MEMORY[0x1E0D4DBB8]();
}

uint64_t _MDPlistContainerCreateMutable()
{
  return MEMORY[0x1E0D4DBC0]();
}

uint64_t _MDPlistContainerCreateWithBytes()
{
  return MEMORY[0x1E0D4DBC8]();
}

uint64_t _MDPlistContainerCreateWithBytesAndDeallocator()
{
  return MEMORY[0x1E0D4DBD0]();
}

uint64_t _MDPlistContainerEndContainer()
{
  return MEMORY[0x1E0D4DBE8]();
}

uint64_t _MDPlistContainerEndDictionary()
{
  return MEMORY[0x1E0D4DBF0]();
}

uint64_t _MDPlistContainerGetPlistObjectAtKeyArray()
{
  return MEMORY[0x1E0D4DC08]();
}

uint64_t _MDPlistDictionaryGetCount()
{
  return MEMORY[0x1E0D4DC18]();
}

uint64_t _MDPlistDictionaryGetPlistObjectForKey()
{
  return MEMORY[0x1E0D4DC20]();
}

uint64_t _MDPlistDictionaryIterate()
{
  return MEMORY[0x1E0D4DC28]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x1E0D4DC38]();
}

uint64_t _MDPlistGetRootPlistObjectFromPlist()
{
  return MEMORY[0x1E0D4DC48]();
}

uint64_t _MDPlistNumberGetDoubleValue()
{
  return MEMORY[0x1E0D4DC50]();
}

uint64_t _MDPlistNumberGetIntValue()
{
  return MEMORY[0x1E0D4DC58]();
}

uint64_t _MDPlistStringGetValue()
{
  return MEMORY[0x1E0D4DC60]();
}

uint64_t _MDStringCopyAbbreviations()
{
  return MEMORY[0x1E0D4DCD8]();
}

uint64_t _SICreateContactMailCounts()
{
  return MEMORY[0x1E0D4F8E0]();
}

uint64_t _SICreateContactSMSCounts()
{
  return MEMORY[0x1E0D4F8E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __MDQueryCopyTextTerms()
{
  return MEMORY[0x1E0D4DCF0]();
}

uint64_t __MDQueryCreateQueryDictionaryWithOptionsDict()
{
  return MEMORY[0x1E0D4DCF8]();
}

uint64_t __MDQueryParserCancelWithReferenceDict()
{
  return MEMORY[0x1E0D4DD08]();
}

uint64_t __MDQueryParserCooldown()
{
  return MEMORY[0x1E0D4DD10]();
}

uint64_t __MDQueryParserPreheat()
{
  return MEMORY[0x1E0D4DD18]();
}

uint64_t __MDQueryStringCreateForRanking()
{
  return MEMORY[0x1E0D4DD20]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1E0C80C30]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1E0C80C38]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t appErrorScore()
{
  return MEMORY[0x1E0DA9B78]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1E0DE3DD8]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1E0DE3E18]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1E0DE3E38]();
}

uint64_t archive_read_data_into_fd()
{
  return MEMORY[0x1E0DE3E90]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1E0DE3EF8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1E0DE3F00]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1E0DE3F08]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1E0DE3F30]();
}

uint64_t archive_read_support_filter_bzip2()
{
  return MEMORY[0x1E0DE3F50]();
}

uint64_t archive_read_support_format_tar()
{
  return MEMORY[0x1E0DE3F88]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1E0DE3FC8]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1E0DE3FD8]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1E0DE3FE8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x1E0DE3FF8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x1E0C81658](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t compress_file_in_place()
{
  return MEMORY[0x1E0D4F8F0]();
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83380](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t intentLabel()
{
  return MEMORY[0x1E0D835C8]();
}

uint64_t isAppPrefixMatch()
{
  return MEMORY[0x1E0DA9B80]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

uint64_t logForCSLogCategoryPersonalization()
{
  return MEMORY[0x1E0CA6BB8]();
}

uint64_t logForCSLogCategoryPhotosQU()
{
  return MEMORY[0x1E0CA6BC0]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C844A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t openbyid_np()
{
  return MEMORY[0x1E0C844B8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

void sync(void)
{
  MEMORY[0x1E0C85758]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

