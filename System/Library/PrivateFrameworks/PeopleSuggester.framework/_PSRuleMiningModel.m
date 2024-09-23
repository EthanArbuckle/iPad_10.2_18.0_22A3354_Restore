@implementation _PSRuleMiningModel

- (_PSRuleMiningModel)initWithKnowledgeStore:(id)a3 contactresolver:(id)a4 withConfig:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PSRuleMiningModel *v12;
  void *v13;
  objc_class *v14;
  BMBehaviorRetriever *v15;
  BMBehaviorRetriever *behaviorRetriever;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_PSRuleMiningModel;
  v12 = -[_PSRuleMiningModel init](&v18, sel_init);
  if (v12)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v13 = (void *)getBMBehaviorRetrieverClass_softClass_1;
    v23 = getBMBehaviorRetrieverClass_softClass_1;
    if (!getBMBehaviorRetrieverClass_softClass_1)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getBMBehaviorRetrieverClass_block_invoke_1;
      v19[3] = &unk_1E43FEA00;
      v19[4] = &v20;
      __getBMBehaviorRetrieverClass_block_invoke_1((uint64_t)v19);
      v13 = (void *)v21[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v20, 8);
    v15 = (BMBehaviorRetriever *)objc_alloc_init(v14);
    behaviorRetriever = v12->_behaviorRetriever;
    v12->_behaviorRetriever = v15;

    -[_PSRuleMiningModel setRuleRankingModel:](v12, "setRuleRankingModel:", 0);
    -[_PSRuleMiningModel setPsConfigForAdaptableModel:](v12, "setPsConfigForAdaptableModel:", 0);
    -[_PSRuleMiningModel set_PSRuleMiningIsMLModelInUse:](v12, "set_PSRuleMiningIsMLModelInUse:", 0);
    -[_PSRuleMiningModel set_PSRuleMiningIsAdaptedMLModelOK:](v12, "set_PSRuleMiningIsAdaptedMLModelOK:", 0);
    -[_PSRuleMiningModel setBehaviorRulesConsideringInTheContext:](v12, "setBehaviorRulesConsideringInTheContext:", 0);
    -[_PSRuleMiningModel setScores:](v12, "setScores:", 0);
    objc_storeStrong((id *)&v12->_knowledgeStore, a3);
    objc_storeStrong((id *)&v12->_contactResolver, a4);
  }
  -[_PSRuleMiningModel updateModelProperties:](v12, "updateModelProperties:", v11);

  return v12;
}

- (void)updateModelProperties:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRuleMiningModel set_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions:](self, "set_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions:", objc_msgSend(v7, "integerValue"));

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelRegularizingContextOverlapConstraint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRuleMiningModel set_PSRuleMiningModelRegularizingContextOverlapConstraint:](self, "set_PSRuleMiningModelRegularizingContextOverlapConstraint:", objc_msgSend(v8, "integerValue"));

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelMinRuleConfidenceForSuggestion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  -[_PSRuleMiningModel set_PSRuleMiningModelMinRuleConfidenceForSuggestion:](self, "set_PSRuleMiningModelMinRuleConfidenceForSuggestion:");

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelMinSupportForSuggestion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  -[_PSRuleMiningModel set_PSRuleMiningModelMinSupportForSuggestion:](self, "set_PSRuleMiningModelMinSupportForSuggestion:");

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningIsMLModelInUse"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRuleMiningModel set_PSRuleMiningIsMLModelInUse:](self, "set_PSRuleMiningIsMLModelInUse:", objc_msgSend(v11, "BOOLValue"));

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningIsAdaptedMLModelOK"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRuleMiningModel set_PSRuleMiningIsAdaptedMLModelOK:](self, "set_PSRuleMiningIsAdaptedMLModelOK:", objc_msgSend(v12, "BOOLValue"));

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningMLModelScoreThreshold"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &unk_1E442D038;
  objc_msgSend(v13, "doubleValue");
  -[_PSRuleMiningModel set_PSRuleMiningMLModelScoreThreshold:](self, "set_PSRuleMiningMLModelScoreThreshold:");

}

- (void)loadMLModel
{
  void *v3;
  _PSRuleRankingMLModel *v4;
  _BOOL8 v5;
  _PSRuleRankingMLModel *v6;
  id v7;

  -[_PSRuleMiningModel ruleRankingModel](self, "ruleRankingModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!-[_PSRuleMiningModel _PSRuleMiningIsMLModelInUse](self, "_PSRuleMiningIsMLModelInUse"))
      return;
    v4 = [_PSRuleRankingMLModel alloc];
    -[_PSRuleMiningModel psConfigForAdaptableModel](self, "psConfigForAdaptableModel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[_PSRuleMiningModel _PSRuleMiningIsAdaptedMLModelOK](self, "_PSRuleMiningIsAdaptedMLModelOK");
    -[_PSRuleMiningModel _PSRuleMiningMLModelScoreThreshold](self, "_PSRuleMiningMLModelScoreThreshold");
    v6 = -[_PSRuleRankingMLModel initWithAdaptableModelConfig:isAdaptedMLModelOK:scoreThreshold:](v4, "initWithAdaptableModelConfig:isAdaptedMLModelOK:scoreThreshold:", v7, v5);
    -[_PSRuleMiningModel setRuleRankingModel:](self, "setRuleRankingModel:", v6);

    v3 = v7;
  }

}

- (BOOL)isAdaptedModelCreated
{
  void *v3;
  void *v4;
  char v5;

  -[_PSRuleMiningModel ruleRankingModel](self, "ruleRankingModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[_PSRuleMiningModel ruleRankingModel](self, "ruleRankingModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAdaptedModelCreated");

  return v5;
}

- (BOOL)isAdaptedModelUsed
{
  void *v3;
  void *v4;
  char v5;

  -[_PSRuleMiningModel ruleRankingModel](self, "ruleRankingModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[_PSRuleMiningModel ruleRankingModel](self, "ruleRankingModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAdaptedModelUsed");

  return v5;
}

- (id)extractAdaptedModelRecipeID
{
  void *v3;
  void *v4;
  void *v5;

  -[_PSRuleMiningModel ruleRankingModel](self, "ruleRankingModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_PSRuleMiningModel ruleRankingModel](self, "ruleRankingModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extractAdaptedModelRecipeID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)suggestionProxiesWithPredictionContext:(id)a3 photoSuggestedPeople:(id)a4 supportedBundleIDs:(id)a5
{
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  id BMItemClass_0;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t);
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t m;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  BOOL v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t n;
  void *v111;
  void *v112;
  int v113;
  uint64_t v114;
  void *v115;
  void *v116;
  int v117;
  uint64_t v118;
  _PSSuggestionProxy *v119;
  void *v120;
  objc_class *v121;
  void *v122;
  _PSSuggestionProxy *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t ii;
  void *v128;
  NSObject *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  _PSRuleMiningModel *v145;
  id v146;
  id v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  id v153;
  id obj;
  void *v155;
  id v156;
  void *v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD v170[4];
  id v171;
  _PSRuleMiningModel *v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  void *v192;
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  uint8_t v199[128];
  _BYTE buf[24];
  void *v201;
  uint64_t *v202;
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  v144 = a3;
  v139 = a4;
  v147 = a5;
  v145 = self;
  -[_PSRuleMiningModel loadMLModel](self, "loadMLModel");
  +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = -[_PSRuleMiningModel _PSRuleMiningIsMLModelInUse](self, "_PSRuleMiningIsMLModelInUse");
    v10 = "false";
    if (v9)
      v10 = "true";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_INFO, "CoreBehavior - _PSRuleMiningIsMLModelInUse: %s", buf, 0xCu);
  }

  if (-[_PSRuleMiningModel _PSRuleMiningIsMLModelInUse](self, "_PSRuleMiningIsMLModelInUse"))
  {
    -[_PSRuleMiningModel ruleRankingModel](self, "ruleRankingModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      -[_PSRuleMiningModel ruleRankingModel](self, "ruleRankingModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "giveModelDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("mlModelVersion"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester ML model version: %@", buf, 0xCu);
      }

      +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (void *)MEMORY[0x1E0CB37E8];
        -[_PSRuleMiningModel ruleRankingModel](v145, "ruleRankingModel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "scoreThreshold");
        objc_msgSend(v20, "numberWithDouble:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester ML model threshold: %@", buf, 0xCu);

      }
    }
  }
  v156 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  objc_msgSend(v144, "attachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v185, v199, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v186;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v186 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * i);
        objc_msgSend(v27, "contentURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "host");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29 && objc_msgSend(v29, "length"))
        {
          BMItemClass_0 = getBMItemClass_0();
          objc_msgSend(getBMItemTypeClass_1(), "interactionContentURL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(BMItemClass_0, "itemWithType:stringValue:", v31, v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
            objc_msgSend(v156, "addObject:", v32);

        }
        objc_msgSend(v27, "UTI");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v33 && objc_msgSend(v33, "length"))
        {
          v35 = getBMItemClass_0();
          objc_msgSend(getBMItemTypeClass_1(), "interactionUTIType");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "itemWithType:stringValue:", v36, v34);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
            objc_msgSend(v156, "addObject:", v37);

        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v185, v199, 16);
    }
    while (v24);
  }

  +[_PSPhotoUtils candidateLocalIdentifiersFromPhotoSuggestedPeople:](_PSPhotoUtils, "candidateLocalIdentifiersFromPhotoSuggestedPeople:", v139);
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v198, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v182;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v182 != v39)
          objc_enumerationMutation(obj);
        v41 = *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * j);
        v42 = getBMItemClass_0();
        objc_msgSend(getBMItemTypeClass_1(), "interactionPhotoContact");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "itemWithType:stringValue:", v43, v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
          objc_msgSend(v156, "addObject:", v44);

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v198, 16);
    }
    while (v38);
  }

  objc_msgSend(v144, "peopleInPhotoIdentifiers");
  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  v153 = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v177, v197, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v178;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v178 != v46)
          objc_enumerationMutation(v153);
        v48 = *(_QWORD *)(*((_QWORD *)&v177 + 1) + 8 * k);
        v49 = getBMItemClass_0();
        objc_msgSend(getBMItemTypeClass_1(), "interactionPhotoContact");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "itemWithType:stringValue:", v50, v48);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
          objc_msgSend(v156, "addObject:", v51);

      }
      v45 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v177, v197, 16);
    }
    while (v45);
  }

  objc_msgSend(v144, "bundleID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52 == 0;

  if (!v53)
  {
    v54 = getBMItemClass_0();
    objc_msgSend(getBMItemTypeClass_1(), "interactionSharingSourceBundleID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "bundleID");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "itemWithType:stringValue:", v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
      objc_msgSend(v156, "addObject:", v57);

  }
  objc_msgSend(v144, "suggestionDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58 == 0;

  if (v59)
  {
    v142 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "suggestionDate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "components:fromDate:", 32, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = getBMItemClass_0();
    objc_msgSend(getBMItemTypeClass_1(), "hourOfDaySlot");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)MEMORY[0x1E0CB37E8];
    v66 = objc_msgSend(v62, "hour");
    v189 = 0;
    v190 = &v189;
    v191 = 0x2020000000;
    v67 = (uint64_t (*)(uint64_t))getBMHourSlotForHourOfDaySymbolLoc_ptr_0;
    v192 = getBMHourSlotForHourOfDaySymbolLoc_ptr_0;
    if (!getBMHourSlotForHourOfDaySymbolLoc_ptr_0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getBMHourSlotForHourOfDaySymbolLoc_block_invoke_0;
      v201 = &unk_1E43FEA00;
      v202 = &v189;
      __getBMHourSlotForHourOfDaySymbolLoc_block_invoke_0((uint64_t)buf);
      v67 = (uint64_t (*)(uint64_t))v190[3];
    }
    _Block_object_dispose(&v189, 8);
    if (!v67)
    {
      -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
      __break(1u);
    }
    objc_msgSend(v65, "numberWithInteger:", v67(v66));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "itemWithType:numberValue:", v64, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v156, "addObject:", v69);
    objc_msgSend(v141, "addObject:", v69);
    v70 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v144, "suggestionDate");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "numberWithBool:", objc_msgSend(v60, "isDateInWeekend:", v71));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = getBMItemClass_0();
    objc_msgSend(getBMItemTypeClass_1(), "isWeekend");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "itemWithType:numberValue:", v74, v72);
    v142 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  objc_msgSend(v144, "locationUUIDs");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v173, v196, 16);
  if (v76)
  {
    v77 = *(_QWORD *)v174;
    do
    {
      for (m = 0; m != v76; ++m)
      {
        if (*(_QWORD *)v174 != v77)
          objc_enumerationMutation(v75);
        v79 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * m);
        v80 = getBMItemClass_0();
        objc_msgSend(getBMItemTypeClass_1(), "locationIdentifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "UUIDString");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "itemWithType:stringValue:", v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
          objc_msgSend(v155, "addObject:", v83);

      }
      v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v173, v196, 16);
    }
    while (v76);
  }

  objc_msgSend(v156, "unionSet:", v155);
  objc_msgSend(getBMRetrievalFilterClass_1(), "filterWithOperand:inclusionOperator:items:", 1, 0, v156);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_1(), "interactionRecipients");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_1(), "interactionTargetBundleID");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v157, v84, 0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMRetrievalFilterClass_1(), "filterWithOperand:inclusionOperator:types:", 2, 2, v137);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v138, v136, 0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRuleMiningModel behaviorRetriever](v145, "behaviorRetriever");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRuleMiningModel _PSRuleMiningModelMinSupportForSuggestion](v145, "_PSRuleMiningModelMinSupportForSuggestion");
  v87 = v86;
  -[_PSRuleMiningModel _PSRuleMiningModelMinRuleConfidenceForSuggestion](v145, "_PSRuleMiningModelMinRuleConfidenceForSuggestion");
  objc_msgSend(v85, "retrieveRulesWithSupport:confidence:filters:", v135, v87, v88);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(getBMItemTypeClass_1(), "hourOfDaySlot");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_1(), "isWeekend");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_1(), "locationIdentifier");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setWithObjects:", v90, v91, v92, 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRuleMiningModel filterByRegularizingRules:invalidatedByAnyConflictingItems:containingItemTypes:](v145, "filterByRegularizingRules:invalidatedByAnyConflictingItems:containingItemTypes:", v134, v155, v93);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  if (v142)
    objc_msgSend(v156, "addObject:", v142);
  if (!-[_PSRuleMiningModel _PSRuleMiningIsMLModelInUse](v145, "_PSRuleMiningIsMLModelInUse")
    || (-[_PSRuleMiningModel ruleRankingModel](v145, "ruleRankingModel"),
        v94 = (void *)objc_claimAutoreleasedReturnValue(),
        v95 = v94 == 0,
        v94,
        v95))
  {
    -[_PSRuleMiningModel filterByRegularizingRulesByContextOverlap:regulularizeItems:queryItems:regularizationConstraint:](v145, "filterByRegularizingRulesByContextOverlap:regulularizeItems:queryItems:regularizationConstraint:", v140, v141, v156, -[_PSRuleMiningModel _PSRuleMiningModelRegularizingContextOverlapConstraint](v145, "_PSRuleMiningModelRegularizingContextOverlapConstraint"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v170[0] = MEMORY[0x1E0C809B0];
    v170[1] = 3221225472;
    v170[2] = __101___PSRuleMiningModel_suggestionProxiesWithPredictionContext_photoSuggestedPeople_supportedBundleIDs___block_invoke;
    v170[3] = &unk_1E4401C88;
    v171 = v156;
    v172 = v145;
    objc_msgSend(v98, "sortedArrayUsingComparator:", v170);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v171;
  }
  else
  {
    -[_PSRuleMiningModel setBehaviorRulesConsideringInTheContext:](v145, "setBehaviorRulesConsideringInTheContext:", v140);
    -[_PSRuleMiningModel ruleRankingModel](v145, "ruleRankingModel");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "rankRules:contextItems:", v140, v156);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PSRuleMiningModel ruleRankingModel](v145, "ruleRankingModel");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "scores");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSRuleMiningModel setScores:](v145, "setScores:", v99);
  }

  +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
  v100 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v97, "count"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v101;
    _os_log_impl(&dword_1A07F4000, v100, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester Number of Rules: %@", buf, 0xCu);

  }
  -[_PSRuleMiningModel setBehaviorRulesConsideringInTheContext:](v145, "setBehaviorRulesConsideringInTheContext:", v97);
  v146 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v143 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v148 = v97;
  v150 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v166, v195, 16);
  if (v150)
  {
    v149 = *(_QWORD *)v167;
    do
    {
      v102 = 0;
      do
      {
        if (*(_QWORD *)v167 != v149)
        {
          v103 = v102;
          objc_enumerationMutation(v148);
          v102 = v103;
        }
        v104 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v102);
        v162 = 0u;
        v163 = 0u;
        v164 = 0u;
        v165 = 0u;
        v151 = v104;
        v152 = v102;
        objc_msgSend(v104, "consequent");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v162, v194, 16);
        if (!v106)
        {
          v108 = 0;
          v107 = 0;
          goto LABEL_99;
        }
        v107 = 0;
        v108 = 0;
        v109 = *(_QWORD *)v163;
        do
        {
          for (n = 0; n != v106; ++n)
          {
            if (*(_QWORD *)v163 != v109)
              objc_enumerationMutation(v105);
            v111 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * n);
            objc_msgSend(v111, "type");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend(v112, "isEqual:", v84);

            if (v113)
            {
              objc_msgSend(v111, "value");
              v114 = objc_claimAutoreleasedReturnValue();
              v115 = v107;
              v107 = (void *)v114;
            }
            else
            {
              objc_msgSend(v111, "type");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = objc_msgSend(v116, "isEqual:", v157);

              if (!v117)
                continue;
              objc_msgSend(v111, "value");
              v118 = objc_claimAutoreleasedReturnValue();
              v115 = v108;
              v108 = (void *)v118;
            }

          }
          v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v162, v194, 16);
        }
        while (v106);

        if (v107 && v108 && objc_msgSend(v147, "containsObject:", v107))
        {
          _PSSuggestionKey(v107, v108);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v146, "containsObject:", v105) & 1) == 0)
          {
            objc_msgSend(v146, "addObject:", v105);
            v119 = [_PSSuggestionProxy alloc];
            objc_msgSend(v151, "description");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = (objc_class *)objc_opt_class();
            NSStringFromClass(v121);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            v123 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v119, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v107, v108, 0, v120, v122);

            if (v123)
              objc_msgSend(v143, "addObject:", v123);

          }
LABEL_99:

        }
        v102 = v152 + 1;
      }
      while (v152 + 1 != v150);
      v150 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v166, v195, 16);
    }
    while (v150);
  }

  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v124 = v143;
  v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v158, v193, 16);
  if (v125)
  {
    v126 = *(_QWORD *)v159;
    do
    {
      for (ii = 0; ii != v125; ++ii)
      {
        if (*(_QWORD *)v159 != v126)
          objc_enumerationMutation(v124);
        v128 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * ii);
        +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
        v129 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v128, "interactionRecipients");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "bundleID");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "reason");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v130;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v131;
          *(_WORD *)&buf[22] = 2112;
          v201 = v132;
          _os_log_impl(&dword_1A07F4000, v129, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester Suggestion proxy: %@ %@ %@", buf, 0x20u);

        }
      }
      v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v158, v193, 16);
    }
    while (v125);
  }

  return v124;
}

- (id)shareExtensionSuggestionsFromContext:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id BMItemClass_0;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id BMRetrievalFilterClass_1;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  _PSSuggestion *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  _PSSuggestion *v50;
  BOOL v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
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
  id obj;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _QWORD v89[2];
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[3];

  v96[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_PSAppUsageUtilities sharesFromSourceToTargetBundleValues](_PSAppUsageUtilities, "sharesFromSourceToTargetBundleValues");
  v4 = objc_claimAutoreleasedReturnValue();
  +[_PSAppUsageUtilities appUsageDurations](_PSAppUsageUtilities, "appUsageDurations");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appBundleIdsToShareExtensionBundleIdsMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)v5;
  v68 = (void *)v4;
  +[_PSAppUsageUtilities mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping:sourceBundleId:sharesFromSourceToTargetBundle:appUsageDurations:](_PSAppUsageUtilities, "mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping:sourceBundleId:sharesFromSourceToTargetBundle:appUsageDurations:", v6, v7, v4, v5);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    BMItemClass_0 = getBMItemClass_0();
    objc_msgSend(getBMItemTypeClass_1(), "bundleIdOfHostOpenedShareExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(BMItemClass_0, "itemWithType:stringValue:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v9, "addObject:", v14);

  }
  v66 = (void *)v8;
  v69 = v3;
  v65 = v9;
  objc_msgSend(getBMRetrievalFilterClass_1(), "filterWithOperand:inclusionOperator:items:", 1, 1, v9);
  v15 = objc_claimAutoreleasedReturnValue();
  BMRetrievalFilterClass_1 = getBMRetrievalFilterClass_1();
  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(getBMItemTypeClass_1(), "bundleIdOfShareExtensionOpened");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(BMRetrievalFilterClass_1, "filterWithOperand:inclusionOperator:types:", 2, 1, v20);
  v21 = objc_claimAutoreleasedReturnValue();

  -[_PSRuleMiningModel behaviorRetriever](self, "behaviorRetriever");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0C99E60];
  v63 = (void *)v21;
  v64 = (void *)v15;
  v95[0] = v15;
  v95[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "retrieveRulesWithFilters:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_confidence);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sortDescriptorWithKey:ascending:", v28, 0);
  v29 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_support);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sortDescriptorWithKey:ascending:", v31, 0);
  v32 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v32;
  v61 = (void *)v29;
  v94[0] = v29;
  v94[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v26;
  objc_msgSend(v26, "sortedArrayUsingDescriptors:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v93 = v36;
    _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_INFO, "CoreBehavior - Extension Suggester Number of Rules: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v34;
  v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
  if (v72)
  {
    v71 = *(_QWORD *)v85;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v85 != v71)
          objc_enumerationMutation(obj);
        v73 = v38;
        v39 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v38);
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        objc_msgSend(v39, "consequent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v81;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v81 != v43)
                objc_enumerationMutation(v40);
              objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "value");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v37, "containsObject:", v45) & 1) == 0)
              {
                v46 = [_PSSuggestion alloc];
                objc_msgSend(v39, "description");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = (objc_class *)objc_opt_class();
                NSStringFromClass(v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](v46, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", v45, 0, 0, 0, v47, v49);

                if (v45)
                  v51 = v50 == 0;
                else
                  v51 = 1;
                if (!v51)
                {
                  objc_msgSend(v37, "addObject:", v45);
                  objc_msgSend(v74, "addObject:", v50);
                }

              }
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
          }
          while (v42);
        }

        v38 = v73 + 1;
      }
      while (v73 + 1 != v72);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    }
    while (v72);
  }

  v89[0] = v74;
  v89[1] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v52 = (id)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v77;
    v56 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v57 = 0;
      v58 = v56;
      do
      {
        if (*(_QWORD *)v77 != v55)
          objc_enumerationMutation(v52);
        -[_PSRuleMiningModel suggestionArrayWithArray:appendingUniqueElementsByBundleIdFromArray:](self, "suggestionArrayWithArray:appendingUniqueElementsByBundleIdFromArray:", v58, *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v57));
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        ++v57;
        v58 = v56;
      }
      while (v54 != v57);
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    }
    while (v54);
  }
  else
  {
    v56 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v56;
}

- (id)filterByRegularizingRulesByContextOverlap:(id)a3 regulularizeItems:(id)a4 queryItems:(id)a5 regularizationConstraint:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "count") && objc_msgSend(v10, "count") < a6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v12, "mutableCopy");

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v28 = v9;
    obj = v9;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      v29 = *(_QWORD *)v35;
      do
      {
        v16 = 0;
        v31 = v14;
        do
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v16);
          objc_msgSend(v17, "antecedent", v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          objc_msgSend(v19, "intersectSet:", v11);
          v20 = (void *)objc_msgSend(v19, "mutableCopy");
          if (objc_msgSend(v20, "count") >= a6)
          {
            objc_msgSend(v19, "intersectSet:", v10);
            if (objc_msgSend(v19, "count"))
            {
              v21 = a6;
              v22 = v11;
              v23 = v10;
              objc_msgSend(v20, "valueForKey:", CFSTR("type"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)objc_msgSend(v24, "mutableCopy");

              objc_msgSend(v25, "unionSet:", v30);
              v26 = objc_msgSend(v25, "count");
              if (v26 != objc_msgSend(v30, "count"))
                objc_msgSend(v32, "addObject:", v17);

              v10 = v23;
              v11 = v22;
              a6 = v21;
              v15 = v29;
              v14 = v31;
            }
            else
            {
              objc_msgSend(v32, "addObject:", v17);
            }
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v14);
    }

    v9 = v28;
  }
  else
  {
    v32 = v9;
  }

  return v32;
}

- (id)filterByRegularizingRules:(id)a3 invalidatedByAnyConflictingItems:(id)a4 containingItemTypes:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a4;
  v8 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v14, "antecedent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "valueForKey:", CFSTR("type"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v16, "mutableCopy");

          v18 = objc_msgSend(v17, "count");
          if (v18 == objc_msgSend(v8, "count"))
          {
            objc_msgSend(v14, "antecedent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(v19, "mutableCopy");

            objc_msgSend(v17, "unionSet:", v8);
            v21 = objc_msgSend(v17, "count");
            if (v21 == objc_msgSend(v8, "count"))
            {
              objc_msgSend(v20, "intersectSet:", v24);
              if (objc_msgSend(v24, "count"))
              {
                if (objc_msgSend(v20, "count"))
                  objc_msgSend(v25, "addObject:", v14);
              }
            }

          }
          else
          {
            objc_msgSend(v25, "addObject:", v14);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    v7 = v23;
  }
  else
  {
    v25 = v7;
  }

  return v25;
}

- (id)suggestionArrayWithArray:(id)a3 appendingUniqueElementsByBundleIdFromArray:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "arrayByAddingObjectsFromArray:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "bundleID", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "containsObject:", v13);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v5, "addObject:", v12);
          objc_msgSend(v12, "bundleID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v5;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_PSContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (NSArray)behaviorRulesConsideringInTheContext
{
  return self->_behaviorRulesConsideringInTheContext;
}

- (void)setBehaviorRulesConsideringInTheContext:(id)a3
{
  objc_storeStrong((id *)&self->_behaviorRulesConsideringInTheContext, a3);
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_storeStrong((id *)&self->_scores, a3);
}

- (BMBehaviorRetriever)behaviorRetriever
{
  return self->_behaviorRetriever;
}

- (int64_t)_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions
{
  return self->__PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions;
}

- (void)set_PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions:(int64_t)a3
{
  self->__PSRuleMiningModelDaysToPromoteRecentlyInstalledAppExtensions = a3;
}

- (int64_t)_PSRuleMiningModelRegularizingContextOverlapConstraint
{
  return self->__PSRuleMiningModelRegularizingContextOverlapConstraint;
}

- (void)set_PSRuleMiningModelRegularizingContextOverlapConstraint:(int64_t)a3
{
  self->__PSRuleMiningModelRegularizingContextOverlapConstraint = a3;
}

- (double)_PSRuleMiningModelMinRuleConfidenceForSuggestion
{
  return self->__PSRuleMiningModelMinRuleConfidenceForSuggestion;
}

- (void)set_PSRuleMiningModelMinRuleConfidenceForSuggestion:(double)a3
{
  self->__PSRuleMiningModelMinRuleConfidenceForSuggestion = a3;
}

- (double)_PSRuleMiningModelMinSupportForSuggestion
{
  return self->__PSRuleMiningModelMinSupportForSuggestion;
}

- (void)set_PSRuleMiningModelMinSupportForSuggestion:(double)a3
{
  self->__PSRuleMiningModelMinSupportForSuggestion = a3;
}

- (double)_PSRuleMiningMLModelScoreThreshold
{
  return self->__PSRuleMiningMLModelScoreThreshold;
}

- (void)set_PSRuleMiningMLModelScoreThreshold:(double)a3
{
  self->__PSRuleMiningMLModelScoreThreshold = a3;
}

- (BOOL)_PSRuleMiningIsMLModelInUse
{
  return self->__PSRuleMiningIsMLModelInUse;
}

- (void)set_PSRuleMiningIsMLModelInUse:(BOOL)a3
{
  self->__PSRuleMiningIsMLModelInUse = a3;
}

- (BOOL)_PSRuleMiningIsAdaptedMLModelOK
{
  return self->__PSRuleMiningIsAdaptedMLModelOK;
}

- (void)set_PSRuleMiningIsAdaptedMLModelOK:(BOOL)a3
{
  self->__PSRuleMiningIsAdaptedMLModelOK = a3;
}

- (NSDictionary)psConfigForAdaptableModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPsConfigForAdaptableModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (_PSRuleRankingMLModel)ruleRankingModel
{
  return (_PSRuleRankingMLModel *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRuleRankingModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleRankingModel, 0);
  objc_storeStrong((id *)&self->_psConfigForAdaptableModel, 0);
  objc_storeStrong((id *)&self->_behaviorRetriever, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_behaviorRulesConsideringInTheContext, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end
