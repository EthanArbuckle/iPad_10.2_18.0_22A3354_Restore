@implementation DOCColumnLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC5FilesP33_648E3B4EF7AE01BE4032F3FCE62FE47B15DOCColumnLayout *v7;
  char v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_10037D164(x, y, width, height);

  return v8 & 1;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (_TtC5FilesP33_648E3B4EF7AE01BE4032F3FCE62FE47B15DOCColumnLayout)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCColumnLayout();
  return -[DOCColumnLayout init](&v3, "init");
}

- (_TtC5FilesP33_648E3B4EF7AE01BE4032F3FCE62FE47B15DOCColumnLayout)initWithCoder:(id)a3
{
  return (_TtC5FilesP33_648E3B4EF7AE01BE4032F3FCE62FE47B15DOCColumnLayout *)sub_10037D38C(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for DOCColumnLayout);
}

@end
