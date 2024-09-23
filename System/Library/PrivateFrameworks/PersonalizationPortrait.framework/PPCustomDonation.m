@implementation PPCustomDonation

+ (BOOL)donateSiriQuery:(id)a3 results:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  PPSourceMetadata *v34;
  PPSource *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  PPTopic *v44;
  void *v45;
  PPTopic *v46;
  PPScoredItem *v47;
  void *v48;
  PPScoredItem *v49;
  void *v50;
  id v51;
  PPSource *v53;
  PPSourceMetadata *v54;
  void *v55;
  id *v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _BYTE v64[128];
  const __CFString *v65;
  id v66;
  uint8_t buf[4];
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  pp_default_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v68 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEFAULT, "Received donation of %tu result(s) from Siri", buf, 0xCu);
  }

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = CFSTR("textContent");
  v66 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  objc_msgSend(a1, "donateLabeledStrings:bundleId:groupId:documentId:error:", v13, CFSTR("com.apple.siri.assistant_service"), CFSTR("com.apple.proactive.PersonalizationPortrait.SiriDonation"), v12, &v63);
  v14 = v63;

  if (v14)
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v68 = (uint64_t)v14;
      _os_log_error_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_ERROR, "Error piping Siri query into suggestd: %@", buf, 0xCu);
    }

    v16 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v14);
  }
  else
  {
    v56 = a5;
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "languageCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    v57 = v8;
    if (v21 >= 2)
    {
      v22 = v12;
      v23 = v9;
      v24 = (void *)MEMORY[0x1E0D70A90];
      v25 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithArray:", v26);
      objc_msgSend(v24, "detectLanguageFromTextHeuristicallyWithLanguages:languages:defaultLanguage:", v8, v27, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "languageCode");
        v30 = (id)objc_claimAutoreleasedReturnValue();

        v19 = v31;
      }

      v19 = v30;
      v8 = v57;
      v9 = v23;
      v12 = v22;
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
    v33 = objc_claimAutoreleasedReturnValue();

    v34 = -[PPSourceMetadata initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:]([PPSourceMetadata alloc], "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, objc_msgSend(v8, "length"), 0, 0, 0);
    v35 = [PPSource alloc];
    v36 = (void *)objc_opt_new();
    v54 = v34;
    v55 = (void *)v33;
    v53 = -[PPSource initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:](v35, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", CFSTR("com.apple.siri.assistant_service"), CFSTR("com.apple.proactive.PersonalizationPortrait.SiriDonation"), v12, v36, 0, 0, v33, v34);

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v37 = v9;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v60 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v42, "qid");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            v44 = [PPTopic alloc];
            objc_msgSend(v42, "qid");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = -[PPTopic initWithTopicIdentifier:](v44, "initWithTopicIdentifier:", v45);

            v47 = [PPScoredItem alloc];
            objc_msgSend(v42, "confidence");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "doubleValue");
            v49 = -[PPScoredItem initWithItem:score:](v47, "initWithItem:score:", v46);
            objc_msgSend(v17, "addObject:", v49);

          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v39);
    }

    v50 = (void *)objc_opt_new();
    v58 = 0;
    v16 = objc_msgSend(v50, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", v17, v53, 2, 1, 0, &v58, 0.0);
    v51 = v58;

    if (v56 && v51)
      *v56 = objc_retainAutorelease(v51);

    v8 = v57;
    v14 = 0;
  }

  return v16;
}

+ (BOOL)donateNotification:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v22;
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2112;
    v28 = CFSTR("com.apple.proactive.PersonalizationPortrait.Notifications");
    _os_log_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_DEFAULT, "PPCustomDonation: received notification: %@ groupId: %@", buf, 0x16u);
  }

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = CFSTR("textContent");
  objc_msgSend(v6, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v23[1] = CFSTR("title");
  objc_msgSend(v6, "title");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E226D4B0;
  v24[1] = v13;
  v23[2] = CFSTR("contentDescription");
  objc_msgSend(v6, "subtitle");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1E226D4B0;
  v24[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(a1, "donateLabeledStrings:bundleId:groupId:documentId:error:", v17, v18, CFSTR("com.apple.proactive.PersonalizationPortrait.Notifications"), v9, &v22);
  v19 = v22;

  if (v19)
  {
    pp_default_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v19;
      _os_log_error_impl(&dword_18BE3A000, v20, OS_LOG_TYPE_ERROR, "Error donating notification to PersonalizationPortrait: %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v19);
  }

  return v19 == 0;
}

+ (BOOL)donatePhotosOneUpLocationNamedEntities:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  pp_entities_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218242;
    v14 = objc_msgSend(v7, "count");
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEFAULT, "Received donation of %tu one-up location named entities(s) from %@", (uint8_t *)&v13, 0x16u);
  }

  v10 = (void *)objc_opt_new();
  v11 = objc_msgSend(v10, "donateLocationNamedEntities:bundleId:groupId:error:", v7, v8, CFSTR("com.apple.proactive.PersonalizationPortrait.PhotosOneUpDonation"), a5);

  return v11;
}

+ (BOOL)donatePhotosLocationNamedEntities:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  pp_entities_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218242;
    v15 = objc_msgSend(v7, "count");
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEFAULT, "Received donation of %tu graph location named entities(s) from %@", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_6176);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v12 = objc_msgSend(v11, "donateLocationNamedEntities:bundleId:groupId:error:", v10, v8, CFSTR("com.apple.proactive.PersonalizationPortrait.PhotosGraphDonation"), a5);

  return v12;
}

+ (BOOL)donatePhotosNamedEntities:(id)a3 bundleId:(id)a4 date:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  PPSource *v13;
  id v14;
  uint64_t v15;
  void *v16;
  PPSource *v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  pp_entities_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v9, "count");
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_DEFAULT, "Received donation of %tu named entities(s) from %@", buf, 0x16u);
  }

  v13 = [PPSource alloc];
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("photos-%f"), v15);
  v17 = -[PPSource initWithBundleId:groupId:documentId:date:](v13, "initWithBundleId:groupId:documentId:date:", v10, CFSTR("com.apple.proactive.PersonalizationPortrait.PhotosGraphDonation"), v16, v11);

  v18 = (void *)objc_opt_new();
  v19 = objc_msgSend(v18, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v9, v17, 11, 0, a6, 0.0);

  if (v19)
  {
    v20 = (void *)objc_opt_new();
    v25 = 0;
    v21 = objc_msgSend(v20, "flushDonationsWithError:", &v25);
    v22 = v25;

    if ((v21 & 1) == 0)
    {
      pp_default_log_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = (uint64_t)v22;
        _os_log_impl(&dword_18BE3A000, v23, OS_LOG_TYPE_DEFAULT, "PPCustomDonation: donatePhotosNamedEntities: Warning: failed to flush: %@", buf, 0xCu);
      }

    }
  }

  return v19;
}

+ (BOOL)donatePhotosTopics:(id)a3 bundleId:(id)a4 date:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  PPSource *v15;
  id v16;
  uint64_t v17;
  void *v18;
  PPSource *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  void *v28;
  const __CFString *v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  pp_topics_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v32 = objc_msgSend(v9, "count");
    v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_DEFAULT, "Received donation of %tu topic(s) from %@", buf, 0x16u);
  }

  if (objc_msgSend(v9, "count"))
  {
    v13 = (void *)objc_opt_new();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __59__PPCustomDonation_donatePhotosTopics_bundleId_date_error___block_invoke;
    v27[3] = &unk_1E226BA98;
    v28 = v13;
    v14 = v13;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v27);
    v15 = [PPSource alloc];
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@-%f"), CFSTR("photos-unmapped"), v17);
    v19 = -[PPSource initWithBundleId:groupId:documentId:date:](v15, "initWithBundleId:groupId:documentId:date:", v10, CFSTR("com.apple.proactive.PersonalizationPortrait.PhotosGraphDonation"), v18, v11);

    v20 = (void *)objc_opt_new();
    v21 = objc_msgSend(v20, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", v14, v19, 5, 0, 0, a6, 0.0);

    v22 = v28;
  }
  else
  {
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No topics donated by %@"), v10);
    pp_default_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = (uint64_t)v14;
      _os_log_error_impl(&dword_18BE3A000, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (!a6)
    {
      v21 = 0;
      goto LABEL_10;
    }
    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v29 = CFSTR("PPErrorInfoKey");
    v30 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", CFSTR("PPErrorDomain"), 5, v22);
    v21 = 0;
    *a6 = v25;
  }

LABEL_10:
  return v21;
}

+ (BOOL)donateParsecNamedEntitiesAndTopics:(id)a3 rawQuery:(id)a4 reformulatedQuery:(id)a5 source:(id)a6 error:(id *)a7
{
  id v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  char v19;
  __CFString *v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t *v28;
  void *v29;
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  __int128 *p_buf;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  const __CFString *v52;
  const __CFString *v53;
  uint8_t v54[4];
  const __CFString *v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = a6;
  pp_default_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v11, "count");
    _os_log_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEFAULT, "Received donation of %tu entity groups(s) from parsec", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__6136;
  v59 = __Block_byref_object_dispose__6137;
  v60 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__6136;
  v50 = __Block_byref_object_dispose__6137;
  v51 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  if (objc_msgSend(v11, "count"))
  {
    pp_private_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v54 = 138412290;
      v55 = v12;
      _os_log_debug_impl(&dword_18BE3A000, v16, OS_LOG_TYPE_DEBUG, "Raw Parsec query: %@", v54, 0xCu);
    }

    pp_private_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v54 = 138412290;
      v55 = v13;
      _os_log_debug_impl(&dword_18BE3A000, v17, OS_LOG_TYPE_DEBUG, "Reformulated Parsec query: %@", v54, 0xCu);
    }

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __95__PPCustomDonation_donateParsecNamedEntitiesAndTopics_rawQuery_reformulatedQuery_source_error___block_invoke;
    v32[3] = &unk_1E226BB08;
    v34 = &v42;
    v33 = v14;
    p_buf = &buf;
    v36 = &v38;
    v37 = &v46;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v32);
    if (*((_BYTE *)v43 + 24))
    {
      if (*((_BYTE *)v39 + 24))
      {
        v18 = (void *)objc_opt_new();
        v31 = 0;
        v19 = objc_msgSend(v18, "flushDonationsWithError:", &v31);
        v20 = (__CFString *)v31;

        if ((v19 & 1) == 0)
        {
          pp_default_log_handle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v54 = 138412290;
            v55 = v20;
            _os_log_impl(&dword_18BE3A000, v21, OS_LOG_TYPE_DEFAULT, "PPCustomDonation: donateParsecNamedEntitiesAndTopics: Warning: failed to flush: %@", v54, 0xCu);
          }

        }
        if (*((_BYTE *)v43 + 24))
          v22 = *((_BYTE *)v39 + 24) != 0;
        else
          v22 = 0;

        goto LABEL_31;
      }
      if (a7)
      {
        v29 = (void *)v47[5];
        if (v29)
        {
          *a7 = objc_retainAutorelease(v29);
          v28 = v39;
          goto LABEL_26;
        }
      }
    }
    else if (a7)
    {
      v27 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v27)
      {
        *a7 = objc_retainAutorelease(v27);
        v28 = v43;
LABEL_26:
        v22 = *((_BYTE *)v28 + 24) != 0;
LABEL_31:
        v25 = v33;
        goto LABEL_32;
      }
    }
    v22 = 0;
    goto LABEL_31;
  }
  pp_default_log_handle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v54 = 138412290;
    v55 = CFSTR("No entity groups donated by parsec");
    _os_log_error_impl(&dword_18BE3A000, v23, OS_LOG_TYPE_ERROR, "%@", v54, 0xCu);
  }

  if (a7)
  {
    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v52 = CFSTR("PPErrorInfoKey");
    v53 = CFSTR("No entity groups donated by parsec");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", CFSTR("PPErrorDomain"), 5, v25);
    v22 = 0;
    *a7 = v26;
LABEL_32:

    goto LABEL_33;
  }
  v22 = 0;
LABEL_33:
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&buf, 8);
  return v22;
}

+ (BOOL)donateLabeledStrings:(id)a3 bundleId:(id)a4 groupId:(id)a5 documentId:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  _QWORD v21[5];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.suggestd.PersonalizationPortrait.StringDonation"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01BD08);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRemoteObjectInterface:", v16);

  objc_msgSend(v15, "resume");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__6136;
  v27 = __Block_byref_object_dispose__6137;
  v17 = MEMORY[0x1E0C809B0];
  v28 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__PPCustomDonation_donateLabeledStrings_bundleId_groupId_documentId_error___block_invoke;
  v22[3] = &unk_1E226BEA8;
  v22[4] = &v23;
  objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __75__PPCustomDonation_donateLabeledStrings_bundleId_groupId_documentId_error___block_invoke_80;
  v21[3] = &unk_1E226BEA8;
  v21[4] = &v23;
  objc_msgSend(v18, "donateLabeledStrings:bundleId:groupId:documentId:completion:", v11, v12, v13, v14, v21);
  objc_msgSend(v15, "invalidate");
  if (a7)
    *a7 = objc_retainAutorelease((id)v24[5]);
  v19 = v24[5] == 0;

  _Block_object_dispose(&v23, 8);
  return v19;
}

void __75__PPCustomDonation_donateLabeledStrings_bundleId_groupId_documentId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = CFSTR("com.apple.suggestd.PersonalizationPortrait.StringDonation");
    _os_log_error_impl(&dword_18BE3A000, v4, OS_LOG_TYPE_ERROR, "PPStringDonation: connection to %@ interrupted.", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __75__PPCustomDonation_donateLabeledStrings_bundleId_groupId_documentId_error___block_invoke_80(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __95__PPCustomDonation_donateParsecNamedEntitiesAndTopics_rawQuery_reformulatedQuery_source_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id obj;
  uint8_t buf[4];
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    pp_entities_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEFAULT, "Skipping empty named entity received from Parsec donation", buf, 2u);
    }
    goto LABEL_7;
  }
  v10 = (void *)objc_opt_new();
  v28[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[4];
  v13 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v13 + 40);
  v14 = objc_msgSend(v10, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v11, v12, 12, 1, &obj, 0.0);
  objc_storeStrong((id *)(v13 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v14;

  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_log_error_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_ERROR, "Error donating named entities from Parsec query: %@", buf, 0xCu);
    }
LABEL_7:

  }
  objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_72_6153);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v18 = (void *)objc_opt_new();
    v19 = a1[4];
    v20 = *(_QWORD *)(a1[8] + 8);
    v24 = *(id *)(v20 + 40);
    v21 = objc_msgSend(v18, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", v17, v19, 7, 1, 0, &v24, 0.0);
    objc_storeStrong((id *)(v20 + 40), v24);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v21;

    if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      pp_default_log_handle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v27 = v23;
        _os_log_error_impl(&dword_18BE3A000, v22, OS_LOG_TYPE_ERROR, "Error donating topics from Parsec query: %@", buf, 0xCu);
      }

    }
  }

}

BOOL __95__PPCustomDonation_donateParsecNamedEntitiesAndTopics_rawQuery_reformulatedQuery_source_error___block_invoke_70(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topicIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasPrefix:", CFSTR("Q")))
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intValue") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __59__PPCustomDonation_donatePhotosTopics_bundleId_date_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PPScoredItem *v7;
  double v8;
  double v9;
  PPScoredItem *v10;
  PPTopic *v11;

  v5 = a3;
  v6 = a2;
  v11 = -[PPTopic initWithTopicIdentifier:]([PPTopic alloc], "initWithTopicIdentifier:", v6);

  v7 = [PPScoredItem alloc];
  objc_msgSend(v5, "doubleValue");
  v9 = v8;

  v10 = -[PPScoredItem initWithItem:score:](v7, "initWithItem:score:", v11, v9);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

}

id __69__PPCustomDonation_donatePhotosLocationNamedEntities_bundleId_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "documentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("photos-%f"), floor(v6));
    objc_msgSend(v2, "setDocumentId:", v7);

  }
  return v2;
}

@end
