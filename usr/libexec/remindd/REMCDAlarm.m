@implementation REMCDAlarm

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm reminder](self, "reminder"));
  v6 = objc_msgSend(v5, "isConnectedToAccountObject:", v4);

  return v6;
}

- (id)modelObject
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm trigger](self, "trigger"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm identifier](self, "identifier"));
  v6 = objc_alloc((Class)REMAlarm);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[REMAlarm objectIDWithUUID:](REMAlarm, "objectIDWithUUID:", v5));
  v8 = objc_msgSend(v6, "initWithTrigger:objectID:", v4, v7);

  return v8;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm reminder](self, "reminder"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm reminder](self, "reminder"));
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
  -[REMCDAlarm setReminder:](self, "setReminder:", 0);
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarm cdEntityName](REMAlarm, "cdEntityName");
}

- (BOOL)isSnooze
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm originalAlarmUID](self, "originalAlarmUID"));
  v3 = v2 != 0;

  return v3;
}

- (void)setReminder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reminder"));
  -[REMCDAlarm setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("reminder"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm reminder](self, "reminder"));
  objc_msgSend(v5, "updateDisplayDateWithAlarm:", self);

  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("reminder"));
}

- (void)willSave
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  objc_super v11;

  if (!-[REMCDAlarm didHandleMarkingExtraneousAlarmDuringWillSave](self, "didHandleMarkingExtraneousAlarmDuringWillSave"))
  {
    -[REMCDAlarm setDidHandleMarkingExtraneousAlarmDuringWillSave:](self, "setDidHandleMarkingExtraneousAlarmDuringWillSave:", 1);
    if (-[REMCDAlarm markedForDeletion](self, "markedForDeletion"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm reminder](self, "reminder"));
      if (v3)
      {

      }
      else
      {
        v4 = objc_claimAutoreleasedReturnValue(-[REMCDAlarm trigger](self, "trigger"));
        if (v4)
        {
          v5 = (void *)v4;
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm trigger](self, "trigger"));
          if ((objc_msgSend(v6, "markedForDeletion") & 1) != 0)
          {
            v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarm trigger](self, "trigger"));
            v9 = objc_opt_class(REMCDAlarmDateTrigger, v8);
            isKindOfClass = objc_opt_isKindOfClass(v7, v9);

            if ((isKindOfClass & 1) != 0)
              -[REMCDAlarm setIsExtraneous:](self, "setIsExtraneous:", 1);
          }
          else
          {

          }
        }
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)REMCDAlarm;
  -[REMCDObject willSave](&v11, "willSave");
}

- (void)didSave
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMCDAlarm;
  -[REMCDObject didSave](&v3, "didSave");
  -[REMCDAlarm setDidHandleMarkingExtraneousAlarmDuringWillSave:](self, "setDidHandleMarkingExtraneousAlarmDuringWillSave:", 0);
}

- (BOOL)didHandleMarkingExtraneousAlarmDuringWillSave
{
  return self->didHandleMarkingExtraneousAlarmDuringWillSave;
}

- (void)setDidHandleMarkingExtraneousAlarmDuringWillSave:(BOOL)a3
{
  self->didHandleMarkingExtraneousAlarmDuringWillSave = a3;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAlarm"));
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
  v13 = (void *)static REMCDAlarm.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

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
  v11 = static REMCDAlarm.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  return -[REMCDAlarm isExtraneous](self, "isExtraneous") ^ 1;
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
  REMCDAlarm *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDAlarm.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease(v8);
}

- (id)newlyCreatedRecord
{
  REMCDAlarm *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDAlarm.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  REMCDAlarm *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDAlarm reminder](v2, "reminder");

  return v3;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4;
  REMCDAlarm *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_sSo10REMCDAlarmC7reminddE26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4;
  REMCDAlarm *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _sSo10REMCDAlarmC7reminddE5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDAlarm *v2;

  v2 = self;
  REMCDAlarm.cleanUpAfterLocalObjectMerge()();

}

- (id)objectsToBeDeletedBeforeThisObject
{
  REMCDAlarm *v2;
  id v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  Class isa;

  v2 = self;
  v3 = -[REMCDAlarm trigger](v2, "trigger");
  if (v3)
  {
    v4 = v3;
    v5 = sub_10001A630((uint64_t *)&unk_100839E80);
    v6 = (_QWORD *)swift_allocObject(v5, 64, 7);
    *((_OWORD *)v6 + 1) = xmmword_1006A3C00;
    v6[7] = sub_1000151B0(0, (unint64_t *)&unk_100840BD0, off_1007D6680);
    v6[4] = v4;
  }
  else
  {
    v6 = _swiftEmptyArrayStorage;
  }

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (void)fixBrokenReferences
{
  REMCDAlarm *v2;

  v2 = self;
  REMCDAlarm.fixBrokenReferences()();

}

@end
