@implementation RECoreBehaviorPredictor

+ (id)supportedFeatures
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x24BDAC8D0];
  +[REFeature coreBehaviorTimePredictionFeature](REFeature, "coreBehaviorTimePredictionFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[REFeature coreBehaviorTimeCoarsePredictionFeature](REFeature, "coreBehaviorTimeCoarsePredictionFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[REFeature coreBehaviorDayPredictionFeature](REFeature, "coreBehaviorDayPredictionFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[REFeature coreBehaviorDayCoarsePredictionFeature](REFeature, "coreBehaviorDayCoarsePredictionFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  +[REFeature coreBehaviorLocationPredictionFeature](REFeature, "coreBehaviorLocationPredictionFeature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  +[REFeature coreBehaviorLocationCoarsePredictionFeature](REFeature, "coreBehaviorLocationCoarsePredictionFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_init
{
  _QWORD *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)RECoreBehaviorPredictor;
  v2 = -[REPredictor _init](&v11, sel__init);
  if (v2)
  {
    if (!BehaviorMinerLibraryCore_frameworkLibrary)
    {
      v16 = xmmword_24CF8C9A0;
      v17 = 0;
      BehaviorMinerLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (BehaviorMinerLibraryCore_frameworkLibrary)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2050000000;
      v3 = (void *)getBMBehaviorRetrieverClass_softClass;
      v15 = getBMBehaviorRetrieverClass_softClass;
      if (!getBMBehaviorRetrieverClass_softClass)
      {
        *(_QWORD *)&v16 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v16 + 1) = 3221225472;
        v17 = __getBMBehaviorRetrieverClass_block_invoke;
        v18 = &unk_24CF8AC38;
        v19 = &v12;
        __getBMBehaviorRetrieverClass_block_invoke((uint64_t)&v16);
        v3 = (void *)v13[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v12, 8);
      v5 = objc_alloc_init(v4);
      v6 = (void *)v2[8];
      v2[8] = v5;

    }
    v7 = (void *)v2[9];
    v2[9] = MEMORY[0x24BDBD1A8];

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 2);
    v9 = (void *)v2[10];
    v2[10] = v8;

  }
  return v2;
}

+ (double)updateInterval
{
  return 3600.0;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  RECoreBehaviorPredictor *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  int v51;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  RECoreBehaviorPredictor *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  __int128 v72;
  uint64_t v73;
  uint64_t v74;

  v61 = self;
  v74 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v10, "relevanceProviders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v14)
  {
    v15 = v14;
    v62 = v10;
    v63 = v9;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v16 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v68 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v18;
          objc_msgSend(v19, "feature");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[REFeature coreBehaviorShortcutTypeFeature](REFeature, "coreBehaviorShortcutTypeFeature");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if (v22)
          {
            v65 = REIntegerValueForTaggedPointer(objc_msgSend(v19, "value"));
          }
          else
          {
            objc_msgSend(v19, "feature");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[REFeature coreBehaviorEventIdentifierHashFeature](REFeature, "coreBehaviorEventIdentifierHashFeature");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "isEqual:", v24);

            if (v25)
            {
              REStringValueForTaggedPointer(objc_msgSend(v19, "value"));
              v26 = objc_claimAutoreleasedReturnValue();

              v66 = (void *)v26;
            }
            else
            {
              objc_msgSend(v19, "feature");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[REFeature coreBehaviorAppIdentifierHashFeature](REFeature, "coreBehaviorAppIdentifierHashFeature");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v27, "isEqual:", v28);

              if (v29)
              {
                REStringValueForTaggedPointer(objc_msgSend(v19, "value"));
                v30 = objc_claimAutoreleasedReturnValue();

                v64 = (void *)v30;
              }
            }
          }

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v15);

    if (!v65)
    {
      v43 = 0;
      v10 = v62;
      v9 = v63;
      v31 = v66;
LABEL_36:
      v42 = v64;
      goto LABEL_37;
    }
    v9 = v63;
    v31 = v66;
    if (!BehaviorMinerLibraryCore_frameworkLibrary)
    {
      v72 = xmmword_24CF8C9A0;
      v73 = 0;
      BehaviorMinerLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (!BehaviorMinerLibraryCore_frameworkLibrary)
    {
LABEL_34:
      v43 = 0;
LABEL_35:
      v10 = v62;
      goto LABEL_36;
    }
    +[REFeature coreBehaviorTimePredictionFeature](REFeature, "coreBehaviorTimePredictionFeature");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v63, "isEqual:", v32);

    if (v33)
    {
      v34 = v66;
      objc_msgSend(getBMItemTypeClass(), "hourOfDay");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDD16E0];
      v37 = 96;
LABEL_22:
      v38 = v61;
      objc_msgSend(v36, "numberWithUnsignedInteger:", *(Class *)((char *)&v61->super.super.super.super.isa + v37), v61);
      v39 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v40 = (void *)v39;
      v41 = 0;
      goto LABEL_30;
    }
    +[REFeature coreBehaviorTimeCoarsePredictionFeature](REFeature, "coreBehaviorTimeCoarsePredictionFeature");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v63, "isEqual:", v44);

    if (v45)
    {
      v34 = v64;
      objc_msgSend(getBMItemTypeClass(), "hourOfDay");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x24BDD16E0];
      v47 = 96;
    }
    else
    {
      +[REFeature coreBehaviorDayPredictionFeature](REFeature, "coreBehaviorDayPredictionFeature");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v63, "isEqual:", v53);

      if (v54)
      {
        v34 = v66;
        objc_msgSend(getBMItemTypeClass(), "dayOfWeek");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x24BDD16E0];
        v37 = 88;
        goto LABEL_22;
      }
      +[REFeature coreBehaviorDayCoarsePredictionFeature](REFeature, "coreBehaviorDayCoarsePredictionFeature");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v63, "isEqual:", v55);

      if (!v56)
      {
        +[REFeature coreBehaviorLocationPredictionFeature](REFeature, "coreBehaviorLocationPredictionFeature");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v63, "isEqual:", v57);

        if (v58)
        {
          v34 = v66;
          objc_msgSend(getBMItemTypeClass(), "locationIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v61;
          -[NSMapTable objectForKey:](v61->_locations, "objectForKey:", v11);
          v39 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        +[REFeature coreBehaviorLocationCoarsePredictionFeature](REFeature, "coreBehaviorLocationCoarsePredictionFeature");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v63, "isEqual:", v59);

        if (!v60)
        {
          v43 = 0;
          goto LABEL_35;
        }
        v34 = v64;
        objc_msgSend(getBMItemTypeClass(), "locationIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v61;
        -[NSMapTable objectForKey:](v61->_locations, "objectForKey:", v11);
        v48 = objc_claimAutoreleasedReturnValue();
LABEL_29:
        v40 = (void *)v48;
        v41 = 1;
LABEL_30:
        -[RECoreBehaviorPredictor _bmtypeForShortcutType:filterLevel:](v38, "_bmtypeForShortcutType:filterLevel:", v65, v41, v61);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[RECoreBehaviorPredictor _retrieveFeatureValueForItemType:shortcutIdentifier:antecedentType:antecedentValue:](v38, "_retrieveFeatureValueForItemType:shortcutIdentifier:antecedentType:antecedentValue:", v49, v34, v35, v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          v50 = v43;
          v51 = 1;
        }
        else
        {
          v51 = 0;
        }

        v31 = v66;
        if (v51)
          goto LABEL_35;
        goto LABEL_34;
      }
      v34 = v64;
      objc_msgSend(getBMItemTypeClass(), "dayOfWeek");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x24BDD16E0];
      v47 = 88;
    }
    v38 = v61;
    objc_msgSend(v46, "numberWithUnsignedInteger:", *(Class *)((char *)&v61->super.super.super.super.isa + v47), v61);
    v48 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }

  v31 = 0;
  v42 = 0;
  v43 = 0;
LABEL_37:

  return v43;
}

- (id)_retrieveFeatureValueForItemType:(id)a3 shortcutIdentifier:(id)a4 antecedentType:(id)a5 antecedentValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = 0;
  if (v13 && v11 && v10 && v12)
  {
    v15 = (void *)objc_msgSend(objc_alloc((Class)getBMItemClass()), "initWithType:value:", v12, v13);
    v16 = (void *)objc_msgSend(objc_alloc((Class)getBMItemClass()), "initWithType:value:", v10, v11);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = self->_rules;
    v14 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v25 = v13;
      v26 = v12;
      v27 = v11;
      v28 = v10;
      v18 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v17);
          v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v20, "antecedent", v25, v26, v27, v28, (_QWORD)v29);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "containsObject:", v15) & 1) != 0)
          {
            objc_msgSend(v20, "consequent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "containsObject:", v16);

            if ((v23 & 1) != 0)
            {
              objc_msgSend(v20, "confidence");
              +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_16;
            }
          }
          else
          {

          }
        }
        v14 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
LABEL_16:
      v11 = v27;
      v10 = v28;
      v13 = v25;
      v12 = v26;
    }

  }
  return v14;
}

- (id)_bmtypeForShortcutType:(unint64_t)a3 filterLevel:(unint64_t)a4
{
  char **v4;
  void *BMItemTypeClass;
  char *v6;
  void (*v7)(void);

  if (a3 == 1)
  {
    if (a4 == 1)
    {
      v4 = &selRef_relevanceCoarseIntentHash;
    }
    else
    {
      if (a4)
        goto LABEL_9;
      v4 = &selRef_relevanceIntentHash;
    }
  }
  else
  {
    if (a3 != 2)
      goto LABEL_9;
    if (a4 != 1)
    {
      if (!a4)
      {
        v4 = &selRef_relevanceAppActivityHash;
        goto LABEL_13;
      }
LABEL_9:
      BMItemTypeClass = 0;
      return BMItemTypeClass;
    }
    v4 = &selRef_relevanceCoarseAppActivityHash;
  }
LABEL_13:
  v6 = *v4;
  if (!*v4)
    goto LABEL_17;
  BMItemTypeClass = getBMItemTypeClass();
  if (!BMItemTypeClass)
    return BMItemTypeClass;
  getBMItemTypeClass();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_17:
    BMItemTypeClass = 0;
    return BMItemTypeClass;
  }
  v7 = (void (*)(void))objc_msgSend(getBMItemTypeClass(), "methodForSelector:", v6);
  v7();
  BMItemTypeClass = (void *)objc_claimAutoreleasedReturnValue();
  return BMItemTypeClass;
}

- (void)update
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
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BMBehaviorRetriever *retriever;
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
  uint64_t v31;
  NSArray *v32;
  NSArray *rules;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  _BOOL4 v48;
  BOOL v49;
  id obj;
  id obja;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE v61[128];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[3];
  __int128 v65;
  Class (*v66)(uint64_t);
  void *v67;
  uint64_t *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  -[REPredictor beginFetchingData](self, "beginFetchingData");
  if (!BehaviorMinerLibraryCore_frameworkLibrary)
  {
    v65 = xmmword_24CF8C9A0;
    v66 = 0;
    BehaviorMinerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (BehaviorMinerLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(getBMItemTypeClass(), "hourOfDay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v3;
    objc_msgSend(getBMItemTypeClass(), "dayOfWeek");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v4;
    objc_msgSend(getBMItemTypeClass(), "locationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithArray:", v6);
    obj = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RECoreBehaviorPredictor _bmtypeForShortcutType:filterLevel:](self, "_bmtypeForShortcutType:filterLevel:", 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v7, "addObject:", v8);

    -[RECoreBehaviorPredictor _bmtypeForShortcutType:filterLevel:](self, "_bmtypeForShortcutType:filterLevel:", 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "addObject:", v9);

    -[RECoreBehaviorPredictor _bmtypeForShortcutType:filterLevel:](self, "_bmtypeForShortcutType:filterLevel:", 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v7, "addObject:", v10);

    -[RECoreBehaviorPredictor _bmtypeForShortcutType:filterLevel:](self, "_bmtypeForShortcutType:filterLevel:", 2, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v7, "addObject:", v11);

    objc_msgSend(getBMRetrievalFilterClass(), "filterWithOperand:inclusionOperator:types:", 1, 0, obj);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getBMRetrievalFilterClass(), "filterWithOperand:inclusionOperator:types:", 2, 0, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v58 = &v57;
    v59 = 0x2050000000;
    v14 = (void *)getBMBehaviorStorageClass_softClass;
    v60 = getBMBehaviorStorageClass_softClass;
    if (!getBMBehaviorStorageClass_softClass)
    {
      *(_QWORD *)&v65 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v65 + 1) = 3221225472;
      v66 = __getBMBehaviorStorageClass_block_invoke;
      v67 = &unk_24CF8AC38;
      v68 = &v57;
      __getBMBehaviorStorageClass_block_invoke((uint64_t)&v65);
      v14 = (void *)v58[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v57, 8);
    objc_msgSend(v15, "defaultURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "path"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v17, "fileExistsAtPath:", v18),
          v18,
          v17,
          v19))
    {
      retriever = self->_retriever;
      v21 = (void *)MEMORY[0x24BDBCF20];
      v63[0] = v12;
      v63[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMBehaviorRetriever retrieveRulesWithFilters:](retriever, "retrieveRulesWithFilters:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x24BDD17C0];
      NSStringFromSelector(sel_confidence);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sortDescriptorWithKey:ascending:", v26, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x24BDD17C0];
      NSStringFromSelector(sel_support);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sortDescriptorWithKey:ascending:", v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v62[0] = v27;
      v62[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sortedArrayUsingDescriptors:", v31);
      v32 = (NSArray *)objc_claimAutoreleasedReturnValue();

      LODWORD(v31) = -[NSArray isEqualToArray:](self->_rules, "isEqualToArray:", v32);
      rules = self->_rules;
      self->_rules = v32;

      v34 = v31 ^ 1;
    }
    else
    {
      v34 = -[NSArray count](self->_rules, "count", obj) != 0;
      v27 = self->_rules;
      self->_rules = (NSArray *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v34 = 0;
  }
  v35 = (void *)-[NSMapTable copy](self->_locations, "copy", obj);
  -[NSMapTable removeAllObjects](self->_locations, "removeAllObjects");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[REPredictor engines](self, "engines");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v54 != v37)
          objc_enumerationMutation(obja);
        v39 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        +[RESingleton sharedInstance](RELocationPredictor, "sharedInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "predictedLocationIdentifierForEngine:", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMapTable setObject:forKey:](self->_locations, "setObject:forKey:", v41, v39);
        objc_msgSend(v35, "objectForKey:", v39);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v34 & 1 | (v42 == 0))
          v34 = 1;
        else
          v34 = objc_msgSend(v42, "isEqualToString:", v41) ^ 1;

      }
      v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v36);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "component:fromDate:", 32, v44);
  if (v34)
  {
    self->_hourValue = v46;
    v47 = objc_msgSend(v45, "component:fromDate:", 16, v44);
  }
  else
  {
    v48 = self->_hourValue == v46;
    self->_hourValue = v46;
    v47 = objc_msgSend(v45, "component:fromDate:", 16, v44);
    if (v48)
    {
      v49 = self->_dayValue == v47;
      self->_dayValue = v47;
      -[REPredictor finishFetchingData](self, "finishFetchingData");
      if (v49)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  self->_dayValue = v47;
  -[REPredictor finishFetchingData](self, "finishFetchingData");
LABEL_36:
  -[REPredictor updateObservers](self, "updateObservers");
LABEL_37:

}

- (void)resume
{
  id v3;

  +[RESingleton sharedInstance](RELocationPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)pause
{
  id v3;

  +[RESingleton sharedInstance](RELocationPredictor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_retriever, 0);
}

@end
