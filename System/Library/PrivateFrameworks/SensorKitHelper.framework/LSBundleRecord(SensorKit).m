@implementation LSBundleRecord(SensorKit)

- (uint64_t)sr_isSocialNetworking
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v2 = a1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = objc_msgSend(a1, "containingBundleRecord");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v2 = (void *)v3;
      else
        v2 = 0;
    }
    else
    {
      v2 = 0;
    }
  }
  v4 = objc_msgSend((id)objc_msgSend(v2, "iTunesMetadata"), "genreIdentifier");
  v5 = (void *)objc_msgSend((id)objc_msgSend(v2, "iTunesMetadata"), "genre");
  v6 = (void *)objc_msgSend(v2, "infoDictionary");
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "objectForKey:ofClass:valuesOfClass:", CFSTR("SBMatchingApplicationGenres"), v7, objc_opt_class());
  if (_MergedGlobals_1 != -1)
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_0);
  v9 = qword_254419A88;
  if (os_log_type_enabled((os_log_t)qword_254419A88, OS_LOG_TYPE_INFO))
  {
    v11 = 138478595;
    v12 = objc_msgSend(a1, "bundleIdentifier");
    v13 = 2050;
    v14 = v4;
    v15 = 2113;
    v16 = v5;
    v17 = 2113;
    v18 = v8;
    _os_log_impl(&dword_245CD0000, v9, OS_LOG_TYPE_INFO, "bundle id: %{private}@, genre id: %{public}llu, genre: %{private}@, genres: %{private}@", (uint8_t *)&v11, 0x2Au);
  }
  if (v4 == 6005 || (objc_msgSend(v5, "isEqualToString:", CFSTR("Social Networking")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v8, "containsObject:", CFSTR("Social Networking"));
}

+ (uint64_t)sr_bundleRecordWithIdentifier:()SensorKit error:
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", a3, 0, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  return v4;
}

- (uint64_t)sr_supportsVOIP
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if ((objc_msgSend((id)objc_msgSend(a1, "UIBackgroundModes"), "containsObject:", CFSTR("voip")) & 1) != 0)
    return 1;
  return objc_msgSend((id)objc_msgSend(a1, "appTags"), "containsObject:", CFSTR("any-telephony"));
}

- (uint64_t)sr_supportsMessagingIntents
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend((id)objc_msgSend(a1, "supportedIntents"), "containsObject:", CFSTR("INSendMessageIntent")) & 1) != 0)
      return 1;
    v3 = (void *)objc_msgSend(a1, "applicationExtensionRecords");
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
LABEL_8:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "supportedIntents"), "containsObject:", CFSTR("INSendMessageIntent")) & 1) != 0)return 1;
        if (v4 == ++v6)
        {
          v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
          result = 0;
          if (v4)
            goto LABEL_8;
          return result;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend((id)objc_msgSend(a1, "supportedIntents"), "containsObject:", CFSTR("INSendMessageIntent"));
    else
      return 0;
  }
  return result;
}

- (uint64_t)sr_supportsDataGeneration
{
  void *v1;

  v1 = (void *)objc_msgSend((id)objc_msgSend(a1, "infoDictionary"), "objectForKey:ofClass:", CFSTR("SRResearchDataGeneration"), objc_opt_class());
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v1, "BOOLValue");
  else
    return 1;
}

@end
