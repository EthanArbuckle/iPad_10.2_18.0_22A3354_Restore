@implementation PXCollectionsDataSection

- (PXCollectionsDataSection)initWithCollectionsDataSource:(id)a3
{
  id v4;
  _PXCollectionsDataSourceSection *v5;

  v4 = a3;
  v5 = -[_PXCollectionsDataSourceSection initWithCollectionsDataSource:]([_PXCollectionsDataSourceSection alloc], "initWithCollectionsDataSource:", v4);

  return &v5->super;
}

- (PXCollectionsDataSection)initWithDisplayCollection:(id)a3
{
  id v4;
  _PXSingleCollectionDataSection *v5;

  v4 = a3;
  v5 = -[_PXSingleCollectionDataSection initWithDisplayCollection:]([_PXSingleCollectionDataSection alloc], "initWithDisplayCollection:", v4);

  return &v5->super;
}

- (PXCollectionsDataSection)initWithCollectionsDataSource:(id)a3 lockStatePerCollection:(id)a4
{
  id v6;
  id v7;
  _PXCollectionsDataSourceSection *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_PXCollectionsDataSourceSection initWithCollectionsDataSource:lockStatePerCollection:]([_PXCollectionsDataSourceSection alloc], "initWithCollectionsDataSource:lockStatePerCollection:", v7, v6);

  return &v8->super;
}

- (PXCollectionsDataSection)initWithDisplayCollection:(id)a3 lockState:(unint64_t)a4
{
  id v6;
  _PXSingleCollectionDataSection *v7;

  v6 = a3;
  v7 = -[_PXSingleCollectionDataSection initWithDisplayCollection:lockState:]([_PXSingleCollectionDataSection alloc], "initWithDisplayCollection:lockState:", v6, a4);

  return &v7->super;
}

- (PXCollectionsDataSection)init
{
  _PXSingleCollectionDataSection *v3;

  v3 = -[_PXSingleCollectionDataSection initWithDisplayCollection:]([_PXSingleCollectionDataSection alloc], "initWithDisplayCollection:", 0);

  return &v3->super;
}

- (int64_t)indexOfCollection:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollectionsDataSection.m"), 203, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCollectionsDataSection indexOfCollection:]", v8);

  abort();
}

- (int64_t)countForCollection:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)lockStateForCollection:(id)a3
{
  return 0;
}

- (id)existingAssetsFetchResultAtIndex:(int64_t)a3
{
  return 0;
}

@end
