@implementation PPFeedbackUtils

+ (id)feedbackItemsByItemString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
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
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1C3BD6630](v6);
        objc_msgSend(v10, "itemString", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v12);

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v10);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

+ (BOOL)shouldSample:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  float v13;
  double v14;

  v3 = a3;
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedbackSessionLogsSamplingRateOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v3);

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_opt_self();
    v11 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < v10;

  }
  else
  {
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "feedbackSessionLogsSamplingRate");
    v14 = v13;

    objc_opt_self();
    v11 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < v14;
  }

  return v11;
}

+ (BOOL)shouldSampleExtraction:(id)a3
{
  void *v3;
  float v4;
  double v5;
  BOOL v6;

  if (!objc_msgSend(MEMORY[0x1E0D70D00], "isFirstPartyApp:", a3))
    return 0;
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedbackSessionLogsExtractionsSamplingRate");
  v5 = v4;
  objc_opt_self();
  v6 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < v5;

  return v6;
}

+ (void)addBoilerplateToFeedbackLog:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  v19 = a3;
  v3 = (void *)objc_opt_new();
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "concatenatedTreatmentNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAbGroupIdentifier:", v5);

  objc_msgSend(v19, "addExperimentalGroups:", v3);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "feedbackSessionLogsGeohashLength");

  if (v7 >= 1)
  {
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAuthorizedToLogLocation");

    if (v9)
    {
      +[PPRoutineSupport fetchLocationOfInterestByType:](PPRoutineSupport, "fetchLocationOfInterestByType:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = (void *)MEMORY[0x1E0D70D00];
        objc_msgSend(v10, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "latitude");
        v15 = v14;
        objc_msgSend(v11, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "longitude");
        objc_msgSend(v12, "coordinatesToGeoHashWithLength:latitude:longitude:", v7, v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setHomeLocationGeohash:", v18);

      }
    }
  }

}

+ (id)feedbackItemForPPFeedbackItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setFeedbackType:", 0);
  v5 = objc_msgSend(v3, "itemFeedbackType");

  if (v5 <= 5)
    objc_msgSend(v4, "setFeedbackType:", v5);
  return v4;
}

+ (id)feedbackMetadataForBaseFeedback:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "clientBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientBundleId:", v5);

  objc_msgSend(v3, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientIdentifier:", v6);

  v7 = objc_msgSend(v3, "isMapped");
  objc_msgSend(v4, "setIsMapped:", v7);
  return v4;
}

+ (id)scoredItemWithFeaturesForFeatureDictionary:(id)a3 score:(float)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("score"), (_QWORD)v18))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "floatValue");
          a4 = v14;
        }
        else
        {
          v13 = (void *)objc_opt_new();
          objc_msgSend(v13, "setFeatureId:", v12);
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "floatValue");
          objc_msgSend(v13, "setValue:");

          objc_msgSend(v6, "addFeatures:", v13);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  *(float *)&v16 = a4;
  objc_msgSend(v6, "setScore:", v16);

  return v6;
}

+ (void)recordUserEventsFromFeedback:(id)a3 matchingFeedbackItems:(id)a4 clientBundleId:(id)a5 clientIdentifier:(id)a6 domain:(unsigned __int8)a7
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
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
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  id v90;
  void *v91;
  uint64_t v92;
  unsigned int v93;
  unsigned int v94;
  id v95;
  void *v96;
  void *context;
  void *contexta;
  void *contextb;
  void *v100;
  void *v101;
  uint64_t v102;
  unsigned int v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD v115[4];
  _QWORD v116[4];
  _QWORD v117[4];
  _QWORD v118[4];
  _BYTE v119[128];
  _QWORD v120[5];
  _QWORD v121[5];
  _QWORD v122[4];
  _QWORD v123[4];
  _QWORD v124[4];
  _QWORD v125[4];
  _BYTE v126[128];
  uint64_t v127;

  v7 = a7;
  v127 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v96 = v12;
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("ICLex")))
  {
    objc_msgSend(v13, "_pas_stringBackedByUTF8CString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_pas_stringBackedByUTF8CString");
    v104 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "feedbackItems");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v48, "count");

    v94 = v7;
    +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", v7);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)MEMORY[0x1C3BD6630]();
    v101 = (void *)v49;
    contexta = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), v49, v47);
    objc_autoreleasePoolPop(v50);
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    objc_msgSend(v11, "feedbackItems");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
    if (v52)
    {
      v53 = v52;
      v54 = 0;
      v55 = 0;
      v56 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v106 != v56)
            objc_enumerationMutation(v51);
          v58 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
          if (objc_msgSend(v58, "itemFeedbackType") == 3)
          {
            v54 = (v54 + 1);
          }
          else if (objc_msgSend(v58, "itemFeedbackType") == 1
                 || objc_msgSend(v58, "itemFeedbackType") == 2)
          {
            v55 = (v55 + 1);
          }
        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
      }
      while (v53);
    }
    else
    {
      v54 = 0;
      v55 = 0;
    }

    v59 = (void *)MEMORY[0x1C3BD6630]();
    v117[0] = CFSTR("clientId");
    v117[1] = CFSTR("bundleId");
    v60 = (void *)v104;
    v118[0] = v104;
    v118[1] = v47;
    v117[2] = CFSTR("domain");
    +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", v94);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v118[2] = v61;
    v117[3] = CFSTR("eventCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v55);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v118[3] = v62;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 4);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v59);
    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.PositivePersonalizationEvent"), v63, 1);

    v64 = (void *)MEMORY[0x1C3BD6630]();
    v115[0] = CFSTR("clientId");
    v115[1] = CFSTR("bundleId");
    v116[0] = v104;
    v116[1] = v47;
    v115[2] = CFSTR("domain");
    +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", v94);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v116[2] = v65;
    v115[3] = CFSTR("eventCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v54);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v116[3] = v66;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 4);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v64);
    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.FrustrationEvent"), v67, 1);

    v68 = (void *)MEMORY[0x1C3BD6630]();
    v69 = *MEMORY[0x1E0D70AB0];
    v114[0] = contexta;
    v70 = *MEMORY[0x1E0D70AC8];
    v113[0] = v69;
    v113[1] = v70;
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "concatenatedTreatmentNames");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = v72;
    v113[2] = *MEMORY[0x1E0D70AB8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v54);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v114[2] = v73;
    v113[3] = *MEMORY[0x1E0D70AA0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v55);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v114[3] = v74;
    v113[4] = *MEMORY[0x1E0D70AC0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v92);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v114[4] = v75;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 5);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D70A98], "sharedInstance");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "logMessage:messageName:", v76, *MEMORY[0x1E0D70AA8]);

    objc_autoreleasePoolPop(v68);
    goto LABEL_45;
  }
  v89 = v14;
  v15 = v12;
  v16 = v13;
  objc_opt_self();
  objc_msgSend(v16, "_pas_stringBackedByUTF8CString");
  v90 = v16;
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v15, "count");
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
  v100 = v18;
  if (!v19)
  {
    v44 = 0;
    v103 = 0;
    v22 = 0;
    v46 = v18;
LABEL_40:

    goto LABEL_44;
  }
  v88 = v17;
  v93 = v7;
  v95 = v11;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = *(void **)v110;
  v24 = v19;
  context = *(void **)v110;
  do
  {
    v25 = 0;
    v102 = v24;
    do
    {
      v26 = v22;
      if (*(void **)v110 != v23)
        objc_enumerationMutation(v18);
      v27 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v25);
      if (v26)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * v25), "itemString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "isEqualToString:", v26) & 1) != 0)
        {
          v29 = objc_msgSend(v27, "itemFeedbackType");

          if (v29 == 2)
          {
            v21 = (v21 + 1);
            goto LABEL_20;
          }
        }
        else
        {

        }
      }
      else if ((unint64_t)objc_msgSend(v18, "count") >= 2)
      {
        v30 = v20;
        v31 = v21;
        objc_msgSend(v18, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "itemString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "itemString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v33, "isEqual:", v35);

        if (v36)
        {
          v21 = (v31 + 1);
          v18 = v100;
          v20 = v30;
        }
        else
        {
          v20 = (v30 + 1);
          v18 = v100;
          v21 = v31;
        }
        v23 = context;
        v24 = v102;
        goto LABEL_20;
      }
      if (objc_msgSend(v27, "itemFeedbackType") == 2
        || objc_msgSend(v27, "itemFeedbackType") == 1)
      {
        v20 = (v20 + 1);
      }
LABEL_20:
      objc_msgSend(v27, "itemString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      ++v25;
    }
    while (v24 != v25);
    v24 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
  }
  while (v24);

  if ((_DWORD)v21)
  {
    v37 = (void *)MEMORY[0x1C3BD6630]();
    v124[0] = CFSTR("clientId");
    v124[1] = CFSTR("bundleId");
    v125[0] = CFSTR("ICLex");
    v125[1] = v91;
    v124[2] = CFSTR("domain");
    +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", v93);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v125[2] = v38;
    v124[3] = CFSTR("eventCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v21);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v125[3] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 4);
    v40 = v20;
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v37);
    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.FrustrationEvent"), v41, 1);

    v20 = v40;
  }
  v103 = v21;
  v11 = v95;
  v17 = v88;
  if ((_DWORD)v20)
  {
    v42 = (void *)MEMORY[0x1C3BD6630]();
    v122[0] = CFSTR("clientId");
    v122[1] = CFSTR("bundleId");
    v123[0] = CFSTR("ICLex");
    v123[1] = v91;
    v122[2] = CFSTR("domain");
    +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", v93);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v123[2] = v43;
    v122[3] = CFSTR("eventCount");
    v44 = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v123[3] = v45;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, v122, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v42);
    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.PositivePersonalizationEvent"), v46, 1);
    goto LABEL_40;
  }
  v44 = 0;
LABEL_44:
  contextb = (void *)MEMORY[0x1C3BD6630]();
  v120[0] = *MEMORY[0x1E0D70AB0];
  v78 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v78, "initWithFormat:", CFSTR("%@%@"), CFSTR("Portrait"), v79);
  v121[0] = v80;
  v120[1] = *MEMORY[0x1E0D70AC8];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "concatenatedTreatmentNames");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v121[1] = v82;
  v120[2] = *MEMORY[0x1E0D70AC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v121[2] = v83;
  v120[3] = *MEMORY[0x1E0D70AA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v44);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v121[3] = v84;
  v120[4] = *MEMORY[0x1E0D70AB8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v103);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v121[4] = v85;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 5);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D70A98], "sharedInstance");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "logMessage:messageName:", v86, *MEMORY[0x1E0D70AA8]);

  objc_autoreleasePoolPop(contextb);
  v60 = v89;
  v47 = v90;
LABEL_45:

}

+ (void)recordUniversalSearchSpotlightStatsFromFeedback:(id)a3 clientBundleId:(id)a4 clientIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1C3BD6630]();
  v20[0] = *MEMORY[0x1E0D70AB0];
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@%@"), CFSTR("Portrait"), v11);
  v21[0] = v12;
  v20[1] = *MEMORY[0x1E0D70AC8];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "concatenatedTreatmentNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  v20[2] = *MEMORY[0x1E0D70AC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "offeredCSSICount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  v20[3] = *MEMORY[0x1E0D70AA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "engagedCSSICount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D70A98], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logMessage:messageName:", v17, *MEMORY[0x1E0D70AA8]);

  objc_autoreleasePoolPop(v9);
}

+ (id)featuresForScoreDict:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v3, "featureNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1C3BD6630]();
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("scalar")))
        {
          objc_msgSend(v3, "featureValueForName:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "multiArrayValue");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v9);

          goto LABEL_20;
        }
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("array")))
        {
          objc_msgSend(v3, "featureValueForName:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v14 = v11;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPFeedbackUtils.m"), 314, CFSTR("The value at a listed feature output should be nonnull."));

            v14 = 0;
          }
          +[PPFeedbackUtils _flattenArraylikeToFeatures:featureName:]((uint64_t)PPFeedbackUtils, v14, v9);
          v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
          objc_msgSend(v4, "addEntriesFromDictionary:", v12);
LABEL_20:

LABEL_21:
          goto LABEL_22;
        }
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("object")))
        {
          objc_msgSend(v3, "featureValueForName:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          switch(objc_msgSend(v11, "type"))
          {
            case 1:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "int64Value"));
              v12 = (id)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_int"), v9);
              goto LABEL_17;
            case 2:
              v16 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v11, "doubleValue");
              objc_msgSend(v16, "numberWithDouble:");
              v12 = (id)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_dbl"), v9);
LABEL_17:
              v17 = (void *)v15;
              v18 = v4;
              v19 = v12;
              goto LABEL_19;
            case 3:
              v20 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v11, "stringValue");
              v12 = (id)objc_claimAutoreleasedReturnValue();
              v17 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@_str_%@"), v9, v12);
              v18 = v4;
              v19 = &unk_1E7E59108;
LABEL_19:
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v17);

              goto LABEL_20;
            case 6:
              v11 = v11;
              v21 = v9;
              v22 = objc_opt_self();
              if (objc_msgSend(v11, "type") != 6)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel__flattenDictionarylikeToFeatures_featureName_, v22, CFSTR("PPFeedbackUtils.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value.type == MLFeatureTypeDictionary"));

              }
              v23 = objc_alloc(MEMORY[0x1E0C99E08]);
              objc_msgSend(v11, "dictionaryValue");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

              objc_msgSend(v11, "dictionaryValue");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v41[0] = MEMORY[0x1E0C809B0];
              v41[1] = 3221225472;
              v41[2] = __64__PPFeedbackUtils__flattenDictionarylikeToFeatures_featureName___block_invoke;
              v41[3] = &unk_1E7E14B40;
              v27 = v25;
              v42 = v27;
              v43 = v21;
              v35 = v21;
              objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v41);

              v28 = v43;
              v12 = v27;

              goto LABEL_12;
            default:
              goto LABEL_21;
          }
        }
LABEL_22:
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      v6 = v31;
    }
    while (v31);
  }

  return v4;
}

+ (id)_flattenArraylikeToFeatures:(void *)a3 featureName:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (objc_msgSend(v4, "type") != 5)
  {
    if (objc_msgSend(v4, "type") != 7
      || (objc_msgSend(v4, "sequenceValue"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "type"),
          v7,
          v8 != 1))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__flattenArraylikeToFeatures_featureName_, v6, CFSTR("PPFeedbackUtils.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value.type == MLFeatureTypeMultiArray || (value.type == MLFeatureTypeSequence && value.sequenceValue.type == MLFeatureTypeInt64)"));

    }
  }
  if (objc_msgSend(v4, "type") == 7)
  {
    objc_msgSend(v4, "sequenceValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "int64Values");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "multiArrayValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    if (objc_msgSend(v10, "count"))
    {
      v12 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:atIndexedSubscript:", v13, v12);

        ++v12;
      }
      while (v12 < objc_msgSend(v10, "count"));
    }
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  if (objc_msgSend(v11, "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%lu"), v5, v15);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, v17);

      ++v15;
    }
    while (v15 < objc_msgSend(v11, "count"));
  }

  return v14;
}

void __64__PPFeedbackUtils__flattenDictionarylikeToFeatures_featureName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v8 = a2;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@_dict_%@"), *(_QWORD *)(a1 + 40), v8);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v9);
}

@end
