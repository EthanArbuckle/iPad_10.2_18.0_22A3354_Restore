@implementation PXSurveyQuestionsHorizontalGadgetProviderConfiguration

- (PXSurveyQuestionsHorizontalGadgetProviderConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsHorizontalGadgetProviderConfiguration.m"), 69, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionsHorizontalGadgetProviderConfiguration init]");

  abort();
}

- (id)_initWithCategory:(int64_t)a3 gadgetProvider:(id)a4
{
  id v8;
  PXSurveyQuestionsHorizontalGadgetProviderConfiguration *v9;
  PXSurveyQuestionsHorizontalGadgetProviderConfiguration *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsHorizontalGadgetProviderConfiguration.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadgetProvider"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXSurveyQuestionsHorizontalGadgetProviderConfiguration;
  v9 = -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_category = a3;
    objc_storeStrong((id *)&v9->_gadgetProvider, a4);
  }

  return v10;
}

- (NSString)identifier
{
  if (self->_category)
    return 0;
  else
    return (NSString *)CFSTR("PXSurveyQuestionsHorizontalGadgetProviderConfiguration:General");
}

- (NSString)infoAlertTitle
{
  if (self->_category)
    return (NSString *)0;
  PXLocalizedStringFromTable(CFSTR("SURVEY_QUESTIONS_PHOTOS_WELCOME_TITLE_GENERAL"), CFSTR("PhotosUICore"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)infoAlertMessage
{
  if (self->_category)
    return (NSString *)0;
  PXLocalizedStringFromTable(CFSTR("SURVEY_QUESTIONS_PHOTOS_WELCOME_BODY_GENERAL"), CFSTR("PhotosUICore"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)hideForeverAlertMessage
{
  if (self->_category)
    return (NSString *)0;
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHideForeverActionMessage_General"), CFSTR("PhotosUICore"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)radarPromptAnsweredQuestionCountDefaultsKey
{
  if (self->_category)
    return (NSString *)0;
  NSStringFromSelector(sel_lastRadarPromptAnsweredQuestionCount);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)radarPromptDateDefaultsKey
{
  if (self->_category)
    return (NSString *)0;
  NSStringFromSelector(sel_lastSurveyQuestionsRadarPromptDate);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)hideDateDefaultsKey
{
  if (self->_category)
    return (NSString *)0;
  NSStringFromSelector(sel_surveyQuestionsHideDate);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)sectionTitle
{
  if (self->_category)
    return (NSString *)0;
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSectionTitle_General"), CFSTR("PhotosUICore"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)customInfoAlertActionTitle
{
  return 0;
}

- (id)customInfoAlertActionViewController:(id *)a3
{
  return 0;
}

- (PXRadarConfiguration)radarConfiguration
{
  if (self->_category)
    return (PXRadarConfiguration *)0;
  PXSurveyQuestionRadarConfiguration(CFSTR("Photos Challenge Submission"), MEMORY[0x1E0C9AA60]);
  return (PXRadarConfiguration *)(id)objc_claimAutoreleasedReturnValue();
}

- (PXSurveyQuestionsGadgetProvider)gadgetProvider
{
  return self->_gadgetProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetProvider, 0);
  objc_storeStrong((id *)&self->_radarKeywordIDs, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong(&self->_customInfoAlertActionViewControllerProvider, 0);
}

+ (PXSurveyQuestionsHorizontalGadgetProviderConfiguration)generalConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  PXSurveyQuestionsDataSource *v9;
  PXSurveyQuestionsGadgetProvider *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[16];

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d"), 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[PXSurveyQuestionsDataSource initWithPhotoLibrary:predicate:]([PXSurveyQuestionsDataSource alloc], "initWithPhotoLibrary:predicate:", v8, v7);
    v10 = -[PXSurveyQuestionsGadgetProvider initWithDataSource:gadgetType:]([PXSurveyQuestionsGadgetProvider alloc], "initWithDataSource:gadgetType:", v9, 17);

  }
  else
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Failed to open the app photo library", buf, 2u);
    }

    v10 = 0;
  }

  if (v10)
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCategory:gadgetProvider:", 0, v10);
  else
    v12 = 0;

  return (PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)v12;
}

@end
