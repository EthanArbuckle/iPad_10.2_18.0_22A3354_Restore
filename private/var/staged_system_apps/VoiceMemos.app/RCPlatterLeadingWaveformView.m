@implementation RCPlatterLeadingWaveformView

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  -[RCPlatterLeadingWaveformView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (unint64_t)numberOfSlices
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "platterCompactViewSliceCount");

  return (unint64_t)v3;
}

- (double)sliceWidth
{
  double v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCPlatterLeadingWaveformView;
  -[RCPlatterWaveformView sliceWidth](&v7, "sliceWidth");
  v4 = v3;
  -[RCPlatterLeadingWaveformView _sliceScale](self, "_sliceScale");
  return v4 * v5;
}

- (double)slicePadding
{
  double v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCPlatterLeadingWaveformView;
  -[RCPlatterWaveformView slicePadding](&v7, "slicePadding");
  v4 = v3;
  -[RCPlatterLeadingWaveformView _sliceScale](self, "_sliceScale");
  return v4 * v5;
}

- (double)_sliceScale
{
  void *v3;
  double v4;
  double v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v3, "platterWaveformSliceScaleFactorForExpandedMode");
  v5 = v4;

  result = 1.0;
  if (self->_style)
    return v5;
  return result;
}

- (id)accessibilityLabel
{
  unint64_t style;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  style = self->_style;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (style)
    v5 = CFSTR("AX_WAVEFORM");
  else
    v5 = CFSTR("AX_JINDO_WAVEFORM");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1001B2BC0, 0));

  return v6;
}

- (unint64_t)style
{
  return self->_style;
}

@end
