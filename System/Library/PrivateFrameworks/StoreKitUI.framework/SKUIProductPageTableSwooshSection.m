@implementation SKUIProductPageTableSwooshSection

- (SKUIProductPageTableSwooshSection)initWithItems:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIProductPageTableSwooshSection *v16;
  SKUIItemList *v17;
  SKUISwooshPageComponent *v18;
  SKUISwooshPageComponent *swooshComponent;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIProductPageTableSwooshSection initWithItems:title:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIProductPageTableSwooshSection;
  v16 = -[SKUIProductPageTableSwooshSection init](&v21, sel_init);
  if (v16)
  {
    v17 = objc_alloc_init(SKUIItemList);
    -[SKUIItemList setItems:](v17, "setItems:", v6);
    -[SKUIItemList setTitle:](v17, "setTitle:", v7);
    v18 = -[SKUISwooshPageComponent initWithItemList:]([SKUISwooshPageComponent alloc], "initWithItemList:", v17);
    swooshComponent = v16->_swooshComponent;
    v16->_swooshComponent = v18;

  }
  return v16;
}

- (SKUIProductPageTableSwooshSection)initWithLockups:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIProductPageTableSwooshSection *v16;
  SKUISwooshPageComponent *v17;
  SKUISwooshPageComponent *swooshComponent;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIProductPageTableSwooshSection initWithLockups:title:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIProductPageTableSwooshSection;
  v16 = -[SKUIProductPageTableSwooshSection init](&v20, sel_init);
  if (v16)
  {
    v17 = -[SKUISwooshPageComponent initWithLockups:swooshType:title:]([SKUISwooshPageComponent alloc], "initWithLockups:swooshType:title:", v6, 0, v7);
    swooshComponent = v16->_swooshComponent;
    v16->_swooshComponent = v17;

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  -[SKUILockupSwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIProductPageTableSwooshSection;
  -[SKUIProductPageTableSwooshSection dealloc](&v3, sel_dealloc);
}

- (SKUIColorScheme)colorScheme
{
  void *v2;
  void *v3;

  -[SKUIProductPageTableSwooshSection _swooshViewController](self, "_swooshViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKUIColorScheme *)v3;
}

- (void)setColorScheme:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKUIProductPageTableSwooshSection _swooshViewController](self, "_swooshViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorScheme:", v4);

}

- (id)headerViewForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (!self->_missingItemLoader
    && -[SKUISwooshPageComponent isMissingItemData](self->_swooshComponent, "isMissingItemData", a3))
  {
    -[SKUIProductPageTableSwooshSection _missingItemLoader](self, "_missingItemLoader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadItemsForPageComponent:startIndex:reason:", self->_swooshComponent, 0, 1);

  }
  -[SKUIProductPageTableSwooshSection _swooshViewController](self, "_swooshViewController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v6;
  SKUILockupSwooshViewController *swooshViewController;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "count"))
  {
    v6 = -[SKUISwooshPageComponent _updateLockupItemsWithItems:](self->_swooshComponent, "_updateLockupItemsWithItems:", v10);
    swooshViewController = self->_swooshViewController;
    -[SKUISwooshPageComponent lockups](self->_swooshComponent, "lockups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILockupSwooshViewController setLockups:](swooshViewController, "setLockups:", v8);

    -[SKUIProductPageTableSwooshSection _artworkLoader](self, "_artworkLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadImagesForNextPageWithReason:", 0);

  }
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  void *v6;
  void (**actionBlock)(id, void *);
  void *v8;
  id v9;

  if (self->_actionBlock)
  {
    objc_msgSend(a3, "lockups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    actionBlock = (void (**)(id, void *))self->_actionBlock;
    objc_msgSend(v9, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    actionBlock[2](actionBlock, v8);

  }
}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[SKUIProductPageTableSwooshSection _artworkLoader](self, "_artworkLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lockups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v12 = v7;
    v13 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v7, "cachedImageForItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v7, "loadImageForItem:reason:", v10, 1);
    v12 = v7;
    v13 = v10;
LABEL_5:
    objc_msgSend(v12, "placeholderImageForItem:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_artworkLoader
{
  SKUILockupSwooshArtworkLoader *artworkLoader;
  SKUILockupSwooshArtworkLoader *v4;
  void *v5;
  void *v6;
  SKUILockupSwooshArtworkLoader *v7;
  SKUILockupSwooshArtworkLoader *v8;

  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    v4 = [SKUILockupSwooshArtworkLoader alloc];
    -[SKUIProductPageTableSwooshSection resourceLoader](self, "resourceLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageTableSwooshSection _swooshViewController](self, "_swooshViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SKUILockupSwooshArtworkLoader initWithArtworkLoader:swoosh:](v4, "initWithArtworkLoader:swoosh:", v5, v6);
    v8 = self->_artworkLoader;
    self->_artworkLoader = v7;

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (id)_missingItemLoader
{
  SKUIMissingItemLoader *missingItemLoader;
  SKUIMissingItemLoader *v4;
  void *v5;
  SKUIMissingItemLoader *v6;
  SKUIMissingItemLoader *v7;

  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    v4 = [SKUIMissingItemLoader alloc];
    -[SKUIProductPageTableSwooshSection resourceLoader](self, "resourceLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SKUIMissingItemLoader initWithResourceLoader:](v4, "initWithResourceLoader:", v5);
    v7 = self->_missingItemLoader;
    self->_missingItemLoader = v6;

    -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", self);
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (id)_swooshViewController
{
  SKUILockupSwooshViewController *swooshViewController;
  SKUILockupSwooshViewController *v4;
  SKUILockupSwooshViewController *v5;
  SKUILockupSwooshViewController *v6;
  void *v7;
  SKUILockupSwooshViewController *v8;
  void *v9;
  void *v10;

  swooshViewController = self->_swooshViewController;
  if (!swooshViewController)
  {
    v4 = -[SKUILockupSwooshViewController initWithSwoosh:]([SKUILockupSwooshViewController alloc], "initWithSwoosh:", self->_swooshComponent);
    v5 = self->_swooshViewController;
    self->_swooshViewController = v4;

    v6 = self->_swooshViewController;
    -[SKUIProductPageTableSection clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILockupSwooshViewController setClientContext:](v6, "setClientContext:", v7);

    -[SKUILockupSwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", self);
    v8 = self->_swooshViewController;
    -[SKUILockupSwooshViewController artworkContext](v8, "artworkContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconConsumer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageSize");
    -[SKUILockupSwooshViewController _setExpectedImageSize:](v8, "_setExpectedImageSize:");

    swooshViewController = self->_swooshViewController;
  }
  return swooshViewController;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SKUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_swooshComponent, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

- (void)initWithItems:(uint64_t)a3 title:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithLockups:(uint64_t)a3 title:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
