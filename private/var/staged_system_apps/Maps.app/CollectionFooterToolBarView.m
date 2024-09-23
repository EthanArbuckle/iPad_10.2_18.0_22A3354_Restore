@implementation CollectionFooterToolBarView

- (void)_updateContent
{
  id v3;

  switch(-[FooterToolBarView state](self, "state"))
  {
    case 0uLL:
      v3 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
      objc_msgSend(v3, "setItems:", &__NSArray0__struct);

      break;
    case 1uLL:
      -[CollectionFooterToolBarView loadContentActions](self, "loadContentActions");
      break;
    case 2uLL:
      -[CollectionFooterToolBarView loadEditActions](self, "loadEditActions");
      break;
    case 3uLL:
      -[CollectionFooterToolBarView loadEditAllActions](self, "loadEditAllActions");
      break;
    case 4uLL:
      -[CollectionFooterToolBarView loadListActions](self, "loadListActions");
      break;
    case 5uLL:
      -[CollectionFooterToolBarView loadListEditActions](self, "loadListEditActions");
      break;
    case 6uLL:
      -[CollectionFooterToolBarView loadListEditAllActions](self, "loadListEditAllActions");
      break;
    default:
      return;
  }
}

- (void)loadListActions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, self, "newCollectionAction:");
  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 2, self, "editListAction:");
  v8[0] = v5;
  v8[1] = v4;
  v8[2] = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
  objc_msgSend(v7, "setItems:", v6);

}

- (void)loadListEditActions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancelListAction:");
  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Collection] Delete"), CFSTR("localized string not found"), 0));
  v8 = objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, "deleteListAction:");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v8, "setTintColor:", v9);

  v12[0] = v3;
  v12[1] = v4;
  v12[2] = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
  objc_msgSend(v11, "setItems:", v10);

}

- (void)loadListEditAllActions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancelListAction:");
  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Collection] Delete"), CFSTR("localized string not found"), 0));
  v8 = objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, "deleteListAction:");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v8, "setTintColor:", v9);

  objc_msgSend(v8, "setEnabled:", 0);
  v12[0] = v3;
  v12[1] = v4;
  v12[2] = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
  objc_msgSend(v11, "setItems:", v10);

}

- (void)loadContentActions
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[4];

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, self, "addAction:");
  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 9, self, "shareAction:");
  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 2, self, "editAction:");
  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (!-[CollectionFooterToolBarView hideEditButton](self, "hideEditButton"))
    objc_msgSend(v7, "addObject:", v5);
  if (!-[FooterToolBarView canDeleteOnly](self, "canDeleteOnly"))
  {
    if (GEOConfigGetBOOL(MapsConfig_CollectionAllowsURLSharing, off_1014B3378))
    {
      v13[0] = v6;
      v13[1] = v4;
      v13[2] = v6;
      v13[3] = v3;
      v8 = v13;
      v9 = 4;
    }
    else
    {
      v12[0] = v6;
      v12[1] = v3;
      v8 = v12;
      v9 = 2;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, v9));
    objc_msgSend(v7, "addObjectsFromArray:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
  objc_msgSend(v11, "setItems:", v7);

}

- (BOOL)_shouldUseGlyphForStrings:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  double v13;
  double v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  NSAttributedStringKey v22;
  void *v23;

  v4 = a3;
  v5 = (double)((unint64_t)objc_msgSend(v4, "count") + 1) * 20.0;
  v22 = NSFontAttributeName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  v23 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "sizeWithAttributes:", v7, (_QWORD)v17);
        v5 = v5 + v13;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  -[CollectionFooterToolBarView frame](self, "frame");
  v15 = v14 - v5 < 0.0;

  return v15;
}

- (void)loadEditAllActions
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];

  -[FooterToolBarView setCanAdaptToWidth:](self, "setCanAdaptToWidth:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Footer] Cancel"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Collection] Select All"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Collection] Delete"), CFSTR("localized string not found"), 0));

  v29[0] = v4;
  v29[1] = v6;
  v29[2] = v8;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
  v24 = -[CollectionFooterToolBarView _shouldUseGlyphForStrings:](self, "_shouldUseGlyphForStrings:");
  v27 = (void *)v4;
  v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v4, 0, self, "cancelAction:");
  v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v25 = (void *)v6;
  v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v6, 0, self, "selectAllAction:");
  v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v8, 0, self, "deleteAction:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v12, "setTintColor:", v13);

  objc_msgSend(v12, "setEnabled:", 0);
  v14 = v9;
  v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 16, self, "deleteAction:");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v15, "setTintColor:", v16);

  objc_msgSend(v15, "setEnabled:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v9, v10, 0));
  if (!-[CollectionFooterToolBarView useMacConfig](self, "useMacConfig"))
  {
    if (-[FooterToolBarView canBeSaved](self, "canBeSaved"))
    {
      objc_msgSend(v17, "addObject:", v11);
    }
    else
    {
      if (v24)
        v18 = v15;
      else
        v18 = v12;
      v28[0] = v11;
      v28[1] = v10;
      v28[2] = v18;
      v19 = v11;
      v20 = v14;
      v21 = v18;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 3));

      v14 = v20;
      v11 = v19;
      objc_msgSend(v17, "addObjectsFromArray:", v22);

    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
  objc_msgSend(v23, "setItems:", v17);

}

- (void)loadEditActions
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[3];

  -[FooterToolBarView setCanAdaptToWidth:](self, "setCanAdaptToWidth:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Footer] Cancel"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Collection] Add To"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Collection] Delete"), CFSTR("localized string not found"), 0));

  v31[0] = v4;
  v31[1] = v6;
  v31[2] = v8;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 3));
  v25 = -[CollectionFooterToolBarView _shouldUseGlyphForStrings:](self, "_shouldUseGlyphForStrings:");
  v28 = (void *)v4;
  v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v4, 0, self, "cancelAction:");
  v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v26 = (void *)v6;
  v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v6, 0, self, "addToAction:");
  v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v8, 0, self, "deleteAction:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v12, "setTintColor:", v13);

  v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 16, self, "deleteAction:");
  v15 = v11;
  v16 = v9;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v14, "setTintColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v9, v10, 0));
  if (!-[CollectionFooterToolBarView useMacConfig](self, "useMacConfig"))
  {
    if (-[FooterToolBarView canBeSaved](self, "canBeSaved"))
    {
      objc_msgSend(v18, "addObject:", v15);
    }
    else
    {
      if (v25)
        v19 = v14;
      else
        v19 = v12;
      v20 = v19;
      if (-[FooterToolBarView canMove](self, "canMove"))
      {
        v30[0] = v15;
        v30[1] = v10;
        v30[2] = v20;
        v21 = (id *)v30;
        v22 = 3;
      }
      else
      {
        v29 = v20;
        v21 = &v29;
        v22 = 1;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, v22));

      objc_msgSend(v18, "addObjectsFromArray:", v23);
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FooterToolBarView toolBar](self, "toolBar"));
  objc_msgSend(v24, "setItems:", v18);

}

- (void)editListAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 3);

}

- (void)cancelListAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 4);

}

- (void)deleteListAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 5);

}

- (void)editAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 0);

}

- (void)cancelAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 1);

}

- (void)newCollectionAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 8);

}

- (void)addToAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 7);

}

- (void)selectAllAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 6);

}

- (void)deleteAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 2);

}

- (void)addAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 9);

}

- (void)shareAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 10);

}

- (void)selectAction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FooterToolBarView delegate](self, "delegate", a3));
  objc_msgSend(v4, "view:requestsCollectionFooterAction:", self, 0);

}

- (BOOL)useMacConfig
{
  return self->_useMacConfig;
}

- (void)setUseMacConfig:(BOOL)a3
{
  self->_useMacConfig = a3;
}

- (BOOL)hideEditButton
{
  return self->_hideEditButton;
}

- (void)setHideEditButton:(BOOL)a3
{
  self->_hideEditButton = a3;
}

@end
