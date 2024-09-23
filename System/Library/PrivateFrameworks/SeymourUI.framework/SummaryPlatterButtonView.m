@implementation SummaryPlatterButtonView

- (_TtC9SeymourUI24SummaryPlatterButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24SummaryPlatterButtonView *)sub_22B6D2E58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24SummaryPlatterButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6D4220();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI24SummaryPlatterButtonView *v6;

  v5 = a3;
  v6 = self;
  sub_22B6D3AC4(a3);

}

- (void)handleButtonTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC9SeymourUI24SummaryPlatterButtonView *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_onTapped);
  if (v2)
  {
    v4 = self;
    v3 = sub_22B0FAA58((uint64_t)v2);
    v2(v3);
    sub_22B0FAA68((uint64_t)v2);

  }
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_styleProvider);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_styleProvider);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_styleProvider);
  swift_bridgeObjectRelease();

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI24SummaryPlatterButtonView_onTapped));
}

@end
