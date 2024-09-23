@implementation REDonatedAction

+ (id)bundleIdForExtensionId:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (bundleIdForExtensionId__onceToken != -1)
  {
    dispatch_once(&bundleIdForExtensionId__onceToken, &__block_literal_global_74);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)bundleIdForExtensionId__pluginIdToBundleId, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v5;
}

void __42__REDonatedAction_bundleIdForExtensionId___block_invoke()
{
  void *v0;

  v0 = (void *)bundleIdForExtensionId__pluginIdToBundleId;
  bundleIdForExtensionId__pluginIdToBundleId = (uint64_t)&unk_24CFC1EA0;

}

+ (BOOL)supportedActivityType:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v15);
  v8 = v15;
  if (!v7)
  {
    RELogForDomain(14);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[REDonatedAction supportedActivityType:forBundleID:].cold.1();
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  objc_msgSend(v7, "applicationState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInstalled");

  if (v10)
  {
    objc_msgSend(v7, "teamIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
    objc_msgSend(v7, "userActivityTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "containsObject:", v12) & 1) != 0)
      LOBYTE(v10) = 1;
    else
      LOBYTE(v10) = objc_msgSend(v13, "containsObject:", v5);

LABEL_10:
  }

  return v10;
}

- (REDonatedAction)initWithEvent:(id)a3 filtered:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  REDonatedAction *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSObject *v17;

  v4 = a4;
  v6 = a3;
  if (!CoreDuetLibraryCore_frameworkLibrary_1)
    CoreDuetLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (CoreDuetLibraryCore_frameworkLibrary_1)
  {
    objc_msgSend(v6, "stream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKSystemEventStreamsClass_1(), "appIntentsStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      v10 = -[REDonatedAction _initInteractionWithEvent:filtered:](self, "_initInteractionWithEvent:filtered:", v6, v4);
    }
    else
    {
      objc_msgSend(get_DKSystemEventStreamsClass_1(), "appActivityStream");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "isEqual:", v12);

      if (v13)
      {
        v10 = -[REDonatedAction _initUserActivityWithEvent:filtered:](self, "_initUserActivityWithEvent:filtered:", v6, v4);
      }
      else
      {
        objc_msgSend(get_DKSystemEventStreamsClass_1(), "appRelevantShortcutsStream");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "isEqual:", v14);

        if (!v15)
        {
          RELogForDomain(14);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[REDonatedAction initWithEvent:filtered:].cold.1();

          v11 = 0;
          goto LABEL_12;
        }
        v10 = -[REDonatedAction _initRelevantShortcutWithEvent:filtered:](self, "_initRelevantShortcutWithEvent:filtered:", v6, v4);
      }
    }
    self = (REDonatedAction *)v10;
    v11 = self;
LABEL_12:

    goto LABEL_13;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REDonatedAction identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_initInteractionWithEvent:(id)a3 filtered:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v26;
  REDonatedAction *v27;
  id v28;
  id v29;
  REDonatedAction *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  REIdentifier *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  REIdentifier *donationIdentifier;
  uint64_t v40;
  NSDate *creationDate;
  uint64_t v42;
  NSDate *localSaveDate;
  void *v44;
  void *v45;
  uint64_t v46;
  NSString *intentTypeName;
  NSArray *relevanceProviders;
  id obj;
  id v51;
  _BOOL4 v52;
  id v53;
  REDonatedAction *v54;
  id v55;
  void *v56;
  id v57;
  objc_super v58;
  id v59;
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;

  v4 = a4;
  v6 = a3;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2050000000;
  v7 = (void *)get_DKIntentMetadataKeyClass_softClass_0;
  v64 = get_DKIntentMetadataKeyClass_softClass_0;
  if (!get_DKIntentMetadataKeyClass_softClass_0)
  {
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __get_DKIntentMetadataKeyClass_block_invoke_0;
    v60[3] = &unk_24CF8AC38;
    v60[4] = &v61;
    __get_DKIntentMetadataKeyClass_block_invoke_0((uint64_t)v60);
    v7 = (void *)v62[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v61, 8);
  objc_msgSend(v8, "serializedInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v59);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v59;
  objc_msgSend(v12, "intent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v54 = self;
    v52 = v4;
    REParametersForIntent(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v56 = v12;
      v18 = v6;
      v19 = v11;
      v20 = v9;
      v21 = v13;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v16, "re_actionIdentifierHashValue"));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      RESimplifiedParametersForIntent(v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = v23 != 0;
      if (v23)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v23, "re_actionIdentifierHashValue"));
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }

      v13 = v21;
      v9 = v20;
      v11 = v19;
      v6 = v18;
      v12 = v56;
    }
    else
    {
      v22 = 0;
      v26 = 0;
      v25 = 0;
    }

    v57 = v22;
    v28 = v26;
    v29 = v22;
    if (v25 || !v52)
    {
      v53 = v28;
      v58.receiver = v54;
      v58.super_class = (Class)REDonatedAction;
      v30 = -[REDonatedAction init](&v58, sel_init);
      if (v30)
      {
        obj = v29;
        v51 = v13;
        objc_msgSend(v15, "extensionBundleId");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[REDonatedAction bundleIdForExtensionId:](REDonatedAction, "bundleIdForExtensionId:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          v55 = v32;
        }
        else
        {
          objc_msgSend(v6, "source");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "bundleID");
          v55 = (id)objc_claimAutoreleasedReturnValue();

        }
        v35 = [REIdentifier alloc];
        objc_msgSend(v6, "UUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "UUIDString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[REIdentifier initWithDataSource:section:identifier:](v35, "initWithDataSource:section:identifier:", v55, &stru_24CF92178, v37);
        donationIdentifier = v30->_donationIdentifier;
        v30->_donationIdentifier = (REIdentifier *)v38;

        v30->_type = 1;
        objc_msgSend(v6, "startDate");
        v40 = objc_claimAutoreleasedReturnValue();
        creationDate = v30->_creationDate;
        v30->_creationDate = (NSDate *)v40;

        objc_msgSend(v6, "localCreationDate");
        v42 = objc_claimAutoreleasedReturnValue();
        localSaveDate = v30->_localSaveDate;
        v30->_localSaveDate = (NSDate *)v42;

        objc_storeStrong((id *)&v30->_actionTypeIdentifier, obj);
        objc_storeStrong((id *)&v30->_simplifiedActionTypeIdentifier, v26);
        objc_msgSend(v6, "source");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "deviceID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v30->_localDonation = v45 == 0;

        objc_msgSend(v15, "_className");
        v46 = objc_claimAutoreleasedReturnValue();
        intentTypeName = v30->_intentTypeName;
        v30->_intentTypeName = (NSString *)v46;

        v30->_isIntentBacked = 1;
        relevanceProviders = v30->_relevanceProviders;
        v30->_relevanceProviders = (NSArray *)MEMORY[0x24BDBD1A8];

        v30->_filteredShortcutType = 0;
        -[REDonatedAction _loadShortcutIdentifiersFromIntent:](v30, "_loadShortcutIdentifiersFromIntent:", v15);

        v13 = v51;
      }
      self = v30;
      v27 = self;
      v28 = v53;
    }
    else
    {
      v27 = 0;
      self = v54;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)_initUserActivityWithEvent:(id)a3 filtered:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  REDonatedAction *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  REDonatedAction *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  REIdentifier *donationIdentifier;
  uint64_t v25;
  NSDate *creationDate;
  uint64_t v27;
  NSDate *localSaveDate;
  void *v29;
  void *v30;
  NSArray *relevanceProviders;
  REIdentifier *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v4 = a4;
  v6 = a3;
  objc_msgSend(get_DKApplicationActivityMetadataKeyClass(), "isEligibleForPrediction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "BOOLValue"))
  {
    objc_msgSend(get_DKApplicationActivityMetadataKeyClass(), "activityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[REDonatedAction supportedActivityType:forBundleID:](REDonatedAction, "supportedActivityType:forBundleID:", v12, v14)|| !v4)
    {
      objc_msgSend(get_DKApplicationActivityMetadataKeyClass(), "userActivityRequiredString");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)v16;
      objc_msgSend(v17, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = v18;
      if (v18)
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1598]), "_initWithUserActivityStrings:secondaryString:optionalData:", v18, 0, 0);
      REExtractUserActivity(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 || !v4)
      {
        v37.receiver = self;
        v37.super_class = (Class)REDonatedAction;
        v20 = -[REDonatedAction init](&v37, sel_init);
        if (v20)
        {
          v33 = [REIdentifier alloc];
          objc_msgSend(v6, "UUID");
          v34 = v18;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[REIdentifier initWithDataSource:section:identifier:](v33, "initWithDataSource:section:identifier:", v14, &stru_24CF92178, v22);
          donationIdentifier = v20->_donationIdentifier;
          v20->_donationIdentifier = (REIdentifier *)v23;

          v18 = v34;
          v20->_type = 0;
          objc_msgSend(v6, "startDate");
          v25 = objc_claimAutoreleasedReturnValue();
          creationDate = v20->_creationDate;
          v20->_creationDate = (NSDate *)v25;

          objc_msgSend(v6, "localCreationDate");
          v27 = objc_claimAutoreleasedReturnValue();
          localSaveDate = v20->_localSaveDate;
          v20->_localSaveDate = (NSDate *)v27;

          objc_storeStrong((id *)&v20->_actionTypeIdentifier, v19);
          objc_storeStrong((id *)&v20->_simplifiedActionTypeIdentifier, v19);
          objc_storeStrong((id *)&v20->_activityType, v12);
          objc_msgSend(v6, "source");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "deviceID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v20->_localDonation = v30 == 0;

          v20->_isIntentBacked = 0;
          relevanceProviders = v20->_relevanceProviders;
          v20->_relevanceProviders = (NSArray *)MEMORY[0x24BDBD1A8];

          v20->_filteredShortcutType = 0;
          -[REDonatedAction _loadShortcutIdentifiersFromUserActivity:](v20, "_loadShortcutIdentifiersFromUserActivity:", v34);
        }
        self = v20;
        v15 = self;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_initRelevantShortcutWithEvent:(id)a3 filtered:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  REDonatedAction *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  REDonatedAction *v39;
  BOOL v40;
  REIdentifier *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  REIdentifier *donationIdentifier;
  uint64_t v47;
  NSDate *creationDate;
  uint64_t v49;
  NSDate *localSaveDate;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSArray *relevanceProviders;
  void *v58;
  void *v59;
  void *v60;
  REDonatedAction *v61;
  _BOOL4 v62;
  void *v63;
  objc_super v64;

  v62 = a4;
  v5 = a3;
  objc_msgSend(v5, "relevantShortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "watchTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    goto LABEL_3;
  }
  objc_msgSend(v6, "widgetKind");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_3:
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortcut");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = self;
    if (v10)
    {
      v11 = v10;
      REParametersForIntent(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "re_actionIdentifierHashValue"));
        v14 = (id)objc_claimAutoreleasedReturnValue();
        RESimplifiedParametersForIntent(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = v15 != 0;
        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v15, "re_actionIdentifierHashValue"));
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v14 = 0;
        v18 = 0;
        v17 = 0;
      }

      v21 = v14;
      v22 = v18;
      if (!v17 && v62)
      {
        v20 = 0;
        self = v61;
LABEL_39:

        goto LABEL_40;
      }
      objc_msgSend(v11, "extensionBundleId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[REDonatedAction bundleIdForExtensionId:](REDonatedAction, "bundleIdForExtensionId:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
        v26 = (void *)v24;
      else
        v26 = v8;
      v27 = v26;

      v8 = v27;
      self = v61;
    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    objc_msgSend(v6, "shortcut");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "userActivity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v58 = v22;
      v59 = v21;
      objc_msgSend(v29, "activityType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v8;
      v31 = v8;
      objc_msgSend(v5, "source");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "deviceID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA2B8]), "initWithUserActivityType:launchableAppBundleId:", v30, v31);
        objc_msgSend(MEMORY[0x24BDD9D20], "defaultResolver");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "resolveUserActivityExecutionInfo:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "launchableAppBundleId");
        v37 = objc_claimAutoreleasedReturnValue();

        v31 = (id)v37;
      }
      v21 = v59;
      if (!+[REDonatedAction supportedActivityType:forBundleID:](REDonatedAction, "supportedActivityType:forBundleID:", v30, v31)&& v62)
      {
        goto LABEL_28;
      }
      REExtractUserActivity(v29);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38 && v62)
      {
        v21 = 0;
LABEL_28:
        v8 = v60;

        v20 = 0;
        self = v61;
        v22 = v58;
LABEL_38:

        goto LABEL_39;
      }
      v21 = v38;

      v22 = v21;
      self = v61;
    }
    else
    {
      if (!v10)
      {
        v20 = 0;
        goto LABEL_38;
      }
      v60 = v8;
    }
    v64.receiver = self;
    v64.super_class = (Class)REDonatedAction;
    v39 = -[REDonatedAction init](&v64, sel_init);
    if (v39)
    {
      v40 = v29 == 0;
      v63 = v29;
      v41 = [REIdentifier alloc];
      objc_msgSend(v5, "UUID");
      v42 = v21;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "UUIDString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[REIdentifier initWithDataSource:section:identifier:](v41, "initWithDataSource:section:identifier:", v60, &stru_24CF92178, v44);
      donationIdentifier = v39->_donationIdentifier;
      v39->_donationIdentifier = (REIdentifier *)v45;

      v21 = v42;
      v39->_type = 2;
      objc_msgSend(v5, "startDate");
      v47 = objc_claimAutoreleasedReturnValue();
      creationDate = v39->_creationDate;
      v39->_creationDate = (NSDate *)v47;

      objc_msgSend(v5, "localCreationDate");
      v49 = objc_claimAutoreleasedReturnValue();
      localSaveDate = v39->_localSaveDate;
      v39->_localSaveDate = (NSDate *)v49;

      objc_storeStrong((id *)&v39->_actionTypeIdentifier, v42);
      objc_storeStrong((id *)&v39->_simplifiedActionTypeIdentifier, v22);
      objc_msgSend(v6, "relevanceProviders");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v39->_relevanceProvidersHash = -[REDonatedAction _hashRelevanceProviders:](v39, "_hashRelevanceProviders:", v51);

      objc_msgSend(v5, "source");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "deviceID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v39->_localDonation = v53 == 0;

      v39->_isIntentBacked = v40;
      objc_msgSend(v6, "relevanceProviders");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      RERelevanceProviderForRelevanceProviders(v54, v60);
      v55 = objc_claimAutoreleasedReturnValue();
      relevanceProviders = v39->_relevanceProviders;
      v39->_relevanceProviders = (NSArray *)v55;

      v39->_filteredShortcutType = 0;
      if (v10)
      {
        -[REDonatedAction _loadShortcutIdentifiersFromIntent:](v39, "_loadShortcutIdentifiersFromIntent:", v10);
        v29 = v63;
      }
      else
      {
        v29 = v63;
        -[REDonatedAction _loadShortcutIdentifiersFromUserActivity:](v39, "_loadShortcutIdentifiersFromUserActivity:", v63);
      }
    }
    self = v39;
    v20 = self;
    v8 = v60;
    goto LABEL_38;
  }
  v20 = 0;
LABEL_40:

  return v20;
}

- (id)_shortcutFilter
{
  if (_shortcutFilter_onceToken != -1)
    dispatch_once(&_shortcutFilter_onceToken, &__block_literal_global_26_0);
  return (id)_shortcutFilter_Filter;
}

void __34__REDonatedAction__shortcutFilter__block_invoke()
{
  REShortcutFilter *v0;
  void *v1;

  v0 = objc_alloc_init(REShortcutFilter);
  v1 = (void *)_shortcutFilter_Filter;
  _shortcutFilter_Filter = (uint64_t)v0;

}

- (void)_loadShortcutIdentifiersFromIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *appLevelIdentifier;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *eventLevelIdentifier;
  id v16;

  self->_filteredShortcutType = 1;
  v4 = a3;
  -[REDonatedAction _shortcutFilter](self, "_shortcutFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intentByFilteringIntent:withLevel:", v4, 1);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[REDonatedAction _shortcutFilter](self, "_shortcutFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intentByFilteringIntent:withLevel:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[REDonatedAction _shortcutFilter](self, "_shortcutFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDonatedAction bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifierForIntent:bundleIdentifier:", v16, v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  appLevelIdentifier = self->_appLevelIdentifier;
  self->_appLevelIdentifier = v10;

  -[REDonatedAction _shortcutFilter](self, "_shortcutFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDonatedAction bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifierForIntent:bundleIdentifier:", v7, v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  eventLevelIdentifier = self->_eventLevelIdentifier;
  self->_eventLevelIdentifier = v14;

}

- (void)_loadShortcutIdentifiersFromUserActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *appLevelIdentifier;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *eventLevelIdentifier;
  id v16;

  self->_filteredShortcutType = 1;
  v4 = a3;
  -[REDonatedAction _shortcutFilter](self, "_shortcutFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userActivityByFilteringUserActivity:withLevel:", v4, 1);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[REDonatedAction _shortcutFilter](self, "_shortcutFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userActivityByFilteringUserActivity:withLevel:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[REDonatedAction _shortcutFilter](self, "_shortcutFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDonatedAction bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifierForUserActivity:bundleIdentifier:", v16, v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  appLevelIdentifier = self->_appLevelIdentifier;
  self->_appLevelIdentifier = v10;

  -[REDonatedAction _shortcutFilter](self, "_shortcutFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDonatedAction bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifierForUserActivity:bundleIdentifier:", v7, v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  eventLevelIdentifier = self->_eventLevelIdentifier;
  self->_eventLevelIdentifier = v14;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[REDonatedAction type](self, "type");
  if (v5 > 2)
    v6 = &stru_24CF92178;
  else
    v6 = off_24CF905C0[v5];
  -[REDonatedAction bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDonatedAction identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@ %@ %@"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_hashRelevanceProviders:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 ^= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hash");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)identifier
{
  return -[REIdentifier identifier](self->_donationIdentifier, "identifier");
}

- (NSString)bundleIdentifier
{
  return -[REIdentifier dataSource](self->_donationIdentifier, "dataSource");
}

- (NSString)remoteBundleIdentifier
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[REDonatedAction isLocalDonation](self, "isLocalDonation");
  -[REDonatedAction bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    RERemoteApplicationIdentifierForLocalApplication(v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return (NSString *)v5;
}

- (NSString)localBundleIdentifier
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[REDonatedAction isLocalDonation](self, "isLocalDonation");
  -[REDonatedAction bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    RELocalApplicationIdentifierForRemoteApplication(v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return (NSString *)v5;
}

- (unint64_t)trainingActionIdentifier
{
  void *v2;
  unint64_t v3;

  if (self->_isIntentBacked)
    -[REDonatedAction simplifiedActionTypeIdentifier](self, "simplifiedActionTypeIdentifier");
  else
    -[REDonatedAction actionTypeIdentifier](self, "actionTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");

  return v3;
}

- (id)generateMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString **v13;
  __CFString *v14;
  objc_class *v15;
  void *v16;
  __CFString *v18;
  void *v19;
  __CFString **v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString **v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString **v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char isKindOfClass;
  __CFString *v48;
  char v49;
  __CFString *v50;
  __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  if (-[REDonatedAction type](self, "type") != 2)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDonatedAction event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relevantShortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "shortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "shortcut");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userActivity");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = CFSTR("none");
  v11 = v10;
  v56 = (void *)v9;
  if (v7)
  {
    objc_msgSend(v5, "watchTemplate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = REShortcutTypeIntent;
    if (v12)
      v13 = REShortcutTypeIntentWithTemplate;
    v14 = *v13;

    v55 = v14;
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("shortcutType"));
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("intentType"));

  }
  else
  {
    v18 = v10;
    if (v9)
    {
      objc_msgSend(v5, "watchTemplate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = REShortcutTypeActivity;
      if (v19)
        v20 = REShortcutTypeActivityWithTemplate;
      v18 = *v20;

    }
    v55 = v18;
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("shortcutType"));
  }
  v21 = v11;
  objc_msgSend(v5, "watchTemplate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v5, "watchTemplate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v21;
    if (!v24)
      goto LABEL_20;
    v26 = RESourceTemplate;
  }
  else
  {
    objc_msgSend(v7, "keyImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v26 = RESourceIntent;
    }
    else
    {
      objc_msgSend(v5, "shortcut");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "activityImage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v21;
      if (!v29)
        goto LABEL_20;
      v26 = RESourceActivity;
    }
  }
  v25 = *v26;

LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("imageSource"));
  v30 = v21;
  objc_msgSend(v5, "watchTemplate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = v7;
  if (v31)
  {
    objc_msgSend(v5, "watchTemplate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "subtitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = RESourceTemplate;
LABEL_27:
      v38 = *v34;

      v30 = v38;
    }
  }
  else
  {
    objc_msgSend(v7, "_subtitle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v34 = RESourceIntent;
      goto LABEL_27;
    }
    objc_msgSend(v5, "shortcut");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activitySubtitle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v34 = RESourceActivity;
      goto LABEL_27;
    }
  }
  v59 = v3;
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("subtitleSource"));
  v58 = v5;
  objc_msgSend(v5, "relevanceProviders");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v39, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v41 = v39;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v61;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v61 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v45);
        objc_opt_class();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v48 = CFSTR("date");
        if ((isKindOfClass & 1) != 0
          || (objc_opt_class(), v49 = objc_opt_isKindOfClass(), v48 = CFSTR("location"), (v49 & 1) != 0))
        {
LABEL_35:
          v50 = v48;
          if (v50)
          {
            v51 = v50;
            objc_msgSend(v40, "addObject:", v50);

          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v52 = objc_msgSend(v46, "situation");
            v48 = CFSTR("routineMorning");
            switch(v52)
            {
              case 0:
                goto LABEL_35;
              case 1:
                v48 = CFSTR("routineEvening");
                goto LABEL_35;
              case 2:
                v48 = CFSTR("routineHome");
                goto LABEL_35;
              case 3:
                v48 = CFSTR("routineWork");
                goto LABEL_35;
              case 4:
                v48 = CFSTR("routineSchool");
                goto LABEL_35;
              case 5:
                v48 = CFSTR("routineGym");
                goto LABEL_35;
              case 6:
                v48 = CFSTR("routineCommute");
                goto LABEL_35;
              case 7:
                v48 = CFSTR("routineHeadphones");
                goto LABEL_35;
              case 8:
                v48 = CFSTR("routineWorkout");
                goto LABEL_35;
              case 9:
                v48 = CFSTR("routineActivity");
                goto LABEL_35;
              default:
                break;
            }
          }
        }
        ++v45;
      }
      while (v43 != v45);
      v53 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      v43 = v53;
    }
    while (v53);
  }

  objc_msgSend(v59, "setObject:forKey:", v40, CFSTR("relevanceProvider"));
  v54 = (void *)objc_msgSend(v59, "copy");

  return v54;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REDonatedAction)initWithCoder:(id)a3
{
  id v4;
  REDonatedAction *v5;
  void *v6;
  void *v7;
  REIdentifier *v8;
  REIdentifier *donationIdentifier;
  uint64_t v10;
  NSDate *creationDate;
  uint64_t v12;
  NSDate *localSaveDate;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  REDonatedActionIdentifierProviding *actionTypeIdentifier;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  REDonatedActionIdentifierProviding *simplifiedActionTypeIdentifier;
  uint64_t v24;
  NSString *eventLevelIdentifier;
  uint64_t v26;
  NSString *appLevelIdentifier;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)REDonatedAction;
  v5 = -[REDonatedAction init](&v29, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[REIdentifier initWithDataSource:section:identifier:]([REIdentifier alloc], "initWithDataSource:section:identifier:", v6, &stru_24CF92178, v7);
    donationIdentifier = v5->_donationIdentifier;
    v5->_donationIdentifier = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localSaveDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    localSaveDate = v5->_localSaveDate;
    v5->_localSaveDate = (NSDate *)v12;

    v5->_localDonation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("localDonation"));
    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("actionTypeIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    actionTypeIdentifier = v5->_actionTypeIdentifier;
    v5->_actionTypeIdentifier = (REDonatedActionIdentifierProviding *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("simplifiedActionTypeIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    simplifiedActionTypeIdentifier = v5->_simplifiedActionTypeIdentifier;
    v5->_simplifiedActionTypeIdentifier = (REDonatedActionIdentifierProviding *)v22;

    v5->_isIntentBacked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isIntentBacked"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventLevelIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    eventLevelIdentifier = v5->_eventLevelIdentifier;
    v5->_eventLevelIdentifier = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appLevelIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    appLevelIdentifier = v5->_appLevelIdentifier;
    v5->_appLevelIdentifier = (NSString *)v26;

    v5->_filteredShortcutType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("filteredShortcutType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  void *v5;
  void *v6;
  id v7;

  type = self->_type;
  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", type, CFSTR("type"));
  -[REDonatedAction bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[REDonatedAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("identifier"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_localSaveDate, CFSTR("localSaveDate"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_localDonation, CFSTR("localDonation"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_actionTypeIdentifier, CFSTR("actionTypeIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_simplifiedActionTypeIdentifier, CFSTR("simplifiedActionTypeIdentifier"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isIntentBacked, CFSTR("isIntentBacked"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_eventLevelIdentifier, CFSTR("eventLevelIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_appLevelIdentifier, CFSTR("appLevelIdentifier"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_filteredShortcutType, CFSTR("filteredShortcutType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 16) = self->_type;
  objc_storeStrong((id *)(v4 + 40), self->_donationIdentifier);
  objc_storeStrong((id *)(v4 + 24), self->_creationDate);
  objc_storeStrong((id *)(v4 + 32), self->_localSaveDate);
  *(_BYTE *)(v4 + 9) = self->_localDonation;
  objc_storeStrong((id *)(v4 + 48), self->_actionTypeIdentifier);
  objc_storeStrong((id *)(v4 + 56), self->_simplifiedActionTypeIdentifier);
  *(_BYTE *)(v4 + 8) = self->_isIntentBacked;
  objc_storeStrong((id *)(v4 + 64), self->_eventLevelIdentifier);
  objc_storeStrong((id *)(v4 + 72), self->_appLevelIdentifier);
  *(_QWORD *)(v4 + 80) = self->_filteredShortcutType;
  return (id)v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)localSaveDate
{
  return self->_localSaveDate;
}

- (REIdentifier)donationIdentifier
{
  return self->_donationIdentifier;
}

- (REDonatedActionIdentifierProviding)actionTypeIdentifier
{
  return self->_actionTypeIdentifier;
}

- (REDonatedActionIdentifierProviding)simplifiedActionTypeIdentifier
{
  return self->_simplifiedActionTypeIdentifier;
}

- (BOOL)isLocalDonation
{
  return self->_localDonation;
}

- (NSString)eventLevelIdentifier
{
  return self->_eventLevelIdentifier;
}

- (NSString)appLevelIdentifier
{
  return self->_appLevelIdentifier;
}

- (unint64_t)filteredShortcutType
{
  return self->_filteredShortcutType;
}

- (_DKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (unint64_t)relevanceProvidersHash
{
  return self->_relevanceProvidersHash;
}

- (NSArray)relevanceProviders
{
  return self->_relevanceProviders;
}

- (NSString)intentTypeName
{
  return self->_intentTypeName;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_intentTypeName, 0);
  objc_storeStrong((id *)&self->_relevanceProviders, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_appLevelIdentifier, 0);
  objc_storeStrong((id *)&self->_eventLevelIdentifier, 0);
  objc_storeStrong((id *)&self->_simplifiedActionTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_actionTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_donationIdentifier, 0);
  objc_storeStrong((id *)&self->_localSaveDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)_loadDuetEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  if (_loadDuetEvent__onceToken != -1)
    dispatch_once(&_loadDuetEvent__onceToken, &__block_literal_global_87);
  objc_msgSend((id)_loadDuetEvent__QueuePool, "nextAvailableQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke_2;
  block[3] = &unk_24CF8AA00;
  block[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(v7, block);

}

void __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke()
{
  REDispatchQueuePool *v0;
  void *v1;

  v0 = -[REDispatchQueuePool initWithQueueCount:prefix:]([REDispatchQueuePool alloc], "initWithQueueCount:prefix:", 2, CFSTR("com.apple.RelevanceEngine.REDonatedActionEventLoader"));
  v1 = (void *)_loadDuetEvent__QueuePool;
  _loadDuetEvent__QueuePool = (uint64_t)v0;

}

void __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryForDuetEventWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke_3;
  v7[3] = &unk_24CF8D138;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "executeQuery:responseQueue:completion:", v4, v6, v7);

}

void __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  Class (*v11)(uint64_t);
  void *v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!CoreDuetLibraryCore_frameworkLibrary_2)
  {
    v10 = xmmword_24CF917E0;
    v11 = 0;
    CoreDuetLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (CoreDuetLibraryCore_frameworkLibrary_2)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2050000000;
    v4 = (void *)get_DKEventClass_softClass_0;
    v9 = get_DKEventClass_softClass_0;
    if (!get_DKEventClass_softClass_0)
    {
      *(_QWORD *)&v10 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v10 + 1) = 3221225472;
      v11 = __get_DKEventClass_block_invoke_0;
      v12 = &unk_24CF8AC38;
      v13 = &v6;
      __get_DKEventClass_block_invoke_0((uint64_t)&v10);
      v4 = (void *)v7[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v6, 8);
    objc_opt_isKindOfClass();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (void)loadUserActivity:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if (REProcessIsRelevanced())
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCA98], CFSTR("%s is not allowed from relevanced!"), v5, v6, v7, v8, v9, v10, (uint64_t)"-[REDonatedAction(LoadSiriAction) loadUserActivity:]");
      goto LABEL_12;
    }
    if (!CoreDuetLibraryCore_frameworkLibrary_2)
    {
      v14 = xmmword_24CF917E0;
      v15 = 0;
      CoreDuetLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    }
    if (!CoreDuetLibraryCore_frameworkLibrary_2)
    {
      RELogForDomain(15);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[REDonatedAction(LoadSiriAction) loadUserActivity:].cold.1();

      goto LABEL_12;
    }
    if (-[REDonatedAction type](self, "type"))
    {
LABEL_12:
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      goto LABEL_13;
    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke;
    v12[3] = &unk_24CF91798;
    v12[4] = self;
    v13 = v4;
    -[REDonatedAction _loadDuetEvent:](self, "_loadDuetEvent:", v12);

  }
LABEL_13:

}

void __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(get_DKApplicationActivityMetadataKeyClass_0(), "userActivityRequiredString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKApplicationActivityMetadataKeyClass_0(), "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1598]), "_initWithUserActivityStrings:secondaryString:optionalData:", v7, v9, 0);
    if (!v10)
    {
      RELogForDomain(15);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke_cold_2();

    }
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "interaction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v10);

  }
  else
  {
    RELogForDomain(15);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)loadIntent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if (REProcessIsRelevanced())
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCA98], CFSTR("%s is not allowed from relevanced!"), v5, v6, v7, v8, v9, v10, (uint64_t)"-[REDonatedAction(LoadSiriAction) loadIntent:]");
      goto LABEL_12;
    }
    if (!CoreDuetLibraryCore_frameworkLibrary_2)
    {
      v14 = xmmword_24CF917E0;
      v15 = 0;
      CoreDuetLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    }
    if (!CoreDuetLibraryCore_frameworkLibrary_2)
    {
      RELogForDomain(15);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[REDonatedAction(LoadSiriAction) loadUserActivity:].cold.1();

      goto LABEL_12;
    }
    if (-[REDonatedAction type](self, "type") != 1)
    {
LABEL_12:
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      goto LABEL_13;
    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke;
    v12[3] = &unk_24CF91798;
    v12[4] = self;
    v13 = v4;
    -[REDonatedAction _loadDuetEvent:](self, "_loadDuetEvent:", v12);

  }
LABEL_13:

}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint8_t v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v12 = (void *)get_DKIntentMetadataKeyClass_softClass_1;
    v32 = get_DKIntentMetadataKeyClass_softClass_1;
    if (!get_DKIntentMetadataKeyClass_softClass_1)
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __get_DKIntentMetadataKeyClass_block_invoke_1;
      v28[3] = &unk_24CF8AC38;
      v28[4] = &v29;
      __get_DKIntentMetadataKeyClass_block_invoke_1((uint64_t)v28, v4, v5, v6, v7, v8, v9, v10, v25);
      v12 = (void *)v30[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v29, 8);
    objc_msgSend(v13, "intentClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[RESiriActionsDonationsWhitelist sharedInstance](RESiriActionsDonationsWhitelist, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intentIsWhitelistedForBundleID:andTypeName:", v11, v16);

    if (v18)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_2;
      v26[3] = &unk_24CF917C0;
      v19 = *(void **)(a1 + 40);
      v26[4] = *(_QWORD *)(a1 + 32);
      v27 = v19;
      objc_msgSend(v3, "fetchInteractionWithPopulatedKeyImage:", v26);

    }
    else
    {
      objc_msgSend(v3, "interaction");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        RELogForDomain(15);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_cold_2((id *)(a1 + 32), v22);

      }
      v23 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v21, "intent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v23 + 16))(v23, v21, v24);

    }
  }
  else
  {
    RELogForDomain(15);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_cold_1(a1, v20);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (!v3)
  {
    RELogForDomain(15);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_2_cold_1();

  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v3, v6);

}

- (void)loadRelevantShortcut:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (v4)
  {
    if (REProcessIsRelevanced())
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCA98], CFSTR("%s is not allowed from relevanced!"), v5, v6, v7, v8, v9, v10, (uint64_t)"-[REDonatedAction(LoadSiriAction) loadRelevantShortcut:]");
LABEL_6:
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      goto LABEL_7;
    }
    if (-[REDonatedAction type](self, "type") != 2)
      goto LABEL_6;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke;
    v11[3] = &unk_24CF91798;
    v11[4] = self;
    v12 = v4;
    -[REDonatedAction _loadDuetEvent:](self, "_loadDuetEvent:", v11);

  }
LABEL_7:

}

void __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "relevantShortcut");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      RELogForDomain(15);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke_cold_2();

    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "interaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v5);

  }
  else
  {
    RELogForDomain(15);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (void)supportedActivityType:forBundleID:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_2132F7000, v0, OS_LOG_TYPE_ERROR, "Could not make bundle for %@ - %@", v1, 0x16u);
}

- (void)initWithEvent:filtered:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_2132F7000, v0, OS_LOG_TYPE_DEBUG, "Unsupported stream type: %@ (event: %@)", v1, 0x16u);
}

void __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_4();
  objc_msgSend((id)OUTLINED_FUNCTION_5_4(v1), "bundleIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_4(&dword_2132F7000, v3, v4, "Unable to load user activity (event) with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_4();
}

void __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_4();
  objc_msgSend((id)OUTLINED_FUNCTION_5_4(v1), "bundleIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_4(&dword_2132F7000, v3, v4, "Unable to load user activity with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_4();
}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_5(&dword_2132F7000, a2, v6, "Unable to load interaction event with bundle ID: %@ (%@)", v7);

  OUTLINED_FUNCTION_3_4();
}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_cold_2(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_5(&dword_2132F7000, a2, v6, "Unable to load interaction with bundle ID: %@ (%@)", v7);

  OUTLINED_FUNCTION_3_4();
}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_4();
  objc_msgSend((id)OUTLINED_FUNCTION_5_4(v1), "bundleIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_4(&dword_2132F7000, v3, v4, "Unable to load interaction with image with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_4();
}

void __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_4();
  objc_msgSend((id)OUTLINED_FUNCTION_5_4(v1), "bundleIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_4(&dword_2132F7000, v3, v4, "Unable to load relevant shortcut event with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_4();
}

void __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_4();
  objc_msgSend((id)OUTLINED_FUNCTION_5_4(v1), "bundleIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_4(&dword_2132F7000, v3, v4, "Unable to load relevant shortcut with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_4();
}

@end
