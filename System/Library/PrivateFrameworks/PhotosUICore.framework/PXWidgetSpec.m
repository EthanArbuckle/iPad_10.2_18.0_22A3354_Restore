@implementation PXWidgetSpec

- (PXWidgetSpec)init
{
  return -[PXFeatureSpec initWithExtendedTraitCollection:](self, "initWithExtendedTraitCollection:", 0);
}

- (PXWidgetSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXWidgetSpec initWithExtendedTraitCollection:options:detailsOptions:](self, "initWithExtendedTraitCollection:options:detailsOptions:", a3, a4, 0);
}

- (PXWidgetSpec)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4
{
  return -[PXWidgetSpec initWithExtendedTraitCollection:options:detailsOptions:](self, "initWithExtendedTraitCollection:options:detailsOptions:", a3, 0, a4);
}

- (PXWidgetSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  PXWidgetSpec *v6;
  PXWidgetSpec *v7;
  double v8;
  double v9;
  unint64_t detailsOptions;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double *p_top;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  __int128 v22;
  double v23;
  uint64_t v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  int64x2_t v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PXWidgetSpec;
  v6 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v30, sel_initWithExtendedTraitCollection_options_, a3, a4);
  v7 = v6;
  if (!v6)
    return v7;
  v6->_detailsOptions = a5;
  PXFontScaleForTextStyle();
  v9 = v8;
  detailsOptions = v7->_detailsOptions;
  if (-[PXFeatureSpec userInterfaceIdiom](v7, "userInterfaceIdiom") != 3)
  {
    p_top = &v7->_contentGuideInsets.top;
    if ((v7->_detailsOptions & 8) != 0)
    {
      v22 = *((_OWORD *)off_1E50B8020 + 1);
      *(_OWORD *)p_top = *(_OWORD *)off_1E50B8020;
      *(_OWORD *)&v7->_contentGuideInsets.bottom = v22;
      if ((detailsOptions & 2) == 0)
      {
LABEL_9:
        v23 = *p_top;
LABEL_10:
        v7->_distanceBetweenTopAndHeaderlessWidgetContentTop = v23;
        v7->_distanceBetweenHeaderBaselineAndWidgetContentTop = round(v9 * 15.0);
        v7->_distanceBetweenWidgetContentBottomAndFooterBaseline = 20.0;
        v7->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline = 65.0;
        v7->_distanceBetweenFooterBaselineAndBottom = 12.0;
        v7->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline = round(v9 * 45.0);
        v7->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop = 16.0;
        v7->_distanceBetweenFooterlessWidgetContentBottomAndBottom = 16.0;
        v15 = 10.0;
        v16 = 18.0;
        if (-[PXFeatureSpec userInterfaceIdiom](v7, "userInterfaceIdiom") == 5)
        {
          v7->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline = round(v9 * 21.0);
          v7->_distanceBetweenHeaderBaselineAndWidgetContentTop = round(v9 * 19.0);
          v7->_distanceBetweenFooterlessWidgetContentBottomAndBottom = 0.0;
          PXEdgeInsetsMake();
          *(_QWORD *)p_top = v24;
          v7->_contentGuideInsets.left = v25;
          v7->_contentGuideInsets.bottom = v26;
          v7->_contentGuideInsets.right = v27;
        }
        goto LABEL_12;
      }
    }
    else
    {
      -[PXFeatureSpec contentGuideInsetsForScrollAxis:](v7, "contentGuideInsetsForScrollAxis:", 1);
      *(_QWORD *)p_top = v18;
      v7->_contentGuideInsets.left = v19;
      v7->_contentGuideInsets.bottom = v20;
      v7->_contentGuideInsets.right = v21;
      if ((detailsOptions & 2) == 0)
        goto LABEL_9;
    }
    v23 = 16.0;
    if ((v7->_detailsOptions & 0x20) != 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  PXEdgeInsetsMake();
  v7->_contentGuideInsets.top = v11;
  v7->_contentGuideInsets.left = v12;
  v7->_contentGuideInsets.bottom = v13;
  v7->_contentGuideInsets.right = v14;
  v7->_distanceBetweenTopAndHeaderlessWidgetContentTop = 12.0;
  v7->_distanceBetweenHeaderBaselineAndWidgetContentTop = 44.0;
  v7->_distanceBetweenWidgetContentBottomAndFooterBaseline = 88.0;
  v7->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline = 170.0;
  v7->_distanceBetweenFooterBaselineAndBottom = 35.0;
  v7->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline = 90.0;
  v7->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop = 45.0;
  v15 = 30.0;
  v7->_distanceBetweenFooterlessWidgetContentBottomAndBottom = 50.0;
  v16 = 50.0;
LABEL_12:
  v7->_distanceBetweenFooterTopAndFooterBaseline = v16;
  v7->_distanceBetweenFooterBaselineAndFooterBottom = v15;
  if ((detailsOptions & 2) != 0)
    v28 = *(int64x2_t *)MEMORY[0x1E0C9D820];
  else
    v28 = vdupq_n_s64(0x4049000000000000uLL);
  v7->_interWidgetSpacing = (CGSize)v28;
  v7->_distanceBetweenTopAndFirstHeaderBaseline = round(v9 * 36.0);
  v7->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop = 53.0;
  v7->_distanceBetweenHeaderTopAndHeaderBaseline = round(v9 * 40.0);
  v7->_distanceBetweenHeaderBaselineAndHeaderBottom = round(v9 * 14.0);
  v7->_distanceBetweenMainContentBottomAndCaptionBaseline = round(v9 * 20.0);
  v7->_distanceBetweenMapViewAndAddressTop = round(v9 * 6.0);
  return v7;
}

- (UIEdgeInsets)contentGuideInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentGuideInsets.top;
  left = self->_contentGuideInsets.left;
  bottom = self->_contentGuideInsets.bottom;
  right = self->_contentGuideInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentGuideInsets:(UIEdgeInsets)a3
{
  self->_contentGuideInsets = a3;
}

- (double)distanceBetweenMainContentBottomAndCaptionBaseline
{
  return self->_distanceBetweenMainContentBottomAndCaptionBaseline;
}

- (double)distanceBetweenMapViewAndAddressTop
{
  return self->_distanceBetweenMapViewAndAddressTop;
}

- (CGSize)interWidgetSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interWidgetSpacing.width;
  height = self->_interWidgetSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (double)distanceBetweenTopAndFirstHeaderBaseline
{
  return self->_distanceBetweenTopAndFirstHeaderBaseline;
}

- (void)setDistanceBetweenTopAndFirstHeaderBaseline:(double)a3
{
  self->_distanceBetweenTopAndFirstHeaderBaseline = a3;
}

- (double)distanceBetweenTopAndHeaderlessWidgetContentTop
{
  return self->_distanceBetweenTopAndHeaderlessWidgetContentTop;
}

- (void)setDistanceBetweenTopAndHeaderlessWidgetContentTop:(double)a3
{
  self->_distanceBetweenTopAndHeaderlessWidgetContentTop = a3;
}

- (double)distanceBetweenHeaderBaselineAndWidgetContentTop
{
  return self->_distanceBetweenHeaderBaselineAndWidgetContentTop;
}

- (void)setDistanceBetweenHeaderBaselineAndWidgetContentTop:(double)a3
{
  self->_distanceBetweenHeaderBaselineAndWidgetContentTop = a3;
}

- (double)distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline
{
  return self->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline;
}

- (void)setDistanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline:(double)a3
{
  self->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline = a3;
}

- (double)distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop
{
  return self->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop;
}

- (void)setDistanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop:(double)a3
{
  self->_distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop = a3;
}

- (double)distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline
{
  return self->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline;
}

- (void)setDistanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline:(double)a3
{
  self->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline = a3;
}

- (double)distanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop
{
  return self->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop;
}

- (void)setDistanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop:(double)a3
{
  self->_distanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop = a3;
}

- (double)distanceBetweenWidgetContentBottomAndFooterBaseline
{
  return self->_distanceBetweenWidgetContentBottomAndFooterBaseline;
}

- (void)setDistanceBetweenWidgetContentBottomAndFooterBaseline:(double)a3
{
  self->_distanceBetweenWidgetContentBottomAndFooterBaseline = a3;
}

- (double)distanceBetweenFooterBaselineAndBottom
{
  return self->_distanceBetweenFooterBaselineAndBottom;
}

- (void)setDistanceBetweenFooterBaselineAndBottom:(double)a3
{
  self->_distanceBetweenFooterBaselineAndBottom = a3;
}

- (double)distanceBetweenFooterlessWidgetContentBottomAndBottom
{
  return self->_distanceBetweenFooterlessWidgetContentBottomAndBottom;
}

- (void)setDistanceBetweenFooterlessWidgetContentBottomAndBottom:(double)a3
{
  self->_distanceBetweenFooterlessWidgetContentBottomAndBottom = a3;
}

- (double)distanceBetweenHeaderTopAndHeaderBaseline
{
  return self->_distanceBetweenHeaderTopAndHeaderBaseline;
}

- (void)setDistanceBetweenHeaderTopAndHeaderBaseline:(double)a3
{
  self->_distanceBetweenHeaderTopAndHeaderBaseline = a3;
}

- (double)distanceBetweenHeaderBaselineAndHeaderBottom
{
  return self->_distanceBetweenHeaderBaselineAndHeaderBottom;
}

- (void)setDistanceBetweenHeaderBaselineAndHeaderBottom:(double)a3
{
  self->_distanceBetweenHeaderBaselineAndHeaderBottom = a3;
}

- (double)distanceBetweenFooterTopAndFooterBaseline
{
  return self->_distanceBetweenFooterTopAndFooterBaseline;
}

- (void)setDistanceBetweenFooterTopAndFooterBaseline:(double)a3
{
  self->_distanceBetweenFooterTopAndFooterBaseline = a3;
}

- (double)distanceBetweenFooterBaselineAndFooterBottom
{
  return self->_distanceBetweenFooterBaselineAndFooterBottom;
}

- (void)setDistanceBetweenFooterBaselineAndFooterBottom:(double)a3
{
  self->_distanceBetweenFooterBaselineAndFooterBottom = a3;
}

@end
