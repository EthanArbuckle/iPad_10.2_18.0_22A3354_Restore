@implementation REMListStorage

- (void)setShowingLargeAttachments:(BOOL)a3
{
  self->_showingLargeAttachments = a3;
}

- (void)setShouldSuggestConversionToGroceryList:(BOOL)a3
{
  self->_shouldSuggestConversionToGroceryList = a3;
}

- (void)setShouldCategorizeGroceryItems:(BOOL)a3
{
  self->_shouldCategorizeGroceryItems = a3;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration)
    self->_storeGeneration = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSOrderedSet *reminderIDsMergeableOrdering;
  void *v21;
  void *v22;
  void *v23;
  REMResolutionTokenMap *resolutionTokenMap;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;

  v4 = a3;
  -[REMListStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

  -[REMListStorage accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage isGroup](self, "isGroup"), CFSTR("isGroup"));
  -[REMListStorage externalIdentifier](self, "externalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("externalIdentifier"));

  -[REMListStorage externalModificationTag](self, "externalModificationTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("externalModificationTag"));

  -[REMListStorage daSyncToken](self, "daSyncToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("daSyncToken"));

  -[REMListStorage daPushKey](self, "daPushKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("daPushKey"));

  -[REMListStorage daExternalIdentificationTag](self, "daExternalIdentificationTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("daExternalIdentificationTag"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListStorage daDisplayOrder](self, "daDisplayOrder"), CFSTR("daDisplayOrder"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage daIsEventOnlyContainer](self, "daIsEventOnlyContainer"), CFSTR("daIsEventOnlyContainer"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage daIsReadOnly](self, "daIsReadOnly"), CFSTR("daIsReadOnly"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage daIsImmutable](self, "daIsImmutable"), CFSTR("daIsImmutable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage daIsNotificationsCollection](self, "daIsNotificationsCollection"), CFSTR("daIsNotificationsCollection"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListStorage minimumSupportedVersion](self, "minimumSupportedVersion"), CFSTR("minimumSupportedVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), CFSTR("effectiveMinimumSupportedVersion"));
  -[REMListStorage lastUserAccessDate](self, "lastUserAccessDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("lastUserAccessDate"));

  -[REMListStorage name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("name"));

  -[REMListStorage color](self, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("color"));

  -[REMListStorage badgeEmblem](self, "badgeEmblem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("badgeEmblem"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage shouldCategorizeGroceryItems](self, "shouldCategorizeGroceryItems"), CFSTR("shouldCategorizeGroceryItems"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage shouldSuggestConversionToGroceryList](self, "shouldSuggestConversionToGroceryList"), CFSTR("shouldSuggestConversionToGroceryList"));
  -[REMListStorage groceryLocaleID](self, "groceryLocaleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("groceryLocaleID"));

  -[REMListStorage unsavedReminderIDsToCategorizeAsGroceryItems](self, "unsavedReminderIDsToCategorizeAsGroceryItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("unsavedReminderIDsToCategorizeAsGroceryItems"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage showingLargeAttachments](self, "showingLargeAttachments"), CFSTR("showingLargeAttachments"));
  -[REMListStorage parentAccountID](self, "parentAccountID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("parentAccountID"));

  -[REMListStorage parentListID](self, "parentListID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("parentListID"));

  reminderIDsMergeableOrdering = self->_reminderIDsMergeableOrdering;
  if (reminderIDsMergeableOrdering)
  {
    -[NSOrderedSet array](reminderIDsMergeableOrdering, "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("reminderIDsMergeableOrdering"));

    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("reminderIDsMergeableOrderingData"));
  }
  else
  {
    -[REMListStorage reminderIDsMergeableOrderingData](self, "reminderIDsMergeableOrderingData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      +[REMLogStore read](REMLogStore, "read");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        -[REMListStorage encodeWithCoder:].cold.1(self, v51);

    }
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("reminderIDsMergeableOrdering"));
    -[REMListStorage reminderIDsMergeableOrderingData](self, "reminderIDsMergeableOrderingData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("reminderIDsMergeableOrderingData"));

  }
  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    objc_msgSend(v4, "encodeObject:forKey:", resolutionTokenMap, CFSTR("resolutionTokenMap"));
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMapData"));
  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMap"));
    -[REMListStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("resolutionTokenMapData"));

  }
  -[REMListStorage reminderIDsOrderingHints](self, "reminderIDsOrderingHints");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("reminderIDsOrderingHints"));

  -[REMListStorage reminderIDsToUndelete](self, "reminderIDsToUndelete");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("reminderIDsToUndelete"));

  -[REMListStorage childListIDsToUndelete](self, "childListIDsToUndelete");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("childListIDsToUndelete"));

  -[REMListStorage childSmartListIDsToUndelete](self, "childSmartListIDsToUndelete");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("childSmartListIDsToUndelete"));

  -[REMListStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "allObjects");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("sectionIDsToUndelete"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage remindersICSDisplayOrderChanged](self, "remindersICSDisplayOrderChanged"), CFSTR("remindersICSDisplayOrderChanged"));
  -[REMListStorage templateID](self, "templateID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("templateID"));

  -[REMListStorage sharedOwnerName](self, "sharedOwnerName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("sharedOwnerName"));

  -[REMListStorage sharedOwnerAddress](self, "sharedOwnerAddress");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("sharedOwnerAddress"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListStorage sharingStatus](self, "sharingStatus"), CFSTR("sharingStatus"));
  -[REMListStorage sharees](self, "sharees");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("sharees"));

  -[REMListStorage sharedOwnerID](self, "sharedOwnerID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("sharedOwnerID"));

  -[REMListStorage calDAVNotifications](self, "calDAVNotifications");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, CFSTR("calDAVNotifications"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage isPlaceholder](self, "isPlaceholder"), CFSTR("isPlaceholder"));
  -[REMListStorage currentUserShareParticipantID](self, "currentUserShareParticipantID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, CFSTR("currentUserShareParticipantID"));

  -[REMListStorage sortingStyle](self, "sortingStyle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("sortingStyle"));

  -[REMListStorage pinnedDate](self, "pinnedDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, CFSTR("pinnedDate"));

  -[REMListStorage mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v44, CFSTR("mostRecentTargetTemplateIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering"), CFSTR("shouldUpdateSectionsOrdering"));
  -[REMListStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v45, CFSTR("unsavedSectionIDsOrdering"));

  -[REMListStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v46, CFSTR("unsavedMembershipsOfRemindersInSections"));

  -[REMListStorage daBulkRequests](self, "daBulkRequests");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v48 = (void *)MEMORY[0x1E0CB38B0];
    -[REMListStorage daBulkRequests](self, "daBulkRequests");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dataWithPropertyList:format:options:error:", v49, 100, 0, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v50, CFSTR("daBulkRequests"));

}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)parentListID
{
  return self->_parentListID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (NSDate)pinnedDate
{
  return self->_pinnedDate;
}

- (NSString)badgeEmblem
{
  return self->_badgeEmblem;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (NSString)displayName
{
  void *v3;
  void *v4;

  -[REMListStorage name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMDisplayNameUtils displayNameFromListName:isPlaceholder:](REMDisplayNameUtils, "displayNameFromListName:isPlaceholder:", v3, -[REMListStorage isPlaceholder](self, "isPlaceholder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (REMColor)color
{
  return self->_color;
}

- (NSData)reminderIDsMergeableOrderingData
{
  return self->_reminderIDsMergeableOrderingData;
}

- (REMObjectID)sharedOwnerID
{
  return self->_sharedOwnerID;
}

- (BOOL)shouldCategorizeGroceryItems
{
  return self->_shouldCategorizeGroceryItems;
}

- (int64_t)sharingStatus
{
  return self->_sharingStatus;
}

- (NSArray)sharees
{
  return self->_sharees;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDList");
}

- (REMListStorage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  REMListStorage *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSOrderedSet *reminderIDsMergeableOrdering;
  uint64_t v35;
  NSObject *v36;
  REMListStorage *v37;
  void *v38;
  uint64_t v39;
  REMColor *color;
  uint64_t v41;
  NSString *badgeEmblem;
  uint64_t v43;
  NSString *groceryLocaleID;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  REMObjectID *parentAccountID;
  uint64_t v51;
  REMObjectID *parentListID;
  void *v53;
  void *v54;
  NSData *resolutionTokenMapData;
  REMResolutionTokenMap *resolutionTokenMap;
  NSData *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  NSDictionary *v64;
  NSDictionary *reminderIDsOrderingHints;
  uint64_t v66;
  NSSet *reminderIDsToUndelete;
  uint64_t v68;
  NSSet *childListIDsToUndelete;
  uint64_t v70;
  NSSet *childSmartListIDsToUndelete;
  uint64_t v72;
  NSSet *sectionIDsToUndelete;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  unint64_t v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  NSDictionary *daBulkRequests;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGroup"));
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("reminderIDsToUndelete"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = v12;
  v15 = (void *)v5;
  objc_msgSend(v11, "setWithObjects:", v14, v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("childListIDsToUndelete"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = v18;
  v21 = (void *)v6;
  objc_msgSend(v17, "setWithObjects:", v20, v19, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("childSmartListIDsToUndelete"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("sectionIDsToUndelete"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && v21)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reminderIDsMergeableOrderingData"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[REMListStorage initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrderingData:](self, "initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrderingData:", v15, v118, v21, v7, v27);
    if (v28)
    {
      v112 = v27;
      v29 = (void *)MEMORY[0x1E0C99E60];
      v30 = objc_opt_class();
      objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("reminderIDsMergeableOrdering"));
      v32 = objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v32);
        v33 = objc_claimAutoreleasedReturnValue();
        reminderIDsMergeableOrdering = v28->_reminderIDsMergeableOrdering;
        v28->_reminderIDsMergeableOrdering = (NSOrderedSet *)v33;

        v35 = 208;
      }
      else
      {
        v35 = 8;
      }
      v111 = (void *)v32;
      v38 = *(Class *)((char *)&v28->super.isa + v35);
      *(Class *)((char *)&v28->super.isa + v35) = 0;

      v113 = v26;
      if (!v28->_reminderIDsMergeableOrdering && !v28->_reminderIDsMergeableOrderingData)
      {
        +[REMLogStore read](REMLogStore, "read");
        v107 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
          -[REMListStorage initWithCoder:].cold.2();

      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
      v39 = objc_claimAutoreleasedReturnValue();
      color = v28->_color;
      v28->_color = (REMColor *)v39;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("badgeEmblem"));
      v41 = objc_claimAutoreleasedReturnValue();
      badgeEmblem = v28->_badgeEmblem;
      v28->_badgeEmblem = (NSString *)v41;

      v28->_shouldCategorizeGroceryItems = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldCategorizeGroceryItems"));
      v28->_shouldSuggestConversionToGroceryList = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSuggestConversionToGroceryList"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groceryLocaleID"));
      v43 = objc_claimAutoreleasedReturnValue();
      groceryLocaleID = v28->_groceryLocaleID;
      v28->_groceryLocaleID = (NSString *)v43;

      v45 = (void *)MEMORY[0x1E0C99E60];
      v46 = objc_opt_class();
      objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("unsavedReminderIDsToCategorizeAsGroceryItems"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v110 = v48;
      objc_storeStrong((id *)&v28->_unsavedReminderIDsToCategorizeAsGroceryItems, v48);
      v28->_showingLargeAttachments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showingLargeAttachments"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentAccountID"));
      v49 = objc_claimAutoreleasedReturnValue();
      parentAccountID = v28->_parentAccountID;
      v28->_parentAccountID = (REMObjectID *)v49;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentListID"));
      v51 = objc_claimAutoreleasedReturnValue();
      parentListID = v28->_parentListID;
      v28->_parentListID = (REMObjectID *)v51;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMapData"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMap"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v15;
      v108 = v54;
      v109 = v53;
      if (v54)
      {
        objc_storeStrong((id *)&v28->_resolutionTokenMap, v54);
        resolutionTokenMapData = v28->_resolutionTokenMapData;
        v28->_resolutionTokenMapData = 0;
      }
      else
      {
        resolutionTokenMap = v28->_resolutionTokenMap;
        v28->_resolutionTokenMap = 0;

        v57 = v53;
        resolutionTokenMapData = v28->_resolutionTokenMapData;
        v28->_resolutionTokenMapData = v57;
      }

      v58 = (void *)MEMORY[0x1E0C99E60];
      v59 = objc_opt_class();
      v60 = objc_opt_class();
      objc_msgSend(v58, "setWithObjects:", v59, v60, objc_opt_class(), 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v61, CFSTR("reminderIDsOrderingHints"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (v62)
      {
        v64 = v62;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
        v64 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      }
      reminderIDsOrderingHints = v28->_reminderIDsOrderingHints;
      v28->_reminderIDsOrderingHints = v64;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v117);
      v66 = objc_claimAutoreleasedReturnValue();
      reminderIDsToUndelete = v28->_reminderIDsToUndelete;
      v28->_reminderIDsToUndelete = (NSSet *)v66;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v116);
      v68 = objc_claimAutoreleasedReturnValue();
      childListIDsToUndelete = v28->_childListIDsToUndelete;
      v28->_childListIDsToUndelete = (NSSet *)v68;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v115);
      v70 = objc_claimAutoreleasedReturnValue();
      childSmartListIDsToUndelete = v28->_childSmartListIDsToUndelete;
      v28->_childSmartListIDsToUndelete = (NSSet *)v70;

      v26 = v113;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v113);
      v72 = objc_claimAutoreleasedReturnValue();
      sectionIDsToUndelete = v28->_sectionIDsToUndelete;
      v28->_sectionIDsToUndelete = (NSSet *)v72;

      v28->_remindersICSDisplayOrderChanged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("remindersICSDisplayOrderChanged"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setExternalIdentifier:](v28, "setExternalIdentifier:", v74);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalModificationTag"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setExternalModificationTag:](v28, "setExternalModificationTag:", v75);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daSyncToken"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setDaSyncToken:](v28, "setDaSyncToken:", v76);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daPushKey"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setDaPushKey:](v28, "setDaPushKey:", v77);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daExternalIdentificationTag"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setDaExternalIdentificationTag:](v28, "setDaExternalIdentificationTag:", v78);

      -[REMListStorage setDaDisplayOrder:](v28, "setDaDisplayOrder:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("daDisplayOrder")));
      -[REMListStorage setDaIsEventOnlyContainer:](v28, "setDaIsEventOnlyContainer:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("daIsEventOnlyContainer")));
      -[REMListStorage setDaIsReadOnly:](v28, "setDaIsReadOnly:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("daIsReadOnly")));
      -[REMListStorage setDaIsImmutable:](v28, "setDaIsImmutable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("daIsImmutable")));
      -[REMListStorage setDaIsNotificationsCollection:](v28, "setDaIsNotificationsCollection:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("daIsNotificationsCollection")));
      -[REMListStorage setMinimumSupportedVersion:](v28, "setMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumSupportedVersion")));
      -[REMListStorage setEffectiveMinimumSupportedVersion:](v28, "setEffectiveMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effectiveMinimumSupportedVersion")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUserAccessDate"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setLastUserAccessDate:](v28, "setLastUserAccessDate:", v79);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("templateID"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setTemplateID:](v28, "setTemplateID:", v80);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedOwnerName"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setSharedOwnerName:](v28, "setSharedOwnerName:", v81);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedOwnerAddress"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setSharedOwnerAddress:](v28, "setSharedOwnerAddress:", v82);

      v83 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sharingStatus"));
      if (v83 >= 5)
      {
        v84 = os_log_create("com.apple.reminderkit", "default");
        if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
          -[REMListStorage initWithCoder:].cold.1();

        v83 = 0;
      }
      -[REMListStorage setSharingStatus:](v28, "setSharingStatus:", v83);
      v85 = (void *)MEMORY[0x1E0C99E60];
      v86 = objc_opt_class();
      objc_msgSend(v85, "setWithObjects:", v86, objc_opt_class(), 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v87, CFSTR("sharees"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setSharees:](v28, "setSharees:", v88);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedOwnerID"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setSharedOwnerID:](v28, "setSharedOwnerID:", v89);

      v90 = (void *)MEMORY[0x1E0C99E60];
      v91 = objc_opt_class();
      objc_msgSend(v90, "setWithObjects:", v91, objc_opt_class(), 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v92, CFSTR("calDAVNotifications"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setCalDAVNotifications:](v28, "setCalDAVNotifications:", v93);

      -[REMListStorage setIsPlaceholder:](v28, "setIsPlaceholder:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPlaceholder")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentUserShareParticipantID"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setCurrentUserShareParticipantID:](v28, "setCurrentUserShareParticipantID:", v94);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortingStyle"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setSortingStyle:](v28, "setSortingStyle:", v95);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinnedDate"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setPinnedDate:](v28, "setPinnedDate:", v96);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mostRecentTargetTemplateIdentifier"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setMostRecentTargetTemplateIdentifier:](v28, "setMostRecentTargetTemplateIdentifier:", v97);

      -[REMListStorage setShouldUpdateSectionsOrdering:](v28, "setShouldUpdateSectionsOrdering:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldUpdateSectionsOrdering")));
      v98 = (void *)MEMORY[0x1E0C99E60];
      v99 = objc_opt_class();
      objc_msgSend(v98, "setWithObjects:", v99, objc_opt_class(), 0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v100, CFSTR("unsavedSectionIDsOrdering"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setUnsavedSectionIDsOrdering:](v28, "setUnsavedSectionIDsOrdering:", v101);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unsavedMembershipsOfRemindersInSections"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage setUnsavedMembershipsOfRemindersInSections:](v28, "setUnsavedMembershipsOfRemindersInSections:", v102);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daBulkRequests"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      if (v103)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v103, 0, 0, 0);
        v104 = objc_claimAutoreleasedReturnValue();
        daBulkRequests = v28->_daBulkRequests;
        v28->_daBulkRequests = (NSDictionary *)v104;

      }
      v15 = v114;
      v27 = v112;
    }

    self = v28;
    v37 = self;
  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[REMListStorage initWithCoder:].cold.3();

    v37 = 0;
  }

  return v37;
}

- (void)setUnsavedSectionIDsOrdering:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedSectionIDsOrdering, a3);
}

- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedMembershipsOfRemindersInSections, a3);
}

- (void)setShouldUpdateSectionsOrdering:(BOOL)a3
{
  self->_shouldUpdateSectionsOrdering = a3;
}

- (void)setSharingStatus:(int64_t)a3
{
  self->_sharingStatus = a3;
}

- (void)setSharedOwnerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setSharedOwnerID:(id)a3
{
  objc_storeStrong((id *)&self->_sharedOwnerID, a3);
}

- (void)setSharedOwnerAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setMostRecentTargetTemplateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentTargetTemplateIdentifier, a3);
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (void)setLastUserAccessDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (void)setExternalModificationTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setExternalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (void)setDaSyncToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setDaPushKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setDaIsReadOnly:(BOOL)a3
{
  self->_daIsReadOnly = a3;
}

- (void)setDaIsNotificationsCollection:(BOOL)a3
{
  self->_daIsNotificationsCollection = a3;
}

- (void)setDaIsImmutable:(BOOL)a3
{
  self->_daIsImmutable = a3;
}

- (void)setDaIsEventOnlyContainer:(BOOL)a3
{
  self->_daIsEventOnlyContainer = a3;
}

- (void)setDaExternalIdentificationTag:(id)a3
{
  objc_storeStrong((id *)&self->_daExternalIdentificationTag, a3);
}

- (void)setDaDisplayOrder:(int64_t)a3
{
  self->_daDisplayOrder = a3;
}

- (void)setCurrentUserShareParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (REMListStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5 isGroup:(BOOL)a6 reminderIDsMergeableOrderingData:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  REMListStorage *v17;
  REMListStorage *v18;
  NSDate *pinnedDate;
  NSString *groceryLocaleID;
  NSArray *unsavedReminderIDsToCategorizeAsGroceryItems;
  NSUUID *mostRecentTargetTemplateIdentifier;
  NSArray *unsavedSectionIDsOrdering;
  REMMemberships *unsavedMembershipsOfRemindersInSections;
  uint64_t v25;
  NSDictionary *reminderIDsOrderingHints;
  NSData *v27;
  NSData *reminderIDsMergeableOrderingData;
  REMResolutionTokenMap *v29;
  REMResolutionTokenMap *resolutionTokenMap;
  uint64_t v31;
  NSData *resolutionTokenMapData;
  uint64_t v33;
  NSSet *reminderIDsToUndelete;
  uint64_t v35;
  NSSet *childListIDsToUndelete;
  uint64_t v37;
  NSSet *childSmartListIDsToUndelete;
  uint64_t v39;
  NSSet *sectionIDsToUndelete;
  objc_super v42;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v42.receiver = self;
  v42.super_class = (Class)REMListStorage;
  v17 = -[REMListStorage init](&v42, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_objectID, a3);
    objc_storeStrong((id *)&v18->_accountID, a4);
    v18->_isGroup = a6;
    objc_storeStrong((id *)&v18->_name, a5);
    pinnedDate = v18->_pinnedDate;
    v18->_pinnedDate = 0;

    *(_WORD *)&v18->_shouldCategorizeGroceryItems = 0;
    groceryLocaleID = v18->_groceryLocaleID;
    v18->_groceryLocaleID = 0;

    unsavedReminderIDsToCategorizeAsGroceryItems = v18->_unsavedReminderIDsToCategorizeAsGroceryItems;
    v18->_unsavedReminderIDsToCategorizeAsGroceryItems = 0;

    mostRecentTargetTemplateIdentifier = v18->_mostRecentTargetTemplateIdentifier;
    v18->_mostRecentTargetTemplateIdentifier = 0;

    v18->_shouldUpdateSectionsOrdering = 0;
    unsavedSectionIDsOrdering = v18->_unsavedSectionIDsOrdering;
    v18->_unsavedSectionIDsOrdering = 0;

    unsavedMembershipsOfRemindersInSections = v18->_unsavedMembershipsOfRemindersInSections;
    v18->_unsavedMembershipsOfRemindersInSections = 0;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    reminderIDsOrderingHints = v18->_reminderIDsOrderingHints;
    v18->_reminderIDsOrderingHints = (NSDictionary *)v25;

    if (v16)
    {
      v27 = (NSData *)v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v27 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    reminderIDsMergeableOrderingData = v18->_reminderIDsMergeableOrderingData;
    v18->_reminderIDsMergeableOrderingData = v27;

    v29 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v18->_resolutionTokenMap;
    v18->_resolutionTokenMap = v29;

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v31 = objc_claimAutoreleasedReturnValue();
    resolutionTokenMapData = v18->_resolutionTokenMapData;
    v18->_resolutionTokenMapData = (NSData *)v31;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v33 = objc_claimAutoreleasedReturnValue();
    reminderIDsToUndelete = v18->_reminderIDsToUndelete;
    v18->_reminderIDsToUndelete = (NSSet *)v33;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v35 = objc_claimAutoreleasedReturnValue();
    childListIDsToUndelete = v18->_childListIDsToUndelete;
    v18->_childListIDsToUndelete = (NSSet *)v35;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v37 = objc_claimAutoreleasedReturnValue();
    childSmartListIDsToUndelete = v18->_childSmartListIDsToUndelete;
    v18->_childSmartListIDsToUndelete = (NSSet *)v37;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v39 = objc_claimAutoreleasedReturnValue();
    sectionIDsToUndelete = v18->_sectionIDsToUndelete;
    v18->_sectionIDsToUndelete = (NSSet *)v39;

    v18->_sharingStatus = 0;
    v18->_storeGeneration = 0;
    *(_DWORD *)&v18->_remindersICSDisplayOrderChanged = 0;
    v18->_daIsNotificationsCollection = 0;
    -[REMListStorage setSortingStyle:](v18, "setSortingStyle:", CFSTR("manual"));
  }

  return v18;
}

- (void)setSortingStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setTemplateID:(id)a3
{
  objc_storeStrong((id *)&self->_templateID, a3);
}

- (void)setSharees:(id)a3
{
  objc_storeStrong((id *)&self->_sharees, a3);
}

- (void)setPinnedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setCalDAVNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_calDAVNotifications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserShareParticipantID, 0);
  objc_storeStrong((id *)&self->_daBulkRequests, 0);
  objc_storeStrong((id *)&self->_daExternalIdentificationTag, 0);
  objc_storeStrong((id *)&self->_calDAVNotifications, 0);
  objc_storeStrong((id *)&self->_lastUserAccessDate, 0);
  objc_storeStrong((id *)&self->_sharedOwnerID, 0);
  objc_storeStrong((id *)&self->_sharees, 0);
  objc_storeStrong((id *)&self->_sharedOwnerAddress, 0);
  objc_storeStrong((id *)&self->_sharedOwnerName, 0);
  objc_storeStrong((id *)&self->_templateID, 0);
  objc_storeStrong((id *)&self->_sectionIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_childSmartListIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_childListIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_reminderIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_reminderIDsOrderingHints, 0);
  objc_storeStrong((id *)&self->_reminderIDsMergeableOrderingData, 0);
  objc_storeStrong((id *)&self->_parentListID, 0);
  objc_storeStrong((id *)&self->_parentAccountID, 0);
  objc_storeStrong((id *)&self->_unsavedMembershipsOfRemindersInSections, 0);
  objc_storeStrong((id *)&self->_unsavedSectionIDsOrdering, 0);
  objc_storeStrong((id *)&self->_mostRecentTargetTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_unsavedReminderIDsToCategorizeAsGroceryItems, 0);
  objc_storeStrong((id *)&self->_groceryLocaleID, 0);
  objc_storeStrong((id *)&self->_badgeEmblem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->daPushKey, 0);
  objc_storeStrong((id *)&self->daSyncToken, 0);
  objc_storeStrong((id *)&self->externalModificationTag, 0);
  objc_storeStrong((id *)&self->externalIdentifier, 0);
  objc_storeStrong((id *)&self->_pinnedDate, 0);
  objc_storeStrong((id *)&self->sortingStyle, 0);
  objc_storeStrong((id *)&self->_reminderIDsMergeableOrdering, 0);
}

- (NSArray)unsavedSectionIDsOrdering
{
  return self->_unsavedSectionIDsOrdering;
}

- (NSArray)unsavedReminderIDsToCategorizeAsGroceryItems
{
  return self->_unsavedReminderIDsToCategorizeAsGroceryItems;
}

- (REMMemberships)unsavedMembershipsOfRemindersInSections
{
  return self->_unsavedMembershipsOfRemindersInSections;
}

- (REMObjectID)templateID
{
  return self->_templateID;
}

- (NSString)sortingStyle
{
  return self->sortingStyle;
}

- (BOOL)showingLargeAttachments
{
  return self->_showingLargeAttachments;
}

- (BOOL)shouldUpdateSectionsOrdering
{
  return self->_shouldUpdateSectionsOrdering;
}

- (BOOL)shouldSuggestConversionToGroceryList
{
  return self->_shouldSuggestConversionToGroceryList;
}

- (NSString)sharedOwnerName
{
  return self->_sharedOwnerName;
}

- (NSString)sharedOwnerAddress
{
  return self->_sharedOwnerAddress;
}

- (NSSet)sectionIDsToUndelete
{
  return self->_sectionIDsToUndelete;
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (BOOL)remindersICSDisplayOrderChanged
{
  return self->_remindersICSDisplayOrderChanged;
}

- (NSSet)reminderIDsToUndelete
{
  return self->_reminderIDsToUndelete;
}

- (NSDictionary)reminderIDsOrderingHints
{
  return self->_reminderIDsOrderingHints;
}

- (REMObjectID)parentAccountID
{
  return self->_parentAccountID;
}

- (NSUUID)mostRecentTargetTemplateIdentifier
{
  return self->_mostRecentTargetTemplateIdentifier;
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (NSDate)lastUserAccessDate
{
  return self->_lastUserAccessDate;
}

- (NSString)groceryLocaleID
{
  return self->_groceryLocaleID;
}

- (NSString)externalModificationTag
{
  return self->externalModificationTag;
}

- (NSString)externalIdentifier
{
  return self->externalIdentifier;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (NSString)daSyncToken
{
  return self->daSyncToken;
}

- (NSString)daPushKey
{
  return self->daPushKey;
}

- (BOOL)daIsReadOnly
{
  return self->_daIsReadOnly;
}

- (BOOL)daIsNotificationsCollection
{
  return self->_daIsNotificationsCollection;
}

- (BOOL)daIsImmutable
{
  return self->_daIsImmutable;
}

- (BOOL)daIsEventOnlyContainer
{
  return self->_daIsEventOnlyContainer;
}

- (NSString)daExternalIdentificationTag
{
  return self->_daExternalIdentificationTag;
}

- (int64_t)daDisplayOrder
{
  return self->_daDisplayOrder;
}

- (NSDictionary)daBulkRequests
{
  return self->_daBulkRequests;
}

- (NSString)currentUserShareParticipantID
{
  return self->_currentUserShareParticipantID;
}

- (NSSet)childSmartListIDsToUndelete
{
  return self->_childSmartListIDsToUndelete;
}

- (NSSet)childListIDsToUndelete
{
  return self->_childListIDsToUndelete;
}

- (NSArray)calDAVNotifications
{
  return self->_calDAVNotifications;
}

- (void)setUnsavedReminderIDsToCategorizeAsGroceryItems:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedReminderIDsToCategorizeAsGroceryItems, a3);
}

- (void)setResolutionTokenMapData:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMapData, a3);
}

- (void)setResolutionTokenMap:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMap, a3);
}

- (void)setParentListID:(id)a3
{
  objc_storeStrong((id *)&self->_parentListID, a3);
}

- (void)setParentAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_parentAccountID, a3);
}

- (void)setGroceryLocaleID:(id)a3
{
  objc_storeStrong((id *)&self->_groceryLocaleID, a3);
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void)setBadgeEmblem:(id)a3
{
  objc_storeStrong((id *)&self->_badgeEmblem, a3);
}

- (id)optionalObjectID
{
  return self->_objectID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setReminderIDsMergeableOrdering:(id)a3
{
  NSData *reminderIDsMergeableOrderingData;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_reminderIDsMergeableOrdering, a3);
  if (v6)
  {
    reminderIDsMergeableOrderingData = self->_reminderIDsMergeableOrderingData;
    self->_reminderIDsMergeableOrderingData = 0;

  }
}

- (REMListStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  REMListStorage *v13;

  v8 = (void *)MEMORY[0x1E0C99E40];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "orderedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[REMListStorage initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrdering:](self, "initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrdering:", v11, v10, v9, 0, v12);

  return v13;
}

- (REMListStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5 isGroup:(BOOL)a6 reminderIDsMergeableOrdering:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  REMListStorage *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v8 = a6;
  v25 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v22 = 0;
  objc_msgSend((id)objc_opt_class(), "reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:error:", v13, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v22;
  +[REMLogStore read](REMLogStore, "read");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_INFO, "Serialized input reminderIDsMergeableOrdering into data when init REMListStorage. {objectID: %@}", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[REMListStorage initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrdering:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = -[REMListStorage initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrderingData:](self, "initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrderingData:", v12, v15, v14, v8, v16);

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMListStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  REMListStorage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  REMResolutionTokenMap *resolutionTokenMap;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = [REMListStorage alloc];
  -[REMListStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMListStorage isGroup](self, "isGroup");
  -[REMListStorage reminderIDsMergeableOrderingData](self, "reminderIDsMergeableOrderingData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[REMListStorage initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrderingData:](v4, "initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrderingData:", v5, v6, v7, v8, v9);

  v11 = (void *)-[NSOrderedSet copy](self->_reminderIDsMergeableOrdering, "copy");
  -[REMListStorage setReminderIDsMergeableOrdering:](v10, "setReminderIDsMergeableOrdering:", v11);

  -[REMListStorage setIsGroup:](v10, "setIsGroup:", -[REMListStorage isGroup](self, "isGroup"));
  -[REMListStorage externalIdentifier](self, "externalIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setExternalIdentifier:](v10, "setExternalIdentifier:", v12);

  -[REMListStorage externalModificationTag](self, "externalModificationTag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setExternalModificationTag:](v10, "setExternalModificationTag:", v13);

  -[REMListStorage daSyncToken](self, "daSyncToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setDaSyncToken:](v10, "setDaSyncToken:", v14);

  -[REMListStorage daPushKey](self, "daPushKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setDaPushKey:](v10, "setDaPushKey:", v15);

  -[REMListStorage daExternalIdentificationTag](self, "daExternalIdentificationTag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setDaExternalIdentificationTag:](v10, "setDaExternalIdentificationTag:", v16);

  -[REMListStorage daBulkRequests](self, "daBulkRequests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setDaBulkRequests:](v10, "setDaBulkRequests:", v17);

  -[REMListStorage setDaDisplayOrder:](v10, "setDaDisplayOrder:", -[REMListStorage daDisplayOrder](self, "daDisplayOrder"));
  -[REMListStorage setDaIsEventOnlyContainer:](v10, "setDaIsEventOnlyContainer:", -[REMListStorage daIsEventOnlyContainer](self, "daIsEventOnlyContainer"));
  -[REMListStorage setDaIsReadOnly:](v10, "setDaIsReadOnly:", -[REMListStorage daIsReadOnly](self, "daIsReadOnly"));
  -[REMListStorage setDaIsImmutable:](v10, "setDaIsImmutable:", -[REMListStorage daIsImmutable](self, "daIsImmutable"));
  -[REMListStorage setDaIsNotificationsCollection:](v10, "setDaIsNotificationsCollection:", -[REMListStorage daIsNotificationsCollection](self, "daIsNotificationsCollection"));
  -[REMListStorage setMinimumSupportedVersion:](v10, "setMinimumSupportedVersion:", -[REMListStorage minimumSupportedVersion](self, "minimumSupportedVersion"));
  -[REMListStorage setEffectiveMinimumSupportedVersion:](v10, "setEffectiveMinimumSupportedVersion:", -[REMListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
  -[REMListStorage color](self, "color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setColor:](v10, "setColor:", v18);

  -[REMListStorage badgeEmblem](self, "badgeEmblem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setBadgeEmblem:](v10, "setBadgeEmblem:", v19);

  -[REMListStorage setShouldCategorizeGroceryItems:](v10, "setShouldCategorizeGroceryItems:", -[REMListStorage shouldCategorizeGroceryItems](self, "shouldCategorizeGroceryItems"));
  -[REMListStorage setShouldSuggestConversionToGroceryList:](v10, "setShouldSuggestConversionToGroceryList:", -[REMListStorage shouldSuggestConversionToGroceryList](self, "shouldSuggestConversionToGroceryList"));
  -[REMListStorage groceryLocaleID](self, "groceryLocaleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setGroceryLocaleID:](v10, "setGroceryLocaleID:", v20);

  -[REMListStorage unsavedReminderIDsToCategorizeAsGroceryItems](self, "unsavedReminderIDsToCategorizeAsGroceryItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[REMListStorage setUnsavedReminderIDsToCategorizeAsGroceryItems:](v10, "setUnsavedReminderIDsToCategorizeAsGroceryItems:", v22);

  -[REMListStorage lastUserAccessDate](self, "lastUserAccessDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setLastUserAccessDate:](v10, "setLastUserAccessDate:", v23);

  -[REMListStorage setShowingLargeAttachments:](v10, "setShowingLargeAttachments:", -[REMListStorage showingLargeAttachments](self, "showingLargeAttachments"));
  -[REMListStorage parentAccountID](self, "parentAccountID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setParentAccountID:](v10, "setParentAccountID:", v24);

  -[REMListStorage parentListID](self, "parentListID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setParentListID:](v10, "setParentListID:", v25);

  v26 = -[REMResolutionTokenMap copy](self->_resolutionTokenMap, "copy");
  resolutionTokenMap = v10->_resolutionTokenMap;
  v10->_resolutionTokenMap = (REMResolutionTokenMap *)v26;

  -[REMListStorage resolutionTokenMapData](self, "resolutionTokenMapData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setResolutionTokenMapData:](v10, "setResolutionTokenMapData:", v28);

  -[REMListStorage reminderIDsOrderingHints](self, "reminderIDsOrderingHints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  -[REMListStorage setReminderIDsOrderingHints:](v10, "setReminderIDsOrderingHints:", v30);

  -[REMListStorage reminderIDsToUndelete](self, "reminderIDsToUndelete");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  -[REMListStorage setReminderIDsToUndelete:](v10, "setReminderIDsToUndelete:", v32);

  -[REMListStorage childListIDsToUndelete](self, "childListIDsToUndelete");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  -[REMListStorage setChildListIDsToUndelete:](v10, "setChildListIDsToUndelete:", v34);

  -[REMListStorage childSmartListIDsToUndelete](self, "childSmartListIDsToUndelete");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  -[REMListStorage setChildSmartListIDsToUndelete:](v10, "setChildSmartListIDsToUndelete:", v36);

  -[REMListStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  -[REMListStorage setSectionIDsToUndelete:](v10, "setSectionIDsToUndelete:", v38);

  -[REMListStorage setRemindersICSDisplayOrderChanged:](v10, "setRemindersICSDisplayOrderChanged:", -[REMListStorage remindersICSDisplayOrderChanged](self, "remindersICSDisplayOrderChanged"));
  -[REMListStorage templateID](self, "templateID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setTemplateID:](v10, "setTemplateID:", v39);

  -[REMListStorage sharedOwnerName](self, "sharedOwnerName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setSharedOwnerName:](v10, "setSharedOwnerName:", v40);

  -[REMListStorage sharedOwnerAddress](self, "sharedOwnerAddress");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setSharedOwnerAddress:](v10, "setSharedOwnerAddress:", v41);

  -[REMListStorage setSharingStatus:](v10, "setSharingStatus:", -[REMListStorage sharingStatus](self, "sharingStatus"));
  -[REMListStorage sharees](self, "sharees");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setSharees:](v10, "setSharees:", v42);

  -[REMListStorage sharedOwnerID](self, "sharedOwnerID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setSharedOwnerID:](v10, "setSharedOwnerID:", v43);

  -[REMListStorage calDAVNotifications](self, "calDAVNotifications");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setCalDAVNotifications:](v10, "setCalDAVNotifications:", v44);

  -[REMListStorage setIsPlaceholder:](v10, "setIsPlaceholder:", -[REMListStorage isPlaceholder](self, "isPlaceholder"));
  -[REMListStorage currentUserShareParticipantID](self, "currentUserShareParticipantID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setCurrentUserShareParticipantID:](v10, "setCurrentUserShareParticipantID:", v45);

  -[REMListStorage sortingStyle](self, "sortingStyle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setSortingStyle:](v10, "setSortingStyle:", v46);

  -[REMListStorage pinnedDate](self, "pinnedDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setPinnedDate:](v10, "setPinnedDate:", v47);

  -[REMListStorage mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setMostRecentTargetTemplateIdentifier:](v10, "setMostRecentTargetTemplateIdentifier:", v48);

  -[REMListStorage setShouldUpdateSectionsOrdering:](v10, "setShouldUpdateSectionsOrdering:", -[REMListStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering"));
  -[REMListStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  -[REMListStorage setUnsavedSectionIDsOrdering:](v10, "setUnsavedSectionIDsOrdering:", v50);

  -[REMListStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  -[REMListStorage setUnsavedMembershipsOfRemindersInSections:](v10, "setUnsavedMembershipsOfRemindersInSections:", v52);

  v10->_storeGeneration = self->_storeGeneration;
  v10->_copyGeneration = self->_copyGeneration + 1;
  return v10;
}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

- (BOOL)isEqual:(id)a3
{
  REMListStorage *v4;
  REMListStorage *v5;
  REMListStorage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  int64_t v57;
  _BOOL4 v58;
  _BOOL4 v59;
  _BOOL4 v60;
  _BOOL4 v61;
  int64_t v62;
  int64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  _BOOL4 v88;
  _BOOL4 v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  _BOOL4 v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  NSObject *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  NSObject *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  int v152;
  _BOOL4 v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  objc_class *v160;
  id v161;
  NSOrderedSet *reminderIDsMergeableOrdering;
  NSOrderedSet *v163;
  objc_class *v164;
  id v165;
  REMResolutionTokenMap *resolutionTokenMap;
  REMResolutionTokenMap *v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  int v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  int v179;
  int64_t v180;
  void *v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  int v186;
  void *v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  int v192;
  void *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  int v198;
  _BOOL4 v199;
  void *v200;
  uint64_t v201;
  void *v202;
  void *v203;
  void *v204;
  int v205;
  void *v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  int v211;
  void *v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  int v217;
  void *v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  int v223;
  _BOOL4 v224;
  void *v225;
  uint64_t v226;
  void *v227;
  void *v228;
  void *v229;
  int v230;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  int v237;
  id v238;
  __int16 v239;
  void *v240;
  __int16 v241;
  void *v242;
  uint64_t v243;

  v243 = *MEMORY[0x1E0C80C00];
  v4 = (REMListStorage *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMListStorage objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListStorage objectID](v6, "objectID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMListStorage objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage objectID](v6, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_159;
      }
      v14 = -[REMListStorage isGroup](self, "isGroup");
      if (v14 == -[REMListStorage isGroup](v6, "isGroup"))
      {
        -[REMListStorage accountID](self, "accountID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage accountID](v6, "accountID");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 == (void *)v16)
        {

        }
        else
        {
          v17 = (void *)v16;
          -[REMListStorage accountID](self, "accountID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage accountID](v6, "accountID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if (!v20)
            goto LABEL_159;
        }
        -[REMListStorage externalIdentifier](self, "externalIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage externalIdentifier](v6, "externalIdentifier");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v21 == (void *)v22)
        {

        }
        else
        {
          v23 = (void *)v22;
          -[REMListStorage externalIdentifier](self, "externalIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage externalIdentifier](v6, "externalIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqual:", v25);

          if (!v26)
            goto LABEL_159;
        }
        -[REMListStorage externalModificationTag](self, "externalModificationTag");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage externalModificationTag](v6, "externalModificationTag");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v27 == (void *)v28)
        {

        }
        else
        {
          v29 = (void *)v28;
          -[REMListStorage externalModificationTag](self, "externalModificationTag");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage externalModificationTag](v6, "externalModificationTag");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "isEqual:", v31);

          if (!v32)
            goto LABEL_159;
        }
        -[REMListStorage daSyncToken](self, "daSyncToken");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage daSyncToken](v6, "daSyncToken");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v33 == (void *)v34)
        {

        }
        else
        {
          v35 = (void *)v34;
          -[REMListStorage daSyncToken](self, "daSyncToken");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage daSyncToken](v6, "daSyncToken");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isEqual:", v37);

          if (!v38)
            goto LABEL_159;
        }
        -[REMListStorage daPushKey](self, "daPushKey");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage daPushKey](v6, "daPushKey");
        v40 = objc_claimAutoreleasedReturnValue();
        if (v39 == (void *)v40)
        {

        }
        else
        {
          v41 = (void *)v40;
          -[REMListStorage daPushKey](self, "daPushKey");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage daPushKey](v6, "daPushKey");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v42, "isEqual:", v43);

          if (!v44)
            goto LABEL_159;
        }
        -[REMListStorage daExternalIdentificationTag](self, "daExternalIdentificationTag");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage daExternalIdentificationTag](v6, "daExternalIdentificationTag");
        v46 = objc_claimAutoreleasedReturnValue();
        if (v45 == (void *)v46)
        {

        }
        else
        {
          v47 = (void *)v46;
          -[REMListStorage daExternalIdentificationTag](self, "daExternalIdentificationTag");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage daExternalIdentificationTag](v6, "daExternalIdentificationTag");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v48, "isEqual:", v49);

          if (!v50)
            goto LABEL_159;
        }
        -[REMListStorage daBulkRequests](self, "daBulkRequests");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage daBulkRequests](v6, "daBulkRequests");
        v52 = objc_claimAutoreleasedReturnValue();
        if (v51 == (void *)v52)
        {

        }
        else
        {
          v53 = (void *)v52;
          -[REMListStorage daBulkRequests](self, "daBulkRequests");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage daBulkRequests](v6, "daBulkRequests");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v54, "isEqual:", v55);

          if (!v56)
            goto LABEL_159;
        }
        v57 = -[REMListStorage daDisplayOrder](self, "daDisplayOrder");
        if (v57 != -[REMListStorage daDisplayOrder](v6, "daDisplayOrder"))
          goto LABEL_159;
        v58 = -[REMListStorage daIsEventOnlyContainer](self, "daIsEventOnlyContainer");
        if (v58 != -[REMListStorage daIsEventOnlyContainer](v6, "daIsEventOnlyContainer"))
          goto LABEL_159;
        v59 = -[REMListStorage daIsReadOnly](self, "daIsReadOnly");
        if (v59 != -[REMListStorage daIsReadOnly](v6, "daIsReadOnly"))
          goto LABEL_159;
        v60 = -[REMListStorage daIsImmutable](self, "daIsImmutable");
        if (v60 != -[REMListStorage daIsImmutable](v6, "daIsImmutable"))
          goto LABEL_159;
        v61 = -[REMListStorage daIsNotificationsCollection](self, "daIsNotificationsCollection");
        if (v61 != -[REMListStorage daIsNotificationsCollection](v6, "daIsNotificationsCollection"))
          goto LABEL_159;
        v62 = -[REMListStorage minimumSupportedVersion](self, "minimumSupportedVersion");
        if (v62 != -[REMListStorage minimumSupportedVersion](v6, "minimumSupportedVersion"))
          goto LABEL_159;
        v63 = -[REMListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion");
        if (v63 != -[REMListStorage effectiveMinimumSupportedVersion](v6, "effectiveMinimumSupportedVersion"))
          goto LABEL_159;
        -[REMListStorage lastUserAccessDate](self, "lastUserAccessDate");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage lastUserAccessDate](v6, "lastUserAccessDate");
        v65 = objc_claimAutoreleasedReturnValue();
        if (v64 == (void *)v65)
        {

        }
        else
        {
          v66 = (void *)v65;
          -[REMListStorage lastUserAccessDate](self, "lastUserAccessDate");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage lastUserAccessDate](v6, "lastUserAccessDate");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v67, "isEqual:", v68);

          if (!v69)
            goto LABEL_159;
        }
        -[REMListStorage name](self, "name");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage name](v6, "name");
        v71 = objc_claimAutoreleasedReturnValue();
        if (v70 == (void *)v71)
        {

        }
        else
        {
          v72 = (void *)v71;
          -[REMListStorage name](self, "name");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage name](v6, "name");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v73, "isEqual:", v74);

          if (!v75)
            goto LABEL_159;
        }
        -[REMListStorage color](self, "color");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage color](v6, "color");
        v77 = objc_claimAutoreleasedReturnValue();
        if (v76 == (void *)v77)
        {

        }
        else
        {
          v78 = (void *)v77;
          -[REMListStorage color](self, "color");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage color](v6, "color");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v79, "isEqual:", v80);

          if (!v81)
            goto LABEL_159;
        }
        -[REMListStorage badgeEmblem](self, "badgeEmblem");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage badgeEmblem](v6, "badgeEmblem");
        v83 = objc_claimAutoreleasedReturnValue();
        if (v82 == (void *)v83)
        {

        }
        else
        {
          v84 = (void *)v83;
          -[REMListStorage badgeEmblem](self, "badgeEmblem");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage badgeEmblem](v6, "badgeEmblem");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v85, "isEqual:", v86);

          if (!v87)
            goto LABEL_159;
        }
        v88 = -[REMListStorage shouldCategorizeGroceryItems](self, "shouldCategorizeGroceryItems");
        if (v88 != -[REMListStorage shouldCategorizeGroceryItems](v6, "shouldCategorizeGroceryItems"))
          goto LABEL_159;
        v89 = -[REMListStorage shouldSuggestConversionToGroceryList](self, "shouldSuggestConversionToGroceryList");
        if (v89 != -[REMListStorage shouldSuggestConversionToGroceryList](v6, "shouldSuggestConversionToGroceryList"))
          goto LABEL_159;
        -[REMListStorage groceryLocaleID](self, "groceryLocaleID");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage groceryLocaleID](v6, "groceryLocaleID");
        v91 = objc_claimAutoreleasedReturnValue();
        if (v90 == (void *)v91)
        {

        }
        else
        {
          v92 = (void *)v91;
          -[REMListStorage groceryLocaleID](self, "groceryLocaleID");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage groceryLocaleID](v6, "groceryLocaleID");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v93, "isEqual:", v94);

          if (!v95)
            goto LABEL_159;
        }
        -[REMListStorage unsavedReminderIDsToCategorizeAsGroceryItems](self, "unsavedReminderIDsToCategorizeAsGroceryItems");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListStorage unsavedReminderIDsToCategorizeAsGroceryItems](v6, "unsavedReminderIDsToCategorizeAsGroceryItems");
        v97 = objc_claimAutoreleasedReturnValue();
        if (v96 == (void *)v97)
        {

        }
        else
        {
          v98 = (void *)v97;
          -[REMListStorage unsavedReminderIDsToCategorizeAsGroceryItems](self, "unsavedReminderIDsToCategorizeAsGroceryItems");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage unsavedReminderIDsToCategorizeAsGroceryItems](v6, "unsavedReminderIDsToCategorizeAsGroceryItems");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend(v99, "isEqual:", v100);

          if (!v101)
            goto LABEL_159;
        }
        v102 = -[REMListStorage showingLargeAttachments](self, "showingLargeAttachments");
        if (v102 == -[REMListStorage showingLargeAttachments](v6, "showingLargeAttachments"))
        {
          -[REMListStorage parentAccountID](self, "parentAccountID");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage parentAccountID](v6, "parentAccountID");
          v104 = objc_claimAutoreleasedReturnValue();
          if (v103 == (void *)v104)
          {

          }
          else
          {
            v105 = (void *)v104;
            -[REMListStorage parentAccountID](self, "parentAccountID");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage parentAccountID](v6, "parentAccountID");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = objc_msgSend(v106, "isEqual:", v107);

            if (!v108)
              goto LABEL_159;
          }
          -[REMListStorage parentListID](self, "parentListID");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage parentListID](v6, "parentListID");
          v110 = objc_claimAutoreleasedReturnValue();
          if (v109 == (void *)v110)
          {

          }
          else
          {
            v111 = (void *)v110;
            -[REMListStorage parentListID](self, "parentListID");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage parentListID](v6, "parentListID");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            v114 = objc_msgSend(v112, "isEqual:", v113);

            if (!v114)
              goto LABEL_159;
          }
          if (!self->_reminderIDsMergeableOrdering || v6->_reminderIDsMergeableOrdering)
          {
            +[REMLogStore read](REMLogStore, "read");
            v115 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            {
              v160 = (objc_class *)objc_opt_class();
              NSStringFromClass(v160);
              v161 = (id)objc_claimAutoreleasedReturnValue();
              reminderIDsMergeableOrdering = self->_reminderIDsMergeableOrdering;
              v163 = v6->_reminderIDsMergeableOrdering;
              v237 = 138543874;
              v238 = v161;
              v239 = 2112;
              v240 = reminderIDsMergeableOrdering;
              v241 = 2112;
              v242 = v163;
              _os_log_error_impl(&dword_1B4A39000, v115, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the reminderIDsMergeableordering. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-idsOrdering: %@, other-idsOrdering: %@}", (uint8_t *)&v237, 0x20u);

            }
          }
          -[REMListStorage reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage reminderIDsMergeableOrdering](v6, "reminderIDsMergeableOrdering");
          v117 = objc_claimAutoreleasedReturnValue();
          if (v116 == (void *)v117)
          {

          }
          else
          {
            v118 = (void *)v117;
            -[REMListStorage reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage reminderIDsMergeableOrdering](v6, "reminderIDsMergeableOrdering");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = objc_msgSend(v119, "isEqual:", v120);

            if (!v121)
              goto LABEL_159;
          }
          if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
          {
            +[REMLogStore read](REMLogStore, "read");
            v122 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              v164 = (objc_class *)objc_opt_class();
              NSStringFromClass(v164);
              v165 = (id)objc_claimAutoreleasedReturnValue();
              resolutionTokenMap = self->_resolutionTokenMap;
              v167 = v6->_resolutionTokenMap;
              v237 = 138543874;
              v238 = v165;
              v239 = 2112;
              v240 = resolutionTokenMap;
              v241 = 2112;
              v242 = v167;
              _os_log_error_impl(&dword_1B4A39000, v122, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v237, 0x20u);

            }
          }
          -[REMListStorage resolutionTokenMap](self, "resolutionTokenMap");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage resolutionTokenMap](v6, "resolutionTokenMap");
          v124 = objc_claimAutoreleasedReturnValue();
          if (v123 == (void *)v124)
          {

          }
          else
          {
            v125 = (void *)v124;
            -[REMListStorage resolutionTokenMap](self, "resolutionTokenMap");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage resolutionTokenMap](v6, "resolutionTokenMap");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            v128 = objc_msgSend(v126, "isEqual:", v127);

            if (!v128)
              goto LABEL_159;
          }
          -[REMListStorage reminderIDsToUndelete](self, "reminderIDsToUndelete");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage reminderIDsToUndelete](v6, "reminderIDsToUndelete");
          v130 = objc_claimAutoreleasedReturnValue();
          if (v129 == (void *)v130)
          {

          }
          else
          {
            v131 = (void *)v130;
            -[REMListStorage reminderIDsToUndelete](self, "reminderIDsToUndelete");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage reminderIDsToUndelete](v6, "reminderIDsToUndelete");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = objc_msgSend(v132, "isEqual:", v133);

            if (!v134)
              goto LABEL_159;
          }
          -[REMListStorage childListIDsToUndelete](self, "childListIDsToUndelete");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage childListIDsToUndelete](v6, "childListIDsToUndelete");
          v136 = objc_claimAutoreleasedReturnValue();
          if (v135 == (void *)v136)
          {

          }
          else
          {
            v137 = (void *)v136;
            -[REMListStorage childListIDsToUndelete](self, "childListIDsToUndelete");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage childListIDsToUndelete](v6, "childListIDsToUndelete");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            v140 = objc_msgSend(v138, "isEqual:", v139);

            if (!v140)
              goto LABEL_159;
          }
          -[REMListStorage childSmartListIDsToUndelete](self, "childSmartListIDsToUndelete");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage childSmartListIDsToUndelete](v6, "childSmartListIDsToUndelete");
          v142 = objc_claimAutoreleasedReturnValue();
          if (v141 == (void *)v142)
          {

          }
          else
          {
            v143 = (void *)v142;
            -[REMListStorage childSmartListIDsToUndelete](self, "childSmartListIDsToUndelete");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage childSmartListIDsToUndelete](v6, "childSmartListIDsToUndelete");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            v146 = objc_msgSend(v144, "isEqual:", v145);

            if (!v146)
              goto LABEL_159;
          }
          -[REMListStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMListStorage sectionIDsToUndelete](v6, "sectionIDsToUndelete");
          v148 = objc_claimAutoreleasedReturnValue();
          if (v147 == (void *)v148)
          {

          }
          else
          {
            v149 = (void *)v148;
            -[REMListStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage sectionIDsToUndelete](v6, "sectionIDsToUndelete");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = objc_msgSend(v150, "isEqual:", v151);

            if (!v152)
              goto LABEL_159;
          }
          v153 = -[REMListStorage remindersICSDisplayOrderChanged](self, "remindersICSDisplayOrderChanged");
          if (v153 == -[REMListStorage remindersICSDisplayOrderChanged](v6, "remindersICSDisplayOrderChanged"))
          {
            -[REMListStorage templateID](self, "templateID");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage templateID](v6, "templateID");
            v155 = objc_claimAutoreleasedReturnValue();
            if (v154 == (void *)v155)
            {

            }
            else
            {
              v156 = (void *)v155;
              -[REMListStorage templateID](self, "templateID");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMListStorage templateID](v6, "templateID");
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              v159 = objc_msgSend(v157, "isEqual:", v158);

              if (!v159)
                goto LABEL_159;
            }
            -[REMListStorage sharedOwnerName](self, "sharedOwnerName");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage sharedOwnerName](v6, "sharedOwnerName");
            v169 = objc_claimAutoreleasedReturnValue();
            if (v168 == (void *)v169)
            {

            }
            else
            {
              v170 = (void *)v169;
              -[REMListStorage sharedOwnerName](self, "sharedOwnerName");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMListStorage sharedOwnerName](v6, "sharedOwnerName");
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              v173 = objc_msgSend(v171, "isEqual:", v172);

              if (!v173)
                goto LABEL_159;
            }
            -[REMListStorage sharedOwnerAddress](self, "sharedOwnerAddress");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMListStorage sharedOwnerAddress](v6, "sharedOwnerAddress");
            v175 = objc_claimAutoreleasedReturnValue();
            if (v174 == (void *)v175)
            {

            }
            else
            {
              v176 = (void *)v175;
              -[REMListStorage sharedOwnerAddress](self, "sharedOwnerAddress");
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMListStorage sharedOwnerAddress](v6, "sharedOwnerAddress");
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              v179 = objc_msgSend(v177, "isEqual:", v178);

              if (!v179)
                goto LABEL_159;
            }
            v180 = -[REMListStorage sharingStatus](self, "sharingStatus");
            if (v180 == -[REMListStorage sharingStatus](v6, "sharingStatus"))
            {
              -[REMListStorage sharees](self, "sharees");
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMListStorage sharees](v6, "sharees");
              v182 = objc_claimAutoreleasedReturnValue();
              if (v181 == (void *)v182)
              {

              }
              else
              {
                v183 = (void *)v182;
                -[REMListStorage sharees](self, "sharees");
                v184 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMListStorage sharees](v6, "sharees");
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                v186 = objc_msgSend(v184, "isEqual:", v185);

                if (!v186)
                  goto LABEL_159;
              }
              -[REMListStorage sharedOwnerID](self, "sharedOwnerID");
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMListStorage sharedOwnerID](v6, "sharedOwnerID");
              v188 = objc_claimAutoreleasedReturnValue();
              if (v187 == (void *)v188)
              {

              }
              else
              {
                v189 = (void *)v188;
                -[REMListStorage sharedOwnerID](self, "sharedOwnerID");
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMListStorage sharedOwnerID](v6, "sharedOwnerID");
                v191 = (void *)objc_claimAutoreleasedReturnValue();
                v192 = objc_msgSend(v190, "isEqual:", v191);

                if (!v192)
                  goto LABEL_159;
              }
              -[REMListStorage calDAVNotifications](self, "calDAVNotifications");
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMListStorage calDAVNotifications](v6, "calDAVNotifications");
              v194 = objc_claimAutoreleasedReturnValue();
              if (v193 == (void *)v194)
              {

              }
              else
              {
                v195 = (void *)v194;
                -[REMListStorage calDAVNotifications](self, "calDAVNotifications");
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMListStorage calDAVNotifications](v6, "calDAVNotifications");
                v197 = (void *)objc_claimAutoreleasedReturnValue();
                v198 = objc_msgSend(v196, "isEqual:", v197);

                if (!v198)
                  goto LABEL_159;
              }
              v199 = -[REMListStorage isPlaceholder](self, "isPlaceholder");
              if (v199 == -[REMListStorage isPlaceholder](v6, "isPlaceholder"))
              {
                -[REMListStorage currentUserShareParticipantID](self, "currentUserShareParticipantID");
                v200 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMListStorage currentUserShareParticipantID](v6, "currentUserShareParticipantID");
                v201 = objc_claimAutoreleasedReturnValue();
                if (v200 == (void *)v201)
                {

                }
                else
                {
                  v202 = (void *)v201;
                  -[REMListStorage currentUserShareParticipantID](self, "currentUserShareParticipantID");
                  v203 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMListStorage currentUserShareParticipantID](v6, "currentUserShareParticipantID");
                  v204 = (void *)objc_claimAutoreleasedReturnValue();
                  v205 = objc_msgSend(v203, "isEqual:", v204);

                  if (!v205)
                    goto LABEL_159;
                }
                -[REMListStorage sortingStyle](self, "sortingStyle");
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMListStorage sortingStyle](v6, "sortingStyle");
                v207 = objc_claimAutoreleasedReturnValue();
                if (v206 == (void *)v207)
                {

                }
                else
                {
                  v208 = (void *)v207;
                  -[REMListStorage sortingStyle](self, "sortingStyle");
                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMListStorage sortingStyle](v6, "sortingStyle");
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  v211 = objc_msgSend(v209, "isEqual:", v210);

                  if (!v211)
                    goto LABEL_159;
                }
                -[REMListStorage pinnedDate](self, "pinnedDate");
                v212 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMListStorage pinnedDate](v6, "pinnedDate");
                v213 = objc_claimAutoreleasedReturnValue();
                if (v212 == (void *)v213)
                {

                }
                else
                {
                  v214 = (void *)v213;
                  -[REMListStorage pinnedDate](self, "pinnedDate");
                  v215 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMListStorage pinnedDate](v6, "pinnedDate");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  v217 = objc_msgSend(v215, "isEqual:", v216);

                  if (!v217)
                    goto LABEL_159;
                }
                -[REMListStorage mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
                v218 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMListStorage mostRecentTargetTemplateIdentifier](v6, "mostRecentTargetTemplateIdentifier");
                v219 = objc_claimAutoreleasedReturnValue();
                if (v218 == (void *)v219)
                {

                }
                else
                {
                  v220 = (void *)v219;
                  -[REMListStorage mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
                  v221 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMListStorage mostRecentTargetTemplateIdentifier](v6, "mostRecentTargetTemplateIdentifier");
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  v223 = objc_msgSend(v221, "isEqual:", v222);

                  if (!v223)
                    goto LABEL_159;
                }
                v224 = -[REMListStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering");
                if (v224 == -[REMListStorage shouldUpdateSectionsOrdering](v6, "shouldUpdateSectionsOrdering"))
                {
                  -[REMListStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
                  v225 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMListStorage unsavedSectionIDsOrdering](v6, "unsavedSectionIDsOrdering");
                  v226 = objc_claimAutoreleasedReturnValue();
                  if (v225 == (void *)v226)
                  {

                  }
                  else
                  {
                    v227 = (void *)v226;
                    -[REMListStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
                    v228 = (void *)objc_claimAutoreleasedReturnValue();
                    -[REMListStorage unsavedSectionIDsOrdering](v6, "unsavedSectionIDsOrdering");
                    v229 = (void *)objc_claimAutoreleasedReturnValue();
                    v230 = objc_msgSend(v228, "isEqual:", v229);

                    if (!v230)
                      goto LABEL_159;
                  }
                  -[REMListStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
                  v232 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMListStorage unsavedMembershipsOfRemindersInSections](v6, "unsavedMembershipsOfRemindersInSections");
                  v233 = objc_claimAutoreleasedReturnValue();
                  if (v232 == (void *)v233)
                  {
                    v13 = 1;
                    v234 = v232;
                  }
                  else
                  {
                    v234 = (void *)v233;
                    -[REMListStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
                    v235 = (void *)objc_claimAutoreleasedReturnValue();
                    -[REMListStorage unsavedMembershipsOfRemindersInSections](v6, "unsavedMembershipsOfRemindersInSections");
                    v236 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = objc_msgSend(v235, "isEqual:", v236);

                  }
                  goto LABEL_160;
                }
              }
            }
          }
        }
      }
    }
LABEL_159:
    v13 = 0;
LABEL_160:

    goto LABEL_161;
  }
  v13 = 1;
LABEL_161:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMListStorage objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMListStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMListStorage name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ %@ [%ld.%ld]>"), v4, self, v5, v6, self->_storeGeneration, self->_copyGeneration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ekColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[REMListStorage color](self, "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[REMColor colorWithHexString:](REMColor, "colorWithHexString:", CFSTR("#007AFF"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSOrderedSet)reminderIDsMergeableOrdering
{
  NSOrderedSet **p_reminderIDsMergeableOrdering;
  NSOrderedSet *v4;
  NSOrderedSet *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSData *reminderIDsMergeableOrderingData;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  REMListStorage *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_reminderIDsMergeableOrdering = &self->_reminderIDsMergeableOrdering;
  v4 = self->_reminderIDsMergeableOrdering;
  if (!v4)
  {
    -[REMListStorage reminderIDsMergeableOrderingData](self, "reminderIDsMergeableOrderingData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v16 = 0;
      objc_msgSend((id)objc_opt_class(), "reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:", v6, &v16);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v16;
      +[REMLogStore read](REMLogStore, "read");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[REMListStorage objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v18 = v10;
        v19 = 2048;
        v20 = self;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_1B4A39000, v9, OS_LOG_TYPE_INFO, "REMListStorage reminderIDsMergeableOrdering deserialized {objectID: %{public}@, self: %p, orderedSet.count: %@}", buf, 0x20u);

      }
      if (v7)
      {
        reminderIDsMergeableOrderingData = self->_reminderIDsMergeableOrderingData;
        self->_reminderIDsMergeableOrderingData = 0;

LABEL_14:
        objc_storeStrong((id *)p_reminderIDsMergeableOrdering, v7);
        v5 = (NSOrderedSet *)v7;

        goto LABEL_15;
      }
    }
    else
    {
      +[REMLogStore read](REMLogStore, "read");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[REMListStorage reminderIDsMergeableOrdering].cold.2(self, v13);

      +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("reminderIDsMergeableOrderingData is nil when trying to deserialize from list storage"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[REMLogStore read](REMLogStore, "read");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[REMListStorage reminderIDsMergeableOrdering].cold.1();

    v7 = objc_alloc_init(MEMORY[0x1E0C99E40]);
    goto LABEL_14;
  }
  v5 = v4;
LABEL_15:

  return v5;
}

- (BOOL)hasDeserializedReminderIDsMergeableOrdering
{
  return self->_reminderIDsMergeableOrdering != 0;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isUnsupported
{
  return rem_isUnsupportedVersionByRuntime(-[REMListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
}

- (id)cdKeyToStorageKeyMap
{
  if (cdKeyToStorageKeyMap_onceToken_1 != -1)
    dispatch_once(&cdKeyToStorageKeyMap_onceToken_1, &__block_literal_global_35);
  return (id)cdKeyToStorageKeyMap_mapping_1;
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  REMResolutionTokenMap **p_resolutionTokenMap;
  REMResolutionTokenMap *v4;
  REMResolutionTokenMap *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  p_resolutionTokenMap = &self->_resolutionTokenMap;
  v4 = self->_resolutionTokenMap;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[REMListStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[REMLogStore read](REMLogStore, "read");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[REMListStorage resolutionTokenMap].cold.1();

    }
    -[REMListStorage cdKeyToStorageKeyMap](self, "cdKeyToStorageKeyMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMResolutionTokenMap resolutionTokenMapWithJSONData:keyMap:](REMResolutionTokenMap, "resolutionTokenMapWithJSONData:keyMap:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    v5 = v9;

  }
  return v5;
}

+ (id)reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v6, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  if (!v14)
  {
    +[REMLogStore read](REMLogStore, "read");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      +[REMListStorage reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:error:].cold.1();

  }
  if (a4)
    *a4 = objc_retainAutorelease(v15);

  return v14;
}

+ (id)reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v23;
  id v24;
  void *v25;
  id *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    v7 = (void *)MEMORY[0x1B5E3DEC4]();
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v31;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v9;
        v25 = v7;
        v26 = a4;
        v23 = v8;
        v10 = v8;
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v10, "count"));
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v12 = v10;
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v28 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
              if (v18)
              {
                +[REMReminderStorage objectIDWithUUID:](REMReminderStorage, "objectIDWithUUID:", v18);
                v19 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v19);
              }
              else
              {
                +[REMLogStore read](REMLogStore, "read");
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v33 = v17;
                  _os_log_fault_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_FAULT, "Failed to create uuid from string. Skipping objectID from list {uuidString: %@}", buf, 0xCu);
                }
              }

            }
            v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
          }
          while (v14);
        }

        a4 = v26;
        v9 = v24;
        v7 = v25;
        v8 = v23;
        goto LABEL_26;
      }
      +[REMLogStore read](REMLogStore, "read");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[REMListStorage reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:].cold.3((uint64_t)v8, v12);
    }
    else
    {
      +[REMLogStore read](REMLogStore, "read");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[REMListStorage reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:].cold.2();
    }
    v11 = 0;
LABEL_26:

    objc_autoreleasePoolPop(v7);
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    v21 = v11;

    goto LABEL_29;
  }
  +[REMLogStore read](REMLogStore, "read");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    +[REMListStorage reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:].cold.1();

  v21 = 0;
LABEL_29:

  return v21;
}

+ (BOOL)_forceDisableFullRemindersSorting
{
  return __forceDisableFullRemindersSorting;
}

+ (void)set_forceDisableFullRemindersSorting:(BOOL)a3
{
  __forceDisableFullRemindersSorting = a3;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (void)setIsGroup:(BOOL)a3
{
  self->_isGroup = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setReminderIDsMergeableOrderingData:(id)a3
{
  objc_storeStrong((id *)&self->_reminderIDsMergeableOrderingData, a3);
}

- (void)setReminderIDsOrderingHints:(id)a3
{
  objc_storeStrong((id *)&self->_reminderIDsOrderingHints, a3);
}

- (void)setReminderIDsToUndelete:(id)a3
{
  objc_storeStrong((id *)&self->_reminderIDsToUndelete, a3);
}

- (void)setChildListIDsToUndelete:(id)a3
{
  objc_storeStrong((id *)&self->_childListIDsToUndelete, a3);
}

- (void)setChildSmartListIDsToUndelete:(id)a3
{
  objc_storeStrong((id *)&self->_childSmartListIDsToUndelete, a3);
}

- (void)setSectionIDsToUndelete:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIDsToUndelete, a3);
}

- (void)setRemindersICSDisplayOrderChanged:(BOOL)a3
{
  self->_remindersICSDisplayOrderChanged = a3;
}

- (void)setDaBulkRequests:(id)a3
{
  objc_storeStrong((id *)&self->_daBulkRequests, a3);
}

- (void)initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrdering:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "Failed to serialize provided reminderIDsMergeableOrdering. Using emptyArray {error: %@}", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "Unknown REMListSharingStatus %ld", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithCoder:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_6(&dword_1B4A39000, v0, v1, "rem_log_fault_if (_reminderIDsMergeableOrdering == nil && _reminderIDsMergeableOrderingData == nil) -- Attempted to decode REMListStorage with both _reminderIDsMergeableOrdering and _reminderIDsMergeableOrderingData missing {objectID: %{public}@, name: %{sensitive}@}");
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithCoder:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_6(&dword_1B4A39000, v0, v1, "Attempted to decode REMListStorage missing objectID, name, reminderIDs {objectID: %{public}@, name: %{sensitive}@}");
  OUTLINED_FUNCTION_3_1();
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v4, "rem_log_fault_if (self.reminderIDsMergeableOrderingData == nil) -- Attempted to encode REMListStorage with both _reminderIDsMergeableOrdering and _reminderIDsMergeableOrderingData missing {%{public}@}", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)reminderIDsMergeableOrdering
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, v4, "Nil reminderIDsMergeableOrderingData when reading reminderIDsMergeableOrdering from list storage. Initialize an empty set {objectID: %{public}@}", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)resolutionTokenMap
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, v0, v1, "Nil resolutionTokenMapData when reading resolutionTokenMap from list storage. Initialize an empty map {list: %@}", v2);
  OUTLINED_FUNCTION_3_1();
}

+ (void)reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_6(&dword_1B4A39000, v0, v1, "Failed to serialize uuidStrings {error: %@, uuidStrings: %@}");
  OUTLINED_FUNCTION_3_1();
}

+ (void)reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "Missing reminderIDsMergeableOrderingData. Returning nil {list: %@}", v2);
  OUTLINED_FUNCTION_3_1();
}

+ (void)reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_6(&dword_1B4A39000, v0, v1, "Failed to deserialize reminderIDsMergeableOrdering data. Returning nil {error: %@, list: %@}");
  OUTLINED_FUNCTION_3_1();
}

+ (void)reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:(uint64_t)a1 error:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_5();
  v4 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v5, "unexpected class for deserialized reminderIDsMergeableOrdering. Returning nil {class: %@}", v6);

  OUTLINED_FUNCTION_2_2();
}

@end
