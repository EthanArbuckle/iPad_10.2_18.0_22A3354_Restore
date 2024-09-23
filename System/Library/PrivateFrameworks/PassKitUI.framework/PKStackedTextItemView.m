@implementation PKStackedTextItemView

- (PKStackedTextItemView)initWithCoder:(id)a3
{

  return 0;
}

- (PKStackedTextItemView)initWithFrame:(CGRect)a3
{
  return -[PKStackedTextItemView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKStackedTextItemView)initWithStyle:(int64_t)a3
{
  PKStackedTextItemView *v4;
  PKStackedTextItemView *v5;
  NSMutableSet *v6;
  NSMutableSet *snapshots;
  uint64_t v8;
  UIFont *idealTitleFont;
  id PlainLabel;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  UIFont *idealTertiaryFont;
  UILabel *v15;
  UILabel *tertiary;
  uint64_t v17;
  UIFont *idealSecondaryFont;
  UILabel *v19;
  UILabel *secondary;
  void *v21;
  void *v22;
  uint64_t v23;
  UIFont *primaryFont;
  void *v25;
  uint64_t v26;
  UIFont *significantPrimaryFont;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PKStackedTextItemView;
  v4 = -[PKStackedTextItemView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    snapshots = v5->_snapshots;
    v5->_snapshots = v6;

    switch(v5->_style)
    {
      case 0:
        PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
        v8 = objc_claimAutoreleasedReturnValue();
        idealTitleFont = v5->_idealTitleFont;
        v5->_idealTitleFont = (UIFont *)v8;

        PlainLabel = CreatePlainLabel(v5->_idealTitleFont, 0);
        v11 = 416;
        goto LABEL_15;
      case 1:
        v12 = (NSString *)*MEMORY[0x1E0DC48D0];
        goto LABEL_8;
      case 2:
        v12 = (NSString *)*MEMORY[0x1E0DC48D0];
        goto LABEL_7;
      case 3:
        v12 = (NSString *)*MEMORY[0x1E0DC48D0];
        PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC48D0]);
        v13 = objc_claimAutoreleasedReturnValue();
        idealTertiaryFont = v5->_idealTertiaryFont;
        v5->_idealTertiaryFont = (UIFont *)v13;

        v15 = (UILabel *)CreatePlainLabel(v5->_idealTertiaryFont, 1);
        tertiary = v5->_tertiary;
        v5->_tertiary = v15;

        -[PKStackedTextItemView addSubview:](v5, "addSubview:", v5->_tertiary);
LABEL_7:
        PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], v12);
        v17 = objc_claimAutoreleasedReturnValue();
        idealSecondaryFont = v5->_idealSecondaryFont;
        v5->_idealSecondaryFont = (UIFont *)v17;

        v19 = (UILabel *)CreatePlainLabel(v5->_idealSecondaryFont, 0);
        secondary = v5->_secondary;
        v5->_secondary = v19;

        -[PKStackedTextItemView addSubview:](v5, "addSubview:", v5->_secondary);
        if (v5->_style != 2)
        {
LABEL_8:
          v21 = (void *)*MEMORY[0x1E0DC13A8];
          v22 = (void *)*MEMORY[0x1E0DC4B58];
          PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B58], v12, 0, 8);
          v23 = objc_claimAutoreleasedReturnValue();
          primaryFont = v5->_primaryFont;
          v5->_primaryFont = (UIFont *)v23;

          if (PKUIGetMinScreenWidthType())
            v25 = (void *)*MEMORY[0x1E0DC4B50];
          else
            v25 = v22;
          PKFontForDesign(v21, v25, v12, 2, 8, *MEMORY[0x1E0DC1420]);
          v26 = objc_claimAutoreleasedReturnValue();
          significantPrimaryFont = v5->_significantPrimaryFont;
          v5->_significantPrimaryFont = (UIFont *)v26;

          -[UIFont lineHeight](v5->_primaryFont, "lineHeight");
          v29 = v28;
          -[UIFont lineHeight](v5->_significantPrimaryFont, "lineHeight");
          if (v29 >= v30)
            v31 = 480;
          else
            v31 = 472;
          objc_storeStrong((id *)&v5->_layoutPrimaryFont, *(id *)((char *)&v5->super.super.super.isa + v31));
          objc_storeStrong((id *)&v5->_idealPrimaryFont, v5->_primaryFont);
          PlainLabel = CreatePlainLabel(v5->_primaryFont, 0);
          v11 = 424;
LABEL_15:
          v32 = (Class *)((char *)&v5->super.super.super.isa + v11);
          v33 = *(Class *)((char *)&v5->super.super.super.isa + v11);
          *v32 = PlainLabel;

          -[PKStackedTextItemView addSubview:](v5, "addSubview:", *v32);
        }
        break;
      default:
        break;
    }
    -[UILabel setAlpha:](v5->_title, "setAlpha:", 0.0);
    -[UILabel setAlpha:](v5->_primary, "setAlpha:", 0.0);
    -[UILabel setAlpha:](v5->_secondary, "setAlpha:", 0.0);
    -[UILabel setAlpha:](v5->_tertiary, "setAlpha:", 0.0);
    -[PKStackedTextItemView _updateAlignmentAnimated:](v5, "_updateAlignmentAnimated:", 0);
  }
  return v5;
}

- ($8F485F036B27F7DD50359B636660C38A)boundingMetricForWidth:(SEL)a3
{
  double v6;
  double v7;
  __int128 v8;
  void (**v9)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, _OWORD *, uint64_t);
  CGSize v10;
  CGSize v11;
  id v12;
  _BOOL8 v13;
  UILabel *secondary;
  UIFont *idealSecondaryFont;
  void (*v16)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t);
  CGSize v17;
  id v18;
  _BOOL8 v19;
  UILabel *tertiary;
  UIFont *idealTertiaryFont;
  void (*v22)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t);
  uint64_t v23;
  CGSize v24;
  CGSize *v25;
  CGSize *v26;
  double height;
  $8F485F036B27F7DD50359B636660C38A *result;
  _OWORD v29[12];
  CGPoint v30;
  CGSize v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGPoint v36;
  CGSize v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGPoint v42;
  CGSize v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGPoint v48;
  CGSize v49;
  uint64_t v50;
  CGPoint v51;
  CGSize v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[8];
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[4];
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  CGSize *v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var1[3].var0.origin.y = 0u;
  *(_OWORD *)&retstr->var1[3].var0.size.height = 0u;
  retstr->var1[2].var0.size = 0u;
  *(_OWORD *)&retstr->var1[2].var1 = 0u;
  *(_OWORD *)&retstr->var1[1].var0.size.height = 0u;
  retstr->var1[2].var0.origin = 0u;
  *(_OWORD *)&retstr->var1[0].var1 = 0u;
  *(_OWORD *)&retstr->var1[1].var0.origin.y = 0u;
  retstr->var1[0].var0.origin = 0u;
  retstr->var1[0].var0.size = 0u;
  retstr->var0 = 0u;
  PKFloatFloorToPixel();
  v7 = v6;
  v67 = 0;
  v68 = (CGSize *)&v67;
  v69 = 0x3010000000;
  v70 = &unk_19E0C78CE;
  v71 = *MEMORY[0x1E0C9D820];
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x4010000000;
  v64[3] = &unk_19E0C78CE;
  v8 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v65 = *MEMORY[0x1E0C9D648];
  v66 = v8;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__43;
  v62 = __Block_byref_object_dispose__43;
  v63 = 0;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __48__PKStackedTextItemView_boundingMetricForWidth___block_invoke;
  v57[3] = &unk_1E3E73E50;
  *(double *)&v57[7] = v6;
  v57[4] = v64;
  v57[5] = &v67;
  v57[6] = &v58;
  v9 = (void (**)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, _OWORD *, uint64_t))_Block_copy(v57);
  -[PKStackedTextItemView _titleFontMetrics](self, "_titleFontMetrics");
  v29[2] = v53;
  v29[3] = v54;
  v29[4] = v55;
  v29[5] = v56;
  v29[0] = v51;
  v29[1] = v52;
  ((void (**)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t))v9)[2](&v42, v9, self->_title, self->_idealTitleFont, &v51, 1);
  v10 = v43;
  retstr->var1[0].var0.origin = v42;
  retstr->var1[0].var0.size = v10;
  *(_QWORD *)&retstr->var1[0].var1 = v44;
  objc_storeStrong(v59 + 5, self->_layoutPrimaryFont);
  FontMetricsForFonts((uint64_t)&v51, self->_idealPrimaryFont, v59[5]);
  v29[8] = v53;
  v29[9] = v54;
  v29[10] = v55;
  v29[11] = v56;
  v29[6] = v51;
  v29[7] = v52;
  ((void (**)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t))v9)[2](&v42, v9, self->_primary, self->_idealPrimaryFont, &v51, 1);
  v11 = v43;
  retstr->var1[1].var0.origin = v42;
  retstr->var1[1].var0.size = v11;
  *(_QWORD *)&retstr->var1[1].var1 = v44;
  FontMetricsForFonts((uint64_t)&v51, self->_idealSecondaryFont, 0);
  v32 = v53;
  v33 = v54;
  v34 = v55;
  v35 = v56;
  v30 = v51;
  v31 = v52;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = (CGPoint)0;
  v52 = (CGSize)0;
  v12 = v59[5];
  if (v12)
  {
    FontMetricsForFonts((uint64_t)&v51, self->_idealSecondaryFont, v12);
    v13 = v59[5] == 0;
  }
  else
  {
    v53 = v32;
    v54 = v33;
    v55 = v34;
    v56 = v35;
    v13 = 1;
    v51 = v30;
    v52 = v31;
  }
  secondary = self->_secondary;
  idealSecondaryFont = self->_idealSecondaryFont;
  v16 = (void (*)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t))v9[2];
  v44 = v53;
  v45 = v54;
  v46 = v55;
  v47 = v56;
  v42 = v51;
  v43 = v52;
  v16(&v48, v9, secondary, idealSecondaryFont, &v42, v13);
  v17 = v49;
  retstr->var1[2].var0.origin = v48;
  retstr->var1[2].var0.size = v17;
  *(_QWORD *)&retstr->var1[2].var1 = v50;
  FontMetricsForFonts((uint64_t)&v42, self->_idealTertiaryFont, 0);
  v38 = v44;
  v39 = v45;
  v40 = v46;
  v41 = v47;
  v36 = v42;
  v37 = v43;
  v18 = v59[5];
  if (v18)
  {
    FontMetricsForFonts((uint64_t)&v42, self->_idealTertiaryFont, v18);
    v53 = v44;
    v54 = v45;
    v55 = v46;
    v56 = v47;
    v51 = v42;
    v52 = v43;
    v19 = v59[5] == 0;
  }
  else
  {
    v53 = v38;
    v54 = v39;
    v55 = v40;
    v56 = v41;
    v19 = 1;
    v51 = v36;
    v52 = v37;
  }
  tertiary = self->_tertiary;
  idealTertiaryFont = self->_idealTertiaryFont;
  v22 = (void (*)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t))v9[2];
  v44 = v53;
  v45 = v54;
  v46 = v55;
  v47 = v56;
  v42 = v51;
  v43 = v52;
  v22(&v48, v9, tertiary, idealTertiaryFont, &v42, v19);
  v23 = 0;
  v24 = v49;
  retstr->var1[3].var0.origin = v48;
  retstr->var1[3].var0.size = v24;
  *(_QWORD *)&retstr->var1[3].var1 = v50;
  v25 = v68;
  v26 = v68 + 2;
  v68[2].width = fmin(v68[2].width, v7);
  height = v25[2].height;
  do
  {
    height = height + *(double *)&v29[v23 + 2] + *((double *)&v29[v23 + 1] + 1) + *((double *)&v29[v23 + 2] + 1);
    v23 += 6;
  }
  while (v23 != 24);
  v25[2].height = height;
  retstr->var0 = *v26;

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&v67, 8);
  return result;
}

void __48__PKStackedTextItemView_boundingMetricForWidth___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  id v11;
  double v12;
  void *v13;
  void *v14;
  double *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a2;
  v11 = a3;
  *(_OWORD *)a6 = 0u;
  *(_OWORD *)(a6 + 16) = 0u;
  *(_QWORD *)(a6 + 32) = 0;
  objc_msgSend(v31, "alpha");
  if (v12 <= 0.0)
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v17 = *(_OWORD *)(v16 + 48);
    *(_OWORD *)a6 = *(_OWORD *)(v16 + 32);
    *(_OWORD *)(a6 + 16) = v17;
    goto LABEL_15;
  }
  objc_msgSend(v31, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFont:", v11);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = *(double *)(a4 + 32)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 40);
  if (a5)
  {
    v14 = v31;
    if (*(_BYTE *)(a4 + 48))
    {
      v15 = (double *)(a4 + 56);
LABEL_8:
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = *v15
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 40);
    }
  }
  else
  {
    v14 = v31;
    if (*(_BYTE *)(a4 + 72))
    {
      v15 = (double *)(a4 + 80);
      goto LABEL_8;
    }
  }
  objc_msgSend(v14, "pkui_sizeThatFits:", 1.79769313e308, 1.79769313e308);
  PKSizeCeilToPixel();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v18 + 48) = v19;
  *(_QWORD *)(v18 + 56) = v20;
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v22 = *(double *)(v21 + 48);
  v23 = *(double *)(a1 + 56);
  if (v22 > v23)
  {
    *(double *)(v21 + 48) = v23;
    *(_BYTE *)(a6 + 32) = 1;
    v22 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = fmax(v22, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 32));
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v25 = *(_OWORD *)(v24 + 48);
  *(_OWORD *)a6 = *(_OWORD *)(v24 + 32);
  *(_OWORD *)(a6 + 16) = v25;
  v26 = *(_QWORD *)(v24 + 32);
  *(_QWORD *)&v25 = *(_QWORD *)(v24 + 40);
  v27 = *(_QWORD *)(v24 + 48);
  v28 = *(_QWORD *)(v24 + 56);
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = CGRectGetMaxY(*(CGRect *)((char *)&v25 - 8))
                                                               + *(double *)(a4 + 40);
  if (a5 && *(_BYTE *)(a4 + 48))
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = *(double *)(a4 + 64)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 40);
  objc_msgSend(v31, "setFont:", v13);
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *MEMORY[0x1E0C9D820];
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v30 = *(void **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = 0;

LABEL_15:
}

- ($9A4FCDEE54F544F5FF8F2731F5B38A83)_titleFontMetrics
{
  $9A4FCDEE54F544F5FF8F2731F5B38A83 *result;

  FontMetricsForFonts((uint64_t)retstr, self->_idealTitleFont, 0);
  return result;
}

- (double)headerPadding
{
  double v3;

  -[PKStackedTextItemView _titleFontMetrics](self, "_titleFontMetrics");
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  UILabel *primary;
  uint64_t v13;
  double (**v14)(double);
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int v35;
  int64_t textAlignment;
  char v37;
  int v38;
  int v39;
  int v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD, _QWORD, double, double, double, double);
  UILabel *title;
  UILabel *v44;
  NSMutableSet *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[8];
  int v66;
  int v67;
  uint64_t v68;
  id *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[4];
  __int128 v75;
  __int128 v76;
  _QWORD v77[8];
  _QWORD aBlock[8];
  objc_super v79;
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;

  v81 = *MEMORY[0x1E0C80C00];
  v79.receiver = self;
  v79.super_class = (Class)PKStackedTextItemView;
  -[PKStackedTextItemView layoutSubviews](&v79, sel_layoutSubviews);
  -[PKStackedTextItemView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  if (self->_boundsSize.width == v3 && self->_boundsSize.height == v4)
  {
    -[UILabel frame](self->_title, "frame");
    v59 = v28;
    v60 = v27;
    -[UILabel frame](self->_primary, "frame");
    v57 = v30;
    v58 = v29;
    -[UILabel frame](self->_secondary, "frame");
    v20 = v31;
    v22 = v32;
    -[UILabel frame](self->_tertiary, "frame");
    v24 = v33;
    v26 = v34;
  }
  else
  {
    self->_boundsSize.width = v3;
    self->_boundsSize.height = v4;
    primary = self->_primary;
    if (primary)
    {
      v13 = 8;
      if (!self->_contentConstraints.textMetrics[1].widthConstrained)
        v13 = 11;
      -[UILabel setFont:](primary, "setFont:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKStackedTextItemView__style[v13]));
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__PKStackedTextItemView_layoutSubviews__block_invoke;
    aBlock[3] = &__block_descriptor_64_e8_d16__0d8l;
    *(CGFloat *)&aBlock[4] = v6;
    *(CGFloat *)&aBlock[5] = v8;
    *(CGFloat *)&aBlock[6] = v9;
    *(CGFloat *)&aBlock[7] = v10;
    v14 = (double (**)(double))_Block_copy(aBlock);
    -[UILabel pkui_sizeThatFits:](self->_title, "pkui_sizeThatFits:", v14[2](self->_contentConstraints.textMetrics[0].frame.size.width), 1.79769313e308);
    v59 = v16;
    v60 = v15;
    -[UILabel pkui_sizeThatFits:](self->_primary, "pkui_sizeThatFits:", ((double (*)(double (**)(double), CGFloat))v14[2])(v14, self->_contentConstraints.textMetrics[1].frame.size.width), 1.79769313e308);
    v57 = v18;
    v58 = v17;
    -[UILabel pkui_sizeThatFits:](self->_secondary, "pkui_sizeThatFits:", ((double (*)(double (**)(double), CGFloat))v14[2])(v14, self->_contentConstraints.textMetrics[2].frame.size.width), 1.79769313e308);
    v20 = v19;
    v22 = v21;
    -[UILabel pkui_sizeThatFits:](self->_tertiary, "pkui_sizeThatFits:", ((double (*)(double (**)(double), CGFloat))v14[2])(v14, self->_contentConstraints.textMetrics[3].frame.size.width), 1.79769313e308);
    v24 = v23;
    v26 = v25;

  }
  v35 = -[PKStackedTextItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  textAlignment = self->_textAlignment;
  if (textAlignment)
    v37 = 0;
  else
    v37 = v35;
  if ((v37 & 1) != 0 || (textAlignment == 1 ? (v38 = v35 ^ 1) : (v38 = 0), v38 == 1))
  {
    v39 = 2;
    v40 = 1;
  }
  else
  {
    v40 = 0;
    v39 = 0;
  }
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x4010000000;
  v77[3] = &unk_19E0C78CE;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x4010000000;
  v74[3] = &unk_19E0C78CE;
  v75 = 0u;
  v76 = 0u;
  v68 = 0;
  v69 = (id *)&v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__43;
  v72 = __Block_byref_object_dispose__43;
  v73 = 0;
  *(CGFloat *)&v77[4] = v6;
  *(CGFloat *)&v77[5] = v8;
  *(CGFloat *)&v77[6] = v9;
  *(CGFloat *)&v77[7] = v10;
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __39__PKStackedTextItemView_layoutSubviews__block_invoke_2;
  v65[3] = &unk_1E3E73E98;
  v65[6] = &v68;
  v65[7] = v74;
  v66 = v39;
  v67 = 1;
  v65[4] = self;
  v65[5] = v77;
  v41 = _Block_copy(v65);
  v42 = (void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))v41;
  title = self->_title;
  if (title)
    (*((void (**)(void *, UILabel *, uint64_t, double, double, double, double))v41 + 2))(v41, title, 1, v60, v59, 0.65, 0.0);
  objc_storeStrong(v69 + 5, self->_layoutPrimaryFont);
  v44 = self->_primary;
  if (v44)
    ((void (**)(_QWORD, UILabel *, uint64_t, double, double, double, double))v42)[2](v42, v44, 1, v58, v57, 0.0, 0.0);
  if (self->_secondary)
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double), double, double, double, double))v42[2])(v42, v20, v22, 0.0, 0.0);
  if (self->_tertiary)
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double), double, double, double, double))v42[2])(v42, v24, v26, 0.0, 0.0);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v45 = self->_snapshots;
  v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v62 != v47)
          objc_enumerationMutation(v45);
        v49 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v49, "frame");
        v51 = v50;
        v53 = v52;
        v55 = v54;
        v56 = v6;
        if (v40)
        {
          v82.origin.x = v6;
          v82.origin.y = v8;
          v82.size.width = v9;
          v82.size.height = v10;
          v56 = CGRectGetMaxX(v82) - v53;
        }
        objc_msgSend(v49, "pkui_setFrame:animated:", self->_animated, v56, v51, v53, v55);
      }
      v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
    }
    while (v46);
  }

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v77, 8);
}

double __39__PKStackedTextItemView_layoutSubviews__block_invoke(uint64_t a1, double a2)
{
  double v2;

  v2 = fmin(*(double *)(a1 + 48), a2);
  if (a2 <= 0.0)
    return *(double *)(a1 + 48);
  else
    return v2;
}

void __39__PKStackedTextItemView_layoutSubviews__block_invoke_2(_QWORD *a1, void *a2, int a3, double a4, CGFloat a5)
{
  uint64_t v8;
  __int128 v9;
  void *v10;
  double v11;
  double v12;
  CGRect *v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  CGRect *v18;
  _BOOL8 v20;
  CGRect *v21;
  double *v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  id v29;
  _OWORD v30[2];
  CGFloat amount[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v29 = a2;
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(_OWORD *)(v8 + 48);
  v35 = *(_OWORD *)(v8 + 32);
  v36 = v9;
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)amount = 0u;
  v32 = 0u;
  memset(v30, 0, sizeof(v30));
  objc_msgSend(v29, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FontMetricsForFonts((uint64_t)v30, v10, *(void **)(*(_QWORD *)(a1[6] + 8) + 40));

  objc_msgSend(v29, "alpha");
  v12 = v11;
  v13 = *(CGRect **)(a1[5] + 8);
  v37.origin.x = v13[1].origin.x;
  v37.origin.y = v13[1].origin.y;
  ++v13;
  v37.size.width = v13->size.width;
  v37.size.height = v13->size.height;
  CGRectDivide(v37, (CGRect *)(*(_QWORD *)(a1[7] + 8) + 32), v13, amount[0], CGRectMinYEdge);
  if (a3)
  {
    if (!(_BYTE)v32)
      goto LABEL_7;
    v14 = *(double **)(a1[5] + 8);
    v15 = *((double *)&v32 + 1);
  }
  else
  {
    if (!BYTE8(v33))
      goto LABEL_7;
    v14 = *(double **)(a1[5] + 8);
    v15 = *(double *)&v34;
  }
  v16 = v15 + v14[5];
  v17 = v14[7] - (v15 + 0.0);
  v14[4] = v14[4] + 0.0;
  v14[5] = v16;
  v14[7] = v17;
LABEL_7:
  v18 = *(CGRect **)(a1[5] + 8);
  v38.origin.x = v18[1].origin.x;
  v38.origin.y = v18[1].origin.y;
  ++v18;
  v38.size.width = v18->size.width;
  v38.size.height = v18->size.height;
  CGRectDivide(v38, (CGRect *)(*(_QWORD *)(a1[7] + 8) + 32), v18, a5, CGRectMinYEdge);
  PKSizeAlignedInRect();
  v20 = v12 > 0.0 && *(_BYTE *)(a1[4] + 528) != 0;
  objc_msgSend(v29, "pkui_setFrame:animated:", v20);
  v21 = *(CGRect **)(a1[5] + 8);
  v39.origin.x = v21[1].origin.x;
  v39.origin.y = v21[1].origin.y;
  ++v21;
  v39.size.width = v21->size.width;
  v39.size.height = v21->size.height;
  CGRectDivide(v39, (CGRect *)(*(_QWORD *)(a1[7] + 8) + 32), v21, amount[1], CGRectMinYEdge);
  if (a3 && (_BYTE)v32)
  {
    v22 = *(double **)(a1[5] + 8);
    v23 = *(double *)&v33 + v22[5];
    v24 = v22[7] - (*(double *)&v33 + 0.0);
    v22[4] = v22[4] + 0.0;
    v22[5] = v23;
    v22[7] = v24;
  }
  if (v12 <= 0.0)
  {
    v27 = *(_QWORD *)(a1[5] + 8);
    v28 = v36;
    *(_OWORD *)(v27 + 32) = v35;
    *(_OWORD *)(v27 + 48) = v28;
  }
  else
  {
    v25 = *(_QWORD *)(a1[6] + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = 0;

  }
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[PKStackedTextItemView layoutIfNeeded](self, "layoutIfNeeded");
  self->_animated = 0;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PKStackedTextItemView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[UILabel layer](self->_title, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[UILabel layer](self->_primary, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[UILabel layer](self->_secondary, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[UILabel layer](self->_tertiary, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_snapshots;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "removeFromSuperview", (_QWORD)v13);
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  -[NSMutableSet removeAllObjects](self->_snapshots, "removeAllObjects");
}

- (id)_attributedStringWithText:(id)a3 strikethrough:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v4 = a4;
  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    if (v4)
    {
      v9 = *MEMORY[0x1E0DC11A8];
      v10[0] = &unk_1E3FADA98;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateSubviewsAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  uint64_t v25;
  UILabel *primary;
  void *v27;
  void (**v28)(void *, UILabel *, void *);
  _QWORD v29[5];
  BOOL v30;

  self->_boundsSize = (CGSize)*MEMORY[0x1E0C9D820];
  switch(self->_style)
  {
    case 0:
      -[PKStackedTextItem title](self->_content, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedTextItemView _attributedStringWithText:strikethrough:](self, "_attributedStringWithText:strikethrough:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v8 = 0;
      v9 = 0;
      goto LABEL_10;
    case 1:
      -[PKStackedTextItem primary](self->_content, "primary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedTextItemView _attributedStringWithText:strikethrough:](self, "_attributedStringWithText:strikethrough:", v5, -[PKStackedTextItem isStrikethroughPrimary](self->_content, "isStrikethroughPrimary"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_7;
    case 2:
      -[PKStackedTextItem secondary](self->_content, "secondary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedTextItemView _attributedStringWithText:strikethrough:](self, "_attributedStringWithText:strikethrough:", v5, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
LABEL_7:
      v9 = 0;
      goto LABEL_9;
    case 3:
      -[PKStackedTextItem primary](self->_content, "primary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedTextItemView _attributedStringWithText:strikethrough:](self, "_attributedStringWithText:strikethrough:", v11, -[PKStackedTextItem isStrikethroughPrimary](self->_content, "isStrikethroughPrimary"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKStackedTextItem secondary](self->_content, "secondary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedTextItemView _attributedStringWithText:strikethrough:](self, "_attributedStringWithText:strikethrough:", v12, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKStackedTextItem tertiary](self->_content, "tertiary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedTextItemView _attributedStringWithText:strikethrough:](self, "_attributedStringWithText:strikethrough:", v5, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v6 = 0;
LABEL_10:

      if (a3)
        goto LABEL_11;
      goto LABEL_4;
    default:
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v6 = 0;
      if (a3)
      {
LABEL_11:
        -[UILabel alpha](self->_title, "alpha");
        v13 = 0.0;
        if (v14 > 0.0)
        {
          -[UILabel text](self->_title, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = PKEqualObjects();

          if ((v16 & 1) == 0)
          {
            -[PKStackedTextItemView _prepareViewForReuse:](self, "_prepareViewForReuse:", self->_title);
            v13 = fmax(v17, 0.0);
          }
        }
        -[UILabel alpha](self->_primary, "alpha");
        if (v18 > 0.0)
        {
          -[PKStackedTextItemView _prepareViewForReuse:](self, "_prepareViewForReuse:", self->_primary);
          v13 = fmax(v19, v13);
        }
        -[UILabel alpha](self->_secondary, "alpha");
        if (v20 > 0.0)
        {
          -[PKStackedTextItemView _prepareViewForReuse:](self, "_prepareViewForReuse:", self->_secondary);
          v13 = fmax(v21, v13);
        }
        -[UILabel alpha](self->_tertiary, "alpha");
        if (v22 > 0.0)
        {
          -[PKStackedTextItemView _prepareViewForReuse:](self, "_prepareViewForReuse:", self->_tertiary);
          v13 = fmax(v23, v13);
        }
        v10 = v13 * 0.65;
      }
      else
      {
LABEL_4:
        v10 = 0.0;
      }
      if (self->_primary && (self->_style | 2) == 3)
      {
        v24 = -[PKStackedTextItem isSignificantPrimary](self->_content, "isSignificantPrimary");
        v25 = 8;
        if (v24)
          v25 = 9;
        objc_storeStrong((id *)&self->_idealPrimaryFont, *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKStackedTextItemView__style[v25]));
        -[UILabel setFont:](self->_primary, "setFont:", self->_idealPrimaryFont);
        primary = self->_primary;
        if (-[PKStackedTextItem isDeemphasizedPrimary](self->_content, "isDeemphasizedPrimary"))
          objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](primary, "setTextColor:", v27);

      }
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __49__PKStackedTextItemView__updateSubviewsAnimated___block_invoke;
      v29[3] = &__block_descriptor_41_e40_v24__0__UILabel_8__NSAttributedString_16l;
      v30 = a3;
      *(double *)&v29[4] = v10;
      v28 = (void (**)(void *, UILabel *, void *))_Block_copy(v29);
      v28[2](v28, self->_title, v6);
      v28[2](v28, self->_primary, v7);
      v28[2](v28, self->_secondary, v8);
      v28[2](v28, self->_tertiary, v9);
      -[PKStackedTextItemView setNeedsLayout](self, "setNeedsLayout");
      -[PKStackedTextItemView layoutIfNeeded](self, "layoutIfNeeded");

      return;
  }
}

void __49__PKStackedTextItemView__updateSubviewsAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;

  if (a2)
  {
    v5 = a2;
    objc_msgSend(v5, "setAttributedText:", a3);
    objc_msgSend(v5, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
      v6 = 1.0;
    else
      v6 = 0.0;
    objc_msgSend(v11, "opacity");
    v8 = *(float *)&v7;
    if (v6 != *(float *)&v7)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBeginTime:", *(double *)(a1 + 32));
        objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v8, v6);
        v10 = (id)objc_msgSend(v11, "pkui_addAdditiveAnimation:", v9);

      }
      LODWORD(v7) = 0;
      if (a3)
        *(float *)&v7 = 1.0;
      objc_msgSend(v11, "setOpacity:", v7);
    }

  }
}

- (void)_updateAlignmentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  int64_t textAlignment;
  _BOOL4 v7;
  unsigned int v8;
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
  id v22;

  v3 = a3;
  v5 = -[PKStackedTextItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  textAlignment = self->_textAlignment;
  v7 = textAlignment == 0;
  if (textAlignment == 1)
    v8 = v5 ^ 1;
  else
    v8 = 0;
  if ((v7 & v5) != 0)
    v9 = 1.0;
  else
    v9 = (double)v8;
  -[PKStackedTextItemView layer](self, "layer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "anchorPoint");
  v12 = v11;
  v13 = v10;
  if (v9 != v11 || v10 != 0.0)
  {
    objc_msgSend(v22, "bounds");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v22, "position");
    v19 = v18;
    v21 = v20;
    objc_msgSend(v22, "setAnchorPoint:", v9, 0.0);
    objc_msgSend(v22, "setPosition:", v19 - v12 * v15 + v9 * v15, v21 - v13 * v17 + v17 * 0.0);
  }
  -[PKStackedTextItemView setNeedsLayout](self, "setNeedsLayout");
  -[PKStackedTextItemView layoutIfNeededAnimated:](self, "layoutIfNeededAnimated:", v3);

}

- (double)_prepareViewForReuse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  void *v30;
  NSMutableSet *v31;
  void *v32;
  float v33;
  NSMutableSet *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  id v40;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  NSMutableSet *v46;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "frame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(v4, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentationLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "anchorPoint");
        v20 = v19;
        v22 = v21;
        objc_msgSend(v18, "position");
        v24 = v23;
        v26 = v25;
        objc_msgSend(v18, "bounds");
        v13 = v27;
        v15 = v28;
        v9 = v24 - v20 * v27;
        v11 = v26 - v22 * v28;
      }
      objc_msgSend(v7, "setFrame:", v9, v11, v13, v15);
      objc_msgSend(v5, "addSubview:", v7);
      objc_msgSend(v7, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAllowsGroupOpacity:", objc_msgSend(v16, "allowsGroupOpacity"));
      objc_msgSend(v16, "compositingFilter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setCompositingFilter:", v30);

      v31 = self->_snapshots;
      -[NSMutableSet addObject:](v31, "addObject:", v7);
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "opacity");
      objc_msgSend(v32, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v33, 0.0);
      v44[0] = v6;
      v44[1] = 3221225472;
      v44[2] = __46__PKStackedTextItemView__prepareViewForReuse___block_invoke;
      v44[3] = &unk_1E3E619E0;
      v45 = v7;
      v46 = v31;
      v34 = v31;
      objc_msgSend(v32, "pkui_setCompletionHandler:", v44);
      v35 = (id)objc_msgSend(v29, "pkui_addAdditiveAnimation:", v32);
      LODWORD(v36) = 0;
      objc_msgSend(v29, "setOpacity:", v36);
      objc_msgSend(v32, "duration");
      v38 = v37;

    }
    else
    {
      v38 = 0.0;
    }

  }
  else
  {
    v38 = 0.0;
  }
  v39 = (void *)MEMORY[0x1E0DC3F10];
  v42[0] = v6;
  v42[1] = 3221225472;
  v42[2] = __46__PKStackedTextItemView__prepareViewForReuse___block_invoke_2;
  v42[3] = &unk_1E3E612E8;
  v43 = v4;
  v40 = v4;
  objc_msgSend(v39, "performWithoutAnimation:", v42);

  return v38;
}

uint64_t __46__PKStackedTextItemView__prepareViewForReuse___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(a1 + 32));
}

void __46__PKStackedTextItemView__prepareViewForReuse___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(v2, "clearHasBeenCommitted");

}

- (void)setTextAlignment:(int64_t)a3
{
  -[PKStackedTextItemView setTextAlignment:animated:](self, "setTextAlignment:animated:", a3, 0);
}

- (void)setTextAlignment:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_textAlignment != a3)
  {
    v4 = a4;
    -[PKStackedTextItemView layoutIfNeeded](self, "layoutIfNeeded");
    self->_textAlignment = a3;
    -[PKStackedTextItemView _updateAlignmentAnimated:](self, "_updateAlignmentAnimated:", v4);
  }
}

- (void)setContent:(id)a3
{
  -[PKStackedTextItemView setContent:animated:](self, "setContent:animated:", a3, 0);
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    -[PKStackedTextItemView layoutIfNeeded](self, "layoutIfNeeded");
    objc_storeStrong((id *)&self->_content, a3);
    self->_contentConstraints.boundingSize = 0u;
    self->_contentConstraints.textMetrics[0].frame.origin = 0u;
    self->_contentConstraints.textMetrics[0].frame.size = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[0].widthConstrained = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[1].frame.origin.y = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[1].frame.size.height = 0u;
    self->_contentConstraints.textMetrics[2].frame.origin = 0u;
    self->_contentConstraints.textMetrics[2].frame.size = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[2].widthConstrained = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[3].frame.origin.y = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[3].frame.size.height = 0u;
    -[PKStackedTextItemView _updateSubviewsAnimated:](self, "_updateSubviewsAnimated:", v4);
  }

}

- (void)setContentConstraints:(id *)a3
{
  CGSize size;
  CGPoint origin;
  CGPoint v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGSize v10;

  origin = a3->var1[0].var0.origin;
  size = a3->var1[0].var0.size;
  self->_contentConstraints.boundingSize = a3->var0;
  self->_contentConstraints.textMetrics[0].frame.origin = origin;
  self->_contentConstraints.textMetrics[0].frame.size = size;
  v5 = a3->var1[2].var0.origin;
  v7 = *(_OWORD *)&a3->var1[0].var1;
  v6 = *(_OWORD *)&a3->var1[1].var0.origin.y;
  *(_OWORD *)&self->_contentConstraints.textMetrics[1].frame.size.height = *(_OWORD *)&a3->var1[1].var0.size.height;
  self->_contentConstraints.textMetrics[2].frame.origin = v5;
  *(_OWORD *)&self->_contentConstraints.textMetrics[0].widthConstrained = v7;
  *(_OWORD *)&self->_contentConstraints.textMetrics[1].frame.origin.y = v6;
  v8 = *(_OWORD *)&a3->var1[3].var0.size.height;
  v10 = a3->var1[2].var0.size;
  v9 = *(_OWORD *)&a3->var1[2].var1;
  *(_OWORD *)&self->_contentConstraints.textMetrics[3].frame.origin.y = *(_OWORD *)&a3->var1[3].var0.origin.y;
  *(_OWORD *)&self->_contentConstraints.textMetrics[3].frame.size.height = v8;
  self->_contentConstraints.textMetrics[2].frame.size = v10;
  *(_OWORD *)&self->_contentConstraints.textMetrics[2].widthConstrained = v9;
  self->_boundsSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[PKStackedTextItemView setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (PKStackedTextItem)content
{
  return self->_content;
}

- ($8F485F036B27F7DD50359B636660C38A)contentConstraints
{
  CGSize var0;
  CGSize size;
  CGSize v5;
  CGPoint v6;
  __int128 v7;

  var0 = self[4].var0;
  *(_OWORD *)&retstr->var1[2].var1 = *(_OWORD *)&self[3].var1[3].var0.size.height;
  *(CGSize *)&retstr->var1[3].var0.origin.y = var0;
  *(CGPoint *)&retstr->var1[3].var0.size.height = self[4].var1[0].var0.origin;
  size = self[3].var1[2].var0.size;
  *(CGPoint *)&retstr->var1[1].var0.origin.y = self[3].var1[2].var0.origin;
  *(CGSize *)&retstr->var1[1].var0.size.height = size;
  v5 = *(CGSize *)&self[3].var1[3].var0.origin.y;
  retstr->var1[2].var0.origin = *(CGPoint *)&self[3].var1[2].var1;
  retstr->var1[2].var0.size = v5;
  v6 = *(CGPoint *)&self[3].var1[0].var1;
  retstr->var0 = self[3].var1[0].var0.size;
  retstr->var1[0].var0.origin = v6;
  v7 = *(_OWORD *)&self[3].var1[1].var0.size.height;
  retstr->var1[0].var0.size = *(CGSize *)&self[3].var1[1].var0.origin.y;
  *(_OWORD *)&retstr->var1[0].var1 = v7;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_idealTertiaryFont, 0);
  objc_storeStrong((id *)&self->_idealSecondaryFont, 0);
  objc_storeStrong((id *)&self->_idealPrimaryFont, 0);
  objc_storeStrong((id *)&self->_idealTitleFont, 0);
  objc_storeStrong((id *)&self->_layoutPrimaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_significantPrimaryFont, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_tertiary, 0);
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
