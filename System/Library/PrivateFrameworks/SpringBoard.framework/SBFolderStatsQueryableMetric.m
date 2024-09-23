@implementation SBFolderStatsQueryableMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  _QWORD v6[5];

  if (a3 == 11)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__SBFolderStatsQueryableMetric_handleEvent_withContext___block_invoke;
    v6[3] = &unk_1E8EA38B8;
    v6[4] = self;
    objc_msgSend(a4, "stateForQueryName:completion:", 0, v6);
  }
  return a3 == 11;
}

- (SBFolderStatsQueryableMetric)init
{
  SBFolderStatsQueryableMetric *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  PETDistributionEventTracker *dockAppsTracker;
  uint64_t v7;
  PETDistributionEventTracker *dockFoldersTracker;
  uint64_t v9;
  PETDistributionEventTracker *dockItemsTracker;
  uint64_t v11;
  PETDistributionEventTracker *pageTracker;
  uint64_t v13;
  PETDistributionEventTracker *folderTracker;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBFolderStatsQueryableMetric;
  v2 = -[SBFolderStatsQueryableMetric init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80F18]);
    v4 = MEMORY[0x1E0C9AA60];
    v5 = objc_msgSend(v3, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("DockApps"), MEMORY[0x1E0C9AA60]);
    dockAppsTracker = v2->_dockAppsTracker;
    v2->_dockAppsTracker = (PETDistributionEventTracker *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("DockFolders"), v4);
    dockFoldersTracker = v2->_dockFoldersTracker;
    v2->_dockFoldersTracker = (PETDistributionEventTracker *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("DockItems"), v4);
    dockItemsTracker = v2->_dockItemsTracker;
    v2->_dockItemsTracker = (PETDistributionEventTracker *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("Pages"), v4);
    pageTracker = v2->_pageTracker;
    v2->_pageTracker = (PETDistributionEventTracker *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("Folders"), v4);
    folderTracker = v2->_folderTracker;
    v2->_folderTracker = (PETDistributionEventTracker *)v13;

  }
  return v2;
}

void __56__SBFolderStatsQueryableMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  double v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDC0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = 0;
  while (v6 >= qword_1D0E88A98[v11])
  {
    if (++v11 == 20)
    {
      v12 = 100.0;
      goto LABEL_8;
    }
  }
  if ((int)v11 <= 1)
    LODWORD(v11) = 1;
  v12 = (double)qword_1D0E88A98[(v11 - 1)];
LABEL_8:
  v13 = v10 - v4;
  v14 = (double)v4;
  v15 = MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], v14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "trackEventWithPropertyValues:value:", v15, (double)v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "trackEventWithPropertyValues:value:", v15, (double)v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "trackEventWithPropertyValues:value:", v15, (double)v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "trackEventWithPropertyValues:value:", v15, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderTracker, 0);
  objc_storeStrong((id *)&self->_pageTracker, 0);
  objc_storeStrong((id *)&self->_dockItemsTracker, 0);
  objc_storeStrong((id *)&self->_dockFoldersTracker, 0);
  objc_storeStrong((id *)&self->_dockAppsTracker, 0);
}

@end
