@implementation REMCDSavedAttachment

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
  v13 = (void *)static REMCDSavedAttachment.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

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
  v11 = static REMCDSavedAttachment.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  REMCDSavedAttachment *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDSavedAttachment.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  REMCDSavedAttachment *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDSavedAttachment.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  REMCDSavedAttachment *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDSavedAttachment reminder](v2, "reminder");

  return v3;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4;
  REMCDSavedAttachment *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_s7remindd20REMCDSavedAttachmentC26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4;
  REMCDSavedAttachment *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _s7remindd20REMCDSavedAttachmentC5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDSavedAttachment *v2;

  v2 = self;
  REMCDSavedAttachment.cleanUpAfterLocalObjectMerge()();

}

- (void)fixBrokenReferences
{
  REMCDSavedAttachment *v2;

  v2 = self;
  REMCDSavedAttachment.fixBrokenReferences()();

}

+ (BOOL)isAbstract
{
  return 0;
}

+ (NSString)cdEntityName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (void)prepareForDeletion
{
  REMCDSavedAttachment *v2;

  v2 = self;
  REMCDSavedAttachment.prepareForDeletion()();

}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  REMCDSavedAttachment *v2;
  REMCDSavedAttachment *v3;
  REMCDSavedAttachment *v4;
  int64_t v5;

  v2 = self;
  v3 = (REMCDSavedAttachment *)-[REMCDSavedAttachment reminder](v2, "reminder");
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

  sub_10011EE40((uint64_t)&off_1007E1608);
  swift_arrayDestroy(&unk_1007E1628, 1, &type metadata for String);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  REMCDSavedAttachment *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = REMCDSavedAttachment.isConnected(toAccountObject:)((NSMutableDictionary)v4);

  return self & 1;
}

- (REMCDSavedAttachment)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  return -[REMCDSavedAttachment initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

@end
