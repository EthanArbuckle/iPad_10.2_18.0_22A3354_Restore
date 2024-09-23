@implementation RTMapItemProviderBluePOIPerformanceMetrics

- (RTMapItemProviderBluePOIPerformanceMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithNonZeroAccessPointsFingerprintsCount_zeroAccessPointsFingerprintsCount_fingerprintsCount_queryCount_firstResultQueryCount_results_earlyStopQueryCount_earlyStopQueryResult_bestQueryResult_error_visitInterval_visitSource_);
}

+ (id)_bestMapItemForQuery:(id)a3 wifiFingerprintLabelType:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v21;
      while (1)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "mapItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "extendedAttributes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "wifiFingerprintLabelType") != a4)
          {

            goto LABEL_14;
          }
          if (!v9)
          {

LABEL_13:
            v13 = v9;
            v9 = v12;
LABEL_14:

            continue;
          }
          objc_msgSend(v9, "confidence");
          v16 = v15;
          objc_msgSend(v12, "confidence");
          v18 = v17;

          if (v16 < v18)
            goto LABEL_13;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (!v8)
          goto LABEL_19;
      }
    }
  }
  v9 = 0;
LABEL_19:

  return v9;
}

+ (id)_mapItemDictionaryforResults:(id)a3 wifiFingerprintLabelType:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v33 = v5;
    do
    {
      v34 = v7;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      obj = v9;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v37 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v14, "mapItem");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "extendedAttributes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "wifiFingerprintLabelType");

            if (v17 == a4)
            {
              v18 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v14, "mapItem");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "muid"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKeyedSubscript:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v21)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v14, "mapItem");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "muid"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, v25);

              }
              v26 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v14, "mapItem");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "muid"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v14, "confidence");
              objc_msgSend(v30, "numberWithDouble:");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v31);

            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v11);
      }

      v5 = v33;
      v7 = v34 + 1;
    }
    while (objc_msgSend(v33, "count") > (unint64_t)(v34 + 1));
  }

  return v6;
}

+ (void)_getDominantStreakForResults:(id)a3 dominantKey:(id *)a4 largestSameResultCount:(unint64_t *)a5 hasDominantResult:(BOOL *)a6
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v15, "count");

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == objc_msgSend(v16, "count"))
        {
          v17 = objc_msgSend(v10, "containsObject:", v14);

          if ((v17 & 1) == 0)
            objc_msgSend(v10, "addObject:", v14);
        }
        else
        {

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v11 < v19)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
          v20 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectForKeyedSubscript:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v21, "count");

          v10 = (void *)v20;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = v11;
    v22 = objc_msgSend(v10, "count") == 1;
  }
  else
  {
    v22 = 0;
    *a4 = 0;
    *a5 = 0;
  }
  *a6 = v22;

}

- (RTMapItemProviderBluePOIPerformanceMetrics)initWithNonZeroAccessPointsFingerprintsCount:(unint64_t)a3 zeroAccessPointsFingerprintsCount:(unint64_t)a4 fingerprintsCount:(unint64_t)a5 queryCount:(unint64_t)a6 firstResultQueryCount:(unint64_t)a7 results:(id)a8 earlyStopQueryCount:(unint64_t)a9 earlyStopQueryResult:(id)a10 bestQueryResult:(id)a11 error:(id)a12 visitInterval:(double)a13 visitSource:(int64_t)a14
{
  id v20;
  id v21;
  id v22;
  RTMapItemProviderBluePOIPerformanceMetrics *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableDictionary *metrics;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  _BOOL8 v77;
  void *v78;
  void *v79;
  int v80;
  uint64_t v81;
  _BOOL8 v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  _BOOL8 v90;
  void *v91;
  void *v92;
  int v93;
  uint64_t v94;
  _BOOL8 v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  id v116;
  id v117;
  unsigned __int8 v118;
  uint64_t v119;
  id v120;
  unsigned __int8 v121;
  uint64_t v122;
  objc_super v123;

  v20 = a8;
  v21 = a10;
  v22 = a11;
  v116 = a12;
  v123.receiver = self;
  v123.super_class = (Class)RTMapItemProviderBluePOIPerformanceMetrics;
  v23 = -[RTMapItemProviderBluePOIPerformanceMetrics init](&v123, sel_init);
  if (v23)
  {
    v113 = v22;
    v114 = v21;
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v112 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v112 = 0;
    }
    objc_msgSend((id)objc_opt_class(), "_mapItemDictionaryforResults:wifiFingerprintLabelType:", v20, 1);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_mapItemDictionaryforResults:wifiFingerprintLabelType:", v20, 2);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v20;
    v25 = objc_msgSend(v20, "count");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    metrics = v23->_metrics;
    v23->_metrics = (NSMutableDictionary *)v26;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v28, CFSTR("fingerprintsCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v29, CFSTR("zeroAccessPointsFingerprintsCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v30, CFSTR("nonZeroAccessPointsFingerprintsCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v31, CFSTR("visitSource"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v32, CFSTR("visitDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v33, CFSTR("queryCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v34, CFSTR("resultCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v35, CFSTR("firstResultQueryCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v36, CFSTR("earlyStopQueryCount"));

    objc_msgSend((id)objc_opt_class(), "_bestMapItemForQuery:wifiFingerprintLabelType:", v114, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v37, "confidence");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v39, CFSTR("earlyStopPOIConfidence"));

    objc_msgSend((id)objc_opt_class(), "_bestMapItemForQuery:wifiFingerprintLabelType:", v114, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v40, "confidence");
    objc_msgSend(v41, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v42, CFSTR("earlyStopAOIConfidence"));

    objc_msgSend((id)objc_opt_class(), "_bestMapItemForQuery:wifiFingerprintLabelType:", v113, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v43, "confidence");
    objc_msgSend(v44, "numberWithDouble:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v45, CFSTR("bestPOIConfidence"));

    objc_msgSend((id)objc_opt_class(), "_bestMapItemForQuery:wifiFingerprintLabelType:", v113, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v46, "confidence");
    objc_msgSend(v47, "numberWithDouble:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v48, CFSTR("bestAOIConfidence"));

    objc_msgSend((id)objc_opt_class(), "_bestMapItemForQuery:wifiFingerprintLabelType:", v112, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)MEMORY[0x1E0CB37E8];
    v106 = v49;
    objc_msgSend(v49, "confidence");
    objc_msgSend(v50, "numberWithDouble:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v51, CFSTR("firstResultPOIConfidence"));

    objc_msgSend((id)objc_opt_class(), "_bestMapItemForQuery:wifiFingerprintLabelType:", v112, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)MEMORY[0x1E0CB37E8];
    v105 = v52;
    objc_msgSend(v52, "confidence");
    objc_msgSend(v53, "numberWithDouble:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v54, CFSTR("firstResultAOIConfidence"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v46 != 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v55, CFSTR("hasAOIResult"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43 != 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v56, CFSTR("hasPOIResult"));

    if (v40 && v46)
    {
      objc_msgSend(v46, "confidence");
      v58 = v57;
      objc_msgSend(v40, "confidence");
      v60 = v58 - v59;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v61, CFSTR("bestEarlyStopAOIConfidenceDiference"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v60 < 0.001);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v62, CFSTR("earlyStopConfidenceEqualsBestConfidenceAOI"));

    }
    if (v37 && v43)
    {
      objc_msgSend(v43, "confidence");
      v64 = v63;
      objc_msgSend(v37, "confidence");
      v66 = v64 - v65;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v67, CFSTR("bestEarlyStopPOIConfidenceDiference"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v66 < 0.001);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v68, CFSTR("earlyStopConfidenceEqualsBestConfidencePOI"));

    }
    v110 = v37;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v111, "count"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v69, CFSTR("uniqueAOIResultCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v115, "count"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v70, CFSTR("uniquePOIResultCount"));

    v122 = 0;
    v121 = 0;
    v120 = 0;
    objc_msgSend((id)objc_opt_class(), "_getDominantStreakForResults:dominantKey:largestSameResultCount:hasDominantResult:", v111, &v120, &v122, &v121);
    v71 = v120;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v72, CFSTR("largestSameResultAOICount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v121);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v73, CFSTR("hasDominantAOIResult"));

    v74 = (void *)MEMORY[0x1E0CB37E8];
    v75 = v121;
    if (v121)
    {
      objc_msgSend(v40, "mapItem");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v73, "muid");
      v77 = v76 == objc_msgSend(v71, "unsignedIntegerValue");
    }
    else
    {
      v77 = 0;
    }
    objc_msgSend(v74, "numberWithInt:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v78, CFSTR("isEarlyStopDominantAOIResult"));

    if (v75)
    v79 = (void *)MEMORY[0x1E0CB37E8];
    v80 = v121;
    if (v121)
    {
      objc_msgSend(v46, "mapItem");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v73, "muid");
      v82 = v81 == objc_msgSend(v71, "unsignedIntegerValue");
    }
    else
    {
      v82 = 0;
    }
    v107 = v40;
    objc_msgSend(v79, "numberWithInt:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v83, CFSTR("isBestResultDominantAOIResult"));

    if (v80)
    v119 = 0;
    v118 = 0;
    v117 = 0;
    objc_msgSend((id)objc_opt_class(), "_getDominantStreakForResults:dominantKey:largestSameResultCount:hasDominantResult:", v115, &v117, &v119, &v118);
    v84 = v117;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v119);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v85, CFSTR("largestSameResultPOICount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v118);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v86, CFSTR("hasDominantPOIResult"));

    v87 = (void *)MEMORY[0x1E0CB37E8];
    v88 = v118;
    if (v118)
    {
      objc_msgSend(v110, "mapItem");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v86, "muid");
      v90 = v89 == objc_msgSend(v84, "unsignedIntegerValue");
    }
    else
    {
      v90 = 0;
    }
    objc_msgSend(v87, "numberWithInt:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v91, CFSTR("isEarlyStopDominantPOIResult"));

    if (v88)
    v92 = (void *)MEMORY[0x1E0CB37E8];
    v93 = v118;
    if (v118)
    {
      objc_msgSend(v43, "mapItem");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v86, "muid");
      v95 = v94 == objc_msgSend(v84, "unsignedIntegerValue");
    }
    else
    {
      v95 = 0;
    }
    objc_msgSend(v92, "numberWithInt:", v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v96, CFSTR("isBestResultDominantPOIResult"));

    if (v93)
    if (v116)
    {
      objc_msgSend(v116, "domain");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v97, CFSTR("errorDomain"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v116, "code"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v98, CFSTR("errorCode"));

      objc_msgSend(v116, "userInfo");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = *MEMORY[0x1E0D26588];
      objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x1E0D26588]);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      if (v101)
      {
        objc_msgSend(v116, "userInfo");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "objectForKeyedSubscript:", v100);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v23->_metrics, "setObject:forKeyedSubscript:", v103, CFSTR("httpCode"));

      }
    }

    v20 = v108;
    v22 = v113;
    v21 = v114;
  }

  return v23;
}

- (void)submitMetrics
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSMutableDictionary *metrics;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSMutableDictionary *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__RTMapItemProviderBluePOIPerformanceMetrics_submitMetrics__block_invoke;
  v18[3] = &unk_1E929EFC0;
  objc_copyWeak(&v19, &location);
  v5 = (void *)MEMORY[0x1D8232094](v18);
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    metrics = self->_metrics;
    *(_DWORD *)buf = 138412546;
    v22 = v7;
    v23 = 2112;
    v24 = metrics;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, submitting, BluePOIPerformanceMetrics, %@", buf, 0x16u);

  }
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (void *)objc_msgSend(v9, "initWithCString:encoding:", RTAnalyticsEventBluePOIPerformanceMetrics, 1);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __59__RTMapItemProviderBluePOIPerformanceMetrics_submitMetrics__block_invoke_81;
  v15[3] = &unk_1E929B460;
  v11 = v5;
  v17 = v11;
  v12 = v10;
  v16 = v12;
  v13 = (void *)MEMORY[0x1D8232094](v15);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

id __59__RTMapItemProviderBluePOIPerformanceMetrics_submitMetrics__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "metrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __59__RTMapItemProviderBluePOIPerformanceMetrics_submitMetrics__block_invoke_81(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(*(void **)(a1 + 32), v2);
  return v2;
}

+ (void)submitMetricsWithNonZeroAccessPointsFingerprintsCount:(unint64_t)a3 zeroAccessPointsFingerprintsCount:(unint64_t)a4 fingerprintsCount:(unint64_t)a5 queryCount:(unint64_t)a6 firstResultQueryCount:(unint64_t)a7 results:(id)a8 earlyStopQueryCount:(unint64_t)a9 earlyStopQueryResult:(id)a10 bestQueryResult:(id)a11 error:(id)a12 visitInterval:(double)a13 visitSource:(int64_t)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  RTMapItemProviderBluePOIPerformanceMetrics *v25;

  v19 = a12;
  v20 = a11;
  v21 = a10;
  v22 = a8;
  v25 = -[RTMapItemProviderBluePOIPerformanceMetrics initWithNonZeroAccessPointsFingerprintsCount:zeroAccessPointsFingerprintsCount:fingerprintsCount:queryCount:firstResultQueryCount:results:earlyStopQueryCount:earlyStopQueryResult:bestQueryResult:error:visitInterval:visitSource:]([RTMapItemProviderBluePOIPerformanceMetrics alloc], "initWithNonZeroAccessPointsFingerprintsCount:zeroAccessPointsFingerprintsCount:fingerprintsCount:queryCount:firstResultQueryCount:results:earlyStopQueryCount:earlyStopQueryResult:bestQueryResult:error:visitInterval:visitSource:", a3, a4, a5, a6, a7, v22, a13, a9, v21, v20, v19, a14);

  -[RTMapItemProviderBluePOIPerformanceMetrics submitMetrics](v25, "submitMetrics");
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
