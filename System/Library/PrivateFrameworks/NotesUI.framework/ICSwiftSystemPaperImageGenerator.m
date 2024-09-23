@implementation ICSwiftSystemPaperImageGenerator

- (ICSwiftSystemPaperImageGenerator)initWithPaperAttachment:(id)a3 useActivePaper:(BOOL)a4
{
  return (ICSwiftSystemPaperImageGenerator *)ICSwiftSystemPaperImageGenerator.init(paperAttachment:useActivePaper:)(a3, a4);
}

- (void)imageWithBounds:(CGRect)a3 completion:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  ICSwiftSystemPaperImageGenerator *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = _Block_copy(a4);
  _Block_copy(v9);
  v10 = self;
  sub_1AC9A8794(v10, (void (**)(_QWORD, _QWORD))v9, x, y, width, height);
  _Block_release(v9);
  _Block_release(v9);

}

- (id)imageWithFullResolution:(BOOL)a3 inverted:(BOOL)a4
{
  _BOOL4 v4;
  ICSwiftSystemPaperImageGenerator *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1AC9A89E0(v4);

  return v6;
}

- (BOOL)drawPaperInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  ICSwiftSystemPaperImageGenerator *v7;
  char v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1AC9A6E98(x, y, width, height);

  return v8 & 1;
}

- (CGRect)paperContentBounds
{
  ICSwiftSystemPaperImageGenerator *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = sub_1AC9A81C8();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)hasDeepLink
{
  ICSwiftSystemPaperImageGenerator *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1AC9A8490();

  return v3;
}

- (void).cxx_destruct
{

  sub_1AC9A6A60((uint64_t)self + OBJC_IVAR___ICSwiftSystemPaperImageGenerator_cachedPaper);
}

@end
