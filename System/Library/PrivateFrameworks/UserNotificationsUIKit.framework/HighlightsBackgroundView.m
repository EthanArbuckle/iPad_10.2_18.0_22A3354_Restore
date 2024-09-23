@implementation HighlightsBackgroundView

- (void)backlightChanged
{
  id v2;
  id v3;
  _TtC22UserNotificationsUIKit24HighlightsBackgroundView *v4;

  v4 = self;
  v2 = -[HighlightsBackgroundView traitCollection](v4, sel_traitCollection);
  v3 = objc_msgSend(v2, sel__backlightLuminance);

  *((_BYTE *)&v4->super.super.super.isa
  + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_lightEffectDisabledForAOD) = v3 != (id)2;
  sub_1CFD54DF8();

}

- (void)layoutSubviews
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HighlightsBackgroundView();
  v2 = (char *)v6.receiver;
  -[HighlightsBackgroundView layoutSubviews](&v6, sel_layoutSubviews);
  v3 = &v2[OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_delegate];
  if (MEMORY[0x1D17DD63C](&v2[OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_delegate]))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 8))(v2, ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (_TtC22UserNotificationsUIKit24HighlightsBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CFD55CC8();
}

- (_TtC22UserNotificationsUIKit24HighlightsBackgroundView)initWithFrame:(CGRect)a3
{
  _TtC22UserNotificationsUIKit24HighlightsBackgroundView *result;

  result = (_TtC22UserNotificationsUIKit24HighlightsBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CFD3E3A0((uint64_t)self + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_portalContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_dropletContextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_backgroundContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_visualEffectView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit24HighlightsBackgroundView_lightsAnimator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
