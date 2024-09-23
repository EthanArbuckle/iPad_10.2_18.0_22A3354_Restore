@implementation PUPhotosAlbumViewControllerSpec

- (id)gridSpec
{
  return 0;
}

- (int64_t)cellFillMode
{
  return 1;
}

- (double)contentCornerRadius
{
  return 0.0;
}

- (void)configureCollectionViewGridLayout:(id)a3
{
  void *v3;
  NSString *v4;
  _BOOL8 v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setSectionTopPadding:", 1.0);
  +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "useFloatingHeaders"))
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = !UIContentSizeCategoryIsAccessibilityCategory(v4);

  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(v6, "setFloatingSectionHeadersEnabled:", v5);
}

- (UIEdgeInsets)fullMomentsLevelSectionHeaderHighlightInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -7.5;
  v3 = 0.0;
  v4 = 2.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)shouldUseAspectItems
{
  return self->_shouldUseAspectItems;
}

- (int64_t)fullMomentsSectionHeaderStyle
{
  return self->_fullMomentsSectionHeaderStyle;
}

+ (id)phoneSpec
{
  return objc_alloc_init(PUPhotosAlbumViewControllerPhoneSpec);
}

+ (id)padSpec
{
  return objc_alloc_init(PUPhotosAlbumViewControllerPadSpec);
}

@end
