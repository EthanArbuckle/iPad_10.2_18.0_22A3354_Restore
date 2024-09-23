@implementation PXCMMSpec

- (PXCMMSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 activityType:(unint64_t)a5
{
  id v8;
  PXCMMSpec *v9;
  PXCMMSpec *v10;
  PXPhotosDetailsSpec *v11;
  void *v12;
  PXPhotosDetailsHeaderSpec *v13;
  PXPhotosDetailsAssetsSpec *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  uint64_t v23;
  UIColor *reviewBackgroundColor;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  __int128 v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  uint64_t v44;
  UIColor *composeRecipientViewBackgroundColor;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  objc_super v59;

  v8 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PXCMMSpec;
  v9 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v59, sel_initWithExtendedTraitCollection_options_, v8, a4);
  v10 = v9;
  if (v9)
  {
    v9->_activityType = a5;
    v11 = -[PXPhotosDetailsSpec initWithExtendedTraitCollection:options:]([PXPhotosDetailsSpec alloc], "initWithExtendedTraitCollection:options:", v8, a4);
    -[PXPhotosDetailsSpec widgetSpec](v11, "widgetSpec");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXPhotosDetailsHeaderSpec initWithExtendedTraitCollection:options:]([PXPhotosDetailsHeaderSpec alloc], "initWithExtendedTraitCollection:options:", v8, a4);
    v14 = -[PXPhotosDetailsAssetsSpec initWithExtendedTraitCollection:options:]([PXPhotosDetailsAssetsSpec alloc], "initWithExtendedTraitCollection:options:", v8, a4);
    objc_msgSend(v8, "safeAreaInsets");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v23 = objc_claimAutoreleasedReturnValue();
    reviewBackgroundColor = v10->_reviewBackgroundColor;
    v10->_reviewBackgroundColor = (UIColor *)v23;

    -[PXPhotosDetailsAssetsSpec gridContentInsets](v14, "gridContentInsets");
    v10->_reviewGridContentInsets.top = v25;
    v10->_reviewGridContentInsets.left = v26;
    v10->_reviewGridContentInsets.bottom = v27;
    v10->_reviewGridContentInsets.right = v28;
    v10->_reviewSafeAreaInsets.top = v16;
    v10->_reviewSafeAreaInsets.left = v18;
    v10->_reviewSafeAreaInsets.bottom = v20;
    v10->_reviewSafeAreaInsets.right = v22;
    -[PXPhotosDetailsAssetsSpec gridInterItemSpacing](v14, "gridInterItemSpacing");
    v10->_reviewGridInterItemSpacing.width = v29;
    v10->_reviewGridInterItemSpacing.height = v30;
    -[PXPhotosDetailsAssetsSpec gridItemSize](v14, "gridItemSize");
    v10->_reviewGridItemSize.width = v31;
    v10->_reviewGridItemSize.height = v32;
    v10->_reviewGridContentMode = -[PXPhotosDetailsAssetsSpec gridContentMode](v14, "gridContentMode");
    v10->_reviewHeaderTopInset = 0.0;
    v10->_reviewBannerHeight = 80.0;
    v10->_reviewFooterBottomInset = 0.0;
    v33 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)&v10->_reviewContentInsets.top = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)&v10->_reviewContentInsets.bottom = v33;
    if (-[PXFeatureSpec shouldInsetAllPhotoDetailsContent](v11, "shouldInsetAllPhotoDetailsContent"))
    {
      objc_msgSend(v12, "distanceBetweenTopAndHeaderlessWidgetContentTop");
      v10->_reviewHeaderTopInset = v34 + v10->_reviewHeaderTopInset;
      objc_msgSend(v12, "distanceBetweenFooterlessWidgetContentBottomAndBottom");
      v10->_reviewFooterBottomInset = v35 + v10->_reviewFooterBottomInset;
      objc_msgSend(v12, "contentGuideInsets");
      PXEdgeInsetsMax();
      v10->_reviewSafeAreaInsets.top = v36;
      v10->_reviewSafeAreaInsets.left = v37;
      v10->_reviewSafeAreaInsets.bottom = v38;
      v10->_reviewSafeAreaInsets.right = v39;
    }
    -[PXPhotosDetailsHeaderSpec defaultCornerRadius](v13, "defaultCornerRadius");
    v10->_reviewHeaderCornerRadius = v40;
    objc_msgSend(v8, "traitCollection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "preferredContentSizeCategory");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMSpec _reviewSectionHeaderHeightForContentSize:](v10, "_reviewSectionHeaderHeightForContentSize:", v42);
    v10->_reviewSectionHeaderHeight = v43;
    v10->_bubbleStatusIconCornerRadius = 10.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v44 = objc_claimAutoreleasedReturnValue();
    composeRecipientViewBackgroundColor = v10->_composeRecipientViewBackgroundColor;
    v10->_composeRecipientViewBackgroundColor = (UIColor *)v44;

    v10->_composeCornerRadius = 5.0;
    PXEdgeInsetsMake();
    v10->_composeHeaderLabelMargins.top = v46;
    v10->_composeHeaderLabelMargins.left = v47;
    v10->_composeHeaderLabelMargins.bottom = v48;
    v10->_composeHeaderLabelMargins.right = v49;
    v10->_composeHeaderVerticalPadding = 18.0;
    PXEdgeInsetsMake();
    v10->_composeFooterInsets.top = v50;
    v10->_composeFooterInsets.left = v51;
    v10->_composeFooterInsets.bottom = v52;
    v10->_composeFooterInsets.right = v53;
    PXEdgeInsetsMake();
    v10->_composeFooterMargins.top = v54;
    v10->_composeFooterMargins.left = v55;
    v10->_composeFooterMargins.bottom = v56;
    v10->_composeFooterMargins.right = v57;
    v10->_composePrivacyMessageInset = 10.0;

  }
  return v10;
}

- (PXCMMSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXCMMSpec initWithExtendedTraitCollection:options:activityType:](self, "initWithExtendedTraitCollection:options:activityType:", a3, a4, 0);
}

- (UIColor)bubbleBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "px_messagesBubbleGray");
}

- (double)_reviewSectionHeaderHeightForContentSize:(id)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3))
    return 54.0;
  PXScaledValueForTextStyleWithSymbolicTraits();
  v4 = v3 + v3;
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  v8 = v7;
  objc_msgSend(v6, "lineHeight");
  v10 = v4 + v8 + v9;

  return v10;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (UIColor)reviewBackgroundColor
{
  return self->_reviewBackgroundColor;
}

- (UIEdgeInsets)reviewContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_reviewContentInsets.top;
  left = self->_reviewContentInsets.left;
  bottom = self->_reviewContentInsets.bottom;
  right = self->_reviewContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)reviewGridInterItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_reviewGridInterItemSpacing.width;
  height = self->_reviewGridInterItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)reviewGridItemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_reviewGridItemSize.width;
  height = self->_reviewGridItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)reviewSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_reviewSafeAreaInsets.top;
  left = self->_reviewSafeAreaInsets.left;
  bottom = self->_reviewSafeAreaInsets.bottom;
  right = self->_reviewSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)reviewGridContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_reviewGridContentInsets.top;
  left = self->_reviewGridContentInsets.left;
  bottom = self->_reviewGridContentInsets.bottom;
  right = self->_reviewGridContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)reviewGridContentMode
{
  return self->_reviewGridContentMode;
}

- (double)reviewHeaderTopInset
{
  return self->_reviewHeaderTopInset;
}

- (double)reviewHeaderCornerRadius
{
  return self->_reviewHeaderCornerRadius;
}

- (double)reviewBannerHeight
{
  return self->_reviewBannerHeight;
}

- (double)reviewFooterBottomInset
{
  return self->_reviewFooterBottomInset;
}

- (double)reviewSectionHeaderHeight
{
  return self->_reviewSectionHeaderHeight;
}

- (UIColor)composeRecipientViewBackgroundColor
{
  return self->_composeRecipientViewBackgroundColor;
}

- (double)composeCornerRadius
{
  return self->_composeCornerRadius;
}

- (double)composePrivacyMessageInset
{
  return self->_composePrivacyMessageInset;
}

- (UIEdgeInsets)composeHeaderLabelMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_composeHeaderLabelMargins.top;
  left = self->_composeHeaderLabelMargins.left;
  bottom = self->_composeHeaderLabelMargins.bottom;
  right = self->_composeHeaderLabelMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)composeHeaderVerticalPadding
{
  return self->_composeHeaderVerticalPadding;
}

- (UIEdgeInsets)composeFooterInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_composeFooterInsets.top;
  left = self->_composeFooterInsets.left;
  bottom = self->_composeFooterInsets.bottom;
  right = self->_composeFooterInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)composeFooterMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_composeFooterMargins.top;
  left = self->_composeFooterMargins.left;
  bottom = self->_composeFooterMargins.bottom;
  right = self->_composeFooterMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)bubbleStatusIconCornerRadius
{
  return self->_bubbleStatusIconCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeRecipientViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_reviewBackgroundColor, 0);
}

+ (double)maxBubbleWidthForDisplayScale:(double)a3
{
  return 947.0 / a3;
}

@end
