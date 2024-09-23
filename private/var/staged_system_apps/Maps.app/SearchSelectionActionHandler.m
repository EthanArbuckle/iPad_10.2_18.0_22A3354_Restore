@implementation SearchSelectionActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  v6 = objc_opt_class(SearchSelectionAction);
  if ((objc_opt_isKindOfClass(v14, v6) & 1) != 0)
  {
    v7 = v14;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSession currentSearchSession](SearchSession, "currentSearchSession"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentResults"));

    v10 = objc_msgSend(v9, "count");
    if (v10 > objc_msgSend(v7, "selectedIndex"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "selectedIndex")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "coordinator"));
      objc_msgSend(v13, "viewController:doSearchItem:withUserInfo:", 0, v12, &off_1012744A8);

    }
  }

}

@end
