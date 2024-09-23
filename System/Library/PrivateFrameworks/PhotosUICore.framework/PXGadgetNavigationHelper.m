@implementation PXGadgetNavigationHelper

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setPendingNavigationItem:(id)a3
{
  PXGadgetNavigationItem *v5;
  char v6;
  void *v7;
  int v8;
  PXGadgetNavigationItem *v9;

  v9 = (PXGadgetNavigationItem *)a3;
  v5 = self->_pendingNavigationItem;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = -[PXGadgetNavigationItem isEqual:](v9, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_pendingNavigationItem, a3);
      -[PXGadgetNavigationHelper _stopPendingNavigationTimer](self, "_stopPendingNavigationTimer");
      -[PXGadgetNavigationHelper delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "navigationHelperCanCurrentlyNavigate:", self);

      if (v9)
      {
        if (v8)
          -[PXGadgetNavigationHelper startPendingNavigationTimer](self, "startPendingNavigationTimer");
      }
    }
  }

}

- (BOOL)hasPendingNavigation
{
  void *v2;
  BOOL v3;

  -[PXGadgetNavigationHelper pendingNavigationItem](self, "pendingNavigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)navigateToFirstGadgetWithTypeDeferIfNeeded:(unint64_t)a3 animated:(BOOL)a4 nestedNavigationBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  BOOL v14;
  PXGadgetNavigationItem *v15;

  v5 = a4;
  v8 = a5;
  -[PXGadgetNavigationHelper delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gadgetDataSourceForNavigationHelper:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "navigationHelperCanCurrentlyNavigate:", self);
  objc_msgSend(v10, "gadgetsOfType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && v11)
  {
    v14 = -[PXGadgetNavigationHelper _navigateToGadget:animated:navigationBlock:](self, "_navigateToGadget:animated:navigationBlock:", v13, v5, v8);
  }
  else
  {
    v15 = -[PXGadgetNavigationItem initWithGadetType:navigationBlock:animated:]([PXGadgetNavigationItem alloc], "initWithGadetType:navigationBlock:animated:", a3, v8, v5);
    -[PXGadgetNavigationHelper setPendingNavigationItem:](self, "setPendingNavigationItem:", v15);
    if (v11)
      objc_msgSend(v9, "navigationHelperDidNotFindValidGadget:", self);

    v14 = 0;
  }

  return v14;
}

- (BOOL)navigateToGadgetWithIdDeferIfNeeded:(id)a3 animated:(BOOL)a4 nestedNavigationBlock:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  BOOL v17;
  PXGadgetNavigationItem *v18;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetNavigationHelper.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadgetId"));

  }
  -[PXGadgetNavigationHelper delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gadgetDataSourceForNavigationHelper:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "navigationHelperCanCurrentlyNavigate:", self);
  objc_msgSend(v12, "gadgetWithId:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14 && v13)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      v22 = v14;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "PXGadgetNavigationHelper - found gadget %@ for ID %@.", buf, 0x16u);
    }

    v17 = -[PXGadgetNavigationHelper _navigateToGadget:animated:navigationBlock:](self, "_navigateToGadget:animated:navigationBlock:", v14, v6, v10);
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "PXGadgetUIViewController - deferring navigation to gadget: %@", buf, 0xCu);
    }

    v18 = -[PXGadgetNavigationItem initWithGadgetId:navigationBlock:animated:]([PXGadgetNavigationItem alloc], "initWithGadgetId:navigationBlock:animated:", v9, v10, v6);
    -[PXGadgetNavigationHelper setPendingNavigationItem:](self, "setPendingNavigationItem:", v18);

    v17 = 0;
  }

  return v17;
}

- (BOOL)navigateToFirstGadgetMatchingCriteria:(id)a3 animated:(BOOL)a4 nestedNavigationBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  BOOL v16;
  PXGadgetNavigationItem *v17;
  PXGadgetNavigationItem *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, _BYTE *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PXGadgetNavigationHelper delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gadgetDataSourceForNavigationHelper:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "navigationHelperCanCurrentlyNavigate:", self);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__24754;
  v30 = __Block_byref_object_dispose__24755;
  v31 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __97__PXGadgetNavigationHelper_navigateToFirstGadgetMatchingCriteria_animated_nestedNavigationBlock___block_invoke;
  v23 = &unk_1E511A1A0;
  v13 = v8;
  v24 = v13;
  v25 = &v26;
  objc_msgSend(v11, "enumerateGadgetsUsingBlock:", &v20);
  if (!v27[5])
    goto LABEL_7;
  if (!v12)
  {
    v17 = [PXGadgetNavigationItem alloc];
    v18 = -[PXGadgetNavigationItem initWithGadget:navigationBlock:animated:](v17, "initWithGadget:navigationBlock:animated:", v27[5], v9, v6, v20, v21, v22, v23);
    -[PXGadgetNavigationHelper setPendingNavigationItem:](self, "setPendingNavigationItem:", v18);

LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  PLUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = v27[5];
    *(_DWORD *)buf = 138412290;
    v33 = v15;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEBUG, "PXGadgetNavigationHelper - found gadget %@.", buf, 0xCu);
  }

  v16 = -[PXGadgetNavigationHelper _navigateToGadget:animated:navigationBlock:](self, "_navigateToGadget:animated:navigationBlock:", v27[5], v6, v9, v20, v21, v22, v23);
LABEL_8:

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (BOOL)navigateToGadgetDeferIfNeeded:(id)a3 animated:(BOOL)a4 nestedNavigationBlock:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PXGadgetNavigationItem *v14;
  BOOL v15;
  void *v17;
  uint64_t v18;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetNavigationHelper.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadget != nil"));

  }
  -[PXGadgetNavigationHelper delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gadgetDataSourceForNavigationHelper:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "navigationHelperCanCurrentlyNavigate:", self)
    && (!v12 ? (v13 = 0) : (objc_msgSend(v12, "indexPathForGadget:", v9), v13 = v18), v13 != *(_QWORD *)off_1E50B7E98))
  {
    v15 = -[PXGadgetNavigationHelper _navigateToGadget:animated:navigationBlock:](self, "_navigateToGadget:animated:navigationBlock:", v9, v6, v10);
  }
  else
  {
    v14 = -[PXGadgetNavigationItem initWithGadget:navigationBlock:animated:]([PXGadgetNavigationItem alloc], "initWithGadget:navigationBlock:animated:", v9, v10, v6);
    -[PXGadgetNavigationHelper setPendingNavigationItem:](self, "setPendingNavigationItem:", v14);

    v15 = 0;
  }

  return v15;
}

- (void)navigateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;

  -[PXGadgetNavigationHelper pendingNavigationItem](self, "pendingNavigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = v3;
    -[PXGadgetNavigationHelper delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gadgetDataSourceForNavigationHelper:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v12, "navigationType");
    if (v6 == 2)
    {
      objc_msgSend(v12, "gadget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_10;
    }
    else
    {
      if (v6 == 1)
      {
        objc_msgSend(v12, "gadgetId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "gadgetWithId:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v6)
          goto LABEL_7;
        objc_msgSend(v5, "gadgetsOfType:", objc_msgSend(v12, "gadgetType"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (void *)v8;

      if (v9)
      {
LABEL_10:
        -[PXGadgetNavigationHelper invalidateAnyPendingNavigation](self, "invalidateAnyPendingNavigation");
        objc_msgSend(v4, "navigateToGadget:animated:", v9, objc_msgSend(v12, "animated"));
        objc_msgSend(v12, "navigationBlock");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v12, "navigationBlock");
          v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v9);

        }
        goto LABEL_12;
      }
    }
LABEL_7:
    objc_msgSend(v4, "navigationHelperDidNotFindValidGadget:", self);
    v9 = 0;
LABEL_12:

    v3 = v12;
  }

}

- (void)startPendingNavigationTimer
{
  void *v3;
  id v4;

  -[PXGadgetNavigationHelper pendingNavigationItem](self, "pendingNavigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXGadgetNavigationHelper _stopPendingNavigationTimer](self, "_stopPendingNavigationTimer");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__pendingNavigationInvalidationTimerFired_, 0, 0, 2.0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXGadgetNavigationHelper setNavigationInvalidationTimer:](self, "setNavigationInvalidationTimer:", v4);

  }
}

- (void)invalidateAnyPendingNavigation
{
  -[PXGadgetNavigationHelper setPendingNavigationItem:](self, "setPendingNavigationItem:", 0);
}

- (BOOL)_navigateToGadget:(id)a3 animated:(BOOL)a4 navigationBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, id);
  void *v10;
  char v11;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, id))a5;
  if (v8)
  {
    -[PXGadgetNavigationHelper invalidateAnyPendingNavigation](self, "invalidateAnyPendingNavigation");
    -[PXGadgetNavigationHelper delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "navigateToGadget:animated:", v8, v6);

    if (v9)
      v9[2](v9, v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_stopPendingNavigationTimer
{
  void *v3;
  id v4;

  -[PXGadgetNavigationHelper navigationInvalidationTimer](self, "navigationInvalidationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "invalidate");
    -[PXGadgetNavigationHelper setNavigationInvalidationTimer:](self, "setNavigationInvalidationTimer:", 0);
    v3 = v4;
  }

}

- (PXGadgetNavigationHelperDelegate)delegate
{
  return (PXGadgetNavigationHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXGadgetNavigationItem)pendingNavigationItem
{
  return self->_pendingNavigationItem;
}

- (NSTimer)navigationInvalidationTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_navigationInvalidationTimer);
}

- (void)setNavigationInvalidationTimer:(id)a3
{
  objc_storeWeak((id *)&self->_navigationInvalidationTimer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationInvalidationTimer);
  objc_storeStrong((id *)&self->_pendingNavigationItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __97__PXGadgetNavigationHelper_navigateToFirstGadgetMatchingCriteria_animated_nestedNavigationBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)navigateToFirstGadgetAndFirstNestedGadget:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  PXGadgetNavigationHelper *v10;
  void *v11;
  _BOOL8 v12;
  _QWORD v13[6];
  BOOL v14;
  _OWORD v15[2];

  v3 = a3;
  -[PXGadgetNavigationHelper delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gadgetDataSourceForNavigationHelper:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "numberOfSections"))
  {
    if (v7)
      objc_msgSend(v7, "firstItemIndexPath");
    else
      memset(v15, 0, sizeof(v15));
    objc_msgSend(v7, "gadgetAtIndexPath:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __78__PXGadgetNavigationHelper_ForYou__navigateToFirstGadgetAndFirstNestedGadget___block_invoke;
      v13[3] = &unk_1E5123D20;
      v13[4] = self;
      v13[5] = a2;
      v14 = v3;
      v9 = v13;
      v10 = self;
      v11 = v8;
      v12 = v3;
    }
    else
    {
      v10 = self;
      v11 = v8;
      v12 = v3;
      v9 = 0;
    }
    -[PXGadgetNavigationHelper navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:](v10, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", v11, v12, v9);

  }
}

- (void)navigateToSharedAlbumInvitesAnimated:(BOOL)a3
{
  -[PXGadgetNavigationHelper navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:](self, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 3, a3, 0);
}

- (void)navigateToSharedAlbumInviteWithUUID:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  BOOL v12;

  v4 = a4;
  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PXGadgetNavigationHelper_ForYou__navigateToSharedAlbumInviteWithUUID_animated___block_invoke;
  v9[3] = &unk_1E5123D48;
  v10 = v7;
  v11 = a2;
  v9[4] = self;
  v12 = v4;
  v8 = v7;
  -[PXGadgetNavigationHelper navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:](self, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 2, v4, v9);

}

- (void)navigateToRevealTheMostRecentMemoryAnimated:(BOOL)a3
{
  -[PXGadgetNavigationHelper navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:](self, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 5, a3, 0);
}

- (void)navigateToInvitationCMMWithUUID:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  BOOL v12;

  v4 = a4;
  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PXGadgetNavigationHelper_ForYou__navigateToInvitationCMMWithUUID_animated___block_invoke;
  v9[3] = &unk_1E5123D48;
  v10 = v7;
  v11 = a2;
  v9[4] = self;
  v12 = v4;
  v8 = v7;
  -[PXGadgetNavigationHelper navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:](self, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 1, v4, v9);

}

- (void)navigateToGadgetInHorizontalGadget:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  BOOL v13;

  v4 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "gadgetType");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PXGadgetNavigationHelper_ForYou__navigateToGadgetInHorizontalGadget_animated___block_invoke;
  v10[3] = &unk_1E5123D48;
  v11 = v7;
  v12 = a2;
  v10[4] = self;
  v13 = v4;
  v9 = v7;
  -[PXGadgetNavigationHelper navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:](self, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", v8, v4, v10);

}

- (void)navigateToFeaturedPhotoWithSuggestionIdentifier:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  BOOL v19;
  _QWORD aBlock[5];
  id v21;
  SEL v22;

  v9 = a3;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__PXGadgetNavigationHelper_ForYou__navigateToFeaturedPhotoWithSuggestionIdentifier_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5123D90;
  v21 = v9;
  v22 = a2;
  aBlock[4] = self;
  v12 = v9;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __111__PXGadgetNavigationHelper_ForYou__navigateToFeaturedPhotoWithSuggestionIdentifier_animated_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5123DE0;
  v15[4] = self;
  v16 = _Block_copy(aBlock);
  v19 = a4;
  v17 = v10;
  v18 = a2;
  v13 = v10;
  v14 = v16;
  -[PXGadgetNavigationHelper navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:](self, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 10, 0, v15);

}

- (void)navigateToGadgetForCMMInvitationWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Searching for CMM invitations section in hopes of finding identifier: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PXGadgetNavigationHelper_ForYou__navigateToGadgetForCMMInvitationWithIdentifier___block_invoke;
  v8[3] = &unk_1E5123E08;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v7 = v5;
  -[PXGadgetNavigationHelper navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:](self, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 1, 0, v8);

}

- (void)navigateToSectionWithGadgetType:(unint64_t)a3 andGadget:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  BOOL v14;

  v5 = a5;
  v9 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__PXGadgetNavigationHelper_ForYou__navigateToSectionWithGadgetType_andGadget_animated___block_invoke;
  v11[3] = &unk_1E5123D48;
  v12 = v9;
  v13 = a2;
  v11[4] = self;
  v14 = v5;
  v10 = v9;
  -[PXGadgetNavigationHelper navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:](self, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", a3, v5, v11);

}

- (void)navigateToGadgetWithTypeSurveyCongratulationsWithGadgetType:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __96__PXGadgetNavigationHelper_ForYou__navigateToGadgetWithTypeSurveyCongratulationsWithGadgetType___block_invoke;
  v3[3] = &unk_1E5123E30;
  v3[4] = self;
  v3[5] = a2;
  -[PXGadgetNavigationHelper navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:](self, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", a3, 1, v3);
}

void __96__PXGadgetNavigationHelper_ForYou__navigateToGadgetWithTypeSurveyCongratulationsWithGadgetType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v5, v6, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 121, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("gadget"), v8);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 121, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("gadget"), v8, v12);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v13, "navigationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 18, 1, 0);

}

void __87__PXGadgetNavigationHelper_ForYou__navigateToSectionWithGadgetType_andGadget_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v5, v6, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 114, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("innerGadget"), v8);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 114, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("innerGadget"), v8, v12);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v13, "navigationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0);

}

void __83__PXGadgetNavigationHelper_ForYou__navigateToGadgetForCMMInvitationWithIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[6];
    v13 = a1[4];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 105, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("gadget"), v11, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[6];
    v9 = a1[4];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 105, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("gadget"), v11);
  }

LABEL_3:
  PLSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[5];
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Found CMM invitations section.  Continuing search for identifier %@.", buf, 0xCu);
  }

  objc_msgSend(v3, "navigationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigateToGadgetWithIdDeferIfNeeded:animated:nestedNavigationBlock:", a1[5], 0, 0);

}

uint64_t __111__PXGadgetNavigationHelper_ForYou__navigateToFeaturedPhotoWithSuggestionIdentifier_animated_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[6];
    v10 = a1[4];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 85, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("candidate"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[6];
    v14 = a1[4];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 85, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("candidate"), v12, v16);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v3, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", a1[5]);

  return v6;
}

void __111__PXGadgetNavigationHelper_ForYou__navigateToFeaturedPhotoWithSuggestionIdentifier_animated_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  char v18;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 90, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("gadget"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 90, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("gadget"), v11, v15);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v3, "navigationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 64);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __111__PXGadgetNavigationHelper_ForYou__navigateToFeaturedPhotoWithSuggestionIdentifier_animated_completionHandler___block_invoke_3;
  v16[3] = &unk_1E5123DB8;
  v6 = *(_QWORD *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v4, "navigateToFirstGadgetMatchingCriteria:animated:nestedNavigationBlock:", v6, v5, v16);

}

void __111__PXGadgetNavigationHelper_ForYou__navigateToFeaturedPhotoWithSuggestionIdentifier_animated_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = v3;
  v4 = objc_msgSend(v5, "shouldSuppressSelectionAnimation");
  objc_msgSend(v5, "setShouldSuppressSelectionAnimation:", *(_BYTE *)(a1 + 40) == 0);
  objc_msgSend(v5, "userDidSelectGadget");
  objc_msgSend(v5, "setShouldSuppressSelectionAnimation:", v4);

}

void __80__PXGadgetNavigationHelper_ForYou__navigateToGadgetInHorizontalGadget_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  id v15;

  v15 = a2;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 75, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("horizontalGadget"), v10, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 75, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("horizontalGadget"), v10);
  }

LABEL_3:
  objc_msgSend(v15, "navigationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0);

  if (v4)
  {
    objc_msgSend(v15, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

void __77__PXGadgetNavigationHelper_ForYou__navigateToInvitationCMMWithUUID_animated___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[6];
    v7 = a1[4];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 65, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("gadget"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[6];
    v11 = a1[4];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 65, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("gadget"), v9, v13);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v3, "navigationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigateToGadgetWithIdDeferIfNeeded:animated:nestedNavigationBlock:", a1[5]);

}

uint64_t __77__PXGadgetNavigationHelper_ForYou__navigateToInvitationCMMWithUUID_animated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentDetailViewAnimated:", *(unsigned __int8 *)(a1 + 32));
}

void __81__PXGadgetNavigationHelper_ForYou__navigateToSharedAlbumInviteWithUUID_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v5, v6, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 53, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("gadget"), v8);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 53, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("gadget"), v8, v12);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v13, "navigationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigateToGadgetWithIdDeferIfNeeded:animated:nestedNavigationBlock:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0);

}

void __78__PXGadgetNavigationHelper_ForYou__navigateToFirstGadgetAndFirstNestedGadget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  _OWORD v17[2];

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 32, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("gadget"), v12, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PXGadgetNavigationHelper+ForYou.m"), 32, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("gadget"), v12);
  }

LABEL_3:
  objc_msgSend(v3, "navigationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadgetDataSourceForNavigationHelper:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "numberOfSections") >= 1)
  {
    if (v6)
      objc_msgSend(v6, "firstItemIndexPath");
    else
      memset(v17, 0, sizeof(v17));
    objc_msgSend(v6, "gadgetAtIndexPath:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", v7, *(unsigned __int8 *)(a1 + 48), 0);

  }
}

@end
