@implementation SBHLibraryPodCategoryIcon

- (SBHLibraryPodCategoryIcon)initWithCategory:(id)a3
{
  id v5;
  void *v6;
  SBHLibraryPodCategoryIcon *v7;
  SBHLibraryPodCategoryIcon *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "leafIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryPodCategoryIcon;
  v7 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](&v10, sel_initWithLeafIdentifier_applicationBundleID_, v6, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_category, a3);
    objc_msgSend(v5, "addObserver:", v8);
    -[SBLeafIcon addIconDataSource:](v8, "addIconDataSource:", v5);
    -[SBIcon setGridSizeClass:](v8, "setGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
  }

  return v8;
}

- (BOOL)isCategoryIcon
{
  return 1;
}

- (int64_t)labelAccessoryType
{
  int64_t result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodCategoryIcon;
  result = -[SBLeafIcon labelAccessoryType](&v3, sel_labelAccessoryType);
  if (result == 1)
    return 0;
  return result;
}

- (void)categoryDidUpdate:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidChangeNotification"), self);

}

- (SBHLibraryCategory)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

@end
