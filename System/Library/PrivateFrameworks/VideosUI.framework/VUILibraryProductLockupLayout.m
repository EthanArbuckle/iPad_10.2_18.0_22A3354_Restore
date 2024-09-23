@implementation VUILibraryProductLockupLayout

- (VUILibraryProductLockupLayout)initWithLayoutType:(int64_t)a3 entityType:(id)a4
{
  id v7;
  VUILibraryProductLockupLayout *v8;
  VUILibraryProductLockupLayout *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUILibraryProductLockupLayout;
  v8 = -[VUILibraryProductLockupLayout init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_entityType, a4);
  }
  -[VUILibraryProductLockupLayout configLayout](v9, "configLayout");

  return v9;
}

- (void)configLayout
{
  VUITextLayout *v3;
  VUITextLayout *playLabelTextLayout;
  VUITextLayout *v5;
  void *v6;

  v3 = objc_alloc_init(VUITextLayout);
  playLabelTextLayout = self->_playLabelTextLayout;
  self->_playLabelTextLayout = v3;

  -[VUITextLayout setTextStyle:](self->_playLabelTextLayout, "setTextStyle:", 20);
  -[VUITextLayout setFontWeight:](self->_playLabelTextLayout, "setFontWeight:", 0);
  v5 = self->_playLabelTextLayout;
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v5, "setColor:", v6);

  -[VUITextLayout setNumberOfLines:](self->_playLabelTextLayout, "setNumberOfLines:", 1);
}

- (int64_t)layoutTypeForWindowWidth:(double)a3
{
  return (unint64_t)(objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", a3) - 4) < 0xFFFFFFFFFFFFFFFDLL;
}

- (CGSize)coverArtImageSize
{
  VUIMediaEntityType *entityType;
  uint64_t v4;
  void *v5;
  VUIMediaEntityType *v6;
  VUIMediaEntityType *v7;
  double v8;
  double v9;
  CGSize result;

  entityType = self->_entityType;
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v4 = objc_claimAutoreleasedReturnValue();
  if (entityType == (VUIMediaEntityType *)v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  v6 = self->_entityType;
  +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
  v7 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
LABEL_5:
    +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, 300.0, *(double *)(MEMORY[0x1E0C9D820] + 8));
    goto LABEL_6;
  }
  v8 = 300.0;
  v9 = 168.75;
LABEL_6:
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)coverArtImageRightMarginForWindowWidth:(double)a3
{
  int64_t v3;
  double result;

  v3 = -[VUILibraryProductLockupLayout layoutTypeForWindowWidth:](self, "layoutTypeForWindowWidth:", a3);
  result = 30.0;
  if (!v3)
    return 16.0;
  return result;
}

- (double)coverArtBottomPadding
{
  return 28.0;
}

- (double)titleTopMargin
{
  return 22.0;
}

- (double)subtitleTopMarginForWindowWidth:(double)a3
{
  int64_t v3;
  double result;

  v3 = -[VUILibraryProductLockupLayout layoutTypeForWindowWidth:](self, "layoutTypeForWindowWidth:", a3);
  result = 26.0;
  if (!v3)
    return 16.0;
  return result;
}

- (double)metadataTopMargin
{
  return 10.0;
}

- (double)contentDescriptionTopMarginForWindowWidth:(double)a3
{
  int64_t v3;
  double result;

  v3 = -[VUILibraryProductLockupLayout layoutTypeForWindowWidth:](self, "layoutTypeForWindowWidth:", a3);
  result = 24.0;
  if (!v3)
    return 28.0;
  return result;
}

- (double)contentDescriptionBottomMarginForWindowWidth:(double)a3
{
  int64_t v3;
  double result;

  v3 = -[VUILibraryProductLockupLayout layoutTypeForWindowWidth:](self, "layoutTypeForWindowWidth:", a3);
  result = 24.0;
  if (!v3)
    return 20.0;
  return result;
}

- (double)buttonModuleTopMarginForWindowWidth:(double)a3
{
  int64_t v3;
  double result;

  v3 = -[VUILibraryProductLockupLayout layoutTypeForWindowWidth:](self, "layoutTypeForWindowWidth:", a3);
  result = 16.0;
  if (!v3)
    return 20.0;
  return result;
}

- (int64_t)downloadButtonPosition
{
  if (self->_type == 1)
    return 4;
  else
    return 5;
}

- (id)subtitleTextLayoutForWindowWidth:(double)a3
{
  VUITextLayout *v5;
  VUITextLayout *subtitleTextLayout;
  VUITextLayout *v7;
  void *v8;
  uint64_t v9;

  if (!self->_subtitleTextLayout)
  {
    v5 = objc_alloc_init(VUITextLayout);
    subtitleTextLayout = self->_subtitleTextLayout;
    self->_subtitleTextLayout = v5;

    v7 = self->_subtitleTextLayout;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v7, "setColor:", v8);

    -[VUITextLayout setNumberOfLines:](self->_subtitleTextLayout, "setNumberOfLines:", 1);
  }
  if (-[VUILibraryProductLockupLayout layoutTypeForWindowWidth:](self, "layoutTypeForWindowWidth:", a3) == 1)
    v9 = 2;
  else
    v9 = 15;
  -[VUITextLayout setTextStyle:](self->_subtitleTextLayout, "setTextStyle:", v9);
  -[VUITextLayout setFontWeight:](self->_subtitleTextLayout, "setFontWeight:", 10);
  return self->_subtitleTextLayout;
}

- (id)descriptionTextLayoutForTraitCollection:(id)a3 isExpanded:(BOOL)a4
{
  id v6;
  VUITextLayout *descriptionTextLayout;
  uint64_t v8;
  VUITextLayout *v9;
  VUITextLayout *v10;
  VUITextLayout *v11;
  void *v12;
  VUITextLayout *v13;

  v6 = a3;
  descriptionTextLayout = self->_descriptionTextLayout;
  if (!descriptionTextLayout)
  {
    v9 = objc_alloc_init(VUITextLayout);
    v10 = self->_descriptionTextLayout;
    self->_descriptionTextLayout = v9;

    -[VUITextLayout setAlignment:](self->_descriptionTextLayout, "setAlignment:", 4);
    v11 = self->_descriptionTextLayout;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setSeeMoreTextColor:](v11, "setSeeMoreTextColor:", v12);

    descriptionTextLayout = self->_descriptionTextLayout;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = -[VUILibraryProductLockupLayout contentDescriptionNumberOfLinesForTraitCollection:](self, "contentDescriptionNumberOfLinesForTraitCollection:", v6);
    goto LABEL_6;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = 0;
LABEL_6:
  -[VUITextLayout setNumberOfLines:](descriptionTextLayout, "setNumberOfLines:", v8);
  v13 = self->_descriptionTextLayout;

  return v13;
}

- (VUITextLayout)playLabelTextLayout
{
  return self->_playLabelTextLayout;
}

- (int)contentDescriptionNumberOfLinesForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(MEMORY[0x1E0DC69B0], "vuiContentSizeCategoryFor:", v6);
  if ((objc_msgSend(MEMORY[0x1E0DC6960], "contentSizeCategoryIsAccessibility:", v7) & 1) != 0)
  {
    v8 = 5;
  }
  else
  {
    v9 = objc_msgSend(v4, "userInterfaceIdiom");
    v10 = objc_msgSend(v4, "horizontalSizeClass");
    v8 = 4;
    if (v9 && (v9 != 1 || v10 != 1))
    {
      if (self->_type)
        v8 = 4;
      else
        v8 = 5;
    }
  }

  return v8;
}

- (id)contentDescriptionFontForSizeClass:(int64_t)a3
{
  void *v3;
  uint64_t v4;

  if (self->_type)
  {
    v3 = (void *)MEMORY[0x1E0DC1350];
LABEL_5:
    v4 = 20;
    goto LABEL_6;
  }
  v3 = (void *)MEMORY[0x1E0DC1350];
  if ((unint64_t)(a3 - 4) > 2)
    goto LABEL_5;
  v4 = 19;
LABEL_6:
  objc_msgSend(v3, "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", v4, 0, 0, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)type
{
  return self->_type;
}

- (VUIMediaEntityType)entityType
{
  return self->_entityType;
}

- (void)setPlayLabelTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_playLabelTextLayout, a3);
}

- (VUITextLayout)subtitleTextLayout
{
  return self->_subtitleTextLayout;
}

- (void)setSubtitleTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextLayout, a3);
}

- (VUITextLayout)descriptionTextLayout
{
  return self->_descriptionTextLayout;
}

- (void)setDescriptionTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionTextLayout, 0);
  objc_storeStrong((id *)&self->_subtitleTextLayout, 0);
  objc_storeStrong((id *)&self->_playLabelTextLayout, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
}

@end
