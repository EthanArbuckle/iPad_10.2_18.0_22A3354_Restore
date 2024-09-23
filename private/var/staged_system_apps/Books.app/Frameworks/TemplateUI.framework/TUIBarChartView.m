@implementation TUIBarChartView

+ (id)renderModelWithIdentifier:(id)a3 title:(id)a4 footer:(id)a5 columns:(int64_t)a6 cornerRadius:(double)a7 progress:(double)a8 spacing:(double)a9 color:(id)a10 backgroundColor:(id)a11 shadowColor:(id)a12
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _TUIBarChartRenderModel *v27;
  TUIRenderModelView *v28;

  v21 = a12;
  v22 = a11;
  v23 = a10;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  v27 = objc_alloc_init(_TUIBarChartRenderModel);
  -[_TUIBarChartRenderModel setTitle:](v27, "setTitle:", v25);

  -[_TUIBarChartRenderModel setFooter:](v27, "setFooter:", v24);
  -[_TUIBarChartRenderModel setColumns:](v27, "setColumns:", a6);
  -[_TUIBarChartRenderModel setCornerRadius:](v27, "setCornerRadius:", a7);
  -[_TUIBarChartRenderModel setProgress:](v27, "setProgress:", a8);
  -[_TUIBarChartRenderModel setSpacing:](v27, "setSpacing:", a9);
  -[_TUIBarChartRenderModel setColor:](v27, "setColor:", v23);

  -[_TUIBarChartRenderModel setBackgroundColor:](v27, "setBackgroundColor:", v22);
  -[_TUIBarChartRenderModel setShadowColor:](v27, "setShadowColor:", v21);

  v28 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierBarChartView"), v26, v27);
  return v28;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIBarChartView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v7, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v7.receiver, v7.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  -[TUIBarChartView _configureWithModel:](self, "_configureWithModel:", v6);

}

- (void)_configureWithModel:(id)a3
{
  _TUIBarChartRenderModel **p_renderModel;
  NSString *v6;
  NSString *title;
  NSString *v8;
  NSString *footer;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  p_renderModel = &self->_renderModel;
  objc_storeStrong((id *)&self->_renderModel, a3);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel title](self->_renderModel, "title"));
  title = self->_title;
  self->_title = v6;

  v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel footer](self->_renderModel, "footer"));
  footer = self->_footer;
  self->_footer = v8;

  self->_columns = (int64_t)objc_msgSend(v19, "columns");
  objc_msgSend(v19, "cornerRadius");
  self->_cornerRadius = v10;
  objc_msgSend(v19, "progress");
  self->_progress = v11;
  objc_msgSend(v19, "spacing");
  self->_spacing = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel color](self->_renderModel, "color"));
  v14 = v13;
  if (!v13)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  objc_storeStrong((id *)&self->_color, v14);
  if (!v13)

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel color](*p_renderModel, "color"));
  v16 = v15;
  if (!v15)
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_storeStrong((id *)&self->_backgroundColor, v16);
  if (!v15)

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel color](*p_renderModel, "color"));
  v18 = v17;
  if (!v17)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](UIColor, "yellowColor"));
  objc_storeStrong((id *)&self->_shadowColor, v18);
  if (!v17)

  -[TUIBarChartView _setupTextFields](self, "_setupTextFields");
  -[TUIBarChartView _setupBarChartBars](self, "_setupBarChartBars");

}

- (void)_setupTextFields
{
  void *v3;
  id v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBarChartView title](self, "title"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[TUIBarChartView setCalculatedInsetForTitleText:](self, "setCalculatedInsetForTitleText:", 20.0);
    -[TUIBarChartView bounds](self, "bounds");
    v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, v5, 20.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBarChartView title](self, "title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uppercaseString"));
    objc_msgSend(v6, "setText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0));
    objc_msgSend(v6, "setFont:", v9);

    objc_msgSend(v6, "setNumberOfLines:", 1);
    objc_msgSend(v6, "setClipsToBounds:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v6, "setBackgroundColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v6, "setTextColor:", v11);

    objc_msgSend(v6, "setTextAlignment:", 1);
    -[TUIBarChartView addSubview:](self, "addSubview:", v6);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBarChartView footer](self, "footer"));
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    -[TUIBarChartView setCalculatedInsetForFooterText:](self, "setCalculatedInsetForFooterText:", 20.0);
    -[TUIBarChartView bounds](self, "bounds");
    v15 = v14 + -20.0;
    -[TUIBarChartView bounds](self, "bounds");
    v22 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, v15, v16, 20.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBarChartView footer](self, "footer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uppercaseString"));
    objc_msgSend(v22, "setText:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
    objc_msgSend(v22, "setFont:", v19);

    objc_msgSend(v22, "setNumberOfLines:", 1);
    objc_msgSend(v22, "setClipsToBounds:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v22, "setBackgroundColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    objc_msgSend(v22, "setTextColor:", v21);

    objc_msgSend(v22, "setTextAlignment:", 1);
    -[TUIBarChartView addSubview:](self, "addSubview:", v22);

  }
}

- (void)_setupBarChartBars
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat Height;
  CGFloat v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  CGRect v32;
  CGRect v33;

  -[TUIBarChartView spacing](self, "spacing");
  v3 = 6.0;
  if (v4 > 0.0)
  {
    -[TUIBarChartView spacing](self, "spacing");
    v3 = v5;
  }
  -[TUIBarChartView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[TUIBarChartView calculatedInsetForTitleText](self, "calculatedInsetForTitleText");
  v15 = v14;
  -[TUIBarChartView calculatedInsetForFooterText](self, "calculatedInsetForFooterText");
  v17 = v13 - (v15 + v16);
  v18 = -[TUIBarChartView columns](self, "columns");
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v17;
  v19 = (CGRectGetWidth(v32) - (double)(v18 - 1) * v3) / (double)v18;
  if (v18 <= 1)
    v20 = 1;
  else
    v20 = v18;
  v21 = 0.0;
  do
  {
    -[TUIBarChartView calculatedInsetForTitleText](self, "calculatedInsetForTitleText");
    v23 = v22;
    v24 = (double)arc4random_uniform(0x65u) / -100.0;
    v33.origin.x = v21;
    v33.origin.y = v23;
    v33.size.width = v19;
    v33.size.height = v17;
    Height = CGRectGetHeight(v33);
    v26 = Height + Height * v24;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    objc_msgSend(v27, "setBounds:", v21, v23, v19, v17);
    objc_msgSend(v27, "setFrame:", v21, v23, v19, v17);
    objc_msgSend(v27, "setBorderColor:", -[UIColor CGColor](self->_color, "CGColor"));
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[UIColor colorWithAlphaComponent:](self->_color, "colorWithAlphaComponent:", 0.1)));
    objc_msgSend(v27, "setBackgroundColor:", objc_msgSend(v28, "CGColor"));

    objc_msgSend(v27, "setCornerRadius:", self->_cornerRadius);
    objc_msgSend(v27, "setMasksToBounds:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBarChartView layer](self, "layer"));
    objc_msgSend(v29, "addSublayer:", v27);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    v31 = v23 + v26;
    objc_msgSend(v30, "setBounds:", v21, v31, v19, v17);
    objc_msgSend(v30, "setFrame:", v21, v31, v19, v17);
    objc_msgSend(v30, "setBorderColor:", -[UIColor CGColor](self->_color, "CGColor"));
    objc_msgSend(v30, "setBackgroundColor:", objc_msgSend(v27, "borderColor"));
    objc_msgSend(v30, "setCornerRadius:", self->_cornerRadius);
    objc_msgSend(v30, "setMasksToBounds:", 1);
    objc_msgSend(v27, "addSublayer:", v30);

    v21 = v3 + v19 + v21;
    --v20;
  }
  while (v20);
}

- (BOOL)clipsToBounds
{
  return 1;
}

- (_TUIBarChartRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (NSString)chartType
{
  return self->_chartType;
}

- (void)setChartType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(int64_t)a3
{
  self->_columns = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (double)calculatedInsetForTitleText
{
  return self->_calculatedInsetForTitleText;
}

- (void)setCalculatedInsetForTitleText:(double)a3
{
  self->_calculatedInsetForTitleText = a3;
}

- (double)calculatedInsetForFooterText
{
  return self->_calculatedInsetForFooterText;
}

- (void)setCalculatedInsetForFooterText:(double)a3
{
  self->_calculatedInsetForFooterText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_chartType, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end
