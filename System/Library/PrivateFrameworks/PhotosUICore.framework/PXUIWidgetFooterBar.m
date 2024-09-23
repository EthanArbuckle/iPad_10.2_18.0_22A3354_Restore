@implementation PXUIWidgetFooterBar

- (id)createView
{
  PXUIWidgetFooterView *v3;

  v3 = objc_alloc_init(PXUIWidgetFooterView);
  -[PXUIWidgetFooterView setDelegate:](v3, "setDelegate:", self);
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
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PXUIWidgetFooterBar *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PXUIWidgetFooterBar;
  -[PXUIWidgetBar updateView](&v23, sel_updateView);
  -[PXWidgetBar spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInsets");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "minimumDistanceBetweenTopAndFirstAscender");
  v9 = v8;
  objc_msgSend(v3, "minimumDistanceBetweenLastDescenderAndBottom");
  v11 = v10;
  -[PXWidgetBar view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33__PXUIWidgetFooterBar_updateView__block_invoke;
  v15[3] = &unk_1E5144810;
  v16 = v12;
  v17 = self;
  v18 = v3;
  v19 = v9;
  v20 = v5;
  v21 = v11;
  v22 = v7;
  v13 = v3;
  v14 = v12;
  objc_msgSend(v14, "performChanges:", v15);

}

- (double)viewHeight
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[PXWidgetBar disclosureTitle](self, "disclosureTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0.0;
  -[PXWidgetBar spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distanceBetweenTopAndFirstBaseline");
  v7 = v6;
  -[PXWidgetBar spec](self, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "distanceBetweenLastBaselineAndBottom");
  v10 = v7 + v9;

  return v10;
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
  v9.super_class = (Class)PXUIWidgetFooterBar;
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
      v8[2] = __42__PXUIWidgetFooterBar_setDisclosureTitle___block_invoke;
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
  v9.super_class = (Class)PXUIWidgetFooterBar;
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
      v8[2] = __31__PXUIWidgetFooterBar_setSpec___block_invoke;
      v8[3] = &unk_1E5149198;
      v8[4] = self;
      -[PXWidgetBar performChanges:](self, "performChanges:", v8);
    }
  }

}

uint64_t __31__PXUIWidgetFooterBar_setSpec___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateView");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateViewHeight");
}

uint64_t __42__PXUIWidgetFooterBar_setDisclosureTitle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateView");
}

uint64_t __33__PXUIWidgetFooterBar_updateView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setLayoutStyle:", 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "disclosureTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisclosureTitle:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "primaryFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "setContentInsets:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

@end
