@implementation FMIconPlatterButton

- (_TtC6FindMy19FMIconPlatterButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000B0834();
}

- (NSString)accessibilityLabel
{
  _TtC6FindMy19FMIconPlatterButton *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1000ACB00();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC6FindMy19FMIconPlatterButton *v11;
  Class isa;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _TtC6FindMy19FMIconPlatterButton *v17;
  _QWORD v18[5];
  uint64_t v19;
  objc_super v20;

  v7 = sub_100006C5C(0, (unint64_t *)&qword_1005D3F00, UITouch_ptr);
  v8 = sub_1000B0798();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  isa = Set._bridgeToObjectiveC()().super.isa;
  v20.receiver = v11;
  v20.super_class = (Class)type metadata accessor for FMIconPlatterButton(0);
  -[FMPlatterButton touchesBegan:withEvent:](&v20, "touchesBegan:withEvent:", isa, v10);

  v13 = (void *)objc_opt_self(UIView);
  v14 = swift_allocObject(&unk_1005433D0, 24, 7);
  *(_QWORD *)(v14 + 16) = v11;
  v18[4] = sub_1000B082C;
  v19 = v14;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_100037DF8;
  v18[3] = &unk_1005433E8;
  v15 = _Block_copy(v18);
  v16 = v19;
  v17 = v11;
  swift_release(v16);
  objc_msgSend(v13, "animateWithDuration:animations:", v15, 0.25);
  _Block_release(v15);

  swift_bridgeObjectRelease(v9);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1000AF8B0(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_, (uint64_t)&unk_100543380, (uint64_t)sub_1000B0814, (uint64_t)&unk_100543398);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1000AF8B0(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_, (uint64_t)&unk_100543330, (uint64_t)sub_1000B0A24, (uint64_t)&unk_100543348);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FMIconPlatterButton(0);
  v4 = a3;
  v5 = v13.receiver;
  -[FMPlatterButton traitCollectionDidChange:](&v13, "traitCollectionDidChange:", v4);
  sub_1000AE274();
  v6 = (void *)objc_opt_self(UIView);
  v7 = swift_allocObject(&unk_1005432E0, 25, 7);
  *(_QWORD *)(v7 + 16) = v5;
  *(_BYTE *)(v7 + 24) = 0;
  v11[4] = sub_1000B065C;
  v12 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100037DF8;
  v11[3] = &unk_1005432F8;
  v8 = _Block_copy(v11);
  v9 = v12;
  v10 = v5;
  swift_release(v9);
  objc_msgSend(v6, "animateWithDuration:animations:", v8, 0.35);
  _Block_release(v8);

}

- (_TtC6FindMy19FMIconPlatterButton)init
{
  _TtC6FindMy19FMIconPlatterButton *result;

  result = (_TtC6FindMy19FMIconPlatterButton *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMIconPlatterButton", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_activityIndicator));
  sub_1000B0660((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_platterIcon);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_activeColor));
  sub_1000AFE30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext), *(_QWORD *)&self->super.alignment[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext], *(_QWORD *)&self->super.background[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext + 7], *(_QWORD *)&self->super.bottomSeparator[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext + 7], *(_QWORD *)&self->super.topSeparator[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext + 7], self->iconView[OBJC_IVAR____TtC6FindMy19FMIconPlatterButton_localizationContext]);
}

@end
