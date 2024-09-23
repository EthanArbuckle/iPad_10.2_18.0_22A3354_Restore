@implementation _PSContentFeatures

+ (id)preservePrivacyUTIMapping:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AFCA24]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("public.file-url"), CFSTR("public.url"), CFSTR("public.image"), CFSTR("public.jpeg,public.heic"), CFSTR("public.jpeg"), CFSTR("com.apple.live-photo,public.heic,public.jpeg"), CFSTR("com.apple.avfoundation.urlasset,com.apple.quicktime-movie"), CFSTR("public.plain-text"), CFSTR("public.png"), CFSTR("public.vcard"), CFSTR("com.apple.active-webpage,public.url"), CFSTR("public.url,com.apple.active-webpage"), 0);
  objc_autoreleasePoolPop(v4);
  if (objc_msgSend(v5, "containsObject:", v3))
    v6 = (__CFString *)v3;
  else
    v6 = CFSTR("NotInTopAllowedUTIStrings");

  return v6;
}

+ (id)preservePrivacySourceBundleID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v15;
  id v16;
  id v17;
  void *v18;

  v17 = a3;
  v18 = (void *)MEMORY[0x1A1AFCA24]();
  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants mobilePhotosBundleId](_PSConstants, "mobilePhotosBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileScreenshotsBundleId](_PSConstants, "mobileScreenshotsBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileCameraBundleId](_PSConstants, "mobileCameraBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants twitterBundleId](_PSConstants, "twitterBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileSafariBundleId](_PSConstants, "mobileSafariBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants whatsappBundleId](_PSConstants, "whatsappBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants instagramBundleId](_PSConstants, "instagramBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v16, "initWithObjects:", v3, v15, v4, v5, v6, v7, v8, v9, v10, v11, 0);

  objc_autoreleasePoolPop(v18);
  if (objc_msgSend(v12, "containsObject:", v17))
    v13 = (__CFString *)v17;
  else
    v13 = CFSTR("NotInTopAllowedsourceBundleIDStrings");

  return v13;
}

+ (id)preservePrivacyTopLevelDomain:(id)a3
{
  id v3;
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
  __CFString *v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("www."), 11, 0, v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = v4;
  else
    v7 = v4 - (v5 + v6);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = v5 + v6;
  v9 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("."), 2, v8, v7);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(&unk_1E442C7A8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = v7;
    else
      v12 = v9 - v8;
    v13 = *(_QWORD *)v19;
    v14 = CFSTR("NotInTopAllowedTopLevelDomains");
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(&unk_1E442C7A8);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (!objc_msgSend(v3, "compare:options:range:", v16, 3, v8, v12))
        {
          v14 = v16;
          goto LABEL_21;
        }
      }
      v11 = objc_msgSend(&unk_1E442C7A8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v14 = CFSTR("NotInTopAllowedTopLevelDomains");
  }
LABEL_21:

  return v14;
}

+ (id)utiTypesFromPredictionContext:(id)a3 candidates:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _PSFeatureDictionary *v20;
  id v21;
  void *v22;
  _PSFeatureDictionary *v23;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v5, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "UTI");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "UTI");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = [_PSFeatureDictionary alloc];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63___PSContentFeatures_utiTypesFromPredictionContext_candidates___block_invoke;
    v25[3] = &unk_1E43FF830;
    v26 = v18;
    v21 = v18;
    objc_msgSend(v19, "_pas_mappedArrayWithTransform:", v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[_PSFeatureDictionary initWithObjects:forKeys:](v20, "initWithObjects:forKeys:", v22, v19);

  }
  else
  {
    v23 = (_PSFeatureDictionary *)MEMORY[0x1E0C9AA70];
  }

  return v23;
}

+ (id)sourceAppFromPredictionContext:(id)a3 candidates:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _PSFeatureDictionary *v8;
  void *v9;
  _PSFeatureDictionary *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  objc_msgSend(a4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [_PSFeatureDictionary alloc];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64___PSContentFeatures_sourceAppFromPredictionContext_candidates___block_invoke;
    v12[3] = &unk_1E43FF830;
    v13 = v5;
    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_PSFeatureDictionary initWithObjects:forKeys:](v8, "initWithObjects:forKeys:", v9, v6);

  }
  else
  {
    v10 = (_PSFeatureDictionary *)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

+ (id)numberOfContentFromPredictionContext:(id)a3 contentType:(int)a4 candidates:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _PSFeatureDictionary *v20;
  id v21;
  void *v22;
  _PSFeatureDictionary *v23;
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v25 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v7, "attachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        switch(a4)
        {
          case 3:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "hash"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v18);
            goto LABEL_15;
          case 1:
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "peopleInPhoto");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
              continue;
            objc_msgSend(v14, "photoSceneDescriptors");
            v16 = objc_claimAutoreleasedReturnValue();
LABEL_13:
            v18 = (void *)v16;
            objc_msgSend(v8, "addObjectsFromArray:", v16);
LABEL_15:

            continue;
          case 0:
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "peopleInPhoto");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v14, "peopleInPhoto");
              v16 = objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            }
            break;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  objc_msgSend(v25, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [_PSFeatureDictionary alloc];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __82___PSContentFeatures_numberOfContentFromPredictionContext_contentType_candidates___block_invoke;
  v26[3] = &unk_1E43FF830;
  v27 = v8;
  v21 = v8;
  objc_msgSend(v19, "_pas_mappedArrayWithTransform:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[_PSFeatureDictionary initWithObjects:forKeys:](v20, "initWithObjects:forKeys:", v22, v19);

  return v23;
}

+ (id)urlTopLevelDomainFromPredictionContext:(id)a3 candidates:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _PSFeatureDictionary *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _PSFeatureDictionary *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a3, "attachments");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    v10 = (_PSFeatureDictionary *)MEMORY[0x1E0C9AA70];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "contentURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "contentURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "host");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {

            objc_msgSend(v5, "allObjects");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = [_PSFeatureDictionary alloc];
            v20[0] = MEMORY[0x1E0C809B0];
            v20[1] = 3221225472;
            v20[2] = __72___PSContentFeatures_urlTopLevelDomainFromPredictionContext_candidates___block_invoke;
            v20[3] = &unk_1E43FF830;
            v21 = v15;
            v6 = v15;
            objc_msgSend(v16, "_pas_mappedArrayWithTransform:", v20);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = -[_PSFeatureDictionary initWithObjects:forKeys:](v17, "initWithObjects:forKeys:", v18, v16);

            goto LABEL_13;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v10 = (_PSFeatureDictionary *)MEMORY[0x1E0C9AA70];
  }
LABEL_13:

  return v10;
}

@end
