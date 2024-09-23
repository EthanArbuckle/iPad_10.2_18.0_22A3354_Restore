@implementation PXCuratedLibraryCardSectionBodyLayoutSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skimmingHintGradient, 0);
}

- (PXCuratedLibraryCardSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  PXCuratedLibraryCardSectionBodyLayoutSpec *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  PXGGradient *skimmingHintGradient;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryCardSectionBodyLayoutSpec;
  v4 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v14, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (v4)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_aspectRatio = 1.0;
    v6 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)&v4->_padding.top = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)&v4->_padding.bottom = v6;
    if (-[PXFeatureSpec userInterfaceIdiom](v4, "userInterfaceIdiom") == 4)
      v7 = 0x404A000000000000;
    else
      -[PXFeatureSpec contentGuideInsetsForScrollAxis:](v4, "contentGuideInsetsForScrollAxis:", 1);
    *(_QWORD *)&v4->_horizontalMargin = v7;
    if ((objc_msgSend(v5, "exaggerateContrast") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc((Class)off_1E50B2A20);
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithStartingColor:endingColor:direction:", v10, v8, 0);
    skimmingHintGradient = v4->_skimmingHintGradient;
    v4->_skimmingHintGradient = (PXGGradient *)v11;

    v4->_allowsVideoPlaybackAtAnySize = 0;
  }
  return v4;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  self->_cornerRadius.var0.var0.topLeft = v3;
  self->_cornerRadius.var0.var0.topRight = v4;
  self->_cornerRadius.var0.var0.bottomLeft = v5;
  self->_cornerRadius.var0.var0.bottomRight = v6;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (void)setDistanceToNextLayout:(double)a3
{
  self->_distanceToNextLayout = a3;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setHorizontalMargin:(double)a3
{
  self->_horizontalMargin = a3;
}

- (PXGGradient)skimmingHintGradient
{
  return self->_skimmingHintGradient;
}

- (double)distanceToNextLayout
{
  return self->_distanceToNextLayout;
}

- (BOOL)allowsVideoPlaybackAtAnySize
{
  return self->_allowsVideoPlaybackAtAnySize;
}

@end
