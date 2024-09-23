@implementation _PSInteractionPredictor

+ (id)defaultClustersArchiveDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D15900], "modelDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("InteractionModelClusters/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)clustersArchiveFileForDate:(id)a3 modelName:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3578];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setDateFormat:", CFSTR("MM-dd-yyyy"));
  objc_msgSend(v8, "stringFromDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v5)
    {
      objc_msgSend(v10, "appendString:", CFSTR("_"));
      objc_msgSend(v11, "appendString:", v5);
    }
    objc_msgSend(v11, "appendString:", CFSTR(".archive"));
    +[_PSInteractionPredictor defaultClustersArchiveDirectory](_PSInteractionPredictor, "defaultClustersArchiveDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)getModelURLfromName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("mlmodelc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getIntermediateModelURLForModelName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("/var/tmp/"), "stringByAppendingString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".mlmodelc/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)loadModelFromUrl:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[_PSInteractionPredictor loadModelFromUrl:].cold.3(v3, v4);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getMLModelClass_softClass;
  v18 = getMLModelClass_softClass;
  if (!getMLModelClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getMLModelClass_block_invoke;
    v14[3] = &unk_1E43FEA00;
    v14[4] = &v15;
    __getMLModelClass_block_invoke((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v13 = 0;
  objc_msgSend(v6, "modelWithContentsOfURL:error:", v3, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_PSInteractionPredictor loadModelFromUrl:].cold.2(v3, (uint64_t)v8, v10);

    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[_PSInteractionPredictor loadModelFromUrl:].cold.1();

    v11 = v7;
  }

  return v11;
}

- (id)getConversationIDFromInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
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
  int v21;
  void *v22;
  void *v23;
  int v24;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_14;
  objc_msgSend(v4, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {

    goto LABEL_5;
  }
  objc_msgSend(v5, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
LABEL_5:
    v11 = (void *)MEMORY[0x1E0D158B8];
    objc_msgSend(v5, "recipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generateConversationIdFromInteractionRecipients:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_15;
    goto LABEL_6;
  }
  objc_msgSend(v5, "bundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", v18))
  {

    goto LABEL_11;
  }
  objc_msgSend(v5, "bundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqualToString:", v20);

  if (!v21)
  {
    objc_msgSend(v5, "bundleId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if (v24)
      goto LABEL_5;
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
LABEL_11:
  objc_msgSend(v5, "domainIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_15;
LABEL_6:
  -[_PSInteractionPredictor conversationIDMap](self, "conversationIDMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[_PSInteractionPredictor conversationIDMap](self, "conversationIDMap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v5, v13);

  }
LABEL_15:

  return v13;
}

- (id)findLatestArchiveDateBefore:(id)a3 modelName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionPredictor defaultClustersArchiveDirectory](_PSInteractionPredictor, "defaultClustersArchiveDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumeratorAtPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("MM-dd-yyyy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    objc_msgSend(v10, "appendString:", CFSTR("_"));
    objc_msgSend(v11, "appendString:", v6);
  }
  objc_msgSend(v11, "appendString:", CFSTR(".archive"), v6);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "length");
        v19 = objc_msgSend(v11, "length");
        if (v18 >= v19)
        {
          v21 = CFSTR("_");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("MM-dd-yyyy.archive"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(v20, "length");
          v21 = CFSTR(".");
          v11 = v20;
        }
        objc_msgSend(v17, "substringFromIndex:", v18 - v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsSeparatedByString:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndex:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v25, "setDateFormat:", CFSTR("MM-dd-yyyy"));
        objc_msgSend(v25, "dateFromString:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timeIntervalSinceDate:", v26);
        if (v27 >= 0.0)
        {
          if (v14)
          {
            objc_msgSend(v14, "timeIntervalSinceDate:", v26);
            if (v28 < 0.0)
            {
              v29 = v26;

              v14 = v29;
            }
          }
          else
          {
            v14 = v26;
          }
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_PSInteractionPredictor)initWithInteractionStore:(id)a3 atDate:(id)a4 withModelName:(id)a5 modelConfiguration:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _PSInteractionPredictor *v15;
  _PSInteractionPredictor *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSDictionary *currentClusterDictionary;
  uint64_t v22;
  NSURL *compiledModelURL;
  NSMutableDictionary *v24;
  NSMutableDictionary *conversationIDMap;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_PSInteractionPredictor;
  v15 = -[_PSInteractionPredictor init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_interactionStore, a3);
    objc_storeStrong((id *)&v16->_modelConfiguration, a6);
    -[_PSKNNModelConfiguration modelName](v16->_modelConfiguration, "modelName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSInteractionPredictor findLatestArchiveDateBefore:modelName:](v16, "findLatestArchiveDateBefore:modelName:", v12, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v19 = v18;
    else
      v19 = v12;
    -[_PSInteractionPredictor getOrMakeClusterDictionaryAtDate:](v16, "getOrMakeClusterDictionaryAtDate:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    currentClusterDictionary = v16->_currentClusterDictionary;
    v16->_currentClusterDictionary = (NSDictionary *)v20;

    +[_PSInteractionPredictor getModelURLfromName:](_PSInteractionPredictor, "getModelURLfromName:", v13);
    v22 = objc_claimAutoreleasedReturnValue();
    compiledModelURL = v16->_compiledModelURL;
    v16->_compiledModelURL = (NSURL *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    conversationIDMap = v16->_conversationIDMap;
    v16->_conversationIDMap = v24;

  }
  return v16;
}

- (id)getDateNumDays:(int)a3 AfterDate:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0C99D78];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setDay:", a3);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getTrainArrayToDate:(id)a3 withStartDateAnchor:(id)a4
{
  void *v6;
  void *v7;
  unsigned int (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *context;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v40 = a4;
  v6 = (void *)objc_opt_new();
  -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shouldExcludeInteractionBlock");
  v8 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interactionMechanisms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      v13 = MEMORY[0x1A1AFCA24]();
      -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "interactionHistoryRelativeStartDates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "intValue");

      context = (void *)v13;
      if ((_DWORD)v17)
      {
        -[_PSInteractionPredictor getDateNumDays:AfterDate:](self, "getDateNumDays:AfterDate:", v17, v40);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v52 = 0;
      }
      -[_PSInteractionPredictor interactionStore](self, "interactionStore");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "interactionMechanisms");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectAtIndexedSubscript:", v12);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bundleIds");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442C670);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "interactionCountMaxDepths");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v12;
      objc_msgSend(v20, "objectAtIndexedSubscript:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = 0;
      +[_PSInteractionStoreUtils interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:](_PSInteractionStoreUtils, "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:", v44, v52, v41, v43, 0, v18, 0, v42, v39, (int)objc_msgSend(v21, "intValue"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v22 = v46;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v54 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
            if (v8 && v8[2](v8, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i)))
            {
              +[_PSLogging generalChannel](_PSLogging, "generalChannel");
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v27;
              }
            }
            else
            {
              -[_PSInteractionPredictor getConversationIDFromInteraction:](self, "getConversationIDFromInteraction:", v27);
              v28 = objc_claimAutoreleasedReturnValue();
              if (v28)
                objc_msgSend(v6, "addObject:", v27);
            }

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        }
        while (v24);
      }

      objc_autoreleasePoolPop(context);
      v12 = v51 + 1;
      -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "interactionMechanisms");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

    }
    while (v31 > v51 + 1);
  }
  -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "interactionMechanisms");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34 <= 1)
  {
    v37 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v36);
    v37 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v37;
}

- (id)getConversationIDLogFromTrainArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[_PSInteractionPredictor getConversationIDFromInteraction:](self, "getConversationIDFromInteraction:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "startDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setValue:forKey:", v15, v12);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __62___PSInteractionPredictor_getConversationIDLogFromTrainArray___block_invoke;
  v26[3] = &unk_1E43FE928;
  v17 = v5;
  v27 = v17;
  objc_msgSend(v16, "sortedArrayUsingComparator:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  if (objc_msgSend(v18, "count"))
  {
    v20 = 0;
    do
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v22, v23);

      v24 = objc_msgSend(v18, "count");
      if (v20 > 3)
        break;
      ++v20;
    }
    while (v24 > v20);
  }

  return v19;
}

- (id)convertLogToClusterPointArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _PSClusterPoint *v11;
  _PSClusterPoint *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [_PSClusterPoint alloc];
        v12 = -[_PSClusterPoint initWithDate:](v11, "initWithDate:", v10, (_QWORD)v16);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  return v14;
}

- (id)getClusterDictionaryFromTrainArray:(id)a3 usingDBSCANParamsMinPts:(int)a4 andEps:(double)a5
{
  void *v8;
  _PSDBSCAN *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[_PSInteractionPredictor getConversationIDLogFromTrainArray:](self, "getConversationIDLogFromTrainArray:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_PSDBSCAN initWithMinimumPointsForClustering:MaxNeighborDistance:]([_PSDBSCAN alloc], "initWithMinimumPointsForClustering:MaxNeighborDistance:", a4, a5);
  v10 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
        -[_PSDBSCAN emptyCollections](v9, "emptyCollections", (_QWORD)v22);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSInteractionPredictor convertLogToClusterPointArray:](self, "convertLogToClusterPointArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSDBSCAN fitData:](v9, "fitData:", v18);

        -[_PSDBSCAN clusters](v9, "clusters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(v10, "setValue:forKey:", v20, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  return v10;
}

- (double)getMinDistanceForPt:(id)a3 toClusters:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = 14.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "convexHull");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "distanceToHull:", v12);
        v14 = v13;

        if (v14 < v10)
          v10 = v14;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 14.0;
  }

  return v10;
}

- (double)timeSinceLastContactTo:(id)a3 FromDate:(id)a4 inTrainArray:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = a5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  v12 = 4320.0;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[_PSInteractionPredictor getConversationIDFromInteraction:](self, "getConversationIDFromInteraction:", v16, (_QWORD)v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v8);

        if ((v18 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "startDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "components:fromDate:toDate:options:", 192, v20, v9, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = (double)objc_msgSend(v21, "minute");
          v12 = (double)objc_msgSend(v21, "second") / 60.0 + v22;

          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)getLastContactedDictionaryFromTrainArray:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v4, "count");
  if (v6 - 1 >= 0)
  {
    v7 = v6;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", --v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor getConversationIDFromInteraction:](self, "getConversationIDFromInteraction:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v9);
      }

    }
    while (v7 > 0);
  }

  return v5;
}

- (void)writeArchive:(id)a3 toFilePath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3 && v5)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v8)
    {
      v9 = v8;
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_PSInteractionPredictor writeArchive:toFilePath:].cold.3();
    }
    else
    {
      objc_msgSend(v6, "stringByDeletingLastPathComponent");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v15);
      v9 = v15;

      if (v9)
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[_PSInteractionPredictor writeArchive:toFilePath:].cold.2();
      }
      else
      {
        v14 = 0;
        objc_msgSend(v7, "writeToFile:options:error:", v6, 1, &v14);
        v9 = v14;
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v13 = objc_claimAutoreleasedReturnValue();
        v12 = v13;
        if (v9)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[_PSInteractionPredictor writeArchive:toFilePath:].cold.1();
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v6;
            _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "Successfully persisted dictionary: %@", buf, 0xCu);
          }
          v9 = 0;
        }
      }

    }
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Empty archive or filePath when trying to persist Cluster Dictionary", buf, 2u);
    }
  }

}

- (void)writeClusterArchiveFromClusterDict:(id)a3 withDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _PSClustersArchive *v11;

  v6 = a4;
  v7 = a3;
  v11 = -[_PSClustersArchive initWithClustersDictionary:archiveDate:]([_PSClustersArchive alloc], "initWithClustersDictionary:archiveDate:", v7, v6);

  -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionPredictor clustersArchiveFileForDate:modelName:](_PSInteractionPredictor, "clustersArchiveFileForDate:modelName:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSInteractionPredictor writeArchive:toFilePath:](self, "writeArchive:toFilePath:", v11, v10);
}

- (id)getDictionaryFromClustersArchiveAtPath:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  id v12;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", a3, 2, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    v6 = v5;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_PSInteractionPredictor getDictionaryFromClustersArchiveAtPath:].cold.2();
  }
  else
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v12);
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (!v6)
    {
      -[NSObject archiveDate](v7, "archiveDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor setCurrentArchiveDate:](self, "setCurrentArchiveDate:", v11);

      -[NSObject clustersDictionary](v7, "clustersDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSInteractionPredictor getDictionaryFromClustersArchiveAtPath:].cold.1();

  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (id)getOrMakeClusterDictionaryAtDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionPredictor clustersArchiveFileForDate:modelName:](_PSInteractionPredictor, "clustersArchiveFileForDate:modelName:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if ((_DWORD)v6)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "DBSCAN cluster dictionary read from archive", buf, 2u);
    }

    -[_PSInteractionPredictor getDictionaryFromClustersArchiveAtPath:](self, "getDictionaryFromClustersArchiveAtPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_PSInteractionPredictor getTrainArrayToDate:withStartDateAnchor:](self, "getTrainArrayToDate:withStartDateAnchor:", v4, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSInteractionPredictor getClusterDictionaryFromTrainArray:usingDBSCANParamsMinPts:andEps:](self, "getClusterDictionaryFromTrainArray:usingDBSCANParamsMinPts:andEps:", v11, 3, 1.2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSInteractionPredictor writeClusterArchiveFromClusterDict:withDate:](self, "writeClusterArchiveFromClusterDict:withDate:", v10, v4);
    -[_PSInteractionPredictor setCurrentArchiveDate:](self, "setCurrentArchiveDate:", v4);
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "DBSCAN cluster dictionary is generated", v14, 2u);
    }

  }
  return v10;
}

- (id)getRecencyResultsShowingNumValues:(int)a3 fromTrainArray:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    v8 = 0;
    while (1)
    {
      if (objc_msgSend(v6, "count") <= (unint64_t)v8)
        goto LABEL_10;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor getConversationIDFromInteraction:](self, "getConversationIDFromInteraction:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_8;
      if (!objc_msgSend(v7, "containsObject:", v10))
        break;
      ++v8;
LABEL_9:

      if (a3 <= 0)
        goto LABEL_10;
    }
    objc_msgSend(v7, "addObject:", v10);
LABEL_8:
    --a3;
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (id)getClusteringResultsForPoint:(id)a3 usingClusterDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _PSAlter *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v8);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9);
        v11 = -[_PSAlter initWithName:]([_PSAlter alloc], "initWithName:", v10);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v8, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v25;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16), "convexHull", v22);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "distanceToHull:", v17);
              v19 = v18;

              -[_PSAlter distanceToCluster](v11, "distanceToCluster");
              if (v20 > v19)
                -[_PSAlter setDistanceToCluster:](v11, "setDistanceToCluster:", v19);
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v14);
        }

        objc_msgSend(v7, "addObject:", v11);
        ++v9;
      }
      while (v9 != v23);
      v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global);
  return v7;
}

+ (BOOL)removeMlmodelcFolderAtPath:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  char v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v12))
    v5 = v12 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v7 = 1;
  }
  else
  {
    v11 = 0;
    objc_msgSend(v4, "removeItemAtPath:error:", v3, &v11);
    v6 = v11;
    v7 = v6 == 0;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[_PSInteractionPredictor removeMlmodelcFolderAtPath:].cold.1();

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Remove file succeeded at path:%@", buf, 0xCu);
      }
      v6 = v9;
    }

  }
  return v7;
}

+ (BOOL)cloneAdaptableModelURL:(id)a3 toFilePathURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[_PSInteractionPredictor removeMlmodelcFolderAtPath:](_PSInteractionPredictor, "removeMlmodelcFolderAtPath:", v7);

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v15 = 0;
    v10 = -[NSObject copyItemAtURL:toURL:error:](v9, "copyItemAtURL:toURL:error:", v5, v6, &v15);
    v11 = v15;
    if (v11)
      v10 = 0;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v10 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_1A07F4000, v13, OS_LOG_TYPE_INFO, "copying folder from path:%@ to path:%@ success.", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1A07F4000, v13, OS_LOG_TYPE_ERROR, "While cloning adaptable model, copying folder from path:%@ to path:%@ failed with error：%@", buf, 0x20u);
    }

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_PSInteractionPredictor cloneAdaptableModelURL:toFilePathURL:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (id)createMLArrayProviderFromTrainArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  _PSClusterPoint *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  NSObject *v57;
  void *v58;
  objc_class *v59;
  void *v60;
  _PSMLArrayProvider *v61;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  _BYTE v81[7];
  uint64_t v82;
  char v83;
  _BYTE v84[7];
  id v85;
  _QWORD v86[5];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 - 1 >= 0)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v75 = 0;
    v76 = 0;
    v77 = 0;
    v64 = 0;
    v65 = v4;
    while (1)
    {
      v9 = v6 - 1;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor getConversationIDFromInteraction:](self, "getConversationIDFromInteraction:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        break;
LABEL_42:

      v6 = v9;
      if (v9 <= 0)
        goto LABEL_45;
    }
    v78 = (void *)v11;
    v13 = v8;
    objc_msgSend(v10, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateByAddingTimeInterval:", -1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSInteractionPredictor getTrainArrayToDate:withStartDateAnchor:](self, "getTrainArrayToDate:withStartDateAnchor:", v15, v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v79 = (void *)v16;
    if (v6 == objc_msgSend(v4, "count"))
    {
      -[_PSInteractionPredictor getLastContactedDictionaryFromTrainArray:](self, "getLastContactedDictionaryFromTrainArray:", v16);
      v70 = objc_claimAutoreleasedReturnValue();

      -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "modelName");
      v73 = v10;
      v18 = v6 - 1;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor findLatestArchiveDateBefore:modelName:](self, "findLatestArchiveDateBefore:modelName:", v14, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      if (v20)
        v21 = (void *)v20;
      else
        v21 = v14;
      -[_PSInteractionPredictor getOrMakeClusterDictionaryAtDate:](self, "getOrMakeClusterDictionaryAtDate:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "dateByAddingTimeInterval:", 86400.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "modelName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor findLatestArchiveDateBefore:modelName:](self, "findLatestArchiveDateBefore:modelName:", v23, v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v4 = v65;
      v9 = v18;
      v10 = v73;
      -[_PSInteractionPredictor getOrMakeClusterDictionaryAtDate:](self, "getOrMakeClusterDictionaryAtDate:", v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v76 = (void *)v27;
      v77 = (void *)v26;
      v75 = (void *)v20;
      v8 = (void *)v22;
      v7 = (void *)v70;
    }
    else
    {
      v8 = v13;
    }
    v12 = v78;
    if (objc_msgSend(v10, "direction") != 1)
    {
      objc_msgSend(v7, "setObject:forKey:", v14, v78);
      v30 = v79;
LABEL_41:

      goto LABEL_42;
    }
    -[_PSInteractionPredictor getRecencyResultsShowingNumValues:fromTrainArray:](self, "getRecencyResultsShowingNumValues:fromTrainArray:", 5, v79);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v71, "containsObject:", v78);
    objc_msgSend(v14, "timeIntervalSinceDate:", v77);
    v72 = v9;
    if (v28 >= 0.0)
    {
      -[_PSInteractionPredictor currentArchiveDate](self, "currentArchiveDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v31);
      v33 = v32;

      if (v33 >= 0.0)
      {
        -[_PSInteractionPredictor currentClusterDictionary](self, "currentClusterDictionary");
        v29 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = v76;
      }
    }
    else
    {
      v29 = v8;
    }
    v34 = v29;
    objc_msgSend(v29, "objectForKey:", v78);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = v34;
    if (v35)
    {
      v36 = -[_PSClusterPoint initWithDate:]([_PSClusterPoint alloc], "initWithDate:", v14);
      objc_msgSend(v34, "objectForKeyedSubscript:", v78);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSInteractionPredictor getMinDistanceForPt:toClusters:](self, "getMinDistanceForPt:toClusters:", v36, v37);
      v39 = v38;

    }
    else
    {
      v39 = 14.0;
    }
    v74 = v8;
    objc_msgSend(v7, "objectForKey:", v78);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 4320.0;
    if (v40)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v78);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v42);
      v41 = v43 / 60.0;

    }
    v67 = v7;

    v44 = objc_alloc((Class)getMLMultiArrayClass());
    v85 = 0;
    v45 = (void *)objc_msgSend(v44, "initWithShape:dataType:error:", &unk_1E442C688, 65600, &v85);
    v66 = v85;
    if (v66)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[_PSInteractionPredictor createMLArrayProviderFromTrainArray:].cold.2(&v83, v84);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:atIndexedSubscript:", v47, 0);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:atIndexedSubscript:", v48, 1);

    objc_msgSend(getMLFeatureValueClass(), "featureValueWithMultiArray:", v45);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v49;
    if (v35)
      v51 = v68;
    else
      v51 = 1;
    if ((v51 & 1) != 0)
    {
      v30 = v79;
      if (!v68)
      {
        v53 = (void *)v49;
        v52 = 0;
        goto LABEL_40;
      }
      objc_msgSend(getMLFeatureValueClass(), "featureValueWithString:", CFSTR("recency"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v64) = v64 + 1;
      if (!v52)
      {
LABEL_32:
        v53 = v50;
LABEL_40:
        objc_msgSend(v67, "setObject:forKey:", v14, v78);

        v7 = v67;
        v9 = v72;
        v8 = v74;
        goto LABEL_41;
      }
    }
    else
    {
      objc_msgSend(getMLFeatureValueClass(), "featureValueWithString:", CFSTR("clustering"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      ++HIDWORD(v64);
      v30 = v79;
      if (!v52)
        goto LABEL_32;
    }
    v54 = (void *)objc_opt_new();
    v53 = v50;
    objc_msgSend(v54, "setObject:forKey:", v50, CFSTR("input1"));
    objc_msgSend(v54, "setObject:forKey:", v52, CFSTR("classLabel"));
    v55 = objc_alloc((Class)getMLDictionaryFeatureProviderClass());
    v82 = 0;
    v56 = (void *)objc_msgSend(v55, "initWithDictionary:error:", v54, &v82);
    if (v82)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        -[_PSInteractionPredictor createMLArrayProviderFromTrainArray:].cold.1(&v80, v81);

    }
    objc_msgSend(v63, "addObject:", v56);

    v4 = v65;
    v30 = v79;
    goto LABEL_40;
  }
  v64 = 0;
  v76 = 0;
  v77 = 0;
  v75 = 0;
  v8 = 0;
  v7 = 0;
LABEL_45:
  v87 = 0;
  v88 = &v87;
  v89 = 0x2050000000;
  v58 = (void *)getMLArrayBatchProviderClass_softClass;
  v90 = getMLArrayBatchProviderClass_softClass;
  if (!getMLArrayBatchProviderClass_softClass)
  {
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __getMLArrayBatchProviderClass_block_invoke;
    v86[3] = &unk_1E43FEA00;
    v86[4] = &v87;
    __getMLArrayBatchProviderClass_block_invoke((uint64_t)v86);
    v58 = (void *)v88[3];
  }
  v59 = objc_retainAutorelease(v58);
  _Block_object_dispose(&v87, 8);
  v60 = (void *)objc_msgSend([v59 alloc], "initWithFeatureProviderArray:", v63);
  v61 = -[_PSMLArrayProvider initWithProvider:clusteringCount:recencyCount:]([_PSMLArrayProvider alloc], "initWithProvider:clusteringCount:recencyCount:", v60, HIDWORD(v64), v64);

  return v61;
}

- (void)printModelWeights:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)getMLParameterKeyClass_softClass;
  v17 = getMLParameterKeyClass_softClass;
  if (!getMLParameterKeyClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getMLParameterKeyClass_block_invoke;
    v13[3] = &unk_1E43FEA00;
    v13[4] = &v14;
    __getMLParameterKeyClass_block_invoke((uint64_t)v13);
    v4 = (void *)v15[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v5, "weights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopedTo:", CFSTR("dense_1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(v3, "parameterValueForKey:error:", v7, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v11)
      -[_PSInteractionPredictor printModelWeights:].cold.2();
  }
  else if (v11)
  {
    -[_PSInteractionPredictor printModelWeights:].cold.1(v8, v10);
  }

}

- (void)trainAtDate:(id)a3 usingCompiledModelURL:(id)a4 andSaveToURL:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _PSInteractionPredictor *v30;
  _QWORD *v31;
  uint64_t *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  dispatch_semaphore_t v39;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  uint64_t v43;
  Class (*v44)(uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v8 = a3;
  v26 = a4;
  v9 = a5;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy_;
  v40[4] = __Block_byref_object_dispose_;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = dispatch_semaphore_create(0);
  -[_PSInteractionPredictor getTrainArrayToDate:withStartDateAnchor:](self, "getTrainArrayToDate:withStartDateAnchor:", v8, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSInteractionPredictor getClusterDictionaryFromTrainArray:usingDBSCANParamsMinPts:andEps:](self, "getClusterDictionaryFromTrainArray:usingDBSCANParamsMinPts:andEps:", v10, 3, 1.2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSInteractionPredictor writeClusterArchiveFromClusterDict:withDate:](self, "writeClusterArchiveFromClusterDict:withDate:", v11, v8);

  -[_PSInteractionPredictor createMLArrayProviderFromTrainArray:](self, "createMLArrayProviderFromTrainArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "MLArrayProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke;
  v33[3] = &unk_1E43FE970;
  v33[4] = self;
  v14 = (void *)MEMORY[0x1A1AFCBF8](v33);
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_103;
  v28[3] = &unk_1E43FE998;
  v15 = v9;
  v29 = v15;
  v30 = self;
  v31 = v40;
  v32 = &v34;
  v16 = (void *)MEMORY[0x1A1AFCBF8](v28);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v17 = (void *)getMLUpdateProgressHandlersClass_softClass;
  v50 = getMLUpdateProgressHandlersClass_softClass;
  if (!getMLUpdateProgressHandlersClass_softClass)
  {
    v42 = v13;
    v43 = 3221225472;
    v44 = __getMLUpdateProgressHandlersClass_block_invoke;
    v45 = &unk_1E43FEA00;
    v46 = &v47;
    __getMLUpdateProgressHandlersClass_block_invoke((uint64_t)&v42);
    v17 = (void *)v48[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v47, 8);
  v19 = (void *)objc_msgSend([v18 alloc], "initForEvents:progressHandler:completionHandler:", 3, v14, v16);
  if (v12 && (int)objc_msgSend(v12, "clusteringCount") >= 1 && (int)objc_msgSend(v12, "recencyCount") >= 1)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x2050000000;
    v20 = (void *)getMLUpdateTaskClass_softClass;
    v50 = getMLUpdateTaskClass_softClass;
    if (!getMLUpdateTaskClass_softClass)
    {
      v42 = v13;
      v43 = 3221225472;
      v44 = __getMLUpdateTaskClass_block_invoke;
      v45 = &unk_1E43FEA00;
      v46 = &v47;
      __getMLUpdateTaskClass_block_invoke((uint64_t)&v42);
      v20 = (void *)v48[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v47, 8);
    v27 = 0;
    objc_msgSend(v21, "updateTaskForModelAtURL:trainingData:progressHandlers:error:", v26, v25, v19, &v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v27;
    if (v23)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_PSInteractionPredictor trainAtDate:usingCompiledModelURL:andSaveToURL:].cold.1();

    }
    objc_msgSend(v22, "resume");

  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)v35[5]);
    v23 = 0;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)v35[5], 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v40, 8);

}

- (id)predictAtDate:(id)a3 usingModelAtURL:(id)a4 showNumSuggestions:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _PSClusterPoint *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  void *v29;
  __objc2_class **v30;
  uint64_t j;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  double v38;
  double v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  double v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  int v77;
  _PSClusterPoint *v78;
  id v79;
  void *v80;
  void *v81;
  id obj;
  uint64_t v83;
  _PSInteractionPredictor *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *context;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  char v99;
  _BYTE v100[7];
  id v101;
  char v102;
  _BYTE v103[7];
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  uint8_t v114[128];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  void *v118;
  _BYTE v119[128];
  uint8_t v120[4];
  uint64_t v121;
  _BYTE v122[128];
  uint64_t v123;

  v5 = *(_QWORD *)&a5;
  v123 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v8;
  -[_PSInteractionPredictor getTrainArrayToDate:withStartDateAnchor:](self, "getTrainArrayToDate:withStartDateAnchor:", v8, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:].cold.6();

  if (objc_msgSend(v12, "count"))
  {
    v85 = v12;
    -[_PSInteractionPredictor getRecencyResultsShowingNumValues:fromTrainArray:](self, "getRecencyResultsShowingNumValues:fromTrainArray:", v5, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:].cold.5();

    -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "modelType");

    if (v17 == 1)
    {
      v18 = v14;
    }
    else
    {
      v77 = v5;
      v89 = v14;
      v79 = v9;
      v19 = -[_PSClusterPoint initWithDate:]([_PSClusterPoint alloc], "initWithDate:", v86);
      -[_PSInteractionPredictor currentClusterDictionary](self, "currentClusterDictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v19;
      -[_PSInteractionPredictor getClusteringResultsForPoint:usingClusterDictionary:](self, "getClusteringResultsForPoint:usingClusterDictionary:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v110;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v110 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:].cold.4(v120, v27, &v121, v28);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        }
        while (v24);
      }
      v84 = self;
      v80 = v11;
      v81 = v10;

      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      obj = v22;
      v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
      if (v87)
      {
        v88 = 0;
        v83 = *(_QWORD *)v106;
        v29 = v85;
        v30 = off_1E43FD000;
        do
        {
          for (j = 0; j != v87; ++j)
          {
            if (*(_QWORD *)v106 != v83)
              objc_enumerationMutation(obj);
            v32 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
            context = (void *)MEMORY[0x1A1AFCA24]();
            v33 = objc_alloc((Class)getMLMultiArrayClass());
            v104 = 0;
            v34 = (void *)objc_msgSend(v33, "initWithShape:dataType:error:", &unk_1E442C6A0, 65600, &v104);
            v35 = v104;
            if (v35)
            {
              -[__objc2_class generalChannel](v30[8], "generalChannel");
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:].cold.3(&v102, v103);

            }
            objc_msgSend(v89, "objectAtIndexedSubscript:", 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSInteractionPredictor timeSinceLastContactTo:FromDate:inTrainArray:](v84, "timeSinceLastContactTo:FromDate:inTrainArray:", v37, v86, v29);
            v39 = v38;

            objc_msgSend(v32, "setTimeSinceLastContact:", v39);
            -[__objc2_class generalChannel](v30[8], "generalChannel");
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "name");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v116 = v55;
              v117 = 2112;
              v118 = v56;
              _os_log_debug_impl(&dword_1A07F4000, v40, OS_LOG_TYPE_DEBUG, "Feature to LR: timeSinceContact: %@ for alter %@", buf, 0x16u);

              v30 = off_1E43FD000;
            }

            -[__objc2_class generalChannel](v30[8], "generalChannel");
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v57 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v32, "distanceToCluster");
              objc_msgSend(v57, "numberWithDouble:");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "name");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v116 = v58;
              v117 = 2112;
              v118 = v59;
              _os_log_debug_impl(&dword_1A07F4000, v41, OS_LOG_TYPE_DEBUG, "Feature to LR: distanceToCluster: %@ for alter %@", buf, 0x16u);

              v30 = off_1E43FD000;
            }

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:atIndexedSubscript:", v42, 0);

            v43 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v32, "distanceToCluster");
            objc_msgSend(v43, "numberWithDouble:");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:atIndexedSubscript:", v44, 1);

            objc_msgSend(getMLFeatureValueClass(), "featureValueWithMultiArray:", v34);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)objc_opt_new();
            objc_msgSend(v46, "setObject:forKey:", v45, CFSTR("input1"));
            v47 = objc_alloc((Class)getMLDictionaryFeatureProviderClass());
            v101 = 0;
            v48 = (void *)objc_msgSend(v47, "initWithDictionary:error:", v46, &v101);
            v49 = v101;
            if (v49)
            {
              -[__objc2_class generalChannel](v30[8], "generalChannel");
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:].cold.2(&v99, v100);

              v30 = off_1E43FD000;
            }
            objc_msgSend(v32, "distanceToCluster");
            if (v51 >= 12.0)
            {
              objc_msgSend(v32, "name");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v89, "containsObject:", v53);

              if (v54)
              {
                objc_msgSend(v80, "addObject:", v32);
                ++v88;
              }
              v29 = v85;
              v30 = off_1E43FD000;
            }
            else
            {
              if (v88 < v77 - 1)
              {
                objc_msgSend(v32, "name");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "addObject:", v52);

                ++v88;
              }
              v29 = v85;
            }

            objc_autoreleasePoolPop(context);
          }
          v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
        }
        while (v87);
      }
      else
      {
        v88 = 0;
      }

      -[_PSInteractionPredictor modelConfiguration](v84, "modelConfiguration");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "modelType");

      v11 = v80;
      v10 = v81;
      v14 = v89;
      if (v61 != 2)
      {
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v62 = v89;
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
        v64 = v88;
        if (v63)
        {
          v65 = v63;
          v66 = *(_QWORD *)v96;
          do
          {
            for (k = 0; k != v65; ++k)
            {
              if (*(_QWORD *)v96 != v66)
                objc_enumerationMutation(v62);
              v68 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * k);
              if ((objc_msgSend(v81, "containsObject:", v68) & 1) == 0
                && !objc_msgSend(v80, "containsObject:", v68)
                || objc_msgSend(v80, "containsObject:", v68))
              {
                objc_msgSend(v81, "addObject:", v68);
              }
            }
            v65 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
          }
          while (v65);
        }

        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v69 = v85;
        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v91, v113, 16);
        if (v70)
        {
          v71 = v70;
          v72 = *(_QWORD *)v92;
LABEL_60:
          v73 = 0;
          while (1)
          {
            if (*(_QWORD *)v92 != v72)
              objc_enumerationMutation(v69);
            if (v64 == v77)
              break;
            -[_PSInteractionPredictor getConversationIDFromInteraction:](v84, "getConversationIDFromInteraction:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v73));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (v74 && (objc_msgSend(v81, "containsObject:", v74) & 1) == 0)
            {
              objc_msgSend(v81, "addObject:", v74);
              ++v64;
            }

            if (v71 == ++v73)
            {
              v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v91, v113, 16);
              if (v71)
                goto LABEL_60;
              break;
            }
          }
        }

        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:].cold.1();

        v14 = v89;
      }
      v18 = v81;

      v9 = v79;
    }
    v12 = v85;

  }
  else
  {
    v18 = (id)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

- (id)rankedZkwSuggestionsFromPredictionArray:(id)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  _PSRecipient *v29;
  void *v30;
  void *v31;
  void *v32;
  _PSRecipient *v33;
  _PSSuggestion *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  _PSSuggestion *v47;
  void *v48;
  void *v49;
  id obj;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  _PSInteractionPredictor *v56;
  uint64_t v57;
  _PSSuggestion *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v54 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "modelType");

    if (v10 > 2)
      v11 = &stru_1E4402490;
    else
      v11 = off_1E43FEA38[v10];
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[_PSInteractionPredictor modelConfiguration](self, "modelConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "modelName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@"), v14, v11);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v6;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v57)
  {
    v55 = *(_QWORD *)v67;
    v56 = self;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v67 != v55)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v15);
        -[_PSInteractionPredictor conversationIDMap](self, "conversationIDMap");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v59 = v15;
          -[_PSInteractionPredictor conversationIDMap](self, "conversationIDMap");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v16;
          objc_msgSend(v19, "objectForKeyedSubscript:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "recipients");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v23 = v21;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v63;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v63 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                v29 = [_PSRecipient alloc];
                objc_msgSend(v28, "identifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "handle");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "displayName");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v29, "initWithIdentifier:handle:displayName:contact:", v30, v31, v32, 0);

                objc_msgSend(v22, "addObject:", v33);
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
            }
            while (v25);
          }

          v34 = [_PSSuggestion alloc];
          self = v56;
          -[_PSInteractionPredictor conversationIDMap](v56, "conversationIDMap");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v61);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "groupName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](v34, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", v54, v61, v37, v22, v52, 0);

          if (rankedZkwSuggestionsFromPredictionArray_forBundleID___pasOnceToken45 != -1)
            dispatch_once(&rankedZkwSuggestionsFromPredictionArray_forBundleID___pasOnceToken45, &__block_literal_global_122);
          v38 = (id)rankedZkwSuggestionsFromPredictionArray_forBundleID___pasExprOnceResult;
          -[_PSInteractionPredictor conversationIDMap](v56, "conversationIDMap");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", v61);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "bundleId");
          v41 = objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v42 = (void *)v41;
            -[_PSInteractionPredictor conversationIDMap](v56, "conversationIDMap");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", v61);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "bundleId");
            v60 = v38;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v60, "containsObject:", v45);

            v38 = v60;
            self = v56;

            v47 = v58;
            v15 = v59;
            if (v46)
            {
              -[_PSInteractionPredictor conversationIDMap](v56, "conversationIDMap");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", v61);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "account");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSSuggestion setMessagesGroupIdentifier:](v58, "setMessagesGroupIdentifier:", v48);

              v38 = v60;
              goto LABEL_26;
            }
          }
          else
          {
            v47 = v58;
            v15 = v59;
LABEL_26:

          }
          objc_msgSend(v53, "addObject:", v47);

        }
        ++v15;
      }
      while (v15 != v57);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v57);
  }

  v49 = (void *)objc_msgSend(v53, "copy");
  return v49;
}

+ (void)deleteArchiveFileAtDate:(id)a3 modelName:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionPredictor clustersArchiveFileForDate:modelName:](_PSInteractionPredictor, "clustersArchiveFileForDate:modelName:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "fileExistsAtPath:", v9))
  {
    v13 = 0;
    objc_msgSend(v8, "removeItemAtPath:error:", v9, &v13);
    v10 = v13;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[_PSInteractionPredictor deleteArchiveFileAtDate:modelName:].cold.2();
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      +[_PSInteractionPredictor deleteArchiveFileAtDate:modelName:].cold.1();
    }

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[_PSInteractionPredictor deleteArchiveFileAtDate:modelName:].cold.3();
  }

}

+ (void)deleteArchiveFiles
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionPredictor defaultClustersArchiveDirectory](_PSInteractionPredictor, "defaultClustersArchiveDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    *(_QWORD *)&v6 = 138412290;
    v15 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "stringByAppendingPathComponent:", v10, v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        objc_msgSend(v2, "removeItemAtPath:error:", v11, &v16);
        v12 = v16;

        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v22 = v10;
            v23 = 2112;
            v24 = v12;
            _os_log_error_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_ERROR, "error in deleting file %@: %@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v15;
          v22 = v10;
          _os_log_debug_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_DEBUG, "file deleted: %@", buf, 0xCu);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v7);
  }

}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void)setInteractionStore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionStore, a3);
}

- (NSDictionary)currentClusterDictionary
{
  return self->_currentClusterDictionary;
}

- (void)setCurrentClusterDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_currentClusterDictionary, a3);
}

- (NSDate)currentArchiveDate
{
  return self->_currentArchiveDate;
}

- (void)setCurrentArchiveDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentArchiveDate, a3);
}

- (NSMutableDictionary)conversationIDMap
{
  return self->_conversationIDMap;
}

- (void)setConversationIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_conversationIDMap, a3);
}

- (_PSKNNModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (void)setModelConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_modelConfiguration, a3);
}

- (NSURL)compiledModelURL
{
  return self->_compiledModelURL;
}

- (void)setCompiledModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_compiledModelURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compiledModelURL, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_conversationIDMap, 0);
  objc_storeStrong((id *)&self->_currentArchiveDate, 0);
  objc_storeStrong((id *)&self->_currentClusterDictionary, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
}

+ (void)loadModelFromUrl:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_1A07F4000, v0, OS_LOG_TYPE_DEBUG, "model loaded", v1, 2u);
  OUTLINED_FUNCTION_9();
}

+ (void)loadModelFromUrl:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1A07F4000, a3, OS_LOG_TYPE_ERROR, "Error loading compiled CoreML Model from path %@ : %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_7();
}

+ (void)loadModelFromUrl:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_DEBUG, "compiledURL %@ : %@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_7();
}

- (void)writeArchive:toFilePath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "Error when trying to persist dictionary: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)writeArchive:toFilePath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "error in creating subdirectory at path: %@ with error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)writeArchive:toFilePath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1A07F4000, v0, v1, "error in archiving.", v2);
  OUTLINED_FUNCTION_9();
}

- (void)getDictionaryFromClustersArchiveAtPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1A07F4000, v0, v1, "Error with unarchiving clustersArchive data.", v2);
  OUTLINED_FUNCTION_9();
}

- (void)getDictionaryFromClustersArchiveAtPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1A07F4000, v0, v1, "Error with reading from Archive for Cluster Dictionary.", v2);
  OUTLINED_FUNCTION_9();
}

+ (void)removeMlmodelcFolderAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "Remove file failed at path:%@, with error：%@");
  OUTLINED_FUNCTION_1();
}

+ (void)cloneAdaptableModelURL:toFilePathURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1A07F4000, v0, v1, "While cloning adaptable model, removing existing file failed", v2);
  OUTLINED_FUNCTION_9();
}

- (void)createMLArrayProviderFromTrainArray:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_1A07F4000, v2, (uint64_t)v2, "error converting dictionary to MLDictionaryFeatureProvider.", v3);
}

- (void)createMLArrayProviderFromTrainArray:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_1A07F4000, v2, (uint64_t)v2, "error intializing MLMultiArray.", v3);
}

- (void)printModelWeights:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "numberArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, v4, "weights are %@", v5);

}

- (void)printModelWeights:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "error in printing weights, %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)trainAtDate:usingCompiledModelURL:andSaveToURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "Error for update task: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)predictAtDate:usingModelAtURL:showNumSuggestions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "results %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)predictAtDate:(_BYTE *)a1 usingModelAtURL:(_BYTE *)a2 showNumSuggestions:.cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_1A07F4000, v2, (uint64_t)v2, "input error converting dictionary to MLDictionaryFeatureProvider", v3);
}

- (void)predictAtDate:(_BYTE *)a1 usingModelAtURL:(_BYTE *)a2 showNumSuggestions:.cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_1A07F4000, v2, (uint64_t)v2, "error intializing MLMultiArray", v3);
}

- (void)predictAtDate:(_QWORD *)a3 usingModelAtURL:(NSObject *)a4 showNumSuggestions:.cold.4(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A07F4000, a4, OS_LOG_TYPE_DEBUG, "clusteringPredictions %@", a1, 0xCu);

}

- (void)predictAtDate:usingModelAtURL:showNumSuggestions:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "recencyPredictions %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)predictAtDate:usingModelAtURL:showNumSuggestions:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "trainArray %{sensitive}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)deleteArchiveFileAtDate:modelName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "file deleted: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)deleteArchiveFileAtDate:modelName:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "error in deleting file %@: %@");
  OUTLINED_FUNCTION_1();
}

+ (void)deleteArchiveFileAtDate:modelName:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1A07F4000, v0, v1, "path does not exist", v2);
  OUTLINED_FUNCTION_9();
}

@end
