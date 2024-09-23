@implementation UIRefreshControl

- (void)setLastRefreshDate:(id)a3
{
  -[UIRefreshControl setLastRefreshDate:textColor:](self, "setLastRefreshDate:textColor:", a3, 0);
}

- (void)setLastRefreshDate:(id)a3 textColor:(id)a4
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
  id v15;
  NSAttributedStringKey v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (qword_1005675B0 != -1)
      dispatch_once(&qword_1005675B0, &stru_1004ABD30);
    v16 = NSForegroundColorAttributeName;
    v8 = v7;
    if (!v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor refreshControlTextColor](UIColor, "refreshControlTextColor"));
    v17 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    if (!v7)

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LAST_REFRESH_FORMAT"), &stru_1004C6D40, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "friendlyDisplayString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1005675A8, "stringFromDate:", v6));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12, v13));

    v15 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v14, v9);
  }
  else
  {
    v15 = 0;
  }
  -[UIRefreshControl setAttributedTitle:](self, "setAttributedTitle:", v15);

}

@end
