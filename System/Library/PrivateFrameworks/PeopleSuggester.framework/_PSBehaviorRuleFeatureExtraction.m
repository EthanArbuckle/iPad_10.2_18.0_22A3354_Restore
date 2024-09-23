@implementation _PSBehaviorRuleFeatureExtraction

- (_PSBehaviorRuleFeatureExtraction)initWithMetadata:(id)a3
{
  id v5;
  _PSBehaviorRuleFeatureExtraction *v6;
  void *v7;
  objc_class *v8;
  BMBehaviorRetriever *v9;
  BMBehaviorRetriever *behaviorRetriever;
  void *v11;
  void *v12;
  uint64_t v13;
  _CDInteractionStore *interactionStore;
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_PSBehaviorRuleFeatureExtraction;
  v6 = -[_PSBehaviorRuleFeatureExtraction init](&v16, sel_init);
  if (v6)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v7 = (void *)getBMBehaviorRetrieverClass_softClass_2;
    v21 = getBMBehaviorRetrieverClass_softClass_2;
    if (!getBMBehaviorRetrieverClass_softClass_2)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __getBMBehaviorRetrieverClass_block_invoke_2;
      v17[3] = &unk_1E43FEA00;
      v17[4] = &v18;
      __getBMBehaviorRetrieverClass_block_invoke_2((uint64_t)v17);
      v7 = (void *)v19[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v18, 8);
    v9 = (BMBehaviorRetriever *)objc_alloc_init(v8);
    behaviorRetriever = v6->_behaviorRetriever;
    v6->_behaviorRetriever = v9;

    v11 = (void *)MEMORY[0x1E0D158E0];
    objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "storeWithDirectory:readOnly:", v12, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    interactionStore = v6->_interactionStore;
    v6->_interactionStore = (_CDInteractionStore *)v13;

    *(_WORD *)&v6->_constantFeaturesReady = 0;
    objc_storeStrong((id *)&v6->_metadata, a3);
  }

  return v6;
}

- (int)bucketedValue:(int)a3
{
  int result;

  result = a3;
  if (a3 >= 11)
  {
    if (a3 > 0x64)
    {
      if (a3 > 0x3E7)
        return 1000;
      else
        return a3 - (unsigned __int16)a3 % 0x64u;
    }
    else
    {
      return a3 - a3 % 0xAu;
    }
  }
  return result;
}

- (void)extractContextMatchFeatures:(id)a3 features:(id)a4
{
  id v6;
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
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;

  v41 = a3;
  v6 = a4;
  objc_msgSend(v41, "valueForKey:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("utiTypeInContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionUTIType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithBool:", objc_msgSend(v8, "containsObject:", v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("utiTypeInContext"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("contentUrlInContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionContentURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithBool:", objc_msgSend(v8, "containsObject:", v15));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("contentUrlInContext"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("sourceBundleIdInContext"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionSharingSourceBundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithBool:", objc_msgSend(v8, "containsObject:", v19));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("sourceBundleIdInContext"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("targetBundleIdInContext"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionTargetBundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithBool:", objc_msgSend(v8, "containsObject:", v23));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("targetBundleIdInContext"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("LOIInContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "locationIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithBool:", objc_msgSend(v8, "containsObject:", v27));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("LOIInContext"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoContactInContext"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(getBMItemTypeClass_2(), "interactionPhotoContact");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v8, "containsObject:", v30);

    if (v31)
    {
      objc_msgSend(v41, "objectsPassingTest:", &__block_literal_global_48);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("photoContactInContext"));

    }
    else
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E442B7E0, CFSTR("photoContactInContext"));
    }
  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoSceneInContext"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(getBMItemTypeClass_2(), "interactionPhotoScene");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v8, "containsObject:", v36);

    if (v37)
    {
      objc_msgSend(v41, "objectsPassingTest:", &__block_literal_global_101);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("photoSceneInContext"));

    }
    else
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E442B7E0, CFSTR("photoSceneInContext"));
    }
  }
  -[_PSBehaviorRuleFeatureExtraction setContextFeaturesReady:](self, "setContextFeaturesReady:", 1);

}

- (void)extractConstantFeaturesForMLModelIntoFeatures:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  double v54;
  double v55;
  int v56;
  unsigned int v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
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
  id v110;
  id obj;
  uint64_t v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  unsigned int v118;
  void *v119;
  unsigned int v120;
  void *v121;
  unsigned int v122;
  void *v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  id v133;
  id v134;
  id v135;
  uint8_t buf[16];
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v110 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_INFO, "Extracting constant features for the rule ranking ML model", buf, 2u);
  }

  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442B7F8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("direction IN %@"), v5);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442B810, &unk_1E442B828, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("direction IN %@"), v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442B810, &unk_1E442B828, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("direction IN %@ && mechanism == %@"), v10, &unk_1E442B840);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSBehaviorRuleFeatureExtraction interactionStore](self, "interactionStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = 0;
  v105 = (void *)v8;
  v12 = objc_msgSend(v11, "countInteractionsUsingPredicate:error:", v8, &v135);
  v13 = v135;

  if (v13)
  {
    +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_PSBehaviorRuleFeatureExtraction extractConstantFeaturesForMLModelIntoFeatures:].cold.3((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

  }
  -[_PSBehaviorRuleFeatureExtraction interactionStore](self, "interactionStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = 0;
  v22 = objc_msgSend(v21, "countInteractionsUsingPredicate:error:", v108, &v134);
  v23 = v134;

  if (v23)
  {
    +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_PSBehaviorRuleFeatureExtraction extractConstantFeaturesForMLModelIntoFeatures:].cold.2((uint64_t)v23, v24, v25, v26, v27, v28, v29, v30);

  }
  -[_PSBehaviorRuleFeatureExtraction interactionStore](self, "interactionStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0;
  v32 = objc_msgSend(v31, "countInteractionsUsingPredicate:error:", v107, &v133);
  v33 = v133;

  v106 = v33;
  if (v33)
  {
    +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[_PSBehaviorRuleFeatureExtraction extractConstantFeaturesForMLModelIntoFeatures:].cold.1((uint64_t)v33, v34, v35, v36, v37, v38, v39, v40);

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("totalMessagesSent"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v12));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v42, CFSTR("totalMessagesSent"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("totalMessagesRecieved"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v22));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v44, CFSTR("totalMessagesRecieved"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("totalShares"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v32));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v46, CFSTR("totalShares"));

  }
  -[_PSBehaviorRuleFeatureExtraction behaviorRetriever](self, "behaviorRetriever");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "retrieveRulesWithFilters:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = v48;
  v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
  v50 = 0;
  v51 = 0;
  if (v115)
  {
    v122 = 0;
    v120 = 0;
    v118 = 0;
    v114 = 0;
    v113 = 0;
    v112 = *(_QWORD *)v130;
    v117 = v49;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v130 != v112)
          objc_enumerationMutation(obj);
        v53 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v52);
        objc_msgSend(v53, "confidence");
        v116 = v52;
        if (v54 <= 0.75)
        {
          objc_msgSend(v53, "confidence");
          if (v55 <= 0.25)
            v56 = v114;
          else
            v56 = v114 + 1;
          if (v55 > 0.25)
            v57 = v113;
          else
            v57 = v113 + 1;
          v113 = v57;
          LODWORD(v114) = v56;
        }
        else
        {
          ++HIDWORD(v114);
        }
        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        objc_msgSend(v53, "antecedent");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
        if (v59)
        {
          v60 = v59;
          v61 = *(_QWORD *)v126;
          do
          {
            for (i = 0; i != v60; ++i)
            {
              if (*(_QWORD *)v126 != v61)
                objc_enumerationMutation(v58);
              v63 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
              objc_msgSend(v63, "type");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(getBMItemTypeClass_2(), "interactionPhotoContact");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v64, "isEqual:", v65);

              if (v66)
              {
                objc_msgSend(v124, "addObject:", v63);
                v50 = (v50 + 1);
              }
              else
              {
                objc_msgSend(v63, "type");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(getBMItemTypeClass_2(), "interactionPhotoScene");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = objc_msgSend(v67, "isEqual:", v68);

                if (v69)
                {
                  objc_msgSend(v123, "addObject:", v63);
                  v51 = (v51 + 1);
                }
                else
                {
                  objc_msgSend(v63, "type");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(getBMItemTypeClass_2(), "interactionSharingSourceBundleID");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v72 = objc_msgSend(v70, "isEqual:", v71);

                  if (v72)
                  {
                    objc_msgSend(v121, "addObject:", v63);
                    ++v122;
                  }
                  else
                  {
                    objc_msgSend(v63, "type");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(getBMItemTypeClass_2(), "interactionTargetBundleID");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    v75 = objc_msgSend(v73, "isEqual:", v74);

                    if (v75)
                    {
                      objc_msgSend(v119, "addObject:", v63);
                      ++v120;
                    }
                    else
                    {
                      objc_msgSend(v63, "type");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(getBMItemTypeClass_2(), "locationIdentifier");
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      v78 = objc_msgSend(v76, "isEqual:", v77);

                      if (v78)
                      {
                        objc_msgSend(v117, "addObject:", v63);
                        ++v118;
                      }
                    }
                  }
                }
              }
            }
            v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
          }
          while (v60);
        }

        v52 = v116 + 1;
        v49 = v117;
      }
      while (v116 + 1 != v115);
      v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
    }
    while (v115);
  }
  else
  {
    v122 = 0;
    v120 = 0;
    v118 = 0;
    v114 = 0;
    v113 = 0;
  }

  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("lowConfidenceRuleCount"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v113));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v80, CFSTR("lowConfidenceRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("mediumConfidenceRuleCount"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v114));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v82, CFSTR("mediumConfidenceRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("highConfidenceRuleCount"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", HIDWORD(v114)));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v84, CFSTR("highConfidenceRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoContactContainingRuleCount"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v50));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v86, CFSTR("photoContactContainingRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoSceneContainingRuleCount"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v51));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v88, CFSTR("photoSceneContainingRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("sourceBundleIdContainingRuleCount"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v122));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v90, CFSTR("sourceBundleIdContainingRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("targetBundleIdContainingRuleCount"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v120));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v92, CFSTR("targetBundleIdContainingRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("locationOfInterestContainingRuleCount"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v118));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v94, CFSTR("locationOfInterestContainingRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoContactRulesCardinality"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (v95)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v124, "count")));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v96, CFSTR("photoContactRulesCardinality"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoSceneRulesCardinality"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v123, "count")));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v98, CFSTR("photoSceneRulesCardinality"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("sourceBundleIdRulesCardinality"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v121, "count")));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v100, CFSTR("sourceBundleIdRulesCardinality"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("targetBundleIdRulesCardinality"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (v101)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v119, "count")));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v102, CFSTR("targetBundleIdRulesCardinality"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("locationOfInterestRulesCardinality"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (v103)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v49, "count")));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v104, CFSTR("locationOfInterestRulesCardinality"));

  }
  self->_constantFeaturesReady = 1;

}

- (void)transferFeaturesFrom:(id)a3 toFeatures:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)precalculateConstantFeatures
{
  void *v3;
  id v4;

  if (!-[_PSBehaviorRuleFeatureExtraction constantFeaturesReady](self, "constantFeaturesReady"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSBehaviorRuleFeatureExtraction setConstantFeatures:](self, "setConstantFeatures:", v3);

    -[_PSBehaviorRuleFeatureExtraction constantFeatures](self, "constantFeatures");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_PSBehaviorRuleFeatureExtraction extractConstantFeaturesForMLModelIntoFeatures:](self, "extractConstantFeaturesForMLModelIntoFeatures:", v4);

  }
}

- (void)extractFeaturesGivenRule:(id)a3 contextItems:(id)a4 features:(id)a5
{
  id v8;
  id v9;
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
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
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
  int v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;

  v117 = a3;
  v8 = a4;
  v9 = a5;
  if (!-[_PSBehaviorRuleFeatureExtraction contextFeaturesReady](self, "contextFeaturesReady"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSBehaviorRuleFeatureExtraction setContextFeatures:](self, "setContextFeatures:", v10);

    -[_PSBehaviorRuleFeatureExtraction contextFeatures](self, "contextFeatures");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSBehaviorRuleFeatureExtraction extractContextMatchFeatures:features:](self, "extractContextMatchFeatures:features:", v8, v11);

  }
  -[_PSBehaviorRuleFeatureExtraction contextFeatures](self, "contextFeatures");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSBehaviorRuleFeatureExtraction transferFeaturesFrom:toFeatures:](self, "transferFeaturesFrom:toFeatures:", v12, v9);

  if (!-[_PSBehaviorRuleFeatureExtraction constantFeaturesReady](self, "constantFeaturesReady"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSBehaviorRuleFeatureExtraction setConstantFeatures:](self, "setConstantFeatures:", v13);

    -[_PSBehaviorRuleFeatureExtraction constantFeatures](self, "constantFeatures");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSBehaviorRuleFeatureExtraction extractConstantFeaturesForMLModelIntoFeatures:](self, "extractConstantFeaturesForMLModelIntoFeatures:", v14);

  }
  -[_PSBehaviorRuleFeatureExtraction constantFeatures](self, "constantFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSBehaviorRuleFeatureExtraction transferFeaturesFrom:toFeatures:](self, "transferFeaturesFrom:toFeatures:", v15, v9);

  objc_msgSend(v117, "consequent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKey:", CFSTR("type"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("targetBundleIDInConsequent"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionTargetBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithBool:", objc_msgSend(v17, "containsObject:", v20));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("targetBundleIDInConsequent"));

  }
  objc_msgSend(v117, "antecedent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKey:", CFSTR("type"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("isWeekendInRule"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "isWeekend");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithBool:", objc_msgSend(v24, "containsObject:", v27));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("isWeekendInRule"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("timeOfDaySlotInRule"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "hourOfDaySlot");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithBool:", objc_msgSend(v24, "containsObject:", v31));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, CFSTR("timeOfDaySlotInRule"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("utiTypeInRule"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionUTIType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "numberWithBool:", objc_msgSend(v24, "containsObject:", v35));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, CFSTR("utiTypeInRule"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("contentUrlInRule"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionContentURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "numberWithBool:", objc_msgSend(v24, "containsObject:", v39));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v40, CFSTR("contentUrlInRule"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("sourceBundleIdInRule"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v42 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionSharingSourceBundleID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithBool:", objc_msgSend(v24, "containsObject:", v43));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v44, CFSTR("sourceBundleIdInRule"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("targetBundleIdInRule"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v46 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionTargetBundleID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "numberWithBool:", objc_msgSend(v24, "containsObject:", v47));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v48, CFSTR("targetBundleIdInRule"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("LOIInRule"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    v50 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "locationIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "numberWithBool:", objc_msgSend(v24, "containsObject:", v51));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v52, CFSTR("LOIInRule"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoContactInRule"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend(getBMItemTypeClass_2(), "interactionPhotoContact");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v24, "containsObject:", v54);

    if (v55)
    {
      objc_msgSend(v117, "antecedent");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectsPassingTest:", &__block_literal_global_166);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "count");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v59, CFSTR("photoContactInRule"));

    }
    else
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E442B7E0, CFSTR("photoContactInRule"));
    }
  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoSceneInRule"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_msgSend(getBMItemTypeClass_2(), "interactionPhotoScene");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v24, "containsObject:", v61);

    if (v62)
    {
      objc_msgSend(v117, "antecedent");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectsPassingTest:", &__block_literal_global_169);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "count");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v66, CFSTR("photoSceneInRule"));

    }
    else
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E442B7E0, CFSTR("photoSceneInRule"));
    }
  }
  objc_msgSend(v117, "antecedent");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v67, "mutableCopy");

  objc_msgSend(v68, "intersectSet:", v8);
  objc_msgSend(v68, "valueForKey:", CFSTR("type"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v69, "mutableCopy");

  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("isWeekendOverlap"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    v72 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "isWeekend");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "numberWithBool:", objc_msgSend(v70, "containsObject:", v73));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v74, CFSTR("isWeekendOverlap"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("timeOfDaySlotOverlap"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    v76 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "hourOfDaySlot");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "numberWithBool:", objc_msgSend(v70, "containsObject:", v77));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v78, CFSTR("timeOfDaySlotOverlap"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("utiTypeOverlap"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    v80 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionUTIType");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "numberWithBool:", objc_msgSend(v70, "containsObject:", v81));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v82, CFSTR("utiTypeOverlap"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("contentUrlOverlap"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    v84 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionContentURL");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "numberWithBool:", objc_msgSend(v70, "containsObject:", v85));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v86, CFSTR("contentUrlOverlap"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("sourceBundleIdOverlap"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    v88 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionSharingSourceBundleID");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "numberWithBool:", objc_msgSend(v70, "containsObject:", v89));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v90, CFSTR("sourceBundleIdOverlap"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("targetBundleIdOverlap"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    v92 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "interactionTargetBundleID");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "numberWithBool:", objc_msgSend(v70, "containsObject:", v93));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v94, CFSTR("targetBundleIdOverlap"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("LOIOverlap"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (v95)
  {
    v96 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getBMItemTypeClass_2(), "locationIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "numberWithBool:", objc_msgSend(v70, "containsObject:", v97));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v98, CFSTR("LOIOverlap"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoContactOverlap"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
  {
    objc_msgSend(getBMItemTypeClass_2(), "interactionPhotoContact");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v70, "containsObject:", v100);

    if (v101)
    {
      objc_msgSend(v68, "objectsPassingTest:", &__block_literal_global_186);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v102, "count");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v104, CFSTR("photoContactOverlap"));

    }
    else
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E442B7E0, CFSTR("photoContactOverlap"));
    }
  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("photoSceneOverlap"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (v105)
  {
    objc_msgSend(getBMItemTypeClass_2(), "interactionPhotoScene");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v70, "containsObject:", v106);

    if (v107)
    {
      objc_msgSend(v68, "objectsPassingTest:", &__block_literal_global_189);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v108, "count");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v110, CFSTR("photoSceneOverlap"));

    }
    else
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E442B7E0, CFSTR("photoSceneOverlap"));
    }
  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("support"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  if (v111)
  {
    v112 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v117, "support");
    objc_msgSend(v112, "numberWithDouble:");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v113, CFSTR("support"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("confidence"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    v115 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v117, "confidence");
    objc_msgSend(v115, "numberWithDouble:");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v116, CFSTR("confidence"));

  }
}

- (BOOL)constantFeaturesReady
{
  return self->_constantFeaturesReady;
}

- (void)setConstantFeaturesReady:(BOOL)a3
{
  self->_constantFeaturesReady = a3;
}

- (BOOL)contextFeaturesReady
{
  return self->_contextFeaturesReady;
}

- (void)setContextFeaturesReady:(BOOL)a3
{
  self->_contextFeaturesReady = a3;
}

- (NSMutableDictionary)constantFeatures
{
  return self->_constantFeatures;
}

- (void)setConstantFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_constantFeatures, a3);
}

- (NSMutableDictionary)contextFeatures
{
  return self->_contextFeatures;
}

- (void)setContextFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_contextFeatures, a3);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (BMBehaviorRetriever)behaviorRetriever
{
  return self->_behaviorRetriever;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_behaviorRetriever, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_contextFeatures, 0);
  objc_storeStrong((id *)&self->_constantFeatures, 0);
}

- (void)extractConstantFeaturesForMLModelIntoFeatures:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Error counting interactions for totalShares: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)extractConstantFeaturesForMLModelIntoFeatures:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Error counting interactions for totalMessagesRecieved: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)extractConstantFeaturesForMLModelIntoFeatures:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Error counting interactions for totalMessagesSent: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
