@implementation PRUISPosterEditingViewController

+ (PREditingSceneViewControllerTopButtonLayout)_topButtonLayout
{
  CGSize v4;
  CGSize v5;

  if (_topButtonLayout_onceToken != -1)
    dispatch_once(&_topButtonLayout_onceToken, &__block_literal_global_3);
  v4 = (CGSize)unk_2543F7E18;
  retstr->var0.origin = (CGPoint)_topButtonLayout_layout;
  retstr->var0.size = v4;
  v5 = (CGSize)unk_2543F7E38;
  retstr->var1.origin = (CGPoint)xmmword_2543F7E28;
  retstr->var1.size = v5;
  return result;
}

double __52__PRUISPosterEditingViewController__topButtonLayout__block_invoke()
{
  double result;

  SBSTopButtonFramesForPosters();
  result = 0.0;
  _topButtonLayout_layout = 0u;
  unk_2543F7E18 = 0u;
  xmmword_2543F7E28 = 0u;
  unk_2543F7E38 = 0u;
  return result;
}

+ (id)posterEditingViewControllerForProvider:(id)a3 role:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "posterEditingViewControllerForProvider:role:context:boundingShape:error:", v11, v10, v9, -1, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)posterEditingViewControllerForProvider:(id)a3 role:(id)a4 context:(id)a5 boundingShape:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id result;
  void *v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if ((PFPosterRoleIsValid() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE74C18], "mutableConfigurationWithRole:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "ensureContentsURLIsReachableAndReturnError:", a7);

    if (v17)
      v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExtensionIdentifier:configuration:context:boundingShape:", v12, v15, v14, a6);
    else
      v18 = 0;

    return v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid(role)"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PRUISPosterEditingViewController posterEditingViewControllerForProvider:role:context:boundingShape:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PRUISPosterEditingViewController)initWithExtensionIdentifier:(id)a3 configuration:(id)a4 context:(id)a5
{
  return -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:](self, "initWithExtensionIdentifier:configuration:context:boundingShape:", a3, a4, a5, -1);
}

- (PRUISPosterEditingViewController)initWithExtensionIdentifier:(id)a3 configuration:(id)a4 context:(id)a5 boundingShape:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char IsValid;
  uint64_t v18;
  PRUISPosterEditingViewController *v19;
  uint64_t v20;
  NSString *extensionIdentifier;
  uint64_t v22;
  NSString *role;
  uint64_t v24;
  PFPosterPath *path;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v10;
  NSClassFromString(CFSTR("PRSMutablePosterConfiguration"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.1();
LABEL_35:
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F4D44);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSMutablePosterConfigurationClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F4DA8);
  }

  v13 = v9;
  NSClassFromString(CFSTR("NSString"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F4E0CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F4E70);
  }

  v14 = v11;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.3();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F4ED4);
  }
  v15 = v14;
  if ((objc_msgSend(v14, "conformsToProtocol:", &unk_25738BBE8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PRUISPosterEditingContext)]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.3();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F4F38);
  }

  objc_msgSend(v12, "role");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  IsValid = PFPosterRoleIsValid();

  if ((IsValid & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid([configuration role])"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.5();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F4F9CLL);
  }
  v18 = PUIPosterBoundingShapeFromInt();
  if ((PUIPosterBoundingShapeIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PUIPosterBoundingShapeIsValid(puiBoundingShape)"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.4();
    goto LABEL_35;
  }
  v34.receiver = self;
  v34.super_class = (Class)PRUISPosterEditingViewController;
  v19 = -[PRUISPosterEditingViewController initWithNibName:bundle:](&v34, sel_initWithNibName_bundle_, 0, 0);
  if (v19)
  {
    v20 = objc_msgSend(v13, "copy");
    extensionIdentifier = v19->_extensionIdentifier;
    v19->_extensionIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_configuration, a4);
    objc_msgSend(v12, "role");
    v22 = objc_claimAutoreleasedReturnValue();
    role = v19->_role;
    v19->_role = (NSString *)v22;

    objc_msgSend(v12, "_path");
    v24 = objc_claimAutoreleasedReturnValue();
    path = v19->_path;
    v19->_path = (PFPosterPath *)v24;

    objc_storeStrong((id *)&v19->_context, a5);
    v19->_boundingShape = v18;
    -[PRUISPosterEditingViewController _commonInit](v19, "_commonInit");
  }

  return v19;
}

- (PRUISPosterEditingViewController)initWithExistingConfiguration:(id)a3 context:(id)a4
{
  return -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:](self, "initWithExistingConfiguration:context:boundingShape:", a3, a4, -1);
}

- (PRUISPosterEditingViewController)initWithExistingConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  PRUISPosterEditingViewController *v16;
  PRUISPosterEditingViewController *v17;
  uint64_t v18;
  NSString *extensionIdentifier;
  uint64_t v20;
  NSString *role;
  uint64_t v22;
  PRUISPosterSnapshotCache *snapshotCache;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F524CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F52B0);
  }

  v13 = v9;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F5314);
  }
  v14 = v13;
  if ((objc_msgSend(v13, "conformsToProtocol:", &unk_25738BBE8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PRUISPosterEditingContext)]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:].cold.2();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F5378);
  }

  if ((objc_msgSend(v10, "isServerPosterPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[path isServerPosterPath]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:].cold.4();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F53DCLL);
  }
  v15 = PUIPosterBoundingShapeFromInt();
  if ((PUIPosterBoundingShapeIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PUIPosterBoundingShapeIsValid(puiBoundingShape)"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:].cold.3();
    goto LABEL_27;
  }
  v30.receiver = self;
  v30.super_class = (Class)PRUISPosterEditingViewController;
  v16 = -[PRUISPosterEditingViewController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_context, a4);
    objc_storeStrong((id *)&v17->_configuration, a3);
    objc_storeStrong((id *)&v17->_path, v10);
    objc_msgSend(v11, "provider");
    v18 = objc_claimAutoreleasedReturnValue();
    extensionIdentifier = v17->_extensionIdentifier;
    v17->_extensionIdentifier = (NSString *)v18;

    objc_msgSend(v11, "role");
    v20 = objc_claimAutoreleasedReturnValue();
    role = v17->_role;
    v17->_role = (NSString *)v20;

    +[PRUISPosterSnapshotFilesystemCache incomingCallSnapshotCache](PRUISPosterSnapshotFilesystemCache, "incomingCallSnapshotCache");
    v22 = objc_claimAutoreleasedReturnValue();
    snapshotCache = v17->_snapshotCache;
    v17->_snapshotCache = (PRUISPosterSnapshotCache *)v22;

    v17->_boundingShape = v15;
    -[PRUISPosterEditingViewController _commonInit](v17, "_commonInit");
  }

  return v17;
}

- (void)_commonInit
{
  PFPosterExtensionProvider *v3;
  PFPosterExtensionProvider *extensionDataSource;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("DECAF000-0000-0000-0000-000000000003"));
  v3 = (PFPosterExtensionProvider *)objc_msgSend(objc_alloc(MEMORY[0x24BE74D18]), "initWithDefaultInstanceIdentifier:", v5);
  extensionDataSource = self->_extensionDataSource;
  self->_extensionDataSource = v3;

  -[PFPosterExtensionProvider setObserverQueue:](self->_extensionDataSource, "setObserverQueue:", MEMORY[0x24BDAC9B8]);
  -[PFPosterExtensionProvider addObserver:](self->_extensionDataSource, "addObserver:", self);
  -[PFPosterExtensionProvider start](self->_extensionDataSource, "start");
  self->_prefersDisplayingSnapshotBeforePresentation = 1;
  self->_boundingShape = -1;
  -[PRUISPosterEditingViewController _registerForStateNotifications](self, "_registerForStateNotifications");

}

- (void)_registerForStateNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *notificationObservers;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  -[PRUISPosterEditingViewController _addObserverForNotificationName:forwardingNotificationName:](self, "_addObserverForNotificationName:forwardingNotificationName:", *MEMORY[0x24BDF7528], *MEMORY[0x24BDD0C18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterEditingViewController _addObserverForNotificationName:forwardingNotificationName:](self, "_addObserverForNotificationName:forwardingNotificationName:", *MEMORY[0x24BDF75D0], *MEMORY[0x24BDD0C20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterEditingViewController _addObserverForNotificationName:forwardingNotificationName:](self, "_addObserverForNotificationName:forwardingNotificationName:", *MEMORY[0x24BDF75D8], *MEMORY[0x24BDD0C28]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterEditingViewController _addObserverForNotificationName:forwardingNotificationName:](self, "_addObserverForNotificationName:forwardingNotificationName:", *MEMORY[0x24BDF7510], *MEMORY[0x24BDD0C10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = v7;

}

- (id)_addObserverForNotificationName:(id)a3 forwardingNotificationName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __95__PRUISPosterEditingViewController__addObserverForNotificationName_forwardingNotificationName___block_invoke;
  v12[3] = &unk_251534F10;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

void __95__PRUISPosterEditingViewController__addObserverForNotificationName_forwardingNotificationName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(WeakRetained, "editingSceneViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "forwardAppearanceNotificationName:", *(_QWORD *)(a1 + 32));

}

- (void)_prepareForEditing
{
  BOOL v3;

  if (!self->_hasPreparedForEditing)
  {
    if (-[PFPosterPath isServerPosterPath](self->_path, "isServerPosterPath"))
      v3 = -[PRUISPosterEditingViewController _prepareEditingForPath:](self, "_prepareEditingForPath:", self->_path);
    else
      v3 = -[PRUISPosterEditingViewController _prepareEditingForNewPoster](self, "_prepareEditingForNewPoster");
    self->_hasPreparedForEditing = v3;
  }
}

- (void)dealloc
{
  void *v3;
  PFPosterExtensionInstance *extensionInstance;
  objc_class *v5;
  void *v6;
  PFPosterExtensionInstance *v7;
  PFPosterExtensionProvider *extensionDataSource;
  objc_super v9;

  -[PFPosterExtensionProvider instanceProvider](self->_extensionDataSource, "instanceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  extensionInstance = self->_extensionInstance;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relinquishExtensionInstance:reason:", extensionInstance, v6);

  -[PFPosterExtensionInstance invalidate](self->_extensionInstance, "invalidate");
  v7 = self->_extensionInstance;
  self->_extensionInstance = 0;

  -[PFPosterExtensionProvider cancel](self->_extensionDataSource, "cancel");
  extensionDataSource = self->_extensionDataSource;
  self->_extensionDataSource = 0;

  -[PREditingSceneViewController setShowsContentWhenReady:](self->_editingSceneViewController, "setShowsContentWhenReady:", 0);
  -[PREditingSceneViewController setForcesSceneForeground:](self->_editingSceneViewController, "setForcesSceneForeground:", 0);
  -[PREditingSceneViewController removeObserver:](self->_editingSceneViewController, "removeObserver:", self);
  v9.receiver = self;
  v9.super_class = (Class)PRUISPosterEditingViewController;
  -[PRUISPosterEditingViewController dealloc](&v9, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRUISPosterEditingViewController;
  -[PRUISPosterEditingViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PRUISPosterEditingViewController _prepareForEditing](self, "_prepareForEditing");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PRUISPosterEditingViewController;
  -[PRUISPosterEditingViewController viewDidAppear:](&v6, sel_viewDidAppear_);
  if (self->_prefersDisplayingSnapshotBeforePresentation)
  {
    -[UIImageView superview](self->_snapshotImageView, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[PRUISPosterEditingViewController presentationDidFinishAnimated:](self, "presentationDidFinishAnimated:", v3);
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (id)internalContext
{
  PRUISPosterEditingContext *context;

  if (-[PRUISPosterEditingContext conformsToProtocol:](self->_context, "conformsToProtocol:", &unk_25738BC78))context = self->_context;
  else
    context = 0;
  return context;
}

- (void)setAcceptButtonType:(unint64_t)a3
{
  PREditingSceneViewController *editingSceneViewController;

  if (self->_acceptButtonType != a3)
  {
    self->_acceptButtonType = a3;
    editingSceneViewController = self->_editingSceneViewController;
    if (a3 != 2)
      a3 = a3 == 1;
    -[PREditingSceneViewController setAcceptButtonType:](editingSceneViewController, "setAcceptButtonType:", a3);
  }
}

- (void)setShowsContentWhenReady:(BOOL)a3
{
  if (self->_showsContentWhenReady != a3)
  {
    if (a3)
      -[PRUISPosterEditingViewController _prepareForEditing](self, "_prepareForEditing");
    self->_showsContentWhenReady = a3;
    -[PRUISPosterEditingViewController _updateEditingSceneViewControllerShowsContentWhenReady](self, "_updateEditingSceneViewControllerShowsContentWhenReady");
  }
}

- (void)_updateEditingSceneViewControllerShowsContentWhenReady
{
  PREditingSceneViewController *editingSceneViewController;
  int v4;
  int showsContentWhenReady;

  editingSceneViewController = self->_editingSceneViewController;
  if (editingSceneViewController)
  {
    v4 = -[PREditingSceneViewController showsContentWhenReady](editingSceneViewController, "showsContentWhenReady");
    showsContentWhenReady = self->_showsContentWhenReady;
    if (showsContentWhenReady != v4)
    {
      -[PREditingSceneViewController setShowsContentWhenReady:](self->_editingSceneViewController, "setShowsContentWhenReady:", showsContentWhenReady != 0);
      -[PREditingSceneViewController setForcesSceneForeground:](self->_editingSceneViewController, "setForcesSceneForeground:", self->_showsContentWhenReady);
    }
  }
}

- (id)snapshotWithOptions:(unint64_t)a3
{
  return 0;
}

- (void)presentationDidFinishAnimated:(BOOL)a3
{
  _BOOL4 v3;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  uint64_t v8;
  UIImageView *snapshotImageView;
  UIImageView *v10;
  _QWORD v11[4];
  UIImageView *v12;
  _QWORD v13[4];
  UIImageView *v14;

  v3 = a3;
  v5 = self->_snapshotImageView;
  v6 = v5;
  if (v3)
  {
    v7 = (void *)MEMORY[0x24BDF6F90];
    v8 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __66__PRUISPosterEditingViewController_presentationDidFinishAnimated___block_invoke;
    v13[3] = &unk_251534F38;
    v14 = v5;
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __66__PRUISPosterEditingViewController_presentationDidFinishAnimated___block_invoke_2;
    v11[3] = &unk_251534F60;
    v12 = v14;
    objc_msgSend(v7, "animateWithDuration:animations:completion:", v13, v11, 0.2);
    snapshotImageView = self->_snapshotImageView;
    self->_snapshotImageView = 0;

    v10 = v14;
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_snapshotImageView, "removeFromSuperview");
    v10 = self->_snapshotImageView;
    self->_snapshotImageView = 0;
  }

  -[PREditingSceneViewController setForcesSceneForeground:](self->_editingSceneViewController, "setForcesSceneForeground:", 0);
}

uint64_t __66__PRUISPosterEditingViewController_presentationDidFinishAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __66__PRUISPosterEditingViewController_presentationDidFinishAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (BOOL)_prepareEditingForNewPoster
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  PFPosterPath *path;
  char v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  PRMutablePosterConfiguration *temporaryConfiguration;
  void *v23;
  void *v24;
  void *v25;
  unint64_t acceptButtonType;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PREditingSceneViewController *editingSceneViewController;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  BOOL v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x24BDAC8D0];
  -[PRUISPosterEditingViewController extensionInstance](self, "extensionInstance");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_2:
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE74DC8], "mutableConfigurationWithRole:", self->_role);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)v6;
    objc_msgSend(MEMORY[0x24BE74D28], "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", self->_extensionIdentifier, v6, self->_role, v4, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BE74D30];
    objc_msgSend(v7, "_path");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "contentsURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v8;
    objc_msgSend(v9, "pathWithContainerURL:identity:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = 0;
    LOBYTE(v10) = objc_msgSend(v12, "ensureContentsURLIsReachableAndReturnError:", &v56);
    v13 = v56;
    if ((v10 & 1) != 0)
    {

      path = self->_path;
      v55 = 0;
      v15 = objc_msgSend(v12, "copyContentsOfPath:error:", path, &v55);
      v16 = v55;
      if ((v15 & 1) == 0)
      {
        PRUISLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[PRUISPosterEditingViewController _prepareEditingForNewPoster].cold.4();

      }
      v49 = (void *)v4;

      objc_msgSend(MEMORY[0x24BE74DF8], "defaultHomeScreenConfigurationForProvider:role:", self->_extensionIdentifier, self->_role);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x24BE74DE0]);
      v48 = (void *)v18;
      v20 = (void *)objc_msgSend(v19, "initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", &stru_251536518, 0, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v18, 0.5);
      objc_msgSend(MEMORY[0x24BE74E10], "loadConfiguredPropertiesForPath:error:", v12, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0;
      LOBYTE(v18) = objc_msgSend(MEMORY[0x24BE74E10], "storeConfigurableOptionsForPath:configurableOptions:error:", v12, v20, &v54);
      v50 = v54;
      if ((v18 & 1) != 0)
      {
        temporaryConfiguration = self->_temporaryConfiguration;
        self->_temporaryConfiguration = (PRMutablePosterConfiguration *)v7;
        v47 = v7;

        v57 = *MEMORY[0x24BE74EA8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_boundingShape);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v23;
        v53 = 1;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74DB8]), "initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:", v3, v12, v20, v21, v24);
        objc_msgSend(v25, "setDelegate:", self);
        objc_msgSend(v25, "addObserver:", self);
        acceptButtonType = self->_acceptButtonType;
        if (acceptButtonType == 2)
          v27 = 2;
        else
          v27 = acceptButtonType == 1;
        objc_msgSend(v25, "setAcceptButtonType:", v27);
        -[PRUISPosterEditingViewController addChildViewController:](self, "addChildViewController:", v25);
        -[PRUISPosterEditingViewController view](self, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addSubview:", v29);

        objc_msgSend(v25, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRUISPosterEditingViewController view](self, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bounds");
        objc_msgSend(v30, "setFrame:");

        objc_msgSend(v25, "didMoveToParentViewController:", self);
        editingSceneViewController = self->_editingSceneViewController;
        self->_editingSceneViewController = (PREditingSceneViewController *)v25;
        v33 = v25;

        -[PRUISPosterEditingViewController updateEditingControllerWithContext:](self, "updateEditingControllerWithContext:", self->_editingSceneViewController);
        goto LABEL_20;
      }
      PRUISLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[PRUISPosterEditingViewController _prepareEditingForNewPoster].cold.3();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("didLaydownConfigurableOptions"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[PRUISPosterEditingViewController _prepareEditingForNewPoster].cold.2();
      objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
    }
    else
    {
      PRUISLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[PRUISPosterEditingViewController _prepareEditingForNewPoster].cold.3();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("contentsURLIsReachable"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[PRUISPosterEditingViewController _prepareEditingForNewPoster].cold.5();
      objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
    }
    JUMPOUT(0x2445F6208);
  }
  -[PFPosterExtensionProvider extensionForIdentifier](self->_extensionDataSource, "extensionForIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKey:", self->_extensionIdentifier);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35
    && -[PRUISPosterEditingViewController _acquireInstanceForExtension:](self, "_acquireInstanceForExtension:", v35))
  {
    -[PRUISPosterEditingViewController extensionInstance](self, "extensionInstance");
    v3 = objc_claimAutoreleasedReturnValue();

    if (v3)
      goto LABEL_2;
  }
  else
  {

  }
  PRUISLogEditing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[PRUISPosterEditingViewController _prepareEditingForNewPoster].cold.1((uint64_t)&self->_extensionIdentifier, v3, v36, v37, v38, v39, v40, v41);
  v53 = 0;
LABEL_20:

  return v53;
}

- (void)updateEditingControllerWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRUISPosterEditingViewController _updateEditingSceneViewControllerShowsContentWhenReady](self, "_updateEditingSceneViewControllerShowsContentWhenReady");
  -[PRUISPosterEditingViewController internalContext](self, "internalContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyContextToEditingSceneViewController:", v4);

}

- (BOOL)_prepareEditingForPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unint64_t acceptButtonType;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *snapshotImageView;
  id v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  -[PRUISPosterEditingViewController extensionInstance](self, "extensionInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE74DB8]), "initWithProvider:contents:", v5, v4);
    -[NSObject setDelegate:](v6, "setDelegate:", self);
    -[NSObject addObserver:](v6, "addObserver:", self);
    acceptButtonType = self->_acceptButtonType;
    if (acceptButtonType == 2)
      v8 = 2;
    else
      v8 = acceptButtonType == 1;
    -[NSObject setAcceptButtonType:](v6, "setAcceptButtonType:", v8);
    -[PRUISPosterEditingViewController addChildViewController:](self, "addChildViewController:", v6);
    -[PRUISPosterEditingViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject view](v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[NSObject view](v6, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISPosterEditingViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v11, "setFrame:");

    -[NSObject didMoveToParentViewController:](v6, "didMoveToParentViewController:", self);
    objc_storeStrong((id *)&self->_editingSceneViewController, v6);
    -[PRUISPosterEditingViewController updateEditingControllerWithContext:](self, "updateEditingControllerWithContext:", self->_editingSceneViewController);
    if ((-[PREditingSceneViewController showsContentWhenReady](self->_editingSceneViewController, "showsContentWhenReady") & 1) == 0&& self->_prefersDisplayingSnapshotBeforePresentation)
    {
      if (-[NSString isEqualToString:](self->_role, "isEqualToString:", *MEMORY[0x24BE74E90]))
      {
        -[PRUISPosterEditingViewController contentOnlySnapshot](self, "contentOnlySnapshot");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          || (-[PRUISPosterEditingViewController phonePreviewSnapshot](self, "phonePreviewSnapshot"),
              (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          snapshotImageView = self->_snapshotImageView;
          if (!snapshotImageView)
          {
            v15 = objc_alloc(MEMORY[0x24BDF6AE8]);
            -[PRUISPosterEditingViewController view](self, "view");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bounds");
            v17 = (UIImageView *)objc_msgSend(v15, "initWithFrame:");

            -[UIImageView setAutoresizingMask:](v17, "setAutoresizingMask:", 18);
            v18 = self->_snapshotImageView;
            self->_snapshotImageView = v17;

            snapshotImageView = self->_snapshotImageView;
          }
          -[UIImageView setImage:](snapshotImageView, "setImage:", v13);
          -[PRUISPosterEditingViewController view](self, "view");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addSubview:", self->_snapshotImageView);

        }
      }
    }
  }
  else
  {
    PRUISLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController _prepareEditingForPath:].cold.1((uint64_t)self, v6, v20, v21, v22, v23, v24, v25);
  }

  return v5 != 0;
}

- (id)_contentOnlyPosterLevelSet
{
  PRUISPosterLevelSet *v2;

  v2 = [PRUISPosterLevelSet alloc];
  return -[PRUISPosterLevelSet initWithNumberOfLevels:](v2, "initWithNumberOfLevels:", 4, *MEMORY[0x24BE74E68], *MEMORY[0x24BE74E70], *MEMORY[0x24BE74E78], *MEMORY[0x24BE74E58]);
}

- (id)contentOnlySnapshot
{
  PRUISPosterEditingContext *v3;
  PRUISPosterEditingContext *v4;
  PRUISIncomingCallSnapshotDefinition *v5;
  PRUISIncomingCallSnapshotDefinition *v6;
  void *v7;
  PRUISPosterSnapshotCache *snapshotCache;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  if (!-[NSString isEqualToString:](self->_role, "isEqualToString:", *MEMORY[0x24BE74E90]))
    return 0;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 ? self->_context : 0;
  v4 = v3;
  v5 = [PRUISIncomingCallSnapshotDefinition alloc];
  v6 = -[PRUISIncomingCallSnapshotDefinition initWithBaseIdentifier:context:attachmentUniqueIdentifiers:](v5, "initWithBaseIdentifier:context:attachmentUniqueIdentifiers:", PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly, v4, 0);
  +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:](PRUISPosterSnapshotRequest, "snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:", self->_configuration, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  snapshotCache = self->_snapshotCache;
  v13 = 0;
  -[PRUISPosterSnapshotCache latestSnapshotBundleForRequest:error:](snapshotCache, "latestSnapshotBundleForRequest:error:", v7, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterEditingViewController _contentOnlyPosterLevelSet](self, "_contentOnlyPosterLevelSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotForLevelSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)phonePreviewSnapshot
{
  PRUISPosterEditingContext *v3;
  PRUISPosterEditingContext *v4;
  PRUISIncomingCallPosterContext *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  PRUISIncomingCallPosterContext *v24;
  PRUISIncomingCallSnapshotDefinition *v25;
  __CFString *v26;
  void *v27;
  PRUISIncomingCallSnapshotDefinition *v28;
  void *v29;
  PRUISPosterSnapshotCache *snapshotCache;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  if (!-[NSString isEqualToString:](self->_role, "isEqualToString:", *MEMORY[0x24BE74E90]))
    goto LABEL_7;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 ? self->_context : 0;
  v4 = v3;
  v5 = [PRUISIncomingCallPosterContext alloc];
  -[PRUISPosterEditingContext nameVariations](v4, "nameVariations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterEditingContext horizontalTitleBoundingRect](v4, "horizontalTitleBoundingRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PRUISPosterEditingContext verticalTitleBoundingRect](v4, "verticalTitleBoundingRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[PRUISPosterEditingContext imageAssetID](v4, "imageAssetID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PRUISIncomingCallPosterContext initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:](v5, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", v6, 1, v23, -[PRUISPosterEditingContext isPersonalPoster](v4, "isPersonalPoster"), v8, v10, v12, v14, v16, v18, v20, v22);

  v25 = [PRUISIncomingCallSnapshotDefinition alloc];
  v26 = PRPosterSnapshotDefinitionIdentifierIncomingCallComposite;
  v36[0] = CFSTR("TPUI_MobileLabelAndBottomBarAndInfoLabel");
  v36[1] = PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PRUISIncomingCallSnapshotDefinition initWithBaseIdentifier:context:attachmentUniqueIdentifiers:](v25, "initWithBaseIdentifier:context:attachmentUniqueIdentifiers:", v26, v24, v27);

  +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:](PRUISPosterSnapshotRequest, "snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:", self->_configuration, v28, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    snapshotCache = self->_snapshotCache;
    v35 = 0;
    -[PRUISPosterSnapshotCache latestSnapshotBundleForRequest:error:](snapshotCache, "latestSnapshotBundleForRequest:error:", v29, &v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISPosterEditingViewController _contentOnlyPosterLevelSet](self, "_contentOnlyPosterLevelSet");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "snapshotForLevelSet:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v33 = 0;
  }
  return v33;
}

- (void)posterExtensionProvider:(id)a3 foundExtensions:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSString *extensionIdentifier;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  PRUISPosterEditingViewController *v25;
  __int16 v26;
  NSString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      objc_msgSend(v10, "posterExtensionBundleIdentifier", (_QWORD)v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", self->_extensionIdentifier);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_13;
    PRUISLogEditing();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      extensionIdentifier = self->_extensionIdentifier;
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2048;
      v25 = self;
      v26 = 2114;
      v27 = extensionIdentifier;
      v17 = v15;
      _os_log_impl(&dword_2445ED000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@:%p)Found extension with id: %{public}@", buf, 0x20u);

    }
  }
  else
  {
LABEL_9:

LABEL_13:
    PRUISLogEditing();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PRUISPosterEditingViewController posterExtensionProvider:foundExtensions:].cold.1((uint64_t)self, v14);
    v13 = 0;
  }

  if (-[PRUISPosterEditingViewController _acquireInstanceForExtension:](self, "_acquireInstanceForExtension:", v13))
    -[PRUISPosterEditingViewController _prepareForEditing](self, "_prepareForEditing");

}

- (BOOL)_acquireInstanceForExtension:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  objc_class *v9;
  void *v10;
  PFPosterExtensionInstance *extensionInstance;
  PFPosterExtensionInstance *v12;
  PFPosterExtensionInstance *v13;
  PFPosterExtensionInstance *v14;

  v4 = a3;
  -[PFPosterExtensionInstance extension](self->_extensionInstance, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[PFPosterExtensionProvider instanceProvider](self->_extensionDataSource, "instanceProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    extensionInstance = self->_extensionInstance;
    if (extensionInstance)
    {
      objc_msgSend(v8, "relinquishExtensionInstance:reason:", extensionInstance, v10);
      v12 = self->_extensionInstance;
      self->_extensionInstance = 0;

    }
    objc_msgSend(v8, "acquireInstanceForExtension:reason:error:", v4, v10, 0);
    v13 = (PFPosterExtensionInstance *)objc_claimAutoreleasedReturnValue();
    v14 = self->_extensionInstance;
    self->_extensionInstance = v13;

    v7 = self->_extensionInstance != 0;
  }

  return v7;
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  PREditingSceneViewControllerTopButtonLayout *result;

  result = (PREditingSceneViewControllerTopButtonLayout *)objc_opt_class();
  if (result)
    return (PREditingSceneViewControllerTopButtonLayout *)-[PREditingSceneViewControllerTopButtonLayout _topButtonLayout](result, "_topButtonLayout");
  retstr->var1.origin = 0u;
  retstr->var1.size = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  void (**v11)(id, id);
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v11 = (void (**)(id, id))a7;
  if (a4 == 1)
  {
    v12 = (objc_class *)MEMORY[0x24BE74C30];
    v13 = a6;
    v14 = a5;
    v15 = [v12 alloc];
    objc_msgSend(v14, "_path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(v15, "initWithPath:extensionIdentifier:", v16, self->_extensionIdentifier);
    v21 = 0;
    +[PRUISPosterConfigurationFinalizer finalizedConfigurationForAttributes:withConfiguredProperties:error:](PRUISPosterConfigurationFinalizer, "finalizedConfigurationForAttributes:withConfiguredProperties:error:", v17, v13, &v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v21;
  }
  else
  {
    v19 = 0;
    v18 = 0;
  }
  v11[2](v11, v19);
  -[PRUISPosterEditingViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "editingViewController:didFinishWithConfiguration:", self, v18);

}

- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3
{
  id v4;

  -[PRUISPosterEditingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "editingViewControllerDidFinishShowingContent:", self);

}

- (BOOL)showsContentWhenReady
{
  return self->_showsContentWhenReady;
}

- (PRUISPosterEditingViewControllerDelegate)delegate
{
  return (PRUISPosterEditingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRSPosterConfiguration)configuration
{
  return self->_configuration;
}

- (PRUISPosterEditingContext)context
{
  return self->_context;
}

- (unint64_t)acceptButtonType
{
  return self->_acceptButtonType;
}

- (int64_t)boundingShape
{
  return self->_boundingShape;
}

- (BOOL)prefersDisplayingSnapshotBeforePresentation
{
  return self->_prefersDisplayingSnapshotBeforePresentation;
}

- (void)setPrefersDisplayingSnapshotBeforePresentation:(BOOL)a3
{
  self->_prefersDisplayingSnapshotBeforePresentation = a3;
}

- (BOOL)hasPreparedForEditing
{
  return self->_hasPreparedForEditing;
}

- (void)setHasPreparedForEditing:(BOOL)a3
{
  self->_hasPreparedForEditing = a3;
}

- (PRUISPosterSnapshotCache)snapshotCache
{
  return self->_snapshotCache;
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (UIImageView)snapshotImageView
{
  return self->_snapshotImageView;
}

- (void)setSnapshotImageView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotImageView, a3);
}

- (PFPosterPath)path
{
  return self->_path;
}

- (PREditingSceneViewController)editingSceneViewController
{
  return self->_editingSceneViewController;
}

- (void)setEditingSceneViewController:(id)a3
{
  objc_storeStrong((id *)&self->_editingSceneViewController, a3);
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (PFPosterExtensionProvider)extensionDataSource
{
  return self->_extensionDataSource;
}

- (void)setExtensionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_extensionDataSource, a3);
}

- (PRMutablePosterConfiguration)temporaryConfiguration
{
  return self->_temporaryConfiguration;
}

- (void)setTemporaryConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryConfiguration, a3);
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
  objc_storeStrong((id *)&self->_extensionInstance, a3);
}

- (NSArray)notificationObservers
{
  return self->_notificationObservers;
}

- (void)setNotificationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_notificationObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_temporaryConfiguration, 0);
  objc_storeStrong((id *)&self->_extensionDataSource, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_editingSceneViewController, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_snapshotImageView, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_role, 0);
}

+ (void)posterEditingViewControllerForProvider:role:context:boundingShape:error:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.2()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.3()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.4()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.5()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExistingConfiguration:context:boundingShape:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExistingConfiguration:context:boundingShape:.cold.2()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExistingConfiguration:context:boundingShape:.cold.3()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExistingConfiguration:context:boundingShape:.cold.4()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_prepareEditingForNewPoster
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_prepareEditingForPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_2445ED000, a2, a3, "Could not find extension with id: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)posterExtensionProvider:(uint64_t)a1 foundExtensions:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  v8 = 2048;
  v9 = a1;
  v10 = 2114;
  v11 = v4;
  v6 = v5;
  _os_log_error_impl(&dword_2445ED000, a2, OS_LOG_TYPE_ERROR, "(%{public}@:%p)Could not find extension with id: %{public}@", v7, 0x20u);

}

@end
