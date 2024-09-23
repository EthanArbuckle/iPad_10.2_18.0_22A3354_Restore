@implementation DOCBrowserContainerController.DOCBrowserContainerControllerView

- (_TtCC5Files29DOCBrowserContainerController33DOCBrowserContainerControllerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCBrowserContainerController.DOCBrowserContainerControllerView();
  return -[DOCView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end
