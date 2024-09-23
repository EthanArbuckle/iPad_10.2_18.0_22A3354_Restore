@implementation PKFusedDoubleCellView

- (PKFusedDoubleCellView)init
{
  PKFusedDoubleCellView *v2;
  PKFusedDoubleCellView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFusedDoubleCellView;
  v2 = -[PKFusedDoubleCellView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKFusedDoubleCellView _performInit](v2, "_performInit");
  return v3;
}

- (PKFusedDoubleCellView)initWithFrame:(CGRect)a3
{
  PKFusedDoubleCellView *v3;
  PKFusedDoubleCellView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKFusedDoubleCellView;
  v3 = -[PKFusedDoubleCellView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKFusedDoubleCellView _performInit](v3, "_performInit");
  return v4;
}

- (int64_t)viewType
{
  return 1;
}

- (void)prepareForReuse
{
  -[UILabel setText:](self->_leftTitleView, "setText:", 0);
  -[UILabel setText:](self->_leftDetailView, "setText:", 0);
  -[UILabel setText:](self->_leftSubDetailView, "setText:", 0);
  -[UILabel setText:](self->_rightTitleView, "setText:", 0);
  -[UILabel setText:](self->_rightDetailView, "setText:", 0);
  -[UILabel setText:](self->_rightSubDetailView, "setText:", 0);
  -[UIView setAlpha:](self->_separatorView, "setAlpha:", 0.0);
  -[UIImageView setAlpha:](self->_disclosureView, "setAlpha:", 0.0);
}

- (void)_performInit
{
  self->_deferUpdateCounter = 0;
  -[PKFusedDoubleCellView _setupViews](self, "_setupViews");
}

- (void)_setupViews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UILabel *leftTitleView;
  UILabel *v10;
  UILabel *rightTitleView;
  UILabel *v12;
  UILabel *leftDetailView;
  UILabel *v14;
  UILabel *rightDetailView;
  UILabel *v16;
  UILabel *leftSubDetailView;
  UILabel *v18;
  UILabel *rightSubDetailView;
  UIView *v20;
  UIView *separatorView;
  UIView *v22;
  void *v23;
  id v24;
  void *v25;
  UIImageView *v26;
  UIImageView *disclosureView;
  UIImageView *v28;
  void *v29;
  id v30;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView pkui_setMaskType:](self, "pkui_setMaskType:", 3);
  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  leftTitleView = self->_leftTitleView;
  self->_leftTitleView = v8;

  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  rightTitleView = self->_rightTitleView;
  self->_rightTitleView = v10;

  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  leftDetailView = self->_leftDetailView;
  self->_leftDetailView = v12;

  v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  rightDetailView = self->_rightDetailView;
  self->_rightDetailView = v14;

  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  leftSubDetailView = self->_leftSubDetailView;
  self->_leftSubDetailView = v16;

  v18 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  rightSubDetailView = self->_rightSubDetailView;
  self->_rightSubDetailView = v18;

  v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  separatorView = self->_separatorView;
  self->_separatorView = v20;

  v22 = self->_separatorView;
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

  -[UIView setAlpha:](self->_separatorView, "setAlpha:", 0.0);
  v24 = objc_alloc(MEMORY[0x1E0DC3890]);
  PKUIChevronImage();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (UIImageView *)objc_msgSend(v24, "initWithImage:", v25);
  disclosureView = self->_disclosureView;
  self->_disclosureView = v26;

  v28 = self->_disclosureView;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v28, "setTintColor:", v29);

  -[UIImageView setAlpha:](self->_disclosureView, "setAlpha:", 0.0);
  -[UILabel setAccessibilityIdentifier:](self->_leftTitleView, "setAccessibilityIdentifier:", CFSTR("PKFusedDoubleCellView.leftTitleView"));
  -[UILabel setAccessibilityIdentifier:](self->_rightTitleView, "setAccessibilityIdentifier:", CFSTR("PKFusedDoubleCellView.rightTitleView"));
  -[UILabel setAccessibilityIdentifier:](self->_leftDetailView, "setAccessibilityIdentifier:", CFSTR("PKFusedDoubleCellView.leftDetailView"));
  -[UILabel setAccessibilityIdentifier:](self->_rightDetailView, "setAccessibilityIdentifier:", CFSTR("PKFusedDoubleCellView.rightDetailView"));
  -[UILabel setAccessibilityIdentifier:](self->_leftSubDetailView, "setAccessibilityIdentifier:", CFSTR("PKFusedDoubleCellView.leftSubDetailView"));
  -[UILabel setAccessibilityIdentifier:](self->_rightSubDetailView, "setAccessibilityIdentifier:", CFSTR("PKFusedDoubleCellView.rightSubDetailView"));
  -[PKFusedDoubleCellView addSubview:](self, "addSubview:", self->_leftTitleView);
  -[PKFusedDoubleCellView addSubview:](self, "addSubview:", self->_leftDetailView);
  -[PKFusedDoubleCellView addSubview:](self, "addSubview:", self->_leftSubDetailView);
  -[PKFusedDoubleCellView addSubview:](self, "addSubview:", self->_rightTitleView);
  -[PKFusedDoubleCellView addSubview:](self, "addSubview:", self->_rightDetailView);
  -[PKFusedDoubleCellView addSubview:](self, "addSubview:", self->_rightSubDetailView);
  -[PKFusedDoubleCellView addSubview:](self, "addSubview:", self->_disclosureView);
  -[PKFusedDoubleCellView addSubview:](self, "addSubview:", self->_separatorView);
  -[PKFusedDoubleCellView setBackgroundColor:](self, "setBackgroundColor:", v30);

}

- (id)_titleFont
{
  UIFont *titleFont;

  titleFont = self->_titleFont;
  if (titleFont)
    return titleFont;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_detailFont
{
  uint64_t v2;
  double v3;
  double v4;

  v2 = PKUIGetMinScreenWidthType();
  v3 = 28.0;
  if (!v2)
    v3 = 24.0;
  v4 = PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48C0], v3);
  return PKRoundedSystemFontOfSizeAndWeight(v4, *MEMORY[0x1E0DC1420]);
}

- (id)_subDetailFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC48D0]);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKFusedDoubleCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKFusedDoubleCellView;
  -[PKFusedDoubleCellView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKFusedDoubleCellView bounds](self, "bounds");
  -[PKFusedDoubleCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  _BOOL8 v4;
  double width;
  void *v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double x;
  double y;
  double height;
  double v54;
  CGSize result;

  v4 = a4;
  y = a3.origin.y;
  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  -[PKFusedDoubleCellView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  v10 = PKUIPixelLength();
  v54 = width + -20.0;
  v11 = (width + -20.0) * 0.5 + -6.5;
  v12 = v10 * 0.5;
  v13 = v11 - v12;
  if (self->_leftTitle)
  {
    -[UILabel sizeThatFits:](self->_leftTitleView, "sizeThatFits:", v11 - v12, 3.40282347e38);
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v45 = v15;
  v50 = v14;
  if (self->_leftDetail)
  {
    -[UILabel sizeThatFits:](self->_leftDetailView, "sizeThatFits:", v13, 3.40282347e38);
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v17 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  }
  v44 = v17;
  v49 = v16;
  if (self->_leftSubDetail)
  {
    -[UILabel sizeThatFits:](self->_leftSubDetailView, "sizeThatFits:", v13, 3.40282347e38);
    v48 = v18;
    v43 = v19;
  }
  else
  {
    v48 = *MEMORY[0x1E0C9D820];
    v43 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[UIImageView alpha](self->_disclosureView, "alpha");
  if (v20 <= 0.0)
  {
    v22 = *MEMORY[0x1E0C9D820];
    v47 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v13, 3.40282347e38);
    v22 = v21;
    v47 = v23;
  }
  if (v22 <= 0.0)
    v24 = 0.0;
  else
    v24 = 10.0;
  if (self->_rightTitle)
  {
    -[UILabel sizeThatFits:](self->_rightTitleView, "sizeThatFits:", v13 - v22 + -10.0, 3.40282347e38);
    v46 = v25;
    v42 = v26;
  }
  else
  {
    v46 = *MEMORY[0x1E0C9D820];
    v42 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_rightDetail)
  {
    -[UILabel sizeThatFits:](self->_rightDetailView, "sizeThatFits:", v13 - v22 + -10.0, 3.40282347e38);
    v28 = v27;
    v41 = v29;
  }
  else
  {
    v28 = *MEMORY[0x1E0C9D820];
    v41 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_rightSubDetail)
  {
    -[UILabel sizeThatFits:](self->_rightSubDetailView, "sizeThatFits:", v13 - v22 + -10.0, 3.40282347e38);
    v31 = v30;
    v33 = v32;
  }
  else
  {
    v31 = *MEMORY[0x1E0C9D820];
    v33 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  }
  v34 = x + 10.0;
  v35 = y + 12.0;
  v36 = height + -24.0;
  if (fmax(v50, fmax(v49, v48)) > v13
    || (v24 + v22 + fmax(v46, fmax(v28, v31)) > v13 ? (v37 = 1) : (v37 = IsAccessibilityCategory), v37 == 1))
  {
    -[PKFusedDoubleCellView _layoutLabelsStacked:disclosureSize:disclosurePadding:isTemplateLayout:](self, "_layoutLabelsStacked:disclosureSize:disclosurePadding:isTemplateLayout:", v4, v34, v35, v54, v36, v22, v47, v24);
  }
  else
  {
    -[PKFusedDoubleCellView _layoutLabelsSideBySide:halfSize:leftTitleSize:leftDetailSize:leftSubDetailSize:disclosureSize:disclosurePadding:rightSize:rightTitleSize:rightDetailSize:rightSubDetailSize:isTemplateLayout:](self, "_layoutLabelsSideBySide:halfSize:leftTitleSize:leftDetailSize:leftSubDetailSize:disclosureSize:disclosurePadding:rightSize:rightTitleSize:rightDetailSize:rightSubDetailSize:isTemplateLayout:", v4, v34, v35, v54, v36, v13, 3.40282347e38, v50, v45, *(_QWORD *)&v49, v44, *(_QWORD *)&v48, v43, *(_QWORD *)&v22, *(_QWORD *)&v47, *(_QWORD *)&v24,
      v13 - v22 + -10.0,
      0x47EFFFFFE0000000,
      *(_QWORD *)&v46,
      v42,
      *(_QWORD *)&v28,
      v41,
      *(_QWORD *)&v31,
      v33);
  }
  v39 = v38 + 0.0 + 12.0 + 12.0;
  v40 = width;
  result.height = v39;
  result.width = v40;
  return result;
}

- (double)_layoutLabelsSideBySide:(CGRect)a3 halfSize:(CGSize)a4 leftTitleSize:(CGSize)a5 leftDetailSize:(CGSize)a6 leftSubDetailSize:(CGSize)a7 disclosureSize:(CGSize)a8 disclosurePadding:(double)a9 rightSize:(CGSize)a10 rightTitleSize:(CGSize)a11 rightDetailSize:(CGSize)a12 rightSubDetailSize:(CGSize)a13 isTemplateLayout:(BOOL)a14
{
  char width_low;
  CGFloat y;
  CGFloat x;
  int v18;
  CGRectEdge v19;
  CGRectEdge v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v56;
  CGFloat width;
  CGFloat amount;
  CGFloat rect;
  double height;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect slice;
  CGRect remainder;
  CGRect v72;
  double v73;
  double v74;
  double v75;
  CGRect v76;

  width_low = LOBYTE(a6.width);
  rect = a3.size.height;
  height = a5.height;
  width = a3.size.width;
  amount = a4.width;
  y = a3.origin.y;
  v56 = a3.origin.y;
  x = a3.origin.x;
  v18 = -[PKFusedDoubleCellView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", *(_QWORD *)&a6.width, *(_QWORD *)&a6.height, *(_QWORD *)&a7.width, *(_QWORD *)&a7.height, *(_QWORD *)&a8.width, *(_QWORD *)&a8.height);
  if (v18)
    v19 = CGRectMinXEdge;
  else
    v19 = CGRectMaxXEdge;
  if (v18)
    v20 = CGRectMaxXEdge;
  else
    v20 = CGRectMinXEdge;
  memset(&v72, 0, sizeof(v72));
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = rect;
  v21 = fmax(height + a10.width + a11.width, fmax(v73 + v74 + v75, a12.width));
  v22 = PKUIPixelLength();
  memset(&slice, 0, sizeof(slice));
  v76.origin.x = x;
  v76.origin.y = v56;
  v76.size.width = width;
  v76.size.height = rect;
  CGRectDivide(v76, &slice, &remainder, amount, v20);
  CGRectDivide(remainder, &v72, &remainder, 6.5, v20);
  memset(&v69, 0, sizeof(v69));
  CGRectDivide(remainder, &v69, &remainder, v22, v20);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v69.origin.x = v23;
  v69.origin.y = v24;
  v69.size.width = v25;
  v69.size.height = v26;
  CGRectDivide(remainder, &v72, &remainder, 6.5, v20);
  memset(&v68, 0, sizeof(v68));
  CGRectDivide(remainder, &v68, &remainder, a11.height, v19);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v68.origin.x = v27;
  v68.origin.y = v28;
  v68.size.width = v29;
  v68.size.height = v30;
  CGRectDivide(remainder, &v72, &remainder, a12.height, v19);
  memset(&v67, 0, sizeof(v67));
  CGRectDivide(remainder, &v67, &remainder, a13.width, v19);
  memset(&v66, 0, sizeof(v66));
  CGRectDivide(slice, &v66, &slice, height, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v66.origin.x = v31;
  v66.origin.y = v32;
  v66.size.width = v33;
  v66.size.height = v34;
  memset(&v65, 0, sizeof(v65));
  CGRectDivide(slice, &v65, &slice, a10.width, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v65.origin.x = v35;
  v65.origin.y = v36;
  v65.size.width = v37;
  v65.size.height = v38;
  memset(&v64, 0, sizeof(v64));
  CGRectDivide(slice, &v64, &slice, a11.width, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v64.origin.x = v39;
  v64.origin.y = v40;
  v64.size.width = v41;
  v64.size.height = v42;
  memset(&v63, 0, sizeof(v63));
  CGRectDivide(v67, &v63, &v67, v73, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v63.origin.x = v43;
  v63.origin.y = v44;
  v63.size.width = v45;
  v63.size.height = v46;
  memset(&v62, 0, sizeof(v62));
  CGRectDivide(v67, &v62, &v67, v74, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v62.origin.x = v47;
  v62.origin.y = v48;
  v62.size.width = v49;
  v62.size.height = v50;
  memset(&v61, 0, sizeof(v61));
  CGRectDivide(v67, &v61, &v67, v75, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v61.origin.x = v51;
  v61.origin.y = v52;
  v61.size.width = v53;
  v61.size.height = v54;
  if ((width_low & 1) == 0)
  {
    -[UILabel setFrame:](self->_leftTitleView, "setFrame:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height);
    -[UILabel setFrame:](self->_leftDetailView, "setFrame:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    -[UILabel setFrame:](self->_leftSubDetailView, "setFrame:", v64.origin.x, v64.origin.y, v64.size.width, v64.size.height);
    -[UILabel setFrame:](self->_rightTitleView, "setFrame:", v63.origin.x, v63.origin.y, v63.size.width, v63.size.height);
    -[UILabel setFrame:](self->_rightDetailView, "setFrame:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
    -[UILabel setFrame:](self->_rightSubDetailView, "setFrame:", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);
    -[UIView setFrame:](self->_separatorView, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v68.origin.x, v68.origin.y, v68.size.width, v68.size.height);
  }
  return v21;
}

- (double)_layoutLabelsStacked:(CGRect)a3 disclosureSize:(CGSize)a4 disclosurePadding:(double)a5 isTemplateLayout:(BOOL)a6
{
  double width;
  double v8;
  double v9;
  CGFloat y;
  CGFloat x;
  int v13;
  CGRectEdge v14;
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
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v63;
  double v64;
  CGFloat rect;
  double recta;
  CGFloat v67;
  double height;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect slice;
  CGRect remainder;
  CGRect v80;
  CGRect v81;

  height = a4.height;
  width = a4.width;
  v8 = a3.size.height;
  v9 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = -[PKFusedDoubleCellView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height, a5);
  remainder.origin.x = x;
  remainder.origin.y = y;
  rect = y;
  if (v13)
    v14 = CGRectMinXEdge;
  else
    v14 = CGRectMaxXEdge;
  remainder.size.width = v9;
  remainder.size.height = v8;
  v63 = PKUIPixelLength();
  if (self->_leftTitle)
  {
    -[UILabel sizeThatFits:](self->_leftTitleView, "sizeThatFits:", v9, v8);
    v16 = v15;
  }
  else
  {
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_leftDetail)
  {
    -[UILabel sizeThatFits:](self->_leftDetailView, "sizeThatFits:", v9, v8);
    v18 = v17;
  }
  else
  {
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v67 = width;
  v19 = v9 - width;
  if (self->_leftSubDetail)
  {
    -[UILabel sizeThatFits:](self->_leftSubDetailView, "sizeThatFits:", v9, v8);
    v21 = v20;
  }
  else
  {
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v22 = v19 + -10.0;
  if (self->_rightTitle)
  {
    -[UILabel sizeThatFits:](self->_rightTitleView, "sizeThatFits:", v22, v8);
    v64 = v23;
  }
  else
  {
    v64 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_rightDetail)
  {
    -[UILabel sizeThatFits:](self->_rightDetailView, "sizeThatFits:", v22, v8);
    v25 = v24;
  }
  else
  {
    v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_rightSubDetail)
  {
    -[UILabel sizeThatFits:](self->_rightSubDetailView, "sizeThatFits:", v22, v8);
    v27 = v26;
  }
  else
  {
    v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  memset(&v80, 0, sizeof(v80));
  memset(&slice, 0, sizeof(slice));
  v81.origin.x = x;
  v81.origin.y = rect;
  v81.size.width = v9;
  v81.size.height = v8;
  recta = v16 + v18 + v21;
  CGRectDivide(v81, &slice, &remainder, recta, CGRectMinYEdge);
  memset(&v77, 0, sizeof(v77));
  CGRectDivide(slice, &v77, &slice, v16, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v77.origin.x = v28;
  v77.origin.y = v29;
  v77.size.width = v30;
  v77.size.height = v31;
  memset(&v76, 0, sizeof(v76));
  CGRectDivide(slice, &v76, &slice, v18, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v76.origin.x = v32;
  v76.origin.y = v33;
  v76.size.width = v34;
  v76.size.height = v35;
  memset(&v75, 0, sizeof(v75));
  CGRectDivide(slice, &v75, &slice, v21, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v75.origin.x = v36;
  v75.origin.y = v37;
  v75.size.width = v38;
  v75.size.height = v39;
  CGRectDivide(remainder, &v80, &remainder, 6.5, CGRectMinYEdge);
  memset(&v74, 0, sizeof(v74));
  CGRectDivide(remainder, &v74, &remainder, v63, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v74.origin.x = v40;
  v74.origin.y = v41;
  v74.size.width = v42;
  v74.size.height = v43;
  CGRectDivide(remainder, &v80, &remainder, 6.5, CGRectMinYEdge);
  v44 = v74.size.height;
  v45 = fmax(v64 + v25 + v27, height);
  memset(&v73, 0, sizeof(v73));
  CGRectDivide(remainder, &v73, &remainder, v45, CGRectMinYEdge);
  memset(&v72, 0, sizeof(v72));
  CGRectDivide(v73, &v72, &v73, v67, v14);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v72.origin.x = v46;
  v72.origin.y = v47;
  v72.size.width = v48;
  v72.size.height = v49;
  memset(&v71, 0, sizeof(v71));
  CGRectDivide(v73, &v71, &v73, v64, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v71.origin.x = v50;
  v71.origin.y = v51;
  v71.size.width = v52;
  v71.size.height = v53;
  memset(&v70, 0, sizeof(v70));
  CGRectDivide(v73, &v70, &v73, v25, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v70.origin.x = v54;
  v70.origin.y = v55;
  v70.size.width = v56;
  v70.size.height = v57;
  memset(&v69, 0, sizeof(v69));
  CGRectDivide(v73, &v69, &v73, v27, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v69.origin.x = v58;
  v69.origin.y = v59;
  v69.size.width = v60;
  v69.size.height = v61;
  if (!a6)
  {
    -[UILabel setFrame:](self->_leftTitleView, "setFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
    -[UILabel setFrame:](self->_leftDetailView, "setFrame:", v76.origin.x, v76.origin.y, v76.size.width, v76.size.height);
    -[UILabel setFrame:](self->_leftSubDetailView, "setFrame:", v75.origin.x, v75.origin.y, v75.size.width, v75.size.height);
    -[UILabel setFrame:](self->_rightTitleView, "setFrame:", v71.origin.x, v71.origin.y, v71.size.width, v71.size.height);
    -[UILabel setFrame:](self->_rightDetailView, "setFrame:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
    -[UILabel setFrame:](self->_rightSubDetailView, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
    -[UIView setFrame:](self->_separatorView, "setFrame:", v74.origin.x, v74.origin.y, v74.size.width, v74.size.height);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
  }
  return v45 + recta + 0.0 + 13.0 + v44;
}

- (void)setPass:(id)a3
{
  PKPaymentPass **p_pass;
  id v5;

  p_pass = &self->_pass;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_pass, a3);

}

- (void)setEnableDisclosure:(BOOL)a3
{
  if (self->_enableDisclosure != a3)
    self->_enableDisclosure = a3;
}

- (void)setLeftTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *leftTitle;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_leftTitle;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    leftTitle = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    leftTitle = self->_leftTitle;
    self->_leftTitle = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setLeftDetail:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *leftDetail;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_leftDetail;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    leftDetail = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    leftDetail = self->_leftDetail;
    self->_leftDetail = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setLeftSubDetail:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *leftSubDetail;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_leftSubDetail;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    leftSubDetail = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    leftSubDetail = self->_leftSubDetail;
    self->_leftSubDetail = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setRightTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *rightTitle;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_rightTitle;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    rightTitle = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    rightTitle = self->_rightTitle;
    self->_rightTitle = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setRightDetail:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *rightDetail;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_rightDetail;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    rightDetail = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    rightDetail = self->_rightDetail;
    self->_rightDetail = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setRightSubDetail:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *rightSubDetail;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_rightSubDetail;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    rightSubDetail = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    rightSubDetail = self->_rightSubDetail;
    self->_rightSubDetail = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setLeftTitleColor:(id)a3
{
  UIColor **p_leftTitleColor;
  id v5;

  p_leftTitleColor = &self->_leftTitleColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_leftTitleColor, a3);

}

- (void)setTitleFont:(id)a3
{
  UIFont **p_titleFont;
  id v5;

  p_titleFont = &self->_titleFont;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_titleFont, a3);

}

- (void)setLeftDetailColor:(id)a3
{
  UIColor **p_leftDetailColor;
  id v5;

  p_leftDetailColor = &self->_leftDetailColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_leftDetailColor, a3);

}

- (void)setLeftSubDetailColor:(id)a3
{
  UIColor **p_leftSubDetailColor;
  id v5;

  p_leftSubDetailColor = &self->_leftSubDetailColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_leftSubDetailColor, a3);

}

- (void)setRightTitleColor:(id)a3
{
  UIColor **p_rightTitleColor;
  id v5;

  p_rightTitleColor = &self->_rightTitleColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_rightTitleColor, a3);

}

- (void)setRightDetailColor:(id)a3
{
  UIColor **p_rightDetailColor;
  id v5;

  p_rightDetailColor = &self->_rightDetailColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_rightDetailColor, a3);

}

- (void)setRightSubDetailColor:(id)a3
{
  UIColor **p_rightSubDetailColor;
  id v5;

  p_rightSubDetailColor = &self->_rightSubDetailColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_rightSubDetailColor, a3);

}

- (void)beginUpdates
{
  ++self->_deferUpdateCounter;
}

- (void)endUpdates:(BOOL)a3
{
  unint64_t v3;

  v3 = self->_deferUpdateCounter - 1;
  self->_deferUpdateCounter = v3;
  if (!v3)
    -[PKFusedDoubleCellView _updateContent:](self, "_updateContent:", a3);
}

- (void)_updateContent:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  UILabel *leftTitleView;
  NSString *leftTitle;
  UIColor *leftTitleColor;
  void *v10;
  UILabel *rightTitleView;
  NSString *rightTitle;
  UIColor *rightTitleColor;
  void *v14;
  UILabel *leftDetailView;
  NSString *leftDetail;
  UIColor *leftDetailColor;
  void *v18;
  UILabel *rightDetailView;
  NSString *rightDetail;
  UIColor *rightDetailColor;
  void *v22;
  UILabel *leftSubDetailView;
  NSString *leftSubDetail;
  UIColor *leftSubDetailColor;
  void *v26;
  UILabel *rightSubDetailView;
  NSString *rightSubDetail;
  UIColor *rightSubDetailColor;
  void *v30;
  id v31;

  if (!self->_deferUpdateCounter)
  {
    v3 = a3;
    -[PKFusedDoubleCellView _titleFont](self, "_titleFont");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    -[PKFusedDoubleCellView _detailFont](self, "_detailFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFusedDoubleCellView _subDetailFont](self, "_subDetailFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_leftTitleView, "setFont:", v31);
    leftTitleView = self->_leftTitleView;
    leftTitle = self->_leftTitle;
    leftTitleColor = self->_leftTitleColor;
    if (leftTitleColor)
    {
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftTitleView, (uint64_t)self->_leftTitle, leftTitleColor, 0, v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftTitleView, (uint64_t)leftTitle, v10, 0, v3);

    }
    -[UILabel setFont:](self->_rightTitleView, "setFont:", v31);
    rightTitleView = self->_rightTitleView;
    rightTitle = self->_rightTitle;
    rightTitleColor = self->_rightTitleColor;
    if (rightTitleColor)
    {
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightTitleView, (uint64_t)self->_rightTitle, rightTitleColor, 0, v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightTitleView, (uint64_t)rightTitle, v14, 0, v3);

    }
    -[UILabel setFont:](self->_leftDetailView, "setFont:", v5);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_leftDetailView, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](self->_leftDetailView, "setMinimumScaleFactor:", 0.5);
    leftDetailView = self->_leftDetailView;
    leftDetail = self->_leftDetail;
    leftDetailColor = self->_leftDetailColor;
    if (leftDetailColor)
    {
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftDetailView, (uint64_t)self->_leftDetail, leftDetailColor, 1, v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftDetailView, (uint64_t)leftDetail, v18, 1, v3);

    }
    -[UILabel setFont:](self->_rightDetailView, "setFont:", v5);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_rightDetailView, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](self->_rightDetailView, "setMinimumScaleFactor:", 0.5);
    rightDetailView = self->_rightDetailView;
    rightDetail = self->_rightDetail;
    rightDetailColor = self->_rightDetailColor;
    if (rightDetailColor)
    {
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightDetailView, (uint64_t)self->_rightDetail, rightDetailColor, 1, v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightDetailView, (uint64_t)rightDetail, v22, 1, v3);

    }
    if (self->_leftSubDetail)
    {
      -[UILabel setFont:](self->_leftSubDetailView, "setFont:", v6);
      leftSubDetailView = self->_leftSubDetailView;
      leftSubDetail = self->_leftSubDetail;
      leftSubDetailColor = self->_leftSubDetailColor;
      if (leftSubDetailColor)
      {
        __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftSubDetailView, (uint64_t)leftSubDetail, leftSubDetailColor, 0, v3);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftSubDetailView, (uint64_t)leftSubDetail, v26, 0, v3);

      }
    }
    if (self->_rightSubDetail)
    {
      -[UILabel setFont:](self->_rightSubDetailView, "setFont:", v6);
      rightSubDetailView = self->_rightSubDetailView;
      rightSubDetail = self->_rightSubDetail;
      rightSubDetailColor = self->_rightSubDetailColor;
      if (rightSubDetailColor)
      {
        __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightSubDetailView, (uint64_t)rightSubDetail, rightSubDetailColor, 0, v3);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightSubDetailView, (uint64_t)rightSubDetail, v30, 0, v3);

      }
    }
    __45__PKAdjustableSingleCellView__updateContent___block_invoke(self->_disclosureView, self->_enableDisclosure, v3);
    __45__PKAdjustableSingleCellView__updateContent___block_invoke(self->_separatorView, 1u, v3);
    -[PKFusedDoubleCellView setNeedsLayout](self, "setNeedsLayout");
    if (v3)
      -[PKFusedDoubleCellView layoutIfNeeded](self, "layoutIfNeeded");
    -[PKFusedDoubleCellView setNeedsLayout](self, "setNeedsLayout");

  }
}

void __40__PKFusedDoubleCellView__updateContent___block_invoke_2(void *a1, uint64_t a2, void *a3, uint64_t a4, int a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  float v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  id v19;

  v9 = a1;
  if (v9)
  {
    if (a3)
    {
      v19 = v9;
      v10 = a3;
      objc_msgSend(v19, "setText:", a2);
      objc_msgSend(v19, "setTextColor:", v10);

      objc_msgSend(v19, "setLineBreakMode:", 0);
      objc_msgSend(v19, "setNumberOfLines:", a4);
      v9 = v19;
      if (a5)
      {
        objc_msgSend(v19, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (a2)
          v13 = 1.0;
        else
          v13 = 0.0;
        objc_msgSend(v11, "opacity");
        v15 = v14;
        if (v13 != v14)
        {
          objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v15, v13);
          v17 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v16);

          LODWORD(v18) = 0;
          if (a2)
            *(float *)&v18 = 1.0;
          objc_msgSend(v12, "setOpacity:", v18);
        }

        v9 = v19;
      }
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKFusedDoubleCellView;
  -[PKFusedDoubleCellView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[PKFusedDoubleCellView traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        objc_msgSend(v4, "preferredContentSizeCategory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)*MEMORY[0x1E0DC4938];

        if (v10 != v11)
          -[PKFusedDoubleCellView _updateContent:](self, "_updateContent:", 0);
      }
    }
  }

}

- (BOOL)enableDisclosure
{
  return self->_enableDisclosure;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)leftTitleColor
{
  return self->_leftTitleColor;
}

- (UIColor)leftDetailColor
{
  return self->_leftDetailColor;
}

- (UIColor)leftSubDetailColor
{
  return self->_leftSubDetailColor;
}

- (UIColor)rightTitleColor
{
  return self->_rightTitleColor;
}

- (UIColor)rightDetailColor
{
  return self->_rightDetailColor;
}

- (UIColor)rightSubDetailColor
{
  return self->_rightSubDetailColor;
}

- (NSString)leftTitle
{
  return self->_leftTitle;
}

- (NSString)leftDetail
{
  return self->_leftDetail;
}

- (NSString)leftSubDetail
{
  return self->_leftSubDetail;
}

- (NSString)rightTitle
{
  return self->_rightTitle;
}

- (NSString)rightDetail
{
  return self->_rightDetail;
}

- (NSString)rightSubDetail
{
  return self->_rightSubDetail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSubDetail, 0);
  objc_storeStrong((id *)&self->_rightDetail, 0);
  objc_storeStrong((id *)&self->_rightTitle, 0);
  objc_storeStrong((id *)&self->_leftSubDetail, 0);
  objc_storeStrong((id *)&self->_leftDetail, 0);
  objc_storeStrong((id *)&self->_leftTitle, 0);
  objc_storeStrong((id *)&self->_rightSubDetailColor, 0);
  objc_storeStrong((id *)&self->_rightDetailColor, 0);
  objc_storeStrong((id *)&self->_rightTitleColor, 0);
  objc_storeStrong((id *)&self->_leftSubDetailColor, 0);
  objc_storeStrong((id *)&self->_leftDetailColor, 0);
  objc_storeStrong((id *)&self->_leftTitleColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_rightSubDetailView, 0);
  objc_storeStrong((id *)&self->_rightDetailView, 0);
  objc_storeStrong((id *)&self->_rightTitleView, 0);
  objc_storeStrong((id *)&self->_leftSubDetailView, 0);
  objc_storeStrong((id *)&self->_leftDetailView, 0);
  objc_storeStrong((id *)&self->_leftTitleView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
