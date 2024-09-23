@implementation _PUIStyleGradientCoordinatorImpl

- (double)itemViewLuminance
{
  void *v2;
  void *v3;
  void *v4;
  PUIColorValues *v5;
  void *v6;
  double v7;
  double v8;

  -[PUIStyleUICoordinatorImpl style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v4);
  -[PUIColorValues hslValues](v5, "hslValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "luminance");
  v8 = v7;

  return v8;
}

- (id)itemView
{
  PUIGradientView *gradientItemView;
  void *v4;
  void *v5;
  void *v6;
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
  PUIGradientView *v17;
  PUIGradientView *v18;

  gradientItemView = self->_gradientItemView;
  if (!gradientItemView)
  {
    -[PUIStyleUICoordinatorImpl style](self, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PUIStyleGradientTypeToCAEditingGradientLayerTypeFrom((id)objc_msgSend(v4, "gradientType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startPoint");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v4, "endPoint");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v5, "bs_map:", &__block_literal_global_27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PUIGradientView initWithFrame:usesBlur:]([PUIGradientView alloc], "initWithFrame:usesBlur:", 1, 0.0, 0.0, 50.0, 50.0);
    -[PUIGradientView setColors:locations:type:](v17, "setColors:locations:type:", v16, v7, v6);
    -[PUIGradientView setStartPoint:endPoint:](v17, "setStartPoint:endPoint:", v9, v11, v13, v15);
    v18 = self->_gradientItemView;
    self->_gradientItemView = v17;

    gradientItemView = self->_gradientItemView;
  }
  return gradientItemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientItemView, 0);
}

@end
