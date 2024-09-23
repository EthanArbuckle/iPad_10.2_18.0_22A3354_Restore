@implementation SLCoreSpotlightUtilities

+ (id)fetchCSSearchableItemForUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 withRequiredAttributes:(id)a5 error:(id *)a6
{
  int v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  dispatch_time_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  id v56;
  _QWORD v57[2];
  _QWORD v58[4];

  v8 = a4;
  v58[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v9)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__3;
    v50 = __Block_byref_object_dispose__3;
    v51 = 0;
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke;
    v42[3] = &unk_1E3794B20;
    v45 = &v46;
    v15 = v9;
    v43 = v15;
    v16 = v11;
    v44 = v16;
    objc_msgSend(v12, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v10, 0, CFSTR("com.apple.MobileSMS"), v13, v42);

    v17 = dispatch_time(0, 60000000000);
    if (dispatch_group_wait(v16, v17))
    {
      v54[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SocialLayer CSSearchableItem fetch failed."), &stru_1E3797070, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v19;
      v54[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Timed out while fetching CSSearchableItem."), &stru_1E3797070, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 2, v22);
        v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
        v29 = 0;
        *a6 = v23;
LABEL_20:

        _Block_object_dispose(&v46, 8);
        goto LABEL_21;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = objc_msgSend((id)v47[5], "count");
        if (v30 == objc_msgSend(v10, "count"))
        {
          v38[0] = v14;
          v38[1] = 3221225472;
          v38[2] = __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_15;
          v38[3] = &unk_1E3794B48;
          v41 = &v46;
          v22 = objc_alloc_init(MEMORY[0x1E0CA6B50]);
          v39 = v22;
          v31 = v15;
          v40 = v31;
          objc_msgSend(v10, "enumerateObjectsUsingBlock:", v38);
          if (v8)
          {
            if (v8 == 1)
              v32 = CFSTR("attachmentDomain");
            else
              v32 = 0;
          }
          else
          {
            objc_msgSend(v22, "domainIdentifier");
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v31, v32, v22);

          goto LABEL_20;
        }
      }
      v52[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SocialLayer CSSearchableItem fetch failed."), &stru_1E3797070, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v34;
      v52[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Failed to fetch one or more required attributes."), &stru_1E3797070, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 3, v22);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    v29 = 0;
    goto LABEL_20;
  }
  v57[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SocialLayer CSSearchableItem fetch failed."), &stru_1E3797070, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v25;
  v57[1] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Provided a nil unique identifier."), &stru_1E3797070, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 1, v28);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  v29 = 0;
LABEL_21:

  return v29;
}

void __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    SLFrameworkLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    SLFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_15_cold_1();
  }
  else
  {
    if (!objc_msgSend(v5, "hasPrefix:", CFSTR("com_")))
    {
      objc_msgSend(*(id *)(a1 + 32), "setAttribute:forKey:", v6, v5);
      goto LABEL_8;
    }
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setValue:forCustomKey:", v6, v8);
  }

LABEL_8:
}

+ (id)CSSearchQueryContextForAutodonatingChats
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v5[0] = *MEMORY[0x1E0CA5F30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchAttributes:", v3);

  return v2;
}

+ (id)CSQueryStringForAutodonatingChatsWithDecay:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D70C68], "decayInterval");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("kMDItemLastUsedDate>=$time.now(-%.f)"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ && %@"), CFSTR("com_apple_mobilesms_isChatAutoDonating=1"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("com_apple_mobilesms_isChatAutoDonating=1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)CSSearchQueryContextForSLHighlightsForContentType:(unsigned __int8)a3
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (v3 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "requiredSpotlightAttributeKeysForFiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
    {
      objc_msgSend(v4, "setFetchAttributes:", 0);
      return v5;
    }
    objc_msgSend((id)objc_opt_class(), "requiredSpotlightAttributeKeysForLinks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchAttributes:", v8);

  return v5;
}

+ (id)CSQueryStringForSLHighlightsForContentType:(unsigned __int8)a3 forChatIdentifiers:(id)a4
{
  int v4;
  id v5;
  const __CFString *v6;
  char v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v13;

  v4 = a3;
  v5 = a4;
  if (!v4)
  {
    v7 = 0;
    v6 = CFSTR("URL=*");
    v8 = CFSTR("lnk");
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v6 = 0;
    v7 = 1;
    v8 = CFSTR("at");
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com_apple_mobilesms_indexType=\"%@\"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = 0;
  v6 = 0;
  v7 = 1;
LABEL_7:
  v10 = CFSTR("InRange(com_apple_mobilesms_isHighlightedContent, 1, 2)");
  if (!v5)
    v10 = CFSTR("com_apple_mobilesms_isHighlightedContent=2");
  if ((v7 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ && %@"), v9, v10, v13);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ && %@ && %@"), v9, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)requiredSpotlightAttributeKeysForFiles
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[32];

  v19[31] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0CA6510];
  v19[0] = *MEMORY[0x1E0CA6060];
  v19[1] = v3;
  v4 = *MEMORY[0x1E0CA60D0];
  v19[2] = *MEMORY[0x1E0CA6978];
  v19[3] = v4;
  v5 = *MEMORY[0x1E0CA6048];
  v19[4] = *MEMORY[0x1E0CA6010];
  v19[5] = v5;
  v6 = *MEMORY[0x1E0CA6028];
  v19[6] = *MEMORY[0x1E0CA6018];
  v19[7] = v6;
  v7 = *MEMORY[0x1E0CA67C0];
  v19[8] = *MEMORY[0x1E0CA5F28];
  v19[9] = v7;
  v8 = *MEMORY[0x1E0CA6108];
  v19[10] = *MEMORY[0x1E0CA6158];
  v19[11] = v8;
  v9 = *MEMORY[0x1E0CA5F30];
  v19[12] = *MEMORY[0x1E0CA60F8];
  v19[13] = v9;
  v10 = *MEMORY[0x1E0CA6408];
  v19[14] = *MEMORY[0x1E0CA6320];
  v19[15] = v10;
  v11 = *MEMORY[0x1E0CA6338];
  v19[16] = *MEMORY[0x1E0CA6900];
  v19[17] = v11;
  v12 = *MEMORY[0x1E0CA69C8];
  v19[18] = *MEMORY[0x1E0CA6518];
  v19[19] = v12;
  v13 = *MEMORY[0x1E0CA6300];
  v19[20] = *MEMORY[0x1E0CA6410];
  v19[21] = v13;
  v14 = *MEMORY[0x1E0CA6308];
  v19[22] = *MEMORY[0x1E0CA6310];
  v19[23] = v14;
  v15 = *MEMORY[0x1E0CA6710];
  v19[24] = *MEMORY[0x1E0CA5F90];
  v19[25] = v15;
  v19[26] = *MEMORY[0x1E0CA67D8];
  v19[27] = CFSTR("com_apple_mobilesms_groupPhotoPath");
  v19[28] = CFSTR("com_apple_mobilesms_fromMe");
  v19[29] = CFSTR("com_apple_mobilesms_indexType");
  v19[30] = CFSTR("com_apple_mobilesms_highlightedContentServerDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)requiredSpotlightAttributeKeysForLinks
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
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[24];

  v15[23] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0CA6510];
  v15[0] = *MEMORY[0x1E0CA6060];
  v15[1] = v3;
  v4 = *MEMORY[0x1E0CA6198];
  v15[2] = *MEMORY[0x1E0CA6978];
  v15[3] = v4;
  v5 = *MEMORY[0x1E0CA60D0];
  v15[4] = *MEMORY[0x1E0CA6970];
  v15[5] = v5;
  v6 = *MEMORY[0x1E0CA6048];
  v15[6] = *MEMORY[0x1E0CA6010];
  v15[7] = v6;
  v7 = *MEMORY[0x1E0CA6028];
  v15[8] = *MEMORY[0x1E0CA6018];
  v15[9] = v7;
  v8 = *MEMORY[0x1E0CA67C0];
  v15[10] = *MEMORY[0x1E0CA5F28];
  v15[11] = v8;
  v9 = *MEMORY[0x1E0CA6408];
  v15[12] = *MEMORY[0x1E0CA6158];
  v15[13] = v9;
  v10 = *MEMORY[0x1E0CA6338];
  v15[14] = *MEMORY[0x1E0CA6900];
  v15[15] = v10;
  v11 = *MEMORY[0x1E0CA6710];
  v15[16] = *MEMORY[0x1E0CA5F90];
  v15[17] = v11;
  v15[18] = *MEMORY[0x1E0CA67D8];
  v15[19] = CFSTR("com_apple_mobilesms_groupPhotoPath");
  v15[20] = CFSTR("com_apple_mobilesms_fromMe");
  v15[21] = CFSTR("com_apple_mobilesms_indexType");
  v15[22] = CFSTR("com_apple_mobilesms_highlightedContentServerDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "CSSearchableIndex attributes fetch return an unexpected value (%@) for unique identifier: %@");
}

void __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_15_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "Missing required attribute %@ for loaded values with unique identifier %@");
}

@end
