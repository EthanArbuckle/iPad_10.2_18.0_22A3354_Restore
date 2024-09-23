@implementation _UIWebViewportHandler

- (float)initialScale
{
  float width;
  float v4;
  float v5;
  float height;
  float v7;
  _BOOL4 v8;
  uint64_t v9;
  float result;

  if (self->_configuration.initialScale != -1.0
    && !-[_UIWebViewportHandler shouldIgnoreScalingConstraints](self, "shouldIgnoreScalingConstraints"))
  {
    return self->_configuration.initialScale;
  }
  width = self->_documentBounds.size.width;
  if (width <= 0.0)
  {
    -[_UIWebViewportHandler viewportWidth](self, "viewportWidth");
    width = v4;
  }
  v5 = 0.0;
  if (width > 0.0
    && !-[_UIWebViewportHandler shouldIgnoreVerticalScalingConstraints](self, "shouldIgnoreVerticalScalingConstraints"))
  {
    v5 = self->_availableViewSize.width / width;
  }
  height = self->_documentBounds.size.height;
  if (height <= 0.0)
  {
    -[_UIWebViewportHandler viewportHeight](self, "viewportHeight");
    height = v7;
  }
  if (height > 0.0
    && self->_availableViewSize.height > (float)(v5 * height)
    && !-[_UIWebViewportHandler shouldIgnoreHorizontalScalingConstraints](self, "shouldIgnoreHorizontalScalingConstraints"))
  {
    v5 = self->_availableViewSize.height / height;
  }
  v8 = -[_UIWebViewportHandler shouldIgnoreScalingConstraints](self, "shouldIgnoreScalingConstraints");
  v9 = 68;
  if (v8)
    v9 = 36;
  result = *(float *)((char *)&self->super.isa + v9);
  if (v5 >= result)
    result = v5;
  if (result >= self->_configuration.maximumScale)
    return self->_configuration.maximumScale;
  return result;
}

- (float)minimumScale
{
  float result;
  float minimumScale;
  float width;
  float height;

  if (self->_configuration.initialScale == -1.0)
  {
    -[_UIWebViewportHandler initialScale](self, "initialScale");
  }
  else
  {
    minimumScale = self->_configuration.minimumScale;
    width = self->_documentBounds.size.width;
    if (width > 0.0)
    {
      height = self->_documentBounds.size.height;
      if (self->_availableViewSize.width > (float)(minimumScale * width)
        && !-[_UIWebViewportHandler shouldIgnoreVerticalScalingConstraints](self, "shouldIgnoreVerticalScalingConstraints"))
      {
        minimumScale = self->_availableViewSize.width / width;
      }
      if (self->_availableViewSize.height > (float)(minimumScale * height)
        && !-[_UIWebViewportHandler shouldIgnoreHorizontalScalingConstraints](self, "shouldIgnoreHorizontalScalingConstraints"))
      {
        minimumScale = self->_availableViewSize.height / height;
      }
    }
    result = self->_configuration.minimumScale;
    if (minimumScale >= result)
      result = minimumScale;
    if (result >= self->_configuration.maximumScale)
      return self->_configuration.maximumScale;
  }
  return result;
}

- (float)maximumScale
{
  return self->_configuration.maximumScale;
}

- (BOOL)allowsUserScaling
{
  return self->_configuration.allowsUserScaling
      || -[_UIWebViewportHandler shouldIgnoreScalingConstraints](self, "shouldIgnoreScalingConstraints");
}

- (BOOL)avoidsUnsafeArea
{
  return self->_configuration.avoidsUnsafeArea;
}

- (BOOL)shouldIgnoreHorizontalScalingConstraints
{
  BOOL result;

  if (!self->_configuration.allowsShrinkToFit)
    return 0;
  result = self->_documentBounds.size.width > self->_availableViewSize.width;
  if (!self->_widthIsDeviceWidth
    && ((self->_webkitDefinedConfigurationFlags & 2) == 0 || self->_configuration.initialScale != 1.0))
  {
    return 0;
  }
  return result;
}

- (BOOL)shouldIgnoreVerticalScalingConstraints
{
  BOOL allowsShrinkToFit;

  allowsShrinkToFit = self->_configuration.allowsShrinkToFit;
  if (allowsShrinkToFit)
  {
    if (!self->_heightIsDeviceHeight)
      return 0;
    allowsShrinkToFit = self->_documentBounds.size.height > self->_availableViewSize.height;
    if (self->_widthIsDeviceWidth)
      return 0;
  }
  return allowsShrinkToFit;
}

- (BOOL)shouldIgnoreScalingConstraints
{
  int v3;

  v3 = dyld_program_sdk_at_least();
  if (v3)
    LOBYTE(v3) = -[_UIWebViewportHandler shouldIgnoreHorizontalScalingConstraints](self, "shouldIgnoreHorizontalScalingConstraints")|| -[_UIWebViewportHandler shouldIgnoreVerticalScalingConstraints](self, "shouldIgnoreVerticalScalingConstraints");
  return v3;
}

- (_UIWebViewportConfiguration)rawViewConfiguration
{
  CGSize size;

  size = self[2].size;
  retstr->size = *(CGSize *)&self[1].initialScale;
  *(CGSize *)&retstr->initialScale = size;
  return self;
}

- (void)update:(id)a3
{
  _BOOL4 v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  _BOOL4 v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  _BOOL8 v23;

  v5 = -[_UIWebViewportHandler allowsUserScaling](self, "allowsUserScaling");
  -[_UIWebViewportHandler initialScale](self, "initialScale");
  v7 = v6;
  -[_UIWebViewportHandler minimumScale](self, "minimumScale");
  v9 = v8;
  -[_UIWebViewportHandler maximumScale](self, "maximumScale");
  v11 = v10;
  -[_UIWebViewportHandler viewportWidth](self, "viewportWidth");
  v13 = v12;
  -[_UIWebViewportHandler viewportHeight](self, "viewportHeight");
  v15 = v14;
  v16 = -[_UIWebViewportHandler avoidsUnsafeArea](self, "avoidsUnsafeArea");
  self->_isInUpdateBlock = 1;
  (*((void (**)(id))a3 + 2))(a3);
  self->_isInUpdateBlock = 0;
  if (!self->_initialConfigurationHasBeenSentToDelegate
    || v5 != -[_UIWebViewportHandler allowsUserScaling](self, "allowsUserScaling")
    || (-[_UIWebViewportHandler initialScale](self, "initialScale"), v7 != v17)
    || (-[_UIWebViewportHandler minimumScale](self, "minimumScale"), v9 != v18)
    || (-[_UIWebViewportHandler maximumScale](self, "maximumScale"), v11 != v19))
  {
    -[_UIWebViewportHandlerDelegate viewportHandlerDidChangeScales:](self->_delegate, "viewportHandlerDidChangeScales:", self);
  }
  -[_UIWebViewportHandler viewportWidth](self, "viewportWidth");
  v21 = v20;
  -[_UIWebViewportHandler viewportHeight](self, "viewportHeight");
  if (!self->_initialConfigurationHasBeenSentToDelegate || v13 != v21 || v15 != v22)
    -[_UIWebViewportHandlerDelegate viewportHandler:didChangeViewportSize:](self->_delegate, "viewportHandler:didChangeViewportSize:", self, v21, v22);
  v23 = -[_UIWebViewportHandler avoidsUnsafeArea](self, "avoidsUnsafeArea");
  if (v16 != v23)
    -[_UIWebViewportHandlerDelegate viewportHandler:didChangeAvoidsUnsafeArea:](self->_delegate, "viewportHandler:didChangeAvoidsUnsafeArea:", self, v23);
  self->_initialConfigurationHasBeenSentToDelegate = 1;
}

- (void)setDocumentBounds:(CGRect)a3
{
  self->_documentBounds = a3;
}

- (void)setAvailableViewSize:(CGSize)a3 updateConfigurationSize:(BOOL)a4
{
  self->_availableViewSize = a3;
  if (a4)
    -[_UIWebViewportHandler _resolveViewSizeRelativeLengths](self, "_resolveViewSizeRelativeLengths");
}

- (void)_resolveViewSizeRelativeLengths
{
  double width;
  CGSize *p_availableViewSize;
  CGSize *p_height;
  unsigned int v5;
  double v6;
  double height;
  unsigned int webkitDefinedConfigurationFlags;
  double v9;

  *(_WORD *)&self->_widthIsDeviceWidth = 0;
  width = self->_viewportArgumentsSize.width;
  p_availableViewSize = &self->_availableViewSize;
  if (width == -2.0)
  {
    self->_widthIsDeviceWidth = 1;
    p_height = &self->_availableViewSize;
  }
  else
  {
    if (width != -3.0)
      goto LABEL_6;
    p_height = (CGSize *)&self->_availableViewSize.height;
  }
  width = p_height->width;
LABEL_6:
  if (width >= 0.0)
  {
    v6 = fmax(width, 10.0);
    if (v6 > 10000.0)
      v6 = 10000.0;
    self->_configuration.size.width = v6;
    v5 = self->_webkitDefinedConfigurationFlags | 0x10;
  }
  else
  {
    if (width != -1.0)
      goto LABEL_13;
    self->_configuration.size.width = self->_defaultConfiguration.size.width;
    v5 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFEF;
  }
  self->_webkitDefinedConfigurationFlags = v5;
LABEL_13:
  height = self->_viewportArgumentsSize.height;
  if (height != -2.0)
  {
    if (height != -3.0)
      goto LABEL_17;
    self->_heightIsDeviceHeight = 1;
    p_availableViewSize = (CGSize *)&self->_availableViewSize.height;
  }
  height = p_availableViewSize->width;
LABEL_17:
  if (height >= 0.0)
  {
    v9 = fmax(height, 10.0);
    if (v9 > 10000.0)
      v9 = 10000.0;
    self->_configuration.size.height = v9;
    webkitDefinedConfigurationFlags = self->_webkitDefinedConfigurationFlags | 0x20;
  }
  else
  {
    webkitDefinedConfigurationFlags = self->_webkitDefinedConfigurationFlags;
    if (height != -1.0)
      goto LABEL_24;
    self->_configuration.size.height = self->_defaultConfiguration.size.height;
    webkitDefinedConfigurationFlags &= ~0x20u;
  }
  self->_webkitDefinedConfigurationFlags = webkitDefinedConfigurationFlags;
LABEL_24:
  if ((webkitDefinedConfigurationFlags & 0x32) != 0)
  {
    if ((webkitDefinedConfigurationFlags & 2) != 0)
    {
      if ((webkitDefinedConfigurationFlags & 0x10) != 0)
      {
        if ((webkitDefinedConfigurationFlags & 0x20) == 0)
          self->_configuration.size.height = -1.0;
      }
      else
      {
        self->_configuration.size.width = -1.0;
      }
    }
    else
    {
      self->_configuration.initialScale = -1.0;
    }
  }
}

- (void)applyWebKitViewportArgumentsSize:(CGSize)a3 initialScale:(float)a4 minimumScale:(float)a5 maximumScale:(float)a6 allowsUserScaling:(float)a7 allowsShrinkToFit:(float)a8 viewportFit:(id)a9
{
  double width;
  float minimumScale;
  unsigned int v15;
  float maximumScale;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  BOOL v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;

  width = a3.width;
  if (a5 >= 0.0)
  {
    minimumScale = fmaxf(a5, 0.1);
    if (minimumScale > 10.0)
      minimumScale = 10.0;
    self->_configuration.minimumScale = minimumScale;
    v15 = self->_webkitDefinedConfigurationFlags | 4;
    goto LABEL_7;
  }
  if (a5 == -1.0)
  {
    minimumScale = self->_defaultConfiguration.minimumScale;
    self->_configuration.minimumScale = minimumScale;
    v15 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFFB;
LABEL_7:
    self->_webkitDefinedConfigurationFlags = v15;
    goto LABEL_9;
  }
  minimumScale = self->_configuration.minimumScale;
LABEL_9:
  if (a6 >= 0.0)
  {
    if (minimumScale >= a6)
      maximumScale = minimumScale;
    else
      maximumScale = a6;
    if (maximumScale > 10.0)
      maximumScale = 10.0;
    v17 = self->_webkitDefinedConfigurationFlags | 8;
  }
  else
  {
    if (a6 != -1.0)
      goto LABEL_19;
    maximumScale = self->_defaultConfiguration.maximumScale;
    v17 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFF7;
  }
  self->_configuration.maximumScale = maximumScale;
  self->_webkitDefinedConfigurationFlags = v17;
LABEL_19:
  if (a4 >= 0.0)
  {
    if (minimumScale < a4)
      minimumScale = a4;
    if (minimumScale > self->_configuration.maximumScale)
      minimumScale = self->_configuration.maximumScale;
    self->_configuration.initialScale = minimumScale;
    v18 = self->_webkitDefinedConfigurationFlags | 2;
  }
  else
  {
    if (a4 != -1.0)
      goto LABEL_28;
    self->_configuration.initialScale = self->_defaultConfiguration.initialScale;
    v18 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFFD;
  }
  self->_webkitDefinedConfigurationFlags = v18;
LABEL_28:
  self->_viewportArgumentsSize.width = width;
  self->_viewportArgumentsSize.height = a3.height;
  -[_UIWebViewportHandler _resolveViewSizeRelativeLengths](self, "_resolveViewSizeRelativeLengths");
  v19 = -[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL;
  v21 = width == 320.0 && v19 == 1;
  self->_classicViewportMode = v21;
  if (a7 >= 0.0)
  {
    self->_configuration.allowsUserScaling = a7 != 0.0;
    v22 = self->_webkitDefinedConfigurationFlags | 0x40;
  }
  else
  {
    if (a7 != -1.0)
      goto LABEL_39;
    self->_configuration.allowsUserScaling = self->_defaultConfiguration.allowsUserScaling;
    v22 = self->_webkitDefinedConfigurationFlags & 0xFFFFFFBF;
  }
  self->_webkitDefinedConfigurationFlags = v22;
LABEL_39:
  if (a8 >= 0.0)
  {
    self->_configuration.allowsShrinkToFit = a8 != 0.0;
    v23 = self->_webkitDefinedConfigurationFlags | 0x80;
    goto LABEL_43;
  }
  if (a8 == -1.0)
  {
    self->_configuration.allowsShrinkToFit = self->_defaultConfiguration.allowsShrinkToFit;
    v23 = self->_webkitDefinedConfigurationFlags & 0xFFFFFF7F;
LABEL_43:
    self->_webkitDefinedConfigurationFlags = v23;
  }
  if (a9 && (objc_msgSend(a9, "isEqualToString:", CFSTR("auto")) & 1) == 0)
  {
    self->_configuration.avoidsUnsafeArea = objc_msgSend(a9, "isEqualToString:", CFSTR("cover")) ^ 1;
    v24 = self->_webkitDefinedConfigurationFlags | 0x100;
  }
  else
  {
    self->_configuration.avoidsUnsafeArea = self->_defaultConfiguration.avoidsUnsafeArea;
    v24 = self->_webkitDefinedConfigurationFlags & 0xFFFFFEFF;
  }
  self->_webkitDefinedConfigurationFlags = v24;
}

- (void)clearWebKitViewportConfigurationFlags
{
  self->_webkitDefinedConfigurationFlags = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  self->_viewportArgumentsSize = _Q0;
}

- (void)overrideViewportConfiguration:(const _UIWebViewportConfiguration *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->initialScale;
  self->_configuration.size = a3->size;
  *(_OWORD *)&self->_configuration.initialScale = v3;
}

- (void)resetViewportConfiguration:(const _UIWebViewportConfiguration *)a3
{
  __int128 v3;

  self->_initialConfigurationHasBeenSentToDelegate = 0;
  v3 = *(_OWORD *)&a3->initialScale;
  self->_defaultConfiguration.size = a3->size;
  *(_OWORD *)&self->_defaultConfiguration.initialScale = v3;
  __asm { FMOV            V0.2D, #-1.0 }
  self->_viewportArgumentsSize = _Q0;
  -[_UIWebViewportHandler overrideViewportConfiguration:](self, "overrideViewportConfiguration:");
}

- (float)viewportWidth
{
  double width;
  float initialScale;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double height;
  double v11;
  float v12;

  width = self->_configuration.size.width;
  initialScale = self->_configuration.initialScale;
  if (width != -1.0)
  {
    if (initialScale == -1.0)
      initialScale = self->_configuration.maximumScale;
    v5 = initialScale;
    v6 = width * v5;
    v7 = v6;
    v8 = self->_availableViewSize.width;
    if (v8 > v7)
      width = v8 / v5;
    return round(width);
  }
  if (initialScale != -1.0 && self->_configuration.size.height == -1.0)
  {
    v9 = self->_availableViewSize.width;
    height = initialScale;
LABEL_11:
    width = v9 / height;
    return round(width);
  }
  v11 = self->_availableViewSize.width;
  if (self->_availableViewSize.height > 0.0)
  {
    -[_UIWebViewportHandler viewportHeight](self, "viewportHeight");
    v9 = v11 * v12;
    height = self->_availableViewSize.height;
    goto LABEL_11;
  }
  return v11;
}

- (float)viewportHeight
{
  double height;
  float initialScale;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double width;
  double v11;
  float v12;

  height = self->_configuration.size.height;
  initialScale = self->_configuration.initialScale;
  if (height != -1.0)
  {
    if (initialScale == -1.0)
      initialScale = self->_configuration.maximumScale;
    v5 = initialScale;
    v6 = height * v5;
    v7 = v6;
    v8 = self->_availableViewSize.height;
    if (v8 > v7)
      height = v8 / v5;
    return ceil(height);
  }
  if (initialScale != -1.0 && self->_configuration.size.width == -1.0)
  {
    v9 = self->_availableViewSize.height;
    width = initialScale;
LABEL_11:
    height = v9 / width;
    return ceil(height);
  }
  v11 = self->_availableViewSize.height;
  if (self->_availableViewSize.width > 0.0)
  {
    -[_UIWebViewportHandler viewportWidth](self, "viewportWidth");
    v9 = v11 * v12;
    width = self->_availableViewSize.width;
    goto LABEL_11;
  }
  return v11;
}

- (double)integralInitialScale
{
  float v3;
  double result;

  -[_UIWebViewportHandler initialScale](self, "initialScale");
  -[_UIWebViewportHandler integralScaleForScale:keepingPointFixed:](self, "integralScaleForScale:keepingPointFixed:", 0, v3);
  return result;
}

- (double)integralScaleForScale:(double)a3 keepingPointFixed:(CGPoint *)a4
{
  double width;
  double v5;

  width = self->_documentBounds.size.width;
  if (width == 0.0)
  {
    v5 = 1.0;
    if (a3 != 0.0)
      v5 = a3;
  }
  else
  {
    v5 = round(width * a3) / width;
  }
  if (a3 != 0.0 && a4 != 0)
    *(float64x2_t *)a4 = vrndaq_f64(vdivq_f64(vmulq_n_f64(*(float64x2_t *)a4, v5), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0)));
  return v5;
}

- (float)minimumScaleForViewSize:(CGSize)a3
{
  double height;
  double width;
  CGSize *p_availableViewSize;
  BOOL v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  float result;
  CGSize v17;

  height = a3.height;
  width = a3.width;
  if (self->_configuration.initialScale != -1.0
    || ((p_availableViewSize = &self->_availableViewSize, self->_availableViewSize.width == a3.width)
      ? (v7 = self->_availableViewSize.height == a3.height)
      : (v7 = 0),
        v7))
  {
    -[_UIWebViewportHandler minimumScale](self, "minimumScale");
  }
  else
  {
    v17 = *p_availableViewSize;
    v9 = self->_documentBounds.size.width;
    v8 = self->_documentBounds.size.height;
    self->_availableViewSize = a3;
    -[_UIWebViewportHandler viewportWidth](self, "viewportWidth");
    v11 = self->_documentBounds.size.width;
    v12 = v10;
    if (v11 == v10)
    {
      if (v11 >= v10)
        v9 = self->_documentBounds.size.width;
      else
        v9 = v10;
      v8 = self->_documentBounds.size.height;
      -[_UIWebViewportHandler viewportHeight](self, "viewportHeight");
      v14 = v13;
      if (v8 < v14)
        v8 = v14;
      v11 = self->_documentBounds.size.width;
    }
    if (v11 <= 0.0)
      v15 = v12;
    else
      v15 = v9;
    result = width / v15;
    *p_availableViewSize = v17;
    if (v11 > 0.0 && v8 * result < height)
      result = height / v8;
    if (result < self->_configuration.minimumScale)
      result = self->_configuration.minimumScale;
    if (result >= self->_configuration.maximumScale)
      result = self->_configuration.maximumScale;
    if (result < 0.1)
      return 0.1;
  }
  return result;
}

- (_UIWebViewportHandlerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIWebViewportHandlerDelegate *)a3;
}

- (CGRect)documentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_documentBounds.origin.x;
  y = self->_documentBounds.origin.y;
  width = self->_documentBounds.size.width;
  height = self->_documentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)availableViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_availableViewSize.width;
  height = self->_availableViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)webkitDefinedConfigurationFlags
{
  return self->_webkitDefinedConfigurationFlags;
}

- (BOOL)isClassicViewportMode
{
  return self->_classicViewportMode;
}

@end
