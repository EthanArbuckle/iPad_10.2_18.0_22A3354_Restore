@implementation SKUIProductPageTableLockupsSection

- (SKUIProductPageTableLockupsSection)initWithLockups:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  SKUIProductPageTableLockupsSection *v8;
  uint64_t v9;
  NSMapTable *artworkRequests;
  uint64_t v11;
  NSArray *lockups;
  SKUIProductPageTableHeaderView *v13;
  SKUIProductPageTableHeaderView *headerView;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableLockupsSection initWithLockups:title:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIProductPageTableLockupsSection;
  v8 = -[SKUIProductPageTableLockupsSection init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    artworkRequests = v8->_artworkRequests;
    v8->_artworkRequests = (NSMapTable *)v9;

    v11 = objc_msgSend(v6, "copy");
    lockups = v8->_lockups;
    v8->_lockups = (NSArray *)v11;

    if (v7)
    {
      v13 = objc_alloc_init(SKUIProductPageTableHeaderView);
      headerView = v8->_headerView;
      v8->_headerView = v13;

      -[SKUIProductPageTableHeaderView setContentInsets:](v8->_headerView, "setContentInsets:", 11.0, 15.0, 5.0, 15.0);
      -[SKUIProductPageTableHeaderView setTitle:](v8->_headerView, "setTitle:", v7);
      -[SKUIProductPageTableHeaderView sizeToFit](v8->_headerView, "sizeToFit");
    }
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIProductPageTableLockupsSection;
  -[SKUIProductPageTableLockupsSection dealloc](&v3, sel_dealloc);
}

- (id)footerViewForTableView:(id)a3
{
  SKUIProductPageTableSeparatorView *footerView;
  SKUIProductPageTableSeparatorView *v5;
  SKUIProductPageTableSeparatorView *v6;

  footerView = self->_footerView;
  if (!footerView)
  {
    v5 = -[SKUIProductPageTableSeparatorView initWithFrame:]([SKUIProductPageTableSeparatorView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 10.0);
    v6 = self->_footerView;
    self->_footerView = v5;

    footerView = self->_footerView;
  }
  return footerView;
}

- (id)headerViewForTableView:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  SKUIProductPageTableHeaderView *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_lockups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "_needsItemData", (_QWORD)v15))
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v10, "itemIdentifier"));
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[SKUIProductPageTableLockupsSection _missingItemLoader](self, "_missingItemLoader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadItemsWithIdentifiers:reason:", v4, 1);

  }
  v13 = self->_headerView;

  return v13;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  void *v4;
  double v5;

  -[SKUIProductPageTableSection clientContext](self, "clientContext", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dbl_1BBED25F0[SKUIUserInterfaceIdiom(v4) == 1];

  return v5;
}

- (int64_t)numberOfRowsInSection
{
  return -[NSArray count](self->_lockups, "count");
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  NSArray *lockups;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  +[SKUIProductPageAction actionWithType:](SKUIProductPageAction, "actionWithType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  lockups = self->_lockups;
  v8 = objc_msgSend(v5, "row");

  -[NSArray objectAtIndex:](lockups, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItem:", v10);

  return v6;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  SKUILockupItemTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  NSArray *lockups;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("LOCKUP"));
  v7 = (SKUILockupItemTableViewCell *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageTableSection clientContext](self, "clientContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[SKUILockupItemTableViewCell initWithStyle:reuseIdentifier:]([SKUILockupItemTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("LOCKUP"));
    -[SKUILockupItemTableViewCell layout](v7, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageTableSection clientContext](self, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = SKUIUserInterfaceIdiom(v10);

    if (v11 == 1)
      v12 = 1;
    else
      v12 = 2;
    -[SKUILockupItemTableViewCell setAccessoryType:](v7, "setAccessoryType:", v11 != 1);
    objc_msgSend(v9, "setItemOfferStyle:", v12);
    objc_msgSend(v9, "setClientContext:", v8);
    objc_msgSend(v9, "setContentInsets:", 0.0, 15.0, 0.0, 5.0);
    objc_msgSend(v9, "setLayoutStyle:", 1);
    objc_msgSend(v9, "setVerticalAlignment:", 1);
    v13 = SKUIUserInterfaceIdiom(v8);
    v14 = 64.0;
    if (v13 == 1)
      v14 = 72.0;
    objc_msgSend(v9, "setImageBoundingSize:", v14, v14);

  }
  v15 = objc_msgSend(v6, "row");
  lockups = self->_lockups;
  v17 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](lockups, "objectAtIndex:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemTableViewCell layout](v7, "layout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v18, "lockupStyle");
    v20 = v24;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v19, "setVisibleFields:", v20);
  objc_msgSend(v18, "item");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[SKUILockupItemTableViewCell configureForItem:clientContext:rowIndex:](v7, "configureForItem:clientContext:rowIndex:", v21, v8, v15);
    -[SKUIProductPageTableLockupsSection _productImageForItem:](self, "_productImageForItem:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIconImage:", v22);

  }
  else
  {
    objc_msgSend(v19, "resetLayout");
    objc_msgSend(v19, "setIconImage:", 0);
  }

  return v7;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SKUITableViewSection delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = v7;
    v22 = v6;
    v25 = objc_msgSend(v6, "requestIdentifier");
    v9 = -[SKUITableViewSection sectionIndex](self, "sectionIndex");
    v21 = v8;
    objc_msgSend(v8, "tableViewForTableViewSection:", self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "indexPathsForVisibleRows");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v14, "section") == v9)
          {
            -[NSArray objectAtIndex:](self->_lockups, "objectAtIndex:", objc_msgSend(v14, "row"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "item");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "unsignedIntegerValue");

              if (v25 == v18)
              {
                objc_msgSend(v23, "cellForRowAtIndexPath:", v14);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "layout");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setIconImage:", v24);

                goto LABEL_15;
              }
            }

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_15:

    v8 = v21;
    v6 = v22;
    v7 = v24;
  }

}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v6;
  id v7;
  int64_t v8;
  NSArray *lockups;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  int64_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v19 = 0uLL;
    v20 = 0;
    SKUILockupStyleDefault((uint64_t)&v19);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = -[SKUITableViewSection sectionIndex](self, "sectionIndex");
    lockups = self->_lockups;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __92__SKUIProductPageTableLockupsSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
    v13[3] = &unk_1E73A81B8;
    v14 = v6;
    v16 = v19;
    v17 = v20;
    v10 = v7;
    v15 = v10;
    v18 = v8;
    -[NSArray enumerateObjectsUsingBlock:](lockups, "enumerateObjectsUsingBlock:", v13);
    if (objc_msgSend(v10, "count"))
    {
      -[SKUITableViewSection delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "tableViewForTableViewSection:", self);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

      }
    }

  }
}

void __92__SKUIProductPageTableLockupsSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v5 = a2;
  if (objc_msgSend(v5, "_needsItemData"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v5, "itemIdentifier"));
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v14 = 0uLL;
      v15 = 0;
      if (v5)
        objc_msgSend(v5, "lockupStyle");
      if (objc_msgSend(v7, "itemKind") == 17)
      {
        v12 = *(_OWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 64);
        v10 = v14;
        v11 = v15;
        if (SKUILockupStyleEqualToLockupStyle(&v12, &v10))
        {
          v15 = 214;
          v12 = v14;
          v13 = 214;
          objc_msgSend(v5, "_setLockupStyle:", &v12);
        }
      }
      objc_msgSend(v5, "_setItem:", v7);
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, *(_QWORD *)(a1 + 72));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

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
    -[SKUIProductPageTableLockupsSection resourceLoader](self, "resourceLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SKUIMissingItemLoader initWithResourceLoader:](v4, "initWithResourceLoader:", v5);
    v7 = self->_missingItemLoader;
    self->_missingItemLoader = v6;

    -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", self);
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (id)_productImageForItem:(id)a3
{
  id v4;
  SKUIStyledImageDataConsumer *v5;
  SKUIStyledImageDataConsumer *productImageDataConsumer;
  void *v7;
  void *v8;
  uint64_t v9;
  UIImage *v10;
  void *v11;
  void *v12;
  void *v13;
  SKUIArtworkRequest *v14;
  NSMapTable *artworkRequests;
  void *v16;
  UIImage *placeholderImage;
  SKUIStyledImageDataConsumer *v18;
  void *v19;
  UIImage *v20;
  UIImage *v21;

  v4 = a3;
  if (!self->_productImageDataConsumer)
  {
    +[SKUIStyledImageDataConsumer parentBundleIconConsumer](SKUIStyledImageDataConsumer, "parentBundleIconConsumer");
    v5 = (SKUIStyledImageDataConsumer *)objc_claimAutoreleasedReturnValue();
    productImageDataConsumer = self->_productImageDataConsumer;
    self->_productImageDataConsumer = v5;

  }
  -[SKUIProductPageTableLockupsSection resourceLoader](self, "resourceLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (!v9
    || (objc_msgSend(v7, "cachedResourceForRequestIdentifier:", v9),
        (v10 = (UIImage *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_msgSend(v7, "trySetReason:forRequestWithIdentifier:", 1, v9) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v4, "artworksProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStyledImageDataConsumer imageSize](self->_productImageDataConsumer, "imageSize");
      objc_msgSend(v11, "bestArtworkForScaledSize:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_alloc_init(SKUIArtworkRequest);
        -[SKUIArtworkRequest setDelegate:](v14, "setDelegate:", self);
        -[SKUIArtworkRequest setDataConsumer:](v14, "setDataConsumer:", self->_productImageDataConsumer);
        -[SKUIArtworkRequest setURL:](v14, "setURL:", v13);
        artworkRequests = self->_artworkRequests;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v14, "requestIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](artworkRequests, "setObject:forKey:", v16, v4);

        objc_msgSend(v7, "loadResourceWithRequest:reason:", v14, 1);
      }
      placeholderImage = self->_placeholderImage;
      if (!placeholderImage)
      {
        v18 = self->_productImageDataConsumer;
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIStyledImageDataConsumer imageForColor:](v18, "imageForColor:", v19);
        v20 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v21 = self->_placeholderImage;
        self->_placeholderImage = v20;

        placeholderImage = self->_placeholderImage;
      }
      v10 = placeholderImage;

    }
  }

  return v10;
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
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_productImageDataConsumer, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_lockups, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_artworkRequests, 0);
}

- (void)initWithLockups:title:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageTableLockupsSection initWithLockups:title:]";
}

@end
