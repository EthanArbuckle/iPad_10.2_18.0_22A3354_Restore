@implementation WFIconViewImageGenerator

+ (id)loadIcon:(id)a3 size:(CGSize)a4 style:(int64_t)a5
{
  double height;
  double width;
  id v8;
  id v9;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = sub_20CE3ED38(v8, a5, width, height);

  return v9;
}

- (WFIconViewImageGenerator)init
{
  return (WFIconViewImageGenerator *)WFIconViewImageGenerator.init()();
}

@end
