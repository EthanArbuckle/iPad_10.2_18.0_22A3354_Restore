@implementation VUIDebugMetricsEventCell

- (VUIDebugMetricsEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VUIDebugMetricsEventCell *v4;
  VUITextLayout *v5;
  void *v6;
  VUITextLayout *eventTypeLabelLayout;
  uint64_t v8;
  VUILabel *eventTypeLabel;
  void *v10;
  VUITextLayout *v11;
  void *v12;
  VUITextLayout *subhead1LabelLayout;
  VUITextLayout *v14;
  uint64_t v15;
  VUILabel *subhead1Label;
  void *v17;
  VUITextLayout *v18;
  void *v19;
  VUITextLayout *subhead2LabelLayout;
  VUITextLayout *v21;
  uint64_t v22;
  VUILabel *subhead2Label;
  void *v24;
  VUITextLayout *v25;
  void *v26;
  VUITextLayout *subhead3LabelLayout;
  VUITextLayout *v28;
  uint64_t v29;
  VUILabel *subhead3Label;
  void *v31;
  VUITextLayout *v32;
  void *v33;
  VUITextLayout *tabNameLabelLayout;
  VUITextLayout *v35;
  uint64_t v36;
  VUILabel *tabNameLabel;
  void *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  UIImageView *tabImageView;
  void *v46;
  VUISeparatorView *v47;
  VUISeparatorView *separatorView;
  void *v49;
  VUITextLayout *v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)VUIDebugMetricsEventCell;
  v4 = -[VUIDebugMetricsEventCell initWithStyle:reuseIdentifier:](&v52, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v5, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v5, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v5, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setTextStyle:](v5, "setTextStyle:", 3);
    -[VUITextLayout setMaximumContentSizeCategory:](v5, "setMaximumContentSizeCategory:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v5, "setColor:", v6);

    -[VUITextLayout setFontWeight:](v5, "setFontWeight:", 7);
    eventTypeLabelLayout = v4->_eventTypeLabelLayout;
    v4->_eventTypeLabelLayout = v5;
    v51 = v5;

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v51, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    eventTypeLabel = v4->_eventTypeLabel;
    v4->_eventTypeLabel = (VUILabel *)v8;

    -[VUIDebugMetricsEventCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4->_eventTypeLabel);

    v11 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v11, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v11, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v11, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setTextStyle:](v11, "setTextStyle:", 17);
    -[VUITextLayout setMaximumContentSizeCategory:](v11, "setMaximumContentSizeCategory:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v11, "setColor:", v12);

    subhead1LabelLayout = v4->_subhead1LabelLayout;
    v4->_subhead1LabelLayout = v11;
    v14 = v11;

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    subhead1Label = v4->_subhead1Label;
    v4->_subhead1Label = (VUILabel *)v15;

    -[VUIDebugMetricsEventCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v4->_subhead1Label);

    v18 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v18, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v18, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v18, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setTextStyle:](v18, "setTextStyle:", 17);
    -[VUITextLayout setMaximumContentSizeCategory:](v18, "setMaximumContentSizeCategory:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v18, "setColor:", v19);

    subhead2LabelLayout = v4->_subhead2LabelLayout;
    v4->_subhead2LabelLayout = v18;
    v21 = v18;

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    subhead2Label = v4->_subhead2Label;
    v4->_subhead2Label = (VUILabel *)v22;

    -[VUIDebugMetricsEventCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v4->_subhead2Label);

    v25 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v25, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v25, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v25, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setTextStyle:](v25, "setTextStyle:", 17);
    -[VUITextLayout setMaximumContentSizeCategory:](v25, "setMaximumContentSizeCategory:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v25, "setColor:", v26);

    subhead3LabelLayout = v4->_subhead3LabelLayout;
    v4->_subhead3LabelLayout = v25;
    v28 = v25;

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v21, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    subhead3Label = v4->_subhead3Label;
    v4->_subhead3Label = (VUILabel *)v29;

    -[VUIDebugMetricsEventCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v4->_subhead3Label);

    v32 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v32, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v32, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v32, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setTextStyle:](v32, "setTextStyle:", 3);
    -[VUITextLayout setMaximumContentSizeCategory:](v32, "setMaximumContentSizeCategory:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v32, "setColor:", v33);

    tabNameLabelLayout = v4->_tabNameLabelLayout;
    v4->_tabNameLabelLayout = v32;
    v35 = v32;

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v35, 0);
    v36 = objc_claimAutoreleasedReturnValue();
    tabNameLabel = v4->_tabNameLabel;
    v4->_tabNameLabel = (VUILabel *)v36;

    -[VUIDebugMetricsEventCell contentView](v4, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v4->_tabNameLabel);

    v39 = objc_alloc(MEMORY[0x1E0DC3890]);
    v40 = *MEMORY[0x1E0C9D648];
    v41 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v43 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v44 = objc_msgSend(v39, "initWithFrame:", *MEMORY[0x1E0C9D648], v41, v42, v43);
    tabImageView = v4->_tabImageView;
    v4->_tabImageView = (UIImageView *)v44;

    -[VUIDebugMetricsEventCell contentView](v4, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addSubview:", v4->_tabImageView);

    v47 = -[VUISeparatorView initWithFrame:]([VUISeparatorView alloc], "initWithFrame:", v40, v41, v42, v43);
    separatorView = v4->_separatorView;
    v4->_separatorView = v47;

    -[VUIDebugMetricsEventCell contentView](v4, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSubview:", v4->_separatorView);

  }
  return v4;
}

- (void)setEventTypeLabelStr:(id)a3
{
  NSString *v4;
  NSString *eventTypeLabelStr;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  eventTypeLabelStr = self->_eventTypeLabelStr;
  self->_eventTypeLabelStr = v4;

  -[VUILabel setText:](self->_eventTypeLabel, "setText:", self->_eventTypeLabelStr);
  -[VUIDebugMetricsEventCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubhead1LabelStr:(id)a3
{
  NSString *v4;
  NSString *subhead1LabelStr;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subhead1LabelStr = self->_subhead1LabelStr;
  self->_subhead1LabelStr = v4;

  -[VUILabel setText:](self->_subhead1Label, "setText:", self->_subhead1LabelStr);
  -[VUIDebugMetricsEventCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubhead2LabelStr:(id)a3
{
  NSString *v4;
  NSString *subhead2LabelStr;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subhead2LabelStr = self->_subhead2LabelStr;
  self->_subhead2LabelStr = v4;

  -[VUILabel setText:](self->_subhead2Label, "setText:", self->_subhead2LabelStr);
  -[VUIDebugMetricsEventCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubhead3LabelStr:(id)a3
{
  NSString *v4;
  NSString *subhead3LabelStr;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subhead3LabelStr = self->_subhead3LabelStr;
  self->_subhead3LabelStr = v4;

  -[VUILabel setText:](self->_subhead3Label, "setText:", self->_subhead3LabelStr);
  -[VUIDebugMetricsEventCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubhead1LabelColor:(id)a3
{
  -[VUILabel setTextColor:](self->_subhead1Label, "setTextColor:", a3);
}

- (void)setSubhead2LabelColor:(id)a3
{
  -[VUILabel setTextColor:](self->_subhead2Label, "setTextColor:", a3);
}

- (void)setSubhead3LabelColor:(id)a3
{
  -[VUILabel setTextColor:](self->_subhead3Label, "setTextColor:", a3);
}

- (void)setTabName:(id)a3
{
  NSString *v4;
  NSString *tabName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tabName = self->_tabName;
  self->_tabName = v4;

  -[VUILabel setText:](self->_tabNameLabel, "setText:", self->_tabName);
  -[VUIDebugMetricsEventCell setNeedsLayout](self, "setNeedsLayout");
}

- (UIImage)tabImage
{
  return -[UIImageView image](self->_tabImageView, "image");
}

- (void)setTabImage:(id)a3
{
  -[UIImageView setImage:](self->_tabImageView, "setImage:", a3);
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat Width;
  CGFloat *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double Height;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  NSUInteger v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double recta;
  CGFloat rect;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGRect v67;
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
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  -[VUIDebugMetricsEventCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v12 = v11;
  v14 = v13;
  v67.origin.x = v4;
  v67.origin.y = v6;
  v67.size.width = v8;
  v67.size.height = v10;
  Width = CGRectGetWidth(v67);
  v16 = (CGFloat *)MEMORY[0x1E0C9D648];
  v62 = v14;
  v17 = Width - v12 - v14;
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v68.origin.x = v4;
  v68.origin.y = v6;
  v68.size.width = v8;
  v68.size.height = v10;
  -[VUILabel sizeThatFits:](self->_eventTypeLabel, "sizeThatFits:", v17, CGRectGetHeight(v68));
  v53 = v20;
  v54 = v19;
  v69.origin.x = v4;
  v69.origin.y = v6;
  v69.size.width = v8;
  v69.size.height = v10;
  -[VUILabel sizeThatFits:](self->_subhead1Label, "sizeThatFits:", v17, CGRectGetHeight(v69));
  v22 = v21;
  v52 = v23;
  v70.origin.x = v4;
  v70.origin.y = v6;
  v70.size.width = v8;
  v70.size.height = v10;
  -[VUILabel sizeThatFits:](self->_subhead2Label, "sizeThatFits:", v17, CGRectGetHeight(v70));
  v58 = v25;
  recta = v24;
  v71.origin.x = v4;
  v71.origin.y = v6;
  v71.size.width = v8;
  v71.size.height = v10;
  -[VUILabel sizeThatFits:](self->_subhead3Label, "sizeThatFits:", v17, CGRectGetHeight(v71));
  v55 = v27;
  v56 = v26;
  v63 = v6;
  v64 = v4;
  v72.origin.x = v4;
  v72.origin.y = v6;
  v65 = v10;
  v66 = v8;
  v72.size.width = v8;
  v72.size.height = v10;
  Height = CGRectGetHeight(v72);
  v73.origin.x = v12;
  v73.origin.y = v18;
  v73.size.width = v54;
  v73.size.height = v53;
  v29 = CGRectGetHeight(v73);
  v74.origin.x = v12;
  v74.origin.y = v18;
  v74.size.width = v22;
  v74.size.height = v52;
  v30 = v29 + CGRectGetHeight(v74);
  v75.origin.x = v12;
  v75.origin.y = v18;
  v75.size.width = v22;
  v75.size.height = v52;
  v31 = (Height - (v30 + CGRectGetHeight(v75))) * 0.5;
  -[VUILabel setFrame:](self->_eventTypeLabel, "setFrame:", v12, v31, v54, v53);
  v76.origin.x = v12;
  v76.origin.y = v31;
  v76.size.width = v54;
  v76.size.height = v53;
  v32 = v31 + CGRectGetHeight(v76) + 5.0;
  -[VUILabel setFrame:](self->_subhead1Label, "setFrame:", v12, v32, v22, v52);
  v77.origin.x = v12;
  v77.origin.y = v18;
  v77.size.width = recta;
  v77.size.height = v58;
  v33 = v32 + CGRectGetHeight(v77);
  -[VUILabel setFrame:](self->_subhead2Label, "setFrame:", v12, v33, recta, v58);
  v78.origin.x = v12;
  rect = v18;
  v78.origin.y = v18;
  v78.size.width = v56;
  v78.size.height = v55;
  v59 = v12;
  -[VUILabel setFrame:](self->_subhead3Label, "setFrame:", v12, v33 + CGRectGetHeight(v78), v56, v55);
  v34 = -[NSString length](self->_tabName, "length");
  v35 = *v16;
  if (v34)
  {
    v37 = v63;
    v36 = v64;
    v79.origin.x = v64;
    v79.origin.y = v63;
    v79.size.width = v8;
    v79.size.height = v65;
    -[VUILabel sizeThatFits:](self->_tabNameLabel, "sizeThatFits:", v17, CGRectGetHeight(v79));
    v39 = v38;
    v57 = v38;
    v41 = v40;
    v80.origin.x = v64;
    v80.origin.y = v63;
    v80.size.width = v8;
    v80.size.height = v65;
    v42 = CGRectGetWidth(v80) - v62;
    v81.origin.x = v35;
    v81.origin.y = rect;
    v81.size.width = v39;
    v81.size.height = v41;
    v43 = v42 - CGRectGetWidth(v81);
    v82.origin.x = v64;
    v82.origin.y = v63;
    v82.size.width = v8;
    v82.size.height = v65;
    v44 = CGRectGetHeight(v82);
    v83.origin.x = v43;
    v83.origin.y = rect;
    v83.size.width = v57;
    v83.size.height = v41;
    -[VUILabel setFrame:](self->_tabNameLabel, "setFrame:", v43, (v44 - CGRectGetHeight(v83)) * 0.5, v57, v41);
  }
  else
  {
    -[UIImageView sizeThatFits:](self->_tabImageView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v46 = v45;
    v48 = v47;
    v37 = v63;
    v36 = v64;
    v84.origin.x = v64;
    v84.origin.y = v63;
    v84.size.width = v8;
    v84.size.height = v65;
    v49 = CGRectGetHeight(v84);
    v85.origin.x = v35;
    v85.origin.y = rect;
    v85.size.width = v46;
    v85.size.height = v48;
    v50 = (v49 - CGRectGetHeight(v85)) * 0.5;
    v86.origin.x = v64;
    v86.origin.y = v63;
    v86.size.width = v8;
    v86.size.height = v65;
    v51 = CGRectGetWidth(v86) - v62;
    v87.origin.x = v35;
    v87.origin.y = v50;
    v87.size.width = v46;
    v87.size.height = v48;
    -[UIImageView setFrame:](self->_tabImageView, "setFrame:", v51 - CGRectGetWidth(v87), v50, v46, v48);
  }
  -[UIImageView setHidden:](self->_tabImageView, "setHidden:", -[NSString length](self->_tabName, "length") != 0);
  -[VUILabel setHidden:](self->_tabNameLabel, "setHidden:", -[NSString length](self->_tabName, "length") == 0);
  v88.origin.x = v36;
  v88.origin.y = v37;
  v88.size.height = v65;
  v88.size.width = v66;
  -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", v59, CGRectGetHeight(v88) + -1.0, v17, 1.0);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDebugMetricsEventCell;
  -[VUIDebugMetricsEventCell prepareForReuse](&v3, sel_prepareForReuse);
  -[VUILabel setText:](self->_eventTypeLabel, "setText:", 0);
  -[VUILabel setText:](self->_subhead1Label, "setText:", 0);
  -[VUILabel setText:](self->_subhead2Label, "setText:", 0);
  -[VUILabel setText:](self->_subhead3Label, "setText:", 0);
  -[UIImageView setImage:](self->_tabImageView, "setImage:", 0);
}

- (NSString)eventTypeLabelStr
{
  return self->_eventTypeLabelStr;
}

- (NSString)subhead1LabelStr
{
  return self->_subhead1LabelStr;
}

- (NSString)subhead2LabelStr
{
  return self->_subhead2LabelStr;
}

- (NSString)subhead3LabelStr
{
  return self->_subhead3LabelStr;
}

- (NSString)tabName
{
  return self->_tabName;
}

- (VUILabel)eventTypeLabel
{
  return self->_eventTypeLabel;
}

- (void)setEventTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_eventTypeLabel, a3);
}

- (VUITextLayout)eventTypeLabelLayout
{
  return self->_eventTypeLabelLayout;
}

- (void)setEventTypeLabelLayout:(id)a3
{
  objc_storeStrong((id *)&self->_eventTypeLabelLayout, a3);
}

- (VUILabel)subhead1Label
{
  return self->_subhead1Label;
}

- (void)setSubhead1Label:(id)a3
{
  objc_storeStrong((id *)&self->_subhead1Label, a3);
}

- (VUITextLayout)subhead1LabelLayout
{
  return self->_subhead1LabelLayout;
}

- (void)setSubhead1LabelLayout:(id)a3
{
  objc_storeStrong((id *)&self->_subhead1LabelLayout, a3);
}

- (VUILabel)subhead2Label
{
  return self->_subhead2Label;
}

- (void)setSubhead2Label:(id)a3
{
  objc_storeStrong((id *)&self->_subhead2Label, a3);
}

- (VUITextLayout)subhead2LabelLayout
{
  return self->_subhead2LabelLayout;
}

- (void)setSubhead2LabelLayout:(id)a3
{
  objc_storeStrong((id *)&self->_subhead2LabelLayout, a3);
}

- (VUILabel)subhead3Label
{
  return self->_subhead3Label;
}

- (void)setSubhead3Label:(id)a3
{
  objc_storeStrong((id *)&self->_subhead3Label, a3);
}

- (VUITextLayout)subhead3LabelLayout
{
  return self->_subhead3LabelLayout;
}

- (void)setSubhead3LabelLayout:(id)a3
{
  objc_storeStrong((id *)&self->_subhead3LabelLayout, a3);
}

- (VUILabel)tabNameLabel
{
  return self->_tabNameLabel;
}

- (void)setTabNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tabNameLabel, a3);
}

- (VUITextLayout)tabNameLabelLayout
{
  return self->_tabNameLabelLayout;
}

- (void)setTabNameLabelLayout:(id)a3
{
  objc_storeStrong((id *)&self->_tabNameLabelLayout, a3);
}

- (UIImageView)tabImageView
{
  return self->_tabImageView;
}

- (void)setTabImageView:(id)a3
{
  objc_storeStrong((id *)&self->_tabImageView, a3);
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_tabImageView, 0);
  objc_storeStrong((id *)&self->_tabNameLabelLayout, 0);
  objc_storeStrong((id *)&self->_tabNameLabel, 0);
  objc_storeStrong((id *)&self->_subhead3LabelLayout, 0);
  objc_storeStrong((id *)&self->_subhead3Label, 0);
  objc_storeStrong((id *)&self->_subhead2LabelLayout, 0);
  objc_storeStrong((id *)&self->_subhead2Label, 0);
  objc_storeStrong((id *)&self->_subhead1LabelLayout, 0);
  objc_storeStrong((id *)&self->_subhead1Label, 0);
  objc_storeStrong((id *)&self->_eventTypeLabelLayout, 0);
  objc_storeStrong((id *)&self->_eventTypeLabel, 0);
  objc_storeStrong((id *)&self->_tabName, 0);
  objc_storeStrong((id *)&self->_subhead3LabelStr, 0);
  objc_storeStrong((id *)&self->_subhead2LabelStr, 0);
  objc_storeStrong((id *)&self->_subhead1LabelStr, 0);
  objc_storeStrong((id *)&self->_eventTypeLabelStr, 0);
}

@end
