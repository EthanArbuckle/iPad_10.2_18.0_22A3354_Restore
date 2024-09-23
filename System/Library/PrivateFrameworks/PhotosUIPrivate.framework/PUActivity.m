@implementation PUActivity

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  id v5;
  $68E805B9361769A31E25A591B0537C54 *p_dataSourceFlags;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_dataSource, obj);
    p_dataSourceFlags = &self->_dataSourceFlags;
    self->_dataSourceFlags.respondsToActivityViewControllerForActivity = objc_opt_respondsToSelector() & 1;

    v7 = objc_loadWeakRetained((id *)&self->_dataSource);
    p_dataSourceFlags->respondsToActivityItemsForActivity = objc_opt_respondsToSelector() & 1;

  }
}

- (id)pu_activityImageNamed:(id)a3
{
  UIImage *cachedCustomImage;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  cachedCustomImage = self->_cachedCustomImage;
  if (!cachedCustomImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhysicalScreenScale();
    objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 10, 0);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedCustomImage;
    self->_cachedCustomImage = v6;

    cachedCustomImage = self->_cachedCustomImage;
  }
  return cachedCustomImage;
}

- (id)pu_activitySettingsImageNamed:(id)a3
{
  UIImage *cachedSmallCustomImage;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  cachedSmallCustomImage = self->_cachedSmallCustomImage;
  if (!cachedSmallCustomImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhysicalScreenScale();
    objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedSmallCustomImage;
    self->_cachedSmallCustomImage = v6;

    cachedSmallCustomImage = self->_cachedSmallCustomImage;
  }
  return cachedSmallCustomImage;
}

- (void)updateActivityViewControllerVisibleShareActions
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;

  -[PUActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "activityViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateVisibleShareActionsIfNeeded");
LABEL_6:

    v3 = v8;
    goto LABEL_7;
  }
  if (self->_dataSourceFlags.respondsToActivityViewControllerForActivity
    && self->_dataSourceFlags.respondsToActivityItemsForActivity)
  {
    v8 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "activityViewControllerForActivity:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v6, "activityItemsForActivity:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_updateActivityItems:", v7);
    goto LABEL_6;
  }
LABEL_7:

}

- (id)createActivityBundleImageConfigurationForBundle:(id)a3 imageNamed:(id)a4 activityCategory:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  objc_msgSend(a3, "bundlePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D58]), "initWithImageName:bundlePath:activityCategory:", v7, v8, a5);

  return v9;
}

- (PUActivityItemSourceController)itemSourceController
{
  return (PUActivityItemSourceController *)objc_loadWeakRetained((id *)&self->_itemSourceController);
}

- (void)setItemSourceController:(id)a3
{
  objc_storeWeak((id *)&self->_itemSourceController, a3);
}

- (PUActivityDataSource)dataSource
{
  return (PUActivityDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_itemSourceController);
  objc_storeStrong((id *)&self->_cachedSmallCustomImage, 0);
  objc_storeStrong((id *)&self->_cachedCustomImage, 0);
}

@end
