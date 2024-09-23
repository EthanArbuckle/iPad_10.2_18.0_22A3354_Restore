@implementation PosterRackOffsetMenuButton

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGPoint result;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PosterRackOffsetMenuButton();
  -[PosterRackOffsetMenuButton menuAttachmentPointForConfiguration:](&v7, sel_menuAttachmentPointForConfiguration_, a3);
  v6 = v5 + -8.0;
  result.y = v6;
  result.x = v4;
  return result;
}

- (_TtC11PosterBoard26PosterRackOffsetMenuButton)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for PosterRackOffsetMenuButton();
  return -[PosterRackOffsetMenuButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11PosterBoard26PosterRackOffsetMenuButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PosterRackOffsetMenuButton();
  return -[PosterRackOffsetMenuButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
