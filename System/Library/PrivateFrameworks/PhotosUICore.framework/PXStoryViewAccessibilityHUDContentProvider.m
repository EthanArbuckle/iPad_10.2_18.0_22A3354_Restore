@implementation PXStoryViewAccessibilityHUDContentProvider

- (PXStoryViewAccessibilityHUDContentProvider)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewAccessibilityHUDContentProvider;
  return -[PXStoryViewAccessibilityHUDContentProvider init](&v4, sel_init, a3);
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  return CFSTR("HUD not available on the current platform");
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

@end
