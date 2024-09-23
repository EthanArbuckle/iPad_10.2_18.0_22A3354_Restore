@implementation REMCDSmartList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDSmartList"));
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  _UNKNOWN **v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
    v7 = v6;
    if (v6)
    {
      LOBYTE(v8) = objc_msgSend(v6, "integerValue") == (id)1;
    }
    else
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_100804668, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSmartList parentList](self, "parentList"));

      if (v9)
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSmartList parentList](self, "parentList"));
      else
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSmartList parentAccount](self, "parentAccount"));
      v11 = v10;
      v8 = objc_msgSend(v10, "isConnectedToAccountObject:", v4);

      if (v8)
        v12 = &off_100804680;
      else
        v12 = &off_100804698;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v5);
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("parentAccount"), CFSTR("parentList"), 0);
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  void *v10;
  void *v11;

  v3 = (void *)REMSmartListTypeCustom;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSmartList smartListType](self, "smartListType"));
  LODWORD(v3) = objc_msgSend(v3, "isEqual:", v4);

  if (!(_DWORD)v3)
    return kREMSupportedVersionUnset;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSmartList parentList](self, "parentList"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSmartList parentList](self, "parentList"));
    v7 = objc_msgSend(v6, "effectiveMinimumSupportedVersion");

    return (int64_t)v7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSmartList parentAccount](self, "parentAccount"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSmartList parentAccount](self, "parentAccount"));
    v9 = objc_msgSend(v11, "effectiveMinimumSupportedVersion");

  }
  else
  {
    v9 = (id)kREMSupportedVersionUnset;
  }

  return (int64_t)v9;
}

- (void)debug_lowLevelRemoveFromParent
{
  void *v3;
  void *v4;
  NSObject *v5;

  v3 = (void *)REMSmartListTypeCustom;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSmartList smartListType](self, "smartListType"));
  LODWORD(v3) = objc_msgSend(v3, "isEqual:", v4);

  if ((_DWORD)v3)
  {
    -[REMCDSmartList setParentList:](self, "setParentList:", 0);
    -[REMCDSmartList setParentAccount:](self, "setParentAccount:", 0);
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10067E894(v5);

  }
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMSmartList cdEntityName](REMSmartList, "cdEntityName");
}

- (BOOL)didCleanUpManualSortHintOnMarkingForDeletion
{
  return self->didCleanUpManualSortHintOnMarkingForDeletion;
}

- (void)setDidCleanUpManualSortHintOnMarkingForDeletion:(BOOL)a3
{
  self->didCleanUpManualSortHintOnMarkingForDeletion = a3;
}

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
  v13 = (void *)static REMCDSmartList.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

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
  v11 = static REMCDSmartList.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

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
  REMCDSmartList *v2;

  v2 = self;
  _sSo14REMCDSmartListC7reminddE19sortChildrenObjectsyyF_0();

}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  REMCDSmartList *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDSmartList.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease(v8);
}

- (id)newlyCreatedRecord
{
  REMCDSmartList *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDSmartList.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  REMCDSmartList *v2;
  REMCDObject_optional *v3;
  void *v4;
  void *v5;

  v2 = self;
  REMCDSmartList.parentCloud()(v3);
  v5 = v4;

  return v5;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v4;
  REMCDSmartList *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_sSo14REMCDSmartListC7reminddE26existingLocalObjectToMerge4withSo11REMCDObjectCSgSo11NSPredicateCSg_tF_0();

  return v6;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4;
  REMCDSmartList *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = _sSo14REMCDSmartListC7reminddE5merge15withLocalObjectSbSo11REMCDObjectC_tF_0();

  return self & 1;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDSmartList *v2;

  v2 = self;
  REMCDSmartList.cleanUpAfterLocalObjectMerge()();

}

- (void)willSave_Swift
{
  REMCDSmartList *v2;

  v2 = self;
  if (!-[REMCDSmartList didCleanUpManualSortHintOnMarkingForDeletion](v2, "didCleanUpManualSortHintOnMarkingForDeletion"))
  {
    -[REMCDSmartList setDidCleanUpManualSortHintOnMarkingForDeletion:](v2, "setDidCleanUpManualSortHintOnMarkingForDeletion:", 1);
    sub_10039DF30();
  }

}

- (void)didSave_Swift
{
  -[REMCDSmartList setDidCleanUpManualSortHintOnMarkingForDeletion:](self, "setDidCleanUpManualSortHintOnMarkingForDeletion:", 0);
}

@end
