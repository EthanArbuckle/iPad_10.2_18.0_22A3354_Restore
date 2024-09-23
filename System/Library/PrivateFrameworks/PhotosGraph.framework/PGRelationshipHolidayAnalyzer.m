@implementation PGRelationshipHolidayAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipHolidayAnalyzer");
}

- (PGRelationshipHolidayAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipHolidayAnalyzer *v5;
  PGRelationshipHolidayAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipHolidayAnalyzer;
  v5 = -[PGRelationshipHolidayAnalyzer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_processor, v4);

  return v6;
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  void (**v4)(void *, _BYTE *, double);
  double v5;
  double v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double Current;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  uint8_t v31[128];
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (!v4 || (v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "momentNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGRelationshipHolidayAnalyzer _familyHolidayMomentsFromMomentNodes:inGraph:](self, "_familyHolidayMomentsFromMomentNodes:inGraph:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count");
    if (v11)
    {
      v12 = v11;
      objc_msgSend(WeakRetained, "personNodes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v10, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v5 >= 0.01)
        {
          v30 = 0;
          v4[2](v4, &v30, 0.5);
          if (v30)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v33 = 46;
              v34 = 2080;
              v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipHolidayAnalyzer.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

LABEL_30:
            goto LABEL_31;
          }
          v5 = Current;
        }
      }
      v25 = v10;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            v22 = objc_msgSend(v16, "countForObject:", v21);
            objc_msgSend(v21, "localIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
              objc_msgSend(v24, "registerAttendance:amongFamilyHolidays:", v22, v12);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v18);
      }

      v10 = v25;
    }
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 1.0);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v33 = 58;
            v34 = 2080;
            v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipHolidayAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_30;
  }
  v30 = 0;
  v4[2](v4, &v30, 0.0);
  if (!v30)
  {
    v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v33 = 34;
    v34 = 2080;
    v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipHolidayAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_31:

}

- (id)_familyHolidayMomentsFromMomentNodes:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  +[PGGraphHolidayNodeCollection holidayNodesWithCategory:inGraph:](PGGraphHolidayNodeCollection, "holidayNodesWithCategory:inGraph:", 2, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "celebratingMomentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionByIntersecting:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

@end
