@implementation CuratedCollectionActionManager

- (id)createRowActionsWithStyle:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  MKPlaceCardActionItem *v22;
  MKPlaceCardActionItem *saveItem;
  id v24;
  void *v25;
  void *v26;
  id v27;

  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionManager _glyphColor](self, "_glyphColor"));
  if (self->_hasHomePage)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 != (id)5)
    {
      v8 = objc_alloc((Class)MKPlaceCardActionItem);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Open_Website_Collection_Action_Row"), CFSTR("localized string not found"), 0));
      v11 = objc_msgSend(v8, "initWithType:displayString:glyph:enabled:", 13, v10, CFSTR("safari.fill"), 1);

      objc_msgSend(v4, "addObject:", v11);
    }
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Remove_Saved_Curated_Collection_from_Library_Action_Row"), CFSTR("localized string not found"), 0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    v16 = CFSTR("Save_Curated_Collection__from_Library__Action_Row");
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = v19;
    if (v18 == (id)5)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Remove_Saved_Curated_Collection_Mac_Action_Row"), CFSTR("localized string not found"), 0));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      v16 = CFSTR("Save_Curated_Collection_Mac_Action_Row");
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Remove_Saved_Curated_Collection_Action_Row"), CFSTR("localized string not found"), 0));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      v16 = CFSTR("Save_Curated_Collection_Action_Row");
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), 0));

  v22 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionManager _savedItemWithSaveTitle:unsaveTitle:](self, "_savedItemWithSaveTitle:unsaveTitle:", v21, v13));
  saveItem = self->_saveItem;
  self->_saveItem = v22;

  objc_msgSend(v4, "addObject:", self->_saveItem);
  v24 = objc_alloc((Class)MKPlaceCardActionItem);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Share_Collection_Action_Row"), CFSTR("localized string not found"), 0));
  v27 = objc_msgSend(v24, "initWithType:displayString:glyph:enabled:", 16, v26, CFSTR("square.and.arrow.up"), 1);

  if (v5)
    objc_msgSend(v27, "setGlyphColor:", v5);
  objc_msgSend(v4, "addObject:", v27);

  return v4;
}

- (id)_savedItemWithSaveTitle:(id)a3 unsaveTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  unsigned int v10;
  __CFString *v11;
  __CFString *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionManager _glyphColor](self, "_glyphColor"));
  v9 = objc_msgSend(objc_alloc((Class)MKPlaceCardActionItem), "initWithType:displayString:glyph:enabled:", 6, v6, CFSTR("checkmark"), 1);

  if (v8)
    objc_msgSend(v9, "setGlyphColor:", v8);
  v10 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v11 = CFSTR("square.and.arrow.down.fill");
  if (v10)
    v11 = CFSTR("plus");
  v12 = v11;
  v13 = objc_msgSend(objc_alloc((Class)MKPlaceCardActionItem), "initWithType:displayString:glyph:enabled:", 5, v7, v12, 1);

  objc_msgSend(v13, "setSelectedItem:", v9);
  objc_msgSend(v13, "setSelected:", -[CuratedCollectionActionManager collectionIsSaved](self, "collectionIsSaved"));
  if (v8)
    objc_msgSend(v13, "setGlyphColor:", v8);

  return v13;
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = (uint64_t)objc_msgSend(a3, "type");
  if (v7 > 12)
  {
    if (v7 == 13)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionManager delegate](self, "delegate"));
      objc_msgSend(v8, "didSelectOpenHomePage");
      goto LABEL_10;
    }
    if (v7 == 16)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("view")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionManager delegate](self, "delegate"));
      objc_msgSend(v9, "didSelectShareFromView:", v8);

      goto LABEL_10;
    }
  }
  else
  {
    if (v7 == 5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionManager delegate](self, "delegate"));
      objc_msgSend(v8, "didSelectSaveCollection");
      goto LABEL_10;
    }
    if (v7 == 6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActionManager delegate](self, "delegate"));
      objc_msgSend(v8, "didSelectRemoveFromSavedCollection");
LABEL_10:

    }
  }

}

- (void)setCollectionIsSaved:(BOOL)a3
{
  self->_collectionIsSaved = a3;
  -[MKPlaceCardActionItem setSelected:](self->_saveItem, "setSelected:");
  -[MKPlaceCardActionItem setEnabled:](self->_saveItem, "setEnabled:", 1);
}

- (id)_glyphColor
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)5)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightTextColor](UIColor, "lightTextColor"));
  else
    v4 = 0;
  return v4;
}

- (CuratedCollectionActionDelegate)delegate
{
  return (CuratedCollectionActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)collectionIsSaved
{
  return self->_collectionIsSaved;
}

- (BOOL)hasHomePage
{
  return self->_hasHomePage;
}

- (void)setHasHomePage:(BOOL)a3
{
  self->_hasHomePage = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_saveItem, 0);
}

@end
