@implementation SBHLibraryPodFolderControllerConfiguration

- (SBHLibraryPodFolderControllerConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  SBHLibraryPodFolderControllerConfiguration *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  uint64_t v9;
  SBHLibraryCategoryMapProvider *categoryMapProvider;
  uint64_t v11;
  SBHLibraryCategoriesRootFolder *categoriesFolder;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBHLibraryPodFolderControllerConfiguration;
  v5 = -[SBFolderControllerConfiguration initWithConfiguration:](&v14, sel_initWithConfiguration_, v4);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = v4;
      objc_msgSend(v8, "categoryMapProvider");
      v9 = objc_claimAutoreleasedReturnValue();
      categoryMapProvider = v5->_categoryMapProvider;
      v5->_categoryMapProvider = (SBHLibraryCategoryMapProvider *)v9;

      objc_msgSend(v8, "categoriesFolder");
      v11 = objc_claimAutoreleasedReturnValue();

      categoriesFolder = v5->_categoriesFolder;
      v5->_categoriesFolder = (SBHLibraryCategoriesRootFolder *)v11;

    }
  }

  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryPodFolderControllerConfiguration;
  -[SBFolderControllerConfiguration descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryPodFolderControllerConfiguration categoryMapProvider](self, "categoryMapProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("categoryMapProvider"));

  -[SBHLibraryPodFolderControllerConfiguration categoriesFolder](self, "categoriesFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("categoriesFolder"));

  return v4;
}

- (SBHLibraryCategoriesRootFolder)categoriesFolder
{
  return self->_categoriesFolder;
}

- (void)setCategoriesFolder:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesFolder, a3);
}

- (SBHLibraryCategoryMapProvider)categoryMapProvider
{
  return self->_categoryMapProvider;
}

- (void)setCategoryMapProvider:(id)a3
{
  objc_storeStrong((id *)&self->_categoryMapProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryMapProvider, 0);
  objc_storeStrong((id *)&self->_categoriesFolder, 0);
}

@end
