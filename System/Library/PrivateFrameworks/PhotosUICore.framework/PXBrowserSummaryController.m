@implementation PXBrowserSummaryController

- (void)didPerformChanges
{
  objc_super v3;

  -[PXBrowserSummaryController _updateIfNeeded](self, "_updateIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)PXBrowserSummaryController;
  -[PXBrowserSummaryController didPerformChanges](&v3, sel_didPerformChanges);
}

- (void)_updateIfNeeded
{
  if (-[PXBrowserSummaryController _needsUpdate](self, "_needsUpdate"))
  {
    -[PXBrowserSummaryController _updateContainerTitleIfNeeded](self, "_updateContainerTitleIfNeeded");
    -[PXBrowserSummaryController _updateLocalizedContainerItemsCountIfNeeded](self, "_updateLocalizedContainerItemsCountIfNeeded");
    -[PXBrowserSummaryController _updateContainerDateIntervalIfNeeded](self, "_updateContainerDateIntervalIfNeeded");
    -[PXBrowserSummaryController _updateSelectionSnapshotIfNeeded](self, "_updateSelectionSnapshotIfNeeded");
    -[PXBrowserSummaryController _updateFilteringContainerContentIfNeeded](self, "_updateFilteringContainerContentIfNeeded");
    -[PXBrowserSummaryController _updateAttributedSelectionTitleIfNeeded](self, "_updateAttributedSelectionTitleIfNeeded");
    -[PXBrowserSummaryController _updateStackedAssetsIfNeeded](self, "_updateStackedAssetsIfNeeded");
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.containerTitle
      || self->_needsUpdateFlags.localizedContainerItemsCount
      || self->_needsUpdateFlags.containerDateInterval
      || self->_needsUpdateFlags.selectionSnapshot
      || self->_needsUpdateFlags.filteringContainerContent
      || self->_needsUpdateFlags.attributedPrimaryTitle
      || self->_needsUpdateFlags.secondaryTitle
      || self->_needsUpdateFlags.tertiaryTitle
      || self->_needsUpdateFlags.navigationTitle
      || self->_needsUpdateFlags.attributedSelectionTitle
      || self->_needsUpdateFlags.stackedAssets;
}

- (void)_setNeedsUpdate
{
  -[PXBrowserSummaryController signalChange:](self, "signalChange:", 0);
}

uint64_t __68__PXBrowserSummaryController_invalidateLocalizedContainerItemsCount__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLocalizedContainerItemsCount");
}

uint64_t __65__PXBrowserSummaryController_invalidateFilteringContainerContent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFilteringContainerContent");
}

uint64_t __61__PXBrowserSummaryController_invalidateContainerDateInterval__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContainerDateInterval");
}

uint64_t __54__PXBrowserSummaryController_invalidateContainerTitle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContainerTitle");
}

uint64_t __49__PXBrowserSummaryController_invalidateSelection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSelectionSnapshot");
}

- (void)setShouldUseAbbreviatedDates:(BOOL)a3
{
  if (self->_shouldUseAbbreviatedDates != a3)
  {
    self->_shouldUseAbbreviatedDates = a3;
    -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
  }
}

- (void)setShouldShowLocationNames:(BOOL)a3
{
  if (self->_shouldShowLocationNames != a3)
  {
    self->_shouldShowLocationNames = a3;
    -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
  }
}

- (void)setSelectionSnapshot:(id)a3
{
  PXBrowserSelectionSnapshot *v5;
  void *v6;
  char v7;
  PXBrowserSelectionSnapshot *v8;

  v8 = (PXBrowserSelectionSnapshot *)a3;
  v5 = self->_selectionSnapshot;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[PXBrowserSelectionSnapshot isEqual:](v8, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectionSnapshot, a3);
    -[PXBrowserSummaryController selectionInfoUpdater](self, "selectionInfoUpdater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateInfo");
LABEL_4:

  }
}

- (void)setFilteringContainerContent:(BOOL)a3
{
  if (self->_filteringContainerContent != a3)
  {
    self->_filteringContainerContent = a3;
    -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
  }
}

- (void)_updateStackedAssetsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (self->_needsUpdateFlags.stackedAssets)
  {
    self->_needsUpdateFlags.stackedAssets = 0;
    -[PXBrowserSummaryController selectionInfoUpdater](self, "selectionInfoUpdater");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "info");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    if (v5 < 2)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("stackedAssets"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PXBrowserSummaryController setStackedAssets:](self, "setStackedAssets:", v6);

  }
}

- (void)_updateSelectionSnapshotIfNeeded
{
  void *v3;
  id v4;

  if (self->_needsUpdateFlags.selectionSnapshot)
  {
    self->_needsUpdateFlags.selectionSnapshot = 0;
    if (self->_dataSourceRespondsTo.selectionSnapshot)
    {
      -[PXBrowserSummaryController dataSource](self, "dataSource");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "selectionSnapshotForBrowserSummaryController:", self);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXBrowserSummaryController setSelectionSnapshot:](self, "setSelectionSnapshot:", v3);

    }
    else
    {
      -[PXBrowserSummaryController setSelectionSnapshot:](self, "setSelectionSnapshot:", 0);
    }
  }
}

- (void)_updateFilteringContainerContentIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.filteringContainerContent)
  {
    self->_needsUpdateFlags.filteringContainerContent = 0;
    if (self->_dataSourceRespondsTo.filteringContainerContent)
    {
      -[PXBrowserSummaryController dataSource](self, "dataSource");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[PXBrowserSummaryController setFilteringContainerContent:](self, "setFilteringContainerContent:", objc_msgSend(v3, "isFilteringContainerContentForBrowserSummaryController:", self));

    }
    else
    {
      -[PXBrowserSummaryController setFilteringContainerContent:](self, "setFilteringContainerContent:", 0);
    }
  }
}

- (void)_updateAttributedSelectionTitleIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_needsUpdateFlags.attributedSelectionTitle)
  {
    self->_needsUpdateFlags.attributedSelectionTitle = 0;
    -[PXBrowserSummaryController selectionInfoUpdater](self, "selectionInfoUpdater");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "info");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    if (v5 < 2)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mediaType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");

      PXLocalizedAssetCountForUsage(v5, v7, 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[PXBrowserSummaryController selectionAttributes](self, "selectionAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v10);

    }
    -[PXBrowserSummaryController setAttributedSelectionTitle:](self, "setAttributedSelectionTitle:", v11);

  }
}

- (void)_invalidateSelectionSnapshot
{
  self->_needsUpdateFlags.selectionSnapshot = 1;
  -[PXBrowserSummaryController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateLocalizedContainerItemsCount
{
  self->_needsUpdateFlags.localizedContainerItemsCount = 1;
  -[PXBrowserSummaryController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateFilteringContainerContent
{
  self->_needsUpdateFlags.filteringContainerContent = 1;
  -[PXBrowserSummaryController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateContainerTitle
{
  self->_needsUpdateFlags.containerTitle = 1;
  -[PXBrowserSummaryController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateContainerDateInterval
{
  self->_needsUpdateFlags.containerDateInterval = 1;
  -[PXBrowserSummaryController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (PXBrowserSummaryController)init
{
  char *v2;
  PXInfoUpdater *v3;
  void *v4;
  PXInfoUpdater *v5;
  void *v6;
  PXInfoUpdater *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  id v13;
  void *v14;
  PXSelectedItemsStack *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PXBrowserSummaryController;
  v2 = -[PXBrowserSummaryController init](&v24, sel_init);
  if (v2)
  {
    v3 = -[PXInfoUpdater initWithInfoProvider:infoKind:]([PXInfoUpdater alloc], "initWithInfoProvider:infoKind:", v2, CFSTR("PXVisibleDateIntervalInfoKind"));
    v4 = (void *)*((_QWORD *)v2 + 30);
    *((_QWORD *)v2 + 30) = v3;

    v5 = -[PXInfoUpdater initWithInfoProvider:infoKind:]([PXInfoUpdater alloc], "initWithInfoProvider:infoKind:", v2, CFSTR("PXSelectedItemsInfoKind"));
    v6 = (void *)*((_QWORD *)v2 + 31);
    *((_QWORD *)v2 + 31) = v5;

    v7 = -[PXInfoUpdater initWithInfoProvider:infoKind:]([PXInfoUpdater alloc], "initWithInfoProvider:infoKind:", v2, CFSTR("PXOutputTitleInfoKind"));
    v8 = (void *)*((_QWORD *)v2 + 32);
    *((_QWORD *)v2 + 32) = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.PXBrowserSummaryController", v10);
    v12 = (void *)*((_QWORD *)v2 + 33);
    *((_QWORD *)v2 + 33) = v11;

    v13 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v14 = (void *)*((_QWORD *)v2 + 34);
    *((_QWORD *)v2 + 34) = v13;

    v15 = -[PXSelectedItemsStack initWithDepth:]([PXSelectedItemsStack alloc], "initWithDepth:", 3);
    v16 = (void *)*((_QWORD *)v2 + 41);
    *((_QWORD *)v2 + 41) = v15;

    *(_WORD *)(v2 + 115) = 1;
    v2[118] = 0;
    PXLocalizedStringFromTable(CFSTR("PXBrowserSummaryNoFilteringResultsPlaceholderText"), CFSTR("PhotosUICore"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v2 + 42);
    *((_QWORD *)v2 + 42) = v17;

    PXLocalizedStringFromTable(CFSTR("PXBrowserSummaryComponentsSeparator"), CFSTR("PhotosUICore"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v2 + 36);
    *((_QWORD *)v2 + 36) = v19;

    v21 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v22 = (void *)*((_QWORD *)v2 + 35);
    *((_QWORD *)v2 + 35) = v21;

    objc_msgSend(*((id *)v2 + 35), "setDateStyle:", 3);
    objc_msgSend(*((id *)v2 + 35), "setTimeStyle:", 0);
    objc_msgSend(*((id *)v2 + 30), "setObserver:", v2);
    objc_msgSend(*((id *)v2 + 31), "setObserver:", v2);
    objc_msgSend(*((id *)v2 + 32), "setObserver:", v2);
    *((_QWORD *)v2 + 19) = 8;
  }
  return (PXBrowserSummaryController *)v2;
}

uint64_t __51__PXBrowserSummaryController__performRequestBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __44__PXBrowserSummaryController_setDataSource___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PXBrowserSummaryController_setDataSource___block_invoke_4;
  v3[3] = &unk_1E511A8B0;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "performChanges:", v3);

  objc_destroyWeak(&v4);
}

void __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v2, CFSTR("dateInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "dateIntervalGranularity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("granularity"));

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "locationNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("locationNames"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedPlaceholderText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("placeholder"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __44__PXBrowserSummaryController_setDataSource___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateContainerTitle");
  objc_msgSend(*(id *)(a1 + 32), "invalidateLocalizedContainerItemsCount");
  objc_msgSend(*(id *)(a1 + 32), "invalidateContainerDateInterval");
  objc_msgSend(*(id *)(a1 + 32), "invalidateVisibleContent");
  objc_msgSend(*(id *)(a1 + 32), "invalidateSelection");
  objc_msgSend(*(id *)(a1 + 32), "invalidateFilteringContainerContent");
  return objc_msgSend(*(id *)(a1 + 32), "setReady:", 0);
}

- (void)invalidateSelection
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__PXBrowserSummaryController_invalidateSelection__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXBrowserSummaryController performChanges:](self, "performChanges:", v2);
}

- (void)invalidateLocalizedContainerItemsCount
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__PXBrowserSummaryController_invalidateLocalizedContainerItemsCount__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXBrowserSummaryController performChanges:](self, "performChanges:", v2);
}

- (void)invalidateFilteringContainerContent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__PXBrowserSummaryController_invalidateFilteringContainerContent__block_invoke;
  v2[3] = &unk_1E511A888;
  v2[4] = self;
  -[PXBrowserSummaryController performChanges:](self, "performChanges:", v2);
}

- (void)invalidateContainerTitle
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__PXBrowserSummaryController_invalidateContainerTitle__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXBrowserSummaryController performChanges:](self, "performChanges:", v2);
}

- (void)invalidateContainerDateInterval
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__PXBrowserSummaryController_invalidateContainerDateInterval__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXBrowserSummaryController performChanges:](self, "performChanges:", v2);
}

void __66__PXBrowserSummaryController__requestTitlesInfoWithResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("dateInterval"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v30 = (id)v2;
  if (v3)
  {
    v4 = v3;
    v5 = (__CFString *)*(id *)(a1 + 48);
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("granularity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = (__CFString *)v30;
  if (v8)
  {
    v5 = v8;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 64), "px_dateTemplateForGranularity:abbreviated:", v7, *(unsigned __int8 *)(a1 + 145));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setDateTemplate:", v9);

    objc_msgSend(*(id *)(a1 + 64), "px_attributedStringFromDateInterval:defaultAttributes:emphasizedAttributes:", v5, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_attributedStringByApplyingCapitalization:", 3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v5 = CFSTR("DateInterval");
    goto LABEL_11;
  }
  if (*(_BYTE *)(a1 + 144))
  {
    v5 = (__CFString *)*(id *)(a1 + 56);
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 136);
      goto LABEL_5;
    }
  }
  else
  {
    v5 = 0;
  }
  v4 = 0;
LABEL_11:
  if (*(_BYTE *)(a1 + 146))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("locationNames"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "firstObject");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if ((unint64_t)objc_msgSend(v11, "count") < 2)
    {
      v12 = 0;
    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("PXBrowserSummaryLocationAndMore"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v15 = CFSTR("Location");
    goto LABEL_27;
  }
  if (*(_BYTE *)(a1 + 147))
  {
    PXLocalizedStringFromTable(CFSTR("IMPORT_HISTORY_IMPORTED_ON_DATE"), CFSTR("PhotosUICore"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 88) + 280), "stringFromDate:", v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v11, CFSTR("%@"));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = &stru_1E5149688;
    }

    v15 = CFSTR("ImportDate");
    goto LABEL_27;
  }
  v16 = v30;
  if (!v30 && *(_BYTE *)(a1 + 144))
  {
    v12 = (__CFString *)*(id *)(a1 + 96);
    v15 = CFSTR("FilteringResultsPlaceholder");
    if (!*(_BYTE *)(a1 + 150))
      goto LABEL_35;
LABEL_34:
    if (*(_BYTE *)(a1 + 144))
      goto LABEL_35;
    goto LABEL_30;
  }
  if (*(_BYTE *)(a1 + 148))
  {
    v11 = *(id *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 136);
    if (v11)
    {
LABEL_24:
      objc_msgSend(*(id *)(a1 + 64), "px_dateTemplateForGranularity:abbreviated:", v17, *(unsigned __int8 *)(a1 + 145));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setDateTemplate:", v18);

      objc_msgSend(*(id *)(a1 + 64), "stringFromDateInterval:", v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("DateInterval");
LABEL_27:

      v16 = v30;
      goto LABEL_28;
    }
LABEL_60:
    v15 = 0;
    v12 = 0;
    goto LABEL_27;
  }
  if (*(_BYTE *)(a1 + 149))
  {
    v11 = v30;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("granularity"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v28, "unsignedIntegerValue");

    if (v11)
      goto LABEL_24;
    goto LABEL_60;
  }
  v15 = 0;
  v12 = 0;
LABEL_28:
  if (!*(_BYTE *)(a1 + 150))
    goto LABEL_35;
  if (!v16)
    goto LABEL_34;
LABEL_30:
  if (!*(_BYTE *)(a1 + 151))
  {
    v19 = *(id *)(a1 + 104);
    v20 = CFSTR("ContainerItemsCount");
    goto LABEL_36;
  }
LABEL_35:
  v19 = 0;
  v20 = 0;
LABEL_36:
  if (*(_BYTE *)(a1 + 151))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    if (*(_QWORD *)(a1 + 112))
    {
      if (*(_BYTE *)(a1 + 144) || !*(_QWORD *)(a1 + 56))
        goto LABEL_64;
      objc_msgSend(*(id *)(a1 + 64), "px_dateTemplateForGranularity:abbreviated:", *(_QWORD *)(a1 + 136), *(unsigned __int8 *)(a1 + 145));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setDateTemplate:", v22);

      objc_msgSend(*(id *)(a1 + 64), "stringFromDateInterval:", *(_QWORD *)(a1 + 56));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_msgSend(v21, "addObject:", v23);

      if (*(_QWORD *)(a1 + 112))
        goto LABEL_64;
    }
    if (*(_BYTE *)(a1 + 144) && !objc_msgSend(v21, "count"))
    {
LABEL_64:
      if (*(_QWORD *)(a1 + 104))
        objc_msgSend(v21, "addObject:");
    }
    if (objc_msgSend(v21, "count", v29))
    {
      objc_msgSend(v21, "componentsJoinedByString:", *(_QWORD *)(a1 + 120));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  if (!objc_msgSend(v4, "length", v29) && !-[__CFString length](v12, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("placeholder"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v25, *(_QWORD *)(a1 + 80));

      v5 = CFSTR("PlaceholderText");
      v4 = (id)v26;
    }

  }
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v4, CFSTR("attributedPrimaryTitle"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v5, CFSTR("primaryTitleAccessibilityIdentifier"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v12, CFSTR("secondaryTitle"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v15, CFSTR("secondaryTitleAccessibilityIdentifier"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, CFSTR("tertiaryTitle"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v20, CFSTR("tertiaryTitleAccessibilityIdentifier"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, CFSTR("navigationTitle"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 128) + 16))();

}

- (void)setDataSource:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_dataSource, v4);
    self->_dataSourceRespondsTo.containerTitle = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.localizedContainerItemsCount = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.containerDateInterval = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.visibleContentSnapshot = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.selectionSnapshot = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.filteringContainerContent = objc_opt_respondsToSelector() & 1;
    self->_dataSourceRespondsTo.useAssetImportDate = objc_opt_respondsToSelector() & 1;
    v6 = objc_opt_respondsToSelector();
    v7 = MEMORY[0x1E0C809B0];
    self->_dataSourceRespondsTo.shouldUpdateImmediately = v6 & 1;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __44__PXBrowserSummaryController_setDataSource___block_invoke;
    v11[3] = &unk_1E511A888;
    v11[4] = self;
    -[PXBrowserSummaryController performChanges:](self, "performChanges:", v11);
    objc_initWeak(&location, self);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __44__PXBrowserSummaryController_setDataSource___block_invoke_2;
    v8[3] = &unk_1E5148D30;
    objc_copyWeak(&v9, &location);
    -[PXBrowserSummaryController performBlockWhenDoneUpdating:](self, "performBlockWhenDoneUpdating:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)invalidateVisibleContent
{
  id v2;

  -[PXBrowserSummaryController visibleMetadataInfoUpdater](self, "visibleMetadataInfoUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateInfo");

}

- (void)_invalidateTitles
{
  id v2;

  -[PXBrowserSummaryController titlesInfoUpdater](self, "titlesInfoUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateInfo");

}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXVisibleDateIntervalInfoKind")))
  {
    if (self->_dataSourceRespondsTo.visibleContentSnapshot)
    {
      -[PXBrowserSummaryController dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "visibleContentSnapshotForBrowserSummaryController:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[PXBrowserSummaryController shouldShowLocationNames](self, "shouldShowLocationNames");
      if (v10)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke;
        v23[3] = &unk_1E5146308;
        v24 = v10;
        v26 = v11;
        v25 = v8;
        v12 = v10;
        -[PXBrowserSummaryController _performRequestBlock:](self, "_performRequestBlock:", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      -[PXBrowserSummaryController shouldShowLocationNames](self, "shouldShowLocationNames");
    }
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXSelectedItemsInfoKind")))
    {
      -[PXBrowserSummaryController selectionSnapshot](self, "selectionSnapshot");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "estimatedAssetCount") < 1)
      {
        (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
        v13 = 0;
      }
      else
      {
        -[PXBrowserSummaryController selectedAssetsStack](self, "selectedAssetsStack");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke_2;
        v19[3] = &unk_1E5145688;
        v20 = v12;
        v21 = v14;
        v22 = v8;
        v15 = v14;
        -[PXBrowserSummaryController _performRequestBlock:](self, "_performRequestBlock:", v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_14;
    }
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXOutputTitleInfoKind")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSummaryController.m"), 850, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v16 = -[PXBrowserSummaryController _requestTitlesInfoWithResultHandler:](self, "_requestTitlesInfoWithResultHandler:", v8);
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)shouldShowLocationNames
{
  return self->_shouldShowLocationNames;
}

- (int64_t)priorityForInfoRequestOfKind:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PXSelectedItemsInfoKind")))
  {
    -[PXBrowserSummaryController selectionSnapshot](self, "selectionSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "estimatedAssetCount");

    v6 = 10;
    if (v5 != 1)
      v6 = 0;
    if (v5)
      v7 = v6;
    else
      v7 = 100;
  }
  else
  {
    v7 = 0;
  }
  if (-[PXBrowserSummaryController shouldUpdateImmediately](self, "shouldUpdateImmediately"))
    return 100;
  else
    return v7;
}

- (BOOL)shouldUpdateImmediately
{
  PXBrowserSummaryController *v2;
  void *v3;

  if (!self->_dataSourceRespondsTo.shouldUpdateImmediately)
    return 0;
  v2 = self;
  -[PXBrowserSummaryController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "browserSummaryControllerShouldUpdateImmediately:", v2);

  return (char)v2;
}

- (PXBrowserSummaryControllerDataSource)dataSource
{
  return (PXBrowserSummaryControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

void __51__PXBrowserSummaryController_infoUpdaterDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "visibleMetadataInfoUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_invalidateTitles");
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "selectionInfoUpdater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "_invalidateAttributedSelectionTitle");
      objc_msgSend(*(id *)(a1 + 40), "_invalidateStackedAssets");
    }
    else
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "titlesInfoUpdater");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 != v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("PXBrowserSummaryController.m"), 798, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      objc_msgSend(*(id *)(a1 + 40), "titlesInfoUpdater");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "info");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = *(void **)(a1 + 40);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributedPrimaryTitle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("primaryTitleAccessibilityIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_setAttributedPrimaryTitle:accessibilityIdentifier:", v12, v13);

      v14 = *(void **)(a1 + 40);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("secondaryTitle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("secondaryTitleAccessibilityIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setSecondaryTitle:accessibilityIdentifier:", v15, v16);

      v17 = *(void **)(a1 + 40);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("tertiaryTitle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("tertiaryTitleAccessibilityIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_setTertiaryTitle:accessibilityIdentifier:", v18, v19);

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("navigationTitle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setNavigationTitle:", v20);

    }
  }

}

- (PXInfoUpdater)titlesInfoUpdater
{
  return self->_titlesInfoUpdater;
}

- (PXInfoUpdater)visibleMetadataInfoUpdater
{
  return self->_visibleMetadataInfoUpdater;
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXBrowserSummaryController *v9;
  SEL v10;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PXBrowserSummaryController_infoUpdaterDidUpdate___block_invoke;
  v7[3] = &unk_1E5144A98;
  v8 = v5;
  v9 = self;
  v10 = a2;
  v6 = v5;
  -[PXBrowserSummaryController performChanges:](self, "performChanges:", v7);

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXBrowserSummaryController;
  -[PXBrowserSummaryController performChanges:](&v3, sel_performChanges_, a3);
}

- (PXInfoUpdater)selectionInfoUpdater
{
  return self->_selectionInfoUpdater;
}

- (void)setNavigationTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *navigationTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_navigationTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      navigationTitle = self->_navigationTitle;
      self->_navigationTitle = v6;

      -[PXBrowserSummaryController signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)_setTertiaryTitle:(id)a3 accessibilityIdentifier:(id)a4
{
  NSString *v6;
  NSString *v7;
  _BOOL4 v8;
  NSString *v9;
  NSString *v10;
  BOOL v11;
  NSString *v12;
  NSString *tertiaryTitle;
  NSString *v14;
  NSString *tertiaryTitleAccessibilityIdentifier;
  NSString *v16;

  v16 = (NSString *)a3;
  v6 = (NSString *)a4;
  v7 = self->_tertiaryTitle;
  if (v7 == v16)
  {

  }
  else
  {
    v8 = -[NSString isEqualToString:](v16, "isEqualToString:", v7);

    if (!v8)
    {
LABEL_7:
      v12 = (NSString *)-[NSString copy](v16, "copy");
      tertiaryTitle = self->_tertiaryTitle;
      self->_tertiaryTitle = v12;

      v14 = (NSString *)-[NSString copy](v6, "copy");
      tertiaryTitleAccessibilityIdentifier = self->_tertiaryTitleAccessibilityIdentifier;
      self->_tertiaryTitleAccessibilityIdentifier = v14;

      -[PXBrowserSummaryController signalChange:](self, "signalChange:", 4);
      goto LABEL_9;
    }
  }
  v9 = self->_tertiaryTitleAccessibilityIdentifier;
  if (v9 == v6)
  {

    goto LABEL_9;
  }
  v10 = v9;
  v11 = -[NSString isEqualToString:](v6, "isEqualToString:", v9);

  if (!v11)
    goto LABEL_7;
LABEL_9:

}

- (void)_setSecondaryTitle:(id)a3 accessibilityIdentifier:(id)a4
{
  NSString *v6;
  NSString *v7;
  _BOOL4 v8;
  NSString *v9;
  NSString *v10;
  BOOL v11;
  NSString *v12;
  NSString *secondaryTitle;
  NSString *v14;
  NSString *secondaryTitleAccessibilityIdentifier;
  NSString *v16;

  v16 = (NSString *)a3;
  v6 = (NSString *)a4;
  v7 = self->_secondaryTitle;
  if (v7 == v16)
  {

  }
  else
  {
    v8 = -[NSString isEqualToString:](v16, "isEqualToString:", v7);

    if (!v8)
    {
LABEL_7:
      v12 = (NSString *)-[NSString copy](v16, "copy");
      secondaryTitle = self->_secondaryTitle;
      self->_secondaryTitle = v12;

      v14 = (NSString *)-[NSString copy](v6, "copy");
      secondaryTitleAccessibilityIdentifier = self->_secondaryTitleAccessibilityIdentifier;
      self->_secondaryTitleAccessibilityIdentifier = v14;

      -[PXBrowserSummaryController signalChange:](self, "signalChange:", 2);
      goto LABEL_9;
    }
  }
  v9 = self->_secondaryTitleAccessibilityIdentifier;
  if (v9 == v6)
  {

    goto LABEL_9;
  }
  v10 = v9;
  v11 = -[NSString isEqualToString:](v6, "isEqualToString:", v9);

  if (!v11)
    goto LABEL_7;
LABEL_9:

}

- (void)_setAttributedPrimaryTitle:(id)a3 accessibilityIdentifier:(id)a4
{
  NSString *v6;
  NSAttributedString *v7;
  int v8;
  NSString *v9;
  NSString *v10;
  BOOL v11;
  NSAttributedString *v12;
  NSAttributedString *attributedPrimaryTitle;
  NSString *v14;
  NSString *primaryTitleAccessibilityIdentifier;
  NSAttributedString *v16;

  v16 = (NSAttributedString *)a3;
  v6 = (NSString *)a4;
  v7 = self->_attributedPrimaryTitle;
  if (v7 == v16)
  {

  }
  else
  {
    v8 = -[NSAttributedString isEqual:](v16, "isEqual:", v7);

    if (!v8)
    {
LABEL_7:
      v12 = (NSAttributedString *)-[NSAttributedString copy](v16, "copy");
      attributedPrimaryTitle = self->_attributedPrimaryTitle;
      self->_attributedPrimaryTitle = v12;

      v14 = (NSString *)-[NSString copy](v6, "copy");
      primaryTitleAccessibilityIdentifier = self->_primaryTitleAccessibilityIdentifier;
      self->_primaryTitleAccessibilityIdentifier = v14;

      -[PXBrowserSummaryController signalChange:](self, "signalChange:", 1);
      goto LABEL_9;
    }
  }
  v9 = self->_primaryTitleAccessibilityIdentifier;
  if (v9 == v6)
  {

    goto LABEL_9;
  }
  v10 = v9;
  v11 = -[NSString isEqualToString:](v6, "isEqualToString:", v9);

  if (!v11)
    goto LABEL_7;
LABEL_9:

}

- (id)_requestTitlesInfoWithResultHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;
  const __CFString *v15;
  id v16;
  BOOL v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  BOOL v29;
  BOOL v30;
  void *v31;
  char v32;
  BOOL v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  PXBrowserSummaryController *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  unint64_t v59;
  BOOL v60;
  BOOL v61;
  BOOL v62;
  char v63;
  char v64;
  char v65;
  BOOL v66;
  BOOL v67;
  _QWORD v68[5];
  id v69;
  __CFString *v70;

  v41 = a3;
  -[PXBrowserSummaryController defaultAttributes](self, "defaultAttributes");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBrowserSummaryController emphasizedAttributes](self, "emphasizedAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBrowserSummaryController visibleMetadataInfoUpdater](self, "visibleMetadataInfoUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "info");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXBrowserSummaryController containerTitle](self, "containerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXBrowserSummaryController isFilteringContainerContent](self, "isFilteringContainerContent");
  -[PXBrowserSummaryController containerDateInterval](self, "containerDateInterval");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBrowserSummaryController dateIntervalFormatter](self, "dateIntervalFormatter");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBrowserSummaryController noFilteringResultsPlaceholderText](self, "noFilteringResultsPlaceholderText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBrowserSummaryController localizedContainerItemsCount](self, "localizedContainerItemsCount");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBrowserSummaryController localizedComponentsSeparator](self, "localizedComponentsSeparator");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXBrowserSummaryController shouldUseSubtitles](self, "shouldUseSubtitles");
  v30 = -[PXBrowserSummaryController shouldUseNavigationTitle](self, "shouldUseNavigationTitle");
  v33 = -[PXBrowserSummaryController shouldShowLocationNames](self, "shouldShowLocationNames");
  if (self->_dataSourceRespondsTo.useAssetImportDate)
  {
    -[PXBrowserSummaryController dataSource](self, "dataSource");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v10, "shouldShowImportDates");

    v8 = v9;
  }
  else
  {
    v32 = 0;
  }
  v29 = -[PXBrowserSummaryController shouldUseAbbreviatedDates](self, "shouldUseAbbreviatedDates");
  v11 = -[PXBrowserSummaryController containerDateFormatGranularity](self, "containerDateFormatGranularity");
  v12 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v13 = v7;
    v14 = v11;
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __66__PXBrowserSummaryController__requestTitlesInfoWithResultHandler___block_invoke;
    v68[3] = &unk_1E511A8D8;
    v68[4] = self;
    v15 = CFSTR("ContainerTitle");
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v4);
    v69 = v16;
    v70 = CFSTR("ContainerTitle");
    -[PXBrowserSummaryController performChanges:](self, "performChanges:", v68);

    v11 = v14;
    v7 = v13;
    v17 = v8;
  }
  else
  {
    v17 = 0;
    v16 = 0;
    v15 = 0;
  }
  v45[0] = v12;
  if (v31)
    v18 = v30;
  else
    v18 = 1;
  v45[1] = 3221225472;
  v45[2] = __66__PXBrowserSummaryController__requestTitlesInfoWithResultHandler___block_invoke_2;
  v45[3] = &unk_1E511A900;
  v46 = v44;
  v47 = v16;
  v19 = v16;
  v60 = v7;
  v48 = (__CFString *)v15;
  v49 = v31;
  v61 = v29;
  v50 = v40;
  v51 = v43;
  v62 = v33;
  v63 = v32;
  v52 = v4;
  v53 = self;
  v64 = v17 & (v18 ^ 1);
  v65 = v17 & v18;
  v66 = v8;
  v67 = v30;
  v54 = v39;
  v55 = v37;
  v56 = v6;
  v59 = v11;
  v57 = v35;
  v58 = v41;
  v42 = v41;
  v36 = v35;
  v34 = v6;
  v38 = v37;
  v20 = v39;
  v21 = v4;
  v22 = v43;
  v23 = v40;
  v24 = v31;
  v25 = v19;
  v26 = v44;
  -[PXBrowserSummaryController _performRequestBlock:](self, "_performRequestBlock:", v45);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_performRequestBlock:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  void (**v11)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[PXBrowserSummaryController shouldUpdateImmediately](self, "shouldUpdateImmediately"))
  {
    v4[2](v4);
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBrowserSummaryController queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__PXBrowserSummaryController__performRequestBlock___block_invoke;
    v9[3] = &unk_1E5148CE0;
    v5 = v6;
    v10 = v5;
    v11 = v4;
    dispatch_async(v7, v9);

  }
  return v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)shouldUseSubtitles
{
  return self->_shouldUseSubtitles;
}

- (BOOL)shouldUseNavigationTitle
{
  return self->_shouldUseNavigationTitle;
}

- (BOOL)shouldUseAbbreviatedDates
{
  return self->_shouldUseAbbreviatedDates;
}

- (NSString)noFilteringResultsPlaceholderText
{
  return self->_noFilteringResultsPlaceholderText;
}

- (NSString)localizedContainerItemsCount
{
  return self->_localizedContainerItemsCount;
}

- (NSString)localizedComponentsSeparator
{
  return self->_localizedComponentsSeparator;
}

- (BOOL)isFilteringContainerContent
{
  return self->_filteringContainerContent;
}

- (NSDictionary)emphasizedAttributes
{
  return self->_emphasizedAttributes;
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  return self->_dateIntervalFormatter;
}

- (NSString)containerTitle
{
  return self->_containerTitle;
}

- (NSDateInterval)containerDateInterval
{
  return self->_containerDateInterval;
}

- (unint64_t)containerDateFormatGranularity
{
  return self->_containerDateFormatGranularity;
}

uint64_t __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    NSLog(CFSTR("%@ titlesInfoUpdater done updating"), WeakRetained);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;

  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    NSLog(CFSTR("%@ selectionInfoUpdater done updating"), WeakRetained);

  }
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "titlesInfoUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke_3;
  v5[3] = &unk_1E511C3F0;
  v8 = *(_BYTE *)(a1 + 48);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "performBlockWhenDoneUpdating:", v5);

  objc_destroyWeak(&v7);
}

void __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;

  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    NSLog(CFSTR("%@ visibleMetadataInfoUpdater done updating"), WeakRetained);

  }
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "selectionInfoUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke_2;
  v5[3] = &unk_1E511C3F0;
  v8 = *(_BYTE *)(a1 + 48);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "performBlockWhenDoneUpdating:", v5);

  objc_destroyWeak(&v7);
}

void __44__PXBrowserSummaryController_setDataSource___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PXBrowserSummaryController_setDataSource___block_invoke_3;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

- (PXBrowserSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (void)performBlockWhenDoneUpdating:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v4 = a3;
  v5 = -[PXBrowserSummaryController wantsVerboseLogging](self, "wantsVerboseLogging");
  v6 = v5;
  if (v5)
    NSLog(CFSTR("%@ will performBlockWhenDoneUpdating"), self);
  objc_initWeak(&location, self);
  -[PXBrowserSummaryController visibleMetadataInfoUpdater](self, "visibleMetadataInfoUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__PXBrowserSummaryController_performBlockWhenDoneUpdating___block_invoke;
  v9[3] = &unk_1E511C3F0;
  v12 = v6;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "performBlockWhenDoneUpdating:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (BOOL)wantsVerboseLogging
{
  return self->_wantsVerboseLogging;
}

void __44__PXBrowserSummaryController_setDataSource___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setReady:", 1);

}

- (void)setReady:(BOOL)a3
{
  if (self->_ready != a3)
  {
    self->_ready = a3;
    -[PXBrowserSummaryController signalChange:](self, "signalChange:", 64);
  }
}

- (void)_updateContainerTitleIfNeeded
{
  void *v3;
  id v4;

  if (self->_needsUpdateFlags.containerTitle)
  {
    self->_needsUpdateFlags.containerTitle = 0;
    if (self->_dataSourceRespondsTo.containerTitle)
    {
      -[PXBrowserSummaryController dataSource](self, "dataSource");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "containerTitleForBrowserSummaryController:", self);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    -[PXBrowserSummaryController setContainerTitle:](self, "setContainerTitle:", v4);

  }
}

- (void)setContainerTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *containerTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_containerTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      containerTitle = self->_containerTitle;
      self->_containerTitle = v6;

      -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
    }
  }

}

- (void)_updateLocalizedContainerItemsCountIfNeeded
{
  void *v3;
  id v4;

  if (self->_needsUpdateFlags.localizedContainerItemsCount)
  {
    self->_needsUpdateFlags.localizedContainerItemsCount = 0;
    if (self->_dataSourceRespondsTo.localizedContainerItemsCount)
    {
      -[PXBrowserSummaryController dataSource](self, "dataSource");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedContainerItemsCountForBrowserSummaryController:", self);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    -[PXBrowserSummaryController setLocalizedContainerItemsCount:](self, "setLocalizedContainerItemsCount:", v4);

  }
}

- (void)setLocalizedContainerItemsCount:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *localizedContainerItemsCount;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_localizedContainerItemsCount;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      localizedContainerItemsCount = self->_localizedContainerItemsCount;
      self->_localizedContainerItemsCount = v6;

      -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
    }
  }

}

- (void)_updateContainerDateIntervalIfNeeded
{
  void *v3;
  id v4;

  if (self->_needsUpdateFlags.containerDateInterval)
  {
    self->_needsUpdateFlags.containerDateInterval = 0;
    if (self->_dataSourceRespondsTo.containerDateInterval)
    {
      -[PXBrowserSummaryController dataSource](self, "dataSource");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "containerDateIntervalForBrowserSummaryController:", self);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    -[PXBrowserSummaryController setContainerDateInterval:](self, "setContainerDateInterval:", v4);

  }
}

- (void)setContainerDateInterval:(id)a3
{
  NSDateInterval *v4;
  char v5;
  NSDateInterval *v6;
  NSDateInterval *containerDateInterval;
  NSDateInterval *v8;

  v8 = (NSDateInterval *)a3;
  v4 = self->_containerDateInterval;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDateInterval isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDateInterval *)-[NSDateInterval copy](v8, "copy");
      containerDateInterval = self->_containerDateInterval;
      self->_containerDateInterval = v6;

      -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
    }
  }

}

- (void)setAttributedSelectionTitle:(id)a3
{
  NSAttributedString *v4;
  char v5;
  NSAttributedString *v6;
  NSAttributedString *attributedSelectionTitle;
  NSAttributedString *v8;

  v8 = (NSAttributedString *)a3;
  v4 = self->_attributedSelectionTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSAttributedString isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
      attributedSelectionTitle = self->_attributedSelectionTitle;
      self->_attributedSelectionTitle = v6;

      -[PXBrowserSummaryController signalChange:](self, "signalChange:", 16);
    }
  }

}

- (void)setStackedAssets:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *stackedAssets;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_stackedAssets;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      stackedAssets = self->_stackedAssets;
      self->_stackedAssets = v6;

      -[PXBrowserSummaryController signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setDefaultAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *defaultAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_defaultAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      defaultAttributes = self->_defaultAttributes;
      self->_defaultAttributes = v6;

      -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
    }
  }

}

- (void)setEmphasizedAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *emphasizedAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_emphasizedAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      emphasizedAttributes = self->_emphasizedAttributes;
      self->_emphasizedAttributes = v6;

      -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
    }
  }

}

- (void)setSelectionAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *selectionAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_selectionAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      selectionAttributes = self->_selectionAttributes;
      self->_selectionAttributes = v6;

      -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
      -[PXBrowserSummaryController _invalidateAttributedSelectionTitle](self, "_invalidateAttributedSelectionTitle");
    }
  }

}

- (void)setShouldUseSubtitles:(BOOL)a3
{
  if (self->_shouldUseSubtitles != a3)
  {
    self->_shouldUseSubtitles = a3;
    -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
  }
}

- (void)setShouldUseNavigationTitle:(BOOL)a3
{
  if (self->_shouldUseNavigationTitle != a3)
  {
    self->_shouldUseNavigationTitle = a3;
    -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
  }
}

- (void)setContainerDateFormatGranularity:(unint64_t)a3
{
  if (self->_containerDateFormatGranularity != a3)
  {
    self->_containerDateFormatGranularity = a3;
    -[PXBrowserSummaryController _invalidateTitles](self, "_invalidateTitles");
  }
}

- (void)_invalidateAttributedSelectionTitle
{
  self->_needsUpdateFlags.attributedSelectionTitle = 1;
  -[PXBrowserSummaryController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateStackedAssets
{
  self->_needsUpdateFlags.stackedAssets = 1;
  -[PXBrowserSummaryController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (NSDictionary)selectionAttributes
{
  return self->_selectionAttributes;
}

- (NSAttributedString)attributedPrimaryTitle
{
  return self->_attributedPrimaryTitle;
}

- (NSString)primaryTitleAccessibilityIdentifier
{
  return self->_primaryTitleAccessibilityIdentifier;
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (NSString)secondaryTitleAccessibilityIdentifier
{
  return self->_secondaryTitleAccessibilityIdentifier;
}

- (NSString)tertiaryTitle
{
  return self->_tertiaryTitle;
}

- (NSString)tertiaryTitleAccessibilityIdentifier
{
  return self->_tertiaryTitleAccessibilityIdentifier;
}

- (NSString)navigationTitle
{
  return self->_navigationTitle;
}

- (NSAttributedString)attributedSelectionTitle
{
  return self->_attributedSelectionTitle;
}

- (NSArray)stackedAssets
{
  return self->_stackedAssets;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (NSDateFormatter)importDateFormatter
{
  return self->_importDateFormatter;
}

- (PXSelectedItemsStack)selectedAssetsStack
{
  return self->_selectedAssetsStack;
}

- (void)setSelectedAssetsStack:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAssetsStack, a3);
}

- (void)setWantsVerboseLogging:(BOOL)a3
{
  self->_wantsVerboseLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noFilteringResultsPlaceholderText, 0);
  objc_storeStrong((id *)&self->_selectedAssetsStack, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_containerDateInterval, 0);
  objc_storeStrong((id *)&self->_localizedContainerItemsCount, 0);
  objc_storeStrong((id *)&self->_containerTitle, 0);
  objc_storeStrong((id *)&self->_localizedComponentsSeparator, 0);
  objc_storeStrong((id *)&self->_importDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_titlesInfoUpdater, 0);
  objc_storeStrong((id *)&self->_selectionInfoUpdater, 0);
  objc_storeStrong((id *)&self->_visibleMetadataInfoUpdater, 0);
  objc_storeStrong((id *)&self->_stackedAssets, 0);
  objc_storeStrong((id *)&self->_attributedSelectionTitle, 0);
  objc_storeStrong((id *)&self->_navigationTitle, 0);
  objc_storeStrong((id *)&self->_tertiaryTitleAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_tertiaryTitle, 0);
  objc_storeStrong((id *)&self->_secondaryTitleAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_primaryTitleAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_attributedPrimaryTitle, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_selectionAttributes, 0);
  objc_storeStrong((id *)&self->_emphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
}

void __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "assetCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("mediaType"));

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke_3;
  v7[3] = &unk_1E511A928;
  v5 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "performChanges:", v7);
  objc_msgSend(*(id *)(a1 + 40), "topItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("stackedAssets"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __66__PXBrowserSummaryController_requestInfoOfKind_withResultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _PXBrowserSummarySelectedItemsSnapshot *v4;

  v3 = a2;
  v4 = -[_PXBrowserSummarySelectedItemsSnapshot initWithBrowserSelectionSnapshot:]([_PXBrowserSummarySelectedItemsSnapshot alloc], "initWithBrowserSelectionSnapshot:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "updateWithSelectedItemsSnapshot:", v4);

}

uint64_t __66__PXBrowserSummaryController__requestTitlesInfoWithResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAttributedPrimaryTitle:accessibilityIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
