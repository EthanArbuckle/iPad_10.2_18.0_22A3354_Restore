@implementation REMCDAttachment

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAttachment"));
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAttachment reminder](self, "reminder"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAttachment reminder](self, "reminder"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAttachment reminder](self, "reminder"));
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
  -[REMCDAttachment setReminder:](self, "setReminder:", 0);
}

+ (BOOL)isAbstract
{
  return 1;
}

+ (id)cdEntityName
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v10;

  v3 = (objc_class *)objc_opt_class(REMCDAttachment);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromClass((Class)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore utility](REMLogStore, "utility"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100683A14(v10);

  }
  return (id)objc_claimAutoreleasedReturnValue(+[REMAttachment cdEntityName](REMAttachment, "cdEntityName"));
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
  v13 = (void *)static REMCDAttachment.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

  swift_bridgeObjectRelease();
  return v13;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  swift_getObjCClassMetadata(a1);
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)static REMCDAttachment.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  REMCDAttachment *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDAttachment.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  REMCDAttachment *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDAttachment.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  REMCDAttachment *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDAttachment reminder](v2, "reminder");

  return v3;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4;
  REMCDAttachment *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_sSo15REMCDAttachmentC7reminddE26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4;
  REMCDAttachment *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _sSo15REMCDAttachmentC7reminddE5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDAttachment *v2;

  v2 = self;
  REMCDAttachment.cleanUpAfterLocalObjectMerge()();

}

- (void)fixBrokenReferences
{
  REMCDAttachment *v2;

  v2 = self;
  REMCDAttachment.fixBrokenReferences()();

}

@end
