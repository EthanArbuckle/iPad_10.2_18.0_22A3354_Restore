@implementation PreferenceValuesDataSource

- (void)prepareContentWithBlock:(id)a3
{
  void (**v4)(id, PreferenceValuesDataSource *);
  NSMutableArray *v5;
  NSMutableArray *mutableSections;
  NSArray *v7;
  NSArray *sections;
  NSMutableArray *v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = (void (**)(id, PreferenceValuesDataSource *))a3;
  if (!self->_sections)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableSections = self->_mutableSections;
    self->_mutableSections = v5;

    v4[2](v4, self);
    v7 = (NSArray *)-[NSMutableArray copy](self->_mutableSections, "copy");
    sections = self->_sections;
    self->_sections = v7;

    v9 = self->_mutableSections;
    self->_mutableSections = 0;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_sections;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "commit", (_QWORD)v15);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (void)addSection:(id)a3
{
  -[NSMutableArray addObject:](self->_mutableSections, "addObject:", a3);
}

- (void)addSectionWithTitle:(id)a3 content:(id)a4
{
  void (**v6)(id, MapsDebugTableSection *);
  id v7;
  NSMutableArray *mutableSections;
  NSArray *sections;
  NSArray *v10;
  NSArray *v11;
  MapsDebugTableSection *v12;

  v6 = (void (**)(id, MapsDebugTableSection *))a4;
  v7 = a3;
  v12 = objc_alloc_init(MapsDebugTableSection);
  -[MapsDebugTableSection setTitle:](v12, "setTitle:", v7);

  v6[2](v6, v12);
  -[MapsDebugTableSection commit](v12, "commit");
  mutableSections = self->_mutableSections;
  if (mutableSections)
  {
    -[NSMutableArray addObject:](mutableSections, "addObject:", v12);
  }
  else
  {
    if (self->_sections)
      sections = self->_sections;
    else
      sections = (NSArray *)&__NSArray0__struct;
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](sections, "arrayByAddingObject:", v12));
    v11 = self->_sections;
    self->_sections = v10;

  }
}

- (id)_sections
{
  -[PreferenceValuesDataSource loadContentNowIfNeeded](self, "loadContentNowIfNeeded");
  return self->_sections;
}

- (void)rebuildSections
{
  NSArray *sections;
  id v4;

  sections = self->_sections;
  self->_sections = 0;

  -[PreferenceValuesDataSource loadContentNowIfNeeded](self, "loadContentNowIfNeeded");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource delegate](self, "delegate"));
  objc_msgSend(v4, "dataSourceDidRebuildSections:", self);

}

- (void)loadContentNowIfNeeded
{
  NSMutableArray *v3;
  NSMutableArray *mutableSections;
  NSArray *v5;
  NSArray *sections;
  NSMutableArray *v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!self->_sections)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableSections = self->_mutableSections;
    self->_mutableSections = v3;

    -[PreferenceValuesDataSource prepareContent](self, "prepareContent");
    v5 = (NSArray *)-[NSMutableArray copy](self->_mutableSections, "copy");
    sections = self->_sections;
    self->_sections = v5;

    v7 = self->_mutableSections;
    self->_mutableSections = 0;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_sections;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "commit", (_QWORD)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (id)sectionAtIndex:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource _sections](self, "_sections"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource _sections](self, "_sections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  }
  return v8;
}

- (id)sectionAtIndexPath:(id)a3
{
  return -[PreferenceValuesDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(a3, "section"));
}

- (id)rowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource sectionAtIndexPath:](self, "sectionAtIndexPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rows"));
  v7 = objc_msgSend(v4, "row");

  if (v7 >= objc_msgSend(v6, "count"))
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));

  return v8;
}

- (int64_t)numberOfSections
{
  return -[NSArray count](self->_sections, "count");
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource sectionAtIndex:](self, "sectionAtIndex:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rows"));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (PreferenceValuesDelegate)delegate
{
  return (PreferenceValuesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)sectionOffset
{
  return self->_sectionOffset;
}

- (void)setSectionOffset:(int64_t)a3
{
  self->_sectionOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_mutableSections, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[PreferenceValuesDataSource numberOfRowsInSection:](self, "numberOfRowsInSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource rowAtIndexPath:](self, "rowAtIndexPath:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForTableView:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "theme"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_colorNamed:", CFSTR("BackgroundGroupedTableView")));
  objc_msgSend(v8, "setBackgroundColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
  objc_msgSend(v12, "setBackgroundColor:", v11);

  objc_msgSend(v8, "setOpaque:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionAction"));
  objc_msgSend(v8, "setSelectionStyle:", v13 != 0);

  objc_msgSend(v7, "setCurrentCell:", v8);
  return v8;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource rowAtIndexPath:](self, "rowAtIndexPath:", a5));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentCell"));

  if (v8 == v7)
    objc_msgSend(v9, "setCurrentCell:", 0);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource rowAtIndexPath:](self, "rowAtIndexPath:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionAction"));
  v6 = v5 != 0;

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource rowAtIndexPath:](self, "rowAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionAction"));

  if (v8)
  {
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionAction"));
    v9[2]();

  }
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "footer"));

  return v5;
}

+ (void)registerCellsInCollectionView:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  id v13;

  v3 = a3;
  +[MapsDebugTableRow registerCellsInCollectionView:](MapsDebugTableRow, "registerCellsInCollectionView:", v3);
  v4 = objc_opt_class(MapsDebugCollectionHeaderFooterView);
  v5 = _UICollectionViewListLayoutElementKindSectionHeader;
  v6 = (objc_class *)objc_opt_class(MapsDebugCollectionHeaderFooterView);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v4, v5, v8);

  v9 = objc_opt_class(MapsDebugCollectionHeaderFooterView);
  v10 = _UICollectionViewListLayoutElementKindSectionFooter;
  v11 = (objc_class *)objc_opt_class(MapsDebugCollectionHeaderFooterView);
  v12 = NSStringFromClass(v11);
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v9, v10, v13);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[PreferenceValuesDataSource numberOfRowsInSection:](self, "numberOfRowsInSection:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
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

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", objc_msgSend(v6, "item"), (_BYTE *)objc_msgSend(v6, "section")- (_BYTE *)-[PreferenceValuesDataSource sectionOffset](self, "sectionOffset")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource rowAtIndexPath:](self, "rowAtIndexPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForCollectionView:forIndexPath:", v7, v6));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "theme"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_maps_colorNamed:", CFSTR("BackgroundGroupedTableView")));
  objc_msgSend(v10, "setBackgroundColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  objc_msgSend(v10, "setOpaque:", 0);
  objc_msgSend(v9, "setCurrentCollectionViewCell:", v10);

  return v10;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  _BYTE *v10;
  void *v11;
  id v12;
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = objc_msgSend(v7, "item");
  v10 = objc_msgSend(v7, "section");

  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v9, v10 - (_BYTE *)-[PreferenceValuesDataSource sectionOffset](self, "sectionOffset")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource rowAtIndexPath:](self, "rowAtIndexPath:"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentCollectionViewCell"));

  if (v12 == v8)
    objc_msgSend(v11, "setCurrentCollectionViewCell:", 0);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  _BYTE *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = objc_msgSend(v5, "item");
  v7 = objc_msgSend(v5, "section");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v6, v7 - (_BYTE *)-[PreferenceValuesDataSource sectionOffset](self, "sectionOffset")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource rowAtIndexPath:](self, "rowAtIndexPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionAction"));
  LOBYTE(v5) = v10 != 0;

  return (char)v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", objc_msgSend(v6, "item"), (_BYTE *)objc_msgSend(v6, "section")- (_BYTE *)-[PreferenceValuesDataSource sectionOffset](self, "sectionOffset")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource rowAtIndexPath:](self, "rowAtIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionAction"));

  if (v9)
  {
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionAction"));
    v10[2]();

  }
  objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v6, 1);

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100962C8C;
  v21[3] = &unk_1011DCD50;
  v22 = v8;
  v11 = v9;
  v23 = v11;
  v12 = v10;
  v24 = v12;
  v13 = v8;
  v14 = objc_retainBlock(v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PreferenceValuesDataSource sectionAtIndex:](self, "sectionAtIndex:", (_BYTE *)objc_msgSend(v12, "section")- (_BYTE *)-[PreferenceValuesDataSource sectionOffset](self, "sectionOffset")));
  if (objc_msgSend(v11, "isEqualToString:", _UICollectionViewListLayoutElementKindSectionHeader))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
    v17 = ((uint64_t (*)(_QWORD *, void *, _QWORD))v14[2])(v14, v16, 0);
  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToString:", _UICollectionViewListLayoutElementKindSectionFooter))
    {
      v19 = ((uint64_t (*)(_QWORD *, _QWORD, _QWORD))v14[2])(v14, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
      goto LABEL_7;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "footer"));
    v17 = ((uint64_t (*)(_QWORD *, void *, uint64_t))v14[2])(v14, v16, 1);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

LABEL_7:
  return v18;
}

@end
