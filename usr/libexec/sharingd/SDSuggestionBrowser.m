@implementation SDSuggestionBrowser

+ (void)initializeCache
{
  id v2;
  id v3;

  v2 = sub_1000D2478();
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[SDStatusMonitor shareSheetMaxSuggestions](SDStatusMonitor, "shareSheetMaxSuggestions")));
  objc_msgSend(v2, "initializePSSuggesterCacheWithMaxSuggestionCount:", v3);

}

+ (id)asyncBrowserWithSessionID:(id)a3 context:(id)a4 queue:(id)a5 timeout:(double)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithSessionID:context:asynchronous:queue:timeout:", v12, v11, 1, v10, a6);

  return v13;
}

+ (id)browserWithSessionID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithSessionID:context:asynchronous:queue:timeout:", v7, v6, 0, 0, 0.0);

  return v8;
}

- (SDSuggestionBrowser)initWithSessionID:(id)a3 context:(id)a4 asynchronous:(BOOL)a5 queue:(id)a6 timeout:(double)a7
{
  id v12;
  id v13;
  id v14;
  SDSuggestionBrowser *v15;
  NSString *v16;
  NSString *sessionID;
  uint64_t v18;
  _PSPredictionContext *predictionContext;
  void *v20;
  id v21;
  void *v22;
  _PSSuggester *v23;
  _PSSuggester *suggester;
  dispatch_queue_attr_t v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *primedSuggestionsQueue;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  os_signpost_id_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  os_signpost_id_t v39;
  id v40;
  uint64_t v41;
  NSArray *suggestions;
  objc_super v44;
  uint8_t buf[8];
  uint64_t v46;
  Class (*v47)(uint64_t);
  void *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v44.receiver = self;
  v44.super_class = (Class)SDSuggestionBrowser;
  v15 = -[SDSuggestionBrowser init](&v44, "init");
  if (v15)
  {
    v16 = (NSString *)objc_msgSend(v12, "copy");
    sessionID = v15->_sessionID;
    v15->_sessionID = v16;

    if (_os_feature_enabled_impl("Sharing", "async_suggestions"))
    {
      objc_storeStrong((id *)&v15->_queue, a6);
      v15->_isAsynchronous = a5;
      v15->_timeout = a7;
    }
    v18 = objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _createPredictionContextWithContext:](v15, "_createPredictionContextWithContext:", v13));
    predictionContext = v15->_predictionContext;
    v15->_predictionContext = (_PSPredictionContext *)v18;

    -[_PSPredictionContext setSessionID:](v15->_predictionContext, "setSessionID:", v12);
    v50 = 0;
    v51 = &v50;
    v52 = 0x2050000000;
    v20 = (void *)qword_1007C6838;
    v53 = qword_1007C6838;
    if (!qword_1007C6838)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      v46 = 3221225472;
      v47 = sub_1000D5770;
      v48 = &unk_100714258;
      v49 = &v50;
      sub_1000D5770((uint64_t)buf);
      v20 = (void *)v51[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v50, 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "defaultConfiguration"));
    objc_msgSend(v22, "setMaximumNumberOfSuggestions:", +[SDStatusMonitor shareSheetMaxSuggestions](SDStatusMonitor, "shareSheetMaxSuggestions"));
    v23 = (_PSSuggester *)objc_msgSend(objc_alloc((Class)sub_1000D2478()), "initWithDaemonUsingConfiguration:", v22);
    suggester = v15->_suggester;
    v15->_suggester = v23;

    v25 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = dispatch_queue_create("com.apple.sharingd.suggestionBrowser.primedSuggestions", v26);
    primedSuggestionsQueue = v15->_primedSuggestionsQueue;
    v15->_primedSuggestionsQueue = (OS_dispatch_queue *)v27;

    if (v15->_isAsynchronous)
    {
      v29 = share_sheet_log();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      v31 = share_sheet_log();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v33 = os_signpost_id_make_with_pointer(v32, v15);

      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, v33, "CandidatesForShareSheetRanking", " enableTelemetry=YES ", buf, 2u);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[_PSSuggester candidatesForShareSheetRanking](v15->_suggester, "candidatesForShareSheetRanking"));
      v35 = share_sheet_log();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      v37 = share_sheet_log();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      v39 = os_signpost_id_make_with_pointer(v38, v15);

      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, v39, "CandidatesForShareSheetRanking", " enableTelemetry=YES ", buf, 2u);
      }

      v40 = objc_msgSend(v34, "count");
      v15->_canExpectSuggestions = v40 != 0;
      if (v40)
      {
        v41 = objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _createPlaceholderSuggestions](v15, "_createPlaceholderSuggestions"));
        suggestions = v15->_suggestions;
        v15->_suggestions = (NSArray *)v41;

      }
    }
    else
    {
      v15->_canExpectSuggestions = 1;
    }
    -[SDSuggestionBrowser _fetchDuetSuggestionsWithPreheating:](v15, "_fetchDuetSuggestionsWithPreheating:", 1);

  }
  return v15;
}

- (id)_createPredictionContextWithContext:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 buf;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v5 = (void *)qword_1007C6840;
  v24 = qword_1007C6840;
  if (!qword_1007C6840)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v26 = sub_1000D57C4;
    v27 = &unk_100714258;
    v28 = &v21;
    sub_1000D57C4((uint64_t)&buf);
    v5 = (void *)v22[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v21, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "setShowPotentialFamilyMembers:", objc_msgSend(v4, "shouldSuggestFamilyMembers", v21));
  objc_msgSend(v7, "setIsSharePlayAvailable:", objc_msgSend(v4, "isSharePlayAvailable"));
  if (objc_msgSend(v4, "supportsCollaboration"))
    v8 = _os_feature_enabled_impl("TelephonyUtilities", "collaborateTogetherEnabled");
  else
    v8 = 0;
  objc_msgSend(v7, "setIsCollaborationAvailable:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peopleSuggestionBundleIds"));
  objc_msgSend(v7, "setSuggestionsFilteredByBundleIds:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "urlsBeingShared"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "typeIdentifiersBeingShared"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photosAssetIDs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "processedImageResultsData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sandboxExtensionsByfileURLPath"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _createAttachmentsForURLsBeingShared:typeIdentifiersBeingShared:photosAssetIDs:processedImageResultsData:sandboxExtensionsByfileURLPath:](self, "_createAttachmentsForURLsBeingShared:typeIdentifiersBeingShared:photosAssetIDs:processedImageResultsData:sandboxExtensionsByfileURLPath:", v10, v11, v12, v13, v14));

  v16 = share_sheet_log();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Attachments in PredictionContext for People Suggestion = %{private}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v7, "setAttachments:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  objc_msgSend(v7, "setBundleID:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "setSuggestionDate:", v19);

  return v7;
}

- (id)_createAttachmentsForURLsBeingShared:(id)a3 typeIdentifiersBeingShared:(id)a4 photosAssetIDs:(id)a5 processedImageResultsData:(id)a6 sandboxExtensionsByfileURLPath:(id)a7
{
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *j;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *k;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *m;
  id v50;
  id v52;
  id v53;
  id v54;
  id v56;
  id obj;
  uint64_t v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint8_t v84[128];
  _BYTE buf[24];
  void *v86;
  uint64_t *v87;

  v54 = a3;
  v53 = a4;
  v52 = a5;
  v60 = a6;
  v56 = a7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v77 = 0;
  v78 = &v77;
  v79 = 0x2050000000;
  v12 = (void *)qword_1007C6848;
  v80 = qword_1007C6848;
  if (!qword_1007C6848)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_1000D5818;
    v86 = &unk_100714258;
    v87 = &v77;
    sub_1000D5818((uint64_t)buf);
    v12 = (void *)v78[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v77, 8);
  if (v13)
  {
    if (objc_msgSend(v54, "count"))
    {
      v75 = 0uLL;
      v76 = 0uLL;
      v73 = 0uLL;
      v74 = 0uLL;
      v14 = v53;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v74;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v74 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v18, "hasSuffix:", CFSTR("url")))
            {
              v19 = v18;
              goto LABEL_18;
            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
          if (v15)
            continue;
          break;
        }
      }
      v19 = 0;
LABEL_18:

      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      obj = v54;
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
      if (v59)
      {
        v58 = *(_QWORD *)v70;
        do
        {
          for (j = 0; j != v59; j = (char *)j + 1)
          {
            if (*(_QWORD *)v70 != v58)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v19, "hasSuffix:", CFSTR("file-url")))
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _extractTextFromFileURL:](self, "_extractTextFromFileURL:", v31));
            else
              v32 = 0;
            v33 = objc_msgSend([v13 alloc], "initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:", 0, v19, 0, 0, 0, v31, v32);
            if ((objc_opt_respondsToSelector(v33, "contentURLSandboxExtension") & 1) != 0)
            {
              v34 = v33;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "path"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", v35));

              if (v36)
              {
                v37 = share_sheet_log();
                v38 = objc_claimAutoreleasedReturnValue(v37);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  v39 = objc_msgSend(v36, "length");
                  *(_DWORD *)buf = 134218243;
                  *(_QWORD *)&buf[4] = v39;
                  *(_WORD *)&buf[12] = 2113;
                  *(_QWORD *)&buf[14] = v31;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "adding urlSandboxExtension with length:%lu for url attachment:%{private}@", buf, 0x16u);
                }

                objc_msgSend(v34, "setContentURLSandboxExtension:", v36);
              }

            }
            objc_msgSend(v11, "addObject:", v33);
            if (((v60 != 0) & objc_msgSend(v19, "hasSuffix:", CFSTR("file-url"))) == 1)
            {
              v40 = objc_msgSend([v13 alloc], "initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:imageData:", 0, CFSTR("SDShareSheetImageAnalysisIdentifier"), 0, 0, 0, v31, v32, v60);

              objc_msgSend(v11, "addObject:", v40);
            }
            else
            {
              v40 = v33;
            }

          }
          v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
        }
        while (v59);
      }

    }
    else
    {
      v67 = 0uLL;
      v68 = 0uLL;
      v65 = 0uLL;
      v66 = 0uLL;
      v41 = v53;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v66;
        do
        {
          for (k = 0; k != v42; k = (char *)k + 1)
          {
            if (*(_QWORD *)v66 != v43)
              objc_enumerationMutation(v41);
            v45 = objc_msgSend([v13 alloc], "initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:", 0, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)k), 0, 0, 0, 0, 0);
            objc_msgSend(v11, "addObject:", v45);

          }
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
        }
        while (v42);
      }

      if (!v60)
        goto LABEL_48;
      v19 = objc_msgSend([v13 alloc], "initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:imageData:", 0, CFSTR("SDShareSheetImageAnalysisIdentifier"), 0, 0, 0, 0, 0, v60);
      objc_msgSend(v11, "addObject:", v19);
    }

LABEL_48:
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v46 = v52;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v62;
      do
      {
        for (m = 0; m != v47; m = (char *)m + 1)
        {
          if (*(_QWORD *)v62 != v48)
            objc_enumerationMutation(v46);
          v50 = objc_msgSend([v13 alloc], "initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:", 0, 0, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)m), 0, 0, 0, 0);
          objc_msgSend(v11, "addObject:", v50);

        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
      }
      while (v47);
    }

    v29 = objc_msgSend(v11, "copy");
    goto LABEL_56;
  }
  v20 = share_sheet_log();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_1000D5914(v21, v22, v23, v24, v25, v26, v27, v28);

  v29 = &__NSArray0__struct;
LABEL_56:

  return v29;
}

- (id)_extractTextFromFileURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("rtf")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("txt")))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _extractTextFromTextFileURL:](self, "_extractTextFromTextFileURL:", v4));
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("pdf")))
    {
      v7 = 0;
      goto LABEL_5;
    }
    v6 = objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _extractTextFromPDFFileURL:](self, "_extractTextFromPDFFileURL:", v4));
  }
  v7 = (void *)v6;
LABEL_5:

  return v7;
}

- (id)_extractTextFromTextFileURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;

  v3 = a3;
  v14 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", v3, &v14));
  v5 = v14;
  if (v4)
  {
    v13 = 0;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readDataUpToLength:error:", 102400, &v13));
    v7 = v13;

    if (-[NSObject length](v6, "length"))
    {
      v6 = objc_retainAutorelease(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", -[NSObject bytes](v6, "bytes"), 4));
    }
    else
    {
      if (v7)
      {
        v10 = share_sheet_log();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1000D59AC();

      }
      v8 = 0;
    }
  }
  else
  {
    v9 = share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000D5944();
    v8 = 0;
    v7 = v5;
  }

  return v8;
}

- (id)_extractTextFromPDFFileURL:(id)a3
{
  return 0;
}

- (void)setSuggestions:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_suggestions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_suggestions, a3);
    -[SDSuggestionBrowser setPeopleSuggestionNodes:](self, "setPeopleSuggestionNodes:", 0);
    -[SDSuggestionBrowser setPeopleSuggestions:](self, "setPeopleSuggestions:", 0);
    v5 = v6;
  }

}

- (NSArray)peopleSuggestionNodes
{
  NSArray *peopleSuggestionNodes;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  -[SDSuggestionBrowser _fetchSuggestionsIfNeeded](self, "_fetchSuggestionsIfNeeded");
  peopleSuggestionNodes = self->_peopleSuggestionNodes;
  if (!peopleSuggestionNodes)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser suggestions](self, "suggestions"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _createPeopleSuggestionNodesForSuggestions:](self, "_createPeopleSuggestionNodesForSuggestions:", v4));
    v6 = self->_peopleSuggestionNodes;
    self->_peopleSuggestionNodes = v5;

    peopleSuggestionNodes = self->_peopleSuggestionNodes;
  }
  return peopleSuggestionNodes;
}

- (NSArray)peopleSuggestions
{
  NSArray *peopleSuggestions;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  -[SDSuggestionBrowser _fetchSuggestionsIfNeeded](self, "_fetchSuggestionsIfNeeded");
  peopleSuggestions = self->_peopleSuggestions;
  if (!peopleSuggestions)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser suggestions](self, "suggestions"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _createPeopleSuggestionsForSuggestions:](self, "_createPeopleSuggestionsForSuggestions:", v4));
    v6 = self->_peopleSuggestions;
    self->_peopleSuggestions = v5;

    peopleSuggestions = self->_peopleSuggestions;
  }
  return peopleSuggestions;
}

- (id)_createPlaceholderSuggestions
{
  int64_t v2;
  void *i;
  void *v4;
  id v5;

  v2 = +[SDStatusMonitor shareSheetMaxSuggestions](SDStatusMonitor, "shareSheetMaxSuggestions");
  for (i = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v2));
        v2;
        --v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDSuggestion placeholderSuggestion](SDSuggestion, "placeholderSuggestion"));
    objc_msgSend(i, "addObject:", v4);

  }
  v5 = objc_msgSend(i, "copy");

  return v5;
}

- (id)_createSuggestionsForDuetSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  SDSuggestion *v11;
  SDSuggestion *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9);
        v11 = [SDSuggestion alloc];
        v12 = -[SDSuggestion initWithSuggestion:](v11, "initWithSuggestion:", v10, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion displayName](v12, "displayName"));
        if (v13)
        {

        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion formattedHandles](v12, "formattedHandles"));

          if (!v14)
            goto LABEL_10;
        }
        objc_msgSend(v4, "addObject:", v12);
LABEL_10:

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = objc_msgSend(v4, "copy");
  return v15;
}

- (id)_createPeopleSuggestionNodesForSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SDSuggestionNode *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id location;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  location = 0;
  objc_initWeak(&location, self);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v11 = -[SDSuggestionNode initWithSuggestion:]([SDSuggestionNode alloc], "initWithSuggestion:", v10);
        if ((objc_msgSend(v10, "isPlaceholder") & 1) == 0)
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1000D3A60;
          v14[3] = &unk_100717098;
          objc_copyWeak(&v15, &location);
          -[SDSuggestionNode setLoadIconHandler:](v11, "setLoadIconHandler:", v14);
          objc_destroyWeak(&v15);
        }
        objc_msgSend(v5, "addObject:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v5, "copy");
  objc_destroyWeak(&location);

  return v12;
}

- (id)_createPeopleSuggestionsForSuggestions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a3, "count")));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser suggestions](self, "suggestions", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "createPeopleSuggestion"));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = objc_msgSend(v4, "copy");
  return v11;
}

- (void)_didFetchDuetSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SDSuggestionBrowser setDuetSuggestions:](self, "setDuetSuggestions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _createSuggestionsForDuetSuggestions:](self, "_createSuggestionsForDuetSuggestions:", v4));

  -[SDSuggestionBrowser setSuggestions:](self, "setSuggestions:", v5);
  if (-[SDSuggestionBrowser isAsynchronous](self, "isAsynchronous"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser delegate](self, "delegate"));
    objc_msgSend(v6, "suggestionBrowserDidUpdateSuggestions:", self);

  }
}

- (void)_fetchSuggestionsIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser suggestions](self, "suggestions"));

  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser primedSuggestionsQueue](self, "primedSuggestionsQueue"));
    dispatch_sync(v4, &stru_1007170B8);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser suggestions](self, "suggestions"));
    if (!v5)
      -[SDSuggestionBrowser _fetchDuetSuggestionsWithPreheating:](self, "_fetchDuetSuggestionsWithPreheating:", 0);
  }
}

- (void)_fetchDuetSuggestionsWithPreheating:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_signpost_id_t v16;
  _QWORD *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  _QWORD *v22;
  void ***v23;
  void ***v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  _PSSuggester *suggester;
  _PSPredictionContext *predictionContext;
  _QWORD *v30;
  void **v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  SDSuggestionBrowser *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[6];
  BOOL v41;
  uint8_t buf[4];
  double v43;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v6 = objc_msgSend(v5, "disablePeopleSuggestions");

  if (v6)
  {
    v7 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "People suggestions are disabled", buf, 2u);
    }

LABEL_14:
    -[SDSuggestionBrowser setSuggestions:](self, "setSuggestions:", &__NSArray0__struct);
    return;
  }
  v9 = -[SDSuggestionBrowser canExpectSuggestions](self, "canExpectSuggestions");
  v10 = share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "People suggestions are not expected.", buf, 2u);
    }

    goto LABEL_14;
  }
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser sessionID](self, "sessionID"));
    *(_DWORD *)buf = 138412290;
    v43 = *(double *)&v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling into PeopleSuggester for session ID %@", buf, 0xCu);

  }
  v14 = share_sheet_log();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_signpost_id_make_with_pointer(v15, self);

  sub_1000D3D2C(v16, 1, v3, -[SDSuggestionBrowser isAsynchronous](self, "isAsynchronous"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000D4268;
  v40[3] = &unk_1007170E0;
  v41 = v3;
  v40[4] = self;
  v40[5] = v16;
  v17 = objc_retainBlock(v40);
  if (-[SDSuggestionBrowser isAsynchronous](self, "isAsynchronous"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser queue](self, "queue"));
    -[SDSuggestionBrowser timeout](self, "timeout");
    if (v19 <= 0.0)
    {
      v21 = 1.79769313e308;
    }
    else
    {
      -[SDSuggestionBrowser timeout](self, "timeout");
      v21 = v20;
    }
    v26 = share_sheet_log();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v43 = v21;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "fetch people suggestions asynchronously with timeout:%f", buf, 0xCu);
    }

    suggester = self->_suggester;
    predictionContext = self->_predictionContext;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000D43B8;
    v37[3] = &unk_100717130;
    v37[4] = self;
    v38 = v18;
    v39 = v17;
    v30 = v17;
    v22 = v18;
    -[_PSSuggester asyncSuggestInteractionsFromContext:timeout:completionHandler:](suggester, "asyncSuggestInteractionsFromContext:timeout:completionHandler:", predictionContext, v37, v21);

  }
  else
  {
    v31 = _NSConcreteStackBlock;
    v32 = 3221225472;
    v33 = sub_1000D4534;
    v34 = &unk_100714F40;
    v35 = self;
    v36 = v17;
    v22 = v17;
    v23 = objc_retainBlock(&v31);
    v24 = v23;
    if (v3)
    {
      v25 = objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser primedSuggestionsQueue](self, "primedSuggestionsQueue", v31, v32, v33, v34, v35, v36));
      dispatch_async(v25, v24);

    }
    else
    {
      ((void (*)(void ***))v23[2])(v23);
    }

  }
}

- (void)_loadIconForSuggestionNode:(id)a3 outIcon:(CGImage *)a4 outIconData:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CGImage *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  SharingXPCHelperContactIcon *v25;
  _BYTE *v26;
  _BYTE *v27;
  id v28;
  NSObject *v29;
  int64_t v30;
  void *v31;
  id v32;
  SharingXPCHelperGroupContactIcon *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  SharingXPCHelperContactIcon *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  SharingXPCHelperContactIcon *v46;
  SharingXPCHelperGroupContactIcon *v47;
  uint8_t buf[4];
  int64_t v49;
  __int16 v50;
  id v51;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "suggestion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));

  if (v9)
  {
    v10 = share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
      *(_DWORD *)buf = 138412290;
      v49 = (int64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Contact %@ is a donated suggestion, fetching from intents", buf, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationIdentifier"));
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "derivedIntentIdentifier"));
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser helperConnection](self, "helperConnection"));
    v19 = sub_10004E6E0(v17, v16, 0, v18);

    if (v19)
    {
      v20 = 0;
      goto LABEL_18;
    }
    v21 = share_sheet_log();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000D5AA8((uint64_t)v16, v8, v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recipients"));
  v24 = objc_msgSend(v23, "count");

  if ((unint64_t)v24 < 2)
  {
    v38 = [SharingXPCHelperContactIcon alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recipients"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "contact"));
    v25 = -[SharingXPCHelperContactIcon initWithContact:iconData:atIndex:cacheLookupKey:](v38, "initWithContact:iconData:atIndex:cacheLookupKey:", v41, 0, 0, 0);

    v46 = v25;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser helperConnection](self, "helperConnection"));
    v44 = sub_10004E8A4(v42, v43);
    v33 = (SharingXPCHelperGroupContactIcon *)objc_claimAutoreleasedReturnValue(v44);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperGroupContactIcon firstObject](v33, "firstObject"));
  }
  else
  {
    v25 = (SharingXPCHelperContactIcon *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contacts"));
    v26 = -[SharingXPCHelperContactIcon count](v25, "count");
    v27 = objc_msgSend(v8, "transientContactsCount");
    v28 = share_sheet_log();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v26 - v27;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recipients"));
      v32 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 134218240;
      v49 = v30;
      v50 = 2048;
      v51 = v32;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Received %ld out of %ld contacts from group recipients", buf, 0x16u);

    }
    v33 = -[SharingXPCHelperGroupContactIcon initWithContacts:iconData:atIndex:cacheLookupKey:]([SharingXPCHelperGroupContactIcon alloc], "initWithContacts:iconData:atIndex:cacheLookupKey:", v25, 0, 0, 0);
    v47 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser helperConnection](self, "helperConnection"));
    v36 = sub_10004E904(v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstObject"));
  }

  v20 = (CGImage *)objc_msgSend(v16, "icon");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "iconData"));
LABEL_18:

  *a4 = v20;
  v45 = objc_retainAutorelease(v19);
  *a5 = v45;

}

- (void)_provideFeedbackForNodeAtIndex:(id)a3 bundleID:(id)a4 suggestion:(id)a5 selectedActionBundleID:(id)a6 abandoned:(BOOL)a7
{
  _BOOL4 v7;
  unint64_t v12;
  id v13;
  unint64_t v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  NSObject *v32;
  _QWORD *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  _QWORD *v37;
  _QWORD v38[4];
  NSObject *v39;
  SDSuggestionBrowser *v40;
  id v41;
  uint64_t v42;
  double v43;

  v7 = a7;
  v12 = (unint64_t)a3;
  v13 = a4;
  v14 = (unint64_t)a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIActivity _activityImageForActionRepresentationImage:](UIActivity, "_activityImageForActionRepresentationImage:", 0));
  objc_msgSend(v16, "size");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v19, "bounds");
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser duetSuggestions](self, "duetSuggestions"));
  if (v7)
  {
    v23 = objc_msgSend(sub_1000D4C04(), "abandonment");
    v24 = (id)objc_claimAutoreleasedReturnValue(v23);
    goto LABEL_12;
  }
  if (!v12)
  {
    if (v14)
    {
      v28 = objc_alloc((Class)sub_1000D4C04());
      v29 = 0;
      v30 = v14;
    }
    else
    {
      if (v15)
      {
        v28 = objc_alloc((Class)sub_1000D4C04());
        v29 = 1;
        v30 = 0;
        v31 = v15;
        goto LABEL_11;
      }
      if (!v13)
        goto LABEL_19;
      v28 = objc_alloc((Class)sub_1000D4C04());
      v29 = 4;
      v30 = 0;
    }
    v31 = v13;
LABEL_11:
    v24 = objc_msgSend(v28, "initWithType:suggestion:transportBundleID:", v29, v30, v31);
LABEL_12:
    v27 = v24;
    if (v24)
      goto LABEL_13;
    goto LABEL_19;
  }
  v25 = objc_alloc((Class)sub_1000D4C04());
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend((id)v12, "unsignedIntValue")));
  v27 = objc_msgSend(v25, "initWithType:suggestion:transportBundleID:", 0, v26, v13);

  if (v27)
  {
LABEL_13:
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000D4CBC;
    v38[3] = &unk_100717158;
    v32 = v27;
    v39 = v32;
    v40 = self;
    v41 = v22;
    v42 = v21;
    v43 = v18 + 10.0;
    v33 = objc_retainBlock(v38);
    v34 = v33;
    if (v12 | v14)
    {
      ((void (*)(_QWORD *))v33[2])(v33);
    }
    else
    {
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000D4E38;
      v36[3] = &unk_100717180;
      v37 = v33;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v36);

    }
    goto LABEL_21;
  }
LABEL_19:
  v35 = share_sheet_log();
  v32 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    sub_1000D5B60(v32);
LABEL_21:

}

- (void)provideFeedbackForNodeAtIndex:(id)a3 bundleID:(id)a4 selectedActionBundleID:(id)a5 abandoned:(BOOL)a6
{
  -[SDSuggestionBrowser _provideFeedbackForNodeAtIndex:bundleID:suggestion:selectedActionBundleID:abandoned:](self, "_provideFeedbackForNodeAtIndex:bundleID:suggestion:selectedActionBundleID:abandoned:", a3, a4, 0, a5, a6);
}

- (void)provideFeedbackForPeopleSuggestionIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _peopleSuggestionForIdentifier:outIndex:](self, "_peopleSuggestionForIdentifier:outIndex:", v4, &v15));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transportBundleIdentifier"));
    -[SDSuggestionBrowser provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:](self, "provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:", v6, v7, 0, 0);

  }
  else
  {
    v8 = share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000D5B9C((uint64_t)v4, v6, v9, v10, v11, v12, v13, v14);
  }

}

- (void)provideFeedbackForPeopleSuggestionNodeIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser _peopleSuggestionNodeForNodeIdentifier:outIndex:](self, "_peopleSuggestionNodeForNodeIdentifier:outIndex:", v4, &v15));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
    -[SDSuggestionBrowser provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:](self, "provideFeedbackForNodeAtIndex:bundleID:selectedActionBundleID:abandoned:", v6, v7, 0, 0);

  }
  else
  {
    v8 = share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000D5C00((uint64_t)v4, v6, v9, v10, v11, v12, v13, v14);
  }

}

- (void)provideFeedbackForPeopleSuggestion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  -[SDSuggestionBrowser _provideFeedbackForNodeAtIndex:bundleID:suggestion:selectedActionBundleID:abandoned:](self, "_provideFeedbackForNodeAtIndex:bundleID:suggestion:selectedActionBundleID:abandoned:", 0, v5, v4, 0, 0);

}

- (void)suggestLessPeopleSuggestionIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser peopleSuggestionNodes](self, "peopleSuggestionNodes"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser peopleSuggestionNodes](self, "peopleSuggestionNodes", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
        {
          objc_msgSend(v6, "removeObject:", v12);
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  -[SDSuggestionBrowser setPeopleSuggestionNodes:](self, "setPeopleSuggestionNodes:", v6);
}

- (id)_peopleSuggestionForIdentifier:(id)a3 outIndex:(int64_t *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000D52D4;
  v19 = sub_1000D52E4;
  v20 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser peopleSuggestions](self, "peopleSuggestions"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D52EC;
  v11[3] = &unk_1007171A8;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = a4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)_peopleSuggestionNodeForNodeIdentifier:(id)a3 outIndex:(int64_t *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000D52D4;
  v19 = sub_1000D52E4;
  v20 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionBrowser peopleSuggestionNodes](self, "peopleSuggestionNodes"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D5490;
  v11[3] = &unk_1007171D0;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = a4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)isAsynchronous
{
  return self->_isAsynchronous;
}

- (SDSuggestionBrowserDelegate)delegate
{
  return (SDSuggestionBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)objc_loadWeakRetained((id *)&self->_helperConnection);
}

- (void)setHelperConnection:(id)a3
{
  objc_storeWeak((id *)&self->_helperConnection, a3);
}

- (void)setPeopleSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setPeopleSuggestionNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_queue)primedSuggestionsQueue
{
  return self->_primedSuggestionsQueue;
}

- (_PSSuggester)suggester
{
  return self->_suggester;
}

- (_PSPredictionContext)predictionContext
{
  return self->_predictionContext;
}

- (void)setPredictionContext:(id)a3
{
  objc_storeStrong((id *)&self->_predictionContext, a3);
}

- (NSArray)duetSuggestions
{
  return self->_duetSuggestions;
}

- (void)setDuetSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (BOOL)canExpectSuggestions
{
  return self->_canExpectSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_duetSuggestions, 0);
  objc_storeStrong((id *)&self->_predictionContext, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_primedSuggestionsQueue, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionNodes, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
