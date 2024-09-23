@implementation REMSmartListStorage

- (REMSmartListStorage)initWithObjectID:(id)a3 accountID:(id)a4 smartListType:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMSmartListStorage *v12;
  REMSmartListStorage *v13;
  REMAccountCapabilities *v14;
  REMAccountCapabilities *accountCapabilities;
  REMManualOrdering *manualOrdering;
  NSString *name;
  REMColor *color;
  NSString *badgeEmblem;
  NSDate *pinnedDate;
  NSUUID *mostRecentTargetTemplateIdentifier;
  NSData *filterData;
  NSArray *unsavedSectionIDsOrdering;
  REMMemberships *unsavedMembershipsOfRemindersInSections;
  uint64_t v25;
  NSSet *sectionIDsToUndelete;
  REMResolutionTokenMap *v27;
  REMResolutionTokenMap *resolutionTokenMap;
  uint64_t v29;
  NSData *resolutionTokenMapData;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)REMSmartListStorage;
  v12 = -[REMSmartListStorage init](&v32, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_objectID, a3);
    objc_storeStrong((id *)&v13->_accountID, a4);
    objc_storeStrong((id *)&v13->_smartListType, a5);
    v14 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", 2);
    accountCapabilities = v13->_accountCapabilities;
    v13->_accountCapabilities = v14;

    manualOrdering = v13->_manualOrdering;
    v13->_manualOrdering = 0;

    v13->_showingLargeAttachments = 0;
    name = v13->_name;
    v13->_name = 0;

    color = v13->_color;
    v13->_color = 0;

    badgeEmblem = v13->_badgeEmblem;
    v13->_badgeEmblem = 0;

    pinnedDate = v13->_pinnedDate;
    v13->_pinnedDate = 0;

    mostRecentTargetTemplateIdentifier = v13->_mostRecentTargetTemplateIdentifier;
    v13->_mostRecentTargetTemplateIdentifier = 0;

    filterData = v13->_filterData;
    v13->_filterData = 0;

    v13->_shouldUpdateSectionsOrdering = 0;
    unsavedSectionIDsOrdering = v13->_unsavedSectionIDsOrdering;
    v13->_unsavedSectionIDsOrdering = 0;

    unsavedMembershipsOfRemindersInSections = v13->_unsavedMembershipsOfRemindersInSections;
    v13->_unsavedMembershipsOfRemindersInSections = 0;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v25 = objc_claimAutoreleasedReturnValue();
    sectionIDsToUndelete = v13->_sectionIDsToUndelete;
    v13->_sectionIDsToUndelete = (NSSet *)v25;

    v13->_isPersisted = 0;
    v27 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v13->_resolutionTokenMap;
    v13->_resolutionTokenMap = v27;

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v29 = objc_claimAutoreleasedReturnValue();
    resolutionTokenMapData = v13->_resolutionTokenMapData;
    v13->_resolutionTokenMapData = (NSData *)v29;

    v13->_storeGeneration = 0;
    v13->_copyGeneration = 0;
  }

  return v13;
}

- (id)optionalObjectID
{
  return self->_objectID;
}

- (REMSmartListStorage)initWithCoder:(id)a3
{
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  REMSmartListStorage *v15;
  void *v16;
  REMSmartListStorage *v17;
  REMSmartListStorage *v18;
  uint64_t v19;
  NSSet *sectionIDsToUndelete;
  void *v21;
  void *v22;
  NSData *resolutionTokenMapData;
  REMResolutionTokenMap *resolutionTokenMap;
  NSData *v25;
  char v27;
  char v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  id v39;
  void *v40;
  void *v41;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentAccountID"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentListID"));
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smartListType"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manualOrdering"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showingLargeAttachments"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("badgeEmblem"));
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterData"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPersisted"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortingStyle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinnedDate"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mostRecentTargetTemplateIdentifier"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldUpdateSectionsOrdering"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("unsavedSectionIDsOrdering"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unsavedMembershipsOfRemindersInSections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("sectionIDsToUndelete"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v30)
  {
    v16 = (void *)v29;
    if (v29 && v41)
    {
      v17 = -[REMSmartListStorage initWithObjectID:accountID:smartListType:](self, "initWithObjectID:accountID:smartListType:", v30, v29);
      v18 = v17;
      if (v17)
      {
        objc_storeStrong((id *)&v17->_manualOrdering, obj);
        v18->_isPersisted = v27;
        v18->_showingLargeAttachments = v28;
        objc_storeStrong((id *)&v18->_name, v37);
        objc_storeStrong((id *)&v18->_color, v36);
        objc_storeStrong((id *)&v18->_badgeEmblem, v35);
        objc_storeStrong((id *)&v18->_filterData, v34);
        objc_storeStrong((id *)&v18->_parentAccountID, v40);
        objc_storeStrong((id *)&v18->_parentListID, v39);
        objc_storeStrong((id *)&v18->_pinnedDate, v32);
        objc_storeStrong((id *)&v18->_mostRecentTargetTemplateIdentifier, v31);
        v18->_shouldUpdateSectionsOrdering = v5;
        objc_storeStrong((id *)&v18->_unsavedSectionIDsOrdering, v9);
        objc_storeStrong((id *)&v18->_unsavedMembershipsOfRemindersInSections, v10);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
        v19 = objc_claimAutoreleasedReturnValue();
        sectionIDsToUndelete = v18->_sectionIDsToUndelete;
        v18->_sectionIDsToUndelete = (NSSet *)v19;

        -[REMSmartListStorage setSortingStyle:](v18, "setSortingStyle:", v33);
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMapData"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMap"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_storeStrong((id *)&v18->_resolutionTokenMap, v22);
          resolutionTokenMapData = v18->_resolutionTokenMapData;
          v18->_resolutionTokenMapData = 0;
        }
        else
        {
          resolutionTokenMap = v18->_resolutionTokenMap;
          v18->_resolutionTokenMap = 0;

          v25 = v21;
          resolutionTokenMapData = v18->_resolutionTokenMapData;
          v18->_resolutionTokenMapData = v25;
        }

        -[REMSmartListStorage setMinimumSupportedVersion:](v18, "setMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumSupportedVersion")));
        -[REMSmartListStorage setEffectiveMinimumSupportedVersion:](v18, "setEffectiveMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effectiveMinimumSupportedVersion")));

        v16 = (void *)v29;
      }
      self = v18;
      v15 = self;
    }
  }
  else
  {
    v16 = (void *)v29;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
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
  void *v20;
  REMResolutionTokenMap *resolutionTokenMap;
  void *v22;
  id v23;

  v23 = a3;
  -[REMSmartListStorage objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v4, CFSTR("objectID"));

  -[REMSmartListStorage accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v5, CFSTR("accountID"));

  -[REMSmartListStorage parentAccountID](self, "parentAccountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v6, CFSTR("parentAccountID"));

  -[REMSmartListStorage parentListID](self, "parentListID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v7, CFSTR("parentListID"));

  -[REMSmartListStorage smartListType](self, "smartListType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v8, CFSTR("smartListType"));

  -[REMSmartListStorage manualOrdering](self, "manualOrdering");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v9, CFSTR("manualOrdering"));

  objc_msgSend(v23, "encodeBool:forKey:", -[REMSmartListStorage showingLargeAttachments](self, "showingLargeAttachments"), CFSTR("showingLargeAttachments"));
  -[REMSmartListStorage name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v10, CFSTR("name"));

  -[REMSmartListStorage color](self, "color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v11, CFSTR("color"));

  -[REMSmartListStorage badgeEmblem](self, "badgeEmblem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v12, CFSTR("badgeEmblem"));

  -[REMSmartListStorage filterData](self, "filterData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v13, CFSTR("filterData"));

  objc_msgSend(v23, "encodeBool:forKey:", -[REMSmartListStorage isPersisted](self, "isPersisted"), CFSTR("isPersisted"));
  -[REMSmartListStorage sortingStyle](self, "sortingStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v14, CFSTR("sortingStyle"));

  -[REMSmartListStorage pinnedDate](self, "pinnedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v15, CFSTR("pinnedDate"));

  -[REMSmartListStorage mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v16, CFSTR("mostRecentTargetTemplateIdentifier"));

  objc_msgSend(v23, "encodeBool:forKey:", -[REMSmartListStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering"), CFSTR("shouldUpdateSectionsOrdering"));
  -[REMSmartListStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v17, CFSTR("unsavedSectionIDsOrdering"));

  -[REMSmartListStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v18, CFSTR("unsavedMembershipsOfRemindersInSections"));

  -[REMSmartListStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v20, CFSTR("sectionIDsToUndelete"));

  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    objc_msgSend(v23, "encodeObject:forKey:", resolutionTokenMap, CFSTR("resolutionTokenMap"));
    objc_msgSend(v23, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMapData"));
  }
  else
  {
    objc_msgSend(v23, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMap"));
    -[REMSmartListStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "encodeObject:forKey:", v22, CFSTR("resolutionTokenMapData"));

  }
  objc_msgSend(v23, "encodeInteger:forKey:", -[REMSmartListStorage minimumSupportedVersion](self, "minimumSupportedVersion"), CFSTR("minimumSupportedVersion"));
  objc_msgSend(v23, "encodeInteger:forKey:", -[REMSmartListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), CFSTR("effectiveMinimumSupportedVersion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  REMSmartListStorage *v4;
  REMSmartListStorage *v5;
  REMSmartListStorage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  _BOOL4 v44;
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
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  _BOOL4 v69;
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
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  NSObject *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  int64_t v120;
  int64_t v121;
  objc_class *v123;
  void *v124;
  REMResolutionTokenMap *resolutionTokenMap;
  REMResolutionTokenMap *v126;
  int v127;
  void *v128;
  __int16 v129;
  REMResolutionTokenMap *v130;
  __int16 v131;
  REMResolutionTokenMap *v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = (REMSmartListStorage *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMSmartListStorage objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListStorage objectID](v6, "objectID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMSmartListStorage objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage objectID](v6, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_86;
      }
      -[REMSmartListStorage accountID](self, "accountID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListStorage accountID](v6, "accountID");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMSmartListStorage accountID](self, "accountID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage accountID](v6, "accountID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_86;
      }
      -[REMSmartListStorage parentAccountID](self, "parentAccountID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListStorage parentAccountID](v6, "parentAccountID");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[REMSmartListStorage parentAccountID](self, "parentAccountID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage parentAccountID](v6, "parentAccountID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_86;
      }
      -[REMSmartListStorage parentListID](self, "parentListID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListStorage parentListID](v6, "parentListID");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[REMSmartListStorage parentListID](self, "parentListID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage parentListID](v6, "parentListID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_86;
      }
      -[REMSmartListStorage smartListType](self, "smartListType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListStorage smartListType](v6, "smartListType");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[REMSmartListStorage smartListType](self, "smartListType");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage smartListType](v6, "smartListType");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_86;
      }
      -[REMSmartListStorage manualOrdering](self, "manualOrdering");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListStorage manualOrdering](v6, "manualOrdering");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[REMSmartListStorage manualOrdering](self, "manualOrdering");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage manualOrdering](v6, "manualOrdering");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_86;
      }
      v44 = -[REMSmartListStorage showingLargeAttachments](self, "showingLargeAttachments");
      if (v44 == -[REMSmartListStorage showingLargeAttachments](v6, "showingLargeAttachments"))
      {
        -[REMSmartListStorage name](self, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage name](v6, "name");
        v46 = objc_claimAutoreleasedReturnValue();
        if (v45 == (void *)v46)
        {

        }
        else
        {
          v47 = (void *)v46;
          -[REMSmartListStorage name](self, "name");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMSmartListStorage name](v6, "name");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v48, "isEqual:", v49);

          if (!v50)
            goto LABEL_86;
        }
        -[REMSmartListStorage color](self, "color");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage color](v6, "color");
        v52 = objc_claimAutoreleasedReturnValue();
        if (v51 == (void *)v52)
        {

        }
        else
        {
          v53 = (void *)v52;
          -[REMSmartListStorage color](self, "color");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMSmartListStorage color](v6, "color");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v54, "isEqual:", v55);

          if (!v56)
            goto LABEL_86;
        }
        -[REMSmartListStorage badgeEmblem](self, "badgeEmblem");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage badgeEmblem](v6, "badgeEmblem");
        v58 = objc_claimAutoreleasedReturnValue();
        if (v57 == (void *)v58)
        {

        }
        else
        {
          v59 = (void *)v58;
          -[REMSmartListStorage badgeEmblem](self, "badgeEmblem");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMSmartListStorage badgeEmblem](v6, "badgeEmblem");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v60, "isEqual:", v61);

          if (!v62)
            goto LABEL_86;
        }
        -[REMSmartListStorage filterData](self, "filterData");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSmartListStorage filterData](v6, "filterData");
        v64 = objc_claimAutoreleasedReturnValue();
        if (v63 == (void *)v64)
        {

        }
        else
        {
          v65 = (void *)v64;
          -[REMSmartListStorage filterData](self, "filterData");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMSmartListStorage filterData](v6, "filterData");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v66, "isEqual:", v67);

          if (!v68)
            goto LABEL_86;
        }
        v69 = -[REMSmartListStorage isPersisted](self, "isPersisted");
        if (v69 == -[REMSmartListStorage isPersisted](v6, "isPersisted"))
        {
          -[REMSmartListStorage sortingStyle](self, "sortingStyle");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMSmartListStorage sortingStyle](v6, "sortingStyle");
          v71 = objc_claimAutoreleasedReturnValue();
          if (v70 == (void *)v71)
          {

          }
          else
          {
            v72 = (void *)v71;
            -[REMSmartListStorage sortingStyle](self, "sortingStyle");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMSmartListStorage sortingStyle](v6, "sortingStyle");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v73, "isEqual:", v74);

            if (!v75)
              goto LABEL_86;
          }
          -[REMSmartListStorage pinnedDate](self, "pinnedDate");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMSmartListStorage pinnedDate](v6, "pinnedDate");
          v77 = objc_claimAutoreleasedReturnValue();
          if (v76 == (void *)v77)
          {

          }
          else
          {
            v78 = (void *)v77;
            -[REMSmartListStorage pinnedDate](self, "pinnedDate");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMSmartListStorage pinnedDate](v6, "pinnedDate");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v79, "isEqual:", v80);

            if (!v81)
              goto LABEL_86;
          }
          -[REMSmartListStorage mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMSmartListStorage mostRecentTargetTemplateIdentifier](v6, "mostRecentTargetTemplateIdentifier");
          v83 = objc_claimAutoreleasedReturnValue();
          if (v82 == (void *)v83)
          {

          }
          else
          {
            v84 = (void *)v83;
            -[REMSmartListStorage mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMSmartListStorage mostRecentTargetTemplateIdentifier](v6, "mostRecentTargetTemplateIdentifier");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v85, "isEqual:", v86);

            if (!v87)
              goto LABEL_86;
          }
          v88 = -[REMSmartListStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering");
          if (v88 == -[REMSmartListStorage shouldUpdateSectionsOrdering](v6, "shouldUpdateSectionsOrdering"))
          {
            -[REMSmartListStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMSmartListStorage unsavedSectionIDsOrdering](v6, "unsavedSectionIDsOrdering");
            v90 = objc_claimAutoreleasedReturnValue();
            if (v89 == (void *)v90)
            {

            }
            else
            {
              v91 = (void *)v90;
              -[REMSmartListStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMSmartListStorage unsavedSectionIDsOrdering](v6, "unsavedSectionIDsOrdering");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = objc_msgSend(v92, "isEqual:", v93);

              if (!v94)
                goto LABEL_86;
            }
            -[REMSmartListStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMSmartListStorage unsavedMembershipsOfRemindersInSections](v6, "unsavedMembershipsOfRemindersInSections");
            v96 = objc_claimAutoreleasedReturnValue();
            if (v95 == (void *)v96)
            {

            }
            else
            {
              v97 = (void *)v96;
              -[REMSmartListStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMSmartListStorage unsavedMembershipsOfRemindersInSections](v6, "unsavedMembershipsOfRemindersInSections");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = objc_msgSend(v98, "isEqual:", v99);

              if (!v100)
                goto LABEL_86;
            }
            -[REMSmartListStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMSmartListStorage sectionIDsToUndelete](v6, "sectionIDsToUndelete");
            v102 = objc_claimAutoreleasedReturnValue();
            if (v101 == (void *)v102)
            {

            }
            else
            {
              v103 = (void *)v102;
              -[REMSmartListStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMSmartListStorage sectionIDsToUndelete](v6, "sectionIDsToUndelete");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = objc_msgSend(v104, "isEqual:", v105);

              if (!v106)
                goto LABEL_86;
            }
            -[REMSmartListStorage accountCapabilities](self, "accountCapabilities");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMSmartListStorage accountCapabilities](v6, "accountCapabilities");
            v108 = objc_claimAutoreleasedReturnValue();
            if (v107 == (void *)v108)
            {

            }
            else
            {
              v109 = (void *)v108;
              -[REMSmartListStorage accountCapabilities](self, "accountCapabilities");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMSmartListStorage accountCapabilities](v6, "accountCapabilities");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = objc_msgSend(v110, "isEqual:", v111);

              if (!v112)
                goto LABEL_86;
            }
            if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
            {
              +[REMLogStore read](REMLogStore, "read");
              v113 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                v123 = (objc_class *)objc_opt_class();
                NSStringFromClass(v123);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                resolutionTokenMap = self->_resolutionTokenMap;
                v126 = v6->_resolutionTokenMap;
                v127 = 138543874;
                v128 = v124;
                v129 = 2112;
                v130 = resolutionTokenMap;
                v131 = 2112;
                v132 = v126;
                _os_log_error_impl(&dword_1B4A39000, v113, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v127, 0x20u);

              }
            }
            -[REMSmartListStorage resolutionTokenMap](self, "resolutionTokenMap");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMSmartListStorage resolutionTokenMap](v6, "resolutionTokenMap");
            v115 = objc_claimAutoreleasedReturnValue();
            if (v114 == (void *)v115)
            {

            }
            else
            {
              v116 = (void *)v115;
              -[REMSmartListStorage resolutionTokenMap](self, "resolutionTokenMap");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMSmartListStorage resolutionTokenMap](v6, "resolutionTokenMap");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              v119 = objc_msgSend(v117, "isEqual:", v118);

              if (!v119)
                goto LABEL_86;
            }
            v120 = -[REMSmartListStorage minimumSupportedVersion](self, "minimumSupportedVersion");
            if (v120 == -[REMSmartListStorage minimumSupportedVersion](v6, "minimumSupportedVersion"))
            {
              v121 = -[REMSmartListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion");
              v13 = v121 == -[REMSmartListStorage effectiveMinimumSupportedVersion](v6, "effectiveMinimumSupportedVersion");
LABEL_87:

              goto LABEL_88;
            }
          }
        }
      }
    }
LABEL_86:
    v13 = 0;
    goto LABEL_87;
  }
  v13 = 1;
LABEL_88:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMSmartListStorage objectID](self, "objectID");
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
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMSmartListStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage smartListType](self, "smartListType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage sortingStyle](self, "sortingStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, smartListType: %@, sortingStyle: %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMSmartListStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  REMSmartListStorage *v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  REMResolutionTokenMap *resolutionTokenMap;
  void *v28;

  v4 = [REMSmartListStorage alloc];
  -[REMSmartListStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage smartListType](self, "smartListType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMSmartListStorage initWithObjectID:accountID:smartListType:](v4, "initWithObjectID:accountID:smartListType:", v5, v6, v7);

  -[REMSmartListStorage parentAccountID](self, "parentAccountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setParentAccountID:](v8, "setParentAccountID:", v9);

  -[REMSmartListStorage parentListID](self, "parentListID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setParentListID:](v8, "setParentListID:", v10);

  -[REMSmartListStorage manualOrdering](self, "manualOrdering");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[REMSmartListStorage setManualOrdering:](v8, "setManualOrdering:", v12);

  -[REMSmartListStorage setIsPersisted:](v8, "setIsPersisted:", -[REMSmartListStorage isPersisted](self, "isPersisted"));
  -[REMSmartListStorage setShowingLargeAttachments:](v8, "setShowingLargeAttachments:", -[REMSmartListStorage showingLargeAttachments](self, "showingLargeAttachments"));
  -[REMSmartListStorage name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setName:](v8, "setName:", v13);

  -[REMSmartListStorage color](self, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setColor:](v8, "setColor:", v14);

  -[REMSmartListStorage badgeEmblem](self, "badgeEmblem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setBadgeEmblem:](v8, "setBadgeEmblem:", v15);

  -[REMSmartListStorage filterData](self, "filterData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setFilterData:](v8, "setFilterData:", v16);

  -[REMSmartListStorage sortingStyle](self, "sortingStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setSortingStyle:](v8, "setSortingStyle:", v17);

  -[REMSmartListStorage pinnedDate](self, "pinnedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setPinnedDate:](v8, "setPinnedDate:", v18);

  -[REMSmartListStorage mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setMostRecentTargetTemplateIdentifier:](v8, "setMostRecentTargetTemplateIdentifier:", v19);

  -[REMSmartListStorage setShouldUpdateSectionsOrdering:](v8, "setShouldUpdateSectionsOrdering:", -[REMSmartListStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering"));
  -[REMSmartListStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  -[REMSmartListStorage setUnsavedSectionIDsOrdering:](v8, "setUnsavedSectionIDsOrdering:", v21);

  -[REMSmartListStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  -[REMSmartListStorage setUnsavedMembershipsOfRemindersInSections:](v8, "setUnsavedMembershipsOfRemindersInSections:", v23);

  -[REMSmartListStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  -[REMSmartListStorage setSectionIDsToUndelete:](v8, "setSectionIDsToUndelete:", v25);

  v26 = -[REMResolutionTokenMap copy](self->_resolutionTokenMap, "copy");
  resolutionTokenMap = v8->_resolutionTokenMap;
  v8->_resolutionTokenMap = (REMResolutionTokenMap *)v26;

  -[REMSmartListStorage resolutionTokenMapData](self, "resolutionTokenMapData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setResolutionTokenMapData:](v8, "setResolutionTokenMapData:", v28);

  -[REMSmartListStorage setMinimumSupportedVersion:](v8, "setMinimumSupportedVersion:", -[REMSmartListStorage minimumSupportedVersion](self, "minimumSupportedVersion"));
  -[REMSmartListStorage setEffectiveMinimumSupportedVersion:](v8, "setEffectiveMinimumSupportedVersion:", -[REMSmartListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
  v8->_storeGeneration = self->_storeGeneration;
  v8->_copyGeneration = self->_copyGeneration + 1;
  return v8;
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
  return (NSString *)CFSTR("REMCDSmartList");
}

- (BOOL)isUnsupported
{
  return rem_isUnsupportedVersionByRuntime(-[REMSmartListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
}

- (id)cdKeyToStorageKeyMap
{
  if (cdKeyToStorageKeyMap_onceToken_0 != -1)
    dispatch_once(&cdKeyToStorageKeyMap_onceToken_0, &__block_literal_global_34);
  return (id)cdKeyToStorageKeyMap_mapping_0;
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
    -[REMSmartListStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[REMLogStore read](REMLogStore, "read");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[REMSmartListStorage resolutionTokenMap].cold.1((uint64_t)self, v7);

    }
    -[REMSmartListStorage cdKeyToStorageKeyMap](self, "cdKeyToStorageKeyMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMResolutionTokenMap resolutionTokenMapWithJSONData:keyMap:](REMResolutionTokenMap, "resolutionTokenMapWithJSONData:keyMap:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    v5 = v9;

  }
  return v5;
}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration)
    self->_storeGeneration = a3;
}

- (NSString)sortingStyle
{
  return self->sortingStyle;
}

- (void)setSortingStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)pinnedDate
{
  return self->_pinnedDate;
}

- (void)setPinnedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (NSString)smartListType
{
  return self->_smartListType;
}

- (void)setSmartListType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (REMAccountCapabilities)accountCapabilities
{
  return self->_accountCapabilities;
}

- (void)setAccountCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_accountCapabilities, a3);
}

- (REMManualOrdering)manualOrdering
{
  return self->_manualOrdering;
}

- (void)setManualOrdering:(id)a3
{
  objc_storeStrong((id *)&self->_manualOrdering, a3);
}

- (NSUUID)mostRecentTargetTemplateIdentifier
{
  return self->_mostRecentTargetTemplateIdentifier;
}

- (void)setMostRecentTargetTemplateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentTargetTemplateIdentifier, a3);
}

- (BOOL)shouldUpdateSectionsOrdering
{
  return self->_shouldUpdateSectionsOrdering;
}

- (void)setShouldUpdateSectionsOrdering:(BOOL)a3
{
  self->_shouldUpdateSectionsOrdering = a3;
}

- (NSArray)unsavedSectionIDsOrdering
{
  return self->_unsavedSectionIDsOrdering;
}

- (void)setUnsavedSectionIDsOrdering:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedSectionIDsOrdering, a3);
}

- (REMMemberships)unsavedMembershipsOfRemindersInSections
{
  return self->_unsavedMembershipsOfRemindersInSections;
}

- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedMembershipsOfRemindersInSections, a3);
}

- (NSSet)sectionIDsToUndelete
{
  return self->_sectionIDsToUndelete;
}

- (void)setSectionIDsToUndelete:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIDsToUndelete, a3);
}

- (BOOL)showingLargeAttachments
{
  return self->_showingLargeAttachments;
}

- (void)setShowingLargeAttachments:(BOOL)a3
{
  self->_showingLargeAttachments = a3;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (REMObjectID)parentAccountID
{
  return self->_parentAccountID;
}

- (void)setParentAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_parentAccountID, a3);
}

- (REMObjectID)parentListID
{
  return self->_parentListID;
}

- (void)setParentListID:(id)a3
{
  objc_storeStrong((id *)&self->_parentListID, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (REMColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSString)badgeEmblem
{
  return self->_badgeEmblem;
}

- (void)setBadgeEmblem:(id)a3
{
  objc_storeStrong((id *)&self->_badgeEmblem, a3);
}

- (NSData)filterData
{
  return self->_filterData;
}

- (void)setFilterData:(id)a3
{
  objc_storeStrong((id *)&self->_filterData, a3);
}

- (BOOL)isPersisted
{
  return self->_isPersisted;
}

- (void)setIsPersisted:(BOOL)a3
{
  self->_isPersisted = a3;
}

- (void)setResolutionTokenMap:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMap, a3);
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (void)setResolutionTokenMapData:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMapData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_filterData, 0);
  objc_storeStrong((id *)&self->_badgeEmblem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parentListID, 0);
  objc_storeStrong((id *)&self->_parentAccountID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_sectionIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_unsavedMembershipsOfRemindersInSections, 0);
  objc_storeStrong((id *)&self->_unsavedSectionIDsOrdering, 0);
  objc_storeStrong((id *)&self->_mostRecentTargetTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_manualOrdering, 0);
  objc_storeStrong((id *)&self->_accountCapabilities, 0);
  objc_storeStrong((id *)&self->_smartListType, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_pinnedDate, 0);
  objc_storeStrong((id *)&self->sortingStyle, 0);
}

- (void)resolutionTokenMap
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from smartlist storage. Initialize an empty map {smartlist: %@}", (uint8_t *)&v2, 0xCu);
}

@end
