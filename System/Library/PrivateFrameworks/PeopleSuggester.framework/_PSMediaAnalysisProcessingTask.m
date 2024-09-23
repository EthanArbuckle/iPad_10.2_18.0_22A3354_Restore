@implementation _PSMediaAnalysisProcessingTask

- (_PSMediaAnalysisProcessingTask)initWithBookmark:(id)a3 interactionStore:(id)a4
{
  id v7;
  id v8;
  _PSMediaAnalysisProcessingTask *v9;
  id v10;
  uint64_t v11;
  NSXPCConnection *connection;
  void *v13;
  _CDInteractionStore *v14;
  _CDInteractionStore *interactionStore;
  void *v16;
  id v17;
  uint64_t v18;
  MADPersonIdentificationRequest *personIdentificationRequest;
  void *v20;
  uint64_t v21;
  NSString *mediaAnalysisConfigurationPath;
  objc_super v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_PSMediaAnalysisProcessingTask;
  v9 = -[_PSMediaAnalysisProcessingTask init](&v24, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v11 = objc_msgSend(v10, "initWithMachServiceName:options:", *MEMORY[0x1E0D15B18], 4096);
    connection = v9->_connection;
    v9->_connection = (NSXPCConnection *)v11;

    _CDInteractionNSXPCInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v9->_connection, "setRemoteObjectInterface:", v13);

    if (v8)
    {
      v14 = (_CDInteractionStore *)v8;
    }
    else
    {
      +[_PSMediaAnalysisProcessingTask interactionStore](_PSMediaAnalysisProcessingTask, "interactionStore");
      v14 = (_CDInteractionStore *)objc_claimAutoreleasedReturnValue();
    }
    interactionStore = v9->_interactionStore;
    v9->_interactionStore = v14;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v16 = (void *)getMADPersonIdentificationRequestClass_softClass_0;
    v29 = getMADPersonIdentificationRequestClass_softClass_0;
    if (!getMADPersonIdentificationRequestClass_softClass_0)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __getMADPersonIdentificationRequestClass_block_invoke_0;
      v25[3] = &unk_1E43FEA00;
      v25[4] = &v26;
      __getMADPersonIdentificationRequestClass_block_invoke_0((uint64_t)v25);
      v16 = (void *)v27[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v26, 8);
    v18 = objc_opt_new();
    personIdentificationRequest = v9->_personIdentificationRequest;
    v9->_personIdentificationRequest = (MADPersonIdentificationRequest *)v18;

    -[MADPersonIdentificationRequest setMaximumFaceCount:](v9->_personIdentificationRequest, "setMaximumFaceCount:", 4);
    -[MADPersonIdentificationRequest setAllowOnDemand:](v9->_personIdentificationRequest, "setAllowOnDemand:", 1);
    -[MADPersonIdentificationRequest setAllowUnverifiedIdentity:](v9->_personIdentificationRequest, "setAllowUnverifiedIdentity:", 1);
    objc_storeStrong((id *)&v9->_bookmark, a3);
    objc_msgSend(MEMORY[0x1E0D15900], "peopleDirectory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("MediaAnalysisProcessing"));
    v21 = objc_claimAutoreleasedReturnValue();
    mediaAnalysisConfigurationPath = v9->_mediaAnalysisConfigurationPath;
    v9->_mediaAnalysisConfigurationPath = (NSString *)v21;

    -[NSXPCConnection resume](v9->_connection, "resume");
  }

  return v9;
}

+ (id)interactionStore
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D158E0];
  objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeWithDirectory:readOnly:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setReadConcurrently:", 1);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_PSMediaAnalysisProcessingTask;
  -[_PSMediaAnalysisProcessingTask dealloc](&v3, sel_dealloc);
}

- (void)executeTaskWithCompletionHandler:(id)a3
{
  _CDInteractionStore *interactionStore;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSDate *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDate *v21;
  NSDate *v22;
  NSDate *bookmark;
  NSDate *v24;
  NSDate *v25;
  void *v26;
  void (**v27)(void);
  void *v28;
  void *v29;
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE buf[24];
  char v37;
  _BYTE v38[128];
  _QWORD v39[4];

  v39[1] = *MEMORY[0x1E0C80C00];
  v27 = (void (**)(void))a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_43);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate > %@ AND direction == %@ AND mechanism IN %@"), self->_bookmark, &unk_1E442B618, &unk_1E442CE08);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  interactionStore = self->_interactionStore;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:](interactionStore, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", v26, v6, -1, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v28, "count") == 0;
  +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      bookmark = self->_bookmark;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = bookmark;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, "No interactions to process for %{public}@-now. Returning.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v25 = self->_bookmark;
    self->_bookmark = v24;

    -[_PSMediaAnalysisProcessingTask saveBookmark](self, "saveBookmark");
    goto LABEL_27;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v28, "count");
    v11 = self->_bookmark;
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Fetched %tu interactions for media analysis (Interval: %{public}@ - now)", buf, 0x16u);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v28;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (!v13)
    goto LABEL_26;
  v14 = *(_QWORD *)v32;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v32 != v14)
        objc_enumerationMutation(v12);
      v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      if ((objc_msgSend(v16, "forcePersistInteraction") & 1) == 0)
        objc_msgSend(v16, "setForcePersistInteraction:", 1);
      objc_msgSend(v16, "attachments");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[_PSMediaAnalysisProcessingTask skipAttachmentProcessing:](self, "skipAttachmentProcessing:", v17))
      {
        if (!-[_PSMediaAnalysisProcessingTask attachmentsContainsPersonId:](self, "attachmentsContainsPersonId:", v17))
        {
          objc_msgSend(v16, "bundleId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSMediaAnalysisProcessingTask updatedAttachmentsWithPeopleIdForAttachments:forBundleID:](self, "updatedAttachmentsWithPeopleIdForAttachments:forBundleID:", v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19 || !objc_msgSend(v19, "count"))
          {

            goto LABEL_19;
          }
          objc_msgSend(v16, "setAttachments:", v19);

        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v37 = 0;
        v35 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __67___PSMediaAnalysisProcessingTask_executeTaskWithCompletionHandler___block_invoke_241;
        v30[3] = &unk_1E4401F48;
        v30[4] = v16;
        v30[5] = buf;
        objc_msgSend(v29, "updateInteractions:enforceDataLimits:enforcePrivacy:reply:", v20, 0, 0, v30);

        if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          _Block_object_dispose(buf, 8);

          goto LABEL_26;
        }
        objc_msgSend(v16, "startDate");
        v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
        v22 = self->_bookmark;
        self->_bookmark = v21;

        -[_PSMediaAnalysisProcessingTask saveBookmark](self, "saveBookmark");
        _Block_object_dispose(buf, 8);
      }
LABEL_19:

    }
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v13)
      continue;
    break;
  }
LABEL_26:

LABEL_27:
  if (v27)
    v27[2]();

}

- (id)updatedAttachmentsWithPeopleIdForAttachments:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  char v69;
  void *v70;
  id v71;
  void *v72;
  id v74;
  id obj;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  os_log_t oslog;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  MADPersonIdentificationRequest *v112;
  MADPersonIdentificationRequest *personIdentificationRequest;
  uint8_t v114[128];
  _BYTE buf[24];
  void *v116;
  uint64_t *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v83 = (void *)objc_opt_new();
  v76 = (void *)objc_opt_new();
  v104 = 0;
  v70 = v6;
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v104);
  v71 = v104;
  v8 = v72;
  if (!v72)
  {
    +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_PSPhotoSuggestions peopleInSharedPhotoAttachments:forBundleID:shouldUseMDID:withCompletion:].cold.1((uint64_t)v71, v9, v10);

    v8 = 0;
  }
  v11 = objc_msgSend(v8, "developerType");
  +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11 == 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "Attachments %@, isFirstParty: %@", buf, 0x16u);

  }
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v5;
  v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
  if (!v78)
  {

    goto LABEL_69;
  }
  v69 = 0;
  v77 = *(_QWORD *)v101;
  do
  {
    for (i = 0; i != v78; ++i)
    {
      if (*(_QWORD *)v101 != v77)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
      objc_msgSend(v83, "addObject:", v14);
      objc_msgSend(v14, "photoLocalIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (!v16)
      {
        objc_msgSend(v14, "photoLocalIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v76, "containsObject:", v17);

        if ((v18 & 1) == 0)
        {
          objc_msgSend(v14, "contentURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19
            && (objc_msgSend(v14, "contentURL"),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                v21 = objc_msgSend(v20, "isFileURL"),
                v20,
                v19,
                v21))
          {
            +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, "Fetching attachment info from fileURL", buf, 2u);
            }

            objc_msgSend(getMADServiceClass(), "service");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            personIdentificationRequest = self->_personIdentificationRequest;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &personIdentificationRequest, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "contentURL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "photoLocalIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = 0;
            v27 = objc_msgSend(v23, "performRequests:onImageURL:withIdentifier:error:", v24, v25, v26, &v99);
            v74 = v99;

            if ((v27 & 1) == 0)
              goto LABEL_19;
LABEL_28:
            objc_msgSend(v14, "photoLocalIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              objc_msgSend(v14, "photoLocalIdentifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "addObject:", v40);

            }
            -[MADPersonIdentificationRequest results](self->_personIdentificationRequest, "results");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v14, "photoLocalIdentifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v41, "count");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v43;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v44;
              _os_log_impl(&dword_1A07F4000, v42, OS_LOG_TYPE_INFO, "For PhotoId: %@, fetched %tu photo results", buf, 0x16u);

            }
            v96 = 0u;
            v97 = 0u;
            v94 = 0u;
            v95 = 0u;
            oslog = v41;
            v82 = -[NSObject countByEnumeratingWithState:objects:count:](oslog, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
            if (v82)
            {
              v81 = *(_QWORD *)v95;
              do
              {
                v45 = 0;
                do
                {
                  if (*(_QWORD *)v95 != v81)
                  {
                    v46 = v45;
                    objc_enumerationMutation(oslog);
                    v45 = v46;
                  }
                  v84 = v45;
                  v85 = *(id *)(*((_QWORD *)&v94 + 1) + 8 * v45);
                  +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
                  v47 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v14, "photoLocalIdentifier");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "resultItems");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v50 = objc_msgSend(v49, "count");
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v48;
                    *(_WORD *)&buf[12] = 2048;
                    *(_QWORD *)&buf[14] = v50;
                    _os_log_impl(&dword_1A07F4000, v47, OS_LOG_TYPE_INFO, "PhotoId: %@ has %tu personId", buf, 0x16u);

                  }
                  v92 = 0u;
                  v93 = 0u;
                  v90 = 0u;
                  v91 = 0u;
                  objc_msgSend(v85, "resultItems");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
                  if (v52)
                  {
                    v53 = *(_QWORD *)v91;
                    do
                    {
                      for (j = 0; j != v52; ++j)
                      {
                        if (*(_QWORD *)v91 != v53)
                          objc_enumerationMutation(v51);
                        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * j), "personIdentifier");
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v55)
                        {
                          objc_msgSend(v7, "addObject:", v55);
                          +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
                          v56 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                          {
                            objc_msgSend(v14, "photoLocalIdentifier");
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412547;
                            *(_QWORD *)&buf[4] = v57;
                            *(_WORD *)&buf[12] = 2113;
                            *(_QWORD *)&buf[14] = v55;
                            _os_log_impl(&dword_1A07F4000, v56, OS_LOG_TYPE_INFO, "PhotoId: %@, adding personIdentifier: %{private}@", buf, 0x16u);

                          }
                        }

                      }
                      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
                    }
                    while (v52);
                  }

                  v45 = v84 + 1;
                }
                while (v84 + 1 != v82);
                v82 = -[NSObject countByEnumeratingWithState:objects:count:](oslog, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
              }
              while (v82);
            }

            +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v14, "photoLocalIdentifier");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v59;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v7;
              _os_log_impl(&dword_1A07F4000, v58, OS_LOG_TYPE_INFO, "PhotoId: %@, asset identifiers %@", buf, 0x16u);

            }
            if (objc_msgSend(v7, "count"))
            {
              v88 = 0u;
              v89 = 0u;
              v86 = 0u;
              v87 = 0u;
              v60 = v7;
              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v86, v109, 16);
              if (v61)
              {
                v62 = *(_QWORD *)v87;
                do
                {
                  for (k = 0; k != v61; ++k)
                  {
                    if (*(_QWORD *)v87 != v62)
                      objc_enumerationMutation(v60);
                    v64 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * k);
                    v65 = (void *)objc_msgSend(v14, "copy");
                    objc_msgSend(v65, "setPersonInPhoto:", v64);
                    objc_msgSend(v14, "photoLocalIdentifier");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "setPhotoLocalIdentifier:", v66);

                    objc_msgSend(v83, "addObject:", v65);
                  }
                  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v86, v109, 16);
                }
                while (v61);
              }

              v69 = 1;
            }
          }
          else
          {
            objc_msgSend(v14, "photoLocalIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v30)
              continue;
            +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v14, "photoLocalIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v32;
              _os_log_impl(&dword_1A07F4000, v31, OS_LOG_TYPE_INFO, "Fetching attachment info from photoLocalIdentifier %@", buf, 0xCu);

            }
            objc_msgSend(getMADServiceClass(), "service");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = self->_personIdentificationRequest;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "photoLocalIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = 0;
            v106 = &v105;
            v107 = 0x2050000000;
            v36 = (void *)getPHPhotoLibraryClass_softClass_2;
            v108 = getPHPhotoLibraryClass_softClass_2;
            if (!getPHPhotoLibraryClass_softClass_2)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __getPHPhotoLibraryClass_block_invoke_2;
              v116 = &unk_1E43FEA00;
              v117 = &v105;
              __getPHPhotoLibraryClass_block_invoke_2((uint64_t)buf);
              v36 = (void *)v106[3];
            }
            v37 = objc_retainAutorelease(v36);
            _Block_object_dispose(&v105, 8);
            objc_msgSend(v37, "systemPhotoLibraryURL");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = 0;
            LODWORD(v37) = objc_msgSend(v33, "performRequests:assetLocalIdentifier:photoLibraryURL:error:", v34, v35, v38, &v98);
            v74 = v98;

            if ((_DWORD)v37)
              goto LABEL_28;
LABEL_19:
            if (!v74)
              continue;
            +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
            oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "photoLocalIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "localizedDescription");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v28;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v29;
              _os_log_error_impl(&dword_1A07F4000, oslog, OS_LOG_TYPE_ERROR, "PhotoId: %@, Media Analysis returned an error %@", buf, 0x16u);

            }
          }

          continue;
        }
      }
    }
    v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
  }
  while (v78);

  if ((v69 & 1) == 0)
  {
LABEL_69:
    v67 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_70;
  }
  v67 = v83;
LABEL_70:

  return v67;
}

- (BOOL)skipAttachmentProcessing:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "photoLocalIdentifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v11 = 0;
            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_14:

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)saveBookmark
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, a3, "Could not update plist file for bookmark: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (BOOL)updatePlistWithDict:(id)a3
{
  void *v4;
  id v5;
  char v6;
  NSObject *v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    v6 = objc_msgSend(v4, "writeToFile:atomically:", self->_mediaAnalysisConfigurationPath, 1);
  }
  else
  {
    +[_PSLogging mediaAnalysisChannel](_PSLogging, "mediaAnalysisChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_PSMediaAnalysisProcessingTask updatePlistWithDict:].cold.1(v5, v7);

    v6 = 0;
  }

  return v6;
}

- (BOOL)attachmentsContainsPersonId:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAnalysisConfigurationPath, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_personIdentificationRequest, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)updatePlistWithDict:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, v4, "Error encountered while updating plist: %@", (uint8_t *)&v5);

}

@end
