@implementation _PXPhotosSectionHeaderViewConfiguration

- (_PXAlbumSectionHeaderLayout)weakLayout
{
  return (_PXAlbumSectionHeaderLayout *)objc_loadWeakRetained((id *)&self->weakLayout);
}

- (void)setWeakLayout:(id)a3
{
  objc_storeWeak((id *)&self->weakLayout, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSArray)locationNames
{
  return self->_locationNames;
}

- (void)setLocationNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)headerStyle
{
  return self->_headerStyle;
}

- (void)setHeaderStyle:(int64_t)a3
{
  self->_headerStyle = a3;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (BOOL)allowsPhotosDetailsInteraction
{
  return self->_allowsPhotosDetailsInteraction;
}

- (void)setAllowsPhotosDetailsInteraction:(BOOL)a3
{
  self->_allowsPhotosDetailsInteraction = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (void)setBackdropViewGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIImage)gradientImage
{
  return self->_gradientImage;
}

- (void)setGradientImage:(id)a3
{
  objc_storeStrong((id *)&self->_gradientImage, a3);
}

- (double)gradientAlpha
{
  return self->_gradientAlpha;
}

- (void)setGradientAlpha:(double)a3
{
  self->_gradientAlpha = a3;
}

- (double)gradientOverhang
{
  return self->_gradientOverhang;
}

- (void)setGradientOverhang:(double)a3
{
  self->_gradientOverhang = a3;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)buttonSpec
{
  return self->_buttonSpec;
}

- (void)setButtonSpec:(id)a3
{
  objc_storeStrong((id *)&self->_buttonSpec, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonSpec, 0);
  objc_storeStrong((id *)&self->_gradientImage, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong((id *)&self->_locationNames, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->weakLayout);
}

@end
