@implementation NSString__UIKitStringObserver__Foundation

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSString");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)drawAtPoint:(CGPoint)a3 withAttributes:(id)a4
{
  double y;
  double x;
  id v7;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (AXCaptureStringDrawingText == 1)
    objc_msgSend((id)AXCapturedString, "appendString:", self);
  v8.receiver = self;
  v8.super_class = (Class)NSString__UIKitStringObserver__Foundation;
  -[NSString__UIKitStringObserver__Foundation drawAtPoint:withAttributes:](&v8, sel_drawAtPoint_withAttributes_, v7, x, y);

}

@end
