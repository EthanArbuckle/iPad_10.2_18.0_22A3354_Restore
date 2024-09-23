@implementation REMCDList

- (NSData)reminderIDsMergeableOrdering
{
  void *v3;

  -[REMCDList willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("reminderIDsOrdering"));
  -[REMCDList willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("reminderIDsMergeableOrdering_v2_JSON"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("reminderIDsMergeableOrdering_v2_JSON")));
  -[REMCDList didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("reminderIDsMergeableOrdering_v2_JSON"));
  -[REMCDList didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("reminderIDsOrdering"));
  return (NSData *)v3;
}

- (void)setReminderIDsMergeableOrdering:(id)a3
{
  id v4;

  v4 = a3;
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reminderIDsOrdering"));
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reminderIDsMergeableOrdering_v2_JSON"));
  -[REMCDList setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("reminderIDsMergeableOrdering_v2_JSON"));

  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("reminderIDsMergeableOrdering_v2_JSON"));
  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("reminderIDsOrdering"));
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v6 = objc_opt_class(REMCDList, v5);
  v7 = REMDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8 && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name")), v9, v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList name](self, "name"));
    v12 = objc_msgSend(v11, "compare:", v10);

  }
  else
  {
    v12 = 0;
  }

  return (int64_t)v12;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REMCDList;
  v5 = -[REMCDObject validateForInsert:](&v9, "validateForInsert:");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList account](self, "account"));

    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (a3)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[REMError validationErrorListHasNoAccount:](REMError, "validationErrorListHasNoAccount:", v7));

      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)REMCDList;
  v4 = -[REMCDList validateForDelete:](&v10, "validateForDelete:", a3);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringRepresentation"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
    objc_msgSend(v7, "removeMuteNotificationOptionsForSharedList:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults"));
    objc_msgSend(v8, "removeHideEmptySectionsForGroceryList:", v6);

  }
  return v4;
}

- (id)_parentZoneMismatchErrorDebugDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList sharees](self, "sharees"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sharees.count: %lu, sharingStatus: %d"), objc_msgSend(v3, "count"), (int)-[REMCDList sharingStatus](self, "sharingStatus")));

  return v4;
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMList cdEntityName](REMList, "cdEntityName");
}

- (BOOL)isShared
{
  REMCDList *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList sharees](self, "sharees"));
  LOBYTE(v2) = +[REMList isSharedWithShareeCount:sharingStatus:](REMList, "isSharedWithShareeCount:sharingStatus:", objc_msgSend(v3, "count"), (int)-[REMCDList sharingStatus](v2, "sharingStatus"));

  return (char)v2;
}

- (void)incrementSpotlightIndexCount
{
  char *v3;

  if (-[REMCDList spotlightIndexCount](self, "spotlightIndexCount") == (id)0x7FFFFFFFFFFFFFFFLL)
    v3 = 0;
  else
    v3 = (char *)-[REMCDList spotlightIndexCount](self, "spotlightIndexCount") + 1;
  -[REMCDList setSpotlightIndexCount:](self, "setSpotlightIndexCount:", v3);
}

+ (id)propertiesThatShouldTriggerReindexing
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100804C30);
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
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1008046B0, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList parentList](self, "parentList"));

      if (v9)
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList parentList](self, "parentList"));
      else
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList parentAccount](self, "parentAccount"));
      v11 = v10;
      v8 = objc_msgSend(v10, "isConnectedToAccountObject:", v4);

      if (v8)
        v12 = &off_1008046C8;
      else
        v12 = &off_1008046E0;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v5);
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)shouldCascadeMarkAsDeleteInto:(id)a3 forRelationship:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("reminders"));

  if (v9)
  {
    v11 = objc_opt_class(REMCDReminder, v10);
    v12 = REMCheckedDynamicCast(v11, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentReminder"));
    v15 = v14 == 0;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)REMCDList;
    v15 = -[REMCDObject shouldCascadeMarkAsDeleteInto:forRelationship:](&v17, "shouldCascadeMarkAsDeleteInto:forRelationship:", v6, v7);
  }

  return v15;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("parentList"), CFSTR("parentAccount"), 0);
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList parentList](self, "parentList"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList parentList](self, "parentList"));
    v5 = objc_msgSend(v4, "effectiveMinimumSupportedVersion");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList parentAccount](self, "parentAccount"));
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList parentAccount](self, "parentAccount"));
      v5 = objc_msgSend(v6, "effectiveMinimumSupportedVersion");

    }
    else
    {
      v5 = (id)kREMSupportedVersionUnset;
    }
  }

  return (int64_t)v5;
}

- (void)debug_lowLevelRemoveFromParent
{
  -[REMCDList setParentList:](self, "setParentList:", 0);
  -[REMCDList setParentAccount:](self, "setParentAccount:", 0);
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDList"));
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList name](self, "name"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDList name](self, "name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[REMDisplayNameUtils displayNameFromListName:isPlaceholder:](REMDisplayNameUtils, "displayNameFromListName:isPlaceholder:", v4, -[REMCDObject isPlaceholder](self, "isPlaceholder")));

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
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
  v13 = (void *)static REMCDList.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

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
  v11 = static REMCDList.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

  return v11;
}

+ (id)newPlaceholderObjectForRecordID:(id)a3 account:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  swift_getObjCClassMetadata(a1);
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)static REMCDList.newPlaceholderObject(for:account:context:)(v8, (uint64_t)a4, (uint64_t)v10);

  return v11;
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  REMCDList *v2;
  objc_super v3;

  v2 = self;
  if (!-[REMCDObject isOwnedByCurrentUser](v2, "isOwnedByCurrentUser"))
    -[REMCDObject updateSharedObjectOwnerName:](v2, "updateSharedObjectOwnerName:", 0);
  v3.receiver = v2;
  v3.super_class = (Class)REMCDList;
  -[REMCDObject objectWasDeletedFromCloudByAnotherDevice](&v3, "objectWasDeletedFromCloudByAnotherDevice");

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

- (void)sortChildrenObjects
{
  REMCDList *v2;

  v2 = self;
  sub_1002B8DB8();
  sub_1002B9248();

}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  REMCDList *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDList.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  REMCDList *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDList.newlyCreatedRecord()();

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

- (id)shareTitle
{
  REMCDList *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  objc_super v9;

  v2 = self;
  v3 = -[REMCDList name](v2, "name");
  if (!v3)
  {
    v9.receiver = v2;
    v9.super_class = (Class)REMCDList;
    v3 = -[REMCDObject shareTitle](&v9, "shareTitle");
  }
  v4 = v3;
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (id)shareType
{
  return String._bridgeToObjectiveC()();
}

- (void)updateObjectWithShare:(id)a3
{
  id v5;
  REMCDList *v6;
  REMCDList *v7;
  CKShare_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.isa = (Class)a3;
  REMCDList.update(with:)(v8);

}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 1;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v5;
  REMCDList *v6;
  REMCDObject_optional *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = self;
  REMCDList.existingLocalObjectToMerge(with:)(v7, (NSPredicate_optional *)a3);
  v9 = v8;

  return v9;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  REMCDObject *v4;
  REMCDList *v5;

  v4 = (REMCDObject *)a3;
  v5 = self;
  LOBYTE(self) = REMCDList.merge(withLocalObject:)(v4);

  return self & 1;
}

- (id)objectsToBeDeletedBeforeThisObject
{
  REMCDList *v2;
  Class isa;

  v2 = self;
  REMCDList.objectsToBeDeletedBeforeThisObject()();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)restoreParentReferenceAfterUnmarkingForDeletion
{
  REMCDList *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDList account](v2, "account");
  -[REMCDList setParentAccount:](v2, "setParentAccount:", v3);

}

@end
