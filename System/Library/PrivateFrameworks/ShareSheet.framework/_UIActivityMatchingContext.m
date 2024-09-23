@implementation _UIActivityMatchingContext

- (_UIActivityMatchingContext)initWithActivityItems:(id)a3 itemValues:(id)a4 collaborationItems:(id)a5
{
  id v8;
  _UIActivityMatchingContext *v9;
  uint64_t v10;
  NSArray *collaborationItems;

  v8 = a5;
  v9 = -[_UIActivityMatchingContext initWithActivityItems:itemValues:](self, "initWithActivityItems:itemValues:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    collaborationItems = v9->_collaborationItems;
    v9->_collaborationItems = (NSArray *)v10;

  }
  return v9;
}

- (_UIActivityMatchingContext)initWithActivityItems:(id)a3 itemValues:(id)a4
{
  id v7;
  id v8;
  _UIActivityMatchingContext *v9;
  _UIActivityMatchingContext *v10;
  objc_super v12[2];
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIActivityMatchingContext;
  v9 = -[_UIActivityMatchingContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityItems, a3);
    objc_storeStrong((id *)&v10->_activityItemValues, a4);
    v10->_allowMatchingBuiltInActivities = 1;
    v10->_canExcludeExtensionActivities = 0;
    memset(v12, 0, sizeof(v12));
    _SharingUIAuditTokenForCurrentProcess((uint64_t)v12);
    -[_UIActivityMatchingContext setHostAuditToken:](v10, "setHostAuditToken:", v12);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIActivityMatchingContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIActivityMatchingContext *v10;
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
  NSData *hostAuditTokenData;
  void *v28;

  v5 = [_UIActivityMatchingContext alloc];
  -[_UIActivityMatchingContext activityItems](self, "activityItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[_UIActivityMatchingContext activityItemValues](self, "activityItemValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = -[_UIActivityMatchingContext initWithActivityItems:itemValues:](v5, "initWithActivityItems:itemValues:", v7, v9);

  -[_UIActivityMatchingContext activityItemValueClasses](self, "activityItemValueClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  -[_UIActivityMatchingContext setActivityItemValueClasses:](v10, "setActivityItemValueClasses:", v12);

  -[_UIActivityMatchingContext activityItemValueExtensionMatchingDictionaries](self, "activityItemValueExtensionMatchingDictionaries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  -[_UIActivityMatchingContext setActivityItemValueExtensionMatchingDictionaries:](v10, "setActivityItemValueExtensionMatchingDictionaries:", v14);

  -[_UIActivityMatchingContext setAllowMatchingBuiltInActivities:](v10, "setAllowMatchingBuiltInActivities:", -[_UIActivityMatchingContext allowMatchingBuiltInActivities](self, "allowMatchingBuiltInActivities"));
  -[_UIActivityMatchingContext setAllowMatchingExtensionActivities:](v10, "setAllowMatchingExtensionActivities:", -[_UIActivityMatchingContext allowMatchingExtensionActivities](self, "allowMatchingExtensionActivities"));
  -[_UIActivityMatchingContext externalMatchBuiltinOrderedActivities](self, "externalMatchBuiltinOrderedActivities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setExternalMatchBuiltinOrderedActivities:](v10, "setExternalMatchBuiltinOrderedActivities:", v15);

  -[_UIActivityMatchingContext activityTypesGeneratedByDelegate](self, "activityTypesGeneratedByDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setActivityTypesGeneratedByDelegate:](v10, "setActivityTypesGeneratedByDelegate:", v16);

  -[_UIActivityMatchingContext setIsContentManaged:](v10, "setIsContentManaged:", -[_UIActivityMatchingContext isContentManaged](self, "isContentManaged"));
  -[_UIActivityMatchingContext setIsCollaborative:](v10, "setIsCollaborative:", -[_UIActivityMatchingContext isCollaborative](self, "isCollaborative"));
  -[_UIActivityMatchingContext setShouldMatchOnlyUserElectedExtensions:](v10, "setShouldMatchOnlyUserElectedExtensions:", -[_UIActivityMatchingContext shouldMatchOnlyUserElectedExtensions](self, "shouldMatchOnlyUserElectedExtensions"));
  -[_UIActivityMatchingContext setShouldExcludeiCloudAddToDriveActivity:](v10, "setShouldExcludeiCloudAddToDriveActivity:", -[_UIActivityMatchingContext shouldExcludeiCloudAddToDriveActivity](self, "shouldExcludeiCloudAddToDriveActivity"));
  -[_UIActivityMatchingContext setShouldExcludeiCloudSharingActivity:](v10, "setShouldExcludeiCloudSharingActivity:", -[_UIActivityMatchingContext shouldExcludeiCloudSharingActivity](self, "shouldExcludeiCloudSharingActivity"));
  -[_UIActivityMatchingContext setCanExcludeExtensionActivities:](v10, "setCanExcludeExtensionActivities:", -[_UIActivityMatchingContext canExcludeExtensionActivities](self, "canExcludeExtensionActivities"));
  -[_UIActivityMatchingContext setWhitelistActionActivitiesOnly:](v10, "setWhitelistActionActivitiesOnly:", -[_UIActivityMatchingContext whitelistActionActivitiesOnly](self, "whitelistActionActivitiesOnly"));
  -[_UIActivityMatchingContext activityTypeOrder](self, "activityTypeOrder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copyWithZone:", a3);
  -[_UIActivityMatchingContext setActivityTypeOrder:](v10, "setActivityTypeOrder:", v18);

  -[_UIActivityMatchingContext includedActivityTypes](self, "includedActivityTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copyWithZone:", a3);
  -[_UIActivityMatchingContext setIncludedActivityTypes:](v10, "setIncludedActivityTypes:", v20);

  -[_UIActivityMatchingContext excludedActivityTypes](self, "excludedActivityTypes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copyWithZone:", a3);
  -[_UIActivityMatchingContext setExcludedActivityTypes:](v10, "setExcludedActivityTypes:", v22);

  -[_UIActivityMatchingContext setExcludedActivityCategories:](v10, "setExcludedActivityCategories:", -[_UIActivityMatchingContext excludedActivityCategories](self, "excludedActivityCategories"));
  -[_UIActivityMatchingContext setSharingStyle:](v10, "setSharingStyle:", -[_UIActivityMatchingContext sharingStyle](self, "sharingStyle"));
  -[_UIActivityMatchingContext currentlySelectedActivity](self, "currentlySelectedActivity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setCurrentlySelectedActivity:](v10, "setCurrentlySelectedActivity:", v23);

  -[_UIActivityMatchingContext applicationActivities](self, "applicationActivities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  -[_UIActivityMatchingContext setApplicationActivities:](v10, "setApplicationActivities:", v25);

  -[_UIActivityMatchingContext hostAuditTokenData](self, "hostAuditTokenData");
  v26 = objc_claimAutoreleasedReturnValue();
  hostAuditTokenData = v10->_hostAuditTokenData;
  v10->_hostAuditTokenData = (NSData *)v26;

  -[_UIActivityMatchingContext prematchedExtensionActivities](self, "prematchedExtensionActivities");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setPrematchedExtensionActivities:](v10, "setPrematchedExtensionActivities:", v28);

  return v10;
}

- (id)description
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  id v29;

  v23 = objc_opt_class();
  NSAppendPrintF();
  v29 = 0;
  -[_UIActivityMatchingContext activityItemValueClasses](self, "activityItemValueClasses", v23, self);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v3 = v29;

  if (-[_UIActivityMatchingContext allowMatchingBuiltInActivities](self, "allowMatchingBuiltInActivities", v24))
  {
    NSAppendPrintF();
    v4 = v3;

    v3 = v4;
  }
  if (-[_UIActivityMatchingContext allowMatchingExtensionActivities](self, "allowMatchingExtensionActivities"))
  {
    NSAppendPrintF();
    v5 = v3;

    v3 = v5;
  }
  if (-[_UIActivityMatchingContext isContentManaged](self, "isContentManaged"))
  {
    NSAppendPrintF();
    v6 = v3;

    v3 = v6;
  }
  if (-[_UIActivityMatchingContext isCollaborative](self, "isCollaborative"))
  {
    NSAppendPrintF();
    v7 = v3;

    v3 = v7;
  }
  if (-[_UIActivityMatchingContext shouldMatchOnlyUserElectedExtensions](self, "shouldMatchOnlyUserElectedExtensions"))
  {
    NSAppendPrintF();
    v8 = v3;

    v3 = v8;
  }
  if (-[_UIActivityMatchingContext shouldExcludeiCloudAddToDriveActivity](self, "shouldExcludeiCloudAddToDriveActivity"))
  {
    NSAppendPrintF();
    v9 = v3;

    v3 = v9;
  }
  if (-[_UIActivityMatchingContext shouldExcludeiCloudSharingActivity](self, "shouldExcludeiCloudSharingActivity"))
  {
    NSAppendPrintF();
    v10 = v3;

    v3 = v10;
  }
  if (-[_UIActivityMatchingContext canExcludeExtensionActivities](self, "canExcludeExtensionActivities"))
  {
    NSAppendPrintF();
    v11 = v3;

    v3 = v11;
  }
  if (-[_UIActivityMatchingContext whitelistActionActivitiesOnly](self, "whitelistActionActivitiesOnly"))
  {
    NSAppendPrintF();
    v12 = v3;

    v3 = v12;
  }
  -[_UIActivityMatchingContext includedActivityTypes](self, "includedActivityTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[_UIActivityMatchingContext includedActivityTypes](self, "includedActivityTypes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v15 = v3;

    v3 = v15;
  }
  -[_UIActivityMatchingContext excludedActivityTypes](self, "excludedActivityTypes", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    -[_UIActivityMatchingContext excludedActivityTypes](self, "excludedActivityTypes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v18 = v3;

    v3 = v18;
  }
  if (-[_UIActivityMatchingContext excludedActivityCategories](self, "excludedActivityCategories", v26))
  {
    v27 = -[_UIActivityMatchingContext excludedActivityCategories](self, "excludedActivityCategories");
    NSAppendPrintF();
    v19 = v3;

    v3 = v19;
  }
  -[_UIActivityMatchingContext activityItemValueExtensionMatchingDictionaries](self, "activityItemValueExtensionMatchingDictionaries", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v20 = v3;

  NSAppendPrintF();
  v21 = v20;

  return v21;
}

- (BOOL)shouldExcludeActivity:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  BOOL v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Share")))
  {
    v6 = -[_UIActivityMatchingContext sharingStyle](self, "sharingStyle");

    if (v6 != 1)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v4, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.UIKit.activity.CloudSharing")))
  {
    v8 = -[_UIActivityMatchingContext shouldExcludeiCloudSharingActivity](self, "shouldExcludeiCloudSharingActivity");

    if (v8)
    {
LABEL_7:
      v9 = 1;
      goto LABEL_14;
    }
  }
  else
  {

  }
  -[_UIActivityMatchingContext excludedActivityTypes](self, "excludedActivityTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", v11) & 1) != 0
    || (v12 = 1 << objc_msgSend((id)objc_opt_class(), "activityCategory"),
        (-[_UIActivityMatchingContext excludedActivityCategories](self, "excludedActivityCategories") & v12) != 0))
  {
    v9 = objc_msgSend(v4, "_canBeExcludeWhenMatchingWithContext:", self);
  }
  else
  {
    v9 = 0;
  }

LABEL_14:
  return v9;
}

- (id)activitiesByFilteringExcludedActivities:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70___UIActivityMatchingContext_activitiesByFilteringExcludedActivities___block_invoke;
  v7[3] = &unk_1E4003270;
  v7[4] = self;
  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setHostAuditToken:(id *)a3
{
  NSData *v4;
  NSData *hostAuditTokenData;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 32);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    hostAuditTokenData = self->_hostAuditTokenData;
    self->_hostAuditTokenData = v4;
  }
  else
  {
    hostAuditTokenData = self->_hostAuditTokenData;
    self->_hostAuditTokenData = 0;
  }

}

- (const)hostAuditToken
{
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)-[NSData bytes](self->_hostAuditTokenData, "bytes");
}

- (NSString)sourceApplicationIdentifier
{
  void *v2;
  void *v3;

  if (-[_UIActivityMatchingContext hostAuditToken](self, "hostAuditToken"))
  {
    _ShareSheetBundleIDFromAuditToken();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v2;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (NSArray)activityItemValues
{
  return self->_activityItemValues;
}

- (NSArray)collaborationItems
{
  return self->_collaborationItems;
}

- (NSArray)activityItemValueClasses
{
  return self->_activityItemValueClasses;
}

- (void)setActivityItemValueClasses:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemValueClasses, a3);
}

- (NSArray)activityItemValueExtensionMatchingDictionaries
{
  return self->_activityItemValueExtensionMatchingDictionaries;
}

- (void)setActivityItemValueExtensionMatchingDictionaries:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemValueExtensionMatchingDictionaries, a3);
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)shouldMatchOnlyUserElectedExtensions
{
  return self->_shouldMatchOnlyUserElectedExtensions;
}

- (void)setShouldMatchOnlyUserElectedExtensions:(BOOL)a3
{
  self->_shouldMatchOnlyUserElectedExtensions = a3;
}

- (BOOL)shouldExcludeiCloudAddToDriveActivity
{
  return self->_shouldExcludeiCloudAddToDriveActivity;
}

- (void)setShouldExcludeiCloudAddToDriveActivity:(BOOL)a3
{
  self->_shouldExcludeiCloudAddToDriveActivity = a3;
}

- (BOOL)shouldExcludeiCloudSharingActivity
{
  return self->_shouldExcludeiCloudSharingActivity;
}

- (void)setShouldExcludeiCloudSharingActivity:(BOOL)a3
{
  self->_shouldExcludeiCloudSharingActivity = a3;
}

- (BOOL)canExcludeExtensionActivities
{
  return self->_canExcludeExtensionActivities;
}

- (void)setCanExcludeExtensionActivities:(BOOL)a3
{
  self->_canExcludeExtensionActivities = a3;
}

- (BOOL)whitelistActionActivitiesOnly
{
  return self->_whitelistActionActivitiesOnly;
}

- (void)setWhitelistActionActivitiesOnly:(BOOL)a3
{
  self->_whitelistActionActivitiesOnly = a3;
}

- (BOOL)showSharePlayProminently
{
  return self->_showSharePlayProminently;
}

- (void)setShowSharePlayProminently:(BOOL)a3
{
  self->_showSharePlayProminently = a3;
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
  objc_storeStrong((id *)&self->_activityTypeOrder, a3);
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_includedActivityTypes, a3);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_excludedActivityTypes, a3);
}

- (int64_t)excludedActivityCategories
{
  return self->_excludedActivityCategories;
}

- (void)setExcludedActivityCategories:(int64_t)a3
{
  self->_excludedActivityCategories = a3;
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (UIActivity)currentlySelectedActivity
{
  return self->_currentlySelectedActivity;
}

- (void)setCurrentlySelectedActivity:(id)a3
{
  objc_storeStrong((id *)&self->_currentlySelectedActivity, a3);
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
  objc_storeStrong((id *)&self->_applicationActivities, a3);
}

- (NSArray)prematchedExtensionActivities
{
  return self->_prematchedExtensionActivities;
}

- (void)setPrematchedExtensionActivities:(id)a3
{
  objc_storeStrong((id *)&self->_prematchedExtensionActivities, a3);
}

- (NSData)hostAuditTokenData
{
  return self->_hostAuditTokenData;
}

- (BOOL)allowMatchingBuiltInActivities
{
  return self->_allowMatchingBuiltInActivities;
}

- (void)setAllowMatchingBuiltInActivities:(BOOL)a3
{
  self->_allowMatchingBuiltInActivities = a3;
}

- (BOOL)allowMatchingExtensionActivities
{
  return self->_allowMatchingExtensionActivities;
}

- (void)setAllowMatchingExtensionActivities:(BOOL)a3
{
  self->_allowMatchingExtensionActivities = a3;
}

- (NSArray)externalMatchBuiltinOrderedActivities
{
  return self->_externalMatchBuiltinOrderedActivities;
}

- (void)setExternalMatchBuiltinOrderedActivities:(id)a3
{
  objc_storeStrong((id *)&self->_externalMatchBuiltinOrderedActivities, a3);
}

- (NSArray)activityTypesGeneratedByDelegate
{
  return self->_activityTypesGeneratedByDelegate;
}

- (void)setActivityTypesGeneratedByDelegate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypesGeneratedByDelegate, 0);
  objc_storeStrong((id *)&self->_externalMatchBuiltinOrderedActivities, 0);
  objc_storeStrong((id *)&self->_prematchedExtensionActivities, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_currentlySelectedActivity, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_activityItemValueExtensionMatchingDictionaries, 0);
  objc_storeStrong((id *)&self->_activityItemValueClasses, 0);
  objc_storeStrong((id *)&self->_collaborationItems, 0);
  objc_storeStrong((id *)&self->_activityItemValues, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong((id *)&self->_hostAuditTokenData, 0);
}

@end
