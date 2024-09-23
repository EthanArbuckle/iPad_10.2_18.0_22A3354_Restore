@implementation MOEngagementHistoryManager

- (MOEngagementHistoryManager)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  MOEngagementHistoryManager *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BMSource *stream_source;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BMBookmarkablePublisher *stream_publisher;
  NSArray *suggestionEngagementTypesEligibleForRawExternalAnalytics;
  MOEngagementHistoryManager *v27;
  id os_log;
  NSObject *v29;
  void *v30;
  objc_super v32;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MOEventBundleStore, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  if (v10)
  {
    v32.receiver = self;
    v32.super_class = (Class)MOEngagementHistoryManager;
    v11 = -[MOEngagementHistoryManager init](&v32, "init");
    if (v11)
    {
      v12 = BiomeLibrary();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "Moments"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "Events"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "Engagement"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "source"));
      stream_source = v11->_stream_source;
      v11->_stream_source = (BMSource *)v17;

      v19 = BiomeLibrary();
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "Moments"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "Events"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "Engagement"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "publisher"));
      stream_publisher = v11->_stream_publisher;
      v11->_stream_publisher = (BMBookmarkablePublisher *)v24;

      v11->_isInternalBuild = +[MOPlatformInfo isInternalBuild](MOPlatformInfo, "isInternalBuild");
      suggestionEngagementTypesEligibleForRawExternalAnalytics = v11->_suggestionEngagementTypesEligibleForRawExternalAnalytics;
      v11->_suggestionEngagementTypesEligibleForRawExternalAnalytics = (NSArray *)&off_1002DC9B0;

      objc_msgSend(v10, "setEngagementDelegate:", v11);
    }
    self = v11;
    v27 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MOEngagementHistoryManager initWithUniverse:].cold.1();

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEngagementHistoryManager.m"), 57, CFSTR("Invalid parameter not satisfying: bundleStore"));

    v27 = 0;
  }

  return v27;
}

+ (unint64_t)suggestionEventToEnum:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (suggestionEventToEnum__onceToken != -1)
    dispatch_once(&suggestionEventToEnum__onceToken, &__block_literal_global_36);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)suggestionEventToEnum__eventMapping, "objectForKeyedSubscript:", v3));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntValue");
  else
    v6 = 0;

  return v6;
}

void __52__MOEngagementHistoryManager_suggestionEventToEnum___block_invoke(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  _QWORD v27[24];
  _QWORD v28[24];

  v27[0] = CFSTR("suggestionsUnknown");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
  v28[0] = v26;
  v27[1] = CFSTR("suggestionsSelected");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 1));
  v28[1] = v25;
  v27[2] = CFSTR("suggestionsShared");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 2));
  v28[2] = v24;
  v27[3] = CFSTR("suggestionsLiked");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 3));
  v28[3] = v23;
  v27[4] = CFSTR("suggestionsDisliked");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 4));
  v28[4] = v22;
  v27[5] = CFSTR("suggestionsDismissed");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 5));
  v28[5] = v21;
  v27[6] = CFSTR("suggestionsDeleted");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 6));
  v28[6] = v20;
  v27[7] = CFSTR("suggestionsHidden");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 7));
  v28[7] = v19;
  v27[8] = CFSTR("suggestionsQuickAddEntry");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 8));
  v28[8] = v18;
  v27[9] = CFSTR("suggestionsFavorite");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 11));
  v28[9] = v17;
  v27[10] = CFSTR("suggestionEntryCreated");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 13));
  v28[10] = v16;
  v27[11] = CFSTR("suggestionEntryEdited");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 14));
  v28[11] = v15;
  v27[12] = CFSTR("suggestionEntryDeleted");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 15));
  v28[12] = v14;
  v27[13] = CFSTR("suggestionEntryCancelled");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 16));
  v28[13] = v13;
  v27[14] = CFSTR("suggestionEntryCreatedWithUpdates");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 25));
  v28[14] = v1;
  v27[15] = CFSTR("suggestionsViewed");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 9));
  v28[15] = v2;
  v27[16] = CFSTR("suggestionsThumbsUp");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 12));
  v28[16] = v3;
  v27[17] = CFSTR("suggestionsAnnotated");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 17));
  v28[17] = v4;
  v27[18] = CFSTR("suggestionNotificationQueued");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 26));
  v28[18] = v5;
  v27[19] = CFSTR("suggestionNotificationDequeued");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 27));
  v28[19] = v6;
  v27[20] = CFSTR("suggestionNotificationTapped");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 28));
  v28[20] = v7;
  v27[21] = CFSTR("suggestionNotificationDismissed");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 29));
  v28[21] = v8;
  v27[22] = CFSTR("suggestionNotificationPosted");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 30));
  v28[22] = v9;
  v27[23] = CFSTR("suggestionNotificationOverriden");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 31));
  v28[23] = v10;
  v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 24));
  v12 = (void *)suggestionEventToEnum__eventMapping;
  suggestionEventToEnum__eventMapping = v11;

}

+ (id)suggestionEventToLabel:(unint64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;

  if (suggestionEventToLabel__onceToken != -1)
    dispatch_once(&suggestionEventToLabel__onceToken, &__block_literal_global_234);
  v4 = (void *)suggestionEventToLabel__eventMapping;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (!v6)
    v6 = CFSTR("suggestionsUnknown");
  return v6;
}

void __53__MOEngagementHistoryManager_suggestionEventToLabel___block_invoke(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  _QWORD v27[24];
  _QWORD v28[24];

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
  v27[0] = v26;
  v28[0] = CFSTR("suggestionsUnknown");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 1));
  v27[1] = v25;
  v28[1] = CFSTR("suggestionsSelected");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 2));
  v27[2] = v24;
  v28[2] = CFSTR("suggestionsShared");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 3));
  v27[3] = v23;
  v28[3] = CFSTR("suggestionsLiked");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 4));
  v27[4] = v22;
  v28[4] = CFSTR("suggestionsDisliked");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 5));
  v27[5] = v21;
  v28[5] = CFSTR("suggestionsDismissed");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 6));
  v27[6] = v20;
  v28[6] = CFSTR("suggestionsDeleted");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 7));
  v27[7] = v19;
  v28[7] = CFSTR("suggestionsHidden");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 8));
  v27[8] = v18;
  v28[8] = CFSTR("suggestionsQuickAddEntry");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 11));
  v27[9] = v17;
  v28[9] = CFSTR("suggestionsFavorite");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 13));
  v27[10] = v16;
  v28[10] = CFSTR("suggestionEntryCreated");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 14));
  v27[11] = v15;
  v28[11] = CFSTR("suggestionEntryEdited");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 15));
  v27[12] = v14;
  v28[12] = CFSTR("suggestionEntryDeleted");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 16));
  v27[13] = v13;
  v28[13] = CFSTR("suggestionEntryCancelled");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 25));
  v27[14] = v1;
  v28[14] = CFSTR("suggestionEntryCreatedWithUpdates");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 9));
  v27[15] = v2;
  v28[15] = CFSTR("suggestionsViewed");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 12));
  v27[16] = v3;
  v28[16] = CFSTR("suggestionsThumbsUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 17));
  v27[17] = v4;
  v28[17] = CFSTR("suggestionsAnnotated");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 26));
  v27[18] = v5;
  v28[18] = CFSTR("suggestionNotificationQueued");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 27));
  v27[19] = v6;
  v28[19] = CFSTR("suggestionNotificationDequeued");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 28));
  v27[20] = v7;
  v28[20] = CFSTR("suggestionNotificationTapped");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 29));
  v27[21] = v8;
  v28[21] = CFSTR("suggestionNotificationDismissed");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 30));
  v27[22] = v9;
  v28[22] = CFSTR("suggestionNotificationPosted");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 31));
  v27[23] = v10;
  v28[23] = CFSTR("suggestionNotificationOverriden");
  v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 24));
  v12 = (void *)suggestionEventToLabel__eventMapping;
  suggestionEventToLabel__eventMapping = v11;

}

+ (unint64_t)appEntryEventToEnum:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (appEntryEventToEnum__onceToken != -1)
    dispatch_once(&appEntryEventToEnum__onceToken, &__block_literal_global_235);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)appEntryEventToEnum__eventMapping, "objectForKeyedSubscript:", v3));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntValue");
  else
    v6 = 0;

  return v6;
}

void __50__MOEngagementHistoryManager_appEntryEventToEnum___block_invoke(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v8[0] = CFSTR("appUnknown");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
  v9[0] = v1;
  v8[1] = CFSTR("appEntryCreated");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 1));
  v9[1] = v2;
  v8[2] = CFSTR("appEntryEdited");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 2));
  v9[2] = v3;
  v8[3] = CFSTR("appEntryDeleted");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 3));
  v9[3] = v4;
  v8[4] = CFSTR("appEntryCancelled");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 4));
  v9[4] = v5;
  v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 5));
  v7 = (void *)appEntryEventToEnum__eventMapping;
  appEntryEventToEnum__eventMapping = v6;

}

+ (id)appEntryEventToString:(id)a3
{
  __CFString *v3;
  const __CFString *v4;

  v3 = (__CFString *)a3;
  if (CFSTR("appUnknown") == v3)
  {
    v4 = CFSTR("unknown");
  }
  else if (CFSTR("appEntryCreated") == v3)
  {
    v4 = CFSTR("entryCreated");
  }
  else if (CFSTR("appEntryEdited") == v3)
  {
    v4 = CFSTR("entryEdited");
  }
  else if (CFSTR("appEntryDeleted") == v3)
  {
    v4 = CFSTR("entryDeleted");
  }
  else if (CFSTR("appEntryCancelled") == v3)
  {
    v4 = CFSTR("entryCancelled");
  }
  else
  {
    v4 = CFSTR("other");
  }

  return (id)v4;
}

+ (unint64_t)clientEventToEnum:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (clientEventToEnum__onceToken != -1)
    dispatch_once(&clientEventToEnum__onceToken, &__block_literal_global_248);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)clientEventToEnum__eventMapping, "objectForKeyedSubscript:", v3));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntValue");
  else
    v6 = 0;

  return v6;
}

void __48__MOEngagementHistoryManager_clientEventToEnum___block_invoke(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v8[0] = CFSTR("clientUnknown");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
  v9[0] = v1;
  v8[1] = CFSTR("clientAppVisible");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 1));
  v9[1] = v2;
  v8[2] = CFSTR("clientAppDismissed");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 2));
  v9[2] = v3;
  v8[3] = CFSTR("clientSheetVisible");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 3));
  v9[3] = v4;
  v8[4] = CFSTR("clientSheetDismissed");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 4));
  v9[4] = v5;
  v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 5));
  v7 = (void *)clientEventToEnum__eventMapping;
  clientEventToEnum__eventMapping = v6;

}

+ (unint64_t)getEngagmentTypeForEvent:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (+[MOEngagementHistoryManager suggestionEventToEnum:](MOEngagementHistoryManager, "suggestionEventToEnum:", v3))
  {
    v4 = 1;
  }
  else if (+[MOEngagementHistoryManager appEntryEventToEnum:](MOEngagementHistoryManager, "appEntryEventToEnum:", v3))
  {
    v4 = 2;
  }
  else if (+[MOEngagementHistoryManager clientEventToEnum:](MOEngagementHistoryManager, "clientEventToEnum:", v3))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)determineAddedCharacterBinRange:(int64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = 1;
  v4 = 2;
  if ((unint64_t)(a3 - 201) >= 0x190)
    v4 = 3;
  if ((unint64_t)a3 >= 0xC9)
    v3 = v4;
  if (a3)
    return v3;
  else
    return 0;
}

- (id)getPhotoAssetsForBundle:(id)a3
{
  return &__NSArray0__struct;
}

- (id)getSuggestionAssetsForBundle:(id)a3
{
  return &__NSArray0__struct;
}

- (id)getEngagementBundleSumarySetForBundles:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getBMBundleSumaryForBundle:](self, "getBMBundleSumaryForBundle:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
        if (v11)
          -[NSMutableArray addObject:](v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)getBMBundleSumaryForBundle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  MOEngagementHistoryManager *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id os_log;
  NSObject *v20;
  id v21;
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
  unsigned int v32;
  MOEngagementHistoryManager *v33;
  void *v34;
  id v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  unsigned int v43;
  unsigned int v44;
  void *v45;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));

    if (v7)
    {
      v8 = self;
      v9 = objc_alloc((Class)BMMomentsEngagementSuggestionIdentifier);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      v14 = objc_msgSend(v9, "initWithBundleId:suggestionId:", v11, v13);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("rankingScore")));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("rankingScore")));

        }
        else
        {
          v50 = 0;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));

        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));

        }
        else
        {
          v53 = 0;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab")));

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab")));

        }
        else
        {
          v49 = 0;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));

        if (v29)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
          v32 = objc_msgSend(v31, "intValue");

          goto LABEL_20;
        }
      }
      else
      {
        v49 = 0;
        v50 = 0;
        v53 = 0;
      }
      v32 = 0;
LABEL_20:
      v33 = v8;
      v54 = v14;
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getBundleType"));
      if (objc_msgSend(v4, "interfaceType") == (id)11
        && (v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources")),
            v35 = objc_msgSend(v34, "count"),
            v34,
            v35))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
        v37 = v32;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", 0));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "name"));

        v32 = v37;
      }
      else
      {
        v48 = 0;
      }
      v51 = objc_alloc((Class)BMMomentsEngagementBundleSummary);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
      v41 = objc_msgSend(v4, "interfaceType");
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getPhotoAssetsForBundle:](v33, "getPhotoAssetsForBundle:", v4));
      v43 = objc_msgSend(v4, "bundleSubType");
      v44 = objc_msgSend(v4, "bundleSuperType");
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getSuggestionAssetsForBundle:](v33, "getSuggestionAssetsForBundle:", v4));
      LODWORD(v47) = v32;
      v21 = objc_msgSend(v51, "initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:", v54, v39, v40, v41, v50, v42, v52, v48, __PAIR64__(v44, v43), v53, v49, v47, v45);

      goto LABEL_25;
    }
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
  v20 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[MOEngagementHistoryManager getBMBundleSumaryForBundle:].cold.1();

  v21 = 0;
LABEL_25:

  return v21;
}

- (void)didEngagementEventPosted:(id)a3 withBundles:(id)a4 timestamp:(id)a5 withContext:(id)a6 withTrialExperimentIDs:(id)a7 withOnboardingStatus:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  void *v38;
  NSMutableArray *v39;
  NSMutableArray *v40;
  NSMutableArray *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  char isKindOfClass;
  id v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id os_log;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  unint64_t v85;
  id v86;
  id v87;
  unsigned int v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  MOEngagementHistoryManager *v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("clientIdentifier")));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getEngagementBundleSumarySetForBundles:](self, "getEngagementBundleSumarySetForBundles:", v15));
    v101 = v19;
    v95 = v18;
    v91 = v20;
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.momentsd.MOUserNotifications")))
    {
      v22 = objc_alloc((Class)BMMomentsEngagementNotificationInfo);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("postingDate")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("numSuggestionInNotification")));
      v93 = objc_msgSend(v22, "initWithNotificationEventTimestamp:notificationPostingTimestamp:notificationSuggestionCount:", v16, v23, v24);

    }
    else
    {
      v93 = 0;
    }
    v27 = +[MOEngagementHistoryManager getEngagmentTypeForEvent:](MOEngagementHistoryManager, "getEngagmentTypeForEvent:", v14);
    v97 = v14;
    v98 = v17;
    v94 = self;
    v92 = v15;
    v96 = v16;
    v90 = v21;
    switch(v27)
    {
      case 3uLL:
        v36 = objc_alloc((Class)BMMomentsEngagementClientActivityEvent);
        v37 = +[MOEngagementHistoryManager clientEventToEnum:](MOEngagementHistoryManager, "clientEventToEnum:", v14);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("clientIdentifier")));
        v34 = objc_msgSend(v36, "initWithType:clientIdentifier:timestamp:", v37, v38, v16);

        break;
      case 2uLL:
        v39 = objc_opt_new(NSMutableArray);
        v40 = objc_opt_new(NSMutableArray);
        v41 = objc_opt_new(NSMutableArray);
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v42 = v21;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v107;
          do
          {
            for (i = 0; i != v44; i = (char *)i + 1)
            {
              if (*(_QWORD *)v107 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)i);
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));

              if (v48)
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
                -[NSMutableArray addObject:](v39, "addObject:", v49);

              }
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bundleInterfaceType"));

              if (v50)
              {
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bundleInterfaceType"));
                -[NSMutableArray addObject:](v40, "addObject:", v51);

              }
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bundleEvergreenType"));

              if (v52)
              {
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bundleEvergreenType"));
                -[NSMutableArray addObject:](v41, "addObject:", v53);

              }
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
          }
          while (v44);
        }

        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", 0));
        v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("entryPhotoAssets")));
        if (v54)
        {
          v55 = (void *)v54;
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("entryPhotoAssets")));
          v58 = objc_opt_class(NSArray, v57);
          isKindOfClass = objc_opt_isKindOfClass(v56, v58);

          v60 = v97;
          if ((isKindOfClass & 1) != 0)
            v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("entryPhotoAssets")));
          else
            v102 = &__NSArray0__struct;
        }
        else
        {
          v102 = &__NSArray0__struct;
          v60 = v97;
        }
        v87 = objc_alloc((Class)BMMomentsEngagementAppEntryEvent);
        v85 = +[MOEngagementHistoryManager appEntryEventToEnum:](MOEngagementHistoryManager, "appEntryEventToEnum:", v60);
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("clientIdentifier")));
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("entryStartTime")));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("entryStartTime")));
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("entryTotalCharacters")));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("entryPhotoAssets")));
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[MOEngagementHistoryManager appEntryEventToString:](MOEngagementHistoryManager, "appEntryEventToString:", v60));
        v35 = objc_msgSend(v87, "initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:bundleSummary:assets:", v85, v83, v96, v39, v100, v63, v81, v64, v102, v65, v40, v41, v104, &__NSArray0__struct);

        v34 = 0;
        goto LABEL_35;
      case 1uLL:
        v28 = +[MOEngagementHistoryManager suggestionEventToEnum:](MOEngagementHistoryManager, "suggestionEventToEnum:", v14);
        v29 = objc_alloc((Class)BMMomentsEngagementSuggestionEvent);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("clientIdentifier")));
        v31 = v21;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("viewContainerName")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("viewVisibleTime")));
        v99 = objc_msgSend(v29, "initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:", v28, v16, v31, v30, v32, v33, 0, 0, 0, v93);

        -[MOEngagementHistoryManager submitSuggestionEngagementEventAnalytics:suggestionEngagementType:timestamp:withContext:withTrialExperimentIDs:](v94, "submitSuggestionEngagementEventAnalytics:suggestionEngagementType:timestamp:withContext:withTrialExperimentIDs:", v15, v28, v16, v17, v95);
        v34 = 0;
        v35 = 0;
LABEL_36:
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("onboardingStatus")));

        v103 = v34;
        v105 = v35;
        if (v66)
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("onboardingStatus")));
          v88 = +[MOBiomeDonationUtility mapOnboardingFlowCompletion:](MOBiomeDonationUtility, "mapOnboardingFlowCompletion:", (int)objc_msgSend(v67, "intValue"));

        }
        else
        {
          v88 = 0;
        }
        v86 = objc_alloc((Class)BMMomentsEngagement);
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("journalIsInstalled")));
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("journalConfigLockJournal")));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("journalConfigSkipSuggestions")));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("settingSwitchActivity")));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("settingSwitchCommunication")));
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("settingSwitchLocation")));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("settingSwitchMedia")));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("settingSwitchPeople")));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("settingSwitchPhoto")));
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("settingSwitchStateOfMind")));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("settingSwitchReflection")));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("settingBroaderSwitchLocation")));
        v89 = objc_msgSend(v86, "initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", v99, v105, v103, v88, v84, v82, v80, v68, v79, v69, v70, v71, v72,
                v73,
                v74,
                v75);

        v76 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_source](v94, "stream_source"));
        objc_msgSend(v76, "sendEvent:", v89);

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v78 = objc_claimAutoreleasedReturnValue(os_log);
        v14 = v97;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
          -[MOEngagementHistoryManager didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:].cold.2();

        v20 = v91;
        v15 = v92;
        v18 = v95;
        v16 = v96;
        v17 = v98;
        v26 = v99;
        v19 = v101;
        goto LABEL_42;
      default:
        v61 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          -[MOEngagementHistoryManager didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:].cold.3();

        v34 = 0;
        break;
    }
    v35 = 0;
LABEL_35:
    v99 = 0;
    goto LABEL_36;
  }
  v25 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[MOEngagementHistoryManager didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:].cold.1();
LABEL_42:

}

- (void)didAppEntryEventPosted:(unint64_t)a3 withBundles:(id)a4 timestamp:(id)a5 duringInterval:(id)a6 withInfo:(id)a7 withTrialExperimentIDs:(id)a8 withOnboardingStatus:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id os_log;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  id v57;
  unsigned int v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v68;
  NSMutableArray *v69;
  NSMutableArray *v70;
  NSMutableArray *v72;
  void *v73;
  id obj;
  uint8_t buf;
  _BYTE v76[15];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];

  v13 = a4;
  v66 = a5;
  v65 = a6;
  v64 = a7;
  v59 = a8;
  v14 = a9;
  v72 = objc_opt_new(NSMutableArray);
  v70 = objc_opt_new(NSMutableArray);
  v69 = objc_opt_new(NSMutableArray);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  v63 = v14;
  if (v15)
  {
    v16 = v15;
    v73 = 0;
    v17 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleIdentifier"));
        if (v20
          && (v21 = (void *)v20,
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "suggestionID")),
              v22,
              v21,
              v22))
        {
          v23 = objc_alloc((Class)BMMomentsEngagementSuggestionIdentifier);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleIdentifier"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "suggestionID"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
          v28 = objc_msgSend(v23, "initWithBundleId:suggestionId:", v25, v27);

          if (v28)
          {
            -[NSMutableArray addObject:](v72, "addObject:", v28);
            v29 = objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getBMBundleSumaryForBundle:](self, "getBMBundleSumaryForBundle:", v19));

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getBundleType"));
            if (v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getBundleType"));
              -[NSMutableArray addObject:](v70, "addObject:", v31);

            }
            if (objc_msgSend(v19, "interfaceType") == (id)11)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resources"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", 0));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "name"));

              if (v34)
                -[NSMutableArray addObject:](v69, "addObject:", v34);

            }
            v73 = (void *)v29;
          }
        }
        else
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
          v28 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[MOEngagementHistoryManager didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:].cold.2(&buf, v76, v28);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    }
    while (v16);
  }
  else
  {
    v73 = 0;
  }

  v36 = objc_alloc((Class)BMMomentsEngagementAppEntryEvent);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "startDate"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "endDate"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("entryTotalCharacters")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters")));
  v41 = objc_msgSend(v36, "initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:bundleSummary:assets:", a3, 0, v66, v72, v37, v38, v39, v40, &__NSArray0__struct, 0, v70, v69, v73, &__NSArray0__struct);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("onboardingStatus")));
  v68 = v41;
  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("onboardingStatus")));
    v58 = +[MOBiomeDonationUtility mapOnboardingFlowCompletion:](MOBiomeDonationUtility, "mapOnboardingFlowCompletion:", (int)objc_msgSend(v43, "intValue"));

  }
  else
  {
    v58 = 0;
  }
  v57 = objc_alloc((Class)BMMomentsEngagement);
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("journalIsInstalled")));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("journalConfigLockJournal")));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("journalConfigSkipSuggestions")));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("settingSwitchActivity")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("settingSwitchCommunication")));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("settingSwitchLocation")));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("settingSwitchMedia")));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("settingSwitchPeople")));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("settingSwitchPhoto")));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("settingSwitchStateOfMind")));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("settingSwitchReflection")));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("settingBroaderSwitchLocation")));
  v52 = objc_msgSend(v57, "initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", 0, v68, 0, v58, v62, v61, v60, v56, v44, v45, v46, v47, v48,
          v49,
          v50,
          v51);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_source](self, "stream_source"));
  objc_msgSend(v53, "sendEvent:", v52);

  v54 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
  v55 = objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    -[MOEngagementHistoryManager didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:].cold.1();

  -[MOEngagementHistoryManager submitAppEntryEngagementEventAnalytics:appEntryEngagementType:timestamp:withInfo:withTrialExperimentIDs:](self, "submitAppEntryEngagementEventAnalytics:appEntryEngagementType:timestamp:withInfo:withTrialExperimentIDs:", obj, a3, v66, v64, v59);
}

- (void)submitSuggestionEngagementEventAnalytics:(id)a3 suggestionEngagementType:(unint64_t)a4 timestamp:(id)a5 withContext:(id)a6 withTrialExperimentIDs:(id)a7
{
  id v11;
  id v12;
  NSArray *suggestionEngagementTypesEligibleForRawExternalAnalytics;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _UNKNOWN **v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  float v53;
  double v54;
  void *v55;
  void *v56;
  float v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id os_log;
  NSObject *v65;
  id v66;
  void *v67;
  id v68;
  id obj;
  uint64_t v70;
  id v71;
  void *v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  NSObject *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  NSMutableDictionary *v85;
  _BYTE v86[128];

  v11 = a3;
  v74 = a5;
  v75 = a6;
  v12 = a7;
  if (self->_isInternalBuild
    || (suggestionEngagementTypesEligibleForRawExternalAnalytics = self->_suggestionEngagementTypesEligibleForRawExternalAnalytics,
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4)),
        LODWORD(suggestionEngagementTypesEligibleForRawExternalAnalytics) = -[NSArray containsObject:](suggestionEngagementTypesEligibleForRawExternalAnalytics, "containsObject:", v14), v14, (_DWORD)suggestionEngagementTypesEligibleForRawExternalAnalytics))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v79 = v15;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "components:fromDate:", 764, v15));
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DA760, &off_1002DD0F8, &off_1002DD108));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("rankingDictionaries")));
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v68 = v11;
    obj = v11;
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    if (v76)
    {
      v70 = *(_QWORD *)v81;
      v71 = v12;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v81 != v70)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)v16);
          v18 = objc_opt_new(NSMutableDictionary);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v73, "year")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, CFSTR("submissionTimeYear"));

          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v73, "month")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, CFSTR("submissionTimeMonth"));

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v73, "day")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v21, CFSTR("submissionTimeDay"));

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v73, "hour")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v22, CFSTR("submissionTimeHour"));

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v73, "minute")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v23, CFSTR("submissionTimeMinute"));

          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", &off_1002DCD08, CFSTR("scalingFactorForAnalytics"));
          if (v12)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "experimentId"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v24, CFSTR("trialExperimentId"));

            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v12, "deploymentId")));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringValue"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v26, CFSTR("trialDeploymentId"));

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "treatmentId"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v27, CFSTR("trialTreatmentId"));

          }
          -[NSObject timeIntervalSinceDate:](v79, "timeIntervalSinceDate:", v74);
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v28, v78));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v29, CFSTR("engagementTimeBucketed"));

          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", &off_1002DA700, CFSTR("engagementType"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v30, CFSTR("suggestionEngagementSubType"));

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "hash")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v32, CFSTR("bundleId"));

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "suggestionID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "hash")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v34, CFSTR("suggestionId"));

          if (a4 != 9)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subSuggestionIDs"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager _convertStringArrayIntoCombinedHashedString:](self, "_convertStringArrayIntoCombinedHashedString:", v35));

            if (v36)
              -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v36, CFSTR("subSuggestionIds"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subBundleIDs"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager _convertStringArrayIntoCombinedHashedString:](self, "_convertStringArrayIntoCombinedHashedString:", v37));

            if (v38)
              -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v38, CFSTR("subBundleIds"));

          }
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "interfaceType")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v39, CFSTR("interfaceType"));

          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "bundleSubType")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v40, CFSTR("bundleSubType"));

          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "bundleSuperType")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v41, CFSTR("bundleSuperType"));

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
          -[NSObject timeIntervalSinceDate:](v79, "timeIntervalSinceDate:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v43, v78));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v44, CFSTR("bundleStartTimeBucketed"));

          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "endDate"));
          -[NSObject timeIntervalSinceDate:](v79, "timeIntervalSinceDate:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v46, v78));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v47, CFSTR("bundleEndTimeBucketed"));

          if (objc_msgSend(v17, "interfaceType") == (id)11)
            v48 = &off_1002DA778;
          else
            v48 = &off_1002DA790;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v48, CFSTR("engagementEntryType"));
          if (v77)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", v49));

            if (v50)
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab")));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v51, CFSTR("ordinalRank"));

              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("rankingScore")));
              objc_msgSend(v52, "floatValue");
              *(float *)&v54 = v53 * 10000.0;
              v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v54));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v55, CFSTR("rankingScore"));

              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
              objc_msgSend(v56, "floatValue");
              *(float *)&v58 = v57 * 10000.0;
              v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v58));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v59, CFSTR("bundleGoodnessScore"));

              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
              v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v60, "intValue")));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v61, CFSTR("visibilityStateForUI"));

            }
          }
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("viewContainerName")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v62, CFSTR("viewContainerName"));

          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("viewVisibleTime")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v63, CFSTR("viewVisibleTime"));

          AnalyticsSendEvent(CFSTR("com.apple.Moments.MOUsageData"), v18);
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          v65 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            v85 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "Suggestion engagement signal analytics submitted: %{private}@", buf, 0xCu);
          }

          v16 = (char *)v16 + 1;
          v12 = v71;
        }
        while (v76 != v16);
        v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
      }
      while (v76);
    }

    v11 = v68;
  }
  else
  {
    v66 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    v79 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      -[MOEngagementHistoryManager submitSuggestionEngagementEventAnalytics:suggestionEngagementType:timestamp:withContext:withTrialExperimentIDs:].cold.1((unsigned __int8 *)&self->_isInternalBuild, a4, v79);
  }

}

- (void)submitAppEntryEngagementEventAnalytics:(id)a3 appEntryEngagementType:(unint64_t)a4 timestamp:(id)a5 withInfo:(id)a6 withTrialExperimentIDs:(id)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *v15;
  void *i;
  void *v17;
  NSMutableDictionary *v18;
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
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _UNKNOWN **v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  signed int v55;
  void *v56;
  id os_log;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  signed int v77;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  id v82;
  NSMutableDictionary *obj;
  uint64_t v84;
  void *v85;
  id v86;
  void *v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  NSMutableDictionary *v100;
  _BYTE v101[128];

  v10 = a3;
  v89 = a5;
  v11 = a6;
  v12 = a7;
  v13 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v93 = (void *)v13;
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "components:fromDate:", 764, v13));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DA760, &off_1002DD0F8, &off_1002DD118));
  if (v10 && objc_msgSend(v10, "count"))
  {
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v15 = (NSMutableDictionary *)v10;
    v90 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
    if (v90)
    {
      v81 = v14;
      v82 = v10;
      v84 = *(_QWORD *)v96;
      v85 = v11;
      v86 = v12;
      obj = v15;
      do
      {
        for (i = 0; i != v90; i = (char *)i + 1)
        {
          if (*(_QWORD *)v96 != v84)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
          v18 = objc_opt_new(NSMutableDictionary);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "year")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, CFSTR("submissionTimeYear"));

          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "month")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, CFSTR("submissionTimeMonth"));

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "day")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v21, CFSTR("submissionTimeDay"));

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "hour")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v22, CFSTR("submissionTimeHour"));

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "minute")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v23, CFSTR("submissionTimeMinute"));

          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", &off_1002DCD08, CFSTR("scalingFactorForAnalytics"));
          if (v12)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "experimentId"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v24, CFSTR("trialExperimentId"));

            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v12, "deploymentId")));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringValue"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v26, CFSTR("trialDeploymentId"));

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "treatmentId"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v27, CFSTR("trialTreatmentId"));

          }
          objc_msgSend(v93, "timeIntervalSinceDate:", v89, v81, v82);
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v28, v92));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v29, CFSTR("engagementTimeBucketed"));

          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", &off_1002DA778, CFSTR("engagementType"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v30, CFSTR("appEntryEngagementSubType"));

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "hash")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v32, CFSTR("bundleId"));

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "suggestionID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "hash")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v34, CFSTR("suggestionId"));

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subSuggestionIDs"));
          v36 = objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager _convertStringArrayIntoCombinedHashedString:](self, "_convertStringArrayIntoCombinedHashedString:", v35));

          if (v36)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v36, CFSTR("subSuggestionIds"));
          v91 = (void *)v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subBundleIDs"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager _convertStringArrayIntoCombinedHashedString:](self, "_convertStringArrayIntoCombinedHashedString:", v37));

          if (v38)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v38, CFSTR("subBundleIds"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "interfaceType")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v39, CFSTR("interfaceType"));

          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "bundleSubType")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v40, CFSTR("bundleSubType"));

          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "bundleSuperType")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v41, CFSTR("bundleSuperType"));

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
          objc_msgSend(v93, "timeIntervalSinceDate:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v43, v92));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v44, CFSTR("bundleStartTimeBucketed"));

          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "endDate"));
          objc_msgSend(v93, "timeIntervalSinceDate:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v46, v92));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v47, CFSTR("bundleEndTimeBucketed"));

          if (objc_msgSend(v17, "interfaceType") == (id)11)
            v48 = &off_1002DA778;
          else
            v48 = &off_1002DA790;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v48, CFSTR("engagementEntryType"));
          v11 = v85;
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("entryTotalCharacters")));

          if (v49)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("entryTotalCharacters")));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v50, CFSTR("totalCharacters"));

          }
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters")));

          if (v51)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters")));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v52, CFSTR("addedCharacters"));

          }
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters")));

          v12 = v86;
          if (v53)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters")));
            v55 = objc_msgSend(v54, "intValue");

            v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEngagementHistoryManager determineAddedCharacterBinRange:](self, "determineAddedCharacterBinRange:", v55)));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v56, CFSTR("addedCharactersBinned"));

          }
          AnalyticsSendEvent(CFSTR("com.apple.Moments.MOUsageData"), v18);
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          v58 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            v100 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "App entry engagement signal analytics submitted: %{private}@", buf, 0xCu);
          }

        }
        v15 = obj;
        v90 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
      }
      while (v90);
      v14 = v81;
      v10 = v82;
    }
  }
  else
  {
    v15 = objc_opt_new(NSMutableDictionary);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "year")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v59, CFSTR("submissionTimeYear"));

    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "month")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v60, CFSTR("submissionTimeMonth"));

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "day")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v61, CFSTR("submissionTimeDay"));

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "hour")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v62, CFSTR("submissionTimeHour"));

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v88, "minute")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v63, CFSTR("submissionTimeMinute"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", &off_1002DCD08, CFSTR("scalingFactorForAnalytics"));
    if (v12)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "experimentId"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v64, CFSTR("trialExperimentId"));

      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v12, "deploymentId")));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "stringValue"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v66, CFSTR("trialDeploymentId"));

      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "treatmentId"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v67, CFSTR("trialTreatmentId"));

    }
    objc_msgSend(v93, "timeIntervalSinceDate:", v89);
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v68, v92));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v69, CFSTR("engagementTimeBucketed"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", &off_1002DA778, CFSTR("engagementType"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v70, CFSTR("appEntryEngagementSubType"));

    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("entryTotalCharacters")));
    if (v71)
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("entryTotalCharacters")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v72, CFSTR("totalCharacters"));

    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters")));

    if (v73)
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v74, CFSTR("addedCharacters"));

    }
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters")));

    if (v75)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("entryAddedCharacters")));
      v77 = objc_msgSend(v76, "intValue");

      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEngagementHistoryManager determineAddedCharacterBinRange:](self, "determineAddedCharacterBinRange:", v77)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v78, CFSTR("addedCharactersBinned"));

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", &off_1002DA700, CFSTR("engagementEntryType"));
    AnalyticsSendEvent(CFSTR("com.apple.Moments.MOUsageData"), v15);
    v79 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    v80 = objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      -[MOEngagementHistoryManager submitAppEntryEngagementEventAnalytics:appEntryEngagementType:timestamp:withInfo:withTrialExperimentIDs:].cold.1();

  }
}

- (void)updateBundle:(id)a3 forSuggestionEvent:(id)a4 withSummary:(id)a5
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v7, "type"))
  {
    case 0u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsUnknown")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsUnknown"));
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(os_log);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 1u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsSelected")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsSelected"));
        v10 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v10);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 2u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsShared")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsShared"));
        v11 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v11);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 3u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsLiked")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsLiked"));
        v12 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v12);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 4u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsDisliked")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsDisliked"));
        v13 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v13);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 5u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsDismissed")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsDismissed"));
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v14);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 6u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsDeleted")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsDeleted"));
        v15 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v15);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 7u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsHidden")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsHidden"));
        v16 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 8u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsQuickAddEntry")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsQuickAddEntry"));
        v17 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 9u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsViewed")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsViewed"));
        v18 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v18);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0xBu:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsFavorite")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsFavorite"));
        v20 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v20);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0xCu:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsThumbsUp")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsThumbsUp"));
        v21 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v21);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0xDu:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionEntryCreated")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionEntryCreated"));
        v22 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v22);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0xEu:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionEntryEdited")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionEntryEdited"));
        v23 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v23);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0xFu:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionEntryDeleted")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionEntryDeleted"));
        v24 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v24);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0x10u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionEntryCancelled")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionEntryCancelled"));
        v25 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v25);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0x11u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsAnnotated")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionsAnnotated"));
        v26 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v26);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0x19u:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionEntryCreatedWithUpdates")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionEntryCreatedWithUpdates"));
        v27 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v27);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0x1Au:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionNotificationQueued")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionNotificationQueued"));
        v28 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v28);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0x1Bu:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionNotificationDequeued")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionNotificationDequeued"));
        v29 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v29);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0x1Cu:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionNotificationTapped")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionNotificationTapped"));
        v30 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v30);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0x1Du:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionNotificationDismissed")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionNotificationDismissed"));
        v31 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v31);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0x1Eu:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionNotificationPosted")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionNotificationPosted"));
        v32 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v32);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_76;
        goto LABEL_75;
      }
      break;
    case 0x1Fu:
      if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionNotificationOverriden")) & 1) == 0)
      {
        objc_msgSend(v6, "setSuggestionEngagementEvent:", CFSTR("suggestionNotificationOverriden"));
        v33 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v9 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
LABEL_75:
          -[MOEngagementHistoryManager updateBundle:forSuggestionEvent:withSummary:].cold.2();
        goto LABEL_76;
      }
      break;
    default:
      v19 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
      v9 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[MOEngagementHistoryManager updateBundle:forSuggestionEvent:withSummary:].cold.1(v7);
LABEL_76:

      if (objc_msgSend(v7, "type") == 9)
        objc_msgSend(v6, "setSuggestionEngagementViewCount:", (char *)objc_msgSend(v6, "suggestionEngagementViewCount") + 1);
      break;
  }

}

- (void)updateBundle:(id)a3 forAppEntryEvent:(id)a4
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  switch(objc_msgSend(v6, "type"))
  {
    case 0u:
      if ((objc_msgSend(v5, "hasAppEntryEngagementEvent:", CFSTR("appUnknown")) & 1) == 0)
      {
        objc_msgSend(v5, "setAppEntryEngagementEvent:", CFSTR("appUnknown"));
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v8 = objc_claimAutoreleasedReturnValue(os_log);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_19;
        goto LABEL_18;
      }
      break;
    case 1u:
      if ((objc_msgSend(v5, "hasAppEntryEngagementEvent:", CFSTR("appEntryCreated")) & 1) == 0)
      {
        objc_msgSend(v5, "setAppEntryEngagementEvent:", CFSTR("appEntryCreated"));
        v10 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v8 = objc_claimAutoreleasedReturnValue(v10);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_19;
        goto LABEL_18;
      }
      break;
    case 2u:
      if ((objc_msgSend(v5, "hasAppEntryEngagementEvent:", CFSTR("appEntryEdited")) & 1) == 0)
      {
        objc_msgSend(v5, "setAppEntryEngagementEvent:", CFSTR("appEntryEdited"));
        v11 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v8 = objc_claimAutoreleasedReturnValue(v11);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_19;
        goto LABEL_18;
      }
      break;
    case 3u:
      if ((objc_msgSend(v5, "hasAppEntryEngagementEvent:", CFSTR("appEntryDeleted")) & 1) == 0)
      {
        objc_msgSend(v5, "setAppEntryEngagementEvent:", CFSTR("appEntryDeleted"));
        v12 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v8 = objc_claimAutoreleasedReturnValue(v12);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_19;
        goto LABEL_18;
      }
      break;
    case 4u:
      if ((objc_msgSend(v5, "hasAppEntryEngagementEvent:", CFSTR("appEntryCancelled")) & 1) == 0)
      {
        objc_msgSend(v5, "setAppEntryEngagementEvent:", CFSTR("appEntryCancelled"));
        v13 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        v8 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
LABEL_18:
          -[MOEngagementHistoryManager updateBundle:forAppEntryEvent:].cold.2();
        goto LABEL_19;
      }
      break;
    default:
      v9 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
      v8 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[MOEngagementHistoryManager updateBundle:forAppEntryEvent:].cold.1(v6);
LABEL_19:

      break;
  }

}

- (id)getInterfaceTypeCountForSuggestionEngagmentEvent:(id)a3 from:(id)a4 to:(id)a5 onceForEachBundle:(BOOL)a6 skipForEvents:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  NSMutableSet *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  NSMutableSet *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  NSCountedSet *v31;
  NSMutableSet *v32;
  void *v33;
  NSMutableDictionary *v34;
  id v35;
  id v36;
  NSMutableDictionary *v37;
  NSMutableDictionary *v38;
  void *v39;
  NSMutableDictionary *v40;
  id v42;
  unsigned int v43;
  NSMutableDictionary *v45;
  BOOL v46;
  void *v47;
  _QWORD v48[4];
  NSMutableDictionary *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  NSMutableSet *v53;
  BOOL v54;
  _QWORD v55[4];
  id v56;
  id v57;
  unsigned int v58;
  _QWORD v59[4];
  NSMutableSet *v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v45 = objc_opt_new(NSMutableDictionary);
  v46 = v8;
  if (v8)
    v15 = objc_opt_new(NSMutableSet);
  else
    v15 = 0;
  v47 = v11;
  v43 = +[MOEngagementHistoryManager suggestionEventToEnum:](MOEngagementHistoryManager, "suggestionEventToEnum:", v11);
  if (objc_msgSend(v14, "count"))
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v42 = v14;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v68 != v19)
            objc_enumerationMutation(v16);
          if (+[MOEngagementHistoryManager suggestionEventToEnum:](MOEngagementHistoryManager, "suggestionEventToEnum:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i), v42))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
            objc_msgSend(0, "addObject:", v21);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      }
      while (v18);
    }

    v14 = v42;
  }
  if (objc_msgSend(0, "count", v42))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke;
    v63[3] = &unk_1002B3D98;
    v64 = 0;
    v65 = v12;
    v66 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "filterWithIsIncluded:", v63));

    v24 = objc_opt_new(NSMutableSet);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "reduceWithInitial:nextPartialResult:", v24, &__block_literal_global_273));

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3;
    v61[3] = &unk_1002B3E00;
    v62 = v14;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_275;
    v59[3] = &unk_1002B3E28;
    v60 = v15;
    v26 = objc_msgSend(v25, "sinkWithCompletion:receiveInput:", v61, v59);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2_277;
  v55[3] = &unk_1002B3E50;
  v58 = v43;
  v56 = v12;
  v57 = v13;
  v28 = v13;
  v29 = v12;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "filterWithIsIncluded:", v55));

  v31 = objc_opt_new(NSCountedSet);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_279;
  v52[3] = &unk_1002B3E78;
  v53 = v15;
  v54 = v46;
  v32 = v15;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "reduceWithInitial:nextPartialResult:", v31, v52));

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4;
  v50[3] = &unk_1002B3E00;
  v51 = v47;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_281;
  v48[3] = &unk_1002B3EA0;
  v34 = v45;
  v49 = v34;
  v35 = v47;
  v36 = objc_msgSend(v33, "sinkWithCompletion:receiveInput:", v50, v48);
  v37 = v49;
  v38 = v34;
  v39 = v14;
  v40 = v38;

  return v40;
}

id __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));

  if (v4)
  {
    v5 = (void *)a1[4];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "type")));
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      if (objc_msgSend(v7, "isOnOrAfter:", a1[5]))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
        v9 = objc_msgSend(v8, "isOnOrBefore:", a1[6]);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

NSMutableSet *__cdecl __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2(id a1, NSMutableSet *a2, BMStoreEvent *a3)
{
  NSMutableSet *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a3, "eventBody"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionEvent"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullBundleOrderedSet", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));

        if (v13)
          -[NSMutableSet addObject:](v4, "addObject:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v4;
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1();

  }
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_275(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
}

id __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2_277(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));

  if (v4 && objc_msgSend(v4, "type") == *(_DWORD *)(a1 + 48))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
    if (objc_msgSend(v5, "isOnOrAfter:", *(_QWORD *)(a1 + 32)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      v7 = objc_msgSend(v6, "isOnOrBefore:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_279(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "eventBody"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suggestionEvent"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullBundleOrderedSet"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "suggestionId"));

        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v15) & 1) == 0)
        {
          if (*(_BYTE *)(a1 + 40) && v15)
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "interfaceType")));
          objc_msgSend(v5, "addObject:", v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v5;
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4_cold_1();

  }
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_281(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v3, "countForObject:", v8)));
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)getInterfaceTypeCountForSuggestionEngagmentEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", v4, v5, v6, 1, 0));

  return v7;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsViewedFromStartDate:(id)a3 toEndDate:(id)a4
{
  return -[MOEngagementHistoryManager getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", CFSTR("suggestionsViewed"), a3, a4, 1, 0);
}

- (id)getInterfaceTypeCountForUniqueSuggestionsViewedButNotEngagedFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;

  v11 = CFSTR("suggestionsSelected");
  v12 = CFSTR("suggestionsQuickAddEntry");
  v13 = CFSTR("suggestionsDeleted");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", CFSTR("suggestionsViewed"), v7, v6, 1, v8, v11, v12, v13));

  return v9;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsSelectedOnlyFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[0] = CFSTR("suggestionsQuickAddEntry");
  v11[1] = CFSTR("suggestionsDeleted");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", CFSTR("suggestionsSelected"), v7, v6, 1, v8));

  return v9;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsQuickAddEntryFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v11;

  v11 = CFSTR("suggestionsDeleted");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", CFSTR("suggestionsQuickAddEntry"), v7, v6, 1, v8, v11));

  return v9;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsDeletedFromStartDate:(id)a3 toEndDate:(id)a4
{
  return -[MOEngagementHistoryManager getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getInterfaceTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", CFSTR("suggestionsDeleted"), a3, a4, 1, 0);
}

- (id)getEngagementStreamAsJson
{
  NSMutableArray *v3;
  void *v4;
  NSMutableArray *v5;
  id v6;
  NSMutableArray *v7;
  _QWORD v9[4];
  NSMutableArray *v10;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __55__MOEngagementHistoryManager_getEngagementStreamAsJson__block_invoke_2;
  v9[3] = &unk_1002B3F08;
  v5 = v3;
  v10 = v5;
  v6 = objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_283, v9);

  if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v5))
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

void __55__MOEngagementHistoryManager_getEngagementStreamAsJson__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "jsonDictionary"));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (id)getEvergreenTypeCountForSuggestionEngagmentEvent:(id)a3 from:(id)a4 to:(id)a5 onceForEachBundle:(BOOL)a6 skipForEvents:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSMutableSet *v16;
  MOEngagementHistoryManager *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  NSMutableSet *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSMutableSet *v32;
  id v33;
  id v34;
  void *v35;
  NSCountedSet *v36;
  NSMutableSet *v37;
  void *v38;
  NSMutableDictionary *v39;
  id v40;
  id v41;
  NSMutableDictionary *v42;
  NSMutableDictionary *v43;
  id v45;
  NSMutableSet *v46;
  id v47;
  unsigned int v48;
  NSMutableDictionary *v49;
  BOOL v50;
  _QWORD v51[4];
  NSMutableDictionary *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  NSMutableSet *v56;
  BOOL v57;
  _QWORD v58[4];
  id v59;
  id v60;
  unsigned int v61;
  _QWORD v62[4];
  NSMutableSet *v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v49 = objc_opt_new(NSMutableDictionary);
  v50 = v8;
  if (v8)
    v16 = objc_opt_new(NSMutableSet);
  else
    v16 = 0;
  v48 = +[MOEngagementHistoryManager suggestionEventToEnum:](MOEngagementHistoryManager, "suggestionEventToEnum:", v12);
  v17 = self;
  if (objc_msgSend(v15, "count"))
  {
    v45 = v13;
    v46 = v16;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v47 = v15;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v71 != v21)
            objc_enumerationMutation(v18);
          if (+[MOEngagementHistoryManager suggestionEventToEnum:](MOEngagementHistoryManager, "suggestionEventToEnum:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i), v45, v46, v47))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
            objc_msgSend(0, "addObject:", v23);

            self = v17;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v20);
    }

    v16 = v46;
    v15 = v47;
    v13 = v45;
  }
  if (objc_msgSend(0, "count", v45, v46, v47))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke;
    v66[3] = &unk_1002B3D98;
    v67 = 0;
    v68 = v13;
    v69 = v14;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "filterWithIsIncluded:", v66));

    v26 = objc_opt_new(NSMutableSet);
    v27 = v13;
    v28 = v15;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "reduceWithInitial:nextPartialResult:", v26, &__block_literal_global_286));

    self = v17;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3;
    v64[3] = &unk_1002B3E00;
    v65 = v12;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_287;
    v62[3] = &unk_1002B3E28;
    v63 = v16;
    v30 = objc_msgSend(v29, "sinkWithCompletion:receiveInput:", v64, v62);

    v15 = v28;
    v13 = v27;

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2_288;
  v58[3] = &unk_1002B3E50;
  v61 = v48;
  v59 = v13;
  v60 = v14;
  v32 = v16;
  v33 = v14;
  v34 = v13;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "filterWithIsIncluded:", v58));

  v36 = objc_opt_new(NSCountedSet);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_289;
  v55[3] = &unk_1002B3E78;
  v56 = v32;
  v57 = v50;
  v37 = v32;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "reduceWithInitial:nextPartialResult:", v36, v55));

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4;
  v53[3] = &unk_1002B3E00;
  v54 = v12;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_290;
  v51[3] = &unk_1002B3EA0;
  v39 = v49;
  v52 = v39;
  v40 = v12;
  v41 = objc_msgSend(v38, "sinkWithCompletion:receiveInput:", v53, v51);
  v42 = v52;
  v43 = v39;

  return v43;
}

id __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));

  if (v4)
  {
    v5 = (void *)a1[4];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "type")));
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      if (objc_msgSend(v7, "isOnOrAfter:", a1[5]))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
        v9 = objc_msgSend(v8, "isOnOrBefore:", a1[6]);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

NSMutableSet *__cdecl __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2(id a1, NSMutableSet *a2, BMStoreEvent *a3)
{
  NSMutableSet *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a3, "eventBody"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionEvent"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullBundleOrderedSet", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleId"));

        if (v13)
          -[NSMutableSet addObject:](v4, "addObject:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v4;
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1();

  }
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_287(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
}

id __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2_288(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));

  if (v4 && objc_msgSend(v4, "type") == *(_DWORD *)(a1 + 48))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
    if (objc_msgSend(v5, "isOnOrAfter:", *(_QWORD *)(a1 + 32)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      v7 = objc_msgSend(v6, "isOnOrBefore:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_289(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "eventBody"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suggestionEvent"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullBundleOrderedSet", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleId"));

        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v15) & 1) == 0)
        {
          if (*(_BYTE *)(a1 + 40) && v15)
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleEvergreenType"));
          if (v16)
            objc_msgSend(v5, "addObject:", v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v5;
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4_cold_1();

  }
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_290(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v3, "countForObject:", v8)));
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)getEvergreenTypeCountForSuggestionEngagmentEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", v4, v5, v6, 1, 0));

  return v7;
}

- (id)getEvergreenCountForSuggestionsSelectedOnlyFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[0] = CFSTR("suggestionsQuickAddEntry");
  v11[1] = CFSTR("suggestionsDeleted");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", CFSTR("suggestionsSelected"), v7, v6, 0, v8));

  return v9;
}

- (id)getEvergreenTypeCountForSuggestionsQuickAddEntryFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v11;

  v11 = CFSTR("suggestionsDeleted");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", CFSTR("suggestionsQuickAddEntry"), v7, v6, 0, v8, v11));

  return v9;
}

- (id)getEvergreenTypeCountForSuggestionsViewedFromStartDate:(id)a3 toEndDate:(id)a4
{
  return -[MOEngagementHistoryManager getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", CFSTR("suggestionsViewed"), a3, a4, 0, 0);
}

- (id)getEvergreenTypeCountForSuggestionsDeletedFromStartDate:(id)a3 toEndDate:(id)a4
{
  return -[MOEngagementHistoryManager getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:](self, "getEvergreenTypeCountForSuggestionEngagmentEvent:from:to:onceForEachBundle:skipForEvents:", CFSTR("suggestionsDeleted"), a3, a4, 0, 0);
}

- (id)getInterfaceTypeCountForAppEntryEvent:(id)a3 withMinAddedCharacterCount:(int64_t)a4 andMaxAddedCharacterCount:(int64_t)a5 fromStartDate:(id)a6 toEndDate:(id)a7 onceForEachBundle:(BOOL)a8 skipForEvents:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  NSMutableSet *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableSet *v27;
  MOEngagementHistoryManager *v28;
  void *v29;
  id v30;
  NSMutableSet *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  NSCountedSet *v36;
  NSMutableSet *v37;
  void *v38;
  NSMutableDictionary *v39;
  id v40;
  id v41;
  id v42;
  NSMutableDictionary *v43;
  NSMutableDictionary *v44;
  MOEngagementHistoryManager *v46;
  NSMutableSet *v47;
  int64_t v48;
  unsigned int v49;
  NSMutableDictionary *v51;
  void *v52;
  id v53;
  _QWORD v54[4];
  NSMutableDictionary *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[4];
  NSMutableSet *v60;
  BOOL v61;
  _QWORD v62[4];
  id v63;
  id v64;
  int64_t v65;
  int64_t v66;
  unsigned int v67;
  _QWORD v68[4];
  NSMutableSet *v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];

  v9 = a8;
  v14 = a3;
  v53 = a6;
  v15 = a7;
  v16 = a9;
  v51 = objc_opt_new(NSMutableDictionary);
  if (v9)
    v17 = objc_opt_new(NSMutableSet);
  else
    v17 = 0;
  v49 = +[MOEngagementHistoryManager appEntryEventToEnum:](MOEngagementHistoryManager, "appEntryEventToEnum:", v14);
  if (objc_msgSend(v16, "count"))
  {
    v46 = self;
    v47 = v17;
    v48 = a5;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v77 != v21)
            objc_enumerationMutation(v18);
          if (+[MOEngagementHistoryManager appEntryEventToEnum:](MOEngagementHistoryManager, "appEntryEventToEnum:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i)))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
            objc_msgSend(0, "addObject:", v23);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      }
      while (v20);
    }

    v17 = v47;
    a5 = v48;
    self = v46;
  }
  v52 = v14;
  v24 = v15;
  if (objc_msgSend(0, "count"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke;
    v72[3] = &unk_1002B3D98;
    v73 = 0;
    v74 = v53;
    v75 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "filterWithIsIncluded:", v72));

    v27 = objc_opt_new(NSMutableSet);
    v28 = self;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "reduceWithInitial:nextPartialResult:", v27, &__block_literal_global_291_0));

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3;
    v70[3] = &unk_1002B3E00;
    v71 = v52;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_292;
    v68[3] = &unk_1002B3E28;
    v69 = v17;
    v30 = objc_msgSend(v29, "sinkWithCompletion:receiveInput:", v70, v68);

    self = v28;
  }
  v31 = v17;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2_293;
  v62[3] = &unk_1002B3F70;
  v67 = v49;
  v63 = v53;
  v64 = v24;
  v65 = a4;
  v66 = a5;
  v33 = v24;
  v34 = v53;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "filterWithIsIncluded:", v62));

  v36 = objc_opt_new(NSCountedSet);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_294;
  v59[3] = &unk_1002B3E78;
  v60 = v31;
  v61 = v9;
  v37 = v31;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "reduceWithInitial:nextPartialResult:", v36, v59));

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4;
  v56[3] = &unk_1002B3F98;
  v57 = v52;
  v58 = v16;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_295;
  v54[3] = &unk_1002B3EA0;
  v39 = v51;
  v55 = v39;
  v40 = v16;
  v41 = v52;
  v42 = objc_msgSend(v38, "sinkWithCompletion:receiveInput:", v56, v54);
  v43 = v55;
  v44 = v39;

  return v44;
}

id __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));

  if (v4)
  {
    v5 = (void *)a1[4];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "type")));
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      if (objc_msgSend(v7, "isOnOrAfter:", a1[5]))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
        v9 = objc_msgSend(v8, "isOnOrBefore:", a1[6]);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

NSMutableSet *__cdecl __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2(id a1, NSMutableSet *a2, BMStoreEvent *a3)
{
  NSMutableSet *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a3, "eventBody"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entryEvent"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));
          -[NSMutableSet addObject:](v4, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v4;
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1();

  }
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_292(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
}

BOOL __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2_293(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));

  if (v4 && objc_msgSend(v4, "type") == *(_DWORD *)(a1 + 64))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
    if (objc_msgSend(v5, "isOnOrAfter:", *(_QWORD *)(a1 + 32)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      v7 = objc_msgSend(v6, "isOnOrBefore:", *(_QWORD *)(a1 + 40))
        && *(_QWORD *)(a1 + 48) <= (int)objc_msgSend(v4, "addedCharacters")
        && *(_QWORD *)(a1 + 56) >= (int)objc_msgSend(v4, "addedCharacters");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_294(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v25;
  id obj;
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

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "eventBody"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryEvent"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v13 = *(void **)(a1 + 32);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));
        LOBYTE(v13) = objc_msgSend(v13, "containsObject:", v14);

        if ((v13 & 1) == 0)
        {
          if (*(_BYTE *)(a1 + 40))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));

            if (v15)
            {
              v16 = *(void **)(a1 + 32);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));
              objc_msgSend(v16, "addObject:", v17);

            }
          }
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bundleInterfaceTypes"));
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(_QWORD *)v28 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v23, "length"))
                  objc_msgSend(v5, "addObject:", v23);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v20);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  return v5;
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4_cold_1();

  }
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_295(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  MOEventBundle *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v7);
        v9 = [MOEventBundle alloc];
        v10 = -[MOEventBundle getInterfaceTypeEnum:](v9, "getInterfaceTypeEnum:", v8);

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "countForObject:", v8)));
        v12 = *(void **)(a1 + 32);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (id)getInterfaceTypeCountForAppEntryEvent:(id)a3 withMinimumAddedCharacters:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getInterfaceTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:](self, "getInterfaceTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:", v6, a4, 0x7FFFFFFFFFFFFFFFLL, v7, v8, 1, 0));

  return v9;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedFromStartDate:(id)a3 toEndDate:(id)a4 withMinimumAddedCharacters:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v13;

  v13 = CFSTR("appEntryDeleted");
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getInterfaceTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:](self, "getInterfaceTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:", CFSTR("appEntryCreated"), a5, 0x7FFFFFFFFFFFFFFFLL, v9, v8, 1, v10));

  return v11;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedButNoWritingFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  const __CFString *v12;

  v11 = CFSTR("appEntryDeleted");
  v12 = CFSTR("appEntryEdited");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getInterfaceTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:](self, "getInterfaceTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:", CFSTR("appEntryCreated"), 0, 0, v7, v6, 1, v8, v11, v12));

  return v9;
}

- (id)getEvergreenTypeCountForAppEntryEvent:(id)a3 withMinAddedCharacterCount:(int64_t)a4 andMaxAddedCharacterCount:(int64_t)a5 fromStartDate:(id)a6 toEndDate:(id)a7 onceForEachBundle:(BOOL)a8 skipForEvents:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  NSMutableSet *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableSet *v27;
  MOEngagementHistoryManager *v28;
  void *v29;
  id v30;
  NSMutableSet *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  NSCountedSet *v36;
  NSMutableSet *v37;
  void *v38;
  NSMutableDictionary *v39;
  id v40;
  id v41;
  id v42;
  NSMutableDictionary *v43;
  NSMutableDictionary *v44;
  MOEngagementHistoryManager *v46;
  NSMutableSet *v47;
  int64_t v48;
  unsigned int v49;
  NSMutableDictionary *v51;
  void *v52;
  id v53;
  _QWORD v54[4];
  NSMutableDictionary *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[4];
  NSMutableSet *v60;
  BOOL v61;
  _QWORD v62[4];
  id v63;
  id v64;
  int64_t v65;
  int64_t v66;
  unsigned int v67;
  _QWORD v68[4];
  NSMutableSet *v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];

  v9 = a8;
  v14 = a3;
  v53 = a6;
  v15 = a7;
  v16 = a9;
  v51 = objc_opt_new(NSMutableDictionary);
  if (v9)
    v17 = objc_opt_new(NSMutableSet);
  else
    v17 = 0;
  v49 = +[MOEngagementHistoryManager appEntryEventToEnum:](MOEngagementHistoryManager, "appEntryEventToEnum:", v14);
  if (objc_msgSend(v16, "count"))
  {
    v46 = self;
    v47 = v17;
    v48 = a5;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v77 != v21)
            objc_enumerationMutation(v18);
          if (+[MOEngagementHistoryManager appEntryEventToEnum:](MOEngagementHistoryManager, "appEntryEventToEnum:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i)))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
            objc_msgSend(0, "addObject:", v23);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      }
      while (v20);
    }

    v17 = v47;
    a5 = v48;
    self = v46;
  }
  v52 = v14;
  v24 = v15;
  if (objc_msgSend(0, "count"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke;
    v72[3] = &unk_1002B3D98;
    v73 = 0;
    v74 = v53;
    v75 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "filterWithIsIncluded:", v72));

    v27 = objc_opt_new(NSMutableSet);
    v28 = self;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "reduceWithInitial:nextPartialResult:", v27, &__block_literal_global_297));

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3;
    v70[3] = &unk_1002B3E00;
    v71 = v52;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_298;
    v68[3] = &unk_1002B3E28;
    v69 = v17;
    v30 = objc_msgSend(v29, "sinkWithCompletion:receiveInput:", v70, v68);

    self = v28;
  }
  v31 = v17;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2_299;
  v62[3] = &unk_1002B3F70;
  v67 = v49;
  v63 = v53;
  v64 = v24;
  v65 = a4;
  v66 = a5;
  v33 = v24;
  v34 = v53;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "filterWithIsIncluded:", v62));

  v36 = objc_opt_new(NSCountedSet);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_300;
  v59[3] = &unk_1002B3E78;
  v60 = v31;
  v61 = v9;
  v37 = v31;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "reduceWithInitial:nextPartialResult:", v36, v59));

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4;
  v56[3] = &unk_1002B3F98;
  v57 = v52;
  v58 = v16;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_301;
  v54[3] = &unk_1002B3EA0;
  v39 = v51;
  v55 = v39;
  v40 = v16;
  v41 = v52;
  v42 = objc_msgSend(v38, "sinkWithCompletion:receiveInput:", v56, v54);
  v43 = v55;
  v44 = v39;

  return v44;
}

id __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));

  if (v4)
  {
    v5 = (void *)a1[4];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "type")));
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      if (objc_msgSend(v7, "isOnOrAfter:", a1[5]))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
        v9 = objc_msgSend(v8, "isOnOrBefore:", a1[6]);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

NSMutableSet *__cdecl __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2(id a1, NSMutableSet *a2, BMStoreEvent *a3)
{
  NSMutableSet *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a3, "eventBody"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entryEvent"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));
          -[NSMutableSet addObject:](v4, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v4;
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_cold_1();

  }
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_298(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
}

BOOL __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2_299(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));

  if (v4 && objc_msgSend(v4, "type") == *(_DWORD *)(a1 + 64))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
    if (objc_msgSend(v5, "isOnOrAfter:", *(_QWORD *)(a1 + 32)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      v7 = objc_msgSend(v6, "isOnOrBefore:", *(_QWORD *)(a1 + 40))
        && *(_QWORD *)(a1 + 48) <= (int)objc_msgSend(v4, "addedCharacters")
        && *(_QWORD *)(a1 + 56) >= (int)objc_msgSend(v4, "addedCharacters");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_300(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v25;
  id obj;
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

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "eventBody"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryEvent"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v13 = *(void **)(a1 + 32);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));
        LOBYTE(v13) = objc_msgSend(v13, "containsObject:", v14);

        if ((v13 & 1) == 0)
        {
          if (*(_BYTE *)(a1 + 40))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));

            if (v15)
            {
              v16 = *(void **)(a1 + 32);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionId"));
              objc_msgSend(v16, "addObject:", v17);

            }
          }
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bundleEvergreenTypes"));
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(_QWORD *)v28 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v23, "length"))
                  objc_msgSend(v5, "addObject:", v23);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v20);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  return v5;
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4_cold_1();

  }
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_301(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "countForObject:", v8)));
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)getEvergreenTypeCountForAppEntryEvent:(id)a3 withMinimumAddedCharacters:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getEvergreenTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:](self, "getEvergreenTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:", v6, a4, 0x7FFFFFFFFFFFFFFFLL, v7, v8, 0, 0));

  return v9;
}

- (id)getEvergreenTypeCountForSuggestionsWithJournalCreatedFromStartDate:(id)a3 toEndDate:(id)a4 withMinimumAddedCharacters:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v13;

  v13 = CFSTR("appEntryDeleted");
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getEvergreenTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:](self, "getEvergreenTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:", CFSTR("appEntryCreated"), a5, 0x7FFFFFFFFFFFFFFFLL, v9, v8, 0, v10));

  return v11;
}

- (id)getEvergreenTypeCountForSuggestionsWithJournalCreatedButNoWritingFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  const __CFString *v12;

  v11 = CFSTR("appEntryDeleted");
  v12 = CFSTR("appEntryEdited");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager getEvergreenTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:](self, "getEvergreenTypeCountForAppEntryEvent:withMinAddedCharacterCount:andMaxAddedCharacterCount:fromStartDate:toEndDate:onceForEachBundle:skipForEvents:", CFSTR("appEntryCreated"), 0, 0, v7, v6, 0, v8, v11, v12));

  return v9;
}

- (void)eventBundleStore:(id)a3 needsEngagementInfoForBundles:(id)a4
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  dispatch_once_t *v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id os_log;
  dispatch_once_t *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  id v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  id v29;
  MOEngagementHistoryManager *v30;
  id v31;
  _QWORD v32[4];
  NSMutableDictionary *v33;
  MOEngagementHistoryManager *v34;
  _QWORD v35[4];
  NSMutableDictionary *v36;
  MOEngagementHistoryManager *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42[24];
  void *v43;
  char v44[16];
  _BYTE v45[128];

  v30 = self;
  v4 = a4;
  v5 = objc_opt_new(NSMutableDictionary);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    v10 = &MOLogFacilityEngagement;
    v31 = v6;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionID", v30));
        v14 = v13;
        if (v13)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v15));

            if (v16)
            {
              v17 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v15));
              -[NSObject addObject:](v17, "addObject:", v12);
            }
            else
            {
              v20 = v10;
              v43 = v12;
              v17 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v17));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v21, v15);

              v10 = v20;
              v6 = v31;
            }
          }
          else
          {
            os_log = _mo_log_facility_get_os_log(v10);
            v17 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[MOEngagementHistoryManager eventBundleStore:needsEngagementInfoForBundles:].cold.2((uint64_t)v42, (uint64_t)v12);
          }

        }
        else
        {
          v18 = _mo_log_facility_get_os_log(v10);
          v15 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[MOEngagementHistoryManager eventBundleStore:needsEngagementInfoForBundles:].cold.1((uint64_t)v44, (uint64_t)v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v8);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](v30, "stream_publisher"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "filterWithIsIncluded:", &__block_literal_global_302));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_304;
  v35[3] = &unk_1002B3C38;
  v24 = v5;
  v36 = v24;
  v37 = v30;
  v25 = objc_msgSend(v23, "sinkWithCompletion:receiveInput:", &__block_literal_global_303, v35);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](v30, "stream_publisher"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "filterWithIsIncluded:", &__block_literal_global_306));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_308;
  v32[3] = &unk_1002B3C38;
  v33 = v24;
  v34 = v30;
  v28 = v24;
  v29 = objc_msgSend(v27, "sinkWithCompletion:receiveInput:", &__block_literal_global_307_0, v32);

}

BOOL __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke(id a1, BMStoreEvent *a2)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "suggestionEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientIdentifier"));
  v5 = v4 != 0;

  return v5;
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_2(id a1, BPSCompletion *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BPSCompletion error](a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_2_cold_1();

  }
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_304(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fullBundleOrderedSet"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "suggestionId"));

        if (v10)
        {
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10));
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v19;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(a1 + 40), "updateBundle:forSuggestionEvent:withSummary:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), v4, v8);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v13);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

}

BOOL __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_2_305(id a1, BMStoreEvent *a2)
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "entryEvent"));
  v4 = v3 != 0;

  return v4;
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_3(id a1, BPSCompletion *a2)
{
  void *v2;
  id os_log;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BPSCompletion error](a2, "error"));

  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_3_cold_1();

  }
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_308(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8), "suggestionId"));
        if (v9)
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9));
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v17;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v17 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(a1 + 40), "updateBundle:forAppEntryEvent:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), v4);
                v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v12);
          }

        }
        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

}

- (id)_convertStringArrayIntoCombinedHashedString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        v12 = v8;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v5);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11);
          v14 = objc_autoreleasePoolPush();
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash")));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));

          if (v9)
          {
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(";%@"), v8));

            v9 = (id)v16;
          }
          else
          {
            v9 = v8;
          }
          objc_autoreleasePoolPop(v14);
          v11 = (char *)v11 + 1;
          v12 = v8;
        }
        while (v7 != v11);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }

    v4 = v18;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fetchSuggestionEngagementEventsFromStartDate:(id)a3 toEndDate:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSMutableArray *v15;
  id v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  _QWORD v20[4];
  NSMutableArray *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = objc_opt_new(NSMutableArray);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__28;
  v30 = __Block_byref_object_dispose__28;
  v31 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke;
  v23[3] = &unk_1002B4080;
  v12 = v8;
  v24 = v12;
  v13 = v9;
  v25 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filterWithIsIncluded:", v23));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2;
  v22[3] = &unk_1002B40A8;
  v22[4] = &v26;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_311;
  v20[3] = &unk_1002B3F08;
  v15 = v10;
  v21 = v15;
  v16 = objc_msgSend(v14, "sinkWithCompletion:receiveInput:", v22, v20);
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v17 = v21;
  v18 = v15;

  _Block_object_dispose(&v26, 8);
  return v18;
}

id __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
    if (objc_msgSend(v5, "isOnOrAfter:", *(_QWORD *)(a1 + 32)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      v7 = objc_msgSend(v6, "isOnOrBefore:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  if (v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2_cold_1();

  }
}

void __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_311(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "jsonDictionary"));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (id)fetchAppEntryEngagementEventsFromStartDate:(id)a3 toEndDate:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSMutableArray *v15;
  id v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  _QWORD v20[4];
  NSMutableArray *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = objc_opt_new(NSMutableArray);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__28;
  v30 = __Block_byref_object_dispose__28;
  v31 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke;
  v23[3] = &unk_1002B4080;
  v12 = v8;
  v24 = v12;
  v13 = v9;
  v25 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filterWithIsIncluded:", v23));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2;
  v22[3] = &unk_1002B40A8;
  v22[4] = &v26;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_312;
  v20[3] = &unk_1002B3F08;
  v15 = v10;
  v21 = v15;
  v16 = objc_msgSend(v14, "sinkWithCompletion:receiveInput:", v22, v20);
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v17 = v21;
  v18 = v15;

  _Block_object_dispose(&v26, 8);
  return v18;
}

id __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
    if (objc_msgSend(v5, "isOnOrAfter:", *(_QWORD *)(a1 + 32)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      v7 = objc_msgSend(v6, "isOnOrBefore:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  if (v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2_cold_1();

  }
}

void __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_312(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "jsonDictionary"));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (id)fetchSuggestionEngagementEventsWithTypes:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSMutableArray *v19;
  id v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  _QWORD v24[4];
  NSMutableArray *v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_opt_new(NSMutableArray);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__28;
  v35 = __Block_byref_object_dispose__28;
  v36 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke;
  v27[3] = &unk_1002B3D98;
  v15 = v10;
  v28 = v15;
  v16 = v11;
  v29 = v16;
  v17 = v12;
  v30 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filterWithIsIncluded:", v27));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2;
  v26[3] = &unk_1002B40A8;
  v26[4] = &v31;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_313;
  v24[3] = &unk_1002B3F08;
  v19 = v13;
  v25 = v19;
  v20 = objc_msgSend(v18, "sinkWithCompletion:receiveInput:", v26, v24);
  if (a6)
    *a6 = objc_retainAutorelease((id)v32[5]);
  v21 = v25;
  v22 = v19;

  _Block_object_dispose(&v31, 8);
  return v22;
}

id __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));

  if (v4)
  {
    v5 = (void *)a1[4];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "type")));
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      if (objc_msgSend(v7, "isOnOrAfter:", a1[5]))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
        v9 = objc_msgSend(v8, "isOnOrBefore:", a1[6]);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  if (v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2_cold_1();

  }
}

void __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_313(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "jsonDictionary"));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (id)fetchAppEntryEngagementEventsWithTypes:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSMutableArray *v19;
  id v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  _QWORD v24[4];
  NSMutableArray *v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_opt_new(NSMutableArray);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__28;
  v35 = __Block_byref_object_dispose__28;
  v36 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEngagementHistoryManager stream_publisher](self, "stream_publisher"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke;
  v27[3] = &unk_1002B3D98;
  v15 = v10;
  v28 = v15;
  v16 = v11;
  v29 = v16;
  v17 = v12;
  v30 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filterWithIsIncluded:", v27));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2;
  v26[3] = &unk_1002B40A8;
  v26[4] = &v31;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_314;
  v24[3] = &unk_1002B3F08;
  v19 = v13;
  v25 = v19;
  v20 = objc_msgSend(v18, "sinkWithCompletion:receiveInput:", v26, v24);
  if (a6)
    *a6 = objc_retainAutorelease((id)v32[5]);
  v21 = v25;
  v22 = v19;

  _Block_object_dispose(&v31, 8);
  return v22;
}

id __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));

  if (v4)
  {
    v5 = (void *)a1[4];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "type")));
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      if (objc_msgSend(v7, "isOnOrAfter:", a1[5]))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
        v9 = objc_msgSend(v8, "isOnOrBefore:", a1[6]);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  if (v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2_cold_1();

  }
}

void __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_314(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "jsonDictionary"));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (BMSource)stream_source
{
  return self->_stream_source;
}

- (BMBookmarkablePublisher)stream_publisher
{
  return self->_stream_publisher;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (NSArray)suggestionEngagementTypesEligibleForRawExternalAnalytics
{
  return self->_suggestionEngagementTypesEligibleForRawExternalAnalytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEngagementTypesEligibleForRawExternalAnalytics, 0);
  objc_storeStrong((id *)&self->_stream_publisher, 0);
  objc_storeStrong((id *)&self->_stream_source, 0);
}

- (void)initWithUniverse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: bundleStore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)getBMBundleSumaryForBundle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "getBMBundleSumaryForBundle: Ignoring invalid bundle (no id)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Ignoring engagement, needs clientIdentifier", v1, 2u);
  OUTLINED_FUNCTION_2_2();
}

- (void)didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Engagement event '%@' posted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Invalid engagement event: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "MOAppEntryUpdateEvent event '%lu' posted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didAppEntryEventPosted:(os_log_t)log withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "didAppEntryEventPosted: Ignoring invalid bundle (no id)", buf, 2u);
}

- (void)submitSuggestionEngagementEventAnalytics:(NSObject *)a3 suggestionEngagementType:timestamp:withContext:withTrialExperimentIDs:.cold.1(unsigned __int8 *a1, uint64_t a2, NSObject *a3)
{
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;

  v4 = *a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2112;
  v8 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Suggestion engagement signal analytics was suppressed: isInternalBuild=%d, suggestionEngagementType=%@", (uint8_t *)v6, 0x12u);

}

- (void)submitAppEntryEngagementEventAnalytics:appEntryEngagementType:timestamp:withInfo:withTrialExperimentIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "App entry engagement signal analytics submitted: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateBundle:(void *)a1 forSuggestionEvent:withSummary:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_15_0((void *)&_mh_execute_header, v1, v2, "Ignoring suggestion engagement event with type: %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)updateBundle:forSuggestionEvent:withSummary:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_6();
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_6_4(v1, v2), "suggestionID");
  objc_claimAutoreleasedReturnValue(v3);
  v4 = objc_msgSend((id)OUTLINED_FUNCTION_5_7(), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_11((void *)&_mh_execute_header, v6, v7, "Annotated suggestion sheet engagement signal %@ to bundle %@ (%@)", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_3_1();
}

- (void)updateBundle:(void *)a1 forAppEntryEvent:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_15_0((void *)&_mh_execute_header, v1, v2, "Ignoring app entry engagement event with type: %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)updateBundle:forAppEntryEvent:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_6();
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_6_4(v1, v2), "suggestionID");
  objc_claimAutoreleasedReturnValue(v3);
  v4 = objc_msgSend((id)OUTLINED_FUNCTION_5_7(), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_11((void *)&_mh_execute_header, v6, v7, "Annotated app entry engagement signal %@ to bundle %@ (%@)", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_3_1();
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't sink suggestionIDs for suggestion sheet events %@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't count engagement by inteface type for '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't count engagement for inteface type for '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't count engagement by evergreen type for '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17((void *)&_mh_execute_header, v0, v1, "Couldn't count inteface type for app entry event '%@' with skipEvent setting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't count evergreen type for app entry engagement type '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17((void *)&_mh_execute_header, v0, v1, "Couldn't count evergreen type for app entry event '%@' with skipEvent setting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)eventBundleStore:(uint64_t)a1 needsEngagementInfoForBundles:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_0_13((void *)&_mh_execute_header, v6, v7, "No suggestionID for bundleIdentifier '%@'");

  OUTLINED_FUNCTION_7_1();
}

- (void)eventBundleStore:(uint64_t)a1 needsEngagementInfoForBundles:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_0_13((void *)&_mh_execute_header, v6, v7, "Invalid suggestionID for bundleIdentifier '%@'");

  OUTLINED_FUNCTION_7_1();
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Failed Biome stream publisher completion, can't update suggestion engagements to bundle store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Failed Biome stream publisher completion, can't update app entry engagements to bundle store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[fetchSuggestionEngagementEventsFromStartDate:toEndDate:withErrror] Biome sink completion result with error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[fetchAppEntryEngagementEventsFromStartDate:toEndDate:withError] Biome sink completion result with error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[fetchAllSuggestionEngagementEventsForType] Biome sink completion result with error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[fetchAllAppEntryEngagementEventsForType] Biome sink completion result with error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
