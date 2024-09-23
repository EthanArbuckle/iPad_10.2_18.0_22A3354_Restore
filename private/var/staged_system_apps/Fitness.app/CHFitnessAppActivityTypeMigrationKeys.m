@implementation CHFitnessAppActivityTypeMigrationKeys

+ (NSArray)migrationKeys
{
  uint64_t v2;
  Class isa;

  if (qword_10081D650 != -1)
    swift_once(&qword_10081D650, sub_10019B2C0);
  v2 = qword_100869F90;
  swift_bridgeObjectRetain(qword_100869F90);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

+ (void)setMigrationKeys:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  if (qword_10081D650 != -1)
    swift_once(&qword_10081D650, sub_10019B2C0);
  v4 = qword_100869F90;
  qword_100869F90 = v3;
  swift_bridgeObjectRelease(v4);
}

- (CHFitnessAppActivityTypeMigrationKeys)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FitnessAppActivityTypeMigrationKeys();
  return -[CHFitnessAppActivityTypeMigrationKeys init](&v3, "init");
}

@end
