@implementation HighlightsShowMoreLabel

- (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel)initWithFrame:(CGRect)a3
{
  return (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel *)sub_1CFD75B94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC22UserNotificationsUIKit23HighlightsShowMoreLabel *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_traitChangeRegistration) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_action);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC22UserNotificationsUIKit23HighlightsShowMoreLabel *)sub_1CFD7C814();
  __break(1u);
  return result;
}

- (void)handleTap
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC22UserNotificationsUIKit23HighlightsShowMoreLabel *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_action);
  if (v2)
  {
    v4 = self;
    v3 = sub_1CFD52DA4((uint64_t)v2);
    v2(v3);
    sub_1CFD40A14((uint64_t)v2);

  }
}

- (void)_updateTextAttributes
{
  _TtC22UserNotificationsUIKit23HighlightsShowMoreLabel *v2;

  v2 = self;
  sub_1CFD76148();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_button));
  swift_unknownObjectRelease();
  sub_1CFD40A14(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC22UserNotificationsUIKit23HighlightsShowMoreLabel_action));
}

@end
