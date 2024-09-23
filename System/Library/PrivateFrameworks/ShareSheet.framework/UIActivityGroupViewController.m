@implementation UIActivityGroupViewController

- (UIActivityGroupViewController)initWithCollectionViewLayout:(id)a3
{
  return -[UIActivityGroupViewController initWithActivityCategory:userDefaults:](self, "initWithActivityCategory:userDefaults:", 0, 0);
}

- (UIActivityGroupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[UIActivityGroupViewController initWithActivityCategory:userDefaults:](self, "initWithActivityCategory:userDefaults:", 0, 0);
}

- (UIActivityGroupViewController)initWithCoder:(id)a3
{
  return -[UIActivityGroupViewController initWithActivityCategory:userDefaults:](self, "initWithActivityCategory:userDefaults:", 0, 0);
}

- (UIActivityGroupViewController)initWithActivityCategory:(int64_t)a3 activityProxies:(id)a4
{
  const __CFString *v6;
  const __CFString *v7;

  v6 = CFSTR("UIActivityCategoryShare");
  if (a3 != 1)
    v6 = 0;
  if (a3)
    v7 = v6;
  else
    v7 = CFSTR("UIActivityCategoryAction");
  -[UIActivityGroupViewController setVisibleActivityProxies:](self, "setVisibleActivityProxies:", a4);
  return -[UIActivityGroupViewController initWithActivityCategory:userDefaults:userDefaultsIdentifier:](self, "initWithActivityCategory:userDefaults:userDefaultsIdentifier:", a3, 0, v7);
}

- (UIActivityGroupViewController)initWithActivityCategory:(int64_t)a3 userDefaults:(id)a4
{
  return -[UIActivityGroupViewController initWithActivityCategory:userDefaults:userDefaultsIdentifier:](self, "initWithActivityCategory:userDefaults:userDefaultsIdentifier:");
}

- (UIActivityGroupViewController)initWithActivityCategory:(int64_t)a3 userDefaults:(id)a4 userDefaultsIdentifier:(id)a5
{
  id v8;
  id v9;
  _UIActivityGroupViewFlowLayout *v10;
  UIActivityGroupViewController *v11;
  UIActivityGroupViewController *v12;
  _UIActivityUserDefaults *v13;
  _UIUserDefaultsHostActivity *v14;
  void *v15;
  _UIUserDefaultsHostActivity *v16;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(_UIActivityGroupViewFlowLayout);
  -[_UIActivityGroupViewFlowLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](v10, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
  -[UIActivityGroupViewController setAllowsUserCustomization:](self, "setAllowsUserCustomization:", 1);
  -[UIActivityGroupViewController setPicker:](self, "setPicker:", 1);
  v18.receiver = self;
  v18.super_class = (Class)UIActivityGroupViewController;
  v11 = -[UIActivityGroupViewController initWithCollectionViewLayout:](&v18, sel_initWithCollectionViewLayout_, v10);
  v12 = v11;
  if (v11)
  {
    -[UIActivityGroupViewController setActivityCategory:](v11, "setActivityCategory:", a3);
    if (v8)
    {
      v13 = -[_UIActivityUserDefaults initWithUnderlyingUserDefaults:activityDefaultsKey:]([_UIActivityUserDefaults alloc], "initWithUnderlyingUserDefaults:activityDefaultsKey:", v8, v9);
      -[UIActivityGroupViewController setUserDefaults:](v12, "setUserDefaults:", v13);

      if (-[UIActivityGroupViewController allowsUserCustomization](v12, "allowsUserCustomization"))
      {
        v14 = [_UIUserDefaultsHostActivity alloc];
        -[UIActivityGroupViewController userDefaults](v12, "userDefaults");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[_UIUserDefaultsActivity initWithUserDefaults:activityCategory:](v14, "initWithUserDefaults:activityCategory:", v15, a3);
        -[UIActivityGroupViewController setUserDefaultsActivity:](v12, "setUserDefaultsActivity:", v16);

      }
      -[UIActivityGroupViewController registerClassForContentSizeCategoryChanges](v12, "registerClassForContentSizeCategoryChanges");
    }
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityGroupViewController unregisterForActivityUserDefaultsChanges](self, "unregisterForActivityUserDefaultsChanges");
  v3.receiver = self;
  v3.super_class = (Class)UIActivityGroupViewController;
  -[UIActivityGroupViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
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
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  _UIActivityDragGestureRecognizer *v18;
  void *v19;
  void *v20;
  UILongPressGestureRecognizer *editingGestureRecognizer;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)UIActivityGroupViewController;
  -[UIActivityGroupViewController viewDidLoad](&v22, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpaque:", 0);

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlwaysBounceHorizontal:", 1);

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelaysContentTouches:", 0);

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", 1);

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPrefetchDataSource:", self);

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setFirstResponderKeyboardAvoidanceEnabled:", 0);

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("activity"));

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("placeholder"));

  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("userDefaults"));

  -[UIActivityGroupViewController userDefaults](self, "userDefaults");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = -[UIActivityGroupViewController allowsUserCustomization](self, "allowsUserCustomization");

    if (v17)
    {
      v18 = -[_UIActivityDragGestureRecognizer initWithTarget:action:]([_UIActivityDragGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleEditingGesture_);
      -[_UIActivityDragGestureRecognizer setDelegate:](v18, "setDelegate:", self);
      -[_UIActivityDragGestureRecognizer setMinimumPressDuration:](v18, "setMinimumPressDuration:", 0.35);
      -[UIActivityGroupViewController collectionView](self, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addGestureRecognizer:", v18);

      -[UIActivityGroupViewController activityGroupViewLayout](self, "activityGroupViewLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setEditingGestureRecognizer:", v18);

      editingGestureRecognizer = self->_editingGestureRecognizer;
      self->_editingGestureRecognizer = &v18->super;

      -[UIActivityGroupViewController registerForActivityUserDefaultsChanges](self, "registerForActivityUserDefaultsChanges");
    }
  }
}

- (void)setExternalSafeInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v7;
  id v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self->_externalSafeInset.top;
  if (self->_externalSafeInset.left != a3.left
    || v7 != top
    || self->_externalSafeInset.right != a3.right
    || self->_externalSafeInset.bottom != a3.bottom)
  {
    self->_externalSafeInset.top = top;
    self->_externalSafeInset.left = a3.left;
    self->_externalSafeInset.bottom = a3.bottom;
    self->_externalSafeInset.right = a3.right;
    -[UIActivityGroupViewController activityGroupViewLayout](self, "activityGroupViewLayout", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setExternalSafeInset:", top, left, bottom, right);
    objc_msgSend(v11, "invalidateLayout");

  }
}

- (void)setActivities:(id)a3
{
  -[UIActivityGroupViewController setActivities:animated:](self, "setActivities:animated:", a3, 1);
}

- (void)setActivities:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v4 = a4;
  v11 = a3;
  -[UIActivityGroupViewController userDefaultsActivity](self, "userDefaultsActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIActivityGroupViewController userDefaults](self, "userDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activitiesOrderedByUserActivityOrderForActivities:", v11);
    v8 = objc_claimAutoreleasedReturnValue();

    -[UIActivityGroupViewController userDefaultsActivity](self, "userDefaultsActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAvailableActivities:", v8);

    v10 = (id)v8;
  }
  else
  {
    v10 = v11;
  }
  v12 = v10;
  -[UIActivityGroupViewController _setActivities:animated:](self, "_setActivities:animated:", v10, v4);

}

- (void)_setActivities:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *activities;

  v4 = a4;
  if (self->_activities != a3)
  {
    v6 = (NSArray *)objc_msgSend(a3, "copy");
    activities = self->_activities;
    self->_activities = v6;

  }
  -[UIActivityGroupViewController _updateVisibleActivitiesAnimated:](self, "_updateVisibleActivitiesAnimated:", v4);
}

- (void)_updateVisibleActivitiesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];

  v3 = a3;
  -[UIActivityGroupViewController activities](self, "activities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityGroupViewController userDefaults](self, "userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__UIActivityGroupViewController__updateVisibleActivitiesAnimated___block_invoke;
    v12[3] = &unk_1E4004000;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  -[UIActivityGroupViewController userDefaultsActivity](self, "userDefaultsActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UIActivityGroupViewController userDefaultsActivity](self, "userDefaultsActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  -[UIActivityGroupViewController _setVisibleActivities:animated:](self, "_setVisibleActivities:animated:", v5, v3);

}

uint64_t __66__UIActivityGroupViewController__updateVisibleActivitiesAnimated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activityIsHidden:", v3);

  return v5 ^ 1u;
}

- (void)_setVisibleActivities:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  NSArray *v11;
  NSArray *visibleActivities;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  _BOOL8 hasActivities;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  UIActivityGroupViewController *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  UIActivityGroupViewController *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  UIActivityGroupViewController *v40;
  NSArray *v41;

  v4 = a4;
  v6 = (NSArray *)a3;
  v7 = -[NSArray count](v6, "count");
  self->_hasActivities = v7 != 0;
  if (v7)
  {
    if (v4
      && (-[NSArray count](self->_visibleActivities, "count")
       || (-[UIActivityGroupViewController view](self, "view"),
           v8 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(v8, "alpha"),
           v10 = v9,
           v8,
           v10 != 1.0)))
    {
      -[UIActivityGroupViewController collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = MEMORY[0x1E0C809B0];
      v37 = 3221225472;
      v38 = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke;
      v39 = &unk_1E4001248;
      v40 = self;
      v41 = v6;
      objc_msgSend(v20, "performBatchUpdates:completion:", &v36, 0);

    }
    else
    {
      if (self->_visibleActivities != v6)
      {
        v11 = (NSArray *)-[NSArray copy](v6, "copy");
        visibleActivities = self->_visibleActivities;
        self->_visibleActivities = v11;

      }
      -[UIActivityGroupViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reloadData");

    }
    -[UIActivityGroupViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "alpha");
    v23 = v22;

    if (v23 < 1.0)
    {
      v17 = (void *)MEMORY[0x1E0DC3F10];
      v18 = 0.35;
      if (!v4)
        v18 = 0.0;
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_4;
      v34 = &unk_1E4001608;
      v35 = self;
      v19 = &v31;
LABEL_17:
      objc_msgSend(v17, "animateWithDuration:animations:", v19, v18, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40);
    }
  }
  else
  {
    -[UIActivityGroupViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alpha");
    v16 = v15;

    if (v16 == 1.0)
    {
      v17 = (void *)MEMORY[0x1E0DC3F10];
      v18 = 0.35;
      if (!v4)
        v18 = 0.0;
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_5;
      v29 = &unk_1E4001608;
      v30 = self;
      v19 = &v26;
      goto LABEL_17;
    }
  }
  hasActivities = self->_hasActivities;
  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setScrollEnabled:", hasActivities);

}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1040);
  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1040);
  *(_QWORD *)(v4 + 1040) = v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_2;
  v18[3] = &unk_1E4004028;
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v6;
  v8 = v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v18);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_3;
  v15[3] = &unk_1E4004028;
  v16 = v2;
  v17 = v9;
  v11 = v9;
  v14 = v2;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteItemsAtIndexPaths:", v8);

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertItemsAtIndexPaths:", v11);

}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "containsObject:", a2) & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.35);

}

- (void)updateActivityProxies:(id)a3
{
  id v4;

  -[UIActivityGroupViewController setVisibleActivityProxies:](self, "setVisibleActivityProxies:", a3);
  -[UIActivityGroupViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  BOOL v3;

  -[UIActivityGroupViewController userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (-[UIActivityGroupViewController isEditing](self, "isEditing") != a3)
  {
    -[UIActivityGroupViewController userDefaults](self, "userDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8.receiver = self;
      v8.super_class = (Class)UIActivityGroupViewController;
      -[UIActivityGroupViewController setEditing:animated:](&v8, sel_setEditing_animated_, v5, v4);
    }
  }
}

- (void)_performHideActivityForMenuController:(id)a3
{
  void *v4;
  id v5;

  -[UIActivityGroupViewController indexPathForMenuActivity](self, "indexPathForMenuActivity", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIActivityGroupViewController indexPathForMenuActivity](self, "indexPathForMenuActivity");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIActivityGroupViewController hideItemAtIndexPath:](self, "hideItemAtIndexPath:", v5);

  }
}

- (id)activityForItemAtIndexPath:(id)a3
{
  if (!a3)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_visibleActivities, "objectAtIndexedSubscript:", objc_msgSend(a3, "item"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[UIActivityGroupViewController visibleActivityProxies](self, "visibleActivityProxies", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return -[NSArray count](self->_visibleActivities, "count");
  -[UIActivityGroupViewController visibleActivityProxies](self, "visibleActivityProxies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[4];
  id v36[2];
  id location;
  _QWORD v38[4];
  id v39;
  int v40;
  int v41;

  v6 = a3;
  v7 = a4;
  -[UIActivityGroupViewController visibleActivityProxies](self, "visibleActivityProxies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("activity"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", CFSTR("Hello"));

    objc_msgSend(v9, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 0.0);

    -[UIActivityGroupViewController visibleActivityProxies](self, "visibleActivityProxies");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActivityProxy:", v13);

    -[UIActivityGroupViewController visibleActivityProxies](self, "visibleActivityProxies");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "iconImageSlotID");

    -[UIActivityGroupViewController visibleActivityProxies](self, "visibleActivityProxies");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activityTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "slotIdentifier");

    v21 = (void *)*MEMORY[0x1E0DC4730];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __71__UIActivityGroupViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v38[3] = &unk_1E40016C8;
    v40 = v16;
    v22 = v9;
    v39 = v22;
    v41 = v20;
    objc_msgSend(v21, "_performBlockAfterCATransactionCommits:", v38);
    v23 = v39;
  }
  else
  {
    -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[UIActivityGroupViewController userDefaultsActivity](self, "userDefaultsActivity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = CFSTR("activity");
    if ((isKindOfClass & 1) != 0)
      v26 = CFSTR("placeholder");
    if (v23 == v25)
      v27 = CFSTR("userDefaults");
    else
      v27 = v26;
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v27, v7);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSequence:", objc_msgSend(v22, "sequence") + 1);
    if ((isKindOfClass & 1) != 0)
    {
      v28 = CFSTR("\n");
    }
    else
    {
      -[UIActivityGroupViewController _titleTextForActivity:](self, "_titleTextForActivity:", v23);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v28);

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v22, "imageView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setImage:", 0);

    }
    else
    {

      objc_msgSend(v22, "imageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setImage:", 0);

      v32 = (void *)objc_msgSend(v22, "sequence");
      location = 0;
      objc_initWeak(&location, v22);
      objc_msgSend(v23, "_activityImageLoader");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __71__UIActivityGroupViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
      v35[3] = &unk_1E4004050;
      objc_copyWeak(v36, &location);
      v36[1] = v32;
      objc_msgSend(v33, "getResourceWithBlock:", v35);

      objc_destroyWeak(v36);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v22, "setNeedsLayout");
  }

  return v22;
}

void __71__UIActivityGroupViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", *(unsigned int *)(a1 + 40));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0CD2F88];
  objc_msgSend(*(id *)(a1 + 32), "imageSlot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentsGravity:", v2);

  objc_msgSend(*(id *)(a1 + 32), "imageSlot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContents:", v23);

  objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", *(unsigned int *)(a1 + 44));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "titleSlot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentsScale:", v10);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "titleSlot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRasterizationScale:", v15);

  v18 = *MEMORY[0x1E0CD2F78];
  objc_msgSend(*(id *)(a1 + 32), "titleSlot");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentsGravity:", v18);

  objc_msgSend(*(id *)(a1 + 32), "titleSlot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContents:", v7);

}

void __71__UIActivityGroupViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "sequence") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_activityImageLoader");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "loadResourceIfNeeded");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)_titleTextForActivity:(id)a3
{
  return (id)objc_msgSend(a3, "activityTitle");
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;

  objc_msgSend(a4, "contentView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateConstraintsIfNeeded");

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v5;

  -[UIActivityGroupViewController visibleActivityProxies](self, "visibleActivityProxies", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 || self->_hasActivities;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[UIActivityGroupViewController visibleActivityProxies](self, "visibleActivityProxies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityGroupViewController userDefaultsActivity](self, "userDefaultsActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      LOBYTE(v7) = 1;
    }
    else if (self->_hasActivities)
    {
      v7 = -[UIActivityGroupViewController isEditing](self, "isEditing") ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  -[UIActivityGroupViewController visibleActivityProxies](self, "visibleActivityProxies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIActivityGroupViewController delegate](self, "delegate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "item");

    objc_msgSend(v15, "activityGroupViewController:didSelectActivityAtIndex:", self, v7);
  }
  else
  {
    -[UIActivityGroupViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHighlighted:", 0);

    -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", v5);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[UIActivityGroupViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v15, "activityType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.UIKit.activity.UserDefaults"));

      if (v12)
      {
        objc_msgSend(v10, "activityGroupViewController:availableActivitiesInCategory:", self, -[UIActivityGroupViewController activityCategory](self, "activityCategory"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAvailableActivities:", v13);

      }
    }
    -[UIActivityGroupViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activityGroupViewController:didSelectActivity:", self, v15);

  }
}

- (void)_updateItemSizeIfNeeded
{
  void *v3;
  double v4;
  double v5;

  -[UIActivityGroupViewController collectionViewLayout](self, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewContentSize");
  v5 = v4;

  -[UIActivityGroupViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, v5);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIActivityGroupViewController;
  -[UIActivityGroupViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[UIActivityGroupViewController _updateItemSizeIfNeeded](self, "_updateItemSizeIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIActivityGroupViewController;
  -[UIActivityGroupViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[UIActivityGroupViewController _dismissPresentedMenuControllers](self, "_dismissPresentedMenuControllers");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIActivityGroupViewController;
  -[UIActivityGroupViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[UIActivityGroupViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[UIActivityGroupViewController editingGestureRecognizer](self, "editingGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[UIActivityGroupViewController activityGroupViewLayout](self, "activityGroupViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForItemRecognizedByGesture:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityGroupViewController userDefaultsActivity](self, "userDefaultsActivity");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {
      v6 = 0;
      v14 = v9;
    }
    else
    {
      v11 = (void *)v10;
      objc_msgSend(v9, "activityType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

      if ((v13 & 1) != 0)
      {
        v6 = 0;
LABEL_12:

        goto LABEL_13;
      }
      -[UIActivityGroupViewController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cellForItemAtIndexPath:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (objc_msgSend(v14, "isHighlighted") & 1) != 0 || objc_msgSend(v14, "isSelected");
    }

    goto LABEL_12;
  }
  v6 = 1;
LABEL_13:

  return v6;
}

- (void)handleEditingGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  CGRect v32;
  CGRect v33;

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[UIActivityGroupViewController setIndexPathForMenuActivity:](self, "setIndexPathForMenuActivity:", 0);
    -[UIActivityGroupViewController setActivityIndexDidChangeWhileDragging:](self, "setActivityIndexDidChangeWhileDragging:", 0);
    -[UIActivityGroupViewController becomeFirstResponder](self, "becomeFirstResponder");
    -[UIActivityGroupViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
  }
  if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
    -[UIActivityGroupViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
    if (!-[UIActivityGroupViewController activityIndexDidChangeWhileDragging](self, "activityIndexDidChangeWhileDragging")&& objc_msgSend(v4, "state") == 3)
    {
      -[UIActivityGroupViewController activityGroupViewLayout](self, "activityGroupViewLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "indexPathForItemRecognizedByGesture:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityGroupViewController userDefaults](self, "userDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "canHideActivity:", v7);

      if (v9)
      {
        -[UIActivityGroupViewController setIndexPathForMenuActivity:](self, "setIndexPathForMenuActivity:", v6);
        if (v6)
        {
          -[UIActivityGroupViewController collectionView](self, "collectionView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "layoutAttributesForItemAtIndexPath:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "frame");
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;

          v32.origin.x = v13;
          v32.origin.y = v15;
          v32.size.width = v17;
          v32.size.height = v19;
          v33 = CGRectInset(v32, 5.0, 5.0);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
          objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_alloc(MEMORY[0x1E0DC39E8]);
          _ShareSheetBundle();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Hide"), CFSTR("Hide"), CFSTR("Localizable"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v25, "initWithTitle:action:", v27, sel__performHideActivityForMenuController_);
          v31[0] = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "setMenuItems:", v29);
          -[UIActivityGroupViewController collectionView](self, "collectionView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "showMenuFromView:rect:", v30, x, y, width, height);

        }
      }

    }
  }

}

- (void)_dismissPresentedMenuControllers
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "isMenuVisible");
  v4 = v9;
  if (v3)
  {
    objc_msgSend(v9, "menuItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (char *)objc_msgSend(v6, "action");

      if (v7 == sel__performHideActivityForMenuController_)
      {
        -[UIActivityGroupViewController collectionView](self, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hideMenuFromView:", v8);

      }
    }

    v4 = v9;
  }

}

- (id)targetIndexPathForMoveFromRowAtIndexPath:(id)a3 toProposedIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a4;
  -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UIActivityGroupViewController userDefaultsActivity](self, "userDefaultsActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      v10 = (void *)MEMORY[0x1E0CB36B0];
      v11 = objc_msgSend(v5, "item") - 1;
    }
    else
    {
      objc_msgSend(v6, "activityType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

      if (!v9)
      {
        v13 = v5;
        goto LABEL_9;
      }
      v10 = (void *)MEMORY[0x1E0CB36B0];
      v11 = objc_msgSend(v5, "item") + 1;
    }
    objc_msgSend(v10, "indexPathForItem:inSection:", v11, objc_msgSend(v5, "section"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = v13;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (id)collectionView:(id)a3 layout:(id)a4 moveItemAtIndexPath:(id)a5 toIndexPath:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  NSArray *activities;
  NSArray *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  UIActivityGroupViewController *v28;
  id v29;

  v8 = a5;
  -[UIActivityGroupViewController targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:](self, "targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:", v8, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityGroupViewController activities](self, "activities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObject:", v10);

    -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityGroupViewController activities](self, "activities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfObject:", v13);

    -[UIActivityGroupViewController activities](self, "activities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (NSArray *)objc_msgSend(v16, "mutableCopy");

    -[NSArray removeObjectAtIndex:](v17, "removeObjectAtIndex:", v12);
    -[NSArray insertObject:atIndex:](v17, "insertObject:atIndex:", v10, v15);
    activities = self->_activities;
    self->_activities = v17;
    v19 = v17;

    v20 = (void *)-[NSArray mutableCopy](self->_visibleActivities, "mutableCopy");
    objc_msgSend(v20, "removeObjectAtIndex:", objc_msgSend(v8, "item"));
    objc_msgSend(v20, "insertObject:atIndex:", v10, objc_msgSend(v9, "item"));
    objc_storeStrong((id *)&self->_visibleActivities, v20);
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __87__UIActivityGroupViewController_collectionView_layout_moveItemAtIndexPath_toIndexPath___block_invoke;
    v27 = &unk_1E4001248;
    v28 = self;
    v29 = v20;
    v21 = v20;
    -[UIActivityGroupViewController ignoreUserDefaultsChangesWhileUsingBlock:](self, "ignoreUserDefaultsChangesWhileUsingBlock:", &v24);
    -[UIActivityGroupViewController setActivityIndexDidChangeWhileDragging:](self, "setActivityIndexDidChangeWhileDragging:", 1, v24, v25, v26, v27, v28);
    v22 = v9;

  }
  return v9;
}

void __87__UIActivityGroupViewController_collectionView_layout_moveItemAtIndexPath_toIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateUserActivityOrderWithOrderedPartialActivities:", *(_QWORD *)(a1 + 40));

}

- (id)collectionView:(id)a3 layout:(id)a4 needsContainerViewForDraggingItemAtIndexPath:(id)a5
{
  UIActivityGroupViewController *v6;
  void *v7;

  -[UIActivityGroupViewController parentViewController](self, "parentViewController", a3, a4, a5);
  v6 = (UIActivityGroupViewController *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = self;
  -[UIActivityGroupViewController view](v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 preferredSizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v6 = a5;
  -[UIActivityGroupViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityGroupViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  objc_msgSend(v7, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityGroupViewController activityForItemAtIndexPath:](self, "activityForItemAtIndexPath:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityGroupViewController _titleTextForActivity:](self, "_titleTextForActivity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  +[_UIActivityGroupActivityCell preferredSizeForSheetWidth:sizeCategory:titleLabelText:screenScale:](_UIActivityGroupActivityCell, "preferredSizeForSheetWidth:sizeCategory:titleLabelText:screenScale:", v11, v13, v10, v14);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)hideItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__UIActivityGroupViewController_hideItemAtIndexPath___block_invoke;
  v6[3] = &unk_1E4001248;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIActivityGroupViewController ignoreUserDefaultsChangesWhileUsingBlock:](self, "ignoreUserDefaultsChangesWhileUsingBlock:", v6);

}

void __53__UIActivityGroupViewController_hideItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "activityForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivity:asHidden:", v3, 1);

  objc_msgSend(*(id *)(a1 + 32), "_updateVisibleActivitiesAnimated:", 1);
}

- (void)registerForActivityUserDefaultsChanges
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIActivityGroupViewController userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_activityUserDefaultsDidChange_, CFSTR("_UIActivityUserDefaultsDidChangeNotification"), v3);

}

- (void)unregisterForActivityUserDefaultsChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIActivityUserDefaultsDidChangeNotification"), 0);

}

- (void)ignoreUserDefaultsChangesWhileUsingBlock:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[UIActivityGroupViewController unregisterForActivityUserDefaultsChanges](self, "unregisterForActivityUserDefaultsChanges");
  v4[2](v4);

  -[UIActivityGroupViewController registerForActivityUserDefaultsChanges](self, "registerForActivityUserDefaultsChanges");
}

- (void)activityUserDefaultsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  -[UIActivityGroupViewController userDefaults](self, "userDefaults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityGroupViewController activities](self, "activities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitiesOrderedByUserActivityOrderForActivities:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[UIActivityGroupViewController userDefaultsActivity](self, "userDefaultsActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAvailableActivities:", v9);

  -[UIActivityGroupViewController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  -[UIActivityGroupViewController _setActivities:animated:](self, "_setActivities:animated:", v9, v8);
}

- (void)registerClassForContentSizeCategoryChanges
{
  if (registerClassForContentSizeCategoryChanges_onceToken != -1)
    dispatch_once(&registerClassForContentSizeCategoryChanges_onceToken, &__block_literal_global_52);
}

void __75__UIActivityGroupViewController_registerClassForContentSizeCategoryChanges__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObserver:selector:name:object:", objc_opt_class(), sel_invalidatePreferredSizes, *MEMORY[0x1E0DC48E8], 0);

}

- (UIActivityGroupViewControllerDelegate)delegate
{
  return (UIActivityGroupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityCategory:(int64_t)a3
{
  self->_activityCategory = a3;
}

- (NSArray)activities
{
  return self->_activities;
}

- (BOOL)hasActivities
{
  return self->_hasActivities;
}

- (void)setHasActivities:(BOOL)a3
{
  self->_hasActivities = a3;
}

- (NSArray)visibleActivities
{
  return self->_visibleActivities;
}

- (void)setVisibleActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (_UIActivityUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (_UIUserDefaultsActivity)userDefaultsActivity
{
  return self->_userDefaultsActivity;
}

- (void)setUserDefaultsActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultsActivity, a3);
}

- (UILongPressGestureRecognizer)editingGestureRecognizer
{
  return self->_editingGestureRecognizer;
}

- (void)setEditingGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_editingGestureRecognizer, a3);
}

- (CGPoint)initialDraggingLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialDraggingLocation.x;
  y = self->_initialDraggingLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialDraggingLocation:(CGPoint)a3
{
  self->_initialDraggingLocation = a3;
}

- (BOOL)activityIndexDidChangeWhileDragging
{
  return self->_activityIndexDidChangeWhileDragging;
}

- (void)setActivityIndexDidChangeWhileDragging:(BOOL)a3
{
  self->_activityIndexDidChangeWhileDragging = a3;
}

- (NSIndexPath)indexPathForMenuActivity
{
  return self->_indexPathForMenuActivity;
}

- (void)setIndexPathForMenuActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (BOOL)allowsUserCustomization
{
  return self->_allowsUserCustomization;
}

- (void)setAllowsUserCustomization:(BOOL)a3
{
  self->_allowsUserCustomization = a3;
}

- (NSArray)visibleActivityProxies
{
  return self->_visibleActivityProxies;
}

- (void)setVisibleActivityProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (BOOL)isEmbedded
{
  return self->_embedded;
}

- (void)setEmbedded:(BOOL)a3
{
  self->_embedded = a3;
}

- (BOOL)isPicker
{
  return self->_picker;
}

- (void)setPicker:(BOOL)a3
{
  self->_picker = a3;
}

- (UIEdgeInsets)externalSafeInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_externalSafeInset.top;
  left = self->_externalSafeInset.left;
  bottom = self->_externalSafeInset.bottom;
  right = self->_externalSafeInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIActivityGroupViewControllerDataSource)dataSource
{
  return (UIActivityGroupViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_visibleActivityProxies, 0);
  objc_storeStrong((id *)&self->_indexPathForMenuActivity, 0);
  objc_storeStrong((id *)&self->_editingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_userDefaultsActivity, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_visibleActivities, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
