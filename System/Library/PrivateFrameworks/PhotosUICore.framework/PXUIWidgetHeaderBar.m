@implementation PXUIWidgetHeaderBar

- (id)createView
{
  PXUIWidgetHeaderView *v3;

  v3 = objc_alloc_init(PXUIWidgetHeaderView);
  -[PXUIWidgetHeaderView setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (void)updateView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  PXUIWidgetHeaderBar *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PXUIWidgetHeaderBar;
  -[PXUIWidgetBar updateView](&v31, sel_updateView);
  -[PXWidgetBar spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInsets");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "minimumDistanceBetweenTopAndFirstAscender");
  v9 = v8;
  objc_msgSend(v3, "minimumDistanceBetweenLastDescenderAndBottom");
  v11 = v10;
  -[PXWidgetBar caption](self, "caption");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXWidgetBar disclosureTitle](self, "disclosureTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  if (v14)
  {
    v15 = v13;

    v12 = v15;
  }
  v16 = v14 != 0;
  -[PXWidgetBar view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __33__PXUIWidgetHeaderBar_updateView__block_invoke;
  v21[3] = &unk_1E5115AB8;
  v22 = v17;
  v23 = self;
  v24 = v12;
  v25 = v3;
  v30 = v16;
  v26 = v9;
  v27 = v5;
  v28 = v11;
  v29 = v7;
  v18 = v3;
  v19 = v12;
  v20 = v17;
  objc_msgSend(v20, "performChanges:", v21);

}

- (double)viewHeight
{
  void *v2;
  double v3;
  double v4;

  -[PXWidgetBar view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;

  return v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v8[5];
  objc_super v9;

  v4 = a3;
  -[PXWidgetBar title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetHeaderBar;
  -[PXWidgetBar setTitle:](&v9, sel_setTitle_, v4);
  v6 = v5;
  if (v6 == v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __32__PXUIWidgetHeaderBar_setTitle___block_invoke;
      v8[3] = &unk_1E5149198;
      v8[4] = self;
      -[PXWidgetBar performChanges:](self, "performChanges:", v8);
    }
  }

}

- (void)setSubtitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v8[5];
  objc_super v9;

  v4 = a3;
  -[PXWidgetBar subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetHeaderBar;
  -[PXWidgetBar setSubtitle:](&v9, sel_setSubtitle_, v4);
  v6 = v5;
  if (v6 == v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __35__PXUIWidgetHeaderBar_setSubtitle___block_invoke;
      v8[3] = &unk_1E5149198;
      v8[4] = self;
      -[PXWidgetBar performChanges:](self, "performChanges:", v8);
    }
  }

}

- (void)setCaption:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v8[5];
  objc_super v9;

  v4 = a3;
  -[PXWidgetBar caption](self, "caption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetHeaderBar;
  -[PXWidgetBar setCaption:](&v9, sel_setCaption_, v4);
  v6 = v5;
  if (v6 == v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __34__PXUIWidgetHeaderBar_setCaption___block_invoke;
      v8[3] = &unk_1E5149198;
      v8[4] = self;
      -[PXWidgetBar performChanges:](self, "performChanges:", v8);
    }
  }

}

- (void)setDisclosureTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v8[5];
  objc_super v9;

  v4 = a3;
  -[PXWidgetBar disclosureTitle](self, "disclosureTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetHeaderBar;
  -[PXWidgetBar setDisclosureTitle:](&v9, sel_setDisclosureTitle_, v4);
  v6 = v5;
  if (v6 == v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __42__PXUIWidgetHeaderBar_setDisclosureTitle___block_invoke;
      v8[3] = &unk_1E5149198;
      v8[4] = self;
      -[PXWidgetBar performChanges:](self, "performChanges:", v8);
    }
  }

}

- (void)setSpec:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v8[5];
  objc_super v9;

  v4 = a3;
  -[PXWidgetBar spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetHeaderBar;
  -[PXWidgetBar setSpec:](&v9, sel_setSpec_, v4);
  v6 = v5;
  if (v6 == v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __31__PXUIWidgetHeaderBar_setSpec___block_invoke;
      v8[3] = &unk_1E5149198;
      v8[4] = self;
      -[PXWidgetBar performChanges:](self, "performChanges:", v8);
    }
  }

}

uint64_t __31__PXUIWidgetHeaderBar_setSpec___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateView");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateViewHeight");
}

uint64_t __42__PXUIWidgetHeaderBar_setDisclosureTitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateView");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateViewHeight");
}

uint64_t __34__PXUIWidgetHeaderBar_setCaption___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateView");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateViewHeight");
}

uint64_t __35__PXUIWidgetHeaderBar_setSubtitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateView");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateViewHeight");
}

uint64_t __32__PXUIWidgetHeaderBar_setTitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateView");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateViewHeight");
}

uint64_t __33__PXUIWidgetHeaderBar_updateView__block_invoke(uint64_t a1)
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setCaption:", *(_QWORD *)(a1 + 48));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "primaryFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrimaryFont:", v9);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "secondaryFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryFont:", v11);

  objc_msgSend(*(id *)(a1 + 32), "setAllowUserInteractionWithCaption:", *(unsigned __int8 *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "setAllowUserInteractionWithSubtitle:", objc_msgSend(*(id *)(a1 + 40), "allowUserInteractionWithSubtitle"));
  objc_msgSend(*(id *)(a1 + 32), "setContentInsets:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v12 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 56), "shouldUseSingleLine"))
    v13 = 2;
  else
    v13 = 1;
  objc_msgSend(v12, "setLayoutStyle:", v13);
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "distanceBetweenTopAndFirstBaseline");
  objc_msgSend(v14, "setMinimumDistanceBetweenTopAndFirstBaseline:");
  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "distanceBetweenLastBaselineAndBottom");
  objc_msgSend(v15, "setMinimumDistanceBetweenLastBaselineAndBottom:");
  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "distanceBetweenTitleBaselineAndSubtitleBaseline");
  objc_msgSend(v16, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:");
  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "horizontalSpacingBetweenTitleAndSubtitle");
  return objc_msgSend(v17, "setHorizontalSpacingBetweenTitleAndSubtitle:");
}

@end
