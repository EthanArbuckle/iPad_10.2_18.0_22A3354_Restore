@implementation PXSurveyQuestionsCongratulationsGadgetContentView

- (PXSurveyQuestionsCongratulationsGadgetContentView)initWithDetailMessage:(id)a3 buttonTitle:(id)a4
{
  id v6;
  id v7;
  PXSurveyQuestionsCongratulationsGadgetContentView *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UILabel *congratulationsLabel;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UILabel *messageLabel;
  void *v22;
  void *v23;
  PXCapsuleButton *v24;
  void *v25;
  uint64_t v26;
  PXCapsuleButton *actionButton;
  PXCapsuleButton *v28;
  void *v29;
  PXRoundedCornerOverlayView *v30;
  PXRoundedCornerOverlayView *roundedOverlayView;
  PXRoundedCornerOverlayView *v32;
  uint64_t v33;
  PXSurveyQuestionsCongratulationsGadgetContentView *v34;
  void *v35;
  objc_class *v36;
  id v37;
  void *v38;
  _PXCKFullscreenEffectView *v39;
  _PXCKFullscreenEffectView *effectView;
  UISelectionFeedbackGenerator *v41;
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  uint64_t v43;
  UIImpactFeedbackGenerator *impactFeedbackGenerator;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, void *);
  void *v49;
  PXSurveyQuestionsCongratulationsGadgetContentView *v50;
  objc_super v51;
  _QWORD v52[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;

  v6 = a3;
  v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)PXSurveyQuestionsCongratulationsGadgetContentView;
  v8 = -[PXSurveyQuestionsCongratulationsGadgetContentView init](&v51, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsCongratulationsGadgetContentView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = objc_alloc(MEMORY[0x1E0DC3990]);
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    congratulationsLabel = v8->_congratulationsLabel;
    v8->_congratulationsLabel = (UILabel *)v15;

    -[UILabel setTextAlignment:](v8->_congratulationsLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v8->_congratulationsLabel, "setAdjustsFontSizeToFitWidth:", 1);
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeCongratulationsTitle"), CFSTR("PhotosUICore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v8->_congratulationsLabel, "setText:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v8->_congratulationsLabel, "setBackgroundColor:", v18);

    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B50], 2, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_congratulationsLabel, "setFont:", v19);

    -[PXSurveyQuestionsCongratulationsGadgetContentView addSubview:](v8, "addSubview:", v8->_congratulationsLabel);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    messageLabel = v8->_messageLabel;
    v8->_messageLabel = (UILabel *)v20;

    -[UILabel setTextAlignment:](v8->_messageLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v8->_messageLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setText:](v8->_messageLabel, "setText:", v6);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v8->_messageLabel, "setBackgroundColor:", v22);

    -[UILabel setNumberOfLines:](v8->_messageLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_messageLabel, "setFont:", v23);

    -[PXSurveyQuestionsCongratulationsGadgetContentView addSubview:](v8, "addSubview:", v8->_messageLabel);
    if (v7)
    {
      v24 = [PXCapsuleButton alloc];
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[PXCapsuleButton initWithColor:](v24, "initWithColor:", v25);
      actionButton = v8->_actionButton;
      v8->_actionButton = (PXCapsuleButton *)v26;

      -[PXCapsuleButton setMaxContentSizeCategory:](v8->_actionButton, "setMaxContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
      -[PXCapsuleButton setTitle:forState:](v8->_actionButton, "setTitle:forState:", v7, 0);
      v28 = v8->_actionButton;
      -[PXSurveyQuestionsCongratulationsGadgetContentView tintColor](v8, "tintColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCapsuleButton setTitleColor:forState:](v28, "setTitleColor:forState:", v29, 0);

      -[PXCapsuleButton addTarget:action:forControlEvents:](v8->_actionButton, "addTarget:action:forControlEvents:", v8, sel__didSelectActionButton, 64);
      -[PXSurveyQuestionsCongratulationsGadgetContentView addSubview:](v8, "addSubview:", v8->_actionButton);
    }
    v30 = -[PXRoundedCornerOverlayView initWithFrame:]([PXRoundedCornerOverlayView alloc], "initWithFrame:", v11, v12, v13, v14);
    roundedOverlayView = v8->_roundedOverlayView;
    v8->_roundedOverlayView = v30;

    -[PXSurveyQuestionsCongratulationsGadgetContentView addSubview:](v8, "addSubview:", v8->_roundedOverlayView);
    v32 = v8->_roundedOverlayView;
    v33 = MEMORY[0x1E0C809B0];
    v46 = MEMORY[0x1E0C809B0];
    v47 = 3221225472;
    v48 = __87__PXSurveyQuestionsCongratulationsGadgetContentView_initWithDetailMessage_buttonTitle___block_invoke;
    v49 = &unk_1E51406D0;
    v34 = v8;
    v50 = v34;
    -[PXRoundedCornerOverlayView performChanges:](v32, "performChanges:", &v46);
    v53 = 0;
    v54 = &v53;
    v55 = 0x2050000000;
    v35 = (void *)getCKFullScreenEffectManagerClass_softClass;
    v56 = getCKFullScreenEffectManagerClass_softClass;
    if (!getCKFullScreenEffectManagerClass_softClass)
    {
      v52[0] = v33;
      v52[1] = 3221225472;
      v52[2] = __getCKFullScreenEffectManagerClass_block_invoke;
      v52[3] = &unk_1E51482E0;
      v52[4] = &v53;
      __getCKFullScreenEffectManagerClass_block_invoke((uint64_t)v52);
      v35 = (void *)v54[3];
    }
    v36 = objc_retainAutorelease(v35);
    _Block_object_dispose(&v53, 8);
    v37 = objc_alloc_init(v36);
    objc_msgSend(v37, "effectForIdentifier:", CFSTR("com.apple.messages.effect.CKConfettiEffect"), v46, v47, v48, v49);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v39 = (_PXCKFullscreenEffectView *)objc_alloc_init((Class)objc_msgSend(v38, "effectViewClass"));
      effectView = v34->_effectView;
      v34->_effectView = v39;

      -[_PXCKFullscreenEffectView setUserInteractionEnabled:](v34->_effectView, "setUserInteractionEnabled:", 0);
      -[PXSurveyQuestionsCongratulationsGadgetContentView addSubview:](v34, "addSubview:", v34->_effectView);
    }
    v41 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
    selectionFeedbackGenerator = v34->_selectionFeedbackGenerator;
    v34->_selectionFeedbackGenerator = v41;

    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 2);
    impactFeedbackGenerator = v34->_impactFeedbackGenerator;
    v34->_impactFeedbackGenerator = (UIImpactFeedbackGenerator *)v43;

  }
  return v8;
}

- (void)_didSelectActionButton
{
  void *v3;
  id v4;

  -[PXSurveyQuestionsCongratulationsGadgetContentView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionChanged");

  -[PXSurveyQuestionsCongratulationsGadgetContentView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "congratulationsGadgetContentViewDidSelectActionButton:", self);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width;

  width = result.width;
  result.height = width;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v25.receiver = self;
  v25.super_class = (Class)PXSurveyQuestionsCongratulationsGadgetContentView;
  -[PXSurveyQuestionsCongratulationsGadgetContentView layoutSubviews](&v25, sel_layoutSubviews);
  -[PXSurveyQuestionsCongratulationsGadgetContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v7, v9);
  v12 = v11;
  v14 = v13;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v23 = CGRectGetMidX(v26) - v12 * 0.5;
  v24 = v12;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v15 = CGRectGetMidY(v27) - v14 * 0.5;
  -[UILabel setFrame:](self->_messageLabel, "setFrame:", v23, v15, v12, v14);
  -[UILabel sizeThatFits:](self->_congratulationsLabel, "sizeThatFits:", v8, v10);
  v17 = v16;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  -[UILabel setFrame:](self->_congratulationsLabel, "setFrame:", CGRectGetMidX(v28) - v17 * 0.5, v15 - v14 + -12.0, v17, v14);
  -[PXCapsuleButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v8, v10);
  v19 = v18;
  v22 = v20;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  v21 = CGRectGetMidX(v29) - v19 * 0.5;
  v30.origin.x = v23;
  v30.size.width = v24;
  v30.origin.y = v15;
  v30.size.height = v14;
  -[PXCapsuleButton setFrame:](self->_actionButton, "setFrame:", v21, CGRectGetMaxY(v30) + 24.0, v19, v22);
  -[_PXCKFullscreenEffectView setFrame:](self->_effectView, "setFrame:", v4, v6, v8, v10);
  -[PXRoundedCornerOverlayView setFrame:](self->_roundedOverlayView, "setFrame:", v4, v6, v8, v10);
}

- (void)startConfettiAnimation
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[UIImpactFeedbackGenerator impactOccurredWithIntensity:](self->_impactFeedbackGenerator, "impactOccurredWithIntensity:", 1.0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PXSurveyQuestionsCongratulationsGadgetContentView_startConfettiAnimation__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  }
}

- (PXSurveyQuestionCongratulationsGadgetContentViewDelegate)delegate
{
  return (PXSurveyQuestionCongratulationsGadgetContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)congratulationsLabel
{
  return self->_congratulationsLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (PXCapsuleButton)actionButton
{
  return self->_actionButton;
}

- (PXRoundedCornerOverlayView)roundedOverlayView
{
  return self->_roundedOverlayView;
}

- (_PXCKFullscreenEffectView)effectView
{
  return self->_effectView;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_roundedOverlayView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_congratulationsLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __75__PXSurveyQuestionsCongratulationsGadgetContentView_startConfettiAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "startAnimation");
}

void __87__PXSurveyQuestionsCongratulationsGadgetContentView_initWithDetailMessage_buttonTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setCornerRadius:", 4.0);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  objc_msgSend(v3, "setDisplayScale:");

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOverlayColor:", v5);

}

@end
