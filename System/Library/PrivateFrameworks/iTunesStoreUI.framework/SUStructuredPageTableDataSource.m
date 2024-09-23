@implementation SUStructuredPageTableDataSource

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUStructuredPageTableDataSource;
  -[SUTableDataSource dealloc](&v3, sel_dealloc);
}

- (BOOL)canShowItemOfferButtonForItem:(id)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 reuseIdentifier:(id *)a4
{
  uint64_t v5;
  Class result;
  __CFString *v7;

  v5 = objc_msgSend(a3, "itemType");
  result = (Class)objc_opt_class();
  if (a4)
  {
    v7 = CFSTR("su0");
    if (v5 == 8)
      v7 = CFSTR("su1");
    *a4 = v7;
  }
  return result;
}

- (Class)cellConfigurationClassForItem:(id)a3
{
  Class result;

  switch(objc_msgSend(a3, "itemType"))
  {
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
      result = (Class)objc_opt_class();
      break;
    default:
      NSLog(CFSTR("Unknown item type: %ld"), objc_msgSend(a3, "itemType"));
      result = 0;
      break;
  }
  return result;
}

- (id)cellConfigurationForIndex:(int64_t)a3 item:(id)a4
{
  objc_class *v7;
  id v8;

  v7 = -[SUStructuredPageTableDataSource cellConfigurationClassForItem:](self, "cellConfigurationClassForItem:", a4);
  if (!v7)
    return 0;
  v8 = -[SUTableDataSource cachedConfigurationForClass:index:](self, "cachedConfigurationForClass:index:", v7, a3);
  objc_msgSend(v8, "setRepresentedObject:", a4);
  return v8;
}

- (id)newHeaderViewForSection:(int64_t)a3
{
  return 0;
}

- (void)setStructuredPage:(id)a3
{
  SUStructuredPage *structuredPage;
  SUStructuredPage *v6;

  structuredPage = self->_structuredPage;
  if (structuredPage != a3)
  {

    v6 = (SUStructuredPage *)a3;
    self->_structuredPage = v6;
    -[SUItemList setIgnoresEmptySections:](-[SUStructuredPage itemList](v6, "itemList"), "setIgnoresEmptySections:", -[SUStructuredPageTableDataSource tableViewStyle](self, "tableViewStyle") != 1);
  }
}

- (BOOL)canDeleteIndexPath:(id)a3
{
  objc_super v6;

  if (objc_msgSend((id)objc_msgSend(-[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "itemAtIndexPath:", a3), "itemLinksForType:", 4), "count"))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SUStructuredPageTableDataSource;
  return -[SUTableDataSource canDeleteIndexPath:](&v6, sel_canDeleteIndexPath_, a3);
}

- (BOOL)canSelectIndexPath:(id)a3
{
  BOOL v5;
  uint64_t v6;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUStructuredPageTableDataSource;
  v5 = -[SUTableDataSource canSelectIndexPath:](&v9, sel_canSelectIndexPath_);
  v6 = objc_msgSend(-[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "itemAtIndexPath:", a3), "itemType");
  if (v6 == 8 || v6 == 2)
    return 0;
  return v5;
}

- (id)cellForIndexPath:(id)a3
{
  objc_class *v4;
  id v5;
  id result;
  id v7;
  uint64_t v8;

  v8 = 0;
  v4 = -[SUStructuredPageTableDataSource cellClassForItem:reuseIdentifier:](self, "cellClassForItem:reuseIdentifier:", -[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "itemAtIndexPath:", a3), &v8);
  v5 = -[SUTableDataSource cellReuseSource](self, "cellReuseSource");
  result = (id)objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v8);
  if (!result)
  {
    v7 = [v4 alloc];
    return (id)objc_msgSend(v7, "initWithStyle:reuseIdentifier:", 0, v8);
  }
  return result;
}

- (double)cellHeightForIndexPath:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  double result;

  v4 = -[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "itemAtIndexPath:", a3);
  v5 = -[SUStructuredPageTableDataSource cellConfigurationClassForItem:](self, "cellConfigurationClassForItem:", v4);
  v6 = (void *)objc_msgSend(-[SUVariableCellConfigurationCache cacheForClass:](self->super._configurationCache, "cacheForClass:", v5), "cellContext");
  objc_msgSend(v6, "setTableViewStyle:", -[SUStructuredPageTableDataSource tableViewStyle](self, "tableViewStyle"));
  -[objc_class rowHeightForContext:representedObject:](v5, "rowHeightForContext:representedObject:", v6, v4);
  return result;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  id v7;
  SUItemList *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  _BOOL8 v13;
  id v14;
  _BOOL8 v15;
  _BOOL8 v16;
  _QWORD v17[4];

  v7 = -[SUTableDataSource cellReuseSource](self, "cellReuseSource");
  v8 = -[SUStructuredPage itemList](self->_structuredPage, "itemList");
  v9 = -[SUItemList itemAtIndexPath:](v8, "itemAtIndexPath:", a4);
  if (-[SUStructuredPageTableDataSource _shouldShowItemOfferButtonForItem:](self, "_shouldShowItemOfferButtonForItem:", v9))
  {
    v10 = -[SUStructuredPageTableDataSource _itemOfferButtonForCell:item:](self, "_itemOfferButtonForCell:item:", a3, v9);
    if (objc_msgSend(v10, "isShowingConfirmation"))
    {
      objc_msgSend(v10, "setShowingConfirmation:duration:", 0, 0.0);
      objc_msgSend(a3, "setNeedsLayout");
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(v7, "globalRowForRowAtIndexPath:", a4);
  v12 = -[SUStructuredPageTableDataSource cellConfigurationForIndex:item:](self, "cellConfigurationForIndex:item:", v11, v9);
  objc_msgSend(a3, "setAccessoryView:", v10);
  objc_msgSend(a3, "setConfiguration:", v12);
  v13 = self->_style == 1 && objc_msgSend(v9, "itemType") == 3;
  objc_msgSend(a3, "setHighlightsOnlyContentView:", v13);
  v17[0] = objc_msgSend(a4, "row");
  v17[1] = objc_msgSend(-[SUItemList itemsForSectionAtIndex:](v8, "itemsForSectionAtIndex:", objc_msgSend(a4, "section")), "count");
  v17[2] = v11;
  v17[3] = -[SUItemList numberOfItems](v8, "numberOfItems");
  objc_msgSend(a3, "setPosition:", v17);
  switch(objc_msgSend(v9, "itemType"))
  {
    case 1:
      objc_msgSend(a3, "setAccessoryType:", 0);
      objc_msgSend(a3, "setHighlightsOnlyContentView:", -[SUStructuredPageTableDataSource canSelectIndexPath:](self, "canSelectIndexPath:", a4));
      return;
    case 2:
      objc_msgSend(a3, "setAccessoryType:", 0);
      goto LABEL_12;
    case 3:
      if (self->_style != 1)
        goto LABEL_15;
      objc_msgSend(a3, "setAccessoryType:", 0);
      goto LABEL_23;
    case 4:
      objc_msgSend(a3, "setAccessoryType:", 0);
      -[SUStructuredPageTableDataSource _configureLoadMoreCell:forItem:](self, "_configureLoadMoreCell:forItem:", a3, v9);
      return;
    case 8:
      objc_msgSend(a3, "setAccessoryType:", 0);
      objc_msgSend(a3, "setBackgroundView:", 0);
      v14 = a3;
      v15 = 1;
      goto LABEL_25;
    case 9:
    case 10:
      objc_msgSend(a3, "setAccessoryType:", 0);
      objc_msgSend(a3, "setDrawAsDisabled:", 0);
LABEL_12:
      v14 = a3;
      v15 = 0;
      goto LABEL_25;
    default:
LABEL_15:
      v16 = !v10 && !-[SUStructuredPage wantsIndexBar](self->_structuredPage, "wantsIndexBar");
      objc_msgSend(a3, "setAccessoryType:", v16);
      objc_msgSend(a3, "setDrawAsDisabled:", 0);
      objc_msgSend(a3, "setHighlightsOnlyContentView:", 0);
      if ((objc_msgSend(v10, "isUserInteractionEnabled") & 1) != 0)
        v15 = 1;
      else
LABEL_23:
        v15 = -[SUStructuredPageTableDataSource canSelectIndexPath:](self, "canSelectIndexPath:", a4);
      v14 = a3;
LABEL_25:
      objc_msgSend(v14, "setUserInteractionEnabled:", v15);
      return;
  }
}

- (BOOL)deleteIndexPath:(id)a3
{
  SUItemList *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v5 = -[SUStructuredPage itemList](self->_structuredPage, "itemList");
  v6 = (void *)objc_msgSend(-[SUItemList itemAtIndexPath:](v5, "itemAtIndexPath:", a3), "firstItemLinkForType:", 4);
  if (objc_msgSend(v6, "URL"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BEC8C30]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", objc_msgSend(v6, "URL"));
    objc_msgSend(v7, "setRequestProperties:", v8);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v7);

    -[SUItemList removeItemAtIndexPath:](v5, "removeItemAtIndexPath:", a3);
    return 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SUStructuredPageTableDataSource;
    return -[SUTableDataSource deleteIndexPath:](&v10, sel_deleteIndexPath_, a3);
  }
}

- (id)headerViewForSection:(int64_t)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;

  if (-[NSMutableArray count](self->_cachedHeaderViews, "count") > (unint64_t)a3
    && (v5 = -[NSMutableArray objectAtIndex:](self->_cachedHeaderViews, "objectAtIndex:", a3)) != 0
    && (v6 = (id)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (v6 = -[SUStructuredPageTableDataSource newHeaderViewForSection:](self, "newHeaderViewForSection:", a3)) != 0)
  {
    if (!self->_cachedHeaderViews)
      self->_cachedHeaderViews = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    while (-[NSMutableArray count](self->_cachedHeaderViews, "count") <= (unint64_t)a3)
      -[NSMutableArray addObject:](self->_cachedHeaderViews, "addObject:", v7);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_cachedHeaderViews, "replaceObjectAtIndex:withObject:", a3, v6);
  }
  return v6;
}

- (int64_t)numberOfSections
{
  return -[SUItemList numberOfSections](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "numberOfSections");
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return objc_msgSend(-[SUItemList itemsForSectionAtIndex:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "itemsForSectionAtIndex:", a3), "count");
}

- (void)reloadCellContexts
{
  SUImageCache *v3;
  ISURLOperationPool *v4;
  SUItemCellContext *v5;
  id v6;
  SUItemOfferButton *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  double offerButtonWidth;
  double v17;
  double v18;
  ISURLOperationPool *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)SUStructuredPageTableDataSource;
  -[SUTableDataSource reloadCellContexts](&v25, sel_reloadCellContexts);
  v3 = -[SUTableDataSource imageCache](self, "imageCache");
  v4 = -[SUTableDataSource imagePool](self, "imagePool");
  v5 = objc_alloc_init(SUItemCellContext);
  -[SUArtworkCellContext setImageCache:](v5, "setImageCache:", v3);
  v19 = v4;
  -[SUArtworkCellContext setImagePool:](v5, "setImagePool:", v4);
  -[SUVariableCellConfigurationCache setCellContext:](self->super._configurationCache, "setCellContext:", v5);

  v6 = -[SUItemList copyItems](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "copyItems");
  v7 = objc_alloc_init(SUItemOfferButton);
  self->_offerButtonWidth = 0.0;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v13 = -[SUStructuredPageTableDataSource cellConfigurationClassForItem:](self, "cellConfigurationClassForItem:", v12);
        v14 = -[SUVariableCellConfigurationCache cacheForClass:](self->super._configurationCache, "cacheForClass:", v13);
        if (!objc_msgSend(v14, "cellContext"))
        {
          v15 = (void *)-[objc_class copyDefaultContext](v13, "copyDefaultContext");
          objc_msgSend(v15, "setImageCache:", v3);
          objc_msgSend(v15, "setImagePool:", v19);
          objc_msgSend(v14, "setCellContext:", v15);

        }
        if (-[SUStructuredPageTableDataSource _shouldShowItemOfferButtonForItem:](self, "_shouldShowItemOfferButtonForItem:", v12))
        {
          -[SUItemOfferButton configureForItem:offer:](v7, "configureForItem:offer:", v12, objc_msgSend(v12, "defaultStoreOffer"));
          -[SUItemOfferButton sizeToFit](v7, "sizeToFit");
          offerButtonWidth = self->_offerButtonWidth;
          -[SUItemOfferButton frame](v7, "frame");
          if (offerButtonWidth >= v17)
            v18 = offerButtonWidth;
          else
            v18 = v17;
          self->_offerButtonWidth = v18;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

}

- (void)reloadData
{
  objc_super v3;

  -[NSMutableArray removeAllObjects](self->_cachedHeaderViews, "removeAllObjects");
  -[SUStructuredPageTableDataSource setActiveLoadMoreItem:](self, "setActiveLoadMoreItem:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUStructuredPageTableDataSource;
  -[SUTableDataSource reloadData](&v3, sel_reloadData);
}

- (int64_t)sectionIndexForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  return -[SUItemList sectionIndexForIndexTitle:atIndex:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "sectionIndexForIndexTitle:atIndex:", a3, a4);
}

- (id)sectionIndexTitles
{
  if (-[SUStructuredPage wantsIndexBar](self->_structuredPage, "wantsIndexBar"))
    return -[SUItemList sectionIndexTitles](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "sectionIndexTitles");
  else
    return 0;
}

- (int64_t)tableViewStyle
{
  return -[SUStructuredPage displayStyle](self->_structuredPage, "displayStyle") == 1;
}

- (id)titleForDeleteConfirmationForIndexPath:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)objc_msgSend(-[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "itemAtIndexPath:", a3), "firstItemLinkForType:", 4), "title");
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)SUStructuredPageTableDataSource;
    return -[SUTableDataSource titleForDeleteConfirmationForIndexPath:](&v6, sel_titleForDeleteConfirmationForIndexPath_, a3);
  }
  return result;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  return (id)objc_msgSend(-[SUItemList sectionItemForSectionAtIndex:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "sectionItemForSectionAtIndex:", a3), "title");
}

- (void)_configureLoadMoreCell:(id)a3 forItem:(id)a4
{
  id v5;
  void *v6;

  if (self->_activeLoadMoreItem == a4)
  {
    v5 = (id)objc_msgSend(a3, "accessoryView");
    if (!v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 2);
      objc_msgSend(v6, "sizeToFit");
      objc_msgSend(v6, "startAnimating");
      v5 = v6;

    }
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(a3, "setAccessoryView:", v5);
  objc_msgSend(a3, "setDrawAsDisabled:", v5 != 0);
  objc_msgSend(a3, "setUserInteractionEnabled:", v5 == 0);
}

- (id)_itemOfferButtonForCell:(id)a3 item:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "itemOfferButton");
  objc_msgSend(v5, "addTarget:action:forControlEvents:", 0, sel_itemOfferButtonAction_, 64);
  objc_msgSend(v5, "setAnimationHorizontalAlignment:", 2);
  objc_msgSend(v5, "configureForItem:offer:", a4, objc_msgSend(a4, "defaultStoreOffer"));
  objc_msgSend(v5, "frame");
  objc_msgSend(v5, "setFrame:");
  return v5;
}

- (BOOL)_shouldShowItemOfferButtonForItem:(id)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a3, "defaultStoreOffer");
  if (!-[SUPurchaseManager itemIdentifierIsPurchased:](-[SUClientInterface purchaseManager](-[SUStructuredPageTableDataSource clientInterface](self, "clientInterface"), "purchaseManager"), "itemIdentifierIsPurchased:", objc_msgSend(a3, "itemIdentifier"))&& objc_msgSend(v5, "priceDisplay")&& (v6 = (void *)objc_msgSend(v5, "actionType"), objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEB2730])))
  {
    return -[SUStructuredPageTableDataSource canShowItemOfferButtonForItem:](self, "canShowItemOfferButtonForItem:", a3);
  }
  else
  {
    return 0;
  }
}

- (SUItem)activeLoadMoreItem
{
  return self->_activeLoadMoreItem;
}

- (void)setActiveLoadMoreItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (SUStructuredPage)structuredPage
{
  return self->_structuredPage;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

@end
