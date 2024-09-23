@implementation REMCDBaseSection

- (REMCDObject)parentCDObject
{
  REMCDObject *result;

  result = (REMCDObject *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002ELL, 0x80000001006F9E30, "remindd/REMCDBaseSection+CoreDataClass.swift", 44, 2, 19, 0);
  __break(1u);
  return result;
}

+ (NSString)cdEntityName
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = objc_msgSend((id)objc_opt_self(REMBaseSection), "cdEntityName");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 1;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  REMCDBaseSection *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = REMCDBaseSection.isConnected(toAccountObject:)((NSMutableDictionary)v4);

  return self & 1;
}

- (REMCDBaseSection)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for REMCDBaseSection();
  return -[REMCDBaseSection initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

@end
