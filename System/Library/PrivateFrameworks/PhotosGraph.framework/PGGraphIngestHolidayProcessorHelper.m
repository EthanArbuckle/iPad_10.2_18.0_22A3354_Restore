@implementation PGGraphIngestHolidayProcessorHelper

- (PGGraphIngestHolidayProcessorHelper)init
{
  PGGraphIngestHolidayProcessorHelper *v2;
  PGHolidayClassifier *v3;
  PGHolidayClassifier *holidayClassifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGGraphIngestHolidayProcessorHelper;
  v2 = -[PGGraphIngestHolidayProcessorHelper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PGHolidayClassifier);
    holidayClassifier = v2->_holidayClassifier;
    v2->_holidayClassifier = v3;

  }
  return v2;
}

- (void)prepareIfNeededWithGraph:(id)a3
{
  PGGraphMeNodeCollection *v4;
  PGGraphMeNodeCollection *meNodeAsCollection;
  PGGraphPersonNodeCollection *v6;
  PGGraphPersonNodeCollection *partnerPersonNodes;
  PGGraphPersonNodeCollection *v8;
  PGGraphPersonNodeCollection *familyPersonNodes;
  PGGraphPersonNodeCollection *v10;
  PGGraphPersonNodeCollection *childPersonNodes;
  PGGraphPersonNodeCollection *v12;
  PGGraphPersonNodeCollection *fatherPersonNodes;
  PGGraphPersonNodeCollection *v14;
  PGGraphPersonNodeCollection *motherPersonNodes;
  PGGraphPersonNodeCollection *v16;
  PGGraphPersonNodeCollection *friendPersonNodes;
  PGGraphPersonNodeCollection *v18;
  PGGraphPersonNodeCollection *coworkerPersonNodes;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PGGraphPersonNodeCollection *v24;
  PGGraphPersonNodeCollection *nonAcquaintancePersonNodes;
  uint64_t v26;
  PGGraphMeNodeCollection *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *biologicalSexByPartnerPersonNodeIdentifier;
  PGGraphPersonNodeCollection *v30;
  _QWORD v31[5];
  _QWORD v32[5];

  if (!self->_meNodeAsCollection)
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", a3);
    v4 = (PGGraphMeNodeCollection *)objc_claimAutoreleasedReturnValue();
    meNodeAsCollection = self->_meNodeAsCollection;
    self->_meNodeAsCollection = v4;

    -[PGGraphPersonNodeCollection partnerPersonNodes](self->_meNodeAsCollection, "partnerPersonNodes");
    v6 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    partnerPersonNodes = self->_partnerPersonNodes;
    self->_partnerPersonNodes = v6;

    -[PGGraphPersonNodeCollection familyPersonNodes](self->_meNodeAsCollection, "familyPersonNodes");
    v8 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    familyPersonNodes = self->_familyPersonNodes;
    self->_familyPersonNodes = v8;

    -[PGGraphPersonNodeCollection childPersonNodes](self->_meNodeAsCollection, "childPersonNodes");
    v10 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    childPersonNodes = self->_childPersonNodes;
    self->_childPersonNodes = v10;

    -[PGGraphPersonNodeCollection fatherPersonNodes](self->_meNodeAsCollection, "fatherPersonNodes");
    v12 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    fatherPersonNodes = self->_fatherPersonNodes;
    self->_fatherPersonNodes = v12;

    -[PGGraphPersonNodeCollection motherPersonNodes](self->_meNodeAsCollection, "motherPersonNodes");
    v14 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    motherPersonNodes = self->_motherPersonNodes;
    self->_motherPersonNodes = v14;

    -[PGGraphPersonNodeCollection friendPersonNodes](self->_meNodeAsCollection, "friendPersonNodes");
    v16 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    friendPersonNodes = self->_friendPersonNodes;
    self->_friendPersonNodes = v16;

    -[PGGraphPersonNodeCollection coworkerPersonNodes](self->_meNodeAsCollection, "coworkerPersonNodes");
    v18 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    coworkerPersonNodes = self->_coworkerPersonNodes;
    self->_coworkerPersonNodes = v18;

    -[MAElementCollection collectionByFormingUnionWith:](self->_meNodeAsCollection, "collectionByFormingUnionWith:", self->_familyPersonNodes);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "collectionByFormingUnionWith:", self->_partnerPersonNodes);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "collectionByFormingUnionWith:", self->_childPersonNodes);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "collectionByFormingUnionWith:", self->_coworkerPersonNodes);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "collectionByFormingUnionWith:", self->_friendPersonNodes);
    v24 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    nonAcquaintancePersonNodes = self->_nonAcquaintancePersonNodes;
    self->_nonAcquaintancePersonNodes = v24;

    v26 = MEMORY[0x1E0C809B0];
    v27 = self->_meNodeAsCollection;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __64__PGGraphIngestHolidayProcessorHelper_prepareIfNeededWithGraph___block_invoke;
    v32[3] = &unk_1E842E828;
    v32[4] = self;
    -[PGGraphPersonNodeCollection enumerateBiologicalSexUsingBlock:](v27, "enumerateBiologicalSexUsingBlock:", v32);
    if (-[MAElementCollection count](self->_partnerPersonNodes, "count"))
    {
      v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      biologicalSexByPartnerPersonNodeIdentifier = self->_biologicalSexByPartnerPersonNodeIdentifier;
      self->_biologicalSexByPartnerPersonNodeIdentifier = v28;

      v30 = self->_partnerPersonNodes;
      v31[0] = v26;
      v31[1] = 3221225472;
      v31[2] = __64__PGGraphIngestHolidayProcessorHelper_prepareIfNeededWithGraph___block_invoke_2;
      v31[3] = &unk_1E842E828;
      v31[4] = self;
      -[PGGraphPersonNodeCollection enumerateBiologicalSexUsingBlock:](v30, "enumerateBiologicalSexUsingBlock:", v31);
    }
  }
}

- (id)momentsCelebratingRule:(id)a3 localDates:(id)a4 userCountryCode:(id)a5 keyboardLanguageCodes:(id)a6 graph:(id)a7 loggingConnection:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  PGGraphIngestHolidayProcessorHelper *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  PGHolidayDetectionCache *v33;
  id v34;
  void *v35;
  PGHolidayDetectionCache *v36;
  void *v38;
  char v39;
  id v40;
  id v41;
  PGHolidayDetectionCache *v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  PGGraphIngestHolidayProcessorHelper *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  PGHolidayDetectionCache *v55;
  id v56;
  char v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (objc_msgSend(v14, "isCelebration"))
  {
    objc_msgSend(v14, "explicitlySupportedCountryCodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", v16);

    +[PGGraphDateNodeCollection dateNodesForLocalDates:inGraph:](PGGraphDateNodeCollection, "dateNodesForLocalDates:inGraph:", v15, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      v42 = objc_alloc_init(PGHolidayDetectionCache);
      v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke;
      v60[3] = &unk_1E8432070;
      v39 = v21;
      v24 = v23;
      v61 = v24;
      objc_msgSend(v22, "enumerateNodesUsingBlock:", v60);
      v25 = (void *)MEMORY[0x1E0D429D8];
      +[PGGraphDateNode momentOfDate](PGGraphDateNode, "momentOfDate");
      v44 = v19;
      v26 = v15;
      v27 = self;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "adjacencyWithSources:relation:targetsClass:", v22, v28, objc_opt_class());
      v45 = v17;
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v38, "targets");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x1E0C809B0];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke_2;
      v58[3] = &unk_1E8436408;
      v32 = v29;
      v59 = v32;
      objc_msgSend(v30, "enumerateNodesUsingBlock:", v58);

      v46[0] = v31;
      v46[1] = 3221225472;
      v46[2] = __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke_3;
      v46[3] = &unk_1E842BA38;
      v47 = v24;
      v48 = v32;
      v49 = v27;
      v15 = v26;
      v19 = v44;
      v50 = v14;
      v51 = v18;
      v52 = v44;
      v53 = v16;
      v54 = v45;
      v57 = v39;
      v33 = v42;
      v55 = v33;
      v56 = v40;
      v43 = v40;
      v34 = v32;
      v41 = v24;
      objc_msgSend(v38, "enumerateTargetsBySourceWithBlock:", v46);
      v35 = v56;
      v36 = v33;

      v17 = v45;
    }
    else
    {
      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (BOOL)isCelebratingForEventRule:(id)a3 momentNode:(id)a4 momentLocalDate:(id)a5 withGraph:(id)a6 loggingConnection:(id)a7 localeCountryCode:(id)a8 keyboardLanguageCodes:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (objc_msgSend(v14, "isCelebration"))
  {
    v39 = v17;
    objc_msgSend(v15, "collection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addressNodes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "countryNodes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "names");
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v23;
    -[PGGraphIngestHolidayProcessorHelper dateScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:momentDate:](self, "dateScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:momentDate:", v14, v18, v23, v19, v16);
    if (v25 == 0.0)
    {
      LOBYTE(v26) = 0;
      v17 = v39;
    }
    else
    {
      v27 = v25;
      v17 = v39;
      if (-[PGGraphIngestHolidayProcessorHelper momentTraitsMatchesHolidayTraits:momentNode:loggingConnection:](self, "momentTraitsMatchesHolidayTraits:momentNode:loggingConnection:", v14, v15, v39))
      {
        -[PGGraphIngestHolidayProcessorHelper sceneScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:momentNode:](self, "sceneScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:momentNode:", v14, v18, v24, v19, v15);
        v29 = v28;
        -[PGGraphIngestHolidayProcessorHelper locationScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:](self, "locationScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:", v14, v18, v24, v19);
        v31 = v30;
        v26 = -[PGHolidayClassifier isCelebratingForDateScore:sceneScore:locationScore:](self->_holidayClassifier, "isCelebratingForDateScore:sceneScore:locationScore:", v27, v29, v30);
        v32 = v39;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v15, "uuid");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v24;
          v37 = (void *)v35;
          *(_DWORD *)buf = 138414082;
          v38 = "NO";
          v41 = v34;
          if (v26)
            v38 = "YES";
          v42 = 2112;
          v43 = v35;
          v44 = 2112;
          v45 = v18;
          v46 = 2112;
          v47 = v36;
          v48 = 2048;
          v49 = v27;
          v50 = 2048;
          v51 = v29;
          v52 = 2048;
          v53 = v31;
          v54 = 2080;
          v55 = v38;
          _os_log_debug_impl(&dword_1CA237000, v32, OS_LOG_TYPE_DEBUG, "[HolidayProcessor] MomentUUID: %@, holiday name: %@\nuserCountryCode: %@, momentCountryCode: %@\ndateScore: %f, sceneScore: %f, locationScore: %f, isCelebrating: %s", buf, 0x52u);

          v24 = v36;
          v17 = v39;

        }
      }
      else
      {
        LOBYTE(v26) = 0;
      }
    }

  }
  else
  {
    LOBYTE(v26) = 0;
  }

  return v26;
}

- (double)locationScoreForEventRule:(id)a3 localeCountryCode:(id)a4 momentCountryCodes:(id)a5 keyboardLanguageCodes:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t j;
  double v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "locationScoreForCountryCode:", a4);
  v14 = v13;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    v19 = 0.0;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v10, "locationScoreForCountryCode:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v19 = v19 + v21;
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v17);
  }
  else
  {
    v19 = 0.0;
  }

  if (objc_msgSend(v15, "count"))
  {
    v22 = v19 / (double)(unint64_t)objc_msgSend(v15, "count");
    -[PGHolidayClassifier localeLocationWeight](self->_holidayClassifier, "localeLocationWeight");
    v24 = v23;
    -[PGHolidayClassifier momentLocationWeight](self->_holidayClassifier, "momentLocationWeight");
    v34 = 0u;
    v35 = 0u;
    v14 = v22 * v25 + v24 * v14;
    v36 = 0u;
    v37 = 0u;
    v26 = v12;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v35;
      v30 = 0.0;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(v10, "languageScoreForLanguageCode:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), (_QWORD)v34);
          v30 = v30 + v32;
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v28);

      if (v30 > 0.0)
        v14 = (v14 + v30 / (double)(unint64_t)objc_msgSend(v26, "count")) * 0.5;
    }
    else
    {

    }
  }

  return v14;
}

- (double)sceneScoreForEventRule:(id)a3 localeCountryCode:(id)a4 momentCountryCodes:(id)a5 keyboardLanguageCodes:(id)a6 momentNode:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  PGGraphIngestHolidayProcessorHelper *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  double v28;
  double v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  double v51;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  double v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v56 = a6;
  v14 = a7;
  if (!objc_msgSend(v11, "skipSceneCriteriaIfInteresting")
    || (v15 = 1.0, (objc_msgSend(v14, "isInterestingForMemories") & 1) == 0))
  {
    v58 = v14;
    objc_msgSend(v14, "collection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sceneNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v17;
    objc_msgSend(v17, "sceneNames");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v13;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v12)
      objc_msgSend(v19, "addObject:", v12);
    v55 = v12;
    v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v20;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    v23 = self;
    if (v22)
    {
      v24 = v22;
      v25 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v66 != v25)
            objc_enumerationMutation(obj);
          objc_msgSend(v11, "scoreForCountryCode:sceneNames:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i), v18);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGHolidayClassifier scoreForHolidayDetectedScenes:](v23->_holidayClassifier, "scoreForHolidayDetectedScenes:", v27);
          if (v28 > 0.0)
          {
            v29 = v28;
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "loggingConnection");
            v31 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v58, "uuid");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "name");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v71 = v32;
              v72 = 2112;
              v73 = v33;
              v74 = 2048;
              v75 = v29;
              _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[HolidayProcessor] MomentUUID: %@, Holiday: %@, calculatedSceneScoreForCountryCode: %f", buf, 0x20u);

              v23 = self;
            }

          }
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      }
      while (v24);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v34 = v56;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v62;
      do
      {
        v38 = 0;
        v57 = v36;
        do
        {
          if (*(_QWORD *)v62 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(v11, "scoreForLanguageCode:sceneNames:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v38), v18);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGHolidayClassifier scoreForHolidayDetectedScenes:](v23->_holidayClassifier, "scoreForHolidayDetectedScenes:", v39);
          if (v40 > 0.0)
          {
            v41 = v40;
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "loggingConnection");
            v43 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v58, "uuid");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "name");
              v45 = v37;
              v46 = v21;
              v47 = v11;
              v48 = v18;
              v49 = v34;
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v71 = v44;
              v72 = 2112;
              v73 = v50;
              v74 = 2048;
              v75 = v41;
              _os_log_impl(&dword_1CA237000, v43, OS_LOG_TYPE_INFO, "[HolidayProcessor] MomentUUID: %@, Holiday: %@, calculatedSceneScoreForLanguageCode: %f", buf, 0x20u);

              v34 = v49;
              v18 = v48;
              v11 = v47;
              v21 = v46;
              v37 = v45;
              v36 = v57;

            }
            v23 = self;
          }
          objc_msgSend(v21, "addObject:", v39);

          ++v38;
        }
        while (v36 != v38);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v36);
    }

    -[PGGraphIngestHolidayProcessorHelper _calculateSceneScores:](v23, "_calculateSceneScores:", v21);
    v15 = v51;

    v13 = v54;
    v12 = v55;
    v14 = v58;
  }

  return v15;
}

- (double)_calculateSceneScores:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[PGHolidayClassifier scoreForHolidayDetectedScenes:](self->_holidayClassifier, "scoreForHolidayDetectedScenes:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        if (v8 < v10)
          v8 = v10;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)dateScoreForEventRule:(id)a3 localeCountryCode:(id)a4 momentCountryCodes:(id)a5 keyboardLanguageCodes:(id)a6 momentDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  double v39;
  unint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v15);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v12)
    objc_msgSend(v17, "addObject:", v12);
  if (objc_msgSend(v18, "count"))
  {
    v44 = v12;
    v45 = v14;
    v43 = v13;
    v41 = objc_msgSend(v18, "count");
    v42 = v18;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v53;
      v22 = 0.0;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v53 != v21)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v11, "localDateByEvaluatingRuleForYear:countryCode:", v16, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            -[PGGraphIngestHolidayProcessorHelper _dateScoreForEventRule:localeCode:holidayDate:momentDate:](self, "_dateScoreForEventRule:localeCode:holidayDate:momentDate:", v11, v24, v25, v15);
            v22 = v22 + v26;
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "loggingConnection");
            v28 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v11, "name");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v58 = v29;
              v59 = 2112;
              v60 = v24;
              v61 = 2048;
              v62 = v16;
              _os_log_error_impl(&dword_1CA237000, v28, OS_LOG_TYPE_ERROR, "Holiday %@ has no default data rule or dateRuleOverride for countryCode %@, year %ld", buf, 0x20u);

            }
          }

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      }
      while (v20);
    }
    else
    {
      v22 = 0.0;
    }
    v31 = (double)v41;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v32 = v45;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v49 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(v11, "localDateByEvaluatingRuleForYear:languageCode:", v16, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            -[PGGraphIngestHolidayProcessorHelper _dateScoreForEventRule:localeCode:holidayDate:momentDate:](self, "_dateScoreForEventRule:localeCode:holidayDate:momentDate:", v11, v37, v38, v15);
            if (v39 == 0.0)
              v39 = -0.0;
            else
              v31 = v31 + 1.0;
            v22 = v22 + v39;
          }

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v34);
    }

    v30 = v22 / v31;
    v13 = v43;
    v12 = v44;
    v14 = v45;
    v18 = v42;
  }
  else
  {
    v30 = 0.0;
  }

  return v30;
}

- (double)_dateScoreForEventRule:(id)a3 localeCode:(id)a4 holidayDate:(id)a5 momentDate:(id)a6
{
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  double result;
  uint64_t v14;

  v8 = a6;
  v9 = a5;
  objc_msgSend(a3, "requiredTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowApproximateDateCalculation");

  if (v11)
  {
    v12 = objc_msgSend(MEMORY[0x1E0D4B130], "numberOfDaysBetweenDate:andDate:", v9, v8);

    return (double)v12 / -3.0 + 1.0;
  }
  else
  {
    v14 = objc_msgSend(v9, "compare:", v8);

    result = 0.0;
    if (!v14)
      return 1.0;
  }
  return result;
}

- (BOOL)momentTraitsMatchesHolidayTraits:(id)a3 momentNode:(id)a4 loggingConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PGGraphIngestHolidayProcessorHelper holidayCalendarEventRuleTraitsForMomentNode:](self, "holidayCalendarEventRuleTraitsForMomentNode:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "evaluateOnlyTraits:evaluateLocationTraits:", v11, 0);
  v13 = v10;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    objc_msgSend(v8, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requiredTraits");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413314;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v18;
    _os_log_debug_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEBUG, "[HolidayProcessor] Moment (UUID: %@) traits match? (%@) event rule traits for holiday %@\n %@\n %@", (uint8_t *)&v19, 0x34u);

  }
  return v12;
}

- (id)holidayCalendarEventRuleTraitsForMomentNode:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D4B178];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "graph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPeopleTrait:", -[PGGraphIngestHolidayProcessorHelper _eventRulePeopleTraitForPersonNodes:graph:](self, "_eventRulePeopleTraitForPersonNodes:graph:", v8, v9));

  objc_msgSend(v6, "setContainsMePerson:", objc_msgSend(v8, "containsMeNode"));
  objc_msgSend(v5, "collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "personNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfPeople:", objc_msgSend(v11, "count"));

  return v6;
}

- (unint64_t)_eventRulePeopleTraitForPersonNodes:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t meBiologicalSex;
  _QWORD v14[4];
  id v15;
  PGGraphIngestHolidayProcessorHelper *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v7 = a4;
  -[PGGraphIngestHolidayProcessorHelper prepareIfNeededWithGraph:](self, "prepareIfNeededWithGraph:", v7);
  v8 = objc_msgSend(v6, "intersectsCollection:", self->_partnerPersonNodes);
  if (objc_msgSend(v6, "intersectsCollection:", self->_familyPersonNodes))
    v8 |= 2uLL;
  if (objc_msgSend(v6, "intersectsCollection:", self->_friendPersonNodes))
    v8 |= 4uLL;
  if (!-[MAElementCollection containsCollection:](self->_nonAcquaintancePersonNodes, "containsCollection:", v6))
    v8 |= 0x10uLL;
  if (objc_msgSend(v6, "intersectsCollection:", self->_coworkerPersonNodes))
    v8 |= 8uLL;
  if (objc_msgSend(v6, "intersectsCollection:", self->_motherPersonNodes))
    v8 |= 0x20uLL;
  if (objc_msgSend(v6, "intersectsCollection:", self->_fatherPersonNodes))
    v8 |= 0x40uLL;
  if (objc_msgSend(v6, "intersectsCollection:", self->_childPersonNodes))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    objc_msgSend(v6, "elementIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAElementCollection elementIdentifiers](self->_partnerPersonNodes, "elementIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__PGGraphIngestHolidayProcessorHelper__eventRulePeopleTraitForPersonNodes_graph___block_invoke;
    v14[3] = &unk_1E8434670;
    v11 = v9;
    v15 = v11;
    v16 = self;
    v17 = &v23;
    v18 = &v19;
    objc_msgSend(v10, "enumerateIdentifiersWithBlock:", v14);

    meBiologicalSex = self->_meBiologicalSex;
    if (meBiologicalSex == 1 || *((_BYTE *)v24 + 24))
      v8 |= 0x20uLL;
    if (meBiologicalSex == 2 || *((_BYTE *)v20 + 24))
      v8 |= 0x40uLL;

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }

  return v8;
}

- (unint64_t)_eventRuleLocationTraitForMomentNode:(id)a3 graph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, _BYTE *);
  void *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasAddressNodes"))
  {
    objc_msgSend(v6, "supersetCityNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    objc_msgSend(v5, "bestAddressNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cityNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __82__PGGraphIngestHolidayProcessorHelper__eventRuleLocationTraitForMomentNode_graph___block_invoke;
    v23 = &unk_1E842BA88;
    v26 = &v32;
    v12 = v7;
    v24 = v12;
    v13 = v9;
    v25 = v13;
    v27 = &v28;
    objc_msgSend(v11, "enumerateNodesUsingBlock:", &v20);

    if (*((_BYTE *)v33 + 24))
    {
      v14 = 7;
    }
    else if (*((_BYTE *)v29 + 24))
    {
      v14 = 14;
    }
    else
    {
      objc_msgSend(v6, "supersetCountryNodes", v20, v21, v22, v23, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "collection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addressNodes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "countryNodes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "intersectsCollection:", v15))
        v14 = 20;
      else
        v14 = 48;

    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biologicalSexByPartnerPersonNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_nonAcquaintancePersonNodes, 0);
  objc_storeStrong((id *)&self->_coworkerPersonNodes, 0);
  objc_storeStrong((id *)&self->_friendPersonNodes, 0);
  objc_storeStrong((id *)&self->_motherPersonNodes, 0);
  objc_storeStrong((id *)&self->_fatherPersonNodes, 0);
  objc_storeStrong((id *)&self->_childPersonNodes, 0);
  objc_storeStrong((id *)&self->_familyPersonNodes, 0);
  objc_storeStrong((id *)&self->_partnerPersonNodes, 0);
  objc_storeStrong((id *)&self->_meNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_holidayClassifier, 0);
}

void __82__PGGraphIngestHolidayProcessorHelper__eventRuleLocationTraitForMomentNode_graph___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _BYTE *v12;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "containsNode:", a2);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __82__PGGraphIngestHolidayProcessorHelper__eventRuleLocationTraitForMomentNode_graph___block_invoke_2;
      v9[3] = &unk_1E842BA60;
      v7 = v5;
      v8 = *(_QWORD *)(a1 + 56);
      v10 = v7;
      v11 = v8;
      v12 = a3;
      objc_msgSend(v6, "enumerateNodesUsingBlock:", v9);

    }
  }
}

void __82__PGGraphIngestHolidayProcessorHelper__eventRuleLocationTraitForMomentNode_graph___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(a2, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addressNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyNode");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "distanceFromLocation:", v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6 <= *MEMORY[0x1E0D4B2A0];
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      **(_BYTE **)(a1 + 48) = 1;
  }

}

void __81__PGGraphIngestHolidayProcessorHelper__eventRulePeopleTraitForPersonNodes_graph___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (objc_msgSend(*(id *)(a1 + 32), "containsIdentifier:", a2))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v7 == 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= v7 == 2;
  }
}

void __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

}

void __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

}

void __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *context;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v5, "elementIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "firstElement");

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v6, "elementIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 48), "isCelebratingForEventRule:momentNode:momentLocalDate:withGraph:loggingConnection:localeCountryCode:keyboardLanguageCodes:", *(_QWORD *)(a1 + 56), v19, v12, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88)) & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 96), "addHolidayWithDateNode:", v11);
          objc_msgSend(*(id *)(a1 + 104), "addObject:", v19);
          objc_msgSend(*(id *)(a1 + 96), "addPositivelyClassifiedMomentNode:", v19);
        }
        else if (*(_BYTE *)(a1 + 112))
        {
          objc_msgSend(*(id *)(a1 + 96), "addHolidayWithDateNode:", v11);
          if ((objc_msgSend(*(id *)(a1 + 56), "backfillForCountryCode:", *(_QWORD *)(a1 + 80)) & 1) != 0
            || objc_msgSend(*(id *)(a1 + 56), "backfillForLanguageCodes:", *(_QWORD *)(a1 + 88)))
          {
            if (objc_msgSend(v19, "isInterestingForMemories"))
              objc_msgSend(*(id *)(a1 + 96), "addNegativelyClassifiedMomentNode:", v19);
          }
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __64__PGGraphIngestHolidayProcessorHelper_prepareIfNeededWithGraph___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 88) = a3;
  return result;
}

void __64__PGGraphIngestHolidayProcessorHelper_prepareIfNeededWithGraph___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

+ (id)keyboardLanguageCodesForInfoNode:(id)a3 holidayService:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a4, "supportedLanguageCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v5, "languageIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v15, "length") >= 2)
        {
          objc_msgSend(v15, "substringToIndex:", 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length") == 2)
            objc_msgSend(v9, "addObject:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
  objc_msgSend(v9, "intersectSet:", v8);
  objc_msgSend(v9, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
