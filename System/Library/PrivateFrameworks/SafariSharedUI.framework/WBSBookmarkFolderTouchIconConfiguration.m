@implementation WBSBookmarkFolderTouchIconConfiguration

- (id)initFor3x3Layout
{
  WBSBookmarkFolderTouchIconConfiguration *v2;
  double *v3;
  int v4;
  double v5;
  double *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSBookmarkFolderTouchIconConfiguration;
  v2 = -[WBSBookmarkFolderTouchIconConfiguration init](&v8, sel_init);
  v3 = (double *)v2;
  if (v2)
  {
    *(int64x2_t *)&v2->_maximumNumberOfThumbnailsPerRow = vdupq_n_s64(3uLL);
    v4 = objc_msgSend(MEMORY[0x1E0D8A120], "is2024FavoritesEnabled");
    v5 = 0.24;
    if (v4)
      v5 = 0.25;
    v3[5] = v5;
    objc_msgSend(v3, "_commonWBSBookmarkFolderIconConfigurationInit");
    v6 = v3;
  }

  return v3;
}

- (id)initFor2x2Layout
{
  WBSBookmarkFolderTouchIconConfiguration *v2;
  WBSBookmarkFolderTouchIconConfiguration *v3;
  WBSBookmarkFolderTouchIconConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSBookmarkFolderTouchIconConfiguration;
  v2 = -[WBSBookmarkFolderTouchIconConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(int64x2_t *)&v2->_maximumNumberOfThumbnailsPerRow = vdupq_n_s64(2uLL);
    v2->_thumbnailIconScaleFactor = 0.35;
    -[WBSBookmarkFolderTouchIconConfiguration _commonWBSBookmarkFolderIconConfigurationInit](v2, "_commonWBSBookmarkFolderIconConfigurationInit");
    v4 = v3;
  }

  return v3;
}

- (id)initForTabGroup
{
  _BYTE *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v2 = -[WBSBookmarkFolderTouchIconConfiguration initFor2x2Layout](self, "initFor2x2Layout");
  v3 = v2;
  if (v2)
  {
    v2[8] = 1;
    tertiaryGroupedBackgroundColor();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v3[9];
    v3[9] = v4;

    tertiaryGroupedBackgroundColor();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v3[10];
    v3[10] = v6;

    v8 = v3;
  }

  return v3;
}

- (void)_commonWBSBookmarkFolderIconConfigurationInit
{
  unint64_t maximumNumberOfThumbnailsPerRow;
  double thumbnailIconScaleFactor;

  maximumNumberOfThumbnailsPerRow = self->_maximumNumberOfThumbnailsPerRow;
  self->_maximumNumberOfThumbnailIcons = self->_maximumNumberOfThumbnailRows * maximumNumberOfThumbnailsPerRow;
  self->_thumbnailIconOuterMarginScaleFactor = 0.1;
  thumbnailIconScaleFactor = self->_thumbnailIconScaleFactor;
  self->_shadowOffset.width = 0.0;
  self->_shadowOffset.height = -thumbnailIconScaleFactor;
  self->_thumbnailIconInnerMarginScaleFactor = (0.8 - thumbnailIconScaleFactor * (double)maximumNumberOfThumbnailsPerRow)
                                             / (double)(maximumNumberOfThumbnailsPerRow - 1);
  self->_shadowBlurRadius = thumbnailIconScaleFactor + thumbnailIconScaleFactor;
}

- (unint64_t)maximumNumberOfThumbnailsPerRow
{
  return self->_maximumNumberOfThumbnailsPerRow;
}

- (unint64_t)maximumNumberOfThumbnailRows
{
  return self->_maximumNumberOfThumbnailRows;
}

- (unint64_t)maximumNumberOfThumbnailIcons
{
  return self->_maximumNumberOfThumbnailIcons;
}

- (double)thumbnailIconScaleFactor
{
  return self->_thumbnailIconScaleFactor;
}

- (double)thumbnailIconOuterMarginScaleFactor
{
  return self->_thumbnailIconOuterMarginScaleFactor;
}

- (double)thumbnailIconInnerMarginScaleFactor
{
  return self->_thumbnailIconInnerMarginScaleFactor;
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)shadowBlurRadius
{
  return self->_shadowBlurRadius;
}

- (BOOL)fillIconWithBackgroundColor
{
  return self->_fillIconWithBackgroundColor;
}

- (UIColor)backgroundColorForEmptySlots
{
  return self->_backgroundColorForEmptySlots;
}

- (UIColor)colorForDarkeningThumbnailBackground
{
  return self->_colorForDarkeningThumbnailBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorForDarkeningThumbnailBackground, 0);
  objc_storeStrong((id *)&self->_backgroundColorForEmptySlots, 0);
}

@end
