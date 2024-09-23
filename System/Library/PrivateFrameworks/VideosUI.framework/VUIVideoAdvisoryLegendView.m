@implementation VUIVideoAdvisoryLegendView

- (VUIVideoAdvisoryLegendView)initWithLayout:(id)a3
{
  id v5;
  VUIVideoAdvisoryLegendView *v6;
  VUIVideoAdvisoryLegendView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIVideoAdvisoryLegendView;
  v6 = -[VUIVideoAdvisoryLegendView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_layout, a3);

  return v7;
}

- (CGSize)legendNameSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VUIVideoAdvisoryLegendView bounds](self, "bounds");
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    height = v7;
    width = v6;
  }
  -[VUIVideoAdvisoryLegendView legendNameLabel](self, "legendNameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;
  v12 = v11;

  -[VUIVideoAdvisoryLegendView layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v12;
  if (v10 > v12)
  {
    objc_msgSend(v13, "legendNamePadding");
    v17 = v16;
    objc_msgSend(v14, "legendNamePadding");
    v15 = v10 + v17 + v18;
  }

  v19 = v15;
  v20 = v12;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)legendDescriptionSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VUIVideoAdvisoryLegendView bounds](self, "bounds");
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    height = v7;
    width = v6;
  }
  -[VUIVideoAdvisoryLegendView legendDescriptionLabel](self, "legendDescriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;
  v12 = v11;

  -[VUIVideoAdvisoryLegendView layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v12;
  if (v10 > v12)
  {
    objc_msgSend(v13, "legendNamePadding");
    v15 = v10 + v16;
  }

  v17 = v15;
  v18 = v12;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VUIVideoAdvisoryLegendView legendNameSizeThatFits:](self, "legendNameSizeThatFits:");
  v7 = v6;
  -[VUIVideoAdvisoryLegendView legendDescriptionLabel](self, "legendDescriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;

  if (v7 >= v10)
    v11 = v7;
  else
    v11 = v10;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)VUIVideoAdvisoryLegendView;
  -[VUIVideoAdvisoryLegendView layoutSubviews](&v41, sel_layoutSubviews);
  -[VUIVideoAdvisoryLegendView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIVideoAdvisoryLegendView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = -[VUIVideoAdvisoryLegendView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[VUIVideoAdvisoryLegendView legendNameSizeThatFits:](self, "legendNameSizeThatFits:", v5, v7);
  v10 = v9;
  objc_msgSend(v3, "legendNameMinWidth");
  v12 = v11;
  v13 = v5 - v7;
  -[VUIVideoAdvisoryLegendView legendNameLabel](self, "legendNameLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v8 == 1)
      v15 = v5 - v7;
    else
      v15 = 0.0;
    if (v10 >= v12)
      v16 = v10;
    else
      v16 = v12;
    if (v16 >= v7)
      v17 = v16;
    else
      v17 = v7;
    -[VUIVideoAdvisoryLegendView legendNameLabel](self, "legendNameLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v15, 0.0, v17, v7);

  }
  -[VUIVideoAdvisoryLegendView legendDescriptionLabel](self, "legendDescriptionLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeThatFits:", v5, v7);
  v21 = v20;
  v23 = v22;

  if (v8 == 1)
  {
    objc_msgSend(v3, "legendsMargin");
    v25 = v21 + v24;
    objc_msgSend(v3, "descriptionLayout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "margin");
    v28 = v13 - (v25 + v27);
  }
  else
  {
    -[VUIVideoAdvisoryLegendView legendNameLabel](self, "legendNameLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      -[VUIVideoAdvisoryLegendView legendNameLabel](self, "legendNameLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "frame");
      v31 = v30;
      objc_msgSend(v3, "legendsMargin");
      v33 = v31 + v32;
      objc_msgSend(v3, "descriptionLayout");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "margin");
      v28 = v33 + v35 + 0.0;

    }
    else
    {
      v28 = 0.0;
    }
  }

  -[VUIVideoAdvisoryLegendView legendNameLabel](self, "legendNameLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[VUIVideoAdvisoryLegendView legendNameLabel](self, "legendNameLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v39 = (v38 - v23) * 0.5;

  }
  else
  {
    v39 = 0.0;
  }

  -[VUIVideoAdvisoryLegendView legendDescriptionLabel](self, "legendDescriptionLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v28, v39, v21, v23);

}

- (NSString)legendName
{
  void *v2;
  void *v3;

  -[VUIVideoAdvisoryLegendView legendNameLabel](self, "legendNameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLegendName:(id)a3
{
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
  id v15;

  v15 = a3;
  if (objc_msgSend(v15, "length"))
  {
    -[VUIVideoAdvisoryLegendView layout](self, "layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legendLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v15, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIVideoAdvisoryLegendView layout](self, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "legendLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "margin");
    objc_msgSend(v6, "setPadding:");

    -[VUIVideoAdvisoryLegendView layout](self, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "legendBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v10);

    objc_msgSend(v6, "setClipsToBounds:", 1);
    objc_msgSend(v6, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideoAdvisoryLegendView layout](self, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "legendCornerRadius");
    objc_msgSend(v11, "setCornerRadius:");

    objc_msgSend(v6, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", *MEMORY[0x1E0CD2F28]);

    -[VUIVideoAdvisoryLegendView legendNameLabel](self, "legendNameLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");

    -[VUIVideoAdvisoryLegendView setLegendNameLabel:](self, "setLegendNameLabel:", v6);
    -[VUIVideoAdvisoryLegendView addSubview:](self, "addSubview:", v6);
    -[VUIVideoAdvisoryLegendView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (NSString)legendDescription
{
  void *v2;
  void *v3;

  -[VUIVideoAdvisoryLegendView legendDescriptionLabel](self, "legendDescriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLegendDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    -[VUIVideoAdvisoryLegendView layout](self, "layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptionLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v8, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIVideoAdvisoryLegendView legendDescriptionLabel](self, "legendDescriptionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[VUIVideoAdvisoryLegendView setLegendDescriptionLabel:](self, "setLegendDescriptionLabel:", v6);
    -[VUIVideoAdvisoryLegendView addSubview:](self, "addSubview:", v6);
    -[VUIVideoAdvisoryLegendView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (VUIVideoAdvisoryViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (VUILabel)legendNameLabel
{
  return self->_legendNameLabel;
}

- (void)setLegendNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_legendNameLabel, a3);
}

- (VUILabel)legendDescriptionLabel
{
  return self->_legendDescriptionLabel;
}

- (void)setLegendDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_legendDescriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legendDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_legendNameLabel, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
