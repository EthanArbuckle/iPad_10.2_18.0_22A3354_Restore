@implementation SearchUIAppIconCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SearchUIAppIconCardSectionView;
  -[NUIContainerStackView dealloc](&v4, sel_dealloc);
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_willRemoveIcon_, *MEMORY[0x1E0DAAA20], 0);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setHidden:", 1);
  -[SearchUIAppIconCardSectionView setFolderLabelView:](self, "setFolderLabelView:", v4);
  v5 = (void *)objc_opt_new();
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackDelegate:", v6);

  objc_msgSend(v5, "setEngagementDelegate:", self);
  if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
    v7 = 4;
  else
    v7 = 5;
  objc_msgSend(v5, "setVariant:", v7);
  objc_msgSend(v5, "setClipsToBounds:", 0);
  -[SearchUIAppIconCardSectionView setAppIconView:](self, "setAppIconView:", v5);
  v8 = (void *)MEMORY[0x1E0CFAA98];
  v12[0] = v5;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerBoxViewWithArrangedSubviews:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setVerticalAlignment:", 3);
  objc_msgSend(v10, "setHorizontalAlignment:", 3);
  objc_msgSend(v10, "setAlignment:forView:inAxis:", 4, v4, 0);
  +[SearchUIAppIconUtilities appIconItemSize](SearchUIAppIconUtilities, "appIconItemSize");
  objc_msgSend(v10, "setMinimumLayoutSize:");
  objc_msgSend(v10, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v10, "setDelegate:", self);

  return v10;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SearchUIAppIconCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v15, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "identifyingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "auxiliaryTopText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v4, "shouldFillAvailableSpace");

  if (!v7)
  {
LABEL_5:
    -[SearchUIAppIconCardSectionView folderLabelView](self, "folderLabelView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTopText:", 0);
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x1E0DBD9D8];
  objc_msgSend(v4, "identifyingResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auxiliaryTopText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAppIconCardSectionView folderLabelView](self, "folderLabelView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTopText:", v11);

LABEL_6:
  -[SearchUIAppIconCardSectionView appIconView](self, "appIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateWithRowModel:", v4);

  -[SearchUICardSectionView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutBelowIfNeeded");

}

- (void)willRemoveIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DAABC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUICardSectionView rowModel](self, "rowModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "applicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", v12))
    goto LABEL_4;
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardSectionView rowModel](self, "rowModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeRowModel:completion:", v11, 0);

LABEL_4:
  }

}

- (BOOL)needsInternalFocus
{
  return 1;
}

- (BOOL)setupManualFocus
{
  void *v2;

  -[SearchUIAppIconCardSectionView appIconView](self, "appIconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAddRoundedKeyboardHighlight:", 1);

  return 1;
}

- (void)removeManualFocus
{
  id v2;

  -[SearchUIAppIconCardSectionView appIconView](self, "appIconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAddRoundedKeyboardHighlight:", 0);

}

- (void)returnKeyPressed
{
  id v2;

  -[SearchUIAppIconCardSectionView appIconView](self, "appIconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchIcon");

}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didUpdateKeyboardFocusToResult:cardSection:", v10, v6);

  }
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double height;
  double width;
  SearchUIAppIconCardSectionView *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  height = a4.height;
  width = a4.width;
  v9 = (SearchUIAppIconCardSectionView *)a3;
  if (self == v9)
  {
    -[SearchUICardSectionView rowModel](self, "rowModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "sectionType");

    if (v11 == 1)
    {
      v12 = width
          / (double)+[SearchUIAppIconUtilities numberOfAppIconsPerRow](SearchUIAppIconUtilities, "numberOfAppIconsPerRow");
      -[SearchUIAppIconCardSectionView appIconView](self, "appIconView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "intrinsicContentSize");
      v15 = (v12 - v14) * 0.5;

      +[SearchUIAppIconUtilities distanceToTopOfAppIconsForMultiResultCell](SearchUIAppIconUtilities, "distanceToTopOfAppIconsForMultiResultCell");
      v17 = v16;
      -[SearchUICardSectionView contentView](self, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v15 >= 0.0)
        v20 = v15;
      else
        v20 = 0.0;
      if (v15 > 0.0)
        v21 = 1;
      else
        v21 = 3;
      objc_msgSend(v18, "setDirectionalLayoutMargins:", v17, v20, v17, v20);

      -[SearchUIAppIconCardSectionView folderLabelView](self, "folderLabelView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setHidden:", v15 <= 0.0);

      -[SearchUICardSectionView contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIAppIconCardSectionView folderLabelView](self, "folderLabelView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAlignment:forView:inAxis:", 4, v24, 0);

      -[SearchUICardSectionView contentView](self, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIAppIconCardSectionView appIconView](self, "appIconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAlignment:forView:inAxis:", v21, v26, 0);

    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SearchUIAppIconCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v27, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, v9, a5, width, height);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIAppIconCardSectionView;
  -[SearchUIAppIconCardSectionView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDescendantOfView:", self))
  {
    -[SearchUIAppIconCardSectionView appIconView](self, "appIconView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (SearchUIHomeScreenAppIconView)appIconView
{
  return (SearchUIHomeScreenAppIconView *)objc_getProperty(self, a2, 792, 1);
}

- (void)setAppIconView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (TLKAuxilliaryTextView)folderLabelView
{
  return (TLKAuxilliaryTextView *)objc_getProperty(self, a2, 800, 1);
}

- (void)setFolderLabelView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderLabelView, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
}

@end
