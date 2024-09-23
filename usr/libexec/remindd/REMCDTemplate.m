@implementation REMCDTemplate

- (BOOL)shouldUseResolutionTokenMapForMergingData
{
  return 1;
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
  v13 = (void *)static REMCDTemplate.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

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
  v11 = static REMCDTemplate.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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

- (void)sortChildrenObjects
{
  REMCDTemplate *v2;

  v2 = self;
  _s7remindd13REMCDTemplateC19sortChildrenObjectsyyF_0();

}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  REMCDTemplate *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDTemplate.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  REMCDTemplate *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDTemplate.newlyCreatedRecord()();

  return v3;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4;
  REMCDTemplate *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_s7remindd13REMCDTemplateC26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4;
  REMCDTemplate *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _s7remindd13REMCDTemplateC5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDTemplate *v2;

  v2 = self;
  REMCDTemplate.cleanUpAfterLocalObjectMerge()();

}

- (id)objectsToBeDeletedBeforeThisObject
{
  REMCDTemplate *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t v9;
  Class isa;

  v2 = self;
  v3 = -[REMCDTemplate savedReminders](v2, "savedReminders");
  if (v3)
  {
    v4 = v3;
    v5 = type metadata accessor for REMCDSavedReminder();
    v6 = sub_10009FC50(&qword_10083B518, (uint64_t (*)(uint64_t))type metadata accessor for REMCDSavedReminder, (uint64_t)&protocol conformance descriptor for NSObject);
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v4, v5, v6);

    v8 = sub_1001E8998(v7, (uint64_t (*)(uint64_t))type metadata accessor for REMCDSavedReminder, &qword_10083B518);
    swift_bridgeObjectRelease();
    v9 = sub_1001E0168((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for REMCDSavedReminder);
    swift_release(v8);
    sub_1001E09F4(v9);
  }

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (NSString)cdEntityName
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = objc_msgSend((id)objc_opt_self(REMTemplate), "cdEntityName");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  REMCDTemplate *v2;
  REMCDTemplate *v3;
  REMCDTemplate *v4;
  int64_t v5;

  v2 = self;
  v3 = (REMCDTemplate *)-[REMCDTemplate parentAccount](v2, "parentAccount");
  if (v3)
  {
    v4 = v3;
    v5 = -[REMCDObject effectiveMinimumSupportedVersion](v3, "effectiveMinimumSupportedVersion");

    v2 = v4;
  }
  else
  {
    v5 = kREMSupportedVersionUnset;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  Class isa;

  sub_10011EE40((uint64_t)&off_1007E0B08);
  swift_arrayDestroy(&unk_1007E0B28, 1, &type metadata for String);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  REMCDTemplate *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = REMCDTemplate.isConnected(toAccountObject:)((NSMutableDictionary)v4);

  return self & 1;
}

- (REMCDTemplate)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for REMCDTemplate();
  return -[REMCDTemplate initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

- (void).cxx_construct
{
  _QWORD *v2;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_didCleanUpManualSortHintOnMarkingForDeletion) = 0;
  v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_defaultPublicLinkURLHostname);
  *v2 = 0x632E64756F6C6369;
  v2[1] = 0xEA00000000006D6FLL;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(CKRecord **)((char *)&self->super._ckServerRecord
                                         + OBJC_IVAR___REMCDTemplate_defaultPublicLinkURLHostname));
}

- (void)willSave_Swift
{
  REMCDTemplate *v2;

  if ((*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_didCleanUpManualSortHintOnMarkingForDeletion) & 1) == 0)
  {
    *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_didCleanUpManualSortHintOnMarkingForDeletion) = 1;
    v2 = self;
    sub_10038F500();

  }
}

- (void)didSave_Swift
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___REMCDTemplate_didCleanUpManualSortHintOnMarkingForDeletion) = 0;
}

@end
