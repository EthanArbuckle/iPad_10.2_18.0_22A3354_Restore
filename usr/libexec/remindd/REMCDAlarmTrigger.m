@implementation REMCDAlarmTrigger

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

  v3 = (objc_class *)objc_opt_class(REMCDAlarmTrigger, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromClass((Class)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore utility](REMLogStore, "utility"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_10067D8B8(v10);

  }
  return (id)objc_claimAutoreleasedReturnValue(+[REMAlarmTrigger cdEntityName](REMAlarmTrigger, "cdEntityName"));
}

- (BOOL)isTemporal
{
  return 0;
}

- (void)setAlarm:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("alarm"));
  -[REMCDAlarmTrigger setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("alarm"));
  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("alarm"));
  v6 = (id)objc_claimAutoreleasedReturnValue(-[REMCDAlarmTrigger alarm](self, "alarm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reminder"));
  objc_msgSend(v5, "updateDisplayDateWithAlarm:", v4);

}

- (id)modelObject
{
  uint64_t v3;
  NSString *v4;
  void *v5;

  v3 = objc_opt_class(self, a2);
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Abstract method called -[%@ %@]"), v3, v5);

  return 0;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarmTrigger alarm](self, "alarm"));
  v6 = objc_msgSend(v5, "isConnectedToAccountObject:", v4);

  return v6;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("alarm"));
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarmTrigger alarm](self, "alarm"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarmTrigger alarm](self, "alarm"));
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
  -[REMCDAlarmTrigger setAlarm:](self, "setAlarm:", 0);
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAlarmTrigger"));
}

+ (NSString)alarmReferenceCKRecordType
{
  return (NSString *)String._bridgeToObjectiveC()();
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
  v13 = (void *)static REMCDAlarmTrigger.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

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
  v11 = (void *)static REMCDAlarmTrigger.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  return -[REMCDAlarmTrigger isExtraneous](self, "isExtraneous") ^ 1;
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
  REMCDAlarmTrigger *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDAlarmTrigger.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  REMCDAlarmTrigger *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDAlarmTrigger.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  REMCDAlarmTrigger *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDAlarmTrigger alarm](v2, "alarm");

  return v3;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4;
  REMCDAlarmTrigger *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_sSo17REMCDAlarmTriggerC7reminddE26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4;
  REMCDAlarmTrigger *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _sSo17REMCDAlarmTriggerC7reminddE5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDAlarmTrigger *v2;

  v2 = self;
  REMCDAlarmTrigger.cleanUpAfterLocalObjectMerge()();

}

- (void)fixBrokenReferences
{
  REMCDAlarmTrigger *v2;

  v2 = self;
  REMCDAlarmTrigger.fixBrokenReferences()();

}

@end
