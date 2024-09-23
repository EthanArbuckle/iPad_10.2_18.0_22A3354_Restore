@implementation PGGraphRelationshipProcessor

- (PGGraphRelationshipProcessor)initWithPersonNodes:(id)a3 runOptions:(unint64_t)a4 serviceManager:(id)a5
{
  id v9;
  id v10;
  PGGraphRelationshipProcessor *v11;
  uint64_t v12;
  PGGraph *graph;
  uint64_t v14;
  PGGraphMomentNodeCollection *momentNodes;
  uint64_t v16;
  NSSet *contactIdentifiers;
  uint64_t v18;
  NSDictionary *personLocalIdentifierByContactIdentifier;
  uint64_t v20;
  NSMutableArray *analyzersToRun;
  objc_super v23;

  v9 = a3;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PGGraphRelationshipProcessor;
  v11 = -[PGGraphRelationshipProcessor init](&v23, sel_init);
  if (v11)
  {
    objc_msgSend(v9, "graph");
    v12 = objc_claimAutoreleasedReturnValue();
    graph = v11->_graph;
    v11->_graph = (PGGraph *)v12;

    objc_storeStrong((id *)&v11->_personNodes, a3);
    objc_msgSend(v9, "momentNodes");
    v14 = objc_claimAutoreleasedReturnValue();
    momentNodes = v11->_momentNodes;
    v11->_momentNodes = (PGGraphMomentNodeCollection *)v14;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    contactIdentifiers = v11->_contactIdentifiers;
    v11->_contactIdentifiers = (NSSet *)v16;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    personLocalIdentifierByContactIdentifier = v11->_personLocalIdentifierByContactIdentifier;
    v11->_personLocalIdentifierByContactIdentifier = (NSDictionary *)v18;

    v11->_runOptions = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    analyzersToRun = v11->_analyzersToRun;
    v11->_analyzersToRun = (NSMutableArray *)v20;

    objc_storeStrong((id *)&v11->_serviceManager, a5);
    -[PGGraphRelationshipProcessor _extractSignalsFromRunOptions](v11, "_extractSignalsFromRunOptions");
  }

  return v11;
}

- (void)runRelationshipAnalysisWithLoggingConnection:(id)a3 progressBlock:(id)a4
{
  NSMutableDictionary *v5;
  NSMutableDictionary *relationshipAnalyzerPropertiesByPersonLocalIdentifier;
  NSDictionary *v7;
  NSDictionary *personLocalIdentifierByContactIdentifier;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *contactIdentifiers;
  double v13;
  char v14;
  unint64_t numberOfSignals;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  mach_timebase_info v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  double Current;
  char v37;
  id aBlock;
  NSMutableArray *obj;
  id v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  mach_timebase_info info;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint8_t v69[4];
  _BYTE v70[18];
  __int16 v71;
  double v72;
  uint8_t v73[128];
  uint8_t buf[8];
  __int128 v75;
  char v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  aBlock = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  relationshipAnalyzerPropertiesByPersonLocalIdentifier = self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier;
  self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier = v5;

  +[PGPeopleInferencesConveniences personLocalIdentifierByContactIdentifierFromPersonNodes:](PGPeopleInferencesConveniences, "personLocalIdentifierByContactIdentifierFromPersonNodes:", self->_personNodes);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  personLocalIdentifierByContactIdentifier = self->_personLocalIdentifierByContactIdentifier;
  self->_personLocalIdentifierByContactIdentifier = v7;

  v9 = (void *)MEMORY[0x1E0C99E60];
  -[NSDictionary allKeys](self->_personLocalIdentifierByContactIdentifier, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
  contactIdentifiers = self->_contactIdentifiers;
  self->_contactIdentifiers = v11;

  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = (double *)&v61;
  v63 = 0x2020000000;
  v64 = 0;
  v42 = _Block_copy(aBlock);
  if (v42
    && (v13 = CFAbsoluteTimeGetCurrent(), v13 - v62[3] >= 0.01)
    && (v62[3] = v13,
        LOBYTE(v57) = 0,
        (*((void (**)(void *, uint64_t *, double))v42 + 2))(v42, &v57, 0.0),
        v14 = *((_BYTE *)v66 + 24) | v57,
        (*((_BYTE *)v66 + 24) = v14) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 96;
      LOWORD(v75) = 2080;
      *(_QWORD *)((char *)&v75 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/People Inferences/Relationship/PGGraphRelationshipProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v75 = buf;
    *((_QWORD *)&v75 + 1) = 0x2020000000;
    v76 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    numberOfSignals = self->_numberOfSignals;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = self->_analyzersToRun;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v54;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v54 != v17)
            objc_enumerationMutation(obj);
          if (*(_BYTE *)(v75 + 24))
          {

            goto LABEL_29;
          }
          v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          v20 = v58[3];
          v21 = v41;
          v22 = os_signpost_id_generate(v21);
          v23 = v21;
          v24 = v23;
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
          {
            *(_WORD *)v69 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "RelationshipAnalyzer", ", v69, 2u);
          }

          info = 0;
          mach_timebase_info(&info);
          v25 = mach_absolute_time();
          v26 = (void *)MEMORY[0x1CAA4EB2C]();
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __91__PGGraphRelationshipProcessor_runRelationshipAnalysisWithLoggingConnection_progressBlock___block_invoke;
          v43[3] = &unk_1E84298D8;
          v44 = v42;
          v45 = &v61;
          v46 = &v57;
          v47 = &v65;
          v50 = v20;
          v51 = 0.9 / (double)numberOfSignals;
          v49 = 0x3F847AE147AE147BLL;
          v48 = buf;
          objc_msgSend(v19, "runAnalysisWithProgressBlock:", v43);

          objc_autoreleasePoolPop(v26);
          v27 = mach_absolute_time();
          v28 = info;
          v29 = v24;
          v30 = v29;
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            objc_msgSend(v19, "name");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v69 = 138412290;
            *(_QWORD *)v70 = v31;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v30, OS_SIGNPOST_INTERVAL_END, v22, "RelationshipAnalyzer", "Relationship Analyzer: %@", v69, 0xCu);

          }
          v32 = v30;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v33 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v19, "name");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringWithFormat:", CFSTR("Relationship Analyzer: %@"), v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v69 = 136315650;
            *(_QWORD *)v70 = "RelationshipAnalyzer";
            *(_WORD *)&v70[8] = 2112;
            *(_QWORD *)&v70[10] = v35;
            v71 = 2048;
            v72 = (float)((float)((float)((float)(v27 - v25) * (float)v28.numer) / (float)v28.denom) / 1000000.0);
            _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v69, 0x20u);

          }
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
        if (v16)
          continue;
        break;
      }
    }

    if (!*(_BYTE *)(v75 + 24))
    {
      -[PGGraphRelationshipProcessor _aggregateScores](self, "_aggregateScores");
      if (v42)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v62[3] >= 0.01)
        {
          v62[3] = Current;
          LOBYTE(info.numer) = 0;
          (*((void (**)(void *, mach_timebase_info *, double))v42 + 2))(v42, &info, 1.0);
          v37 = *((_BYTE *)v66 + 24) | LOBYTE(info.numer);
          *((_BYTE *)v66 + 24) = v37;
          if (v37)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v69 = 67109378;
              *(_DWORD *)v70 = 129;
              *(_WORD *)&v70[4] = 2080;
              *(_QWORD *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/People Inferences/Relationship/PGGraphRelationshipProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v69, 0x12u);
            }
          }
        }
      }
    }
LABEL_29:
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

}

- (void)enumerateInferredRelationshipsUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  PGGraphRelationshipProcessor *v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  PGGraphRelationshipProcessor *v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  _QWORD *v35;
  _QWORD v36[3];
  char v37;

  v4 = a3;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke;
  v33[3] = &unk_1E8429900;
  v33[4] = self;
  v6 = v4;
  v34 = v6;
  v35 = v36;
  -[PGGraphRelationshipProcessor _enumerateInferredPartnerUsingBlock:](self, "_enumerateInferredPartnerUsingBlock:", v33);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_2;
  v28[3] = &unk_1E8429928;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v29 = v7;
  v30 = self;
  v8 = v6;
  v31 = v8;
  v32 = v36;
  -[PGGraphRelationshipProcessor _enumerateInferredFamilyMembersUsingBlock:](self, "_enumerateInferredFamilyMembersUsingBlock:", v28);
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_3;
  v23[3] = &unk_1E8429928;
  v9 = v7;
  v24 = v9;
  v25 = self;
  v10 = v8;
  v26 = v10;
  v27 = v36;
  -[PGGraphRelationshipProcessor _enumerateInferredFriendsUsingBlock:](self, "_enumerateInferredFriendsUsingBlock:", v23);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_164;
  v20[3] = &unk_1E8429900;
  v20[4] = self;
  v11 = v10;
  v21 = v11;
  v22 = v36;
  -[PGGraphRelationshipProcessor _enumerateInferredParentsUsingBlock:](self, "_enumerateInferredParentsUsingBlock:", v20);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_2_165;
  v17[3] = &unk_1E8429900;
  v17[4] = self;
  v12 = v11;
  v18 = v12;
  v19 = v36;
  -[PGGraphRelationshipProcessor _enumerateInferredChildrenUsingBlock:](self, "_enumerateInferredChildrenUsingBlock:", v17);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_3_166;
  v14[3] = &unk_1E8429900;
  v14[4] = self;
  v13 = v12;
  v15 = v13;
  v16 = v36;
  -[PGGraphRelationshipProcessor _enumerateInferredCoworkersUsingBlock:](self, "_enumerateInferredCoworkersUsingBlock:", v14);

  _Block_object_dispose(v36, 8);
}

- (void)enumerateHighRecallInferredRelationshipsExcludingPersonNodes:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PGGraphRelationshipProcessor personNodes](self, "personNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionBySubtracting:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__PGGraphRelationshipProcessor_enumerateHighRecallInferredRelationshipsExcludingPersonNodes_usingBlock___block_invoke;
  v11[3] = &unk_1E8429950;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v10, "enumerateLocalIdentifiersUsingBlock:", v11);

}

- (void)_extractSignalsFromRunOptions
{
  NSMutableArray *analyzersToRun;
  PGRelationshipTripAnalyzer *v4;
  NSMutableArray *v5;
  PGRelationshipNightOutAnalyzer *v6;
  NSMutableArray *v7;
  PGRelationshipHolidayAnalyzer *v8;
  NSMutableArray *v9;
  PGRelationshipContactNameAnalyzer *v10;
  NSMutableArray *v11;
  PGRelationshipHomeAnalyzer *v12;
  NSMutableArray *v13;
  PGRelationshipAnniversaryAnalyzer *v14;
  NSMutableArray *v15;
  PGRelationshipSocialGroupAnalyzer *v16;
  NSMutableArray *v17;
  PGRelationshipMomentFrequencyAnalyzer *v18;
  NSMutableArray *v19;
  PGRelationshipWeekendAnalyzer *v20;
  NSMutableArray *v21;
  PGRelationshipCalendarAnalyzer *v22;
  NSMutableArray *v23;
  PGRelationshipWorkAnalyzer *v24;
  NSMutableArray *v25;
  PGRelationshipAgeAnalyzer *v26;

  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 2))
  {
    analyzersToRun = self->_analyzersToRun;
    v4 = -[PGRelationshipTripAnalyzer initWithRelationshipProcessor:]([PGRelationshipTripAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](analyzersToRun, "addObject:", v4);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 4))
  {
    v5 = self->_analyzersToRun;
    v6 = -[PGRelationshipNightOutAnalyzer initWithRelationshipProcessor:]([PGRelationshipNightOutAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v5, "addObject:", v6);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 16))
  {
    v7 = self->_analyzersToRun;
    v8 = -[PGRelationshipHolidayAnalyzer initWithRelationshipProcessor:]([PGRelationshipHolidayAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v7, "addObject:", v8);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 32))
  {
    v9 = self->_analyzersToRun;
    v10 = -[PGRelationshipContactNameAnalyzer initWithRelationshipProcessor:]([PGRelationshipContactNameAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v9, "addObject:", v10);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 64))
  {
    v11 = self->_analyzersToRun;
    v12 = -[PGRelationshipHomeAnalyzer initWithRelationshipProcessor:]([PGRelationshipHomeAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v11, "addObject:", v12);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 128))
  {
    v13 = self->_analyzersToRun;
    v14 = -[PGRelationshipAnniversaryAnalyzer initWithRelationshipProcessor:]([PGRelationshipAnniversaryAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v13, "addObject:", v14);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 256))
  {
    v15 = self->_analyzersToRun;
    v16 = -[PGRelationshipSocialGroupAnalyzer initWithRelationshipProcessor:]([PGRelationshipSocialGroupAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v15, "addObject:", v16);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 8))
  {
    v17 = self->_analyzersToRun;
    v18 = -[PGRelationshipMomentFrequencyAnalyzer initWithRelationshipProcessor:]([PGRelationshipMomentFrequencyAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v17, "addObject:", v18);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 512))
  {
    v19 = self->_analyzersToRun;
    v20 = -[PGRelationshipWeekendAnalyzer initWithRelationshipProcessor:]([PGRelationshipWeekendAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v19, "addObject:", v20);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 1024))
  {
    v21 = self->_analyzersToRun;
    v22 = -[PGRelationshipCalendarAnalyzer initWithRelationshipProcessor:]([PGRelationshipCalendarAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v21, "addObject:", v22);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 2048))
  {
    v23 = self->_analyzersToRun;
    v24 = -[PGRelationshipWorkAnalyzer initWithRelationshipProcessor:]([PGRelationshipWorkAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v23, "addObject:", v24);

  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:signal:](PGPeopleInferencesConveniences, "signalInRunOptions:signal:", self->_runOptions, 4096))
  {
    v25 = self->_analyzersToRun;
    v26 = -[PGRelationshipAgeAnalyzer initWithRelationshipProcessor:]([PGRelationshipAgeAnalyzer alloc], "initWithRelationshipProcessor:", self);
    -[NSMutableArray addObject:](v25, "addObject:", v26);

  }
  self->_numberOfSignals = -[NSMutableArray count](self->_analyzersToRun, "count");
}

- (void)_aggregateScores
{
  NSMutableDictionary *v3;
  NSMutableDictionary *partnerScoreByPersonLocalIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *parentScoreByPersonLocalIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *childScoreByPersonLocalIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *familyScoreByPersonLocalIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *coworkerScoreByPersonLocalIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *friendScoreByPersonLocalIdentifier;
  NSMutableDictionary *relationshipAnalyzerPropertiesByPersonLocalIdentifier;
  _QWORD v16[5];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  partnerScoreByPersonLocalIdentifier = self->_partnerScoreByPersonLocalIdentifier;
  self->_partnerScoreByPersonLocalIdentifier = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  parentScoreByPersonLocalIdentifier = self->_parentScoreByPersonLocalIdentifier;
  self->_parentScoreByPersonLocalIdentifier = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  childScoreByPersonLocalIdentifier = self->_childScoreByPersonLocalIdentifier;
  self->_childScoreByPersonLocalIdentifier = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  familyScoreByPersonLocalIdentifier = self->_familyScoreByPersonLocalIdentifier;
  self->_familyScoreByPersonLocalIdentifier = v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  coworkerScoreByPersonLocalIdentifier = self->_coworkerScoreByPersonLocalIdentifier;
  self->_coworkerScoreByPersonLocalIdentifier = v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  friendScoreByPersonLocalIdentifier = self->_friendScoreByPersonLocalIdentifier;
  self->_friendScoreByPersonLocalIdentifier = v13;

  relationshipAnalyzerPropertiesByPersonLocalIdentifier = self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__PGGraphRelationshipProcessor__aggregateScores__block_invoke;
  v16[3] = &unk_1E8429978;
  v16[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](relationshipAnalyzerPropertiesByPersonLocalIdentifier, "enumerateKeysAndObjectsUsingBlock:", v16);
}

- (void)_enumerateInferredPartnerUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *partnerScoreByPersonLocalIdentifier;
  uint64_t v6;
  NSMutableDictionary *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[7];
  _QWORD v14[4];
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];

  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__15451;
  v15[4] = __Block_byref_object_dispose__15452;
  v16 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  partnerScoreByPersonLocalIdentifier = self->_partnerScoreByPersonLocalIdentifier;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PGGraphRelationshipProcessor__enumerateInferredPartnerUsingBlock___block_invoke;
  v13[3] = &unk_1E84299A0;
  v13[4] = v14;
  v13[5] = v15;
  v13[6] = v17;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](partnerScoreByPersonLocalIdentifier, "enumerateKeysAndObjectsUsingBlock:", v13);
  v7 = self->_partnerScoreByPersonLocalIdentifier;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __68__PGGraphRelationshipProcessor__enumerateInferredPartnerUsingBlock___block_invoke_2;
  v9[3] = &unk_1E84299C8;
  v11 = v15;
  v12 = v17;
  v8 = v4;
  v10 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(v17, 8);
}

- (void)_enumerateInferredRelationshipMembersFromScores:(id)a3 cumulativeThreshold:(double)a4 minimumConfidence:(double)a5 usingBlock:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, double);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  double v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t *v59;
  double v60;
  _QWORD v61[4];
  id v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  double *v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[128];
  _BYTE v72[128];
  void *v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD, double))a6;
  v67 = 0;
  v68 = (double *)&v67;
  v69 = 0x2020000000;
  v70 = 0;
  if (objc_msgSend(v10, "count"))
  {
    v12 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(v10, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "expressionForConstantValue:", v13);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB35D0];
    v74[0] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "expressionForFunction:arguments:", CFSTR("average:"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "expressionValueWithObject:context:", 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    v20 = (void *)MEMORY[0x1E0CB35D0];
    v73 = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "expressionForFunction:arguments:", CFSTR("stddev:"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "expressionValueWithObject:context:", 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v10, "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = MEMORY[0x1E0C809B0];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke;
    v61[3] = &unk_1E84299F0;
    v63 = &v67;
    v64 = v19;
    v65 = v25;
    v66 = a4;
    v32 = v26;
    v62 = v32;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v61);
    if (objc_msgSend(v32, "count"))
    {
      +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", self->_graph);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphRelationshipProcessor _socialGroupNodesIncludingPersonLocalIdentifiers:minimumMatches:amongSocialGroupNodes:](self, "_socialGroupNodesIncludingPersonLocalIdentifiers:minimumMatches:amongSocialGroupNodes:", v32, 2, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v31;
      v56[1] = 3221225472;
      v56[2] = __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke_2;
      v56[3] = &unk_1E8429A40;
      v57 = v10;
      v59 = &v67;
      v60 = a5;
      v58 = v27;
      objc_msgSend(v34, "enumerateIdentifiersAsCollectionsWithBlock:", v56);

    }
    objc_msgSend(v32, "unionSet:", v27);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v35 = v32;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v53 != v37)
            objc_enumerationMutation(v35);
          v39 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "doubleValue");
          v11[2](v11, v39, v41 / v68[3]);

        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
      }
      while (v36);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v42 = v30;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v71, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v49 != v44)
            objc_enumerationMutation(v42);
          v46 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
          if ((objc_msgSend(v35, "containsObject:", v46) & 1) == 0)
            v11[2](v11, v46, 0.0);
        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v71, 16);
      }
      while (v43);
    }

  }
  _Block_object_dispose(&v67, 8);

}

- (id)_socialGroupNodesIncludingPersonLocalIdentifiers:(id)a3 minimumMatches:(unint64_t)a4 amongSocialGroupNodes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v7 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __118__PGGraphRelationshipProcessor__socialGroupNodesIncludingPersonLocalIdentifiers_minimumMatches_amongSocialGroupNodes___block_invoke;
  v11[3] = &unk_1E8429A68;
  v12 = v7;
  v13 = a4;
  v8 = v7;
  objc_msgSend(a5, "filteredCollectionUsingBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_enumerateInferredFamilyMembersUsingBlock:(id)a3
{
  -[PGGraphRelationshipProcessor _enumerateInferredRelationshipMembersFromScores:cumulativeThreshold:minimumConfidence:usingBlock:](self, "_enumerateInferredRelationshipMembersFromScores:cumulativeThreshold:minimumConfidence:usingBlock:", self->_familyScoreByPersonLocalIdentifier, a3, 0.7, 0.05);
}

- (void)_enumerateInferredParentsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *parentScoreByPersonLocalIdentifier;
  uint64_t v6;
  NSMutableDictionary *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[9];
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];

  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__15451;
  v19[4] = __Block_byref_object_dispose__15452;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__15451;
  v17[4] = __Block_byref_object_dispose__15452;
  v18 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  parentScoreByPersonLocalIdentifier = self->_parentScoreByPersonLocalIdentifier;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PGGraphRelationshipProcessor__enumerateInferredParentsUsingBlock___block_invoke;
  v14[3] = &unk_1E8429A90;
  v14[4] = v16;
  v14[5] = v15;
  v14[6] = v17;
  v14[7] = v19;
  v14[8] = v21;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](parentScoreByPersonLocalIdentifier, "enumerateKeysAndObjectsUsingBlock:", v14);
  v7 = self->_parentScoreByPersonLocalIdentifier;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __68__PGGraphRelationshipProcessor__enumerateInferredParentsUsingBlock___block_invoke_2;
  v9[3] = &unk_1E8429AB8;
  v11 = v19;
  v12 = v17;
  v13 = v21;
  v8 = v4;
  v10 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

}

- (void)_enumerateInferredChildrenUsingBlock:(id)a3
{
  -[PGGraphRelationshipProcessor _enumerateInferredRelationshipMembersFromScores:cumulativeThreshold:minimumConfidence:usingBlock:](self, "_enumerateInferredRelationshipMembersFromScores:cumulativeThreshold:minimumConfidence:usingBlock:", self->_childScoreByPersonLocalIdentifier, a3, 0.7, 0.2);
}

- (void)_enumerateInferredFriendsUsingBlock:(id)a3
{
  -[PGGraphRelationshipProcessor _enumerateInferredRelationshipMembersFromScores:cumulativeThreshold:minimumConfidence:usingBlock:](self, "_enumerateInferredRelationshipMembersFromScores:cumulativeThreshold:minimumConfidence:usingBlock:", self->_friendScoreByPersonLocalIdentifier, a3, 0.5, 0.01);
}

- (void)_enumerateInferredCoworkersUsingBlock:(id)a3
{
  -[PGGraphRelationshipProcessor _enumerateInferredRelationshipMembersFromScores:cumulativeThreshold:minimumConfidence:usingBlock:](self, "_enumerateInferredRelationshipMembersFromScores:cumulativeThreshold:minimumConfidence:usingBlock:", self->_coworkerScoreByPersonLocalIdentifier, a3, 0.7, 0.2);
}

- (id)personLocalIdentifierForContactIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_personLocalIdentifierByContactIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)relationshipAnalyzerPropertiesForPersonLocalIdentifier:(id)a3
{
  id v4;
  void *v5;
  PGPersonRelationshipAnalyzerProperties *v6;

  v4 = a3;
  -[PGGraph personNodeForPersonLocalIdentifier:](self->_graph, "personNodeForPersonLocalIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[MANodeCollection containsNode:](self->_personNodes, "containsNode:", v5))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier, "objectForKeyedSubscript:", v4);
    v6 = (PGPersonRelationshipAnalyzerProperties *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = objc_alloc_init(PGPersonRelationshipAnalyzerProperties);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier, "setObject:forKeyedSubscript:", v6, v4);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)runOptions
{
  return self->_runOptions;
}

- (NSMutableArray)analyzersToRun
{
  return self->_analyzersToRun;
}

- (void)setAnalyzersToRun:(id)a3
{
  objc_storeStrong((id *)&self->_analyzersToRun, a3);
}

- (unint64_t)numberOfSignals
{
  return self->_numberOfSignals;
}

- (PGGraphPersonNodeCollection)personNodes
{
  return self->_personNodes;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (NSSet)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (NSDictionary)personLocalIdentifierByContactIdentifier
{
  return self->_personLocalIdentifierByContactIdentifier;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (NSMutableDictionary)relationshipAnalyzerPropertiesByPersonLocalIdentifier
{
  return self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier;
}

- (void)setRelationshipAnalyzerPropertiesByPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier, a3);
}

- (NSMutableDictionary)partnerScoreByPersonLocalIdentifier
{
  return self->_partnerScoreByPersonLocalIdentifier;
}

- (void)setPartnerScoreByPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_partnerScoreByPersonLocalIdentifier, a3);
}

- (NSMutableDictionary)parentScoreByPersonLocalIdentifier
{
  return self->_parentScoreByPersonLocalIdentifier;
}

- (void)setParentScoreByPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentScoreByPersonLocalIdentifier, a3);
}

- (NSMutableDictionary)childScoreByPersonLocalIdentifier
{
  return self->_childScoreByPersonLocalIdentifier;
}

- (void)setChildScoreByPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_childScoreByPersonLocalIdentifier, a3);
}

- (NSMutableDictionary)familyScoreByPersonLocalIdentifier
{
  return self->_familyScoreByPersonLocalIdentifier;
}

- (void)setFamilyScoreByPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_familyScoreByPersonLocalIdentifier, a3);
}

- (NSMutableDictionary)coworkerScoreByPersonLocalIdentifier
{
  return self->_coworkerScoreByPersonLocalIdentifier;
}

- (void)setCoworkerScoreByPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_coworkerScoreByPersonLocalIdentifier, a3);
}

- (NSMutableDictionary)friendScoreByPersonLocalIdentifier
{
  return self->_friendScoreByPersonLocalIdentifier;
}

- (void)setFriendScoreByPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_friendScoreByPersonLocalIdentifier, a3);
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_friendScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_coworkerScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_familyScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_childScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_parentScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifierByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_analyzersToRun, 0);
}

void __68__PGGraphRelationshipProcessor__enumerateInferredParentsUsingBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  v11 = a2;
  objc_msgSend(a3, "doubleValue");
  v7 = v6;
  v8 = *(double *)(*(_QWORD *)(a1[4] + 8) + 24);
  v9 = *(_QWORD *)(a1[5] + 8);
  if (v7 > v8)
  {
    *(double *)(v9 + 24) = v8;
    *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
    v10 = a1 + 7;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(*(_QWORD *)(a1[7] + 8) + 40));
LABEL_5:
    objc_storeStrong((id *)(*(_QWORD *)(*v10 + 8) + 40), a2);
    goto LABEL_6;
  }
  if (v7 > *(double *)(v9 + 24))
  {
    *(double *)(v9 + 24) = v7;
    v10 = a1 + 6;
    goto LABEL_5;
  }
LABEL_6:
  *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = v7 + *(double *)(*(_QWORD *)(a1[8] + 8) + 24);

}

void __68__PGGraphRelationshipProcessor__enumerateInferredParentsUsingBlock___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  __n128 v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (((objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)) & 1) != 0
     || objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)))
    && (objc_msgSend(v5, "doubleValue"),
        v6.n128_f64[0] = v6.n128_f64[0] / *(double *)(*(_QWORD *)(a1[7] + 8) + 24),
        v6.n128_f64[0] > 0.4))
  {
    (*(void (**)(__n128))(a1[4] + 16))(v6);
  }
  else
  {
    v6.n128_u64[0] = 0;
    (*(void (**)(__n128))(a1[4] + 16))(v6);
  }

}

BOOL __118__PGGraphRelationshipProcessor__socialGroupNodesIncludingPersonLocalIdentifiers_minimumMatches_amongSocialGroupNodes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "personNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "localIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "intersectSet:", *(_QWORD *)(a1 + 32));
    v4 = (unint64_t)objc_msgSend(v6, "count") >= *(_QWORD *)(a1 + 40);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  objc_msgSend(MEMORY[0x1E0D4B128], "cumulativeNormalDistributionForX:mu:sigma:", v5, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (v6 >= *(double *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  uint64_t v10;

  objc_msgSend(a3, "personNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke_3;
  v7[3] = &unk_1E8429A18;
  v8 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v9 = v6;
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v7);

}

void __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(a2, "localIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    if (v5 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(double *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }

}

void __68__PGGraphRelationshipProcessor__enumerateInferredPartnerUsingBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  double v6;
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "doubleValue");
  v7 = v6;
  if (v6 > *(double *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
  }
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v7 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);

}

void __68__PGGraphRelationshipProcessor__enumerateInferredPartnerUsingBlock___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  __n128 v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    && (objc_msgSend(v5, "doubleValue"),
        v6.n128_f64[0] = v6.n128_f64[0] / *(double *)(*(_QWORD *)(a1[6] + 8) + 24),
        v6.n128_f64[0] > 0.5))
  {
    (*(void (**)(__n128))(a1[4] + 16))(v6);
  }
  else
  {
    v6.n128_u64[0] = 0;
    (*(void (**)(__n128))(a1[4] + 16))(v6);
  }

}

void __48__PGGraphRelationshipProcessor__aggregateScores__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  v5 = a3;
  objc_msgSend(v5, "partnerScore");
  if (v6 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "partnerScoreByPersonLocalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v24);

  }
  objc_msgSend(v5, "parentScore");
  if (v9 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parentScoreByPersonLocalIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v24);

  }
  objc_msgSend(v5, "childScore");
  if (v12 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "childScoreByPersonLocalIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v24);

  }
  objc_msgSend(v5, "familyScore");
  if (v15 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "familyScoreByPersonLocalIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v24);

  }
  objc_msgSend(v5, "coworkerScore");
  if (v18 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "coworkerScoreByPersonLocalIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v24);

  }
  objc_msgSend(v5, "friendScore");
  if (v21 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "friendScoreByPersonLocalIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

  }
}

void __104__PGGraphRelationshipProcessor_enumerateHighRecallInferredRelationshipsExcludingPersonNodes_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "relationshipAnalyzerPropertiesByPersonLocalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isInferredHighRecallChild"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (objc_msgSend(v6, "isInferredHighRecallHouseholdMember"))
    {
      v7 = v9;
      v8 = 17;
    }
    else
    {
      v7 = v9;
      v8 = 2;
    }
    (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, v8, a3);
  }

}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "relationshipAnalyzerPropertiesByPersonLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "edgeProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a3);

}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

  objc_msgSend(*(id *)(a1 + 40), "relationshipAnalyzerPropertiesByPersonLocalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "edgeProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(a3);

}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_3(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  if (v7 <= a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "relationshipAnalyzerPropertiesByPersonLocalIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "edgeProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(a3);

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Person %@ is inferred family, filtering out of friends", (uint8_t *)&v13, 0xCu);
    }

  }
}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_164(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "relationshipAnalyzerPropertiesByPersonLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "edgeProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a3);

}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_2_165(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "relationshipAnalyzerPropertiesByPersonLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "edgeProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a3);

}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_3_166(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "relationshipAnalyzerPropertiesByPersonLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "edgeProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a3);

}

void __91__PGGraphRelationshipProcessor_runRelationshipAnalysisWithLoggingConnection_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 72))
    && (*(double *)(v7 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                               + 24)) != 0))
  {
    *a2 = 1;
  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(a1 + 80) + *(double *)(a1 + 88) * a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *a2;
  }
}

@end
