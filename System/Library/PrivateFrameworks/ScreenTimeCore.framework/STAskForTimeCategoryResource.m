@implementation STAskForTimeCategoryResource

- (STAskForTimeCategoryResource)initWithCategoryIdentifier:(id)a3 changeHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  STAskForTimeCategoryResource *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  STCategoryNameWithIdentifier((uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)STAskForTimeCategoryResource;
  v9 = -[STAskForTimeResource initWithResourceIdentifier:resourceDisplayName:usageType:changeHandler:](&v11, sel_initWithResourceIdentifier_resourceDisplayName_usageType_changeHandler_, v7, v8, 2, v6);

  return v9;
}

@end
