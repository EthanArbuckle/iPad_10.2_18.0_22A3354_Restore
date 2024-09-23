@implementation NSAttributedString__UIKitStringObserver__Foundation

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSAttributedString");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)drawAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  if (AXCaptureStringDrawingText == 1)
  {
    v6 = (void *)AXCapturedString;
    -[NSAttributedString__UIKitStringObserver__Foundation string](self, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v7);

  }
  v8.receiver = self;
  v8.super_class = (Class)NSAttributedString__UIKitStringObserver__Foundation;
  -[NSAttributedString__UIKitStringObserver__Foundation drawAtPoint:](&v8, sel_drawAtPoint_, x, y);
}

@end
