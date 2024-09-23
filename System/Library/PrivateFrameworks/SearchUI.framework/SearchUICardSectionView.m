@implementation SearchUICardSectionView

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return objc_msgSend(a1, "fillsBackgroundWithContentForRowModel:", a3);
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)hasLeadingImageForCardSection:(id)a3
{
  return 0;
}

+ (UIEdgeInsets)separatorInsetsForStyle:(int)a3 cellView:(id)a4 leadingView:(id)a5 leadingTextView:(id)a6
{
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double MinX;
  double v16;
  void *v17;
  id v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  int v27;
  double MaxX;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  UIEdgeInsets result;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = *MEMORY[0x1E0DC49E8];
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v14 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (a3 == 5)
  {
    MinX = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  }
  else
  {
    +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
    MinX = v16;
    if (a3 == 4)
      v14 = v16;
    if (a3 != 3 && a3 != 4 || (v17 = v11) == 0)
      v17 = v10;
    v18 = v17;
    objc_msgSend(v18, "bounds");
    objc_msgSend(v18, "convertRect:toView:", v9);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v27 = objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR");
    if (v18)
    {
      if (v27)
      {
        v33.origin.x = v20;
        v33.origin.y = v22;
        v33.size.width = v24;
        v33.size.height = v26;
        MinX = CGRectGetMinX(v33);
      }
      else
      {
        objc_msgSend(v9, "bounds");
        MaxX = CGRectGetMaxX(v34);
        v35.origin.x = v20;
        v35.origin.y = v22;
        v35.size.width = v24;
        v35.size.height = v26;
        MinX = MaxX - CGRectGetMaxX(v35);
      }
    }
  }

  v29 = v12;
  v30 = MinX;
  v31 = v13;
  v32 = v14;
  result.right = v32;
  result.bottom = v31;
  result.left = v30;
  result.top = v29;
  return result;
}

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 0;
}

+ (id)dragTitleForCardSection:(id)a3
{
  return 0;
}

+ (id)dragSubtitleForCardSection:(id)a3
{
  return 0;
}

+ (BOOL)supportsCustomUserReportRequestAfforance
{
  return 0;
}

- (SearchUICardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6;
  id v7;
  SearchUICardSectionView *v8;
  SearchUICardSectionView *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SearchUICardSectionView;
  v8 = -[NUIContainerStackView initWithArrangedSubviews:](&v14, sel_initWithArrangedSubviews_, 0);
  v9 = v8;
  if (v8)
  {
    -[SearchUICardSectionView setRowModel:](v8, "setRowModel:", v6);
    -[SearchUICardSectionView setFeedbackDelegate:](v9, "setFeedbackDelegate:", v7);
    -[NUIContainerStackView setAlignment:](v9, "setAlignment:", 3);
    -[NUIContainerStackView setDistribution:](v9, "setDistribution:", 0);
    -[SearchUICardSectionView setLayoutMarginsRelativeArrangement:](v9, "setLayoutMarginsRelativeArrangement:", 1);
    -[SearchUICardSectionView setupContentView](v9, "setupContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardSectionView setContentView:](v9, "setContentView:", v10);

    -[SearchUICardSectionView contentView](v9, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SearchUICardSectionView contentView](v9, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICardSectionView addArrangedSubview:](v9, "addArrangedSubview:", v12);

    }
    -[SearchUICardSectionView updateWithRowModel:](v9, "updateWithRowModel:", v6);
    -[SearchUICardSectionView updateChevronVisible:leaveSpaceForChevron:](v9, "updateChevronVisible:leaveSpaceForChevron:", 0, 0);
    -[SearchUICardSectionView setDelegate:](v9, "setDelegate:", v9);
    objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v9);
  }

  return v9;
}

- (SearchUICardSectionView)initWithFrame:(CGRect)a3
{
  return -[SearchUICardSectionView initWithRowModel:feedbackDelegate:](self, "initWithRowModel:feedbackDelegate:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SearchUICardSectionView)initWithArrangedSubviews:(id)a3
{
  return -[SearchUICardSectionView initWithRowModel:feedbackDelegate:](self, "initWithRowModel:feedbackDelegate:", 0, 0);
}

- (id)setupContentView
{
  return 0;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double width;
  void *v6;
  id v7;

  if (a3 == self)
  {
    width = a4.width;
    v6 = (void *)MEMORY[0x1E0DBD9B0];
    v7 = a3;
    objc_msgSend(v7, "setIsCompactWidth:", objc_msgSend(v6, "widthIsCompact:", width));

  }
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double *v7;
  double v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  double v13;
  char v14;
  double v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  int v29;
  double v30;
  double v31;

  v4 = a4;
  v5 = a3;
  v7 = (double *)MEMORY[0x1E0DC49E8];
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[SearchUICardSectionView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[SearchUICardSectionView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "layoutMargins");
  }
  else
  {
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    v15 = v8;
    if ((v14 & 1) == 0)
      goto LABEL_6;
    -[SearchUICardSectionView contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "effectiveLayoutMargins");
  }
  v15 = v13;

LABEL_6:
  -[NUIContainerStackView setSpacing:](self, "setSpacing:", 10.0 - v15);
  v16 = !v5 && !v4;
  -[SearchUICardSectionView chevronView](self, "chevronView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", v16);

  if (v16)
  {
    v23 = *v7;
    v24 = v7[1];
    v28 = 0.0;
    v25 = v7[2];
  }
  else
  {
    -[SearchUICardSectionView chevronView](self, "chevronView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      +[SearchUISymbolImage chevronImage](SearchUISymbolImage, "chevronImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIImageView imageViewWithImage:](SearchUIImageView, "imageViewWithImage:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setProminence:", 2);
      -[SearchUICardSectionView setChevronView:](self, "setChevronView:", v20);
      +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v20);
      -[SearchUICardSectionView addArrangedSubview:](self, "addArrangedSubview:", v20);

    }
    v21 = (double)v5;
    -[SearchUICardSectionView chevronView](self, "chevronView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlpha:", v21);

    v23 = *v7;
    v24 = v7[1];
    v25 = v7[2];
    -[SearchUICardSectionView chevronView](self, "chevronView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardSectionView trailingMarginForAccessory:](self, "trailingMarginForAccessory:", v26);
    v28 = v27;

  }
  v29 = objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR");
  if (v29)
    v30 = v28;
  else
    v30 = v8;
  if (v29)
    v31 = v24;
  else
    v31 = v28;
  -[SearchUICardSectionView setLayoutMargins:](self, "setLayoutMargins:", v23, v31, v25, v30);
}

- (double)trailingMarginForAccessory:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "intrinsicContentSize");
  v5 = v4;
  +[SearchUIUtilities imageAccessoryAdditionalCompactHorizontalMargin](SearchUIUtilities, "imageAccessoryAdditionalCompactHorizontalMargin");
  v7 = v6;
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
    v12 = v13;
    goto LABEL_7;
  }
  v10 = objc_msgSend(v8, "useCompactVersionOfUI");

  if (!v10 || (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) != 0)
    goto LABEL_6;
  +[SearchUIUtilities standardCompactHorizontalMargin](SearchUIUtilities, "standardCompactHorizontalMargin");
  v12 = v7 + v5 * -0.5 + v11;
LABEL_7:

  return v12;
}

- (SFCardSection)section
{
  void *v2;
  void *v3;

  -[SearchUICardSectionView rowModel](self, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFCardSection *)v3;
}

- (void)updateWithRowModel:(id)a3
{
  -[SearchUICardSectionView setRowModel:](self, "setRowModel:", a3);
  -[SearchUICardSectionView setUserReportMenu:](self, "setUserReportMenu:", 0);
}

- (void)openPunchout:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v12 = (id)objc_opt_new();
  objc_msgSend(v12, "setPunchout:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCommand:", v12);
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeWithTriggerEvent:", a4);

}

- (void)didInvalidateSizeAnimate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  char v8;
  id v9;

  v3 = a3;
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "cardSectionViewDidInvalidateSize:animate:", self, v3);
  }
  else
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
      return;
    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionViewDidInvalidateSize:", self);
  }

}

- (void)requestRemovalFromEnclosingView
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardSectionView rowModel](self, "rowModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeRowModel:completion:", v6, 0);

  }
  -[SearchUICardSectionView didInvalidateSizeAnimate:](self, "didInvalidateSizeAnimate:", 1);
}

- (BOOL)configureUserReportButton:(id)a3
{
  SearchUICardSectionView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SearchUICardSectionView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = (SearchUICardSectionView *)a3;
  -[SearchUICardSectionView userReportMenu](self, "userReportMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "setCommand:", v7);

    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v10 = v4;
    else
      v10 = self;
    objc_msgSend(v9, "setSourceView:", v10);
    -[SearchUICardSectionView rowModel](self, "rowModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v6, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "prefersContextMenu"))
    {
      objc_msgSend(v12, "contextMenu");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICardSectionView setUserReportMenu:](self, "setUserReportMenu:", v13);

    }
  }
  -[SearchUICardSectionView userReportMenu](self, "userReportMenu");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "children");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
    -[SearchUICardSectionView setMenu:](v4, "setMenu:", v14);

  return v16 != 0;
}

- (BOOL)highlightFrameMatchesHighlightView
{
  return 1;
}

- (double)highlightFrameCornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SearchUICardSectionView highlightReferenceView](self, "highlightReferenceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;

  return v5;
}

- (UIView)highlightReferenceView
{
  return 0;
}

- (BOOL)needsInternalFocus
{
  return 0;
}

- (BOOL)setupManualFocus
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)SearchUICardSectionView;
  -[SearchUICardSectionView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICardSectionView section](self, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\t %@"), v6);

  return (NSString *)v5;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (SearchUICardSectionRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
  objc_storeStrong((id *)&self->_rowModel, a3);
}

- (UIViewController)embeddedViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 736, 1);
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (BOOL)isCompactWidth
{
  return self->_isCompactWidth;
}

- (void)setIsCompactWidth:(BOOL)a3
{
  self->_isCompactWidth = a3;
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (UIView)leadingTextView
{
  return self->_leadingTextView;
}

- (UIView)viewForForcedFocus
{
  return self->_viewForForcedFocus;
}

- (UIView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (UIMenu)userReportMenu
{
  return self->_userReportMenu;
}

- (void)setUserReportMenu:(id)a3
{
  objc_storeStrong((id *)&self->_userReportMenu, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userReportMenu, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_viewForForcedFocus, 0);
  objc_storeStrong((id *)&self->_leadingTextView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_storeStrong((id *)&self->_embeddedViewController, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
