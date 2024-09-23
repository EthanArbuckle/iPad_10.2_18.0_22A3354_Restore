@implementation PXEditorialSectionBodyLayout

- (CGRect)sectionRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if (-[PXEditorialSectionBodyLayout disableClipping](self, "disableClipping"))
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXEditorialSectionBodyLayout;
    -[PXDayAssetsSectionBodyLayout sectionRect](&v7, sel_sectionRect);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)disableDebugAssertionForAnchorUpdatesWithZeroContentSize
{
  return 1;
}

- (BOOL)disableClipping
{
  return self->_disableClipping;
}

- (void)setDisableClipping:(BOOL)a3
{
  self->_disableClipping = a3;
}

@end
