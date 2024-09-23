@implementation PXSurveyQuestionGadget

- (PXSurveyQuestionGadget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionGadget.m"), 80, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionGadget init]");

  abort();
}

- (PXSurveyQuestionGadget)initWithSurveyQuestion:(id)a3 gadgetType:(unint64_t)a4
{
  id v7;
  PXSurveyQuestionGadget *v8;
  PXSurveyQuestionGadget *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSurveyQuestionGadget;
  v8 = -[PXSurveyQuestionGadget init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_question, a3);
    v9->_gadgetType = a4;
    v9->_configurationRequestId = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PXSurveyQuestionGadget *v4;
  PHQuestion *question;
  PXSurveyQuestionGadget *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (PXSurveyQuestionGadget *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      question = self->_question;
      v6 = v4;
      -[PHQuestion uuid](question, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSurveyQuestionGadget question](v6, "question");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return -[PHQuestion hash](self->_question, "hash");
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  PXSurveyQuestionConfigurationHandlers *handlers;
  PXSurveyQuestionConfigurationHandlers *v4;
  PXSurveyQuestionConfigurationHandlers *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  handlers = self->_handlers;
  if (!handlers)
  {
    v4 = objc_alloc_init(PXSurveyQuestionConfigurationHandlers);
    v5 = self->_handlers;
    self->_handlers = v4;

    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__PXSurveyQuestionGadget_handlers__block_invoke;
    v12[3] = &unk_1E512D7A8;
    objc_copyWeak(&v13, &location);
    -[PXSurveyQuestionConfigurationHandlers setDidSelectAssetHandler:](self->_handlers, "setDidSelectAssetHandler:", v12);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __34__PXSurveyQuestionGadget_handlers__block_invoke_2;
    v10[3] = &unk_1E512D7D0;
    objc_copyWeak(&v11, &location);
    -[PXSurveyQuestionConfigurationHandlers setPushViewControllerHandler:](self->_handlers, "setPushViewControllerHandler:", v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __34__PXSurveyQuestionGadget_handlers__block_invoke_3;
    v8[3] = &unk_1E512D7F8;
    objc_copyWeak(&v9, &location);
    -[PXSurveyQuestionConfigurationHandlers setPresentViewControllerHandler:](self->_handlers, "setPresentViewControllerHandler:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    handlers = self->_handlers;
  }
  return handlers;
}

- (PXSurveyQuestionConfiguration)configuration
{
  void *v2;
  void *v3;
  void *v4;
  PXSurveyQuestionDefaultConfiguration *v5;
  PXSurveyQuestionDefaultConfiguration *v6;

  -[PXSurveyQuestionGadget contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(PXSurveyQuestionDefaultConfiguration);
  v6 = v5;

  return (PXSurveyQuestionConfiguration *)v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  +[PXSurveyQuestionsGadgetContentView sizeThatFits:](PXSurveyQuestionsGadgetContentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIImage)currentImage
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSurveyQuestionGadget contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentImageForOneUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (PXRegionOfInterest)regionOfInterestForOneUpTransition
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  -[PXSurveyQuestionGadget contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionGadget.m"), 154, CFSTR("%@ asked for ROI for 1-Up transition, but our view is not loaded!"), v14);

    abort();
  }
  v5 = v4;
  objc_msgSend(v4, "contentBoundsInCoordinateSpace:", v4);
  v10 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4620), "initWithRect:inCoordinateSpace:", v5, v6, v7, v8, v9);
  objc_msgSend(v5, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentRectForOneUp");
  objc_msgSend(v10, "setImageContentsRect:");

  return (PXRegionOfInterest *)v10;
}

- (BOOL)_presentOneUpByLemonadeUI:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXSurveyQuestionGadget lemonadeUIDelegate](self, "lemonadeUIDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v9 = 0;
    goto LABEL_10;
  }
  -[PXSurveyQuestionGadget question](self, "question");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionGadget.m"), 166, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v18);
LABEL_13:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionGadget.m"), 166, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v18, v20);

    goto LABEL_13;
  }
LABEL_4:
  v21 = 0;
  v22 = 0;
  v9 = objc_msgSend(v7, "px_assetCollectionAndAssetFetchResultForAsset:assetCollection:assetFetchResult:", v8, &v22, &v21);
  v10 = v22;
  v11 = v21;
  if ((v9 & 1) != 0)
  {
    -[PXSurveyQuestionGadget regionOfInterestForOneUpTransition](self, "regionOfInterestForOneUpTransition");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "surveyQuestionGadgetPresentOneUp:keyAsset:assetCollection:regionOfInterest:", self, v8, v10, v12);
  }
  else
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v13;
      v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Failed to prepare for one up: No collection or fetch result for asset: %{public}@ for question: %{public}@", buf, 0x16u);

    }
  }

LABEL_10:
  return v9;
}

- (BOOL)_presentAssetCollectionByLemonadeUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXSurveyQuestionGadget lemonadeUIDelegate](self, "lemonadeUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXSurveyQuestionGadget regionOfInterestForOneUpTransition](self, "regionOfInterestForOneUpTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "surveyQuestionGadget:presentAssetCollection:regionOfInterest:", self, v4, v6);

  }
  return v5 != 0;
}

- (BOOL)_presentViewControllerByLemonadeUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXSurveyQuestionGadget lemonadeUIDelegate](self, "lemonadeUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXSurveyQuestionGadget regionOfInterestForOneUpTransition](self, "regionOfInterestForOneUpTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "surveyQuestionGadget:presentViewController:regionOfInterest:", self, v4, v6);

  }
  return v5 != 0;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (id)uniqueGadgetIdentifier
{
  return (id)-[PHQuestion uuid](self->_question, "uuid");
}

- (Class)collectionViewItemClass
{
  return (Class)objc_opt_class();
}

- (void)prepareCollectionViewItem:(id)a3
{
  PXSurveyQuestionsGadgetContentView *contentView;
  PXSurveyQuestionDefaultConfiguration *v6;
  void *v7;
  PXSurveyQuestionDefaultConfiguration *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  PXSurveyQuestionsGadgetContentView *v14;

  v14 = (PXSurveyQuestionsGadgetContentView *)a3;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionGadget.m"), 219, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collectionViewItem"), v11);
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
    -[PXSurveyQuestionsGadgetContentView px_descriptionForAssertionMessage](v14, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionGadget.m"), 219, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collectionViewItem"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  contentView = self->_contentView;
  self->_contentView = v14;

  v6 = [PXSurveyQuestionDefaultConfiguration alloc];
  -[PHQuestion px_displayTitle](self->_question, "px_displayTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSurveyQuestionDefaultConfiguration initWithTitle:](v6, "initWithTitle:", v7);
  -[PXSurveyQuestionsGadgetContentView setConfiguration:](self->_contentView, "setConfiguration:", v8);

  -[PXSurveyQuestionsGadgetContentView updateButtonsWithAnswerState:reason:](self->_contentView, "updateButtonsWithAnswerState:reason:", -[PXSurveyQuestionGadget answer](self, "answer"), self->_currentAnswerReason);
  -[PXSurveyQuestionsGadgetContentView setDelegate:](self->_contentView, "setDelegate:", self);
  -[PXSurveyQuestionGadget _updateContentViewConfiguration](self, "_updateContentViewConfiguration");

}

- (void)removeCollectionViewItem:(id)a3
{
  void *v5;
  PXSurveyQuestionDefaultConfiguration *v6;
  PXSurveyQuestionsGadgetContentView *contentView;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionGadget.m"), 228, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collectionViewItem"), v10);
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionGadget.m"), 228, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collectionViewItem"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v13, "updateButtonsWithAnswerState:reason:", 0, 0);
  objc_msgSend(v13, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandlers:", 0);

  v6 = objc_alloc_init(PXSurveyQuestionDefaultConfiguration);
  objc_msgSend(v13, "setConfiguration:", v6);

  -[PXSurveyQuestionsGadgetContentView setDelegate:](self->_contentView, "setDelegate:", 0);
  contentView = self->_contentView;
  self->_contentView = 0;

  self->_configurationRequestId = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)refreshQuestionContentView
{
  if (self->_contentView)
    -[PXSurveyQuestionGadget _updateContentViewConfiguration](self, "_updateContentViewConfiguration");
}

- (void)_updateContentViewConfiguration
{
  PHQuestion *question;
  _QWORD v4[5];
  id v5;
  id v6;
  id from;
  id location;

  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_contentView);
  question = self->_question;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PXSurveyQuestionGadget__updateContentViewConfiguration__block_invoke;
  v4[3] = &unk_1E512D820;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  objc_copyWeak(&v6, &from);
  self->_configurationRequestId = -[PHQuestion px_requestConfigurationWithResultHandler:](question, "px_requestConfigurationWithResultHandler:", v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)setContentHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_contentHidden != a3)
  {
    v3 = a3;
    self->_contentHidden = a3;
    -[PXSurveyQuestionGadget contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentHidden:", v3);

  }
}

- (void)gadgetContentView:(id)a3 didAnswer:(unint64_t)a4 withReason:(id)a5
{
  -[PXSurveyQuestionGadget _updateSurveyQuestionStateFromAnswer:andReason:](self, "_updateSurveyQuestionStateFromAnswer:andReason:", a4, a5);
}

- (void)_updateSurveyQuestionStateFromAnswer:(unint64_t)a3 andReason:(id)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  int v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  id v13[2];
  _QWORD v14[5];
  id v15;
  __int16 v16;
  _QWORD aBlock[4];
  id v18;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke;
  aBlock[3] = &unk_1E5148D30;
  objc_copyWeak(&v18, &location);
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  switch(a3)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      v9 = 2;
      break;
    case 2uLL:
      v9 = 3;
      break;
    case 3uLL:
      v9 = 1;
      break;
    case 4uLL:
      v9 = 4;
      break;
    default:
      v9 = 0;
      break;
  }
  if (-[PHQuestion type](self->_question, "type") == 25
    && -[PHQuestion state](self->_question, "state") == v9)
  {
LABEL_9:
    v8[2](v8);
  }
  else
  {
    -[PHQuestion photoLibrary](self->_question, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_2;
    v14[3] = &unk_1E512D848;
    v14[4] = self;
    v16 = v9;
    v15 = v6;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_3;
    v11[3] = &unk_1E5130B08;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a3;
    v12 = v8;
    objc_msgSend(v10, "performChanges:completionHandler:", v14, v11);

    objc_destroyWeak(v13);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_didFinishUpdatingSurveyQuestionStateFromAnswer
{
  id v3;

  -[PXSurveyQuestionGadget _playConfirmYesSound](self, "_playConfirmYesSound");
  -[PXSurveyQuestionGadget delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didAnswerQuestionForGadget:", self);

}

- (id)gadgetContentView:(id)a3 additionalReasonsForAnswer:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[6];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[16];
  _QWORD v61[4];
  _QWORD v62[6];
  _QWORD v63[7];
  _QWORD v64[6];
  _QWORD v65[7];
  _QWORD v66[5];
  _QWORD v67[7];

  v67[5] = *MEMORY[0x1E0C80C00];
  if (-[PHQuestion type](self->_question, "type", a3) == 18)
  {
    if (a4 == 1)
    {
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerYesReasonInPhoto"), CFSTR("PhotosUICore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v6;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerYesReasonPresent"), CFSTR("PhotosUICore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v7;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerYesReasonFamilyOrPet"), CFSTR("PhotosUICore"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v66[2] = v8;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerYesReasonNotPresentButWant"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v66[3] = v9;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerReasonOther"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v66[4] = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v66;
      goto LABEL_15;
    }
    if (a4 == 2)
    {
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerNoReasonNotPresent"), CFSTR("PhotosUICore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v6;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerNoReasonPresentButNoLike"), CFSTR("PhotosUICore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v7;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerNoReasonMemeOrScreenshot"), CFSTR("PhotosUICore"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v67[2] = v8;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerNoReasonUninterestingOrBad"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v67[3] = v9;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeContentSyndicationAnswerReasonOther"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v67[4] = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v67;
LABEL_15:
      objc_msgSend(v11, "arrayWithObjects:count:", v12, 5);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    goto LABEL_61;
  }
  if (-[PHQuestion type](self->_question, "type") == 20)
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonNotCriticalText"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = v6;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonSensitiveText"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v65[1] = v7;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonNotPresentText"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v65[2] = v8;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonUninterestingText"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v65[3] = v9;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonLocationText"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v65[4] = v10;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonEventText"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v65[5] = v13;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonOtherText"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v65[6] = v14;
        v15 = (void *)MEMORY[0x1E0C99D20];
        v16 = v65;
LABEL_13:
        objc_msgSend(v15, "arrayWithObjects:count:", v16, 7);
        v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_28:
        goto LABEL_29;
      }
      goto LABEL_61;
    }
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonParticipantsInPhotoText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v6;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonParticipantsPresentText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v7;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonFamilyText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v8;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonLocationText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v9;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonEventText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v64[4] = v10;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonOtherText"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v64[5] = v13;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v64;
    goto LABEL_27;
  }
  if (-[PHQuestion type](self->_question, "type") == 23)
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonNotCriticalText"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = v6;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonSensitiveText"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v63[1] = v7;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonNotPresentText"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v63[2] = v8;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonUninterestingText"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v63[3] = v9;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonLocationText"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v63[4] = v10;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonEventText"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v63[5] = v13;
        PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerNoReasonOtherText"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v63[6] = v14;
        v15 = (void *)MEMORY[0x1E0C99D20];
        v16 = v63;
        goto LABEL_13;
      }
LABEL_61:
      v17 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_62;
    }
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonParticipantsInPhotoText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v6;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonParticipantsPresentText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v7;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonFamilyText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v8;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonLocationText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v9;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonEventText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v10;
    PXLocalizedSharedLibraryString(CFSTR("PXInternalPhotosChallengeSharedLibraryAnswerYesReasonOtherText"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v62[5] = v13;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v62;
LABEL_27:
    objc_msgSend(v18, "arrayWithObjects:count:", v19, 6);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (-[PHQuestion type](self->_question, "type") == 24)
  {
    if (a4 == 1)
    {
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonTrips"), CFSTR("PhotosUICore"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v52;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonCelebrations"), CFSTR("PhotosUICore"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v51;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonFriends"), CFSTR("PhotosUICore"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v60[2] = v50;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonFamily"), CFSTR("PhotosUICore"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v60[3] = v49;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonPartner"), CFSTR("PhotosUICore"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v60[4] = v48;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonPets"), CFSTR("PhotosUICore"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v60[5] = v47;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonMyself"), CFSTR("PhotosUICore"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v60[6] = v46;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonHobbies"), CFSTR("PhotosUICore"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v60[7] = v45;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonArtistic"), CFSTR("PhotosUICore"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v60[8] = v44;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonNature"), CFSTR("PhotosUICore"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v60[9] = v26;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonFood"), CFSTR("PhotosUICore"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v60[10] = v27;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonUtility"), CFSTR("PhotosUICore"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v60[11] = v28;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonScratch"), CFSTR("PhotosUICore"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v60[12] = v29;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonAppleWork"), CFSTR("PhotosUICore"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60[13] = v30;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonNonAppleWork"), CFSTR("PhotosUICore"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v60[14] = v31;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonOther"), CFSTR("PhotosUICore"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v60[15] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 16);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_62;
    }
    if (a4 == 2)
    {
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerNoReasonAppleWork"), CFSTR("PhotosUICore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v6;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerNoReasonNonAppleWork"), CFSTR("PhotosUICore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v7;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerNoReasonThirdPartyApp"), CFSTR("PhotosUICore"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v61[2] = v8;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAlbumClassificationAnswerNoReasonOther"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v61[3] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

LABEL_31:
LABEL_32:

      goto LABEL_62;
    }
    goto LABEL_61;
  }
  if (-[PHQuestion type](self->_question, "type") == 25)
  {
    if (a4 != 1)
      goto LABEL_61;
    -[PXSurveyQuestionGadget question](self, "question");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "additionalInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D77FF8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v22;
      if (!v22)
      {
        v17 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_31;
      }
      v23 = v22;
LABEL_67:
      v17 = v23;
      goto LABEL_31;
    }
LABEL_47:
    v17 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_32;
  }
  if (-[PHQuestion type](self->_question, "type") == 8)
  {
    if (a4 != 1)
      goto LABEL_61;
    -[PXSurveyQuestionGadget question](self, "question");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "additionalInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D78018]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v17 = v6;
      goto LABEL_32;
    }
    goto LABEL_47;
  }
  if (-[PHQuestion type](self->_question, "type") == 26
    || -[PHQuestion type](self->_question, "type") == 28)
  {
    -[PHQuestion additionalInfo](self->_question, "additionalInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x1E0D78138]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqual:", MEMORY[0x1E0C9AAA0]);

    if (v35)
    {
      if (a4 == 2)
      {
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeYes"), CFSTR("PhotosUICore"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v6;
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeTitlingAnswerNeither"), CFSTR("PhotosUICore"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v58[1] = v7;
        v36 = (void *)MEMORY[0x1E0C99D20];
        v37 = v58;
      }
      else
      {
        if (a4 != 1)
          goto LABEL_61;
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeYes"), CFSTR("PhotosUICore"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v6;
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeNo"), CFSTR("PhotosUICore"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v7;
        v36 = (void *)MEMORY[0x1E0C99D20];
        v37 = v59;
      }
      goto LABEL_66;
    }
  }
  if (-[PHQuestion type](self->_question, "type") == 27)
  {
    if (a4 != 2)
      goto LABEL_61;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeLocationRepresentativeAssetAnswerNoBadChoice"), CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v6;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeLocationRepresentativeAssetAnswerNoWithBetterChoice"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v7;
    v36 = (void *)MEMORY[0x1E0C99D20];
    v37 = v57;
    goto LABEL_66;
  }
  if (-[PHQuestion type](self->_question, "type") == 13
    && -[PHQuestion entityType](self->_question, "entityType") == 1)
  {
    if (a4 != 1)
      goto LABEL_61;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonCurrentPet"), CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v6;
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonPreviousPet"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v7;
    v36 = (void *)MEMORY[0x1E0C99D20];
    v37 = v56;
LABEL_66:
    objc_msgSend(v36, "arrayWithObjects:count:", v37, 2);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_67;
  }
  if (-[PHQuestion type](self->_question, "type") == 5
    && -[PHQuestion entityType](self->_question, "entityType") == 1)
  {
    -[PHQuestion additionalInfo](self->_question, "additionalInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D780D8]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("CHILD"));

    if (v40)
    {
      if (a4 == 1)
      {
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonBaby"), CFSTR("PhotosUICore"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v6;
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonChild"), CFSTR("PhotosUICore"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v7;
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonYoungAdult"), CFSTR("PhotosUICore"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v55[2] = v8;
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonAdult"), CFSTR("PhotosUICore"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v55[3] = v9;
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonSenior"), CFSTR("PhotosUICore"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v55[4] = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = v55;
        goto LABEL_15;
      }
      goto LABEL_61;
    }
  }
  if (-[PHQuestion type](self->_question, "type") == 15)
  {
    if (a4 == 2)
    {
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonPlaysTooOften"), CFSTR("PhotosUICore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v6;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonDontLikeSong"), CFSTR("PhotosUICore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v7;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonMismatchEnergy"), CFSTR("PhotosUICore"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v54[2] = v8;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonMismatchLyrics"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v54[3] = v9;
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonOther"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v54[4] = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v54;
      goto LABEL_15;
    }
    goto LABEL_61;
  }
  v43 = -[PHQuestion type](self->_question, "type");
  v17 = (id)MEMORY[0x1E0C9AA60];
  if (a4 == 2 && v43 == 30)
  {
    PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonUnsafe"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v6;
    PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonConfusing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v7;
    PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotSpecific"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v8;
    PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonTooSpecific"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v9;
    PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotAccurate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v10;
    PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotApplicable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53[5] = v13;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v53;
    goto LABEL_27;
  }
LABEL_62:
  if (-[PHQuestion type](self->_question, "type") == 22)
  {
    -[PXSurveyQuestionGadget additionalReasonsForWallpaperQuestionsForAnswer:](self, "additionalReasonsForWallpaperQuestionsForAnswer:", a4);
    v41 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v41;
  }
  return v17;
}

- (id)additionalReasonsForWallpaperQuestionsForAnswer:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (a3 != 2)
    return MEMORY[0x1E0C9AA60];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeWallpaperAnswerNoReasonSomewhatPoor"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeWallpaperAnswerNoReasonEmbarrassinglyBad"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)gadgetContentView:(id)a3 additionalReasonTitleForAnswer:(unint64_t)a4
{
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;

  if (-[PHQuestion type](self->_question, "type", a3, a4) == 24)
  {
    v5 = CFSTR("PXInternalPhotosChallengeAlbumClassificationAdditionalReasonTitle");
    goto LABEL_7;
  }
  if (-[PHQuestion type](self->_question, "type") == 25)
  {
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingTitle");
    goto LABEL_7;
  }
  if (-[PHQuestion type](self->_question, "type") == 8)
  {
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonFrequentLocationTitle");
    goto LABEL_7;
  }
  if (-[PHQuestion type](self->_question, "type") == 26)
  {
    -[PHQuestion additionalInfo](self->_question, "additionalInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D78138]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", MEMORY[0x1E0C9AAA0]);

    if (v11)
    {
      -[PHQuestion additionalInfo](self->_question, "additionalInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D78150]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = CFSTR("PXInternalPhotosChallengeTripTitlingAdditionalReasonTitle");
LABEL_16:
      PXLocalizedStringFromTable(v14, CFSTR("PhotosUICore"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
  }
  if (-[PHQuestion type](self->_question, "type") == 28)
  {
    -[PHQuestion additionalInfo](self->_question, "additionalInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D78138]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", MEMORY[0x1E0C9AAA0]);

    if (v17)
    {
      -[PHQuestion additionalInfo](self->_question, "additionalInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D78148]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = CFSTR("PXInternalPhotosChallengeDayHighlightTitlingAdditionalReasonTitle");
      goto LABEL_16;
    }
  }
  if (-[PHQuestion type](self->_question, "type") == 13
    && -[PHQuestion entityType](self->_question, "entityType") == 1)
  {
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonPetTitle");
  }
  else if (-[PHQuestion type](self->_question, "type") == 5
         && -[PHQuestion entityType](self->_question, "entityType") == 1
         && (-[PHQuestion additionalInfo](self->_question, "additionalInfo"),
             v20 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D780D8]),
             v21 = (void *)objc_claimAutoreleasedReturnValue(),
             v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("CHILD")),
             v21,
             v20,
             v22))
  {
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonChildTitle");
  }
  else
  {
    if (-[PHQuestion type](self->_question, "type") == 30)
    {
      PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonTitle"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonTitle");
  }
LABEL_7:
  PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v7 = (void *)v6;
  return v7;
}

- (id)gadgetContentView:(id)a3 additionalReasonMessageForAnswer:(unint64_t)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  char v8;

  if (-[PHQuestion type](self->_question, "type", a3, a4) == 25)
  {
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingMessage");
  }
  else if (-[PHQuestion type](self->_question, "type") == 8)
  {
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonFrequentLocationMessage");
  }
  else if (-[PHQuestion type](self->_question, "type") == 13
         && -[PHQuestion entityType](self->_question, "entityType") == 1)
  {
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonPetMessage");
  }
  else if (-[PHQuestion type](self->_question, "type") == 5
         && -[PHQuestion entityType](self->_question, "entityType") == 1
         && (-[PHQuestion additionalInfo](self->_question, "additionalInfo"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D780D8]),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("CHILD")),
             v7,
             v6,
             (v8 & 1) != 0))
  {
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonChildMessage");
  }
  else
  {
    v5 = CFSTR("PXInternalPhotosChallengeAdditionalReasonMessage");
  }
  PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)questionType
{
  void *v2;
  unsigned __int16 v3;

  -[PXSurveyQuestionGadget question](self, "question");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (void)_playConfirmYesSound
{
  SystemSoundID v2;

  v2 = objc_msgSend((id)objc_opt_class(), "confirmYesSoundID");
  if (v2)
    AudioServicesPlaySystemSound(v2);
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)gadgetType
{
  return self->_gadgetType;
}

- (PHQuestion)question
{
  return self->_question;
}

- (unint64_t)answer
{
  return self->_answer;
}

- (void)setAnswer:(unint64_t)a3
{
  self->_answer = a3;
}

- (PXSurveyQuestionsGadgetContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (PXSurveyQuestionGadgetLemonadeUIDelegate)lemonadeUIDelegate
{
  return (PXSurveyQuestionGadgetLemonadeUIDelegate *)objc_loadWeakRetained((id *)&self->_lemonadeUIDelegate);
}

- (void)setLemonadeUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lemonadeUIDelegate, a3);
}

- (NSSet)assetUUIDsAssociatedWithGadget
{
  return self->_assetUUIDsAssociatedWithGadget;
}

- (void)setAssetUUIDsAssociatedWithGadget:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDsAssociatedWithGadget, a3);
}

- (BOOL)currentlyInOneUp
{
  return self->_currentlyInOneUp;
}

- (void)setCurrentlyInOneUp:(BOOL)a3
{
  self->_currentlyInOneUp = a3;
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_assetUUIDsAssociatedWithGadget, 0);
  objc_destroyWeak((id *)&self->_lemonadeUIDelegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_storeStrong((id *)&self->_currentAnswerReason, 0);
}

void __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didFinishUpdatingSurveyQuestionStateFromAnswer");

}

void __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;

  objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v62 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setState:", *(unsigned __int16 *)(a1 + 48));
  v2 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "additionalInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 40), "length");
  v6 = v5 != 0;
  v7 = (uint64_t *)MEMORY[0x1E0D77FD0];
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *v7);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "questionType") == 25)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "presentedAssetIds");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D78000]);

      v6 = 1;
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "type") == 14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D78010]);

    v6 = 1;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "type") == 26
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "type") == 28)
  {
    v16 = *v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", *v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = *(void **)(a1 + 40);
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeYes"), CFSTR("PhotosUICore"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = objc_msgSend(v18, "isEqualToString:", v19);

      if ((_DWORD)v18)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v16);
      v6 = 1;
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "type") == 13)
  {
    v21 = *v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", *v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = *(void **)(a1 + 40);
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonCurrentPet"), CFSTR("PhotosUICore"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = objc_msgSend(v23, "isEqualToString:", v24);

      v25 = (_QWORD *)MEMORY[0x1E0D780C8];
      if (!(_DWORD)v23)
        v25 = (_QWORD *)MEMORY[0x1E0D780D0];
      objc_msgSend(v4, "setObject:forKeyedSubscript:", *v25, v21);
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "type") == 5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D780D8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("CHILD")) & 1) != 0)
    {
      v27 = *v7;
      objc_msgSend(v4, "objectForKeyedSubscript:", *v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = *(void **)(a1 + 40);
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonBaby"), CFSTR("PhotosUICore"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "isEqualToString:", v30))
        {

        }
        else
        {
          v31 = *(void **)(a1 + 40);
          PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonChild"), CFSTR("PhotosUICore"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v31) = objc_msgSend(v31, "isEqualToString:", v32);

          if (!(_DWORD)v31)
          {
            v33 = (_QWORD *)MEMORY[0x1E0D77FD8];
            goto LABEL_29;
          }
        }
        v33 = (_QWORD *)MEMORY[0x1E0D77FE0];
LABEL_29:
        objc_msgSend(v4, "setObject:forKeyedSubscript:", *v33, v27);
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "type") == 15)
  {
    v34 = *v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", *v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = *(void **)(a1 + 40);
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonPlaysTooOften"), CFSTR("PhotosUICore"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v36) = objc_msgSend(v36, "isEqualToString:", v37);

      if ((v36 & 1) != 0)
      {
        v38 = (_QWORD *)MEMORY[0x1E0D78088];
      }
      else
      {
        v39 = *(void **)(a1 + 40);
        PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonDontLikeSong"), CFSTR("PhotosUICore"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v39) = objc_msgSend(v39, "isEqualToString:", v40);

        if ((v39 & 1) != 0)
        {
          v38 = (_QWORD *)MEMORY[0x1E0D78068];
        }
        else
        {
          v41 = *(void **)(a1 + 40);
          PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonMismatchEnergy"), CFSTR("PhotosUICore"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v41) = objc_msgSend(v41, "isEqualToString:", v42);

          if ((v41 & 1) != 0)
          {
            v38 = (_QWORD *)MEMORY[0x1E0D78070];
          }
          else
          {
            v43 = *(void **)(a1 + 40);
            PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonMismatchLyrics"), CFSTR("PhotosUICore"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v43) = objc_msgSend(v43, "isEqualToString:", v44);

            if ((v43 & 1) != 0)
            {
              v38 = (_QWORD *)MEMORY[0x1E0D78078];
            }
            else
            {
              v45 = *(void **)(a1 + 40);
              PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonOther"), CFSTR("PhotosUICore"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v45) = objc_msgSend(v45, "isEqualToString:", v46);

              v38 = (_QWORD *)MEMORY[0x1E0D78090];
              if ((_DWORD)v45)
                v38 = (_QWORD *)MEMORY[0x1E0D78080];
            }
          }
        }
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", *v38, v34);
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "type") == 30)
  {
    v47 = *v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", *v7);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = *(void **)(a1 + 40);
      PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonUnsafe"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v49) = objc_msgSend(v49, "isEqualToString:", v50);

      if ((v49 & 1) != 0)
      {
        v51 = (_QWORD *)MEMORY[0x1E0D78110];
      }
      else
      {
        v52 = *(void **)(a1 + 40);
        PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonConfusing"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v52) = objc_msgSend(v52, "isEqualToString:", v53);

        if ((v52 & 1) != 0)
        {
          v51 = (_QWORD *)MEMORY[0x1E0D780E0];
        }
        else
        {
          v54 = *(void **)(a1 + 40);
          PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotSpecific"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v54) = objc_msgSend(v54, "isEqualToString:", v55);

          if ((v54 & 1) != 0)
          {
            v51 = (_QWORD *)MEMORY[0x1E0D780F8];
          }
          else
          {
            v56 = *(void **)(a1 + 40);
            PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonTooSpecific"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v56) = objc_msgSend(v56, "isEqualToString:", v57);

            if ((v56 & 1) != 0)
            {
              v51 = (_QWORD *)MEMORY[0x1E0D78100];
            }
            else
            {
              v58 = *(void **)(a1 + 40);
              PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotAccurate"));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v58) = objc_msgSend(v58, "isEqualToString:", v59);

              if ((v58 & 1) != 0)
              {
                v51 = (_QWORD *)MEMORY[0x1E0D780E8];
              }
              else
              {
                v60 = *(void **)(a1 + 40);
                PXLocalizedStoryPromptSuggestionsString(CFSTR("PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotApplicable"));
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v60) = objc_msgSend(v60, "isEqualToString:", v61);

                v51 = (_QWORD *)MEMORY[0x1E0D78108];
                if ((_DWORD)v60)
                  v51 = (_QWORD *)MEMORY[0x1E0D780F0];
              }
            }
          }
        }
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", *v51, v47);
    }
  }
  if (v6)
    objc_msgSend(v62, "setAdditionalInfo:", v4);

}

void __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_3(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8[2];
  char v9;

  v5 = a3;
  v9 = a2;
  objc_copyWeak(v8, a1 + 5);
  v8[1] = a1[6];
  v6 = v5;
  v7 = a1[4];
  px_dispatch_on_main_queue();

  objc_destroyWeak(v8);
}

uint64_t __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = *(_QWORD *)(a1 + 56);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setAnswer:", v2);

  }
  else
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Error updating survey question state from answer (error: %@)", (uint8_t *)&v7, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__PXSurveyQuestionGadget__updateContentViewConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) == a2)
  {
    v4 = (id *)(a1 + 40);
    v5 = a3;
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "handlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHandlers:", v7);

    v8 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "setConfiguration:", v5);

  }
}

void __34__PXSurveyQuestionGadget_handlers__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  char v5;
  void *v6;
  id v7;
  id v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "_presentOneUpByLemonadeUI:", v3);

  if ((v5 & 1) == 0)
  {
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "surveyQuestionGadgetsWantsOneUpPresentation:", v7);

  }
}

void __34__PXSurveyQuestionGadget_handlers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = (id *)(a1 + 32);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = objc_msgSend(WeakRetained, "_presentAssetCollectionByLemonadeUI:", v6);

  if ((v8 & 1) == 0)
  {
    v9 = objc_loadWeakRetained(v5);
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained(v5);
    objc_msgSend(v10, "gadget:transitionToViewController:animated:completion:", v11, v12, 1, 0);

  }
}

void __34__PXSurveyQuestionGadget_handlers__block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_msgSend(WeakRetained, "_presentViewControllerByLemonadeUI:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentGadgetViewController:animated:completion:", v8, 1, 0);

  }
}

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken_145771 != -1)
    dispatch_once(&sharedWorkQueue_onceToken_145771, &__block_literal_global_145772);
  return (id)sharedWorkQueue_sharedWorkQueue_145773;
}

+ (unsigned)confirmYesSoundID
{
  if (confirmYesSoundID_onceToken != -1)
    dispatch_once(&confirmYesSoundID_onceToken, &__block_literal_global_131_145764);
  return confirmYesSoundID_soundID;
}

+ (void)preloadResources
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PXSurveyQuestionGadget_preloadResources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadResources_onceToken_145762 != -1)
    dispatch_once(&preloadResources_onceToken_145762, block);
}

void __42__PXSurveyQuestionGadget_preloadResources__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PXSurveyQuestionGadget_preloadResources__block_invoke_2;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "scheduleTaskWithQoS:block:", 0, v3);

}

uint64_t __42__PXSurveyQuestionGadget_preloadResources__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "confirmYesSoundID");
}

void __43__PXSurveyQuestionGadget_confirmYesSoundID__block_invoke()
{
  void *v0;
  const __CFURL *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "px_bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("PXPeopleConfirmYes"), CFSTR("caf"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
    v1 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    AudioServicesCreateSystemSoundID(v1, (SystemSoundID *)&confirmYesSoundID_soundID);

  }
}

void __41__PXSurveyQuestionGadget_sharedWorkQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.surveyWorkQueue", attr);
  v2 = (void *)sharedWorkQueue_sharedWorkQueue_145773;
  sharedWorkQueue_sharedWorkQueue_145773 = (uint64_t)v1;

}

@end
