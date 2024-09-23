@implementation PPMetricsUtils

+ (id)loggingQueue
{
  if (loggingQueue__pasOnceToken2 != -1)
    dispatch_once(&loggingQueue__pasOnceToken2, &__block_literal_global_16881);
  return (id)loggingQueue__pasExprOnceResult;
}

+ (int)mapNamedEntityAlgorithmForPET2:(unint64_t)a3
{
  if (a3 - 1 > 0x10)
    return 0;
  else
    return dword_1C3AE51C0[a3 - 1];
}

+ (int)mapNamedEntityCategory:(unint64_t)a3
{
  if (a3 - 1 < 0x15)
    return a3;
  else
    return 0;
}

+ (int)mapLocationAlgorithmForPET2:(unsigned __int16)a3
{
  if ((a3 - 1) > 0xB)
    return 0;
  else
    return dword_1C3AE5204[(unsigned __int16)(a3 - 1)];
}

+ (int)mapTopicAlgorithmForPET2:(unint64_t)a3
{
  if (a3 - 1 > 0xA)
    return 0;
  else
    return dword_1C3AE5234[a3 - 1];
}

+ (int)mapTopicDonationErrorForPET2:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return 8;
  else
    return dword_1C3AE5260[a3];
}

+ (int)mapDomainForPET2:(unsigned __int8)a3
{
  if ((a3 - 1) < 7)
    return (a3 - 1) + 1;
  else
    return 0;
}

+ (id)filterBundleId:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple")))
  {
    objc_msgSend(v3, "_pas_stringBackedByUTF8CString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("Third-Party");
  }

  return v4;
}

+ (int)sourceForBundleId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (sourceForBundleId___pasOnceToken3 != -1)
    dispatch_once(&sourceForBundleId___pasOnceToken3, &__block_literal_global_45);
  v4 = (id)sourceForBundleId___pasExprOnceResult;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_17:
    v12 = objc_msgSend(v5, "intValue");

  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend((id)*MEMORY[0x1E0D70E98], "objectForKeyedSubscript:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (void *)v11;

            goto LABEL_17;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        if (v8)
          continue;
        break;
      }
    }

    if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("com.apple."), 10) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v3)
        v12 = 17;
      else
        v12 = 18;
    }
    else
    {
      pp_private_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v3;
        _os_log_debug_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEBUG, "PPMetricsUtils: unknown first-party source %@", buf, 0xCu);
      }

      v12 = 16;
    }
  }

  return v12;
}

+ (id)stringifyFeedbackType:(unsigned int)a3
{
  if (a3 > 5)
    return CFSTR("Undefined");
  else
    return off_1E7E1C650[a3];
}

+ (id)stringifyDomain:(unsigned __int8)a3
{
  if ((a3 - 1) > 6)
    return CFSTR("Topics");
  else
    return off_1E7E1C680[(a3 - 1)];
}

+ (id)stringifyFeedbackDomainStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 4)
    return CFSTR("NotInDomain");
  else
    return off_1E7E1C6B8[(a3 - 1)];
}

+ (id)truncatedClientBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  if (v3)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v6;
    }
    if ((unint64_t)objc_msgSend(v3, "length") >= 0x19)
    {
      objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 24);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v7;
    }
    v8 = (__CFString *)v3;

  }
  else
  {
    v8 = CFSTR("unknown");
  }
  objc_autoreleasePoolPop(v4);
  return v8;
}

+ (id)truncatedClientBundleIdOrCurrentBundleId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "bundleIdentifierOrProcessName:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "truncatedClientBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)filterGroupIdAllowance:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[10];

  v20[9] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D70EC0];
  v12[0] = *MEMORY[0x1E0D70EB8];
  v12[1] = v3;
  v20[0] = v12[0];
  v20[1] = v3;
  v4 = *MEMORY[0x1E0D70ED0];
  v13 = *MEMORY[0x1E0D70EC8];
  v14 = v4;
  v20[2] = v13;
  v20[3] = v4;
  v5 = *MEMORY[0x1E0D70EE8];
  v15 = *MEMORY[0x1E0D70ED8];
  v16 = v5;
  v20[4] = v15;
  v20[5] = v5;
  v6 = *MEMORY[0x1E0D70EE0];
  v17 = *MEMORY[0x1E0D70EF0];
  v18 = v6;
  v20[6] = v17;
  v20[7] = v6;
  v19 = *MEMORY[0x1E0D70EF8];
  v20[8] = v19;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v20, v12, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __36__PPMetricsUtils_sourceForBundleId___block_invoke()
{
  void *v0;
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
  void *v12;
  _QWORD v13[21];
  _QWORD v14[22];

  v14[21] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = *MEMORY[0x1E0D70E38];
  v13[0] = *MEMORY[0x1E0D70E68];
  v13[1] = v1;
  v14[0] = &unk_1E7E59AE0;
  v14[1] = &unk_1E7E59AF8;
  v2 = *MEMORY[0x1E0D70E28];
  v13[2] = *MEMORY[0x1E0D70E18];
  v13[3] = v2;
  v14[2] = &unk_1E7E59B10;
  v14[3] = &unk_1E7E59B28;
  v3 = *MEMORY[0x1E0D70E50];
  v13[4] = *MEMORY[0x1E0D70E78];
  v13[5] = v3;
  v14[4] = &unk_1E7E59B40;
  v14[5] = &unk_1E7E59B58;
  v4 = *MEMORY[0x1E0D70E58];
  v13[6] = *MEMORY[0x1E0D70DE8];
  v13[7] = v4;
  v14[6] = &unk_1E7E59B70;
  v14[7] = &unk_1E7E59B88;
  v5 = *MEMORY[0x1E0D70E48];
  v13[8] = *MEMORY[0x1E0D70DC0];
  v13[9] = v5;
  v14[8] = &unk_1E7E59BA0;
  v14[9] = &unk_1E7E59BB8;
  v6 = *MEMORY[0x1E0D70E20];
  v13[10] = *MEMORY[0x1E0D70E40];
  v13[11] = v6;
  v14[10] = &unk_1E7E59BD0;
  v14[11] = &unk_1E7E59BE8;
  v7 = *MEMORY[0x1E0D70E60];
  v13[12] = *MEMORY[0x1E0D70DD0];
  v13[13] = v7;
  v14[12] = &unk_1E7E59C00;
  v14[13] = &unk_1E7E59C18;
  v8 = *MEMORY[0x1E0D70DC8];
  v13[14] = *MEMORY[0x1E0D70DD8];
  v13[15] = v8;
  v14[14] = &unk_1E7E59C30;
  v14[15] = &unk_1E7E59C48;
  v9 = *MEMORY[0x1E0D70DE0];
  v13[16] = *MEMORY[0x1E0D70EA0];
  v13[17] = v9;
  v14[16] = &unk_1E7E59C60;
  v14[17] = &unk_1E7E59C78;
  v10 = *MEMORY[0x1E0D70E88];
  v13[18] = *MEMORY[0x1E0D70E30];
  v13[19] = v10;
  v14[18] = &unk_1E7E59C90;
  v14[19] = &unk_1E7E59CA8;
  v13[20] = *MEMORY[0x1E0D70E90];
  v14[20] = &unk_1E7E59CC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 21);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)sourceForBundleId___pasExprOnceResult;
  sourceForBundleId___pasExprOnceResult = v11;

  objc_autoreleasePoolPop(v0);
}

void __30__PPMetricsUtils_loggingQueue__block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = dispatch_queue_create("com.apple.PersonalizationPortrait.storeMetricsLogging", v2);
  v4 = (void *)loggingQueue__pasExprOnceResult;
  loggingQueue__pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v0);
}

@end
