@implementation PGGraphIngestHolidaysProcessor

- (PGGraphIngestHolidaysProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestHolidaysProcessor *v6;
  PGGraphIngestHolidaysProcessor *v7;
  PGGraphIngestHolidayProcessorHelper *v8;
  PGGraphIngestHolidayProcessorHelper *helper;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphIngestHolidaysProcessor;
  v6 = -[PGGraphIngestHolidaysProcessor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v8 = objc_alloc_init(PGGraphIngestHolidayProcessorHelper);
    helper = v7->_helper;
    v7->_helper = v8;

  }
  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0 || (objc_msgSend(v3, "hasMomentsToInsert") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = objc_msgSend(v3, "momentUpdateTypes");
    v4 = (objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes") & v5) != 0;
  }

  return v4;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  PGGraphBuilder *graphBuilder;
  id v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint32_t denom;
  uint32_t numer;
  NSObject *v20;
  NSObject *v21;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  graphBuilder = self->_graphBuilder;
  v8 = a3;
  -[PGGraphBuilder graph](graphBuilder, "graph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGGraphIngestHolidaysProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v14 = mach_absolute_time();
  objc_msgSend(v8, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v9, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    -[PGGraphIngestHolidaysProcessor deleteHolidayEdgesWithMomentNodes:inGraph:](self, "deleteHolidayEdgesWithMomentNodes:inGraph:", v15, v9);
    objc_msgSend(v15, "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestHolidaysProcessor insertHolidaysWithMomentNodes:graph:locale:loggingConnection:progressBlock:](self, "insertHolidaysWithMomentNodes:graph:locale:loggingConnection:progressBlock:", v16, v9, 0, v13, v6);

  }
  v17 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v20 = v13;
  v21 = v20;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_END, v11, "PGGraphIngestHolidaysProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "PGGraphIngestHolidaysProcessor";
    v25 = 2048;
    v26 = (float)((float)((float)((float)(v17 - v14) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)deleteHolidayEdgesWithMomentNodes:(id)a3 inGraph:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0D42A30];
  v6 = a4;
  v7 = a3;
  v10 = objc_alloc_init(v5);
  objc_msgSend(v7, "celebratedHolidayNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphCelebratingEdgeCollection, "edgesFromNodes:toNodes:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeEdges:", v9);
  objc_msgSend(v6, "executeGraphChangeRequest:", v10);

}

- (void)insertHolidaysWithMomentNodes:(id)a3 graph:(id)a4 locale:(id)a5 loggingConnection:(id)a6 progressBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  PGGraphIngestHolidaysProcessor *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PGGraphIngestHolidaysProcessor *v30;
  void *v31;
  id v32;
  id v33;

  v33 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  +[PGGraphMomentNode firstAndLastMomentNodesInMomentNodes:](PGGraphMomentNode, "firstAndLastMomentNodesInMomentNodes:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v16)
    v19 = v17 == 0;
  else
    v19 = 1;
  if (!v19)
  {
    objc_msgSend(v33, "localDatesForMomentNode:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "localDatesForMomentNode:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "sortedArrayUsingSelector:", sel_compare_);
    v32 = v14;
    v23 = v13;
    v24 = self;
    v25 = v12;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "sortedArrayUsingSelector:", sel_compare_);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v25;
    v30 = v24;
    v13 = v23;
    v14 = v32;
    -[PGGraphIngestHolidaysProcessor insertHolidaysBetweenLocalDate:andLocalDate:graph:locale:loggingConnection:progressBlock:](v30, "insertHolidaysBetweenLocalDate:andLocalDate:graph:locale:loggingConnection:progressBlock:", v27, v29, v33, v25, v13, v32);

  }
}

- (void)insertHolidaysBetweenLocalDate:(id)a3 andLocalDate:(id)a4 graph:(id)a5 locale:(id)a6 loggingConnection:(id)a7 progressBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  double Current;
  char v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v32 = a4;
  v14 = a5;
  v15 = a6;
  v33 = a7;
  v16 = a8;
  v17 = _Block_copy(v16);
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  if (!v17
    || (v18 = CFAbsoluteTimeGetCurrent(), v18 - v45[3] < 0.01)
    || (v45[3] = v18,
        v43 = 0,
        (*((void (**)(void *, char *, double))v17 + 2))(v17, &v43, 0.0),
        v19 = *((_BYTE *)v49 + 24) | v43,
        (*((_BYTE *)v49 + 24) = v19) == 0))
  {
    objc_msgSend(v14, "infoNode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v15)
    {
      objc_msgSend(v20, "locale");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "countryCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B180]), "initWithLocale:", v15);
    +[PGGraphIngestHolidayProcessorHelper keyboardLanguageCodesForInfoNode:holidayService:](PGGraphIngestHolidayProcessorHelper, "keyboardLanguageCodesForInfoNode:holidayService:", v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestHolidayProcessorHelper prepareIfNeededWithGraph:](self->_helper, "prepareIfNeededWithGraph:", v14);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __123__PGGraphIngestHolidaysProcessor_insertHolidaysBetweenLocalDate_andLocalDate_graph_locale_loggingConnection_progressBlock___block_invoke;
    v34[3] = &unk_1E842EDD8;
    v25 = v17;
    v42 = 0x3F847AE147AE147BLL;
    v40 = &v44;
    v41 = &v48;
    v39 = v25;
    v34[4] = self;
    v26 = v22;
    v35 = v26;
    v27 = v24;
    v36 = v27;
    v37 = v14;
    v38 = v33;
    objc_msgSend(v23, "enumerateEventRulesForAllCountriesBetweenLocalDate:andLocalDate:usingBlock:", v31, v32, v34);
    if (*((_BYTE *)v49 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109378;
      v53 = 160;
      v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestHolidaysProcessor.m";
      v28 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v17)
        goto LABEL_17;
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v45[3] < 0.01)
        goto LABEL_17;
      v45[3] = Current;
      v43 = 0;
      (*((void (**)(id, char *, double))v25 + 2))(v25, &v43, 1.0);
      v30 = *((_BYTE *)v49 + 24) | v43;
      *((_BYTE *)v49 + 24) = v30;
      if (!v30 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_17;
      *(_DWORD *)buf = 67109378;
      v53 = 161;
      v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestHolidaysProcessor.m";
      v28 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v53 = 107;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Ingest"
          "/Ingest Processing/PGGraphIngestHolidaysProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_18:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

}

- (BOOL)shouldCreateHolidayEdgeForEventRule:(id)a3 momentNode:(id)a4 momentLocalDate:(id)a5 withGraph:(id)a6 loggingConnection:(id)a7 localeCountryCode:(id)a8 keyboardLanguageCodes:(id)a9
{
  return -[PGGraphIngestHolidayProcessorHelper isCelebratingForEventRule:momentNode:momentLocalDate:withGraph:loggingConnection:localeCountryCode:keyboardLanguageCodes:](self->_helper, "isCelebratingForEventRule:momentNode:momentLocalDate:withGraph:loggingConnection:localeCountryCode:keyboardLanguageCodes:", a3, a4, a5, a6, a7, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __123__PGGraphIngestHolidaysProcessor_insertHolidaysBetweenLocalDate_andLocalDate_graph_locale_loggingConnection_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  double Current;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1CAA4EB2C]();
  if (*(_QWORD *)(a1 + 72)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
        Current - *(double *)(v11 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v11 + 24) = Current,
        buf[0] = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 72) + 16))(0.5),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "momentsCelebratingRule:localDates:userCountryCode:keyboardLanguageCodes:graph:loggingConnection:", v7, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "holidayDateNodes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v55[0] = CFSTR("name");
        objc_msgSend(v7, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = CFSTR("holc");
        v56[0] = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "category"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("Holiday"), 401, v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v39 = v18;
          v41 = v8;
          v42 = v7;
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v13, "holidayDateNodes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v48 != v23)
                  objc_enumerationMutation(v20);
                v25 = (id)objc_msgSend(*(id *)(a1 + 56), "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("HOLIDAY"), *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), v19, 401, 0);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
            }
            while (v22);
          }
          v40 = v9;

          objc_msgSend(v13, "positivelyClassifiedMomentNodes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v26, "mutableCopy");

          objc_msgSend(v13, "positivelyClassifiedMomentNodes");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          if (v29 >= 3)
          {
            objc_msgSend(v13, "negativelyClassifiedMomentNodes");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObjectsFromArray:", v30);

          }
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v31 = v27;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v44 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
                v37 = (id)objc_msgSend(*(id *)(a1 + 56), "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("CELEBRATING"), v36, v19, 401, 0);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addMeaningToMeaningfulEventNode:meaningLabel:meaningIsReliable:", v36, CFSTR("HolidayEvent"), 1);
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            }
            while (v33);
          }

          v8 = v41;
          v7 = v42;
          v18 = v39;
          v9 = v40;
        }
        else
        {
          v38 = *(NSObject **)(a1 + 64);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v18;
            _os_log_error_impl(&dword_1CA237000, v38, OS_LOG_TYPE_ERROR, "Could not create holiday with properties %@", buf, 0xCu);
          }
        }

      }
    }

  }
  objc_autoreleasePoolPop(v9);

}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 15;
}

@end
