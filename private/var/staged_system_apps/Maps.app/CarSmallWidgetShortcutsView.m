@implementation CarSmallWidgetShortcutsView

- (CarSmallWidgetShortcutsView)initWithShortcutsProvider:(id)a3
{
  id v5;
  CarSmallWidgetShortcutsView *v6;
  CarSmallWidgetShortcutsView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarSmallWidgetShortcutsView;
  v6 = -[CarSmallWidgetCollectionView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_shortcutsProvider, a3);
    -[CarSmallWidgetShortcutsView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("CarSmallWidgetShortcutsView"));
  }

  return v7;
}

- (id)data
{
  void *v3;
  void *v4;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortcutsForCarplay"));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsProvider shortcuts](self->_shortcutsProvider, "shortcuts"));
  }
  return v4;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  SuggestionShortcutsRowCellModel *v9;
  void *v10;
  id v11;
  SuggestionShortcutsRowCellModel *v12;

  v4 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortcutsForCarplay"));
    v7 = objc_msgSend(v4, "row");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
    v9 = -[SuggestionShortcutsRowCellModel initWithMapsFavoriteItem:]([SuggestionShortcutsRowCellModel alloc], "initWithMapsFavoriteItem:", v8);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsProvider shortcuts](self->_shortcutsProvider, "shortcuts"));
    v11 = objc_msgSend(v4, "row");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v11));
    v9 = -[SuggestionShortcutsRowCellModel initWithMapsSuggestionsEntry:]([SuggestionShortcutsRowCellModel alloc], "initWithMapsSuggestionsEntry:", v8);
  }
  v12 = v9;

  return v12;
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  CarSmallWidgetShortcutsView *v10;
  CarSmallWidgetShortcutsView *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  id v24;

  v4 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortcutsForCarplay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutsProvider shortcuts](self->_shortcutsProvider, "shortcuts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
  }

  v8 = sub_10043379C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_13;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetShortcutsView performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_11;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_11:

LABEL_13:
    *(_DWORD *)buf = 138543618;
    v22 = v17;
    v23 = 2112;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] didSelectItemAtIndexPath: %@", buf, 0x16u);

  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100C294A8;
  v19[3] = &unk_1011AC8B0;
  v19[4] = self;
  v20 = v7;
  v18 = v7;
  +[MapsCarPlayServicesShim openMapsCarPlayApplicationWithCompletion:](MapsCarPlayServicesShim, "openMapsCarPlayApplicationWithCompletion:", v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsProvider, 0);
}

@end
