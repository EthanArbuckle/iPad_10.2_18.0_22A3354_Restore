@implementation CurrentURLsDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Current URL Config");
}

- (CurrentURLsDebugController)init
{
  CurrentURLsDebugController *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  id v13;
  void ***v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  unint64_t i;
  void *v25;
  NSArray *urlTypes;
  CurrentURLsDebugController *v27;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[3];
  double v37;
  _QWORD v38[4];
  objc_super v39;
  CGRect v40;

  v39.receiver = self;
  v39.super_class = (Class)CurrentURLsDebugController;
  v2 = -[AuxiliaryDebugViewController init](&v39, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 300.0, 200.0);
    v4 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    +[UIFont systemFontSize](UIFont, "systemFontSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    objc_msgSend(v4, "setFont:", v5);

    objc_msgSend(v4, "setText:", CFSTR("Where did a URL come from?"));
    objc_msgSend(v4, "setOpaque:", 0);
    objc_msgSend(v4, "setBackgroundColor:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v4, "setTextColor:", v6);

    objc_msgSend(v4, "sizeToFit");
    objc_msgSend(v4, "frame");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v3, "bounds");
    v12 = v11 - v8;
    objc_msgSend(v4, "setFrame:", floorf(v12 * 0.5), 20.0, v8, v10);
    objc_msgSend(v3, "addSubview:", v4);
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v37 = 0.0;
    objc_msgSend(v4, "frame");
    v37 = CGRectGetMaxY(v40) + 20.0;
    v29 = _NSConcreteStackBlock;
    v30 = 3221225472;
    v31 = sub_100749624;
    v32 = &unk_1011C53E8;
    v34 = v38;
    v35 = v36;
    v13 = v3;
    v33 = v13;
    v14 = objc_retainBlock(&v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor", v29, v30, v31, v32));
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, CFSTR("Default"), v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor purpleColor](UIColor, "purpleColor"));
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, CFSTR("Resource Manifest"), v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, CFSTR("User Defaults"), v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, CFSTR("Network Defaults"), v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemTealColor](UIColor, "systemTealColor"));
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, CFSTR("Remote Config"), v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, CFSTR("Profile"), v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, CFSTR("Custom Environment"), v21);

    objc_msgSend(v13, "bounds");
    objc_msgSend(v13, "setBounds:", 0.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentURLsDebugController tableView](v2, "tableView"));
    objc_msgSend(v22, "setTableHeaderView:", v13);

    v23 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    for (i = 0; i != 66; ++i)
    {
      if (i - 23 < 0x2B || i <= 0x15 && ((1 << i) & 0x3DDE27) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", i));
        -[NSArray addObject:](v23, "addObject:", v25);

      }
    }
    urlTypes = v2->_urlTypes;
    v2->_urlTypes = v23;

    v27 = v2;
    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);

  }
  return v2;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_urlTypes, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  int v11;
  const char *v12;

  v6 = a3;
  if (a4 < 0 || -[NSArray count](self->_urlTypes, "count") <= a4)
  {
    v10 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", a4));
    v8 = (unint64_t)objc_msgSend(v7, "integerValue");

    if (v8 > 0x41)
      v9 = 0;
    else
      v9 = off_1011C5448[v8];
    v11 = GEOURLNeedsAuthForURLType(v8);
    v12 = "NO";
    if (v11)
      v12 = "YES";
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - Auth: %s"), v9, v12));
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  if (((unint64_t)objc_msgSend(v7, "section") & 0x8000000000000000) != 0
    || (v8 = objc_msgSend(v7, "section"), v8 >= (id)-[NSArray count](self->_urlTypes, "count")))
  {
    v11 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
    v10 = objc_msgSend(v9, "integerValue");

    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("URLDebugCell")));
    if (!v11)
    {
      v11 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("URLDebugCell"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v12, "setLineBreakMode:", 1);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v13, "setNumberOfLines:", 0);

      objc_msgSend(v11, "setSelectionStyle:", 0);
      +[UIFont labelFontSize](UIFont, "labelFontSize");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v15, "setFont:", v14);

    }
    v24 = 0;
    v16 = GEOURLStringWithSource(v10, &v24);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(v16);
    if (-[__CFString length](v17, "length"))
      v18 = v17;
    else
      v18 = CFSTR("(none)");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
    objc_msgSend(v19, "setText:", v18);

    switch(v24)
    {
      case 0:
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
        break;
      case 1:
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
        break;
      case 2:
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
        break;
      case 3:
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
        break;
      case 4:
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemTealColor](UIColor, "systemTealColor"));
        break;
      case 5:
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
        break;
      case 6:
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor purpleColor](UIColor, "purpleColor"));
        break;
      default:
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
        break;
    }
    v21 = (void *)v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
    objc_msgSend(v22, "setTextColor:", v21);

  }
  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  _QWORD v29[2];
  _QWORD v30[2];
  CGRect v31;

  v5 = a4;
  v6 = 0.0;
  if (((unint64_t)objc_msgSend(v5, "section") & 0x8000000000000000) == 0)
  {
    v7 = objc_msgSend(v5, "section");
    if (v7 < (id)-[NSArray count](self->_urlTypes, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
      v9 = objc_msgSend(v8, "integerValue");

      v11 = GEOURLString(v9, v10);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(v11);
      if (!-[__CFString length](v12, "length"))
      {

        v12 = CFSTR("(none)");
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
      v14 = objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "setLineBreakMode:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentURLsDebugController tableView](self, "tableView"));
      objc_msgSend(v15, "bounds");
      v17 = v16 + -40.0;
      v29[0] = NSFontAttributeName;
      +[UIFont labelFontSize](UIFont, "labelFontSize");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
      v29[1] = NSParagraphStyleAttributeName;
      v30[0] = v18;
      v30[1] = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
      -[__CFString boundingRectWithSize:options:attributes:context:](v12, "boundingRectWithSize:options:attributes:context:", 1, v19, 0, v17, 1.79769313e308);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      v31.origin.x = v21;
      v31.origin.y = v23;
      v31.size.width = v25;
      v31.size.height = v27;
      v6 = CGRectGetMaxY(v31) + 20.0;

    }
  }

  return v6;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  if (((unint64_t)objc_msgSend(v6, "section") & 0x8000000000000000) != 0
    || (v7 = objc_msgSend(v6, "section"), v7 >= (id)-[NSArray count](self->_urlTypes, "count")))
  {
    v13 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
    v9 = objc_msgSend(v8, "integerValue");

    v11 = GEOURLString(v9, v10);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100749E1C;
    v15[3] = &unk_1011B7BA8;
    v16 = (id)objc_claimAutoreleasedReturnValue(v11);
    v12 = v16;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, &stru_1011C5428, v15));

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTypes, 0);
}

@end
