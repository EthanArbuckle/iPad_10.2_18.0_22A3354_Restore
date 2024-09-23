@implementation CRLWPEditMenuController

- (BOOL)canCenter
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_canCenter);
}

- (void)setCanCenter:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_canCenter) = a3;
}

- (BOOL)isVertical
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_isVertical);
}

- (void)setIsVertical:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_isVertical) = a3;
}

- (_TtC8Freeform23CRLWPEditMenuController)initWithICC:(id)a3
{
  return (_TtC8Freeform23CRLWPEditMenuController *)sub_100D65A8C((uint64_t)a3);
}

- (void)showMenuOn:(id)a3
{
  id v4;
  _TtC8Freeform23CRLWPEditMenuController *v5;

  v4 = a3;
  v5 = self;
  sub_100D65B54(v4);

}

- (void)hide
{
  _TtC8Freeform23CRLWPEditMenuController *v2;

  v2 = self;
  sub_100D65C78();

}

- (_TtC8Freeform23CRLWPEditMenuController)init
{
  _TtC8Freeform23CRLWPEditMenuController *result;

  result = (_TtC8Freeform23CRLWPEditMenuController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPEditMenuController", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
