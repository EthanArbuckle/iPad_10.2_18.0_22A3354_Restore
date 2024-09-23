@implementation SearchUICommandCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (SearchUICommandCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6;
  SearchUICommandCardSectionView *v7;
  SearchUICommandCardSectionView *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUICommandCardSectionView;
  v7 = -[SearchUICardSectionView initWithRowModel:feedbackDelegate:](&v10, sel_initWithRowModel_feedbackDelegate_, v6, a4);
  v8 = v7;
  if (v7)
    -[SearchUICommandCardSectionView fetchStateForNewRowModel:](v7, "fetchStateForNewRowModel:", v6);

  return v8;
}

- (id)setupContentView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SearchUICommandCardSectionView setRowView:](self, "setRowView:", v3);

  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[SearchUICommandCardSectionView rowView](self, "rowView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayoutMargins:", v4, v5, v6, v7);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setSymbolName:", CFSTR("clock.badge.fill"));
  objc_msgSend(v9, "setIsTemplate:", 1);
  +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", 2);
  objc_msgSend(v9, "setSize:");
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setProminence:", 0);
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTlkImage:", v11);

  +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v10);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setSymbolName:", CFSTR("checkmark"));
  objc_msgSend(v12, "setIsTemplate:", 1);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setProminence:", 0);
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTlkImage:", v14);

  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSymbolFont:", v15);

  objc_msgSend(v13, "setSymbolWeight:", 6);
  +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v13);
  -[SearchUICommandCardSectionView setCheckmarkImageView:](self, "setCheckmarkImageView:", v13);
  v16 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  -[SearchUICommandCardSectionView rowView](self, "rowView", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v17;
  v24[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithArrangedSubviews:", v18);

  objc_msgSend(v19, "setAlignment:", 3);
  objc_msgSend(v19, "setSpacing:", 10.0);
  objc_msgSend(v19, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  v21 = v20;
  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  objc_msgSend(v19, "setDirectionalLayoutMargins:", 0.0, v21, 0.0);
  -[SearchUICommandCardSectionView layer](self, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAllowsGroupOpacity:", 0);

  return v19;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)SearchUICommandCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v12, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandCardSectionView rowView](self, "rowView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeadingTitle:", v6);

  objc_msgSend(v4, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandCardSectionView rowView](self, "rowView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeadingSubtitle:", v8);

  v10 = objc_msgSend(v4, "toggled") ^ 1;
  -[SearchUICommandCardSectionView checkmarkImageView](self, "checkmarkImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v10);

  if (v5 != v4)
    -[SearchUICommandCardSectionView fetchStateForNewRowModel:](self, "fetchStateForNewRowModel:", v4);

}

- (void)fetchStateForNewRowModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SearchUICommandCardSectionView *v9;

  v4 = a3;
  -[SearchUICommandCardSectionView setAlpha:](self, "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke;
  v7[3] = &unk_1EA1F6210;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_2;
  v5[3] = &unk_1EA1F63E0;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v3, "checkIfCommandIsValidWithCompletionHandler:", v5);

}

void __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_2(uint64_t a1, char a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_3;
  v6[3] = &unk_1EA1F63B8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  v9 = a2;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v6);

}

void __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "updateStateWithCommandCardSectionView:", *(_QWORD *)(a1 + 40));
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_4;
      v4[3] = &unk_1EA1F62F0;
      v4[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0DBDA48], "performAnimatableChanges:", v4);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "requestRemovalFromEnclosingView");
    }
  }
}

uint64_t __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (TLKSimpleRowView)rowView
{
  return self->_rowView;
}

- (void)setRowView:(id)a3
{
  objc_storeStrong((id *)&self->_rowView, a3);
}

- (UIView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_rowView, 0);
}

@end
