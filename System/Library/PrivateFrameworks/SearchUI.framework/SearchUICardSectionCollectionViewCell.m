@implementation SearchUICardSectionCollectionViewCell

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SearchUICardSectionCollectionViewCell;
  -[SearchUICollectionViewCell updateWithRowModel:](&v25, sel_updateWithRowModel_, v4);
  if (!+[SearchUIContentConfigurator supportsConfigurationFor:](SearchUIContentConfigurator, "supportsConfigurationFor:", v4))
  {
    -[SearchUICollectionViewCell setUseSystemSizing:](self, "setUseSystemSizing:", 0);
    -[SearchUICardSectionCollectionViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClipsToBounds:", 0);

    -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateWithRowModel:", v4);
    }
    else
    {
      -[SearchUICollectionViewCell delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUICardSectionCreator cardSectionViewForModel:feedbackDelegate:](SearchUICardSectionCreator, "cardSectionViewForModel:feedbackDelegate:", v4, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICardSectionCollectionViewCell setCardSectionView:](self, "setCardSectionView:", v10);

      -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_8:
        objc_msgSend(v4, "minimumLayoutSize");
        v21 = v20;
        v23 = v22;
        -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setMinimumLayoutSize:", v21, v23);

        goto LABEL_9;
      }
      v12 = objc_alloc(MEMORY[0x1E0CFAA98]);
      -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithArrangedSubviews:", v14);
      -[SearchUICardSectionCollectionViewCell setBoxView:](self, "setBoxView:", v15);

      -[SearchUICardSectionCollectionViewCell boxView](self, "boxView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);

      -[SearchUICardSectionCollectionViewCell boxView](self, "boxView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setVerticalAlignment:", 1);

      -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);

      -[SearchUICardSectionCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICardSectionCollectionViewCell boxView](self, "boxView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v19);

    }
    goto LABEL_8;
  }
  +[SearchUIContentConfigurator applyConfigurationTo:rowModel:interactionDelegate:](SearchUIContentConfigurator, "applyConfigurationTo:rowModel:interactionDelegate:", self, v4, self);
  -[SearchUICardSectionCollectionViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  -[SearchUICollectionViewCell setUseSystemSizing:](self, "setUseSystemSizing:", 1);
LABEL_9:

}

- (id)embeddedViewController
{
  void *v2;
  void *v3;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICardSectionCollectionViewCell;
  v4 = a3;
  -[SearchUICollectionViewCell setDelegate:](&v6, sel_setDelegate_, v4);
  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackDelegate:", v4);

}

- (id)sizingView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SearchUICardSectionCollectionViewCell boxView](self, "boxView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SearchUICardSectionCollectionViewCell contentView](self, "contentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateChevronVisible:leaveSpaceForChevron:", v5, v4);

}

- (id)leadingView
{
  void *v2;
  void *v3;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leadingTextView
{
  void *v2;
  void *v3;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)needsInternalFocus
{
  void *v2;
  char v3;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsInternalFocus");

  return v3;
}

- (BOOL)setupManualFocus
{
  void *v2;
  char v3;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "setupManualFocus");

  return v3;
}

- (void)removeManualFocus
{
  id v2;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeManualFocus");

}

- (id)rowModelForCustomHighlightBehavior
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_4;
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportsCustomHighlightBehavior") & 1) == 0)
  {

LABEL_4:
    v5 = 0;
  }
  return v5;
}

- (CGRect)highlightFrame
{
  void *v3;
  void *v4;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  -[SearchUICardSectionCollectionViewCell rowModelForCustomHighlightBehavior](self, "rowModelForCustomHighlightBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SearchUICardSectionCollectionViewCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v3, "intrinsicContentInset");
    +[SearchUIAutoLayout rect:insettedBy:isLTR:](SearchUIAutoLayout, "rect:insettedBy:isLTR:", -[SearchUICardSectionCollectionViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0, v6, v8, v10, v12, v13, v14, v15, v16);
  }
  else
  {
    -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "highlightFrame");
  }
  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;

  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)highlightFrameCornerRadius
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  -[SearchUICardSectionCollectionViewCell rowModelForCustomHighlightBehavior](self, "rowModelForCustomHighlightBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "highlightReferenceFrameCornerRadius");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUICardSectionCollectionViewCell;
    -[SearchUICollectionViewCell highlightFrameCornerRadius](&v8, sel_highlightFrameCornerRadius);
  }
  v6 = v5;

  return v6;
}

- (id)highlightReferenceView
{
  void *v2;
  void *v3;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightReferenceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)highlightFrameMatchesHighlightView
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "highlightFrameMatchesHighlightView"))
  {
    -[SearchUICardSectionCollectionViewCell rowModelForCustomHighlightBehavior](self, "rowModelForCustomHighlightBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)returnKeyPressed
{
  id v2;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "returnKeyPressed");

}

- (id)viewForForcedFocus
{
  void *v2;
  void *v3;

  -[SearchUICardSectionCollectionViewCell cardSectionView](self, "cardSectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForForcedFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsForProposedInsets:(NSDirectionalEdgeInsets)a3
{
  double leading;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  NSDirectionalEdgeInsets result;

  leading = a3.leading;
  v20.receiver = self;
  v20.super_class = (Class)SearchUICardSectionCollectionViewCell;
  -[SearchUICollectionViewCell _preferredSeparatorInsetsForProposedInsets:](&v20, sel__preferredSeparatorInsetsForProposedInsets_, a3.top, a3.leading, a3.bottom, a3.trailing);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cardSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SnippetUIUtilities supportsConfigurationForCardSection:](SnippetUIUtilities, "supportsConfigurationForCardSection:", v14))
  {
    v15 = -[SearchUICollectionViewCell sfSeparatorStyle](self, "sfSeparatorStyle");

    if (v15 == 3)
      v8 = leading;
  }
  else
  {

  }
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v19 = v12;
  result.trailing = v19;
  result.bottom = v18;
  result.leading = v17;
  result.top = v16;
  return result;
}

- (void)createStyledButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 :(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewCell delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities createViewControllersForButtons:buttonFont:isCompact:sourceView:rowModel:delegate:completionHandler:](SnippetUIUtilities, "createViewControllersForButtons:buttonFont:isCompact:sourceView:rowModel:delegate:completionHandler:", v12, v11, v6, self, v14, v13, v10);

}

- (void)performSFCommand:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities performSFCommand:rowModel:delegate:](SnippetUIUtilities, "performSFCommand:rowModel:delegate:", v4, v6, v5);

}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUICollectionViewCell delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities emitInstrumentationEvent:delegate:](SnippetUIUtilities, "emitInstrumentationEvent:delegate:", v4, v5);

}

- (void)reportSFFeedback:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "queryId");
  -[SearchUICollectionViewCell delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities reportFeedback:queryId:delegate:](SnippetUIUtilities, "reportFeedback:queryId:delegate:", v4, v5, v6);

}

- (id)presentingViewController
{
  void *v3;
  void *v4;

  -[SearchUICollectionViewCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities presentingViewController:delegate:](SnippetUIUtilities, "presentingViewController:delegate:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SearchUICardSectionView)cardSectionView
{
  return (SearchUICardSectionView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setCardSectionView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (NUIContainerBoxView)boxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setBoxView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxView, 0);
  objc_storeStrong((id *)&self->_cardSectionView, 0);
}

@end
