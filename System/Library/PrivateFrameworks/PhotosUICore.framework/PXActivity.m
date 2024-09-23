@implementation PXActivity

- (PXActivity)initWithActionTitle:(id)a3 actionType:(id)a4 activityType:(id)a5 systemImageName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXActivity *v15;
  uint64_t v16;
  NSString *actionTitle;
  uint64_t v18;
  NSString *actionType;
  uint64_t v20;
  NSString *internalActivityType;
  uint64_t v22;
  NSString *systemImageName;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActivity.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionType"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActivity.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionTitle"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActivity.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityType"));

LABEL_4:
  v28.receiver = self;
  v28.super_class = (Class)PXActivity;
  v15 = -[UIActivity init](&v28, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    actionTitle = v15->_actionTitle;
    v15->_actionTitle = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    actionType = v15->_actionType;
    v15->_actionType = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    internalActivityType = v15->_internalActivityType;
    v15->_internalActivityType = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    systemImageName = v15->_systemImageName;
    v15->_systemImageName = (NSString *)v22;

  }
  return v15;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; actionTitle = %@; actionType = %@; internalActivityType = %@, systemImageName = %@>"),
    v5,
    self,
    self->_actionTitle,
    self->_actionType,
    self->_internalActivityType,
    self->_systemImageName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  id v5;
  $68E805B9361769A31E25A591B0537C54 *p_dataSourceFlags;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_dataSource, obj);
    p_dataSourceFlags = &self->_dataSourceFlags;
    self->_dataSourceFlags.respondsToActivityViewControllerForActivity = objc_opt_respondsToSelector() & 1;

    v7 = objc_loadWeakRetained((id *)&self->_dataSource);
    p_dataSourceFlags->respondsToActivityItemsForActivity = objc_opt_respondsToSelector() & 1;

  }
}

- (id)px_activityImageNamed:(id)a3
{
  UIImage *cachedCustomImage;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  cachedCustomImage = self->_cachedCustomImage;
  if (!cachedCustomImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhysicalScreenScale();
    objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 10, 0);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedCustomImage;
    self->_cachedCustomImage = v6;

    cachedCustomImage = self->_cachedCustomImage;
  }
  return cachedCustomImage;
}

- (id)px_activitySettingsImageNamed:(id)a3
{
  UIImage *cachedSmallCustomImage;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  cachedSmallCustomImage = self->_cachedSmallCustomImage;
  if (!cachedSmallCustomImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhysicalScreenScale();
    objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedSmallCustomImage;
    self->_cachedSmallCustomImage = v6;

    cachedSmallCustomImage = self->_cachedSmallCustomImage;
  }
  return cachedSmallCustomImage;
}

- (void)updateActivityViewControllerVisibleShareActions
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "activityViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateVisibleShareActionsIfNeeded");
LABEL_6:

    v3 = v8;
    goto LABEL_7;
  }
  if (self->_dataSourceFlags.respondsToActivityViewControllerForActivity
    && self->_dataSourceFlags.respondsToActivityItemsForActivity)
  {
    v8 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "activityViewControllerForActivity:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v6, "activityItemsForActivity:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_updateActivityItems:", v7);
    goto LABEL_6;
  }
LABEL_7:

}

- (id)createActivityBundleImageConfigurationForBundle:(id)a3 imageNamed:(id)a4 activityCategory:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  objc_msgSend(a3, "bundlePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D58]), "initWithImageName:bundlePath:activityCategory:", v7, v8, a5);

  return v9;
}

- (id)activityType
{
  return self->_internalActivityType;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD, _QWORD);
  char v7;
  BOOL v8;

  v4 = a3;
  -[PXActivity canPerformActivityActionHandler](self, "canPerformActivityActionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXActivity canPerformActivityActionHandler](self, "canPerformActivityActionHandler");
    v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, id, PXActivity *))v6)[2](v6, v4, self);
  }
  else
  {
    -[PXActivity actionDelegate](self, "actionDelegate");
    v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canPerformWithActivityItems:forActivity:", v4, self);
  }
  v8 = v7;

  return v8;
}

- (void)performActivity
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  -[PXActivity performActivityActionHandler](self, "performActivityActionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXActivity performActivityActionHandler](self, "performActivityActionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PXActivity *))v4)[2](v4, self);
  }
  else
  {
    -[PXActivity actionDelegate](self, "actionDelegate");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performActivity:", self);
  }

  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXActivity;
  return -[UIActivity _presentActivityOnViewController:animated:completion:](&v6, sel__presentActivityOnViewController_animated_completion_, a3, a4, a5);
}

- (PXActivityItemSourceController)itemSourceController
{
  return (PXActivityItemSourceController *)objc_loadWeakRetained((id *)&self->_itemSourceController);
}

- (void)setItemSourceController:(id)a3
{
  objc_storeWeak((id *)&self->_itemSourceController, a3);
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)performActivityActionHandler
{
  return self->_performActivityActionHandler;
}

- (void)setPerformActivityActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)canPerformActivityActionHandler
{
  return self->_canPerformActivityActionHandler;
}

- (void)setCanPerformActivityActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (PXActivityActionDelegate)actionDelegate
{
  return (PXActivityActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (PXActivityDataSource)dataSource
{
  return (PXActivityDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_canPerformActivityActionHandler, 0);
  objc_storeStrong(&self->_performActivityActionHandler, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_destroyWeak((id *)&self->_itemSourceController);
  objc_storeStrong((id *)&self->_internalActivityType, 0);
  objc_storeStrong((id *)&self->_cachedSmallCustomImage, 0);
  objc_storeStrong((id *)&self->_cachedCustomImage, 0);
}

+ (id)_destructiveActivities
{
  if (_destructiveActivities_onceToken != -1)
    dispatch_once(&_destructiveActivities_onceToken, &__block_literal_global_297093);
  return (id)_destructiveActivities__destructiveTypes;
}

+ (id)activityWithActionTitle:(id)a3 actionType:(id)a4 activityType:(id)a5 systemImageName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  __objc2_class **v16;
  void *v17;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "_destructiveActivities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v10);

  v16 = off_1E50B6740;
  if (!v15)
    v16 = off_1E50B1480;
  v17 = (void *)objc_msgSend(objc_alloc(*v16), "initWithActionTitle:actionType:activityType:systemImageName:", v13, v12, v10, v11);

  return v17;
}

void __36__PXActivity__destructiveActivities__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXActivityTypeDeleteMemory");
  v2[1] = CFSTR("PXActivityTypeBlockMemory");
  v2[2] = CFSTR("PXActivityTypeTrashMomentShare");
  v2[3] = CFSTR("PXActivityTypeSharingSuggestionDecline");
  v2[4] = CFSTR("PXActivityTypeRemovePersonFromHome");
  v2[5] = CFSTR("PXActivityTypeBlockPerson");
  v2[6] = CFSTR("PXActivityTypeDeleteAlbum");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_destructiveActivities__destructiveTypes;
  _destructiveActivities__destructiveTypes = v0;

}

@end
