@implementation PXTripsFeedActionPerformer

- (BOOL)handlePrimaryActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 fromViewController:(id)a5
{
  __int128 v7;
  id v8;
  void *v9;
  __int128 v11;
  __int128 v12;

  v7 = *(_OWORD *)&a3->item;
  v11 = *(_OWORD *)&a3->dataSourceIdentifier;
  v12 = v7;
  v8 = a5;
  objc_msgSend(a4, "objectReferenceAtIndexPath:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PXTripsFeedActionPerformer navigateToObjectReference:originalSource:fromViewController:animated:willPresentHandler:completionHandler:](self, "navigateToObjectReference:originalSource:fromViewController:animated:willPresentHandler:completionHandler:", v9, 0, v8, 1, 0, 0, v11, v12);

  return (char)self;
}

- (BOOL)navigateToObjectReference:(id)a3 originalSource:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 willPresentHandler:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  id v14;
  void (**v15)(id, void *);
  void (**v16)(id, void *);
  void *v17;
  void *v18;
  void *v19;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;

  v10 = a6;
  v14 = a5;
  v15 = (void (**)(id, void *))a7;
  v16 = (void (**)(id, void *))a8;
  objc_msgSend(a3, "itemObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "px_descriptionForAssertionMessage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedActionPerformer.m"), 24, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v25, v26);

    }
    -[PXTripsFeedActionPerformer _viewControllerForNavigationToTrip:](self, "_viewControllerForNavigationToTrip:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v15[2](v15, v18);
    objc_msgSend(v14, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pushViewController:animated:", v18, v10);

    if (v16)
      v16[2](v16, v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedActionPerformer.m"), 24, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v22);

  }
  return v17 != 0;
}

- (id)_viewControllerForNavigationToTrip:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedActionPerformer.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trip"));

  }
  -[PXTripsFeedActionPerformer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _PXPhotosViewConfigurationForAssetCollection(v5, 0, 0, 0, 0, 0, 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSectionHeaderStyle:", 6);
    objc_msgSend(v7, "setSectionBodyStyle:", 3);
    objc_msgSend(v7, "setAllowedBehaviors:", objc_msgSend(v7, "allowedBehaviors") | 0x4000);
    objc_msgSend(v6, "viewControllerForPhotosViewConfiguration:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  }

  return v8;
}

- (PXTripsFeedActionPerformerDelegate)delegate
{
  return (PXTripsFeedActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
