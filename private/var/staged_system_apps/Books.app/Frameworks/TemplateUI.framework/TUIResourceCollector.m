@implementation TUIResourceCollector

+ (id)createResourceCollectorForEverything
{
  return -[_TUIResourceCollector initWithBounds:viewState:]([_TUIResourceCollector alloc], "initWithBounds:viewState:", 0, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
}

+ (id)createResourceCollectorForVisibleBounds:(CGRect)a3 viewState:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  _TUIResourceCollector *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = -[_TUIResourceCollector initWithBounds:viewState:]([_TUIResourceCollector alloc], "initWithBounds:viewState:", v8, x, y, width, height);

  return v9;
}

+ (id)createImageResourceCollectorForLoaded
{
  return objc_alloc_init(_TUILoadedImageResourceCollector);
}

+ (id)createImageResourceCollectorForNotLoadedInVisibleBounds:(CGRect)a3 viewState:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  _TUINotLoadedImageResourceCollector *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = -[_TUIImageResourceCollector initWithBounds:viewState:]([_TUINotLoadedImageResourceCollector alloc], "initWithBounds:viewState:", v8, x, y, width, height);

  return v9;
}

+ (id)createImageResourceCollector
{
  return objc_alloc_init(_TUIImageResourceCollector);
}

@end
