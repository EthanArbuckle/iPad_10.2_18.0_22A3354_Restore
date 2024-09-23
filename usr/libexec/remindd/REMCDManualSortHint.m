@implementation REMCDManualSortHint

+ (NSString)cdEntityName
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = objc_msgSend((id)objc_opt_self(REMManualOrdering), "cdEntityName");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  REMCDManualSortHint *v4;
  REMCDManualSortHint *v5;
  REMCDManualSortHint *v6;
  REMCDManualSortHint *v7;
  unsigned __int8 v8;

  v4 = (REMCDManualSortHint *)a3;
  v5 = self;
  v6 = (REMCDManualSortHint *)-[REMCDManualSortHint account](v5, "account");
  if (v6)
  {
    v7 = v6;
    v8 = -[REMCDManualSortHint isConnectedToAccountObject:](v6, "isConnectedToAccountObject:", v4);

    v4 = v5;
    v5 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return Set._bridgeToObjectiveC()().super.isa;
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  return kREMSupportedVersionUnset;
}

- (REMCDManualSortHint)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for REMCDManualSortHint();
  return -[REMCDManualSortHint initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

- (void).cxx_construct
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___REMCDManualSortHint_separatorInConcatenatedContainerIDsWithLocalContainerIDPrefix);
  *v2 = 31868;
  v2[1] = 0xE200000000000000;
  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___REMCDManualSortHint_separatorInConcatenatedElementIDsWithLocalElementIDPrefix);
  *v3 = 31868;
  v3[1] = 0xE200000000000000;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(CKRecord **)((char *)&self->super.super._ckServerRecord
                                         + OBJC_IVAR___REMCDManualSortHint_separatorInConcatenatedContainerIDsWithLocalContainerIDPrefix));
  swift_bridgeObjectRelease(*(CKRecord **)((char *)&self->super.super._ckServerRecord
                                         + OBJC_IVAR___REMCDManualSortHint_separatorInConcatenatedElementIDsWithLocalElementIDPrefix));
}

+ (id)recordTypes
{
  return Array._bridgeToObjectiveC()().super.isa;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  swift_getObjCClassMetadata(a1);
  v11 = a3;
  v12 = a5;
  v13 = (void *)sub_100480638(v11, v8, v10, v12);

  swift_bridgeObjectRelease();
  return v13;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  swift_getObjCClassMetadata(a1);
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100480798(v8, v9, (uint64_t)v10);

  return v11;
}

- (id)recordZoneName
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("Reminders"));
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (id)recordType
{
  return String._bridgeToObjectiveC()();
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 1;
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  id v6;
  REMCDManualSortHint *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v6 = a3;
  v7 = self;
  sub_100480C04(v6);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  REMCDManualSortHint *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100481B78();

  return v3;
}

- (id)parentCloudObject
{
  REMCDManualSortHint *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDManualSortHint account](v2, "account");

  return v3;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4;
  REMCDManualSortHint *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1004845B0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4;
  REMCDManualSortHint *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10048476C();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDManualSortHint *v2;

  v2 = self;
  sub_100483100();

}

@end
