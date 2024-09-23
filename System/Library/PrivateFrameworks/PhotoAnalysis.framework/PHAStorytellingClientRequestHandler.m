@implementation PHAStorytellingClientRequestHandler

- (void)requestGraphServiceStatusWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, _QWORD))a4;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "libraryAnalysisState");
  if (v8 == 1)
  {
    objc_msgSend(v7, "appendString:", CFSTR("Library analysis: Running"));
    objc_msgSend(v6, "rebuildProgress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fractionCompleted");
    v11 = v10 * 100.0;

    objc_msgSend(v7, "appendFormat:", CFSTR("\nProgress: %0.1f%%"), fmin(v11, 100.0));
  }
  else if (!v8)
  {
    objc_msgSend(v7, "appendString:", CFSTR("Library analysis: Not Running"));
  }
  v20 = 0;
  v12 = objc_msgSend(v6, "isReadyWithError:", &v20);
  v13 = v20;
  if ((_DWORD)v12)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nReady: %@"), v14);
  if ((v12 & 1) == 0)
  {
    objc_msgSend(v13, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(", %@"), v15);

  }
  if (objc_msgSend(v6, "isBusy"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nBusy: %@"), v16);
  v17 = *MEMORY[0x1E0D720C8];
  v21[0] = *MEMORY[0x1E0D720C0];
  v21[1] = v17;
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v19, 0);
}

- (void)requestGraphServiceStatisticsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void (**v29)(id, _QWORD, void *);
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[10];

  v37[8] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v35);
  v11 = v35;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("types"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "statisticsWithTypeStrings:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && objc_msgSend(v14, "length"))
    {
      v26 = v14;
      v27 = v12;
      v28 = v11;
      v29 = v8;
      v30 = v7;
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendFormat:", CFSTR("### PhotoAnalysis ###\n\n"));
      objc_msgSend(v15, "appendFormat:", CFSTR("Defaults Writes Status:\n"));
      v37[0] = CFSTR("PhotoAnalysisGraphBackgroundActivitiesDisabled");
      v37[1] = CFSTR("PhotoAnalysisShouldTriggerNotificationEveryDay");
      v37[2] = CFSTR("PhotoAnalysisShouldOverrideUserIsActivelyUsingPhotos");
      v37[3] = CFSTR("PhotoAnalysisShouldForceTriggerNotification");
      v16 = *MEMORY[0x1E0D764A8];
      v37[4] = CFSTR("PhotoAnalysisNotificationSimulationDelayOverride");
      v37[5] = v16;
      v17 = *MEMORY[0x1E0D764B0];
      v37[6] = *MEMORY[0x1E0D764B8];
      v37[7] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 8);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "valueForKey:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "appendFormat:", CFSTR("\t%@: %@\n"), v23, v25);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v20);
      }

      objc_msgSend(v15, "appendFormat:", CFSTR("\n\n### PhotoGraph ###\n\n"));
      v14 = v26;
      objc_msgSend(v15, "appendString:", v26);
      v8 = v29;
      ((void (**)(id, void *, void *))v29)[2](v29, v15, 0);

      v7 = v30;
      v11 = v28;
      v12 = v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 2, CFSTR("invalid type options to graph statistics command"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v15);
    }

  }
  else
  {
    v8[2](v8, 0, v11);
  }

}

- (void)requestInvalidateServiceTransientCachesWithContext:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[8];
  id v13;

  v5 = a4;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v6, "isReadyWithError:", &v13);
  v8 = v13;
  if ((v7 & 1) != 0)
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_INFO, "Invalidate Transient Caches", buf, 2u);
    }

    objc_msgSend(v6, "invalidateTransientCaches");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __103__PHAStorytellingClientRequestHandler_Graph__requestInvalidateServiceTransientCachesWithContext_reply___block_invoke;
    v10[3] = &unk_1E851F458;
    v11 = v5;
    objc_msgSend(v6, "waitUntilFinishedUsingBlock:", v10);

  }
  else
  {
    (*((void (**)(id, id))v5 + 2))(v5, v8);
  }

}

- (void)requestInvalidateServicePersistentCachesWithContext:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[8];
  id v13;

  v5 = a4;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v6, "isReadyWithError:", &v13);
  v8 = v13;
  if ((v7 & 1) != 0)
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_INFO, "Invalidate Persistent Caches", buf, 2u);
    }

    objc_msgSend(v6, "invalidatePersistentCaches");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __104__PHAStorytellingClientRequestHandler_Graph__requestInvalidateServicePersistentCachesWithContext_reply___block_invoke;
    v10[3] = &unk_1E851F458;
    v11 = v5;
    objc_msgSend(v6, "waitUntilFinishedUsingBlock:", v10);

  }
  else
  {
    (*((void (**)(id, id))v5 + 2))(v5, v8);
  }

}

- (void)requestGraphServicePerformsQueryWithContext:(id)a3 query:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v14);
  v11 = v14;
  if ((v10 & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __102__PHAStorytellingClientRequestHandler_Graph__requestGraphServicePerformsQueryWithContext_query_reply___block_invoke;
    v12[3] = &unk_1E8520178;
    v13 = v8;
    objc_msgSend(v9, "matchWithVisualFormat:usingBlock:", v7, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v11);
  }

}

- (void)requestGraphRebuildFractionCompletedWithContext:(id)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(id, id, _QWORD);

  v12 = (void (**)(id, id, _QWORD))a4;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "libraryAnalysisState");
  if (v6 == 1)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "rebuildProgress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fractionCompleted");
    objc_msgSend(v10, "numberWithDouble:");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (v6)
  {
    v9 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "isReady");
    v8 = &unk_1E85402F0;
    if (v7)
      v8 = &unk_1E85402E0;
    v9 = v8;
  }
  v12[2](v12, v9, 0);

}

- (void)requestExportGraphServiceForPurpose:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, id);
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a5;
  if (v8)
  {
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v10 = objc_msgSend(v9, "isReadyWithError:", &v18);
    v11 = v18;
    if ((v10 & 1) == 0)
    {
      v8[2](v8, 0, v11);
LABEL_16:

      goto LABEL_17;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D72050]))
    {
      objc_msgSend(v9, "snapshotOuputFilePathURLForKey:", *MEMORY[0x1E0D764E0]);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        if ((objc_msgSend(v9, "copyGraphToURL:", v12) & 1) == 0)
        {
LABEL_6:
          objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 10);
          v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
          v15 = (void *)v14;
          v8[2](v8, 0, (id)v14);
          goto LABEL_15;
        }
LABEL_11:
        objc_msgSend(v13, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, id))v8)[2](v8, v15, 0);
LABEL_15:

        goto LABEL_16;
      }
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("Graph URL creation was not successful."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 9, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("snapshot")))
    {
      objc_msgSend(v9, "snapshotOuputFilePathURLForKey:", *MEMORY[0x1E0D764F0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_13;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v9, "defaultGraphExportFullPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fileURLWithPath:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_13;
    }
    if (!objc_msgSend(v9, "saveGraphToURL:", v13))
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_17:

}

- (void)requestGraphInferencesSummaryWithDateInterval:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v16);
  v11 = v16;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v15 = v11;
    objc_msgSend(v9, "summaryOfInferencesPerMomentInDateInterval:error:", v7, &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;

    v8[2](v8, v13, v14);
    v12 = v14;
  }
  else
  {
    v8[2](v8, 0, v11);
  }

}

- (void)requestGraphInferencesSummaryWithMomentLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v16);
  v11 = v16;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v15 = v11;
    objc_msgSend(v9, "summaryOfInferencesPerMomentByLocalIdentifiers:error:", v7, &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;

    v8[2](v8, v13, v14);
    v12 = v14;
  }
  else
  {
    v8[2](v8, 0, v11);
  }

}

- (void)requestGraphMomentLocalIdentifiersWithDateInterval:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v16);
  v11 = v16;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v15 = v11;
    objc_msgSend(v9, "momentLocalIdentifiersInDateInterval:error:", v7, &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;

    v8[2](v8, v13, v14);
    v12 = v14;
  }
  else
  {
    v8[2](v8, 0, v11);
  }

}

- (void)notifyWhenGraphReadyWithCoalescingIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerCoalescingBlockWhenGraphAnalysisFinishes:", v6);

}

uint64_t __102__PHAStorytellingClientRequestHandler_Graph__requestGraphServicePerformsQueryWithContext_query_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __104__PHAStorytellingClientRequestHandler_Graph__requestInvalidateServicePersistentCachesWithContext_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__PHAStorytellingClientRequestHandler_Graph__requestInvalidateServiceTransientCachesWithContext_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestDiscoveryFeedItemsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v38);
  v11 = v38;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v33 = v11;
    v13 = objc_alloc(MEMORY[0x1E0D75CE0]);
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D72078]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithDictionaryRepresentation:", v14);

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D72080]);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0D75CE8]);
    objc_msgSend(v9, "workingContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v16;
    v32 = (void *)v15;
    v19 = (void *)objc_msgSend(v17, "initWithOptions:workingContext:state:", v15, v18, v16);

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D72070]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedIntegerValue");

    objc_msgSend(v19, "additionalItemsWithTargetCount:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v26);
    }

    objc_msgSend(v19, "currentState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, v23, v30, 0);
    v12 = v33;
  }
  else
  {
    ((void (**)(id, void *, void *, id))v8)[2](v8, 0, (void *)MEMORY[0x1E0C9AA70], v11);
  }

}

- (void)requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:(id)a3 context:(id)a4 reply:(id)a5
{
  void (**v7)(id, uint64_t, id);
  id v8;
  PHAUserFeedbackUpdater *v9;
  void *v10;
  PHAUserFeedbackUpdater *v11;
  uint64_t v12;
  id v13;
  id v14;

  v7 = (void (**)(id, uint64_t, id))a5;
  v8 = a3;
  v9 = [PHAUserFeedbackUpdater alloc];
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PHAUserFeedbackUpdater initWithGraphManager:](v9, "initWithGraphManager:", v10);

  v14 = 0;
  v12 = -[PHAUserFeedbackUpdater updateFeatureContentWithPersonUUIDs:error:](v11, "updateFeatureContentWithPersonUUIDs:error:", v8, &v14);

  v13 = v14;
  v7[2](v7, v12, v13);

}

- (void)requestGraphModelResultWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v19);
  v11 = v19;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D720B0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D720A8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D720A0])
      && objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D720B8]))
    {
      v18 = 0;
      objc_msgSend(v9, "requestGraleSemanticLabelPropagationWithError:", &v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18;
      v8[2](v8, v14, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported request - modelIdentifier: %@, inferenceKind: %@"), v12, v13);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAStorytellingClientRequestHandler_MLModel"), 0, v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v8[2](v8, 0, v14);
    }

  }
  else
  {
    v8[2](v8, 0, v11);
  }

}

- (void)requestSortedArrayOfPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v14);
  v11 = v14;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayForPersonLocalIdentifiers:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestAllSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, _QWORD);
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, _QWORD))a6;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v13 = objc_msgSend(v12, "isReadyWithError:", &v16);
  v14 = v16;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v12, "allSocialGroupsForMemberLocalIdentifier:options:", v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v15, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v11)[2](v11, 0, v14);
  }

}

- (void)requestSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v14);
  v11 = v14;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "socialGroupsOverlappingMemberLocalIdentifiers:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestAssetCollectionsForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v15);
  v11 = v15;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetCollectionsForPersonLocalIdentifiers:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "valueForKey:", CFSTR("localIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v14, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestAssetsForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v14);
  v11 = v14;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetIdentifiersForPersonLocalIdentifiers:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestInferredMePersonLocalIdentifierWithErrorForContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  char v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  id v19;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v9 = objc_msgSend(v8, "isReadyWithError:", &v19);
  v10 = v19;
  if ((v9 & 1) != 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    objc_msgSend(v8, "workingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __111__PHAStorytellingClientRequestHandler_Person__requestInferredMePersonLocalIdentifierWithErrorForContext_reply___block_invoke;
    v12[3] = &unk_1E851F5C0;
    v12[4] = &v13;
    objc_msgSend(v11, "performSynchronousConcurrentGraphReadUsingBlock:", v12);

    v7[2](v7, v14[5], 0);
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v10);
  }

}

- (void)requestRelatedMomentsForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v14);
  v11 = v14;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetCollectionsForPersonLocalIdentifiers:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

void __111__PHAStorytellingClientRequestHandler_Person__requestInferredMePersonLocalIdentifierWithErrorForContext_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "graph");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "meNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inferredPersonNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)informationDictionaryForAsset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("PHRelatedAssetIdentifierKey"));
  return v5;
}

- (void)requestCuratedAssetForAssetCollectionWithLocalIdentifier:(id)a3 referenceAssetLocalIdentifier:(id)a4 options:(id)a5 context:(id)a6 reply:(id)a7
{
  char *v11;
  char *v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  void *v51;
  void *v52;
  id v53;
  void (**v54)(id, _QWORD, void *);
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint32_t denom;
  uint32_t numer;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  id v65;
  id v66;
  char *v67;
  os_signpost_id_t spid;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  void *v72;
  NSObject *v73;
  void *v74;
  mach_timebase_info info;
  char *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  double v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v11 = (char *)a3;
  v12 = (char *)a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a7;
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_generate(v15);
  info = 0;
  mach_timebase_info(&info);
  v17 = v15;
  v18 = v17;
  v71 = v16 - 1;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CuratedKeyAssetRequest", ", buf, 2u);
  }
  spid = v16;

  v70 = mach_absolute_time();
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v13, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v81 = v11;
    v82 = 2112;
    v83 = *(double *)&v12;
    v84 = 2112;
    v85 = v21;
    _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_INFO, "Curated Key Asset Request: collectionID:%@ referenceAssetID:%@ options:%@", buf, 0x20u);

  }
  v73 = v18;

  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PHPhotosGraphOptionPersonLocalIdentifiersToFocus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v22;
  v72 = v23;
  if (objc_msgSend(v23, "count") != 1)
  {
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v11, v13, v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
      v36 = (char *)objc_claimAutoreleasedReturnValue();
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = v18;
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
LABEL_46:

        v14[2](v14, 0, v36);
        goto LABEL_47;
      }
      *(_DWORD *)buf = 138412290;
      v81 = v11;
      v48 = "Curated Key Asset Error: Failed to lookup collectionID:%@";
      v49 = v46;
      v50 = 12;
LABEL_49:
      _os_log_error_impl(&dword_1CAC16000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
      goto LABEL_46;
    }
    if (v12)
    {
      v66 = v13;
      v38 = (void *)MEMORY[0x1E0CD1390];
      v76 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v74;
      objc_msgSend(v74, "librarySpecificFetchOptions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "fetchAssetsWithLocalIdentifiers:options:", v39, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "firstObject");
      v43 = objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v12;
          _os_log_error_impl(&dword_1CAC16000, v44, OS_LOG_TYPE_ERROR, "Curated Key Asset Error: Failed to lookup referenceAssetID:%@", buf, 0xCu);
        }

      }
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v45 = objc_claimAutoreleasedReturnValue();
      v13 = v66;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v81 = v11;
        v82 = 2112;
        v83 = *(double *)&v43;
        _os_log_impl(&dword_1CAC16000, v45, OS_LOG_TYPE_INFO, "Curated Key Asset Request: referenceAssetID:%@ is referenceAsset:%@", buf, 0x16u);
      }

    }
    else
    {
      v43 = 0;
      v40 = v74;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PHPhotosGraphOptionPersonLocalIdentifiersToFocus"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v51;
    v67 = v11;
    v69 = v12;
    v64 = (void *)v43;
    if (v51 && objc_msgSend(v51, "count"))
    {
      v27 = objc_alloc_init(MEMORY[0x1E0D76078]);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v30);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setReferencePersonLocalIdentifiers:", v52);

      objc_msgSend(v27, "setFocusOnPeople:", 1);
      objc_msgSend(v27, "setComplete:", 1);
    }
    else
    {
      if (v43)
        v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D76078]), "initWithReferenceAsset:", v43);
      else
        v53 = objc_alloc_init(MEMORY[0x1E0D76078]);
      v27 = v53;
    }
    objc_msgSend(v27, "setAllowContextualTrip:", 0);
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v40);
    if (objc_msgSend(v31, "isReady"))
    {
      objc_msgSend(v31, "curatedKeyAssetForAssetCollection:curatedAssetCollection:options:curationContext:", v24, 0, v27, v34);
      v36 = (char *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v31, "curationManager");
      v54 = v14;
      v55 = v13;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "curatedKeyAssetForAssetCollection:curatedAssetCollection:options:criteria:curationContext:", v24, 0, v27, 0, v34);
      v36 = (char *)objc_claimAutoreleasedReturnValue();

      v13 = v55;
      v14 = v54;
    }
    goto LABEL_34;
  }
  objc_msgSend(v22, "librarySpecificFetchOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setIncludedDetectionTypes:", &unk_1E8540C08);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v36 = 0;
    goto LABEL_36;
  }
  v65 = v13;
  v69 = v12;
  objc_msgSend(v22, "librarySpecificFetchOptions");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v79 = *MEMORY[0x1E0CD1B78];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFetchPropertySets:", v28);

  objc_msgSend(v27, "setIncludedDetectionTypes:", &unk_1E8540C08);
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchKeyFaceForPerson:options:", v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v64 = v26;
    v67 = v11;
    objc_msgSend(v22, "librarySpecificFetchOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFetchPropertySets:", v32);

    v33 = (void *)MEMORY[0x1E0CD1390];
    v77 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "fetchAssetsForFaces:options:", v34, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (char *)objc_claimAutoreleasedReturnValue();

    v13 = v65;
LABEL_34:

    v11 = v67;
    v26 = v64;
    goto LABEL_35;
  }
  v36 = 0;
LABEL_35:

  v12 = v69;
LABEL_36:

  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 9);
    v36 = (char *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v73;
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    *(_WORD *)buf = 0;
    v48 = "Curated Key Asset Error: Failed to process curated key asset";
    v49 = v46;
    v50 = 2;
    goto LABEL_49;
  }
  -[PHAStorytellingClientRequestHandler informationDictionaryForAsset:](self, "informationDictionaryForAsset:", v36);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v47 = v73;
  v61 = v73;
  v62 = v61;
  if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v62, OS_SIGNPOST_INTERVAL_END, spid, "CuratedKeyAssetRequest", ", buf, 2u);
  }

  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v81 = "CuratedKeyAssetRequest";
    v82 = 2048;
    v83 = (float)((float)((float)((float)(v58 - v70) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v62, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v36;
    _os_log_impl(&dword_1CAC16000, v63, OS_LOG_TYPE_INFO, "Curated Key Asset Reply: curatedKeyAsset:%@", buf, 0xCu);
  }

  ((void (**)(id, void *, void *))v14)[2](v14, v57, 0);
LABEL_47:

}

- (void)requestCuratedAssetsForAssetCollectionWithLocalIdentifier:(id)a3 duration:(unint64_t)a4 options:(id)a5 context:(id)a6 reply:(id)a7
{
  char *v11;
  id v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  uint32_t denom;
  uint32_t numer;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  os_signpost_id_t spid;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  mach_timebase_info info;
  uint8_t v59[128];
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  double v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v11 = (char *)a3;
  v12 = a5;
  v52 = a7;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "curationManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);
  info = 0;
  mach_timebase_info(&info);
  v16 = v14;
  v17 = v16;
  v51 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CuratedAssetsRequest", ", buf, 2u);
  }
  spid = v15;

  v49 = mach_absolute_time();
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D760A0], "stringFromPGDuration:", a4, v15);
    v19 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v61 = v11;
    v62 = 2112;
    v63 = v19;
    v64 = 2112;
    v65 = v21;
    _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_INFO, "Curated Assets Request: collectionID:%@ duration:%@ options:%@", buf, 0x20u);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHPhotosGraphOptionPersonLocalIdentifiersToFocus"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") == 1)
  {
    v50 = v11;
    objc_msgSend(v22, "firstObject");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "curatedAssetsForPersonLocalIdentifier:progressBlock:", v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v23 = v24;
    v36 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v55 != v38)
            objc_enumerationMutation(v23);
          -[PHAStorytellingClientRequestHandler informationDictionaryForAsset:](self, "informationDictionaryForAsset:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i), spid);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v40);

        }
        v37 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v37);
    }

    v41 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v44 = v17;
    v45 = v44;
    if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v45, OS_SIGNPOST_INTERVAL_END, spid, "CuratedAssetsRequest", ", buf, 2u);
    }

    v11 = v50;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v61 = "CuratedAssetsRequest";
      v62 = 2048;
      v63 = (float)((float)((float)((float)(v41 - v49) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v45, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection", spid);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = objc_msgSend(v33, "count");
      *(_DWORD *)buf = 134217984;
      v61 = (const char *)v47;
      _os_log_impl(&dword_1CAC16000, v46, OS_LOG_TYPE_INFO, "Curated Assets Reply: collectionAssetsCount:%lu", buf, 0xCu);
    }

    v35 = v52;
    (*((void (**)(id, void *, _QWORD))v52 + 2))(v52, v33, 0);
    goto LABEL_35;
  }
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v11, v12, v23);
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    v50 = v11;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v23);
    v28 = objc_msgSend(v53, "optimalDurationForAssetCollection:duration:options:curationContext:", v26, a4, v12, v27);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75CB0]), "initWithDuration:", v28);
    if (v22 && (unint64_t)objc_msgSend(v22, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "curatedAssetsForAssetCollection:duration:referencePersonLocalIdentifiers:curationContext:progressBlock:", v26, v28, v30, v27, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHPhotosGraphOptionCurationTypeDedupe"), spid);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "BOOLValue");

      if (v32)
      {
        objc_msgSend(v53, "dejunkAndDedupeAssetsInAssetCollection:options:curationContext:progressBlock:", v26, v12, v27, 0);
      }
      else
      {
        objc_msgSend(v29, "setIncludesAllFaces:", 1);
        objc_msgSend(v53, "curatedAssetsForAssetCollection:options:curationContext:progressBlock:", v26, v29, v27, 0);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v11;
    _os_log_error_impl(&dword_1CAC16000, v34, OS_LOG_TYPE_ERROR, "Curated Assets Error: Failed to lookup collectionID:%@", buf, 0xCu);
  }

  v35 = v52;
  (*((void (**)(id, _QWORD, void *))v52 + 2))(v52, 0, v33);
LABEL_35:

}

- (void)requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  char *v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint32_t denom;
  uint32_t numer;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t spid;
  void (**v40)(id, _QWORD, void *);
  id v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  NSObject *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  mach_timebase_info info;
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  double v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a6;
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  info = 0;
  mach_timebase_info(&info);
  v14 = v12;
  v15 = v14;
  v44 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RepresentativeAssetsRequest", ", buf, 2u);
  }

  v43 = mach_absolute_time();
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
    v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138412546;
    v53 = v9;
    v54 = 2112;
    v55 = v18;
    _os_log_impl(&dword_1CAC16000, v16, OS_LOG_TYPE_INFO, "Representative Assets Request: collectionID:%@ options:%@", buf, 0x16u);

  }
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v9, v10, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    spid = v13;
    v40 = v11;
    v45 = v15;
    v41 = v10;
    v42 = v9;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v19);
    objc_msgSend(MEMORY[0x1E0D75CA8], "representativeAssetsForAssetCollection:curationContext:progressBlock:", v20, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v47 != v27)
            objc_enumerationMutation(v24);
          -[PHAStorytellingClientRequestHandler informationDictionaryForAsset:](self, "informationDictionaryForAsset:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v26);
    }

    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = objc_msgSend(v23, "count");
      v32 = COERCE_DOUBLE(objc_msgSend(v20, "estimatedAssetCount"));
      *(_DWORD *)buf = 134218240;
      v53 = (const char *)v31;
      v54 = 2048;
      v55 = v32;
      _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_INFO, "Representative Assets Reply: representativeAssetsCount:%ld collectionAssetsCount:%ld", buf, 0x16u);
    }

    v33 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v36 = v45;
    v37 = v36;
    v11 = v40;
    if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v37, OS_SIGNPOST_INTERVAL_END, spid, "RepresentativeAssetsRequest", ", buf, 2u);
    }

    v10 = v41;
    v9 = v42;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "RepresentativeAssetsRequest";
      v54 = 2048;
      v55 = (float)((float)((float)((float)(v33 - v43) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    ((void (**)(id, void *, void *))v40)[2](v40, v23, 0);

    v15 = v45;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v9;
      _os_log_error_impl(&dword_1CAC16000, v38, OS_LOG_TYPE_ERROR, "Representative Assets Error: Failed to lookup collectionID:%@", buf, 0xCu);
    }

    v11[2](v11, 0, v21);
  }

}

- (void)requestSummaryCurationForHighlightLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a6;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CD13B8];
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && objc_msgSend(v15, "assetCollectionType") == 6)
  {
    objc_msgSend(MEMORY[0x1E0D760A0], "summaryCurationForHighlight:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v16, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v9)[2](v9, 0, v16);
  }

}

- (void)requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, _QWORD);
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, _QWORD))a6;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v13 = objc_msgSend(v12, "isReadyWithError:", &v23);
  v14 = v23;
  if ((v13 & 1) != 0)
  {
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "librarySpecificFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CD13B8];
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchAssetCollectionsWithLocalIdentifiers:options:", v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v15);
      objc_msgSend(v12, "curationDebugInformationForAssetCollection:options:curationContext:", v20, v10, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v22, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v11)[2](v11, 0, v21);
    }

  }
  else
  {
    ((void (**)(id, void *, id))v11)[2](v11, 0, v14);
  }

}

- (void)requestUtilityAssetInformationWithContext:(id)a3 reply:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = (void (**)(id, void *, _QWORD))a4;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "utilityAssetInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8[2](v8, v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v7);

  }
}

- (void)requestCurationDebugInformationForAsset:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CD1390];
  v20 = v7;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v9, "arrayWithObjects:count:", &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary", v20, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsWithLocalIdentifiers:options:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0D77E08]);
    objc_msgSend(v15, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithPhotoLibrary:", v17);

    objc_msgSend(MEMORY[0x1E0D75C70], "debugInformationForAsset:curationContext:", v15, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v10[2](v10, v19, 0);

    v10 = (void (**)(id, uint64_t, _QWORD))v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v18);
  }

}

- (void)requestIconicSceneScoreForAssetLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  void (**v33)(id, _QWORD, id);
  id v34;
  id v35;
  unint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *context;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v11 = objc_alloc_init(MEMORY[0x1E0D75248]);
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0CD1A50];
  v46[0] = *MEMORY[0x1E0CD1978];
  v46[1] = v14;
  v46[2] = *MEMORY[0x1E0CD19F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFetchPropertySets:", v15);

  objc_msgSend(v13, "setChunkSizeForFetch:", 200);
  if (objc_msgSend(v8, "count"))
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v8, v13);
  else
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v16)
  {
    v32 = v13;
    v33 = v10;
    v34 = v9;
    v35 = v8;
    v18 = objc_alloc_init(MEMORY[0x1E0D77E18]);
    v19 = objc_msgSend(v16, "count");
    if ((unint64_t)(v19 + 199) >= 0xC8)
    {
      v20 = 0;
      v36 = (v19 + 199) / 0xC8uLL;
      v37 = v18;
      v38 = v16;
      do
      {
        context = (void *)MEMORY[0x1D1798448]();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v32);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectsAtIndexes:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "prepareAssets:", v21);
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v42 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v27, "clsIconicSceneScoreWithSceneGeography:", v11);
              objc_msgSend(v28, "numberWithDouble:");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "floatValue");
              if (v30 > 0.0)
              {
                objc_msgSend(v27, "uuid");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, v31);

              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v24);
        }

        objc_autoreleasePoolPop(context);
        ++v20;
        v18 = v37;
        v16 = v38;
      }
      while (v20 != v36);
    }
    v10 = v33;
    ((void (**)(id, id, id))v33)[2](v33, v17, 0);
    v9 = v34;
    v8 = v35;
    v13 = v32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v18);
  }

}

- (void)requestGeoHashForAssetLocalIdentifiers:(id)a3 geoHashSize:(id)a4 context:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(id, _QWORD, void *);
  id v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *context;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setChunkSizeForFetch:", 200);
  if (v10)
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v10, v15);
  else
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v16)
  {
    v33 = v15;
    v34 = v13;
    v35 = v12;
    v37 = v10;
    v39 = objc_msgSend(v16, "count");
    v36 = v11;
    v18 = objc_msgSend(v11, "integerValue");
    if ((unint64_t)(v39 + 199) >= 0xC8)
    {
      v19 = v18;
      v20 = 0;
      v38 = v16;
      do
      {
        context = (void *)MEMORY[0x1D1798448]();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectsAtIndexes:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v43 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              v27 = (void *)MEMORY[0x1E0CD1420];
              objc_msgSend(v26, "locationCoordinate");
              v29 = v28;
              objc_msgSend(v26, "locationCoordinate");
              objc_msgSend(v27, "poiGeoHashWithGeoHashSize:latitude:longitude:", v19, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                objc_msgSend(v26, "uuid");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, v31);

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          }
          while (v23);
        }

        objc_autoreleasePoolPop(context);
        ++v20;
        v16 = v38;
      }
      while (v20 != (v39 + 199) / 0xC8uLL);
    }
    v13 = v34;
    ((void (**)(id, id, void *))v34)[2](v34, v17, 0);
    v11 = v36;
    v10 = v37;
    v12 = v35;
    v15 = v33;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v32);

  }
}

- (void)requestCurationScoreByAssetUUIDForAssetUUIDs:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *context;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && !objc_msgSend(v8, "count"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA70], 0);
  }
  else
  {
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D75CA8], "assetPropertySetsForCuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFetchPropertySets:", v13);

    objc_msgSend(v12, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v12, "setIncludeGuestAssets:", 1);
    objc_msgSend(v12, "setChunkSizeForFetch:", 1000);
    objc_msgSend(v12, "setCacheSizeForFetch:", 1000);
    v37 = v9;
    v38 = v8;
    v36 = v10;
    v34 = v12;
    if (v8)
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v8, v12);
    else
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v15);
    v35 = v11;
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v11);
    v17 = objc_alloc_init(MEMORY[0x1E0D77E00]);
    objc_msgSend(v17, "setViewCountThreshold:", 1.79769313e308);
    objc_msgSend(v17, "setPlayCountThreshold:", 1.79769313e308);
    objc_msgSend(v17, "setShouldEmphasizeShared:", 1);
    v18 = objc_alloc(MEMORY[0x1E0D781F0]);
    v33 = (void *)objc_msgSend(v18, "initWithSceneAnalysisVersion:", (int)*MEMORY[0x1E0D47690]);
    objc_msgSend(v33, "aestheticScoreThresholdToBeAwesome");
    v19 = objc_msgSend(v17, "setAestheticScoreThresholdToBeAwesome:");
    if (v15)
    {
      v20 = 0;
      v39 = v15;
      v40 = v14;
      do
      {
        context = (void *)MEMORY[0x1D1798448](v19);
        if (v15 - v20 >= 0x3E8)
          v21 = 1000;
        else
          v21 = v15 - v20;
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectsAtIndexes:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD1390], "prefetchOnAssets:options:curationContext:", v23, 13, v41);
        objc_msgSend(v41, "curationSession");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "prepareAssets:", v23);

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v25 = v23;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v44 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_msgSend(v30, "scoreInContext:", v17);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "uuid");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v31, v32);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          }
          while (v27);
        }

        objc_autoreleasePoolPop(context);
        v20 += 1000;
        v15 = v39;
        v14 = v40;
      }
      while (v20 < v39);
    }
    v10 = v36;
    (*((void (**)(id, void *, _QWORD))v36 + 2))(v36, v16, 0);

    v9 = v37;
    v8 = v38;
  }

}

- (void)runCurationWithItems:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, _QWORD);
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, _QWORD))a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("curationType"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (__CFString *)v12;
  else
    v14 = CFSTR("extended");
  v15 = v14;

  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("extended")))
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75CD0]), "initWithSimilarityModelClass:", objc_opt_class());
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("verifiedPersonLocalIdentifiers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v17);
      objc_msgSend(v16, "setVerifiedPersonLocalIdentifiers:", v18);

    }
    v28 = 0;
    objc_msgSend(v16, "dejunkedDedupedItemIdentifiersWithItems:options:debugInfo:", v9, v10, &v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v28;
  }
  else
  {
    if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("curation")))
    {
      v16 = objc_alloc_init(MEMORY[0x1E0D75CB8]);
      v27 = 0;
      objc_msgSend(v16, "bestItemIdentifiersWithItems:options:debugInfo:", v9, v10, &v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v27;
      goto LABEL_11;
    }
    if (!-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("keyAsset")))
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
      v20 = (id)MEMORY[0x1E0C9AA70];
      goto LABEL_12;
    }
    v22 = objc_alloc(MEMORY[0x1E0D76080]);
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "curationManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "curationCriteriaFactory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v22, "initWithCurationCriteriaFactory:", v25);

    v26 = 0;
    objc_msgSend(v16, "keyItemIdentifierWithItems:options:debugInfo:", v9, v10, &v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v26;
    if (v17)
    {
      v31[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }
  }

LABEL_11:
LABEL_12:
  v29[0] = CFSTR("bestItemIdentifiers");
  v29[1] = CFSTR("debugInfo");
  v30[0] = v19;
  v30[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v21, 0);

}

- (void)requestSignalModelInfosWithContext:(id)a3 reply:(id)a4
{
  objc_class *v4;
  void (**v5)(id, id, _QWORD);
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0D77E10];
  v5 = (void (**)(id, id, _QWORD))a4;
  v6 = (void *)objc_msgSend([v4 alloc], "initForTesting");
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__PHAStorytellingClientRequestHandler_Curation__requestSignalModelInfosWithContext_reply___block_invoke;
  v9[3] = &unk_1E851F5E8;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v6, "enumerateClassificationBasedSignalModelsUsingBlock:", v9);
  v5[2](v5, v8, 0);

}

- (void)requestComposabilityScoresOfAssetsForLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  objc_class *v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v9 = (objc_class *)MEMORY[0x1E0D75C68];
  v10 = (void (**)(id, void *, _QWORD))a6;
  v11 = a4;
  v12 = a3;
  v13 = [v9 alloc];
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v13, "initWithPhotoLibrary:options:", v14, v11);

  objc_msgSend(v16, "composabilityScoresOfAssetsForLocalIdentifiers:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v10[2](v10, v15, 0);
}

void __90__PHAStorytellingClientRequestHandler_Curation__requestSignalModelInfosWithContext_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "modelInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  }
}

- (void)requestUpNextMemoriesWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id location;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v12 = objc_msgSend(v11, "isReadyWithError:", &v20);
  v13 = v20;
  if ((v12 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__PHAStorytellingClientRequestHandler_UpNext__requestUpNextMemoriesWithOptions_context_reply___block_invoke;
    block[3] = &unk_1E851F6F8;
    objc_copyWeak(&v18, &location);
    v16 = v8;
    v17 = v10;
    dispatch_async(v14, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v13);
  }

}

void __94__PHAStorytellingClientRequestHandler_UpNext__requestUpNextMemoriesWithOptions_context_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0D76290], "requestWithDictionaryRepresentation:error:", v3, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (!v4)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76120]), "initForUpNextMemoryRequestWithOptionsDictionary:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "graphManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workingContextForUpNext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v5;
    objc_msgSend(v4, "fetchMemoryLocalIdentifiersWithWorkingContext:musicCurationOptions:error:", v8, v6, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;

    if (v10)
    {
      objc_msgSend(WeakRetained, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v10;
        _os_log_error_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_ERROR, "Up Next Memories Generation Error:%{public}@", buf, 0xCu);
      }

    }
    objc_msgSend(v9, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)requestOnDemandFaceCropsForFaceLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  unint64_t v34;
  unint64_t v35;
  double v36;
  double v37;
  NSObject *v38;
  void *v39;
  PHAStorytellingClientRequestHandler *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  void *v54;
  void *v55;
  void (**v56)(id, _QWORD, void *);
  id v57;
  id v58;
  PHAStorytellingClientRequestHandler *v59;
  os_log_t v60;
  NSObject *v61;
  void *v62;
  NSObject *log;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  NSObject *v78;
  __int16 v79;
  NSObject *v80;
  void *v81;
  NSObject *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 13);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v52);

    goto LABEL_50;
  }
  v55 = (void *)v11;
  v56 = v10;
  v57 = v9;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIncludeTrashedAssets:", 1);
  v67 = v14;
  objc_msgSend(v14, "setIncludeHiddenAssets:", 1);
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v16 = objc_claimAutoreleasedReturnValue();

  v58 = v8;
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesWithLocalIdentifiers:options:", v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v16;
  objc_msgSend(MEMORY[0x1E0CD1538], "fetchFaceCropByFaceLocalIdentifierForFaces:fetchOptions:", v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v19 = v17;
  v71 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (!v71)
    goto LABEL_48;
  v21 = *(_QWORD *)v74;
  *(_QWORD *)&v20 = 138412546;
  v53 = v20;
  v59 = self;
  v65 = v19;
  v66 = v18;
  v64 = *(_QWORD *)v74;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v74 != v21)
        objc_enumerationMutation(v19);
      v23 = *(NSObject **)(*((_QWORD *)&v73 + 1) + 8 * v22);
      v24 = (void *)MEMORY[0x1D1798448]();
      -[NSObject localIdentifier](v23, "localIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v26, "resourceData");
        v27 = objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = (void *)v27;
          objc_msgSend(v26, "uuid");
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v28, v29);
          goto LABEL_43;
        }
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v23;
          v46 = v29;
          v47 = "Error persisted facecrop is nil for PHFace: %@";
          goto LABEL_46;
        }
        goto LABEL_23;
      }
      -[PHAStorytellingClientRequestHandler _pvFaceFromPHFace:copyPropertiesOption:](self, "_pvFaceFromPHFace:copyPropertiesOption:", v23, 0);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v23;
          v46 = v29;
          v47 = "Error getting PVFace from PHFace: %@";
LABEL_46:
          _os_log_error_impl(&dword_1CAC16000, v46, OS_LOG_TYPE_ERROR, v47, buf, 0xCu);
        }
LABEL_23:
        v28 = 0;
        goto LABEL_43;
      }
      v28 = (void *)v30;
      v31 = (void *)MEMORY[0x1E0CD1390];
      v82 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "fetchAssetsForFaces:options:", v32, v67);
      v29 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject count](v29, "count"))
      {
        -[NSObject firstObject](v29, "firstObject");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = -[NSObject pixelWidth](v33, "pixelWidth");
        v35 = -[NSObject pixelHeight](v33, "pixelHeight");
        if (v34 <= v35)
          v34 = v35;
        -[NSObject size](v23, "size", v53);
        v37 = 128.0 / v36;
        if (v37 >= (double)v34)
          v37 = (double)v34;
        v72 = 0;
        -[PHAStorytellingClientRequestHandler _pvImageForAsset:targetSize:error:](self, "_pvImageForAsset:targetSize:error:", v33, &v72, (double)(unint64_t)v37, (double)(unint64_t)v37);
        v38 = objc_claimAutoreleasedReturnValue();
        v68 = v72;
        if (v38)
        {
          v60 = v38;
          +[PVFaceCropSourceDescriptor descriptorForFace:image:](PVFaceCropSourceDescriptor, "descriptorForFace:image:", v28, v38);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v69;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAStorytellingClientRequestHandler _generateFaceCropForFaceCropSourceDescriptors:](self, "_generateFaceCropForFaceCropSourceDescriptors:", v39);
          v40 = self;
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v62 = v41;
          objc_msgSend(v41, "firstObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            -[NSObject cloudIdentifier](v33, "cloudIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if (v43)
            {
              v45 = v43;
            }
            else
            {
              -[NSObject uuid](v33, "uuid");
              v45 = objc_claimAutoreleasedReturnValue();
            }
            log = v45;
            v38 = v60;

            objc_msgSend(v42, "faceCropData");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              objc_msgSend(v70, "setObject:forKeyedSubscript:", v50, log);
            }
            else
            {
              -[PHAStorytellingClientRequestHandler loggingConnection](v59, "loggingConnection");
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v53;
                v78 = v23;
                v79 = 2112;
                v80 = v33;
                _os_log_error_impl(&dword_1CAC16000, v61, OS_LOG_TYPE_ERROR, "Error generated facecrop is nil for PHFace: %@, PHAsset: %@", buf, 0x16u);
              }

            }
            self = v59;
            v49 = v68;
          }
          else
          {
            -[PHAStorytellingClientRequestHandler loggingConnection](v40, "loggingConnection");
            log = objc_claimAutoreleasedReturnValue();
            self = v40;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v78 = v33;
              _os_log_error_impl(&dword_1CAC16000, log, OS_LOG_TYPE_ERROR, "Error getting PVFaceCrop from PHAsset: %@", buf, 0xCu);
            }
            v49 = v68;
            v38 = v60;
          }

          v18 = v66;
        }
        else
        {
          -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
          v48 = objc_claimAutoreleasedReturnValue();
          v69 = v48;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v33;
            _os_log_error_impl(&dword_1CAC16000, v48, OS_LOG_TYPE_ERROR, "Error getting PVImage from PHAsset: %@", buf, 0xCu);
          }
          v18 = v66;
          v49 = v68;
        }

      }
      else
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v23;
          _os_log_error_impl(&dword_1CAC16000, v33, OS_LOG_TYPE_ERROR, "No corresponding asset for PHFace: %@", buf, 0xCu);
        }
        v18 = v66;
      }
      v19 = v65;

      v21 = v64;
LABEL_43:

      objc_autoreleasePoolPop(v24);
      ++v22;
    }
    while (v71 != v22);
    v51 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    v71 = v51;
  }
  while (v51);
LABEL_48:

  v10 = v56;
  ((void (**)(id, void *, void *))v56)[2](v56, v70, 0);

  v9 = v57;
  v8 = v58;
  v12 = v55;
LABEL_50:

}

- (id)_pvImageForAsset:(id)a3 targetSize:(CGSize)a4 error:(id *)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v9, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v9, "setSynchronous:", 1);
  objc_msgSend(v9, "setLoadingMode:", 0x10000);
  objc_msgSend(v9, "setResizeMode:", 1);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1253;
  v21 = __Block_byref_object_dispose__1254;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PHAStorytellingClientRequestHandler_Face___pvImageForAsset_targetSize_error___block_invoke;
  v14[3] = &unk_1E851F9A0;
  v16 = &v17;
  v14[4] = self;
  v11 = v8;
  v15 = v11;
  objc_msgSend(v10, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 0, v9, v14, width, height);

  v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (id)_generateFaceCropForFaceCropSourceDescriptors:(id)a3
{
  id v4;
  PVCanceler *v5;
  PVCanceler *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, int, int, int, id);
  void *v16;
  PVCanceler *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(PVCanceler);
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1253;
    v23 = __Block_byref_object_dispose__1254;
    v24 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __91__PHAStorytellingClientRequestHandler_Face___generateFaceCropForFaceCropSourceDescriptors___block_invoke;
    v16 = &unk_1E851F9C8;
    v18 = &v19;
    v6 = v5;
    v17 = v6;
    +[PVFaceCropGenerator generateFaceCropsFromSourceDescriptors:withProgressBlock:failureBlock:canceler:](PVFaceCropGenerator, "generateFaceCropsFromSourceDescriptors:withProgressBlock:failureBlock:canceler:", v4, 0, &v13, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v20[5])
    {
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection", v13, v14, v15, v16);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v12 = v20[5];
        *(_DWORD *)buf = 138412290;
        v26 = v12;
        _os_log_error_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_ERROR, "Error generating facecrop: %@", buf, 0xCu);
      }

      v10 = 0;
    }
    else
    {
      v10 = v7;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_pvFaceFromPHFace:(id)a3 copyPropertiesOption:(int64_t)a4
{
  id v6;
  PVFace *v7;
  void *v8;
  PVFace *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [PVFace alloc];
  objc_msgSend(v6, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PVObject initWithLocalIdentifier:](v7, "initWithLocalIdentifier:", v8);

  if (a4)
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = a4;
      _os_log_error_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_ERROR, "pvFaceFromPHFace option not supported: %d", (uint8_t *)v14, 8u);
    }

  }
  else
  {
    objc_msgSend(v6, "personLocalIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVFace setPersonLocalIdentifier:](v9, "setPersonLocalIdentifier:", v11);

    -[PVFace setSourceWidth:](v9, "setSourceWidth:", objc_msgSend(v6, "sourceWidth"));
    -[PVFace setSourceHeight:](v9, "setSourceHeight:", objc_msgSend(v6, "sourceHeight"));
    objc_msgSend(v6, "centerX");
    -[PVFace setCenterX:](v9, "setCenterX:");
    objc_msgSend(v6, "centerY");
    -[PVFace setCenterY:](v9, "setCenterY:");
    objc_msgSend(v6, "size");
    -[PVFace setSize:](v9, "setSize:");
    -[PVFace setHasSmile:](v9, "setHasSmile:", objc_msgSend(v6, "hasSmile"));
    objc_msgSend(v6, "blurScore");
    -[PVFace setBlurScore:](v9, "setBlurScore:");
    -[PVFace setIsLeftEyeClosed:](v9, "setIsLeftEyeClosed:", objc_msgSend(v6, "isLeftEyeClosed"));
    -[PVFace setIsRightEyeClosed:](v9, "setIsRightEyeClosed:", objc_msgSend(v6, "isRightEyeClosed"));
    objc_msgSend(v6, "poseYaw");
    -[PVFace setPoseYaw:](v9, "setPoseYaw:");
    -[PVFace setFaceAlgorithmVersion:](v9, "setFaceAlgorithmVersion:", objc_msgSend(v6, "faceAlgorithmVersion"));
    -[PVFace setQualityMeasure:](v9, "setQualityMeasure:", objc_msgSend(v6, "qualityMeasure"));
    -[PVFace setHidden:](v9, "setHidden:", objc_msgSend(v6, "isHidden"));
    -[PVFace setIsInTrash:](v9, "setIsInTrash:", objc_msgSend(v6, "isInTrash"));
    -[PVFace setManual:](v9, "setManual:", objc_msgSend(v6, "manual"));
    objc_msgSend(v6, "adjustmentVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVFace setAdjustmentVersion:](v9, "setAdjustmentVersion:", v12);

    -[PVFace setNameSource:](v9, "setNameSource:", objc_msgSend(v6, "nameSource"));
    -[PVFace setTrainingType:](v9, "setTrainingType:", objc_msgSend(v6, "trainingType"));
    -[PVFace setClusterSequenceNumber:](v9, "setClusterSequenceNumber:", objc_msgSend(v6, "clusterSequenceNumber"));
  }

  return v9;
}

- (id)_defaultImageCreationOptions
{
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CBD2B8];
  v4[0] = *MEMORY[0x1E0CBD2B0];
  v4[1] = v2;
  v5[0] = MEMORY[0x1E0C9AAB0];
  v5[1] = MEMORY[0x1E0C9AAA0];
  v4[2] = *MEMORY[0x1E0CBD288];
  v5[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __91__PHAStorytellingClientRequestHandler_Face___generateFaceCropForFaceCropSourceDescriptors___block_invoke(uint64_t a1, int a2, int a3, int a4, id obj)
{
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v7 = obj;
  objc_msgSend(*(id *)(a1 + 32), "setCanceled:", 1);

}

void __79__PHAStorytellingClientRequestHandler_Face___pvImageForAsset_targetSize_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = *MEMORY[0x1E0C9D820];
    PLGetOrientationAndUntransformedSizeFromImageURL();
    objc_msgSend(*(id *)(a1 + 32), "_defaultImageCreationOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "adjustmentVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PVImage imageWithURL:assetWidth:assetHeight:imageCreationOptions:adjustmentVersion:creationDate:](PVImage, "imageWithURL:assetWidth:assetHeight:imageCreationOptions:adjustmentVersion:creationDate:", v4, (unint64_t)*(double *)&v11, (unint64_t)*((double *)&v11 + 1), v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)requestMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id location[2];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v27 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_class();
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_fetchOptionsForMusicCurationWithPhotoLibrary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CD13B8];
  v36[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchAssetCollectionsWithLocalIdentifiers:options:", v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v21 = objc_msgSend(v20, "isReadyWithError:", &v34);
    v22 = v34;
    if ((v21 & 1) == 0)
    {
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v22;
        _os_log_fault_impl(&dword_1CAC16000, v23, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Music Curation requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
      }

    }
    objc_initWeak(location, self);
    -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __122__PHAStorytellingClientRequestHandler_Music__requestMusicCurationForAssetCollectionLocalIdentifier_options_context_reply___block_invoke;
    block[3] = &unk_1E851FBD0;
    objc_copyWeak(&v33, location);
    v32 = v12;
    v29 = v11;
    v30 = v19;
    v31 = v20;
    v25 = v20;
    dispatch_async(v24, block);

    objc_destroyWeak(&v33);
    objc_destroyWeak(location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("music curation requested but no asset collections could be fetched from the specified local identifier: %@"), v10, v27);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v25;
      _os_log_error_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Music Curation Error: %@", (uint8_t *)location, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v25);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v22);
  }

}

- (void)requestMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  PHAStorytellingClientRequestHandler *v27;
  id v28;
  id v29;
  id v30;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v23 = a3;
  v10 = a4;
  v22 = a5;
  v11 = a6;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v23, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  LOBYTE(v12) = objc_msgSend(v15, "isReadyWithError:", &v30);
  v16 = v30;
  if ((v12 & 1) == 0)
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection", v22);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v16;
      _os_log_fault_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Music Curation requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }

  }
  objc_initWeak(location, self);
  -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__PHAStorytellingClientRequestHandler_Music__requestMusicCurationForAssetLocalIdentifiers_options_context_reply___block_invoke;
  block[3] = &unk_1E851FBD0;
  objc_copyWeak(&v29, location);
  v25 = v10;
  v26 = v14;
  v27 = self;
  v28 = v11;
  v19 = v14;
  v20 = v10;
  v21 = v11;
  dispatch_async(v18, block);

  objc_destroyWeak(&v29);
  objc_destroyWeak(location);

}

- (void)requestFlexMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id location[2];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v27 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_class();
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_fetchOptionsForMusicCurationWithPhotoLibrary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CD13B8];
  v36[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchAssetCollectionsWithLocalIdentifiers:options:", v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v21 = objc_msgSend(v20, "isReadyWithError:", &v34);
    v22 = v34;
    if ((v21 & 1) == 0)
    {
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v22;
        _os_log_fault_impl(&dword_1CAC16000, v23, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Flex Music curation requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
      }

    }
    objc_initWeak(location, self);
    -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __126__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_context_reply___block_invoke;
    block[3] = &unk_1E851FBD0;
    objc_copyWeak(&v33, location);
    v32 = v12;
    v29 = v11;
    v30 = v19;
    v31 = v20;
    v25 = v20;
    dispatch_async(v24, block);

    objc_destroyWeak(&v33);
    objc_destroyWeak(location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flex music curation requested but no asset collection could be fetched from the specified local identifier: %@"), v10, v27);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v25;
      _os_log_error_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music Curation Error: %@", (uint8_t *)location, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v25);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v22);
  }

}

- (void)requestFlexMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v25 = a5;
  v12 = a6;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v17 = objc_msgSend(v16, "isReadyWithError:", &v31);
  v18 = v31;
  if ((v17 & 1) == 0)
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_fault_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Flex Music curation requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }

  }
  objc_initWeak(location, self);
  -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationForAssetLocalIdentifiers_options_context_reply___block_invoke;
  block[3] = &unk_1E851FBF8;
  v29 = v16;
  v30 = v12;
  block[4] = self;
  v27 = v11;
  v28 = v15;
  v21 = v16;
  v22 = v15;
  v23 = v11;
  v24 = v12;
  dispatch_async(v20, block);

  objc_destroyWeak(location);
}

- (void)requestSongsForAdamIDs:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke;
  v29[3] = &unk_1E8521438;
  v29[4] = self;
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76118]), "initWithRequestOptionsDictionary:inflationActionSource:", v11, 2);
  objc_initWeak(&location, self);
  -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_143;
  block[3] = &unk_1E851FBD0;
  objc_copyWeak(&v27, &location);
  v23 = v16;
  v24 = v10;
  v25 = v15;
  v26 = v13;
  v18 = v15;
  v19 = v10;
  v20 = v16;
  v21 = v13;
  dispatch_async(v17, block);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

- (void)requestMusicCacheStatusWithContext:(id)a3 reply:(id)a4
{
  void *v5;
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0D76168];
  v6 = (void (**)(id, void *, void *))a4;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "cacheStatusWithPhotoLibrary:error:", v7, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;

  objc_msgSend(MEMORY[0x1E0D75CF8], "xpcSafeErrorWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v8, v10);
}

- (void)requestPrecachingOfAudioDataForAdamIDs:(id)a3 context:(id)a4 reply:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0D76100];
  v7 = (void *)MEMORY[0x1E0D42A58];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "ignoreProgress");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacheSongAudioForAdamIDs:progressReporter:completionHandler:", v9, v10, v8);

}

- (void)requestMusicCurationDebugInformationForSongWithAdamID:(id)a3 context:(id)a4 reply:(id)a5
{
  void *v7;
  void (**v8)(id, void *, void *);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v7 = (void *)MEMORY[0x1E0D76168];
  v8 = (void (**)(id, void *, void *))a5;
  v9 = a3;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "generateMusicCurationDebugInformationForSongWithAdamID:graphManager:progressReporter:error:", v9, v10, v11, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  objc_msgSend(MEMORY[0x1E0D75CF8], "xpcSafeErrorWithError:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v12, v14);
}

- (void)requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, void *);
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
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, void *))a5;
  v9 = (void *)objc_opt_class();
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_fetchOptionsForMusicCurationWithPhotoLibrary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CD13B8];
  v26[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0D76168];
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v16, "generateMusicCurationDebugInformationForAssetCollection:graphManager:progressReporter:error:", v15, v17, v18, &v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;

    objc_msgSend(MEMORY[0x1E0D75CF8], "xpcSafeErrorWithError:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, v19, v21);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Music curation metadata for asset collection requested but no asset collections could be fetched from the specified local identifier: %@"), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Music Curation Metadata Request Error: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v21);
  }

}

- (void)requestFlexMusicCurationDebugInformationForSongWithUID:(id)a3 context:(id)a4 reply:(id)a5
{
  void *v7;
  void (**v8)(id, void *, void *);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v7 = (void *)MEMORY[0x1E0D76168];
  v8 = (void (**)(id, void *, void *))a5;
  v9 = a3;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "generateFlexMusicCurationDebugInformationForSongWithUID:graphManager:progressReporter:error:", v9, v10, v11, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  objc_msgSend(MEMORY[0x1E0D75CF8], "xpcSafeErrorWithError:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v12, v14);
}

- (void)requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, void *);
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
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, void *))a5;
  v9 = (void *)objc_opt_class();
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_fetchOptionsForMusicCurationWithPhotoLibrary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CD13B8];
  v26[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0D76168];
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v16, "generateFlexMusicCurationDebugInformationForAssetCollection:graphManager:progressReporter:error:", v15, v17, v18, &v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;

    objc_msgSend(MEMORY[0x1E0D75CF8], "xpcSafeErrorWithError:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, v19, v21);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Flex music curation metadata for asset collection requested but no asset collections could be fetched from the specified local identifier: %@"), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music Curation Metadata Request Error: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v21);
  }

}

- (void)requestClearMusicCacheWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  void *v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0D76168];
  v7 = (void (**)(id, void *))a5;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "cacheRemoveAllForPhotoLibrary:error:", v8, &v11);
  v9 = v11;

  objc_msgSend(MEMORY[0x1E0D75CF8], "xpcSafeErrorWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
}

- (void)requestMusicCatalogAdamIDsForPurchasedSongID:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  PHAStorytellingClientRequestHandler *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id location;
  _QWORD v30[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke;
  v30[3] = &unk_1E8521438;
  v30[4] = self;
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76118]), "initWithRequestOptionsDictionary:inflationActionSource:", v11, 2);
  objc_initWeak(&location, self);
  -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke_152;
  v22[3] = &unk_1E851FC98;
  objc_copyWeak(&v28, &location);
  v26 = v15;
  v27 = v13;
  v23 = v16;
  v24 = self;
  v25 = v10;
  v18 = v15;
  v19 = v10;
  v20 = v16;
  v21 = v13;
  dispatch_async(v17, v22);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void)requestCacheSongSourceWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v7 = a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D72250]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = (void *)MEMORY[0x1E0D42A58];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __94__PHAStorytellingClientRequestHandler_Music__requestCacheSongSourceWithOptions_context_reply___block_invoke;
  v23[3] = &unk_1E851FCC0;
  v23[4] = self;
  v11 = v8;
  v24 = v11;
  objc_msgSend(v10, "progressReporterWithProgressBlock:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D72220]))
  {
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D72240]))
    {
      objc_msgSend(MEMORY[0x1E0D76148], "prefetchCuratedSongLibraryAssetsWithProgressReporter:completionHandler:", v12, v7);
      goto LABEL_13;
    }
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D72228]))
    {
      v14 = (void *)MEMORY[0x1E0D76128];
      -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cacheMusicForMomentsInPhotoLibrary:graphManager:progressReporter:completionHandler:", v13, v15, v12, v7);
LABEL_7:

      goto LABEL_13;
    }
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D72230]))
    {
      v16 = (void *)MEMORY[0x1E0D76130];
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D72248]))
      {
        if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D72238]))
        {
          v17 = (void *)MEMORY[0x1E0D76138];
          v19[0] = v9;
          v19[1] = 3221225472;
          v19[2] = __94__PHAStorytellingClientRequestHandler_Music__requestCacheSongSourceWithOptions_context_reply___block_invoke_160;
          v19[3] = &unk_1E851FCE8;
          v22 = v7;
          v20 = v13;
          v21 = v12;
          objc_msgSend(v17, "cacheMusicForMomentsInPhotoLibrary:progressReporter:completionHandler:", v20, v21, v19);

          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown song source type: %@"), v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D75CF8], "errorWithCode:description:", 0, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v18);

        goto LABEL_7;
      }
      v16 = (void *)MEMORY[0x1E0D76150];
    }
    objc_msgSend(v16, "cacheMusicForMomentsInPhotoLibrary:progressReporter:completionHandler:", v13, v12, v7);
    goto LABEL_13;
  }
  -[PHAStorytellingClientRequestHandler _cacheAllSongSourcesWithCompletionHandler:](self, "_cacheAllSongSourcesWithCompletionHandler:", v7);
LABEL_13:

}

- (void)requestMusicCurationWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v12 = objc_msgSend(v11, "isReadyWithError:", &v24);
  v13 = v24;
  if ((v12 & 1) == 0)
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_fault_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Apple Music Curation with options requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }

  }
  objc_initWeak(location, self);
  -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PHAStorytellingClientRequestHandler_Music__requestMusicCurationWithOptions_context_reply___block_invoke;
  block[3] = &unk_1E851FD10;
  objc_copyWeak(&v23, location);
  v21 = v11;
  v22 = v10;
  v20 = v8;
  v16 = v11;
  v17 = v8;
  v18 = v10;
  dispatch_async(v15, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);

}

- (void)requestFlexMusicCurationWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v12 = objc_msgSend(v11, "isReadyWithError:", &v24);
  v13 = v24;
  if ((v12 & 1) == 0)
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_fault_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Flex Music Curation with options requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }

  }
  objc_initWeak(location, self);
  -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationWithOptions_context_reply___block_invoke;
  block[3] = &unk_1E851FD10;
  objc_copyWeak(&v23, location);
  v21 = v11;
  v22 = v10;
  v20 = v8;
  v16 = v11;
  v17 = v8;
  v18 = v10;
  dispatch_async(v15, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);

}

- (void)requestRecentlyUsedSongsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v12 = objc_msgSend(v11, "isReadyWithError:", &v24);
  v13 = v24;
  if ((v12 & 1) == 0)
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_fault_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_FAULT, "[MemoriesMusic] requestRecentlyUsedSongsWithOptions requested when graph not ready. Request will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }

  }
  objc_initWeak(location, self);
  -[PHAStorytellingClientRequestHandler musicRequestQueue](self, "musicRequestQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PHAStorytellingClientRequestHandler_Music__requestRecentlyUsedSongsWithOptions_context_reply___block_invoke;
  block[3] = &unk_1E851FD10;
  objc_copyWeak(&v23, location);
  v21 = v11;
  v22 = v10;
  v20 = v8;
  v16 = v11;
  v17 = v8;
  v18 = v10;
  dispatch_async(v15, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);

}

- (void)_cacheAllSongSourcesWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PHAStorytellingClientRequestHandler *v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[8];
  _QWORD v23[5];
  __CFString *v24;
  _QWORD v25[4];

  v4 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__1688;
  v23[4] = __Block_byref_object_dispose__1689;
  v24 = CFSTR("MusicForTopic");
  v5 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E851FD38;
  v22[4] = self;
  v22[5] = v25;
  v22[6] = v23;
  v22[7] = 0x4018000000000000;
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D76148];
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_168;
  v12[3] = &unk_1E851FD88;
  v17 = v20;
  v9 = v7;
  v18 = v25;
  v19 = v23;
  v13 = v9;
  v14 = self;
  v10 = v6;
  v15 = v10;
  v11 = v4;
  v16 = v11;
  objc_msgSend(v8, "prefetchCuratedSongLibraryAssetsWithProgressReporter:completionHandler:", v10, v12);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke(uint64_t a1, double a2)
{
  double v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = 138412546;
    v9 = v7;
    v10 = 2048;
    v11 = (v4 + a2) / v5;
    _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_INFO, "[MemoriesMusic] Caching music for source (%@): %f", (uint8_t *)&v8, 0x16u);
  }

}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_168(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "\nMusicForTopic prefetch failed with error: %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("MusicForTopic prefetch failed (%@)"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + 1.0;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = CFSTR("MusicForArtist");

  v12 = (void *)MEMORY[0x1E0D76128];
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "graphManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 48);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_173;
  v19[3] = &unk_1E851FD88;
  v24 = *(_QWORD *)(a1 + 64);
  v16 = *(id *)(a1 + 32);
  v25 = *(_OWORD *)(a1 + 72);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(a1 + 48);
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = *(id *)(a1 + 56);
  objc_msgSend(v12, "cacheMusicForMomentsInPhotoLibrary:graphManager:progressReporter:completionHandler:", v13, v14, v15, v19);

}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_173(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "\nMusicForArtist caching failed with error: %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("MusicForArtist caching failed (%@)"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + 1.0;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = CFSTR("MusicForMoment");

  v12 = (void *)MEMORY[0x1E0D76130];
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_178;
  v18[3] = &unk_1E851FD88;
  v23 = *(_QWORD *)(a1 + 64);
  v15 = *(id *)(a1 + 32);
  v24 = *(_OWORD *)(a1 + 72);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(void **)(a1 + 48);
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = *(id *)(a1 + 56);
  objc_msgSend(v12, "cacheMusicForMomentsInPhotoLibrary:progressReporter:completionHandler:", v13, v14, v18);

}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_178(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "\nMusicForMoment caching failed with error: %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("MusicForMoment caching failed (%@)"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + 1.0;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = CFSTR("MusicForYou");

  v12 = (void *)MEMORY[0x1E0D76150];
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_183;
  v18[3] = &unk_1E851FD88;
  v23 = *(_QWORD *)(a1 + 64);
  v15 = *(id *)(a1 + 32);
  v24 = *(_OWORD *)(a1 + 72);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(void **)(a1 + 48);
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = *(id *)(a1 + 56);
  objc_msgSend(v12, "cacheMusicForMomentsInPhotoLibrary:progressReporter:completionHandler:", v13, v14, v18);

}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_183(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "\nMusicForYou caching failed with error: %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("MusicForYou caching failed (%@)"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + 1.0;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = CFSTR("MusicForTimeBackfill");

  v12 = (void *)MEMORY[0x1E0D76138];
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_188;
  v17[3] = &unk_1E851FD88;
  v22 = *(_QWORD *)(a1 + 64);
  v15 = *(id *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v18 = v15;
  v19 = v16;
  v21 = *(id *)(a1 + 56);
  v23 = *(_OWORD *)(a1 + 72);
  v20 = *(id *)(a1 + 48);
  objc_msgSend(v12, "cacheMusicForMomentsInPhotoLibrary:progressReporter:completionHandler:", v13, v14, v17);

}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_188(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24)
                                                                + 1.0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = CFSTR("MusicForTimeFrontfill");

    v8 = (void *)MEMORY[0x1E0D76140];
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_193;
    v20[3] = &unk_1E851FD60;
    v24 = *(_QWORD *)(a1 + 64);
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v21 = v11;
    v22 = v12;
    v23 = *(id *)(a1 + 56);
    objc_msgSend(v8, "cacheMusicForMomentsInPhotoLibrary:progressReporter:completionHandler:", v9, v10, v20);

    v13 = v21;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "\nMusicForTimeBackfill caching failed with error: %@", buf, 0xCu);
    }
    v14 = v5;
    v13 = v14;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v15 = *(void **)(a1 + 32);
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("MusicForTimeBackfill caching failed (%@)"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v18);

      objc_msgSend((id)objc_opt_class(), "_aggregateErrorWithErrorDescriptions:", *(_QWORD *)(a1 + 32));
      v19 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v19;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_193(_QWORD *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "\nMusicForTimeFrontfill caching failed with error: %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v6 = (void *)a1[4];
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("MusicForTimeFrontfill caching failed (%@)"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    objc_msgSend((id)objc_opt_class(), "_aggregateErrorWithErrorDescriptions:", a1[4]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __96__PHAStorytellingClientRequestHandler_Music__requestRecentlyUsedSongsWithOptions_context_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D76168], "requestRecentlyUsedSongsWithOptions:graphManager:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  }
}

void __96__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationWithOptions_context_reply___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0D76120]);
    if (*(_QWORD *)(a1 + 32))
      v3 = *(_QWORD *)(a1 + 32);
    else
      v3 = MEMORY[0x1E0C9AA70];
    v4 = (void *)objc_msgSend(v2, "initWithOptionsDictionary:", v3);
    objc_msgSend(MEMORY[0x1E0D76168], "requestFlexMusicCurationWithCurationOptions:graphManager:reply:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);
  }

}

void __92__PHAStorytellingClientRequestHandler_Music__requestMusicCurationWithOptions_context_reply___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0D76120]);
    if (*(_QWORD *)(a1 + 32))
      v3 = *(_QWORD *)(a1 + 32);
    else
      v3 = MEMORY[0x1E0C9AA70];
    v4 = (void *)objc_msgSend(v2, "initWithOptionsDictionary:", v3);
    objc_msgSend(MEMORY[0x1E0D76168], "requestMusicCurationWithCurationOptions:graphManager:reply:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);
  }

}

void __94__PHAStorytellingClientRequestHandler_Music__requestCacheSongSourceWithOptions_context_reply___block_invoke(uint64_t a1, double a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v5;
    v8 = 2048;
    v9 = a2;
    _os_log_impl(&dword_1CAC16000, v4, OS_LOG_TYPE_INFO, "[MemoriesMusic] Caching music for source (%@): %f", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __94__PHAStorytellingClientRequestHandler_Music__requestCacheSongSourceWithOptions_context_reply___block_invoke_160(_QWORD *a1, char a2)
{
  if ((a2 & 1) != 0)
    return objc_msgSend(MEMORY[0x1E0D76140], "cacheMusicForMomentsInPhotoLibrary:progressReporter:completionHandler:", a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke(uint64_t a1, double a2)
{
  NSObject *v3;
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = a2;
    _os_log_impl(&dword_1CAC16000, v3, OS_LOG_TYPE_INFO, "[MemoriesMusic] Request Songs For Purchased ID Progress: %f", (uint8_t *)&v4, 0xCu);
  }

}

void __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke_152(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "graphManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v16 = 0;
    objc_msgSend(v4, "musicCurationInflationContextWithInflationOptions:error:", v5, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;

    if (v6)
    {
      v8 = (void *)MEMORY[0x1E0D76168];
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke_153;
      v14[3] = &unk_1E851FC70;
      v15 = *(id *)(a1 + 64);
      objc_msgSend(v8, "fetchMusicCatalogAdamIDsForPurchasedSongID:inflationContext:progressReporter:completionHandler:", v9, v6, v10, v14);
      v11 = v15;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingConnection");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v7;
        _os_log_error_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to create inflation context when requesting adam IDs for purchased ID, error: %{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0D75CF8], "xpcSafeErrorWithError:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v7);
  }

}

void __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke_153(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0D75CF8];
  v6 = a2;
  objc_msgSend(v5, "xpcSafeErrorWithError:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke(uint64_t a1, double a2)
{
  NSObject *v3;
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = a2;
    _os_log_impl(&dword_1CAC16000, v3, OS_LOG_TYPE_INFO, "[MemoriesMusic] Request Songs For Adam IDs Progress: %f", (uint8_t *)&v4, 0xCu);
  }

}

void __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_143(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "graphManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v19 = 0;
    objc_msgSend(v5, "musicCurationInflationContextWithInflationOptions:error:", v6, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;

    if (v7)
    {
      v9 = (void *)MEMORY[0x1E0D76168];
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_145;
      v16[3] = &unk_1E851FC48;
      objc_copyWeak(&v18, v2);
      v17 = *(id *)(a1 + 56);
      objc_msgSend(v9, "fetchSongDisplayMetadataJSONForAdamIDs:inflationContext:progressReporter:completionHandler:", v10, v7, v11, v16);

      objc_destroyWeak(&v18);
    }
    else
    {
      objc_msgSend(v4, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v8;
        _os_log_error_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to create inflation context when requesting songs for adamIDs , error: %{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0D75CF8], "xpcSafeErrorWithError:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
}

void __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "musicRequestQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_2;
    block[3] = &unk_1E851FC20;
    v13 = v6;
    v15 = *(id *)(a1 + 32);
    v14 = v5;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

  }
}

void __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D75CF8], "xpcSafeErrorWithError:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __117__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationForAssetLocalIdentifiers_options_context_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = (objc_class *)MEMORY[0x1E0D76120];
    v4 = v2;
    v5 = [v3 alloc];
    if (a1[5])
      v6 = a1[5];
    else
      v6 = MEMORY[0x1E0C9AA70];
    v8 = (id)objc_msgSend(v5, "initWithOptionsDictionary:", v6);
    objc_msgSend(MEMORY[0x1E0D76168], "requestFlexMusicCurationForAssetFetchResult:curationOptions:graphManager:reply:", a1[6]);
  }
  else
  {
    v7 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }

}

void __126__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_context_reply___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0D76120]);
    if (*(_QWORD *)(a1 + 32))
      v3 = *(_QWORD *)(a1 + 32);
    else
      v3 = MEMORY[0x1E0C9AA70];
    v4 = (void *)objc_msgSend(v2, "initWithOptionsDictionary:", v3);
    objc_msgSend(MEMORY[0x1E0D76168], "requestFlexMusicCurationForAssetCollection:curationOptions:graphManager:reply:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);
  }

}

void __113__PHAStorytellingClientRequestHandler_Music__requestMusicCurationForAssetLocalIdentifiers_options_context_reply___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0D76120]);
    if (*(_QWORD *)(a1 + 32))
      v3 = *(_QWORD *)(a1 + 32);
    else
      v3 = MEMORY[0x1E0C9AA70];
    v4 = (void *)objc_msgSend(v2, "initWithOptionsDictionary:", v3);
    v5 = (void *)MEMORY[0x1E0D76168];
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "graphManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestMusicCurationForAssetFetchResult:curationOptions:graphManager:reply:", v6, v4, v7, *(_QWORD *)(a1 + 56));

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v4);
  }

}

void __122__PHAStorytellingClientRequestHandler_Music__requestMusicCurationForAssetCollectionLocalIdentifier_options_context_reply___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0D76120]);
    if (*(_QWORD *)(a1 + 32))
      v3 = *(_QWORD *)(a1 + 32);
    else
      v3 = MEMORY[0x1E0C9AA70];
    v4 = (void *)objc_msgSend(v2, "initWithOptionsDictionary:", v3);
    objc_msgSend(MEMORY[0x1E0D76168], "requestMusicCurationForAssetCollection:curationOptions:graphManager:reply:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 15, MEMORY[0x1E0C9AA70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);
  }

}

+ (id)_fetchOptionsForMusicCurationWithPhotoLibrary:(id)a3
{
  void *v3;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludePendingMemories:", 1);
  objc_msgSend(v3, "setIncludeLocalMemories:", 1);
  objc_msgSend(v3, "setIncludeStoryMemories:", 1);
  return v3;
}

+ (id)_aggregateErrorWithErrorDescriptions:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsJoinedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75CF8], "errorWithCode:description:", -1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)requestHighlightDebugInformationForHighlightWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  void (**v7)(id, void *, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = (void (**)(id, void *, _QWORD))a5;
  v8 = a3;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier == %@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setPredicate:", v10);
  objc_msgSend(MEMORY[0x1E0CD1708], "fetchHighlightsWithOptions:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "highlightDebugInformationWithHighlight:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v14, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v14);
  }

}

- (void)requestHighlightEstimatesWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *, void *, _QWORD);
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = (void (**)(id, void *, void *, _QWORD))a4;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = objc_msgSend(v6, "isReadyWithError:", &v16);
  v8 = v16;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v6, "workingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76038]), "initWithWorkingContext:", v9);
    v11 = objc_alloc(MEMORY[0x1E0D77E08]);
    objc_msgSend(v6, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithPhotoLibrary:", v12);

    objc_msgSend(v10, "highlightEstimatesDictionaryWithCurationContext:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "highlightEstimatesDescriptionWithCurationContext:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v14, v15, 0);

  }
  else
  {
    ((void (**)(id, void *, void *, id))v5)[2](v5, 0, 0, v8);
  }

}

- (id)relatedRequestPredicateValidator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8540CB0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowedKeyPaths:", v3);

  return v2;
}

- (void)requestAssetCollectionsRelatedToMomentWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  char *v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint32_t denom;
  uint32_t numer;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void (**v64)(id, _QWORD, id);
  void *v65;
  char *v66;
  void *v67;
  uint64_t v68;
  char *v69;
  id v70;
  id v71;
  id v72;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  double v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a6;
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  info = 0;
  mach_timebase_info(&info);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RelatedCollectionsForMomentRequest", ", buf, 2u);
  }

  v68 = mach_absolute_time();
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)MEMORY[0x1E0D761E8];
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionRelationOptionsKey"));
    v18 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromPGRelatedType:", objc_msgSend(v19, "unsignedIntegerValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v75 = v9;
    v76 = 2112;
    v77 = *(double *)&v20;
    _os_log_impl(&dword_1CAC16000, v16, OS_LOG_TYPE_INFO, "Related Collections for Moment Request: momentID:%@ relatedType:%@", buf, 0x16u);

    v10 = v18;
  }

  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  v22 = objc_msgSend(v21, "isReadyWithError:", &v72);
  v23 = v72;
  if ((v22 & 1) != 0)
  {
    v64 = v11;
    v65 = v21;
    v69 = v9;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionPredicateKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    v66 = (char *)v24;
    if (v24)
    {
      v25 = (void *)v24;
      -[PHAStorytellingClientRequestHandler relatedRequestPredicateValidator](self, "relatedRequestPredicateValidator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0;
      v27 = objc_msgSend(v26, "validatePredicate:error:", v25, &v71);
      v28 = v71;

      if ((v27 & 1) == 0)
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v53 = objc_claimAutoreleasedReturnValue();
        v9 = v69;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v66;
          _os_log_error_impl(&dword_1CAC16000, v53, OS_LOG_TYPE_ERROR, "Related Collections for Moment Error: Failed to validate predicate %@", buf, 0xCu);
        }

        v50 = v28;
        v11 = v64;
        v64[2](v64, 0, v50);
        goto LABEL_36;
      }
      objc_msgSend(v25, "allowEvaluation");

    }
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v69;
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v69, v10, v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v67 = (void *)v30;
    if (v30)
    {
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v75 = v69;
        v76 = 2112;
        v77 = *(double *)&v30;
        _os_log_impl(&dword_1CAC16000, v31, OS_LOG_TYPE_INFO, "Related Collections for Moment Request: momentID:%@ is moment:%@", buf, 0x16u);
      }

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionRelationOptionsKey"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "unsignedIntegerValue");

      v34 = 63;
      if (v33)
        v34 = v33;
      v60 = v34;
      -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "workingContextForRelated");
      v36 = objc_claimAutoreleasedReturnValue();

      v63 = v10;
      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0D761F0]), "initWithOptions:", v10);
      v38 = objc_alloc(MEMORY[0x1E0D761E8]);
      -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "blockedFeatures");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)v36;
      v41 = (void *)objc_msgSend(v38, "initWithWorkingContext:blockedFeatures:", v36, v40);

      v70 = v23;
      v42 = v60;
      v59 = v41;
      v61 = (void *)v37;
      objc_msgSend(v41, "relatedCollectionsForMoment:relatedType:options:error:", v67, v42, v37, &v70);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v70;

      v11 = v64;
      v57 = v43;
      if (v43)
      {
        objc_msgSend(v43, "valueForKey:", CFSTR("dictionaryRepresentation"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v47 = v15;
        v48 = v47;
        if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CAC16000, v48, OS_SIGNPOST_INTERVAL_END, v13, "RelatedCollectionsForMomentRequest", " enableTelemetry=YES ", buf, 2u);
        }

        v9 = v69;
        v49 = v62;
        v10 = v63;
        v50 = v67;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v75 = "RelatedCollectionsForMomentRequest";
          v76 = 2048;
          v77 = (float)((float)((float)((float)(v44 - v68) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CAC16000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = objc_msgSend(v56, "count");
          *(_DWORD *)buf = 134217984;
          v75 = (const char *)v52;
          _os_log_impl(&dword_1CAC16000, v51, OS_LOG_TYPE_INFO, "Related Collections for Moment Reply: resultsCount:%lu", buf, 0xCu);
        }

        v23 = v58;
        ((void (**)(id, void *, id))v64)[2](v64, v56, v58);

      }
      else
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v55 = objc_claimAutoreleasedReturnValue();
        v9 = v69;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v69;
          _os_log_error_impl(&dword_1CAC16000, v55, OS_LOG_TYPE_ERROR, "Related Collections for Moment Error: Failed to match momentID:%@", buf, 0xCu);
        }

        v23 = v58;
        v64[2](v64, 0, v58);
        v49 = v62;
        v10 = v63;
        v50 = v67;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v69;
        _os_log_error_impl(&dword_1CAC16000, v54, OS_LOG_TYPE_ERROR, "Related Collections for Moment Error: Failed to lookup momentID:%@", buf, 0xCu);
      }

      v11 = v64;
      v64[2](v64, 0, v49);
      v50 = 0;
    }

LABEL_36:
    v21 = v65;
    goto LABEL_37;
  }
  v11[2](v11, 0, v23);
LABEL_37:

}

- (void)requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  char *v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint32_t denom;
  uint32_t numer;
  NSObject *v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  os_signpost_id_t spid;
  id v70;
  id v71;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  double v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a6;
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  info = 0;
  mach_timebase_info(&info);
  v14 = v12;
  v15 = v14;
  v68 = v13 - 1;
  spid = v13;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RelatedCollectionsForAssetCollectionRequest", ", buf, 2u);
  }

  v67 = mach_absolute_time();
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)MEMORY[0x1E0D761E8];
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionRelationOptionsKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromPGRelatedType:", objc_msgSend(v18, "unsignedIntegerValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v74 = v9;
    v75 = 2112;
    v76 = *(double *)&v19;
    _os_log_impl(&dword_1CAC16000, v16, OS_LOG_TYPE_INFO, "Related Collections for Asset Collection Request: assetCollectionID:%@ relatedType:%@", buf, 0x16u);

  }
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v21 = objc_msgSend(v20, "isReadyWithError:", &v71);
  v22 = v71;
  if ((v21 & 1) != 0)
  {
    v64 = v20;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionPredicateKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v9;
    if (v23)
    {
      -[PHAStorytellingClientRequestHandler relatedRequestPredicateValidator](self, "relatedRequestPredicateValidator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      v25 = v23;
      v26 = objc_msgSend(v24, "validatePredicate:error:", v23, &v70);
      v27 = v70;

      if ((v26 & 1) == 0)
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v52 = objc_claimAutoreleasedReturnValue();
        v23 = v25;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v74 = (const char *)v25;
          _os_log_error_impl(&dword_1CAC16000, v52, OS_LOG_TYPE_ERROR, "Related Collections for Asset Collection Error: Failed to validate predicate %@", buf, 0xCu);
        }

        v28 = v27;
        v11[2](v11, 0, v27);
        goto LABEL_36;
      }
      objc_msgSend(v25, "allowEvaluation");

      v23 = v25;
    }
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v9, v10, v28);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      v62 = v23;
      v63 = v28;
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v74 = v9;
        v75 = 2112;
        v76 = *(double *)&v65;
        _os_log_impl(&dword_1CAC16000, v29, OS_LOG_TYPE_INFO, "Related Collections for Asset Collection Request: assetCollectionID:%@ is assetCollection:%@", buf, 0x16u);
      }

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionRelationOptionsKey"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "unsignedIntegerValue");

      v32 = 63;
      if (v31)
        v32 = v31;
      v60 = v32;
      v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D761F0]), "initWithOptions:", v10);
      -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "workingContextForRelated");
      v35 = objc_claimAutoreleasedReturnValue();

      v36 = objc_alloc(MEMORY[0x1E0D761E8]);
      -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "blockedFeatures");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)v35;
      v39 = (void *)objc_msgSend(v36, "initWithWorkingContext:blockedFeatures:", v35, v38);

      v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v63);
      v58 = v39;
      v40 = v60;
      v61 = (void *)v33;
      objc_msgSend(v39, "relatedCollectionsForAssetCollection:relatedType:options:curationContext:error:", v65, v40, v33);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v22;

      v56 = v41;
      if (v41)
      {
        objc_msgSend(v41, "valueForKey:", CFSTR("dictionaryRepresentation"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = objc_msgSend(v43, "count");
          *(_DWORD *)buf = 134217984;
          v74 = (const char *)v45;
          _os_log_impl(&dword_1CAC16000, v44, OS_LOG_TYPE_INFO, "Related Collections for Asset Collection Reply: resultsCount:%lu", buf, 0xCu);
        }

        v46 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v49 = v15;
        v50 = v49;
        v9 = v66;
        v23 = v62;
        if (v68 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CAC16000, v50, OS_SIGNPOST_INTERVAL_END, spid, "RelatedCollectionsForAssetCollectionRequest", " enableTelemetry=YES ", buf, 2u);
        }

        v28 = v63;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v74 = "RelatedCollectionsForAssetCollectionRequest";
          v75 = 2048;
          v76 = (float)((float)((float)((float)(v46 - v67) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CAC16000, v50, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        v51 = v42;
        ((void (**)(id, void *, id))v11)[2](v11, v43, v42);

      }
      else
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v55 = objc_claimAutoreleasedReturnValue();
        v9 = v66;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v74 = v66;
          _os_log_error_impl(&dword_1CAC16000, v55, OS_LOG_TYPE_ERROR, "Related Collections for Asset Collection Error: Failed to match assetCollectionID:%@", buf, 0xCu);
        }

        v51 = v42;
        v11[2](v11, 0, v42);
        v23 = v62;
        v28 = v63;
      }
      v53 = v61;

      v22 = v51;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v74 = v9;
        _os_log_error_impl(&dword_1CAC16000, v54, OS_LOG_TYPE_ERROR, "Related Collections for Asset Collection Error: Failed to lookup assetCollectionID:%@", buf, 0xCu);
      }

      v11[2](v11, 0, v53);
    }

LABEL_36:
    v20 = v64;
    goto LABEL_37;
  }
  v11[2](v11, 0, v22);
LABEL_37:

}

- (void)requestAssetCollectionsRelatedToPersonLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a6;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  LOBYTE(a6) = objc_msgSend(v12, "isReadyWithError:", &v40);
  v13 = v40;
  if ((a6 & 1) != 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionPredicateKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[PHAStorytellingClientRequestHandler relatedRequestPredicateValidator](self, "relatedRequestPredicateValidator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v16 = objc_msgSend(v15, "validatePredicate:error:", v14, &v39);
      v17 = v39;

      if ((v16 & 1) == 0)
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v14;
          _os_log_error_impl(&dword_1CAC16000, v33, OS_LOG_TYPE_ERROR, "Related Collections for Face Collection Error: Failed to validate predicate %@", buf, 0xCu);
        }

        v11[2](v11, 0, v17);
        goto LABEL_15;
      }
      objc_msgSend(v14, "allowEvaluation");

    }
    v35 = v12;
    v37 = v14;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionRelationOptionsKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedIntegerValue");

    v20 = 63;
    if (v19)
      v20 = v19;
    v34 = v20;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D761F0]), "initWithOptions:", v10);
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "workingContextForRelated");
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc(MEMORY[0x1E0D761E8]);
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v25 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "blockedFeatures");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v23;
    v28 = v23;
    v17 = (id)v21;
    v29 = (void *)objc_msgSend(v24, "initWithWorkingContext:blockedFeatures:", v28, v27);

    v9 = v25;
    v38 = v13;
    objc_msgSend(v29, "relatedCollectionsForPersonLocalIdentifiers:relatedType:options:error:", v25, v34, v21, &v38);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v38;

    if (v30)
    {
      objc_msgSend(v30, "valueForKey:", CFSTR("dictionaryRepresentation"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, id))v11)[2](v11, v32, v31);

      v9 = v25;
    }
    else
    {
      v11[2](v11, 0, v31);
    }

    v13 = v31;
    v14 = v37;
    v12 = v35;
LABEL_15:

    goto LABEL_16;
  }
  v11[2](v11, 0, v13);
LABEL_16:

}

- (void)requestAssetCollectionsRelatedToAssetWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionPredicateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_4:
    v16 = (void *)MEMORY[0x1E0CD1390];
    v43[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchAssetsWithLocalIdentifiers:options:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v9;
        v41 = 2112;
        v42 = v15;
        _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_INFO, "Related Collections for Asset Request: assetID:%@ is asset:%@", buf, 0x16u);
      }
      v36 = v9;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionRelationOptionsKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");

      if (!v23)
        v23 = 63;
      -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v10;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D761F0]), "initWithOptions:", v10);
      objc_msgSend(v24, "workingContextForRelated");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc(MEMORY[0x1E0D761E8]);
      objc_msgSend(v24, "blockedFeatures");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithWorkingContext:blockedFeatures:", v26, v28);

      v37 = 0;
      objc_msgSend(v29, "relatedCollectionsForAsset:relatedType:options:error:", v15, v23, v25, &v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v37;
      if (v30)
      {
        objc_msgSend(v30, "valueForKey:", CFSTR("dictionaryRepresentation"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v31, v13);

      }
      else
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v36;
          _os_log_error_impl(&dword_1CAC16000, v34, OS_LOG_TYPE_ERROR, "Related Collections for Asset Error: Failed to match asset:%@", buf, 0xCu);
        }

        v11[2](v11, 0, v13);
      }

      v10 = v35;
      v9 = v36;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v9;
        _os_log_error_impl(&dword_1CAC16000, v33, OS_LOG_TYPE_ERROR, "Related Collections for Asset Error: Failed to lookup assetID:%@", buf, 0xCu);
      }

      v11[2](v11, 0, v13);
      v15 = 0;
    }
    goto LABEL_21;
  }
  v13 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8540CC8);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowedKeyPaths:", v14);

  v38 = 0;
  LOBYTE(v14) = objc_msgSend(v13, "validatePredicate:error:", v12, &v38);
  v15 = v38;
  if ((v14 & 1) != 0)
  {
    objc_msgSend(v12, "allowEvaluation");

    goto LABEL_4;
  }
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v12;
    _os_log_error_impl(&dword_1CAC16000, v32, OS_LOG_TYPE_ERROR, "Related Collections for Asset Error: Failed to validate predicate %@", buf, 0xCu);
  }

  v11[2](v11, 0, v15);
LABEL_21:

}

- (void)requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 context:(id)a7 reply:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  id v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, void *, _QWORD))a8;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v18 = objc_msgSend(v17, "isReadyWithError:", &v29);
  v19 = v29;
  if ((v18 & 1) != 0)
  {
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHPhotosGraphOptionReferenceOptions"));
    v27 = a6;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v13, v21, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHPhotosGraphOptionRelatedOptions"));
    v28 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v14, v23, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v20);
    objc_msgSend(v17, "relatedDebugInformationBetweenReferenceAssetCollection:andRelatedAssetCollection:relatedType:curationContext:", v22, v24, v27, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v26, 0);

    v13 = v28;
  }
  else
  {
    ((void (**)(id, void *, id))v16)[2](v16, 0, v19);
  }

}

- (void)requestRelatedDebugInformationBetweenAssetForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 context:(id)a7 reply:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  void *v17;
  char v18;
  id v19;
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
  unint64_t v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, void *, _QWORD))a8;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v18 = objc_msgSend(v17, "isReadyWithError:", &v32);
  v19 = v32;
  if ((v18 & 1) != 0)
  {
    v30 = a6;
    v31 = v14;
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CD1390];
    v33[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "librarySpecificFetchOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fetchAssetsWithLocalIdentifiers:options:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHPhotosGraphOptionRelatedOptions"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v31, v26, v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v20);
      objc_msgSend(v17, "relatedDebugInformationBetweenAsset:andRelatedAssetCollection:relatedType:curationContext:", v25, v27, v30, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, v29, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v16)[2](v16, 0, v27);
    }

    v14 = v31;
  }
  else
  {
    ((void (**)(id, void *, id))v16)[2](v16, 0, v19);
  }

}

- (void)requestSnapshotServiceForRelatedWithMomentLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, const __CFString *, id);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  const __CFString *v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, const __CFString *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v28);
  v11 = v28;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v9, "defaultSnapshotRootPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v7, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v9, "workingContextForRelated");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x1E0D761E8]);
      -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "blockedFeatures");
      v25 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v12;
      v20 = (void *)objc_msgSend(v17, "initWithWorkingContext:blockedFeatures:", v16, v19);

      v27 = v11;
      LODWORD(v19) = objc_msgSend(v20, "exportMatchingResultsForMoment:relatedType:toURL:error:", v15, 63, v13, &v27);
      v21 = v27;

      v22 = (_DWORD)v19 == 0;
      v7 = v25;
      if (v22)
        v23 = CFSTR("failed");
      else
        v23 = CFSTR("success");
      v8[2](v8, v23, v21);

      v12 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("No matching asset collection found for identifier: %@"), v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v16);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v7;
        _os_log_impl(&dword_1CAC16000, v24, OS_LOG_TYPE_INFO, "No matching asset collection found for identifier: %@", buf, 0xCu);
      }

      v8[2](v8, CFSTR("failed"), v21);
    }

    v11 = v21;
  }
  else
  {
    v8[2](v8, CFSTR("failed"), v11);
  }

}

- (void)requestSnapshotServiceForRelatedWithAssetLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, const __CFString *, id);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  const __CFString *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, const __CFString *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v30);
  v11 = v30;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v9, "defaultSnapshotRootPath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:");
    v27 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CD1390];
    v33[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchAssetsWithLocalIdentifiers:options:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v9, "workingContextForRelated");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x1E0D761E8]);
      -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "blockedFeatures");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithWorkingContext:blockedFeatures:", v18, v21);

      v29 = v11;
      v23 = (void *)v27;
      LODWORD(v20) = objc_msgSend(v22, "exportMatchingResultsForAsset:relatedType:toURL:error:", v17, 63, v27, &v29);
      v24 = v29;

      if ((_DWORD)v20)
        v25 = CFSTR("success");
      else
        v25 = CFSTR("failed");
      v8[2](v8, v25, v24);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("No matching asset found for identifier: %@"), v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v18);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v7;
        _os_log_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_INFO, "No matching asset found for identifier: %@", buf, 0xCu);
      }

      v8[2](v8, CFSTR("failed"), v24);
      v23 = (void *)v27;
    }

    v11 = v24;
  }
  else
  {
    v8[2](v8, CFSTR("failed"), v11);
  }

}

- (void)requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 context:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, const __CFString *, id);
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  char v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void (**v52)(id, const __CFString *, id);
  void *v53;
  void *v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, const __CFString *, id))a7;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v61 = 0;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v54, "isReadyWithError:", &v61);
  v14 = v61;
  if ((a7 & 1) != 0)
  {
    v52 = v13;
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CD1390];
    v67[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "librarySpecificFetchOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchAssetsWithLocalIdentifiers:options:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)v20;
    if (v20)
    {
      v48 = v14;
      v50 = v11;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v15;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v15);
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v49 = v12;
      v23 = v12;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v58 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            if (objc_msgSend(v28, "length"))
            {
              -[PHAStorytellingClientRequestHandler _assetCollectionForRelatedIdentifier:](self, "_assetCollectionForRelatedIdentifier:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "relatedDebugInformationBetweenAsset:andRelatedAssetCollection:relatedType:curationContext:", v53, v29, a5, v22);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
                objc_msgSend(v21, "addObject:", v30);

            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        }
        while (v25);
      }

      v31 = v21;
      v15 = v51;
      v13 = v52;
      if (!objc_msgSend(v21, "count"))
        goto LABEL_24;
      objc_msgSend(v54, "defaultSnapshotRootPath");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v32, "stringByAppendingPathComponent:", CFSTR("snapshotAssetAndRelatedDebugInfo.plist"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "fileURLWithPath:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v31, 200, 0, &v56);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v56;
      if (!v37)
      {
        v55 = 0;
        v47 = v35;
        v38 = objc_msgSend(v36, "writeToURL:options:error:", v35, 0, &v55);
        v37 = v55;
        if ((v38 & 1) != 0)
        {
          v15 = v51;
          v35 = v47;
        }
        else
        {
          -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
          v40 = objc_claimAutoreleasedReturnValue();
          v35 = v47;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v63 = (uint64_t)v47;
            v64 = 2114;
            v65 = (uint64_t)v37;
            _os_log_error_impl(&dword_1CAC16000, v40, OS_LOG_TYPE_ERROR, "error in writing to %@ - %{public}@", buf, 0x16u);
          }

          v15 = v51;
        }
      }

      if (!v37)
      {
LABEL_24:
        v41 = objc_msgSend(v31, "count");
        if (v41 == objc_msgSend(v23, "count"))
        {
          v37 = 0;
        }
        else
        {
          -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = objc_msgSend(v31, "count");
            v44 = objc_msgSend(v23, "count");
            *(_DWORD *)buf = 134218240;
            v63 = v43;
            v64 = 2048;
            v65 = v44;
            _os_log_impl(&dword_1CAC16000, v42, OS_LOG_TYPE_INFO, "Related Debug Info requested(%lu) and results(%lu) does not match", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Related Debug Info requested(%lu) and results(%lu) does not match"), objc_msgSend(v23, "count"), objc_msgSend(v31, "count"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v45);
          v37 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      if (v37)
        v46 = CFSTR("failed");
      else
        v46 = CFSTR("success");
      v52[2](v52, v46, v37);

      v12 = v49;
      v11 = v50;
      v14 = v48;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
      v39 = objc_claimAutoreleasedReturnValue();

      v13 = v52;
      v52[2](v52, CFSTR("failed"), (id)v39);
      v14 = (id)v39;
    }

  }
  else
  {
    v13[2](v13, CFSTR("failed"), v14);
  }

}

- (void)requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 additionalSnapshotSummaryInfo:(id)a6 context:(id)a7 reply:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, id);
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  char v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  id v45;
  void (**v46)(_QWORD, const __CFString *, id);
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, id))a8;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v62 = 0;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a8) = objc_msgSend(v52, "isReadyWithError:", &v62);
  v17 = v62;
  v18 = v17;
  if ((a8 & 1) == 0)
  {
    v16[2](v16, 0, v17);
    goto LABEL_41;
  }
  v45 = v17;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v19 = objc_claimAutoreleasedReturnValue();
  v49 = v13;
  v46 = (void (**)(_QWORD, const __CFString *, id))v16;
  v47 = v15;
  if (v13)
  {
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v13, 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v44 = (void *)v19;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v19);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v48 = v14;
  v21 = v14;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v59 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        if (objc_msgSend(v26, "length"))
        {
          -[PHAStorytellingClientRequestHandler _assetCollectionForRelatedIdentifier:](self, "_assetCollectionForRelatedIdentifier:", v26);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v27;
          if (v20)
            v29 = v20;
          else
            v29 = (void *)v27;
          objc_msgSend(v52, "relatedDebugInformationBetweenReferenceAssetCollection:andRelatedAssetCollection:relatedType:curationContext:", v29, v27, a5, v51);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend(v50, "setObject:forKey:", v30, v26);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v23);
  }

  v15 = v47;
  if (v47)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __214__PHAStorytellingClientRequestHandler_Related__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_context_reply___block_invoke;
    v55[3] = &unk_1E8520288;
    v56 = v47;
    v32 = v31;
    v57 = v32;
    objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v55);

  }
  else
  {
    v32 = v50;
  }
  v13 = v49;
  if (objc_msgSend(v32, "count"))
  {
    objc_msgSend(v52, "snapshotOuputFilePathURLForKey:", *MEMORY[0x1E0D764E8]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v32, 200, 0, &v54);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v54;
    if (v35)
    {
      v36 = v35;

LABEL_36:
      goto LABEL_37;
    }
    v53 = 0;
    v37 = objc_msgSend(v34, "writeToURL:options:error:", v33, 0, &v53);
    v36 = v53;
    if ((v37 & 1) == 0)
    {
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v64 = (uint64_t)v33;
        v65 = 2114;
        v66 = (uint64_t)v36;
        _os_log_error_impl(&dword_1CAC16000, v38, OS_LOG_TYPE_ERROR, "error in writing to %@ - %{public}@", buf, 0x16u);
      }

    }
    if (v36)
      goto LABEL_37;
  }
  v39 = objc_msgSend(v32, "count");
  if (v39 != objc_msgSend(v21, "count"))
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = objc_msgSend(v21, "count");
      v42 = objc_msgSend(v32, "count");
      *(_DWORD *)buf = 134218240;
      v64 = v41;
      v65 = 2048;
      v66 = v42;
      _os_log_impl(&dword_1CAC16000, v40, OS_LOG_TYPE_INFO, "Related Debug Info requested(%lu) and results(%lu) does not match", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Related Debug Info requested(%lu) and results(%lu) dose not match"), objc_msgSend(v21, "count"), objc_msgSend(v32, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v33);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v36 = 0;
LABEL_37:
  if (v36)
    v43 = CFSTR("failed");
  else
    v43 = CFSTR("success");
  v16 = (void (**)(id, _QWORD, id))v46;
  v46[2](v46, v43, v36);

  v14 = v48;
  v18 = v45;
LABEL_41:

}

- (id)_assetCollectionForRelatedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v4, 0, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12), v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "fetchedObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObjectsFromArray:", v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v6, 0, 0, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v19;
  }

  return v15;
}

- (void)requestSnapshotServiceForRelatedResultsWithGraphOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, const __CFString *, id);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, const __CFString *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v26);
  v11 = v26;
  if ((v10 & 1) != 0)
  {
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", 0, v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "defaultSnapshotRootPath");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v24, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "workingContextForRelated");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x1E0D761E8]);
      -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "blockedFeatures");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithWorkingContext:blockedFeatures:", v14, v17);

      v25 = v11;
      LODWORD(v17) = objc_msgSend(v18, "exportMatchingResultsForMoment:relatedType:toURL:error:", v13, 63, v23, &v25);
      v19 = v25;

      if ((_DWORD)v17)
        v20 = CFSTR("success");
      else
        v20 = CFSTR("failed");
      v8[2](v8, v20, v19);

      v21 = (void *)v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("No matching asset collection found for a given graph options: %@"), v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v21);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v21;
        _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "Graph Snapshot Error: %{public}@", buf, 0xCu);
      }

      v8[2](v8, CFSTR("failed"), v19);
    }

    v11 = v19;
  }
  else
  {
    v8[2](v8, CFSTR("failed"), v11);
  }

}

- (void)requestSnapshotServiceForPeopleCurationResultsWithGraphOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, const __CFString *, id);
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  PHAStorytellingClientRequestHandler *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  __CFString *v69;
  int v70;
  PHAStorytellingClientRequestHandler *v71;
  void *v72;
  void (**v73)(id, const __CFString *, id);
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *context;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  __CFString *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  uint8_t buf[4];
  const char *v106;
  __int16 v107;
  const __CFString *v108;
  _QWORD v109[2];
  _QWORD v110[2];
  _BYTE v111[128];
  _BYTE v112[128];
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, const __CFString *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0;
  LOBYTE(a5) = objc_msgSend(v11, "isReadyWithError:", &v104);
  v12 = (__CFString *)v104;
  if ((a5 & 1) != 0)
  {
    v77 = v9;
    v78 = v8;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v11;
    objc_msgSend(v11, "curationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v15);
    v75 = v15;
    objc_msgSend(v15, "librarySpecificFetchOptions");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v17);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v84 = (void *)v17;
    v85 = v18;
    v87 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
    v83 = (void *)v16;
    if (v87)
    {
      v88 = *(_QWORD *)v101;
      v73 = v10;
      v74 = v13;
      v71 = self;
      v72 = v14;
      v69 = v12;
      while (2)
      {
        for (i = 0; i != v87; ++i)
        {
          if (*(_QWORD *)v101 != v88)
            objc_enumerationMutation(v18);
          v20 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
          if ((unint64_t)(objc_msgSend(v20, "verifiedType", v69) - 1) <= 1)
          {
            objc_msgSend(v20, "name");
            v86 = v20;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "length");

            if (v22)
            {
              context = (void *)MEMORY[0x1D1798448]();
              objc_msgSend(v86, "localIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "curatedAssetsForPersonLocalIdentifier:progressBlock:", v23, 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              v25 = (void *)MEMORY[0x1E0CD1390];
              v113 = v86;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "fetchAssetsForPersons:options:", v26, v17);
              v27 = objc_claimAutoreleasedReturnValue();

              v81 = (void *)v27;
              objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v27, 0);
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v14, "optimalDurationForAssetCollection:duration:options:curationContext:", v28, 2, MEMORY[0x1E0C9AA70], v16);
              v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75CB0]), "initWithDuration:", v29);
              objc_msgSend(v30, "setIncludesAllFaces:", 1);
              v79 = v30;
              v80 = (void *)v28;
              objc_msgSend(v14, "curatedAssetsForAssetCollection:options:curationContext:progressBlock:", v28, v30, v16, 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = 0u;
              v97 = 0u;
              v98 = 0u;
              v99 = 0u;
              v33 = v24;
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v97;
                while (2)
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v97 != v36)
                      objc_enumerationMutation(v33);
                    v38 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
                    objc_msgSend(v38, "cloudIdentifier");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v39)
                    {
                      v70 = 0;
                      goto LABEL_19;
                    }
                    objc_msgSend(v38, "cloudIdentifier");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "addObject:", v40);

                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
                  if (v35)
                    continue;
                  break;
                }
              }
              v70 = 1;
LABEL_19:

              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v31, "count"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = 0u;
              v93 = 0u;
              v94 = 0u;
              v95 = 0u;
              v42 = v31;
              v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
              if (v43)
              {
                v44 = v43;
                v45 = *(_QWORD *)v93;
                while (2)
                {
                  for (k = 0; k != v44; ++k)
                  {
                    if (*(_QWORD *)v93 != v45)
                      objc_enumerationMutation(v42);
                    v47 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * k);
                    objc_msgSend(v47, "cloudIdentifier");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v48)
                    {

                      v13 = v74;
                      goto LABEL_37;
                    }
                    objc_msgSend(v47, "cloudIdentifier");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "addObject:", v49);

                  }
                  v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
                  v13 = v74;
                  if (v44)
                    continue;
                  break;
                }
              }

              if (!v70)
              {
LABEL_37:

                objc_autoreleasePoolPop(context);
                -[PHAStorytellingClientRequestHandler loggingConnection](v71, "loggingConnection");
                v61 = objc_claimAutoreleasedReturnValue();
                v10 = v73;
                v62 = v83;
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v106 = "-[PHAStorytellingClientRequestHandler(Related) requestSnapshotServiceForPeopleCurationResultsWi"
                         "thGraphOptions:context:reply:]";
                  v107 = 2112;
                  v108 = CFSTR("Error: Should be called on cloud enabled libraries only (cloudIdentifier is nil)");
                  _os_log_error_impl(&dword_1CAC16000, v61, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
                }

                objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 17, CFSTR("Error: Should be called on cloud enabled libraries only (cloudIdentifier is nil)"));
                v52 = (id)objc_claimAutoreleasedReturnValue();
                v73[2](v73, CFSTR("failed"), v52);
                v9 = v77;
                v8 = v78;
                v63 = v75;
                v11 = v76;
                v14 = v72;
                v12 = v69;
                goto LABEL_49;
              }
              v109[0] = CFSTR("people");
              v109[1] = CFSTR("regular");
              v110[0] = v32;
              v110[1] = v41;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "name");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v50, v51);

              objc_autoreleasePoolPop(context);
              v14 = v72;
              v10 = v73;
              v16 = (uint64_t)v83;
              v17 = (uint64_t)v84;
              v18 = v85;
              self = v71;
            }
          }
        }
        v12 = v69;
        v87 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
        if (v87)
          continue;
        break;
      }
    }

    v52 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "defaultGraphExportFullPath");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringByDeletingLastPathComponent");
    v55 = self;
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v56, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v12;
    objc_msgSend(v52, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v57, 1, 0, &v91);
    v58 = v91;
    v59 = v12;
    v12 = v58;

    if (v12)
    {
      -[PHAStorytellingClientRequestHandler loggingConnection](v55, "loggingConnection");
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v106 = "-[PHAStorytellingClientRequestHandler(Related) requestSnapshotServiceForPeopleCurationResultsWithGraphOpt"
               "ions:context:reply:]";
        v107 = 2112;
        v108 = v12;
        _os_log_error_impl(&dword_1CAC16000, v60, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
      }

      v10[2](v10, CFSTR("failed"), v12);
    }
    else
    {
      objc_msgSend(v57, "URLByAppendingPathComponent:", CFSTR("peopleCurationsSnapshot.plist"));
      v89 = objc_claimAutoreleasedReturnValue();
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initWithURL:append:", v89, 0);
      objc_msgSend(v64, "open");
      v90 = 0;
      v65 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v13, v64, 100, 0, &v90);
      v12 = (__CFString *)v90;
      if (v65)
      {
        objc_msgSend(v64, "close");
        -[PHAStorytellingClientRequestHandler loggingConnection](v55, "loggingConnection");
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v66, OS_LOG_TYPE_INFO, "Export matching result done!", buf, 2u);
        }

        v10[2](v10, CFSTR("success"), 0);
        v67 = (void *)v89;
      }
      else
      {
        -[PHAStorytellingClientRequestHandler loggingConnection](v55, "loggingConnection");
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v106 = "-[PHAStorytellingClientRequestHandler(Related) requestSnapshotServiceForPeopleCurationResultsWithGraphO"
                 "ptions:context:reply:]";
          v107 = 2112;
          v108 = v12;
          _os_log_error_impl(&dword_1CAC16000, v68, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
        }

        objc_msgSend(v64, "close");
        v67 = (void *)v89;
        objc_msgSend(v52, "removeItemAtURL:error:", v89, 0);
        v10[2](v10, CFSTR("failed"), v12);
      }

    }
    v8 = v78;

    v11 = v76;
    v9 = v77;
    v63 = v75;
    v62 = v83;
LABEL_49:

  }
  else
  {
    v10[2](v10, 0, v12);
  }

}

void __214__PHAStorytellingClientRequestHandler_Related__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_context_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("matchingResult"));
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("debugInfo"));
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v8);

  }
}

- (void)requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id, _QWORD);
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id, _QWORD))a6;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v13 = objc_msgSend(v12, "isReadyWithError:", &v28);
  v14 = v28;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("PHPeopleSuggestionClientKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = objc_msgSend(v15, "unsignedIntegerValue");
    else
      v17 = 0;
    objc_msgSend(MEMORY[0x1E0D76238], "optionsForClient:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("PHSuggestedRecipientsSharingStreamKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      objc_msgSend(v18, "setSharingStream:", objc_msgSend(v19, "unsignedIntegerValue"));
    v21 = (void *)objc_opt_new();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __126__PHAStorytellingClientRequestHandler_Sharing__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_context_reply___block_invoke;
    v24[3] = &unk_1E85202B0;
    v25 = v12;
    v26 = v18;
    v27 = v21;
    v22 = v21;
    v23 = v18;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v24);
    v11[2](v11, v22, 0);

  }
  else
  {
    ((void (**)(id, id, id))v11)[2](v11, 0, v14);
  }

}

- (void)requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v22);
  v11 = v22;
  if ((v10 & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1E0CD13B8];
    v25[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && objc_msgSend(v17, "assetCollectionType") == 8)
    {
      objc_msgSend(v9, "sharingSuggestionDebugInformationForSuggestion:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v19, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("No matching asset collection (PHSuggestion) found for local identifier: %@"), v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v19;
        _os_log_error_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
      }

      ((void (**)(id, void *, void *))v8)[2](v8, 0, v20);
    }

  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v15);
  v11 = v15;
  if ((v10 & 1) != 0)
  {
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v7, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sharingMessageSuggestionDebugInformationForAssetCollection:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v14, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestTextFeaturesForMomentLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v13);
  v11 = v13;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v9, "textFeaturesForMomentLocalIdentifiers:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v12, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:(id)a3 withOptions:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, id);
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t, id))a6;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = objc_msgSend(v12, "isReadyWithError:", &v19);
  v14 = v19;
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    v18 = v14;
    v16 = objc_msgSend(v12, "generateDefaultRulesForLibraryScopeWithLocalIdentifier:withOptions:error:", v9, v10, &v18);
    v17 = v18;

    v11[2](v11, v16, v17);
    v15 = v17;
  }
  else
  {
    v11[2](v11, 0, v14);
  }

}

- (void)requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers:(id)a3 withOptions:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a6;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = objc_msgSend(v12, "isReadyWithError:", &v19);
  v14 = v19;
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    v18 = v14;
    objc_msgSend(v12, "suggestedMomentLocalIdentifiersForPersonLocalIdentifiers:withOptions:error:", v9, v10, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;

    v11[2](v11, v16, v17);
    v15 = v17;
  }
  else
  {
    v11[2](v11, 0, v14);
  }

}

- (void)requestStartSharedLibrarySuggestionResultWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, uint64_t, id);
  void *v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v5 = (void (**)(id, uint64_t, id))a4;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v6, "isReadyWithError:", &v13);
  v8 = v13;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    v12 = v8;
    v10 = objc_msgSend(v6, "suggestsToStartSharedLibraryWithError:", &v12);
    v11 = v12;

    v5[2](v5, v10, v11);
    v9 = v11;
  }
  else
  {
    v5[2](v5, 0, v8);
  }

}

- (void)requestCameraSmartSharingProcessingForLibraryScopeWithUUID:(id)a3 withOptions:(id)a4 context:(id)a5 reply:(id)a6
{
  id v8;
  void (**v9)(id, void *, id);
  void *v10;
  PHACameraSmartSharingTask *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, id))a6;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(PHACameraSmartSharingTask);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CD15E0], "localIdentifierWithUUID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHACameraSmartSharingTask setLibraryScopeLocalIdentifier:](v11, "setLibraryScopeLocalIdentifier:", v12);

  }
  objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v14 = -[PHACameraSmartSharingTask runWithGraphManager:progressReporter:error:](v11, "runWithGraphManager:progressReporter:error:", v10, v13, &v18);
  v15 = v18;

  v19 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v17, v15);
}

- (void)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  PHAStorytellingClientRequestHandler *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  PHASharedLibrarySuggestionGenerationTask *v15;
  char v16;
  PHASharedLibrarySuggestionGenerationTask *v17;
  PHASharedLibrarySuggestionGenerationTask *v18;
  PHAStorytellingClientRequestHandler *v19;
  PHASharedLibrarySuggestionGenerationTask *v20;
  PHASharedLibrarySuggestionGenerationTask *v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  v8 = self;
  objc_sync_enter(v8);
  if (requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress)
    objc_msgSend((id)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress, "cancelOperation");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A70]), "initWithProgressBlock:", &__block_literal_global_3259);
  objc_storeStrong((id *)&requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress, v9);
  objc_sync_exit(v8);

  -[PHAStorytellingClientRequestHandler graphManager](v8, "graphManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  v23 = 0;
  v12 = +[PHASharedLibrarySuggestionGenerationTask resetSuggestionsWithGraphManager:error:](PHASharedLibrarySuggestionGenerationTask, "resetSuggestionsWithGraphManager:error:", v10, &v23);
  v13 = v23;
  if (!v12)
  {
    v14 = 0;
    goto LABEL_16;
  }
  if (!PLIsSharedLibrarySuggestionsEnabled())
  {
    v14 = 1;
    goto LABEL_16;
  }
  v22 = 0;
  v14 = objc_msgSend(v10, "isReadyWithError:", &v22);
  v15 = (PHASharedLibrarySuggestionGenerationTask *)v22;
  if (v9 == (void *)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress)
    v16 = 0;
  else
    v16 = v14;
  if ((v16 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    v17 = (PHASharedLibrarySuggestionGenerationTask *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
LABEL_14:

    v15 = v17;
    goto LABEL_15;
  }
  if ((_DWORD)v14)
  {
    v18 = -[PHASharedLibrarySuggestionGenerationTask initWithTaskType:]([PHASharedLibrarySuggestionGenerationTask alloc], "initWithTaskType:", 0);
    v21 = v15;
    v14 = -[PHASharedLibrarySuggestionGenerationTask runWithGraphManager:progressReporter:error:](v18, "runWithGraphManager:progressReporter:error:", v10, v9, &v21);
    v20 = v18;
    v17 = v21;

    v15 = v20;
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  objc_sync_exit(v11);

  v19 = v8;
  objc_sync_enter(v19);
  if ((void *)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress == v9)
  {
    requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress = 0;

  }
  objc_sync_exit(v19);

  v7[2](v7, v14, v13);
}

void __126__PHAStorytellingClientRequestHandler_Sharing__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_context_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *context;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  void *v27;
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  context = (void *)MEMORY[0x1D1798448]();
  v21 = v5;
  objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1670], "localIdentifierWithUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v28[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suggestedRecipientsForAssetLocalIdentifiers:momentLocalIdentifiers:sharingOptions:", v10, v11, *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "dictionaryRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v13, v7);
  objc_autoreleasePoolPop(context);

}

- (void)requestTitleForCollectionMomentListWithLocalIdentifier:(id)a3 format:(int64_t)a4 context:(id)a5 reply:(id)a6
{
  void (**v9)(id, void *, void *, id);
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v9 = (void (**)(id, void *, void *, id))a6;
  -[PHAStorytellingClientRequestHandler _collectionListForLocalIdentifier:](self, "_collectionListForLocalIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PHAStorytellingClientRequestHandler _titleTupleFormatForPhotoAnalysisTitleFormat:](self, "_titleTupleFormatForPhotoAnalysisTitleFormat:", a4);
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v12, "titleTupleForMomentList:format:error:", v10, v11, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;

  objc_msgSend(v13, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v16, v18, v14);

}

- (void)requestTitleForAssetCollectionWithLocalIdentifier:(id)a3 format:(int64_t)a4 context:(id)a5 reply:(id)a6
{
  void (**v9)(id, void *, void *, id);
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v9 = (void (**)(id, void *, void *, id))a6;
  v10 = a3;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:options:photoLibrary:](PHAStorytellingClientRequestUtils, "assetCollectionForLocalIdentifier:options:photoLibrary:", v10, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PHAStorytellingClientRequestHandler _titleTupleFormatForPhotoAnalysisTitleFormat:](self, "_titleTupleFormatForPhotoAnalysisTitleFormat:", a4);
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v14, "titleTupleForAssetCollection:format:error:", v12, v13, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;

  objc_msgSend(v15, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v18, v20, v16);

}

- (void)requestTitleForPersonLocalIdentifiers:(id)a3 format:(int64_t)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  void (**v10)(id, void *, void *, id);
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = (void (**)(id, void *, void *, id))a6;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v11, "isReadyWithError:", &v21);
  v13 = v21;
  if ((v12 & 1) != 0)
  {
    v20 = v13;
    objc_msgSend(v11, "titleTupleForPersonLocalIdentifiers:format:error:", v9, -[PHAStorytellingClientRequestHandler _titleTupleFormatForPhotoAnalysisTitleFormat:](self, "_titleTupleFormatForPhotoAnalysisTitleFormat:", a4), &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;

    objc_msgSend(v14, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subtitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v17, v19, v15);

    v13 = v15;
  }
  else
  {
    v10[2](v10, 0, 0, v13);
  }

}

- (id)_collectionListForLocalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CD14E0];
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchCollectionListsWithLocalIdentifiers:options:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)_titleTupleFormatForPhotoAnalysisTitleFormat:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (void)simulateMemoriesNotificationWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  PHAStorytellingClientRequestHandler *v28;
  NSObject *v29;
  int64_t v30;
  void *v31;
  void *v32;
  PHANotificationController *v33;
  void *v34;
  void *v35;
  int v36;
  PHANotificationController *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  dispatch_time_t v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  int64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  PHAStorytellingClientRequestHandler *v55;
  void *v56;
  id v57;
  id v58;
  _QWORD block[4];
  id v60;
  id v61;
  PHAStorytellingClientRequestHandler *v62;
  id v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  double v70;
  __int16 v71;
  const __CFString *v72;
  _BYTE v73[128];
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v53 = a4;
  v58 = a5;
  v55 = self;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v10);

  objc_msgSend(v8, "setIncludePendingMemories:", 0);
  objc_msgSend(v8, "setIncludeRejectedMemories:", 0);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v66 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v20, "creationDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(v13, "startOfDayForDate:", v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v17, "compare:", v21) != 1)
          objc_msgSend(v12, "addObject:", v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("PhotoAnalysisNotificationSimulationDelayOverride"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v57;
    v25 = v58;
    v51 = v23;
    if (v23)
    {
      objc_msgSend(v23, "doubleValue");
      v27 = v26;
      v28 = v55;
      -[PHAStorytellingClientRequestHandler loggingConnection](v55, "loggingConnection");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v70 = v27;
        v71 = 2112;
        v72 = CFSTR("PhotoAnalysisNotificationSimulationDelayOverride");
        _os_log_impl(&dword_1CAC16000, v29, OS_LOG_TYPE_INFO, "[Memories Notification] Simulation: overriding notification delay with time interval %.2f because of user defaults %@", buf, 0x16u);
      }

      v30 = (uint64_t)(v27 * 1000000000.0);
    }
    else
    {
      v30 = 5000000000;
      v28 = v55;
    }
    v50 = v8;
    if (!v57)
    {
      v42 = 1;
LABEL_31:
      v43 = dispatch_time(0, v30);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __101__PHAStorytellingClientRequestHandler_Memory__simulateMemoriesNotificationWithOptions_context_reply___block_invoke;
      block[3] = &unk_1E8520618;
      v32 = v54;
      v60 = v54;
      v61 = v52;
      v64 = v42;
      v62 = v55;
      v63 = v25;
      v44 = v52;
      dispatch_after(v43, MEMORY[0x1E0C80D38], block);

      v8 = v50;
      v31 = v51;
      goto LABEL_32;
    }
    objc_msgSend(v57, "objectForKey:", CFSTR("notificationState"));
    v33 = (PHANotificationController *)objc_claimAutoreleasedReturnValue();
    v49 = -[PHAStorytellingClientRequestHandler _validatedMemoryNotificationState:](v28, "_validatedMemoryNotificationState:", -[PHANotificationController intValue](v33, "intValue"));
    objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("checkEligibility"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
      goto LABEL_27;
    v35 = v34;
    v36 = objc_msgSend(v34, "BOOLValue");

    if (!v36)
    {
      v24 = v57;
      goto LABEL_30;
    }
    v48 = v30;
    v37 = [PHANotificationController alloc];
    -[PHAStorytellingClientRequestHandler graphManager](v28, "graphManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PHANotificationController initWithGraphManager:](v37, "initWithGraphManager:", v38);

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F8]), "initWithPhotoLibrary:", v54);
    objc_msgSend(v52, "blockableFeatures");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[PHANotificationController userFeedbackScoreIsAcceptableForAssetCollection:memoryFeatures:userFeedbackCalculator:](v33, "userFeedbackScoreIsAcceptableForAssetCollection:memoryFeatures:userFeedbackCalculator:", v52, v40, v39);

    if (v41)
    {

      v24 = v57;
      v30 = v48;
LABEL_27:

LABEL_30:
      v25 = v58;
      v42 = v49;
      goto LABEL_31;
    }
    v56 = v39;
    -[PHAStorytellingClientRequestHandler loggingConnection](v28, "loggingConnection");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v52, "localIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v70 = *(double *)&v46;
      _os_log_impl(&dword_1CAC16000, v45, OS_LOG_TYPE_INFO, "[Memories Notification] Not firing notification for memory %@: user feedback score is lower than acceptable.", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 16, CFSTR("Latest memory is not eligible for notification"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v58;
    (*((void (**)(id, _QWORD, void *))v58 + 2))(v58, 0, v47);

    v31 = v52;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 5, CFSTR("No memories are available for simulating notification"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v58;
    (*((void (**)(id, _QWORD, void *))v58 + 2))(v58, 0, v31);
  }
  v24 = v57;
  v32 = v54;
LABEL_32:

}

- (unint64_t)_validatedMemoryNotificationState:(int)a3
{
  if (a3 >= 3)
    return 0;
  else
    return a3;
}

- (void)requestMemoryDebugInformationForMemoryWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
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
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v32);
  v11 = v32;
  if ((v10 & 1) != 0)
  {
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier == %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v14);

    objc_msgSend(v13, "setIncludePendingMemories:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v28 = v15;
      v29 = v12;
      v30 = v11;
      v31 = v7;
      objc_msgSend(v12, "librarySpecificFetchOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSortDescriptors:", v19);

      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsBackingMemory:options:", v16, v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fetchedObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "photosGraphProperties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("info"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("meaningLabels"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "memoryDebugInformationWithMoments:meaningLabels:", v20, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v8[2](v8, v26, 0);
      v11 = v30;
      v7 = v31;
      v15 = v28;
      v12 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v8)[2](v8, 0, v17);
    }

  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestCurationOfLength:(unint64_t)a3 forMemoryForLocalIdentifier:(id)a4 withOptions:(id)a5 context:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, _QWORD))a7;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFetchLimit:", 1);
  objc_msgSend(v15, "setIncludePendingMemories:", 1);
  objc_msgSend(v15, "setIncludeRejectedMemories:", 1);
  objc_msgSend(v15, "setIncludeLocalMemories:", 1);
  v16 = objc_alloc(MEMORY[0x1E0D77E08]);
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithPhotoLibrary:", v17);

  v19 = (void *)MEMORY[0x1E0CD13B8];
  v28[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fetchAssetCollectionsWithLocalIdentifiers:options:", v20, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1CF0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "curationOfLength:forMemory:customDuration:useAssetEligibility:curationContext:", a3, v22, 1, v18, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, v27, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v13)[2](v13, 0, v27);
  }

}

- (void)reloadForYouWidgetTimelineWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, _BOOL8, id);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _BOOL8 v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = (void (**)(id, _BOOL8, id))a4;
  if (PLIsFeaturedContentAllowed())
  {
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAMemoryElectionTask findAndSetFeaturedStateForMemoriesAndSuggestionsIfNeededInPhotoLibrary:loggingConnection:](PHAMemoryElectionTask, "findAndSetFeaturedStateForMemoriesAndSuggestionsIfNeededInPhotoLibrary:loggingConnection:", v8, v9);

  }
  else
  {
    -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_INFO, "Featured content is disabled when reloading widget", buf, 2u);
    }

  }
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = +[PHAMemoryElectionTask reloadForYouWidgetTimelineWithLoggingConnection:error:](PHAMemoryElectionTask, "reloadForYouWidgetTimelineWithLoggingConnection:error:", v11, &v14);
  v13 = v14;

  v5[2](v5, v12, v13);
}

- (void)reloadAlbumWidgetTimelineWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, _BOOL8, id);
  void *v6;
  _BOOL8 v7;
  id v8;
  id v9;

  v5 = (void (**)(id, _BOOL8, id))a4;
  -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v7 = +[PHAMemoryElectionTask reloadAlbumWidgetTimelineWithLoggingConnection:error:](PHAMemoryElectionTask, "reloadAlbumWidgetTimelineWithLoggingConnection:error:", v6, &v9);
  v8 = v9;

  v5[2](v5, v7, v8);
}

void __101__PHAStorytellingClientRequestHandler_Memory__simulateMemoriesNotificationWithOptions_context_reply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  PHANotificationController *v7;
  void *v8;
  PHANotificationController *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__PHAStorytellingClientRequestHandler_Memory__simulateMemoriesNotificationWithOptions_context_reply___block_invoke_2;
  v13[3] = &unk_1E85205F0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v14 = v3;
  v15 = v4;
  v12 = 0;
  v5 = objc_msgSend(v2, "performChangesAndWait:error:", v13, &v12);
  v6 = v12;
  if (*(_QWORD *)(a1 + 64) == 1)
  {
    v7 = [PHANotificationController alloc];
    objc_msgSend(*(id *)(a1 + 48), "graphManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PHANotificationController initWithGraphManager:](v7, "initWithGraphManager:", v8);

    -[PHANotificationController postNotificationForMemory:withCreationReason:forceImmediateDelivery:](v9, "postNotificationForMemory:withCreationReason:forceImmediateDelivery:", *(_QWORD *)(a1 + 40), 0, 1);
  }
  if (v5)
  {
    v10 = MEMORY[0x1E0C9AA70];
    v11 = 0;
  }
  else
  {
    v10 = 0;
    v11 = v6;
  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v10, v11);

}

void __101__PHAStorytellingClientRequestHandler_Memory__simulateMemoriesNotificationWithOptions_context_reply___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNotificationState:", *(_QWORD *)(a1 + 40));

}

- (void)requestKeyAssetLocalIdentifierForPrototypeCategory:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Utility")))
  {
    -[PHAStorytellingClientRequestHandler _utilityAssetLocalIdentifiersForKeyAssetOnly:](self, "_utilityAssetLocalIdentifiersForKeyAssetOnly:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
        if (objc_msgSend(v14, "count"))
          break;
        if (v11 == (void *)++v13)
        {
          v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_22;
        }
      }
LABEL_21:
      objc_msgSend(v14, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Places")))
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support category: %@"), "-[PHAStorytellingClientRequestHandler(Prototype) requestKeyAssetLocalIdentifierForPrototypeCategory:context:reply:]", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pl_analysisErrorWithCode:localizedDescription:", 2, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v19);

      v11 = 0;
      goto LABEL_24;
    }
    -[PHAStorytellingClientRequestHandler _asssetLocalIdentifiersByCityNameForKeyAssetOnly:](self, "_asssetLocalIdentifiersByCityNameForKeyAssetOnly:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v11)
    {
      v15 = *(_QWORD *)v21;
LABEL_14:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
        if (objc_msgSend(v14, "count"))
          goto LABEL_21;
        if (v11 == (void *)++v16)
        {
          v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v11)
            goto LABEL_14;
          break;
        }
      }
    }
  }
LABEL_22:

LABEL_24:
  ((void (**)(id, void *, void *))v8)[2](v8, v11, 0);

}

- (void)requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  void (**v6)(id, id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v9);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v11);

  objc_msgSend(v8, "setFetchLimit:", 10);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "localIdentifier", (_QWORD)v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  v6[2](v6, v13, 0);
}

- (void)requestTrendsByIdentifierWithCadence:(id)a3 forYear:(unint64_t)a4 context:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  void *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("daily"));
  if (a4 == 2022 || v13)
  {
    v36 = v12;
    v37 = v11;
    v38 = v10;
    -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v45[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFetchPropertySets:", v16);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSortDescriptors:", v18);

    objc_msgSend(v15, "setFetchLimit:", 250);
    v35 = v15;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v22 = v19;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v40;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v26);
          if ((unint64_t)objc_msgSend(v21, "count") > 0x18)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "UUIDString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v30);

            v31 = (void *)MEMORY[0x1E0C99DE8];
            objc_msgSend(v27, "localIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "arrayWithObject:", v28);
            v32 = objc_claimAutoreleasedReturnValue();

            v21 = (id)v32;
          }
          else
          {
            objc_msgSend(v27, "localIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v28);
          }

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v24);
    }

    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "UUIDString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v34);

    }
    v12 = v36;
    (*((void (**)(id, id, _QWORD))v36 + 2))(v36, v20, 0);

    v11 = v37;
    v10 = v38;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, MEMORY[0x1E0C9AA70], 0);
  }

}

- (void)requestUtilityAssetLocalIdentifiersWithContext:(id)a3 reply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PHAStorytellingClientRequestHandler _utilityAssetLocalIdentifiersForKeyAssetOnly:](self, "_utilityAssetLocalIdentifiersForKeyAssetOnly:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v6, v7, 0);

}

- (id)_utilityAssetLocalIdentifiersForKeyAssetOnly:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id obj;
  id v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL4 v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[8];
  _QWORD v68[8];
  _BYTE v69[128];
  _BYTE v70[128];
  _QWORD v71[2];
  _QWORD v72[4];

  v54 = a3;
  v72[2] = *MEMORY[0x1E0C80C00];
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalSortDescriptors:", v8);

  v9 = *MEMORY[0x1E0CD19F0];
  v71[0] = *MEMORY[0x1E0CD1A50];
  v71[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v10);

  v11 = objc_alloc(MEMORY[0x1E0C99D20]);
  v43 = v5;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithArray:", v13);

  v42 = objc_alloc_init(MEMORY[0x1E0D77E18]);
  objc_msgSend(v42, "prepareAssets:", v14);
  objc_msgSend(MEMORY[0x1E0CD1390], "prefetchScenesOnAssets:", v14);
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v14;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v64;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v64 != v52)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v15);
        objc_msgSend(v16, "curationModel", v41);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sceneModel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sceneClassifications");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sceneNamesFromSceneClassifications:passingThresholdOfType:", v19, 2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "curationModel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = objc_msgSend(v20, "isMemeExclusiveWithAsset:", v16);

        if ((_DWORD)v19)
        {
          objc_msgSend(v16, "localIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v21);

        }
        v55 = v15;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(v16, "sceneClassifications");
        v57 = (id)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        if (v22)
        {
          v23 = v22;
          v24 = 0;
          v25 = 0;
          v58 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v60 != v58)
                objc_enumerationMutation(v57);
              v27 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
              objc_msgSend(v16, "curationModel");
              v28 = v16;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "junkClassificationModel");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "receiptOrDocumentNode");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "passesHighPrecisionWithSignal:", v27);

              v16 = v28;
              v25 |= v32;
              objc_msgSend(v28, "curationModel");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "junkClassificationModel");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "screenshotNode");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v27) = objc_msgSend(v35, "passesHighPrecisionWithSignal:", v27);

              v24 |= v27;
            }
            v23 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
          }
          while (v23);
        }
        else
        {
          v24 = 0;
          v25 = 0;
        }

        if ((objc_msgSend(v56, "containsObject:", CFSTR("whiteboard")) & 1) != 0
          || objc_msgSend(v56, "containsObject:", CFSTR("chalkboard")))
        {
          objc_msgSend(v16, "localIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v51;
          goto LABEL_20;
        }
        if ((objc_msgSend(v56, "containsObject:", CFSTR("ticket")) & 1) != 0
          || objc_msgSend(v56, "containsObject:", CFSTR("coupon")))
        {
          objc_msgSend(v16, "localIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v48;
          goto LABEL_20;
        }
        if (objc_msgSend(v56, "containsObject:", CFSTR("menu")))
        {
          objc_msgSend(v16, "localIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v47;
          goto LABEL_20;
        }
        if (objc_msgSend(v56, "containsObject:", CFSTR("recipe")))
        {
          objc_msgSend(v16, "localIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v46;
          goto LABEL_20;
        }
        if ((v24 & 1) != 0)
        {
          objc_msgSend(v16, "localIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v45;
          goto LABEL_20;
        }
        if ((v25 & 1) != 0)
        {
          objc_msgSend(v16, "localIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v44;
LABEL_20:
          objc_msgSend(v37, "addObject:", v36);

          if (v54)
            goto LABEL_38;
          goto LABEL_21;
        }
        if (v54)
        {
LABEL_38:

          goto LABEL_39;
        }
LABEL_21:

        v15 = v55 + 1;
      }
      while (v55 + 1 != v53);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      v53 = v38;
    }
    while (v38);
  }
LABEL_39:

  v67[0] = CFSTR("receipt");
  v67[1] = CFSTR("document");
  v68[0] = v41;
  v68[1] = v44;
  v67[2] = CFSTR("whiteboard");
  v67[3] = CFSTR("screenCapture");
  v68[2] = v51;
  v68[3] = v45;
  v67[4] = CFSTR("ticket");
  v67[5] = CFSTR("menu");
  v68[4] = v48;
  v68[5] = v47;
  v67[6] = CFSTR("receipe");
  v67[7] = CFSTR("meme");
  v68[6] = v46;
  v68[7] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (void)requestConfidenceByMomentLocalIdentifierForMeaning:(id)a3 useAlternativeMeaningEdge:(BOOL)a4 onlyHighPrecision:(BOOL)a5 context:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, uint64_t, _QWORD);
  void *v15;
  char v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id v30;

  v12 = a3;
  v13 = a6;
  v14 = (void (**)(id, uint64_t, _QWORD))a7;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v16 = objc_msgSend(v15, "isReadyWithError:", &v30);
  v17 = v30;
  if ((v16 & 1) != 0)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__6148;
    v28 = __Block_byref_object_dispose__6149;
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v15, "workingContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke;
    v19[3] = &unk_1E8520B08;
    v22 = a5;
    v20 = v12;
    v21 = &v24;
    v23 = a4;
    objc_msgSend(v18, "performSynchronousConcurrentGraphReadUsingBlock:", v19);

    v14[2](v14, v25[5], 0);
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    ((void (**)(id, uint64_t, id))v14)[2](v14, 0, v17);
  }

}

- (void)requestAssetLocalIdentifiersByCityNameWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;

  v5 = (void (**)(id, void *, _QWORD))a4;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v6, "isReadyWithError:", &v10);
  v8 = v10;
  if ((v7 & 1) != 0)
  {
    -[PHAStorytellingClientRequestHandler _asssetLocalIdentifiersByCityNameForKeyAssetOnly:](self, "_asssetLocalIdentifiersByCityNameForKeyAssetOnly:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v9, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v5)[2](v5, 0, v8);
  }

}

- (id)_asssetLocalIdentifiersByCityNameForKeyAssetOnly:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6148;
  v15 = __Block_byref_object_dispose__6149;
  v16 = 0;
  objc_msgSend(v3, "workingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__PHAStorytellingClientRequestHandler_Prototype___asssetLocalIdentifiersByCityNameForKeyAssetOnly___block_invoke;
  v8[3] = &unk_1E8520B58;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performSynchronousConcurrentGraphReadUsingBlock:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)requestMeaningScoreDebugDescriptionForMomentLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, id, _QWORD);
  void *v9;
  char v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = (void (**)(id, id, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v22);
  v11 = v22;

  if ((v10 & 1) != 0)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v13 = objc_alloc_init(MEMORY[0x1E0D75D00]);
    -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "workingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke;
    v18[3] = &unk_1E8520BA8;
    v19 = v7;
    v20 = v12;
    v21 = v13;
    v16 = v13;
    v17 = v12;
    objc_msgSend(v15, "performSynchronousConcurrentGraphReadUsingBlock:", v18);

    v8[2](v8, v17, 0);
  }
  else
  {
    ((void (**)(id, id, id))v8)[2](v8, 0, v11);
  }

}

void __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v3 = a2;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D75FD8];
  objc_msgSend(MEMORY[0x1E0CD1670], "uuidFromLocalIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentNodeForUUID:inGraph:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("Meaning Edges"));
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = (unsigned __int16)*MEMORY[0x1E0D764D0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke_2;
  v23[3] = &unk_1E8520B80;
  v24 = *(id *)(a1 + 48);
  v25 = *(id *)(a1 + 40);
  v26 = &v27;
  objc_msgSend(v8, "enumerateMeaningEdgesAndNodesWithDomain:block:", v10, v23);
  if (!*((_BYTE *)v28 + 24))
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n    None"));
  objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n\nAlternative Meaning Edges"));
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v11 = (unsigned __int16)*MEMORY[0x1E0D764C8];
  v12 = v9;
  v13 = 3221225472;
  v14 = __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke_3;
  v15 = &unk_1E8520B80;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 40);
  v18 = &v19;
  objc_msgSend(v8, "enumerateMeaningEdgesAndNodesWithDomain:block:", v11, &v12);
  if (!*((_BYTE *)v20 + 24))
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n    None"), v12, v13, v14, v15, v16);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v27, 8);

}

void __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  +[PHAStorytellingClientRequestHandler _descriptionForMeaningNode:meaningEdge:configuration:](PHAStorytellingClientRequestHandler, "_descriptionForMeaningNode:meaningEdge:configuration:", a3, a2, *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n    %@"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:", v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  +[PHAStorytellingClientRequestHandler _descriptionForMeaningNode:meaningEdge:configuration:](PHAStorytellingClientRequestHandler, "_descriptionForMeaningNode:meaningEdge:configuration:", a3, a2, *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n    %@"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:", v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __99__PHAStorytellingClientRequestHandler_Prototype___asssetLocalIdentifiersByCityNameForKeyAssetOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(a2, "graph");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "interestingCityNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__PHAStorytellingClientRequestHandler_Prototype___asssetLocalIdentifiersByCityNameForKeyAssetOnly___block_invoke_2;
  v10[3] = &unk_1E8520B30;
  v11 = *(id *)(a1 + 32);
  v5 = v3;
  v12 = v5;
  objc_msgSend(v4, "enumerateIdentifiersAsCollectionsWithBlock:", v10);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

}

void __99__PHAStorytellingClientRequestHandler_Prototype___asssetLocalIdentifiersByCityNameForKeyAssetOnly___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuids");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("uuid in %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 3, 0x7FFFFFFFFFFFFFFFLL, v6);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInternalSortDescriptors:", v16);

  v28 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollections:options:", v11, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v23), "localIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v21);
  }

  v25 = *(void **)(a1 + 40);
  objc_msgSend(v4, "names");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, v27);

}

void __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  __int16 v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D75FA8];
  v9[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meaningNodesWithMeaningLabels:inGraph:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke_2;
  v7[3] = &unk_1E8520AE0;
  v8 = *(_WORD *)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v7);

}

void __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke_3;
  v8 = &unk_1E8520AB8;
  LOBYTE(v10) = *(_BYTE *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = _Block_copy(&v5);
  if (*(_BYTE *)(a1 + 41))
    objc_msgSend(v3, "enumerateMomentAlternativeEdgesAndNodesUsingBlock:", v4, v5, v6, v7, v8, v9, v10);
  else
    objc_msgSend(v3, "enumerateMomentEdgesAndNodesUsingBlock:", v4, v5, v6, v7, v8, v9, v10);

}

void __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (!*(_BYTE *)(a1 + 40) || objc_msgSend(v10, "isHighPrecision"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "confidence");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v5, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
}

+ (id)_descriptionForMeaningNode:(id)a3 meaningEdge:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "confidence");
  v11 = v10;
  v12 = objc_msgSend(v8, "domain");

  if (+[PHAStorytellingClientRequestHandler _isMeaningInferenceFromEventLabelingModel:meaningEdgeDomain:configuration:](PHAStorytellingClientRequestHandler, "_isMeaningInferenceFromEventLabelingModel:meaningEdgeDomain:configuration:", v9, v12, v7))
  {
    objc_msgSend(v7, "highPrecisionThresholdForMeaningLabel:", v9);
    v14 = v13;
    objc_msgSend(v7, "highRecallThresholdForMeaningLabel:", v9);
    v16 = CFSTR("🌅");
  }
  else
  {
    v16 = CFSTR("🏙");
    v15 = 0;
    v14 = 0x3FE51EB851EB851FLL;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ (conf: %.2f, p: %.2f, r: %.2f)"), v16, v9, v11, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)_isMeaningInferenceFromEventLabelingModel:(id)a3 meaningEdgeDomain:(unsigned __int16)a4 configuration:(id)a5
{
  int v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D75D00], "isEventLabelingEnabled"))
  {
    if (objc_msgSend(MEMORY[0x1E0D75D00], "usePrimaryMeaningDomainForEventLabelingMeanings"))
    {
      objc_msgSend(v8, "meaningLabelsForEventLabeling");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v7);
      if ((unsigned __int16)*MEMORY[0x1E0D764D0] == v6)
        v11 = v10;
      else
        v11 = 0;

    }
    else
    {
      v11 = (unsigned __int16)*MEMORY[0x1E0D764C8] == v6;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PHAStorytellingClientRequestHandler)initWithGraphManager:(id)a3
{
  id v5;
  PHAStorytellingClientRequestHandler *v6;
  PHAStorytellingClientRequestHandler *v7;
  void *v8;
  uint64_t v9;
  PHPhotoLibrary *photoLibrary;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *executionQueue;
  NSMutableDictionary *v15;
  NSMutableDictionary *progressReporterByQueryID;
  os_log_t v17;
  OS_os_log *loggingConnection;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *musicRequestQueue;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PHAStorytellingClientRequestHandler;
  v6 = -[PHAStorytellingClientRequestHandler init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    -[PGManager workingContext](v7->_graphManager, "workingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v9 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v9;

    v11 = MEMORY[0x1E0C80D50];
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.photoanalysisd.storytellinghandler", v12);
    executionQueue = v7->_executionQueue;
    v7->_executionQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    progressReporterByQueryID = v7->_progressReporterByQueryID;
    v7->_progressReporterByQueryID = v15;

    v17 = os_log_create("com.apple.photoanalysisd", "clientqueryhandler");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v17;

    dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.photoanalysisd.storytellinghandler.music", v19);
    musicRequestQueue = v7->_musicRequestQueue;
    v7->_musicRequestQueue = (OS_dispatch_queue *)v20;

  }
  return v7;
}

- (void)handleOperation:(id)a3
{
  id v4;
  NSObject *executionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  executionQueue = self->_executionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PHAStorytellingClientRequestHandler_handleOperation___block_invoke;
  v7[3] = &unk_1E85211E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(executionQueue, v7);

}

- (BOOL)validateOperation:(id)a3 forConnection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  objc_msgSend(a3, "invocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selector");

  LOBYTE(v7) = -[PHAStorytellingClientRequestHandler validateSelector:forConnection:](self, "validateSelector:forConnection:", v8, v6);
  return (char)v7;
}

- (BOOL)validateSelector:(SEL)a3 forConnection:(id)a4
{
  void *v7;
  void *v8;
  BOOL v9;

  if (sel_requestGraphInferencesSummaryWithMomentLocalIdentifiers_context_reply_ != a3
    && sel_requestGraphMomentLocalIdentifiersWithDateInterval_context_reply_ != a3
    && sel_requestGraphInferencesSummaryWithDateInterval_context_reply_ != a3
    && sel_requestCurationScoreByAssetUUIDForAssetUUIDs_context_reply_ != a3)
  {
    return 1;
  }
  objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.private.photos.storytelling.inferenceSummary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v7 && (objc_msgSend(v7, "BOOLValue") & 1) != 0;

  return v9;
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (OS_dispatch_queue)musicRequestQueue
{
  return self->_musicRequestQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicRequestQueue, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_progressReporterByQueryID, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
}

uint64_t __55__PHAStorytellingClientRequestHandler_handleOperation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  qos_class_t v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 40);
    v4 = v2;
    objc_msgSend(v3, "invocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = qos_class_self();
    PHADescriptionForQoS(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1CAC16000, v4, OS_LOG_TYPE_DEFAULT, "Running task '%@' at QoS %@", (uint8_t *)&v9, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "runOperation");
}

- (void)requestRunPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 context:(id)a5 resultBlock:(id)a6
{
  void (**v9)(id, void *, void *, id);
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;

  v9 = (void (**)(id, void *, void *, id))a6;
  v10 = a4;
  v11 = a3;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  +[PHAPrivateFederatedLearningRecipeDecoder decodeRecipeUserInfo:attachmentURLs:photoLibrary:graphManager:decodingError:](PHAPrivateFederatedLearningRecipeDecoder, "decodeRecipeUserInfo:attachmentURLs:photoLibrary:graphManager:decodingError:", v10, v11, v12, v13, &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v26;
  objc_msgSend(v14, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "learningFramework");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v17, "isEqualToString:", CFSTR("coreML"));

  if ((_DWORD)v10)
  {
    v25 = v15;
    v18 = &v25;
    objc_msgSend(v14, "runCoreMLModelWithError:", &v25);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = v15;
    v18 = &v24;
    objc_msgSend(v14, "runWithError:", &v24);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v19;
  v21 = *v18;

  objc_msgSend(v20, "dataPackage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trainingMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v22, v23, v21);

}

- (void)runShadowEvaluationWithRecipe:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 context:(id)a8 resultBlock:(id)a9
{
  void (**v15)(id, id);
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v15 = (void (**)(id, id))a9;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  +[PHACurareShadowEvaluationRecipeDecoder decodeRecipeUserInfo:models:photoLibrary:graphManager:trialDeploymentID:trialExperimentID:trialTreatmentID:decodingError:](PHACurareShadowEvaluationRecipeDecoder, "decodeRecipeUserInfo:models:photoLibrary:graphManager:trialDeploymentID:trialExperimentID:trialTreatmentID:decodingError:", v20, v19, v21, v22, v18, v17, v16, &v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v27;
  v26 = v24;
  objc_msgSend(v23, "runWithError:", &v26);
  v25 = v26;

  v15[2](v15, v25);
}

- (void)runModelInferenceForFingerprintVersion:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (void)recordFeatureUsageFromCounts:(id)a3 context:(id)a4 reply:(id)a5
{
  void (**v7)(id, uint64_t, id);
  id v8;
  PHAFeaturesUsageReportingTask *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v7 = (void (**)(id, uint64_t, id))a5;
  v8 = a3;
  v9 = objc_alloc_init(PHAFeaturesUsageReportingTask);
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "workingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loggingConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v14 = -[PHAFeaturesUsageReportingTask recordFeatureUsageFromCounts:forPhotoLibrary:loggingConnection:error:](v9, "recordFeatureUsageFromCounts:forPhotoLibrary:loggingConnection:error:", v8, v12, v13, &v16);

  v15 = v16;
  v7[2](v7, v14, v15);

}

- (void)requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v17);
  v11 = v17;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v16 = v11;
    objc_msgSend(v9, "requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:error:", v7, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;

    if (v14)
    {
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v14;
        _os_log_error_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_ERROR, "Up Next Memories Generation Error:%{public}@", buf, 0xCu);
      }

    }
    v8[2](v8, v13, v14);

  }
  else
  {
    v8[2](v8, 0, v11);
    v14 = v12;
  }

}

- (void)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v17);
  v11 = v17;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v16 = v11;
    objc_msgSend(v9, "requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:error:", v7, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;

    if (v14)
    {
      -[PHAStorytellingClientRequestHandler loggingConnection](self, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v14;
        _os_log_error_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_ERROR, "Up Next Memories Generation Error:%{public}@", buf, 0xCu);
      }

    }
    v8[2](v8, v13, v14);

  }
  else
  {
    v8[2](v8, 0, v11);
    v14 = v12;
  }

}

- (void)requestDefaultsObjectForKey:(id)a3 context:(id)a4 reply:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, _QWORD);

  v10 = (void (**)(id, void *, _QWORD))a5;
  v6 = (void *)MEMORY[0x1E0C99EA0];
  v7 = a3;
  objc_msgSend(v6, "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v10[2](v10, v9, 0);

}

- (void)requestSetDefaultsObject:(id)a3 forKey:(id)a4 context:(id)a5 reply:(id)a6
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a6;
  v8 = (void *)MEMORY[0x1E0C99EA0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v10, v9);

  v12 = v13;
  if (v13)
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
    v12 = v13;
  }

}

- (void)requestAvailableSuggestionTypeInfosWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;

  v6 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v7, "isReadyWithError:", &v11);
  v9 = v11;
  if ((v8 & 1) != 0)
  {
    +[PHASuggestionController availableSuggestionTypeInfosWithProfile:](PHASuggestionController, "availableSuggestionTypeInfosWithProfile:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v6)[2](v6, 0, v9);
  }

}

- (void)requestSuggestionInfosWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  char v10;
  id v11;
  PHASuggestionController *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "isReadyWithError:", &v14);
  v11 = v14;
  if ((v10 & 1) != 0)
  {
    v12 = -[PHASuggestionController initWithGraphManager:]([PHASuggestionController alloc], "initWithGraphManager:", v9);
    -[PHASuggestionController suggestionInfosWithOptions:](v12, "suggestionInfosWithOptions:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v13, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestNightlySuggestionsForPosterConfiguration:(id)a3 atDate:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  objc_class *v10;
  void (**v11)(id, void *, _QWORD);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (objc_class *)MEMORY[0x1E0D75230];
  v11 = (void (**)(id, void *, _QWORD))a6;
  v12 = a4;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithShuffleType:", 0);
  objc_msgSend(v13, "setShuffleSmartAlbums:", 0);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("personLocalIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPersonLocalIdentifiers:", v15);

    objc_msgSend(v13, "setShuffleSmartAlbums:", objc_msgSend(v13, "shuffleSmartAlbums") | 1);
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("includePets"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("includeLandscapes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("includeCityscapes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  if (!v17)
  {
    if (!v19)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(v13, "setShuffleSmartAlbums:", objc_msgSend(v13, "shuffleSmartAlbums") | 4);
    if (!v21)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(v13, "setShuffleSmartAlbums:", objc_msgSend(v13, "shuffleSmartAlbums") | 2);
  if (v19)
    goto LABEL_9;
LABEL_5:
  if (v21)
LABEL_6:
    objc_msgSend(v13, "setShuffleSmartAlbums:", objc_msgSend(v13, "shuffleSmartAlbums") | 8);
LABEL_7:
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "photoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F8]), "initWithPhotoLibrary:", v23);
  objc_msgSend(v24, "personUUIDsWithNegativeFeedback");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EF0], "suggestionLocalIdentifiersByFeatureForPosterConfiguration:atDate:inPhotoLibrary:", v13, v12, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EF0], "chosenSuggestionLocalIdentifiersForPosterConfiguration:fromSuggestionLocalIdentifiersByFeature:atDate:usingStrategy:withRejectedPersonLocalIdentifiers:", v13, v26, v12, 0, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = *MEMORY[0x1E0D722E0];
  v30[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v28, 0);

}

- (void)reloadWallpaperSuggestionsWithSuggestionUUIDs:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, id);
  void *v9;
  void *v10;
  NSObject *v11;
  PHAWallpaperSuggestionRefreshSession *v12;
  void *v13;
  PHAWallpaperSuggestionRefreshSession *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, id))a5;
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workingContextForSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = [PHAWallpaperSuggestionRefreshSession alloc];
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PHAWallpaperSuggestionRefreshSession initWithGraphManager:](v12, "initWithGraphManager:", v13);

  v25 = 0;
  LODWORD(v13) = -[PHAWallpaperSuggestionRefreshSession prepareWithError:](v14, "prepareWithError:", &v25);
  v15 = v25;
  if ((_DWORD)v13)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D761C8]), "initWithTaskName:loggingConnection:", CFSTR("ReloadWallpaperSuggestions"), v11);
    v17 = objc_alloc(MEMORY[0x1E0D42A70]);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __111__PHAStorytellingClientRequestHandler_Suggestion__reloadWallpaperSuggestionsWithSuggestionUUIDs_context_reply___block_invoke;
    v23[3] = &unk_1E8521A20;
    v24 = v16;
    v18 = v16;
    v19 = (void *)objc_msgSend(v17, "initWithProgressBlock:", v23);
    v22 = v15;
    v20 = -[PHAWallpaperSuggestionRefreshSession reloadWallpaperSuggestionsForUUIDs:progress:error:](v14, "reloadWallpaperSuggestionsForUUIDs:progress:error:", v7, v19, &v22);
    v21 = v22;

    -[PHAWallpaperSuggestionRefreshSession cleanup](v14, "cleanup");
    v15 = v21;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v15;
      _os_log_fault_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_FAULT, "Failed to prepare wallpaper suggestion refresh session: %@", buf, 0xCu);
    }
    v20 = 0;
  }
  v8[2](v8, v20, v15);

}

- (void)requestPeopleForWallpaperSuggestionsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  objc_class *v7;
  void (**v8)(id, void *, _QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D762B0];
  v8 = (void (**)(id, void *, _QWORD))a5;
  v9 = a3;
  v10 = [v7 alloc];
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workingContextForSuggestions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithWorkingContext:", v12);

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D78188]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "BOOLValue");
  objc_msgSend(v13, "personLocalIdentifiersForTopPeople:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0D78180];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingDescriptors:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v20, 0);

}

- (void)requestWallpaperPropertiesForAssets:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void (**v38)(id, void *, id);
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v38 = (void (**)(id, void *, id))a6;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v12 = objc_claimAutoreleasedReturnValue();

  v46[0] = *MEMORY[0x1E0CD1A50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "setFetchPropertySets:", v13);

  v37 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v9, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D72388]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v15, "BOOLValue");

  if ((v12 & 1) != 0)
  {
    v16 = 5;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D72380]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    v16 = objc_msgSend((id)objc_opt_class(), "_sceneTypeForPosterClassification:", v18);
  }
  v19 = objc_alloc(MEMORY[0x1E0D762A8]);
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "workingContextForSuggestions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "loggingConnection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithType:loggingConnection:", v16, v22);

  objc_msgSend(v23, "setIsUserInitiated:", 1);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v24 = v14;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v25)
  {
    v26 = v25;
    v35 = v10;
    v36 = v9;
    v27 = 0;
    v28 = *(_QWORD *)v42;
    while (2)
    {
      v29 = 0;
      v30 = v27;
      do
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v24);
        v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v29);
        v40 = v30;
        objc_msgSend(v23, "requestWallpaperPropertiesForAsset:progressBlock:error:", v31, &__block_literal_global_8720, &v40, v35, v36);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v40;

        if (!v32)
        {

          v34 = 0;
          v10 = v35;
          v9 = v36;
          goto LABEL_16;
        }
        objc_msgSend(v31, "uuid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v32, v33);

        ++v29;
        v30 = v27;
      }
      while (v26 != v29);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v26)
        continue;
      break;
    }
    v10 = v35;
    v9 = v36;
  }
  else
  {
    v27 = 0;
  }
  v34 = v39;
LABEL_16:

  v38[2](v38, v34, v27);
}

- (void)exportWallpaperForAssets:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, id);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PHAWallpaperSuggestionRefreshSession *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(id, uint64_t, id);
  id v37;
  id v38;
  void *v39;
  id obj;
  uint64_t v41;
  PHAWallpaperSuggestionRefreshSession *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t, id))a6;
  -[PHAStorytellingClientRequestHandler photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v50[0] = *MEMORY[0x1E0CD1A50];
  v14 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFetchPropertySets:", v15);

  v39 = v13;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v9, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D72380]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v17, "unsignedIntegerValue");

  v18 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D72390]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fileURLWithPath:", v19);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [PHAWallpaperSuggestionRefreshSession alloc];
  -[PHAStorytellingClientRequestHandler graphManager](self, "graphManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[PHAWallpaperSuggestionRefreshSession initWithGraphManager:](v20, "initWithGraphManager:", v21);

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D72388]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v16;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v24)
  {
    v25 = v24;
    v36 = v11;
    v37 = v10;
    v38 = v9;
    v26 = 0;
    v27 = *(_QWORD *)v46;
    v28 = *MEMORY[0x1E0D756B8];
    while (2)
    {
      v29 = 0;
      v30 = v26;
      do
      {
        if (*(_QWORD *)v46 != v27)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v29);
        objc_msgSend(v31, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "URLByAppendingPathComponent:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "URLByAppendingPathExtension:", CFSTR("wallpaper"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "removeItemAtURL:error:", v34, 0);

        v44 = v30;
        LODWORD(v35) = -[PHAWallpaperSuggestionRefreshSession savePreviewSegmentationResourcesForAsset:atURL:withClassification:styleCategory:enableSettlingEffect:error:](v42, "savePreviewSegmentationResourcesForAsset:atURL:withClassification:styleCategory:enableSettlingEffect:error:", v31, v34, v41, v28, v23, &v44);
        v26 = v44;

        if (!(_DWORD)v35)
        {
          v14 = 0;
          goto LABEL_11;
        }
        ++v29;
        v30 = v26;
      }
      while (v25 != v29);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v25)
        continue;
      break;
    }
    v14 = 1;
LABEL_11:
    v10 = v37;
    v9 = v38;
    v11 = v36;
  }
  else
  {
    v26 = 0;
  }

  v11[2](v11, v14, v26);
}

uint64_t __111__PHAStorytellingClientRequestHandler_Suggestion__reloadWallpaperSuggestionsWithSuggestionUUIDs_context_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkCallsWithProgress:stop:", 0);
}

+ (unint64_t)_sceneTypeForPosterClassification:(unint64_t)a3
{
  if (a3 > 5)
    return 2;
  else
    return qword_1CADD07B0[a3];
}

@end
