@implementation PGShareBackLocationSource

+ (id)suggesterInputsByDateIntervalForInputs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v3;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v32)
  {
    v30 = v4;
    v31 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v7, "creationDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v7, "location");
          v9 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeZone");
          v10 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v9;
          v36 = v8;
          v33 = (void *)v10;
          v34 = v7;
          if (v10)
          {
            objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:", v8, v10);
            v11 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v9)
              objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:atLocation:", v8, v9);
            else
              objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:", v8);
            v11 = objc_claimAutoreleasedReturnValue();
          }
          v12 = (void *)v11;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v4, "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v38;
LABEL_15:
            v17 = 0;
            while (1)
            {
              if (*(_QWORD *)v38 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
              objc_msgSend(v18, "startDate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v5, "isDate:inSameDayAsDate:", v12, v19);

              if ((v20 & 1) != 0)
                break;
              if (v15 == ++v17)
              {
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                if (v15)
                  goto LABEL_15;
                goto LABEL_21;
              }
            }
            v21 = v18;

            if (!v21)
              goto LABEL_24;
            objc_msgSend(v21, "startDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "earlierDate:", v12);
            v23 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "endDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "laterDate:", v12);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = v30;
            objc_msgSend(v30, "objectForKeyedSubscript:", v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "removeObjectForKey:", v21);

          }
          else
          {
LABEL_21:

LABEL_24:
            v23 = v12;
            v26 = (void *)objc_opt_new();
            v25 = v23;
            v4 = v30;
          }
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v23, v25);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, v27);
          objc_msgSend(v26, "addObject:", v34);

          v8 = v36;
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v32);
  }

  return v4;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  return 1;
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  id v20;
  BOOL v21;
  BOOL v22;
  __int16 v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  PGShareBackSuggesterResult *v28;
  PGShareBackSuggesterResult *v29;
  void *v30;
  id v32;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  char v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  __int16 v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v37 = a4;
  v32 = a5;
  -[PGShareBackSource loggingConnection](self, "loggingConnection");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v41 = (void *)objc_opt_new();
  if (!objc_msgSend(v37, "count"))
    goto LABEL_32;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v33;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v60;
LABEL_4:
    v38 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v35)
        objc_enumerationMutation(obj);
      v43 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v38);
      objc_msgSend(v43, "location");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v39 = v37;
      v9 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
      if (v9)
      {
        v42 = *(_QWORD *)v56;
LABEL_9:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v56 != v42)
            objc_enumerationMutation(v39);
          v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v10);
          objc_msgSend(v11, "collection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "urbanRoiNodes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEmpty"))
          {
            objc_msgSend(v12, "addressNodes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "cityNodes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "momentNodes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "urbanRoiNodes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEmpty");

            v19 = v18 ^ 1;
          }
          else
          {
            v19 = 1;
          }

          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __81__PGShareBackLocationSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke;
          v45[3] = &unk_1E84350D0;
          v51 = &v67;
          v20 = v44;
          v52 = &v63;
          v46 = v20;
          v47 = v43;
          v54 = v19;
          v48 = v40;
          v49 = v11;
          v53 = &v71;
          v50 = v41;
          objc_msgSend(v11, "enumerateAddressEdgesAndNodesUsingBlock:", v45);
          v21 = *((unsigned __int16 *)v72 + 12) == 16;

          if (v21)
            break;
          if (v9 == ++v10)
          {
            v9 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
            if (v9)
              goto LABEL_9;
            break;
          }
        }
      }

      v22 = *((unsigned __int16 *)v72 + 12) == 16;
      if (v22)
        break;
      if (++v38 == v36)
      {
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
        if (v36)
          goto LABEL_4;
        break;
      }
    }
  }

  if (!*((_BYTE *)v68 + 24))
  {
    *((_WORD *)v72 + 12) = 2;
    objc_msgSend(v41, "unionSet:", v37);
    v24 = v40;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      PHAssetMediaAnalysisSyndicationProcessingValueDescription();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412547;
      v76 = v25;
      v77 = 2113;
      v78 = v41;
      _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEFAULT, "[PGShareBackLocationSource] Moment nodes in interval has no location, processingValue: %@, possible contributions: %{private}@", buf, 0x16u);

    }
    goto LABEL_31;
  }
  if (*((_BYTE *)v64 + 24))
  {
    if (objc_msgSend(v41, "count"))
      goto LABEL_29;
    v23 = 8;
  }
  else
  {
    v23 = 4;
  }
  *((_WORD *)v72 + 12) = v23;
LABEL_29:
  v26 = v40;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    PHAssetMediaAnalysisSyndicationProcessingValueDescription();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412547;
    v76 = v27;
    v77 = 2113;
    v78 = v41;
    _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_DEFAULT, "[PGShareBackLocationSource] Moment nodes in interval has location, processingValue: %@, possible contributions: %{private}@", buf, 0x16u);

  }
LABEL_31:

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
LABEL_32:
  if (*((_WORD *)v72 + 12))
  {
    v28 = [PGShareBackSuggesterResult alloc];
    v29 = -[PGShareBackSuggesterResult initWithInputs:processingValue:momentNodes:](v28, "initWithInputs:processingValue:momentNodes:", v33, *((unsigned __int16 *)v72 + 12), v41);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = (void *)MEMORY[0x1E0C9AA60];
  }

  _Block_object_dispose(&v71, 8);
  return v30;
}

void __81__PGShareBackLocationSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  char v23;
  uint64_t v24;
  double v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *log;
  _BYTE *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  if (*(_QWORD *)(a1 + 32))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "universalStartDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "universalEndDate");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (!v10 || !v11)
      goto LABEL_23;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v10, v11);
    if (objc_msgSend(v13, "containsDate:", v9))
    {

      v14 = 0.0;
    }
    else
    {
      objc_msgSend(v9, "timeIntervalSinceDate:", v10);
      v16 = fabs(v15);
      objc_msgSend(v9, "timeIntervalSinceDate:", v12);
      v14 = fmin(v16, fabs(v17));

      if (v14 >= 7200.0)
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    objc_msgSend(v8, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "distanceFromLocation:", v18);
      v20 = v19;
    }
    else
    {
      v20 = 1.79769313e308;
    }
    objc_msgSend(v7, "photoLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "distanceFromLocation:", v21);
      v20 = fmin(v20, v22);
    }
    v23 = objc_msgSend(MEMORY[0x1E0D71860], "locationIsCoarse:", *(_QWORD *)(a1 + 32));
    v24 = 0x408F400000000000;
    v25 = 1800.0;
    if (*(_BYTE *)(a1 + 96) && (v23 & 1) == 0 && (objc_msgSend(v8, "isCoarse") & 1) == 0)
    {
      if (v20 > 1000.0)
      {
LABEL_22:

        goto LABEL_23;
      }
      v24 = 0x405F400000000000;
      v25 = 300.0;
    }
    if (v20 <= 125.0 || v20 / 1.4 <= v25)
    {
      v31 = a4;
      v26 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v29 = *(void **)(a1 + 56);
        log = v26;
        objc_msgSend(v29, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(unsigned __int8 *)(a1 + 96);
        *(_DWORD *)buf = 138413826;
        v33 = v27;
        v34 = 2048;
        v35 = v20;
        v36 = 2048;
        v37 = v24;
        v38 = 1024;
        v39 = v28;
        v40 = 2048;
        v41 = v20 / 1.4;
        v42 = 2048;
        v43 = v14;
        v44 = 2048;
        v45 = v25;
        _os_log_impl(&dword_1CA237000, log, OS_LOG_TYPE_INFO, "[PGShareBackLocationSource] Moment node %@ matched with distance %.0f location threshold %.0f (urban: %d), timeToWalkToDestination %.0f, timeDistance %.0f, walking threshold %.0f", buf, 0x44u);

      }
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 16;
      objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 56));
      *v31 = 1;
    }
    goto LABEL_22;
  }
LABEL_24:

}

@end
