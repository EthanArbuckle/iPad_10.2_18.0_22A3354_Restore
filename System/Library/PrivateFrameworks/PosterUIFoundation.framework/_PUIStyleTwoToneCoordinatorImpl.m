@implementation _PUIStyleTwoToneCoordinatorImpl

- (id)effectiveColor1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[PUIStyleUICoordinatorImpl variationSupportingStyle](self, "variationSupportingStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variationAppliedColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PUIStyleUICoordinatorImpl style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)effectiveColor2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[PUIStyleUICoordinatorImpl variationSupportingStyle](self, "variationSupportingStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variationAppliedColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PUIStyleUICoordinatorImpl style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (double)itemViewLuminance
{
  void *v2;
  PUIColorValues *v3;
  void *v4;
  double v5;
  double v6;

  -[_PUIStyleTwoToneCoordinatorImpl effectiveColor1](self, "effectiveColor1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v2);
  -[PUIColorValues hslValues](v3, "hslValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "luminance");
  v6 = v5;

  return v6;
}

- (id)itemView
{
  UIView *itemView;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  UIView *v9;
  UIView *v10;
  UIView *v11;
  UIView *v12;
  UIView *v13;
  UIView *color1View;
  UIView *v15;
  UIView *color2View;

  itemView = self->_itemView;
  if (!itemView)
  {
    -[_PUIStyleTwoToneCoordinatorImpl effectiveColor1](self, "effectiveColor1");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PUIStyleTwoToneCoordinatorImpl effectiveColor2](self, "effectiveColor2");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = v4;
    v8 = v7;

    v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    -[UIView setClipsToBounds:](v9, "setClipsToBounds:", 1);
    v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 25.0, 50.0);
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v4);
    -[UIView setAutoresizingMask:](v10, "setAutoresizingMask:", 22);
    -[UIView addSubview:](v9, "addSubview:", v10);
    v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 25.0, 0.0, 25.0, 50.0);
    -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 19);
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v8);

    -[UIView addSubview:](v9, "addSubview:", v11);
    v12 = self->_itemView;
    self->_itemView = v9;
    v13 = v9;

    color1View = self->_color1View;
    self->_color1View = v10;
    v15 = v10;

    color2View = self->_color2View;
    self->_color2View = v11;

    itemView = self->_itemView;
  }
  return itemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color2View, 0);
  objc_storeStrong((id *)&self->_color1View, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
