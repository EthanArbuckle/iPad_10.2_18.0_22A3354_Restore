@implementation PBFModalRootViewController

- (PBFModalRootViewController)initWithScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PBFModalRootViewController *v8;

  v4 = a3;
  +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:](self, "initWithScene:dataStore:behaviorAssertionProvider:", v4, v6, v7);

  return v8;
}

- (PBFModalRootViewController)initWithScene:(id)a3 dataStore:(id)a4 behaviorAssertionProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PBFModalRootViewController *v16;
  PBFModalRootViewController *v17;
  UIScene *parentScene;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  NSClassFromString(CFSTR("UIScene"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA492C0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:UISceneClass]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA49324);
  }

  v13 = v10;
  NSClassFromString(CFSTR("PBFPosterExtensionDataStore"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:].cold.2();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA49388);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterExtensionDataStoreClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:].cold.2();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA493ECLL);
  }

  v14 = v11;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:].cold.3();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA49450);
  }
  v15 = v14;
  if ((objc_msgSend(v14, "conformsToProtocol:", &unk_1EF9CF080) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFBehaviorAssertionProviding)]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:].cold.3();
    goto LABEL_27;
  }

  v28.receiver = self;
  v28.super_class = (Class)PBFModalRootViewController;
  v16 = -[PBFModalRootViewController initWithNibName:bundle:](&v28, sel_initWithNibName_bundle_, 0, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parentScene, a3);
    parentScene = v17->_parentScene;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScene _registerSceneComponent:forKey:](parentScene, "_registerSceneComponent:forKey:", v17, v20);

    objc_storeStrong((id *)&v17->_dataStore, a4);
    objc_storeStrong((id *)&v17->_behaviorAssertionProvider, a5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v17, sel_dataStoreDidTearDown_, PBFPosterExtensionDataStoreDidTearDownNotification, 0);

  }
  return v17;
}

- (void)invalidate
{
  UIScene *parentScene;
  objc_class *v4;
  void *v5;
  UIScene *v6;
  id v7;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[UIViewController dismissPresentedViewControllersAnimated:dismissHandler:completion:](self, "dismissPresentedViewControllersAnimated:dismissHandler:completion:", 0, 0, 0);
    -[PBFModalRootViewController ambientEditingController](self, "ambientEditingController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");
    -[PBFModalRootViewController setAmbientEditingController:](self, "setAmbientEditingController:", 0);
    parentScene = self->_parentScene;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScene _unregisterSceneComponentForKey:](parentScene, "_unregisterSceneComponentForKey:", v5);

    v6 = self->_parentScene;
    self->_parentScene = 0;

  }
}

+ (void)prewarmTopButtonLayout
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PBFModalRootViewController prewarmTopButtonLayout]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PBFModalRootViewController_prewarmTopButtonLayout__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a1;
  PBFDispatchAsyncWithString(v3, QOS_CLASS_UTILITY, v4);

}

uint64_t __52__PBFModalRootViewController_prewarmTopButtonLayout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_topButtonLayout");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBFModalRootViewController;
  -[PBFModalRootViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PBFModalRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  BSInvalidatable *v4;
  BSInvalidatable *snapshotterInUseAssertion;
  void *v6;
  void *v7;
  void *v8;
  PRUISModalEntryPoint *v9;
  PRUISModalEntryPoint *entryPoint;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  PRUISModalEntryPoint *v15;
  PBFFocusPosterSelectionViewController *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PBFPosterSelectionViewController *v24;
  PRUISModalEntryPoint *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  PBFActivePosterConfigurationFilter *v35;
  void *v36;
  void *v37;
  PRUISModalEntryPoint *v38;
  id v39;
  void *v40;
  void *v41;
  PBFSinglePosterConfigurationFilter *v42;
  void *v43;
  void *v44;
  PBFAmbientEditingCollectionViewController *v45;
  PRUISModalEntryPoint *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL8 IsReduceMotionEnabled;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)PBFModalRootViewController;
  -[PBFModalRootViewController viewDidAppear:](&v70, sel_viewDidAppear_, a3);
  if (!self->_didAppearOnce)
  {
    if (!self->_snapshotterInUseAssertion)
    {
      -[PBFBehaviorAssertionProviding acquireSnapshotterInUseAssertionWithReason:](self->_behaviorAssertionProvider, "acquireSnapshotterInUseAssertionWithReason:", CFSTR("modal presentation"));
      v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      snapshotterInUseAssertion = self->_snapshotterInUseAssertion;
      self->_snapshotterInUseAssertion = v4;

    }
    self->_didAppearOnce = 1;
    -[UIScene _FBSScene](self->_parentScene, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "otherSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForSetting:", 2606278161);
    v9 = (PRUISModalEntryPoint *)objc_claimAutoreleasedReturnValue();
    entryPoint = self->_entryPoint;
    self->_entryPoint = v9;

    v11 = objc_msgSend(v8, "BOOLForSetting:", 2606278162);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[PBFModalRootViewController _setupGalleryDataProviderIfNeeded](self, "_setupGalleryDataProviderIfNeeded");
      -[PBFModalRootViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_rootSheetPresentationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setShouldScaleDownBehindDescendantSheets:", 0);

      v15 = self->_entryPoint;
      v16 = [PBFFocusPosterSelectionViewController alloc];
      -[PRUISModalEntryPoint activityUUID](v15, "activityUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRUISModalEntryPoint activityIdentifier](v15, "activityIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:](v16, "initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:", v17, v18, self->_galleryDataProvider, self->_dataStore);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            -[PBFPosterExtensionDataStore addObserver:](self->_dataStore, "addObserver:", self);
            -[PBFPosterExtensionDataStore checkForGalleryUpdatesAndPrewarmSnapshots](self->_dataStore, "checkForGalleryUpdatesAndPrewarmSnapshots");
            -[PBFModalRootViewController _presentGallery](self, "_presentGallery");
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v25 = self->_entryPoint;
              switch(-[PRUISModalEntryPoint editingType](v25, "editingType"))
              {
                case 0:
                  -[PBFPosterExtensionDataStore switcherConfiguration](self->_dataStore, "switcherConfiguration");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "activeConfiguration");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PBFModalRootViewController _presentEditingForPosterConfiguration:](self, "_presentEditingForPosterConfiguration:", v27);

                  break;
                case 1:
                  -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:](self, "_presentEditingForNewPosterFromConfiguration:", v25);
                  break;
                case 2:
                  v28 = objc_alloc(MEMORY[0x1E0D7FAD8]);
                  -[PRUISModalEntryPoint serverPosterPath](v25, "serverPosterPath");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = (void *)objc_msgSend(v28, "_initWithPath:", v29);
                  -[PBFModalRootViewController _presentEditingForPosterConfiguration:](self, "_presentEditingForPosterConfiguration:", v30);
                  goto LABEL_23;
                case 3:
                  v31 = objc_alloc(MEMORY[0x1E0D7FAD8]);
                  -[PRUISModalEntryPoint serverPosterPath](v25, "serverPosterPath");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = (void *)objc_msgSend(v31, "_initWithPath:", v29);
                  -[PRUISModalEntryPoint updateSessionInfo](v25, "updateSessionInfo");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PBFModalRootViewController _presentEditingForPosterConfiguration:sessionInfo:](self, "_presentEditingForPosterConfiguration:sessionInfo:", v30, v32);

LABEL_23:
                  break;
                default:
                  break;
              }

            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              -[PBFPosterExtensionDataStore switcherConfiguration](self->_dataStore, "switcherConfiguration");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "activeConfiguration");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v34, "pbf_isLegacy"))
              {
                -[PBFModalRootViewController _presentLegacyAddNewAlert](self, "_presentLegacyAddNewAlert");
              }
              else
              {
                v35 = objc_alloc_init(PBFActivePosterConfigurationFilter);
                v36 = (void *)objc_opt_class();
                if (v36)
                {
                  objc_msgSend(v36, "_topButtonLayout");
                }
                else
                {
                  v68 = 0u;
                  v69 = 0u;
                  v66 = 0u;
                  v67 = 0u;
                }
                +[PBFPosterRackCollectionViewController simplifiedHomeScreenSwitcherWithFilter:delegate:topButtonLayout:](PBFPosterRackCollectionViewController, "simplifiedHomeScreenSwitcherWithFilter:delegate:topButtonLayout:", v35, self, &v66);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v37, 1, 0);

              }
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v38 = self->_entryPoint;
              v39 = objc_alloc(MEMORY[0x1E0D7FAD8]);
              -[PRUISModalEntryPoint serverPosterPath](v38, "serverPosterPath");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (void *)objc_msgSend(v39, "_initWithPath:", v40);

              if (objc_msgSend(v41, "pbf_isLegacy"))
              {
                -[PBFModalRootViewController _presentLegacyAddNewAlert](self, "_presentLegacyAddNewAlert");
              }
              else
              {
                v42 = -[PBFSinglePosterConfigurationFilter initWithConfiguration:]([PBFSinglePosterConfigurationFilter alloc], "initWithConfiguration:", v41);
                v43 = (void *)objc_opt_class();
                if (v43)
                {
                  objc_msgSend(v43, "_topButtonLayout");
                }
                else
                {
                  v64 = 0u;
                  v65 = 0u;
                  v62 = 0u;
                  v63 = 0u;
                }
                +[PBFPosterRackCollectionViewController simplifiedHomeScreenSwitcherWithFilter:delegate:topButtonLayout:](PBFPosterRackCollectionViewController, "simplifiedHomeScreenSwitcherWithFilter:delegate:topButtonLayout:", v42, self, &v62);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v44, 1, 0);

              }
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v45 = objc_alloc_init(PBFAmbientEditingCollectionViewController);
              -[PBFAmbientEditingCollectionViewController setAmbientEditingDelegate:](v45, "setAmbientEditingDelegate:", self);
              -[PBFAmbientEditingCollectionViewController setModalTransitionStyle:](v45, "setModalTransitionStyle:", 2);
              -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v45, 1, 0);

            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v46 = self->_entryPoint;
              v47 = objc_alloc(MEMORY[0x1E0D7FAD8]);
              -[PRUISModalEntryPoint serverPosterPath](v46, "serverPosterPath");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = (void *)objc_msgSend(v47, "_initWithPath:", v48);

              v50 = -[PBFAmbientEditingCollectionViewController init:]([PBFAmbientEditingCollectionViewController alloc], "init:", v49);
              objc_msgSend(v50, "setAmbientEditingDelegate:", self);
              if (v11)
              {
                -[UIScene _FBSScene](self->_parentScene, "_FBSScene");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "settings");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "displayConfiguration");
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v50, "setDisplayConfiguration:", v53);
              }
              objc_msgSend(v50, "setModalTransitionStyle:", 2, v62, v63, v64, v65, v66, v67, v68, v69);
              objc_storeStrong((id *)&self->_displayConfigurationObserver, v50);
              IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
              v55 = -[PRUISModalEntryPoint transitionOverlayRenderId](v46, "transitionOverlayRenderId");
              v56 = -[PRUISModalEntryPoint transitionOverlayContextId](v46, "transitionOverlayContextId");
              if (!IsReduceMotionEnabled && v55)
              {
                v57 = v56;
                if ((_DWORD)v56)
                {
                  v58 = objc_alloc_init(MEMORY[0x1E0DC42D8]);
                  objc_msgSend(v58, "portalLayer");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "setSourceContextId:", v57);

                  objc_msgSend(v58, "portalLayer");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "setSourceLayerRenderId:", v55);

                  objc_msgSend(v58, "portalLayer");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "setAllowsGroupOpacity:", 1);

                  objc_msgSend(v58, "setName:", CFSTR("com.apple.PosterBoard.transitionOverlayView"));
                  objc_msgSend(v58, "setAllowsHitTesting:", 0);
                  objc_msgSend(v58, "setMatchesPosition:", 0);
                  objc_msgSend(v58, "setMatchesTransform:", 0);
                  objc_msgSend(v50, "setTransitionOverlayView:", v58);

                }
              }
              -[PBFModalRootViewController setAmbientEditingController:](self, "setAmbientEditingController:", v50);
              -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v50, IsReduceMotionEnabled, 0);

            }
          }
          goto LABEL_8;
        }
      }
      -[PBFModalRootViewController _setupGalleryDataProviderIfNeeded](self, "_setupGalleryDataProviderIfNeeded");
      -[PBFModalRootViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_rootSheetPresentationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_setShouldScaleDownBehindDescendantSheets:", 0);

      v15 = self->_entryPoint;
      v24 = [PBFPosterSelectionViewController alloc];
      -[PRUISModalEntryPoint allowedConfigurationUUIDs](v15, "allowedConfigurationUUIDs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRUISModalEntryPoint selectedConfigurationUUID](v15, "selectedConfigurationUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PBFPosterSelectionViewController initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:](v24, "initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:", v17, v18, self->_galleryDataProvider, self->_dataStore);
    }
    v20 = (void *)v19;

    objc_msgSend(v20, "setDelegate:", self);
    -[PBFModalRootViewController _displayViewControllerAsSheet:](self, "_displayViewControllerAsSheet:", v20);

LABEL_8:
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BSInvalidatable *editingSessionInProgressAssertion;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBFModalRootViewController;
  -[PBFModalRootViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[BSInvalidatable invalidate](self->_editingSessionInProgressAssertion, "invalidate");
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id WeakRetained;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PBFModalRootViewController;
  v7 = a4;
  -[PBFModalRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  WeakRetained = objc_loadWeakRetained((id *)&self->_galleryController);
  objc_msgSend(WeakRetained, "updatePreferredContentSizeForSize:withTransitionCoordinator:", v7, width, height, v9.receiver, v9.super_class);

}

- (void)dealloc
{
  BSInvalidatable *snapshotterInUseAssertion;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_snapshotterInUseAssertion, "invalidate");
  snapshotterInUseAssertion = self->_snapshotterInUseAssertion;
  self->_snapshotterInUseAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFModalRootViewController;
  -[PBFModalRootViewController dealloc](&v4, sel_dealloc);
}

- (void)_presentEditingForPosterConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  PBFLegacyPosterMigrationHelper *legacyMigrationHelper;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 buf;
  Class (*v46)(uint64_t);
  void *v47;
  uint64_t *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "pbf_isLegacy"))
    {
      -[PBFModalRootViewController _createLegacyMigrationHelperWithConfiguration:](self, "_createLegacyMigrationHelperWithConfiguration:", v6);
      if (-[PBFLegacyPosterMigrationHelper canMigrateLegacyPoster](self->_legacyMigrationHelper, "canMigrateLegacyPoster"))
      {
        -[PBFModalRootViewController _presentLegacyMigrationAlert](self, "_presentLegacyMigrationAlert");
      }
      else if (-[PBFLegacyPosterMigrationHelper canMigrateLegacyLockPoster](self->_legacyMigrationHelper, "canMigrateLegacyLockPoster"))
      {
        -[PBFModalRootViewController _presentPartialMigrationPrompt](self, "_presentPartialMigrationPrompt");
      }
      else
      {
        -[PBFLegacyPosterMigrationHelper migrationInfo](self->_legacyMigrationHelper, "migrationInfo");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFLegacyMigrationAnalyticsReporter recordWithEvent:migrationInfo:duration:errorCode:](PBFLegacyMigrationAnalyticsReporter, "recordWithEvent:migrationInfo:duration:errorCode:", 2, v28, 0, -1.0);

        legacyMigrationHelper = self->_legacyMigrationHelper;
        self->_legacyMigrationHelper = 0;

        -[PBFModalRootViewController _presentLegacyAddNewAlert](self, "_presentLegacyAddNewAlert");
      }
    }
    else
    {
      objc_msgSend(v6, "_path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("PFServerPosterPath"));
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PBFModalRootViewController _presentEditingForPosterConfiguration:].cold.1(a2);
        objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1CBA4A610);
      }
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PBFModalRootViewController _presentEditingForPosterConfiguration:].cold.2(a2);
        objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1CBA4A674);
      }

      objc_msgSend(v6, "_path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStore providerForPath:](self->_dataStore, "providerForPath:", v8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && v38)
      {
        v9 = (void *)MEMORY[0x1E0D7F8C0];
        objc_msgSend(v38, "identity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "extensionInstanceForIdentity:instanceIdentifier:", v10, v11);
        v12 = objc_claimAutoreleasedReturnValue();

        -[PBFPosterExtensionDataStore switcherConfiguration](self->_dataStore, "switcherConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "activeConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "_path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "posterUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "posterUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v12;
        v20 = v14;
        LODWORD(v14) = objc_msgSend(v17, "isEqual:", v19);

        if ((_DWORD)v14)
        {
          v39 = 0;
          v40 = &v39;
          v41 = 0x2050000000;
          v21 = (void *)getSBSWallpaperServiceClass_softClass;
          v42 = getSBSWallpaperServiceClass_softClass;
          if (!getSBSWallpaperServiceClass_softClass)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v46 = __getSBSWallpaperServiceClass_block_invoke;
            v47 = &unk_1E86F2990;
            v48 = &v39;
            __getSBSWallpaperServiceClass_block_invoke((uint64_t)&buf);
            v21 = (void *)v40[3];
          }
          v22 = objc_retainAutorelease(v21);
          _Block_object_dispose(&v39, 8);
          v23 = objc_alloc_init(v22);
          v24 = v20;
          v25 = v37;
          v26 = v23;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v27 = objc_msgSend(v26, "posterSignificantEventsCounter");
          else
            v27 = 0;
          v43 = *MEMORY[0x1E0D7FC60];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "loadConfiguredPropertiesWithError:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "loadConfigurableOptionsWithError:", 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "invalidate");

        }
        else
        {
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v24 = v20;
          v25 = v37;
        }
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FA40]), "initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:", v25, v8, v31, v32, v30);
        -[PBFModalRootViewController _presentEditingSceneViewController:](self, "_presentEditingSceneViewController:", v34);

      }
      else
      {
        PBFLogModal();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v8;
          _os_log_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_DEFAULT, "Could not find extension for path: %@", (uint8_t *)&buf, 0xCu);
        }
      }

    }
  }

}

- (void)_presentEditingSceneViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "addObserver:", self);
  objc_msgSend(v5, "setModalPresentationStyle:", 0);
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTag:", 1);

  -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)_presentEditingForPosterConfiguration:(id)a3 sessionInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PBFPosterExtensionDataStore *dataStore;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  PBFModalRootViewController *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_10;
  if (objc_msgSend(v6, "pbf_isLegacy"))
  {
    -[PBFModalRootViewController _presentLegacyAddNewAlert](self, "_presentLegacyAddNewAlert");
    goto LABEL_10;
  }
  objc_msgSend(v6, "_path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PFServerPosterPath"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController _presentEditingForPosterConfiguration:sessionInfo:].cold.1();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA4A910);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController _presentEditingForPosterConfiguration:sessionInfo:].cold.1();
    goto LABEL_16;
  }

  objc_msgSend(v6, "_path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStore providerForPath:](self->_dataStore, "providerForPath:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    objc_msgSend(MEMORY[0x1E0D7F6B8], "posterUpdatesForDecoratedSessionInfo:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dataStore = self->_dataStore;
    objc_msgSend(v9, "serverIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "posterUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke;
    v17[3] = &unk_1E86F4660;
    v18 = v11;
    v19 = self;
    v20 = v9;
    -[PBFPosterExtensionDataStore createTemporaryPosterConfigurationForPosterMatchingUUID:andApplyUpdates:completion:](dataStore, "createTemporaryPosterConfigurationForPosterMatchingUUID:andApplyUpdates:completion:", v15, v12, v17);

  }
LABEL_10:

}

void __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;

  v6 = a2;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D7F8C0];
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionInstanceForIdentity:instanceIdentifier:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke_2;
  block[3] = &unk_1E86F4638;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(a1 + 48);
  v18 = v6;
  v19 = v12;
  v20 = v7;
  v21 = v13;
  v22 = v11;
  v14 = v11;
  v15 = v7;
  v16 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v2 = *(void **)(a1 + 32);
  v3 = *(id **)(a1 + 40);
  if (v2)
  {
    objc_storeStrong(v3 + 124, v2);
    v4 = (void *)MEMORY[0x1E0D7F8E8];
    objc_msgSend(*(id *)(a1 + 32), "incomingPosterConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentsURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "serverIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathWithContainerURL:identity:", v7, v8);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0D7FA40]);
    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "incomingPosterConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuredProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithProvider:contents:configurableOptions:configuredProperties:", v10, v25, 0, v12);

    objc_msgSend(v13, "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v13, "addObserver:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v13, "setModalPresentationStyle:", 0);
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTag:", 1);

    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v13, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_handleSheetWillDismissWithResponse:", v15);

    v16 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_handleSheetDidDismissWithResponse:", v17);

    PBFLogModal();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke_2_cold_1(a1, v18, v19, v20, v21, v22, v23, v24);

  }
}

- (void)_presentEditingForNewPosterFromConfiguration:(id)a3
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  char v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  PRMutablePosterDescriptor *temporaryDescriptor;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[5];
  id v60;
  id v61;
  BOOL v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint8_t buf[4];
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStore providerForExtensionIdentifier:](self->_dataStore, "providerForExtensionIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0D7F8C0];
    v56 = v8;
    objc_msgSend(v8, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extensionInstanceForIdentity:instanceIdentifier:", v11, v12);
    v55 = objc_claimAutoreleasedReturnValue();

    v13 = (id)*MEMORY[0x1E0D7FC58];
    v14 = (void *)MEMORY[0x1E0D7FA80];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mutableDescriptorWithIdentifier:role:", v16, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0D7F8E0];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v13;
    objc_msgSend(v18, "incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:", v6, v13, v19, 1, 0);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0D7F8E8];
    objc_msgSend(v17, "_path");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v22, "contentsURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)v20;
    objc_msgSend(v21, "pathWithContainerURL:identity:", v23, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = 0;
    LOBYTE(v22) = objc_msgSend(v24, "ensureContentsURLIsReachableAndReturnError:", &v67);
    v25 = v67;
    if ((v22 & 1) == 0)
    {
      PBFLogModal();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:].cold.5();

    }
    objc_msgSend(v24, "contentsURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v28 = objc_msgSend(v7, "removeItemAtURL:error:", v27, &v66);
    v29 = v66;

    if ((v28 & 1) == 0)
    {
      PBFLogModal();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:].cold.4();

    }
    v57 = v5;
    objc_msgSend(v5, "_path");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "contentsURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentsURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    v34 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v32, v33, &v65);
    v35 = v65;

    if ((v34 & 1) == 0)
    {
      PBFLogModal();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:].cold.3();

    }
    objc_msgSend(MEMORY[0x1E0D7FB20], "defaultHomeScreenConfigurationForProvider:role:", v6, v58);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "supplementURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    PFFileProtectionNoneAttributes();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v40 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v38, 1, v39, &v64);
    v41 = v64;

    if (v40)
    {
      v63 = 0;
      v42 = objc_msgSend(MEMORY[0x1E0D7FB50], "storeHomeScreenConfigurationForPath:homeScreenConfiguration:error:", v24, v37, &v63);
      v43 = v63;

      if ((v42 & 1) != 0)
      {
LABEL_24:
        temporaryDescriptor = self->_temporaryDescriptor;
        self->_temporaryDescriptor = (PRMutablePosterDescriptor *)v17;
        v47 = v17;

        v45 = v55;
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FA40]), "initWithProvider:contents:", v55, v24);
        objc_msgSend(v48, "setDelegate:", self);
        objc_msgSend(v48, "addObserver:", self);
        objc_msgSend(v48, "view");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setTag:", 1);

        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v48);
        objc_msgSend(v50, "setNavigationBarHidden:animated:", 1, 0);
        objc_msgSend(v50, "setModalPresentationStyle:", 0);
        v51 = -[PBFPosterExtensionDataStore canPersistNewPosterConfiguration](self->_dataStore, "canPersistNewPosterConfiguration");
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __75__PBFModalRootViewController__presentEditingForNewPosterFromConfiguration___block_invoke;
        v59[3] = &unk_1E86F4688;
        v62 = v51;
        v59[4] = self;
        v60 = v48;
        v61 = v50;
        v52 = v50;
        v53 = v48;
        -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v52, 1, v59);

        v9 = v56;
        v5 = v57;
        goto LABEL_25;
      }
      PBFLogModal();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:].cold.1();
    }
    else
    {
      PBFLogModal();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:].cold.2();
      v43 = v41;
    }

    goto LABEL_24;
  }
  PBFLogModal();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v6;
    _os_log_impl(&dword_1CB9FA000, v45, OS_LOG_TYPE_DEFAULT, "Could not find extension with id: %@", buf, 0xCu);
  }
LABEL_25:

}

void __75__PBFModalRootViewController__presentEditingForNewPosterFromConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  if (!*(_BYTE *)(a1 + 56))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __75__PBFModalRootViewController__presentEditingForNewPosterFromConfiguration___block_invoke_2;
    v4[3] = &unk_1E86F2518;
    v2 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v2, "_posterLimitExceededAlertWithButtonActionHandler:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v3, 1, 0);

  }
}

uint64_t __75__PBFModalRootViewController__presentEditingForNewPosterFromConfiguration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWithAction:", 0);
}

- (void)posterRackCollectionViewControllerDidPressCancel:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__PBFModalRootViewController_posterRackCollectionViewControllerDidPressCancel___block_invoke;
  v6[3] = &unk_1E86F2540;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PBFModalRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

}

uint64_t __79__PBFModalRootViewController_posterRackCollectionViewControllerDidPressCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", *(_QWORD *)(a1 + 40));
}

- (BOOL)posterRackCollectionViewControllerDidPressDone:(id)a3
{
  _BOOL4 v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v4 = -[PBFModalRootViewController _isPhotosEntryPoint](self, "_isPhotosEntryPoint", a3);
  objc_msgSend(MEMORY[0x1E0D7F838], "done");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v5);
  if (v4)
  {
    -[PBFModalRootViewController _handleSheetDidDismissWithResponse:](self, "_handleSheetDidDismissWithResponse:", v5);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__PBFModalRootViewController_posterRackCollectionViewControllerDidPressDone___block_invoke;
    v7[3] = &unk_1E86F2540;
    v7[4] = self;
    v8 = v5;
    v5 = v5;
    -[PBFModalRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

  }
  return 1;
}

uint64_t __77__PBFModalRootViewController_posterRackCollectionViewControllerDidPressDone___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", *(_QWORD *)(a1 + 40));
}

- (void)editingSceneViewControllerDidFinalize:(id)a3
{
  BSInvalidatable *editingSessionInProgressAssertion;

  -[BSInvalidatable invalidate](self->_editingSessionInProgressAssertion, "invalidate", a3);
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  PREditingSceneViewControllerTopButtonLayout *result;

  result = (PREditingSceneViewControllerTopButtonLayout *)objc_opt_class();
  if (result)
    return (PREditingSceneViewControllerTopButtonLayout *)-[PREditingSceneViewControllerTopButtonLayout _topButtonLayout](result, "_topButtonLayout");
  retstr->trailingTopButtonFrame.origin = 0u;
  retstr->trailingTopButtonFrame.size = 0u;
  retstr->leadingTopButtonFrame.origin = 0u;
  retstr->leadingTopButtonFrame.size = 0u;
  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v18, "addObserver:", self);
  objc_msgSend(v18, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "tag");

  if (v16 == 1)
  {
    -[PBFModalRootViewController _standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:](self, "_standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:", v18, a4, v12, v13, v14);
    goto LABEL_5;
  }
  if (!v16)
  {
    -[PBFModalRootViewController _galleryEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:](self, "_galleryEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:", v18, a4, v12, v13, v14);
LABEL_5:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("NO"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PBFModalRootViewController editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.1();
  objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)_galleryEditingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  PBFPosterEditingIngestionManager *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PBFPosterExtensionDataStore *dataStore;
  void *v29;
  void *v30;
  id v31;
  PBFModalRootViewController *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  PBFModalRootViewController *v39;
  void *v40;
  id v41;
  id v42;
  void (**v43)(id, _QWORD);
  void *v44;
  void *v45;
  PBFPosterEditingIngestionManager *v46;
  void (**v47)(id, id);
  uint64_t v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (a4 == 1)
  {
    v47 = (void (**)(id, id))a7;
    objc_msgSend(v14, "suggestionMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastModifiedDate");
    v48 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "suggestionMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "metadataBySettingLastModifiedDateToNow");
    v17 = objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v18 = objc_alloc(MEMORY[0x1E0D7FB78]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v18, "initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:", 0, MEMORY[0x1E0C9AA70], v19);

    }
    v49 = v14;
    v20 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v20, "setSuggestionMetadata:", v17);
    v21 = objc_alloc_init(PBFPosterEditingIngestionManager);
    -[PBFPosterEditingIngestionManager setDelegate:](v21, "setDelegate:", self);
    v46 = v21;
    v22 = -[PBFPosterEditingIngestionManager ingestConfiguration:updatedConfiguredProperties:editingViewController:galleryViewController:showEditingConfirmation:](v21, "ingestConfiguration:updatedConfiguredProperties:editingViewController:galleryViewController:showEditingConfirmation:", v13, v20, v12, 0, 1);
    v23 = v12;
    -[PBFPosterExtensionDataStore switcherConfiguration](self->_dataStore, "switcherConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend(v25, "configurations");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setSelectedConfiguration:", v27);
    objc_msgSend(v25, "setDesiredActiveConfiguration:", v27);
    dataStore = self->_dataStore;
    v50 = 0;
    -[PBFPosterExtensionDataStore updateDataStoreForSwitcherConfiguration:reason:error:](dataStore, "updateDataStoreForSwitcherConfiguration:reason:error:", v25, CFSTR("update poster from modal gallery"), &v50);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)v17;
    v31 = v50;

    v32 = self;
    if (!v29)
    {
      PBFLogModal();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[PBFModalRootViewController _galleryEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.1();

      v32 = self;
    }
    v44 = v30;
    v45 = v20;
    objc_msgSend(v27, "_path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "serverIdentity");
    v35 = v13;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "posterUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "UUIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v32;
    v40 = v23;
    v41 = v23;
    v42 = (id)v48;
    -[PBFModalRootViewController _logEditWithEditingViewController:posterUUID:lastModifiedDate:](v39, "_logEditWithEditingViewController:posterUUID:lastModifiedDate:", v41, v38, v48);

    v13 = v35;
    v47[2](v47, v31);

    v12 = v40;
    v14 = v49;
  }
  else
  {
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __150__PBFModalRootViewController__galleryEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke;
    v51[3] = &unk_1E86F2518;
    v52 = v12;
    v43 = (void (**)(id, _QWORD))a7;
    objc_msgSend(v52, "dismissViewControllerAnimated:completion:", 1, v51);
    v43[2](v43, 0);

    v42 = v52;
  }

}

uint64_t __150__PBFModalRootViewController__galleryEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_standaloneEditingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  PRUISModalEntryPoint *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  PBFPosterEditingIngestionManager *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PBFPosterExtensionDataStore *dataStore;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  PBFLegacyPosterMigrationHelper *v34;
  uint64_t v35;
  dispatch_time_t v36;
  void **v37;
  PBFPosterEditingIngestionManager *v38;
  id v39;
  PBFLegacyPosterMigrationHelper *legacyMigrationHelper;
  void *v41;
  _BOOL4 v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  NSObject *v50;
  PBFLegacyPosterMigrationHelper *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  PBFPosterExtensionDataStore *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void (**v72)(id, _QWORD);
  PRUISModalEntryPoint *v73;
  void *v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  PBFModalRootViewController *v90;
  id v91;
  id buf;
  _QWORD v93[5];
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  _QWORD block[4];
  id v100;
  _QWORD aBlock[5];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v70 = a5;
  v75 = a6;
  v72 = (void (**)(id, _QWORD))a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke;
  aBlock[3] = &unk_1E86F46B0;
  aBlock[4] = self;
  v71 = _Block_copy(aBlock);
  v12 = self->_entryPoint;
  NSClassFromString(CFSTR("PRUISModalEntryPointEditing"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController _standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v65), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA4C470);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRUISModalEntryPointEditingClass]"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController _standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.4();
    objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA4C4D4);
  }

  v73 = self->_entryPoint;
  if (a4 == 1)
  {
    objc_msgSend(v75, "suggestionMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastModifiedDate");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "suggestionMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "metadataBySettingLastModifiedDateToNow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0D7FB78]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v16, "initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:", 0, MEMORY[0x1E0C9AA70], v17);

    }
    v69 = (void *)objc_msgSend(v75, "mutableCopy");
    objc_msgSend(v69, "setSuggestionMetadata:", v15);
    objc_msgSend(v76, "contentsIdentity");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PRUISModalEntryPoint editingType](v73, "editingType");
    if ((unint64_t)(v18 - 2) >= 2 && v18)
    {
      if (v18 != 1)
      {
LABEL_46:

        goto LABEL_47;
      }
      v19 = objc_alloc_init(PBFPosterEditingIngestionManager);
      -[PBFPosterEditingIngestionManager setDelegate:](v19, "setDelegate:", self);
      v20 = -[PBFPosterEditingIngestionManager ingestConfiguration:updatedConfiguredProperties:editingViewController:galleryViewController:showEditingConfirmation:](v19, "ingestConfiguration:updatedConfiguredProperties:editingViewController:galleryViewController:showEditingConfirmation:", v70, v69, v76, 0, 1);
      -[PBFPosterExtensionDataStore switcherConfiguration](self->_dataStore, "switcherConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");

      objc_msgSend(v22, "configurations");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setSelectedConfiguration:", v24);
      objc_msgSend(v22, "setDesiredActiveConfiguration:", v24);
      dataStore = self->_dataStore;
      v94 = 0;
      v26 = -[PBFPosterExtensionDataStore updateDataStoreForSwitcherConfiguration:reason:error:](dataStore, "updateDataStoreForSwitcherConfiguration:reason:error:", v22, CFSTR("Modal New Poster"), &v94);
      v27 = v94;
      if (v27)
      {
        PBFLogModal();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[PBFModalRootViewController _standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.2();

      }
      objc_msgSend(v24, "_path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "serverIdentity");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "posterUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[PBFModalRootViewController _logEditWithEditingViewController:posterUUID:lastModifiedDate:](self, "_logEditWithEditingViewController:posterUUID:lastModifiedDate:", v76, v32, v74);
      v72[2](v72, 0);

    }
    else
    {
      if (self->_legacyMigrationHelper)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v67 = (id)objc_claimAutoreleasedReturnValue();
        v38 = objc_alloc_init(PBFPosterEditingIngestionManager);
        -[PBFPosterEditingIngestionManager setDelegate:](v38, "setDelegate:", self);
        -[PBFPosterEditingIngestionManager ingestConfiguration:updatedConfiguredProperties:editingViewController:galleryViewController:showEditingConfirmation:](v38, "ingestConfiguration:updatedConfiguredProperties:editingViewController:galleryViewController:showEditingConfirmation:", v70, v69, v76, 0, 0);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          objc_msgSend(v76, "addLongSaveOperationIndicator");
          objc_initWeak(&buf, self);
          legacyMigrationHelper = self->_legacyMigrationHelper;
          objc_msgSend(v39, "configurationUUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v86[0] = MEMORY[0x1E0C809B0];
          v86[1] = 3221225472;
          v86[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_151;
          v86[3] = &unk_1E86F46D8;
          objc_copyWeak(&v91, &buf);
          v87 = v76;
          v67 = v67;
          v88 = v67;
          v39 = v39;
          v89 = v39;
          v90 = self;
          -[PBFLegacyPosterMigrationHelper migrateHomePosterAndAssociateToConfiguration:completion:](legacyMigrationHelper, "migrateHomePosterAndAssociateToConfiguration:completion:", v41, v86);

          objc_destroyWeak(&v91);
          objc_destroyWeak(&buf);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "timeIntervalSinceDate:", v67);
          v48 = v47;
          -[PBFLegacyPosterMigrationHelper migrationInfo](self->_legacyMigrationHelper, "migrationInfo");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          +[PBFLegacyMigrationAnalyticsReporter recordWithEvent:migrationInfo:duration:errorCode:](PBFLegacyMigrationAnalyticsReporter, "recordWithEvent:migrationInfo:duration:errorCode:", 3, v49, 0, v48);

          PBFLogLegacyPosterMigration();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            -[PBFModalRootViewController _standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.3(v50);

          v51 = self->_legacyMigrationHelper;
          self->_legacyMigrationHelper = 0;

          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_150;
          v93[3] = &unk_1E86F2518;
          v93[4] = self;
          -[PBFModalRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v93);

        }
        v27 = 0;
      }
      else
      {
        v42 = objc_msgSend(v68, "type") == 3;
        v43 = objc_alloc(MEMORY[0x1E0D7FA60]);
        objc_msgSend(v70, "_path");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          objc_msgSend(v68, "posterUUID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (id)objc_msgSend(v43, "initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:", v44, v45, v68, v69, 0);

        }
        else
        {
          v67 = (id)objc_msgSend(v43, "initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:", v44, 0, v68, v69, 0);
        }

        -[PBFPosterExtensionDataStore switcherConfiguration](self->_dataStore, "switcherConfiguration");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (PBFPosterEditingIngestionManager *)objc_msgSend(v52, "mutableCopy");

        -[PBFPosterEditingIngestionManager ingestNewPosterConfiguration:](v38, "ingestNewPosterConfiguration:", v67);
        -[PBFPosterConfigurationUpdateResult incomingAssocPosterConfiguration](self->_temporaryConfigurationUpdateResult, "incomingAssocPosterConfiguration");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          -[PBFPosterConfigurationUpdateResult incomingAssocPosterConfiguration](self->_temporaryConfigurationUpdateResult, "incomingAssocPosterConfiguration");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "contentsIdentity");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "posterUUID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterEditingIngestionManager ingestNewPosterConfiguration:toBeAssociatedWithUUID:](v38, "ingestNewPosterConfiguration:toBeAssociatedWithUUID:", v54, v56);

        }
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        -[PBFPosterConfigurationUpdateResult postersToDelete](self->_temporaryConfigurationUpdateResult, "postersToDelete");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
        if (v58)
        {
          v59 = *(_QWORD *)v83;
          do
          {
            for (i = 0; i != v58; ++i)
            {
              if (*(_QWORD *)v83 != v59)
                objc_enumerationMutation(v57);
              -[PBFPosterEditingIngestionManager removeConfiguration:](v38, "removeConfiguration:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
            }
            v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
          }
          while (v58);
        }

        v61 = self->_dataStore;
        v81 = 0;
        v62 = -[PBFPosterExtensionDataStore updateDataStoreForSwitcherConfiguration:reason:error:](v61, "updateDataStoreForSwitcherConfiguration:reason:error:", v38, CFSTR("Modal Select Active Poster"), &v81);
        v27 = v81;
        objc_msgSend(MEMORY[0x1E0D7F838], "done");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v63);
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_158;
        v77[3] = &unk_1E86F2E08;
        v80 = v71;
        v78 = v63;
        v79 = v76;
        v39 = v63;
        objc_msgSend(v79, "dismissViewControllerAnimated:completion:", 1, v77);

      }
      objc_msgSend(v68, "posterUUID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "UUIDString");
      v19 = (PBFPosterEditingIngestionManager *)objc_claimAutoreleasedReturnValue();

      -[PBFModalRootViewController _logEditWithEditingViewController:posterUUID:lastModifiedDate:](self, "_logEditWithEditingViewController:posterUUID:lastModifiedDate:", v76, v19, v74);
      ((void (**)(id, id))v72)[2](v72, v27);
    }

    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_legacyMigrationHelper)
  {
    PBFLogLegacyPosterMigration();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CB9FA000, v33, OS_LOG_TYPE_INFO, "Legacy migration cancelled, clearing migration info", (uint8_t *)&buf, 2u);
    }

    v34 = self->_legacyMigrationHelper;
    self->_legacyMigrationHelper = 0;

  }
  v35 = -[PRUISModalEntryPoint editingType](v73, "editingType");
  if ((unint64_t)(v35 - 2) < 2 || !v35)
  {
    -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v74);
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2;
    v95[3] = &unk_1E86F2E08;
    v98 = v71;
    v96 = v74;
    v97 = v76;
    objc_msgSend(v97, "dismissViewControllerAnimated:completion:", 1, v95);
    v72[2](v72, 0);

    v37 = &v98;
    goto LABEL_23;
  }
  if (v35 == 1)
  {
    -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v74);
    (*((void (**)(void *, void *))v71 + 2))(v71, v74);
    v72[2](v72, 0);
    v36 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_147;
    block[3] = &unk_1E86F2518;
    v37 = &v100;
    v100 = v76;
    dispatch_after(v36, MEMORY[0x1E0C80D38], block);
LABEL_23:
    v15 = *v37;
LABEL_47:

  }
}

void __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", a2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 984);
  *(_QWORD *)(v3 + 984) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 992);
  *(_QWORD *)(v5 + 992) = 0;

}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_147(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_150(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentLegacyMigrationFailedAlert");
}

void __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_151(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *WeakRetained;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[8];
  _QWORD v27[5];

  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v6 = WeakRetained[127];
  objc_msgSend(*(id *)(a1 + 32), "removeLongSaveOperationIndicator");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v9 = v8;
    objc_msgSend(WeakRetained[127], "migrationInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFLegacyMigrationAnalyticsReporter recordWithEvent:migrationInfo:duration:errorCode:](PBFLegacyMigrationAnalyticsReporter, "recordWithEvent:migrationInfo:duration:errorCode:", 4, v10, objc_msgSend(v4, "code"), v9);

    PBFLogLegacyPosterMigration();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_151_cold_1();

    objc_msgSend(*(id *)(a1 + 48), "configurationUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "revertMigrationWithMigratedConfigurationUUID:", v12);

    v13 = *(void **)(a1 + 56);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_152;
    v27[3] = &unk_1E86F2518;
    v27[4] = v13;
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v27);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "configurationUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finalizeMigrationWithMigratedConfigurationUUID:", v14);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v16 = v15;
    if ((objc_msgSend(v6, "canMigrateLegacyPoster") & 1) != 0
      || !objc_msgSend(v6, "canMigrateLegacyLockPoster"))
    {
      PBFLogLegacyPosterMigration();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "Successful legacy poster migration!", buf, 2u);
      }
      v18 = 0;
    }
    else
    {
      PBFLogLegacyPosterMigration();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "Successful legacy poster migration! (lock only)", buf, 2u);
      }
      v18 = 1;
    }

    objc_msgSend(WeakRetained[127], "migrationInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFLegacyMigrationAnalyticsReporter recordWithEvent:migrationInfo:duration:errorCode:](PBFLegacyMigrationAnalyticsReporter, "recordWithEvent:migrationInfo:duration:errorCode:", v18, v19, 0, v16);

    objc_msgSend(MEMORY[0x1E0D7F838], "done");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "_handleSheetWillDismissWithResponse:", v20);
    v21 = *(void **)(a1 + 56);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_153;
    v24[3] = &unk_1E86F2540;
    v24[4] = v21;
    v25 = v20;
    v22 = v20;
    objc_msgSend(v21, "dismissViewControllerAnimated:completion:", 1, v24);

  }
  v23 = WeakRetained[127];
  WeakRetained[127] = 0;

}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_152(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentLegacyMigrationFailedAlert");
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_153(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", *(_QWORD *)(a1 + 40));
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_158(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)focusPosterSelectionViewController:(id)a3 willDismissWithResponse:(id)a4
{
  -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", a4);
}

- (void)focusPosterSelectionViewController:(id)a3 didDismissWithResponse:(id)a4
{
  -[PBFModalRootViewController _handleSheetDidDismissWithResponse:](self, "_handleSheetDidDismissWithResponse:", a4);
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForFocusPosterSelectionViewController:(SEL)a3
{
  PREditingSceneViewControllerTopButtonLayout *result;

  result = (PREditingSceneViewControllerTopButtonLayout *)objc_opt_class();
  if (result)
    return (PREditingSceneViewControllerTopButtonLayout *)-[PREditingSceneViewControllerTopButtonLayout _topButtonLayout](result, "_topButtonLayout");
  retstr->trailingTopButtonFrame.origin = 0u;
  retstr->trailingTopButtonFrame.size = 0u;
  retstr->leadingTopButtonFrame.origin = 0u;
  retstr->leadingTopButtonFrame.size = 0u;
  return result;
}

- (void)posterSelectionViewController:(id)a3 willDismissWithResponse:(id)a4
{
  -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", a4);
}

- (void)posterSelectionViewController:(id)a3 didDismissWithResponse:(id)a4
{
  -[PBFModalRootViewController _handleSheetDidDismissWithResponse:](self, "_handleSheetDidDismissWithResponse:", a4);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v4);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFModalRootViewController _handleSheetDidDismissWithResponse:](self, "_handleSheetDidDismissWithResponse:", v4);

}

- (BOOL)ambientEditingCollectionViewControllerDidPressDone:(id)a3
{
  void *v4;
  _BOOL8 IsReduceMotionEnabled;
  id v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0D7F838], "done", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v4);
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PBFModalRootViewController_ambientEditingCollectionViewControllerDidPressDone___block_invoke;
  v8[3] = &unk_1E86F2540;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  -[PBFModalRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", IsReduceMotionEnabled, v8);

  return 1;
}

uint64_t __81__PBFModalRootViewController_ambientEditingCollectionViewControllerDidPressDone___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", *(_QWORD *)(a1 + 40));
}

+ (PREditingSceneViewControllerTopButtonLayout)_topButtonLayout
{
  CGSize v4;
  CGSize v5;

  if (_topButtonLayout_onceToken != -1)
    dispatch_once(&_topButtonLayout_onceToken, &__block_literal_global_5);
  v4 = *(CGSize *)algn_1ED89B150;
  retstr->leadingTopButtonFrame.origin = (CGPoint)_topButtonLayout_layout;
  retstr->leadingTopButtonFrame.size = v4;
  v5 = (CGSize)unk_1ED89B170;
  retstr->trailingTopButtonFrame.origin = (CGPoint)xmmword_1ED89B160;
  retstr->trailingTopButtonFrame.size = v5;
  return result;
}

double __46__PBFModalRootViewController__topButtonLayout__block_invoke()
{
  double result;

  SBSTopButtonFramesForPosters();
  result = 0.0;
  _topButtonLayout_layout = 0u;
  *(_OWORD *)algn_1ED89B150 = 0u;
  xmmword_1ED89B160 = 0u;
  unk_1ED89B170 = 0u;
  return result;
}

- (void)_displayViewControllerAsSheet:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0DC3A40];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  objc_msgSend(v7, "sheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_handleSheetWillDismissWithResponse:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0D7F880];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initWithResponse:", v5);

  -[UIScene _FBSScene](self->_parentScene, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendActions:", v7);

}

- (void)_handleSheetDidDismissWithResponse:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0D7F7D0];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initWithResponse:", v5);

  -[UIScene _FBSScene](self->_parentScene, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendActions:", v7);

}

- (void)dataStoreDidTearDown:(id)a3
{
  BSDispatchMain();
}

void __51__PBFModalRootViewController_dataStoreDidTearDown___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  PBFLogModal();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v2, OS_LOG_TYPE_DEFAULT, "Dismissing modal sheet due to data store tear down", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_handleSheetWillDismissWithResponse:", v3);
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isPhotosEntryPoint");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "_handleSheetDidDismissWithResponse:", v3);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PBFModalRootViewController_dataStoreDidTearDown___block_invoke_162;
    v6[3] = &unk_1E86F2540;
    v6[4] = v5;
    v7 = v3;
    objc_msgSend(v5, "dismissPresentedViewControllersAnimated:dismissHandler:completion:", 1, 0, v6);

  }
}

uint64_t __51__PBFModalRootViewController_dataStoreDidTearDown___block_invoke_162(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", *(_QWORD *)(a1 + 40));
}

- (void)_presentLegacyAddNewAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  PBFLocalizedString(CFSTR("CANNOT_MIGRATE_LEGACY_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLocalizedString(CFSTR("CANNOT_MIGRATE_LEGACY_ALERT_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("CANNOT_MIGRATE_LEGACY_ALERT_BUTTON_ADD_NEW"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__PBFModalRootViewController__presentLegacyAddNewAlert__block_invoke;
  v15[3] = &unk_1E86F4720;
  v15[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v10);
  v11 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("CANCEL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __55__PBFModalRootViewController__presentLegacyAddNewAlert__block_invoke_2;
  v14[3] = &unk_1E86F4720;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v13);
  -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __55__PBFModalRootViewController__presentLegacyAddNewAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentGallery");
}

void __55__PBFModalRootViewController__presentLegacyAddNewAlert__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_handleSheetWillDismissWithResponse:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", v2);

}

- (void)_presentPartialMigrationPrompt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  PBFLocalizedString(CFSTR("CANNOT_MIGRATE_LEGACY_HOME_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLocalizedString(CFSTR("CANNOT_MIGRATE_LEGACY_HOME_ALERT_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("CANNOT_MIGRATE_LEGACY_HOME_ALERT_BUTTON_CUSTOMIZE_LOCK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke;
  v19[3] = &unk_1E86F4720;
  v19[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 2, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("CANNOT_MIGRATE_LEGACY_ALERT_BUTTON_ADD_NEW"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke_2;
  v18[3] = &unk_1E86F4720;
  v18[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v10);
  objc_msgSend(v6, "addAction:", v13);
  v14 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("CANCEL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke_3;
  v17[3] = &unk_1E86F4720;
  v17[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v16);
  -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performLegacyMigration");
}

uint64_t __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentGallery");
}

void __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_handleSheetWillDismissWithResponse:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", v2);

}

- (void)_presentLegacyMigrationAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  PBFLocalizedString(CFSTR("MIGRATE_LEGACY_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLocalizedString(CFSTR("MIGRATE_LEGACY_ALERT_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("MIGRATE_LEGACY_ALERT_BUTTON_MIGRATE_EXISTING"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke;
  v19[3] = &unk_1E86F4720;
  v19[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("MIGRATE_LEGACY_ALERT_BUTTON_ADD_NEW"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke_2;
  v18[3] = &unk_1E86F4720;
  v18[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v10);
  objc_msgSend(v6, "addAction:", v13);
  v14 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("CANCEL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke_3;
  v17[3] = &unk_1E86F4720;
  v17[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v16);
  -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performLegacyMigration");
}

uint64_t __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentGallery");
}

void __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_handleSheetWillDismissWithResponse:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", v2);

}

- (void)_presentLegacyMigrationFailedAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  PBFLocalizedString(CFSTR("ERROR_MIGRATING_LEGACY_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLocalizedString(CFSTR("ERROR_MIGRATING_LEGACY_ALERT_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("ERROR_MIGRATING_LEGACY_ALERT_BUTTON_ADD_NEW"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__PBFModalRootViewController__presentLegacyMigrationFailedAlert__block_invoke;
  v15[3] = &unk_1E86F4720;
  v15[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v10);
  v11 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("CANCEL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __64__PBFModalRootViewController__presentLegacyMigrationFailedAlert__block_invoke_2;
  v14[3] = &unk_1E86F4720;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v13);
  -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __64__PBFModalRootViewController__presentLegacyMigrationFailedAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentGallery");
}

void __64__PBFModalRootViewController__presentLegacyMigrationFailedAlert__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_handleSheetWillDismissWithResponse:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", v2);

}

- (void)_setupGalleryDataProviderIfNeeded
{
  PBFGalleryMutableDataProvider *v3;
  PBFGalleryMutableDataProvider *galleryDataProvider;

  if (!self->_galleryDataProvider)
  {
    v3 = objc_alloc_init(PBFGalleryMutableDataProvider);
    galleryDataProvider = self->_galleryDataProvider;
    self->_galleryDataProvider = v3;

    -[PBFModalRootViewController _reload](self, "_reload");
  }
}

- (void)_reload
{
  id v3;

  -[PBFPosterExtensionDataStore currentGalleryConfiguration](self->_dataStore, "currentGalleryConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFGalleryMutableDataProvider configureForGallery:](self->_galleryDataProvider, "configureForGallery:", v3);

}

- (void)_presentGallery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PBFPosterGalleryPreviewViewController *obj;

  -[PBFModalRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_rootSheetPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[PBFModalRootViewController _setupGalleryDataProviderIfNeeded](self, "_setupGalleryDataProviderIfNeeded");
  obj = -[PBFPosterGalleryPreviewViewController initWithNibName:bundle:]([PBFPosterGalleryPreviewViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[PBFPosterGalleryPreviewViewController setDelegate:](obj, "setDelegate:", self);
  -[PBFPosterGalleryPreviewViewController setEditingSceneDelegate:](obj, "setEditingSceneDelegate:", self);
  -[PBFPosterGalleryPreviewViewController setDataProvider:](obj, "setDataProvider:", self->_galleryDataProvider);
  PFCurrentDeviceClass();
  -[PBFPosterGalleryPreviewViewController setModalPresentationStyle:](obj, "setModalPresentationStyle:", 2);
  -[PBFPosterGalleryPreviewViewController sheetPresentationController](obj, "sheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterGalleryPreviewViewController configureSheetPresentationController:](PBFPosterGalleryPreviewViewController, "configureSheetPresentationController:", v6);
  objc_msgSend(v6, "setDelegate:", self);
  -[PBFModalRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", obj, 1, 0);

  objc_storeWeak((id *)&self->_galleryController, obj);
  -[PBFPosterExtensionDataStore currentGalleryConfiguration](self->_dataStore, "currentGalleryConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suggestedLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proactiveRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logFaceGalleryDidAppearWithFaceGalleryConfiguration:", v9);

  }
}

- (void)_createLegacyMigrationHelperWithConfiguration:(id)a3
{
  id v4;
  PBFLegacyPosterMigrationHelper *v5;
  PBFLegacyPosterMigrationHelper *legacyMigrationHelper;
  PBFPosterPair *v7;

  if (a3)
  {
    if (!self->_legacyMigrationHelper)
    {
      v4 = a3;
      v7 = -[PBFPosterPair initWithConfiguration:associatedConfiguration:]([PBFPosterPair alloc], "initWithConfiguration:associatedConfiguration:", v4, 0);

      v5 = -[PBFLegacyPosterMigrationHelper initWithDataStore:legacyPosterPair:]([PBFLegacyPosterMigrationHelper alloc], "initWithDataStore:legacyPosterPair:", self->_dataStore, v7);
      legacyMigrationHelper = self->_legacyMigrationHelper;
      self->_legacyMigrationHelper = v5;

    }
  }
}

- (void)_performLegacyMigration
{
  void *v3;
  void *v4;

  -[PBFLegacyPosterMigrationHelper lockScreenMigrationViewController](self->_legacyMigrationHelper, "lockScreenMigrationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PBFModalRootViewController _presentEditingSceneViewController:](self, "_presentEditingSceneViewController:", v3);
    v3 = v4;
  }

}

- (BOOL)_isPhotosEntryPoint
{
  PRUISModalEntryPoint *entryPoint;
  uint64_t v3;
  PRUISModalEntryPoint *v4;
  PRUISModalEntryPoint *v5;
  PRUISModalEntryPoint *v6;
  uint64_t v7;

  entryPoint = self->_entryPoint;
  v3 = objc_opt_class();
  v4 = entryPoint;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = -[PRUISModalEntryPoint editingType](v6, "editingType");
  return v7 == 1;
}

- (void)_logEditWithEditingViewController:(id)a3 posterUUID:(id)a4 lastModifiedDate:(id)a5
{
  id v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unsigned int v27;
  const __CFString *v28;
  void *v29;
  id v30;

  v30 = a3;
  v8 = a5;
  v9 = a4;
  objc_opt_class();
  v29 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    switch(-[PRUISModalEntryPoint editingType](self->_entryPoint, "editingType"))
    {
      case 0:
        v27 = 0;
        v10 = CFSTR("modalEditingActivePosterConfiguration");
        goto LABEL_13;
      case 1:
        v11 = CFSTR("modalEditingNewPosterFromConfiguration");
        goto LABEL_10;
      case 2:
        v27 = 0;
        v10 = CFSTR("modalEditingEditPosterFromConfiguration");
        goto LABEL_13;
      case 3:
        v27 = 0;
        v10 = CFSTR("modalEditingEditPosterFromConfigurationWithUpdateSessionInfo");
        goto LABEL_13;
      default:
        goto LABEL_8;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = CFSTR("modalGallery");
LABEL_10:
    v28 = v11;
    v27 = 1;
  }
  else
  {
LABEL_8:
    v27 = 0;
    v10 = CFSTR("unknown");
LABEL_13:
    v28 = v10;
  }
  objc_msgSend(v30, "modifications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CF9058]);
  objc_msgSend(v8, "timeIntervalSinceNow");
  v15 = v14;

  v16 = objc_msgSend(v12, "colorModified");
  v17 = objc_msgSend(v12, "fontModified");
  v18 = objc_msgSend(v12, "numberingSystemModified");
  v19 = objc_msgSend(v12, "posterContentModified");
  v20 = objc_msgSend(v12, "widgetsModified");
  v21 = objc_msgSend(v12, "containedWidgetsBeforeEdit");
  objc_msgSend(v12, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceNow");
  BYTE4(v26) = v21;
  BYTE3(v26) = v20;
  BYTE2(v26) = v19;
  BYTE1(v26) = v18;
  LOBYTE(v26) = v17;
  v24 = (void *)objc_msgSend(v13, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", v29, v28, v27, (uint64_t)-v15, CFSTR("accepted"), v16, v26, (unint64_t)-v23);

  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "logPosterEdit:completion:", v24, &__block_literal_global_215);

}

void __92__PBFModalRootViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    PBFLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __103__PBFFocusPosterSelectionViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke_cold_1();

  }
}

- (id)_posterLimitExceededAlertWithButtonActionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3450];
  PBFLocalizedString(CFSTR("TOO_MANY_CONFIGURATIONS_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLocalizedString(CFSTR("TOO_MANY_CONFIGURATIONS_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  PBFLocalizedString(CFSTR("OK"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PBFModalRootViewController__posterLimitExceededAlertWithButtonActionHandler___block_invoke;
  v13[3] = &unk_1E86F4768;
  v14 = v3;
  v10 = v3;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  return v7;
}

uint64_t __79__PBFModalRootViewController__posterLimitExceededAlertWithButtonActionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_handleNotificationForwardAction:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFModalRootViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    PBFLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "Forwarding appearance notification %{public}@ to presented view controller: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(v5, "forwardAppearanceNotificationName:", v4);
  }

}

- (UIScene)_scene
{
  return self->_parentScene;
}

- (void)_setScene:(id)a3
{
  UIScene *v4;
  void *v5;

  v4 = (UIScene *)a3;
  if (v4 && self->_parentScene != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene == _parentScene"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalRootViewController _setScene:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

  }
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_actionHandlersForScene:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a4, "settings", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "otherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForSetting:", 2606278162);

  if (self->_displayConfigurationObserver)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    -[UIScene _FBSScene](self->_parentScene, "_FBSScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFDisplayConfigurationUpdatable setDisplayConfiguration:](self->_displayConfigurationObserver, "setDisplayConfiguration:", v14);
  }

}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  PBFModalRootViewController *v18;
  id v19;

  v7 = a3;
  objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_228);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PBFModalRootViewController presentedViewController](self, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "dismiss");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "dismissWithAction:", 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v10);
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __92__PBFModalRootViewController__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2;
        v17 = &unk_1E86F2540;
        v18 = self;
        v19 = v10;
        v11 = v10;
        -[PBFModalRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &v14);

      }
    }

  }
  objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_230, v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[PBFModalRootViewController _handleNotificationForwardAction:](self, "_handleNotificationForwardAction:", v12);

  return v7;
}

uint64_t __92__PBFModalRootViewController__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __92__PBFModalRootViewController__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", *(_QWORD *)(a1 + 40));
}

uint64_t __92__PBFModalRootViewController__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)description
{
  return (NSString *)-[PBFModalRootViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBFModalRootViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBFModalRootViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void)posterExtensionDataStore:(id)a3 didUpdateGalleryConfiguration:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PBFModalRootViewController_posterExtensionDataStore_didUpdateGalleryConfiguration___block_invoke;
  block[3] = &unk_1E86F47F0;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __85__PBFModalRootViewController_posterExtensionDataStore_didUpdateGalleryConfiguration___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[126], "configureForGallery:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BSInvalidatable *v13;
  BSInvalidatable *editingSessionInProgressAssertion;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (-[PBFPosterExtensionDataStore canPersistNewPosterConfiguration](self->_dataStore, "canPersistNewPosterConfiguration"))
  {
    objc_msgSend(v15, "presentPreview:withMode:fromView:", v8, 2, v9);
    -[BSInvalidatable invalidate](self->_editingSessionInProgressAssertion, "invalidate");
    objc_msgSend(v8, "posterDescriptorLookupInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "posterDescriptorExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "posterExtensionBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFBehaviorAssertionProviding acquireEditingSessionAssertionForProvider:withReason:](self->_behaviorAssertionProvider, "acquireEditingSessionAssertionForProvider:withReason:", v12, CFSTR("Modal root view controller is starting an editing session"));
    v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
    self->_editingSessionInProgressAssertion = v13;

  }
  else
  {
    -[PBFModalRootViewController _posterLimitExceededAlertWithButtonActionHandler:](self, "_posterLimitExceededAlertWithButtonActionHandler:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentViewController:animated:completion:", v12, 1, 0);
  }

}

- (id)galleryViewController:(id)a3 willUseAnimationController:(id)a4 forDismissingEditingViewControllerWithAction:(int64_t)a5
{
  BSInvalidatable *editingSessionInProgressAssertion;
  id v8;
  BSInvalidatable *v9;
  void *v10;
  id v11;

  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  v8 = a4;
  -[BSInvalidatable invalidate](editingSessionInProgressAssertion, "invalidate");
  v9 = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

  if (a5 == 1)
    v10 = 0;
  else
    v10 = v8;
  v11 = v10;

  return v11;
}

- (void)editingIngestionManager:(id)a3 didAccept:(id)a4 userChoice:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  PRMutablePosterDescriptor *temporaryDescriptor;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v20[4];
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a4;
  if (self->_legacyMigrationHelper)
    goto LABEL_12;
  if (!a5)
  {
    if (-[PBFModalRootViewController _isPhotosEntryPoint](self, "_isPhotosEntryPoint"))
    {
      temporaryDescriptor = self->_temporaryDescriptor;
      self->_temporaryDescriptor = 0;

      objc_msgSend(MEMORY[0x1E0D7F838], "done");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v12);
      -[PBFModalRootViewController _handleSheetDidDismissWithResponse:](self, "_handleSheetDidDismissWithResponse:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7F838], "done");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFModalRootViewController _handleSheetWillDismissWithResponse:](self, "_handleSheetWillDismissWithResponse:", v18);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __75__PBFModalRootViewController_editingIngestionManager_didAccept_userChoice___block_invoke;
      v21[3] = &unk_1E86F2540;
      v21[4] = self;
      v22 = v18;
      v12 = v18;
      -[PBFModalRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v21);

    }
    goto LABEL_12;
  }
  objc_msgSend(v8, "dismissViewController");
  v10 = (void *)objc_opt_class();
  if (v10)
    objc_msgSend(v10, "_topButtonLayout");
  else
    memset(v20, 0, sizeof(v20));
  +[PBFPosterRackCollectionViewController simplifiedHomeScreenSwitcherFor:delegate:topButtonLayout:](PBFPosterRackCollectionViewController, "simplifiedHomeScreenSwitcherFor:delegate:topButtonLayout:", v9, self, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "editingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v8, "editingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pushViewController:animated:", v13, 1);

LABEL_12:
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[manager editingViewController] navigationController]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PBFModalRootViewController editingIngestionManager:didAccept:userChoice:].cold.1();
  objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __75__PBFModalRootViewController_editingIngestionManager_didAccept_userChoice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSheetDidDismissWithResponse:", *(_QWORD *)(a1 + 40));
}

- (PBFPosterGalleryPreviewViewController)galleryController
{
  return (PBFPosterGalleryPreviewViewController *)objc_loadWeakRetained((id *)&self->_galleryController);
}

- (void)setGalleryController:(id)a3
{
  objc_storeWeak((id *)&self->_galleryController, a3);
}

- (PBFAmbientEditingCollectionViewController)ambientEditingController
{
  return (PBFAmbientEditingCollectionViewController *)objc_loadWeakRetained((id *)&self->_ambientEditingController);
}

- (void)setAmbientEditingController:(id)a3
{
  objc_storeWeak((id *)&self->_ambientEditingController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ambientEditingController);
  objc_destroyWeak((id *)&self->_galleryController);
  objc_storeStrong((id *)&self->_displayConfigurationObserver, 0);
  objc_storeStrong((id *)&self->_behaviorAssertionProvider, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_editingSessionInProgressAssertion, 0);
  objc_storeStrong((id *)&self->_snapshotterInUseAssertion, 0);
  objc_storeStrong((id *)&self->_legacyMigrationHelper, 0);
  objc_storeStrong((id *)&self->_galleryDataProvider, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_storeStrong((id *)&self->_temporaryConfigurationUpdateResult, 0);
  objc_storeStrong((id *)&self->_temporaryDescriptor, 0);
  objc_storeStrong((id *)&self->_parentScene, 0);
}

- (void)initWithScene:dataStore:behaviorAssertionProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithScene:dataStore:behaviorAssertionProvider:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithScene:dataStore:behaviorAssertionProvider:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_presentEditingForPosterConfiguration:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_presentEditingForPosterConfiguration:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_presentEditingForPosterConfiguration:sessionInfo:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "Unable to refresh poster configuration with session info: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not apply default Home Screen configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not create supplements directory for staged configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not copy contents: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not remove temporary contents folder: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not create configuration contents: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_galleryEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not set poster configuration ingested from modal gallery as selected and active: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Could not make poster active/selected: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_standaloneEditingSceneViewController:(os_log_t)log userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "Unable to migrate lock poster, reverting migration", v1, 2u);
}

- (void)_standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_151_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "Unable to migrate home poster, reverting migration %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_setScene:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)editingIngestionManager:didAccept:userChoice:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
