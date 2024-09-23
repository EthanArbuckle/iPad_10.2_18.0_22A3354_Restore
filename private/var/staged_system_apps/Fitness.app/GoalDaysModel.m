@implementation GoalDaysModel

- (NSArray)goalDays
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC10FitnessApp13GoalDaysModel *v5;
  uint64_t v6;
  Class isa;
  uint64_t v9;

  KeyPath = swift_getKeyPath(&unk_10062B8E0);
  v4 = swift_getKeyPath(&unk_10062B908);
  v5 = self;
  static Published.subscript.getter(&v9, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  v6 = v9;
  type metadata accessor for GoalDay();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)setGoalDays:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;

  v5 = type metadata accessor for GoalDay();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  KeyPath = swift_getKeyPath(&unk_10062B8E0);
  v8 = swift_getKeyPath(&unk_10062B908);
  v9 = v6;
  static Published.subscript.setter(&v9, self, KeyPath, v8);
}

- (int64_t)goalType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp13GoalDaysModel_goalType);
}

- (void)setGoalType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp13GoalDaysModel_goalType) = (Class)a3;
}

- (_TtC10FitnessApp13GoalDaysModel)initWithGoalSchedule:(id)a3
{
  id v4;
  _TtC10FitnessApp13GoalDaysModel *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  _TtC10FitnessApp13GoalDaysModel *v9;
  objc_super v11;
  uint64_t v12;
  _BYTE v13[24];

  v4 = a3;
  v5 = self;
  v6 = sub_100467640();
  swift_beginAccess((char *)v5 + OBJC_IVAR____TtC10FitnessApp13GoalDaysModel__goalDays, v13, 33, 0);
  v12 = v6;
  v7 = sub_100047110(&qword_100825BB8);
  Published.init(initialValue:)(&v12, v7);
  swift_endAccess(v13);
  v8 = (objc_class *)objc_msgSend(v4, "goalType");
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC10FitnessApp13GoalDaysModel_goalType) = v8;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for GoalDaysModel(0);
  v9 = -[GoalDaysModel init](&v11, "init");

  return v9;
}

- (_TtC10FitnessApp13GoalDaysModel)init
{
  _TtC10FitnessApp13GoalDaysModel *result;

  result = (_TtC10FitnessApp13GoalDaysModel *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.GoalDaysModel", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC10FitnessApp13GoalDaysModel__goalDays;
  v3 = sub_100047110(&qword_100825BC0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
