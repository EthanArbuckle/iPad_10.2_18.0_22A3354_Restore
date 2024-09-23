@implementation PXNavigationListCollectionsDataSourceDataSectionManager

- (id)dataSectionFromDataSource:(id)a3
{
  id v5;
  PXCollectionsDataSection *v6;
  PXNavigationListDataSection *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListCollectionsDataSourceDataSectionManager.m"), 20, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("dataSource"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListCollectionsDataSourceDataSectionManager.m"), 20, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("dataSource"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  v6 = -[PXCollectionsDataSection initWithCollectionsDataSource:]([PXCollectionsDataSection alloc], "initWithCollectionsDataSource:", v5);
  v7 = -[PXNavigationListDataSection initWithCollectionsDataSection:]([PXNavigationListDataSection alloc], "initWithCollectionsDataSection:", v6);

  return v7;
}

@end
