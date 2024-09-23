@implementation _PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl

- (id)effectiveColor
{
  void *v2;
  void *v3;
  void *v4;

  -[PUIStyleUICoordinatorImpl style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variationAppliedColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setVariation:(double)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl;
  -[PUIStyleUICoordinatorImpl setVariation:](&v5, sel_setVariation_, a3);
  -[_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl effectiveColor](self, "effectiveColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_variationSliderThumbView, "setBackgroundColor:", v4);

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
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    -[_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl effectiveColor](self, "effectiveColor");
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
  PUIGradientView *v4;
  PUIGradientView *v5;

  variationSliderTrackView = self->_variationSliderTrackView;
  if (!variationSliderTrackView)
  {
    v4 = -[PUIGradientView initWithFrame:]([PUIGradientView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 50.0);
    v5 = self->_variationSliderTrackView;
    self->_variationSliderTrackView = v4;

    -[PUIGradientView setUsesBlur:](self->_variationSliderTrackView, "setUsesBlur:", 1);
    -[_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl _updateVariationSliderTrackView](self, "_updateVariationSliderTrackView");
    variationSliderTrackView = self->_variationSliderTrackView;
  }
  return variationSliderTrackView;
}

- (void)resetSaturation
{
  void *v3;
  void *v4;
  id v5;

  -[PUIStyleUICoordinatorImpl style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copyWithResetSaturation");

  v5 = (id)objc_msgSend(v4, "copyWithLuminance:", 0.0);
  -[PUIStyleUICoordinatorImpl setStyle:](self, "setStyle:", v5);

}

- (void)_updateVariationSliderTrackView
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[4];

  v3 = (id)*MEMORY[0x24BDE5C48];
  -[PUIStyleUICoordinatorImpl style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __91___PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl__updateVariationSliderTrackView__block_invoke;
  v9[3] = &unk_25154BC00;
  v9[4] = v10;
  v9[5] = v6;
  objc_msgSend(v5, "bs_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_map:", &__block_literal_global_3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[PUIGradientView setColors:locations:type:](self->_variationSliderTrackView, "setColors:locations:type:", v8, v7, v3);
  -[PUIGradientView setStartPoint:endPoint:](self->_variationSliderTrackView, "setStartPoint:endPoint:", 0.0, 0.5, 1.0, 0.5);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  _Block_object_dispose(v10, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationSliderThumbView, 0);
  objc_storeStrong((id *)&self->_variationSliderTrackView, 0);
}

@end
