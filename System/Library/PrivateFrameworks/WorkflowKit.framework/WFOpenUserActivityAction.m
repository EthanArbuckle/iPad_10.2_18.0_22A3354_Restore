@implementation WFOpenUserActivityAction

- (WFOpenUserActivityAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  WFOpenUserActivityAction *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  WFOpenUserActivityAction *v42;
  uint64_t v43;
  NSData *activityData;
  uint64_t v45;
  NSData *activityImageData;
  uint64_t v47;
  NSString *activitySubtitle;
  uint64_t v49;
  NSString *bundleIdentifier;
  uint64_t v51;
  NSString *launchOrigin;
  WFOpenUserActivityAction *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  objc_super v68;

  v67 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(a5, "mutableCopy");
  objc_msgSend(v9, "wf_popObjectForKey:", CFSTR("UserActivityData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "wf_popObjectForKey:", CFSTR("UserActivityImageData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "wf_popObjectForKey:", CFSTR("UserActivitySubtitle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  WFEnforceClass(v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "wf_popObjectForKey:", CFSTR("AppBundleIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_class();
  WFEnforceClass(v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "wf_popObjectForKey:", CFSTR("LaunchOrigin"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_class();
  WFEnforceClass(v22, v23);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "wf_popObjectForKey:", CFSTR("UserActivityDescriptor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  WFEnforceClass(v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();

  v63 = (void *)v26;
  if (!v12)
  {
    v28 = 0;
    v65 = 0;
    goto LABEL_13;
  }
  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v12);
  v28 = (void *)v27;
  if (v27 && v26)
  {
    v62 = v15;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDCD0]), "initWithSerializedRepresentation:", v26);
    objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "resolvedUserActivityMatchingDescriptor:", v29);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v65 = 0;
  if (v27 && !v26 && v21)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v21, 1, 0);
    if (!v29)
    {
      v65 = 0;
      goto LABEL_12;
    }
    v62 = v15;
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithApplicationRecord:", v29);
    v66 = objc_alloc(MEMORY[0x1E0CBDCD0]);
    objc_msgSend(v28, "activityType");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bundleIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "extensionBundleIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "counterpartIdentifiers");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "teamIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "supportedIntents");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bundleURL");
    v55 = v18;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v66, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", v61, v60, v59, v58, v57, v56, v31, v32);

    v18 = v55;
LABEL_11:

    v15 = v62;
LABEL_12:

  }
LABEL_13:
  objc_msgSend(v28, "activityType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v28, "activityType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpenUserActivityAction disabledPlatformsForUserActivityWithType:](self, "disabledPlatformsForUserActivityWithType:", v34);
    v35 = v12;
    v36 = self;
    v37 = v21;
    v38 = v18;
    v39 = v15;
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    WFInjectDisabledPlatformsInActionDefinition(v40, v8);
    v41 = objc_claimAutoreleasedReturnValue();

    v15 = v39;
    v18 = v38;
    v21 = v37;
    self = v36;
    v12 = v35;
    v8 = (id)v41;
  }
  v68.receiver = self;
  v68.super_class = (Class)WFOpenUserActivityAction;
  v42 = -[WFAction initWithIdentifier:definition:serializedParameters:](&v68, sel_initWithIdentifier_definition_serializedParameters_, v67, v8, v9);
  if (v42)
  {
    v43 = objc_msgSend(v12, "copy");
    activityData = v42->_activityData;
    v42->_activityData = (NSData *)v43;

    objc_storeStrong((id *)&v42->_userActivity, v28);
    v45 = objc_msgSend(v15, "copy");
    activityImageData = v42->_activityImageData;
    v42->_activityImageData = (NSData *)v45;

    v47 = objc_msgSend(v18, "copy");
    activitySubtitle = v42->_activitySubtitle;
    v42->_activitySubtitle = (NSString *)v47;

    v49 = objc_msgSend(v21, "copy");
    bundleIdentifier = v42->_bundleIdentifier;
    v42->_bundleIdentifier = (NSString *)v49;

    objc_storeStrong((id *)&v42->_descriptor, v65);
    v51 = objc_msgSend(v64, "copy");
    launchOrigin = v42->_launchOrigin;
    v42->_launchOrigin = (NSString *)v51;

    v53 = v42;
  }

  return v42;
}

- (id)serializedParameters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v14.receiver = self;
  v14.super_class = (Class)WFOpenUserActivityAction;
  -[WFAction serializedParameters](&v14, sel_serializedParameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  -[WFOpenUserActivityAction activityData](self, "activityData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("UserActivityData"));

  -[WFOpenUserActivityAction activityImageData](self, "activityImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("UserActivityImageData"));

  -[WFOpenUserActivityAction activitySubtitle](self, "activitySubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("UserActivitySubtitle"));

  -[WFOpenUserActivityAction bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("AppBundleIdentifier"));

  -[WFOpenUserActivityAction launchOrigin](self, "launchOrigin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("LaunchOrigin"));

  -[WFOpenUserActivityAction descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serializedRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("UserActivityDescriptor"));

  return v5;
}

- (NSString)associatedAppBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[WFOpenUserActivityAction descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)generateShortcutRepresentation:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[WFOpenUserActivityAction activityImageData](self, "activityImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x1E0CBD958];
    -[WFOpenUserActivityAction activityImageData](self, "activityImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithImageData:", v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  v8 = objc_alloc(MEMORY[0x1E0CBDBE8]);
  -[WFOpenUserActivityAction activityData](self, "activityData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOpenUserActivityAction activitySubtitle](self, "activitySubtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOpenUserActivityAction descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithActivityData:activityImage:activitySubtitle:activityBundleIdentifier:", v9, v14, v10, v12);
  v4[2](v4, v13, 0);

}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__WFOpenUserActivityAction_generateStandaloneShortcutRepresentation___block_invoke;
  v6[3] = &unk_1E7AECF30;
  v7 = v4;
  v5 = v4;
  -[WFOpenUserActivityAction generateShortcutRepresentation:](self, "generateShortcutRepresentation:", v6);

}

- (id)name
{
  return 0;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[WFOpenUserActivityAction userActivity](self, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFOpenUserActivityAction;
    -[WFAction localizedNameWithContext:](&v11, sel_localizedNameWithContext_, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[WFOpenUserActivityAction activityData](self, "activityData", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length")
    && (-[WFOpenUserActivityAction descriptor](self, "descriptor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v4);
    objc_msgSend(v6, "_setExecutionContext:", 7);
    -[WFAction userInterface](self, "userInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isRunningWithSiriUI");
    v9 = MEMORY[0x1E0C809B0];
    if ((v8 & 1) != 0)
    {
      -[WFAction userInterface](self, "userInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "executionContext");

      if (v11 <= 9 && ((1 << v11) & 0x206) != 0)
      {
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke;
        v17[3] = &unk_1E7AECF58;
        v17[4] = self;
        objc_msgSend(v6, "_createUserActivityDataWithOptions:completionHandler:", 0, v17);
      }
    }
    else
    {

    }
    v12 = objc_alloc(MEMORY[0x1E0D13E10]);
    -[WFOpenUserActivityAction descriptor](self, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:options:URL:userActivity:", v14, 0, 0, v6);

    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke_151;
    v16[3] = &unk_1E7AEE348;
    v16[4] = self;
    objc_msgSend(v15, "performWithCompletionHandler:", v16);

  }
  else
  {
    -[WFAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (id)appDescriptor
{
  void *v2;
  void *v3;

  -[WFOpenUserActivityAction descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDescriptor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_descriptor, a3);
  v5 = a3;
  objc_msgSend(v5, "serializedRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", v6, CFSTR("UserActivityDescriptor"));
}

- (void)updateAppDescriptorWithSelectedApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[WFOpenUserActivityAction descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorWithAppDescriptor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOpenUserActivityAction setDescriptor:](self, "setDescriptor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)WFOpenUserActivityAction;
  -[WFAction updateAppDescriptorWithSelectedApp:](&v7, sel_updateAppDescriptorWithSelectedApp_, v4);

}

- (void)updateAppDescriptorInDatabaseWithSelectedApp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[WFAction workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v15, "indexOfObject:", self);
  -[WFOpenUserActivityAction descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptorWithAppDescriptor:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction UUID](self, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction workflow](self, "workflow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workflowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateAppDescriptor:atKey:actionUUID:actionIndex:actionIdentifier:workflowID:error:", v8, CFSTR("UserActivityDescriptor"), v10, v11, v12, v14, 0);

}

- (BOOL)appResourceRequiresAppInstall
{
  return 1;
}

- (id)metricsIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WFAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOpenUserActivityAction userActivity](self, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_teamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOpenUserActivityAction userActivity](self, "userActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.%@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)disabledPlatformsForUserActivityWithType:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  int v26;
  void *v27;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (__CFString *)v5;
    if (v7 == CFSTR("com.apple.Safari.UserActivity.Bookmarks"))
      goto LABEL_20;
    v8 = v7;
    v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.Safari.UserActivity.Bookmarks"));

    if ((v9 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOpenUserActivityAction.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

  }
  v10 = (void *)*MEMORY[0x1E0CB3418];
  v11 = v6;
  v12 = v10;
  if (v12 == v11)
  {

  }
  else
  {
    v13 = v12;
    if (v11 && v12)
    {
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v14 & 1) != 0)
        goto LABEL_20;
    }
    else
    {

    }
    v15 = (__CFString *)v11;
    if (v15 != CFSTR("com.apple.Safari.UserActivity.ReadingList"))
    {
      if (!v6)
        goto LABEL_22;
      v16 = v15;
      v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("com.apple.Safari.UserActivity.ReadingList"));

      if ((v17 & 1) == 0)
      {
        v18 = v16;
        if (v18 != CFSTR("com.apple.calendar.continuity.event_selection"))
        {
          v19 = v18;
          v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("com.apple.calendar.continuity.event_selection"));

          if ((v20 & 1) == 0)
          {
            v21 = v19;
            if (v21 != CFSTR("com.apple.calendar.continuity.date_selection"))
            {
              v22 = v21;
              v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("com.apple.calendar.continuity.date_selection"));

              if ((v23 & 1) == 0)
              {
                v24 = v22;
                if (v24 != CFSTR("com.apple.mobileslideshow.album"))
                {
                  v25 = v24;
                  v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("com.apple.mobileslideshow.album"));

                  if (!v26)
                  {
LABEL_22:
                    v27 = (void *)MEMORY[0x1E0C9AA60];
                    goto LABEL_21;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_20:
  v30[0] = CFSTR("Watch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v27;
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  WFOpenUserActivityAction *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[WFOpenUserActivityAction appDescriptor](self, "appDescriptor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D13E00], "locationWithAppDescriptor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFSecurityLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315394;
      v9 = "-[WFOpenUserActivityAction contentDestinationWithError:]";
      v10 = 2114;
      v11 = self;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Could not get appDescriptor for user activity action: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a4;
  if (v7)
  {
    WFLocalizedString(CFSTR("Allow “%@” to share %@ with “%@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%@” to run actions from “%@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (INUserActivityDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NSString)launchOrigin
{
  return self->_launchOrigin;
}

- (void)setLaunchOrigin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSData)activityData
{
  return self->_activityData;
}

- (NSData)activityImageData
{
  return self->_activityImageData;
}

- (NSString)activitySubtitle
{
  return self->_activitySubtitle;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activitySubtitle, 0);
  objc_storeStrong((id *)&self->_activityImageData, 0);
  objc_storeStrong((id *)&self->_activityData, 0);
  objc_storeStrong((id *)&self->_launchOrigin, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

void __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0DC7D38]);
    objc_msgSend(*(id *)(a1 + 32), "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithUserActivityData:andBundleIdentifier:", v5, v8);

    objc_msgSend(*(id *)(a1 + 32), "userInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke_2;
    v13[3] = &unk_1E7AEF348;
    v13[4] = *(_QWORD *)(a1 + 32);
    LOBYTE(v8) = objc_msgSend(v10, "performSiriRequest:completionHandler:", v9, v13);

    if ((v8 & 1) == 0)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishRunningWithError:", v12);

    }
  }

}

uint64_t __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke_151(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishRunningWithError:", v5);

    v6 = v3;
  }
  else
  {

    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315394;
      v11 = "-[WFOpenUserActivityAction runAsynchronouslyWithInput:]_block_invoke_2";
      v12 = 2112;
      v13 = (id)objc_opt_class();
      v8 = v13;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v10, 0x16u);

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishRunningWithError:", v6);
  }

}

void __69__WFOpenUserActivityAction_generateStandaloneShortcutRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFStandaloneShortcutRepresentation *v4;

  v3 = a2;
  v4 = -[WFStandaloneShortcutRepresentation initWithINShortcut:]([WFStandaloneShortcutRepresentation alloc], "initWithINShortcut:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)userActivityActionWithShortcut:(id)a3 launchOrigin:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString **v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
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
  uint64_t v40;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "activityData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    if (a5)
    {
      v51 = *MEMORY[0x1E0CB2D68];
      v52[0] = CFSTR("Could not create action because the user activity data was empty");
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = (const __CFString **)v52;
      v14 = &v51;
LABEL_6:
      objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 5, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_7:
    v16 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v7, "userActivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(v7, "userActivity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interaction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_9;
    if (a5)
    {
      v49 = *MEMORY[0x1E0CB2D68];
      v50 = CFSTR("Could not create action because the user activity title was empty");
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = &v50;
      v14 = &v49;
      goto LABEL_6;
    }
    goto LABEL_7;
  }

LABEL_9:
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setValue:forKey:", v9, CFSTR("UserActivityData"));
  objc_msgSend(v7, "activityImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_imageData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v21, CFSTR("UserActivityImageData"));

  objc_msgSend(v7, "activitySubtitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v22, CFSTR("UserActivitySubtitle"));

  objc_msgSend(v7, "activityBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v23, CFSTR("AppBundleIdentifier"));

  objc_msgSend(v19, "setValue:forKey:", v8, CFSTR("LaunchOrigin"));
  v24 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(v7, "activityBundleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithBundleIdentifier:allowPlaceholder:error:", v25, 1, 0);

  if (v26)
  {
    v47 = v9;
    v48 = v8;
    v44 = v7;
    if (v9)
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v9);
    else
      v27 = 0;
    v45 = v27;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithApplicationRecord:", v26);
    v43 = objc_alloc(MEMORY[0x1E0CBDCD0]);
    objc_msgSend(v27, "activityType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extensionBundleIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "counterpartIdentifiers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "teamIdentifier");
    v46 = v26;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "supportedIntents");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bundleURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v43, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", v42, v29, v30, v31, v32, v33, v34, v35);

    v26 = v46;
    objc_msgSend(v36, "serializedRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setValue:forKey:", v37, CFSTR("UserActivityDescriptor"));

    v9 = v47;
    v8 = v48;
    v7 = v44;
  }
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.useractivity.open"), v19);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_opt_class();
  WFEnforceClass(v39, v40);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v16;
}

+ (void)createActionWithUserActivity:(id)a3 appBundleIdentifier:(id)a4 launchOrigin:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *, id);
  void *v13;
  void *v14;
  id v15;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, id))a6;
  if (objc_msgSend(v10, "length"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDBE8]), "initWithUserActivity:bundleIdentifier:", v9, v10);
    v16 = 0;
    +[WFOpenUserActivityAction userActivityActionWithShortcut:launchOrigin:error:](WFOpenUserActivityAction, "userActivityActionWithShortcut:launchOrigin:error:", v13, v11, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    v12[2](v12, v14, v15);

  }
  else
  {
    v12[2](v12, 0, 0);
  }

}

+ (void)createActionWithIntent:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFLOpenUserActivityAction.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intent"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFLOpenUserActivityAction.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithIntent:", v7);
  objc_msgSend(v7, "launchId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INExtractAppInfoFromSiriLaunchId();
  v12 = 0;

  objc_msgSend(a1, "createActionWithUserActivity:appBundleIdentifier:launchOrigin:completionHandler:", v10, v12, 0, v9);
}

@end
