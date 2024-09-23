@implementation PXCMMPosterHeaderViewSpec

- (PXCMMPosterHeaderViewSpec)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterHeaderViewSpec.m"), 20, CFSTR("%s is not available as initializer"), "-[PXCMMPosterHeaderViewSpec init]");

  abort();
}

- (PXCMMPosterHeaderViewSpec)initWithPresentationStyle:(int64_t)a3
{
  PXCMMPosterHeaderViewSpec *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterHeaderViewSpec;
  result = -[PXCMMPosterHeaderViewSpec init](&v5, sel_init);
  if (result)
  {
    if (a3 == 1)
    {
      result->_titleFontTextStyle = 7;
      result->_titleBaselineOffset = 24.0;
      result->_subtitleFontTextStyle = 11;
      result->_subtitleBaselineOffset = 18.0;
      result->_topGradientFontTextStyle = 7;
      result->_topGradientBaselineOffset = 24.0;
      result->_canShowStatus = 0;
      *(_OWORD *)&result->_titleFontDescriptorSymbolicTraits = xmmword_1A7C0C3D0;
      result->_bottomGradientFontDescriptorSymbolicTraits = 0;
      *(_OWORD *)&result->_statusFontTextStyle = 0u;
      *(_OWORD *)&result->_bottomGradientFontTextStyle = 0u;
    }
    else if (!a3)
    {
      result->_titleFontTextStyle = 3;
      result->_titleBaselineOffset = 32.0;
      result->_subtitleFontTextStyle = 7;
      result->_subtitleBaselineOffset = 24.0;
      result->_topGradientFontTextStyle = 3;
      result->_topGradientBaselineOffset = 26.0;
      result->_canShowStatus = 1;
      *(_OWORD *)&result->_titleFontDescriptorSymbolicTraits = xmmword_1A7C0C3E0;
      result->_statusFontTextStyle = 12;
      result->_statusBaselineOffset = 12.0;
      result->_bottomGradientFontDescriptorSymbolicTraits = 0;
      result->_bottomGradientFontTextStyle = 3;
      result->_bottomGradientBaselineOffset = 26.0;
    }
  }
  return result;
}

- (double)scaledTitleBaselineOffset
{
  double result;

  -[PXCMMPosterHeaderViewSpec titleFontTextStyle](self, "titleFontTextStyle");
  -[PXCMMPosterHeaderViewSpec titleFontDescriptorSymbolicTraits](self, "titleFontDescriptorSymbolicTraits");
  -[PXCMMPosterHeaderViewSpec titleBaselineOffset](self, "titleBaselineOffset");
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

- (double)scaledSubtitleBaselineOffset
{
  double result;

  -[PXCMMPosterHeaderViewSpec subtitleFontTextStyle](self, "subtitleFontTextStyle");
  -[PXCMMPosterHeaderViewSpec subtitleFontDescriptorSymbolicTraits](self, "subtitleFontDescriptorSymbolicTraits");
  -[PXCMMPosterHeaderViewSpec subtitleBaselineOffset](self, "subtitleBaselineOffset");
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

- (double)scaledTopGradientBaselineOffset
{
  double result;

  -[PXCMMPosterHeaderViewSpec topGradientFontTextStyle](self, "topGradientFontTextStyle");
  -[PXCMMPosterHeaderViewSpec topGradientFontDescriptorSymbolicTraits](self, "topGradientFontDescriptorSymbolicTraits");
  -[PXCMMPosterHeaderViewSpec topGradientBaselineOffset](self, "topGradientBaselineOffset");
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

- (double)scaledStatusBaselineOffset
{
  double result;

  -[PXCMMPosterHeaderViewSpec statusFontTextStyle](self, "statusFontTextStyle");
  -[PXCMMPosterHeaderViewSpec statusFontDescriptorSymbolicTraits](self, "statusFontDescriptorSymbolicTraits");
  -[PXCMMPosterHeaderViewSpec statusBaselineOffset](self, "statusBaselineOffset");
  if (!-[PXCMMPosterHeaderViewSpec canShowStatus](self, "canShowStatus"))
    return 0.0;
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

- (double)scaledBottomGradientBaselineOffset
{
  double result;

  -[PXCMMPosterHeaderViewSpec bottomGradientFontTextStyle](self, "bottomGradientFontTextStyle");
  -[PXCMMPosterHeaderViewSpec bottomGradientFontDescriptorSymbolicTraits](self, "bottomGradientFontDescriptorSymbolicTraits");
  -[PXCMMPosterHeaderViewSpec bottomGradientBaselineOffset](self, "bottomGradientBaselineOffset");
  if (!-[PXCMMPosterHeaderViewSpec canShowStatus](self, "canShowStatus"))
    return 0.0;
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  return result;
}

- (UIFont)preferredTitleFont
{
  -[PXCMMPosterHeaderViewSpec titleFontTextStyle](self, "titleFontTextStyle");
  -[PXCMMPosterHeaderViewSpec titleFontDescriptorSymbolicTraits](self, "titleFontDescriptorSymbolicTraits");
  JUMPOUT(0x1A85CC970);
}

- (UIFont)preferredSubtitleFont
{
  -[PXCMMPosterHeaderViewSpec subtitleFontTextStyle](self, "subtitleFontTextStyle");
  -[PXCMMPosterHeaderViewSpec subtitleFontDescriptorSymbolicTraits](self, "subtitleFontDescriptorSymbolicTraits");
  JUMPOUT(0x1A85CC970);
}

- (UIFont)preferredStatusFont
{
  int64_t v3;
  uint64_t v4;
  void *v5;

  v3 = -[PXCMMPosterHeaderViewSpec statusFontTextStyle](self, "statusFontTextStyle");
  v4 = -[PXCMMPosterHeaderViewSpec statusFontDescriptorSymbolicTraits](self, "statusFontDescriptorSymbolicTraits");
  if (-[PXCMMPosterHeaderViewSpec canShowStatus](self, "canShowStatus"))
  {
    MEMORY[0x1A85CC970](v3, v4, 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (UIFont *)v5;
}

- (int64_t)titleFontTextStyle
{
  return self->_titleFontTextStyle;
}

- (unsigned)titleFontDescriptorSymbolicTraits
{
  return self->_titleFontDescriptorSymbolicTraits;
}

- (double)titleBaselineOffset
{
  return self->_titleBaselineOffset;
}

- (int64_t)subtitleFontTextStyle
{
  return self->_subtitleFontTextStyle;
}

- (unsigned)subtitleFontDescriptorSymbolicTraits
{
  return self->_subtitleFontDescriptorSymbolicTraits;
}

- (double)subtitleBaselineOffset
{
  return self->_subtitleBaselineOffset;
}

- (int64_t)topGradientFontTextStyle
{
  return self->_topGradientFontTextStyle;
}

- (unsigned)topGradientFontDescriptorSymbolicTraits
{
  return self->_topGradientFontDescriptorSymbolicTraits;
}

- (double)topGradientBaselineOffset
{
  return self->_topGradientBaselineOffset;
}

- (BOOL)canShowStatus
{
  return self->_canShowStatus;
}

- (int64_t)statusFontTextStyle
{
  return self->_statusFontTextStyle;
}

- (unsigned)statusFontDescriptorSymbolicTraits
{
  return self->_statusFontDescriptorSymbolicTraits;
}

- (double)statusBaselineOffset
{
  return self->_statusBaselineOffset;
}

- (int64_t)bottomGradientFontTextStyle
{
  return self->_bottomGradientFontTextStyle;
}

- (unsigned)bottomGradientFontDescriptorSymbolicTraits
{
  return self->_bottomGradientFontDescriptorSymbolicTraits;
}

- (double)bottomGradientBaselineOffset
{
  return self->_bottomGradientBaselineOffset;
}

@end
