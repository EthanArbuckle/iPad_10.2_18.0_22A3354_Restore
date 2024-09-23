@implementation WorkoutNotification

- (NSString)description
{
  _TtC11WorkoutCore19WorkoutNotification *v2;
  void *v3;

  v2 = self;
  sub_228607A40();

  v3 = (void *)sub_22874C7C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11WorkoutCore19WorkoutNotification)init
{
  _TtC11WorkoutCore19WorkoutNotification *v2;
  objc_super v4;

  v2 = self;
  sub_22874BC98();
  *((_BYTE *)&v2->super.isa + OBJC_IVAR____TtC11WorkoutCore19WorkoutNotification_notificationType) = 5;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC11WorkoutCore19WorkoutNotification_units) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC11WorkoutCore19WorkoutNotification_displayDuration) = 0;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for WorkoutNotification();
  return -[WorkoutNotification init](&v4, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  _TtC11WorkoutCore19WorkoutNotification *v4;
  _TtC11WorkoutCore19WorkoutNotification *v5;
  char v6;
  void *v8;
  _BYTE v9[24];
  uint64_t v10;
  _OWORD v11[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22874CC7C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_2285A5498((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_22858F94C((uint64_t)v9, (uint64_t *)&unk_255994E20);
    goto LABEL_8;
  }
  type metadata accessor for WorkoutNotification();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  v6 = _s11WorkoutCore0A12NotificationC2eeoiySbAC_ACtFZ_0((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_22858F94C((uint64_t)v11, (uint64_t *)&unk_255994E20);
  return v6 & 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore19WorkoutNotification_createdAt;
  v4 = sub_22874BCB0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
