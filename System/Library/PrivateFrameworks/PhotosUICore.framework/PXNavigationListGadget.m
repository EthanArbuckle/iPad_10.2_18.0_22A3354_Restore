@implementation PXNavigationListGadget

- (void)contentHeightDidChange
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXNavigationListGadget;
  -[PXNavigationListController contentHeightDidChange](&v5, sel_contentHeightDidChange);
  -[PXNavigationListGadget delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PXNavigationListGadget_contentHeightDidChange__block_invoke;
  v4[3] = &unk_1E5149198;
  v4[4] = self;
  objc_msgSend(v3, "gadget:animateChanges:", self, v4);

}

- (void)setVisibleContentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_visibleContentRect;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_visibleContentRect = &self->_visibleContentRect;
  if (!CGRectEqualToRect(a3, self->_visibleContentRect))
  {
    p_visibleContentRect->origin.x = x;
    p_visibleContentRect->origin.y = y;
    p_visibleContentRect->size.width = width;
    p_visibleContentRect->size.height = height;
    -[PXNavigationListGadget view](self, "view");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        v16.origin.x = x;
        v16.origin.y = y;
        v16.size.width = width;
        v16.size.height = height;
        objc_msgSend(v15, "setContentViewHeight:", CGRectGetMaxY(v16));

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "px_descriptionForAssertionMessage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListGadget.m"), 46, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.view"), v12, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListGadget.m"), 46, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.view"), v12);
    }

    goto LABEL_4;
  }
}

- (unint64_t)gadgetType
{
  return 9;
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PXNavigationListController contentHeightForWidth:](self, "contentHeightForWidth:", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[PXNavigationListController dataSectionManager](self, "dataSectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  BOOL v6;
  PXGadgetSpec *v7;

  v7 = (PXGadgetSpec *)a3;
  v5 = self->_gadgetSpec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGadgetSpec isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_gadgetSpec, a3);
      -[PXGadgetSpec contentInsets](v7, "contentInsets");
      -[PXNavigationListController setContentInsets:](self, "setContentInsets:");
    }
  }

}

- (unint64_t)headerStyle
{
  return 3;
}

- (BOOL)canNavigateToCollection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXNavigationListGadget _listItemForCollection:](self, "_listItemForCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    -[PXNavigationListController dataSectionManager](self, "dataSectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v4);

  }
  return v6;
}

- (void)navigateToCollection:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(_QWORD, PXNavigationListGadget *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void (**v16)(_QWORD, PXNavigationListGadget *);
  PXNavigationListGadget *v17;
  id v18;

  v6 = a4;
  v18 = a3;
  v8 = (void (**)(_QWORD, PXNavigationListGadget *))a5;
  -[PXNavigationListGadget _listItemForCollection:](self, "_listItemForCollection:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PXNavigationListGadget delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gadgetViewControllerHostingGadget:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXNavigationListController dataSectionManager](self, "dataSectionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataSection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "existingFetchResultForListItem:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = +[PXNavigationListController navigateToListItem:sourceViewController:existingAssetsFetchResult:animated:completion:](PXNavigationListController, "navigateToListItem:sourceViewController:existingAssetsFetchResult:animated:completion:", v9, v11, v14, v6, v8);
  }
  else if (v8)
  {
    if (-[PXNavigationListGadget canNavigateToCollection:](self, "canNavigateToCollection:", v18))
    {
      v16 = v8;
      v17 = self;
    }
    else
    {
      v16 = v8;
      v17 = 0;
    }
    v8[2](v16, v17);
  }

}

- (id)_listItemForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PXNavigationListController dataSectionManager](self, "dataSectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") < 1)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "isEqual:", v9);

      if ((v10 & 1) != 0)
        break;

      if (++v7 >= objc_msgSend(v6, "count"))
        goto LABEL_5;
    }
  }

  return v8;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(a3, "collectionHierarchy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListController dataSectionManager](self, "dataSectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_objectAfterObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXNavigationListGadget _listItemForCollection:](self, "_listItemForCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, uint64_t, _QWORD);
  unint64_t v19;
  uint8_t buf[4];
  PXNavigationListGadget *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v8, "collectionHierarchy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListController dataSectionManager](self, "dataSectionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_objectAfterObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[PXNavigationListGadget _listItemForCollection:](self, "_listItemForCollection:", v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    if (objc_msgSend(v8, "type") == 8 && objc_msgSend(v8, "revealMode") == 2)
    {
      v9[2](v9, 1, 0);
    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __74__PXNavigationListGadget_navigateToDestination_options_completionHandler___block_invoke;
      v16[3] = &unk_1E513A638;
      v17 = v8;
      v19 = a4;
      v18 = v9;
      -[PXNavigationListGadget navigateToCollection:animated:completion:](self, "navigateToCollection:animated:completion:", v13, (a4 >> 1) & 1, v16);

    }
  }
  else
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v8;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Gadget %@ couldn't navigate to navigation destination %@", buf, 0x16u);
    }

    v9[2](v9, 2, 0);
  }

}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (CGRect)visibleContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleContentRect.origin.x;
  y = self->_visibleContentRect.origin.y;
  width = self->_visibleContentRect.size.width;
  height = self->_visibleContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __74__PXNavigationListGadget_navigateToDestination_options_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "navigateToDestination:options:completionHandler:", a1[4], a1[6], a1[5]);
}

void __48__PXNavigationListGadget_contentHeightDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gadget:didChange:", *(_QWORD *)(a1 + 32), 64);

}

@end
