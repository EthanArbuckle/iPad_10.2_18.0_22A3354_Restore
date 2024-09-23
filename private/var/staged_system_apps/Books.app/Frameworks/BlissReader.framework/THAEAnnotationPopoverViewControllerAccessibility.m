@implementation THAEAnnotationPopoverViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("AEAnnotationPopoverViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxOriginatingButton
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A38);
}

- (void)thaxSetOriginatingButton:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A38, a3);
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[THAEAnnotationPopoverViewControllerAccessibility thaxSetOriginatingButton:](self, "thaxSetOriginatingButton:", -[TSAccessibility currentlyFocusedElement](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "currentlyFocusedElement"));
  v10.receiver = self;
  v10.super_class = (Class)THAEAnnotationPopoverViewControllerAccessibility;
  -[THAEAnnotationPopoverViewControllerAccessibility presentFromRect:view:](&v10, "presentFromRect:view:", a4, x, y, width, height);
}

- (void)hide
{
  objc_super v3;

  -[TSAccessibility setFirstElementForUpcomingScreenChange:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "setFirstElementForUpcomingScreenChange:", -[THAEAnnotationPopoverViewControllerAccessibility thaxOriginatingButton](self, "thaxOriginatingButton"));
  -[THAEAnnotationPopoverViewControllerAccessibility thaxSetOriginatingButton:](self, "thaxSetOriginatingButton:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THAEAnnotationPopoverViewControllerAccessibility;
  -[THAEAnnotationPopoverViewControllerAccessibility hide](&v3, "hide");
}

@end
