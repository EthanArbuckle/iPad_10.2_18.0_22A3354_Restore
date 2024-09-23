@implementation PUAlbumListCellContentViewHelperConfiguration

- (void)configureWithSpec:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PUAlbumListCellContentViewHelperConfiguration setImageContentMode:](self, "setImageContentMode:", objc_msgSend(v4, "imageContentMode"));
  -[PUAlbumListCellContentViewHelperConfiguration setStackViewStyle:](self, "setStackViewStyle:", objc_msgSend(v4, "stackViewStyle"));
  -[PUAlbumListCellContentViewHelperConfiguration setFolderStackViewStyle:](self, "setFolderStackViewStyle:", objc_msgSend(v4, "folderStackViewStyle"));
  objc_msgSend(v4, "stackPhotoDecoration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentViewHelperConfiguration setPhotoDecoration:](self, "setPhotoDecoration:", v5);

  objc_msgSend(v4, "stackSize");
  -[PUAlbumListCellContentViewHelperConfiguration setStackSize:](self, "setStackSize:");
  objc_msgSend(v4, "stackOffset");
  -[PUAlbumListCellContentViewHelperConfiguration setStackOffset:](self, "setStackOffset:");
  objc_msgSend(v4, "stackPerspectiveInsets");
  -[PUAlbumListCellContentViewHelperConfiguration setStackPerspectiveInsets:](self, "setStackPerspectiveInsets:");
  objc_msgSend(v4, "stackPerspectiveOffset");
  -[PUAlbumListCellContentViewHelperConfiguration setStackPerspectiveOffset:](self, "setStackPerspectiveOffset:");
  objc_msgSend(v4, "posterSquareCornerRadius");
  -[PUAlbumListCellContentViewHelperConfiguration setPosterSquareCornerRadius:](self, "setPosterSquareCornerRadius:");
  objc_msgSend(v4, "posterSubitemCornerRadius");
  -[PUAlbumListCellContentViewHelperConfiguration setPosterSubitemCornerRadius:](self, "setPosterSubitemCornerRadius:");
  objc_msgSend(v4, "nameOfEmptyPeopleAlbumPlaceholderImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentViewHelperConfiguration setNameOfEmptyPeopleAlbumPlaceholderImage:](self, "setNameOfEmptyPeopleAlbumPlaceholderImage:", v6);

  objc_msgSend(v4, "nameOfEmptyAlbumPlaceholderImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentViewHelperConfiguration setNameOfEmptyAlbumPlaceholderImage:](self, "setNameOfEmptyAlbumPlaceholderImage:", v7);

  objc_msgSend(v4, "nameOfEmptySharedAlbumPlaceholderImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PUAlbumListCellContentViewHelperConfiguration setNameOfEmptySharedAlbumPlaceholderImage:](self, "setNameOfEmptySharedAlbumPlaceholderImage:", v8);
}

- (BOOL)allowsEmailInSubtitle
{
  return self->_allowsEmailInSubtitle;
}

- (void)setAllowsEmailInSubtitle:(BOOL)a3
{
  self->_allowsEmailInSubtitle = a3;
}

- (BOOL)showsDeleteButtonOnCellContentView
{
  return self->_showsDeleteButtonOnCellContentView;
}

- (void)setShowsDeleteButtonOnCellContentView:(BOOL)a3
{
  self->_showsDeleteButtonOnCellContentView = a3;
}

- (BOOL)hasRoundedCorners
{
  return self->_hasRoundedCorners;
}

- (void)setHasRoundedCorners:(BOOL)a3
{
  self->_hasRoundedCorners = a3;
}

- (BOOL)shouldUseTableView
{
  return self->_shouldUseTableView;
}

- (void)setShouldUseTableView:(BOOL)a3
{
  self->_shouldUseTableView = a3;
}

- (BOOL)shouldCenterTextHorizontally
{
  return self->_shouldCenterTextHorizontally;
}

- (void)setShouldCenterTextHorizontally:(BOOL)a3
{
  self->_shouldCenterTextHorizontally = a3;
}

- (BOOL)hasClearBackgroundColor
{
  return self->_hasClearBackgroundColor;
}

- (void)setHasClearBackgroundColor:(BOOL)a3
{
  self->_hasClearBackgroundColor = a3;
}

- (int64_t)cellContentViewLayout
{
  return self->_cellContentViewLayout;
}

- (void)setCellContentViewLayout:(int64_t)a3
{
  self->_cellContentViewLayout = a3;
}

- (unint64_t)stackViewStyle
{
  return self->_stackViewStyle;
}

- (void)setStackViewStyle:(unint64_t)a3
{
  self->_stackViewStyle = a3;
}

- (unint64_t)folderStackViewStyle
{
  return self->_folderStackViewStyle;
}

- (void)setFolderStackViewStyle:(unint64_t)a3
{
  self->_folderStackViewStyle = a3;
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (void)setImageContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
}

- (NSString)albumSubtitleFormat
{
  return self->_albumSubtitleFormat;
}

- (void)setAlbumSubtitleFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)nameOfEmptyPeopleAlbumPlaceholderImage
{
  return self->_nameOfEmptyPeopleAlbumPlaceholderImage;
}

- (void)setNameOfEmptyPeopleAlbumPlaceholderImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)nameOfEmptyAlbumPlaceholderImage
{
  return self->_nameOfEmptyAlbumPlaceholderImage;
}

- (void)setNameOfEmptyAlbumPlaceholderImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)nameOfEmptySharedAlbumPlaceholderImage
{
  return self->_nameOfEmptySharedAlbumPlaceholderImage;
}

- (void)setNameOfEmptySharedAlbumPlaceholderImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (PUPhotoDecoration)photoDecoration
{
  return self->_photoDecoration;
}

- (void)setPhotoDecoration:(id)a3
{
  objc_storeStrong((id *)&self->_photoDecoration, a3);
}

- (CGSize)stackSize
{
  double width;
  double height;
  CGSize result;

  width = self->_stackSize.width;
  height = self->_stackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setStackSize:(CGSize)a3
{
  self->_stackSize = a3;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPixelSize:(CGSize)a3
{
  self->_pixelSize = a3;
}

- (UIOffset)stackOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_stackOffset.horizontal;
  vertical = self->_stackOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setStackOffset:(UIOffset)a3
{
  self->_stackOffset = a3;
}

- (UIOffset)stackPerspectiveOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_stackPerspectiveOffset.horizontal;
  vertical = self->_stackPerspectiveOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setStackPerspectiveOffset:(UIOffset)a3
{
  self->_stackPerspectiveOffset = a3;
}

- (UIEdgeInsets)stackPerspectiveInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_stackPerspectiveInsets.top;
  left = self->_stackPerspectiveInsets.left;
  bottom = self->_stackPerspectiveInsets.bottom;
  right = self->_stackPerspectiveInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setStackPerspectiveInsets:(UIEdgeInsets)a3
{
  self->_stackPerspectiveInsets = a3;
}

- (double)gridMargin
{
  return self->_gridMargin;
}

- (void)setGridMargin:(double)a3
{
  self->_gridMargin = a3;
}

- (double)gridItemSpacing
{
  return self->_gridItemSpacing;
}

- (void)setGridItemSpacing:(double)a3
{
  self->_gridItemSpacing = a3;
}

- (double)posterSquareCornerRadius
{
  return self->_posterSquareCornerRadius;
}

- (void)setPosterSquareCornerRadius:(double)a3
{
  self->_posterSquareCornerRadius = a3;
}

- (double)posterSubitemCornerRadius
{
  return self->_posterSubitemCornerRadius;
}

- (void)setPosterSubitemCornerRadius:(double)a3
{
  self->_posterSubitemCornerRadius = a3;
}

- (BOOL)cornerOverlaysDisabled
{
  return self->_cornerOverlaysDisabled;
}

- (void)setCornerOverlaysDisabled:(BOOL)a3
{
  self->_cornerOverlaysDisabled = a3;
}

- (UIEdgeInsets)previewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_previewInsets.top;
  left = self->_previewInsets.left;
  bottom = self->_previewInsets.bottom;
  right = self->_previewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPreviewInsets:(UIEdgeInsets)a3
{
  self->_previewInsets = a3;
}

- (double)dynamicTitleLeading
{
  return self->_dynamicTitleLeading;
}

- (void)setDynamicTitleLeading:(double)a3
{
  self->_dynamicTitleLeading = a3;
}

- (double)dynamicSubtitleleading
{
  return self->_dynamicSubtitleleading;
}

- (void)setDynamicSubtitleleading:(double)a3
{
  self->_dynamicSubtitleleading = a3;
}

- (double)dynamicTopLeading
{
  return self->_dynamicTopLeading;
}

- (void)setDynamicTopLeading:(double)a3
{
  self->_dynamicTopLeading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoDecoration, 0);
  objc_storeStrong((id *)&self->_nameOfEmptySharedAlbumPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_nameOfEmptyAlbumPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_nameOfEmptyPeopleAlbumPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_albumSubtitleFormat, 0);
}

+ (id)defaultConfiguration
{
  PUAlbumListCellContentViewHelperConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(PUAlbumListCellContentViewHelperConfiguration);
  -[PUAlbumListCellContentViewHelperConfiguration setAllowsEmailInSubtitle:](v2, "setAllowsEmailInSubtitle:", 1);
  -[PUAlbumListCellContentViewHelperConfiguration setShowsDeleteButtonOnCellContentView:](v2, "setShowsDeleteButtonOnCellContentView:", 1);
  -[PUAlbumListCellContentViewHelperConfiguration setHasRoundedCorners:](v2, "setHasRoundedCorners:", 1);
  -[PUAlbumListCellContentViewHelperConfiguration setShouldUseTableView:](v2, "setShouldUseTableView:", 0);
  -[PUAlbumListCellContentViewHelperConfiguration setCellContentViewLayout:](v2, "setCellContentViewLayout:", 2);
  -[PUAlbumListCellContentViewHelperConfiguration setStackViewStyle:](v2, "setStackViewStyle:", 5);
  -[PUAlbumListCellContentViewHelperConfiguration setFolderStackViewStyle:](v2, "setFolderStackViewStyle:", 3);
  -[PUAlbumListCellContentViewHelperConfiguration setImageContentMode:](v2, "setImageContentMode:", 1);
  -[PUAlbumListCellContentViewHelperConfiguration setNameOfEmptyPeopleAlbumPlaceholderImage:](v2, "setNameOfEmptyPeopleAlbumPlaceholderImage:", CFSTR("person.crop.rectangle"));
  -[PUAlbumListCellContentViewHelperConfiguration setNameOfEmptyAlbumPlaceholderImage:](v2, "setNameOfEmptyAlbumPlaceholderImage:", CFSTR("photo.on.rectangle"));
  -[PUAlbumListCellContentViewHelperConfiguration setNameOfEmptySharedAlbumPlaceholderImage:](v2, "setNameOfEmptySharedAlbumPlaceholderImage:", CFSTR("icloud"));
  +[PUPhotoDecoration defaultDecoration](PUPhotoDecoration, "defaultDecoration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentViewHelperConfiguration setPhotoDecoration:](v2, "setPhotoDecoration:", v3);

  -[PUAlbumListCellContentViewHelperConfiguration setPixelSize:](v2, "setPixelSize:", 256.0, 256.0);
  -[PUAlbumListCellContentViewHelperConfiguration setStackOffset:](v2, "setStackOffset:", 0.0, 0.0);
  -[PUAlbumListCellContentViewHelperConfiguration setStackPerspectiveOffset:](v2, "setStackPerspectiveOffset:", 0.0, -4.0);
  -[PUAlbumListCellContentViewHelperConfiguration setStackPerspectiveInsets:](v2, "setStackPerspectiveInsets:", 2.0, 2.0, 2.0, 2.0);
  -[PUAlbumListCellContentViewHelperConfiguration setGridMargin:](v2, "setGridMargin:", 0.0);
  -[PUAlbumListCellContentViewHelperConfiguration setGridItemSpacing:](v2, "setGridItemSpacing:", 2.0);
  -[PUAlbumListCellContentViewHelperConfiguration setPosterSquareCornerRadius:](v2, "setPosterSquareCornerRadius:", 4.0);
  -[PUAlbumListCellContentViewHelperConfiguration setPosterSubitemCornerRadius:](v2, "setPosterSubitemCornerRadius:", 4.0);
  -[PUAlbumListCellContentViewHelperConfiguration setPreviewInsets:](v2, "setPreviewInsets:", 8.0, 8.0, 8.0, 8.0);
  -[PUAlbumListCellContentViewHelperConfiguration setDynamicTopLeading:](v2, "setDynamicTopLeading:", 16.0);
  -[PUAlbumListCellContentViewHelperConfiguration setDynamicTitleLeading:](v2, "setDynamicTitleLeading:", 20.0);
  -[PUAlbumListCellContentViewHelperConfiguration setDynamicSubtitleleading:](v2, "setDynamicSubtitleleading:", 20.0);
  return v2;
}

@end
