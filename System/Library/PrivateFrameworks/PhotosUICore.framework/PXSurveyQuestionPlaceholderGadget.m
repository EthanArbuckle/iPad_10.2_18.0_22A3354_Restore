@implementation PXSurveyQuestionPlaceholderGadget

- (unint64_t)gadgetType
{
  return 0;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width;

  width = result.width;
  result.height = width;
  return result;
}

- (Class)collectionViewItemClass
{
  return (Class)objc_opt_class();
}

- (void)prepareCollectionViewItem:(id)a3
{
  PXSurveyQuestionPlaceholderGadgetView *view;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  PXSurveyQuestionPlaceholderGadgetView *v19;

  v19 = (PXSurveyQuestionPlaceholderGadgetView *)a3;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionPlaceholderGadget.m"), 50, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collectionViewItem"), v16);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionPlaceholderGadgetView px_descriptionForAssertionMessage](v19, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionPlaceholderGadget.m"), 50, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collectionViewItem"), v16, v18);

    goto LABEL_6;
  }
LABEL_3:
  view = self->_view;
  self->_view = v19;

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXForYouPhotosChallengePlaceholderTitle"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  PXLocalizedStringFromTable(CFSTR("PXForYouPhotosChallengePlaceholderMessage"), CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

  PXLocalizedStringFromTable(CFSTR("PXForYouPhotosChallengePlaceholderButtonTitle"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v9);

  -[PXSurveyQuestionPlaceholderGadgetView setPlaceholderContentUnavailableConfiguration:](self->_view, "setPlaceholderContentUnavailableConfiguration:", v6);
  objc_msgSend(MEMORY[0x1E0DC3698], "loadingConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXForYouPhotosChallengePlaceholderActivityTitle"), CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  -[PXSurveyQuestionPlaceholderGadgetView setLoadingContentUnavailableConfiguration:](self->_view, "setLoadingContentUnavailableConfiguration:", v12);
  -[PXSurveyQuestionPlaceholderGadgetView setDelegate:](self->_view, "setDelegate:", self);

}

- (id)uniqueGadgetIdentifier
{
  return CFSTR("PXSurveyQuestionsPlaceholderGadget");
}

- (PXSurveyQuestionPlaceholderGadgetView)contentView
{
  return self->_view;
}

- (void)placeholderGadgetView:(id)a3 invokeActionWithCompletionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionPlaceholderGadget.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionPlaceholderGadget.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[PXSurveyQuestionPlaceholderGadget delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationEnvironmentForGadget:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PXGenerateSurveyQuestionsWithOptions(533075965, -1, v9, v7);
}

- (void)placeholderGadgetViewSizeThatFitsDidChange:(id)a3
{
  id v4;

  -[PXSurveyQuestionPlaceholderGadget delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gadget:didChange:", self, 64);

}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (UIViewController)overrideContainerViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_overrideContainerViewController);
}

- (void)setOverrideContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_overrideContainerViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overrideContainerViewController);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
