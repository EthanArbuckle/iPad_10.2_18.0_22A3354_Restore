@implementation PXTripsFeedItemLayoutFactory

- (id)createLayoutForFeedItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 viewModel:(id)a5 initialReferenceSize:(CGSize)a6 thumbnailAsset:(id *)a7
{
  double height;
  double width;
  id v12;
  PXStoryExtendedTraitCollection *v13;
  id v14;
  __int128 v15;
  void *v16;
  void *v17;
  PXTripFeedItemLayout *v18;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  _OWORD v28[2];

  height = a6.height;
  width = a6.width;
  v12 = a4;
  v13 = -[PXStoryExtendedTraitCollection initWithLayoutReferenceSize:]([PXStoryExtendedTraitCollection alloc], "initWithLayoutReferenceSize:", width, height);
  v14 = v12;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_descriptionForAssertionMessage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedItemLayoutFactory.m"), 25, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("dataSource"), v22, v23);

    }
  }
  v15 = *(_OWORD *)&a3->item;
  v28[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v28[1] = v15;
  objc_msgSend(v14, "objectAtIndexPath:", v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "px_descriptionForAssertionMessage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedItemLayoutFactory.m"), 26, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[collectionsDataSource objectAtIndexPath:indexPath]"), v26, v27);

    }
  }
  objc_msgSend(v14, "keyAssetsForCollection:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXTripFeedItemLayout initWithExtendedTraitCollection:tripHighlight:keyAssets:]([PXTripFeedItemLayout alloc], "initWithExtendedTraitCollection:tripHighlight:keyAssets:", v13, v16, v17);

  return v18;
}

- (void)configureItemLayout:(id)a3 forChangedItemFromIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5 toIndexPath:(PXSimpleIndexPath *)a6 inDataSource:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  _OWORD v33[2];

  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_descriptionForAssertionMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedItemLayoutFactory.m"), 37, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("newDataSource"), v27, v28);

    }
  }
  v15 = v12;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedItemLayoutFactory.m"), 38, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("itemLayout"), v22);
LABEL_12:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedItemLayoutFactory.m"), 38, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("itemLayout"), v22, v24);

    goto LABEL_12;
  }
LABEL_6:
  v16 = *(_OWORD *)&a6->item;
  v33[0] = *(_OWORD *)&a6->dataSourceIdentifier;
  v33[1] = v16;
  objc_msgSend(v14, "objectAtIndexPath:", v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "px_descriptionForAssertionMessage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedItemLayoutFactory.m"), 39, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[collectionsDataSource objectAtIndexPath:newIndexPath]"), v31, v32);

    }
  }
  objc_msgSend(v15, "setTripHighlight:", v17);

  objc_msgSend(v15, "tripHighlight");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keyAssetsForCollection:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setKeyAssets:", v19);

}

@end
