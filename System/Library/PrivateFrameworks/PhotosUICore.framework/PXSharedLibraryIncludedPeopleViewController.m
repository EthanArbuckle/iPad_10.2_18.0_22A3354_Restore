@implementation PXSharedLibraryIncludedPeopleViewController

- (PXSharedLibraryIncludedPeopleViewController)initWithDataSourceManager:(id)a3
{
  id v5;
  id v6;
  PXSharedLibraryIncludedPeopleViewController *v7;
  PXSharedLibraryIncludedPeopleViewController *v8;
  objc_super v10;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v6, "setMinimumLineSpacing:", 58.0);
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryIncludedPeopleViewController;
  v7 = -[PXSharedLibraryIncludedPeopleViewController initWithCollectionViewLayout:](&v10, sel_initWithCollectionViewLayout_, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_dataSourceManager, a3);

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryIncludedPeopleViewController;
  -[PXSharedLibraryIncludedPeopleViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PXSharedLibraryIncludedPeopleViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setDataSource:", self);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "bounds");
  self->_collectionViewBounds.origin.x = v5;
  self->_collectionViewBounds.origin.y = v6;
  self->_collectionViewBounds.size.width = v7;
  self->_collectionViewBounds.size.height = v8;
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PXSharedLibraryIncludedPeopleCellReuseIdentifier"));
  objc_msgSend(v3, "reloadData");
  -[PXSharedLibraryIncludedPeopleViewController dataSourceManager](self, "dataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerChangeObserver:context:", self, PXSharedLibraryIncludedPeopleRulesObservationContext);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect *p_collectionViewBounds;
  void *v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryIncludedPeopleViewController;
  -[PXSharedLibraryIncludedPeopleViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[PXSharedLibraryIncludedPeopleViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  p_collectionViewBounds = &self->_collectionViewBounds;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  if (!CGRectEqualToRect(*p_collectionViewBounds, v15))
  {
    p_collectionViewBounds->origin.x = v5;
    p_collectionViewBounds->origin.y = v7;
    p_collectionViewBounds->size.width = v9;
    p_collectionViewBounds->size.height = v11;
    objc_msgSend(v3, "collectionViewLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateLayout");

  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[PXSharedLibraryIncludedPeopleViewController dataSourceManager](self, "dataSourceManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItemsInSection:", a4);

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _BOOL8 v37;
  void *v38;
  void *v39;
  void *v40;
  id *v41;
  void *v42;
  void *v43;
  void *v45;
  objc_class *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  PXPeopleFaceCropFetchOptions *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  _QWORD v55[4];
  _QWORD v56[2];
  _QWORD v57[4];
  _QWORD v58[2];
  _QWORD v59[4];
  id v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PXSharedLibraryIncludedPeopleCellReuseIdentifier"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleViewController.m"), 97, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[collectionView dequeueReusableCellWithReuseIdentifier:PXSharedLibraryIncludedPeopleCellReuseIdentifier forIndexPath:indexPath]"), v47, v49);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleViewController.m"), 97, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[collectionView dequeueReusableCellWithReuseIdentifier:PXSharedLibraryIncludedPeopleCellReuseIdentifier forIndexPath:indexPath]"), v47);
  }

LABEL_3:
  objc_msgSend(v9, "setRemoveTarget:", self);
  objc_msgSend(v9, "setRemoveAction:", sel__removeCell_);
  -[PXSharedLibraryIncludedPeopleViewController _infoAtIndexPath:](self, "_infoAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "person");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  +[PXPeopleGridSizer cellSizeForGridClass:width:](PXPeopleGridSizer, "cellSizeForGridClass:width:", 0, v12);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "px_screenScale");
  v18 = v17;
  objc_msgSend(v10, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v9, "tag") + 1;
  objc_msgSend(v9, "setTag:", v20);
  if (v11)
  {
    objc_msgSend(v9, "nameLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v19);

    objc_msgSend(v9, "subtitleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", &stru_1E5149688);

    v50 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v11, v14, v16, v18);
    +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
    v53 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v62[3] = &unk_1E5146170;
    v24 = v9;
    v63 = v24;
    v64 = v20;
    objc_msgSend(v23, "requestFaceCropForOptions:resultHandler:", v50, v62);

    -[PXSharedLibraryIncludedPeopleViewController dataSourceManager](self, "dataSourceManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "viewModel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "sourceLibraryInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startDate");
    v51 = v19;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
    v30 = v11;
    v31 = v10;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_154;
    v59[3] = &unk_1E5146198;
    v60 = v24;
    v61 = v20;
    objc_msgSend(v27, "fetchEstimatedAssetsCountsForStartDate:personUUIDs:completion:", v28, v32, v59);

    v10 = v31;
    v11 = v30;

    v33 = v50;
    v19 = v51;

    v7 = v53;
    v34 = v63;
  }
  else
  {
    v54 = v20;
    objc_msgSend(v10, "nameComponents");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "layoutDirection");

    v37 = v36 == 1;
    if (v33)
    {
      objc_msgSend(v33, "givenName");
      v52 = v10;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "familyName");
      v39 = v19;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_2_157;
      v57[3] = &unk_1E51461C0;
      v41 = (id *)v58;
      v58[0] = v9;
      v58[1] = v54;
      +[PXActivityUtilities requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:](PXActivityUtilities, "requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:", v38, v40, v37, v57, v14, v16, v18);

      v19 = v39;
      v10 = v52;
    }
    else
    {
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_3;
      v55[3] = &unk_1E51461C0;
      v41 = (id *)v56;
      v56[0] = v9;
      v56[1] = v54;
      +[PXActivityUtilities requestMonogramForEmailAddress:targetSize:displayScale:isRTL:completion:](PXActivityUtilities, "requestMonogramForEmailAddress:targetSize:displayScale:isRTL:completion:", v19, v37, v55, v14, v16, v18);
    }

    objc_msgSend(v9, "minusImageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setHidden:", 1);

    objc_msgSend(v9, "nameLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v19);

    objc_msgSend(v9, "subtitleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setText:", &stru_1E5149688);
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXSharedLibraryIncludedPeopleViewController _personAtIndexPath:](self, "_personAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[PXSharedLibraryIncludedPeopleDataSourceManager viewModel](self->_dataSourceManager, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sourceLibraryInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v10, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PXSharedLibraryIncludedPeopleViewController _infoAtIndexPath:](self, "_infoAtIndexPath:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "length"))
      {
        PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Rules_IdentifyPerson_Named"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v13;
        PXStringWithValidatedFormat();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Rules_IdentifyPerson_Unnamed"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PXSharedLibraryIncludedPeopleViewController setCurrentSelectedIndexPath:](self, "setCurrentSelectedIndexPath:", v5, v20);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2168]), "initWithPhotoLibrary:", v11);
      objc_msgSend(v17, "setSelectionLimit:", 1);
      objc_msgSend(v17, "_setSourceType:", 1);
      v18 = objc_alloc_init(MEMORY[0x1E0CD21E8]);
      objc_msgSend(v18, "setPurpose:", v15);
      objc_msgSend(v18, "setAllowsEditingCollection:", 1);
      objc_msgSend(v17, "_setPeopleConfiguration:", v18);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v17);
      objc_msgSend(v19, "setDelegate:", self);
      -[PXSharedLibraryIncludedPeopleViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);

    }
    else
    {
      PLSharedLibraryGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "Unable to present PHPickerViewController since %@ does not provide a PHPhotoLibrary.", buf, 0xCu);
      }

    }
  }

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  -[PXSharedLibraryIncludedPeopleViewController setCurrentSelectedIndexPath:](self, "setCurrentSelectedIndexPath:", 0, a4);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  objc_msgSend(a3, "frame");
  +[PXPeopleGridSizer marginForGridClass:width:](PXPeopleGridSizer, "marginForGridClass:width:", 0, v5);
  v7 = v6;
  v8 = v6 * 0.85;
  v9 = v8;
  v10 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v7;
  result.top = v8;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "frame");
  +[PXPeopleGridSizer cellSizeForGridClass:width:](PXPeopleGridSizer, "cellSizeForGridClass:width:", 0, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)_personAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[PXSharedLibraryIncludedPeopleViewController _infoAtIndexPath:](self, "_infoAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_infoAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];

  v4 = a3;
  -[PXSharedLibraryIncludedPeopleViewController dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "identifier");
  v8 = objc_msgSend(v4, "section");
  v9 = objc_msgSend(v4, "item");

  v12[0] = v7;
  v12[1] = v8;
  v12[2] = v9;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v6, "infoAtItemIndexPath:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_removeCell:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;

  v19 = a3;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleViewController.m"), 240, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sender"), v16);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleViewController.m"), 240, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sender"), v16, v18);

    goto LABEL_6;
  }
LABEL_3:
  -[PXSharedLibraryIncludedPeopleViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v19, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:fromView:", v10, v7, v9);
  objc_msgSend(v5, "indexPathForItemAtPoint:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedLibraryIncludedPeopleViewController _infoAtIndexPath:](self, "_infoAtIndexPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleViewController dataSourceManager](self, "dataSourceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeInfo:", v12);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v5;

  if ((a4 & 1) != 0 && (void *)PXSharedLibraryIncludedPeopleRulesObservationContext == a5)
  {
    -[PXSharedLibraryIncludedPeopleViewController collectionView](self, "collectionView", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v7;
  id v8;
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
  PXSharedLibraryIncludedPeopleInfo *v19;
  id v20;
  void *v21;
  PXSharedLibraryIncludedPeopleInfo *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PXSharedLibraryIncludedPeopleInfo *v32;
  void *v33;
  PXSharedLibraryIncludedPeopleInfo *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleViewController.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("results.count <= 1"));

  }
  -[PXSharedLibraryIncludedPeopleViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "itemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    -[PXSharedLibraryIncludedPeopleViewController dataSourceManager](self, "dataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "infoForPersonUUID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "participant");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        -[PXSharedLibraryIncludedPeopleViewController currentSelectedIndexPath](self, "currentSelectedIndexPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSharedLibraryIncludedPeopleViewController _infoAtIndexPath:](self, "_infoAtIndexPath:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "participant");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = [PXSharedLibraryIncludedPeopleInfo alloc];
        objc_msgSend(v14, "person");
        v20 = v7;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:person:](v19, "initWithParticipant:person:", v18, v21);

        v7 = v20;
        objc_msgSend(v11, "removeInfo:", v14);
        objc_msgSend(v11, "replaceInfo:withInfo:", v17, v22);

      }
    }
    else
    {
      v38 = v7;
      objc_msgSend(v7, "configuration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "photoLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "librarySpecificFetchOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "setFetchLimit:", 1);
      v26 = (void *)MEMORY[0x1E0CD16C0];
      v39[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "fetchPersonsWithLocalIdentifiers:options:", v27, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = v28;
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleViewController.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

      }
      -[PXSharedLibraryIncludedPeopleViewController currentSelectedIndexPath](self, "currentSelectedIndexPath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSharedLibraryIncludedPeopleViewController _infoAtIndexPath:](self, "_infoAtIndexPath:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = [PXSharedLibraryIncludedPeopleInfo alloc];
      objc_msgSend(v31, "participant");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:person:](v32, "initWithParticipant:person:", v33, v29);

      objc_msgSend(v11, "replaceInfo:withInfo:", v31, v34);
      v7 = v38;
    }
    -[PXSharedLibraryIncludedPeopleViewController setCurrentSelectedIndexPath:](self, "setCurrentSelectedIndexPath:", 0);

  }
}

- (PXSharedLibraryIncludedPeopleDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (NSIndexPath)currentSelectedIndexPath
{
  return self->_currentSelectedIndexPath;
}

- (void)setCurrentSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentSelectedIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  v12 = v5;
  v11 = *(id *)(a1 + 32);
  v8 = v5;
  px_dispatch_on_main_queue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "PXPeopleIncludedRulesViewController: error requesting face crop: %@", buf, 0xCu);
    }

  }
}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_154(uint64_t a1, __int128 *a2)
{
  void *v4;
  id v5;
  __int128 v6;
  uint64_t v7;

  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
  {
    v6 = *a2;
    v7 = *((_QWORD *)a2 + 2);
    PXSharedLibraryTitleForCounts(&v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "subtitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v5);

  }
}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_2_157(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "faceImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(double *)off_1E50B86D0;
    v5 = *((double *)off_1E50B86D0 + 1);
    v6 = *((double *)off_1E50B86D0 + 2);
    v7 = *((double *)off_1E50B86D0 + 3);
    objc_msgSend(v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentsRect:", v4, v5, v6, v7);

    objc_msgSend(v3, "setImage:", v9);
  }

}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "faceImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(double *)off_1E50B86D0;
    v5 = *((double *)off_1E50B86D0 + 1);
    v6 = *((double *)off_1E50B86D0 + 2);
    v7 = *((double *)off_1E50B86D0 + 3);
    objc_msgSend(v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentsRect:", v4, v5, v6, v7);

    objc_msgSend(v3, "setImage:", v9);
  }

}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "faceImageView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *(double *)(a1 + 56);
    v3 = *(double *)(a1 + 64);
    v4 = *(double *)(a1 + 72);
    v5 = *(double *)(a1 + 80);
    objc_msgSend(v7, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentsRect:", v2, v3, v4, v5);

    objc_msgSend(v7, "setImage:", *(_QWORD *)(a1 + 40));
  }
}

+ (double)heightForWidth:(double)a3 numberOfItems:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  BOOL v13;
  double result;

  +[PXPeopleGridSizer marginForGridClass:width:](PXPeopleGridSizer, "marginForGridClass:width:", 0);
  v7 = v6;
  +[PXPeopleGridSizer cellSizeForGridClass:width:](PXPeopleGridSizer, "cellSizeForGridClass:width:", 0, a3);
  v9 = v8;
  v10 = (double)a4
      / (double)+[PXPeopleGridSizer numberOfColumnsForGridClass:width:](PXPeopleGridSizer, "numberOfColumnsForGridClass:width:", 0, a3);
  v11 = (v9 + 58.0) * (double)vcvtps_u32_f32(v10);
  v12 = v7 + v11;
  v13 = v11 <= 0.0;
  result = 0.0;
  if (!v13)
    return v12;
  return result;
}

@end
