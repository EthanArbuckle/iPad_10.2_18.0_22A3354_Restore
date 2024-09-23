@implementation PageButtonsControl

- (_TtC23ShelfKitCollectionViews18PageButtonsControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_E8784();
}

- (void)scrollByButton:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews18PageButtonsControl *v5;

  v4 = a3;
  v5 = self;
  sub_E81B0((uint64_t)v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PageButtonsControl();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[PageButtonsControl hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_E710(0, (unint64_t *)&qword_3D34B0, UIView_ptr);
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = static NSObject.== infix(_:_:)(v7, v11);

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews18PageButtonsControl *v2;

  v2 = self;
  sub_E8430();

}

- (_TtC23ShelfKitCollectionViews18PageButtonsControl)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews18PageButtonsControl *result;

  result = (_TtC23ShelfKitCollectionViews18PageButtonsControl *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.PageButtonsControl", 42, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews18PageButtonsControl_scrollHandle), *(_QWORD *)&self->scrollHandle[OBJC_IVAR____TtC23ShelfKitCollectionViews18PageButtonsControl_scrollHandle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PageButtonsControl_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PageButtonsControl_rightButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PageButtonsControl_availableScrollDirections));
}

@end
