@implementation PXSurveyQuestionsGadgetContentView

- (PXSurveyQuestionsGadgetContentView)initWithFrame:(CGRect)a3
{
  PXSurveyQuestionsGadgetContentView *v3;
  PXSurveyQuestionDefaultConfiguration *v4;
  PXSurveyQuestionConfiguration *configuration;
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
  UISelectionFeedbackGenerator *v16;
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PXSurveyQuestionsGadgetContentView;
  v3 = -[PXSurveyQuestionsGadgetContentView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PXSurveyQuestionDefaultConfiguration);
    configuration = v3->_configuration;
    v3->_configuration = (PXSurveyQuestionConfiguration *)v4;

    -[PXSurveyQuestionsGadgetContentView contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView titleLabel](v3, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[PXSurveyQuestionsGadgetContentView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView yesButton](v3, "yesButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[PXSurveyQuestionsGadgetContentView contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView skipButton](v3, "skipButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[PXSurveyQuestionsGadgetContentView contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView noButton](v3, "noButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[PXSurveyQuestionsGadgetContentView layer](v3, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 4.0);

    -[PXSurveyQuestionsGadgetContentView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView setBackgroundColor:](v3, "setBackgroundColor:", v15);

    v16 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
    selectionFeedbackGenerator = v3->_selectionFeedbackGenerator;
    v3->_selectionFeedbackGenerator = v16;

  }
  return v3;
}

- (BOOL)isSelectionResponse
{
  void *v2;
  unsigned int v3;

  -[PXSurveyQuestionsGadgetContentView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "questionType");

  return (v3 < 0x1F) & (0x2000100u >> v3);
}

- (BOOL)isMultipleSelectionAnswerPresentation
{
  void *v2;
  BOOL v3;

  -[PXSurveyQuestionsGadgetContentView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "questionType") == 25;

  return v3;
}

- (void)updateButtonsWithAnswerState:(unint64_t)a3 reason:(id)a4
{
  uint64_t v7;
  int *v8;
  int *v9;
  uint64_t v10;
  int *v11;
  PXCapsuleButton *yesButton;
  __CFString *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_storeStrong((id *)&self->_currentReason, a4);
  v7 = 0;
  v8 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__skipButton;
  v9 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__noButton;
  v10 = 1;
  v11 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__yesButton;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      -[PXCapsuleButton setSelected:](self->_yesButton, "setSelected:", 1);
      -[PXCapsuleButton setSelected:](self->_noButton, "setSelected:", 0);
      -[PXCapsuleButton setSelected:](self->_skipButton, "setSelected:", 0);
      if (!-[PXSurveyQuestionsGadgetContentView isSelectionResponse](self, "isSelectionResponse"))
        goto LABEL_11;
      yesButton = self->_yesButton;
      v13 = CFSTR("PXInternalPhotosChallengeSelected");
      goto LABEL_10;
    case 2uLL:
      v9 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__yesButton;
      v7 = 1;
      v11 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__noButton;
      goto LABEL_6;
    case 3uLL:
      v8 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__noButton;
      v9 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__yesButton;
      v7 = 1;
      v11 = &OBJC_IVAR___PXSurveyQuestionsGadgetContentView__skipButton;
LABEL_6:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v11), "setSelected:", v7);
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v9), "setSelected:", 0);
      v10 = 0;
      goto LABEL_7;
    case 4uLL:
LABEL_7:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v8), "setSelected:", v10);
      break;
    default:
      break;
  }
  if (-[PXSurveyQuestionsGadgetContentView isSelectionResponse](self, "isSelectionResponse", v7))
  {
    yesButton = self->_yesButton;
    v13 = CFSTR("PXInternalPhotosChallengeSelect");
LABEL_10:
    PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setTitle:forState:](yesButton, "setTitle:forState:", v14, 0);

  }
LABEL_11:

}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_titleLabel;
    self->_titleLabel = v5;

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v7);

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v9);

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (PXCapsuleButton)noButton
{
  PXCapsuleButton *noButton;
  void *v4;
  void *v5;
  void *v6;
  PXCapsuleButton *v7;
  PXCapsuleButton *v8;
  PXCapsuleButton *v9;
  void *v10;
  PXCapsuleButton *v11;
  void *v12;
  PXCapsuleButton *v13;
  void *v14;

  noButton = self->_noButton;
  if (!noButton)
  {
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeNo"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView _actionButtonWithTitle:action:buttonColor:titleColor:](self, "_actionButtonWithTitle:action:buttonColor:titleColor:", v4, sel__didAnswerNo, v5, v6);
    v7 = (PXCapsuleButton *)objc_claimAutoreleasedReturnValue();
    v8 = self->_noButton;
    self->_noButton = v7;

    v9 = self->_noButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setColor:forState:](v9, "setColor:forState:", v10, 0);

    v11 = self->_noButton;
    -[PXSurveyQuestionsGadgetContentView tintColor](self, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setColor:forState:](v11, "setColor:forState:", v12, 4);

    v13 = self->_noButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setTitleColor:forState:](v13, "setTitleColor:forState:", v14, 4);

    noButton = self->_noButton;
  }
  return noButton;
}

- (PXCapsuleButton)skipButton
{
  PXCapsuleButton *skipButton;
  void *v4;
  void *v5;
  void *v6;
  PXCapsuleButton *v7;
  PXCapsuleButton *v8;
  PXCapsuleButton *v9;
  void *v10;
  PXCapsuleButton *v11;
  void *v12;
  PXCapsuleButton *v13;
  void *v14;

  skipButton = self->_skipButton;
  if (!skipButton)
  {
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeSkip"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView _actionButtonWithTitle:action:buttonColor:titleColor:](self, "_actionButtonWithTitle:action:buttonColor:titleColor:", v4, sel__didAnswerSkip, v5, v6);
    v7 = (PXCapsuleButton *)objc_claimAutoreleasedReturnValue();
    v8 = self->_skipButton;
    self->_skipButton = v7;

    v9 = self->_skipButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setColor:forState:](v9, "setColor:forState:", v10, 0);

    v11 = self->_skipButton;
    -[PXSurveyQuestionsGadgetContentView tintColor](self, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setColor:forState:](v11, "setColor:forState:", v12, 4);

    v13 = self->_skipButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setTitleColor:forState:](v13, "setTitleColor:forState:", v14, 4);

    skipButton = self->_skipButton;
  }
  return skipButton;
}

- (PXCapsuleButton)yesButton
{
  PXCapsuleButton *yesButton;
  void *v4;
  void *v5;
  void *v6;
  PXCapsuleButton *v7;
  PXCapsuleButton *v8;
  PXCapsuleButton *v9;
  void *v10;
  PXCapsuleButton *v11;
  void *v12;
  PXCapsuleButton *v13;
  void *v14;

  yesButton = self->_yesButton;
  if (!yesButton)
  {
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeYes"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView _actionButtonWithTitle:action:buttonColor:titleColor:](self, "_actionButtonWithTitle:action:buttonColor:titleColor:", v4, sel__didAnswerYes, v5, v6);
    v7 = (PXCapsuleButton *)objc_claimAutoreleasedReturnValue();
    v8 = self->_yesButton;
    self->_yesButton = v7;

    v9 = self->_yesButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setColor:forState:](v9, "setColor:forState:", v10, 0);

    v11 = self->_yesButton;
    -[PXSurveyQuestionsGadgetContentView tintColor](self, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setColor:forState:](v11, "setColor:forState:", v12, 4);

    v13 = self->_yesButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setTitleColor:forState:](v13, "setTitleColor:forState:", v14, 4);

    yesButton = self->_yesButton;
  }
  return yesButton;
}

- (void)setConfiguration:(id)a3
{
  PXSurveyQuestionConfiguration *v5;
  PXSurveyQuestionConfiguration **p_configuration;
  PXSurveyQuestionConfiguration *configuration;
  void *v8;
  void *v9;
  void *v10;
  PXSurveyQuestionConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  PXSurveyQuestionConfiguration *v20;

  v5 = (PXSurveyQuestionConfiguration *)a3;
  p_configuration = &self->_configuration;
  configuration = self->_configuration;
  if (configuration != v5)
  {
    v20 = v5;
    -[PXSurveyQuestionConfiguration contentView](configuration, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    objc_storeStrong((id *)&self->_configuration, a3);
    -[PXSurveyQuestionConfiguration title](*p_configuration, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionsGadgetContentView titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v20;
      -[PXSurveyQuestionsGadgetContentView traitCollection](self, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayScale");
      -[PXSurveyQuestionConfiguration contentViewForDisplayScale:](v11, "contentViewForDisplayScale:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[PXSurveyQuestionConfiguration contentView](*p_configuration, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 4.0);

    objc_msgSend(v13, "setClipsToBounds:", 1);
    -[PXSurveyQuestionsGadgetContentView addSubview:](self, "addSubview:", v13);
    if (-[PXSurveyQuestionsGadgetContentView isSelectionResponse](self, "isSelectionResponse"))
    {
      -[PXCapsuleButton removeFromSuperview](self->_noButton, "removeFromSuperview");
    }
    else
    {
      -[PXSurveyQuestionsGadgetContentView noButton](self, "noButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[PXSurveyQuestionsGadgetContentView noButton](self, "noButton");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSurveyQuestionsGadgetContentView addSubview:](self, "addSubview:", v17);

      }
    }
    if (-[PXSurveyQuestionsGadgetContentView isSelectionResponse](self, "isSelectionResponse"))
      v18 = CFSTR("PXInternalPhotosChallengeSelect");
    else
      v18 = CFSTR("PXInternalPhotosChallengeYes");
    PXLocalizedStringFromTable(v18, CFSTR("PhotosUICore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton setTitle:forState:](self->_yesButton, "setTitle:forState:", v19, 0);

    v5 = v20;
  }

}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D20];
  -[PXSurveyQuestionsGadgetContentView yesButton](self, "yesButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionsGadgetContentView noButton](self, "noButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionsGadgetContentView skipButton](self, "skipButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "titleForState:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v13;
        v19[1] = 3221225472;
        v19[2] = __49__PXSurveyQuestionsGadgetContentView_keyCommands__block_invoke;
        v19[3] = &unk_1E5138A90;
        v20 = v16;
        v21 = v8;
        v17 = v16;
        objc_msgSend(v15, "enumerateEventHandlers:", v19);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXSurveyQuestionsGadgetContentView _calculateLayoutWithInputSize:apply:](self, "_calculateLayoutWithInputSize:apply:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionsGadgetContentView;
  -[PXSurveyQuestionsGadgetContentView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXSurveyQuestionsGadgetContentView bounds](self, "bounds");
  -[PXSurveyQuestionsGadgetContentView _calculateLayoutWithInputSize:apply:](self, "_calculateLayoutWithInputSize:apply:", 1, v3, v4);
}

- (CGSize)_calculateLayoutWithInputSize:(CGSize)a3 apply:(BOOL)a4
{
  double height;
  double width;
  double v8;
  double v9;
  void *v10;
  CGFloat v11;
  double MaxY;
  double MaxX;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  CGFloat MidX;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double y;
  double x;
  CGFloat v55;
  CGFloat v56;
  double v57;
  double v58;
  double rect;
  CGFloat v60;
  CGSize result;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  height = a3.height;
  width = a3.width;
  v9 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXSurveyQuestionsGadgetContentView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");

  v56 = v9;
  v11 = v8;
  v60 = v8;
  -[PXSurveyQuestionsGadgetContentView _contentFrameInBounds:](self, "_contentFrameInBounds:", v9, v8, width, height);
  y = v62.origin.y;
  x = v62.origin.x;
  v51 = v62.size.height;
  v52 = v62.size.width;
  MaxY = CGRectGetMaxY(v62);
  v63.origin.x = v9;
  v63.origin.y = v11;
  v63.size.width = width;
  v63.size.height = height;
  v55 = height;
  MaxX = CGRectGetMaxX(v63);
  PXScaledValueForTextStyleWithSymbolicTraits();
  v15 = v14;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
  v17 = v16;
  -[UILabel font](self->_titleLabel, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lineHeight");
  rect = v19 + v19;

  if (v17 >= MaxX + -24.0)
    v20 = MaxX + -24.0;
  else
    v20 = v17;
  v58 = (MaxX - v20) * 0.5;
  -[UILabel font](self->_titleLabel, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ascender");
  v57 = MaxY + v15 - v22 + 16.0;

  -[PXCapsuleButton sizeThatFits:](self->_noButton, "sizeThatFits:", width, 1.79769313e308);
  v24 = v23;
  v26 = v25;
  -[PXCapsuleButton sizeThatFits:](self->_yesButton, "sizeThatFits:", width, 1.79769313e308);
  v28 = v27;
  v30 = v29;
  -[PXCapsuleButton sizeThatFits:](self->_skipButton, "sizeThatFits:", width, 1.79769313e308);
  v33 = v32;
  if (v28 >= v24)
    v34 = v28;
  else
    v34 = v24;
  if (v34 >= v31)
    v35 = v34;
  else
    v35 = v31;
  -[PXCapsuleButton superview](self->_noButton, "superview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    v37 = 3.0;
  else
    v37 = 2.0;

  v38 = fmin((width + (v37 + 1.0) * -8.0) / v37, v35);
  if (v30 >= v26)
    v39 = v30;
  else
    v39 = v26;
  if (v39 >= v33)
    v40 = v39;
  else
    v40 = v33;
  v64.origin.y = v57;
  v64.origin.x = v58;
  v64.size.width = v20;
  v64.size.height = rect;
  v41 = CGRectGetMaxY(v64) + 16.0;
  -[PXCapsuleButton superview](self->_noButton, "superview");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v65.origin.x = v56;
  v65.origin.y = v60;
  v65.size.width = width;
  v65.size.height = v55;
  MidX = CGRectGetMidX(v65);
  v44 = MidX + 4.0;
  v45 = MidX + v38 * -0.5;
  if (v42)
    v46 = v38 + v45 + 8.0;
  else
    v46 = 0.0;
  if (!v42)
    v45 = v44;
  v47 = v45 - v38 + -8.0;
  if (a4)
  {
    -[PXCapsuleButton setFrame:](self->_skipButton, "setFrame:");
    -[PXCapsuleButton setFrame:](self->_yesButton, "setFrame:", v47, v41, v38, v40);
    -[PXCapsuleButton setFrame:](self->_noButton, "setFrame:", v46, v41, v38, v40);
    PXRectRoundToPixel();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
    -[PXSurveyQuestionsGadgetContentView configuration](self, "configuration");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "layoutContentViewInRect:", x, y, v52, v51);

  }
  v66.origin.x = v56;
  v66.origin.y = v60;
  v66.size.width = width;
  v66.size.height = v55;
  CGRectGetWidth(v66);
  v67.origin.x = v47;
  v67.origin.y = v41;
  v67.size.width = v38;
  v67.size.height = v40;
  CGRectGetMaxY(v67);
  PXSizeRoundToPixel();
  result.height = v50;
  result.width = v49;
  return result;
}

- (CGRect)_contentFrameInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat MinX;
  double MinY;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = round(a3.size.width * 0.666666667);
  MinX = CGRectGetMinX(a3);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MinY = CGRectGetMinY(v13);
  v10 = MinX;
  v11 = width;
  v12 = v7;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = MinY;
  result.origin.x = v10;
  return result;
}

- (void)prepareForReuse
{
  PXSurveyQuestionDefaultConfiguration *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSurveyQuestionsGadgetContentView;
  -[PXSurveyQuestionsGadgetContentView prepareForReuse](&v4, sel_prepareForReuse);
  v3 = objc_alloc_init(PXSurveyQuestionDefaultConfiguration);
  -[PXSurveyQuestionsGadgetContentView setConfiguration:](self, "setConfiguration:", v3);

  -[PXSurveyQuestionsGadgetContentView updateButtonsWithAnswerState:reason:](self, "updateButtonsWithAnswerState:reason:", 0, 0);
}

- (CGRect)contentBoundsInCoordinateSpace:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  -[PXSurveyQuestionsGadgetContentView bounds](self, "bounds");
  -[PXSurveyQuestionsGadgetContentView _contentFrameInBounds:](self, "_contentFrameInBounds:");
  -[PXSurveyQuestionsGadgetContentView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setContentHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (self->_contentHidden != a3)
  {
    v3 = a3;
    self->_contentHidden = a3;
    -[PXSurveyQuestionsGadgetContentView configuration](self, "configuration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (id)focusEffect
{
  void *v3;
  void *v4;

  +[PXFocusInfo focusInfoWithView:](PXFocusInfo, "focusInfoWithView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeHaloEffectForSourceView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_actionButtonWithTitle:(id)a3 action:(SEL)a4 buttonColor:(id)a5 titleColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  PXCapsuleButton *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[PXCapsuleButton initWithColor:]([PXCapsuleButton alloc], "initWithColor:", v11);

  -[PXCapsuleButton setMaxContentSizeCategory:](v13, "setMaxContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
  -[PXCapsuleButton setTitle:forState:](v13, "setTitle:forState:", v12, 0);

  -[PXCapsuleButton setTitleColor:forState:](v13, "setTitleColor:forState:", v10, 0);
  -[PXCapsuleButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", self, a4, 0x2000);
  return v13;
}

- (void)_didAnswerYes
{
  -[PXSurveyQuestionsGadgetContentView _didAnswer:](self, "_didAnswer:", 1);
}

- (void)_didAnswerNo
{
  -[PXSurveyQuestionsGadgetContentView _didAnswer:](self, "_didAnswer:", 2);
}

- (void)_didAnswerSkip
{
  -[PXSurveyQuestionsGadgetContentView _didAnswer:](self, "_didAnswer:", 3);
}

- (void)_didAnswer:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[PXSurveyQuestionsGadgetContentView updateButtonsWithAnswerState:reason:](self, "updateButtonsWithAnswerState:reason:", a3, self->_currentReason);
  -[PXSurveyQuestionsGadgetContentView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionChanged");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PXSurveyQuestionsGadgetContentView__didAnswer___block_invoke;
  v6[3] = &unk_1E5138AB8;
  v6[4] = self;
  v6[5] = a3;
  -[PXSurveyQuestionsGadgetContentView _askForAdditionalReasonForAnswer:completionBlock:](self, "_askForAdditionalReasonForAnswer:completionBlock:", a3, v6);
}

- (void)_askForAdditionalReasonForAnswer:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  PXSurveyQuestionsMultipleAnswerSelectionController *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  id v40;
  void *v41;
  PXSurveyQuestionsGadgetContentView *v42;
  id obj;
  _QWORD v44[5];
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PXSurveyQuestionsGadgetContentView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PXSurveyQuestionsGadgetContentView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "gadgetContentView:additionalReasonsForAnswer:", self, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (objc_msgSend(v10, "count"))
  {
    -[PXSurveyQuestionsGadgetContentView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[PXSurveyQuestionsGadgetContentView delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "gadgetContentView:additionalReasonTitleForAnswer:", self, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonTitle"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PXSurveyQuestionsGadgetContentView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[PXSurveyQuestionsGadgetContentView delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "gadgetContentView:additionalReasonMessageForAnswer:", self, a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeAdditionalReasonMessage"), CFSTR("PhotosUICore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[PXSurveyQuestionsGadgetContentView isMultipleSelectionAnswerPresentation](self, "isMultipleSelectionAnswerPresentation"))
    {
      v19 = -[PXSurveyQuestionsMultipleAnswerSelectionController initWithTitle:message:reasons:currentlySelectedReasons:completion:]([PXSurveyQuestionsMultipleAnswerSelectionController alloc], "initWithTitle:message:reasons:currentlySelectedReasons:completion:", v14, v18, v10, self->_currentReason, v6);
    }
    else
    {
      v41 = v14;
      v42 = self;
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, v18, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = v10;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v53 != v23)
              objc_enumerationMutation(obj);
            v25 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            v26 = (void *)MEMORY[0x1E0DC3448];
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke;
            v48[3] = &unk_1E51458D0;
            v27 = v20;
            v49 = v27;
            v28 = v6;
            v50 = v25;
            v51 = v28;
            objc_msgSend(v26, "actionWithTitle:style:handler:", v25, 0, v48);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addAction:", v29);

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v22);
      }

      v30 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_2;
      v45[3] = &unk_1E5138AE0;
      v32 = v20;
      v46 = v32;
      v47 = v6;
      objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 1, v45);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "addAction:", v33);
      v19 = (PXSurveyQuestionsMultipleAnswerSelectionController *)v32;

      self = v42;
      v14 = v41;
    }
    -[PXSurveyQuestionsGadgetContentView configuration](self, "configuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handlers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "presentViewControllerHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[PXSurveyQuestionsGadgetContentView configuration](self, "configuration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handlers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "presentViewControllerHandler");
      v39 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, PXSurveyQuestionsMultipleAnswerSelectionController *))v39)[2](v39, v19);

    }
    else
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_3;
      v44[3] = &unk_1E5138B28;
      v44[4] = self;
      v40 = +[PXAlert show:](PXAlert, "show:", v44);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, 1);
  }

}

- (PXSurveyQuestionConfiguration)configuration
{
  return self->_configuration;
}

- (PXSurveyQuestionsGadgetContentViewDelegate)delegate
{
  return (PXSurveyQuestionsGadgetContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)contentHidden
{
  return self->_contentHidden;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setYesButton:(id)a3
{
  objc_storeStrong((id *)&self->_yesButton, a3);
}

- (void)setNoButton:(id)a3
{
  objc_storeStrong((id *)&self->_noButton, a3);
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_noButton, 0);
  objc_storeStrong((id *)&self->_yesButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_currentReason, 0);
}

uint64_t __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  v3 = a2;
  objc_msgSend(v3, "setTitle:", CFSTR("⚠️ Please File a Radar"));
  objc_msgSend(v3, "setMessage:", CFSTR("We are trying to track down a hard to reproduce bug. Please file a radar. Thanks!"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_4;
  v4[3] = &unk_1E5149198;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("File Radar"), 0, v4);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Cancel"), 1, &__block_literal_global_204_224053);

}

void __87__PXSurveyQuestionsGadgetContentView__askForAdditionalReasonForAnswer_completionBlock___block_invoke_4(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("Yes");
  if (!v1)
    v2 = CFSTR("No");
  v3 = v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLEASE DO NOT MODIFY\n\nDoes delegate exist: %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v4) = 1;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", CFSTR("Photos Challenge Multi Select Menu Presentation Error"), v5, CFSTR("Other Bug"), CFSTR("1064134"), CFSTR("Photos Personalization"), CFSTR("all"), 0, 0, 0, v4, 0, 0);

}

void __49__PXSurveyQuestionsGadgetContentView__didAnswer___block_invoke(uint64_t a1, void *a2, char a3)
{
  id *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v6 = (id *)(*(_QWORD *)(a1 + 32) + 648);
  if ((a3 & 1) != 0)
  {
    objc_storeStrong(v6, a2);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gadgetContentView:didAnswer:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v9);

  }
  else
  {
    v8 = *v6;
    *v6 = 0;

    objc_msgSend(*(id *)(a1 + 32), "updateButtonsWithAnswerState:reason:", 0, 0);
  }

}

void __49__PXSurveyQuestionsGadgetContentView_keyCommands__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, __int16 a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  if ((a5 & 0x2000) != 0 && objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v10 = (void *)MEMORY[0x1E0DC3930];
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "substringToIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyCommandWithInput:modifierFlags:action:", v12, 0, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
}

+ (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (sizeThatFits__onceToken != -1)
    dispatch_once(&sizeThatFits__onceToken, &__block_literal_global_224113);
  objc_msgSend((id)sizeThatFits__view, "sizeThatFits:", width, height);
  result.height = v6;
  result.width = v5;
  return result;
}

void __51__PXSurveyQuestionsGadgetContentView_sizeThatFits___block_invoke()
{
  PXSurveyQuestionsGadgetContentView *v0;
  uint64_t v1;
  void *v2;

  v0 = [PXSurveyQuestionsGadgetContentView alloc];
  v1 = -[PXSurveyQuestionsGadgetContentView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)sizeThatFits__view;
  sizeThatFits__view = v1;

}

@end
