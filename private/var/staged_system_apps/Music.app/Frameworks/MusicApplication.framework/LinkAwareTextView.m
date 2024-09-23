@implementation LinkAwareTextView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC16MusicApplicationP33_01797031205E8C86105A2FFED1C5EC0917LinkAwareTextView *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  v9 = sub_ACAA94(x, y);

  return v9;
}

- (_TtC16MusicApplicationP33_01797031205E8C86105A2FFED1C5EC0917LinkAwareTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for LinkAwareTextView();
  return -[LinkAwareTextView initWithFrame:textContainer:](&v10, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtC16MusicApplicationP33_01797031205E8C86105A2FFED1C5EC0917LinkAwareTextView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_01797031205E8C86105A2FFED1C5EC0917LinkAwareTextView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LinkAwareTextView();
  v4 = a3;
  v5 = -[LinkAwareTextView initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

@end
