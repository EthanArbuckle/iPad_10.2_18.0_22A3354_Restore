@implementation NCNotificationListSupplementaryViewsSection

- (NCNotificationListViewProtocol)listView
{
  NCNotificationListViewProtocol *listView;
  NCNotificationListView *v4;
  NCNotificationListViewProtocol *v5;

  listView = self->_listView;
  if (!listView)
  {
    v4 = -[NCNotificationListView initWithModelType:purpose:]([NCNotificationListView alloc], "initWithModelType:purpose:", objc_opt_class(), self->_identifier);
    v5 = self->_listView;
    self->_listView = (NCNotificationListViewProtocol *)v4;

    -[NCNotificationListViewProtocol setGrouped:](self->_listView, "setGrouped:", 0);
    -[NCNotificationListViewProtocol setDataSource:](self->_listView, "setDataSource:", self);
    -[NCNotificationListViewProtocol setRevealed:](self->_listView, "setRevealed:", 1);
    -[NCNotificationListViewProtocol setRevealPercentage:](self->_listView, "setRevealPercentage:", 1.0);
    listView = self->_listView;
  }
  return listView;
}

- (NCNotificationListSupplementaryViewsSection)initWithPosition:(unint64_t)a3
{
  NCNotificationListSupplementaryViewsSection *v4;
  NCNotificationListSupplementaryViewsSection *v5;
  NSMutableArray *v6;
  NSMutableArray *orderedSupplementaryViewsGroups;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationListSupplementaryViewsSection;
  v4 = -[NCNotificationListSupplementaryViewsSection init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_position = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedSupplementaryViewsGroups = v5->_orderedSupplementaryViewsGroups;
    v5->_orderedSupplementaryViewsGroups = v6;

  }
  return v5;
}

- (void)collapseAllExpandedSupplementaryViewsGroups
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_orderedSupplementaryViewsGroups, "enumerateObjectsUsingBlock:", &__block_literal_global_40);
}

void __90__NCNotificationListSupplementaryViewsSection_collapseAllExpandedSupplementaryViewsGroups__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_msgSend(v2, "isGrouped") & 1) == 0)
    objc_msgSend(v2, "setGrouped:animated:", 1, 1);

}

- (void)cancelTouchesOnHostedViews:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_supplementaryContainerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "supplementaryViewsContainer:requestsCancelTouchesOnAllSupplementaryViewControllers:", self, v3);

}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4;
  NSMutableArray *orderedSupplementaryViewsGroups;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__NCNotificationListSupplementaryViewsSection_adjustForLegibilitySettingsChange___block_invoke;
  v7[3] = &unk_1E8D1F8B0;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedSupplementaryViewsGroups, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __81__NCNotificationListSupplementaryViewsSection_adjustForLegibilitySettingsChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForLegibilitySettingsChange:", *(_QWORD *)(a1 + 32));
}

- (BOOL)adjustForContentSizeCategoryChange
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_orderedSupplementaryViewsGroups, "enumerateObjectsUsingBlock:", &__block_literal_global_4);
  return 1;
}

uint64_t __81__NCNotificationListSupplementaryViewsSection_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForContentSizeCategoryChange");
}

- (void)setViewControllerSortComparator:(id)a3
{
  void *v4;
  id viewControllerSortComparator;
  NSMutableArray *orderedSupplementaryViewsGroups;
  _QWORD v7[5];

  v4 = _Block_copy(a3);
  viewControllerSortComparator = self->_viewControllerSortComparator;
  self->_viewControllerSortComparator = v4;

  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__NCNotificationListSupplementaryViewsSection_setViewControllerSortComparator___block_invoke;
  v7[3] = &unk_1E8D1F8B0;
  v7[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedSupplementaryViewsGroups, "enumerateObjectsUsingBlock:", v7);
}

uint64_t __79__NCNotificationListSupplementaryViewsSection_setViewControllerSortComparator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setViewControllerSortComparator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

- (unint64_t)supplementaryViewControllersCount
{
  NSMutableArray *orderedSupplementaryViewsGroups;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__NCNotificationListSupplementaryViewsSection_supplementaryViewControllersCount__block_invoke;
  v5[3] = &unk_1E8D1F8F8;
  v5[4] = &v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedSupplementaryViewsGroups, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __80__NCNotificationListSupplementaryViewsSection_supplementaryViewControllersCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (NSArray)groupingIdentifiers
{
  id v3;
  NSMutableArray *orderedSupplementaryViewsGroups;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__NCNotificationListSupplementaryViewsSection_groupingIdentifiers__block_invoke;
  v7[3] = &unk_1E8D1F8B0;
  v5 = v3;
  v8 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedSupplementaryViewsGroups, "enumerateObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

void __66__NCNotificationListSupplementaryViewsSection_groupingIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "groupingIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (NSDictionary)supplementaryViewControllersByGroupingIdentifiers
{
  id v3;
  NSMutableArray *orderedSupplementaryViewsGroups;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__NCNotificationListSupplementaryViewsSection_supplementaryViewControllersByGroupingIdentifiers__block_invoke;
  v7[3] = &unk_1E8D1F8B0;
  v5 = v3;
  v8 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedSupplementaryViewsGroups, "enumerateObjectsUsingBlock:", v7);

  return (NSDictionary *)v5;
}

void __96__NCNotificationListSupplementaryViewsSection_supplementaryViewControllersByGroupingIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "groupingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "supplementaryViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, v3);

  }
}

- (NSArray)supplementaryViewControllers
{
  id v3;
  NSMutableArray *orderedSupplementaryViewsGroups;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__NCNotificationListSupplementaryViewsSection_supplementaryViewControllers__block_invoke;
  v7[3] = &unk_1E8D1F8B0;
  v5 = v3;
  v8 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedSupplementaryViewsGroups, "enumerateObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

void __75__NCNotificationListSupplementaryViewsSection_supplementaryViewControllers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "supplementaryViewControllers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (void)insertSupplementaryViewController:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NCNotificationListSupplementaryViewsGroup *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationListSupplementaryViewsSection _logDescription](self, "_logDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v10;
    v21 = 2114;
    v22 = v7;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting supplementary view controller with configuration = %{public}@ [viewController=%{public}@]", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(v7, "groupingIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NCNotificationListSupplementaryViewsSection _indexOfExistingSupplementaryViewsGroupForGroupingIdentifier:](self, "_indexOfExistingSupplementaryViewsGroupForGroupingIdentifier:", v11);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = objc_alloc_init(NCNotificationListSupplementaryViewsGroup);
    -[NCNotificationListPresentableGroup setNotificationListCache:](v13, "setNotificationListCache:", self->_notificationListCache);
    -[NCNotificationListSupplementaryViewsGroup setSectionIdentifier:](v13, "setSectionIdentifier:", self->_identifier);
    -[NCNotificationListPresentableGroup setDelegate:](v13, "setDelegate:", self);
    -[NCNotificationListSupplementaryViewsGroup setGroupingIdentifier:](v13, "setGroupingIdentifier:", v11);
    objc_msgSend(v7, "groupName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListSupplementaryViewsGroup setGroupName:](v13, "setGroupName:", v14);

    -[NCNotificationListSupplementaryViewsGroup setViewControllerSortComparator:](v13, "setViewControllerSortComparator:", self->_viewControllerSortComparator);
    v15 = -[NCNotificationListSupplementaryViewsSection _sortedIndexForGroupingIdentifier:](self, "_sortedIndexForGroupingIdentifier:", v11);
    -[NSMutableArray insertObject:atIndex:](self->_orderedSupplementaryViewsGroups, "insertObject:atIndex:", v13, v15);
    -[NCNotificationListSupplementaryViewsSection listView](self, "listView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertViewAtIndex:animated:", v15, 1);

  }
  else
  {
    v17 = v12;
    -[NSMutableArray objectAtIndex:](self->_orderedSupplementaryViewsGroups, "objectAtIndex:", v12);
    v13 = (NCNotificationListSupplementaryViewsGroup *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListSupplementaryViewsSection _updatePositionOfGroupAtIndex:](self, "_updatePositionOfGroupAtIndex:", v17);
  }
  -[NCNotificationListSupplementaryViewsGroup insertSupplementaryViewController:withConfiguration:](v13, "insertSupplementaryViewController:withConfiguration:", v6, v7);
  -[NCNotificationListSupplementaryViewsSection delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "supplementaryViewSectionDidChangeContent:", self);

}

- (void)updateSupplementaryViewController:(id)a3 withConfiguration:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = -[NCNotificationListSupplementaryViewsSection _indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:](self, "_indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:", v11);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    -[NSMutableArray objectAtIndex:](self->_orderedSupplementaryViewsGroups, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateSupplementaryViewController:withConfiguration:", v11, v6);
    -[NCNotificationListSupplementaryViewsSection _updatePositionOfGroupAtIndex:](self, "_updatePositionOfGroupAtIndex:", v8);

  }
  -[NCNotificationListSupplementaryViewsSection delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "supplementaryViewSectionDidChangeContent:", self);

}

- (void)updatePositionIfNeededForSupplementaryViewController:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[NCNotificationListSupplementaryViewsSection _indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:](self, "_indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NSMutableArray objectAtIndex:](self->_orderedSupplementaryViewsGroups, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatePositionIfNeededForSupplementaryViewController:", v7);
    -[NCNotificationListSupplementaryViewsSection _updatePositionOfGroupAtIndex:](self, "_updatePositionOfGroupAtIndex:", v5);

  }
}

- (void)removeSupplementaryViewController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationListSupplementaryViewsSection _logDescription](self, "_logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removing supplementary view controller [viewController=%{public}@]", (uint8_t *)&v13, 0x16u);

  }
  v8 = -[NCNotificationListSupplementaryViewsSection _indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:](self, "_indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:", v4);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    -[NSMutableArray objectAtIndex:](self->_orderedSupplementaryViewsGroups, "objectAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeSupplementaryViewController:", v4);
    if (!objc_msgSend(v10, "count"))
    {
      -[NSMutableArray removeObjectAtIndex:](self->_orderedSupplementaryViewsGroups, "removeObjectAtIndex:", v9);
      -[NCNotificationListSupplementaryViewsSection listView](self, "listView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeViewAtIndex:animated:", v9, 1);

    }
  }
  -[NCNotificationListSupplementaryViewsSection delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "supplementaryViewSectionDidChangeContent:", self);

}

- (void)presentViewControllerModally:(id)a3 fromSupplementaryViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id WeakRetained;
  NCModalNavigationController *v13;
  id v14;

  v7 = a5;
  v14 = a3;
  v10 = a4;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = -[NCModalNavigationController initWithRootViewController:]([NCModalNavigationController alloc], "initWithRootViewController:", v14);
    objc_msgSend(WeakRetained, "notificationListBaseComponent:requestsModalPresentationOfNavigationController:sender:animated:completion:", self, v13, v10, v7, v11);

  }
}

- (id)hostingPlatterViewForSupplementaryViewController:(id)a3
{
  id v4;
  NSMutableArray *orderedSupplementaryViewsGroups;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__NCNotificationListSupplementaryViewsSection_hostingPlatterViewForSupplementaryViewController___block_invoke;
  v9[3] = &unk_1E8D1F920;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedSupplementaryViewsGroups, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __96__NCNotificationListSupplementaryViewsSection_hostingPlatterViewForSupplementaryViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "hostingPlatterViewForSupplementaryViewController:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (CGSize)allowedSupplementaryViewSize
{
  void *v2;
  CGFloat Width;
  double v4;
  double v5;
  CGSize result;
  CGRect v7;

  -[NCNotificationListSupplementaryViewsSection listView](self, "listView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  Width = CGRectGetWidth(v7);

  v4 = 0.0;
  v5 = Width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  double v8;
  void *v9;
  void *v10;
  double v11;

  v8 = 0.0;
  if (-[NSMutableArray count](self->_orderedSupplementaryViewsGroups, "count", a3) > a4)
  {
    -[NSMutableArray objectAtIndex:](self->_orderedSupplementaryViewsGroups, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "listView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeThatFits:", a5, 0.0);
    v8 = v11;

  }
  return v8;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;

  if (-[NSMutableArray count](self->_orderedSupplementaryViewsGroups, "count", a3) <= a4)
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_orderedSupplementaryViewsGroups, "objectAtIndex:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "listView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  return -[NSMutableArray count](self->_orderedSupplementaryViewsGroups, "count", a3);
}

- (void)recycleView:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "recycleVisibleViews");

}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListSupplementaryViewsSection;
  if (-[NCNotificationListSupplementaryViewsSection respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else if (+[NCNotificationStructuredListUtilities isNotificationListBaseComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListBaseComponentDelegateMethod:", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (+[NCNotificationStructuredListUtilities isNotificationListBaseComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListBaseComponentDelegateMethod:", objc_msgSend(v4, "selector")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "invokeWithTarget:", WeakRetained);
    }
    else if (objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EFC09198)
           && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "invokeWithTarget:", v6);

    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)NCNotificationListSupplementaryViewsSection;
      -[NCNotificationListSupplementaryViewsSection forwardInvocation:](&v7, sel_forwardInvocation_, v4);
    }

  }
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationListSupplementaryViewsSection _logDescription](self, "_logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupingIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ supplementary view groups %{public}@ did remove all cells; cleanup up the group",
      (uint8_t *)&v11,
      0x16u);

  }
  -[NCNotificationListSupplementaryViewsSection _removeNotificationViewsGroup:animated:](self, "_removeNotificationViewsGroup:animated:", v4, 1);
  -[NCNotificationListSupplementaryViewsSection delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationListBaseComponentDidRemoveAll:", self);

}

- (void)_removeNotificationViewsGroup:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = -[NSMutableArray indexOfObject:](self->_orderedSupplementaryViewsGroups, "indexOfObject:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[NSMutableArray removeObjectAtIndex:](self->_orderedSupplementaryViewsGroups, "removeObjectAtIndex:", v6);
    -[NCNotificationListSupplementaryViewsSection listView](self, "listView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeViewAtIndex:animated:isHorizontallyDisplaced:", v7, v4, objc_msgSend(v9, "isClearingAllNotificationRequestsForCellHorizontalSwipe"));

  }
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_orderedSupplementaryViewsGroups, "count");
}

+ (NSSet)presentableTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (void)clearAll
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NCNotificationListSupplementaryViewsSection orderedSupplementaryViewsGroups](self, "orderedSupplementaryViewsGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__NCNotificationListSupplementaryViewsSection_clearAll__block_invoke;
  v12[3] = &unk_1E8D1F8B0;
  v11 = v3;
  v13 = v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "notificationListBaseComponent:requestsClearingPresentables:", self, v11);
  -[NCNotificationListSupplementaryViewsSection orderedSupplementaryViewsGroups](self, "orderedSupplementaryViewsGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = v7 - 1;
  if (v7 - 1 >= 0)
  {
    do
    {
      -[NCNotificationListSupplementaryViewsSection listView](self, "listView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeViewAtIndex:animated:", v8, 1);

      -[NCNotificationListSupplementaryViewsSection orderedSupplementaryViewsGroups](self, "orderedSupplementaryViewsGroups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectAtIndex:", v8);

      --v8;
    }
    while (v8 != -1);
  }

}

void __55__NCNotificationListSupplementaryViewsSection_clearAll__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hostingViewControllers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (void)notificationListPresentableGroup:(id)a3 requestsScrollToTopOfCollectionWithCompletion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a4;
  v6 = a3;
  -[NCNotificationListSupplementaryViewsSection orderedSupplementaryViewsGroups](self, "orderedSupplementaryViewsGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13)
      v13[2]();
  }
  else
  {
    -[NCNotificationListSupplementaryViewsSection listView](self, "listView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutOffsetForViewAtIndex:", v8);
    v11 = v10;

    -[NCNotificationListSupplementaryViewsSection delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationListBaseComponent:requestsScrollingToContentOffset:withCompletion:", self, v13, v11);

  }
}

- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3
{
  return 1;
}

- (void)notificationListSupplementaryViewsGroup:(id)a3 cancelTouches:(BOOL)a4 onHostedViewController:(id)a5
{
  _BOOL8 v5;
  id WeakRetained;
  id v8;

  v5 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_supplementaryContainerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "supplementaryViewsContainer:requestsCancelTouches:onSupplementaryViewController:", self, v5, v8);

}

- (void)_updatePositionOfGroupAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndex:](self->_orderedSupplementaryViewsGroups, "objectAtIndex:");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupingIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NCNotificationListSupplementaryViewsSection _sortedIndexForGroupingIdentifier:](self, "_sortedIndexForGroupingIdentifier:", v5);
    v7 = (__PAIR128__(v6, a3) - v6) >> 64;
    if (v7 != a3)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_orderedSupplementaryViewsGroups, "removeObjectAtIndex:", a3);
      -[NSMutableArray insertObject:atIndex:](self->_orderedSupplementaryViewsGroups, "insertObject:atIndex:", v10, v7);
      -[NCNotificationListSupplementaryViewsSection listView](self, "listView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeViewAtIndex:animated:", a3, 0);

      -[NCNotificationListSupplementaryViewsSection listView](self, "listView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertViewAtIndex:animated:", v7, 1);

    }
  }
}

- (unint64_t)_indexOfExistingSupplementaryViewsGroupForSupplementaryViewController:(id)a3
{
  id v4;
  NSMutableArray *orderedSupplementaryViewsGroups;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __117__NCNotificationListSupplementaryViewsSection__indexOfExistingSupplementaryViewsGroupForSupplementaryViewController___block_invoke;
  v9[3] = &unk_1E8D1F948;
  v10 = v4;
  v6 = v4;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](orderedSupplementaryViewsGroups, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __117__NCNotificationListSupplementaryViewsSection__indexOfExistingSupplementaryViewsGroupForSupplementaryViewController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsSupplementaryViewController:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)_indexOfExistingSupplementaryViewsGroupForGroupingIdentifier:(id)a3
{
  id v4;
  NSMutableArray *orderedSupplementaryViewsGroups;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  orderedSupplementaryViewsGroups = self->_orderedSupplementaryViewsGroups;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __108__NCNotificationListSupplementaryViewsSection__indexOfExistingSupplementaryViewsGroupForGroupingIdentifier___block_invoke;
  v9[3] = &unk_1E8D1F948;
  v10 = v4;
  v6 = v4;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](orderedSupplementaryViewsGroups, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __108__NCNotificationListSupplementaryViewsSection__indexOfExistingSupplementaryViewsGroupForGroupingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "groupingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (unint64_t)_sortedIndexForGroupingIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (self->_groupSortComparator && -[NSMutableArray count](self->_orderedSupplementaryViewsGroups, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_orderedSupplementaryViewsGroups, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "groupingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (*((uint64_t (**)(void))self->_groupSortComparator + 2))();
      if (v8 == 1)
        break;
      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_orderedSupplementaryViewsGroups, "count"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_logDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@]"), v5, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NCNotificationListSupplementaryViewsContainingDelegate)supplementaryContainerDelegate
{
  return (NCNotificationListSupplementaryViewsContainingDelegate *)objc_loadWeakRetained((id *)&self->_supplementaryContainerDelegate);
}

- (void)setSupplementaryContainerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_supplementaryContainerDelegate, a3);
}

- (NCNotificationListCache)notificationListCache
{
  return self->_notificationListCache;
}

- (void)setNotificationListCache:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListCache, a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (BOOL)supportsViewGrouping
{
  return self->_supportsViewGrouping;
}

- (void)setSupportsViewGrouping:(BOOL)a3
{
  self->_supportsViewGrouping = a3;
}

- (id)groupSortComparator
{
  return self->_groupSortComparator;
}

- (void)setGroupSortComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)viewControllerSortComparator
{
  return self->_viewControllerSortComparator;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NCNotificationListBaseComponentDelegate)delegate
{
  return (NCNotificationListBaseComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)position
{
  return self->_position;
}

- (NSMutableArray)orderedSupplementaryViewsGroups
{
  return self->_orderedSupplementaryViewsGroups;
}

- (void)setOrderedSupplementaryViewsGroups:(id)a3
{
  objc_storeStrong((id *)&self->_orderedSupplementaryViewsGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedSupplementaryViewsGroups, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_viewControllerSortComparator, 0);
  objc_storeStrong(&self->_groupSortComparator, 0);
  objc_storeStrong((id *)&self->_notificationListCache, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_destroyWeak((id *)&self->_supplementaryContainerDelegate);
}

@end
