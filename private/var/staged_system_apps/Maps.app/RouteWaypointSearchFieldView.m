@implementation RouteWaypointSearchFieldView

- (RouteWaypointSearchFieldView)initWithDelegate:(id)a3
{
  id v4;
  double y;
  double width;
  double height;
  RouteWaypointSearchFieldView *v8;
  double v9;
  RouteWaypointSearchFieldView *v10;
  double v11;
  SearchFieldItem *v12;
  SearchFieldItem *searchFieldItem;
  UISearchBar *v14;
  UISearchBar *searchBar;
  void *v16;
  id v17;
  uint64_t v18;
  UISearchTextField *searchField;
  id v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RouteWaypointSearchFieldView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[RouteWaypointSearchFieldView initWithFrame:](&v28, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v8;
  if (v8)
  {
    LODWORD(v9) = 1148846080;
    -[RouteWaypointSearchFieldView setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    LODWORD(v11) = 1148846080;
    -[RouteWaypointSearchFieldView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 1, v11);
    objc_storeWeak((id *)&v10->_delegate, v4);
    v12 = objc_alloc_init(SearchFieldItem);
    searchFieldItem = v10->_searchFieldItem;
    v10->_searchFieldItem = v12;

    v14 = (UISearchBar *)objc_msgSend(objc_alloc((Class)UISearchBar), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    searchBar = v10->_searchBar;
    v10->_searchBar = v14;

    -[UISearchBar setTranslatesAutoresizingMaskIntoConstraints:](v10->_searchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UISearchBar setDelegate:](v10->_searchBar, "setDelegate:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UISearchBar setBackgroundColor:](v10->_searchBar, "setBackgroundColor:", v16);

    v17 = objc_alloc_init((Class)UIImage);
    -[UISearchBar setBackgroundImage:](v10->_searchBar, "setBackgroundImage:", v17);

    -[UISearchBar setTranslucent:](v10->_searchBar, "setTranslucent:", 1);
    -[UISearchBar setOpaque:](v10->_searchBar, "setOpaque:", 0);
    -[UISearchBar _setOverrideContentInsets:forRectEdges:](v10->_searchBar, "_setOverrideContentInsets:forRectEdges:", 15, 0.0, 16.0, 0.0, 16.0);
    -[UISearchBar _setBackdropStyle:](v10->_searchBar, "_setBackdropStyle:", 2005);
    -[UISearchBar setAccessibilityIdentifier:](v10->_searchBar, "setAccessibilityIdentifier:", CFSTR("WaypointSearchBar"));
    -[UISearchBar setAutocorrectionType:](v10->_searchBar, "setAutocorrectionType:", 1);
    -[UISearchBar setSpellCheckingType:](v10->_searchBar, "setSpellCheckingType:", 1);
    -[RouteWaypointSearchFieldView addSubview:](v10, "addSubview:", v10->_searchBar);
    v18 = objc_claimAutoreleasedReturnValue(-[UISearchBar searchTextField](v10->_searchBar, "searchTextField"));
    searchField = v10->_searchField;
    v10->_searchField = (UISearchTextField *)v18;

    -[UISearchTextField setAccessibilityIdentifier:](v10->_searchField, "setAccessibilityIdentifier:", CFSTR("WaypointSearchField"));
    v20 = objc_alloc_init((Class)NSMutableArray);
    LODWORD(v21) = 1148846080;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar _maps_constraintsEqualToEdgesOfView:priority:](v10->_searchBar, "_maps_constraintsEqualToEdgesOfView:priority:", v10, v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allConstraints"));
    objc_msgSend(v20, "addObjectsFromArray:", v23);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    LODWORD(v23) = objc_msgSend(v24, "isUsingOfflineMaps");

    if ((_DWORD)v23)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Waypoint Editing] Search Offline Maps"), CFSTR("localized string not found"), 0));
      -[UISearchBar setPlaceholder:](v10->_searchBar, "setPlaceholder:", v26);

    }
  }

  return v10;
}

- (void)setSearchFieldItem:(id)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_storeStrong((id *)&self->_searchFieldItem, a3);
  v5 = v21;
  if (!v21)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchResult"));
  if ((objc_msgSend(v6, "isDynamicCurrentLocation") & 1) == 0)
  {

    goto LABEL_6;
  }
  v7 = -[RouteWaypointSearchFieldView _shouldHideDynamicCurrentLocation](self, "_shouldHideDynamicCurrentLocation");

  v5 = v21;
  if ((v7 & 1) == 0)
  {
LABEL_6:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "waypointName"));
    v5 = v21;
    goto LABEL_7;
  }
LABEL_4:
  v8 = 0;
LABEL_7:
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routePlanningWaypointRequest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "waypointRequest"));

  v11 = objc_opt_class(_TtC4Maps27FindMyHandleWaypointRequest);
  LOBYTE(v9) = objc_opt_isKindOfClass(v10, v11);

  if ((v9 & 1) != 0 && v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "routePlanningWaypointRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "waypointRequest"));

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "waypointNameWhenEditing"));
    v8 = (void *)v14;
  }
  -[UISearchBar setText:](self->_searchBar, "setText:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem evStopWaypoint](self->_searchFieldItem, "evStopWaypoint"));
  v16 = objc_msgSend(v15, "isServerProvidedWaypoint");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = v17;
  if (v16)
    v19 = CFSTR("[Waypoint Editing] Search for charging stations");
  else
    v19 = CFSTR("[Waypoint Editing] Search Maps");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, CFSTR("localized string not found"), 0));
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v20);

}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RouteWaypointSearchFieldView;
  -[MapsThemeView updateTheme](&v7, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBarPlaceHolderColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchTextField _placeholderLabel](self->_searchField, "_placeholderLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView theme](self, "theme"));
  -[UISearchTextField setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", objc_msgSend(v6, "textFieldKeyboardAppearance"));

}

- (BOOL)hasInput
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar text](self->_searchBar, "text"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)isEditingAnySearchField
{
  return 1;
}

- (void)beginEditingNextSearchField
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UISearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UISearchBar searchTextField](self->_searchBar, "searchTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "beginningOfDocument"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endOfDocument"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textRangeFromPosition:toPosition:", v3, v4));

  objc_msgSend(v6, "setSelectedTextRange:", v5);
}

- (void)endEditingFields
{
  -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
}

- (BOOL)_shouldHideDynamicCurrentLocation
{
  void *v2;
  unsigned __int8 v3;
  char v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v3 = objc_msgSend(v2, "isLocationServicesApproved");
  v4 = v3 & objc_msgSend(v2, "isAuthorizedForPreciseLocation") ^ 1;

  return v4;
}

- (id)itemsForRouteRequest
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView searchFieldItem](self, "searchFieldItem"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (BOOL)containsCurrentLocationItem
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView searchFieldItem](self, "searchFieldItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchResult"));
  v4 = objc_msgSend(v3, "isDynamicCurrentLocation");

  return v4;
}

- (BOOL)containsWaypointForItem:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && objc_msgSend(v4, "isDynamicCurrentLocation")
    && -[RouteWaypointSearchFieldView _shouldHideDynamicCurrentLocation](self, "_shouldHideDynamicCurrentLocation"))
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:expandRecentsItem:preserveContact:](SearchFieldItem, "searchFieldItemWithObject:expandRecentsItem:preserveContact:", v4, 1, 1));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView searchFieldItem](self, "searchFieldItem"));
      v6 = objc_msgSend(v7, "isEquivalentAsWaypointToSearchFieldItem:", v8);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)updateSearchFieldsFromIndex:(unint64_t)a3 withItem:(id)a4
{
  SearchFieldItem *v5;
  SearchFieldItem *searchFieldItem;
  id v7;

  v5 = (SearchFieldItem *)a4;
  -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
  searchFieldItem = self->_searchFieldItem;
  self->_searchFieldItem = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView delegate](self, "delegate"));
  objc_msgSend(v7, "routeSearchFieldsDidUpdateItemsForRouteRequest:", self);

}

- (void)shouldReplaceTextWithCompletion:(id)a3
{
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = objc_opt_class(MKSearchCompletion);
  isKindOfClass = objc_opt_isKindOfClass(v12, v4);
  v6 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v12;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryAcceleratorCompletionString"));
    if (objc_msgSend(v8, "length"))
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryAcceleratorCompletionString"));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v10 = (void *)v9;

    -[UISearchTextField setText:](self->_searchField, "setText:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView delegate](self, "delegate"));
    objc_msgSend(v11, "routeSearch:didUpdateInputText:atIndex:", self, v10, 0x7FFFFFFFFFFFFFFFLL);

    v6 = v12;
  }

}

- (void)clear
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView searchFieldItem](self, "searchFieldItem"));
  objc_msgSend(v3, "clear");

  -[UISearchBar setText:](self->_searchBar, "setText:", 0);
  -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "routeSearchFieldsDidBeginEditing:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView delegate](self, "delegate"));
    objc_msgSend(v7, "routeSearchFieldsDidBeginEditing:", self);

  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView delegate](self, "delegate"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  if (v8)
    v9 = v8;
  else
    v9 = &stru_1011EB268;
  objc_msgSend(v10, "routeSearch:didUpdateInputText:atIndex:", self, v9, 0x7FFFFFFFFFFFFFFFLL);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView delegate](self, "delegate"));
  objc_msgSend(v6, "routeSearch:didUpdateInputText:atIndex:", self, v5, 0x7FFFFFFFFFFFFFFFLL);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView previousSearchFieldItem](self, "previousSearchFieldItem"));
  objc_msgSend(v8, "routeSearch:didSearchForItem:previousSearchItem:", self, v6, v7);

}

- (BOOL)searchBarShouldClear:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "routeSearchFields:didClearInputTextForWaypointAtIndex:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView delegate](self, "delegate"));
    objc_msgSend(v6, "routeSearchFields:didClearInputTextForWaypointAtIndex:", self, 0x7FFFFFFFFFFFFFFFLL);

  }
  return 1;
}

- (SearchFieldItem)searchFieldItem
{
  return self->_searchFieldItem;
}

- (SearchFieldItem)previousSearchFieldItem
{
  return self->_previousSearchFieldItem;
}

- (void)setPreviousSearchFieldItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousSearchFieldItem, a3);
}

- (RouteWaypointSearchFieldsDelegate)delegate
{
  return (RouteWaypointSearchFieldsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previousSearchFieldItem, 0);
  objc_storeStrong((id *)&self->_searchFieldItem, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end
