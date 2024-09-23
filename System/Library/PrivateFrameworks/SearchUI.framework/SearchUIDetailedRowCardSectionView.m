@implementation SearchUIDetailedRowCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)supportsCustomUserReportRequestAfforance
{
  return 0;
}

- (id)setupContentView
{
  SearchUIDetailedView *v3;
  void *v4;
  SearchUIDetailedView *v5;

  v3 = [SearchUIDetailedView alloc];
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SearchUIDetailedView initWithFeedbackDelegate:](v3, "initWithFeedbackDelegate:", v4);

  -[SearchUIDetailedView setButtonDelegate:](v5, "setButtonDelegate:", self);
  return v5;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  _BOOL8 v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIDetailedRowCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v8, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, a3, a5, a4.width, a4.height);
  v6 = -[SearchUICardSectionView isCompactWidth](self, "isCompactWidth");
  -[SearchUICardSectionView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsCompactWidth:", v6);

}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIDetailedRowCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v8, sel_updateWithRowModel_, v4);
  -[SearchUICardSectionView contentView](self, "contentView", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithRowModel:", v4);

  LODWORD(v5) = objc_msgSend(v4, "useCompactVersionOfUI");
  if ((_DWORD)v5)
  {
    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    {
      objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", self);
      v6 = (void *)MEMORY[0x1E0DBDA50];
      -[SearchUICardSectionView contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "makeContainerShadowCompatible:", v7);

    }
  }
}

- (void)setFeedbackDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIDetailedRowCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView setFeedbackDelegate:](&v6, sel_setFeedbackDelegate_, v4);
  -[SearchUICardSectionView contentView](self, "contentView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackDelegate:", v4);

}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v16;

  v4 = a4;
  v5 = a3;
  -[SearchUICardSectionView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAccessoryViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v11 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    -[SearchUICardSectionView rowModel](self, "rowModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "useCompactVersionOfUI"))
    {
      v11 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isHidden") ^ 1;

  if ((isKindOfClass & 1) != 0)
LABEL_8:

LABEL_9:
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "buttonItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    -[SearchUICardSectionView rowModel](self, "rowModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "buttonItemsAreTrailing") ^ 1;

  }
  else
  {
    v15 = 1;
  }

  v16.receiver = self;
  v16.super_class = (Class)SearchUIDetailedRowCardSectionView;
  -[SearchUICardSectionView updateChevronVisible:leaveSpaceForChevron:](&v16, sel_updateChevronVisible_leaveSpaceForChevron_, v5 & ~v11 & v15, v4);

}

- (id)leadingView
{
  void *v2;
  void *v3;

  -[SearchUICardSectionView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leadingTextView
{
  void *v2;
  void *v3;

  -[SearchUICardSectionView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewForQuickLookZoomTransitionSource
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[SearchUIDetailedRowCardSectionView leadingView](self, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowCardSectionView findDescendentOfView:matchingClass:](self, "findDescendentOfView:matchingClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIDetailedRowCardSectionView;
    -[SearchUICardSectionView viewForQuickLookZoomTransitionSource](&v9, sel_viewForQuickLookZoomTransitionSource);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)findDescendentOfView:(id)a3 matchingClass:(Class)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v6, "subviews", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[SearchUIDetailedRowCardSectionView findDescendentOfView:matchingClass:](self, "findDescendentOfView:matchingClass:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), a4);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v7 = (id)v13;

            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
LABEL_13:

  return v7;
}

@end
