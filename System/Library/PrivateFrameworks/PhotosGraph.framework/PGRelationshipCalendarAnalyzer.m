@implementation PGRelationshipCalendarAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipCalendarAnalyzer");
}

- (PGRelationshipCalendarAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipCalendarAnalyzer *v5;
  PGRelationshipCalendarAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipCalendarAnalyzer;
  v5 = -[PGRelationshipCalendarAnalyzer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_processor, v4);

  return v6;
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  id v4;
  void (**v5)(void *, _BYTE *, double);
  double v6;
  double v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double Current;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(void *, _BYTE *, double);
  id v44;
  void *v45;
  uint64_t v46;
  id obj;
  void *v48;
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
  char v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  int v66;
  __int16 v67;
  const char *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(void *, _BYTE *, double))_Block_copy(v4);
  v6 = 0.0;
  if (!v5 || (v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "serviceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingMonths:toDate:", -2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = WeakRetained;
    objc_msgSend(WeakRetained, "contactIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v9;
    objc_msgSend(v9, "workCalendarEventsMatchingContactIdentifiers:fromUniversalDate:toUniversalDate:", v13, v11, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(v14, "count");
    if (v5)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v6 >= 0.01)
      {
        v61 = 0;
        v5[2](v5, &v61, 0.7);
        if (v61)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v66 = 50;
            v67 = 2080;
            v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipCalendarAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = v45;
LABEL_46:

          goto LABEL_47;
        }
        v6 = Current;
      }
    }
    v41 = v11;
    v42 = v10;
    v43 = v5;
    v44 = v4;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v40 = v14;
    obj = v14;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v58 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v21, "attendees");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "personsFromEventParticipants:excludeCurrentUser:", v23, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v54;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v54 != v27)
                  objc_enumerationMutation(v24);
                objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
            }
            while (v26);
          }

          objc_autoreleasePoolPop(v22);
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      }
      while (v18);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v29 = v12;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    v16 = v45;
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v50 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
          v35 = objc_msgSend(v29, "countForObject:", v34);
          objc_msgSend(v34, "CNIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            objc_msgSend(v45, "personLocalIdentifierForContactIdentifier:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v37, "length"))
            {
              objc_msgSend(v45, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v38;
              if (v38)
                objc_msgSend(v38, "registerAttendance:amongWorkCalendarEvents:", v35, v46);

            }
          }

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
      }
      while (v31);
    }

    v5 = v43;
    v4 = v44;
    v11 = v41;
    v10 = v42;
    v14 = v40;
    if (v43)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v61 = 0;
        v43[2](v43, &v61, 1.0);
        if (v61)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v66 = 79;
            v67 = 2080;
            v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipCalendarAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_46;
  }
  v61 = 0;
  v5[2](v5, &v61, 0.0);
  if (!v61)
  {
    v6 = v7;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v66 = 39;
    v67 = 2080;
    v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipCalendarAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_47:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

@end
