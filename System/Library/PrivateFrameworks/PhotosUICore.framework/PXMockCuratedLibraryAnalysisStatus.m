@implementation PXMockCuratedLibraryAnalysisStatus

+ (BOOL)shouldUseMock
{
  void *v3;
  BOOL v4;

  if (!PFOSVariantHasInternalUI())
    return 0;
  objc_msgSend(a1, "_mockStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)_mockStatus
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  PXSharedUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("LibraryAnalysisStatusMock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("unknown")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("analyzing")) & 1) == 0
      && !objc_msgSend(v6, "isEqualToString:", CFSTR("ready")))
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("unvavailable")))
        objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("Structure"));
      goto LABEL_22;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("State"));
    if ((objc_msgSend(v5, "containsObject:", CFSTR("hasbattery")) & 1) != 0)
    {
      v7 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      if (!objc_msgSend(v5, "containsObject:", CFSTR("hasnobattery")))
        goto LABEL_12;
      v7 = MEMORY[0x1E0C9AAA0];
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("HasBattery"));
LABEL_12:
    if ((objc_msgSend(v5, "containsObject:", CFSTR("plugged")) & 1) != 0)
    {
      v8 = MEMORY[0x1E0C9AAA0];
    }
    else
    {
      if (!objc_msgSend(v5, "containsObject:", CFSTR("unplugged")))
      {
LABEL_17:
        v9 = objc_msgSend(v5, "indexOfObject:", CFSTR("progress"));
        if (v9 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "count") > (unint64_t)(v9 + 1))
        {
          v10 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectAtIndexedSubscript:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "floatValue");
          objc_msgSend(v10, "numberWithFloat:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("progress"));

        }
LABEL_22:

        goto LABEL_23;
      }
      v8 = MEMORY[0x1E0C9AAB0];
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("Unplugged"));
    goto LABEL_17;
  }
  v4 = 0;
LABEL_24:

  return v4;
}

- (PXMockCuratedLibraryAnalysisStatus)initWithDataSourceManager:(id)a3
{
  id v4;
  NSObject *v5;
  PXMockCuratedLibraryAnalysisStatus *v6;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = objc_opt_class();
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "%@ Using mock analysis status", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PXMockCuratedLibraryAnalysisStatus;
  v6 = -[PXCuratedLibraryAnalysisStatus _initWithDataSourceManager:](&v8, sel__initWithDataSourceManager_, v4);

  return v6;
}

- (void)dataSourceManagerDidChange
{
  id v3;

  PXSharedUserDefaults();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("LibraryAnalysisStatusMock"), 4, &_PXMockCuratedLibraryAnalysisStatusUserDefaultsContext);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  PXSharedUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("LibraryAnalysisStatusMock"), &_PXMockCuratedLibraryAnalysisStatusUserDefaultsContext);

  v4.receiver = self;
  v4.super_class = (Class)PXMockCuratedLibraryAnalysisStatus;
  -[PXCuratedLibraryAnalysisStatus dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == &_PXMockCuratedLibraryAnalysisStatusUserDefaultsContext)
  {
    -[PXMockCuratedLibraryAnalysisStatus _updateStatusProperties](self, "_updateStatusProperties", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)PXMockCuratedLibraryAnalysisStatus;
    -[PXMockCuratedLibraryAnalysisStatus observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_updateStatusProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  float v21;
  double v22;
  id v23;
  id v24;
  char v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  unint64_t v30;
  float v31;
  float v32;
  char v33;
  char v34;

  objc_msgSend((id)objc_opt_class(), "_mockStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Structure"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  if (v4)
    v25 = objc_msgSend(v4, "BOOLValue");
  else
    v25 = 1;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("State"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqualToString:", CFSTR("unknown")) & 1) == 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("analyzing")) & 1) != 0)
      v7 = 2;
    else
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ready"));
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("progress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    v11 = v10;
  }
  else
  {
    v11 = -1.0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Unplugged"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "BOOLValue");
  else
    v14 = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HasBattery"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    v17 = objc_msgSend(v15, "BOOLValue");
  else
    v17 = 1;
  _CuratedLibraryAnalysisStatusLocalizedTitleForState(v7, v14, -[PXCuratedLibraryAnalysisStatus alternateTitleIndex](self, "alternateTitleIndex"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _CuratedLibraryAnalysisStatusLocalizedDescriptionForState(v7, v14, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 2)
    v20 = v14;
  else
    v20 = 1;
  v21 = -1.0;
  if (v7 != 2)
    v21 = v11;
  if ((v20 & 1) == 0)
  {
    v22 = v11;
    if (v11 < 0.1)
      v22 = 0.1;
    v21 = fmin(v22, 0.9);
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__PXMockCuratedLibraryAnalysisStatus__updateStatusProperties__block_invoke;
  v27[3] = &unk_1E5138CC0;
  v29 = v19;
  v30 = v7;
  v28 = v18;
  v31 = v11;
  v32 = v21;
  v33 = v25;
  v34 = v14;
  v23 = v19;
  v24 = v18;
  -[PXMockCuratedLibraryAnalysisStatus performChanges:](self, "performChanges:", v27);

}

void __61__PXMockCuratedLibraryAnalysisStatus__updateStatusProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v6, "setState:", v3);
  objc_msgSend(v6, "setLocalizedTitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setLocalizedDescription:", *(_QWORD *)(a1 + 40));
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v6, "setProgress:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 60);
  objc_msgSend(v6, "setDisplayProgress:", v5);
  objc_msgSend(v6, "setIsDaysMonthsYearsStructureEnabled:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v6, "setIsDevicePlugged:", *(_BYTE *)(a1 + 65) == 0);

}

@end
