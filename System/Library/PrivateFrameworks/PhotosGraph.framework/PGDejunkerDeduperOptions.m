@implementation PGDejunkerDeduperOptions

- (id)initForCuratedLibrary
{
  PGDejunkerDeduperOptions *v2;
  PGDejunkerDeduperOptions *v3;
  NSString *baseFlavor;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  NSSet *identifiersOfRequiredItems;
  NSSet *identifiersOfEligibleItems;
  __int128 v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PGDejunkerDeduperOptions;
  v2 = -[PGDejunkerDeduperOptions init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    baseFlavor = v2->_baseFlavor;
    v2->_baseFlavor = (NSString *)CFSTR("CuratedLibrary");

    *(_WORD *)&v3->_doIdenticalDeduping = 257;
    *(_OWORD *)&v3->_identicalDedupingTimeInterval = xmmword_1CA8EDA60;
    v3->_identicalDedupingMaximumTimeGroupExtension = 2.0;
    v3->_maximumNumberOfItemsPerIdenticalCluster = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v3->_identicalDedupingThreshold = _Q0;
    *(_OWORD *)&v3->_identicalDedupingThresholdForBestItems = _Q0;
    v17 = _Q0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("PGDeduperIdenticalDedupingFaceprintDistance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      v3->_identicalDedupingFaceprintDistance = v12;
    }
    *(_OWORD *)&v3->_semanticalDedupingTimeInterval = xmmword_1CA8EDA70;
    *(_OWORD *)&v3->_semanticalDedupingTimeIntervalForPersons = xmmword_1CA8EDA80;
    v3->_maximumNumberOfItemsPerSemanticalCluster = 0;
    *(_OWORD *)&v3->_semanticalDedupingThreshold = v17;
    *(_DWORD *)&v3->_doSemanticalDeduping = 1;
    *(_WORD *)&v3->_semanticalDedupingProtectSmallClusters = 1;
    *(_DWORD *)&v3->_useAllPersonsForDeduping = 16843009;
    *(_DWORD *)&v3->_onlyDedupeContiguousItems = 256;
    *(_OWORD *)&v3->_semanticalDedupingThresholdForPersons = xmmword_1CA8EDA90;
    *(_OWORD *)&v3->_finalPassMaximumTimeGroupExtension = xmmword_1CA8EDAA0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    identifiersOfRequiredItems = v3->_identifiersOfRequiredItems;
    v3->_identifiersOfRequiredItems = (NSSet *)v13;

    identifiersOfEligibleItems = v3->_identifiersOfEligibleItems;
    v3->_identifiersOfEligibleItems = 0;

    v3->_duration = 16;
  }
  return v3;
}

- (id)initForMemories
{
  PGDejunkerDeduperOptions *v2;
  PGDejunkerDeduperOptions *v3;
  NSString *baseFlavor;
  uint64_t v10;
  NSSet *identifiersOfRequiredItems;
  NSSet *identifiersOfEligibleItems;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PGDejunkerDeduperOptions;
  v2 = -[PGDejunkerDeduperOptions init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    baseFlavor = v2->_baseFlavor;
    v2->_baseFlavor = (NSString *)CFSTR("Memories");

    *(_WORD *)&v3->_doIdenticalDeduping = 1;
    *(_OWORD *)&v3->_identicalDedupingTimeInterval = xmmword_1CA8EDAB0;
    v3->_identicalDedupingMaximumTimeGroupExtension = 5.0;
    v3->_maximumNumberOfItemsPerIdenticalCluster = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v3->_identicalDedupingThreshold = _Q0;
    *(_OWORD *)&v3->_identicalDedupingThresholdForBestItems = _Q0;
    v3->_doSemanticalDeduping = 1;
    *(_OWORD *)&v3->_semanticalDedupingTimeInterval = xmmword_1CA8EDAC0;
    *(_OWORD *)&v3->_semanticalDedupingTimeIntervalForPersons = xmmword_1CA8EDAD0;
    v3->_maximumNumberOfItemsPerSemanticalCluster = 0;
    *(_OWORD *)&v3->_semanticalDedupingThreshold = _Q0;
    *(_DWORD *)&v3->_doNotSemanticallyDedupePeople = 0;
    *(_WORD *)&v3->_useOnlyScenesForDeduping = 0;
    *(_DWORD *)&v3->_useFaceQualityForElection = 65537;
    *(_WORD *)&v3->_doDejunk = 1;
    v3->_doFinalPass = 0;
    *(_OWORD *)&v3->_semanticalDedupingThresholdForPersons = xmmword_1CA8EDA90;
    *(_OWORD *)&v3->_finalPassMaximumTimeGroupExtension = xmmword_1CA8EDAA0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    identifiersOfRequiredItems = v3->_identifiersOfRequiredItems;
    v3->_identifiersOfRequiredItems = (NSSet *)v10;

    identifiersOfEligibleItems = v3->_identifiersOfEligibleItems;
    v3->_identifiersOfEligibleItems = 0;

    v3->_duration = 16;
  }
  return v3;
}

- (PGDejunkerDeduperOptions)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  double v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  double v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  PGDejunkerDeduperOptions *v143;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("baseFlavor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Memories")))
    v6 = -[PGDejunkerDeduperOptions initForMemories](self, "initForMemories");
  else
    v6 = -[PGDejunkerDeduperOptions initForCuratedLibrary](self, "initForCuratedLibrary");
  v7 = (uint64_t *)v6;

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doIdenticalDeduping"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doIdenticalDeduping"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 16) = objc_msgSend(v9, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeInterval"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeInterval"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      if (v12 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeInterval"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v7[4] = v14;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeIntervalForPeople"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeIntervalForPeople"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      if (v17 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeIntervalForPeople"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v7[5] = v19;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingMaximumTimeGroupExtension"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingMaximumTimeGroupExtension"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      if (v22 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingMaximumTimeGroupExtension"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v7[6] = v24;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumNumberOfItemsPerIdenticalCluster"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumNumberOfItemsPerIdenticalCluster"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "unsignedIntegerValue");
      if (!v27)
        v27 = v7[7];
      v7[7] = v27;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingThreshold"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingThreshold"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      if (v30 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingThreshold"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValue");
        v7[8] = v32;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForPeople"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForPeople"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      if (v35 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForPeople"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v7[9] = v37;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForBestItems"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForBestItems"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValue");
      if (v40 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForBestItems"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "doubleValue");
        v7[10] = v42;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useFaceprintsForIdenticalDeduping"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useFaceprintsForIdenticalDeduping"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 17) = objc_msgSend(v44, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingFaceprintDistance"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingFaceprintDistance"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "doubleValue");
      if (v47 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingFaceprintDistance"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "doubleValue");
        v7[11] = v49;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doSemanticalDeduping"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doSemanticalDeduping"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 18) = objc_msgSend(v51, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeInterval"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeInterval"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "doubleValue");
      if (v54 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeInterval"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "doubleValue");
        v7[12] = v56;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPeople"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPeople"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "doubleValue");
      if (v59 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPeople"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "doubleValue");
        v7[13] = v61;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPersons"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPersons"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "doubleValue");
      if (v64 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPersons"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "doubleValue");
        v7[14] = v66;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingMaximumTimeGroupExtension"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingMaximumTimeGroupExtension"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "doubleValue");
      if (v69 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingMaximumTimeGroupExtension"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "doubleValue");
        v7[15] = v71;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumNumberOfItemsPerSemanticalCluster"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumNumberOfItemsPerSemanticalCluster"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "unsignedIntegerValue");
      if (!v74)
        v74 = v7[16];
      v7[16] = v74;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThreshold"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThreshold"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "doubleValue");
      if (v77 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThreshold"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "doubleValue");
        v7[17] = v79;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPeople"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPeople"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "doubleValue");
      if (v82 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPeople"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "doubleValue");
        v7[18] = v84;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPersons"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPersons"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "doubleValue");
      if (v87 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPersons"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "doubleValue");
        v7[19] = v89;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dontSemanticallyDedupePeople"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dontSemanticallyDedupePeople"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 19) = objc_msgSend(v91, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dontSemanticallyDedupePersons"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if (v92)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dontSemanticallyDedupePersons"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 20) = objc_msgSend(v93, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowAdaptiveForSemanticalDeduping"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (v94)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowAdaptiveForSemanticalDeduping"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 21) = objc_msgSend(v95, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingProtectSmallCluster"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingProtectSmallCluster"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 22) = objc_msgSend(v97, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useOnlyScenesForDeduping"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (v98)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useOnlyScenesForDeduping"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 23) = objc_msgSend(v99, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useAllPersonsForDeduping"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useAllPersonsForDeduping"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 24) = objc_msgSend(v101, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useFaceQualityForElection"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useFaceQualityForElection"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 25) = objc_msgSend(v103, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doNotDedupeVideos"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v104)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doNotDedupeVideos"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 26) = objc_msgSend(v105, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doNotDedupeInterestingPortraitsAndLivePictures"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doNotDedupeInterestingPortraitsAndLivePictures"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 27) = objc_msgSend(v107, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onlyDedupeContiguousItems"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (v108)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onlyDedupeContiguousItems"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 28) = objc_msgSend(v109, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doDejunk"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (v110)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doDejunk"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 29) = objc_msgSend(v111, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("returnDedupedJunkIfOnlyJunk"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    if (v112)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("returnDedupedJunkIfOnlyJunk"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 30) = objc_msgSend(v113, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doFinalPass"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (v114)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doFinalPass"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v7 + 31) = objc_msgSend(v115, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalPassTimeInterval"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    if (v116)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalPassTimeInterval"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "doubleValue");
      if (v118 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalPassTimeInterval"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "doubleValue");
        v7[20] = v120;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalPassMaximumTimeGroupExtension"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    if (v121)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalPassMaximumTimeGroupExtension"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "doubleValue");
      if (v123 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalPassMaximumTimeGroupExtension"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "doubleValue");
        v7[21] = v125;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalPassDedupingThreshold"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    if (v126)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalPassDedupingThreshold"));
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "doubleValue");
      if (v128 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalPassDedupingThreshold"));
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "doubleValue");
        v7[22] = v130;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifiersOfRequiredItems"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    if (v131)
    {
      v132 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifiersOfRequiredItems"));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "setWithArray:", v133);
      v134 = objc_claimAutoreleasedReturnValue();
      v135 = (void *)v7[23];
      v7[23] = v134;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifiersOfEligibleItems"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    if (v136)
    {
      v137 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifiersOfEligibleItems"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "setWithArray:", v138);
      v139 = objc_claimAutoreleasedReturnValue();
      v140 = (void *)v7[24];
      v7[24] = v139;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    if (v141)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v7[25] = objc_msgSend(v142, "unsignedIntegerValue");

    }
  }
  v143 = v7;

  return v143;
}

- (id)dictionaryRepresentationRestrictingToGlobalOptions:(BOOL)a3
{
  NSString *baseFlavor;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v49[37];
  _QWORD v50[39];

  v50[37] = *MEMORY[0x1E0C80C00];
  baseFlavor = self->_baseFlavor;
  if (!baseFlavor)
    baseFlavor = (NSString *)CFSTR("CuratedLibrary");
  v50[0] = baseFlavor;
  v49[0] = CFSTR("baseFlavor");
  v49[1] = CFSTR("doIdenticalDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_doIdenticalDeduping);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v47;
  v49[2] = CFSTR("identicalDedupingTimeInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_identicalDedupingTimeInterval);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v46;
  v49[3] = CFSTR("identicalDedupingTimeIntervalForPeople");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_identicalDedupingTimeIntervalForPeople);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v45;
  v49[4] = CFSTR("identicalDedupingMaximumTimeGroupExtension");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_identicalDedupingMaximumTimeGroupExtension);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v44;
  v49[5] = CFSTR("maximumNumberOfItemsPerIdenticalCluster");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maximumNumberOfItemsPerIdenticalCluster);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v43;
  v49[6] = CFSTR("identicalDedupingThreshold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_identicalDedupingThreshold);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v42;
  v49[7] = CFSTR("identicalDedupingThresholdForPeople");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_identicalDedupingThresholdForPeople);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v41;
  v49[8] = CFSTR("identicalDedupingThresholdForBestItems");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_identicalDedupingThresholdForBestItems);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v40;
  v49[9] = CFSTR("useFaceprintsForIdenticalDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useFaceprintsForIdenticalDeduping);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v39;
  v49[10] = CFSTR("identicalDedupingFaceprintDistance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_identicalDedupingFaceprintDistance);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v38;
  v49[11] = CFSTR("doSemanticalDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_doSemanticalDeduping);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v37;
  v49[12] = CFSTR("semanticalDedupingTimeInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_semanticalDedupingTimeInterval);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v50[12] = v36;
  v49[13] = CFSTR("semanticalDedupingTimeIntervalForPeople");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_semanticalDedupingTimeIntervalForPeople);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v50[13] = v35;
  v49[14] = CFSTR("semanticalDedupingTimeIntervalForPersons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_semanticalDedupingTimeIntervalForPersons);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50[14] = v34;
  v49[15] = CFSTR("semanticalDedupingMaximumTimeGroupExtension");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_semanticalDedupingMaximumTimeGroupExtension);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[15] = v33;
  v49[16] = CFSTR("maximumNumberOfItemsPerSemanticalCluster");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maximumNumberOfItemsPerSemanticalCluster);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[16] = v32;
  v49[17] = CFSTR("semanticalDedupingThreshold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_semanticalDedupingThreshold);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[17] = v31;
  v49[18] = CFSTR("semanticalDedupingThresholdForPeople");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_semanticalDedupingThresholdForPeople);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50[18] = v30;
  v49[19] = CFSTR("semanticalDedupingThresholdForPersons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_semanticalDedupingThresholdForPersons);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[19] = v29;
  v49[20] = CFSTR("dontSemanticallyDedupePeople");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_doNotSemanticallyDedupePeople);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[20] = v28;
  v49[21] = CFSTR("dontSemanticallyDedupePersons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_doNotSemanticallyDedupePersons);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50[21] = v27;
  v49[22] = CFSTR("allowAdaptiveForSemanticalDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowAdaptiveForSemanticalDeduping);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[22] = v26;
  v49[23] = CFSTR("semanticalDedupingProtectSmallCluster");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_semanticalDedupingProtectSmallClusters);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50[23] = v24;
  v49[24] = CFSTR("useOnlyScenesForDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useOnlyScenesForDeduping);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50[24] = v23;
  v49[25] = CFSTR("useAllPersonsForDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useAllPersonsForDeduping);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[25] = v22;
  v49[26] = CFSTR("useFaceQualityForElection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useFaceQualityForElection);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[26] = v21;
  v49[27] = CFSTR("doNotDedupeVideos");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_doNotDedupeVideos);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50[27] = v20;
  v49[28] = CFSTR("doNotDedupeInterestingPortraitsAndLivePictures");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_doNotDedupeInterestingPortraitsAndLivePictures);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50[28] = v5;
  v49[29] = CFSTR("onlyDedupeContiguousItems");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onlyDedupeContiguousItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[29] = v6;
  v49[30] = CFSTR("doDejunk");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_doDejunk);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50[30] = v7;
  v49[31] = CFSTR("returnDedupedJunkIfOnlyJunk");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_returnDedupedJunkIfOnlyJunk);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[31] = v8;
  v49[32] = CFSTR("doFinalPass");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_doFinalPass);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50[32] = v9;
  v49[33] = CFSTR("finalPassTimeInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_finalPassTimeInterval);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[33] = v10;
  v49[34] = CFSTR("finalPassMaximumTimeGroupExtension");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_finalPassMaximumTimeGroupExtension);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[34] = v11;
  v49[35] = CFSTR("finalPassDedupingThreshold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_finalPassDedupingThreshold);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[35] = v12;
  v49[36] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_duration);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[36] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    return v25;
  v15 = (void *)objc_msgSend(v25, "mutableCopy");
  -[NSSet allObjects](self->_identifiersOfRequiredItems, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("identifiersOfRequiredItems"));

  -[NSSet allObjects](self->_identifiersOfEligibleItems, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingSelector:", sel_compare_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("identifiersOfEligibleItems"));

  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v3;
  if (self->_doIdenticalDeduping)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Do identical deduping: %@"), v5);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tTime interval: %.3f"), *(_QWORD *)&self->_identicalDedupingTimeInterval);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tTime interval for people: %.3f"), *(_QWORD *)&self->_identicalDedupingTimeIntervalForPeople);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tMaximum time group extension: %.3f"), *(_QWORD *)&self->_identicalDedupingMaximumTimeGroupExtension);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tMaximum number of items per cluster: %lu"), self->_maximumNumberOfItemsPerIdenticalCluster);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDeduping threshold: %.3f"), *(_QWORD *)&self->_identicalDedupingThreshold);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDeduping threshold for people: %.3f"), *(_QWORD *)&self->_identicalDedupingThresholdForPeople);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDeduping threshold for best items: %.3f"), *(_QWORD *)&self->_identicalDedupingThresholdForBestItems);
  if (self->_useFaceprintsForIdenticalDeduping)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\tUse faceprints: %@"), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tFaceprint distance: %.3f"), *(_QWORD *)&self->_identicalDedupingFaceprintDistance);
  if (self->_doSemanticalDeduping)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("Do semantical deduping: %@"), v7);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tTime interval: %.3f"), *(_QWORD *)&self->_semanticalDedupingTimeInterval);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tTime interval for people: %.3f"), *(_QWORD *)&self->_semanticalDedupingTimeIntervalForPeople);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tTime interval for persons: %.3f"), *(_QWORD *)&self->_semanticalDedupingTimeIntervalForPersons);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tMaximum time group extension: %.3f"), *(_QWORD *)&self->_semanticalDedupingMaximumTimeGroupExtension);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tMaximum number of items per cluster: %lu"), self->_maximumNumberOfItemsPerSemanticalCluster);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDeduping threshold: %.3f"), *(_QWORD *)&self->_semanticalDedupingThreshold);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDeduping threshold for people: %.3f"), *(_QWORD *)&self->_semanticalDedupingThresholdForPeople);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDeduping threshold for persons: %.3f"), *(_QWORD *)&self->_semanticalDedupingThresholdForPersons);
  if (self->_doNotSemanticallyDedupePeople)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDon't dedupe people: %@"), v8);
  if (self->_doNotSemanticallyDedupePersons)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDon't dedupe persons: %@"), v9);
  if (self->_allowAdaptiveForSemanticalDeduping)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\tAllow adaptive: %@"), v10);
  if (self->_semanticalDedupingProtectSmallClusters)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\tProtect small clusters: %@"), v11);
  if (self->_useOnlyScenesForDeduping)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("Use only scenes for deduping: %@"), v12);
  if (self->_useAllPersonsForDeduping)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("Use all persons for deduping: %@"), v13);
  if (self->_useFaceQualityForElection)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("Use face quality for election: %@"), v14);
  if (self->_doNotDedupeVideos)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("Don't dedupe videos: %@"), v15);
  if (self->_doNotDedupeInterestingPortraitsAndLivePictures)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("Don't dedupe interesting portraits and live pictures together: %@"), v16);
  if (self->_onlyDedupeContiguousItems)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("Only dedupe contiguous items: %@"), v17);
  if (self->_doDejunk)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("Do dejunk: %@"), v18);
  if (self->_returnDedupedJunkIfOnlyJunk)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\tReturn deduped junk if only junk: %@"), v19);
  if (self->_doFinalPass)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("Do final pass: %@"), v20);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tTime interval: %.3f"), *(_QWORD *)&self->_finalPassTimeInterval);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tMaximum time group extension: %.3f"), *(_QWORD *)&self->_finalPassMaximumTimeGroupExtension);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDeduping threshold: %.3f"), *(_QWORD *)&self->_finalPassDedupingThreshold);
  -[NSSet allObjects](self->_identifiersOfRequiredItems, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\tRequired Item Identifiers: %@"), v23);

  -[NSSet allObjects](self->_identifiersOfEligibleItems, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sortedArrayUsingSelector:", sel_compare_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\tEligible Item Identifiers: %@"), v26);

  objc_msgSend(v4, "appendFormat:", CFSTR("\tDuration: %lu"), self->_duration);
  return v4;
}

- (BOOL)doIdenticalDeduping
{
  return self->_doIdenticalDeduping;
}

- (void)setDoIdenticalDeduping:(BOOL)a3
{
  self->_doIdenticalDeduping = a3;
}

- (double)identicalDedupingTimeInterval
{
  return self->_identicalDedupingTimeInterval;
}

- (void)setIdenticalDedupingTimeInterval:(double)a3
{
  self->_identicalDedupingTimeInterval = a3;
}

- (double)identicalDedupingTimeIntervalForPeople
{
  return self->_identicalDedupingTimeIntervalForPeople;
}

- (void)setIdenticalDedupingTimeIntervalForPeople:(double)a3
{
  self->_identicalDedupingTimeIntervalForPeople = a3;
}

- (double)identicalDedupingMaximumTimeGroupExtension
{
  return self->_identicalDedupingMaximumTimeGroupExtension;
}

- (void)setIdenticalDedupingMaximumTimeGroupExtension:(double)a3
{
  self->_identicalDedupingMaximumTimeGroupExtension = a3;
}

- (unint64_t)maximumNumberOfItemsPerIdenticalCluster
{
  return self->_maximumNumberOfItemsPerIdenticalCluster;
}

- (void)setMaximumNumberOfItemsPerIdenticalCluster:(unint64_t)a3
{
  self->_maximumNumberOfItemsPerIdenticalCluster = a3;
}

- (double)identicalDedupingThreshold
{
  return self->_identicalDedupingThreshold;
}

- (void)setIdenticalDedupingThreshold:(double)a3
{
  self->_identicalDedupingThreshold = a3;
}

- (double)identicalDedupingThresholdForPeople
{
  return self->_identicalDedupingThresholdForPeople;
}

- (void)setIdenticalDedupingThresholdForPeople:(double)a3
{
  self->_identicalDedupingThresholdForPeople = a3;
}

- (double)identicalDedupingThresholdForBestItems
{
  return self->_identicalDedupingThresholdForBestItems;
}

- (void)setIdenticalDedupingThresholdForBestItems:(double)a3
{
  self->_identicalDedupingThresholdForBestItems = a3;
}

- (BOOL)useFaceprintsForIdenticalDeduping
{
  return self->_useFaceprintsForIdenticalDeduping;
}

- (void)setUseFaceprintsForIdenticalDeduping:(BOOL)a3
{
  self->_useFaceprintsForIdenticalDeduping = a3;
}

- (double)identicalDedupingFaceprintDistance
{
  return self->_identicalDedupingFaceprintDistance;
}

- (void)setIdenticalDedupingFaceprintDistance:(double)a3
{
  self->_identicalDedupingFaceprintDistance = a3;
}

- (BOOL)doSemanticalDeduping
{
  return self->_doSemanticalDeduping;
}

- (void)setDoSemanticalDeduping:(BOOL)a3
{
  self->_doSemanticalDeduping = a3;
}

- (double)semanticalDedupingTimeInterval
{
  return self->_semanticalDedupingTimeInterval;
}

- (void)setSemanticalDedupingTimeInterval:(double)a3
{
  self->_semanticalDedupingTimeInterval = a3;
}

- (double)semanticalDedupingTimeIntervalForPeople
{
  return self->_semanticalDedupingTimeIntervalForPeople;
}

- (void)setSemanticalDedupingTimeIntervalForPeople:(double)a3
{
  self->_semanticalDedupingTimeIntervalForPeople = a3;
}

- (double)semanticalDedupingTimeIntervalForPersons
{
  return self->_semanticalDedupingTimeIntervalForPersons;
}

- (void)setSemanticalDedupingTimeIntervalForPersons:(double)a3
{
  self->_semanticalDedupingTimeIntervalForPersons = a3;
}

- (double)semanticalDedupingMaximumTimeGroupExtension
{
  return self->_semanticalDedupingMaximumTimeGroupExtension;
}

- (void)setSemanticalDedupingMaximumTimeGroupExtension:(double)a3
{
  self->_semanticalDedupingMaximumTimeGroupExtension = a3;
}

- (unint64_t)maximumNumberOfItemsPerSemanticalCluster
{
  return self->_maximumNumberOfItemsPerSemanticalCluster;
}

- (void)setMaximumNumberOfItemsPerSemanticalCluster:(unint64_t)a3
{
  self->_maximumNumberOfItemsPerSemanticalCluster = a3;
}

- (double)semanticalDedupingThreshold
{
  return self->_semanticalDedupingThreshold;
}

- (void)setSemanticalDedupingThreshold:(double)a3
{
  self->_semanticalDedupingThreshold = a3;
}

- (double)semanticalDedupingThresholdForPeople
{
  return self->_semanticalDedupingThresholdForPeople;
}

- (void)setSemanticalDedupingThresholdForPeople:(double)a3
{
  self->_semanticalDedupingThresholdForPeople = a3;
}

- (double)semanticalDedupingThresholdForPersons
{
  return self->_semanticalDedupingThresholdForPersons;
}

- (void)setSemanticalDedupingThresholdForPersons:(double)a3
{
  self->_semanticalDedupingThresholdForPersons = a3;
}

- (BOOL)dontSemanticallyDedupePeople
{
  return self->_doNotSemanticallyDedupePeople;
}

- (void)setDontSemanticallyDedupePeople:(BOOL)a3
{
  self->_doNotSemanticallyDedupePeople = a3;
}

- (BOOL)dontSemanticallyDedupePersons
{
  return self->_doNotSemanticallyDedupePersons;
}

- (void)setDontSemanticallyDedupePersons:(BOOL)a3
{
  self->_doNotSemanticallyDedupePersons = a3;
}

- (BOOL)allowAdaptiveForSemanticalDeduping
{
  return self->_allowAdaptiveForSemanticalDeduping;
}

- (void)setAllowAdaptiveForSemanticalDeduping:(BOOL)a3
{
  self->_allowAdaptiveForSemanticalDeduping = a3;
}

- (BOOL)semanticalDedupingProtectSmallClusters
{
  return self->_semanticalDedupingProtectSmallClusters;
}

- (void)setSemanticalDedupingProtectSmallClusters:(BOOL)a3
{
  self->_semanticalDedupingProtectSmallClusters = a3;
}

- (BOOL)useOnlyScenesForDeduping
{
  return self->_useOnlyScenesForDeduping;
}

- (void)setUseOnlyScenesForDeduping:(BOOL)a3
{
  self->_useOnlyScenesForDeduping = a3;
}

- (BOOL)useAllPersonsForDeduping
{
  return self->_useAllPersonsForDeduping;
}

- (void)setUseAllPersonsForDeduping:(BOOL)a3
{
  self->_useAllPersonsForDeduping = a3;
}

- (BOOL)useFaceQualityForElection
{
  return self->_useFaceQualityForElection;
}

- (void)setUseFaceQualityForElection:(BOOL)a3
{
  self->_useFaceQualityForElection = a3;
}

- (BOOL)doNotDedupeVideos
{
  return self->_doNotDedupeVideos;
}

- (void)setDoNotDedupeVideos:(BOOL)a3
{
  self->_doNotDedupeVideos = a3;
}

- (BOOL)doNotDedupeInterestingPortraitsAndLivePictures
{
  return self->_doNotDedupeInterestingPortraitsAndLivePictures;
}

- (void)setDoNotDedupeInterestingPortraitsAndLivePictures:(BOOL)a3
{
  self->_doNotDedupeInterestingPortraitsAndLivePictures = a3;
}

- (BOOL)onlyDedupeContiguousItems
{
  return self->_onlyDedupeContiguousItems;
}

- (void)setOnlyDedupeContiguousItems:(BOOL)a3
{
  self->_onlyDedupeContiguousItems = a3;
}

- (BOOL)doDejunk
{
  return self->_doDejunk;
}

- (void)setDoDejunk:(BOOL)a3
{
  self->_doDejunk = a3;
}

- (BOOL)returnDedupedJunkIfOnlyJunk
{
  return self->_returnDedupedJunkIfOnlyJunk;
}

- (void)setReturnDedupedJunkIfOnlyJunk:(BOOL)a3
{
  self->_returnDedupedJunkIfOnlyJunk = a3;
}

- (BOOL)doFinalPass
{
  return self->_doFinalPass;
}

- (void)setDoFinalPass:(BOOL)a3
{
  self->_doFinalPass = a3;
}

- (double)finalPassTimeInterval
{
  return self->_finalPassTimeInterval;
}

- (void)setFinalPassTimeInterval:(double)a3
{
  self->_finalPassTimeInterval = a3;
}

- (double)finalPassMaximumTimeGroupExtension
{
  return self->_finalPassMaximumTimeGroupExtension;
}

- (void)setFinalPassMaximumTimeGroupExtension:(double)a3
{
  self->_finalPassMaximumTimeGroupExtension = a3;
}

- (double)finalPassDedupingThreshold
{
  return self->_finalPassDedupingThreshold;
}

- (void)setFinalPassDedupingThreshold:(double)a3
{
  self->_finalPassDedupingThreshold = a3;
}

- (NSSet)identifiersOfRequiredItems
{
  return self->_identifiersOfRequiredItems;
}

- (void)setIdentifiersOfRequiredItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSSet)identifiersOfEligibleItems
{
  return self->_identifiersOfEligibleItems;
}

- (void)setIdentifiersOfEligibleItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfEligibleItems, 0);
  objc_storeStrong((id *)&self->_identifiersOfRequiredItems, 0);
  objc_storeStrong((id *)&self->_baseFlavor, 0);
}

@end
