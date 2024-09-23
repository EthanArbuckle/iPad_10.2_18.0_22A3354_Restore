@implementation FMPlusSignButton

- (_TtC6FindMy16FMPlusSignButton)init
{
  return (_TtC6FindMy16FMPlusSignButton *)sub_1000C7984();
}

- (_TtC6FindMy16FMPlusSignButton)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy16FMPlusSignButton *result;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6FindMy16FMPlusSignButton_isRTLLanguage) = 0;
  v4 = a3;

  result = (_TtC6FindMy16FMPlusSignButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPlusSignButton.swift", 29, 2, 26, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC6FindMy16FMPlusSignButton *v2;

  v2 = self;
  sub_1000C7CB4();

}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC6FindMy16FMPlusSignButton *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  objc_super v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for FMPlusSignButton();
  v25.receiver = self;
  v25.super_class = v8;
  v9 = self;
  -[FMPlusSignButton titleRectForContentRect:](&v25, "titleRectForContentRect:", x, y, width, height);
  v13 = v12;
  v15 = v14;
  if (*((_BYTE *)&v9->super.super.super.super.super.isa + OBJC_IVAR____TtC6FindMy16FMPlusSignButton_isRTLLanguage) == 1)
  {
    v24.receiver = v9;
    v24.super_class = v8;
    -[FMPlusSignButton imageRectForContentRect:](&v24, "imageRectForContentRect:", x, y, width, height);
    v17 = v16;

    v18 = width - v17 + -5.0;
    v19 = 0.0;
  }
  else
  {
    v20 = v10;
    v18 = v11;

    v19 = v20 + 5.0;
  }
  v21 = v13;
  v22 = v18;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v19;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)type metadata accessor for FMPlusSignButton();
  v7 = v21.receiver;
  -[FMPlusSignButton imageRectForContentRect:](&v21, "imageRectForContentRect:", x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (*((_BYTE *)v7 + OBJC_IVAR____TtC6FindMy16FMPlusSignButton_isRTLLanguage) == 1)
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MaxX = CGRectGetMaxX(v22);

    v16 = MaxX - v12;
  }
  else
  {
    v16 = v8;

  }
  v17 = v10 + 1.0;
  v18 = v16;
  v19 = v12;
  v20 = v14;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v17;
  result.origin.x = v18;
  return result;
}

- (_TtC6FindMy16FMPlusSignButton)initWithFrame:(CGRect)a3
{
  _TtC6FindMy16FMPlusSignButton *result;

  result = (_TtC6FindMy16FMPlusSignButton *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPlusSignButton", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
