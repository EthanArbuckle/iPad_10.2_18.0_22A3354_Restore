@implementation SBAppLibraryMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PETScalarEventTracker *modalLibraryPresentedTracker;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 == 53)
  {
    if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
    {
      objc_msgSend(v7, "eventPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD80]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

      modalLibraryPresentedTracker = self->_modalLibraryPresentedTracker;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v13;
      v8 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETScalarEventTracker trackEventWithPropertyValues:](modalLibraryPresentedTracker, "trackEventWithPropertyValues:", v14);

      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  if (a3 != 11)
    goto LABEL_6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__SBAppLibraryMetric_handleEvent_withContext___block_invoke;
  v16[3] = &unk_1E8EA38B8;
  v16[4] = self;
  objc_msgSend(v6, "stateForQueryName:completion:", 3, v16);
  v8 = 1;
LABEL_7:

  return v8;
}

- (SBAppLibraryMetric)init
{
  SBAppLibraryMetric *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  PETScalarEventTracker *appDownloadSettingsTracker;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  PETScalarEventTracker *libraryDockSettingsTracker;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  PETScalarEventTracker *modalLibraryPresentedTracker;
  objc_super v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[3];
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SBAppLibraryMetric;
  v2 = -[SBAppLibraryMetric init](&v28, sel_init);
  if (v2)
  {
    PETEventPropertyForLayoutLocations(CFSTR("newAppDownloadLocation"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0D80F20];
    v5 = MEMORY[0x1E0C9AAB0];
    v6 = MEMORY[0x1E0C9AAA0];
    v36[0] = MEMORY[0x1E0C9AAB0];
    v36[1] = MEMORY[0x1E0C9AAA0];
    v37[0] = CFSTR("Y");
    v37[1] = CFSTR("N");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyWithName:enumMapping:", CFSTR("haveEverHiddenAPage"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0D80F38]);
    v35[0] = v3;
    v35[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("AppDownloadsSettings"), v10);
    appDownloadSettingsTracker = v2->_appDownloadSettingsTracker;
    v2->_appDownloadSettingsTracker = (PETScalarEventTracker *)v11;

    if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
    {
      v13 = (void *)MEMORY[0x1E0D80F20];
      v33[0] = v5;
      v33[1] = v6;
      v34[0] = CFSTR("Y");
      v34[1] = CFSTR("N");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "propertyWithName:enumMapping:", CFSTR("isLibraryPodIconInDockHidden"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc(MEMORY[0x1E0D80F38]);
      v32 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("LibraryDockSettings"), v17);
      libraryDockSettingsTracker = v2->_libraryDockSettingsTracker;
      v2->_libraryDockSettingsTracker = (PETScalarEventTracker *)v18;

      v20 = (void *)MEMORY[0x1E0D80F20];
      v30[0] = &unk_1E91D1CD0;
      v30[1] = &unk_1E91D1CE8;
      v31[0] = CFSTR("HomeDock");
      v31[1] = CFSTR("AppDock");
      v30[2] = &unk_1E91D1D00;
      v31[2] = CFSTR("HomeSwipe");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "propertyWithName:enumMapping:", CFSTR("libraryPresentationSource"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_alloc(MEMORY[0x1E0D80F38]);
      v29 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("ModalLibraryPresented"), v24);
      modalLibraryPresentedTracker = v2->_modalLibraryPresentedTracker;
      v2->_modalLibraryPresentedTracker = (PETScalarEventTracker *)v25;

    }
  }
  return v2;
}

void __46__SBAppLibraryMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PETStringValueForIconLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = SBAnalyticsLayoutLocationFromString((uint64_t)v5);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackEventWithPropertyValues:value:", v14, v8);

  if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE28]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trackEventWithPropertyValues:", v19);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalLibraryPresentedTracker, 0);
  objc_storeStrong((id *)&self->_libraryDockSettingsTracker, 0);
  objc_storeStrong((id *)&self->_appDownloadSettingsTracker, 0);
}

@end
