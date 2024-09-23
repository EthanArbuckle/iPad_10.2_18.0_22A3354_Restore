@implementation REMCDTemplateSection

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
  v13 = (void *)static REMCDTemplateSection.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

  swift_bridgeObjectRelease(v10);
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
  v11 = static REMCDTemplateSection.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  REMCDTemplateSection *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDTemplateSection.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease(v8);
}

- (id)newlyCreatedRecord
{
  REMCDTemplateSection *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDTemplateSection.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  REMCDTemplateSection *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDTemplateSection template](v2, "template");

  return v3;
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 1;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4;
  REMCDTemplateSection *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_s7remindd20REMCDTemplateSectionC26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4;
  REMCDTemplateSection *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _s7remindd20REMCDTemplateSectionC5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDTemplateSection *v2;

  v2 = self;
  REMCDTemplateSection.cleanUpAfterLocalObjectMerge()();

}

- (void)fixBrokenReferences
{
  REMCDTemplateSection *v2;

  v2 = self;
  REMCDTemplateSection.fixBrokenReferences()();

}

- (BOOL)shouldUseResolutionTokenMapForMergingData
{
  return 1;
}

+ (BOOL)isAbstract
{
  return 0;
}

- (REMCDObject)parentCDObject
{
  REMCDTemplateSection *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDTemplateSection template](v2, "template");

  return (REMCDObject *)v3;
}

+ (NSString)cdEntityName
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = sub_1000151B0(0, &qword_10083B4E0, REMTemplateSection_ptr);
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(v2), "cdEntityName");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  REMCDTemplateSection *v2;
  REMCDTemplateSection *v3;
  REMCDTemplateSection *v4;
  int64_t v5;

  v2 = self;
  v3 = (REMCDTemplateSection *)-[REMCDTemplateSection template](v2, "template");
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
  uint64_t v2;
  Class isa;

  v2 = sub_10011EE40((uint64_t)&off_1007DE188);
  swift_arrayDestroy(&unk_1007DE1A8, 1, &type metadata for String);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (REMCDTemplateSection)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for REMCDTemplateSection();
  return -[REMCDBaseSection initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

@end
