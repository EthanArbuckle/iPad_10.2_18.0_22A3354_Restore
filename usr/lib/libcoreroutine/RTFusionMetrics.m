@implementation RTFusionMetrics

- (RTFusionMetrics)initWithLoggingEnabled:(BOOL)a3
{
  RTFusionMetrics *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)RTFusionMetrics;
  v3 = -[RTMetric initWithLoggingEnabled:](&v61, sel_initWithLoggingEnabled_, a3);
  if (v3)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend((id)objc_opt_class(), "BOOLeanKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v58;
      v8 = MEMORY[0x1E0C9AAA0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v58 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v9);
          -[RTMetric metrics](v3, "metrics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v10);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v6);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend((id)objc_opt_class(), "unsignedIntegerKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v54;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v16);
          -[RTMetric metrics](v3, "metrics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E9329138, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      }
      while (v14);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend((id)objc_opt_class(), "integerKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v50;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v23);
          -[RTMetric metrics](v3, "metrics");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E9329150, v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
      }
      while (v21);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend((id)objc_opt_class(), "doubleKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v30);
          -[RTMetric metrics](v3, "metrics");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E932D3B0, v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
      }
      while (v28);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend((id)objc_opt_class(), "bucketedKeys", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v42;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v42 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v37);
          -[RTMetric metrics](v3, "metrics");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", &unk_1E932D3B0, v38);

          ++v37;
        }
        while (v35 != v37);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
      }
      while (v35);
    }

  }
  return v3;
}

+ (id)BOOLeanKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("bestAgreedWithBluePOI"), CFSTR("bestAgreedWithLocalHint"), CFSTR("usedAOIBasedOnThreshold"), 0);
}

+ (id)unsignedIntegerKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("errorDomain"), CFSTR("numberOfCandidates"), CFSTR("numberOfLearnedPlaceKnownTypeCandidates"), CFSTR("numberOfLearnedPlaceUnknownTypeCandidates"), CFSTR("numberOfBluePOICandidates"), CFSTR("numberOfLocalHints"), CFSTR("numberOfAOICandidates"), CFSTR("numberOfNonAOICandidates"), CFSTR("numberOfFusedCandidates"), CFSTR("fuserAction"), 0);
}

+ (id)integerKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("errorCode"), 0);
}

+ (id)doubleKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("confidenceOfBest"), CFSTR("confidenceOfSecondBest"), CFSTR("logMax2ConfidenceRatio"), 0);
}

+ (id)bucketedKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("bucketedNumberOfLearnedPlaceKnownTypeCandidates"), CFSTR("bucketedNumberOfLearnedPlaceUnknownTypeCandidates"), CFSTR("bucketedNumberOfBluePOICandidates"), CFSTR("bucketedNumberOfLocalHints"), CFSTR("bucketedNumberOfAOICandidates"), CFSTR("bucketedNumberOfNonAOICandidates"), CFSTR("bucketedNumberOfFusedCandidates"), CFSTR("bucketedConfidenceOfBest"), CFSTR("bucketedConfidenceOfSecondBest"), CFSTR("bucketedLogMax2ConfidenceRatio"), 0);
}

+ (id)supportedMetricKeys
{
  void *v2;
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
  void *v13;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend((id)objc_opt_class(), "BOOLeanKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "unsignedIntegerKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  objc_msgSend((id)objc_opt_class(), "integerKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  objc_msgSend((id)objc_opt_class(), "doubleKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v11);

  objc_msgSend((id)objc_opt_class(), "bucketedKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  return v5;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventFusionQuery;
}

- (void)setInputMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *bluePOICandidates;
  NSArray *v33;
  NSArray *localHintCandidates;
  NSArray *v35;
  NSArray *learnedPlaceCandidatesExcludingHomeWork;
  NSArray *v37;
  NSArray *learnedPlaceHomeWorkCandidates;
  NSArray *v39;
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
  RTFusionMetrics *v52;
  NSArray *v53;
  NSArray *v54;
  NSArray *v55;
  id obj;
  NSArray *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = self;
  -[RTMetric metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfCandidates"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (!v7)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_33;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v58 = *(_QWORD *)v60;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v60 != v58)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v11);
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "source") == 0x4000)
      {

LABEL_9:
        v16 = v57;
        goto LABEL_10;
      }
      objc_msgSend(v12, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "source");

      if (v15 == 0x80000)
        goto LABEL_9;
      objc_msgSend(v12, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "source");

      if (v22 == 0x2000)
      {
        objc_msgSend(v12, "secondObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "unsignedIntegerValue") == 1)
        {

          goto LABEL_26;
        }
        objc_msgSend(v12, "secondObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "unsignedIntegerValue");

        if (v28 == 2)
LABEL_26:
          v16 = v55;
        else
          v16 = v54;
LABEL_10:
        -[NSArray addObject:](v16, "addObject:", v12);
        goto LABEL_11;
      }
      objc_msgSend(v12, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "source"))
        goto LABEL_24;
      objc_msgSend(v12, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "source") == 1)
        goto LABEL_23;
      objc_msgSend(v12, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "source") == 0x40000)
      {

LABEL_23:
LABEL_24:

        goto LABEL_11;
      }
      objc_msgSend(v12, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "source");

      if (v30 != 2)
      {
        v16 = v53;
        goto LABEL_10;
      }
LABEL_11:
      objc_msgSend(v12, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mapItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "extendedAttributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "wifiFingerprintLabelType");

      if (v20 == 2)
        ++v10;
      else
        ++v9;
      ++v11;
    }
    while (v8 != v11);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    v8 = v31;
  }
  while (v31);
LABEL_33:

  bluePOICandidates = v52->_bluePOICandidates;
  v52->_bluePOICandidates = v57;
  v33 = v57;

  localHintCandidates = v52->_localHintCandidates;
  v52->_localHintCandidates = v53;
  v35 = v53;

  learnedPlaceCandidatesExcludingHomeWork = v52->_learnedPlaceCandidatesExcludingHomeWork;
  v52->_learnedPlaceCandidatesExcludingHomeWork = v54;
  v37 = v54;

  learnedPlaceHomeWorkCandidates = v52->_learnedPlaceHomeWorkCandidates;
  v52->_learnedPlaceHomeWorkCandidates = v55;
  v39 = v55;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v33, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v52, "metrics");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("numberOfBluePOICandidates"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v35, "count"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v52, "metrics");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, CFSTR("numberOfLocalHints"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v37, "count"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v52, "metrics");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, CFSTR("numberOfLearnedPlaceUnknownTypeCandidates"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v39, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v52, "metrics");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, CFSTR("numberOfLearnedPlaceKnownTypeCandidates"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](v52, "metrics");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, CFSTR("numberOfAOICandidates"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTMetric metrics](v52, "metrics");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v50, CFSTR("numberOfNonAOICandidates"));

}

- (void)setOutputMetrics:(id)a3 bestFusedInferredMapItem:(id)a4 outputError:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  unsigned int v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0x1E0CB3000uLL;
  if (v10)
  {
    -[RTMetric metrics](self, "metrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E9329168, CFSTR("fuserAction"));

    objc_msgSend(v10, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D18598]);

    if (v14)
    {
      -[RTMetric metrics](self, "metrics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = &unk_1E9329180;
    }
    else
    {
      objc_msgSend(v10, "domain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("RTInferredMapItemFuserErrorDomain"));

      -[RTMetric metrics](self, "metrics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v26)
        v17 = &unk_1E9329198;
      else
        v17 = &unk_1E9329168;
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "code"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](self, "metrics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("errorCode"));

    goto LABEL_63;
  }
  if (!v9)
  {
    -[RTMetric metrics](self, "metrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = &unk_1E9329180;
    goto LABEL_18;
  }
  objc_msgSend(v9, "mapItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[RTMetric metrics](self, "metrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = &unk_1E9329198;
    goto LABEL_18;
  }
  objc_msgSend(v9, "mapItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "extendedAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "wifiFingerprintLabelType");

  switch(v21)
  {
    case 2:
      -[RTMetric metrics](self, "metrics");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = &unk_1E93291E0;
      goto LABEL_18;
    case 1:
      -[RTMetric metrics](self, "metrics");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = &unk_1E93291C8;
      goto LABEL_18;
    case 0:
      -[RTMetric metrics](self, "metrics");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = &unk_1E93291B0;
LABEL_18:
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("fuserAction"));

      break;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("numberOfFusedCandidates"));

  objc_msgSend(v9, "mapItem");
  v31 = objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v32 = self->_bluePOICandidates;
    v31 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    v82 = v8;
    if (v31)
    {
      v33 = *(_QWORD *)v88;
      while (2)
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v88 != v33)
            objc_enumerationMutation(v32);
          v35 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          objc_msgSend(v9, "mapItem");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "mapItem");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v36, "isEqualToMapItem:", v38);

          if ((v39 & 1) != 0)
          {
            v31 = 1;
            goto LABEL_30;
          }
        }
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
        if (v31)
          continue;
        break;
      }
LABEL_30:
      v10 = 0;
      v8 = v82;
      v11 = 0x1E0CB3000;
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v40 = self->_localHintCandidates;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    if (v41)
    {
      v81 = v31;
      v42 = *(_QWORD *)v84;
      while (2)
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v84 != v42)
            objc_enumerationMutation(v40);
          v44 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          objc_msgSend(v9, "mapItem");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "firstObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "mapItem");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v45, "isEqualToMapItem:", v47);

          if ((v48 & 1) != 0)
          {
            v41 = 1;
            goto LABEL_41;
          }
        }
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
        if (v41)
          continue;
        break;
      }
LABEL_41:
      v10 = 0;
      v8 = v82;
      v11 = 0x1E0CB3000;
      v31 = v81;
    }

  }
  else
  {
    v41 = 0;
  }
  objc_msgSend(*(id *)(v11 + 2024), "numberWithBool:", v31);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v49, CFSTR("bestAgreedWithBluePOI"));

  objc_msgSend(*(id *)(v11 + 2024), "numberWithBool:", v41);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v51, CFSTR("bestAgreedWithLocalHint"));

  objc_msgSend(v8, "firstObject");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = *(void **)(v11 + 2024);
    objc_msgSend(v8, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "confidence");
    objc_msgSend(v54, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55 = &unk_1E932D3B0;
  }
  -[RTMetric metrics](self, "metrics");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v55, CFSTR("confidenceOfBest"));

  if (v53)
  {

  }
  v57 = objc_msgSend(v8, "count");
  if (v57 < 2)
  {
    v59 = &unk_1E932D3B0;
  }
  else
  {
    v58 = *(void **)(v11 + 2024);
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "confidence");
    objc_msgSend(v58, "numberWithDouble:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[RTMetric metrics](self, "metrics");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKeyedSubscript:", v59, CFSTR("confidenceOfSecondBest"));

  if (v57 >= 2)
  {

  }
  objc_msgSend(v8, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v9, "mapItem");
    v61 = objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      v62 = (void *)v61;
      objc_msgSend(v9, "mapItem");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "extendedAttributes");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "wifiFingerprintLabelType");

      if (v65 == 2)
      {
        objc_msgSend(v8, "firstObject");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "mapItem");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          v68 = *(void **)(v11 + 2024);
          objc_msgSend(v9, "mapItem");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "mapItem");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "numberWithInt:", objc_msgSend(v69, "isEqualToMapItem:", v70) ^ 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setObject:forKeyedSubscript:", v71, CFSTR("usedAOIBasedOnThreshold"));

        }
        else
        {
          -[RTMetric metrics](self, "metrics");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("usedAOIBasedOnThreshold"));
        }

      }
    }
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v73 = *(void **)(v11 + 2024);
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "confidence");
    RTCommonSafeLog();
    v76 = v75;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "confidence");
    RTCommonSafeLog();
    objc_msgSend(v73, "numberWithDouble:", v76 - v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](self, "metrics");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setObject:forKeyedSubscript:", v79, CFSTR("logMax2ConfidenceRatio"));

  }
LABEL_63:

}

- (void)setMetricsUsingInputCandidates:(id)a3 outputFusedInferredMapItems:(id)a4 bestFusedInferredMapItem:(id)a5 outputError:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[RTFusionMetrics setInputMetrics:](self, "setInputMetrics:", a3);
  -[RTFusionMetrics setOutputMetrics:bestFusedInferredMapItem:outputError:](self, "setOutputMetrics:bestFusedInferredMapItem:outputError:", v12, v11, v10);

}

- (void)setDerivedMetrics
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E932D3C0, &unk_1E932D3D0, &unk_1E932D3E0);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numberOfLearnedPlaceKnownTypeCandidates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v4, &unk_1E932CA78);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("bucketedNumberOfLearnedPlaceKnownTypeCandidates"));

  -[RTMetric metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("numberOfLearnedPlaceUnknownTypeCandidates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v8, &unk_1E932CA78);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("bucketedNumberOfLearnedPlaceUnknownTypeCandidates"));

  -[RTMetric metrics](self, "metrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("numberOfLocalHints"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v12, &unk_1E932CA78);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("bucketedNumberOfLocalHints"));

  -[RTMetric metrics](self, "metrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("numberOfAOICandidates"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v16, &unk_1E932CA78);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("bucketedNumberOfAOICandidates"));

  -[RTMetric metrics](self, "metrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("numberOfNonAOICandidates"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v20, &unk_1E932CA78);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("bucketedNumberOfNonAOICandidates"));

  -[RTMetric metrics](self, "metrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("numberOfFusedCandidates"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v24, &unk_1E932CA78);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("bucketedNumberOfFusedCandidates"));

  -[RTMetric metrics](self, "metrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("confidenceOfBest"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v28, v39);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("bucketedConfidenceOfBest"));

  -[RTMetric metrics](self, "metrics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("confidenceOfSecondBest"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v32, v39);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("bucketedConfidenceOfSecondBest"));

  -[RTMetric metrics](self, "metrics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("logMax2ConfidenceRatio"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v36, &unk_1E932CA90);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("bucketedLogMax2ConfidenceRatio"));

}

- (BOOL)submitMetricsWithError:(id *)a3
{
  objc_super v6;

  -[RTFusionMetrics setDerivedMetrics](self, "setDerivedMetrics");
  v6.receiver = self;
  v6.super_class = (Class)RTFusionMetrics;
  return -[RTMetric submitMetricsWithError:](&v6, sel_submitMetricsWithError_, a3);
}

- (NSArray)bluePOICandidates
{
  return self->_bluePOICandidates;
}

- (void)setBluePOICandidates:(id)a3
{
  objc_storeStrong((id *)&self->_bluePOICandidates, a3);
}

- (NSArray)localHintCandidates
{
  return self->_localHintCandidates;
}

- (void)setLocalHintCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_localHintCandidates, a3);
}

- (NSArray)learnedPlaceCandidatesExcludingHomeWork
{
  return self->_learnedPlaceCandidatesExcludingHomeWork;
}

- (void)setLearnedPlaceCandidatesExcludingHomeWork:(id)a3
{
  objc_storeStrong((id *)&self->_learnedPlaceCandidatesExcludingHomeWork, a3);
}

- (NSArray)learnedPlaceHomeWorkCandidates
{
  return self->_learnedPlaceHomeWorkCandidates;
}

- (void)setLearnedPlaceHomeWorkCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_learnedPlaceHomeWorkCandidates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnedPlaceHomeWorkCandidates, 0);
  objc_storeStrong((id *)&self->_learnedPlaceCandidatesExcludingHomeWork, 0);
  objc_storeStrong((id *)&self->_localHintCandidates, 0);
  objc_storeStrong((id *)&self->_bluePOICandidates, 0);
}

@end
