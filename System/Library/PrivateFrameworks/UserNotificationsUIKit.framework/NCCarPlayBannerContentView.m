@implementation NCCarPlayBannerContentView

- (NCCarPlayBannerContentView)init
{
  NCCarPlayBannerContentView *v2;
  void *v3;
  void *v4;
  UILabel *v5;
  UILabel *primaryTextLabel;
  UILabel *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *primarySubtitleTextLabel;
  UILabel *v12;
  void *v13;
  uint64_t v14;
  CPUIBannerViewButton *okButton;
  uint64_t v16;
  CPUIBannerViewButton *actionButton;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NCCarPlayBannerContentView;
  v2 = -[NCCarPlayBannerContentView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCarPlayBannerContentView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[NCCarPlayBannerContentView _primaryFont](v2, "_primaryFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryTextLabel = v2->_primaryTextLabel;
    v2->_primaryTextLabel = v5;

    -[UILabel setFont:](v2->_primaryTextLabel, "setFont:", v4);
    v7 = v2->_primaryTextLabel;
    objc_msgSend((id)objc_opt_class(), "_textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    -[NCCarPlayBannerContentView _subtitleFont](v2, "_subtitleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primarySubtitleTextLabel = v2->_primarySubtitleTextLabel;
    v2->_primarySubtitleTextLabel = v10;

    -[UILabel setFont:](v2->_primarySubtitleTextLabel, "setFont:", v9);
    v12 = v2->_primarySubtitleTextLabel;
    objc_msgSend((id)objc_opt_class(), "_textColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x1E0D0D388], "buttonWithOK");
    v14 = objc_claimAutoreleasedReturnValue();
    okButton = v2->_okButton;
    v2->_okButton = (CPUIBannerViewButton *)v14;

    objc_msgSend(MEMORY[0x1E0D0D388], "buttonWithChevronImage");
    v16 = objc_claimAutoreleasedReturnValue();
    actionButton = v2->_actionButton;
    v2->_actionButton = (CPUIBannerViewButton *)v16;

    -[NCCarPlayBannerContentView _updateButtonStates](v2, "_updateButtonStates");
    -[NCCarPlayBannerContentView addSubview:](v2, "addSubview:", v2->_primaryTextLabel);
    -[NCCarPlayBannerContentView addSubview:](v2, "addSubview:", v2->_primarySubtitleTextLabel);
    -[NCCarPlayBannerContentView addSubview:](v2, "addSubview:", v2->_okButton);
    -[NCCarPlayBannerContentView addSubview:](v2, "addSubview:", v2->_actionButton);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NCCarPlayBannerContentView _setRelevanceDate:allDay:timeZone:style:](self, "_setRelevanceDate:allDay:timeZone:style:", 0, 0, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)NCCarPlayBannerContentView;
  -[NCCarPlayBannerContentView dealloc](&v3, sel_dealloc);
}

- (void)invalidateDisplayProperties
{
  self->_displayPropertiesValid = 0;
  -[NCCarPlayBannerContentView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 60.0;
  result.height = v3;
  return result;
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
  _BOOL4 v11;
  CPUIBannerViewButton *actionButton;
  double Width;
  double MinX;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NCBadgedIconView *badgedIconView;
  uint64_t v28;
  double v29;
  uint64_t v30;
  int v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id *p_primaryTextLabel;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  UILabel **p_primarySubtitleTextLabel;
  double v49;
  double v50;
  double v51;
  UILabel *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  BSUIDateLabel *relevanceDateLabel;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  -[NCCarPlayBannerContentView _reloadDisplayPropertiesIfNecessary](self, "_reloadDisplayPropertiesIfNecessary");
  -[NCCarPlayBannerContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[NCCarPlayBannerContentView _shouldShowOKButton](self, "_shouldShowOKButton");
  actionButton = self->_actionButton;
  if (v11)
  {
    -[CPUIBannerViewButton setHidden:](actionButton, "setHidden:", 1);
    -[CPUIBannerViewButton setHidden:](self->_okButton, "setHidden:", 0);
    -[NCCarPlayBannerContentView _layoutForButton:contentFrame:](self, "_layoutForButton:contentFrame:", self->_okButton, v4, v6, v8, v10);
    -[CPUIBannerViewButton bounds](self->_okButton, "bounds");
    Width = CGRectGetWidth(v68);
    if (-[NCCarPlayBannerContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[CPUIBannerViewButton frame](self->_okButton, "frame");
      MinX = CGRectGetMinX(v69);
      -[CPUIBannerViewButton bounds](self->_okButton, "bounds");
      v4 = v4 + MinX + CGRectGetWidth(v70);
    }
  }
  else
  {
    -[CPUIBannerViewButton setHidden:](actionButton, "setHidden:", 0);
    -[NCCarPlayBannerContentView _layoutForButton:contentFrame:](self, "_layoutForButton:contentFrame:", self->_actionButton, v4, v6, v8, v10);
    -[CPUIBannerViewButton bounds](self->_actionButton, "bounds");
    Width = CGRectGetWidth(v71);
    if (-[NCCarPlayBannerContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[CPUIBannerViewButton frame](self->_actionButton, "frame");
      v15 = CGRectGetMinX(v72);
      -[CPUIBannerViewButton bounds](self->_actionButton, "bounds");
      v4 = v4 + v15 + CGRectGetWidth(v73);
    }
    -[CPUIBannerViewButton setHidden:](self->_okButton, "setHidden:", 1);
  }
  v16 = v8 - (Width + 12.0 + 12.0);
  -[NCCarPlayBannerContentView _iconImageInsets](self, "_iconImageInsets");
  v19 = v18;
  if (self->_badgedIconView)
  {
    v20 = v6 + v17;
    v21 = -[NCCarPlayBannerContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v22 = v4;
    v23 = v6;
    v24 = v16;
    v25 = v10;
    if (v21)
      v26 = CGRectGetMaxX(*(CGRect *)&v22) - v19 + -40.0;
    else
      v26 = v19 + CGRectGetMinX(*(CGRect *)&v22);
    v19 = v19 + 48.0;
    badgedIconView = self->_badgedIconView;
    v28 = 0x4044000000000000;
    v29 = v20;
    v30 = 0x4044000000000000;
    v74 = CGRectIntegral(*(CGRect *)&v26);
    -[NCBadgedIconView setFrame:](badgedIconView, "setFrame:", v74.origin.x, v74.origin.y, v74.size.width, v74.size.height);
  }
  v31 = -[NCCarPlayBannerContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v32 = -0.0;
  if (!v31)
    v32 = v19;
  v33 = v4 + v32;
  v34 = v16 - v19;
  -[BSUIDateLabel attributedText](self->_relevanceDateLabel, "attributedText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "size");
  v37 = v36;
  v67 = v38;

  v39 = v37 + 8.0;
  if (!self->_relevanceDateLabel)
    v39 = 0.0;
  v40 = v34 - v39;
  p_primaryTextLabel = (id *)&self->_primaryTextLabel;
  -[UILabel sizeThatFits:](self->_primaryTextLabel, "sizeThatFits:", v34 - v39, v10);
  if (v40 >= v42)
    v44 = v42;
  else
    v44 = v40;
  if (v10 >= v43)
    v45 = v43;
  else
    v45 = v10;
  v46 = v33;
  if (-[NCCarPlayBannerContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v75.origin.x = v33;
    v75.origin.y = v6;
    v75.size.width = v34;
    v75.size.height = v10;
    v46 = CGRectGetMaxX(v75) - v44;
  }
  if (-[NCCarPlayBannerContentView _hasSubtitle](self, "_hasSubtitle"))
  {
    v76.origin.y = v6 + 24.0 - self->_primaryAscender;
    v47 = *p_primaryTextLabel;
    v76.origin.x = v46;
    v76.size.width = v44;
    v76.size.height = v45;
    v77 = CGRectIntegral(v76);
    objc_msgSend(v47, "setFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
    p_primarySubtitleTextLabel = &self->_primarySubtitleTextLabel;
    -[UILabel sizeThatFits:](self->_primarySubtitleTextLabel, "sizeThatFits:", v34, v10);
    if (v34 >= v49)
      v44 = v49;
    else
      v44 = v34;
    if (v10 >= v50)
      v45 = v50;
    else
      v45 = v10;
    if (-[NCCarPlayBannerContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v46 = v34 + v33 - v44;
    else
      v46 = v33;
    v51 = v6 + 41.0 - self->_subTitleAscender;
  }
  else
  {
    v51 = v6 + floor((v10 - v45) * 0.5);
    p_primarySubtitleTextLabel = &self->_primaryTextLabel;
  }
  v52 = *p_primarySubtitleTextLabel;
  v53 = v46;
  v54 = v44;
  v55 = v45;
  v78 = CGRectIntegral(*(CGRect *)(&v51 - 1));
  -[UILabel setFrame:](v52, "setFrame:", v78.origin.x, v78.origin.y, v78.size.width, v78.size.height);
  if (self->_relevanceDateLabel)
  {
    objc_msgSend(*p_primaryTextLabel, "frame");
    v57 = v56;
    v59 = v58 + 2.0;
    if ((-[NCCarPlayBannerContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) != 0)
    {
      objc_msgSend(*p_primaryTextLabel, "frame");
      v60 = CGRectGetMinX(v79);
      v80.origin.x = v57;
      v80.origin.y = v59;
      v80.size.width = v37;
      v61 = v67;
      v80.size.height = v67;
      v62 = v60 - CGRectGetWidth(v80) + -8.0;
    }
    else
    {
      objc_msgSend(*p_primaryTextLabel, "frame");
      v62 = CGRectGetMaxX(v81) + 8.0;
      v61 = v67;
    }
    relevanceDateLabel = self->_relevanceDateLabel;
    v64 = v59;
    v65 = v37;
    v66 = v61;
    v82 = CGRectIntegral(*(CGRect *)&v62);
    -[BSUIDateLabel setFrame:](relevanceDateLabel, "setFrame:", v82.origin.x, v82.origin.y, v82.size.width, v82.size.height);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UILabel *primaryTextLabel;
  void *v9;
  UILabel *primarySubtitleTextLabel;
  void *v11;
  BSUIDateLabel *relevanceDateLabel;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NCCarPlayBannerContentView;
  v4 = a3;
  -[NCCarPlayBannerContentView traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, v4);
  -[NCCarPlayBannerContentView invalidateDisplayProperties](self, "invalidateDisplayProperties", v14.receiver, v14.super_class);
  -[NCCarPlayBannerContentView _updateButtonStates](self, "_updateButtonStates");
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCCarPlayBannerContentView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    primaryTextLabel = self->_primaryTextLabel;
    -[NCCarPlayBannerContentView _primaryFont](self, "_primaryFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](primaryTextLabel, "setFont:", v9);

    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    -[NCCarPlayBannerContentView _subtitleFont](self, "_subtitleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](primarySubtitleTextLabel, "setFont:", v11);

    relevanceDateLabel = self->_relevanceDateLabel;
    -[NCCarPlayBannerContentView _defaultRelevanceDateFont](self, "_defaultRelevanceDateFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIDateLabel setFont:](relevanceDateLabel, "setFont:", v13);

    -[NCCarPlayBannerContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_layoutForButton:(id)a3 contentFrame:(CGRect)a4
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  v16 = a3;
  objc_msgSend(v16, "bounds");
  v8 = v7;
  v10 = v9;
  v11 = -[NCCarPlayBannerContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v12 = width - v8 + -12.0;
  if (v11)
    v12 = 12.0;
  v13 = round((height - v10) * 0.5);
  v14 = v8;
  v15 = v10;
  v17 = CGRectIntegral(*(CGRect *)&v12);
  objc_msgSend(v16, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  objc_msgSend(v16, "setHidden:", 0);

}

- (UIEdgeInsets)_iconImageInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[NCCarPlayBannerContentView bounds](self, "bounds");
  -[NCCarPlayBannerContentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  UIRoundToScale();
  v5 = v4;

  v6 = 10.0;
  v7 = 10.0;
  v8 = v5;
  v9 = v5;
  result.right = v7;
  result.bottom = v9;
  result.left = v6;
  result.top = v8;
  return result;
}

- (BOOL)_hasSubtitle
{
  void *v2;
  BOOL v3;

  -[UILabel text](self->_primarySubtitleTextLabel, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)_primaryFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = *MEMORY[0x1E0DC4B10];
  -[NCCarPlayBannerContentView _boundedTraitCollectionForLabelFont](self, "_boundedTraitCollectionForLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *MEMORY[0x1E0DC13C0];
  v14 = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1420]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ascender");
  self->_primaryAscender = v12;

  return v11;
}

- (id)_subtitleFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = *MEMORY[0x1E0DC4B10];
  -[NCCarPlayBannerContentView _boundedTraitCollectionForLabelFont](self, "_boundedTraitCollectionForLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ascender");
  self->_subTitleAscender = v8;

  return v7;
}

- (id)_defaultRelevanceDateFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0DC1358];
  v3 = *MEMORY[0x1E0DC4A98];
  -[NCCarPlayBannerContentView _boundedTraitCollectionForLabelFont](self, "_boundedTraitCollectionForLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_boundedTraitCollectionForLabelFont
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  id *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  -[NCCarPlayBannerContentView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
  v5 = *MEMORY[0x1E0DC48F0];
  v18[0] = *MEMORY[0x1E0DC48F8];
  v18[1] = v5;
  v6 = *MEMORY[0x1E0DC48D0];
  v18[2] = *MEMORY[0x1E0DC48D8];
  v18[3] = v6;
  v7 = *MEMORY[0x1E0DC48C0];
  v18[4] = *MEMORY[0x1E0DC48C8];
  v18[5] = v7;
  v18[6] = *MEMORY[0x1E0DC48B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if ((v9 & 1) != 0)
  {
    v10 = (id *)MEMORY[0x1E0DC4900];
LABEL_5:
    v14 = *v10;

    goto LABEL_6;
  }
  v11 = *MEMORY[0x1E0DC4908];
  v17[0] = *MEMORY[0x1E0DC4930];
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v4);

  v14 = v4;
  if (v13)
  {
    v10 = (id *)MEMORY[0x1E0DC4920];
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_setRelevanceDate:(id)a3 allDay:(BOOL)a4 timeZone:(id)a5 style:(int64_t)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  BSUIDateLabel *relevanceDateLabel;
  BSUIDateLabel *v15;
  void *v16;
  BSUIDateLabel *v17;
  void *v18;
  BSUIDateLabel *v19;
  BSUIDateLabel *v20;
  BSUIDateLabel *v21;
  void *v22;
  BSUIDateLabel *v23;
  void *v24;
  id v25;

  v8 = a4;
  v25 = a3;
  v10 = a5;
  v11 = v25;
  v12 = v10;
  if (v25)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v13 = objc_claimAutoreleasedReturnValue();
      v11 = v25;
      v12 = (void *)v13;
    }
    relevanceDateLabel = self->_relevanceDateLabel;
    if (relevanceDateLabel)
    {
      -[BSUIDateLabel setStartDate:withTimeZone:](relevanceDateLabel, "setStartDate:withTimeZone:", v11, v12);
      -[BSUIDateLabel setEndDate:withTimeZone:](self->_relevanceDateLabel, "setEndDate:withTimeZone:", v25, v12);
      -[BSUIDateLabel setDelegate:](self->_relevanceDateLabel, "setDelegate:", self);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startLabelWithStartDate:endDate:timeZone:allDay:forStyle:", v25, 0, v12, v8, a6);
      v19 = (BSUIDateLabel *)objc_claimAutoreleasedReturnValue();
      v20 = self->_relevanceDateLabel;
      self->_relevanceDateLabel = v19;

      v21 = self->_relevanceDateLabel;
      -[NCCarPlayBannerContentView _defaultRelevanceDateFont](self, "_defaultRelevanceDateFont");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSUIDateLabel setFont:](v21, "setFont:", v22);

      v23 = self->_relevanceDateLabel;
      objc_msgSend((id)objc_opt_class(), "_textColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSUIDateLabel setTextColor:](v23, "setTextColor:", v24);

      -[BSUIDateLabel setDelegate:](self->_relevanceDateLabel, "setDelegate:", self);
      -[NCCarPlayBannerContentView addSubview:](self, "addSubview:", self->_relevanceDateLabel);

    }
  }
  else
  {
    v15 = self->_relevanceDateLabel;
    if (v15)
    {
      -[BSUIDateLabel setDelegate:](v15, "setDelegate:", 0);
      objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recycleLabel:", self->_relevanceDateLabel);

      v17 = self->_relevanceDateLabel;
      self->_relevanceDateLabel = 0;

    }
  }

}

- (void)_updateButtonStates
{
  _BOOL8 v3;
  id v4;

  -[NCCarPlayBannerContentView traitCollection](self, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v4, "interactionModel") & 2) != 0 || objc_msgSend(v4, "primaryInteractionModel") == 8;
  -[CPUIBannerViewButton setSelected:](self->_okButton, "setSelected:", v3);
  -[CPUIBannerViewButton setSelected:](self->_actionButton, "setSelected:", v3);

}

- (BOOL)_shouldShowOKButton
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "bannerContentViewShouldShowOKButton:", self);
  else
    v4 = 1;

  return v4;
}

- (void)_reloadDisplayPropertiesIfNecessary
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (!self->_displayPropertiesValid)
  {
    self->_displayPropertiesValid = 1;
    -[NCCarPlayBannerContentView date](self, "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[NCCarPlayBannerContentView isDateAllDay](self, "isDateAllDay");
    -[NCCarPlayBannerContentView timeZone](self, "timeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCarPlayBannerContentView _setRelevanceDate:allDay:timeZone:style:](self, "_setRelevanceDate:allDay:timeZone:style:", v5, v3, v4, -[NCCarPlayBannerContentView dateFormatStyle](self, "dateFormatStyle"));

  }
}

- (NSString)primaryText
{
  return -[UILabel text](self->_primaryTextLabel, "text");
}

- (void)setPrimaryText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCCarPlayBannerContentView primaryText](self, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_primaryTextLabel, "setText:", v6);
    -[NCCarPlayBannerContentView invalidateDisplayProperties](self, "invalidateDisplayProperties");
  }

}

- (NSString)primarySubtitleText
{
  return -[UILabel text](self->_primarySubtitleTextLabel, "text");
}

- (void)setPrimarySubtitleText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCCarPlayBannerContentView primarySubtitleText](self, "primarySubtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_primarySubtitleTextLabel, "setText:", v6);
    -[NCCarPlayBannerContentView invalidateDisplayProperties](self, "invalidateDisplayProperties");
  }

}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    date = self->_date;
    self->_date = v4;

    -[NCCarPlayBannerContentView invalidateDisplayProperties](self, "invalidateDisplayProperties");
  }

}

- (void)setDateAllDay:(BOOL)a3
{
  if (self->_dateAllDay != a3)
  {
    self->_dateAllDay = a3;
    -[NCCarPlayBannerContentView invalidateDisplayProperties](self, "invalidateDisplayProperties");
  }
}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *timeZone;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSTimeZone *)objc_msgSend(v6, "copy");
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    -[NCCarPlayBannerContentView invalidateDisplayProperties](self, "invalidateDisplayProperties");
  }

}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    -[NCCarPlayBannerContentView invalidateDisplayProperties](self, "invalidateDisplayProperties");
  }
}

- (unint64_t)primaryTextMaximumNumberOfLines
{
  return -[UILabel numberOfLines](self->_primaryTextLabel, "numberOfLines");
}

- (void)setPrimaryTextMaximumNumberOfLines:(unint64_t)a3
{
  if (-[NCCarPlayBannerContentView primaryTextMaximumNumberOfLines](self, "primaryTextMaximumNumberOfLines") != a3)
  {
    -[UILabel setNumberOfLines:](self->_primaryTextLabel, "setNumberOfLines:", a3);
    -[NCCarPlayBannerContentView invalidateDisplayProperties](self, "invalidateDisplayProperties");
  }
}

- (unint64_t)primarySubtitleTextMaximumNumberOfLines
{
  return -[UILabel numberOfLines](self->_primarySubtitleTextLabel, "numberOfLines");
}

- (void)setPrimarySubtitleTextMaximumNumberOfLines:(unint64_t)a3
{
  if (-[NCCarPlayBannerContentView primarySubtitleTextMaximumNumberOfLines](self, "primarySubtitleTextMaximumNumberOfLines") != a3)
  {
    -[UILabel setNumberOfLines:](self->_primarySubtitleTextLabel, "setNumberOfLines:", a3);
    -[NCCarPlayBannerContentView invalidateDisplayProperties](self, "invalidateDisplayProperties");
  }
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCCarPlayBannerContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FDA8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *strokeVisualStylingProvider;
  MTVisualStylingProvider *v8;
  MTVisualStylingProvider *v9;

  v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    v9 = v6;
    v8 = strokeVisualStylingProvider;
    objc_storeStrong((id *)&self->_strokeVisualStylingProvider, a3);
    if (self->_badgedIconView)
    {
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v8, "stopAutomaticallyUpdatingView:");
      -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v9, "automaticallyUpdateView:withStyle:", self->_badgedIconView, 0);
    }

    v6 = v9;
  }

}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

- (void)setBadgedIconView:(id)a3
{
  NCBadgedIconView **p_badgedIconView;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  p_badgedIconView = &self->_badgedIconView;
  v6 = BSEqualObjects();
  v7 = v8;
  if ((v6 & 1) == 0)
  {
    -[NCBadgedIconView removeFromSuperview](*p_badgedIconView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView)
      -[NCCarPlayBannerContentView addSubview:](self, "addSubview:");
    -[NCCarPlayBannerContentView setNeedsLayout](self, "setNeedsLayout");
    v7 = v8;
  }

}

+ (id)_textColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isDateAllDay
{
  return self->_dateAllDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->adjustsFontForContentSizeCategory = a3;
}

- (NCBadgedIconView)badgedIconView
{
  return self->_badgedIconView;
}

- (NCCarPlayBannerContentViewDelegate)delegate
{
  return (NCCarPlayBannerContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_relevanceDateLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_primarySubtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
}

@end
