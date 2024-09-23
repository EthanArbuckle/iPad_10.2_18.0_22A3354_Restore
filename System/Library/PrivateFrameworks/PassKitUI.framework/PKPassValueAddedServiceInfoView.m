@implementation PKPassValueAddedServiceInfoView

- (PKPassValueAddedServiceInfoView)initWithStyle:(int64_t)a3
{
  PKPassValueAddedServiceInfoView *v4;
  PKPassValueAddedServiceInfoView *v5;
  PKPassSnapshotter *v6;
  PKPassSnapshotter *snapshotter;
  UILabel *v8;
  UILabel *labelView;
  UIImageView *v10;
  UIImageView *snapshotView;
  UILabel *v12;
  UILabel *statusView;
  UILabel *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKPassValueAddedServiceInfoView;
  v4 = -[PKPassValueAddedServiceInfoView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = objc_alloc_init(PKPassSnapshotter);
    snapshotter = v5->_snapshotter;
    v5->_snapshotter = v6;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    labelView = v5->_labelView;
    v5->_labelView = v8;

    -[UILabel setNumberOfLines:](v5->_labelView, "setNumberOfLines:", 2);
    -[PKPassValueAddedServiceInfoView addSubview:](v5, "addSubview:", v5->_labelView);
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    snapshotView = v5->_snapshotView;
    v5->_snapshotView = v10;

    -[UIImageView setContentMode:](v5->_snapshotView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v5->_snapshotView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PKPassValueAddedServiceInfoView addSubview:](v5, "addSubview:", v5->_snapshotView);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    statusView = v5->_statusView;
    v5->_statusView = v12;

    v14 = v5->_statusView;
    -[PKPassValueAddedServiceInfoView _statusAttributedStringForStyle:](v5, "_statusAttributedStringForStyle:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](v14, "setAttributedText:", v15);

    -[UILabel setNumberOfLines:](v5->_statusView, "setNumberOfLines:", 1);
    -[PKPassValueAddedServiceInfoView addSubview:](v5, "addSubview:", v5->_statusView);
    -[UIView pkui_setMaskType:](v5, "pkui_setMaskType:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassValueAddedServiceInfoView setBackgroundColor:](v5, "setBackgroundColor:", v16);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPassValueAddedServiceInfoView;
  -[PKPassValueAddedServiceInfoView dealloc](&v2, sel_dealloc);
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PKPassValueAddedServiceInfoView;
  -[PKPassValueAddedServiceInfoView layoutSubviews](&v26, sel_layoutSubviews);
  -[PKPassValueAddedServiceInfoView bounds](self, "bounds");
  v4 = v3;
  v6 = v5 + 13.0;
  v8 = v7 + -28.0;
  -[PKPassValueAddedServiceInfoView _snapshotSize](self, "_snapshotSize");
  v10 = v9;
  v12 = v11;
  v24 = 0.0;
  v25 = 0.0;
  v22 = 0.0;
  v23 = 0.0;
  v21 = 0.0;
  -[PKPassValueAddedServiceInfoView _calculateViewMetricsForWidth:labelSize:statusSize:baselineAdjustment:](self, "_calculateViewMetricsForWidth:labelSize:statusSize:baselineAdjustment:", &v23, &v21, &v25, v8 - (v9 + 13.0));
  if (v12 <= v25 + v24 + v22 + 1.0)
  {
    PKFloatFloorToPixel();
    v19 = v6 + v14;
  }
  else
  {
    PKFloatFloorToPixel();
    v19 = v6;
    v6 = v6 + v13;
  }
  v15 = v4 + 14.0;
  v16 = v25 + v6 + v24 + 1.0;
  v18 = v21;
  v17 = v22;
  -[UILabel setFrame:](self->_labelView, "setFrame:", v10 + v15 + 13.0, v6, v23, *(_QWORD *)&v19);
  -[UILabel setFrame:](self->_statusView, "setFrame:", v10 + v15 + 13.0, v16, v18, v17);
  -[UIImageView setFrame:](self->_snapshotView, "setFrame:", v15, v20, v10, v12);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  -[PKPassValueAddedServiceInfoView _snapshotSize](self, "_snapshotSize", a3.width, a3.height);
  v13 = 0.0;
  v14 = 0.0;
  v11 = 0.0;
  v12 = 0;
  v10 = 0;
  -[PKPassValueAddedServiceInfoView _calculateViewMetricsForWidth:labelSize:statusSize:baselineAdjustment:](self, "_calculateViewMetricsForWidth:labelSize:statusSize:baselineAdjustment:", &v12, &v10, &v14, fmax(width - (v5 + 14.0 + 13.0 + 14.0), 0.0));
  v6 = v14 + v13 + v11 + 1.0;
  -[PKPassValueAddedServiceInfoView _snapshotSize](self, "_snapshotSize");
  v8 = fmax(v7, v6) + 13.0 + 13.0;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)_calculateViewMetricsForWidth:(double)a3 labelSize:(CGSize *)a4 statusSize:(CGSize *)a5 baselineAdjustment:(double *)a6
{
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double height;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;

  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_labelView, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
  a4->width = v11;
  a4->height = v12;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_statusView, "pkui_sizeThatFits:forceWordWrap:", 0, a3, 1.79769313e308);
  a5->width = v13;
  a5->height = v14;
  height = a4->height;
  -[UILabel font](self->_labelView, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "descender");
  v18 = height + v17;

  v19 = a5->height + a4->height;
  -[UILabel font](self->_statusView, "font");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "descender");
  v22 = v19 + v21;

  -[PKPassValueAddedServiceInfoView _baselineDistance](self, "_baselineDistance");
  *a6 = fmax(v23 - (v22 - v18), 0.0);
}

- (void)setStyle:(int64_t)a3
{
  -[PKPassValueAddedServiceInfoView setStyle:animated:completion:](self, "setStyle:animated:completion:", a3, 0, 0);
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD);
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[5];
  _QWORD aBlock[6];

  v5 = a4;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (self->_style == a3)
  {
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
  else
  {
    self->_style = a3;
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke;
    aBlock[3] = &unk_1E3E62010;
    aBlock[4] = self;
    aBlock[5] = a3;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    v12 = v11;
    if (v5)
    {
      v13 = (void *)MEMORY[0x1E0DC3F10];
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_2;
      v17[3] = &unk_1E3E612E8;
      v17[4] = self;
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_3;
      v14[3] = &unk_1E3E763E8;
      v14[4] = self;
      v15 = v11;
      v16 = v9;
      objc_msgSend(v13, "animateWithDuration:animations:completion:", v17, v14, 0.2);

    }
    else
    {
      v11[2](v11);
      if (v9)
        v9[2](v9, 1);
    }

  }
}

uint64_t __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[57];
  objc_msgSend(v2, "_statusAttributedStringForStyle:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
}

uint64_t __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_3(_QWORD *a1)
{
  _QWORD v3[5];

  (*(void (**)(void))(a1[5] + 16))();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_4;
  v3[3] = &unk_1E3E612E8;
  v3[4] = a1[4];
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v3, a1[6], 0.2);
}

uint64_t __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 1.0);
}

- (void)setPass:(id)a3
{
  -[PKPassValueAddedServiceInfoView setPass:animated:completion:](self, "setPass:animated:completion:", a3, 0, 0);
}

- (void)setPass:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(void *, _QWORD);
  PKPass *pass;
  PKPassSnapshotter *snapshotter;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  PKPassValueAddedServiceInfoView *v21;
  id v22;
  BOOL v23;

  v9 = a3;
  v10 = a5;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke;
  v19 = &unk_1E3E76410;
  v11 = v9;
  v20 = v11;
  v21 = self;
  v23 = a4;
  v12 = v10;
  v22 = v12;
  v13 = (void (**)(void *, _QWORD))_Block_copy(&v16);
  objc_storeStrong((id *)&self->_pass, a3);
  pass = self->_pass;
  if (pass)
  {
    snapshotter = self->_snapshotter;
    -[PKPassValueAddedServiceInfoView _snapshotSize](self, "_snapshotSize", v16, v17, v18, v19, v20, v21);
    -[PKPassSnapshotter snapshotWithPass:size:suppressedContent:completion:](snapshotter, "snapshotWithPass:size:suppressedContent:completion:", pass, 4087, v13);
  }
  else
  {
    v13[2](v13, 0);
  }

}

void __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_2;
  block[3] = &unk_1E3E6C4F8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v13 = *(_BYTE *)(a1 + 56);
  v12 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD aBlock[4];
  id v16;
  uint64_t v17;
  id v18;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_3;
  aBlock[3] = &unk_1E3E61400;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v16 = v3;
  v17 = v4;
  v18 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  v7 = v6;
  if (*(_BYTE *)(a1 + 64))
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = v2;
    v14[1] = 3221225472;
    v14[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_4;
    v14[3] = &unk_1E3E612E8;
    v14[4] = *(_QWORD *)(a1 + 40);
    v11[0] = v2;
    v11[1] = 3221225472;
    v11[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_5;
    v11[3] = &unk_1E3E763E8;
    v9 = v6;
    v11[4] = *(_QWORD *)(a1 + 40);
    v12 = v9;
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v14, v11, 0.2);

  }
  else
  {
    v6[2](v6);
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);
  }

}

void __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (!v2 || (v3 = objc_msgSend(v2, "length"), v4 = v9, !v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "organizationName");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v6 = *(_QWORD **)(a1 + 40);
  v7 = (void *)v6[55];
  v10 = v4;
  objc_msgSend(v6, "_labelAttributedStringForString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 448), "setImage:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");

}

uint64_t __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
}

uint64_t __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_5(_QWORD *a1)
{
  _QWORD v3[5];

  (*(void (**)(void))(a1[5] + 16))();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_6;
  v3[3] = &unk_1E3E612E8;
  v3[4] = a1[4];
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v3, a1[6], 0.2);
}

uint64_t __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 1.0);
}

- (CGSize)_snapshotSize
{
  double v2;
  double v3;
  CGSize result;

  -[PKPass style](self->_pass, "style");
  PKPassFrontFaceContentSize();
  PKPassHeightAdjustmentForStyle();
  PKSizeRoundToPixel();
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_labelAttributedStringForString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0DC1288];
  v5 = a3;
  objc_msgSend(v4, "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setAlignment:", 4);
  objc_msgSend(v7, "setLineBreakMode:", 4);
  v15[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1178];
  v16[0] = v8;
  v16[1] = v7;
  v10 = *MEMORY[0x1E0DC1138];
  v15[1] = v9;
  v15[2] = v10;
  -[PKPassValueAddedServiceInfoView _labelFont](self, "_labelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v12);
  return v13;
}

- (id)_statusAttributedStringForStyle:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 != 1)
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = CFSTR("VAS_PASS_DID_SEND");
  }
  else
  {
    v4 = CFSTR("VAS_PASS_WILL_SEND");
  }
  PKLocalizedString(&v4->isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DC1288], "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setAlignment:", 4);
  objc_msgSend(v7, "setLineBreakMode:", 4);
  v15[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1178];
  v16[0] = v8;
  v16[1] = v7;
  v10 = *MEMORY[0x1E0DC1138];
  v15[1] = v9;
  v15[2] = v10;
  -[PKPassValueAddedServiceInfoView _statusFont](self, "_statusFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v12);
LABEL_9:

  return v13;
}

- (id)_labelFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4938], 2, 0);
}

- (id)_statusFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
}

- (double)_baselineDistance
{
  void *v2;
  double v3;
  double v4;

  -[PKPassValueAddedServiceInfoView _labelFont](self, "_labelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bodyLeading");
  PKFloatRoundToPixel();
  v4 = v3;

  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
