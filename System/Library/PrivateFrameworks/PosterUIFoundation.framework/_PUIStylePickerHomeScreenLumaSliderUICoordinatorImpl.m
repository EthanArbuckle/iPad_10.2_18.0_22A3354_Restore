@implementation _PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl

- (_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl)initWithStyle:(id)a3
{
  id v4;
  _PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl;
  v5 = -[PUIStyleUICoordinatorImpl initWithStyle:](&v10, sel_initWithStyle_, v4);
  if (v5)
  {
    +[PUIDiscreteGradientVariatedCustomStyle minLuminanceForStyle:](PUIDiscreteGradientVariatedCustomStyle, "minLuminanceForStyle:", v4);
    v5->_minLuminance = v6;
    +[PUIDiscreteGradientVariatedCustomStyle maxLuminanceForStyle:](PUIDiscreteGradientVariatedCustomStyle, "maxLuminanceForStyle:", v4);
    v5->_maxLuminance = v7;
    objc_msgSend(v4, "luminanceValue");
    -[PUIStyleUICoordinatorImpl setVariation:updateStyle:](v5, "setVariation:updateStyle:", 0, fmax(fmin((v8 - v5->_minLuminance + v8 - v5->_minLuminance) / (v5->_maxLuminance - v5->_minLuminance) + -1.0, 1.0), -1.0));
  }

  return v5;
}

- (id)effectiveColor
{
  void *v2;
  void *v3;

  -[PUIStyleUICoordinatorImpl style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "luminanceAppliedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setVariation:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self->_minLuminance + (a3 + 1.0) * (self->_maxLuminance - self->_minLuminance) * 0.5;
  -[PUIStyleUICoordinatorImpl style](self, "style");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v7, "copyWithLuminance:", v4);
  -[PUIStyleUICoordinatorImpl setStyle:](self, "setStyle:", v5);

  -[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl effectiveColor](self, "effectiveColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_variationSliderThumbView, "setBackgroundColor:", v6);

}

- (void)gradientSliderDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  PUIColorValues *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  v4 = a3;
  -[PUIStyleUICoordinatorImpl style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "luminanceValue");
  v7 = v6;

  objc_msgSend(v4, "variationAppliedColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v17);
  v10 = (v7 - self->_minLuminance + v7 - self->_minLuminance) / (self->_maxLuminance - self->_minLuminance) + -1.0;
  +[PUIDiscreteGradientVariatedCustomStyle minLuminanceForStyle:](PUIDiscreteGradientVariatedCustomStyle, "minLuminanceForStyle:", v4);
  self->_minLuminance = v11;
  +[PUIDiscreteGradientVariatedCustomStyle maxLuminanceForStyle:](PUIDiscreteGradientVariatedCustomStyle, "maxLuminanceForStyle:", v4);
  self->_maxLuminance = v12;
  v13 = self->_minLuminance + (v10 + 1.0) * (v12 - self->_minLuminance) * 0.5;
  -[PUIColorValues hslValues](v9, "hslValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "saturation");
  v16 = (void *)objc_msgSend(v4, "copyWithLuminance:saturation:", v13, v15);

  -[PUIStyleUICoordinatorImpl setStyle:](self, "setStyle:", v16);
  -[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl _updateVariationSliderTrackView](self, "_updateVariationSliderTrackView");
  -[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl _updateSliderThumbView](self, "_updateSliderThumbView");

}

- (id)variationSliderThumbView
{
  UIView *variationSliderThumbView;
  UIView *v4;
  UIView *v5;

  variationSliderThumbView = self->_variationSliderThumbView;
  if (!variationSliderThumbView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    v5 = self->_variationSliderThumbView;
    self->_variationSliderThumbView = v4;

    -[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl _updateSliderThumbView](self, "_updateSliderThumbView");
    variationSliderThumbView = self->_variationSliderThumbView;
  }
  return variationSliderThumbView;
}

- (id)variationSliderTrackView
{
  PUIGradientView *variationSliderTrackView;
  PUIGradientView *v4;
  PUIGradientView *v5;

  variationSliderTrackView = self->_variationSliderTrackView;
  if (!variationSliderTrackView)
  {
    v4 = -[PUIGradientView initWithFrame:]([PUIGradientView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 50.0);
    v5 = self->_variationSliderTrackView;
    self->_variationSliderTrackView = v4;

    -[PUIGradientView setUsesBlur:](self->_variationSliderTrackView, "setUsesBlur:", 1);
    -[_PUIStylePickerHomeScreenLumaSliderUICoordinatorImpl _updateVariationSliderTrackView](self, "_updateVariationSliderTrackView");
    variationSliderTrackView = self->_variationSliderTrackView;
  }
  return variationSliderTrackView;
}

- (void)_updateSliderThumbView
{
  void *v3;
  id v4;

  -[PUIStyleUICoordinatorImpl style](self, "style");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "luminanceAppliedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_variationSliderThumbView, "setBackgroundColor:", v3);

}

- (void)_updateVariationSliderTrackView
{
  void *v3;
  PUIStyleDiscreteColors *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PUIColorValues *v9;
  double v10;
  double v11;
  double v12;
  PUIColorValues *v13;
  void *v14;
  void *v15;
  PUIGradientView *variationSliderTrackView;
  id v17;
  id v18;
  void *v19;
  id v20;
  PUIStyleDiscreteColors *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  -[PUIStyleUICoordinatorImpl style](self, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "variationAppliedColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [PUIStyleDiscreteColors alloc];
  v25[0] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PUIStyleDiscreteColors initWithColors:vibrant:supportsVariation:variationValue:](v4, "initWithColors:vibrant:supportsVariation:variationValue:", v5, 0, 1, 0.0);

  v20 = -[PUIStyleDiscreteColors copyWithVariation:](v21, "copyWithVariation:", 0.0);
  objc_msgSend(v20, "variationAppliedColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pui_hslValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PUIColorValues alloc];
  objc_msgSend(v8, "hue");
  v11 = v10;
  objc_msgSend(v8, "saturation");
  v13 = -[PUIColorValues initWithHue:saturation:luminance:alpha:](v9, "initWithHue:saturation:luminance:alpha:", v11, v12, self->_minLuminance, 1.0);
  -[PUIColorValues color](v13, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  variationSliderTrackView = self->_variationSliderTrackView;
  v17 = objc_retainAutorelease(v14);
  v24[0] = objc_msgSend(v17, "CGColor");
  v18 = objc_retainAutorelease(v15);
  v24[1] = objc_msgSend(v18, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIGradientView setColors:locations:type:](variationSliderTrackView, "setColors:locations:type:", v19, 0, 0);

  -[PUIGradientView setStartPoint:endPoint:](self->_variationSliderTrackView, "setStartPoint:endPoint:", 0.0, 0.5, 1.0, 0.5);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationSliderThumbView, 0);
  objc_storeStrong((id *)&self->_variationSliderTrackView, 0);
}

@end
