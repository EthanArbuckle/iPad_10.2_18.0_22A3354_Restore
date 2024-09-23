@implementation SBUISystemApertureLayoutMetrics

- (CGRect)interSensorRegionInWindowSpace
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "_deviceNativeScreenSizeInPoints");
  v4 = v3;
  -[SBUISystemApertureLayoutMetrics sensorRegionSize](self, "sensorRegionSize");
  v6 = v4 + (v4 - v5) * -0.5 + -9.0 + -36.6666667;
  -[SBUISystemApertureLayoutMetrics _minimumScreenEdgeInset](self, "_minimumScreenEdgeInset");
  v8 = v7;
  v9 = 36.6666667;
  v10 = 9.0;
  v11 = v6;
  result.size.height = v9;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v11;
  return result;
}

- (CGSize)sensorRegionSize
{
  int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = objc_msgSend((id)objc_opt_class(), "_screenPixelWidthIsEven");
  v3 = 125.0;
  if (v2)
    v3 = 125.333333;
  v4 = 36.6666667;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)maximumContinuousCornerRadius
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_displayCornerRadiusIgnoringZoom");
  v5 = v4;
  -[SBUISystemApertureLayoutMetrics _minimumScreenEdgeInset](self, "_minimumScreenEdgeInset");
  v7 = v5 - v6;

  return v7;
}

- (NSDirectionalEdgeInsets)minimumScreenEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[SBUISystemApertureLayoutMetrics _minimumScreenEdgeInset](self, "_minimumScreenEdgeInset");
  v3 = v2;
  v4 = v2;
  v5 = v2;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)_minimumScreenEdgeInset
{
  uint64_t v2;
  BOOL v3;
  double result;

  v2 = SBFEffectiveArtworkSubtype();
  v3 = v2 == 2622 || v2 == 2868;
  result = 11.3333333;
  if (v3)
    return 14.0;
  return result;
}

+ (id)sharedInstanceForEmbeddedDisplay
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SBUISystemApertureLayoutMetrics_sharedInstanceForEmbeddedDisplay__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstanceForEmbeddedDisplay_onceToken != -1)
    dispatch_once(&sharedInstanceForEmbeddedDisplay_onceToken, block);
  return (id)sharedInstanceForEmbeddedDisplay_sharedInstanceForEmbeddedDisplay;
}

void __67__SBUISystemApertureLayoutMetrics_sharedInstanceForEmbeddedDisplay__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstanceForEmbeddedDisplay_sharedInstanceForEmbeddedDisplay;
  sharedInstanceForEmbeddedDisplay_sharedInstanceForEmbeddedDisplay = (uint64_t)v1;

}

- (CGSize)minimumMinimalSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  v4 = v3;
  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)maximumHorizontalMinimalViewSize
{
  double v2;
  double v3;
  CGSize result;

  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  v3 = 45.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (CGSize)maximumCompactSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_deviceNativeScreenSizeInPoints");
  v4 = v3 + -73.3333333;
  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)maximumLeadingTrailingViewSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SBUISystemApertureLayoutMetrics maximumCompactSize](self, "maximumCompactSize");
  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  UIFloorToScale();
  v4 = v3;
  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)compactConcentricAreaSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  v4 = v3;
  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (NSDirectionalEdgeInsets)compactLegibleAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 10.0;
  v4 = 0.0;
  v5 = 10.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (CGSize)minimumMicroNoticeSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  v3 = v2 + 185.333333;
  v4 = 66.6666667;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)maximumMicroNoticeSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_deviceNativeScreenSizeInPoints");
  v4 = v3 + -66.6666667;
  -[SBUISystemApertureLayoutMetrics minimumMicroNoticeSize](self, "minimumMicroNoticeSize");
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)microNoticeConcentricAreaSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SBUISystemApertureLayoutMetrics minimumMicroNoticeSize](self, "minimumMicroNoticeSize");
  v4 = v3;
  -[SBUISystemApertureLayoutMetrics minimumMicroNoticeSize](self, "minimumMicroNoticeSize");
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)minimumExpandedSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SBUISystemApertureLayoutMetrics _maximumWidth](self, "_maximumWidth");
  v4 = v3;
  -[SBUISystemApertureLayoutMetrics expandedConcentricAreaSize](self, "expandedConcentricAreaSize");
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)maximumExpandedSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SBUISystemApertureLayoutMetrics _maximumWidth](self, "_maximumWidth");
  v4 = v3;
  -[SBUISystemApertureLayoutMetrics _maximumWidth](self, "_maximumWidth");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)expandedConcentricAreaSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 82.0;
  v3 = 84.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSDirectionalEdgeInsets)expandedLegibleAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 29.0;
  v3 = 29.0;
  v4 = 17.0;
  v5 = 29.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)expandedControlsAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 20.0;
  v4 = 17.0;
  v5 = 20.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)minimumContinuousCornerRadius
{
  double v2;

  -[SBUISystemApertureLayoutMetrics _inertSize](self, "_inertSize");
  return v2 * 0.5;
}

- (CGSize)maximumPossibleSizeWhilePresentingMenu
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_deviceNativeScreenSizeInPoints");
  v3 = v2 + v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_maximumWidth
{
  double v3;
  double v4;
  double v5;

  objc_msgSend((id)objc_opt_class(), "_deviceNativeScreenSizeInPoints");
  v4 = v3;
  -[SBUISystemApertureLayoutMetrics _minimumScreenEdgeInset](self, "_minimumScreenEdgeInset");
  return v4 + v5 * -2.0;
}

+ (CGSize)_deviceNativeScreenSizeInPoints
{
  double v2;
  double v3;
  CGSize result;

  if (_deviceNativeScreenSizeInPoints___onceToken != -1)
    dispatch_once(&_deviceNativeScreenSizeInPoints___onceToken, &__block_literal_global_29);
  v2 = *(double *)&_deviceNativeScreenSizeInPoints___screenSize_0;
  v3 = *(double *)&_deviceNativeScreenSizeInPoints___screenSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

double __66__SBUISystemApertureLayoutMetrics__deviceNativeScreenSizeInPoints__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "nativeBounds");
  v2 = v1;
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  result = v2 / v7;
  *(double *)&_deviceNativeScreenSizeInPoints___screenSize_0 = v2 / v7;
  *(double *)&_deviceNativeScreenSizeInPoints___screenSize_1 = v4 / v7;
  return result;
}

+ (BOOL)_screenPixelWidthIsEven
{
  if (_screenPixelWidthIsEven___onceToken != -1)
    dispatch_once(&_screenPixelWidthIsEven___onceToken, &__block_literal_global_1);
  return _screenPixelWidthIsEven___isEvenWidth;
}

void __58__SBUISystemApertureLayoutMetrics__screenPixelWidthIsEven__block_invoke()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "nativeBounds");
  v2 = v1;

  _screenPixelWidthIsEven___isEvenWidth = ((unint64_t)v2 & 1) == 0;
}

@end
