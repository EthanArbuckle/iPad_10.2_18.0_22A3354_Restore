@implementation PXLivePhotoTrimScrubberSpec

- (PXLivePhotoTrimScrubberSpec)init
{
  PXLivePhotoTrimScrubberSpec *v2;
  PXLivePhotoTrimScrubberSpec *v3;
  UIColor *filmstripBorderColor;
  uint64_t v5;
  UIColor *disabledOverlayColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXLivePhotoTrimScrubberSpec;
  v2 = -[PXLivePhotoTrimScrubberSpec init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_scrubberHeight = xmmword_1A7C0C7C0;
    *(_OWORD *)&v2->_handleWidth = xmmword_1A7C0C7B0;
    *(_OWORD *)&v2->_filmstripViewInsets.top = xmmword_1A7C0C7D0;
    *(_OWORD *)&v2->_filmstripViewInsets.bottom = xmmword_1A7C0C7D0;
    *(_OWORD *)&v2->_handleAnchorX = xmmword_1A7C0C7E0;
    *(_OWORD *)&v2->_loupeOuterCornerRadius = xmmword_1A7C0C7F0;
    filmstripBorderColor = v2->_filmstripBorderColor;
    v2->_filmstripCornerRadius = 0.0;
    v2->_filmstripBorderColor = 0;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.8);
    v5 = objc_claimAutoreleasedReturnValue();
    disabledOverlayColor = v3->_disabledOverlayColor;
    v3->_disabledOverlayColor = (UIColor *)v5;

    *(_WORD *)&v3->_fallbackToKeyTimeTracking = 257;
    v3->_playheadWidth = 4.0;
  }
  return v3;
}

- (void)setUseMiniScrubberHeight:(BOOL)a3
{
  if (self->_useMiniScrubberHeight != a3)
  {
    self->_useMiniScrubberHeight = a3;
    -[PXLivePhotoTrimScrubberSpec _updateScrubberHeight](self, "_updateScrubberHeight");
  }
}

- (void)_updateScrubberHeight
{
  _BOOL4 v3;
  double v4;
  _BOOL4 v5;
  double v6;
  _BOOL4 v7;
  double v8;

  v3 = -[PXLivePhotoTrimScrubberSpec useMiniScrubberHeight](self, "useMiniScrubberHeight");
  v4 = 41.0;
  if (v3)
    v4 = 26.0;
  self->_scrubberHeight = v4;
  v5 = -[PXLivePhotoTrimScrubberSpec useMiniScrubberHeight](self, "useMiniScrubberHeight");
  v6 = 51.0;
  if (v5)
    v6 = 36.0;
  self->_handleHeight = v6;
  v7 = -[PXLivePhotoTrimScrubberSpec useMiniScrubberHeight](self, "useMiniScrubberHeight");
  v8 = 4.0;
  if (v7)
    v8 = 2.0;
  self->_playheadWidth = v8;
}

- (double)scrubberHeight
{
  return self->_scrubberHeight;
}

- (void)setScrubberHeight:(double)a3
{
  self->_scrubberHeight = a3;
}

- (double)handleTouchDistance
{
  return self->_handleTouchDistance;
}

- (void)setHandleTouchDistance:(double)a3
{
  self->_handleTouchDistance = a3;
}

- (double)handleWidth
{
  return self->_handleWidth;
}

- (void)setHandleWidth:(double)a3
{
  self->_handleWidth = a3;
}

- (double)handleHeight
{
  return self->_handleHeight;
}

- (void)setHandleHeight:(double)a3
{
  self->_handleHeight = a3;
}

- (double)handleAnchorX
{
  return self->_handleAnchorX;
}

- (void)setHandleAnchorX:(double)a3
{
  self->_handleAnchorX = a3;
}

- (UIEdgeInsets)filmstripViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_filmstripViewInsets.top;
  left = self->_filmstripViewInsets.left;
  bottom = self->_filmstripViewInsets.bottom;
  right = self->_filmstripViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFilmstripViewInsets:(UIEdgeInsets)a3
{
  self->_filmstripViewInsets = a3;
}

- (double)loupeVerticalInset
{
  return self->_loupeVerticalInset;
}

- (void)setLoupeVerticalInset:(double)a3
{
  self->_loupeVerticalInset = a3;
}

- (double)loupeOuterCornerRadius
{
  return self->_loupeOuterCornerRadius;
}

- (void)setLoupeOuterCornerRadius:(double)a3
{
  self->_loupeOuterCornerRadius = a3;
}

- (double)loupeInnerCornerRadius
{
  return self->_loupeInnerCornerRadius;
}

- (void)setLoupeInnerCornerRadius:(double)a3
{
  self->_loupeInnerCornerRadius = a3;
}

- (double)playheadWidth
{
  return self->_playheadWidth;
}

- (void)setPlayheadWidth:(double)a3
{
  self->_playheadWidth = a3;
}

- (double)filmstripCornerRadius
{
  return self->_filmstripCornerRadius;
}

- (void)setFilmstripCornerRadius:(double)a3
{
  self->_filmstripCornerRadius = a3;
}

- (UIColor)filmstripBorderColor
{
  return self->_filmstripBorderColor;
}

- (void)setFilmstripBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_filmstripBorderColor, a3);
}

- (UIColor)disabledOverlayColor
{
  return self->_disabledOverlayColor;
}

- (void)setDisabledOverlayColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledOverlayColor, a3);
}

- (BOOL)fallbackToKeyTimeTracking
{
  return self->_fallbackToKeyTimeTracking;
}

- (void)setFallbackToKeyTimeTracking:(BOOL)a3
{
  self->_fallbackToKeyTimeTracking = a3;
}

- (BOOL)fallbackToPlayheadTracking
{
  return self->_fallbackToPlayheadTracking;
}

- (void)setFallbackToPlayheadTracking:(BOOL)a3
{
  self->_fallbackToPlayheadTracking = a3;
}

- (BOOL)useMiniScrubberHeight
{
  return self->_useMiniScrubberHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledOverlayColor, 0);
  objc_storeStrong((id *)&self->_filmstripBorderColor, 0);
}

@end
