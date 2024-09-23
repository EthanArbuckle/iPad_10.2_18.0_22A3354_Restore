@implementation VUIFamilyMemberCell

+ (void)configureVUIFamilyMemberCell:(id)a3 withFamilyMember:(id)a4 metricsOnly:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  VUITextLayout *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v7 = a4;
  objc_msgSend(v22, "setFamilyMember:", v7);
  objc_msgSend(v7, "memberImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DB18B0]);
    objc_msgSend(v9, "setImage:", v8);
    objc_msgSend(v22, "setFamilyMemberImageView:", v9);

  }
  if (!a5)
    objc_msgSend(v7, "setDelegate:", v22);
  v10 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v10, "setTextStyle:", 13);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v10, "setColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setHighlightOrSelectedColor:](v10, "setHighlightOrSelectedColor:", v12);

  -[VUITextLayout setAlignment:](v10, "setAlignment:", 2 * (objc_msgSend(v22, "effectiveUserInterfaceLayoutDirection") == 1));
  -[VUITextLayout setFontWeight:](v10, "setFontWeight:", 0);
  v13 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(v7, "firstName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setGivenName:", v14);

  objc_msgSend(v7, "lastName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFamilyName:", v15);

  v16 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v16, "setStyle:", 2);
  objc_msgSend(v16, "stringFromPersonNameComponents:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "nameLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v17, v10, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setNameLabel:", v19);
  +[VUIFamilyMemberCell _monogramViewForFamilyMemberCell:](VUIFamilyMemberCell, "_monogramViewForFamilyMemberCell:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "memberImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    objc_msgSend(v22, "setMonogramView:", v20);

}

- (VUIFamilyMemberCell)initWithFrame:(CGRect)a3
{
  VUIFamilyMemberCell *v3;
  double v4;
  double v5;
  void *v6;
  TVImageLayout *monogramImageLayout;
  id v8;
  VUISeparatorView *v9;
  VUISeparatorView *bottomSeparatorView;
  void *v11;
  void *v12;
  VUIVideosImageView *v13;
  uint64_t v14;
  VUIVideosImageView *chevronImageView;
  VUIVideosImageView *v16;
  void *v17;
  void *v18;
  VUIVideosImageView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)VUIFamilyMemberCell;
  v3 = -[VUIFamilyMemberCell initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[VUIFamilyMemberCell maxMonogramHeight](VUIFamilyMemberCell, "maxMonogramHeight");
    v5 = v4;
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setImageSize:", v5, v5);
    objc_msgSend(v6, "setAcceptsFocus:", 1);
    monogramImageLayout = v3->_monogramImageLayout;
    v3->_monogramImageLayout = (TVImageLayout *)v6;
    v8 = v6;

    v9 = objc_alloc_init(VUISeparatorView);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v9;

    -[VUIFamilyMemberCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v3->_bottomSeparatorView);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [VUIVideosImageView alloc];
    v14 = -[VUIVideosImageView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    chevronImageView = v3->_chevronImageView;
    v3->_chevronImageView = (VUIVideosImageView *)v14;

    v16 = v3->_chevronImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTintColor:renderingMode:", v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView setImage:](v16, "setImage:", v18);

    v19 = v3->_chevronImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTintColor:renderingMode:", v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView setHighlightOrSelectedImage:](v19, "setHighlightOrSelectedImage:", v21);

    -[VUIFamilyMemberCell contentView](v3, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v3->_chevronImageView);

    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIListCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v23);

    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIListCollectionViewCell setHighlightedBackgroundColor:](v3, "setHighlightedBackgroundColor:", v24);
  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIFamilyMemberCell;
  -[VUIListCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[VUIFamilyMemberCell familyMember](self, "familyMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[VUIFamilyMemberCell setFamilyMember:](self, "setFamilyMember:", 0);
  -[VUIFamilyMemberCell setFamilyMemberImageView:](self, "setFamilyMemberImageView:", 0);
  -[VUIFamilyMemberCell setMonogramView:](self, "setMonogramView:", 0);
  -[VUIFamilyMemberCell setNameLabel:](self, "setNameLabel:", 0);
  -[VUIFamilyMemberCell setChevronImageView:](self, "setChevronImageView:", 0);
  -[VUIFamilyMemberCell setBottomSeparatorView:](self, "setBottomSeparatorView:", 0);
}

- (void)setNameLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *nameLabel;
  void *v7;
  char v8;
  void *v9;
  VUILabel *v10;

  v5 = (VUILabel *)a3;
  nameLabel = self->_nameLabel;
  if (nameLabel != v5)
  {
    v10 = v5;
    -[VUILabel removeFromSuperview](nameLabel, "removeFromSuperview");
    if (v10)
    {
      -[VUIFamilyMemberCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[VUILabel isDescendantOfView:](v10, "isDescendantOfView:", v7);

      if ((v8 & 1) == 0)
      {
        -[VUIFamilyMemberCell contentView](self, "contentView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSubview:", v10);

      }
    }
    objc_storeStrong((id *)&self->_nameLabel, a3);
    -[VUIFamilyMemberCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setFamilyMemberImageView:(id)a3
{
  _TVImageView *v5;
  _TVImageView *familyMemberImageView;
  void *v7;
  char v8;
  void *v9;
  _TVImageView *v10;

  v5 = (_TVImageView *)a3;
  familyMemberImageView = self->_familyMemberImageView;
  if (familyMemberImageView != v5)
  {
    v10 = v5;
    -[_TVImageView removeFromSuperview](familyMemberImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_familyMemberImageView, a3);
    if (v10)
    {
      -[VUIFamilyMemberCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_TVImageView isDescendantOfView:](v10, "isDescendantOfView:", v7);

      if ((v8 & 1) == 0)
      {
        -[VUIFamilyMemberCell contentView](self, "contentView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSubview:", self->_familyMemberImageView);

      }
    }
    -[VUIFamilyMemberCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setMonogramView:(id)a3
{
  _TVMonogramView *v5;
  _TVMonogramView *monogramView;
  void *v7;
  char v8;
  void *v9;
  _TVMonogramView *v10;

  v5 = (_TVMonogramView *)a3;
  monogramView = self->_monogramView;
  if (monogramView != v5)
  {
    v10 = v5;
    -[_TVMonogramView removeFromSuperview](monogramView, "removeFromSuperview");
    if (v10)
    {
      -[VUIFamilyMemberCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_TVMonogramView isDescendantOfView:](v10, "isDescendantOfView:", v7);

      if ((v8 & 1) == 0)
      {
        -[VUIFamilyMemberCell contentView](self, "contentView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSubview:", v10);

      }
    }
    objc_storeStrong((id *)&self->_monogramView, a3);
    -[VUIFamilyMemberCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIFamilyMemberCell _iOS_layoutSubviewsWithSize:computationOnly:](self, "_iOS_layoutSubviewsWithSize:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIFamilyMemberCell;
  -[VUIFamilyMemberCell layoutSubviews](&v5, sel_layoutSubviews);
  -[VUIFamilyMemberCell bounds](self, "bounds");
  -[VUIFamilyMemberCell _iOS_layoutSubviewsWithSize:computationOnly:](self, "_iOS_layoutSubviewsWithSize:computationOnly:", 0, v3, v4);
}

- (void)familyMember:(id)a3 photoRequestDidCompleteWithImage:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v10 = __69__VUIFamilyMemberCell_familyMember_photoRequestDidCompleteWithImage___block_invoke;
    v11 = &unk_1E9F9A938;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    v8 = v9;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v10((uint64_t)v8);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __69__VUIFamilyMemberCell_familyMember_photoRequestDidCompleteWithImage___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_alloc_init(MEMORY[0x1E0DB18B0]);
  objc_msgSend(v2, "setImage:", *(_QWORD *)(a1 + 32));
  if (v2)
  {
    objc_msgSend(WeakRetained, "monogramView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(WeakRetained, "setMonogramView:", 0);
  }
  objc_msgSend(WeakRetained, "setFamilyMemberImageView:", v2);

}

+ (double)maxMonogramHeight
{
  return 72.0;
}

- (CGSize)monogramSize
{
  double v2;
  double v3;
  CGSize result;

  -[TVImageLayout decoratorSize](self->_monogramImageLayout, "decoratorSize");
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)_monogramViewForFamilyMemberCell:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "colorWithRed:green:blue:alpha:", 0.4, 0.4, 0.4, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.780392, 0.780392, 0.8, 0.8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1880]), "initWithStyle:", 0);
  objc_msgSend(v6, "setUnfocusedBgColor:", v5);
  objc_msgSend(v6, "setFocusedBgColor:", v24);
  objc_msgSend(v4, "monogramImageLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decoratorSize");
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB18C0]), "initWithFrame:configuration:", v6, 0.0, 0.0, v9, v11);
  objc_msgSend(v12, "setControlState:animated:", 0, 0);
  objc_msgSend(v6, "focusedSizeIncrease");
  objc_msgSend(v12, "setFocusedSizeIncrease:");
  objc_msgSend(v4, "monogramImageLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tv_setLayout:", v13);

  objc_msgSend(v12, "setFocusedStateEnabled:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 21.0, *MEMORY[0x1E0DC1430]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v15, 21.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0DB18B8]);
  objc_msgSend(v4, "familyMember");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyMember");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "lastName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v17, "initWithFirstName:lastName:imageURL:font:", v19, v21, 0, v16);

  objc_msgSend(v22, "setCornerRadius:", v9 * 0.5);
  objc_msgSend(v22, "setSize:", v9, v11);
  objc_msgSend(v6, "focusedSizeIncrease");
  objc_msgSend(v22, "setUpscaleAdjustment:");
  objc_msgSend(v22, "setFillColor:", v5);
  objc_msgSend(v12, "setMonogramDescription:", v22);

  return v12;
}

- (void)configureMonogramImageLayoutForWindowWidth:(double)a3
{
  double v4;
  double v5;
  void *v6;
  TVImageLayout *monogramImageLayout;

  +[VUIFamilyMemberCell maxMonogramHeight](VUIFamilyMemberCell, "maxMonogramHeight", a3);
  v5 = v4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setImageSize:", v5, v5);
  objc_msgSend(v6, "setAcceptsFocus:", 1);
  monogramImageLayout = self->_monogramImageLayout;
  self->_monogramImageLayout = (TVImageLayout *)v6;

}

- (CGSize)_iOS_layoutSubviewsWithSize:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  BOOL v6;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  _TVMonogramView *monogramView;
  _TVMonogramView *v20;
  _TVImageView *familyMemberImageView;
  _TVImageView *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  VUISeparatorView *bottomSeparatorView;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  VUIVideosImageView *chevronImageView;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  double MaxX;
  CGFloat v47;
  double v48;
  double v49;
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
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double v94;
  CGSize result;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  height = a3.height;
  width = a3.width;
  v6 = a3.width == *MEMORY[0x1E0C9D820] && a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8);
  v94 = a3.height;
  if (!v6)
  {
    v9 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", a3.width);
    if ((unint64_t)(v9 - 4) >= 3)
      v10 = 50.0;
    else
      v10 = 72.0;
    v11 = 66.0;
    if ((unint64_t)(v9 - 4) < 3)
      v11 = 96.0;
    v94 = v11;
    v13 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", width);
    rect_24 = v16;
    v77 = v17;
    v18 = -[VUIFamilyMemberCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    -[VUIFamilyMemberCell bounds](self, "bounds");
    monogramView = self->_monogramView;
    rect_8 = v15;
    rect_16 = v15;
    v79 = v13;
    v80 = v14;
    v89 = v12;
    if (monogramView)
    {
      v20 = monogramView;
      v89 = 0.0;
      rect_16 = v10;
      v80 = v10;
      v79 = rect_24;
    }
    familyMemberImageView = self->_familyMemberImageView;
    if (familyMemberImageView)
    {
      v22 = familyMemberImageView;

      v23 = 0.0;
      v24 = v10;
      v25 = rect_24;
      monogramView = v22;
      v72 = v10;
      v73 = v10;
      v87 = 0.0;
      v71 = rect_24;
      v26 = rect_8;
    }
    else
    {
      v26 = v15;
      v10 = rect_16;
      v25 = v79;
      v24 = v80;
      v23 = v89;
      v72 = v14;
      v73 = rect_8;
      v87 = v12;
      v71 = v13;
    }
    bottomSeparatorView = self->_bottomSeparatorView;
    v75 = v12;
    v76 = v26;
    v28 = v14;
    v78 = v13;
    v74 = v13;
    v81 = v23;
    v83 = v24;
    rect = v25;
    v88 = v12;
    if (bottomSeparatorView)
    {
      -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", width - rect_24, 1.79769313e308);
      v30 = v29;
      v76 = v31;
      if (monogramView)
      {
        v96.origin.x = rect;
        v96.origin.y = v81;
        v96.size.width = v83;
        v96.size.height = v10;
        v74 = CGRectGetMaxX(v96) + 12.0;
        v97.origin.x = rect;
        v97.origin.y = v81;
        v97.size.width = v83;
        v97.size.height = v10;
        v30 = v30 - (CGRectGetWidth(v97) + 12.0);
      }
      else
      {
        v74 = rect_24;
      }
      -[VUISeparatorView lineHeight](self->_bottomSeparatorView, "lineHeight");
      v75 = height - v32;
      v28 = v30;
      v23 = v81;
      v24 = v83;
      v25 = rect;
    }
    v69 = v10;
    v70 = v28;
    chevronImageView = self->_chevronImageView;
    v34 = rect_8;
    v85 = v12;
    v86 = v14;
    v35 = v78;
    if (chevronImageView)
    {
      -[VUIVideosImageView image](chevronImageView, "image");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "size");
      v38 = v37;
      v34 = v39;

      if (v18 == 1)
      {
        VUIRectWithFlippedOriginRelativeToBoundingRect();
        v35 = v40;
        v85 = v41;
        v86 = v42;
        v34 = v43;
      }
      else
      {
        v85 = (height - v34) * 0.5;
        v86 = v38;
        v35 = width - v77 - v38;
      }
      v23 = v81;
      v24 = v83;
      v25 = rect;
    }
    v84 = v34;
    if (self->_nameLabel)
    {
      v14 = width - rect_24 - v77;
      if (monogramView)
      {
        v82 = v35;
        if (v18 == 1)
        {
          v98.origin.x = v35;
          v98.origin.y = v85;
          v44 = v86;
          v45 = v23;
          v98.size.width = v86;
          v98.size.height = v34;
          MaxX = CGRectGetMaxX(v98);
          v47 = v69;
        }
        else
        {
          v99.origin.x = v25;
          v99.origin.y = v23;
          v45 = v23;
          v99.size.width = v24;
          v47 = v69;
          v99.size.height = v69;
          MaxX = CGRectGetMaxX(v99);
          v44 = v86;
        }
        rect_24 = MaxX + 12.0;
        v100.origin.x = rect;
        v100.origin.y = v45;
        v100.size.width = v24;
        v100.size.height = v47;
        v14 = v14 - (CGRectGetWidth(v100) + 12.0);
        v48 = v89;
        v35 = v82;
      }
      else
      {
        v48 = v89;
        v44 = v86;
      }
      if (self->_chevronImageView)
      {
        v101.origin.x = v35;
        v101.origin.y = v85;
        v101.size.width = v44;
        v101.size.height = v34;
        v14 = v14 - (CGRectGetWidth(v101) + 12.0);
      }
      -[VUILabel topMarginWithBaselineMargin:](self->_nameLabel, "topMarginWithBaselineMargin:", 32.0, *(_QWORD *)&v69);
      v51 = v50;
      -[VUILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", v14, 1.79769313e308);
      v49 = v52;
      -[VUILabel bottomMarginWithBaselineMargin:](self->_nameLabel, "bottomMarginWithBaselineMargin:", 16.0);
      v54 = v53;
      v102.origin.x = rect_24;
      v102.origin.y = v51;
      v102.size.width = v14;
      v102.size.height = v49;
      v55 = v54 + v51 + CGRectGetHeight(v102);
      v56 = v94;
      if (v94 < v55)
        v56 = v55;
      v94 = v56;
      v88 = (v56 - v49) * 0.5;
    }
    else
    {
      rect_24 = v78;
      v48 = v89;
      v49 = rect_8;
    }
    v58 = v72;
    v57 = v73;
    if (self->_familyMemberImageView)
    {
      v87 = (v94 - v73) * 0.5;
      if (v18 == 1)
      {
        VUIRectWithFlippedOriginRelativeToBoundingRect();
        v87 = v60;
        v58 = v61;
        v57 = v62;
        if (a4)
          goto LABEL_49;
        goto LABEL_46;
      }
    }
    else if (self->_monogramView)
    {
      v48 = (v94 - rect_16) * 0.5;
      if (v18 == 1)
      {
        VUIRectWithFlippedOriginRelativeToBoundingRect();
        v79 = v63;
        v80 = v64;
        v48 = v65;
        rect_16 = v66;
      }
    }
    v59 = v71;
    if (a4)
    {
LABEL_49:

      goto LABEL_50;
    }
LABEL_46:
    -[_TVImageView setFrame:](self->_familyMemberImageView, "setFrame:", v59, v87, v58, v57, *(_QWORD *)&v69);
    if (!self->_familyMemberImageView)
      -[_TVMonogramView setFrame:](self->_monogramView, "setFrame:", v79, v48, v80, rect_16);
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v74, v75, v70, v76);
    -[VUILabel setFrame:](self->_nameLabel, "setFrame:", rect_24, v88, v14, v49);
    -[VUIVideosImageView setFrame:](self->_chevronImageView, "setFrame:", v35, v85, v86, v84);
    goto LABEL_49;
  }
LABEL_50:
  v67 = width;
  v68 = v94;
  result.height = v68;
  result.width = v67;
  return result;
}

- (VUIFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_familyMember, a3);
}

- (VUILabel)nameLabel
{
  return self->_nameLabel;
}

- (TVImageLayout)monogramImageLayout
{
  return self->_monogramImageLayout;
}

- (void)setMonogramImageLayout:(id)a3
{
  objc_storeStrong((id *)&self->_monogramImageLayout, a3);
}

- (_TVMonogramView)monogramView
{
  return self->_monogramView;
}

- (_TVImageView)familyMemberImageView
{
  return self->_familyMemberImageView;
}

- (VUIVideosImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void)setBottomSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_familyMemberImageView, 0);
  objc_storeStrong((id *)&self->_monogramView, 0);
  objc_storeStrong((id *)&self->_monogramImageLayout, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
