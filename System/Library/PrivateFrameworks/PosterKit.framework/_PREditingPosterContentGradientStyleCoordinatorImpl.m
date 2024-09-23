@implementation _PREditingPosterContentGradientStyleCoordinatorImpl

- (double)itemViewLuminance
{
  void *v2;
  void *v3;
  void *v4;
  PRPosterColorValues *v5;
  void *v6;
  double v7;
  double v8;

  -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PRPosterColorValues initWithColor:]([PRPosterColorValues alloc], "initWithColor:", v4);
  -[PRPosterColorValues hslValues](v5, "hslValues");
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
  uint64_t v6;
  id *v7;
  id *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  PUIGradientView *v21;

  gradientItemView = self->_gradientItemView;
  if (!gradientItemView)
  {
    -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "gradientType");
    v7 = (id *)MEMORY[0x1E0CD2F50];
    v8 = (id *)MEMORY[0x1E0CD2F58];
    if (v6 != 1)
      v8 = (id *)MEMORY[0x1E0CD2F48];
    if (v6 != 2)
      v7 = v8;
    v9 = *v7;
    objc_msgSend(v4, "locations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startPoint");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v4, "endPoint");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v5, "bs_map:", &__block_literal_global_37);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCD0]), "initWithFrame:usesBlur:", 1, 0.0, 0.0, 50.0, 50.0);
    objc_msgSend(v20, "setColors:locations:type:", v19, v10, v9);
    objc_msgSend(v20, "setStartPoint:endPoint:", v12, v14, v16, v18);
    v21 = self->_gradientItemView;
    self->_gradientItemView = (PUIGradientView *)v20;

    gradientItemView = self->_gradientItemView;
  }
  return gradientItemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientItemView, 0);
}

@end
