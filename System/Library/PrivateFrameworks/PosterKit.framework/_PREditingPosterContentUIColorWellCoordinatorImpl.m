@implementation _PREditingPosterContentUIColorWellCoordinatorImpl

- (_PREditingPosterContentUIColorWellCoordinatorImpl)initWithStyle:(id)a3 colorWellView:(id)a4
{
  id v7;
  _PREditingPosterContentUIColorWellCoordinatorImpl *v8;
  _PREditingPosterContentUIColorWellCoordinatorImpl *v9;

  v7 = a4;
  v8 = -[_PREditingPosterContentStyleCoordinatorImpl initWithStyle:](self, "initWithStyle:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_colorWellView, a4);

  return v9;
}

- (id)effectiveColor
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
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PREditingPosterContentUIColorWellCoordinatorImpl;
  -[_PREditingPosterContentStyleCoordinatorImpl setVariation:](&v6, sel_setVariation_, a3);
  -[_PREditingPosterContentUIColorWellCoordinatorImpl effectiveColor](self, "effectiveColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIColorWellView colorWell](self->_colorWellView, "colorWell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedColor:", v4);

  -[UIView setBackgroundColor:](self->_variationSliderThumbView, "setBackgroundColor:", v4);
}

- (id)itemView
{
  return self->_colorWellView;
}

- (id)variationSliderThumbView
{
  UIView *variationSliderThumbView;
  UIView *v4;
  void *v5;
  UIView *v6;

  variationSliderThumbView = self->_variationSliderThumbView;
  if (!variationSliderThumbView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    -[_PREditingPosterContentUIColorWellCoordinatorImpl effectiveColor](self, "effectiveColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);
    v6 = self->_variationSliderThumbView;
    self->_variationSliderThumbView = v4;

    variationSliderThumbView = self->_variationSliderThumbView;
  }
  return variationSliderThumbView;
}

- (id)variationSliderTrackView
{
  PUIGradientView *variationSliderTrackView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  PUIGradientView *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  variationSliderTrackView = self->_variationSliderTrackView;
  if (!variationSliderTrackView)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCD0]), "initWithFrame:usesBlur:", 0, 0.0, 0.0, 100.0, 50.0);
    -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copyWithVariation:", -1.0);
    v7 = (void *)objc_msgSend(v5, "copyWithVariation:", 1.0);
    objc_msgSend(v6, "variationAppliedColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "variationAppliedColors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v9);
    v17[0] = objc_msgSend(v12, "CGColor");
    v13 = objc_retainAutorelease(v11);
    v17[1] = objc_msgSend(v13, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setColors:locations:type:", v14, 0, 0);

    objc_msgSend(v4, "setStartPoint:endPoint:", 0.0, 0.5, 1.0, 0.5);
    v15 = self->_variationSliderTrackView;
    self->_variationSliderTrackView = (PUIGradientView *)v4;

    variationSliderTrackView = self->_variationSliderTrackView;
  }
  return variationSliderTrackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationSliderTrackView, 0);
  objc_storeStrong((id *)&self->_variationSliderThumbView, 0);
  objc_storeStrong((id *)&self->_colorWellView, 0);
}

@end
