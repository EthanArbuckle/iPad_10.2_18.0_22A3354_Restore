@implementation CRLiOSPageTitleButton

- (UIEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = sub_100BBC6F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_insets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  sub_100BBC798((uint64_t)self, a3.top, a3.left, a3.bottom, a3.right, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_insets);
}

- (UIEdgeInsets)hitTestingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = sub_100BBC6F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_hitTestingInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setHitTestingInsets:(UIEdgeInsets)a3
{
  sub_100BBC798((uint64_t)self, a3.top, a3.left, a3.bottom, a3.right, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_hitTestingInsets);
}

- (_TtC8Freeform21CRLiOSPageTitleButton)initWithTitle:(id)a3 insets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  uint64_t v8;
  uint64_t v9;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC8Freeform21CRLiOSPageTitleButton *)CRLiOSPageTitleButton.init(title:insets:)(v8, v9, top, left, bottom, right);
}

- (void)dealloc
{
  void *v3;
  _TtC8Freeform21CRLiOSPageTitleButton *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(CRLiOSVisualEffectHelper);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedHelper");
  objc_msgSend(v5, "stopHandlingTouchUpDownAnimationsForControl:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CRLiOSPageTitleButton();
  -[CRLiOSPageTitleButton dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_titleFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_selectedTitleColor));
}

- (_TtC8Freeform21CRLiOSPageTitleButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s8Freeform21CRLiOSPageTitleButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  _TtC8Freeform21CRLiOSPageTitleButton *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = self;
  if (a3)
  {
    v7 = objc_msgSend(a3, "string");
    static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v9 = v8;

    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  -[CRLiOSPageTitleButton setTitle:forState:](v6, "setTitle:forState:", v10, a4);

}

- (void)updateConfiguration
{
  _TtC8Freeform21CRLiOSPageTitleButton *v2;

  v2 = self;
  CRLiOSPageTitleButton.updateConfiguration()();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC8Freeform21CRLiOSPageTitleButton *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double *v18;
  BOOL v19;
  _BYTE v21[24];
  objc_super v22;
  CGPoint v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  if (-[CRLiOSPageTitleButton isEnabled](v8, "isEnabled")
    && (-[CRLiOSPageTitleButton isHidden](v8, "isHidden") & 1) == 0)
  {
    -[CRLiOSPageTitleButton bounds](v8, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (double *)((char *)v8 + OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_hitTestingInsets);
    swift_beginAccess((char *)v8 + OBJC_IVAR____TtC8Freeform21CRLiOSPageTitleButton_hitTestingInsets, v21, 0, 0);
    v24.origin.x = sub_1008E3670(v11, v13, v15, v17, *v18, v18[1]);
    v23.x = x;
    v23.y = y;
    v9 = CGRectContainsPoint(v24, v23);
  }
  else
  {
    v22.receiver = v8;
    v22.super_class = (Class)type metadata accessor for CRLiOSPageTitleButton();
    v9 = -[CRLiOSPageTitleButton pointInside:withEvent:](&v22, "pointInside:withEvent:", v7, x, y);
  }
  v19 = v9;

  return v19;
}

- (_TtC8Freeform21CRLiOSPageTitleButton)initWithFrame:(CGRect)a3
{
  _TtC8Freeform21CRLiOSPageTitleButton *result;

  result = (_TtC8Freeform21CRLiOSPageTitleButton *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSPageTitleButton", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
