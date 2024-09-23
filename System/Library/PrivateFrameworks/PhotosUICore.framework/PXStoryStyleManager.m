@implementation PXStoryStyleManager

- (PXStoryStyleManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleManager.m"), 59, CFSTR("%s is not available as initializer"), "-[PXStoryStyleManager init]");

  abort();
}

- (PXStoryStyleManager)initWithRecipeManager:(id)a3 errorReporter:(id)a4
{
  id v7;
  id v8;
  PXStoryStyleManager *v9;
  PXStoryStyleManager *v10;
  uint64_t v11;
  PXStoryColorGradingRepository *colorGradingRepository;
  void *v13;
  uint64_t v14;
  PXStoryStyleProducer *styleProducer;
  char v16;
  uint64_t v17;
  OS_dispatch_queue *storyQueue;
  _PXDefaultAudioCueProvider *v19;
  PXAudioCueProvider *cueProvider;
  uint64_t v21;
  PXUpdater *updater;
  _QWORD v24[4];
  PXStoryStyleManager *v25;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PXStoryStyleManager;
  v9 = -[PXStoryStyleManager init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    -[PXStoryStyleManager copyLogConfigurationFrom:](v9, "copyLogConfigurationFrom:", v7);
    objc_storeStrong((id *)&v10->_recipeManager, a3);
    objc_storeStrong((id *)&v10->_errorReporter, a4);
    +[PXStoryColorGradingRepositoryFactory sharedRepository](PXStoryColorGradingRepositoryFactory, "sharedRepository");
    v11 = objc_claimAutoreleasedReturnValue();
    colorGradingRepository = v10->_colorGradingRepository;
    v10->_colorGradingRepository = (PXStoryColorGradingRepository *)v11;

    -[PXStoryRecipeManager registerChangeObserver:context:](v10->_recipeManager, "registerChangeObserver:context:", v10, RecipeManagerObservationContext_163805);
    objc_msgSend(v7, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryDefaultStyleProducerForConfiguration(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    styleProducer = v10->_styleProducer;
    v10->_styleProducer = (PXStoryStyleProducer *)v14;

    v16 = objc_msgSend(v13, "options");
    v10->_styleOptions.croppingOptions = 0;
    *(_QWORD *)&v10->_styleOptions.preferStillKeySegment = (v16 & 2) == 0;
    -[PXStoryRecipeManager storyQueue](v10->_recipeManager, "storyQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    storyQueue = v10->_storyQueue;
    v10->_storyQueue = (OS_dispatch_queue *)v17;

    v19 = objc_alloc_init(_PXDefaultAudioCueProvider);
    cueProvider = v10->_cueProvider;
    v10->_cueProvider = (PXAudioCueProvider *)v19;

    v21 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v10, sel__setNeedsUpdate);
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v21;

    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateStyleConfigurationList);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateCurrentStyleInfo);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updatePredefinedStyleInfos);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateStylesAttributes);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateCueSource);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateSelectionDataSource);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateSelectionDataSourceStylesAttributes);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateCurrentStyle);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateCurrentStyleAttributes);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__PXStoryStyleManager_initWithRecipeManager_errorReporter___block_invoke;
    v24[3] = &unk_1E5133780;
    v25 = v10;
    -[PXStoryStyleManager performChanges:origin:](v25, "performChanges:origin:", v24, 1);

  }
  return v10;
}

- (void)performChanges:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleManager.m"), 116, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)performChanges:(id)a3 origin:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  PXStoryStyleManager *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXStoryStyleManager storyQueue](self, "storyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  self->_changesOrigin |= a4;
  PLStoryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "%@ performChanges with origin: %lu", buf, 0x16u);
  }

  v9.receiver = self;
  v9.super_class = (Class)PXStoryStyleManager;
  -[PXStoryStyleManager performChanges:](&v9, sel_performChanges_, v6);

}

- (void)didEndChangeHandling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleManager;
  -[PXStoryStyleManager didEndChangeHandling](&v3, sel_didEndChangeHandling);
  self->_changesOrigin = 0;
}

- (void)setStyleConfigurationList:(id)a3
{
  PXStoryStyleConfigurationList *v5;
  BOOL v6;
  PXStoryStyleConfigurationList *v7;

  v7 = (PXStoryStyleConfigurationList *)a3;
  v5 = self->_styleConfigurationList;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryStyleConfigurationList isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_styleConfigurationList, a3);
      -[PXStoryStyleManager _invalidatePredefinedStyleInfos](self, "_invalidatePredefinedStyleInfos");
      -[PXStoryStyleManager _invalidateCurrentStyleInfo](self, "_invalidateCurrentStyleInfo");
    }
  }

}

- (void)setPredefinedStyleInfos:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *predefinedStyleInfos;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_predefinedStyleInfos;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      predefinedStyleInfos = self->_predefinedStyleInfos;
      self->_predefinedStyleInfos = v6;

      -[PXStoryStyleManager _invalidateCurrentStyle](self, "_invalidateCurrentStyle");
      -[PXStoryStyleManager _invalidateSelectionDataSource](self, "_invalidateSelectionDataSource");
    }
  }

}

- (void)setStylesAttributes:(unint64_t)a3
{
  unint64_t stylesAttributes;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v17[12];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  stylesAttributes = self->_stylesAttributes;
  if (stylesAttributes != a3)
  {
    if ((stylesAttributes & 2) != 0 && ((self->_stylesAttributes & 1) == 0) | a3 & 1)
    {
      if ((a3 & 2) != 0)
        goto LABEL_10;
    }
    else if ((((self->_stylesAttributes & 2) == 0) & (((self->_stylesAttributes & 1) == 0) | a3)) != 0)
    {
LABEL_10:
      self->_stylesAttributes = a3;
      -[PXStoryStyleManager setAreStylesFinal:](self, "setAreStylesFinal:", (a3 >> 1) & 1);
      return;
    }
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      PXStoryComponentAttributesDescription(stylesAttributes);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryComponentAttributesDescription(a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138412546;
      *(_QWORD *)&v17[4] = v15;
      v18 = 2112;
      v19 = v16;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "%@ performChanges with origin: %lu", v17, 0x16u);

    }
    -[PXStoryStyleManager errorReporter](self, "errorReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeDebugFormat(13, CFSTR("Invalid styles attributes change."), v8, v9, v10, v11, v12, v13, *(uint64_t *)v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setError:forComponent:", v14, CFSTR("Style Manager"));

    goto LABEL_10;
  }
}

- (void)setAreStylesFinal:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 areStylesFinal;
  int v6;
  PXStoryStyleManager *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_areStylesFinal != a3)
  {
    self->_areStylesFinal = a3;
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      areStylesFinal = self->_areStylesFinal;
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = areStylesFinal;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_INFO, "%@ areStylesFinal: %i", (uint8_t *)&v6, 0x12u);
    }

  }
}

- (void)setCurrentStyleInfo:(id)a3
{
  PXStoryStyleConfiguration *v5;
  BOOL v6;
  PXStoryStyleConfiguration *v7;

  v7 = (PXStoryStyleConfiguration *)a3;
  v5 = self->_currentStyleInfo;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryStyleConfiguration isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_currentStyleInfo, a3);
      -[PXStoryStyleManager _invalidateCueSource](self, "_invalidateCueSource");
      -[PXStoryStyleManager _invalidateCurrentStyle](self, "_invalidateCurrentStyle");
      -[PXStoryStyleManager _invalidatePredefinedStyleInfos](self, "_invalidatePredefinedStyleInfos");
      -[PXStoryStyleManager _invalidateSelectionDataSource](self, "_invalidateSelectionDataSource");
      -[PXStoryStyleManager _invalidateCurrentStyleAttributes](self, "_invalidateCurrentStyleAttributes");
    }
  }

}

- (void)setCurrentStyle:(id)a3
{
  PXStoryStyle *v5;
  char v6;
  PXStoryStyle *v7;

  v7 = (PXStoryStyle *)a3;
  v5 = self->_currentStyle;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryStyle isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentStyle, a3);
      -[PXStoryStyleManager signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setCurrentStyleAttributes:(unint64_t)a3
{
  unint64_t currentStyleAttributes;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v17[12];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  currentStyleAttributes = self->_currentStyleAttributes;
  if (currentStyleAttributes != a3)
  {
    if ((currentStyleAttributes & 2) != 0 && ((self->_currentStyleAttributes & 1) == 0) | a3 & 1)
    {
      if ((a3 & 2) != 0)
        goto LABEL_10;
    }
    else if ((((self->_currentStyleAttributes & 2) == 0) & (((self->_currentStyleAttributes & 1) == 0) | a3)) != 0)
    {
LABEL_10:
      self->_currentStyleAttributes = a3;
      -[PXStoryStyleManager signalChange:](self, "signalChange:", 8);
      -[PXStoryStyleManager setIsCurrentStyleFinal:](self, "setIsCurrentStyleFinal:", (self->_currentStyleAttributes >> 1) & 1);
      return;
    }
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      PXStoryComponentAttributesDescription(currentStyleAttributes);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryComponentAttributesDescription(a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138412546;
      *(_QWORD *)&v17[4] = v15;
      v18 = 2112;
      v19 = v16;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "%@ performChanges with origin: %lu", v17, 0x16u);

    }
    -[PXStoryStyleManager errorReporter](self, "errorReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeDebugFormat(13, CFSTR("Invalid current style attributes change."), v8, v9, v10, v11, v12, v13, *(uint64_t *)v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setError:forComponent:", v14, CFSTR("Style Manager"));

    goto LABEL_10;
  }
}

- (void)setIsCurrentStyleFinal:(BOOL)a3
{
  if (self->_isCurrentStyleFinal != a3)
  {
    self->_isCurrentStyleFinal = a3;
    -[PXStoryStyleManager signalChange:](self, "signalChange:", 16);
  }
}

- (void)setSelectionDataSourceStylesAttributes:(unint64_t)a3
{
  unint64_t selectionDataSourceStylesAttributes;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v17[12];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  selectionDataSourceStylesAttributes = self->_selectionDataSourceStylesAttributes;
  if (selectionDataSourceStylesAttributes != a3)
  {
    if ((selectionDataSourceStylesAttributes & 2) != 0
      && ((self->_selectionDataSourceStylesAttributes & 1) == 0) | a3 & 1)
    {
      if ((a3 & 2) != 0)
        goto LABEL_10;
    }
    else if ((((self->_selectionDataSourceStylesAttributes & 2) == 0) & (((self->_selectionDataSourceStylesAttributes & 1) == 0) | a3)) != 0)
    {
LABEL_10:
      self->_selectionDataSourceStylesAttributes = a3;
      -[PXStoryStyleManager signalChange:](self, "signalChange:", 64);
      -[PXStoryStyleManager setAreSelectionDataSourceStylesFinal:](self, "setAreSelectionDataSourceStylesFinal:", (self->_selectionDataSourceStylesAttributes >> 1) & 1);
      return;
    }
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      PXStoryComponentAttributesDescription(selectionDataSourceStylesAttributes);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryComponentAttributesDescription(a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138412546;
      *(_QWORD *)&v17[4] = v15;
      v18 = 2112;
      v19 = v16;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "%@ performChanges with origin: %lu", v17, 0x16u);

    }
    -[PXStoryStyleManager errorReporter](self, "errorReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeDebugFormat(13, CFSTR("Invalid selection data source attributes change."), v8, v9, v10, v11, v12, v13, *(uint64_t *)v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setError:forComponent:", v14, CFSTR("Style Manager"));

    goto LABEL_10;
  }
}

- (void)setAreSelectionDataSourceStylesFinal:(BOOL)a3
{
  if (self->_areSelectionDataSourceStylesFinal != a3)
  {
    self->_areSelectionDataSourceStylesFinal = a3;
    -[PXStoryStyleManager signalChange:](self, "signalChange:", 128);
  }
}

- (void)setSelectionDataSource:(id)a3
{
  PXStoryStyleSelectionDataSource *v5;
  BOOL v6;
  PXStoryStyleSelectionDataSource *v7;

  v7 = (PXStoryStyleSelectionDataSource *)a3;
  v5 = self->_selectionDataSource;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryStyleSelectionDataSource isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_selectionDataSource, a3);
      -[PXStoryStyleManager setSelectionFocus:](self, "setSelectionFocus:", (double)-[PXStoryStyleSelectionDataSource indexOfCurrentStyle](v7, "indexOfCurrentStyle"));
      -[PXStoryStyleManager _invalidateSelectionDataSourceAttributes](self, "_invalidateSelectionDataSourceAttributes");
      -[PXStoryStyleManager signalChange:](self, "signalChange:", 32);
    }
  }

}

- (int64_t)focusedStyleIndex
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;

  -[PXStoryStyleManager selectionFocus](self, "selectionFocus");
  v4 = round(v3);
  -[PXStoryStyleManager selectionDataSource](self, "selectionDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfStyles") - 1;

  v7 = (double)v6;
  if (v4 < (double)v6)
    v7 = v4;
  return (uint64_t)fmax(v7, 0.0);
}

- (BOOL)focusedStyleIsCurrentStyle
{
  int64_t v3;
  void *v4;

  v3 = -[PXStoryStyleManager focusedStyleIndex](self, "focusedStyleIndex");
  -[PXStoryStyleManager selectionDataSource](self, "selectionDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 == objc_msgSend(v4, "indexOfCurrentStyle");

  return v3;
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryStyleManager;
  -[PXStoryStyleManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryStyleManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)applyFocusedStyleWithCustomizedColorGradeKind:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  -[PXStoryStyleManager selectionDataSource](self, "selectionDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", -[PXStoryStyleManager focusedStyleIndex](self, "focusedStyleIndex"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleManager.m"), 260, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.selectionDataSource.styleInfos[self.focusedStyleIndex]"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleManager.m"), 260, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.selectionDataSource.styleInfos[self.focusedStyleIndex]"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  v8 = (void *)objc_msgSend(v14, "copyWithCustomizedColorGradeKind:", a3);
  -[PXStoryStyleManager setCurrentStyleInfo:](self, "setCurrentStyleInfo:", v8);

}

- (void)applyFocusedStyleWithCustomizedSongResource:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  -[PXStoryStyleManager selectionDataSource](self, "selectionDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", -[PXStoryStyleManager focusedStyleIndex](self, "focusedStyleIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleManager.m"), 265, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.selectionDataSource.styleInfos[self.focusedStyleIndex]"), v14, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleManager.m"), 265, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.selectionDataSource.styleInfos[self.focusedStyleIndex]"), v14);
  }

LABEL_3:
  objc_msgSend(v5, "px_storyResourceSongAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PXStoryStyleManager recipeManager](self, "recipeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__PXStoryStyleManager_applyFocusedStyleWithCustomizedSongResource___block_invoke;
    v17[3] = &unk_1E5130830;
    v18 = v9;
    objc_msgSend(v10, "performChanges:", v17);

  }
  v11 = (void *)objc_msgSend(v8, "copyWithCustomizedSongResource:", v5);
  -[PXStoryStyleManager setCurrentStyleInfo:](self, "setCurrentStyleInfo:", v11);

}

- (void)applyFocusedStyle
{
  int64_t v3;
  id v4;

  v3 = -[PXStoryStyleManager focusedStyleIndex](self, "focusedStyleIndex");
  -[PXStoryStyleManager selectionDataSource](self, "selectionDataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleManager applyStyleAtIndex:fromDataSource:](self, "applyStyleAtIndex:fromDataSource:", v3, v4);

}

- (void)applyStyleAtIndex:(int64_t)a3 fromDataSource:(id)a4
{
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;

  objc_msgSend(a4, "styleInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleManager.m"), 280, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("dataSource.styleInfos[index]"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleManager.m"), 280, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("dataSource.styleInfos[index]"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:
  -[PXStoryStyleManager setCurrentStyleInfo:](self, "setCurrentStyleInfo:", v13);

}

- (void)setSelectionFocus:(double)a3
{
  if (self->_selectionFocus != a3)
  {
    self->_selectionFocus = a3;
    -[PXStoryStyleManager signalChange:](self, "signalChange:", 256);
  }
}

- (void)setCueSource:(id)a3
{
  PXAudioCueSource *v5;
  PXAudioCueSource *v6;
  PXAudioCueSource *v7;
  char v8;
  _QWORD v9[5];

  v5 = (PXAudioCueSource *)a3;
  v6 = self->_cueSource;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXAudioCueSource isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cueSource, a3);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __36__PXStoryStyleManager_setCueSource___block_invoke;
      v9[3] = &unk_1E5133780;
      v9[4] = self;
      -[PXStoryStyleManager performChanges:origin:](self, "performChanges:origin:", v9, 1);
    }
  }

}

- (void)_setNeedsUpdate
{
  -[PXStoryStyleManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateStyleConfigurationList
{
  id v2;

  -[PXStoryStyleManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateStyleConfigurationList);

}

- (void)_updateStyleConfigurationList
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryStyleManager recipeManager](self, "recipeManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleConfigurationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleManager setStyleConfigurationList:](self, "setStyleConfigurationList:", v4);

}

- (void)_invalidatePredefinedStyleInfos
{
  id v2;

  -[PXStoryStyleManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePredefinedStyleInfos);

}

- (void)_updatePredefinedStyleInfos
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  SEL v23;
  BOOL v24;

  -[PXStoryStyleManager styleConfigurationList](self, "styleConfigurationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoEditStyleConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleManager recipeManager](self, "recipeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (objc_msgSend(v7, "options") & 0x10) == 0;
  if (objc_msgSend(v5, "count"))
  {
    -[PXStoryStyleManager colorGradingRepository](self, "colorGradingRepository");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryStyleManager currentStyleInfo](self, "currentStyleInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "customColorGradeKind");
    if (!v11)
    {
      objc_msgSend(v10, "originalColorGradeCategory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "colorGradeKindForColorGradeCategory:excludingKinds:", v12, 0);

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", v11);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__PXStoryStyleManager__updatePredefinedStyleInfos__block_invoke;
    v19[3] = &unk_1E5130858;
    v24 = v8;
    v22 = v14;
    v23 = a2;
    v19[4] = self;
    v20 = v9;
    v21 = v13;
    v15 = v14;
    v16 = v13;
    v17 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    v18 = (id)objc_msgSend(v15, "copy");

  }
  else
  {
    v18 = 0;
  }
  -[PXStoryStyleManager setPredefinedStyleInfos:](self, "setPredefinedStyleInfos:", v18);

}

- (void)_invalidateStylesAttributes
{
  id v2;

  -[PXStoryStyleManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateStylesAttributes);

}

- (void)_updateStylesAttributes
{
  id v3;

  -[PXStoryStyleManager recipeManager](self, "recipeManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleManager setStylesAttributes:](self, "setStylesAttributes:", objc_msgSend(v3, "recipeAttributes"));

}

- (void)_invalidateCurrentStyle
{
  id v2;

  -[PXStoryStyleManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentStyle);

}

- (void)_invalidateCueSource
{
  id v2;

  -[PXStoryStyleManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCueSource);

}

- (void)_updateCueSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  PXConcreteAudioCueSource *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13[2];
  id location;

  -[PXStoryStyleManager currentStyleInfo](self, "currentStyleInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "songResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PXStorySongResourceIsNullResource(v4) & 1) != 0
    || (-[PXStoryStyleManager recipeManager](self, "recipeManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "configuration"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "options"),
        v6,
        v5,
        (v7 & 2) != 0))
  {
    v8 = objc_alloc_init(PXConcreteAudioCueSource);
    -[PXStoryStyleManager setCueSource:](self, "setCueSource:", v8);
  }
  else
  {
    objc_msgSend(v4, "px_storyResourceSongAsset");
    v8 = (PXConcreteAudioCueSource *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PXStoryStyleManager setCueRequestID:](self, "setCueRequestID:", -[PXStoryStyleManager cueRequestID](self, "cueRequestID") + 1);
      v9 = -[PXStoryStyleManager cueRequestID](self, "cueRequestID");
      objc_initWeak(&location, self);
      -[PXStoryStyleManager cueProvider](self, "cueProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __39__PXStoryStyleManager__updateCueSource__block_invoke;
      v12[3] = &unk_1E5130880;
      objc_copyWeak(v13, &location);
      v13[1] = v9;
      v11 = (id)objc_msgSend(v10, "requestCuesForAudioAsset:resultHandler:", v8, v12);

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_handleCueSource:(id)a3 error:(id)a4 requestID:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  -[PXStoryStyleManager storyQueue](self, "storyQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__PXStoryStyleManager__handleCueSource_error_requestID___block_invoke;
  v13[3] = &unk_1E5146098;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_invalidateCurrentStyleInfo
{
  id v2;

  -[PXStoryStyleManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentStyleInfo);

}

- (void)_updateCurrentStyleInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PXStoryStyleConfiguration *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  -[PXStoryStyleManager currentStyleInfo](self, "currentStyleInfo");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleManager styleConfigurationList](self, "styleConfigurationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v23, "songResource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && !PXStorySongResourceIsNullResource(v4))
    {
      objc_msgSend(v5, "px_storyResourceSongAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_12;
      -[PXStoryStyleManager recipeManager](self, "recipeManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recipe");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "autoEditDecisionListsBySong");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_12;
      v17 = objc_msgSend(v23, "copyWithAutoEditDecisionList:", v16);
      v18 = v23;
    }
    else
    {
      objc_msgSend(v3, "initialStyleConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v6, "songResource");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "originalColorGradeCategory");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "autoEditDecisionList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "customColorGradeKind");
      v11 = objc_msgSend(v7, "isCustomized");
      if (!v10)
      {
        -[PXStoryStyleManager colorGradingRepository](self, "colorGradingRepository");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v12, "colorGradeKindForColorGradeCategory:", v8);

      }
      v13 = [PXStoryStyleConfiguration alloc];
      objc_msgSend(v7, "originalColorGradeCategory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v10;
      v16 = (void *)v22;
      v17 = -[PXStoryStyleConfiguration initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:](v13, "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", v14, v15, v22, v9, v11);

      v18 = (void *)v8;
    }

    v23 = (id)v17;
    goto LABEL_12;
  }
LABEL_13:
  -[PXStoryStyleManager setCurrentStyleInfo:](self, "setCurrentStyleInfo:", v23);

}

- (void)_updateCurrentStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  -[PXStoryStyleManager currentStyleInfo](self, "currentStyleInfo");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleManager styleProducer](self, "styleProducer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v14, "customColorGradeKind");
  objc_msgSend(v14, "originalColorGradeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "songResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleManager cueSource](self, "cueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "autoEditDecisionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXStoryStyleManager styleOptions](self, "styleOptions");
  v11 = v10;
  LOBYTE(v13) = objc_msgSend(v14, "isCustomized");
  objc_msgSend(v3, "styleWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:", v4, v5, v6, v7, v8, v9, v11, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleManager setCurrentStyle:](self, "setCurrentStyle:", v12);

}

- (void)_invalidateCurrentStyleAttributes
{
  id v2;

  -[PXStoryStyleManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentStyleAttributes);

}

- (void)_updateCurrentStyleAttributes
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;

  -[PXStoryStyleManager recipeManager](self, "recipeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recipeAttributes");

  v5 = v4 & 1;
  if ((v4 & 3) != 0)
  {
    -[PXStoryStyleManager cueSource](self, "cueSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v5 |= 2uLL;
  }
  -[PXStoryStyleManager setCurrentStyleAttributes:](self, "setCurrentStyleAttributes:", v5);
}

- (void)_invalidateSelectionDataSource
{
  id v2;

  -[PXStoryStyleManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSelectionDataSource);

}

- (void)_updateSelectionDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  PXStoryStyleSelectionDataSource *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  PXStoryStyleSelectionDataSource *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[PXStoryStyleManager predefinedStyleInfos](self, "predefinedStyleInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleManager recipeManager](self, "recipeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "options") & 0x10) != 0)
  {
    objc_msgSend(v5, "songsConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    if (v7 && v3)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __49__PXStoryStyleManager__updateSelectionDataSource__block_invoke;
      v26[3] = &unk_1E51308A8;
      v27 = v7;
      v19 = objc_msgSend(v3, "indexOfObjectPassingTest:", v26);
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        v18 = 0;
      else
        v18 = v19;

    }
    v13 = [PXStoryStyleSelectionDataSource alloc];
    v14 = v3;
    v15 = v18;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[PXStoryStyleManager currentStyleInfo](self, "currentStyleInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6 && v3)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __49__PXStoryStyleManager__updateSelectionDataSource__block_invoke_2;
      v24 = &unk_1E51308A8;
      v25 = v6;
      v9 = objc_msgSend(v3, "indexOfObjectPassingTest:", &v21);

    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = 0;
    else
      v10 = v9;
    if (v7 && v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v28[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v3);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = 0;
      v8 = 0;
      v3 = (void *)v12;
    }
    v13 = [PXStoryStyleSelectionDataSource alloc];
    v14 = v3;
    v15 = v10;
    v16 = v8;
  }
  v20 = -[PXStoryStyleSelectionDataSource initWithStyleInfos:indexOfCurrentStyle:indexOfCustomStyle:](v13, "initWithStyleInfos:indexOfCurrentStyle:indexOfCustomStyle:", v14, v15, v16, v21, v22, v23, v24);

  -[PXStoryStyleManager setSelectionDataSource:](self, "setSelectionDataSource:", v20);
}

- (void)_invalidateSelectionDataSourceAttributes
{
  id v2;

  -[PXStoryStyleManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSelectionDataSourceStylesAttributes);

}

- (void)_updateSelectionDataSourceStylesAttributes
{
  void *v3;
  int v4;
  uint64_t v5;

  -[PXStoryStyleManager recipeManager](self, "recipeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRecipeFinal");

  if (v4)
    v5 = 2;
  else
    v5 = 0;
  -[PXStoryStyleManager setSelectionDataSourceStylesAttributes:](self, "setSelectionDataSourceStylesAttributes:", v5);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PXStoryStyleManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5140090;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXStoryStyleManager performChanges:origin:](self, "performChanges:origin:", v5, 1);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryStyleManager recipeManager](self, "recipeManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v5);

}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (unint64_t)changesOrigin
{
  return self->_changesOrigin;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (PXStoryColorGradingRepository)colorGradingRepository
{
  return self->_colorGradingRepository;
}

- (PXStoryStyle)currentStyle
{
  return self->_currentStyle;
}

- (unint64_t)currentStyleAttributes
{
  return self->_currentStyleAttributes;
}

- (BOOL)isCurrentStyleFinal
{
  return self->_isCurrentStyleFinal;
}

- (PXStoryStyleSelectionDataSource)selectionDataSource
{
  return self->_selectionDataSource;
}

- (unint64_t)selectionDataSourceStylesAttributes
{
  return self->_selectionDataSourceStylesAttributes;
}

- (BOOL)areSelectionDataSourceStylesFinal
{
  return self->_areSelectionDataSourceStylesFinal;
}

- (double)selectionFocus
{
  return self->_selectionFocus;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryStyleProducer)styleProducer
{
  return self->_styleProducer;
}

- ($1A23BB056C565A410801C90FE7234890)styleOptions
{
  $E177156E84AC54117B07FF8A1BF86624 *p_styleOptions;
  unint64_t croppingOptions;
  uint64_t v4;
  $1A23BB056C565A410801C90FE7234890 result;

  p_styleOptions = &self->_styleOptions;
  croppingOptions = self->_styleOptions.croppingOptions;
  v4 = *(_QWORD *)&p_styleOptions->preferStillKeySegment;
  result.var1 = v4;
  result.var0 = croppingOptions;
  return result;
}

- (PXStoryStyleConfigurationList)styleConfigurationList
{
  return self->_styleConfigurationList;
}

- (unint64_t)stylesAttributes
{
  return self->_stylesAttributes;
}

- (BOOL)areStylesFinal
{
  return self->_areStylesFinal;
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- (int64_t)cueRequestID
{
  return self->_cueRequestID;
}

- (void)setCueRequestID:(int64_t)a3
{
  self->_cueRequestID = a3;
}

- (PXStoryStyleConfiguration)currentStyleInfo
{
  return self->_currentStyleInfo;
}

- (NSArray)predefinedStyleInfos
{
  return self->_predefinedStyleInfos;
}

- (PXAudioCueProvider)cueProvider
{
  return self->_cueProvider;
}

- (void)setCueProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cueProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cueProvider, 0);
  objc_storeStrong((id *)&self->_predefinedStyleInfos, 0);
  objc_storeStrong((id *)&self->_currentStyleInfo, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_styleConfigurationList, 0);
  objc_storeStrong((id *)&self->_styleProducer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_selectionDataSource, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);
  objc_storeStrong((id *)&self->_colorGradingRepository, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

void __52__PXStoryStyleManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40) != RecipeManagerObservationContext_163805)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryStyleManager.m"), 562, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyleInfo");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateStyleConfigurationList");
    v3 = v6;
    v4 = *(_QWORD *)(a1 + 48);
  }
  if ((v4 & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateStylesAttributes");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyleAttributes");
    v3 = v6;
  }

}

uint64_t __49__PXStoryStyleManager__updateSelectionDataSource__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "songResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == *(void **)(a1 + 32))
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "isEqual:");

  return v5;
}

uint64_t __49__PXStoryStyleManager__updateSelectionDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "originalColorGradeCategory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "originalColorGradeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {

  }
  else
  {
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (!v6)
      goto LABEL_8;
  }
  v7 = objc_msgSend(v3, "customColorGradeKind");
  if (v7 != objc_msgSend(*(id *)(a1 + 32), "customColorGradeKind"))
  {
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "songResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "songResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
    v10 = 1;
  else
    v10 = objc_msgSend(v8, "isEqual:", v9);

LABEL_11:
  return v10;
}

void __56__PXStoryStyleManager__handleCueSource_error_requestID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  PXConcreteAudioCueSource *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "cueRequestID"))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "setCueSource:");
    }
    else
    {
      v3 = objc_alloc_init(PXConcreteAudioCueSource);
      objc_msgSend(*(id *)(a1 + 32), "setCueSource:", v3);

      PLStoryGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 48);
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Did not find audio cues for current style. Cues may not be available for the current song. Error %@", (uint8_t *)&v6, 0xCu);
      }

    }
  }
}

void __39__PXStoryStyleManager__updateCueSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id WeakRetained;
  dispatch_time_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];

  v5 = a2;
  v6 = a3;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simulatedAudioCuesLoadingDelay");
  v9 = v8;

  if (v9 == 0.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_handleCueSource:error:requestID:", v5, v6, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v11 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__PXStoryStyleManager__updateCueSource__block_invoke_2;
    v14[3] = &unk_1E513A518;
    objc_copyWeak(v17, (id *)(a1 + 32));
    v15 = v5;
    v12 = v6;
    v13 = *(void **)(a1 + 40);
    v16 = v12;
    v17[1] = v13;
    dispatch_after(v11, MEMORY[0x1E0C80D38], v14);

    objc_destroyWeak(v17);
  }

}

void __39__PXStoryStyleManager__updateCueSource__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleCueSource:error:requestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

void __50__PXStoryStyleManager__updatePredefinedStyleInfos__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  PXStoryStyleConfiguration *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint8_t v18[16];

  v5 = a2;
  objc_msgSend(v5, "songResource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 72))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "currentStyleInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "songResource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
  {

LABEL_12:
    goto LABEL_13;
  }
  v9 = v8;
  v10 = objc_msgSend(v6, "isEqual:", v8);

  if ((v10 & 1) == 0)
  {
LABEL_4:
    objc_msgSend(v5, "originalColorGradeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autoEditDecisionList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "customColorGradeKind"))
    {
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Predefined styles are not expected to have a custom color grade set.", v18, 2u);
      }

    }
    v13 = objc_msgSend(*(id *)(a1 + 40), "colorGradeKindForColorGradeCategory:excludingKinds:", v7, *(_QWORD *)(a1 + 48));
    v14 = -[PXStoryStyleConfiguration initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:]([PXStoryStyleConfiguration alloc], "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", v7, v13, v6, v11, 0);
    v15 = objc_msgSend(*(id *)(a1 + 40), "minimumCategoryKindFallbacks");
    if (a3 >= v15)
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3 - v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "customColorGradeKind");

      objc_msgSend(*(id *)(a1 + 48), "removeIndex:", v17);
    }
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", v13);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);

    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __36__PXStoryStyleManager_setCueSource___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyle");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyleAttributes");
}

uint64_t __67__PXStoryStyleManager_applyFocusedStyleWithCustomizedSongResource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ensureAutoEditDecisionListForSong:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__PXStoryStyleManager_initWithRecipeManager_errorReporter___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateStyleConfigurationList");
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePredefinedStyleInfos");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyleInfo");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateStylesAttributes");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyle");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyleAttributes");
}

@end
