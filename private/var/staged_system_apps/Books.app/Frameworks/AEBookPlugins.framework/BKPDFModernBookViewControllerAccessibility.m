@implementation BKPDFModernBookViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKPDFModernBookViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(BKThumbnailBookViewControllerAccessibility);
}

- (void)toggleBookmark:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewControllerAccessibility;
  -[BKThumbnailBookViewControllerAccessibility toggleBookmark:](&v4, "toggleBookmark:", a3);
  -[BKThumbnailBookViewControllerAccessibility _updateBookmark](self, "_updateBookmark");
}

@end
