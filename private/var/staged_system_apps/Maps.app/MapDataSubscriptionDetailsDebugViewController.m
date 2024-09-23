@implementation MapDataSubscriptionDetailsDebugViewController

- (MapDataSubscriptionDetailsDebugViewController)initWithSubscription:(id)a3
{
  id v5;
  MapDataSubscriptionDetailsDebugViewController *v6;
  MapDataSubscriptionDetailsDebugViewController *v7;
  NSDateFormatter *v8;
  NSDateFormatter *dateFormatter;
  MapDataSubscriptionDetailsDebugViewController *v10;

  v5 = a3;
  v6 = -[MapDataSubscriptionDetailsDebugViewController initWithStyle:](self, "initWithStyle:", 2);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);
    v8 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    -[NSDateFormatter setDateStyle:](v7->_dateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v7->_dateFormatter, "setTimeStyle:", 0);
    v10 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapDataSubscriptionDetailsDebugViewController;
  -[MapDataSubscriptionDetailsDebugViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionDetailsDebugViewController tableView](self, "tableView"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("map"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionDetailsDebugViewController tableView](self, "tableView"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("text"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self->_subscriptionInfo, "subscription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  -[MapDataSubscriptionDetailsDebugViewController setTitle:](self, "setTitle:", v6);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4;
  double v5;

  v4 = a4;
  if (objc_msgSend(v4, "section") || objc_msgSend(v4, "row"))
    v5 = UITableViewAutomaticDimension;
  else
    v5 = 200.0;

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return 6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MapDataSubscriptionMapContentConfiguration *v12;
  void *v13;
  MapDataSubscriptionMapContentConfiguration *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  const __CFString *v19;
  NSDateFormatter *dateFormatter;
  void *v22;
  void *v23;
  void *v24;
  MapDataSubscriptionInfo *subscriptionInfo;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    v8 = 0;
  }
  else if (objc_msgSend(v7, "row"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("text")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration valueCellConfiguration](UIListContentConfiguration, "valueCellConfiguration"));
    switch((unint64_t)objc_msgSend(v7, "row"))
    {
      case 1uLL:
        objc_msgSend(v9, "setText:", CFSTR("Identifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self->_subscriptionInfo, "subscription"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        goto LABEL_9;
      case 2uLL:
        objc_msgSend(v9, "setText:", CFSTR("App"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self->_subscriptionInfo, "subscription"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_originatingBundleIdentifier"));
        goto LABEL_9;
      case 3uLL:
        objc_msgSend(v9, "setText:", CFSTR("Data"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self->_subscriptionInfo, "subscription"));
        v15 = GEOMapDataSubscriptionDataTypeAsString(objc_msgSend(v10, "dataTypes"));
        v11 = objc_claimAutoreleasedReturnValue(v15);
        goto LABEL_9;
      case 4uLL:
        objc_msgSend(v9, "setText:", CFSTR("Policy"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self->_subscriptionInfo, "subscription"));
        v16 = GEOMapDataSubscriptionPolicyAsString(objc_msgSend(v10, "policy"));
        v11 = objc_claimAutoreleasedReturnValue(v16);
LABEL_9:
        v17 = (__CFString *)v11;
        v18 = v9;
        v19 = v17;
        goto LABEL_10;
      case 5uLL:
        objc_msgSend(v9, "setText:", CFSTR("Expires"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self->_subscriptionInfo, "subscription"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "expirationDate"));
        if (v17)
        {
          dateFormatter = self->_dateFormatter;
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self->_subscriptionInfo, "subscription"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "expirationDate"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v23));
          objc_msgSend(v9, "setSecondaryText:", v24);

        }
        else
        {
          v19 = CFSTR("Never");
          v18 = v9;
LABEL_10:
          objc_msgSend(v18, "setSecondaryText:", v19);
        }

LABEL_12:
        objc_msgSend(v8, "setContentConfiguration:", v9);
        objc_msgSend(v8, "setSelectionStyle:", 0);

        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("map")));
    v12 = [MapDataSubscriptionMapContentConfiguration alloc];
    subscriptionInfo = self->_subscriptionInfo;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &subscriptionInfo, 1));
    v14 = -[MapDataSubscriptionMapContentConfiguration initWithSubscriptions:](v12, "initWithSubscriptions:", v13);
    objc_msgSend(v8, "setContentConfiguration:", v14);

    objc_msgSend(v8, "setSelectionStyle:", 0);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end
