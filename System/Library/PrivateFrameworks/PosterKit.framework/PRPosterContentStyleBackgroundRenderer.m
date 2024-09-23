@implementation PRPosterContentStyleBackgroundRenderer

- (PRPosterContentStyleBackgroundRenderer)initWithView:(id)a3
{
  id v5;
  PRPosterContentStyleBackgroundRenderer *v6;
  PRPosterContentStyleBackgroundRenderer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterContentStyleBackgroundRenderer;
  v6 = -[PRPosterContentStyleBackgroundRenderer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_view, a3);

  return v7;
}

- (void)clearAnyPreviousStyle
{
  NSArray *colorViews;
  NSArray *v4;
  UIColor *originalBackgroundColor;
  _PRContentStyleGradientView *gradientView;

  colorViews = self->_colorViews;
  if (colorViews)
  {
    -[NSArray performSelector:](colorViews, "performSelector:", sel_removeFromSuperview);
    v4 = self->_colorViews;
    self->_colorViews = 0;

  }
  if (self->_originalBackgroundColor)
  {
    -[UIView setBackgroundColor:](self->_view, "setBackgroundColor:");
    originalBackgroundColor = self->_originalBackgroundColor;
    self->_originalBackgroundColor = 0;

  }
  gradientView = self->_gradientView;
  if (gradientView)
    -[_PRContentStyleGradientView removeFromSuperview](gradientView, "removeFromSuperview");
}

- (void)renderDiscreteColorStyle:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  id v16;
  double MidX;
  void *v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  NSArray *v23;
  NSArray *colorViews;
  UIColor *v25;
  UIColor *originalBackgroundColor;
  UIView *view;
  _QWORD v28[3];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PRPosterContentStyleBackgroundRenderer clearAnyPreviousStyle](self, "clearAnyPreviousStyle");
  if ((objc_msgSend(v4, "allowsVariation") & 1) != 0)
    objc_msgSend(v4, "variationAppliedColors");
  else
    objc_msgSend(v4, "colors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self->_view, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    -[UIView backgroundColor](self->_view, "backgroundColor");
    v25 = (UIColor *)objc_claimAutoreleasedReturnValue();
    originalBackgroundColor = self->_originalBackgroundColor;
    self->_originalBackgroundColor = v25;

    view = self->_view;
    objc_msgSend(v5, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](view, "setBackgroundColor:", v14);
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    MidX = CGRectGetMidX(v29);
    v30.origin.x = v7;
    v30.origin.y = v9;
    v30.size.width = v11;
    v30.size.height = v13;
    v18 = (void *)objc_msgSend(v16, "initWithFrame:", 0.0, 0.0, MidX, CGRectGetMaxY(v30));
    objc_msgSend(v18, "setBackgroundColor:", v14);
    objc_msgSend(v18, "setAutoresizingMask:", 22);
    -[UIView addSubview:](self->_view, "addSubview:", v18);
    v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v31.origin.x = v7;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v13;
    v20 = CGRectGetMidX(v31);
    v32.origin.x = v7;
    v32.origin.y = v9;
    v32.size.width = v11;
    v32.size.height = v13;
    v21 = CGRectGetMidX(v32);
    v33.origin.x = v7;
    v33.origin.y = v9;
    v33.size.width = v11;
    v33.size.height = v13;
    v22 = (void *)objc_msgSend(v19, "initWithFrame:", v20, 0.0, v21, CGRectGetMaxY(v33));
    objc_msgSend(v22, "setAutoresizingMask:", 19);
    objc_msgSend(v22, "setBackgroundColor:", v15);
    -[UIView addSubview:](self->_view, "addSubview:", v22);
    v28[0] = v18;
    v28[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    colorViews = self->_colorViews;
    self->_colorViews = v23;

  }
}

- (void)renderGradientStyle:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  id *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _PRContentStyleGradientView *gradientView;
  _PRContentStyleGradientView *v20;
  _PRContentStyleGradientView *v21;
  _PRContentStyleGradientView *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v4 = a3;
  -[PRPosterContentStyleBackgroundRenderer clearAnyPreviousStyle](self, "clearAnyPreviousStyle");
  objc_msgSend(v4, "colors");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "gradientType");
  v6 = (id *)MEMORY[0x1E0CD2F50];
  v7 = (id *)MEMORY[0x1E0CD2F58];
  if (v5 != 1)
    v7 = (id *)MEMORY[0x1E0CD2F48];
  if (v5 != 2)
    v6 = v7;
  v8 = *v6;
  objc_msgSend(v4, "locations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startPoint");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "endPoint");
  v15 = v14;
  v17 = v16;

  objc_msgSend(v23, "bs_map:", &__block_literal_global_33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  gradientView = self->_gradientView;
  if (!gradientView)
  {
    v20 = [_PRContentStyleGradientView alloc];
    -[UIView bounds](self->_view, "bounds");
    v25 = CGRectInset(v24, -10.0, -10.0);
    v21 = -[_PRContentStyleGradientView initWithFrame:](v20, "initWithFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
    -[_PRContentStyleGradientView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
    v22 = self->_gradientView;
    self->_gradientView = v21;

    gradientView = self->_gradientView;
  }
  -[UIView addSubview:](self->_view, "addSubview:", gradientView);
  -[_PRContentStyleGradientView setColors:locations:type:](self->_gradientView, "setColors:locations:type:", v18, v9, v8);
  -[_PRContentStyleGradientView setStartPoint:endPoint:](self->_gradientView, "setStartPoint:endPoint:", v11, v13, v15, v17);

}

uint64_t __62__PRPosterContentStyleBackgroundRenderer_renderGradientStyle___block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

- (UIView)view
{
  return self->_view;
}

- (UIColor)originalBackgroundColor
{
  return self->_originalBackgroundColor;
}

- (void)setOriginalBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)colorViews
{
  return self->_colorViews;
}

- (void)setColorViews:(id)a3
{
  objc_storeStrong((id *)&self->_colorViews, a3);
}

- (_PRContentStyleGradientView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_colorViews, 0);
  objc_storeStrong((id *)&self->_originalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
