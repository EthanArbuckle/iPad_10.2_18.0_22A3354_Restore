@implementation VCActionDonationFetcher

+ (void)sourceAppIdentifierArrayForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, void *);
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilephone")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.facetime")))
  {
    v6[2](v6, &unk_1E6004120);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Passbook")))
  {
    v17[0] = CFSTR("com.apple.Passbook");
    v17[1] = CFSTR("com.apple.MobileSMS");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
  {
    v8 = (void *)MEMORY[0x1E0CB35D8];
    v9 = *MEMORY[0x1E0CB2A28];
    v14 = CFSTR("com.apple.fileprovider-nonui");
    v15 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__VCActionDonationFetcher_sourceAppIdentifierArrayForApplicationBundleIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_1E5FC8248;
    v13 = v6;
    objc_msgSend(v8, "extensionsWithMatchingAttributes:completion:", v11, v12);

  }
  else
  {
    v6[2](v6, 0);
  }

}

+ (id)streams
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0D15AF8], "appActivityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)donationFromEvent:(id)a3
{
  return (id)objc_msgSend(a1, "donationFromEvent:filteringForTopLevel:", a3, 0);
}

+ (id)donationFromEvent:(id)a3 filteringForTopLevel:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  VCInteractionDonation *v10;
  void *v11;
  int v12;
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
  uint64_t v25;
  VCInteractionDonation *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  char isKindOfClass;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "stream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v10 = -[VCInteractionDonation initWithEvent:]([VCInteractionDonation alloc], "initWithEvent:", v6);
    -[VCInteractionDonation sourceAppIdentifierForDisplay](v10, "sourceAppIdentifierForDisplay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(a1, "shouldKeepActionWithAppBundleIdentifierForDisplay:", v11);

    if (v12)
    {
      -[VCInteractionDonation interaction](v10, "interaction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "intent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15A40], "intentClass");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "source");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(a1, "atxClient");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "approvedSiriKitIntents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "_type") == 2 || objc_msgSend(v23, "containsObject:", v17))
        && objc_msgSend(a1, "shouldKeepAction:forAppWithBundleIdentifier:filteringForTopLevel:", v17, v19, v4)&& (-[VCInteractionDonation interaction](v10, "interaction"), v24 = (void *)objc_claimAutoreleasedReturnValue(), v25 = objc_msgSend(v24, "direction"), v24, v25 != 2))
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v26 = 0;
        if ((objc_msgSend(v14, "isGenericIntent") & 1) == 0 && (isKindOfClass & 1) == 0)
          v26 = v10;
      }
      else
      {
        v26 = 0;
      }

      goto LABEL_9;
    }
LABEL_14:
    v26 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v6, "stream");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appActivityStream");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqual:", v28);

  if (!v29)
  {
    v26 = 0;
    goto LABEL_17;
  }
  v10 = -[VCUserActivityDonation initWithEvent:]([VCUserActivityDonation alloc], "initWithEvent:", v6);
  -[VCInteractionDonation sourceAppIdentifierForDisplay](v10, "sourceAppIdentifierForDisplay");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(a1, "shouldKeepActionWithAppBundleIdentifierForDisplay:", v30);

  if (!v31)
    goto LABEL_14;
  -[VCInteractionDonation userActivity](v10, "userActivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "activityType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "shouldKeepAction:forAppWithBundleIdentifier:filteringForTopLevel:", v19, v17, v4))
  {
    v10 = v10;
    v26 = v10;
  }
  else
  {
    v26 = 0;
  }
LABEL_9:

LABEL_15:
LABEL_17:

  return v26;
}

+ (id)atxClient
{
  if (atxClient_onceToken != -1)
    dispatch_once(&atxClient_onceToken, &__block_literal_global_5161);
  return (id)atxClient_client;
}

+ (BOOL)shouldKeepAction:(id)a3 forAppWithBundleIdentifier:(id)a4 filteringForTopLevel:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "atxClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldPredictAppBundleId:", v8);

  objc_msgSend(a1, "atxClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v12, "shouldPredictBundleIdForShortcuts:action:forPrimaryShortcuts:", v8, v9, v5);

  return v11 & v5;
}

+ (BOOL)shouldKeepActionWithAppBundleIdentifierForDisplay:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "atxClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldPredictBundleIdForShortcuts:action:", v4, CFSTR("_"));

  return v6;
}

+ (id)keyPathForStream:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForIntentsDataDictionary");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D15AF8], "appActivityStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqual:", v7);

    if (!v8)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForUserActivityDataDictionary");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
LABEL_7:

  return v9;
}

+ (id)fetchEventsWithPredicate:(id)a3 limit:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "fetchEventsWithPredicate:limit:directAccess:", a3, a4, 1);
}

+ (id)fetchEventsWithPredicate:(id)a3 limit:(unint64_t)a4 directAccess:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  uint64_t *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  _QWORD v38[2];

  v5 = a5;
  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForEventsWithEndInDateRangeFrom:to:", v10, v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  getWFVoiceShortcutClientLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  getWFVoiceShortcutClientLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CoreDuetEventFetch", ", buf, 2u);
  }

  v16 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(a1, "streams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v8, v17, 0, a4, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStoreWithDirectReadOnlyAccess");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v33 = 0;
    v23 = (id *)&v33;
    v24 = &v33;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v32 = 0;
    v23 = (id *)&v32;
    v24 = &v32;
  }
  objc_msgSend(v21, "executeQuery:error:", v20, v24, v32, v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *v23;

  getWFVoiceShortcutClientLogObject();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v28, OS_SIGNPOST_INTERVAL_END, v13, "CoreDuetEventFetch", ", buf, 2u);
  }

  if (v25)
  {
    v29 = v25;
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "+[VCActionDonationFetcher fetchEventsWithPredicate:limit:directAccess:]";
      v36 = 2112;
      v37 = v26;
      _os_log_impl(&dword_1AF681000, v30, OS_LOG_TYPE_ERROR, "%s Failed to execute CoreDuet query: %@", buf, 0x16u);
    }

  }
  return v25;
}

+ (id)fetchDonationsWithPredicate:(id)a3 limit:(unint64_t)a4 filteringForTopLevel:(BOOL)a5
{
  return (id)objc_msgSend(a1, "fetchDonationsWithPredicate:limit:filteringForTopLevel:directAccess:", a3, a4, a5, 1);
}

+ (id)fetchDonationsWithPredicate:(id)a3 limit:(unint64_t)a4 filteringForTopLevel:(BOOL)a5 directAccess:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _UNKNOWN **v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  _BOOL8 v25;
  _UNKNOWN **v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t spid;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v6 = a6;
  v7 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  getWFVoiceShortcutClientLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  getWFVoiceShortcutClientLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v35 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CoreDuetDonationFetch", ", buf, 2u);
  }
  spid = v12;

  v36 = v10;
  objc_msgSend(a1, "fetchEventsWithPredicate:limit:directAccess:", v10, a4, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_opt_new();
  v39 = (id)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v42;
    v19 = &off_1E5FBD000;
    v37 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1B5DFC064]();
        objc_msgSend(a1, "donationFromEvent:filteringForTopLevel:", v21, v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_18;
          v24 = a1;
          v25 = v7;
          v26 = v19;
          objc_msgSend(v23, "interaction");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "intent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "intentId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v38, "containsObject:", v29))
          {
            if (v29)
              objc_msgSend(v38, "addObject:", v29);

            v19 = v26;
            v7 = v25;
            a1 = v24;
            v18 = v37;
LABEL_18:
            objc_msgSend(v39, "addObject:", v23);
            goto LABEL_19;
          }
          getWFVoiceShortcutClientLogObject();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v46 = "+[VCActionDonationFetcher fetchDonationsWithPredicate:limit:filteringForTopLevel:directAccess:]";
            v47 = 2112;
            v48 = v29;
            _os_log_impl(&dword_1AF681000, v30, OS_LOG_TYPE_INFO, "%s Ignoring duplicate donation for Intent Identifier %@", buf, 0x16u);
          }

          v19 = v26;
          v7 = v25;
          a1 = v24;
          v18 = v37;
        }
LABEL_19:

        objc_autoreleasePoolPop(v22);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v17);
  }

  getWFVoiceShortcutClientLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v32, OS_SIGNPOST_INTERVAL_END, spid, "CoreDuetDonationFetch", ", buf, 2u);
  }

  return v39;
}

+ (void)fetchDonationsForApplicationBundleIdentifier:(id)a3 limit:(unint64_t)a4 filteringForTopLevel:(BOOL)a5 filteringForIsEligibleForPrediction:(BOOL)a6 filteringForRecent:(BOOL)a7 completion:(id)a8
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _BOOL4 v31;
  id v32;
  _BOOL4 v33;
  id obj;
  _QWORD block[4];
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  id v40;
  unint64_t v41;
  BOOL v42;
  BOOL v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  _QWORD *v47;
  _QWORD v48[4];
  id v49;
  NSObject *v50;
  _QWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _QWORD v66[4];

  v31 = a6;
  v33 = a5;
  v66[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v27 = a8;
  v28 = v10;
  if (v10)
  {
    v66[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v61 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v16);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v13);
    }

  }
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__5118;
  v58[4] = __Block_byref_object_dispose__5119;
  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__5118;
  v56[4] = __Block_byref_object_dispose__5119;
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v17 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v18 = dispatch_group_create();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v11;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  v20 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    v21 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v53 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.tv")) & 1) == 0)
        {
          if (!v33 || (objc_msgSend(v23, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
          {
            dispatch_group_enter(v18);
            v48[0] = v20;
            v48[1] = 3221225472;
            v48[2] = __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke;
            v48[3] = &unk_1E5FC5E90;
            v49 = v32;
            v51 = v58;
            v50 = v18;
            objc_msgSend(a1, "getPredicateForUserActivitiesWithApplicationBundleIdentifier:filteringForIsEligibleForPrediction:completionHandler:", v23, v31, v48);

          }
          dispatch_group_enter(v18);
          v44[0] = v20;
          v44[1] = 3221225472;
          v44[2] = __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke_2;
          v44[3] = &unk_1E5FC5E90;
          v45 = v17;
          v47 = v56;
          v46 = v18;
          objc_msgSend(a1, "getPredicateForIntentsWithApplicationBundleIdentifier:completionHandler:", v23, v44);

        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v19);
  }

  dispatch_get_global_queue(2, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = v20;
  block[1] = 3221225472;
  block[2] = __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke_3;
  block[3] = &unk_1E5FC5EB8;
  v38 = v58;
  v39 = v56;
  v42 = a7;
  v40 = a1;
  v41 = a4;
  v43 = v33;
  v36 = v28;
  v37 = v27;
  v25 = v27;
  v26 = v28;
  dispatch_group_notify(v18, v24, block);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v58, 8);

}

+ (void)fetchDonationsForApplicationBundleIdentifier:(id)a3 limit:(unint64_t)a4 shortcutAvailability:(unint64_t)a5 completion:(id)a6
{
  void (**v10)(id, void *);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (*v17)(void);
  id v18;

  v18 = a3;
  if (a5)
  {
    v10 = (void (**)(id, void *))a6;
    objc_msgSend(a1, "predicateForShortcutAvailabilityOptions:", a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fetchDonationsWithPredicate:limit:filteringForTopLevel:directAccess:", v11, a4, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "whitelistedDonationsWithOptions:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filterDonations:forApplicationBundleIdentifier:", v15, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, v16);
  }
  else
  {
    v17 = (void (*)(void))*((_QWORD *)a6 + 2);
    v11 = a6;
    v17();
  }

}

+ (id)predicateForShortcutAvailabilityOptions:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (a3)
  {
    v4 = (void *)objc_opt_new();
    for (i = 0; i != 64; ++i)
    {
      if (((1 << i) & v3) != 0)
      {
        v6 = (void *)MEMORY[0x1E0D15AD0];
        objc_msgSend(MEMORY[0x1E0D15A40], "shortcutAvailability");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "predicateForObjectsWithMetadataKey:andIntegerValue:", v7, 1 << i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)MEMORY[0x1E0D15AD0];
        objc_msgSend(MEMORY[0x1E0D15998], "shortcutAvailability");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "predicateForObjectsWithMetadataKey:andIntegerValue:", v10, 1 << i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v8);
        objc_msgSend(v4, "addObject:", v11);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v4);
    v3 = objc_claimAutoreleasedReturnValue();

  }
  return (id)v3;
}

+ (id)whitelistedDonationsWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
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
  id v32;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[4];
  _QWORD v60[6];

  v60[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  if (!a3)
  {
    v31 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_10;
  }
  v59[0] = CFSTR("com.apple.mobilenotes");
  v59[1] = CFSTR("com.apple.podcasts");
  v60[0] = &unk_1E6002658;
  v60[1] = &unk_1E6002670;
  v59[2] = CFSTR("com.apple.Music");
  v59[3] = CFSTR("com.apple.weather");
  v60[2] = &unk_1E6002688;
  v60[3] = &unk_1E60026A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithBundleID:", CFSTR("com.apple.mobilenotes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15A40], "intentClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForObjectsWithMetadataKey:andStringValue:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3528];
    v58[0] = v7;
    v58[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15998], "activityType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateForObjectsWithMetadataKey:andStringValue:", v17, CFSTR("com.apple.notes.activity.edit-note"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CB3528];
    v57[0] = v18;
    v57[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v15);
    objc_msgSend(v5, "addObject:", v21);

  }
  if ((a3 & 8) == 0)
  {
    if ((a3 & 4) == 0)
      goto LABEL_6;
LABEL_12:
    v43 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15A40], "intentClass");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "predicateForObjectsWithMetadataKey:andStringValue:", v44, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithBundleID:", CFSTR("com.apple.Music"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)MEMORY[0x1E0CB3528];
    v55[0] = v47;
    v55[1] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "andPredicateWithSubpredicates:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v51);
    if ((a3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v34 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D15A40], "intentClass");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (objc_class *)objc_opt_class();
  NSStringFromClass(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "predicateForObjectsWithMetadataKey:andStringValue:", v35, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithBundleID:", CFSTR("com.apple.podcasts"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0CB3528];
  v56[0] = v38;
  v56[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "andPredicateWithSubpredicates:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v42);
  if ((a3 & 4) != 0)
    goto LABEL_12;
LABEL_6:
  if ((a3 & 0x20) != 0)
  {
LABEL_7:
    v22 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15A40], "intentClass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateForObjectsWithMetadataKey:andStringValue:", v23, CFSTR("WeatherIntent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithBundleID:", CFSTR("com.apple.weather"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3528];
    v54[0] = v24;
    v54[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "andPredicateWithSubpredicates:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v28);
  }
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchDonationsWithPredicate:limit:filteringForTopLevel:directAccess:", v29, 40, 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __59__VCActionDonationFetcher_whitelistedDonationsWithOptions___block_invoke;
  v52[3] = &unk_1E5FC5EE8;
  v53 = v6;
  v32 = v6;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v52);

LABEL_10:
  return v31;
}

+ (void)getPredicateForUserActivitiesWithApplicationBundleIdentifier:(id)a3 filteringForIsEligibleForPrediction:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __142__VCActionDonationFetcher_getPredicateForUserActivitiesWithApplicationBundleIdentifier_filteringForIsEligibleForPrediction_completionHandler___block_invoke;
  v12[3] = &unk_1E5FC5F38;
  v16 = a4;
  v14 = v9;
  v15 = a1;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "sourceAppIdentifierArrayForApplicationBundleIdentifier:completionHandler:", v11, v12);

}

+ (void)getPredicateForIntentsWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__VCActionDonationFetcher_getPredicateForIntentsWithApplicationBundleIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E5FC5F60;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "sourceAppIdentifierArrayForApplicationBundleIdentifier:completionHandler:", v8, v10);

}

+ (void)fetchDonationsWithLimit:(unint64_t)a3 filteringForIsEligibleForPrediction:(BOOL)a4 completion:(id)a5
{
  objc_msgSend(a1, "fetchDonationsForApplicationBundleIdentifier:limit:filteringForTopLevel:filteringForIsEligibleForPrediction:filteringForRecent:completion:", 0, a3, 0, a4, 1, a5);
}

+ (id)donationWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __objc2_class *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForObjectWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchEventsWithPredicate:limit:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    getWFVoiceShortcutClientLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136315394;
      v23 = "+[VCActionDonationFetcher donationWithUUID:]";
      v24 = 2112;
      v25 = v13;
      v14 = "%s Event with uuid (%@) not found";
      v15 = v12;
      v16 = 22;
LABEL_11:
      _os_log_impl(&dword_1AF681000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v22, v16);

    }
LABEL_12:

    v20 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "stream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (!v10)
  {
    objc_msgSend(v7, "stream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AF8], "appActivityStream");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (v19)
    {
      v11 = VCUserActivityDonation;
      goto LABEL_8;
    }
    getWFVoiceShortcutClientLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136315650;
      v23 = "+[VCActionDonationFetcher donationWithUUID:]";
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v7;
      v14 = "%s Event with uuid (%@) is not of a supported type: %@";
      v15 = v12;
      v16 = 32;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v11 = VCInteractionDonation;
LABEL_8:
  v20 = (void *)objc_msgSend([v11 alloc], "initWithEvent:", v7);
LABEL_13:

  return v20;
}

+ (id)isEligibleForPredictionPredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D15998], "isEligibleForPrediction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForObjectsWithMetadataKey:andIntegerValue:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldFilterDonationsForAppWithApplicationBundleIdentifier:(id)a3
{
  return VCIsShortcutsAppBundleIdentifier(a3) ^ 1;
}

+ (id)filterDonations:(id)a3 forApplicationBundleIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  char v19;

  v5 = a4;
  v6 = filterDonations_forApplicationBundleIdentifier__onceToken;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&filterDonations_forApplicationBundleIdentifier__onceToken, &__block_literal_global_55);
  v8 = objc_msgSend((id)filterDonations_forApplicationBundleIdentifier__bundleIdentifiersRequiringDisplayFilter, "containsObject:", v5);
  v9 = (void *)MEMORY[0x1E0CB3880];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __74__VCActionDonationFetcher_filterDonations_forApplicationBundleIdentifier___block_invoke_2;
  v17 = &unk_1E5FC5F88;
  v19 = v8;
  v18 = v5;
  v10 = v5;
  objc_msgSend(v9, "predicateWithBlock:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v11, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __74__VCActionDonationFetcher_filterDonations_forApplicationBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  if (!*(_BYTE *)(a1 + 40))
    return 1;
  objc_msgSend(a2, "sourceAppIdentifierForDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __74__VCActionDonationFetcher_filterDonations_forApplicationBundleIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.mobilephone"), CFSTR("com.apple.facetime"), CFSTR("com.apple.Passbook"), CFSTR("com.apple.MobileSMS"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)filterDonations_forApplicationBundleIdentifier__bundleIdentifiersRequiringDisplayFilter;
  filterDonations_forApplicationBundleIdentifier__bundleIdentifiersRequiringDisplayFilter = v0;

}

void __99__VCActionDonationFetcher_getPredicateForIntentsWithApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__5118;
    v14 = __Block_byref_object_dispose__5119;
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __99__VCActionDonationFetcher_getPredicateForIntentsWithApplicationBundleIdentifier_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5FC5F10;
    v9[4] = &v10;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v11[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithSourceID:bundleID:", CFSTR("intents"), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __99__VCActionDonationFetcher_getPredicateForIntentsWithApplicationBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithSourceID:bundleID:", CFSTR("intents"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v3 = v4;
  }

}

void __142__VCActionDonationFetcher_getPredicateForUserActivitiesWithApplicationBundleIdentifier_filteringForIsEligibleForPrediction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5118;
    v16 = __Block_byref_object_dispose__5119;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __142__VCActionDonationFetcher_getPredicateForUserActivitiesWithApplicationBundleIdentifier_filteringForIsEligibleForPrediction_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5FC5F10;
    v11[4] = &v12;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v13[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValue:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (*(_BYTE *)(a1 + 56)
    && objc_msgSend(*(id *)(a1 + 48), "shouldFilterDonationsForAppWithApplicationBundleIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v5;
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "isEligibleForPredictionPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __142__VCActionDonationFetcher_getPredicateForUserActivitiesWithApplicationBundleIdentifier_filteringForIsEligibleForPrediction_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValue:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v3 = v4;
  }

}

void __59__VCActionDonationFetcher_whitelistedDonationsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v14 = v3;
  objc_msgSend(v3, "sourceAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "interaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShortcutAvailability:", v9);

LABEL_10:
    v13 = v14;
    goto LABEL_11;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v14, "userActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShortcutAvailability:", v9);
    goto LABEL_10;
  }
LABEL_11:

}

void __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v4);

  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v4);

  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __165__VCActionDonationFetcher_fetchDonationsForApplicationBundleIdentifier_limit_filteringForTopLevel_filteringForIsEligibleForPrediction_filteringForRecent_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v19[0] = v2;
  v19[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  v8 = v7;
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, -7, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStartDateAfter:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v7;
    v18[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 64), "fetchDonationsWithPredicate:limit:filteringForTopLevel:", v8, *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 81));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 64), "filterDonations:forApplicationBundleIdentifier:", v16, *(_QWORD *)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __36__VCActionDonationFetcher_atxClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((Class)getATXClientClass[0](), "clientForConsumerType:", 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)atxClient_client;
  atxClient_client = v0;

}

void __100__VCActionDonationFetcher_sourceAppIdentifierArrayForApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("identifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
