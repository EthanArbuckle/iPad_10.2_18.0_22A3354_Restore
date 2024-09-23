@implementation FMPlatterButton

- (void).cxx_destruct
{

}

- (_TtC6FindMy15FMPlatterButton)init
{
  return (_TtC6FindMy15FMPlatterButton *)sub_100048524();
}

- (void)traitCollectionDidChange:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtC6FindMy15FMPlatterButton *v6;

  v4 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xE0);
  v5 = a3;
  v6 = self;
  v4();

}

- (_TtC6FindMy15FMPlatterButton)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy15FMPlatterButton *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy15FMPlatterButton_alignment) = 3;
  v5 = OBJC_IVAR____TtC6FindMy15FMPlatterButton_bottomSeparator;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy15FMPlatterButton_topSeparator;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  result = (_TtC6FindMy15FMPlatterButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPlatterButton.swift", 28, 2, 79, 0);
  __break(1u);
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100258F38(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_10043733C);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100437468(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_100437468(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_100258F38(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100437550);
}

- (_TtC6FindMy15FMPlatterButton)initWithFrame:(CGRect)a3
{
  _TtC6FindMy15FMPlatterButton *result;

  result = (_TtC6FindMy15FMPlatterButton *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPlatterButton", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
