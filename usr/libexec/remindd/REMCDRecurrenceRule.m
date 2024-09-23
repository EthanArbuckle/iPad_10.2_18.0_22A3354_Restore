@implementation REMCDRecurrenceRule

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDRecurrenceRule reminder](self, "reminder"));
  v6 = objc_msgSend(v5, "isConnectedToAccountObject:", v4);

  return v6;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("reminder"));
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDRecurrenceRule reminder](self, "reminder"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDRecurrenceRule reminder](self, "reminder"));
    v5 = objc_msgSend(v4, "effectiveMinimumSupportedVersion");

  }
  else
  {
    v5 = (id)kREMSupportedVersionUnset;
  }

  return (int64_t)v5;
}

- (void)debug_lowLevelRemoveFromParent
{
  -[REMCDRecurrenceRule setReminder:](self, "setReminder:", 0);
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDRecurrenceRule"));
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMRecurrenceRule cdEntityName](REMRecurrenceRule, "cdEntityName");
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
  v13 = (void *)static REMCDRecurrenceRule.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

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
  v11 = static REMCDRecurrenceRule.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  REMCDRecurrenceRule *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDRecurrenceRule.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  REMCDRecurrenceRule *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDRecurrenceRule.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  REMCDRecurrenceRule *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDRecurrenceRule reminder](v2, "reminder");

  return v3;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4;
  REMCDRecurrenceRule *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_sSo19REMCDRecurrenceRuleC7reminddE26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4;
  REMCDRecurrenceRule *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _sSo19REMCDRecurrenceRuleC7reminddE5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDRecurrenceRule *v2;

  v2 = self;
  REMCDRecurrenceRule.cleanUpAfterLocalObjectMerge()();

}

- (void)fixBrokenReferences
{
  REMCDRecurrenceRule *v2;

  v2 = self;
  REMCDRecurrenceRule.fixBrokenReferences()();

}

@end
