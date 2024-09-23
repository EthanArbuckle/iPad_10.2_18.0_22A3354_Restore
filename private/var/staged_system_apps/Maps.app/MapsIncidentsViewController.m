@implementation MapsIncidentsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double left;
  double bottom;
  double right;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MapsIncidentsViewController;
  -[MapsIncidentsViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("MapsIncidentsView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setPreservesSuperviewLayoutMargins:", 1);

  -[MapsIncidentsViewController setViewRespectsSystemMinimumLayoutMargins:](self, "setViewRespectsSystemMinimumLayoutMargins:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsIncidentsViewController;
  -[MapsIncidentsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MapsIncidentsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)setTransitIncidents:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsIncidentsViewController;
  -[MapsIncidentsViewController setTransitIncidents:](&v4, "setTransitIncidents:", a3);
  -[MapsIncidentsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (-[MapsIncidentsViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (sub_1002A8AA0(self) == 5)
    {
      -[MapsIncidentsViewController _calculatePreferredContentSize](self, "_calculatePreferredContentSize");
      v4 = v3;
      v6 = v5;
      -[MapsIncidentsViewController preferredContentSize](self, "preferredContentSize");
      if (v4 != v8 || v6 != v7)
        -[MapsIncidentsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
    }
  }
}

- (CGSize)_calculatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double height;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  NSObject *v32;
  double v33;
  double v34;
  uint8_t v35[16];
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v8, "contentSize");
  v10 = v9;
  v11 = 282.0;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setFrame:", v5, v7, 282.0, v10);

  height = CGSizeZero.height;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v14, "contentSize");
  v16 = v15;
  v18 = v17;

  if (v16 != CGSizeZero.width || v18 != height)
  {
    v20 = 10;
    while (1)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
      objc_msgSend(v21, "contentSize");
      v11 = v22;
      v10 = v23;

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
      objc_msgSend(v24, "setFrame:", v5, v7, v11, v10);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
      objc_msgSend(v25, "layoutIfNeeded");

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController tableView](self, "tableView"));
      objc_msgSend(v26, "contentSize");
      v28 = v27;
      v30 = v29;

      if (v28 == v11 && v30 == v10)
        break;
      if (!--v20)
      {
        v31 = sub_1004324CC();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Could not calculate the size of the incidents popover within the max number of iterations.", v35, 2u);
        }

        break;
      }
    }
  }
  v33 = v11;
  v34 = v10;
  result.height = v34;
  result.width = v33;
  return result;
}

- (BOOL)_isValidURLForWebView:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scheme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("http")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("https"));

  return v5;
}

- (void)openUrlForAdvisoryNotice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[5];
  MapsIncidentsViewController *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  UIApplicationOpenExternalURLOptionsKey v17;
  void *v18;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1004314BC;
  v15 = sub_1004314CC;
  v16 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v4);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1004314BC;
  v9[4] = sub_1004314CC;
  v10 = self;
  v5 = (void *)UIApp;
  v6 = v12[5];
  v17 = UIApplicationOpenURLOptionUniversalLinksOnly;
  v18 = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004314D4;
  v8[3] = &unk_1011B6140;
  v8[4] = v9;
  v8[5] = &v11;
  objc_msgSend(v5, "_openURL:originatingView:options:completionHandler:", v6, 0, v7, v8);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);

}

@end
