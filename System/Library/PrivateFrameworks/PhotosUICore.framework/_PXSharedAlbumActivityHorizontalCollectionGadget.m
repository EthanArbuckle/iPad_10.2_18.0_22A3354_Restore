@implementation _PXSharedAlbumActivityHorizontalCollectionGadget

- (void)gadgetControllerFinishedUpdatingDataSourceWithChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemChangesInSection:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  if ((objc_msgSend(v7, "containsIndex:", 0) & 1) != 0)
  {
    v8 = objc_msgSend(v5, "identifier");
    v18[1] = 0;
    v18[2] = 0;
    v9 = v18;
    v18[0] = v8;
  }
  else
  {
    v10 = objc_msgSend(v5, "numberOfSections");
    if (v10)
      v10 = objc_msgSend(v5, "numberOfItemsInSection:", 0);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __105___PXSharedAlbumActivityHorizontalCollectionGadget_gadgetControllerFinishedUpdatingDataSourceWithChange___block_invoke;
    v19[3] = &unk_1E51303D8;
    v22 = v10;
    v11 = v5;
    v20 = v11;
    v21 = &v23;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v19);

    if (v24[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = 0;
      goto LABEL_10;
    }
    v13 = objc_msgSend(v11, "identifier");
    v14 = v24[3];
    v17[0] = v13;
    v17[1] = 0;
    v17[2] = v14;
    v9 = v17;
  }
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "gadgetAtIndexPath:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", v12, -[UIViewController px_isVisible](self, "px_isVisible"), 0);

  }
LABEL_10:
  -[PXHorizontalCollectionGadget horizontalGadgetDelegate](self, "horizontalGadgetDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "horizontalCollectionGadgetDatasourceDidUpdate:", self);

  _Block_object_dispose(&v23, 8);
}

@end
