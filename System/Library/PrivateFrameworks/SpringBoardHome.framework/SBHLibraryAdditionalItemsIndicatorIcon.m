@implementation SBHLibraryAdditionalItemsIndicatorIcon

- (SBHLibraryAdditionalItemsIndicatorIcon)initWithCategory:(id)a3
{
  id v4;
  void *v5;
  SBHLibraryAdditionalItemsIndicatorIcon *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "compactPodAdditionalItemsFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryAdditionalItemsIndicatorIcon;
  v6 = -[SBFolderIcon initWithFolder:](&v8, sel_initWithFolder_, v5);

  if (v6)
    objc_storeWeak((id *)&v6->_category, v4);

  return v6;
}

- (Class)iconImageViewClassForLocation:(id)a3
{
  return (Class)objc_opt_self();
}

- (BOOL)isAdditionalItemsIndicatorIcon
{
  return 1;
}

- (SBHLibraryCategory)category
{
  return (SBHLibraryCategory *)objc_loadWeakRetained((id *)&self->_category);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_category);
}

@end
