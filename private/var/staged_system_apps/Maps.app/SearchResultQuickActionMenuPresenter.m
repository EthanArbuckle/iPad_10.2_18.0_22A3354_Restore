@implementation SearchResultQuickActionMenuPresenter

- (SearchResultQuickActionMenuPresenter)initWithView:(id)a3
{
  return -[SearchResultQuickActionMenuPresenter initWithTableView:](self, "initWithTableView:", 0);
}

- (SearchResultQuickActionMenuPresenter)initWithTableView:(id)a3
{
  id v5;
  SearchResultQuickActionMenuPresenter *v6;
  SearchResultQuickActionMenuPresenter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchResultQuickActionMenuPresenter;
  v6 = -[QuickActionMenuPresenter initWithView:](&v9, "initWithView:", v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tableView, a3);

  return v7;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6;
  UITableView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;

  if (sub_1002A8AA0(self->_tableView) == 5)
  {
    v6 = 0;
  }
  else
  {
    v7 = self->_tableView;
    -[QuickActionMenuPresenter location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForRowAtPoint:](v7, "indexPathForRowAtPoint:"));
    if (!v8)
      goto LABEL_9;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](v7, "cellForRowAtIndexPath:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
    v11 = objc_msgSend(v10, "userInterfaceStyle");

    v12 = v11 == (id)2
        ? objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor")): objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    objc_msgSend(v14, "setBackgroundColor:", v13);

    if (v9)
    {
      v6 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v9);

    }
    else
    {
LABEL_9:
      v6 = 0;
    }

  }
  return v6;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  void *v6;
  void *v7;

  if (sub_1002A8AA0(self->_tableView) == 5)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultQuickActionMenuPresenter targetPreviewBackgroundWithColor:](self, "targetPreviewBackgroundWithColor:", v7));

  }
  return v6;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (sub_1002A8AA0(self->_tableView) != 5)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100A1BB94;
    v11[3] = &unk_1011AD260;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v10, "addCompletion:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (id)targetPreviewBackgroundWithColor:(id)a3
{
  id v4;
  UITableView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = self->_tableView;
  -[QuickActionMenuPresenter location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForRowAtPoint:](v5, "indexPathForRowAtPoint:"));
  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](v5, "cellForRowAtIndexPath:", v6)),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView")),
        objc_msgSend(v8, "setBackgroundColor:", v4),
        v8,
        v7))
  {
    v9 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parameters"));
    objc_msgSend(v10, "setBackgroundColor:", v4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  VKLabelMarker *labelMarker;
  SearchResult *searchResult;
  MKMapItem *resolvedMapItem;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SearchResultQuickActionMenuPresenter setTableViewCell:](self, "setTableViewCell:", 0);
  -[SearchResultQuickActionMenuPresenter setIndexPath:](self, "setIndexPath:", 0);
  labelMarker = self->super._labelMarker;
  self->super._labelMarker = 0;

  searchResult = self->super._searchResult;
  self->super._searchResult = 0;

  resolvedMapItem = self->super._resolvedMapItem;
  self->super._resolvedMapItem = 0;

  if (objc_msgSend(v7, "isDescendantOfView:", self->_tableView))
  {
    -[UITableView convertPoint:fromView:](self->_tableView, "convertPoint:fromView:", v7, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v11));
      v13 = v12;
      if (v12 && (objc_msgSend(v12, "isEditing") & 1) == 0)
      {
        -[SearchResultQuickActionMenuPresenter setTableViewCell:](self, "setTableViewCell:", v13);
        -[SearchResultQuickActionMenuPresenter setIndexPath:](self, "setIndexPath:", v11);
        if (objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___SearchResultQuickActionMenuCell))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "personalizedItemForQuickActionMenu"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter delegate](self, "delegate"));
          -[QuickActionMenuPresenter setUiTarget:](self, "setUiTarget:", objc_msgSend(v16, "uiTargetForQuickActionMenu"));

          if (v15)
          {
            -[QuickActionMenuPresenter setPlace:](self, "setPlace:", v15);
            v17 = objc_opt_class(MKTableViewCell);
            v14 = 1;
            if ((objc_opt_isKindOfClass(v13, v17) & 1) != 0)
              objc_msgSend(v13, "set_mapkit_forceSeparatorFrameToCGRectZero:", 1);
          }
          else
          {
            v14 = 0;
          }
        }
        else
        {
          v14 = 0;
          v15 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (UITableViewCell)tableViewCell
{
  return (UITableViewCell *)objc_loadWeakRetained((id *)&self->_tableViewCell);
}

- (void)setTableViewCell:(id)a3
{
  objc_storeWeak((id *)&self->_tableViewCell, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_tableViewCell);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
