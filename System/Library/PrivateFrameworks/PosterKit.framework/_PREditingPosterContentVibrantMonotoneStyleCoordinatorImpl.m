@implementation _PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl

- (id)transparancyBackgroundImageForHeight:(double)a3
{
  NSMutableDictionary *cachedTransparancyBackgrounds;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  _QWORD v16[5];

  cachedTransparancyBackgrounds = self->_cachedTransparancyBackgrounds;
  if (!cachedTransparancyBackgrounds)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedTransparancyBackgrounds;
    self->_cachedTransparancyBackgrounds = v6;

    cachedTransparancyBackgrounds = self->_cachedTransparancyBackgrounds;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedTransparancyBackgrounds, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = fmax(a3 / 3.0, 0.5);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v10 + v10, v10 + v10);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99___PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl_transparancyBackgroundImageForHeight___block_invoke;
    v16[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v16[4] = v10;
    objc_msgSend(v11, "imageWithActions:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_cachedTransparancyBackgrounds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v9, v14);

  }
  return v9;
}

- (id)_minDisplayColor
{
  void *v3;
  int v4;
  PRPosterContentDiscreteColorsStyle *v5;
  void *v6;
  void *v7;
  PRPosterContentDiscreteColorsStyle *v8;
  void *v9;
  void *v10;

  -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVariation");

  if (v4)
  {
    v5 = [PRPosterContentDiscreteColorsStyle alloc];
    -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PRPosterContentDiscreteColorsStyle initWithOpaqueColors:variation:](v5, "initWithOpaqueColors:variation:", v7, -1.0);

    -[PRPosterContentDiscreteColorsStyle variationAppliedColors](v8, "variationAppliedColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_maxDisplayColor
{
  void *v3;
  int v4;
  PRPosterContentDiscreteColorsStyle *v5;
  void *v6;
  void *v7;
  PRPosterContentDiscreteColorsStyle *v8;
  void *v9;
  void *v10;

  -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVariation");

  if (v4)
  {
    v5 = [PRPosterContentDiscreteColorsStyle alloc];
    -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PRPosterContentDiscreteColorsStyle initWithOpaqueColors:variation:](v5, "initWithOpaqueColors:variation:", v7, 0.0);

    -[PRPosterContentDiscreteColorsStyle variationAppliedColors](v8, "variationAppliedColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_sliderThumbDisplayColor
{
  void *v3;
  int v4;
  double v5;
  double v6;
  PRPosterContentDiscreteColorsStyle *v7;
  void *v8;
  void *v9;
  PRPosterContentDiscreteColorsStyle *v10;
  void *v11;
  void *v12;

  -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVariation");

  if (v4)
  {
    -[_PREditingPosterContentStyleCoordinatorImpl variation](self, "variation");
    v6 = (v5 + 1.0) * 0.5 + -1.0;
    v7 = [PRPosterContentDiscreteColorsStyle alloc];
    -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PRPosterContentDiscreteColorsStyle initWithOpaqueColors:variation:](v7, "initWithOpaqueColors:variation:", v9, v6);

    -[PRPosterContentDiscreteColorsStyle variationAppliedColors](v10, "variationAppliedColors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_itemDisplayColor
{
  void *v3;
  char v4;
  double v5;
  double v6;
  PRPosterContentDiscreteColorsStyle *v7;
  void *v8;
  void *v9;
  PRPosterContentDiscreteColorsStyle *v10;
  void *v11;
  void *v12;

  -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVariation");

  if ((v4 & 1) != 0)
  {
    -[_PREditingPosterContentStyleCoordinatorImpl variation](self, "variation");
    v6 = (v5 + 1.0) * 0.5 + -1.0;
    v7 = [PRPosterContentDiscreteColorsStyle alloc];
    -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PRPosterContentDiscreteColorsStyle initWithOpaqueColors:variation:](v7, "initWithOpaqueColors:variation:", v9, v6);

    -[PRPosterContentDiscreteColorsStyle variationAppliedColors](v10, "variationAppliedColors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl _effectiveColor](self, "_effectiveColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)_effectiveColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[_PREditingPosterContentStyleCoordinatorImpl variationSupportingStyle](self, "variationSupportingStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variationAppliedColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setVariation:(double)a3
{
  void *v5;
  int v6;
  UIView *itemViewContentView;
  void *v8;
  UIView *variationSliderThumbContentView;
  void *v10;
  objc_super v11;

  -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsVariation");

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)_PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl;
    -[_PREditingPosterContentStyleCoordinatorImpl setVariation:](&v11, sel_setVariation_, a3);
    itemViewContentView = self->_itemViewContentView;
    -[_PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl _itemDisplayColor](self, "_itemDisplayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](itemViewContentView, "setBackgroundColor:", v8);

    variationSliderThumbContentView = self->_variationSliderThumbContentView;
    -[_PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl _sliderThumbDisplayColor](self, "_sliderThumbDisplayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](variationSliderThumbContentView, "setBackgroundColor:", v10);

  }
}

- (double)itemViewLuminance
{
  void *v2;
  PRPosterColorValues *v3;
  void *v4;
  double v5;
  double v6;

  -[_PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl _effectiveColor](self, "_effectiveColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PRPosterColorValues initWithColor:]([PRPosterColorValues alloc], "initWithColor:", v2);
  -[PRPosterColorValues hslValues](v3, "hslValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "luminance");
  v6 = v5;

  return v6;
}

- (id)itemView
{
  UIView *itemView;
  UIView *v4;
  void *v5;
  id v6;
  UIView *v7;
  UIView *itemViewContentView;
  UIView *v9;
  void *v10;
  UIView *v11;

  itemView = self->_itemView;
  if (!itemView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[UIView bounds](v4, "bounds");
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v4, "addSubview:", v7);
    itemViewContentView = self->_itemViewContentView;
    self->_itemViewContentView = v7;
    v9 = v7;

    -[_PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl _itemDisplayColor](self, "_itemDisplayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = self->_itemView;
    self->_itemView = v4;

    itemView = self->_itemView;
  }
  return itemView;
}

- (id)variationSliderThumbView
{
  UIView *variationSliderThumbView;
  UIView *v4;
  void *v5;
  id v6;
  UIView *v7;
  UIView *variationSliderThumbContentView;
  UIView *v9;
  void *v10;
  UIView *v11;

  variationSliderThumbView = self->_variationSliderThumbView;
  if (!variationSliderThumbView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[UIView bounds](v4, "bounds");
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v4, "addSubview:", v7);
    variationSliderThumbContentView = self->_variationSliderThumbContentView;
    self->_variationSliderThumbContentView = v7;
    v9 = v7;

    -[_PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl _sliderThumbDisplayColor](self, "_sliderThumbDisplayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);
    v11 = self->_variationSliderThumbView;
    self->_variationSliderThumbView = v4;

    variationSliderThumbView = self->_variationSliderThumbView;
  }
  return variationSliderThumbView;
}

- (id)variationSliderTrackView
{
  UIView *variationSliderTrackView;
  UIView *v4;
  void *v5;
  id v6;
  UIView *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  UIView *variationSliderTrackContentView;
  UIView *v14;
  UIView *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  variationSliderTrackView = self->_variationSliderTrackView;
  if (!variationSliderTrackView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 100.0, 50.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v6 = objc_alloc(MEMORY[0x1E0D7FCD0]);
    -[UIView bounds](v4, "bounds");
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:usesBlur:", 0);
    -[_PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl _minDisplayColor](self, "_minDisplayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl _maxDisplayColor](self, "_maxDisplayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutorelease(v8);
    v17[0] = objc_msgSend(v10, "CGColor");
    v11 = objc_retainAutorelease(v9);
    v17[1] = objc_msgSend(v11, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setColors:locations:type:](v7, "setColors:locations:type:", v12, 0, 0);

    -[UIView setStartPoint:endPoint:](v7, "setStartPoint:endPoint:", 0.0, 0.5, 1.0, 0.5);
    -[UIView addSubview:](v4, "addSubview:", v7);
    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    variationSliderTrackContentView = self->_variationSliderTrackContentView;
    self->_variationSliderTrackContentView = v7;
    v14 = v7;

    v15 = self->_variationSliderTrackView;
    self->_variationSliderTrackView = v4;

    variationSliderTrackView = self->_variationSliderTrackView;
  }
  return variationSliderTrackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTransparancyBackgrounds, 0);
  objc_storeStrong((id *)&self->_variationSliderTrackContentView, 0);
  objc_storeStrong((id *)&self->_variationSliderTrackView, 0);
  objc_storeStrong((id *)&self->_variationSliderThumbContentView, 0);
  objc_storeStrong((id *)&self->_variationSliderThumbView, 0);
  objc_storeStrong((id *)&self->_itemViewContentView, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
