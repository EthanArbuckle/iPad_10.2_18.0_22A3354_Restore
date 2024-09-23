@implementation _MFLazyPreviewActionItem

+ (id)previewActionItemWithTitle:(id)a3 dataSource:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "actionGroupWithTitle:style:actions:", a3, 0, &__NSArray0__struct));
  objc_msgSend(v7, "setDataSource:", v6);

  return v7;
}

- (id)_actions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MFLazyPreviewActionItem dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lazyPreviewActions"));

  return v3;
}

- (id)handler
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MFLazyPreviewActionItem dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lazyPreviewActionHandler"));

  return v3;
}

- (BOOL)isKindOfClass:(Class)a3
{
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  if ((Class)objc_opt_class(UIPreviewActionGroup) == a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MFLazyPreviewActionItem dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lazyPreviewActions"));
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)_MFLazyPreviewActionItem;
  return -[_MFLazyPreviewActionItem isKindOfClass:](&v9, "isKindOfClass:", a3);
}

- (_MFLazyPreviewActionItemDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
