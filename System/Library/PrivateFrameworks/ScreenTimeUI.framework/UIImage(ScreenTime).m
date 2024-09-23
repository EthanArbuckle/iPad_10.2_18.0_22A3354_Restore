@implementation UIImage(ScreenTime)

+ (id)st_pointImageOfColor:()ScreenTime
{
  id v3;
  void *v4;
  CGSize v6;
  CGRect v7;

  v3 = a3;
  v6.width = 1.0;
  v6.height = 1.0;
  UIGraphicsBeginImageContext(v6);
  objc_msgSend(v3, "set");

  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1.0;
  v7.size.height = 1.0;
  UIRectFill(v7);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v4;
}

@end
