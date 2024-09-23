@implementation _PXActionableSectionHeaderViewConfiguration

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)actionText
{
  return self->_actionText;
}

- (void)setActionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)filterButtonControllerFactory
{
  return self->_filterButtonControllerFactory;
}

- (void)setFilterButtonControllerFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (unint64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(unint64_t)a3
{
  self->_buttonStyle = a3;
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

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (void)setBackdropViewGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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

- (PXSimpleIndexPath)sectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[5].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_sectionIndexPath.item = v3;
}

- (BOOL)avoidsTintedButtonsAtHighSpeeds
{
  return self->_avoidsTintedButtonsAtHighSpeeds;
}

- (void)setAvoidsTintedButtonsAtHighSpeeds:(BOOL)a3
{
  self->_avoidsTintedButtonsAtHighSpeeds = a3;
}

- (BOOL)supportsMultipleLinesInCompactLayout
{
  return self->_supportsMultipleLinesInCompactLayout;
}

- (void)setSupportsMultipleLinesInCompactLayout:(BOOL)a3
{
  self->_supportsMultipleLinesInCompactLayout = a3;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  self->_showsTopSeparator = a3;
}

- (BOOL)showsActionButton
{
  return self->_showsActionButton;
}

- (void)setShowsActionButton:(BOOL)a3
{
  self->_showsActionButton = a3;
}

- (BOOL)showsSecondaryButton
{
  return self->_showsSecondaryButton;
}

- (void)setShowsSecondaryButton:(BOOL)a3
{
  self->_showsSecondaryButton = a3;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
}

- (PXActionableSectionHeaderLayout)weakLayout
{
  return (PXActionableSectionHeaderLayout *)objc_loadWeakRetained((id *)&self->_weakLayout);
}

- (void)setWeakLayout:(id)a3
{
  objc_storeWeak((id *)&self->_weakLayout, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakLayout);
  objc_storeStrong((id *)&self->_buttonSpec, 0);
  objc_storeStrong((id *)&self->_gradientImage, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong(&self->_filterButtonControllerFactory, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end
