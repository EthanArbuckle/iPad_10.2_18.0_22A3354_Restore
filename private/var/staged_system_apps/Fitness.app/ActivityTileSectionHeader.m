@implementation ActivityTileSectionHeader

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_button));
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_buttonAction), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_buttonAction]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_activeConstraints));
}

- (_TtC10FitnessApp25ActivityTileSectionHeader)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC10FitnessApp25ActivityTileSectionHeader *)sub_10002EDB8(v3, v4);
}

- (void)configureWithTitle:(id)a3 subtitle:(id)a4 buttonAction:(id)a5 horizontalMargin:(double)a6
{
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _TtC10FitnessApp25ActivityTileSectionHeader *v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v10 = _Block_copy(a5);
  if (a3)
  {
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v12;
    if (a4)
      goto LABEL_3;
LABEL_6:
    v13 = 0;
    if (v10)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v14;
  if (!v10)
    goto LABEL_7;
LABEL_4:
  v15 = swift_allocObject(&unk_1007A1220, 24, 7);
  *(_QWORD *)(v15 + 16) = v10;
  v10 = sub_10047780C;
LABEL_8:
  v16 = self;
  sub_10003482C(v11, a3, v13, a4, (uint64_t)v10, v15, a6);
  sub_100022BA4((uint64_t)v10, v15);

  swift_bridgeObjectRelease((CHWorkoutDetailHeartRateTableViewCell *)a4, v17, v18, v19, v20, v21, v22, v23);
  swift_bridgeObjectRelease((CHWorkoutDetailHeartRateTableViewCell *)a3, v24, v25, v26, v27, v28, v29, v30);
}

- (void)prepareForReuse
{
  _TtC10FitnessApp25ActivityTileSectionHeader *v2;

  v2 = self;
  sub_100477188();

}

- (void)didTapButton
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC10FitnessApp25ActivityTileSectionHeader *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_buttonAction);
  if (v2)
  {
    v3 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC10FitnessApp25ActivityTileSectionHeader_buttonAction];
    v4 = self;
    sub_10003AFE0((uint64_t)v2, v3);
    v2(1);
    sub_100022BA4((uint64_t)v2, v3);

  }
}

- (_TtC10FitnessApp25ActivityTileSectionHeader)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004773EC();
}

+ (NSString)reuseIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

@end
