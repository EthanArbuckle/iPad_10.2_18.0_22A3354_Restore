@implementation DOCEjectButton

- (_TtC5Files14DOCEjectButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002618BC();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCEjectButton(0);
  -[DOCEjectButton frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC5Files14DOCEjectButton *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  objc_super v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for DOCEjectButton(0);
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  -[DOCEjectButton frame](&v19, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[DOCEjectButton setFrame:](&v18, "setFrame:", x, y, width, height);
  -[DOCEjectButton frame](v9, "frame");
  v21.origin.x = v11;
  v21.origin.y = v13;
  v21.size.width = v15;
  v21.size.height = v17;
  if (!CGRectEqualToRect(v20, v21))
    -[DOCEjectButton setNeedsLayout](v9, "setNeedsLayout");

}

- (void)updateConfiguration
{
  _TtC5Files14DOCEjectButton *v2;

  v2 = self;
  sub_1002606C0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Files14DOCEjectButton *v6;

  v5 = a3;
  v6 = self;
  sub_100260AC8(a3);

}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCEjectButton(0);
  v2 = v3.receiver;
  -[DOCEjectButton didMoveToWindow](&v3, "didMoveToWindow");
  if (*((_BYTE *)v2 + OBJC_IVAR____TtC5Files14DOCEjectButton_iconUpdateNeeded) == 1)
  {
    objc_msgSend(v2, "setNeedsUpdateConfiguration", v3.receiver, v3.super_class);
    objc_msgSend(v2, "updateConfiguration");
  }

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC5Files14DOCEjectButton *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  BOOL v17;
  CGPoint v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[DOCEjectButton bounds](v8, "bounds");
  v9 = v20.origin.x;
  v10 = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v13 = CGRectGetWidth(v20);
  v21.origin.x = v9;
  v21.origin.y = v10;
  v21.size.width = width;
  v21.size.height = height;
  v14 = CGRectGetHeight(v21);
  if (v13 > v14)
    v14 = v13;
  if (v14 < 45.0)
    v15 = 22.5;
  else
    v15 = v14 * 0.5;
  v22.origin.x = v9;
  v22.origin.y = v10;
  v22.size.width = width;
  v22.size.height = height;
  v16 = CGRectGetMidX(v22) - v15;
  v23.origin.x = v9;
  v23.origin.y = v10;
  v23.size.width = width;
  v23.size.height = height;
  v24.origin.y = CGRectGetMidY(v23) - v15;
  v24.size.width = v15 + v15;
  v24.origin.x = v16;
  v24.size.height = v15 + v15;
  v26.origin.x = v9;
  v26.origin.y = v10;
  v26.size.width = width;
  v26.size.height = height;
  v25 = CGRectUnion(v24, v26);
  v19.x = x;
  v19.y = y;
  v17 = CGRectContainsPoint(v25, v19);

  return v17;
}

- (_TtC5Files14DOCEjectButton)initWithFrame:(CGRect)a3
{
  _TtC5Files14DOCEjectButton *result;

  result = (_TtC5Files14DOCEjectButton *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCEjectButton", 20, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC5Files14DOCEjectButton_buttonSize;
  v4 = type metadata accessor for UIButton.Configuration.Size(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
