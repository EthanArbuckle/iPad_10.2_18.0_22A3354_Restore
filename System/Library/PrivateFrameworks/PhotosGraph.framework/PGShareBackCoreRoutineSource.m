@implementation PGShareBackCoreRoutineSource

- (PGShareBackCoreRoutineSource)initWithRoutineService:(id)a3 loggingConnection:(id)a4
{
  id v7;
  PGShareBackCoreRoutineSource *v8;
  PGShareBackCoreRoutineSource *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGShareBackCoreRoutineSource;
  v8 = -[PGShareBackSource initWithLoggingConnection:](&v11, sel_initWithLoggingConnection_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_routineService, a3);

  return v9;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  return 1;
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int16 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  PGShareBackSuggesterResult *v38;
  void *v39;
  PGShareBackSuggesterResult *v40;
  void *v41;
  PGShareBackSuggesterResult *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id obj;
  NSObject *oslog;
  PGShareBackCoreRoutineSource *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v54 = self;
  -[PGShareBackSource loggingConnection](self, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  oslog = v10;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v64;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v64 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v16, "asset");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "mediaAnalysisProperties");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "syndicationProcessingValue");

          if ((v20 & 0x400) != 0)
          {
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v68 = v16;
              _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "[PGShareBackCoreRoutineSource] Suggester input %{private}@ previously matched with CoreRoutine visit", buf, 0xCu);
            }
            v38 = [PGShareBackSuggesterResult alloc];
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[PGShareBackSuggesterResult initWithInputs:processingValue:momentNodes:](v38, "initWithInputs:processingValue:momentNodes:", v11, 1024, v39);

            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_46;
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      if (v13)
        continue;
      break;
    }
  }

  if ((-[CLSRoutineService hasLocationsOfInterestInformation](v54->_routineService, "hasLocationsOfInterestInformation") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_42554);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count"))
    {
      +[PGShareBackSuggesterInput universalDateIntervalForSuggesterInputs:withTimeIntervalPadding:](PGShareBackSuggesterInput, "universalDateIntervalForSuggesterInputs:withTimeIntervalPadding:", v11, 7200.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLSRoutineService locationOfInterestVisitsInDateInterval:](v54->_routineService, "locationOfInterestVisitsInDateInterval:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "count"))
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v25 = v24;
        v45 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
        if (v45)
        {
          v26 = *(_QWORD *)v60;
          v50 = v22;
          v51 = v9;
          v48 = v24;
          v49 = v23;
          v47 = v25;
          v44 = *(_QWORD *)v60;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v60 != v26)
                objc_enumerationMutation(v25);
              v46 = v27;
              v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v27);
              v55 = 0u;
              v56 = 0u;
              v57 = 0u;
              v58 = 0u;
              obj = v22;
              v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v56;
                while (2)
                {
                  for (j = 0; j != v30; ++j)
                  {
                    if (*(_QWORD *)v56 != v31)
                      objc_enumerationMutation(obj);
                    v33 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                    objc_msgSend(v28, "locationOfInterest");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "location");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "visitInterval");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = -[PGShareBackCoreRoutineSource suggesterInput:isCloseEnoughToLocation:inDateInterval:](v54, "suggesterInput:isCloseEnoughToLocation:inDateInterval:", v33, v35, v36);

                    if (v37)
                    {
                      v23 = v49;
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138478083;
                        v68 = v33;
                        v69 = 2113;
                        v70 = v28;
                        _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "[PGShareBackCoreRoutineSource] Suggester input %{private}@ matched with CoreRoutine visit %{private}@", buf, 0x16u);
                      }

                      v9 = v51;
                      v42 = -[PGShareBackSuggesterResult initWithInputs:processingValue:momentNodes:]([PGShareBackSuggesterResult alloc], "initWithInputs:processingValue:momentNodes:", v11, 1024, v51);
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v42);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();

                      v22 = v50;
                      v24 = v48;
                      goto LABEL_44;
                    }
                  }
                  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
                  if (v30)
                    continue;
                  break;
                }
              }

              v27 = v46 + 1;
              v22 = v50;
              v9 = v51;
              v24 = v48;
              v23 = v49;
              v25 = v47;
              v26 = v44;
            }
            while (v46 + 1 != v45);
            v45 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
          }
          while (v45);
        }

      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v23;
        _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "[PGShareBackCoreRoutineSource] Can't find core routine visits in date interval: %@", buf, 0xCu);
      }
      v41 = (void *)MEMORY[0x1E0C9AA60];
LABEL_44:

    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEBUG, "[PGShareBackCoreRoutineSource] No inputs with valid location", buf, 2u);
      }
      v41 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "[PGShareBackCoreRoutineSource] Can't find any recent core routine visits", buf, 2u);
    }
    v41 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_46:

  return v41;
}

- (BOOL)suggesterInput:(id)a3 isCloseEnoughToLocation:(id)a4 inDateInterval:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  int v21;
  double v22;
  BOOL v23;
  double v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v10);
  v14 = fabs(v13);
  objc_msgSend(v12, "timeIntervalSinceDate:", v11);
  v16 = fmin(v14, fabs(v15));
  v17 = objc_msgSend(v9, "containsDate:", v12);

  if ((v17 & 1) == 0 && v16 > 7200.0)
    goto LABEL_6;
  objc_msgSend(v7, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "distanceFromLocation:", v18);
  v20 = v19;

  v21 = objc_msgSend(MEMORY[0x1E0D71860], "locationIsCoarse:", v8);
  v22 = 125.0;
  if (v21)
    v22 = 250.0;
  if (v20 <= v22)
  {
    v24 = v16 / 3600.0;
    if (v16 < 300.0)
      v24 = 2.0;
    v23 = v20 * 0.001 / v24 <= 7.0;
  }
  else
  {
LABEL_6:
    v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineService, 0);
}

BOOL __84__PGShareBackCoreRoutineSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
