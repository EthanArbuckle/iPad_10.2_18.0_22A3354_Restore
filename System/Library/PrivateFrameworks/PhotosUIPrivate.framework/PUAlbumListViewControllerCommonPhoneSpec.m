@implementation PUAlbumListViewControllerCommonPhoneSpec

- (id)stackPhotoDecoration
{
  PUPhotoDecoration *stackPhotoDecoration;
  PUPhotoDecoration *v4;
  PUPhotoDecoration *v5;

  stackPhotoDecoration = self->super._stackPhotoDecoration;
  if (!stackPhotoDecoration)
  {
    +[PUPhotoDecoration defaultDecoration](PUPhotoDecoration, "defaultDecoration");
    v4 = (PUPhotoDecoration *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._stackPhotoDecoration;
    self->super._stackPhotoDecoration = v4;

    stackPhotoDecoration = self->super._stackPhotoDecoration;
  }
  return stackPhotoDecoration;
}

- (id)emptyStackPhotoDecoration
{
  PUPhotoDecoration *emptyStackPhotoDecoration;
  PUPhotoDecoration *v4;
  PUPhotoDecoration *v5;

  emptyStackPhotoDecoration = self->super._emptyStackPhotoDecoration;
  if (!emptyStackPhotoDecoration)
  {
    +[PUPhotoDecoration defaultDecoration](PUPhotoDecoration, "defaultDecoration");
    v4 = (PUPhotoDecoration *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._emptyStackPhotoDecoration;
    self->super._emptyStackPhotoDecoration = v4;

    emptyStackPhotoDecoration = self->super._emptyStackPhotoDecoration;
  }
  return emptyStackPhotoDecoration;
}

- (UIEdgeInsets)stackPerspectiveInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 2.0;
  v3 = 2.0;
  v4 = 2.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIOffset)stackPerspectiveOffset
{
  double v2;
  double v3;
  UIOffset result;

  v2 = 0.0;
  v3 = -4.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIOffset)stackOffset
{
  double v2;
  double v3;
  UIOffset result;

  v2 = 0.0;
  v3 = 0.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (double)posterSquareCornerRadius
{
  void *v2;
  double v3;
  double v4;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneAlbumCornerRadius");
  v4 = v3;

  return v4;
}

- (double)posterSubitemCornerRadius
{
  return 4.0;
}

- (double)sectionHeaderHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  -[PUAlbumListViewControllerSpec _fontManager](self, "_fontManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumListSectionTitleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_scaledValueForValue:", 34.0);
  v5 = v4;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v6 = round(*(double *)&PUMainScreenScale_screenScale * v5) / *(double *)&PUMainScreenScale_screenScale;

  return v6;
}

- (double)sectionFooterHeight
{
  return 15.0;
}

- (id)gridViewControllerSpec
{
  return objc_alloc_init(PUPhotosGridViewControllerPhoneSpec);
}

- (id)albumViewControllerSpec
{
  return objc_alloc_init(PUPhotosAlbumViewControllerPhoneSpec);
}

- (id)feedViewControllerSpec
{
  return objc_alloc_init(PUFeedViewControllerPhoneSpec);
}

- (int64_t)albumDeletionWarningStyle
{
  return 1;
}

- (BOOL)showsDeleteButtonOnCellContentView
{
  return 1;
}

- (BOOL)shouldUseCollageForCloudFeedPlaceholder
{
  return 0;
}

@end
