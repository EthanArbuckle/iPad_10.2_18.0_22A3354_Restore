@implementation REMTemplateStorage

- (REMTemplateStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMTemplateStorage *v12;
  REMTemplateStorage *v13;
  REMObjectID *parentAccountID;
  REMAccountCapabilities *v15;
  REMAccountCapabilities *accountCapabilities;
  REMTemplateConfiguration *configuration;
  REMColor *color;
  NSString *badgeEmblem;
  REMManualOrdering *unsavedManualOrdering;
  NSArray *unsavedSectionIDsOrdering;
  REMMemberships *unsavedMembershipsOfRemindersInSections;
  uint64_t v23;
  NSSet *sectionIDsToUndelete;
  NSDate *mostRecentPublicLinkUpdateRequestDate;
  REMTemplatePublicLink *publicLink;
  REMResolutionTokenMap *v27;
  REMResolutionTokenMap *resolutionTokenMap;
  uint64_t v29;
  NSData *resolutionTokenMapData;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)REMTemplateStorage;
  v12 = -[REMTemplateStorage init](&v32, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_objectID, a3);
    objc_storeStrong((id *)&v13->_accountID, a4);
    parentAccountID = v13->_parentAccountID;
    v13->_parentAccountID = 0;

    v15 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", 2);
    accountCapabilities = v13->_accountCapabilities;
    v13->_accountCapabilities = v15;

    configuration = v13->_configuration;
    v13->_configuration = 0;

    objc_storeStrong((id *)&v13->_name, a5);
    color = v13->_color;
    v13->_color = 0;

    badgeEmblem = v13->_badgeEmblem;
    v13->_badgeEmblem = 0;

    v13->_showingLargeAttachments = 0;
    unsavedManualOrdering = v13->_unsavedManualOrdering;
    v13->_unsavedManualOrdering = 0;

    v13->_shouldUpdateSectionsOrdering = 0;
    unsavedSectionIDsOrdering = v13->_unsavedSectionIDsOrdering;
    v13->_unsavedSectionIDsOrdering = 0;

    unsavedMembershipsOfRemindersInSections = v13->_unsavedMembershipsOfRemindersInSections;
    v13->_unsavedMembershipsOfRemindersInSections = 0;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    sectionIDsToUndelete = v13->_sectionIDsToUndelete;
    v13->_sectionIDsToUndelete = (NSSet *)v23;

    mostRecentPublicLinkUpdateRequestDate = v13->_mostRecentPublicLinkUpdateRequestDate;
    v13->_mostRecentPublicLinkUpdateRequestDate = 0;

    publicLink = v13->_publicLink;
    v13->_publicLink = 0;

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

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMTemplateStorage objectID](self, "objectID");
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
  -[REMTemplateStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
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
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
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
  int v63;
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
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  int v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  NSObject *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  int64_t v108;
  int64_t v109;
  objc_class *v111;
  void *v112;
  REMResolutionTokenMap *resolutionTokenMap;
  uint64_t v114;
  int v115;
  void *v116;
  __int16 v117;
  REMResolutionTokenMap *v118;
  __int16 v119;
  uint64_t v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  if (a3 != self)
  {
    v4 = a3;
    v5 = objc_opt_class();
    REMDynamicCast(v5, (uint64_t)v4);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    -[REMTemplateStorage objectID](self, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[REMTemplateStorage objectID](self, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_77;
    }
    -[REMTemplateStorage accountID](self, "accountID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountID");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[REMTemplateStorage accountID](self, "accountID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_77;
    }
    -[REMTemplateStorage parentAccountID](self, "parentAccountID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentAccountID");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[REMTemplateStorage parentAccountID](self, "parentAccountID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentAccountID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_77;
    }
    -[REMTemplateStorage configuration](self, "configuration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configuration");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[REMTemplateStorage configuration](self, "configuration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuration");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_77;
    }
    -[REMTemplateStorage name](self, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[REMTemplateStorage name](self, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
        goto LABEL_77;
    }
    -[REMTemplateStorage color](self, "color");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v38 == (void *)v39)
    {

    }
    else
    {
      v40 = (void *)v39;
      -[REMTemplateStorage color](self, "color");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "color");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqual:", v42);

      if (!v43)
        goto LABEL_77;
    }
    -[REMTemplateStorage badgeEmblem](self, "badgeEmblem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "badgeEmblem");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v44 == (void *)v45)
    {

    }
    else
    {
      v46 = (void *)v45;
      -[REMTemplateStorage badgeEmblem](self, "badgeEmblem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "badgeEmblem");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v47, "isEqual:", v48);

      if (!v49)
        goto LABEL_77;
    }
    v50 = -[REMTemplateStorage showingLargeAttachments](self, "showingLargeAttachments");
    if (v50 == objc_msgSend(v6, "showingLargeAttachments"))
    {
      -[REMTemplateStorage sortingStyle](self, "sortingStyle");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sortingStyle");
      v52 = objc_claimAutoreleasedReturnValue();
      if (v51 == (void *)v52)
      {

      }
      else
      {
        v53 = (void *)v52;
        -[REMTemplateStorage sortingStyle](self, "sortingStyle");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sortingStyle");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v54, "isEqual:", v55);

        if (!v56)
          goto LABEL_77;
      }
      -[REMTemplateStorage unsavedManualOrdering](self, "unsavedManualOrdering");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unsavedManualOrdering");
      v58 = objc_claimAutoreleasedReturnValue();
      if (v57 == (void *)v58)
      {

      }
      else
      {
        v59 = (void *)v58;
        -[REMTemplateStorage unsavedManualOrdering](self, "unsavedManualOrdering");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unsavedManualOrdering");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v60, "isEqual:", v61);

        if (!v62)
          goto LABEL_77;
      }
      v63 = -[REMTemplateStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering");
      if (v63 == objc_msgSend(v6, "shouldUpdateSectionsOrdering"))
      {
        -[REMTemplateStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unsavedSectionIDsOrdering");
        v65 = objc_claimAutoreleasedReturnValue();
        if (v64 == (void *)v65)
        {

        }
        else
        {
          v66 = (void *)v65;
          -[REMTemplateStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "unsavedSectionIDsOrdering");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v67, "isEqual:", v68);

          if (!v69)
            goto LABEL_77;
        }
        -[REMTemplateStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unsavedMembershipsOfRemindersInSections");
        v71 = objc_claimAutoreleasedReturnValue();
        if (v70 == (void *)v71)
        {

        }
        else
        {
          v72 = (void *)v71;
          -[REMTemplateStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "unsavedMembershipsOfRemindersInSections");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v73, "isEqual:", v74);

          if (!v75)
            goto LABEL_77;
        }
        -[REMTemplateStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sectionIDsToUndelete");
        v77 = objc_claimAutoreleasedReturnValue();
        if (v76 == (void *)v77)
        {

        }
        else
        {
          v78 = (void *)v77;
          -[REMTemplateStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sectionIDsToUndelete");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v79, "isEqual:", v80);

          if (!v81)
            goto LABEL_77;
        }
        -[REMTemplateStorage mostRecentPublicLinkUpdateRequestDate](self, "mostRecentPublicLinkUpdateRequestDate");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mostRecentPublicLinkUpdateRequestDate");
        v83 = objc_claimAutoreleasedReturnValue();
        if (v82 == (void *)v83)
        {

        }
        else
        {
          v84 = (void *)v83;
          -[REMTemplateStorage mostRecentPublicLinkUpdateRequestDate](self, "mostRecentPublicLinkUpdateRequestDate");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "mostRecentPublicLinkUpdateRequestDate");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v85, "isEqual:", v86);

          if (!v87)
            goto LABEL_77;
        }
        -[REMTemplateStorage publicLink](self, "publicLink");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "publicLink");
        v89 = objc_claimAutoreleasedReturnValue();
        if (v88 == (void *)v89)
        {

        }
        else
        {
          v90 = (void *)v89;
          -[REMTemplateStorage publicLink](self, "publicLink");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "publicLink");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = objc_msgSend(v91, "isEqual:", v92);

          if (!v93)
            goto LABEL_77;
        }
        v94 = -[REMTemplateStorage isPersisted](self, "isPersisted");
        if (v94 == objc_msgSend(v6, "isPersisted"))
        {
          -[REMTemplateStorage accountCapabilities](self, "accountCapabilities");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "accountCapabilities");
          v96 = objc_claimAutoreleasedReturnValue();
          if (v95 == (void *)v96)
          {

          }
          else
          {
            v97 = (void *)v96;
            -[REMTemplateStorage accountCapabilities](self, "accountCapabilities");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "accountCapabilities");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend(v98, "isEqual:", v99);

            if (!v100)
              goto LABEL_77;
          }
          if (!self->_resolutionTokenMap || v6[21])
          {
            +[REMLogStore read](REMLogStore, "read");
            v101 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
            {
              v111 = (objc_class *)objc_opt_class();
              NSStringFromClass(v111);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              resolutionTokenMap = self->_resolutionTokenMap;
              v114 = v6[21];
              v115 = 138543874;
              v116 = v112;
              v117 = 2112;
              v118 = resolutionTokenMap;
              v119 = 2112;
              v120 = v114;
              _os_log_error_impl(&dword_1B4A39000, v101, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v115, 0x20u);

            }
          }
          -[REMTemplateStorage resolutionTokenMap](self, "resolutionTokenMap");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "resolutionTokenMap");
          v103 = objc_claimAutoreleasedReturnValue();
          if (v102 == (void *)v103)
          {

          }
          else
          {
            v104 = (void *)v103;
            -[REMTemplateStorage resolutionTokenMap](self, "resolutionTokenMap");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "resolutionTokenMap");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = objc_msgSend(v105, "isEqual:", v106);

            if (!v107)
              goto LABEL_77;
          }
          v108 = -[REMTemplateStorage minimumSupportedVersion](self, "minimumSupportedVersion");
          if (v108 == objc_msgSend(v6, "minimumSupportedVersion"))
          {
            v109 = -[REMTemplateStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion");
            v13 = v109 == objc_msgSend(v6, "effectiveMinimumSupportedVersion");
LABEL_78:

            return v13;
          }
        }
      }
    }
LABEL_77:
    v13 = 0;
    goto LABEL_78;
  }
  return 1;
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
  return (NSString *)CFSTR("REMCDTemplate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMTemplateStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  REMTemplateStorage *v8;
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

  v4 = [REMTemplateStorage alloc];
  -[REMTemplateStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateStorage accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateStorage name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMTemplateStorage initWithObjectID:accountID:name:](v4, "initWithObjectID:accountID:name:", v5, v6, v7);

  -[REMTemplateStorage parentAccountID](self, "parentAccountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateStorage setParentAccountID:](v8, "setParentAccountID:", v9);

  -[REMTemplateStorage configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[REMTemplateStorage setConfiguration:](v8, "setConfiguration:", v11);

  -[REMTemplateStorage color](self, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateStorage setColor:](v8, "setColor:", v12);

  -[REMTemplateStorage badgeEmblem](self, "badgeEmblem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateStorage setBadgeEmblem:](v8, "setBadgeEmblem:", v13);

  -[REMTemplateStorage setShowingLargeAttachments:](v8, "setShowingLargeAttachments:", -[REMTemplateStorage showingLargeAttachments](self, "showingLargeAttachments"));
  -[REMTemplateStorage sortingStyle](self, "sortingStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateStorage setSortingStyle:](v8, "setSortingStyle:", v14);

  -[REMTemplateStorage unsavedManualOrdering](self, "unsavedManualOrdering");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[REMTemplateStorage setUnsavedManualOrdering:](v8, "setUnsavedManualOrdering:", v16);

  -[REMTemplateStorage setShouldUpdateSectionsOrdering:](v8, "setShouldUpdateSectionsOrdering:", -[REMTemplateStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering"));
  -[REMTemplateStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[REMTemplateStorage setUnsavedSectionIDsOrdering:](v8, "setUnsavedSectionIDsOrdering:", v18);

  -[REMTemplateStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[REMTemplateStorage setUnsavedMembershipsOfRemindersInSections:](v8, "setUnsavedMembershipsOfRemindersInSections:", v20);

  -[REMTemplateStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[REMTemplateStorage setSectionIDsToUndelete:](v8, "setSectionIDsToUndelete:", v22);

  -[REMTemplateStorage mostRecentPublicLinkUpdateRequestDate](self, "mostRecentPublicLinkUpdateRequestDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateStorage setMostRecentPublicLinkUpdateRequestDate:](v8, "setMostRecentPublicLinkUpdateRequestDate:", v23);

  -[REMTemplateStorage publicLink](self, "publicLink");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  -[REMTemplateStorage setPublicLink:](v8, "setPublicLink:", v25);

  -[REMTemplateStorage setIsPersisted:](v8, "setIsPersisted:", -[REMTemplateStorage isPersisted](self, "isPersisted"));
  v26 = -[REMResolutionTokenMap copy](self->_resolutionTokenMap, "copy");
  resolutionTokenMap = v8->_resolutionTokenMap;
  v8->_resolutionTokenMap = (REMResolutionTokenMap *)v26;

  -[REMTemplateStorage resolutionTokenMapData](self, "resolutionTokenMapData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateStorage setResolutionTokenMapData:](v8, "setResolutionTokenMapData:", v28);

  -[REMTemplateStorage setMinimumSupportedVersion:](v8, "setMinimumSupportedVersion:", -[REMTemplateStorage minimumSupportedVersion](self, "minimumSupportedVersion"));
  -[REMTemplateStorage setEffectiveMinimumSupportedVersion:](v8, "setEffectiveMinimumSupportedVersion:", -[REMTemplateStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
  v8->_storeGeneration = self->_storeGeneration;
  v8->_copyGeneration = self->_copyGeneration + 1;
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  REMResolutionTokenMap *resolutionTokenMap;
  void *v20;
  id v21;

  v21 = a3;
  -[REMTemplateStorage objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v4, CFSTR("objectID"));

  -[REMTemplateStorage accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v5, CFSTR("accountID"));

  -[REMTemplateStorage parentAccountID](self, "parentAccountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v6, CFSTR("parentAccountID"));

  -[REMTemplateStorage configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v7, CFSTR("configuration"));

  -[REMTemplateStorage name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("name"));

  -[REMTemplateStorage color](self, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v9, CFSTR("color"));

  -[REMTemplateStorage badgeEmblem](self, "badgeEmblem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v10, CFSTR("badgeEmblem"));

  objc_msgSend(v21, "encodeBool:forKey:", -[REMTemplateStorage showingLargeAttachments](self, "showingLargeAttachments"), CFSTR("showingLargeAttachments"));
  -[REMTemplateStorage sortingStyle](self, "sortingStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v11, CFSTR("sortingStyle"));

  -[REMTemplateStorage unsavedManualOrdering](self, "unsavedManualOrdering");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("unsavedManualOrdering"));

  objc_msgSend(v21, "encodeBool:forKey:", -[REMTemplateStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering"), CFSTR("shouldUpdateSectionsOrdering"));
  -[REMTemplateStorage unsavedSectionIDsOrdering](self, "unsavedSectionIDsOrdering");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v13, CFSTR("unsavedSectionIDsOrdering"));

  -[REMTemplateStorage unsavedMembershipsOfRemindersInSections](self, "unsavedMembershipsOfRemindersInSections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v14, CFSTR("unsavedMembershipsOfRemindersInSections"));

  -[REMTemplateStorage sectionIDsToUndelete](self, "sectionIDsToUndelete");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("sectionIDsToUndelete"));

  -[REMTemplateStorage mostRecentPublicLinkUpdateRequestDate](self, "mostRecentPublicLinkUpdateRequestDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v17, CFSTR("mostRecentPublicLinkUpdateRequestDate"));

  -[REMTemplateStorage publicLink](self, "publicLink");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("publicLink"));

  objc_msgSend(v21, "encodeBool:forKey:", -[REMTemplateStorage isPersisted](self, "isPersisted"), CFSTR("isPersisted"));
  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    objc_msgSend(v21, "encodeObject:forKey:", resolutionTokenMap, CFSTR("resolutionTokenMap"));
    objc_msgSend(v21, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMapData"));
  }
  else
  {
    objc_msgSend(v21, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMap"));
    -[REMTemplateStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("resolutionTokenMapData"));

  }
  objc_msgSend(v21, "encodeInteger:forKey:", -[REMTemplateStorage minimumSupportedVersion](self, "minimumSupportedVersion"), CFSTR("minimumSupportedVersion"));
  objc_msgSend(v21, "encodeInteger:forKey:", -[REMTemplateStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), CFSTR("effectiveMinimumSupportedVersion"));

}

- (REMTemplateStorage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  REMTemplateStorage *v11;
  REMTemplateStorage *v12;
  REMTemplateStorage *v13;
  uint64_t v14;
  REMObjectID *parentAccountID;
  uint64_t v16;
  REMTemplateConfiguration *configuration;
  uint64_t v18;
  REMColor *color;
  uint64_t v20;
  NSString *badgeEmblem;
  uint64_t v22;
  REMManualOrdering *unsavedManualOrdering;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *unsavedSectionIDsOrdering;
  uint64_t v29;
  REMMemberships *unsavedMembershipsOfRemindersInSections;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSSet *sectionIDsToUndelete;
  uint64_t v37;
  NSDate *mostRecentPublicLinkUpdateRequestDate;
  uint64_t v39;
  REMTemplatePublicLink *publicLink;
  void *v41;
  void *v42;
  void *v43;
  NSData *resolutionTokenMapData;
  REMResolutionTokenMap *resolutionTokenMap;
  NSData *v46;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = -[REMTemplateStorage initWithObjectID:accountID:name:](self, "initWithObjectID:accountID:name:", v5, v6, v7);
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentAccountID"));
      v14 = objc_claimAutoreleasedReturnValue();
      parentAccountID = v13->_parentAccountID;
      v13->_parentAccountID = (REMObjectID *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
      v16 = objc_claimAutoreleasedReturnValue();
      configuration = v13->_configuration;
      v13->_configuration = (REMTemplateConfiguration *)v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
      v18 = objc_claimAutoreleasedReturnValue();
      color = v13->_color;
      v13->_color = (REMColor *)v18;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("badgeEmblem"));
      v20 = objc_claimAutoreleasedReturnValue();
      badgeEmblem = v13->_badgeEmblem;
      v13->_badgeEmblem = (NSString *)v20;

      v13->_showingLargeAttachments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showingLargeAttachments"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unsavedManualOrdering"));
      v22 = objc_claimAutoreleasedReturnValue();
      unsavedManualOrdering = v13->_unsavedManualOrdering;
      v13->_unsavedManualOrdering = (REMManualOrdering *)v22;

      v13->_shouldUpdateSectionsOrdering = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldUpdateSectionsOrdering"));
      v24 = (void *)MEMORY[0x1E0C99E60];
      v25 = objc_opt_class();
      objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("unsavedSectionIDsOrdering"));
      v27 = objc_claimAutoreleasedReturnValue();
      unsavedSectionIDsOrdering = v13->_unsavedSectionIDsOrdering;
      v13->_unsavedSectionIDsOrdering = (NSArray *)v27;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unsavedMembershipsOfRemindersInSections"));
      v29 = objc_claimAutoreleasedReturnValue();
      unsavedMembershipsOfRemindersInSections = v13->_unsavedMembershipsOfRemindersInSections;
      v13->_unsavedMembershipsOfRemindersInSections = (REMMemberships *)v29;

      v31 = (void *)MEMORY[0x1E0C99E60];
      v32 = objc_opt_class();
      objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("sectionIDsToUndelete"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v34);
      v35 = objc_claimAutoreleasedReturnValue();
      sectionIDsToUndelete = v13->_sectionIDsToUndelete;
      v13->_sectionIDsToUndelete = (NSSet *)v35;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mostRecentPublicLinkUpdateRequestDate"));
      v37 = objc_claimAutoreleasedReturnValue();
      mostRecentPublicLinkUpdateRequestDate = v13->_mostRecentPublicLinkUpdateRequestDate;
      v13->_mostRecentPublicLinkUpdateRequestDate = (NSDate *)v37;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicLink"));
      v39 = objc_claimAutoreleasedReturnValue();
      publicLink = v13->_publicLink;
      v13->_publicLink = (REMTemplatePublicLink *)v39;

      v13->_isPersisted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPersisted"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortingStyle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMTemplateStorage setSortingStyle:](v13, "setSortingStyle:", v41);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMapData"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMap"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        objc_storeStrong((id *)&v13->_resolutionTokenMap, v43);
        resolutionTokenMapData = v13->_resolutionTokenMapData;
        v13->_resolutionTokenMapData = 0;
      }
      else
      {
        resolutionTokenMap = v13->_resolutionTokenMap;
        v13->_resolutionTokenMap = 0;

        v46 = v42;
        resolutionTokenMapData = v13->_resolutionTokenMapData;
        v13->_resolutionTokenMapData = v46;
      }

      -[REMTemplateStorage setMinimumSupportedVersion:](v13, "setMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumSupportedVersion")));
      -[REMTemplateStorage setEffectiveMinimumSupportedVersion:](v13, "setEffectiveMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effectiveMinimumSupportedVersion")));

    }
    self = v13;
    v11 = self;
  }

  return v11;
}

- (BOOL)isUnsupported
{
  return rem_isUnsupportedVersionByRuntime(-[REMTemplateStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
}

- (id)cdKeyToStorageKeyMap
{
  if (cdKeyToStorageKeyMap_onceToken_2 != -1)
    dispatch_once(&cdKeyToStorageKeyMap_onceToken_2, &__block_literal_global_40);
  return (id)cdKeyToStorageKeyMap_mapping_2;
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
    -[REMTemplateStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[REMLogStore read](REMLogStore, "read");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[REMTemplateStorage resolutionTokenMap].cold.1((uint64_t)self, v7);

    }
    -[REMTemplateStorage cdKeyToStorageKeyMap](self, "cdKeyToStorageKeyMap");
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

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)parentAccountID
{
  return self->_parentAccountID;
}

- (void)setParentAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_parentAccountID, a3);
}

- (REMAccountCapabilities)accountCapabilities
{
  return self->_accountCapabilities;
}

- (void)setAccountCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_accountCapabilities, a3);
}

- (REMTemplateConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)showingLargeAttachments
{
  return self->_showingLargeAttachments;
}

- (void)setShowingLargeAttachments:(BOOL)a3
{
  self->_showingLargeAttachments = a3;
}

- (NSString)sortingStyle
{
  return self->_sortingStyle;
}

- (void)setSortingStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
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

- (REMManualOrdering)unsavedManualOrdering
{
  return self->_unsavedManualOrdering;
}

- (void)setUnsavedManualOrdering:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedManualOrdering, a3);
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

- (NSDate)mostRecentPublicLinkUpdateRequestDate
{
  return self->_mostRecentPublicLinkUpdateRequestDate;
}

- (void)setMostRecentPublicLinkUpdateRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentPublicLinkUpdateRequestDate, a3);
}

- (REMTemplatePublicLink)publicLink
{
  return self->_publicLink;
}

- (void)setPublicLink:(id)a3
{
  objc_storeStrong((id *)&self->_publicLink, a3);
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
  objc_storeStrong((id *)&self->_publicLink, 0);
  objc_storeStrong((id *)&self->_mostRecentPublicLinkUpdateRequestDate, 0);
  objc_storeStrong((id *)&self->_sectionIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_unsavedMembershipsOfRemindersInSections, 0);
  objc_storeStrong((id *)&self->_unsavedManualOrdering, 0);
  objc_storeStrong((id *)&self->_unsavedSectionIDsOrdering, 0);
  objc_storeStrong((id *)&self->_sortingStyle, 0);
  objc_storeStrong((id *)&self->_badgeEmblem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_accountCapabilities, 0);
  objc_storeStrong((id *)&self->_parentAccountID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

- (void)resolutionTokenMap
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from template storage. Initialize an empty map {template: %@}", (uint8_t *)&v2, 0xCu);
}

@end
