@implementation PXSurveyQuestionsHorizontalGadgetProvider

- (PXSurveyQuestionsHorizontalGadgetProvider)initWithIdentifier:(id)a3 contentGadgetProvider:(id)a4 title:(id)a5 horizontalCollectionGadgetClass:(Class)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsHorizontalGadgetProvider.m"), 36, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionsHorizontalGadgetProvider initWithIdentifier:contentGadgetProvider:title:horizontalCollectionGadgetClass:]");

  abort();
}

- (PXSurveyQuestionsHorizontalGadgetProvider)initWithConfiguration:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PXSurveyQuestionsHorizontalGadgetProvider *v11;
  void *v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsHorizontalGadgetProvider.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  objc_msgSend(v6, "gadgetProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGadgetProviderDelegate:", self);
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v14.receiver = self;
  v14.super_class = (Class)PXSurveyQuestionsHorizontalGadgetProvider;
  v11 = -[PXHorizontalCollectionGadgetProvider initWithIdentifier:contentGadgetProvider:title:horizontalCollectionGadgetClass:](&v14, sel_initWithIdentifier_contentGadgetProvider_title_horizontalCollectionGadgetClass_, v8, v7, v9, v10);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    -[PXHorizontalCollectionGadgetProvider setIsFixedHeight:](v11, "setIsFixedHeight:", 1);
  }

  return v11;
}

- (unint64_t)gadgetType
{
  void *v2;
  unint64_t v3;

  -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration gadgetProvider](self->_configuration, "gadgetProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "gadgetType");

  return v3;
}

- (void)setLemonadeUIDelegate:(id)a3
{
  id v4;
  void *v5;
  id obj;

  obj = a3;
  -[PXSurveyQuestionsHorizontalGadgetProvider lemonadeUIDelegate](self, "lemonadeUIDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_lemonadeUIDelegate, obj);
    -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration gadgetProvider](self->_configuration, "gadgetProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLemonadeUIDelegate:", obj);

  }
}

- (NSDate)mostRecentContentDate
{
  return 0;
}

- (int64_t)forYouContentIdentifier
{
  return 2;
}

- (id)infoAlertTitleForHorizontalCollectionGadget:(id)a3
{
  return -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration infoAlertTitle](self->_configuration, "infoAlertTitle", a3);
}

- (id)infoAlertMessageForHorizontalCollectionGadget:(id)a3
{
  return -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration infoAlertMessage](self->_configuration, "infoAlertMessage", a3);
}

- (id)hideForeverAlertMessageForHorizontalCollectionGadget:(id)a3
{
  return -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration hideForeverAlertMessage](self->_configuration, "hideForeverAlertMessage", a3);
}

- (void)horizontalCollectionGadget:(id)a3 hideUntilDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration hideDateDefaultsKey](self->_configuration, "hideDateDefaultsKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v6, v9);

  -[PXGadgetProvider gadget:didChange:](self, "gadget:didChange:", v7, 32);
  -[PXSurveyQuestionsHorizontalGadgetProvider lemonadeUIDelegate](self, "lemonadeUIDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateGadgets");

}

- (id)radarConfigurationForHorizontalCollectionGadget:(id)a3
{
  return -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration radarConfiguration](self->_configuration, "radarConfiguration", a3);
}

- (void)horizontalCollectionGadget:(id)a3 configureCustomInfoAlertActionsForAlertController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  PXSurveyQuestionsHorizontalGadgetProvider *v15;

  v5 = a4;
  -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration customInfoAlertActionTitle](self->_configuration, "customInfoAlertActionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DC3448];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __122__PXSurveyQuestionsHorizontalGadgetProvider_horizontalCollectionGadget_configureCustomInfoAlertActionsForAlertController___block_invoke;
    v13 = &unk_1E51458F8;
    v8 = v5;
    v14 = v8;
    v15 = self;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v6, 0, &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v9, v10, v11, v12, v13);

  }
}

- (id)presentationEnvironmentForGadget:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXSurveyQuestionsHorizontalGadgetProvider;
  -[PXGadgetProvider presentationEnvironmentForGadget:](&v13, sel_presentationEnvironmentForGadget_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[PXSurveyQuestionsHorizontalGadgetProvider lemonadeUIDelegate](self, "lemonadeUIDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "overrideContainerViewController");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
LABEL_9:

          goto LABEL_10;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsHorizontalGadgetProvider.m"), 135, CFSTR("No presentation environment for gadget: %@, gadget has nil overrideContainerViewController"), v5);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsHorizontalGadgetProvider.m"), 138, CFSTR("No presentation environment for gadget: %@"), v5);

    v6 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (void)didAnswerQuestionForGadgetProvider:(id)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  PXSurveyRadarReporterViewController *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = (void (**)(_QWORD))a4;
  if ((PXSurveyQuestionIsAppleInternal() & 1) != 0)
  {
    objc_msgSend(v27, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fetchTotalNumberOfAnsweredYesOrNoQuestions");

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration radarPromptAnsweredQuestionCountDefaultsKey](self->_configuration, "radarPromptAnsweredQuestionCountDefaultsKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration radarPromptDateDefaultsKey](self->_configuration, "radarPromptDateDefaultsKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v10, "valueForKey:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(v8 - objc_msgSend(v14, "unsignedIntegerValue")) >= 0x32)
      {
        v25 = v8;
        objc_msgSend(v13, "dateByAddingTimeInterval:", 259200.0);
        v15 = v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v9;
        v17 = objc_msgSend(v16, "compare:", v9);

        v11 = v15;
        v18 = v17 == -1;
        v9 = v26;
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v19, v12);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v20, v15);

          -[PXSurveyQuestionsHorizontalGadgetProviderConfiguration radarConfiguration](self->_configuration, "radarConfiguration");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[PXSurveyRadarReporterViewController initWithConfiguration:completionHandler:]([PXSurveyRadarReporterViewController alloc], "initWithConfiguration:completionHandler:", v21, v6);
          -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "presentGadgetViewController:animated:completion:", v22, 1, 0);

          v9 = v26;
LABEL_11:

          goto LABEL_12;
        }
LABEL_10:
        v6[2](v6);
        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(v9, "dateByAddingTimeInterval:", -259200.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v14, v12);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8 - 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v24, v11);

    }
    goto LABEL_10;
  }
  v6[2](v6);
LABEL_12:

}

- (void)surveyQuestionsGadgetProvider:(id)a3 navigateToGadget:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[PXSurveyQuestionsHorizontalGadgetProvider lemonadeUIDelegate](self, "lemonadeUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "navigateToGadget:", v8);
  }
  else
  {
    -[PXGadgetProvider rootNavigationHelper](self, "rootNavigationHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigateToSectionWithGadgetType:andGadget:animated:", objc_msgSend(v8, "gadgetType"), v8, 1);

  }
}

- (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate)lemonadeUIDelegate
{
  return (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate *)objc_loadWeakRetained((id *)&self->_lemonadeUIDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lemonadeUIDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __122__PXSurveyQuestionsHorizontalGadgetProvider_horizontalCollectionGadget_configureCustomInfoAlertActionsForAlertController___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __122__PXSurveyQuestionsHorizontalGadgetProvider_horizontalCollectionGadget_configureCustomInfoAlertActionsForAlertController___block_invoke_2;
  v3[3] = &unk_1E5149198;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __122__PXSurveyQuestionsHorizontalGadgetProvider_horizontalCollectionGadget_configureCustomInfoAlertActionsForAlertController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  v6 = 0;
  objc_msgSend(v2, "customInfoAlertActionViewController:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "nextGadgetResponder");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject presentGadgetViewController:animated:completion:](v5, "presentGadgetViewController:animated:completion:", v3, 1, 0);
  }
  else
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "No custom info alert view controller: %@", buf, 0xCu);
    }
  }

}

@end
