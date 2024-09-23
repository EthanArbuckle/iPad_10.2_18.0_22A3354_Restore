@implementation PXSurveyQuestionCongratulationsGadget

- (PXSurveyQuestionCongratulationsGadget)initWithType:(unint64_t)a3
{
  PXSurveyQuestionCongratulationsGadget *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionCongratulationsGadget;
  result = -[PXSurveyQuestionCongratulationsGadget init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (unint64_t)gadgetType
{
  return 18;
}

- (id)uniqueGadgetIdentifier
{
  unint64_t type;
  const __CFString *v3;

  type = self->_type;
  v3 = CFSTR("PXSurveyQuestionsCongratulationsTypeLoadMore");
  if (type != 1)
    v3 = 0;
  if (type)
    return (id)v3;
  else
    return CFSTR("PXSurveyQuestionsCongratulationsTypeDismiss");
}

- (PXSurveyQuestionsCongratulationsGadgetContentView)contentView
{
  PXSurveyQuestionsCongratulationsGadgetContentView *contentView;
  unint64_t type;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  PXSurveyQuestionsCongratulationsGadgetContentView *v9;
  PXSurveyQuestionsCongratulationsGadgetContentView *v10;

  contentView = self->_contentView;
  if (!contentView)
  {
    type = self->_type;
    if (type)
    {
      if (type != 1)
      {
        v7 = 0;
        v8 = 0;
        goto LABEL_8;
      }
      v5 = CFSTR("PXInternalPhotosChallengeCongratulationsLoadMore");
      v6 = CFSTR("PXInternalPhotosChallengeCongratulationsLoadMoreDetailMessage");
    }
    else
    {
      v5 = CFSTR("PXInternalPhotosChallengeCongratulationsFinishedDismiss");
      v6 = CFSTR("PXInternalPhotosChallengeCongratulationsFinishedDetailMessage");
    }
    PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = -[PXSurveyQuestionsCongratulationsGadgetContentView initWithDetailMessage:buttonTitle:]([PXSurveyQuestionsCongratulationsGadgetContentView alloc], "initWithDetailMessage:buttonTitle:", v7, v8);
    v10 = self->_contentView;
    self->_contentView = v9;

    -[PXSurveyQuestionsCongratulationsGadgetContentView setDelegate:](self->_contentView, "setDelegate:", self);
    contentView = self->_contentView;
  }
  return contentView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXSurveyQuestionCongratulationsGadget contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)congratulationsGadgetContentViewDidSelectActionButton:(id)a3
{
  id v4;

  -[PXSurveyQuestionCongratulationsGadget delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didSelectActionButtonForType:", self->_type);

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

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

@end
