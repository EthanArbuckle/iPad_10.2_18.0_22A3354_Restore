@implementation PXCuratedLibrarySummaryHelper

uint64_t __47__PXCuratedLibrarySummaryHelper_setDataSource___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateVisibleContent");
}

uint64_t __62__PXCuratedLibrarySummaryHelper_setShouldUseAbbreviatedDates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldUseAbbreviatedDates:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setDataSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = objc_loadWeakRetained((id *)&self->_dataSource);
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      objc_storeWeak((id *)&self->_dataSource, v4);
      self->_dataSourceRespondsTo.visibleContentSnapshot = objc_opt_respondsToSelector() & 1;
      self->_dataSourceRespondsTo.topMostAssetCollection = objc_opt_respondsToSelector() & 1;
      v8 = objc_opt_respondsToSelector();
      v9 = MEMORY[0x1E0C809B0];
      self->_dataSourceRespondsTo.shouldUpdateImmediately = v8 & 1;
      v11[0] = v9;
      v11[1] = 3221225472;
      v11[2] = __47__PXCuratedLibrarySummaryHelper_setDataSource___block_invoke;
      v11[3] = &unk_1E5149198;
      v11[4] = self;
      -[PXCuratedLibrarySummaryHelper _performChanges:](self, "_performChanges:", v11);
      -[PXCuratedLibrarySummaryHelper summaryController](self, "summaryController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performChanges:", &__block_literal_global_128995);

    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v9 = a3;
  if ((void *)PXSummaryControllerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySummaryHelper.m"), 269, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PXCuratedLibrarySummaryHelper_observable_didChange_context___block_invoke;
  v12[3] = &unk_1E5144EB8;
  v12[4] = self;
  v12[5] = a4;
  -[PXCuratedLibrarySummaryHelper _performChanges:](self, "_performChanges:", v12);

}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;

  if (-[PXCuratedLibrarySummaryHelper _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXCuratedLibrarySummaryHelper _updateTopMostAssetCollection](self, "_updateTopMostAssetCollection");
    -[PXCuratedLibrarySummaryHelper _updateTitle](self, "_updateTitle");
    -[PXCuratedLibrarySummaryHelper _updateSubtitle](self, "_updateSubtitle");
    self->_isPerformingUpdates = isPerformingUpdates;
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.title
      || self->_needsUpdateFlags.subtitle
      || self->_needsUpdateFlags.topMostAssetCollection;
}

- (void)_performChanges:(id)a3
{
  _BOOL4 isPerformingChanges;

  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges && !self->_isPerformingUpdates)
    -[PXCuratedLibrarySummaryHelper _updateIfNeeded](self, "_updateIfNeeded");
}

uint64_t __62__PXCuratedLibrarySummaryHelper_observable_didChange_context___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 40);
  if ((v2 & 1) != 0)
  {
    result = objc_msgSend(*(id *)(result + 32), "_invalidateTitle");
    v2 = *(_QWORD *)(v1 + 40);
  }
  if ((v2 & 2) != 0)
    return objc_msgSend(*(id *)(v1 + 32), "_invalidateSubtitle");
  return result;
}

- (void)_updateTopMostAssetCollection
{
  void *v3;
  id v4;

  if (self->_needsUpdateFlags.topMostAssetCollection)
  {
    self->_needsUpdateFlags.topMostAssetCollection = 0;
    if (self->_dataSourceRespondsTo.topMostAssetCollection)
    {
      -[PXCuratedLibrarySummaryHelper dataSource](self, "dataSource");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topMostAssetCollection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySummaryHelper _setTopMostAssetCollection:](self, "_setTopMostAssetCollection:", v3);

    }
  }
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_needsUpdateFlags.title)
  {
    self->_needsUpdateFlags.title = 0;
    if (!self->_dataSourceRespondsTo.topMostAssetCollection)
    {
      -[PXCuratedLibrarySummaryHelper _updateTitleFromSummaryController](self, "_updateTitleFromSummaryController");
      return;
    }
    -[PXCuratedLibrarySummaryHelper topMostAssetCollection](self, "topMostAssetCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (!self->_outputPresenterRespondsTo.setTitle)
      {
LABEL_10:

        return;
      }
      v6 = v3;
      objc_msgSend(v3, "localizedTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySummaryHelper outputPresenter](self, "outputPresenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v4);

    }
    else
    {
      v6 = 0;
      -[PXCuratedLibrarySummaryHelper _updateTitleFromSummaryController](self, "_updateTitleFromSummaryController");
    }
    v3 = v6;
    goto LABEL_10;
  }
}

- (void)_updateSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_needsUpdateFlags.subtitle)
  {
    self->_needsUpdateFlags.subtitle = 0;
    if (!self->_dataSourceRespondsTo.topMostAssetCollection)
    {
      -[PXCuratedLibrarySummaryHelper _updateSubtitleFromSummaryController](self, "_updateSubtitleFromSummaryController");
      return;
    }
    -[PXCuratedLibrarySummaryHelper topMostAssetCollection](self, "topMostAssetCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (!self->_outputPresenterRespondsTo.setSubtitle)
      {
LABEL_10:

        return;
      }
      v6 = v3;
      objc_msgSend(v3, "localizedSubtitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySummaryHelper outputPresenter](self, "outputPresenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSubtitle:", v4);

    }
    else
    {
      v6 = 0;
      -[PXCuratedLibrarySummaryHelper _updateSubtitleFromSummaryController](self, "_updateSubtitleFromSummaryController");
    }
    v3 = v6;
    goto LABEL_10;
  }
}

- (void)_updateSubtitleFromSummaryController
{
  void *v3;
  void *v4;
  id v5;

  if (self->_outputPresenterRespondsTo.setSubtitle)
  {
    -[PXCuratedLibrarySummaryHelper summaryController](self, "summaryController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secondaryTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySummaryHelper outputPresenter](self, "outputPresenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubtitle:", v3);

  }
}

- (void)_invalidateSubtitle
{
  self->_needsUpdateFlags.subtitle = 1;
  -[PXCuratedLibrarySummaryHelper _setNeedsUpdate](self, "_setNeedsUpdate");
}

uint64_t __47__PXCuratedLibrarySummaryHelper_setDataSource___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTopMostAssetCollection");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTitle");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSubtitle");
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySummaryHelper.m"), 155, CFSTR("not inside -performChanges: or _updateIfNeeded"));

  }
}

- (PXBrowserSummaryController)summaryController
{
  return self->_summaryController;
}

- (void)_updateTitleFromSummaryController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_outputPresenterRespondsTo.setAttributedTitle)
  {
    -[PXCuratedLibrarySummaryHelper summaryController](self, "summaryController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributedPrimaryTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySummaryHelper outputPresenter](self, "outputPresenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttributedTitle:", v3);
  }
  else
  {
    if (!self->_outputPresenterRespondsTo.setTitle)
      return;
    -[PXCuratedLibrarySummaryHelper summaryController](self, "summaryController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributedPrimaryTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySummaryHelper outputPresenter](self, "outputPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v4);

  }
}

- (void)_invalidateTopMostAssetCollection
{
  self->_needsUpdateFlags.topMostAssetCollection = 1;
  -[PXCuratedLibrarySummaryHelper _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateTitle
{
  self->_needsUpdateFlags.title = 1;
  -[PXCuratedLibrarySummaryHelper _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)setShouldUseAbbreviatedDates:(BOOL)a3
{
  PXBrowserSummaryController *summaryController;
  _QWORD v4[4];
  BOOL v5;

  if (self->_shouldUseAbbreviatedDates != a3)
  {
    self->_shouldUseAbbreviatedDates = a3;
    summaryController = self->_summaryController;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__PXCuratedLibrarySummaryHelper_setShouldUseAbbreviatedDates___block_invoke;
    v4[3] = &__block_descriptor_33_e45_v16__0___PXMutableBrowserSummaryController__8l;
    v5 = a3;
    -[PXBrowserSummaryController performChanges:](summaryController, "performChanges:", v4);
  }
}

- (void)setOutputPresenter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  char v14;

  v4 = a3;
  v5 = objc_loadWeakRetained((id *)&self->_outputPresenter);
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      objc_storeWeak((id *)&self->_outputPresenter, v4);
      self->_outputPresenterRespondsTo.setTitle = objc_opt_respondsToSelector() & 1;
      self->_outputPresenterRespondsTo.setSubtitle = objc_opt_respondsToSelector() & 1;
      self->_outputPresenterRespondsTo.setAttributedTitle = objc_opt_respondsToSelector() & 1;
      self->_outputPresenterRespondsTo.defaultAttributes = objc_opt_respondsToSelector() & 1;
      self->_outputPresenterRespondsTo.emphasizedAttributes = objc_opt_respondsToSelector() & 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = objc_msgSend(v4, "wantsLocationNames");
      else
        v8 = 1;
      -[PXCuratedLibrarySummaryHelper summaryController](self, "summaryController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__PXCuratedLibrarySummaryHelper_setOutputPresenter___block_invoke;
      v12[3] = &unk_1E512AB98;
      v12[4] = self;
      v13 = v4;
      v14 = v8;
      objc_msgSend(v9, "performChanges:", v12);

      v11[0] = v10;
      v11[1] = 3221225472;
      v11[2] = __52__PXCuratedLibrarySummaryHelper_setOutputPresenter___block_invoke_2;
      v11[3] = &unk_1E5149198;
      v11[4] = self;
      -[PXCuratedLibrarySummaryHelper _performChanges:](self, "_performChanges:", v11);

    }
  }

}

- (PXCuratedLibrarySummaryHelper)init
{
  PXCuratedLibrarySummaryHelper *v2;
  PXBrowserSummaryController *v3;
  PXBrowserSummaryController *summaryController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCuratedLibrarySummaryHelper;
  v2 = -[PXCuratedLibrarySummaryHelper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXBrowserSummaryController);
    summaryController = v2->_summaryController;
    v2->_summaryController = v3;

    -[PXBrowserSummaryController setDataSource:](v2->_summaryController, "setDataSource:", v2);
    -[PXBrowserSummaryController registerChangeObserver:context:](v2->_summaryController, "registerChangeObserver:context:", v2, PXSummaryControllerObservationContext);
  }
  return v2;
}

- (BOOL)browserSummaryControllerShouldUpdateImmediately:(id)a3
{
  PXCuratedLibrarySummaryHelper *v3;
  void *v4;

  if (!self->_dataSourceRespondsTo.shouldUpdateImmediately)
    return 0;
  v3 = self;
  -[PXCuratedLibrarySummaryHelper dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "curatedLibrarySummaryHelperShouldUpdateImmediately:", v3);

  return (char)v3;
}

- (id)visibleContentSnapshotForBrowserSummaryController:(id)a3
{
  void *v3;
  void *v4;

  if (self->_dataSourceRespondsTo.visibleContentSnapshot)
  {
    -[PXCuratedLibrarySummaryHelper dataSource](self, "dataSource", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "visibleContentSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)visibleContentDidChange
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PXCuratedLibrarySummaryHelper dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__PXCuratedLibrarySummaryHelper_visibleContentDidChange__block_invoke;
    v5[3] = &unk_1E5149198;
    v5[4] = self;
    -[PXCuratedLibrarySummaryHelper _performChanges:](self, "_performChanges:", v5);
    -[PXCuratedLibrarySummaryHelper summaryController](self, "summaryController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performChanges:", &__block_literal_global_20_128989);

  }
}

- (PXLibrarySummaryDataSource)dataSource
{
  return (PXLibrarySummaryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)_setTopMostAssetCollection:(id)a3
{
  PXDisplayAssetCollection *v5;
  _QWORD v6[5];

  v5 = (PXDisplayAssetCollection *)a3;
  if (self->_topMostAssetCollection != v5)
  {
    objc_storeStrong((id *)&self->_topMostAssetCollection, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__PXCuratedLibrarySummaryHelper__setTopMostAssetCollection___block_invoke;
    v6[3] = &unk_1E5149198;
    v6[4] = self;
    -[PXCuratedLibrarySummaryHelper _performChanges:](self, "_performChanges:", v6);
  }

}

- (PXLibrarySummaryOutputPresenter)outputPresenter
{
  return (PXLibrarySummaryOutputPresenter *)objc_loadWeakRetained((id *)&self->_outputPresenter);
}

- (BOOL)shouldUseAbbreviatedDates
{
  return self->_shouldUseAbbreviatedDates;
}

- (PXDisplayAssetCollection)topMostAssetCollection
{
  return self->_topMostAssetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topMostAssetCollection, 0);
  objc_storeStrong((id *)&self->_summaryController, 0);
  objc_destroyWeak((id *)&self->_outputPresenter);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __60__PXCuratedLibrarySummaryHelper__setTopMostAssetCollection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTitle");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSubtitle");
}

uint64_t __56__PXCuratedLibrarySummaryHelper_visibleContentDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTopMostAssetCollection");
}

uint64_t __56__PXCuratedLibrarySummaryHelper_visibleContentDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateVisibleContent");
}

void __52__PXCuratedLibrarySummaryHelper_setOutputPresenter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 19))
  {
    objc_msgSend(*(id *)(a1 + 40), "defaultAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDefaultAttributes:", v4);

  }
  else
  {
    objc_msgSend(v3, "setDefaultAttributes:", 0);
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 20))
  {
    objc_msgSend(*(id *)(a1 + 40), "emphasizedAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEmphasizedAttributes:", v5);

  }
  else
  {
    objc_msgSend(v6, "setEmphasizedAttributes:", 0);
  }
  objc_msgSend(v6, "setShouldShowLocationNames:", *(unsigned __int8 *)(a1 + 48));

}

uint64_t __52__PXCuratedLibrarySummaryHelper_setOutputPresenter___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTopMostAssetCollection");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTitle");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSubtitle");
}

@end
