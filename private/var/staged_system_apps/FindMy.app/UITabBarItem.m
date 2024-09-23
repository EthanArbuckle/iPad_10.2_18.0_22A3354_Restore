@implementation UITabBarItem

- (NSString)largeContentTitle
{
  UITabBarItem *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = self;
  v3 = -[UITabBarItem title](v2, "title");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {

    v7 = 0;
  }
  return (NSString *)v7;
}

- (UIImage)largeContentImage
{
  return (UIImage *)-[UITabBarItem image](self, "image");
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (UIEdgeInsets)largeContentImageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

@end
