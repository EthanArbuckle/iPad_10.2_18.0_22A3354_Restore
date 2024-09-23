@implementation _PXCuratedLibraryConcreteAnalysisStatus

- (_PXCuratedLibraryConcreteAnalysisStatus)initWithDataSourceManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PXCuratedLibraryConcreteAnalysisStatus;
  return (_PXCuratedLibraryConcreteAnalysisStatus *)-[PXCuratedLibraryAnalysisStatus _initWithDataSourceManager:](&v4, sel__initWithDataSourceManager_, a3);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)CuratedLibraryAssetsDataSourceManagerObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAnalysisStatus.m"), 478, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0xC) != 0)
  {
    v11 = v9;
    -[_PXCuratedLibraryConcreteAnalysisStatus _updateStatusProperties](self, "_updateStatusProperties");
    v9 = v11;
  }

}

- (void)_configureBatteryMonitoring
{
  void *v3;
  _QWORD v4[5];

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70___PXCuratedLibraryConcreteAnalysisStatus__configureBatteryMonitoring__block_invoke;
  v4[3] = &unk_1E5149198;
  v4[4] = self;
  objc_msgSend(v3, "scheduleMainQueueTask:", v4);

}

- (void)_updateStatusProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  unint64_t v27;
  float v28;
  float v29;
  char v30;
  char v31;
  uint8_t buf[4];
  __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryAnalysisStatus dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "canLoadData"))
  {
    v7 = 0;
    LOBYTE(v8) = 1;
    v9 = -1.0;
    goto LABEL_20;
  }
  objc_msgSend(v3, "dataSourceManagerForZoomLevel:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "enableDays"))
  {
    objc_msgSend(v5, "firstAssetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(v3, "dataSourceManagerForZoomLevel:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstAssetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_8;
  }
  if ((objc_msgSend(v6, "isRecent") & 1) == 0)
  {
    if (objc_msgSend(v5, "numberOfSections") < 1)
    {
      v7 = 0;
      v9 = -1.0;
    }
    else
    {
      -[_PXCuratedLibraryConcreteAnalysisStatus _enrichmentProgressForDataSource:](self, "_enrichmentProgressForDataSource:", v5);
      v9 = v12;
      v7 = -[_PXCuratedLibraryConcreteAnalysisStatus _analyzingStateForDataSource:](self, "_analyzingStateForDataSource:", v5);
    }
    v8 = 1;
    if (-[PXCuratedLibraryAnalysisStatus isDaysMonthsYearsStructureEnabled](self, "isDaysMonthsYearsStructureEnabled"))
      goto LABEL_19;
LABEL_14:
    PLCuratedLibraryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("NO");
      if (v8)
        v14 = CFSTR("YES");
      v15 = v14;
      *(_DWORD *)buf = 138412546;
      v33 = v15;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryAnalysisStatus] isDaysMonthsYearsStructureEnabled %@ with firstAssetCollection: %@", buf, 0x16u);

    }
    goto LABEL_19;
  }
LABEL_8:
  v7 = 0;
  v8 = 0;
  v9 = -1.0;
  if (-[PXCuratedLibraryAnalysisStatus isDaysMonthsYearsStructureEnabled](self, "isDaysMonthsYearsStructureEnabled"))
    goto LABEL_14;
LABEL_19:

LABEL_20:
  v16 = -[_PXCuratedLibraryConcreteAnalysisStatus isDeviceUnplugged](self, "isDeviceUnplugged");
  v17 = -[_PXCuratedLibraryConcreteAnalysisStatus hasBattery](self, "hasBattery");
  _CuratedLibraryAnalysisStatusLocalizedTitleForState(v7, v16, -[PXCuratedLibraryAnalysisStatus alternateTitleIndex](self, "alternateTitleIndex"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _CuratedLibraryAnalysisStatusLocalizedDescriptionForState(v7, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 2)
    v20 = -1.0;
  else
    v20 = v9;
  if (v7 == 2 && (v16 & 1) == 0)
  {
    v21 = v9;
    if (v9 < 0.1)
      v21 = 0.1;
    v20 = fmin(v21, 0.9);
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66___PXCuratedLibraryConcreteAnalysisStatus__updateStatusProperties__block_invoke;
  v24[3] = &unk_1E5138CC0;
  v26 = v19;
  v27 = v7;
  v25 = v18;
  v28 = v9;
  v29 = v20;
  v30 = v8;
  v31 = v16;
  v22 = v19;
  v23 = v18;
  -[_PXCuratedLibraryConcreteAnalysisStatus performChanges:](self, "performChanges:", v24);

}

- (BOOL)isDeviceUnplugged
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "batteryState") == 1;

  return v3;
}

- (BOOL)hasBattery
{
  return 1;
}

- (int64_t)_analyzingStateForDataSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned __int16 v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  unsigned int v13;
  BOOL v14;
  _BOOL4 v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  int v20;
  __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "firstTimeExperienceMaxNonProcessedHighlights");

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "firstTimeExperienceMaxNonProcessedAssets");

  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 1;
  while (1)
  {
    v13 = v9;
    v11 += objc_msgSend(v4, "numberOfSectionsWithEnrichmentState:", v9);
    v10 += objc_msgSend(v4, "estimatedAssetsCountWithEnrichmentState:", v9);
    v14 = v11 <= v6 && v10 <= v8;
    v15 = v14;
    if (!v14)
      break;
    ++v9;
    if (v13 > 1)
      goto LABEL_11;
  }
  v12 = 2;
LABEL_11:
  if (v12 != -[PXCuratedLibraryAnalysisStatus state](self, "state"))
  {
    PLCuratedLibraryGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("analyzing");
      if (v15)
        v17 = CFSTR("ready");
      v18 = v17;
      v20 = 138412802;
      v21 = v18;
      v22 = 2048;
      v23 = v11;
      v24 = 2048;
      v25 = v10;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryAnalysisStatus] State = <%@>; numberOfNonProcessedSections = <%li>; numberOfNonProcessedAssets = <%li>",
        (uint8_t *)&v20,
        0x20u);

    }
  }

  return v12;
}

- (float)_enrichmentProgressForDataSource:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  char v9;
  unsigned __int16 v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  float v15;
  NSObject *v16;
  int v18;
  double v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0;
  v6 = 3;
  do
  {
    v7 = (unsigned __int16)v6;
    v5 += objc_msgSend(v4, "estimatedAssetsCountWithEnrichmentState:", (unsigned __int16)v6++);
  }
  while (v7 < 4);
  v8 = 0;
  v9 = 1;
  v10 = 1;
  do
  {
    v11 = v9;
    v12 = objc_msgSend(v4, "estimatedAssetsCountWithEnrichmentState:", v10);
    v9 = 0;
    v8 += v12;
    v10 = 2;
  }
  while ((v11 & 1) != 0);
  v13 = v8 + v5 + objc_msgSend(v4, "estimatedAssetsCountWithEnrichmentState:", 0);
  if (v13 < 1)
    v14 = 1.0;
  else
    v14 = (float)((float)((float)v8 * 0.25) + (float)v5) / (float)v13;
  -[PXCuratedLibraryAnalysisStatus progress](self, "progress");
  if (v14 != v15)
  {
    PLCuratedLibraryGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134218496;
      v19 = v14;
      v20 = 2048;
      v21 = v5;
      v22 = 2048;
      v23 = v13;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryAnalysisStatus] Progress = <%0.2f>; countOfProcessedAssets = <%li>; totalCountOfAssets = <%li>",
        (uint8_t *)&v18,
        0x20u);
    }

  }
  return v14;
}

- (void)dataSourceManagerDidChange
{
  void *v3;
  void *v4;

  -[PXCuratedLibraryAnalysisStatus dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXCuratedLibraryAnalysisStatus dataSourceManager](self, "dataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerChangeObserver:context:", self, CuratedLibraryAssetsDataSourceManagerObserverContext);

    -[_PXCuratedLibraryConcreteAnalysisStatus _configureBatteryMonitoring](self, "_configureBatteryMonitoring");
    -[_PXCuratedLibraryConcreteAnalysisStatus _updateStatusProperties](self, "_updateStatusProperties");
  }
}

- (void)_batteryStateDidChange:(id)a3
{
  px_dispatch_on_main_queue();
}

@end
