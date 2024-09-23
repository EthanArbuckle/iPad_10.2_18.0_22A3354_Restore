@implementation ICSortMenu

- (ICSortMenu)initWithTitle:(id)a3 sortType:(id)a4 selectedSortTypeHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICSortMenu *v12;
  ICSortMenu *v13;
  id v14;
  id selectedSortTypeHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICSortMenu;
  v12 = -[ICSortMenu init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_sortType, a4);
    v14 = objc_retainBlock(v11);
    selectedSortTypeHandler = v13->_selectedSortTypeHandler;
    v13->_selectedSortTypeHandler = v14;

  }
  return v13;
}

- (id)createMenu
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu actionWithOrder:](self, "actionWithOrder:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu actionWithOrder:](self, "actionWithOrder:", 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu actionWithOrder:](self, "actionWithOrder:", 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu actionWithOrder:](self, "actionWithOrder:", 3));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu actionWithDirection:](self, "actionWithDirection:", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu actionWithDirection:](self, "actionWithDirection:", 1));
  v19[0] = v17;
  v19[1] = v16;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1005704B8, 0, 0, 1, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.arrow.down")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu title](self, "title"));
  v18[0] = v3;
  v18[1] = v4;
  v18[2] = v5;
  v18[3] = v6;
  v18[4] = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v10, v9, CFSTR("com.apple.mobilenotes.sortMenuIdentifier"), 0, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu sortType](self, "sortType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolderCustomNoteSortType actionItemTitleForOrder:](ICFolderCustomNoteSortType, "actionItemTitleForOrder:", objc_msgSend(v13, "order")));
  objc_msgSend(v12, "setSubtitle:", v14);

  return v12;
}

- (id)actionWithOrder:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  UIAccessibilityTraits *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  ICSortMenu *v19;
  id v20;
  int64_t v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu sortType](self, "sortType"));
  v6 = objc_msgSend(v5, "order");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolderCustomNoteSortType actionItemTitleForOrder:](ICFolderCustomNoteSortType, "actionItemTitleForOrder:", a3));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_100078924;
  v17 = &unk_100551F50;
  v20 = v6;
  v21 = a3;
  v18 = v5;
  v19 = self;
  v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, 0, 0, &v14));
  v10 = objc_msgSend(v8, "order", v14, v15, v16, v17);
  v11 = v10 == (id)a3;
  if (v10 == (id)a3)
    v12 = &UIAccessibilityTraitSelected;
  else
    v12 = &UIAccessibilityTraitNone;
  objc_msgSend(v9, "setState:", v11);
  objc_msgSend(v9, "setAccessibilityTraits:", *v12);

  return v9;
}

- (id)actionWithDirection:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  UIAccessibilityTraits *v11;
  _QWORD v13[4];
  id v14;
  ICSortMenu *v15;
  int64_t v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSortMenu sortType](self, "sortType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolderCustomNoteSortType stringNameForDirection:order:](ICFolderCustomNoteSortType, "stringNameForDirection:order:", a3, objc_msgSend(v5, "order")));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100078AAC;
  v13[3] = &unk_100551F78;
  v15 = self;
  v16 = a3;
  v14 = v5;
  v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v13));
  v9 = objc_msgSend(v7, "direction");
  v10 = v9 == (id)a3;
  if (v9 == (id)a3)
    v11 = &UIAccessibilityTraitSelected;
  else
    v11 = &UIAccessibilityTraitNone;
  objc_msgSend(v8, "setState:", v10);
  objc_msgSend(v8, "setAccessibilityTraits:", *v11);

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ICFolderCustomNoteSortType)sortType
{
  return self->_sortType;
}

- (void)setSortType:(id)a3
{
  objc_storeStrong((id *)&self->_sortType, a3);
}

- (id)selectedSortTypeHandler
{
  return self->_selectedSortTypeHandler;
}

- (void)setSelectedSortTypeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedSortTypeHandler, 0);
  objc_storeStrong((id *)&self->_sortType, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
