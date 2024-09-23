@implementation SBIconPageManagementMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  PETScalarEventTracker *pageManagementPresentationTracker;
  _QWORD v10[5];

  v6 = a4;
  v7 = v6;
  if (a3 == 11)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__SBIconPageManagementMetric_handleEvent_withContext___block_invoke;
    v10[3] = &unk_1E8EA38B8;
    v10[4] = self;
    objc_msgSend(v6, "stateForQueryName:completion:", 2, v10);
  }
  else
  {
    switch(a3)
    {
      case '6':
        pageManagementPresentationTracker = self->_pageManagementPresentationTracker;
        goto LABEL_8;
      case '7':
        -[PETScalarEventTracker trackEventWithPropertyValues:](self->_pageDeletionTracker, "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
        break;
      case '8':
        pageManagementPresentationTracker = self->_pageMovementTracker;
        goto LABEL_8;
      case '9':
        pageManagementPresentationTracker = self->_pageHidingTracker;
LABEL_8:
        -[PETScalarEventTracker trackEventWithPropertyValues:setValue:](pageManagementPresentationTracker, "trackEventWithPropertyValues:setValue:", MEMORY[0x1E0C9AA60], 1);
        break;
      default:
        break;
    }
  }

  return a3 == 11;
}

- (SBIconPageManagementMetric)init
{
  SBIconPageManagementMetric *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  PETDistributionEventTracker *pagesHiddenTracker;
  uint64_t v7;
  PETDistributionEventTracker *pagesVisibleTracker;
  uint64_t v9;
  PETDistributionEventTracker *pagesCountTracker;
  uint64_t v11;
  PETScalarEventTracker *pageManagementPresentationTracker;
  uint64_t v13;
  PETScalarEventTracker *pageDeletionTracker;
  uint64_t v15;
  PETScalarEventTracker *pageMovementTracker;
  uint64_t v17;
  PETScalarEventTracker *pageHidingTracker;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBIconPageManagementMetric;
  v2 = -[SBIconPageManagementMetric init](&v20, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80F18]);
    v4 = MEMORY[0x1E0C9AA60];
    v5 = objc_msgSend(v3, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("VisibleIconPages"), MEMORY[0x1E0C9AA60]);
    pagesHiddenTracker = v2->_pagesHiddenTracker;
    v2->_pagesHiddenTracker = (PETDistributionEventTracker *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("HiddenIconPages"), v4);
    pagesVisibleTracker = v2->_pagesVisibleTracker;
    v2->_pagesVisibleTracker = (PETDistributionEventTracker *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("TotalIconPages"), v4);
    pagesCountTracker = v2->_pagesCountTracker;
    v2->_pagesCountTracker = (PETDistributionEventTracker *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("HasPresentedIconPageManagement"), v4);
    pageManagementPresentationTracker = v2->_pageManagementPresentationTracker;
    v2->_pageManagementPresentationTracker = (PETScalarEventTracker *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("TotalDeletedIconPages"), v4);
    pageDeletionTracker = v2->_pageDeletionTracker;
    v2->_pageDeletionTracker = (PETScalarEventTracker *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("HasMovedIconPage"), v4);
    pageMovementTracker = v2->_pageMovementTracker;
    v2->_pageMovementTracker = (PETScalarEventTracker *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("HasHidIconPage"), v4);
    pageHidingTracker = v2->_pageHidingTracker;
    v2->_pageHidingTracker = (PETScalarEventTracker *)v17;

  }
  return v2;
}

uint64_t __54__SBIconPageManagementMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v3 = *MEMORY[0x1E0DABE20];
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], (double)v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "trackEventWithPropertyValues:value:", v9, (double)v6);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "trackEventWithPropertyValues:value:", v9, (double)(v8 + v6));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageHidingTracker, 0);
  objc_storeStrong((id *)&self->_pageMovementTracker, 0);
  objc_storeStrong((id *)&self->_pageDeletionTracker, 0);
  objc_storeStrong((id *)&self->_pageManagementPresentationTracker, 0);
  objc_storeStrong((id *)&self->_pagesCountTracker, 0);
  objc_storeStrong((id *)&self->_pagesVisibleTracker, 0);
  objc_storeStrong((id *)&self->_pagesHiddenTracker, 0);
}

@end
