@implementation VideosExtrasGridViewControllerStyle

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIEdgeInsets)collectionViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_collectionViewInsets.top;
  left = self->_collectionViewInsets.left;
  bottom = self->_collectionViewInsets.bottom;
  right = self->_collectionViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCollectionViewInsets:(UIEdgeInsets)a3
{
  self->_collectionViewInsets = a3;
}

- (NSString)detailTextStyle
{
  return self->_detailTextStyle;
}

- (void)setDetailTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextStyle, a3);
}

- (NSDictionary)detailDefaultFontAttributes
{
  return self->_detailDefaultFontAttributes;
}

- (void)setDetailDefaultFontAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_detailDefaultFontAttributes, a3);
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (void)setDetailTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextColor, a3);
}

- (UIEdgeInsets)detailInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_detailInsets.top;
  left = self->_detailInsets.left;
  bottom = self->_detailInsets.bottom;
  right = self->_detailInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setDetailInsets:(UIEdgeInsets)a3
{
  self->_detailInsets = a3;
}

- (VideosExtrasGridHeaderStyle)headerStyle
{
  return self->_headerStyle;
}

- (void)setHeaderStyle:(id)a3
{
  objc_storeStrong((id *)&self->_headerStyle, a3);
}

- (VideosExtrasGridSectionHeaderStyle)sectionHeaderStyle
{
  return self->_sectionHeaderStyle;
}

- (void)setSectionHeaderStyle:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderStyle, a3);
}

- (VideosExtrasGridCellStyle)defaultCellStyle
{
  return self->_defaultCellStyle;
}

- (void)setDefaultCellStyle:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCellStyle, a3);
}

- (VideosExtrasGridCellStyle)imageCellStyle
{
  return self->_imageCellStyle;
}

- (void)setImageCellStyle:(id)a3
{
  objc_storeStrong((id *)&self->_imageCellStyle, a3);
}

- (VideosExtrasGridCellStyle)videoCellStyle
{
  return self->_videoCellStyle;
}

- (void)setVideoCellStyle:(id)a3
{
  objc_storeStrong((id *)&self->_videoCellStyle, a3);
}

- (VideosExtrasGridCellStyle)productCellStyle
{
  return self->_productCellStyle;
}

- (void)setProductCellStyle:(id)a3
{
  objc_storeStrong((id *)&self->_productCellStyle, a3);
}

- (double)defaultSpacing
{
  return self->_defaultSpacing;
}

- (void)setDefaultSpacing:(double)a3
{
  self->_defaultSpacing = a3;
}

- (double)imageSpacing
{
  return self->_imageSpacing;
}

- (void)setImageSpacing:(double)a3
{
  self->_imageSpacing = a3;
}

- (double)videoSpacing
{
  return self->_videoSpacing;
}

- (void)setVideoSpacing:(double)a3
{
  self->_videoSpacing = a3;
}

- (double)productSpacing
{
  return self->_productSpacing;
}

- (void)setProductSpacing:(double)a3
{
  self->_productSpacing = a3;
}

- (UIEdgeInsets)defaultCellSectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_defaultCellSectionInsets.top;
  left = self->_defaultCellSectionInsets.left;
  bottom = self->_defaultCellSectionInsets.bottom;
  right = self->_defaultCellSectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setDefaultCellSectionInsets:(UIEdgeInsets)a3
{
  self->_defaultCellSectionInsets = a3;
}

- (UIEdgeInsets)imageCellSectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageCellSectionInsets.top;
  left = self->_imageCellSectionInsets.left;
  bottom = self->_imageCellSectionInsets.bottom;
  right = self->_imageCellSectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setImageCellSectionInsets:(UIEdgeInsets)a3
{
  self->_imageCellSectionInsets = a3;
}

- (UIEdgeInsets)videoCellSectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_videoCellSectionInsets.top;
  left = self->_videoCellSectionInsets.left;
  bottom = self->_videoCellSectionInsets.bottom;
  right = self->_videoCellSectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setVideoCellSectionInsets:(UIEdgeInsets)a3
{
  self->_videoCellSectionInsets = a3;
}

- (UIEdgeInsets)productCellSectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_productCellSectionInsets.top;
  left = self->_productCellSectionInsets.left;
  bottom = self->_productCellSectionInsets.bottom;
  right = self->_productCellSectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setProductCellSectionInsets:(UIEdgeInsets)a3
{
  self->_productCellSectionInsets = a3;
}

- (double)cellLineSpacing
{
  return self->_cellLineSpacing;
}

- (void)setCellLineSpacing:(double)a3
{
  self->_cellLineSpacing = a3;
}

- (BOOL)showsScrollFade
{
  return self->_showsScrollFade;
}

- (void)setShowsScrollFade:(BOOL)a3
{
  self->_showsScrollFade = a3;
}

- (BOOL)adjustsContentInsetByBottomNavBar
{
  return self->_adjustsContentInsetByBottomNavBar;
}

- (void)setAdjustsContentInsetByBottomNavBar:(BOOL)a3
{
  self->_adjustsContentInsetByBottomNavBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productCellStyle, 0);
  objc_storeStrong((id *)&self->_videoCellStyle, 0);
  objc_storeStrong((id *)&self->_imageCellStyle, 0);
  objc_storeStrong((id *)&self->_defaultCellStyle, 0);
  objc_storeStrong((id *)&self->_sectionHeaderStyle, 0);
  objc_storeStrong((id *)&self->_headerStyle, 0);
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_detailDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_detailTextStyle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
