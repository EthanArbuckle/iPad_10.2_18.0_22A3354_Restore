@implementation SearchUIScoreSummaryCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return 5;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "disableUnbatchedUpdates");
  -[SearchUIScoreSummaryCardSectionView setSplitHeaderView:](self, "setSplitHeaderView:", v3);
  -[SearchUIScoreSummaryCardSectionView splitHeaderView](self, "splitHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setHorizontalAlignment:", 3);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v5, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v5, "addArrangedSubview:", v3);

  return v5;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  SearchUIScoreSummaryCardSectionView *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SearchUIScoreSummaryCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v13, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIScoreSummaryCardSectionView splitHeaderView](self, "splitHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SearchUIScoreSummaryCardSectionView_updateWithRowModel___block_invoke;
  v9[3] = &unk_1EA1F6518;
  v10 = v5;
  v11 = v6;
  v12 = self;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v7, "performBatchUpdates:", v9);

}

void __58__SearchUIScoreSummaryCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "team1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "score");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v9 = 0;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "team2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {

    objc_msgSend(*(id *)(a1 + 32), "team1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "score");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "team2");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "score");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = CFSTR("–");
LABEL_5:

    goto LABEL_7;
  }
  v9 = 0;
  v3 = 0;
LABEL_7:
  +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v49);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setTitle:", v10);

  objc_msgSend(*(id *)(a1 + 40), "setCenterLeadingTitle:", v3);
  objc_msgSend(*(id *)(a1 + 40), "setCenterTrailingTitle:", v9);
  objc_msgSend(*(id *)(a1 + 32), "team1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "score");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "team2");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "score");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setUseLargeTitle:", v14 != 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setUseLargeTitle:", 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSubtitle1:", v16);

  objc_msgSend(*(id *)(a1 + 32), "eventStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSubtitle2:", v18);

  objc_msgSend(*(id *)(a1 + 32), "eventStatus");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subtitle1");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMaxLines:", v19 != 0);

  objc_msgSend(*(id *)(a1 + 40), "setShouldBadgeSubtitle:", 1);
  objc_msgSend(*(id *)(a1 + 32), "team1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLeadingImage:", v23);

  v24 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "team1");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "button");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setIsLeadingButtonEnabled:", objc_msgSend(v24, "hasCommandForButtonItem:", v26));

  objc_msgSend(*(id *)(a1 + 32), "team2");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "logo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setTrailingImage:", v29);

  v30 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "team2");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "button");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setIsTrailingButtonEnabled:", objc_msgSend(v30, "hasCommandForButtonItem:", v32));

  objc_msgSend(*(id *)(a1 + 32), "team1");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLeadingTitle:", v35);

  objc_msgSend(*(id *)(a1 + 32), "team2");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setTrailingTitle:", v38);

  objc_msgSend(*(id *)(a1 + 32), "team1");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "record");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v40, "isEqualToString:", CFSTR(" ")) & 1) != 0)
  {
    v41 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "team1");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "record");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "team2");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "record");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v44, "isEqualToString:", CFSTR(" ")) & 1) != 0)
  {
    v45 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "team2");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "record");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v41);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLeadingSubtitle:", v47);

  +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v45);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setTrailingSubtitle:", v48);

}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  _BOOL8 v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIScoreSummaryCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v8, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, a3, a5, a4.width, a4.height);
  v6 = -[SearchUICardSectionView isCompactWidth](self, "isCompactWidth");
  -[SearchUIScoreSummaryCardSectionView splitHeaderView](self, "splitHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseCompactWidth:", v6);

}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v8 = a5;
  -[SearchUIScoreSummaryCardSectionView splitHeaderView](self, "splitHeaderView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    v12 = +[SearchUIUtilities isLargeIpad](SearchUIUtilities, "isLargeIpad");
    v13 = 406.0;
    if (width <= 406.0)
      v13 = width;
    if (v12 && width > 474.0)
      v11 = 474.0;
    else
      v11 = v13;
    objc_msgSend(v8, "effectiveLayoutSizeFittingSize:", v11, height);
    v10 = v14;
  }
  else
  {
    v11 = *MEMORY[0x1E0CFAA88];
    v10 = *(double *)(MEMORY[0x1E0CFAA88] + 8);
  }

  v15 = v11;
  v16 = v10;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUIScoreSummaryCardSectionView;
  -[SearchUICardSectionView updateChevronVisible:leaveSpaceForChevron:](&v4, sel_updateChevronVisible_leaveSpaceForChevron_, 0, 0);
}

+ (id)titleForScoreBoard:(id)a3 forDisplay:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "team1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "team2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "score");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "score");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v6, "record");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v7, "record");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;

  }
  else
  {
    v13 = 0;
  }

  if (v4)
  {
    if (!v10)
    {
LABEL_22:
      objc_msgSend(v5, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    objc_msgSend(v6, "score");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("%@–%@");
    if ((unint64_t)objc_msgSend(v14, "length") <= 2)
    {
      objc_msgSend(v7, "score");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v16, "length") <= 2)
        v15 = CFSTR("%@ – %@");

    }
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "score");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "score");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v15, v18, v19);
    goto LABEL_20;
  }
  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "score");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "score");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@, %@ – %@, %@\n %@"), v18, v19, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
    goto LABEL_21;
  }
  if (v13)
  {
    objc_msgSend(v6, "record");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "record");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@, %@ – %@, %@"), v18, v19, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(v7, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ – %@"), v18, v19);
LABEL_20:
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  if (!v24)
    goto LABEL_22;
LABEL_23:

  return v24;
}

+ (id)dragTitleForCardSection:(id)a3
{
  return (id)objc_msgSend(a1, "titleForScoreBoard:forDisplay:", a3, 0);
}

- (void)didPressLeadingButtonForSplitHeader:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SearchUICardSectionView rowModel](self, "rowModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "team1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIScoreSummaryCardSectionView performCommandForButtonItem:](self, "performCommandForButtonItem:", v6);

}

- (void)didPressTrailingButtonForSplitHeader:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SearchUICardSectionView rowModel](self, "rowModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "team2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIScoreSummaryCardSectionView performCommandForButtonItem:](self, "performCommandForButtonItem:", v6);

}

- (BOOL)hasCommandForButtonItem:(id)a3
{
  void *v3;
  BOOL v4;

  -[SearchUIScoreSummaryCardSectionView commandForButtonItem:](self, "commandForButtonItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)performCommandForButtonItem:(id)a3
{
  uint64_t v3;
  id v4;

  -[SearchUIScoreSummaryCardSectionView commandForButtonItem:](self, "commandForButtonItem:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
      v3 = 3;
    else
      v3 = 2;
    objc_msgSend(v4, "executeWithTriggerEvent:", v3);
  }

}

- (id)commandForButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TLKSplitHeaderView)splitHeaderView
{
  return self->_splitHeaderView;
}

- (void)setSplitHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_splitHeaderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitHeaderView, 0);
}

@end
