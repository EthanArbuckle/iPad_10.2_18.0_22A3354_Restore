@implementation SHSheetUIServiceClientContext

- (SHSheetUIServiceClientContext)initWithSession:(id)a3
{
  id v4;
  SHSheetUIServiceClientContext *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSArray *activityConfigurations;
  void *v15;
  uint64_t v16;
  NSArray *serializedMetadataValues;
  uint64_t v18;
  NSArray *metadataValues;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *urlRequests;
  void *v27;
  uint64_t v28;
  NSArray *urlSandboxExtensions;
  uint64_t v30;
  NSString *customOptionsTitle;
  uint64_t v32;
  NSAttributedString *customHeaderButtonTitle;
  uint64_t v34;
  UIColor *customHeaderButtonColor;
  uint64_t v36;
  NSString *topContentSectionText;
  uint64_t v38;
  NSArray *heroActionActivityTypes;
  uint64_t v40;
  NSArray *excludedActivityTypes;
  void *v42;
  uint64_t v43;
  NSArray *applicationActivityTypes;
  uint64_t v45;
  UIColor *tintColor;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSString *collaborationModeTitle;
  uint64_t v52;
  SLCollaborationFooterViewModel *collaborationFooterViewModel;
  uint64_t v54;
  RBSProcessIdentity *processIdentity;
  void *v56;
  uint64_t v57;
  NSNumber *customViewControllerVerticalInsetWrapper;
  void *v59;
  uint64_t v60;
  NSNumber *customViewControllerSectionHeightWrapper;
  objc_super v63;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)SHSheetUIServiceClientContext;
  v5 = -[SHSheetUIServiceClientContext init](&v63, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "activitiesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orderedActivities");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (v9)
      v11 = (void *)v9;
    v12 = v11;

    objc_msgSend(v4, "activityConfigurationsForActivities:forRemoteUIService:", v12, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    activityConfigurations = v5->_activityConfigurations;
    v5->_activityConfigurations = (NSArray *)v13;

    objc_msgSend(v4, "metadataCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loadedSerializedMetadatas");
    v16 = objc_claimAutoreleasedReturnValue();
    serializedMetadataValues = v5->_serializedMetadataValues;
    v5->_serializedMetadataValues = (NSArray *)v16;

    +[SHSheetUIServiceClientContext _deserializeMetadatas:](SHSheetUIServiceClientContext, "_deserializeMetadatas:", v5->_serializedMetadataValues);
    v18 = objc_claimAutoreleasedReturnValue();
    metadataValues = v5->_metadataValues;
    v5->_metadataValues = (NSArray *)v18;

    objc_msgSend(v4, "metadataCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "metadatas");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v4, "metadataCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "loadedMetadatas");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isLoadingMetadata = v23 == 0;

    }
    else
    {
      v5->_isLoadingMetadata = 0;
    }

    objc_msgSend(v4, "activityItemsManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "urlRequests");
    v25 = objc_claimAutoreleasedReturnValue();
    urlRequests = v5->_urlRequests;
    v5->_urlRequests = (NSArray *)v25;

    objc_msgSend(v4, "activityItemsManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "urlSandboxExtensions");
    v28 = objc_claimAutoreleasedReturnValue();
    urlSandboxExtensions = v5->_urlSandboxExtensions;
    v5->_urlSandboxExtensions = (NSArray *)v28;

    v5->_showOptions = objc_msgSend(v4, "showOptions");
    objc_msgSend(v4, "customOptionsTitle");
    v30 = objc_claimAutoreleasedReturnValue();
    customOptionsTitle = v5->_customOptionsTitle;
    v5->_customOptionsTitle = (NSString *)v30;

    v5->_showCustomHeaderButton = objc_msgSend(v4, "showSharePlayProminently");
    v5->_showHeaderSpecialization = objc_msgSend(v4, "showHeaderSpecialization");
    SHSheetCustomHeaderButtonTitle(objc_msgSend(v4, "showSharePlayProminently"));
    v32 = objc_claimAutoreleasedReturnValue();
    customHeaderButtonTitle = v5->_customHeaderButtonTitle;
    v5->_customHeaderButtonTitle = (NSAttributedString *)v32;

    SHSheetCustomHeaderButtonColor(objc_msgSend(v4, "showSharePlayProminently"));
    v34 = objc_claimAutoreleasedReturnValue();
    customHeaderButtonColor = v5->_customHeaderButtonColor;
    v5->_customHeaderButtonColor = (UIColor *)v34;

    v5->_isModeSwitchDisabled = objc_msgSend(v4, "isModeSwitchDisabled");
    v5->_isSharingExpanded = objc_msgSend(v4, "isExpanded");
    v5->_configureForCloudSharing = objc_msgSend(v4, "configureForCloudSharing");
    v5->_configureForPhotosEdit = objc_msgSend(v4, "configureForPhotosEdit");
    v5->_hideHeaderView = objc_msgSend(v4, "hideHeaderView");
    v5->_hideNavigationBar = objc_msgSend(v4, "hideNavigationBar");
    objc_msgSend(v4, "topContentSectionText");
    v36 = objc_claimAutoreleasedReturnValue();
    topContentSectionText = v5->_topContentSectionText;
    v5->_topContentSectionText = (NSString *)v36;

    objc_msgSend(v4, "heroActionActivityTypes");
    v38 = objc_claimAutoreleasedReturnValue();
    heroActionActivityTypes = v5->_heroActionActivityTypes;
    v5->_heroActionActivityTypes = (NSArray *)v38;

    objc_msgSend(v4, "excludedActivityTypes");
    v40 = objc_claimAutoreleasedReturnValue();
    excludedActivityTypes = v5->_excludedActivityTypes;
    v5->_excludedActivityTypes = (NSArray *)v40;

    objc_msgSend(v4, "activitiesManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "applicationActivityTypes");
    v43 = objc_claimAutoreleasedReturnValue();
    applicationActivityTypes = v5->_applicationActivityTypes;
    v5->_applicationActivityTypes = (NSArray *)v43;

    v5->_showHeroActionsHorizontally = objc_msgSend(v4, "showHeroActionsHorizontally");
    SHSheetTintColor();
    v45 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v45;

    v5->_supportsCollaboration = objc_msgSend(v4, "supportsCollaboration");
    v5->_supportsSendCopy = objc_msgSend(v4, "supportsSendCopy");
    v5->_isCollaborative = objc_msgSend(v4, "isCollaborative");
    objc_msgSend(v4, "collaborationItem");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      objc_msgSend(v47, "canAddPeople");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      SHSheetCollaborationModeTitle(v49);
      v50 = objc_claimAutoreleasedReturnValue();
      collaborationModeTitle = v5->_collaborationModeTitle;
      v5->_collaborationModeTitle = (NSString *)v50;

      objc_msgSend(v48, "createCollaborationFooterViewModel");
      v52 = objc_claimAutoreleasedReturnValue();
      collaborationFooterViewModel = v5->_collaborationFooterViewModel;
      v5->_collaborationFooterViewModel = (SLCollaborationFooterViewModel *)v52;

    }
    objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
    v54 = objc_claimAutoreleasedReturnValue();
    processIdentity = v5->_processIdentity;
    v5->_processIdentity = (RBSProcessIdentity *)v54;

    v5->_wantsCustomScene = objc_msgSend(v4, "showCustomScene");
    objc_msgSend(v4, "activityViewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "customViewControllerVerticalInsetWrapper");
    v57 = objc_claimAutoreleasedReturnValue();
    customViewControllerVerticalInsetWrapper = v5->_customViewControllerVerticalInsetWrapper;
    v5->_customViewControllerVerticalInsetWrapper = (NSNumber *)v57;

    objc_msgSend(v4, "activityViewController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "customViewControllerSectionHeightWrapper");
    v60 = objc_claimAutoreleasedReturnValue();
    customViewControllerSectionHeightWrapper = v5->_customViewControllerSectionHeightWrapper;
    v5->_customViewControllerSectionHeightWrapper = (NSNumber *)v60;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SHSheetUIServiceClientContext *v4;
  SHSheetUIServiceClientContext *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  int v51;
  _BOOL4 v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  _BOOL4 v68;
  _BOOL4 v69;
  _BOOL4 v70;
  _BOOL4 v71;
  _BOOL4 v72;
  id v73;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  _BOOL4 v87;
  void *v88;
  void *v89;
  id v90;
  _BOOL4 v91;
  _BOOL4 v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  _BOOL4 v99;
  void *v100;
  void *v101;
  int v102;
  id v103;
  int v104;
  void *v105;
  id v106;
  int v107;
  void *v108;
  id v109;
  int v110;
  void *v111;
  id v112;
  int v113;
  void *v114;
  id v115;
  void *v116;
  int v117;
  id v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  void *v130;

  v4 = (SHSheetUIServiceClientContext *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SHSheetUIServiceClientContext sessionIdentifier](self, "sessionIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext sessionIdentifier](v5, "sessionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          v12 = 0;
          v17 = v9;
          v15 = v8;
          goto LABEL_79;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
        {
          v12 = 0;
LABEL_80:

          goto LABEL_81;
        }
      }
      -[SHSheetUIServiceClientContext activityConfigurations](self, "activityConfigurations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext activityConfigurations](v5, "activityConfigurations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {

      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          v12 = 0;
          v23 = v16;
          v21 = v15;
LABEL_78:

          goto LABEL_79;
        }
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if (!v18)
        {
          v12 = 0;
LABEL_79:

          goto LABEL_80;
        }
      }
      -[SHSheetUIServiceClientContext metadataValues](self, "metadataValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext metadataValues](v5, "metadataValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {

      }
      else
      {
        if ((v21 == 0) == (v22 != 0))
        {
          v130 = v17;
          v12 = 0;
          v26 = v22;
          v27 = v21;
LABEL_77:

          v17 = v130;
          goto LABEL_78;
        }
        v24 = objc_msgSend(v21, "isEqual:", v22);

        if (!v24)
          goto LABEL_23;
      }
      v25 = -[SHSheetUIServiceClientContext isLoadingMetadata](self, "isLoadingMetadata");
      if (v25 != -[SHSheetUIServiceClientContext isLoadingMetadata](v5, "isLoadingMetadata"))
      {
LABEL_23:
        v12 = 0;
        goto LABEL_78;
      }
      v130 = v17;
      v128 = v23;
      -[SHSheetUIServiceClientContext urlRequests](self, "urlRequests");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext urlRequests](v5, "urlRequests");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v28;
      v30 = v29;
      v129 = v30;
      if (v27 == v30)
      {

      }
      else
      {
        v31 = v30;
        if ((v27 == 0) == (v30 != 0))
        {
          v12 = 0;
          v42 = v27;
          v23 = v128;
LABEL_75:

          goto LABEL_76;
        }
        v32 = v21;
        v33 = v30;
        v34 = objc_msgSend(v27, "isEqual:", v30);

        v21 = v32;
        if (!v34)
        {
          v12 = 0;
          v23 = v128;
LABEL_76:
          v26 = v129;
          goto LABEL_77;
        }
      }
      v127 = v27;
      -[SHSheetUIServiceClientContext urlSandboxExtensions](self, "urlSandboxExtensions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext urlSandboxExtensions](v5, "urlSandboxExtensions");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v35;
      v38 = v36;
      v125 = v38;
      v126 = v37;
      if (v37 == v38)
      {

      }
      else
      {
        v39 = v38;
        if ((v37 == 0) == (v38 != 0))
        {
          v12 = 0;
          v44 = v38;
          v45 = v37;
          v23 = v128;
LABEL_73:

          goto LABEL_74;
        }
        v40 = v37;
        v41 = objc_msgSend(v37, "isEqual:", v38);

        v27 = v127;
        if (!v41)
          goto LABEL_37;
      }
      v43 = -[SHSheetUIServiceClientContext showOptions](self, "showOptions");
      if (v43 != -[SHSheetUIServiceClientContext showOptions](v5, "showOptions"))
      {
LABEL_37:
        v12 = 0;
        v23 = v128;
LABEL_74:
        v31 = v125;
        v42 = v126;
        goto LABEL_75;
      }
      -[SHSheetUIServiceClientContext customOptionsTitle](self, "customOptionsTitle");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext customOptionsTitle](v5, "customOptionsTitle");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v46;
      v49 = v47;
      v45 = v48;
      v124 = v49;
      if (v48 == v49)
      {

        v27 = v127;
      }
      else
      {
        v50 = v49;
        if ((v45 == 0) == (v49 != 0))
        {
          v12 = 0;
          v54 = v49;
          v123 = v45;
          v27 = v127;
          v23 = v128;
LABEL_71:

          goto LABEL_72;
        }
        v51 = objc_msgSend(v45, "isEqual:", v49);

        v27 = v127;
        if (!v51)
        {
LABEL_46:
          v12 = 0;
          v23 = v128;
LABEL_72:
          v44 = v124;
          goto LABEL_73;
        }
      }
      v52 = -[SHSheetUIServiceClientContext showCustomHeaderButton](self, "showCustomHeaderButton");
      if (v52 != -[SHSheetUIServiceClientContext showCustomHeaderButton](v5, "showCustomHeaderButton"))
        goto LABEL_46;
      v53 = -[SHSheetUIServiceClientContext showHeaderSpecialization](self, "showHeaderSpecialization");
      if (v53 != -[SHSheetUIServiceClientContext showHeaderSpecialization](v5, "showHeaderSpecialization"))
        goto LABEL_46;
      v121 = v45;
      -[SHSheetUIServiceClientContext customHeaderButtonTitle](self, "customHeaderButtonTitle");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext customHeaderButtonTitle](v5, "customHeaderButtonTitle");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v55;
      v58 = v56;
      v122 = v58;
      v123 = v57;
      if (v57 == v58)
      {

      }
      else
      {
        v59 = v58;
        if ((v57 == 0) == (v58 != 0))
        {
          v12 = 0;
          v66 = v58;
          v120 = v57;
          v27 = v127;
          v23 = v128;
          v45 = v121;
LABEL_69:

          goto LABEL_70;
        }
        v60 = objc_msgSend(v57, "isEqual:", v58);

        if (!v60)
        {
          v12 = 0;
          v27 = v127;
          v23 = v128;
          v45 = v121;
LABEL_70:
          v54 = v122;
          goto LABEL_71;
        }
      }
      -[SHSheetUIServiceClientContext customHeaderButtonColor](self, "customHeaderButtonColor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext customHeaderButtonColor](v5, "customHeaderButtonColor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v61;
      v64 = v62;
      v119 = v64;
      v120 = v63;
      if (v63 == v64)
      {

      }
      else
      {
        v65 = v64;
        if ((v63 == 0) == (v64 != 0))
        {
          v12 = 0;
          v73 = v63;
LABEL_67:

          goto LABEL_68;
        }
        v117 = objc_msgSend(v63, "isEqual:", v64);

        if (!v117)
        {
LABEL_65:
          v12 = 0;
LABEL_68:
          v27 = v127;
          v23 = v128;
          v45 = v121;
          v66 = v119;
          goto LABEL_69;
        }
      }
      v67 = -[SHSheetUIServiceClientContext isModeSwitchDisabled](self, "isModeSwitchDisabled");
      if (v67 != -[SHSheetUIServiceClientContext isModeSwitchDisabled](v5, "isModeSwitchDisabled"))
        goto LABEL_65;
      v68 = -[SHSheetUIServiceClientContext isSharingExpanded](self, "isSharingExpanded");
      if (v68 != -[SHSheetUIServiceClientContext isSharingExpanded](v5, "isSharingExpanded"))
        goto LABEL_65;
      v69 = -[SHSheetUIServiceClientContext configureForCloudSharing](self, "configureForCloudSharing");
      if (v69 != -[SHSheetUIServiceClientContext configureForCloudSharing](v5, "configureForCloudSharing"))
        goto LABEL_65;
      v70 = -[SHSheetUIServiceClientContext configureForPhotosEdit](self, "configureForPhotosEdit");
      if (v70 != -[SHSheetUIServiceClientContext configureForPhotosEdit](v5, "configureForPhotosEdit"))
        goto LABEL_65;
      v71 = -[SHSheetUIServiceClientContext hideHeaderView](self, "hideHeaderView");
      if (v71 != -[SHSheetUIServiceClientContext hideHeaderView](v5, "hideHeaderView"))
        goto LABEL_65;
      v72 = -[SHSheetUIServiceClientContext hideNavigationBar](self, "hideNavigationBar");
      if (v72 != -[SHSheetUIServiceClientContext hideNavigationBar](v5, "hideNavigationBar"))
        goto LABEL_65;
      -[SHSheetUIServiceClientContext topContentSectionText](self, "topContentSectionText");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext topContentSectionText](v5, "topContentSectionText");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v75;
      v118 = v76;
      if (v73 == v118)
      {

      }
      else
      {
        if ((v73 == 0) == (v118 != 0))
        {
          v12 = 0;
          v116 = v73;

LABEL_126:
          goto LABEL_127;
        }
        v77 = objc_msgSend(v73, "isEqual:", v118);

        if (!v77)
        {
          v12 = 0;
LABEL_127:
          v65 = v118;
          goto LABEL_67;
        }
      }
      -[SHSheetUIServiceClientContext heroActionActivityTypes](self, "heroActionActivityTypes");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext heroActionActivityTypes](v5, "heroActionActivityTypes");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v78;
      v115 = v79;
      v116 = v80;
      if (v80 == v115)
      {

      }
      else
      {
        if ((v80 == 0) == (v115 != 0))
        {
          v12 = 0;
          v114 = v80;

LABEL_124:
          goto LABEL_125;
        }
        v113 = objc_msgSend(v80, "isEqual:", v115);

        if (!v113)
        {
          v12 = 0;
LABEL_125:

          goto LABEL_126;
        }
      }
      -[SHSheetUIServiceClientContext excludedActivityTypes](self, "excludedActivityTypes");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext excludedActivityTypes](v5, "excludedActivityTypes");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v81;
      v112 = v82;
      v114 = v83;
      if (v83 == v112)
      {

      }
      else
      {
        if ((v83 == 0) == (v112 != 0))
        {
          v12 = 0;
          v111 = v83;

LABEL_122:
          goto LABEL_123;
        }
        v110 = objc_msgSend(v83, "isEqual:", v112);

        if (!v110)
        {
          v12 = 0;
LABEL_123:

          goto LABEL_124;
        }
      }
      -[SHSheetUIServiceClientContext applicationActivityTypes](self, "applicationActivityTypes");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext applicationActivityTypes](v5, "applicationActivityTypes");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v84;
      v109 = v85;
      v111 = v86;
      if (v86 == v109)
      {

      }
      else
      {
        if ((v86 == 0) == (v109 != 0))
        {
          v12 = 0;
          v108 = v86;

LABEL_120:
          goto LABEL_121;
        }
        v107 = objc_msgSend(v86, "isEqual:", v109);

        if (!v107)
          goto LABEL_106;
      }
      v87 = -[SHSheetUIServiceClientContext showHeroActionsHorizontally](self, "showHeroActionsHorizontally");
      if (v87 != -[SHSheetUIServiceClientContext showHeroActionsHorizontally](v5, "showHeroActionsHorizontally"))
      {
LABEL_106:
        v12 = 0;
LABEL_121:

        goto LABEL_122;
      }
      -[SHSheetUIServiceClientContext tintColor](self, "tintColor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext tintColor](v5, "tintColor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v88;
      v106 = v89;
      v108 = v90;
      if (v90 == v106)
      {

      }
      else
      {
        if ((v90 == 0) == (v106 != 0))
        {
          v12 = 0;
          v94 = v90;
          v105 = v106;
LABEL_118:

          goto LABEL_119;
        }
        v104 = objc_msgSend(v90, "isEqual:", v106);

        if (!v104)
        {
LABEL_116:
          v12 = 0;
LABEL_119:

          goto LABEL_120;
        }
      }
      v91 = -[SHSheetUIServiceClientContext supportsCollaboration](self, "supportsCollaboration");
      if (v91 != -[SHSheetUIServiceClientContext supportsCollaboration](v5, "supportsCollaboration"))
        goto LABEL_116;
      v92 = -[SHSheetUIServiceClientContext supportsSendCopy](self, "supportsSendCopy");
      if (v92 != -[SHSheetUIServiceClientContext supportsSendCopy](v5, "supportsSendCopy"))
        goto LABEL_116;
      v93 = -[SHSheetUIServiceClientContext isCollaborative](self, "isCollaborative");
      if (v93 != -[SHSheetUIServiceClientContext isCollaborative](v5, "isCollaborative"))
        goto LABEL_116;
      -[SHSheetUIServiceClientContext collaborationModeTitle](self, "collaborationModeTitle");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext collaborationModeTitle](v5, "collaborationModeTitle");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v95;
      v98 = v96;
      v94 = v97;
      v105 = v98;
      if (v97 == v98)
      {

      }
      else
      {
        if ((v97 == 0) == (v98 != 0))
        {
          v12 = 0;

          goto LABEL_142;
        }
        v102 = objc_msgSend(v97, "isEqual:", v98);

        if (!v102)
          goto LABEL_134;
      }
      v99 = -[SHSheetUIServiceClientContext wantsCustomScene](self, "wantsCustomScene");
      if (v99 != -[SHSheetUIServiceClientContext wantsCustomScene](v5, "wantsCustomScene"))
      {
LABEL_134:
        v12 = 0;
        goto LABEL_118;
      }
      -[SHSheetUIServiceClientContext collaborationFooterViewModel](self, "collaborationFooterViewModel");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetUIServiceClientContext collaborationFooterViewModel](v5, "collaborationFooterViewModel");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v100;
      v103 = v101;
      if (v97 == v103)
      {
        v12 = 1;
      }
      else if ((v97 == 0) == (v103 != 0))
      {
        v12 = 0;
      }
      else
      {
        v12 = objc_msgSend(v97, "isEqual:", v103);
      }

LABEL_142:
      goto LABEL_118;
    }
    v12 = 0;
  }
LABEL_81:

  return v12;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
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
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[SHSheetUIServiceClientContext sessionIdentifier](self, "sessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v4, CFSTR("sessionIdentifier"));

  -[SHSheetUIServiceClientContext activityConfigurations](self, "activityConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeCollection:forKey:", v5, CFSTR("activityConfigurations"));

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext isSharingExpanded](self, "isSharingExpanded"), CFSTR("isSharingExpanded"));
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext configureForCloudSharing](self, "configureForCloudSharing"), CFSTR("configureForCloudSharing"));
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext configureForPhotosEdit](self, "configureForPhotosEdit"), CFSTR("configureForPhotosEdit"));
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext hideHeaderView](self, "hideHeaderView"), CFSTR("hideHeaderView"));
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext hideNavigationBar](self, "hideNavigationBar"), CFSTR("hideNavigationBar"));
  -[SHSheetUIServiceClientContext topContentSectionText](self, "topContentSectionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v6, CFSTR("topContentSectionText"));

  -[SHSheetUIServiceClientContext heroActionActivityTypes](self, "heroActionActivityTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v7, CFSTR("heroActionActivityTypes"));

  -[SHSheetUIServiceClientContext excludedActivityTypes](self, "excludedActivityTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v8, CFSTR("excludedActivityTypes"));

  -[SHSheetUIServiceClientContext applicationActivityTypes](self, "applicationActivityTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v9, CFSTR("applicationActivityTypes"));

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext showHeroActionsHorizontally](self, "showHeroActionsHorizontally"), CFSTR("showHeroActionsHorizontally"));
  -[SHSheetUIServiceClientContext tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v10, CFSTR("tintColor"));

  -[SHSheetUIServiceClientContext serializedMetadataValues](self, "serializedMetadataValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v11, CFSTR("serializedMetadataValues"));

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext isLoadingMetadata](self, "isLoadingMetadata"), CFSTR("isLoadingMetadata"));
  -[SHSheetUIServiceClientContext urlRequests](self, "urlRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v12, CFSTR("urlRequests"));

  -[SHSheetUIServiceClientContext urlSandboxExtensions](self, "urlSandboxExtensions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v13, CFSTR("urlSandboxExtensions"));

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext showOptions](self, "showOptions"), CFSTR("showOptions"));
  -[SHSheetUIServiceClientContext customOptionsTitle](self, "customOptionsTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v14, CFSTR("customOptionsTitle"));

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext showCustomHeaderButton](self, "showCustomHeaderButton"), CFSTR("showCustomHeaderButton"));
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext showHeaderSpecialization](self, "showHeaderSpecialization"), CFSTR("showHeaderSpecialization"));
  -[SHSheetUIServiceClientContext customHeaderButtonTitle](self, "customHeaderButtonTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v15, CFSTR("customHeaderButtonTitle"));

  -[SHSheetUIServiceClientContext customHeaderButtonColor](self, "customHeaderButtonColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v16, CFSTR("customHeaderButtonColor"));

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext isModeSwitchDisabled](self, "isModeSwitchDisabled"), CFSTR("isModeSwitchDisabled"));
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext supportsCollaboration](self, "supportsCollaboration"), CFSTR("supportsCollaboration"));
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext supportsSendCopy](self, "supportsSendCopy"), CFSTR("supportsSendCopy"));
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext isCollaborative](self, "isCollaborative"), CFSTR("isCollaborative"));
  -[SHSheetUIServiceClientContext collaborationModeTitle](self, "collaborationModeTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v17, CFSTR("collaborationModeTitle"));

  -[SHSheetUIServiceClientContext collaborationFooterViewModel](self, "collaborationFooterViewModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SHSheetUIServiceClientContext collaborationFooterViewModel](self, "collaborationFooterViewModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "encodeObject:forKey:", v19, CFSTR("collaborationFooterViewModel"));

  }
  -[SHSheetUIServiceClientContext processIdentity](self, "processIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v20, CFSTR("processIdentity"));

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext wantsCustomScene](self, "wantsCustomScene"), CFSTR("wantsCustomScene"));
  -[SHSheetUIServiceClientContext customViewControllerVerticalInsetWrapper](self, "customViewControllerVerticalInsetWrapper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v21, CFSTR("customViewControllerVerticalInsetWrapper"));

  -[SHSheetUIServiceClientContext customViewControllerSectionHeightWrapper](self, "customViewControllerSectionHeightWrapper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v22, CFSTR("customViewControllerSectionHeightWrapper"));

}

- (SHSheetUIServiceClientContext)initWithBSXPCCoder:(id)a3
{
  id v4;
  SHSheetUIServiceClientContext *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  uint64_t v9;
  NSArray *activityConfigurations;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *activitiesByUUID;
  uint64_t v21;
  NSString *topContentSectionText;
  uint64_t v23;
  uint64_t v24;
  NSArray *heroActionActivityTypes;
  uint64_t v26;
  uint64_t v27;
  NSArray *excludedActivityTypes;
  uint64_t v29;
  uint64_t v30;
  NSArray *applicationActivityTypes;
  uint64_t v32;
  UIColor *tintColor;
  uint64_t v34;
  uint64_t v35;
  NSArray *serializedMetadataValues;
  uint64_t v37;
  NSArray *metadataValues;
  uint64_t v39;
  uint64_t v40;
  NSArray *urlRequests;
  uint64_t v42;
  uint64_t v43;
  NSArray *urlSandboxExtensions;
  uint64_t v45;
  NSString *customOptionsTitle;
  uint64_t v47;
  NSAttributedString *customHeaderButtonTitle;
  uint64_t v49;
  UIColor *customHeaderButtonColor;
  uint64_t v51;
  NSString *collaborationModeTitle;
  void *v53;
  id v54;
  uint64_t v55;
  SLCollaborationFooterViewModel *collaborationFooterViewModel;
  uint64_t v57;
  RBSProcessIdentity *processIdentity;
  uint64_t v59;
  NSNumber *customViewControllerVerticalInsetWrapper;
  uint64_t v61;
  NSNumber *customViewControllerSectionHeightWrapper;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _QWORD v69[5];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)SHSheetUIServiceClientContext;
  v5 = -[SHSheetUIServiceClientContext init](&v68, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v8, objc_opt_class(), CFSTR("activityConfigurations"));
    v9 = objc_claimAutoreleasedReturnValue();
    activityConfigurations = v5->_activityConfigurations;
    v5->_activityConfigurations = (NSArray *)v9;

    +[SUIHostActivityProxy activitiesForConfigurations:](SUIHostActivityProxy, "activitiesForConfigurations:", v5->_activityConfigurations);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v65 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v17, "activityUUID", (_QWORD)v64);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v18);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      }
      while (v14);
    }

    v19 = objc_msgSend(v12, "copy");
    activitiesByUUID = v5->_activitiesByUUID;
    v5->_activitiesByUUID = (NSDictionary *)v19;

    v5->_isSharingExpanded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSharingExpanded"));
    v5->_configureForCloudSharing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("configureForCloudSharing"));
    v5->_configureForPhotosEdit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("configureForPhotosEdit"));
    v5->_hideHeaderView = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hideHeaderView"));
    v5->_hideNavigationBar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hideNavigationBar"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topContentSectionText"));
    v21 = objc_claimAutoreleasedReturnValue();
    topContentSectionText = v5->_topContentSectionText;
    v5->_topContentSectionText = (NSString *)v21;

    v23 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v23, objc_opt_class(), CFSTR("heroActionActivityTypes"));
    v24 = objc_claimAutoreleasedReturnValue();
    heroActionActivityTypes = v5->_heroActionActivityTypes;
    v5->_heroActionActivityTypes = (NSArray *)v24;

    v26 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v26, objc_opt_class(), CFSTR("excludedActivityTypes"));
    v27 = objc_claimAutoreleasedReturnValue();
    excludedActivityTypes = v5->_excludedActivityTypes;
    v5->_excludedActivityTypes = (NSArray *)v27;

    v29 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v29, objc_opt_class(), CFSTR("applicationActivityTypes"));
    v30 = objc_claimAutoreleasedReturnValue();
    applicationActivityTypes = v5->_applicationActivityTypes;
    v5->_applicationActivityTypes = (NSArray *)v30;

    v5->_showHeroActionsHorizontally = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showHeroActionsHorizontally"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v32 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v32;

    v34 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v34, objc_opt_class(), CFSTR("serializedMetadataValues"));
    v35 = objc_claimAutoreleasedReturnValue();
    serializedMetadataValues = v5->_serializedMetadataValues;
    v5->_serializedMetadataValues = (NSArray *)v35;

    +[SHSheetUIServiceClientContext _deserializeMetadatas:](SHSheetUIServiceClientContext, "_deserializeMetadatas:", v5->_serializedMetadataValues);
    v37 = objc_claimAutoreleasedReturnValue();
    metadataValues = v5->_metadataValues;
    v5->_metadataValues = (NSArray *)v37;

    v5->_isLoadingMetadata = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLoadingMetadata"));
    v39 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v39, objc_opt_class(), CFSTR("urlRequests"));
    v40 = objc_claimAutoreleasedReturnValue();
    urlRequests = v5->_urlRequests;
    v5->_urlRequests = (NSArray *)v40;

    v42 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v42, objc_opt_class(), CFSTR("urlSandboxExtensions"));
    v43 = objc_claimAutoreleasedReturnValue();
    urlSandboxExtensions = v5->_urlSandboxExtensions;
    v5->_urlSandboxExtensions = (NSArray *)v43;

    v5->_showOptions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showOptions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customOptionsTitle"));
    v45 = objc_claimAutoreleasedReturnValue();
    customOptionsTitle = v5->_customOptionsTitle;
    v5->_customOptionsTitle = (NSString *)v45;

    v5->_showCustomHeaderButton = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showCustomHeaderButton"));
    v5->_showHeaderSpecialization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showHeaderSpecialization"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customHeaderButtonTitle"));
    v47 = objc_claimAutoreleasedReturnValue();
    customHeaderButtonTitle = v5->_customHeaderButtonTitle;
    v5->_customHeaderButtonTitle = (NSAttributedString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customHeaderButtonColor"));
    v49 = objc_claimAutoreleasedReturnValue();
    customHeaderButtonColor = v5->_customHeaderButtonColor;
    v5->_customHeaderButtonColor = (UIColor *)v49;

    v5->_isModeSwitchDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isModeSwitchDisabled"));
    v5->_supportsCollaboration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsCollaboration"));
    v5->_supportsSendCopy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsSendCopy"));
    v5->_isCollaborative = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCollaborative"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collaborationModeTitle"));
    v51 = objc_claimAutoreleasedReturnValue();
    collaborationModeTitle = v5->_collaborationModeTitle;
    v5->_collaborationModeTitle = (NSString *)v51;

    if (v5->_supportsCollaboration)
    {
      v70 = 0;
      v71 = &v70;
      v72 = 0x2050000000;
      v53 = (void *)getSLCollaborationFooterViewModelClass_softClass;
      v73 = getSLCollaborationFooterViewModelClass_softClass;
      if (!getSLCollaborationFooterViewModelClass_softClass)
      {
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __getSLCollaborationFooterViewModelClass_block_invoke;
        v69[3] = &unk_1E4001370;
        v69[4] = &v70;
        __getSLCollaborationFooterViewModelClass_block_invoke((uint64_t)v69);
        v53 = (void *)v71[3];
      }
      v54 = objc_retainAutorelease(v53);
      _Block_object_dispose(&v70, 8);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v54, CFSTR("collaborationFooterViewModel"));
      v55 = objc_claimAutoreleasedReturnValue();
      collaborationFooterViewModel = v5->_collaborationFooterViewModel;
      v5->_collaborationFooterViewModel = (SLCollaborationFooterViewModel *)v55;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processIdentity"));
    v57 = objc_claimAutoreleasedReturnValue();
    processIdentity = v5->_processIdentity;
    v5->_processIdentity = (RBSProcessIdentity *)v57;

    v5->_wantsCustomScene = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsCustomScene"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customViewControllerVerticalInsetWrapper"));
    v59 = objc_claimAutoreleasedReturnValue();
    customViewControllerVerticalInsetWrapper = v5->_customViewControllerVerticalInsetWrapper;
    v5->_customViewControllerVerticalInsetWrapper = (NSNumber *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customViewControllerSectionHeightWrapper"));
    v61 = objc_claimAutoreleasedReturnValue();
    customViewControllerSectionHeightWrapper = v5->_customViewControllerSectionHeightWrapper;
    v5->_customViewControllerSectionHeightWrapper = (NSNumber *)v61;

  }
  return v5;
}

+ (id)_deserializeMetadatas:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t v24[128];
  __int128 buf;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v20 = 0;
        v21 = &v20;
        v22 = 0x2050000000;
        v10 = (void *)getLPLinkMetadataClass_softClass;
        v23 = getLPLinkMetadataClass_softClass;
        if (!getLPLinkMetadataClass_softClass)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v26 = __getLPLinkMetadataClass_block_invoke;
          v27 = &unk_1E4001370;
          v28 = &v20;
          __getLPLinkMetadataClass_block_invoke((uint64_t)&buf);
          v10 = (void *)v21[3];
        }
        v11 = objc_retainAutorelease(v10);
        _Block_object_dispose(&v20, 8);
        objc_msgSend(v11, "metadataWithDataRepresentationForLocalUseOnly:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          share_sheet_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_19E419000, v13, OS_LOG_TYPE_ERROR, "Failed to de-serialize metadata from data: %@", (uint8_t *)&buf, 0xCu);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (BOOL)hideHeaderView
{
  return self->_hideHeaderView;
}

- (BOOL)hideNavigationBar
{
  return self->_hideNavigationBar;
}

- (void)setHideNavigationBar:(BOOL)a3
{
  self->_hideNavigationBar = a3;
}

- (BOOL)isSharingExpanded
{
  return self->_isSharingExpanded;
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (NSString)topContentSectionText
{
  return self->_topContentSectionText;
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (NSArray)activityConfigurations
{
  return self->_activityConfigurations;
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (NSArray)metadataValues
{
  return self->_metadataValues;
}

- (BOOL)isLoadingMetadata
{
  return self->_isLoadingMetadata;
}

- (NSArray)urlRequests
{
  return self->_urlRequests;
}

- (NSArray)urlSandboxExtensions
{
  return self->_urlSandboxExtensions;
}

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (NSString)customOptionsTitle
{
  return self->_customOptionsTitle;
}

- (BOOL)showCustomHeaderButton
{
  return self->_showCustomHeaderButton;
}

- (BOOL)showHeaderSpecialization
{
  return self->_showHeaderSpecialization;
}

- (NSAttributedString)customHeaderButtonTitle
{
  return self->_customHeaderButtonTitle;
}

- (UIColor)customHeaderButtonColor
{
  return self->_customHeaderButtonColor;
}

- (BOOL)isModeSwitchDisabled
{
  return self->_isModeSwitchDisabled;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)supportsCollaboration
{
  return self->_supportsCollaboration;
}

- (BOOL)supportsSendCopy
{
  return self->_supportsSendCopy;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (NSString)collaborationModeTitle
{
  return self->_collaborationModeTitle;
}

- (SLCollaborationFooterViewModel)collaborationFooterViewModel
{
  return self->_collaborationFooterViewModel;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (BOOL)wantsCustomScene
{
  return self->_wantsCustomScene;
}

- (NSNumber)customViewControllerVerticalInsetWrapper
{
  return self->_customViewControllerVerticalInsetWrapper;
}

- (NSNumber)customViewControllerSectionHeightWrapper
{
  return self->_customViewControllerSectionHeightWrapper;
}

- (NSArray)serializedMetadataValues
{
  return self->_serializedMetadataValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedMetadataValues, 0);
  objc_storeStrong((id *)&self->_customViewControllerSectionHeightWrapper, 0);
  objc_storeStrong((id *)&self->_customViewControllerVerticalInsetWrapper, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_collaborationFooterViewModel, 0);
  objc_storeStrong((id *)&self->_collaborationModeTitle, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_customHeaderButtonColor, 0);
  objc_storeStrong((id *)&self->_customHeaderButtonTitle, 0);
  objc_storeStrong((id *)&self->_customOptionsTitle, 0);
  objc_storeStrong((id *)&self->_urlSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_urlRequests, 0);
  objc_storeStrong((id *)&self->_metadataValues, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_activityConfigurations, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
