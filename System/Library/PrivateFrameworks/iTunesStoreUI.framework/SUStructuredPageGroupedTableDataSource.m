@implementation SUStructuredPageGroupedTableDataSource

- (BOOL)canShowItemOfferButtonForItem:(id)a3
{
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v5 = objc_msgSend(a3, "itemType");
  v6 = (unint64_t)(v5 - 1005) > 6 || v5 == 1010;
  if (v6 && v5 != 4000 && v5 != 11)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  return -[SUStructuredPageTableDataSource canShowItemOfferButtonForItem:](&v8, sel_canShowItemOfferButtonForItem_, a3);
}

- (Class)cellClassForItem:(id)a3 reuseIdentifier:(id *)a4
{
  objc_super v8;

  if (objc_msgSend(a3, "itemType") == 1008 && objc_msgSend(a3, "itemDisplayType") == 2)
  {
    if (a4)
      *a4 = CFSTR("sunp");
    return (Class)objc_opt_class();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUStructuredPageGroupedTableDataSource;
    return -[SUStructuredPageTableDataSource cellClassForItem:reuseIdentifier:](&v8, sel_cellClassForItem_reuseIdentifier_, a3, a4);
  }
}

- (Class)cellConfigurationClassForItem:(id)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = objc_msgSend(a3, "itemType");
  if (v5 <= 1999)
  {
    switch(v5)
    {
      case 1000:
      case 1001:
      case 1002:
      case 1003:
      case 1004:
      case 1006:
      case 1009:
      case 1010:
        return (Class)objc_opt_class();
      case 1005:
      case 1007:
      case 1008:
      case 1011:
LABEL_9:
        if (self->super._style != 1)
          objc_msgSend(a3, "itemDisplayType");
        break;
      default:
        switch(v5)
        {
          case 1:
          case 3:
          case 4:
          case 5:
          case 6:
            return (Class)objc_opt_class();
          case 11:
            goto LABEL_9;
          default:
            goto LABEL_5;
        }
    }
  }
  else if (v5 != 4000 && v5 != 3000 && v5 != 2000)
  {
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)SUStructuredPageGroupedTableDataSource;
    return -[SUStructuredPageTableDataSource cellConfigurationClassForItem:](&v7, sel_cellConfigurationClassForItem_, a3);
  }
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v7;
  void *v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  -[SUStructuredPageTableDataSource configureCell:forIndexPath:](&v10, sel_configureCell_forIndexPath_);
  v7 = objc_msgSend(-[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->super._structuredPage, "itemList"), "itemAtIndexPath:", a4), "itemType");
  if ((unint64_t)(v7 - 4) >= 2)
  {
    if (v7 == 6)
      objc_msgSend(a3, "setBackgroundView:", 0);
  }
  else if (self->super._style != 2)
  {
    v8 = (void *)objc_msgSend(a3, "configuration");
    if (objc_msgSend(a4, "row"))
      -[SUStructuredPageTableDataSource cellHeightForIndexPath:](self, "cellHeightForIndexPath:", objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(a4, "row") - 1, objc_msgSend(a4, "section")));
    else
      v9 = 0.0;
    objc_msgSend(v8, "setPreviousCellHeight:", v9);
  }
}

- (double)heightForFooterInSection:(int64_t)a3
{
  double v5;
  double v6;
  SUItemList *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  -[SUTableDataSource heightForFooterInSection:](&v13, sel_heightForFooterInSection_);
  v6 = v5;
  v7 = -[SUStructuredPage itemList](self->super._structuredPage, "itemList");
  if (-[SUItemList numberOfSections](v7, "numberOfSections") - 1 > a3
    && -[SUStructuredPageGroupedTableDataSource tableViewStyle](self, "tableViewStyle") == 1)
  {
    v8 = -[SUItemList itemsForSectionAtIndex:](v7, "itemsForSectionAtIndex:", a3);
    v9 = -[SUItemList itemsForSectionAtIndex:](v7, "itemsForSectionAtIndex:", a3 + 1);
    if (objc_msgSend(v8, "count"))
    {
      if (objc_msgSend(v9, "count"))
      {
        v10 = (void *)objc_msgSend(v8, "lastObject");
        v11 = (void *)objc_msgSend(v9, "objectAtIndex:", 0);
        if (objc_msgSend(v10, "itemType") == 8 && objc_msgSend(v11, "itemType") == 8)
          return 1.0;
      }
    }
  }
  return v6;
}

- (id)newHeaderViewForSection:(int64_t)a3
{
  void *v5;
  id v6;
  SUTableHeaderView *v7;
  SUTableHeaderView *v8;

  if (!-[SUStructuredPageGroupedTableDataSource tableViewStyle](self, "tableViewStyle"))
    return 0;
  v5 = (void *)objc_msgSend(-[SUItemList sectionItemForSectionAtIndex:](-[SUStructuredPage itemList](self->super._structuredPage, "itemList"), "sectionItemForSectionAtIndex:", a3), "title");
  v6 = -[SUStructuredPageGroupedTableDataSource _subtitleForSectionIndex:](self, "_subtitleForSectionIndex:", a3);
  if (!objc_msgSend(v5, "length") && !objc_msgSend(v6, "length"))
    return 0;
  v7 = [SUTableHeaderView alloc];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  v8 = -[SUTableHeaderView initWithFrame:](v7, "initWithFrame:");
  -[SUTableHeaderView setBackgroundColor:](v8, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[SUTableHeaderView setIndex:](v8, "setIndex:", a3);
  -[SUTableHeaderView setSubtitle:](v8, "setSubtitle:", v6);
  -[SUTableHeaderView setTitle:](v8, "setTitle:", v5);
  -[SUTableHeaderView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
  -[SUTableHeaderView sizeToFit](v8, "sizeToFit");
  return v8;
}

- (void)reloadCellContexts
{
  SUStructuredPageGroupedTableDataSource *v2;
  NSArray *v3;
  uint64_t v4;
  int v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  double v42;
  char v43;
  SUStructuredPageGroupedTableDataSource *v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  _BOOL4 v53;
  _BOOL4 v54;
  unsigned int v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v2 = self;
  v73 = *MEMORY[0x24BDAC8D0];
  v69.receiver = self;
  v69.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  -[SUStructuredPageTableDataSource reloadCellContexts](&v69, sel_reloadCellContexts);
  v3 = -[SUVariableCellConfigurationCache caches](v2->super.super._configurationCache, "caches");
  v53 = -[SUStructuredPage artworkShouldFitWidth](v2->super._structuredPage, "artworkShouldFitWidth");
  v56 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v44 = v2;
  if (v2->super._style == 1)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    goto LABEL_40;
  }
  v7 = -[SUItemList copyItems](-[SUStructuredPage itemList](v2->super._structuredPage, "itemList"), "copyItems");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v7;
  v49 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  v4 = 0;
  v5 = 0;
  v6 = 0;
  if (!v49)
    goto LABEL_39;
  v48 = *(_QWORD *)v66;
  v46 = *MEMORY[0x24BEB2708];
  v45 = *MEMORY[0x24BEB2728];
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v66 != v48)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v8);
      v10 = (void *)objc_msgSend(v9, "itemMediaKind");
      v11 = v10;
      if ((v6 & 1) != 0)
      {
        v12 = 1;
        if ((v5 & 1) == 0)
          goto LABEL_10;
      }
      else
      {
        v12 = objc_msgSend(v10, "isEqualToString:", v46);
        if ((v5 & 1) == 0)
        {
LABEL_10:
          v13 = objc_msgSend(v11, "isEqualToString:", v45);
          goto LABEL_13;
        }
      }
      v13 = 1;
LABEL_13:
      v14 = (void *)objc_msgSend(v9, "itemImageCollection");
      v15 = v14;
      v50 = v12;
      v51 = v13;
      v16 = (v4 & 1) != 0 || objc_msgSend((id)objc_msgSend(v14, "itemImages"), "count") != 0;
      v54 = v16;
      if (v53)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v62 != v19)
                objc_enumerationMutation(v3);
              v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "cellContext");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = (void *)objc_msgSend(v21, "imageProvider");
                if (v22)
                {
                  objc_msgSend(v22, "finalSize");
                  v23 = objc_msgSend(v15, "bestImageForSize:");
                  if (v23)
                  {
                    v24 = (void *)v23;
                    objc_msgSend(v21, "artworkWidth");
                    v26 = v25;
                    v27 = (double)objc_msgSend(v24, "width");
                    if (v26 >= v27)
                      v27 = v26;
                    objc_msgSend(v21, "setArtworkWidth:", v27);
                  }
                }
              }
            }
            v18 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
          }
          while (v18);
        }
      }
      v28 = objc_msgSend(v9, "itemType");
      if (SUItemTypeIsMediaType(v28) || v28 == 11 || v28 == 4000 || v28 == 3000)
        objc_msgSend(v56, "addIndex:", v28);
      ++v8;
      v4 = v54;
      v6 = v50;
      v5 = v51;
    }
    while (v8 != v49);
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    v49 = v29;
  }
  while (v29);
LABEL_39:

  v2 = v44;
LABEL_40:
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v30 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v30)
  {
    v31 = v30;
    v32 = v5 & v6;
    v33 = *(_QWORD *)v58;
    v55 = v4;
    v52 = v32;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v58 != v33)
          objc_enumerationMutation(v3);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "cellContext");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v2->super._style == 1)
            v36 = 1;
          else
            v36 = v32;
          if (v36)
            v37 = 0;
          else
            v37 = 2;
          objc_msgSend(v35, "setHiddenMediaIconTypes:", v37);
          objc_msgSend(v35, "setItemsHaveArtwork:", v4);
          if (objc_msgSend(v56, "count") == 1)
          {
            v38 = objc_msgSend(v56, "firstIndex");
            if (v38 == 3000)
            {
              v39 = CFSTR("PlaceholderBookPoster.png");
LABEL_57:
              v40 = (void *)objc_msgSend(v35, "imageProvider");
              objc_msgSend(v40, "setFinalSize:", 58.0, 88.0);
              v41 = (void *)objc_msgSend(v40, "newImageFromImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v39, objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class())));
              objc_msgSend(v35, "setPlaceholderImage:", v41);

              v2 = v44;
              v4 = v55;
              v32 = v52;
            }
            else if (v38 == 1002)
            {
              v39 = CFSTR("PlaceholderVideoPoster.png");
              goto LABEL_57;
            }
          }
          -[SUStructuredPage artworkWidth](v2->super._structuredPage, "artworkWidth");
          v43 = v42 <= 0.00000011920929 || v53;
          if ((v43 & 1) == 0)
            objc_msgSend(v35, "setArtworkWidth:");
          continue;
        }
      }
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v31);
  }

}

- (int64_t)tableViewStyle
{
  objc_super v4;

  if (!-[SUStructuredPage displayStyle](self->super._structuredPage, "displayStyle"))
    return self->super._style != 2;
  v4.receiver = self;
  v4.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  return -[SUStructuredPageTableDataSource tableViewStyle](&v4, sel_tableViewStyle);
}

- (id)_subtitleForSectionIndex:(int64_t)a3
{
  SUItemList *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 IsMediaType;
  uint64_t v15;
  const __CFString *v16;
  id result;
  const __CFString *v18;

  v5 = -[SUStructuredPage itemList](self->super._structuredPage, "itemList");
  v6 = -[SUItemList itemsForSectionAtIndex:](v5, "itemsForSectionAtIndex:", a3);
  v7 = objc_msgSend(v6, "count");
  if (v7 < 1)
    return 0;
  v8 = v7;
  LOBYTE(v9) = 0;
  v10 = 0;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v12 = objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v10, a3);
    v9 = v9 || -[SUTableDataSource canDoubleTapIndexPath:](self, "canDoubleTapIndexPath:", v12);
    v13 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v10), "itemType");
    IsMediaType = SUItemTypeIsMediaType(v13);
    if (v13 == v11)
      v15 = v11;
    else
      v15 = 0;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v15 = v13;
    if (IsMediaType)
      v11 = v15;
    ++v10;
  }
  while (v8 != v10);
  if (!v9)
    return 0;
  if (v11 == 1008)
  {
    v16 = CFSTR("song");
  }
  else
  {
    v16 = CFSTR("ringtone");
    if (v11 != 1011 && v11 != 1005)
    {
      result = -[SUItemList hintTextForKey:](v5, "hintTextForKey:", CFSTR("*"));
      if (!result)
        goto LABEL_26;
      return result;
    }
  }
  result = -[SUItemList hintTextForKey:](v5, "hintTextForKey:", v16);
  if (!result)
  {
    result = -[SUItemList hintTextForKey:](v5, "hintTextForKey:", CFSTR("*"));
    if (!result)
    {
      if (v11 == 1008)
      {
        v18 = CFSTR("DOUBLE_TAP_HINT");
        return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v18, &stru_24DE83F60, 0);
      }
LABEL_26:
      v18 = CFSTR("DOUBLE_TAP_GENERIC_HINT");
      return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v18, &stru_24DE83F60, 0);
    }
  }
  return result;
}

@end
