@implementation SleepScheduleClockHand

- (_TtC13SleepHealthUI22SleepScheduleClockHand)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC13SleepHealthUI22SleepScheduleClockHand *result;

  v5 = OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_background;
  v6 = objc_allocWithZone(MEMORY[0x1E0CD2840]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC13SleepHealthUI22SleepScheduleClockHand *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC13SleepHealthUI22SleepScheduleClockHand *v2;

  v2 = self;
  sub_1A9C7E3CC();

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SleepScheduleClockHand();
  return -[SleepScheduleClockHand isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;
  _QWORD v15[4];
  __int128 v16;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for SleepScheduleClockHand();
  v4 = (char *)v14.receiver;
  -[SleepScheduleClockHand setHighlighted:](&v14, sel_setHighlighted_, v3);
  v6 = *(void **)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration + 8];
  v7 = *(void **)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration + 16];
  v8 = *(void **)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration + 24];
  v15[0] = *(_QWORD *)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration];
  v5 = (void *)v15[0];
  v15[1] = v6;
  v15[2] = v7;
  v15[3] = v8;
  v16 = *(_OWORD *)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration + 32];
  v9 = (id)v16;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  sub_1A9C7DB8C((uint64_t)v15);

}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)accessibilityHandIsBedtime
{
  return (*(_WORD *)((_BYTE *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_symbol) & 0xF0FF) == 0;
}

- (_TtC13SleepHealthUI22SleepScheduleClockHand)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI22SleepScheduleClockHand *result;

  result = (_TtC13SleepHealthUI22SleepScheduleClockHand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_background));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_image));
  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration);
  v5 = (void *)*((_QWORD *)v3 + 1);
  v6 = (void *)*((_QWORD *)v3 + 2);
  v7 = (id)*((_QWORD *)v3 + 4);

}

@end
