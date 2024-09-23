@implementation PXLivePhotoTrimScrubberSnapStripControllerSpec

- (PXLivePhotoTrimScrubberSnapStripControllerSpec)init
{
  PXLivePhotoTrimScrubberSnapStripControllerSpec *v2;
  uint64_t v3;
  UIColor *disabledColor;
  uint64_t v5;
  UIColor *originalPositionMarkerColor;
  uint64_t v7;
  UIColor *currentPositionMarkerColor;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXLivePhotoTrimScrubberSnapStripControllerSpec;
  v2 = -[PXLivePhotoTrimScrubberSnapStripControllerSpec init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v3 = objc_claimAutoreleasedReturnValue();
    disabledColor = v2->_disabledColor;
    v2->_disabledColor = (UIColor *)v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v5 = objc_claimAutoreleasedReturnValue();
    originalPositionMarkerColor = v2->_originalPositionMarkerColor;
    v2->_originalPositionMarkerColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = objc_claimAutoreleasedReturnValue();
    currentPositionMarkerColor = v2->_currentPositionMarkerColor;
    v2->_currentPositionMarkerColor = (UIColor *)v7;

    *(_WORD *)&v2->_alwaysShowKeyTime = 257;
  }
  return v2;
}

- (UIColor)disabledColor
{
  return self->_disabledColor;
}

- (void)setDisabledColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledColor, a3);
}

- (UIColor)currentPositionMarkerColor
{
  return self->_currentPositionMarkerColor;
}

- (void)setCurrentPositionMarkerColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentPositionMarkerColor, a3);
}

- (UIColor)originalPositionMarkerColor
{
  return self->_originalPositionMarkerColor;
}

- (void)setOriginalPositionMarkerColor:(id)a3
{
  objc_storeStrong((id *)&self->_originalPositionMarkerColor, a3);
}

- (UIColor)suggestedMarkerColor
{
  return self->_suggestedMarkerColor;
}

- (void)setSuggestedMarkerColor:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedMarkerColor, a3);
}

- (BOOL)alwaysShowKeyTime
{
  return self->_alwaysShowKeyTime;
}

- (void)setAlwaysShowKeyTime:(BOOL)a3
{
  self->_alwaysShowKeyTime = a3;
}

- (BOOL)showDefaultKeyTime
{
  return self->_showDefaultKeyTime;
}

- (void)setShowDefaultKeyTime:(BOOL)a3
{
  self->_showDefaultKeyTime = a3;
}

- (BOOL)livePortraitStyle
{
  return self->_livePortraitStyle;
}

- (void)setLivePortraitStyle:(BOOL)a3
{
  self->_livePortraitStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedMarkerColor, 0);
  objc_storeStrong((id *)&self->_originalPositionMarkerColor, 0);
  objc_storeStrong((id *)&self->_currentPositionMarkerColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
}

@end
