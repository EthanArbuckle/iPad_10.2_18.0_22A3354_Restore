@implementation MapsDebugMenuRow

- (id)cellContentConfiguration
{
  return +[UIListContentConfiguration valueCellConfiguration](UIListContentConfiguration, "valueCellConfiguration");
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsDebugMenuRow;
  -[MapsDebugTableRow configureCell:](&v16, "configureCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow configureBlock](self, "configureBlock"));

  if (v5)
  {
    objc_initWeak(&location, self);
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100713C08;
    v13 = &unk_1011C16B8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "setConfigurationUpdateHandler:", &v10);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIMenu selectedElements](self->_menu, "selectedElements"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "detailTextLabel"));
    objc_msgSend(v9, "setText:", v8);

  }
  -[MapsDebugMenuRow _setAccessoriesForCell:](self, "_setAccessoriesForCell:", v4, v10, v11, v12, v13);

}

- (void)configureCollectionViewCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MapsDebugMenuRow;
  -[MapsDebugTableRow configureCollectionViewCell:](&v17, "configureCollectionViewCell:", v4);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow configureCollectionViewCellBlock](self, "configureCollectionViewCellBlock"));

  if (v6)
  {
    objc_initWeak(&location, self);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100713EC8;
    v14 = &unk_1011C16E0;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v5, "setConfigurationUpdateHandler:", &v11);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIMenu selectedElements](self->_menu, "selectedElements"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailTextLabel"));
    objc_msgSend(v10, "setText:", v9);

  }
  -[MapsDebugMenuRow _setAccessoriesForCell:](self, "_setAccessoriesForCell:", v5, v11, v12, v13, v14);

}

- (void)setMenu:(id)a3
{
  UIMenu *v5;
  void *v6;
  void *v7;
  UIMenu *v8;

  v5 = (UIMenu *)a3;
  if (self->_menu != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_menu, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCollectionViewCell](self, "currentCollectionViewCell"));
    if (v6)
    {
      -[MapsDebugMenuRow _setAccessoriesForCell:](self, "_setAccessoriesForCell:", v6);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
      -[MapsDebugMenuRow _setAccessoriesForCell:](self, "_setAccessoriesForCell:", v7);

    }
    v5 = v8;
  }

}

- (void)_setAccessoriesForCell:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  id v19;

  v4 = a3;
  v5 = objc_opt_class(UITableViewCell);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis.circle")));
    objc_msgSend(v8, "setImage:", v9);

    objc_msgSend(v7, "setConfiguration:", v8);
    objc_msgSend(v7, "setMenu:", self->_menu);
    objc_msgSend(v7, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v7, "sizeToFit");
    objc_msgSend(v6, "setAccessoryView:", v7);

  }
  else
  {
    v10 = objc_opt_class(MapsDebugCollectionViewCell);
    if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
    {
      v11 = v4;
      objc_initWeak(&location, self);
      v12 = objc_msgSend(objc_alloc((Class)UICellAccessoryPopUpMenu), "initWithMenu:", self->_menu);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100714330;
      v15[3] = &unk_1011C1708;
      objc_copyWeak(&v17, &location);
      v13 = v11;
      v16 = v13;
      objc_msgSend(v12, "setSelectedElementDidChangeHandler:", v15);
      v19 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      objc_msgSend(v13, "setAccessories:", v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

    }
  }

}

- (UIMenu)menu
{
  return self->_menu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
}

@end
