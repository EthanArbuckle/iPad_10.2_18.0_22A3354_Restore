@implementation RCWaveformColorCalculator

- (RCWaveformColorCalculator)initWithDataProvider:(id)a3
{
  id v4;
  RCWaveformColorCalculator *v5;
  RCWaveformColorCalculator *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;
  void *v17;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RCWaveformColorCalculator;
  v5 = -[RCWaveformColorCalculator init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_dataProvider, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitChangeObservable"));
    v9 = objc_opt_self(UITraitUserInterfaceStyle);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v17 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v12 = objc_msgSend(v8, "registerForTraitChanges:withTarget:action:", v11, v6, "_traitCollectionDidChange:previousTraitCollection:");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitEnvironment"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "traitCollection"));
    -[RCWaveformColorCalculator _resolveAndCacheColorsWithTraitCollection:](v6, "_resolveAndCacheColorsWithTraitCollection:", v14);

  }
  return v6;
}

- (id)resolvedPrimaryColor:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (a3)
    v3 = 24;
  return *(id *)((char *)&self->super.isa + v3);
}

- (id)resolvedSecondaryColor
{
  return self->_resolvedSecondaryColor;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "traitCollection"));
  -[RCWaveformColorCalculator _resolveAndCacheColorsWithTraitCollection:](self, "_resolveAndCacheColorsWithTraitCollection:");

}

- (void)_resolveAndCacheColorsWithTraitCollection:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  UIColor *v10;
  UIColor *resolvedPrimaryColorDefaultCase;
  UIColor *v12;
  UIColor *resolvedPrimaryColorLiveWaveformCase;
  UIColor *v14;
  UIColor *resolvedSecondaryColor;
  id v16;

  v16 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformColorCalculator _dynamicPrimaryColorForDisplayMode:traitCollection:isLiveWaveform:](self, "_dynamicPrimaryColorForDisplayMode:traitCollection:isLiveWaveform:", objc_msgSend(WeakRetained, "waveformDisplayMode"), v16, 0));

  v6 = objc_loadWeakRetained((id *)&self->_dataProvider);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformColorCalculator _dynamicPrimaryColorForDisplayMode:traitCollection:isLiveWaveform:](self, "_dynamicPrimaryColorForDisplayMode:traitCollection:isLiveWaveform:", objc_msgSend(v6, "waveformDisplayMode"), v16, 1));

  v8 = objc_loadWeakRetained((id *)&self->_dataProvider);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformColorCalculator _dynamicSecondaryColorForDisplayMode:traitCollection:](self, "_dynamicSecondaryColorForDisplayMode:traitCollection:", objc_msgSend(v8, "waveformDisplayMode"), v16));

  v10 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedColorWithTraitCollection:", v16));
  resolvedPrimaryColorDefaultCase = self->_resolvedPrimaryColorDefaultCase;
  self->_resolvedPrimaryColorDefaultCase = v10;

  v12 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolvedColorWithTraitCollection:", v16));
  resolvedPrimaryColorLiveWaveformCase = self->_resolvedPrimaryColorLiveWaveformCase;
  self->_resolvedPrimaryColorLiveWaveformCase = v12;

  v14 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resolvedColorWithTraitCollection:", v16));
  resolvedSecondaryColor = self->_resolvedSecondaryColor;
  self->_resolvedSecondaryColor = v14;

}

- (id)_color:(id)a3 adjustedForDisplayMode:(int64_t)a4 traitCollection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a5;
  v9 = v7;
  v10 = v9;
  if (!a4)
  {
    if (objc_msgSend(v8, "isUserInterfaceStyleDark"))
      v11 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    else
      v11 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v12 = (void *)v11;
    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor color:byAddingColor:](UIColor, "color:byAddingColor:", v12, v13));
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)_dynamicPrimaryColorForDisplayMode:(int64_t)a3 traitCollection:(id)a4 isLiveWaveform:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v10 = v9;
  if (v5)
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waveformRecordingColor"));
  else
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waveformStandardColor"));
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformColorCalculator _color:adjustedForDisplayMode:traitCollection:](self, "_color:adjustedForDisplayMode:traitCollection:", v11, a3, v8));

  return v13;
}

- (id)_dynamicSecondaryColorForDisplayMode:(int64_t)a3 traitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "waveformStandardColor"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformColorCalculator _color:adjustedForDisplayMode:traitCollection:](self, "_color:adjustedForDisplayMode:traitCollection:", v8, a3, v6));
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedSecondaryColor, 0);
  objc_storeStrong((id *)&self->_resolvedPrimaryColorLiveWaveformCase, 0);
  objc_storeStrong((id *)&self->_resolvedPrimaryColorDefaultCase, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
}

@end
