@implementation UIDirectionalLightEffectView

- (_TtC5UIKit28UIDirectionalLightEffectView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1855C0F84();
}

- (_TtC5UIKit28UIDirectionalLightEffectView)initWithFrame:(CGRect)a3
{
  _TtC5UIKit28UIDirectionalLightEffectView *result;

  result = (_TtC5UIKit28UIDirectionalLightEffectView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_configuration);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_configuration);
  swift_bridgeObjectRelease();

  sub_18518D718(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_idleTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_fillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_idleTimerImpl));
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for UIDirectionalLightEffectView();
  v2 = (char *)v4.receiver;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC5UIKit28UIDirectionalLightEffectView_fillView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (void)didMoveToSuperview
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIDirectionalLightEffectView();
  v2 = v3.receiver;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  sub_1855BE4EC();

}

@end
