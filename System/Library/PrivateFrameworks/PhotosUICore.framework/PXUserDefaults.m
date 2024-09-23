@implementation PXUserDefaults

- (NSNumber)allPhotosPreferredIndividualItemsColumns
{
  return self->_allPhotosPreferredIndividualItemsColumns;
}

- (NSNumber)allPhotosCaptionsVisible
{
  return self->_allPhotosCaptionsVisible;
}

- (NSNumber)includeSharedWithYou
{
  if (self->_includeSharedWithYou)
    return self->_includeSharedWithYou;
  else
    return (NSNumber *)MEMORY[0x1E0C9AAB0];
}

+ (PXUserDefaults)standardUserDefaults
{
  if (standardUserDefaults_onceToken != -1)
    dispatch_once(&standardUserDefaults_onceToken, &__block_literal_global_252722);
  return (PXUserDefaults *)(id)standardUserDefaults_standardUserDefaults;
}

- (NSNumber)allPhotosAspectFit
{
  return self->_allPhotosAspectFit;
}

- (PXZoomablePhotosUserDefaults)curatedLibraryUserDefaults
{
  return (PXZoomablePhotosUserDefaults *)-[_PXZoomablePhotosUserDefaultsImp initWithUserDefaults:]([_PXZoomablePhotosUserDefaultsCuratedLibrary alloc], "initWithUserDefaults:", self);
}

- (NSNumber)daysMarginScale
{
  return self->_daysMarginScale;
}

- (NSNumber)curatedLibraryZoomLevel
{
  return self->_curatedLibraryZoomLevel;
}

void __38__PXUserDefaults_standardUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;
  PXUserDefaults *v2;
  uint64_t v3;
  void *v4;

  +[PXUserDefaultsStandardDataSource sharedInstance](PXUserDefaultsStandardDataSource, "sharedInstance");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)standardUserDefaults_dataSource;
  standardUserDefaults_dataSource = v0;

  v2 = [PXUserDefaults alloc];
  v3 = -[PXUserDefaults initWithDataSource:](v2, "initWithDataSource:", standardUserDefaults_dataSource);
  v4 = (void *)standardUserDefaults_standardUserDefaults;
  standardUserDefaults_standardUserDefaults = v3;

}

- (PXUserDefaults)initWithDataSource:(id)a3
{
  id v4;
  PXUserDefaults *v5;
  PXUserDefaults *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSNumber *curatedLibraryZoomLevel;
  uint64_t v15;
  NSNumber *daysMarginScale;
  uint64_t v17;
  NSNumber *allPhotosColumns;
  uint64_t v19;
  NSNumber *allPhotosPreferredIndividualItemsColumns;
  uint64_t v21;
  NSNumber *allPhotosLemonadePreferredIndividualItemsColumns;
  uint64_t v23;
  NSNumber *allPhotosAspectFit;
  uint64_t v25;
  NSNumber *allPhotosAspectFitInCompact;
  uint64_t v27;
  NSNumber *photosGridColumns;
  uint64_t v29;
  NSNumber *photosGridPreferredIndividualItemsColumns;
  uint64_t v31;
  NSNumber *photosGridAspectFit;
  uint64_t v33;
  NSNumber *photosGridAspectFitInCompact;
  uint64_t v35;
  NSNumber *didShowCurationFooter;
  uint64_t v37;
  NSNumber *didShowCompletedCurationFooterAnimation;
  uint64_t v39;
  NSNumber *includeScreenshots;
  uint64_t v41;
  NSNumber *includeSharedWithYou;
  uint64_t v43;
  NSNumber *lastRadarPromptAnsweredQuestionCount;
  uint64_t v45;
  NSDate *lastSurveyQuestionsRadarPromptDate;
  uint64_t v47;
  NSDate *surveyQuestionsHideDate;
  uint64_t v49;
  NSNumber *storyTitleStyleNextIndex;
  uint64_t v51;
  NSNumber *axExposeAllVisibleElements;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)PXUserDefaults;
  v5 = -[PXUserDefaults init](&v54, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    objc_msgSend(v4, "persistedValueForKey:", CFSTR("curatedLibraryInitialNavigationVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    if (v8 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPersistedValue:forKey:", v9, CFSTR("curatedLibraryInitialNavigationVersion"));

      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("curatedLibraryZoomLevel"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("daysMarginScale"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("allPhotosColumns"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("allPhotosColumnsDate"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("allPhotosPreferredIndividualItemsColumns"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("allPhotosLemonadePreferredIndividualItemsColumns"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("allPhotosGridAspectFitInCompact"));
    }
    objc_msgSend(v4, "persistedValueForKey:", CFSTR("userDefaultsPhotosGridVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11 != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPersistedValue:forKey:", v12, CFSTR("userDefaultsPhotosGridVersion"));

      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("allPhotosAspectFit"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("photosGridColumns"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("photosGridPreferredIndividualItemsColumns"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("photosGridAspectFit"));
      objc_msgSend(v4, "setPersistedValue:forKey:", 0, CFSTR("photosGridAspectFitInCompact"));
    }
    objc_msgSend(v4, "persistedValueForKey:", CFSTR("curatedLibraryZoomLevel"));
    v13 = objc_claimAutoreleasedReturnValue();
    curatedLibraryZoomLevel = v6->_curatedLibraryZoomLevel;
    v6->_curatedLibraryZoomLevel = (NSNumber *)v13;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("daysMarginScale"));
    v15 = objc_claimAutoreleasedReturnValue();
    daysMarginScale = v6->_daysMarginScale;
    v6->_daysMarginScale = (NSNumber *)v15;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("allPhotosColumns"));
    v17 = objc_claimAutoreleasedReturnValue();
    allPhotosColumns = v6->_allPhotosColumns;
    v6->_allPhotosColumns = (NSNumber *)v17;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("allPhotosPreferredIndividualItemsColumns"));
    v19 = objc_claimAutoreleasedReturnValue();
    allPhotosPreferredIndividualItemsColumns = v6->_allPhotosPreferredIndividualItemsColumns;
    v6->_allPhotosPreferredIndividualItemsColumns = (NSNumber *)v19;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("allPhotosLemonadePreferredIndividualItemsColumns"));
    v21 = objc_claimAutoreleasedReturnValue();
    allPhotosLemonadePreferredIndividualItemsColumns = v6->_allPhotosLemonadePreferredIndividualItemsColumns;
    v6->_allPhotosLemonadePreferredIndividualItemsColumns = (NSNumber *)v21;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("allPhotosAspectFit"));
    v23 = objc_claimAutoreleasedReturnValue();
    allPhotosAspectFit = v6->_allPhotosAspectFit;
    v6->_allPhotosAspectFit = (NSNumber *)v23;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("allPhotosAspectFitInCompact"));
    v25 = objc_claimAutoreleasedReturnValue();
    allPhotosAspectFitInCompact = v6->_allPhotosAspectFitInCompact;
    v6->_allPhotosAspectFitInCompact = (NSNumber *)v25;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("photosGridColumns"));
    v27 = objc_claimAutoreleasedReturnValue();
    photosGridColumns = v6->_photosGridColumns;
    v6->_photosGridColumns = (NSNumber *)v27;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("photosGridPreferredIndividualItemsColumns"));
    v29 = objc_claimAutoreleasedReturnValue();
    photosGridPreferredIndividualItemsColumns = v6->_photosGridPreferredIndividualItemsColumns;
    v6->_photosGridPreferredIndividualItemsColumns = (NSNumber *)v29;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("photosGridAspectFit"));
    v31 = objc_claimAutoreleasedReturnValue();
    photosGridAspectFit = v6->_photosGridAspectFit;
    v6->_photosGridAspectFit = (NSNumber *)v31;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("photosGridAspectFitInCompact"));
    v33 = objc_claimAutoreleasedReturnValue();
    photosGridAspectFitInCompact = v6->_photosGridAspectFitInCompact;
    v6->_photosGridAspectFitInCompact = (NSNumber *)v33;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("didShowCurationFooter"));
    v35 = objc_claimAutoreleasedReturnValue();
    didShowCurationFooter = v6->_didShowCurationFooter;
    v6->_didShowCurationFooter = (NSNumber *)v35;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("didShowCompletedCurationFooterAnimation"));
    v37 = objc_claimAutoreleasedReturnValue();
    didShowCompletedCurationFooterAnimation = v6->_didShowCompletedCurationFooterAnimation;
    v6->_didShowCompletedCurationFooterAnimation = (NSNumber *)v37;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("IncludeScreenshots"));
    v39 = objc_claimAutoreleasedReturnValue();
    includeScreenshots = v6->_includeScreenshots;
    v6->_includeScreenshots = (NSNumber *)v39;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("IncludeSharedWithYou"));
    v41 = objc_claimAutoreleasedReturnValue();
    includeSharedWithYou = v6->_includeSharedWithYou;
    v6->_includeSharedWithYou = (NSNumber *)v41;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("lastRadarPromptAnsweredQuestionCount"));
    v43 = objc_claimAutoreleasedReturnValue();
    lastRadarPromptAnsweredQuestionCount = v6->_lastRadarPromptAnsweredQuestionCount;
    v6->_lastRadarPromptAnsweredQuestionCount = (NSNumber *)v43;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("lastSurveyQuestionsRadarPromptDate"));
    v45 = objc_claimAutoreleasedReturnValue();
    lastSurveyQuestionsRadarPromptDate = v6->_lastSurveyQuestionsRadarPromptDate;
    v6->_lastSurveyQuestionsRadarPromptDate = (NSDate *)v45;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("surveyQuestionsHideDate"));
    v47 = objc_claimAutoreleasedReturnValue();
    surveyQuestionsHideDate = v6->_surveyQuestionsHideDate;
    v6->_surveyQuestionsHideDate = (NSDate *)v47;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("storyTitleStyleNextIndex"));
    v49 = objc_claimAutoreleasedReturnValue();
    storyTitleStyleNextIndex = v6->_storyTitleStyleNextIndex;
    v6->_storyTitleStyleNextIndex = (NSNumber *)v49;

    objc_msgSend(v4, "persistedValueForKey:", CFSTR("axExposeAllVisibleElements"));
    v51 = objc_claimAutoreleasedReturnValue();
    axExposeAllVisibleElements = v6->_axExposeAllVisibleElements;
    v6->_axExposeAllVisibleElements = (NSNumber *)v51;

  }
  return v6;
}

- (PXZoomablePhotosUserDefaults)photosGridsUserDefaults
{
  return (PXZoomablePhotosUserDefaults *)-[_PXZoomablePhotosUserDefaultsImp initWithUserDefaults:]([_PXZoomablePhotosUserDefaultPhotosGrids alloc], "initWithUserDefaults:", self);
}

- (PXUserDefaults)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUserDefaults.m"), 38, CFSTR("%s is not available as initializer"), "-[PXUserDefaults init]");

  abort();
}

- (void)setCuratedLibraryZoomLevel:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *curatedLibraryZoomLevel;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_curatedLibraryZoomLevel;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    curatedLibraryZoomLevel = self->_curatedLibraryZoomLevel;
    self->_curatedLibraryZoomLevel = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_curatedLibraryZoomLevel, CFSTR("curatedLibraryZoomLevel"));
LABEL_4:

  }
}

- (void)setDaysMarginScale:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *daysMarginScale;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_daysMarginScale;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    daysMarginScale = self->_daysMarginScale;
    self->_daysMarginScale = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_daysMarginScale, CFSTR("daysMarginScale"));
LABEL_4:

  }
}

- (void)setAllPhotosColumns:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *allPhotosColumns;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_allPhotosColumns;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    allPhotosColumns = self->_allPhotosColumns;
    self->_allPhotosColumns = v7;

    objc_msgSend(v5, "setPersistedValue:forKey:", self->_allPhotosColumns, CFSTR("allPhotosColumns"));
LABEL_4:

  }
}

- (void)setAllPhotosPreferredIndividualItemsColumns:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *allPhotosPreferredIndividualItemsColumns;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_allPhotosPreferredIndividualItemsColumns;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    allPhotosPreferredIndividualItemsColumns = self->_allPhotosPreferredIndividualItemsColumns;
    self->_allPhotosPreferredIndividualItemsColumns = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_allPhotosPreferredIndividualItemsColumns, CFSTR("allPhotosPreferredIndividualItemsColumns"));
LABEL_4:

  }
}

- (void)setAllPhotosLemonadePreferredIndividualItemsColumns:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *allPhotosLemonadePreferredIndividualItemsColumns;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_allPhotosLemonadePreferredIndividualItemsColumns;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    allPhotosLemonadePreferredIndividualItemsColumns = self->_allPhotosLemonadePreferredIndividualItemsColumns;
    self->_allPhotosLemonadePreferredIndividualItemsColumns = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_allPhotosLemonadePreferredIndividualItemsColumns, CFSTR("allPhotosLemonadePreferredIndividualItemsColumns"));
LABEL_4:

  }
}

- (void)setAllPhotosAspectFit:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *allPhotosAspectFit;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_allPhotosAspectFit;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    allPhotosAspectFit = self->_allPhotosAspectFit;
    self->_allPhotosAspectFit = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_allPhotosAspectFit, CFSTR("allPhotosAspectFit"));
LABEL_4:

  }
}

- (void)setallPhotosAspectFitInCompact:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *allPhotosAspectFitInCompact;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_allPhotosAspectFitInCompact;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    allPhotosAspectFitInCompact = self->_allPhotosAspectFitInCompact;
    self->_allPhotosAspectFitInCompact = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_allPhotosAspectFitInCompact, CFSTR("allPhotosAspectFitInCompact"));
LABEL_4:

  }
}

- (void)setPhotosGridColumns:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *photosGridColumns;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_photosGridColumns;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    photosGridColumns = self->_photosGridColumns;
    self->_photosGridColumns = v7;

    objc_msgSend(v5, "setPersistedValue:forKey:", self->_photosGridColumns, CFSTR("photosGridColumns"));
LABEL_4:

  }
}

- (void)setPhotosGridPreferredIndividualItemsColumns:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *photosGridPreferredIndividualItemsColumns;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_photosGridPreferredIndividualItemsColumns;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    photosGridPreferredIndividualItemsColumns = self->_photosGridPreferredIndividualItemsColumns;
    self->_photosGridPreferredIndividualItemsColumns = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_photosGridPreferredIndividualItemsColumns, CFSTR("photosGridPreferredIndividualItemsColumns"));
LABEL_4:

  }
}

- (void)setPhotosGridAspectFit:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *photosGridAspectFit;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_photosGridAspectFit;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    photosGridAspectFit = self->_photosGridAspectFit;
    self->_photosGridAspectFit = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_photosGridAspectFit, CFSTR("photosGridAspectFit"));
LABEL_4:

  }
}

- (void)setPhotosGridAspectFitInCompact:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *photosGridAspectFitInCompact;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_photosGridAspectFitInCompact;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    photosGridAspectFitInCompact = self->_photosGridAspectFitInCompact;
    self->_photosGridAspectFitInCompact = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_photosGridAspectFitInCompact, CFSTR("photosGridAspectFitInCompact"));
LABEL_4:

  }
}

- (void)setDidShowCurationFooter:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *didShowCurationFooter;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_didShowCurationFooter;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    didShowCurationFooter = self->_didShowCurationFooter;
    self->_didShowCurationFooter = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_didShowCurationFooter, CFSTR("didShowCurationFooter"));
LABEL_4:

  }
}

- (void)setDidShowCompletedCurationFooterAnimation:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *didShowCompletedCurationFooterAnimation;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_didShowCompletedCurationFooterAnimation;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    didShowCompletedCurationFooterAnimation = self->_didShowCompletedCurationFooterAnimation;
    self->_didShowCompletedCurationFooterAnimation = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_didShowCompletedCurationFooterAnimation, CFSTR("didShowCompletedCurationFooterAnimation"));
LABEL_4:

  }
}

- (void)setIncludeScreenshots:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *includeScreenshots;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_includeScreenshots;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    includeScreenshots = self->_includeScreenshots;
    self->_includeScreenshots = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", v9, CFSTR("IncludeScreenshots"));
LABEL_4:

  }
}

- (NSNumber)includeScreenshots
{
  if (self->_includeScreenshots)
    return self->_includeScreenshots;
  else
    return (NSNumber *)MEMORY[0x1E0C9AAB0];
}

- (void)setIncludeSharedWithYou:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *includeSharedWithYou;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_includeSharedWithYou;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    includeSharedWithYou = self->_includeSharedWithYou;
    self->_includeSharedWithYou = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", v9, CFSTR("IncludeSharedWithYou"));
LABEL_4:

  }
}

- (void)setLastRadarPromptAnsweredQuestionCount:(id)a3
{
  NSNumber *v4;
  void *v5;
  char v6;
  NSNumber *v7;
  NSNumber *lastRadarPromptAnsweredQuestionCount;
  NSNumber *v9;

  v9 = (NSNumber *)a3;
  v4 = self->_lastRadarPromptAnsweredQuestionCount;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSNumber isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
    lastRadarPromptAnsweredQuestionCount = self->_lastRadarPromptAnsweredQuestionCount;
    self->_lastRadarPromptAnsweredQuestionCount = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_lastRadarPromptAnsweredQuestionCount, CFSTR("lastRadarPromptAnsweredQuestionCount"));
LABEL_4:

  }
}

- (void)setLastSurveyQuestionsRadarPromptDate:(id)a3
{
  NSDate *v4;
  void *v5;
  char v6;
  NSDate *v7;
  NSDate *lastSurveyQuestionsRadarPromptDate;
  NSDate *v9;

  v9 = (NSDate *)a3;
  v4 = self->_lastSurveyQuestionsRadarPromptDate;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSDate isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSDate *)-[NSDate copy](v9, "copy");
    lastSurveyQuestionsRadarPromptDate = self->_lastSurveyQuestionsRadarPromptDate;
    self->_lastSurveyQuestionsRadarPromptDate = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_lastSurveyQuestionsRadarPromptDate, CFSTR("lastSurveyQuestionsRadarPromptDate"));
LABEL_4:

  }
}

- (void)setSurveyQuestionsHideDate:(id)a3
{
  NSDate *v4;
  void *v5;
  char v6;
  NSDate *v7;
  NSDate *surveyQuestionsHideDate;
  NSDate *v9;

  v9 = (NSDate *)a3;
  v4 = self->_surveyQuestionsHideDate;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSDate isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSDate *)-[NSDate copy](v9, "copy");
    surveyQuestionsHideDate = self->_surveyQuestionsHideDate;
    self->_surveyQuestionsHideDate = v7;

    -[PXUserDefaults dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistedValue:forKey:", self->_surveyQuestionsHideDate, CFSTR("surveyQuestionsHideDate"));
LABEL_4:

  }
}

- (void)setInfoPanelLastSnappedWidgetIdentifier:(id)a3
{
  NSString *v5;
  void *v6;
  char v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_infoPanelLastSnappedWidgetIdentifier;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[NSString isEqual:](v8, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_infoPanelLastSnappedWidgetIdentifier, a3);
    -[PXUserDefaults dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPersistedValue:forKey:", self->_infoPanelLastSnappedWidgetIdentifier, CFSTR("infoPanelLastSnappedWidgetIdentifier"));
LABEL_4:

  }
}

- (void)setInfoPanelLastSnappedPosition:(id)a3
{
  NSNumber *v5;
  void *v6;
  char v7;
  NSNumber *v8;

  v8 = (NSNumber *)a3;
  v5 = self->_infoPanelLastSnappedPosition;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[NSNumber isEqual:](v8, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_infoPanelLastSnappedPosition, a3);
    -[PXUserDefaults dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPersistedValue:forKey:", self->_infoPanelLastSnappedPosition, CFSTR("infoPanelLastSnappedPosition"));
LABEL_4:

  }
}

- (void)setStoryTitleStyleNextIndex:(id)a3
{
  NSNumber *v5;
  void *v6;
  char v7;
  NSNumber *v8;

  v8 = (NSNumber *)a3;
  v5 = self->_storyTitleStyleNextIndex;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[NSNumber isEqual:](v8, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_storyTitleStyleNextIndex, a3);
    -[PXUserDefaults dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPersistedValue:forKey:", self->_storyTitleStyleNextIndex, CFSTR("storyTitleStyleNextIndex"));
LABEL_4:

  }
}

- (int64_t)generateNextStoryTitleStyleIndex
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  -[PXUserDefaults dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[PXUserDefaults storyTitleStyleNextIndex](self, "storyTitleStyleNextIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUserDefaults setStoryTitleStyleNextIndex:](self, "setStoryTitleStyleNextIndex:", v6);

  objc_sync_exit(v3);
  return v5;
}

- (void)setAxExposeAllVisibleElements:(id)a3
{
  NSNumber *v5;
  void *v6;
  char v7;
  NSNumber *v8;

  v8 = (NSNumber *)a3;
  v5 = self->_axExposeAllVisibleElements;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[NSNumber isEqual:](v8, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_axExposeAllVisibleElements, a3);
    -[PXUserDefaults dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPersistedValue:forKey:", self->_axExposeAllVisibleElements, CFSTR("axExposeAllVisibleElements"));
LABEL_4:

  }
}

- (NSNumber)allPhotosColumns
{
  return self->_allPhotosColumns;
}

- (void)setAllPhotosCaptionsVisible:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)allPhotosLemonadePreferredIndividualItemsColumns
{
  return self->_allPhotosLemonadePreferredIndividualItemsColumns;
}

- (NSNumber)allPhotosAspectFitInCompact
{
  return self->_allPhotosAspectFitInCompact;
}

- (void)setAllPhotosAspectFitInCompact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)photosGridColumns
{
  return self->_photosGridColumns;
}

- (NSNumber)photosGridPreferredIndividualItemsColumns
{
  return self->_photosGridPreferredIndividualItemsColumns;
}

- (NSNumber)photosGridAspectFit
{
  return self->_photosGridAspectFit;
}

- (NSNumber)photosGridAspectFitInCompact
{
  return self->_photosGridAspectFitInCompact;
}

- (NSNumber)didShowCurationFooter
{
  return self->_didShowCurationFooter;
}

- (NSNumber)didShowCompletedCurationFooterAnimation
{
  return self->_didShowCompletedCurationFooterAnimation;
}

- (NSNumber)lastRadarPromptAnsweredQuestionCount
{
  return self->_lastRadarPromptAnsweredQuestionCount;
}

- (NSDate)lastSurveyQuestionsRadarPromptDate
{
  return self->_lastSurveyQuestionsRadarPromptDate;
}

- (NSDate)surveyQuestionsHideDate
{
  return self->_surveyQuestionsHideDate;
}

- (NSNumber)axExposeAllVisibleElements
{
  return self->_axExposeAllVisibleElements;
}

- (NSString)infoPanelLastSnappedWidgetIdentifier
{
  return self->_infoPanelLastSnappedWidgetIdentifier;
}

- (NSNumber)infoPanelLastSnappedPosition
{
  return self->_infoPanelLastSnappedPosition;
}

- (NSNumber)storyTitleStyleNextIndex
{
  return self->_storyTitleStyleNextIndex;
}

- (PXUserDefaultsDataSource)dataSource
{
  return (PXUserDefaultsDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_storyTitleStyleNextIndex, 0);
  objc_storeStrong((id *)&self->_infoPanelLastSnappedPosition, 0);
  objc_storeStrong((id *)&self->_infoPanelLastSnappedWidgetIdentifier, 0);
  objc_storeStrong((id *)&self->_axExposeAllVisibleElements, 0);
  objc_storeStrong((id *)&self->_surveyQuestionsHideDate, 0);
  objc_storeStrong((id *)&self->_lastSurveyQuestionsRadarPromptDate, 0);
  objc_storeStrong((id *)&self->_lastRadarPromptAnsweredQuestionCount, 0);
  objc_storeStrong((id *)&self->_didShowCompletedCurationFooterAnimation, 0);
  objc_storeStrong((id *)&self->_didShowCurationFooter, 0);
  objc_storeStrong((id *)&self->_photosGridAspectFitInCompact, 0);
  objc_storeStrong((id *)&self->_photosGridAspectFit, 0);
  objc_storeStrong((id *)&self->_photosGridPreferredIndividualItemsColumns, 0);
  objc_storeStrong((id *)&self->_photosGridColumns, 0);
  objc_storeStrong((id *)&self->_allPhotosAspectFitInCompact, 0);
  objc_storeStrong((id *)&self->_allPhotosAspectFit, 0);
  objc_storeStrong((id *)&self->_allPhotosLemonadePreferredIndividualItemsColumns, 0);
  objc_storeStrong((id *)&self->_allPhotosPreferredIndividualItemsColumns, 0);
  objc_storeStrong((id *)&self->_allPhotosCaptionsVisible, 0);
  objc_storeStrong((id *)&self->_daysMarginScale, 0);
  objc_storeStrong((id *)&self->_curatedLibraryZoomLevel, 0);
  objc_storeStrong((id *)&self->_allPhotosColumns, 0);
  objc_storeStrong((id *)&self->_includeSharedWithYou, 0);
  objc_storeStrong((id *)&self->_includeScreenshots, 0);
}

@end
