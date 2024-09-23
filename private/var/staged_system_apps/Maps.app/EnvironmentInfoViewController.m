@implementation EnvironmentInfoViewController

- (EnvironmentInfoViewController)initWithStyle:(int64_t)a3 environment:(id)a4 editable:(BOOL)a5
{
  id v9;
  EnvironmentInfoViewController *v10;
  EnvironmentInfoViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *urlStrings;
  uint64_t v18;
  NSDictionary *proxyRequirements;
  void *v20;
  uint64_t v21;
  NSArray *urlTypes;
  void *v23;
  NSMapTable *v24;
  NSMapTable *overrideURLs;
  EnvironmentInfoViewController *v26;
  objc_super v28;

  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)EnvironmentInfoViewController;
  v10 = -[EnvironmentInfoViewController initWithStyle:](&v28, "initWithStyle:", a3);
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController tableView](v10, "tableView"));
    objc_msgSend(v12, "setRowHeight:", UITableViewAutomaticDimension);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController tableView](v11, "tableView"));
    objc_msgSend(v13, "setSectionFooterHeight:", UITableViewAutomaticDimension);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController tableView](v11, "tableView"));
    objc_msgSend(v14, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

    objc_storeStrong((id *)&v11->_environment, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentInfo displayName](v11->_environment, "displayName"));
    -[EnvironmentInfoViewController setTitle:](v11, "setTitle:", v15);

    v16 = objc_claimAutoreleasedReturnValue(-[GEOEnvironmentInfo serviceURLs](v11->_environment, "serviceURLs"));
    urlStrings = v11->_urlStrings;
    v11->_urlStrings = (NSDictionary *)v16;

    v18 = objc_claimAutoreleasedReturnValue(-[GEOEnvironmentInfo useProxyAuth](v11->_environment, "useProxyAuth"));
    proxyRequirements = v11->_proxyRequirements;
    v11->_proxyRequirements = (NSDictionary *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](v11->_urlStrings, "allKeys"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sortedArrayUsingComparator:", &stru_1011E8AA0));
    urlTypes = v11->_urlTypes;
    v11->_urlTypes = (NSArray *)v21;

    v11->_editable = a5;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "overrideURLs"));
    v24 = (NSMapTable *)objc_msgSend(v23, "copy");
    overrideURLs = v11->_overrideURLs;
    v11->_overrideURLs = v24;

    -[EnvironmentInfoViewController _updateNavigationItem](v11, "_updateNavigationItem");
    v26 = v11;
  }

  return v11;
}

- (void)_updateNavigationItem
{
  _BOOL4 editing;
  id v4;
  uint64_t v5;
  char **v6;
  void *v7;
  id v8;

  if (self->_editable)
  {
    editing = self->_editing;
    v4 = objc_alloc((Class)UIBarButtonItem);
    if (editing)
      v5 = 3;
    else
      v5 = 2;
    v6 = &selRef__beginEditing_;
    if (editing)
      v6 = &selRef__endEditing_;
    v8 = objc_msgSend(v4, "initWithBarButtonSystemItem:target:action:", v5, self, *v6);
  }
  else
  {
    v8 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v8);

}

- (void)_beginEditing:(id)a3
{
  id v4;

  self->_editing = 1;
  -[EnvironmentInfoViewController _updateNavigationItem](self, "_updateNavigationItem", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (void)_endEditing:(id)a3
{
  void *v4;

  self->_editing = 0;
  -[EnvironmentInfoViewController _updateNavigationItem](self, "_updateNavigationItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  -[GEOEnvironmentInfo updateWithURLs:](self->_environment, "updateWithURLs:", self->_overrideURLs);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_urlStrings)
    return (int64_t)-[NSArray count](self->_urlTypes, "count", a3) + self->_editing;
  else
    return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1 && !self->_editing)
    return 2;
  else
    return 1;
}

- (id)_urlStringForIndexPath:(id)a3 isFromManifest:(BOOL *)a4 isFromOverrides:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSMapTable *overrideURLs;
  void *v13;
  void *v14;
  id v15;
  NSDictionary *urlStrings;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;

  v8 = a3;
  if (((unint64_t)objc_msgSend(v8, "section") & 0x8000000000000000) != 0
    || (v9 = objc_msgSend(v8, "section"), v9 >= (id)-[NSDictionary count](self->_urlStrings, "count")))
  {
    v14 = 0;
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));
  v11 = objc_msgSend(v10, "integerValue");

  overrideURLs = self->_overrideURLs;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](overrideURLs, "objectForKey:", v13));

  v15 = objc_msgSend(v14, "length");
  if (v15 || objc_msgSend(v14, "length"))
  {
LABEL_7:
    v21 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  urlStrings = self->_urlStrings;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](urlStrings, "objectForKeyedSubscript:", v17));

  v19 = objc_opt_class(NSNull);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
  {
    v20 = GEOURLStringIgnoringManifest(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v20);

    goto LABEL_7;
  }
  v21 = 1;
  v14 = v18;
  if (a4)
LABEL_8:
    *a4 = v21;
LABEL_9:
  if (a5)
    *a5 = v15 != 0;
LABEL_12:

  return v14;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  NSDictionary *proxyRequirements;
  void *v12;
  void *v13;
  unsigned int v14;
  const char *v15;

  v6 = a3;
  if (self->_editing && -[NSDictionary count](self->_urlStrings, "count") == a4)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", a4));
    v9 = (unint64_t)objc_msgSend(v8, "integerValue");

    if (v9 > 0x41)
      v10 = 0;
    else
      v10 = off_1011E8AC0[v9];
    proxyRequirements = self->_proxyRequirements;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](proxyRequirements, "objectForKeyedSubscript:", v12));
    v14 = objc_msgSend(v13, "BOOLValue");

    v15 = "NO";
    if (v14)
      v15 = "YES";
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - Auth: %s"), v10, v15));
  }

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  _QWORD v28[2];
  _QWORD v29[2];
  CGRect v30;

  v5 = a4;
  v6 = v5;
  if (self->_editing
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"))), v9 = objc_msgSend(v8, "integerValue"), v8, v9 == (id)1)&& objc_msgSend(v6, "row") == (id)1)
  {
    v7 = UITableViewDefaultRowHeight;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController _urlStringForIndexPath:isFromManifest:isFromOverrides:](self, "_urlStringForIndexPath:isFromManifest:isFromOverrides:", v6, 0, 0));
    if (v10)
      v11 = (__CFString *)v10;
    else
      v11 = CFSTR("(none)");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
    v13 = objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setLineBreakMode:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController tableView](self, "tableView"));
    objc_msgSend(v14, "bounds");
    v16 = v15 + -40.0;
    v28[0] = NSFontAttributeName;
    +[UIFont labelFontSize](UIFont, "labelFontSize");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    v28[1] = NSParagraphStyleAttributeName;
    v29[0] = v17;
    v29[1] = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
    -[__CFString boundingRectWithSize:options:attributes:context:](v11, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, v16, 1.79769313e308);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v30.origin.x = v20;
    v30.origin.y = v22;
    v30.size.width = v24;
    v30.size.height = v26;
    v7 = CGRectGetMaxY(v30) + 20.0;

  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _EnvironmentURLTableViewCell *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  __int16 v35;
  __int16 v36;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_editing)
  {
    v9 = objc_msgSend(v7, "section");
    if (v9 == (id)-[NSArray count](self->_urlTypes, "count"))
    {
      v10 = (_EnvironmentURLTableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      -[_EnvironmentURLTableViewCell setBackgroundColor:](v10, "setBackgroundColor:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "colorWithAlphaComponent:", 0.800000012));
      -[_EnvironmentURLTableViewCell setSelectionTintColor:](v10, "setSelectionTintColor:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v15, "setTextColor:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v16, "setText:", CFSTR("Delete Environment"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v17, "setTextAlignment:", 1);
LABEL_4:

      goto LABEL_20;
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));
  v19 = objc_msgSend(v18, "integerValue");

  if (self->_editing)
  {
    v10 = (_EnvironmentURLTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("EnvironmentInfoServiceURLEditingCell")));
    if (!v10)
      v10 = -[_EnvironmentURLTableViewCell initWithReuseIdentifier:]([_EnvironmentURLTableViewCell alloc], "initWithReuseIdentifier:", CFSTR("EnvironmentInfoServiceURLEditingCell"));
    -[_EnvironmentURLTableViewCell setDelegate:](v10, "setDelegate:", self);
    v36 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController _urlStringForIndexPath:isFromManifest:isFromOverrides:](self, "_urlStringForIndexPath:isFromManifest:isFromOverrides:", v8, (char *)&v36 + 1, &v36));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell editableTextField](v10, "editableTextField"));
    objc_msgSend(v21, "setText:", v20);

    -[_EnvironmentURLTableViewCell setUrlType:](v10, "setUrlType:", v19);
  }
  else
  {
    if (v19 == (id)1 && objc_msgSend(v8, "row") == (id)1)
    {
      v10 = (_EnvironmentURLTableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v22, "setText:", CFSTR("Tile Groups"));

      -[_EnvironmentURLTableViewCell setAccessoryType:](v10, "setAccessoryType:", 1);
      goto LABEL_20;
    }
    v10 = (_EnvironmentURLTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("EnvironmentInfoServiceURLCell")));
    if (!v10)
    {
      v10 = (_EnvironmentURLTableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("EnvironmentInfoServiceURLCell"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v23, "setLineBreakMode:", 1);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v24, "setNumberOfLines:", 0);

      -[_EnvironmentURLTableViewCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
    }
    v35 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController _urlStringForIndexPath:isFromManifest:isFromOverrides:](self, "_urlStringForIndexPath:isFromManifest:isFromOverrides:", v8, (char *)&v35 + 1, &v35));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
    objc_msgSend(v26, "setText:", v25);

    if ((_BYTE)v35)
    {
      v27 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    }
    else if (HIBYTE(v35))
    {
      v27 = objc_claimAutoreleasedReturnValue(+[UIColor purpleColor](UIColor, "purpleColor"));
    }
    else
    {
      v27 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v28 = (void *)v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
    objc_msgSend(v29, "setTextColor:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "text"));

    if (!v31)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v33, "setText:", CFSTR("(none)"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell textLabel](v10, "textLabel"));
      objc_msgSend(v34, "setTextColor:", v17);

      goto LABEL_4;
    }
  }
LABEL_20:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  ActiveTileGroupDebugController *v11;
  void *v12;
  ActiveTileGroupDebugController *v13;
  void *v14;
  id v15;
  GEOEnvironmentInfo *environment;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 < (id)-[NSArray count](self->_urlTypes, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 == (id)1 && objc_msgSend(v7, "row") == (id)1)
    {
      v11 = [ActiveTileGroupDebugController alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentInfo resourceManifest](self->_environment, "resourceManifest"));
      v13 = -[ActiveTileGroupDebugController initWithResourceManifest:](v11, "initWithResourceManifest:", v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController navigationController](self, "navigationController"));
      objc_msgSend(v14, "pushViewController:animated:", v13, 1);

LABEL_9:
      goto LABEL_10;
    }
  }
  if (self->_editing)
  {
    v15 = objc_msgSend(v7, "section");
    if (v15 == (id)-[NSArray count](self->_urlTypes, "count"))
    {
      environment = self->_environment;
      v17 = objc_opt_class(GEOCustomEnvironmentInfo);
      if ((objc_opt_isKindOfClass(environment, v17) & 1) != 0)
      {
        v13 = (ActiveTileGroupDebugController *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Delete Environment"), CFSTR("Are you sure you want to delete this custom environment?"), 0));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
        -[ActiveTileGroupDebugController addAction:](v13, "addAction:", v18);

        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100BEEC68;
        v20[3] = &unk_1011AD938;
        v20[4] = self;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Delete"), 2, v20));
        -[ActiveTileGroupDebugController addAction:](v13, "addAction:", v19);

        -[EnvironmentInfoViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
        goto LABEL_9;
      }
    }
  }
LABEL_10:

}

- (void)urlCell:(id)a3 didChangeURLString:(id)a4
{
  id v6;
  id v7;
  NSMapTable *overrideURLs;
  void *v9;
  id v10;

  v6 = a4;
  v7 = objc_msgSend(a3, "urlType");
  overrideURLs = self->_overrideURLs;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  -[NSMapTable setObject:forKey:](overrideURLs, "setObject:forKey:", v6, v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[EnvironmentInfoViewController tableView](self, "tableView"));
  objc_msgSend(v10, "reloadData");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideURLs, 0);
  objc_storeStrong((id *)&self->_urlTypes, 0);
  objc_storeStrong((id *)&self->_proxyRequirements, 0);
  objc_storeStrong((id *)&self->_urlStrings, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
