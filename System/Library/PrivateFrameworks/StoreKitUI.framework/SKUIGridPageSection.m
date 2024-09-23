@implementation SKUIGridPageSection

- (SKUIGridPageSection)initWithPageComponent:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  __int128 v22;
  float64x2_t v23;
  id v24;
  void *v25;
  __int128 v27;
  float64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGridPageSection initWithPageComponent:].cold.1();
  }
  v34.receiver = self;
  v34.super_class = (Class)SKUIGridPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v34, sel_initWithPageComponent_, v4);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
    v7 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v6;

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[129] = objc_msgSend(v8, "userInterfaceIdiom") == 1;

    *((_QWORD *)v5 + 23) = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    *((_QWORD *)v5 + 24) = (uint64_t)v10;

    v11 = objc_msgSend(v4, "gridType");
    if (v11 <= 5)
    {
      v12 = v11;
      if (((1 << v11) & 0x23) != 0)
      {
        objc_msgSend(v4, "children");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              if (v18)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "lockupStyle");
                v19 = v29;
              }
              else
              {
                v19 = 0;
                v29 = 0;
              }
              objc_msgSend(v18, "item", v27);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = SKUILockupImageSizeForLockupSize(v19, objc_msgSend(v20, "itemKind"));
              v27 = v22;
              v28 = v21;

              v23.f64[0] = v28;
              *(_QWORD *)&v23.f64[1] = v27;
              *(int8x16_t *)(v5 + 136) = vbslq_s8((int8x16_t)vcgtq_f64(*(float64x2_t *)(v5 + 136), v23), *(int8x16_t *)(v5 + 136), (int8x16_t)v23);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          }
          while (v15);
        }
        v5[104] = 1;

        if (v12 == 5)
        {
          v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v25 = (void *)*((_QWORD *)v5 + 27);
          *((_QWORD *)v5 + 27) = v24;

        }
      }
    }
  }

  return (SKUIGridPageSection *)v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  -[SKUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUIGridPageSection;
  -[SKUIStorePageSection dealloc](&v4, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (self->_containsLockups)
  {
    v7 = objc_msgSend(v19, "item");
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 < objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v11, "itemIdentifier"));

    }
  }
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v13);

  v14 = objc_msgSend(v19, "item");
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "children");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectAtIndex:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "viewElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v18);

}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  switch(objc_msgSend(v5, "gridType"))
  {
    case 0:
    case 5:
      objc_msgSend(v5, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGridPageSection _itemCellWithLockups:indexPath:](self, "_itemCellWithLockups:indexPath:", v7, v4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      objc_msgSend(v5, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGridPageSection _editorialLockupCellWithLockups:indexPath:](self, "_editorialLockupCellWithLockups:indexPath:", v7, v4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      objc_msgSend(v5, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGridPageSection _editorialCellWithEditorials:indexPath:](self, "_editorialCellWithEditorials:indexPath:", v7, v4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      objc_msgSend(v5, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGridPageSection _mediaCellWithMedia:indexPath:](self, "_mediaCellWithMedia:indexPath:", v7, v4);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = (void *)v8;

      break;
    default:
      break;
  }

  return v6;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  int64_t numberOfColumns;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  CGSize result;

  v4 = a3;
  if (self->_isPad)
    v5 = 95.0;
  else
    v5 = 84.0;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "gridType");

  switch(v7)
  {
    case 0:
    case 5:
      -[SKUIGridPageSection _heightForLockupAtIndexPath:gridType:](self, "_heightForLockupAtIndexPath:gridType:", v4, v7);
      goto LABEL_9;
    case 1:
      -[SKUIGridPageSection _heightForEditorialLockupAtIndexPath:](self, "_heightForEditorialLockupAtIndexPath:", v4);
      goto LABEL_9;
    case 3:
      -[SKUIGridPageSection _heightForEditorialAtIndexPath:](self, "_heightForEditorialAtIndexPath:", v4);
      goto LABEL_9;
    case 4:
      -[SKUIGridPageSection _heightForMediaAtIndexPath:](self, "_heightForMediaAtIndexPath:", v4);
LABEL_9:
      v5 = v8;
      break;
    default:
      break;
  }
  -[SKUIStorePageSection context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  numberOfColumns = self->_numberOfColumns;
  if (numberOfColumns != 1)
  {
    if (v7 == 5)
    {
      -[SKUIGridPageSection _contentInsetForVideoLockupIndex:](self, "_contentInsetForVideoLockupIndex:", objc_msgSend(v4, "item"));
      v12 = v15 + v14 + 221.0;
    }
    else
    {
      v16 = v12 / (double)numberOfColumns;
      v12 = floorf(v16);
    }
  }

  v17 = v12;
  v18 = v5;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)clickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKUIGridPageSection;
  -[SKUIStorePageSection clickEventWithItem:elementName:index:](&v9, sel_clickEventWithItem_elementName_index_, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGridPageSection _setPositionForClickEvent:withElementIndex:](self, "_setPositionForClickEvent:withElementIndex:", v7, a5);
  return v7;
}

- (void)collectionViewDidConfirmItemOfferAtIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "item");
  -[SKUIGridPageSection _itemForIndex:](self, "_itemForIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SKUIStorePageSection context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection itemOfferClickEventWithItem:elementName:index:](self, "itemOfferClickEventWithItem:elementName:index:", v5, *MEMORY[0x1E0DAFCA0], v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "metricsController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordEvent:", v7);

    }
    objc_msgSend(v6, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIStorePageSection performItemOfferActionForItem:](self, "performItemOfferActionForItem:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setItemState:animated:", v11, 1);

  }
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  -[SKUIGridPageSection _itemForIndex:](self, "_itemForIndex:", objc_msgSend(a3, "item"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = v4;
    -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SKUIStorePageSection context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resourceLoader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "trySetReason:forRequestWithIdentifier:", 0, objc_msgSend(v5, "unsignedIntegerValue"));

      if ((v8 & 1) == 0)
        -[NSMapTable removeObjectForKey:](self->_artworkRequests, "removeObjectForKey:", v9);
    }

    v4 = v9;
  }

}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v15, "item");
  -[SKUIGridPageSection _itemForIndex:](self, "_itemForIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SKUIGridPageSection _selectItem:withIndex:](self, "_selectItem:withIndex:", v6, v5);
  }
  else if (objc_msgSend(v4, "gridType") == 4)
  {
    objc_msgSend(v4, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 < objc_msgSend(v7, "count"))
    {
      -[SKUIStorePageSection context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStorePageSection clickEventWithMedia:elementName:index:](self, "clickEventWithMedia:elementName:index:", v9, *MEMORY[0x1E0DAFCA0], v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v8, "metricsController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recordEvent:", v10);

      }
      if (objc_msgSend(v9, "mediaType"))
      {
        objc_msgSend(v8, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForItemAtIndexPath:", v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "mediaView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "beginPlaybackAnimated:", 1);

      }
      else
      {
        objc_msgSend(v9, "link");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIStorePageSection showPageWithLink:](self, "showPageWithLink:", v13);
      }

    }
  }

}

- (void)collectionViewDidTapVideoAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;

  v4 = a3;
  -[SKUIGridPageSection _itemForIndex:](self, "_itemForIndex:", objc_msgSend(v4, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SKUIStorePageSection context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "cellForItemAtIndexPath:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __60__SKUIGridPageSection_collectionViewDidTapVideoAtIndexPath___block_invoke;
    v18 = &unk_1E73A78A8;
    v19 = v10;
    v20 = v11;
    v12 = v11;
    v13 = v10;
    -[SKUIGridPageSection _enumerateVisibleIndexPathsWithBlock:](self, "_enumerateVisibleIndexPathsWithBlock:", &v15);
    objc_msgSend(v13, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 2, 1, v15, v16, v17, v18);
    objc_msgSend(v12, "layout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playInlineVideoWithURL:", v8);

  }
}

void __60__SKUIGridPageSection_collectionViewDidTapVideoAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(void **)(a1 + 40) != v3)
  {
    v5 = v3;
    objc_msgSend(v3, "layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endVideoPlaybackAnimated:", 1);

    v3 = v5;
  }

}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "indexPath");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "item");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5 / self->_numberOfColumns, objc_msgSend(v8, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v7);

}

- (id)itemOfferClickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKUIGridPageSection;
  -[SKUIStorePageSection itemOfferClickEventWithItem:elementName:index:](&v9, sel_itemOfferClickEventWithItem_elementName_index_, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGridPageSection _setPositionForClickEvent:withElementIndex:](self, "_setPositionForClickEvent:withElementIndex:", v7, a5);
  return v7;
}

- (int64_t)numberOfCells
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_containsLockups)
  {
    -[SKUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathsForVisibleItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[SKUIStorePageSection sectionIndex](self, "sectionIndex");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = v7;
    v10 = 0;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v14, "section") == v8)
          {
            v15 = objc_msgSend(v14, "item");
            if (v10 <= v15)
              v10 = v15;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v11);
    }

    objc_msgSend(v5, "resourceLoader");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "gridType");

    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "lockupStyle");
      v21 = v30;
    }
    else
    {
      v21 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
    }

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__SKUIGridPageSection_prefetchResourcesWithReason___block_invoke;
    v23[3] = &unk_1E73A78D0;
    v23[4] = self;
    v22 = v16;
    v26 = a3;
    v27 = v21;
    v24 = v22;
    v25 = v29;
    v28 = v18;
    -[SKUIGridPageSection _enumerateItemsFromStartIndex:withBlock:](self, "_enumerateItemsFromStartIndex:withBlock:", v10, v23);
    -[SKUIGridPageSection _loadMissingItemsFromIndex:withReason:](self, "_loadMissingItemsFromIndex:withReason:", 0, a3);

    _Block_object_dispose(v29, 8);
  }
}

void __51__SKUIGridPageSection_prefetchResourcesWithReason___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && (objc_msgSend(*(id *)(a1 + 40), "trySetReason:forRequestWithIdentifier:", *(_QWORD *)(a1 + 56), objc_msgSend(v5, "unsignedIntegerValue")) & 1) != 0)
  {
    if (*a3)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadImageForItem:lockupSize:loader:reason:", v12, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v7 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 19;
    *a3 = v7;
    if (v7)
      goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 72) == 5)
  {
    objc_msgSend(v12, "videos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10
        || (objc_msgSend(*(id *)(a1 + 40), "trySetReason:forRequestWithIdentifier:", *(_QWORD *)(a1 + 56), objc_msgSend(v10, "unsignedIntegerValue")) & 1) == 0)
      {
        +[SKUILockupItemCellLayout videoThumbnailSizeForVideo:clientContext:](SKUILockupItemCellLayout, "videoThumbnailSizeForVideo:clientContext:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
        objc_msgSend(*(id *)(a1 + 32), "_loadImageForVideo:thumbnailSize:loader:reason:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
        *a3 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 19;
      }
    }
    else
    {
      v11 = 0;
    }

  }
LABEL_13:

}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  int64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  SKUIClientContext *v25;
  SKUIClientContext *clientContext;
  SKUIVideoImageDataConsumer *v27;
  SKUIVideoImageDataConsumer *videoImageDataConsumer;
  SKUIVideoImageDataConsumer *v29;
  void *v30;
  uint64_t v31;
  SKUIVideoImageDataConsumer *v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B2890);
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "gridType");
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    objc_msgSend(v7, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (!v10)
      goto LABEL_14;
    v11 = v10;
    v12 = *(_QWORD *)v35;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "componentType");
        if (v15 == 5)
        {
          -[SKUIGridPageSection _editorialLayoutForEditorial:](self, "_editorialLayoutForEditorial:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v15 != 9)
            continue;
          -[SKUIGridPageSection _editorialLayoutForLockup:](self, "_editorialLayoutForLockup:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;
        objc_msgSend(v16, "enqueueLayoutRequests");

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v11)
      {
LABEL_14:

        break;
      }
    }
  }
  objc_msgSend(v5, "bounds");
  if (self->_isPad)
  {
    if (v18 <= v19)
    {
      self->_isLandscape = 0;
      v20 = -[SKUIGridPageSection _numberOfPortraitColumnsWithGridType:](self, "_numberOfPortraitColumnsWithGridType:", v8);
    }
    else
    {
      self->_isLandscape = 1;
      v20 = -[SKUIGridPageSection _numberOfLandscapeColumnsWithGridType:](self, "_numberOfLandscapeColumnsWithGridType:", v8);
    }
    self->_numberOfColumns = v20;
  }
  else
  {
    self->_isLandscape = 0;
    self->_numberOfColumns = 1;
    if (v18 > v19)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bounds");
      v23 = v22;

      if (v23 > 375.0)
      {
        self->_isLandscape = 1;
        self->_numberOfColumns = 2;
      }
    }
  }
  objc_msgSend(v4, "parentViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "clientContext");
  v25 = (SKUIClientContext *)objc_claimAutoreleasedReturnValue();
  clientContext = self->_clientContext;
  self->_clientContext = v25;

  v27 = objc_alloc_init(SKUIVideoImageDataConsumer);
  videoImageDataConsumer = self->_videoImageDataConsumer;
  self->_videoImageDataConsumer = v27;

  v29 = self->_videoImageDataConsumer;
  objc_msgSend(v4, "colorScheme");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIVideoImageDataConsumer setColorScheme:](v29, "setColorScheme:", v30);

  v31 = SKUIUserInterfaceIdiom(self->_clientContext);
  v32 = self->_videoImageDataConsumer;
  if (v31 == 1)
  {
    -[SKUIVideoImageDataConsumer setAllowedOrientations:](v32, "setAllowedOrientations:", 2);
    -[SKUIVideoImageDataConsumer setLandscapeSize:](self->_videoImageDataConsumer, "setLandscapeSize:", 221.0, 166.0);
  }
  else
  {
    -[SKUIVideoImageDataConsumer setAllowedOrientations:](v32, "setAllowedOrientations:", 3);
    -[SKUIVideoImageDataConsumer setLandscapeSize:](self->_videoImageDataConsumer, "setLandscapeSize:", 320.0, 180.0);
    -[SKUIVideoImageDataConsumer setPortraitSize:](self->_videoImageDataConsumer, "setPortraitSize:", 180.0, 320.0);
  }
  v33.receiver = self;
  v33.super_class = (Class)SKUIGridPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v33, sel_willAppearInContext_, v4);

}

- (void)willHideInContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SKUIGridPageSection;
  -[SKUIStorePageSection willHideInContext:](&v6, sel_willHideInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v17;
  _QWORD v18[4];
  id v19;
  SKUIGridPageSection *v20;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (self->_isPad
    || (objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "bounds"),
        v10 = v9,
        v8,
        v10 > 375.0))
  {
    self->_isLandscape = width > height;
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "gridType");
    if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      -[SKUIGridPageSection _updateVisibileEditorialWithEditorialOrientation:](self, "_updateVisibileEditorialWithEditorialOrientation:", self->_isLandscape);
    if (self->_isPad)
    {
      if (self->_isLandscape)
        v13 = -[SKUIGridPageSection _numberOfLandscapeColumnsWithGridType:](self, "_numberOfLandscapeColumnsWithGridType:", v12);
      else
        v13 = -[SKUIGridPageSection _numberOfPortraitColumnsWithGridType:](self, "_numberOfPortraitColumnsWithGridType:", v12);
    }
    else if (self->_isLandscape)
    {
      v13 = 2;
    }
    else
    {
      v13 = 1;
    }
    self->_numberOfColumns = v13;
    if (v12 == 5)
    {
      -[SKUIStorePageSection context](self, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __70__SKUIGridPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke;
      v18[3] = &unk_1E73A78A8;
      v19 = v15;
      v20 = self;
      v16 = v15;
      -[SKUIGridPageSection _enumerateVisibleIndexPathsWithBlock:](self, "_enumerateVisibleIndexPathsWithBlock:", v18);

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIGridPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v17, sel_willTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __70__SKUIGridPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cellForItemAtIndexPath:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v7 = objc_msgSend(v4, "item");

  objc_msgSend(v6, "_contentInsetForVideoLockupIndex:", v7);
  objc_msgSend(v5, "setContentInsets:");

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 containsLockups;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  SKUIGridPageSection *v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a4;
  v7 = a3;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "requestIdentifier");
  containsLockups = self->_containsLockups;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (containsLockups)
  {
    v14 = objc_msgSend(v12, "gridType");

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __51__SKUIGridPageSection_artworkRequest_didLoadImage___block_invoke;
    v25[3] = &unk_1E73A78F8;
    v25[4] = self;
    v26 = v9;
    v27 = v6;
    v28 = v10;
    v29 = v14;
    v15 = v6;
    v16 = v9;
    -[SKUIGridPageSection _enumerateVisibleItemsWithBlock:](self, "_enumerateVisibleItemsWithBlock:", v25);

  }
  else
  {
    objc_msgSend(v12, "children");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__SKUIGridPageSection_artworkRequest_didLoadImage___block_invoke_2;
    v19[3] = &unk_1E73A7920;
    v20 = v17;
    v21 = self;
    v23 = v6;
    v24 = v10;
    v22 = v9;
    v18 = v6;
    v15 = v9;
    v16 = v17;
    -[SKUIGridPageSection _enumerateVisibleIndexPathsWithBlock:](self, "_enumerateVisibleIndexPathsWithBlock:", v19);

  }
}

void __51__SKUIGridPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "unsignedIntegerValue") == *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIconImage:", *(_QWORD *)(a1 + 48));

    *a4 = 1;
LABEL_11:

    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 64) == 5)
  {
    objc_msgSend(v17, "videos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && objc_msgSend(v13, "unsignedIntegerValue") == *(_QWORD *)(a1 + 56))
      {
        objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layout");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setVideoThumbnailImage:", *(_QWORD *)(a1 + 48));

        *a4 = 1;
      }
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_11;
  }
LABEL_12:

}

void __51__SKUIGridPageSection_artworkRequest_didLoadImage___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  unint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = objc_msgSend(v13, "item");
  v6 = v5 >= objc_msgSend(*(id *)(a1 + 32), "count");
  v7 = v13;
  if (!v6)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "unsignedIntegerValue") == *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 48), "cellForItemAtIndexPath:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mediaView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setThumbnailImage:", *(_QWORD *)(a1 + 56));

      *a3 = 1;
    }

    v7 = v13;
  }

}

- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertRect:fromView:", v17, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;

  objc_msgSend(v8, "indexPathForItemAtPoint:", v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = objc_msgSend(v22, "section");
    if (v24 == -[SKUIStorePageSection sectionIndex](self, "sectionIndex"))
    {
      -[SKUIStorePageSection context](self, "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "metricsController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v26, "canRecordEventWithType:", *MEMORY[0x1E0DAFC48]))
      {
        v27 = objc_alloc_init(MEMORY[0x1E0DAF5A0]);
        SKUIMetricsMediaEventTypeForPlaybackState(a4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setMediaEventType:", v28);

        -[SKUIStorePageSection pageComponent](self, "pageComponent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "children");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v23, "item"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "locationWithPageComponent:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "locationWithPageComponent:", v31);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        if (v32 && v33)
        {
          v39[0] = v33;
          v39[1] = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setLocationWithEventLocations:", v35);

        }
        v36 = objc_msgSend(v31, "mediaIdentifier");
        if (v36)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setItemIdentifier:", v37);

        }
        objc_msgSend(v31, "mediaURLString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setMediaURL:", v38);

        objc_msgSend(v26, "recordEvent:", v27);
      }

    }
  }

}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "itemIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__SKUIGridPageSection_itemStateCenter_itemStatesChanged___block_invoke;
  v15[3] = &unk_1E739FD10;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

void __57__SKUIGridPageSection_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SKUIGridPageSection_itemStateCenter_itemStatesChanged___block_invoke_2;
  v6[3] = &unk_1E73A7948;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "_enumerateVisibleItemsWithBlock:", v6);

}

void __57__SKUIGridPageSection_itemStateCenter_itemStatesChanged___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (objc_class *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  v7 = [v5 alloc];
  v8 = objc_msgSend(v6, "itemIdentifier");

  v9 = (void *)objc_msgSend(v7, "initWithLongLong:", v8);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setItemState:animated:", v10, 1);

  }
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SKUIGridPageSection_itemStateCenterRestrictionsChanged___block_invoke;
  v6[3] = &unk_1E739FD10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __58__SKUIGridPageSection_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SKUIGridPageSection_itemStateCenterRestrictionsChanged___block_invoke_2;
  v6[3] = &unk_1E73A7948;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_enumerateVisibleItemsWithBlock:", v6);

}

void __58__SKUIGridPageSection_itemStateCenterRestrictionsChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "cellForItemAtIndexPath:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(v6, "parentalControlsRank");

  v9 = objc_msgSend(v7, "isItemRestrictedWithParentalControlsRank:", v8);
  objc_msgSend(v11, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRestricted:", v9);

}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  SKUIGridPageSection *v22;
  id v23;
  uint64_t v24;

  v7 = a4;
  v8 = a5;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v9, "_updateWithMissingItems:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      -[SKUIStorePageSection context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v9, "gridType");
      objc_msgSend(v9, "children");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __77__SKUIGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
      v19[3] = &unk_1E73A7970;
      v23 = v14;
      v24 = v13;
      v20 = v10;
      v21 = v12;
      v22 = self;
      v15 = v14;
      v16 = v12;
      -[SKUIGridPageSection _enumerateVisibleItemsWithBlock:](self, "_enumerateVisibleItemsWithBlock:", v19);

    }
  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "_updateWithInvalidItemIdentifiers:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __77__SKUIGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke_2;
      v18[3] = &unk_1E739FD38;
      v18[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v18);
    }

  }
}

void __77__SKUIGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "item");
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", v4))
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (!v5 || v5 == 5)
    {
      objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_reloadItemCell:withLockup:index:", v6, v8, v4);
      goto LABEL_7;
    }
    if (v5 == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_reloadEditorialLockupCell:withLockup:index:", v6, v8, v4);
LABEL_7:

    }
  }

}

void __77__SKUIGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 32), "sectionIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSections:", v3);

}

- (void)productPageOverlayDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SKUIProductPageOverlayController *overlayController;
  id v10;

  -[SKUIStorePageSection context](self, "context", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", self->_overlaySourceItemIndex, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIconImageHidden:", 0);

  objc_msgSend(v10, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_pageSectionDidDismissOverlayController:", self->_overlayController);

  -[SKUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  overlayController = self->_overlayController;
  self->_overlayController = 0;

  self->_overlaySourceItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[NSMutableIndexSet removeAllIndexes](self->_hiddenIconIndexSet, "removeAllIndexes");

}

- (id)_artworkContextForLockupSize:(int64_t)a3
{
  NSMapTable *lockupArtworkContexts;
  NSMapTable *v6;
  NSMapTable *v7;
  SKUIItemArtworkContext *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  lockupArtworkContexts = self->_lockupArtworkContexts;
  if (!lockupArtworkContexts)
  {
    v6 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 0);
    v7 = self->_lockupArtworkContexts;
    self->_lockupArtworkContexts = v6;

    lockupArtworkContexts = self->_lockupArtworkContexts;
  }
  NSMapGet(lockupArtworkContexts, (const void *)a3);
  v8 = (SKUIItemArtworkContext *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(SKUIItemArtworkContext);
    -[SKUIStorePageSection context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorScheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setColorScheme:](v8, "setColorScheme:", v10);

    +[SKUIProductImageDataConsumer lockupConsumerWithSize:itemKind:](SKUIProductImageDataConsumer, "lockupConsumerWithSize:itemKind:", a3, 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setGeneralConsumer:](v8, "setGeneralConsumer:", v11);

    +[SKUIStyledImageDataConsumer lockupIconConsumerWithSize:](SKUIStyledImageDataConsumer, "lockupIconConsumerWithSize:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setIconConsumer:](v8, "setIconConsumer:", v12);

    +[SKUIProductImageDataConsumer lockupConsumerWithSize:itemKind:](SKUIProductImageDataConsumer, "lockupConsumerWithSize:itemKind:", a3, 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setLetterboxConsumer:](v8, "setLetterboxConsumer:", v13);

    +[SKUIStyledImageDataConsumer lockupProductImageConsumerWithSize:](SKUIStyledImageDataConsumer, "lockupProductImageConsumerWithSize:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setNewsstandConsumer:](v8, "setNewsstandConsumer:", v14);

    +[SKUIProductImageDataConsumer lockupConsumerWithSize:itemKind:](SKUIProductImageDataConsumer, "lockupConsumerWithSize:itemKind:", a3, 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemArtworkContext setPosterConsumer:](v8, "setPosterConsumer:", v15);

    NSMapInsert(self->_lockupArtworkContexts, (const void *)a3, v8);
  }
  return v8;
}

- (id)_cellImageForItem:(id)a3 lockupSize:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  objc_msgSend(v8, "cachedResourceForRequestIdentifier:", objc_msgSend(v9, "unsignedIntegerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if ((objc_msgSend(v8, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v10, "unsignedIntegerValue")) & 1) != 0)
    {
LABEL_5:
      -[SKUIGridPageSection _artworkContextForLockupSize:](self, "_artworkContextForLockupSize:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "placeholderImageForItem:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_4:
    -[SKUIGridPageSection _loadImageForItem:lockupSize:loader:reason:](self, "_loadImageForItem:lockupSize:loader:reason:", v6, a4, v8, 1);
    goto LABEL_5;
  }
LABEL_6:

  return v11;
}

- (UIEdgeInsets)_contentInsetForMediaIndex:(int64_t)a3
{
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t numberOfColumns;
  double v10;
  double v11;
  double v13;
  double v15;
  double v16;
  UIEdgeInsets result;

  v5 = 15.0;
  if (a3 && (a3 != 1 || self->_numberOfColumns <= 1))
    v5 = 8.0;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  numberOfColumns = self->_numberOfColumns;
  v10 = 8.0;
  if ((a3 & 1) != 0)
    v10 = 15.0;
  if (numberOfColumns == 1)
    v11 = 15.0;
  else
    v11 = v10;
  if (numberOfColumns == 1 || (a3 & 1) == 0)
    v13 = 15.0;
  else
    v13 = 7.0;
  if (v8 - numberOfColumns <= a3 && v8 % numberOfColumns == 0)
    v15 = 15.0;
  else
    v15 = 7.0;
  v16 = v5;
  result.right = v11;
  result.bottom = v15;
  result.left = v13;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)_contentInsetForVideoLockupIndex:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t numberOfColumns;
  double v11;
  double v12;
  uint64_t v13;
  int64_t v14;
  double v15;
  double v16;
  double v18;
  double v19;
  UIEdgeInsets result;

  v5 = 15.0;
  v6 = 15.0;
  if (self->_numberOfColumns > a3)
  {
    if (self->_isPad)
      v6 = 28.0;
    else
      v6 = 0.0;
  }
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  numberOfColumns = self->_numberOfColumns;
  v11 = 15.0;
  if (numberOfColumns != 1)
  {
    if (a3 % numberOfColumns)
    {
      if (numberOfColumns == 4)
        v11 = 28.0;
      else
        v11 = 25.0;
      v12 = 26.0;
      if (numberOfColumns == 4)
        v12 = 28.0;
      if (a3 % numberOfColumns == numberOfColumns - 1)
        v5 = v12;
      else
        v5 = 0.0;
    }
    else
    {
      v11 = 28.0;
      if (numberOfColumns != 4)
        v11 = 26.0;
      v5 = 0.0;
    }
  }
  v13 = v9 % numberOfColumns;
  v14 = v9 - numberOfColumns;
  v15 = 40.0;
  if (!self->_isPad)
    v15 = 7.0;
  v16 = 28.0;
  if (!self->_isPad)
    v16 = 12.0;
  if (v14 > a3 || v13 != 0)
    v16 = v15;
  v18 = v6;
  v19 = v5;
  result.right = v19;
  result.bottom = v16;
  result.left = v11;
  result.top = v18;
  return result;
}

- (id)_editorialCellWithEditorials:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B32F0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = SKUIEditorialLayoutOrientationForView(v9);
  v13 = objc_msgSend(v7, "item");

  if (v13 >= objc_msgSend(v6, "count"))
  {
    objc_msgSend(v11, "applyEditorialLayout:withOrientation:expanded:", 0, v12, 1);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection _editorialLayoutForEditorial:](self, "_editorialLayoutForEditorial:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applyEditorialLayout:withOrientation:expanded:", v15, v12, 1);

  }
  objc_msgSend(v8, "colorScheme");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColoringWithColorScheme:", v16);

  return v10;
}

- (id)_editorialLayoutForEditorial:(id)a3
{
  id v4;
  SKUIEditorialLayout *v5;
  SKUIEditorialLayout *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v17;
  NSMapTable *editorialLayouts;
  NSMapTable *v19;
  NSMapTable *v20;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_editorialLayouts, "objectForKey:", v4);
  v5 = (SKUIEditorialLayout *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = [SKUIEditorialLayout alloc];
    -[SKUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLayoutCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SKUIEditorialLayout initWithEditorial:layoutCache:](v6, "initWithEditorial:layoutCache:", v4, v8);

    -[SKUIStorePageSection context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    if (self->_isPad)
    {
      v15 = v14 * 0.5 + -30.0;
      -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v5, "setLayoutWidth:forOrientation:", 1, floorf(v15));
      v16 = v12 * 0.5 + -30.0;
      v17 = floorf(v16);
    }
    else
    {
      -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v5, "setLayoutWidth:forOrientation:", 1, v14 + -30.0);
      v17 = v12 + -30.0;
    }
    -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v5, "setLayoutWidth:forOrientation:", 0, v17);
    editorialLayouts = self->_editorialLayouts;
    if (!editorialLayouts)
    {
      v19 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      v20 = self->_editorialLayouts;
      self->_editorialLayouts = v19;

      editorialLayouts = self->_editorialLayouts;
    }
    -[NSMapTable setObject:forKey:](editorialLayouts, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)_editorialLayoutForLockup:(id)a3
{
  id v4;
  SKUIEditorialLayout *v5;
  void *v6;
  SKUIEditorialLayout *v7;
  void *v8;
  void *v9;
  _BOOL4 IsHorizontal;
  double v11;
  double v12;
  NSMapTable *editorialLayouts;
  NSMapTable *v14;
  NSMapTable *v15;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_editorialLayouts, "objectForKey:", v4);
  v5 = (SKUIEditorialLayout *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "editorial");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [SKUIEditorialLayout alloc];
    -[SKUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLayoutCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SKUIEditorialLayout initWithEditorial:layoutCache:](v7, "initWithEditorial:layoutCache:", v6, v9);

    if (v4)
      objc_msgSend(v4, "lockupStyle");
    IsHorizontal = SKUILockupLayoutStyleIsHorizontal(0);
    v11 = 328.0;
    if (IsHorizontal)
    {
      v11 = 477.0;
      v12 = 349.0;
    }
    else
    {
      v12 = 200.0;
    }
    -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v5, "setLayoutWidth:forOrientation:", 1, v11, 200.0);
    -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v5, "setLayoutWidth:forOrientation:", 0, v12);
    editorialLayouts = self->_editorialLayouts;
    if (!editorialLayouts)
    {
      v14 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      v15 = self->_editorialLayouts;
      self->_editorialLayouts = v14;

      editorialLayouts = self->_editorialLayouts;
    }
    -[NSMapTable setObject:forKey:](editorialLayouts, "setObject:forKey:", v5, v4);

  }
  return v5;
}

- (id)_editorialLockupCellWithLockups:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73BC8D0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientContext:", self->_clientContext);
  objc_msgSend(v8, "itemOfferButtonAppearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItemOfferButtonAppearance:", v12);

  v13 = objc_msgSend(v7, "item");
  v14 = 20.0;
  if ((v13 & 1) != 0)
    v15 = 15.0;
  else
    v15 = 20.0;
  if ((v13 & 1) == 0)
    v14 = 15.0;
  if (self->_numberOfColumns == 1)
  {
    v14 = 15.0;
    v16 = 15.0;
  }
  else
  {
    v16 = v15;
  }
  objc_msgSend(v11, "setContentInsets:", 15.0, v14, 15.0, v16);
  if (v13 >= objc_msgSend(v6, "count"))
  {
    objc_msgSend(v10, "configureForItem:clientContext:", 0, self->_clientContext);
    objc_msgSend(v11, "lockupCellLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIconImage:", 0);

    objc_msgSend(v11, "applyEditorialLayout:withOrientation:", 0, 0);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection _reloadEditorialLockupCell:withLockup:index:](self, "_reloadEditorialLockupCell:withLockup:index:", v10, v17, v13);

  }
  return v10;
}

- (void)_enumerateItemsFromStartIndex:(int64_t)a3 withBlock:(id)a4
{
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  char v13;

  v6 = (void (**)(id, void *, _BYTE *))a4;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v13 = 0;
  if (v9 > a3)
  {
    v10 = v9;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "item");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v12, &v13);

      ++a3;
    }
    while (a3 < v10 && !v13);
  }

}

- (void)_enumerateVisibleIndexPathsWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SKUIStorePageSection sectionIndex](self, "sectionIndex");
  objc_msgSend(v6, "indexPathsForVisibleItems");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
      if (objc_msgSend(v13, "section") == v7)
      {
        v14 = 0;
        v4[2](v4, v13, &v14);
        if (v14)
          break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_enumerateVisibleItemsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SKUIGridPageSection__enumerateVisibleItemsWithBlock___block_invoke;
  v6[3] = &unk_1E73A7998;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SKUIGridPageSection _enumerateVisibleIndexPathsWithBlock:](self, "_enumerateVisibleIndexPathsWithBlock:", v6);

}

void __55__SKUIGridPageSection__enumerateVisibleItemsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemForIndex:", objc_msgSend(v4, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (double)_heightForEditorialAtIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 isLandscape;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;
  void *v17;
  double v18;

  v4 = objc_msgSend(a3, "item");
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  isLandscape = self->_isLandscape;
  if (self->_numberOfColumns == 1)
  {
    objc_msgSend(v6, "objectAtIndex:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection _editorialLayoutForEditorial:](self, "_editorialLayoutForEditorial:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "layoutHeightForOrientation:expanded:", isLandscape, 1);
    v11 = v10;
  }
  else
  {
    v12 = v4 - ((v4 & 0x8000000000000001) == 1);
    objc_msgSend(v6, "objectAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection _editorialLayoutForEditorial:](self, "_editorialLayoutForEditorial:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "layoutHeightForOrientation:expanded:", isLandscape, 1);
    v11 = v14;
    v15 = v12 + 1;
    if (v15 < objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGridPageSection _editorialLayoutForEditorial:](self, "_editorialLayoutForEditorial:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "layoutHeightForOrientation:expanded:", isLandscape, 1);
      if (v11 < v18)
        v11 = v18;

    }
  }

  return v11 + 32.0;
}

- (double)_heightForEditorialLockup:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  char v11;
  uint64_t v12;

  v4 = a3;
  +[SKUILockupItemCellLayout heightForLockupComponent:clientContext:](SKUILockupItemCellLayout, "heightForLockupComponent:clientContext:", v4, self->_clientContext);
  v6 = v5;
  -[SKUIGridPageSection _editorialLayoutForLockup:](self, "_editorialLayoutForLockup:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutHeightForOrientation:expanded:", self->_isLandscape, 1);
  v9 = v8 + 42.0;
  if (v4)
  {
    objc_msgSend(v4, "lockupStyle");
    if (!SKUILockupLayoutStyleIsHorizontal(v12))
    {
      objc_msgSend(v4, "lockupStyle");
      if ((v11 & 4) != 0)
        v9 = v9 + 41.0;
      goto LABEL_7;
    }
LABEL_6:
    v6 = v6 + v9;
    goto LABEL_9;
  }
  if (SKUILockupLayoutStyleIsHorizontal(0))
    goto LABEL_6;
LABEL_7:
  if (v9 >= v6)
    v6 = v9;
LABEL_9:

  return v6;
}

- (double)_heightForEditorialLockupAtIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  void *v13;
  double v14;

  v4 = objc_msgSend(a3, "item");
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_numberOfColumns == 1)
  {
    objc_msgSend(v6, "objectAtIndex:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection _heightForEditorialLockup:](self, "_heightForEditorialLockup:", v7);
    v9 = v8;
  }
  else
  {
    v10 = v4 - ((v4 & 0x8000000000000001) == 1);
    objc_msgSend(v6, "objectAtIndex:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection _heightForEditorialLockup:](self, "_heightForEditorialLockup:", v7);
    v9 = v11;
    v12 = v10 + 1;
    if (v12 < objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGridPageSection _heightForEditorialLockup:](self, "_heightForEditorialLockup:", v13);
      if (v9 < v14)
        v9 = v14;

    }
  }

  return v9;
}

- (double)_heightForLockupAtIndexPath:(id)a3 gridType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t numberOfColumns;
  void *v11;
  double v12;
  double i;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v6 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "item");
  numberOfColumns = self->_numberOfColumns;
  if (numberOfColumns == 1)
  {
    objc_msgSend(v8, "objectAtIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUILockupItemCellLayout heightForLockupComponent:clientContext:](SKUILockupItemCellLayout, "heightForLockupComponent:clientContext:", v11, self->_clientContext);
    i = v12;

  }
  else
  {
    v14 = v9 / numberOfColumns * numberOfColumns;
    for (i = 0.0; v14 < objc_msgSend(v8, "count"); ++v14)
    {
      objc_msgSend(v8, "objectAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKUILockupItemCellLayout heightForLockupComponent:clientContext:](SKUILockupItemCellLayout, "heightForLockupComponent:clientContext:", v15, self->_clientContext);
      v17 = v16;

      if (i < v17)
        i = v17;
    }
  }
  if (a4 == 5)
  {
    -[SKUIGridPageSection _contentInsetForVideoLockupIndex:](self, "_contentInsetForVideoLockupIndex:", objc_msgSend(v6, "item"));
    i = i + v18 + v19;
  }
  else if (!a4)
  {
    i = i + 20.0;
  }

  return i;
}

- (double)_heightForMedia:(id)a3 width:(double)a4
{
  void *v5;
  double v6;
  float v7;
  double v8;

  objc_msgSend(a3, "bestThumbnailArtwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)objc_msgSend(v5, "height");
  v7 = a4 / (double)objc_msgSend(v5, "width") * v6;
  v8 = floorf(v7);

  return v8;
}

- (double)_heightForMediaAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  unint64_t v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "item");
  -[SKUIGridPageSection _mediaWidthForMediaIndex:gridWidth:](self, "_mediaWidthForMediaIndex:gridWidth:", v11, v8);
  v13 = v12;
  if (self->_numberOfColumns == 1)
  {
    objc_msgSend(v10, "objectAtIndex:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection _heightForMedia:width:](self, "_heightForMedia:width:", v14, v13);
    v16 = v15;

  }
  else
  {
    v17 = v11 - ((v11 & 0x8000000000000001) == 1);
    objc_msgSend(v10, "objectAtIndex:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection _heightForMedia:width:](self, "_heightForMedia:width:", v18, v13);
    v16 = v19;

    v11 = v17 + 1;
    if (v11 < objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndex:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGridPageSection _heightForMedia:width:](self, "_heightForMedia:width:", v20, v13);
      v22 = v21;

      if (v16 < v22)
        v16 = v22;
    }
  }
  -[SKUIGridPageSection _contentInsetForMediaIndex:](self, "_contentInsetForMediaIndex:", v11);
  v25 = v16 + v23 + v24;

  return v25;
}

- (id)_itemCellWithLockups:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;

  v6 = a3;
  v7 = a4;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B2890, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "colorScheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "primaryTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSeparatorColor:", v13);

  }
  objc_msgSend(v10, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClientContext:", self->_clientContext);
  objc_msgSend(v14, "setColoringWithColorScheme:", v12);
  objc_msgSend(v8, "itemOfferButtonAppearance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItemOfferButtonAppearance:", v15);

  objc_msgSend(v14, "setVerticalAlignment:", 1);
  v16 = objc_msgSend(v7, "item");
  if (v16 >= objc_msgSend(v6, "count"))
  {
    objc_msgSend(v10, "configureForItem:clientContext:", 0, self->_clientContext);
    objc_msgSend(v14, "setIconImage:", 0);
    objc_msgSend(v14, "setVideoThumbnailImage:", 0);
    objc_msgSend(v14, "setVideoThumbnailSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(v14, "setVisibleFields:", 0);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGridPageSection _reloadItemCell:withLockup:index:](self, "_reloadItemCell:withLockup:index:", v10, v17, v16);

  }
  v20 = 1;
  if (self->_isPad)
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "gridType");

    if (v19 == 5)
      v20 = 0;
  }
  objc_msgSend(v10, "setSeparatorStyle:", v20);

  return v10;
}

- (id)_itemForIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_containsLockups)
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count") <= (unint64_t)a3)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndex:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_loadImageForItem:(id)a3 lockupSize:(int64_t)a4 loader:(id)a5 reason:(int64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  SKUIArtworkRequest *v13;
  void *v14;
  void *v15;
  NSMapTable *artworkRequests;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a5;
  -[SKUIGridPageSection _artworkContextForLockupSize:](self, "_artworkContextForLockupSize:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLForItem:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc_init(SKUIArtworkRequest);
    -[SKUIArtworkRequest setDelegate:](v13, "setDelegate:", self);
    -[SKUIGridPageSection _artworkContextForLockupSize:](self, "_artworkContextForLockupSize:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataConsumerForItem:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIArtworkRequest setDataConsumer:](v13, "setDataConsumer:", v15);

    -[SKUIArtworkRequest setURL:](v13, "setURL:", v12);
    artworkRequests = self->_artworkRequests;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v13, "requestIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](artworkRequests, "setObject:forKey:", v17, v18);

    objc_msgSend(v10, "loadResourceWithRequest:reason:", v13, a6);
  }

}

- (void)_loadImageForVideo:(id)a3 thumbnailSize:(CGSize)a4 loader:(id)a5 reason:(int64_t)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  SKUIArtworkRequest *v15;
  NSMapTable *artworkRequests;
  void *v17;
  id v18;

  height = a4.height;
  width = a4.width;
  v18 = a3;
  v11 = a5;
  objc_msgSend(v18, "artworks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bestArtworkForScaledSize:", width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc_init(SKUIArtworkRequest);
    -[SKUIArtworkRequest setDataConsumer:](v15, "setDataConsumer:", self->_videoImageDataConsumer);
    -[SKUIArtworkRequest setDelegate:](v15, "setDelegate:", self);
    -[SKUIArtworkRequest setURL:](v15, "setURL:", v14);
    artworkRequests = self->_artworkRequests;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v15, "requestIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](artworkRequests, "setObject:forKey:", v17, v18);

    objc_msgSend(v11, "loadResourceWithRequest:reason:", v15, a6);
  }

}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  void *v7;
  id v8;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isMissingItemData"))
  {
    -[SKUIGridPageSection _missingItemLoader](self, "_missingItemLoader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadItemsForPageComponent:startIndex:reason:", v8, a3, a4);

  }
}

- (id)_mediaCellWithMedia:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMapTable *artworkRequests;

  v6 = a3;
  v7 = a4;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73BC4B0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "item");

  -[SKUIGridPageSection _contentInsetForMediaIndex:](self, "_contentInsetForMediaIndex:", v11);
  objc_msgSend(v10, "setContentInset:");
  if (v11 >= objc_msgSend(v6, "count"))
  {
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  -[SKUIStorePageSection context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resourceLoader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    goto LABEL_6;
  objc_msgSend(v14, "cachedResourceForRequestIdentifier:", objc_msgSend(v15, "unsignedIntegerValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    if ((objc_msgSend(v14, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v16, "unsignedIntegerValue")) & 1) != 0)
    {
LABEL_9:
      v17 = 0;
      goto LABEL_10;
    }
LABEL_6:
    objc_msgSend(v12, "bestThumbnailArtwork");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = -[SKUIGridPageSection _newSizeToFitArtworkRequestWithArtwork:mediaIndex:](self, "_newSizeToFitArtworkRequestWithArtwork:mediaIndex:", v18, v11);
      artworkRequests = self->_artworkRequests;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "requestIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](artworkRequests, "setObject:forKey:", v20, v12);

      objc_msgSend(v14, "loadResourceWithRequest:reason:", v19, 1);
    }

    goto LABEL_9;
  }
LABEL_10:

LABEL_13:
  objc_msgSend(v10, "mediaView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityLabel:", v22);

  objc_msgSend(v21, "setDelegate:", self);
  objc_msgSend(v21, "setMediaType:", objc_msgSend(v12, "mediaType"));
  objc_msgSend(v12, "mediaURLString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMediaURLString:", v23);

  objc_msgSend(v21, "setThumbnailImage:", v17);
  return v10;
}

- (double)_mediaWidthForMediaIndex:(int64_t)a3 gridWidth:(double)a4
{
  double v6;
  double v7;
  float v8;
  double result;
  double v10;

  -[SKUIGridPageSection _contentInsetForMediaIndex:](self, "_contentInsetForMediaIndex:", a3);
  v8 = a4 * 0.5 - v6 - v7;
  result = floorf(v8);
  v10 = a4 - v6 - v7;
  if (self->_numberOfColumns == 1)
    return v10;
  return result;
}

- (id)_missingItemLoader
{
  SKUIMissingItemLoader *missingItemLoader;
  SKUIMissingItemLoader *v4;
  void *v5;
  void *v6;
  SKUIMissingItemLoader *v7;
  SKUIMissingItemLoader *v8;

  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    v4 = [SKUIMissingItemLoader alloc];
    -[SKUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourceLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SKUIMissingItemLoader initWithResourceLoader:](v4, "initWithResourceLoader:", v6);
    v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    -[SKUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", self);
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (id)_newSizeToFitArtworkRequestWithArtwork:(id)a3 mediaIndex:(int64_t)a4
{
  id v6;
  SKUIArtworkRequest *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v6 = a3;
  v7 = objc_alloc_init(SKUIArtworkRequest);
  -[SKUIArtworkRequest setDelegate:](v7, "setDelegate:", self);
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIArtworkRequest setURL:](v7, "setURL:", v8);
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[SKUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "landscapePageWidth");
  -[SKUIGridPageSection _mediaWidthForMediaIndex:gridWidth:](self, "_mediaWidthForMediaIndex:gridWidth:", a4);
  v12 = v11;

  +[SKUISizeToFitImageDataConsumer consumerWithConstraintSize:](SKUISizeToFitImageDataConsumer, "consumerWithConstraintSize:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIArtworkRequest setDataConsumer:](v7, "setDataConsumer:", v13);

  return v7;
}

- (int64_t)_numberOfLandscapeColumnsWithGridType:(int64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 == 5)
    v3 = 4;
  if (a3)
    return v3;
  else
    return 3;
}

- (int64_t)_numberOfPortraitColumnsWithGridType:(int64_t)a3
{
  if (a3 == 5)
    return 3;
  else
    return 2;
}

- (id)_popSourceViewForOverlayController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  void *v33;
  NSMutableIndexSet *hiddenIconIndexSet;
  NSMutableIndexSet *v35;
  NSMutableIndexSet *v36;
  char v38;
  CGRect v39;

  v4 = a3;
  v5 = v4;
  if (self->_overlaySourceItemIndex != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "numberOfVisibleOverlays") <= 1)
  {
    -[SKUIStorePageSection context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", self->_overlaySourceItemIndex, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", self->_overlaySourceItemIndex);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "iconImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (v13)
      {
        objc_msgSend(v13, "lockupStyle");

        if ((v38 & 2) != 0)
        {
          v16 = objc_alloc(MEMORY[0x1E0DC3890]);
          objc_msgSend(v10, "iconImage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v16, "initWithImage:", v17);

          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBackgroundColor:", v18);

          objc_msgSend(v10, "iconImageView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "frame");
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;
          objc_msgSend(v15, "frame");
          v29 = v28;
          v31 = v30;
          v39.origin.x = v21;
          v39.origin.y = v23;
          v39.size.width = v25;
          v39.size.height = v27;
          v32 = CGRectGetMaxY(v39) - v31;
          objc_msgSend(v19, "superview");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "convertRect:toView:", 0, v21, v32, v29, v31);
          objc_msgSend(v15, "setFrame:");

          hiddenIconIndexSet = self->_hiddenIconIndexSet;
          if (!hiddenIconIndexSet)
          {
            v35 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
            v36 = self->_hiddenIconIndexSet;
            self->_hiddenIconIndexSet = v35;

            hiddenIconIndexSet = self->_hiddenIconIndexSet;
          }
          -[NSMutableIndexSet addIndex:](hiddenIconIndexSet, "addIndex:", self->_overlaySourceItemIndex);
          objc_msgSend(v10, "setIconImageHidden:", 1);

          goto LABEL_12;
        }
      }
      else
      {

      }
      v15 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)_reloadEditorialLockupCell:(id)a3 withLockup:(id)a4 index:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *moreButtonTitle;
  id v17;
  void *v18;
  id v19;
  SKUIClientContext *clientContext;
  id v21;
  NSString *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  -[SKUIStorePageSection context](self, "context");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v9, "lockupStyle");
  objc_msgSend(v11, "setLayoutStyle:", 0);
  objc_msgSend(v11, "setVisibleFields:", 0);
  objc_msgSend(v9, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureForItem:clientContext:", v12, self->_clientContext);
  objc_msgSend(v11, "lockupCellLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGridPageSection _cellImageForItem:lockupSize:](self, "_cellImageForItem:lockupSize:", v12, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIconImage:");
  objc_msgSend(v13, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", a5));
  objc_msgSend(v13, "setImageBoundingSize:", self->_lockupImageBoundingSize.width, self->_lockupImageBoundingSize.height);
  -[SKUIGridPageSection _editorialLayoutForLockup:](self, "_editorialLayoutForLockup:", v9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applyEditorialLayout:withOrientation:", v31, SKUIEditorialLayoutOrientationForView(v10));
  objc_msgSend(v9, "editorial");
  v30 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textBoxView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfVisibleLines:", objc_msgSend(v14, "maximumBodyLines"));
  objc_msgSend(v15, "setTruncationStyle:", 1);
  moreButtonTitle = self->_moreButtonTitle;
  v17 = v9;
  if (!moreButtonTitle)
  {
    v27 = v12;
    v28 = v8;
    v18 = v13;
    v19 = v17;
    clientContext = self->_clientContext;
    if (clientContext)
    {
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
    }
    else
    {
      v21 = 0;
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
    }
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();

    v23 = self->_moreButtonTitle;
    self->_moreButtonTitle = v22;

    moreButtonTitle = self->_moreButtonTitle;
    v8 = v28;
    v17 = v19;
    v13 = v18;
  }
  v29 = v17;
  objc_msgSend(v15, "setMoreButtonTitle:", moreButtonTitle, v27, v28);
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stateForItemWithIdentifier:", objc_msgSend(v12, "itemIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItemState:", v25);
  objc_msgSend(v11, "setRestricted:", objc_msgSend(v24, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v12, "parentalControlsRank")));
  objc_msgSend(v33, "colorScheme");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColoringWithColorScheme:", v26);

}

- (void)_reloadItemCell:(id)a3 withLockup:(id)a4 index:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureForItem:clientContext:", v10, self->_clientContext);
  objc_msgSend(v9, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setImageBoundingSize:", self->_lockupImageBoundingSize.width, self->_lockupImageBoundingSize.height);
  if (v8)
    objc_msgSend(v8, "lockupStyle");
  objc_msgSend(v11, "setLayoutStyle:", 0);
  objc_msgSend(v11, "setLockupSize:", 0);
  objc_msgSend(v11, "setContentInsets:", 10.0, 15.0, 10.0, 15.0);
  if (v10)
  {
    -[SKUIGridPageSection _cellImageForItem:lockupSize:](self, "_cellImageForItem:lockupSize:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIconImage:", v12);
    objc_msgSend(v11, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", a5));
    objc_msgSend(v11, "setPlaysInlineVideo:", !self->_isPad);
    objc_msgSend(v11, "setVisibleFields:", 0);
    objc_msgSend(v11, "setVideoThumbnailImage:", 0);
    objc_msgSend(v11, "setVideoThumbnailSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  }
  else
  {
    objc_msgSend(v11, "setIconImage:", 0);
    objc_msgSend(v11, "setVideoThumbnailImage:", 0);
    objc_msgSend(v11, "setVideoThumbnailSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(v11, "setVisibleFields:", 0);
  }
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stateForItemWithIdentifier:", objc_msgSend(v10, "itemIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItemState:", v14);
  objc_msgSend(v11, "setRestricted:", objc_msgSend(v13, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v10, "parentalControlsRank")));

}

- (void)_selectItem:(id)a3 withIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 isPad;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  SKUIPlayableAsset *v25;
  int64_t v26;
  _QWORD block[5];
  id v28;
  int64_t v29;

  v6 = a3;
  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGridPageSection clickEventWithItem:elementName:index:](self, "clickEventWithItem:elementName:index:", v6, *MEMORY[0x1E0DAFCA0], a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "metricsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordEvent:", v8);

  }
  objc_msgSend(v7, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v11, "sectionsViewController:showProductPageForItem:", v10, v6) & 1) == 0)
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "gridType");

    if (v13 == 5)
    {
      objc_msgSend(v6, "videos");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v15, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (isPad = self->_isPad, v16, isPad))
    {
      v25 = -[SKUIPlayableAsset initWithVideo:]([SKUIPlayableAsset alloc], "initWithVideo:", v15);
      v26 = a4;
      -[SKUIStorePageSection context](self, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clientContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIVideoPreviewPlayPlayableAsset(v25, v19);
      v20 = v7;
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[SKUIStorePageSection context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "parentViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "presentViewController:animated:completion:", v21, 1, 0);

      v24 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__SKUIGridPageSection__selectItem_withIndex___block_invoke;
      block[3] = &unk_1E73A79C0;
      block[4] = self;
      v28 = v6;
      v29 = v26;
      dispatch_after(v24, MEMORY[0x1E0C80D38], block);

      v7 = v20;
    }
    else
    {
      -[SKUIGridPageSection _showProductPageWithItem:index:animated:](self, "_showProductPageWithItem:index:animated:", v6, a4, 1);
    }

  }
}

uint64_t __45__SKUIGridPageSection__selectItem_withIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showProductPageWithItem:index:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)_setPositionForClickEvent:(id)a3 withElementIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v6 = a3;
    -[SKUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForItemAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    SKUIMetricsSetClickEventPositionWithView(v6, v9);
  }
}

- (void)_showProductPageWithItem:(id)a3 index:(int64_t)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v7 = a3;
  v8 = v7;
  if (self->_isPad && SKUIItemKindIsSoftwareKind(objc_msgSend(v7, "itemKind")))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__SKUIGridPageSection__showProductPageWithItem_index_animated___block_invoke;
    v9[3] = &unk_1E73A2738;
    v9[4] = self;
    v11 = a4;
    v10 = v8;
    -[SKUIStorePageSection sendXEventWithItem:completionBlock:](self, "sendXEventWithItem:completionBlock:", v10, v9);

  }
  else
  {
    -[SKUIStorePageSection showProductViewControllerWithItem:](self, "showProductViewControllerWithItem:", v8);
  }

}

void __63__SKUIGridPageSection__showProductPageWithItem_index_animated___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  SKUIProductPageOverlayController *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v4 + 176))
    {
      v5 = -[SKUIProductPageOverlayController initWithParentViewController:]([SKUIProductPageOverlayController alloc], "initWithParentViewController:", v8);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 176);
      *(_QWORD *)(v6 + 176) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setClientContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setDelegate:");
      v4 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v4 + 184) = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "showWithInitialItem:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v8, "_setActiveProductPageOverlayController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));

  }
}

- (void)_updateVisibileEditorialWithEditorialOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SKUIGridPageSection *v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v5;
  objc_msgSend(v5, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SKUIStorePageSection sectionIndex](self, "sectionIndex");
  v25 = self;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "gridType");
  v24 = v8;
  objc_msgSend(v8, "children");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v27, "count");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v16, "section") == v7)
        {
          v17 = objc_msgSend(v16, "item");
          if (v17 < v10)
          {
            v18 = v17;
            if (v9 == 1)
            {
              objc_msgSend(v28, "cellForItemAtIndexPath:", v16);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectAtIndex:", v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[SKUIGridPageSection _editorialLayoutForLockup:](v25, "_editorialLayoutForLockup:", v23);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "layout");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "applyEditorialLayout:withOrientation:", v21, a3);
            }
            else
            {
              if (v9 != 3)
                continue;
              objc_msgSend(v28, "cellForItemAtIndexPath:", v16);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectAtIndex:", v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[SKUIGridPageSection _editorialLayoutForEditorial:](v25, "_editorialLayoutForEditorial:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "layout");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "applyEditorialLayout:withOrientation:expanded:", v21, a3, 1);
            }

          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);
  }

}

- (id)_videoThumbnailImageForVideo:(id)a3 thumbnailSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SKUISizeValue *v13;
  uint64_t v14;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceLoader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_4;
  objc_msgSend(v9, "cachedResourceForRequestIdentifier:", objc_msgSend(v10, "unsignedIntegerValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_12;
  if ((objc_msgSend(v9, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v11, "unsignedIntegerValue")) & 1) == 0)
LABEL_4:
    -[SKUIGridPageSection _loadImageForVideo:thumbnailSize:loader:reason:](self, "_loadImageForVideo:thumbnailSize:loader:reason:", v7, v9, 1, width, height);
  v13 = -[SKUISizeValue initWithSize:]([SKUISizeValue alloc], "initWithSize:", width, height);
  -[NSMutableDictionary objectForKey:](self->_videoPlaceholderImages, "objectForKey:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (width <= height)
      v14 = 1;
    else
      v14 = 2;
    -[SKUIVideoImageDataConsumer imageForColor:orientation:](self->_videoImageDataConsumer, "imageForColor:orientation:", 0, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[NSMutableDictionary setObject:forKey:](self->_videoPlaceholderImages, "setObject:forKey:", v12, v13);
  }

LABEL_12:
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlaceholderImages, 0);
  objc_storeStrong((id *)&self->_videoImageDataConsumer, 0);
  objc_storeStrong((id *)&self->_lockupArtworkContexts, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_moreButtonTitle, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_hiddenIconIndexSet, 0);
  objc_storeStrong((id *)&self->_editorialLayouts, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_artworkRequests, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGridPageSection initWithPageComponent:]";
}

@end
