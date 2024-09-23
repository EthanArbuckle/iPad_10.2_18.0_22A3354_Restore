@implementation _UILabelVisualStyle_iOS

- (BOOL)shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:(id)a3 attributes:(id)a4
{
  return 0;
}

- (id)defaultFont
{
  objc_msgSend(off_1E167A828, "defaultFontSize");
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:");
}

- (BOOL)updatesTextColorOnUserInterfaceStyleChanges
{
  return 0;
}

- (BOOL)shouldDelayStartMarquee
{
  return 0;
}

@end
