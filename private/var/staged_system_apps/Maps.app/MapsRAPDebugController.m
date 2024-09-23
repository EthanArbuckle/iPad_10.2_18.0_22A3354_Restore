@implementation MapsRAPDebugController

- (MapsRAPDebugController)init
{
  MapsRAPDebugController *v2;
  MapsUGCEnvironmentSectionController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsRAPDebugController;
  v2 = -[MapsDebugValuesViewController init](&v5, "init");
  if (v2)
  {
    v3 = -[MapsUGCEnvironmentSectionController initWithSubmissionURL:lookupURL:]([MapsUGCEnvironmentSectionController alloc], "initWithSubmissionURL:lookupURL:", 42, 43);
    -[MapsRAPDebugController setEnvironmentsSectionController:](v2, "setEnvironmentsSectionController:", v3);

  }
  return v2;
}

+ (id)navigationDestinationTitle
{
  return CFSTR("Report an Issue");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsRAPDebugController;
  -[MapsDebugValuesViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MapsRAPDebugController _viewWillAppear](self, "_viewWillAppear");
  -[MapsRAPDebugController _refreshServerVersionNumber](self, "_refreshServerVersionNumber");
}

- (void)prepareDefaultSimJanaURL
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("RAPDebugSimJanaURL")));

  if (!v2)
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("http://sim-jana-qa1.geo.apple.com/"), CFSTR("RAPDebugSimJanaURL"));
    objc_msgSend(v3, "synchronize");
  }

}

- (void)prepareContent
{
  RAPWebBundleConfigurationManager *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location[2];

  -[MapsRAPDebugController prepareDefaultSimJanaURL](self, "prepareDefaultSimJanaURL");
  objc_initWeak(location, self);
  v3 = objc_alloc_init(RAPWebBundleConfigurationManager);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleConfigurationManager configuration](v3, "configuration"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100807EC8;
  v29[3] = &unk_1011B4F90;
  objc_copyWeak(&v31, location);
  v5 = v4;
  v30 = v5;
  v6 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRAPDebugController environmentsSectionController](self, "environmentsSectionController"));
  objc_msgSend(v7, "appendEnvironmentSectionToDebugController:", self);

  v8 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Submission Debug Settings"), &stru_1011C99E0);
  v9 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Notification"), &stru_1011C9A00);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1008081DC;
  v27[3] = &unk_1011AEAC8;
  objc_copyWeak(&v28, location);
  v10 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("RAP Config Default Value"), v27);
  v11 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Submitted RAP Status"), &stru_1011C9A80);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10080847C;
  v25[3] = &unk_1011AEAC8;
  objc_copyWeak(&v26, location);
  v12 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v25);
  v13 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Server Controlled UI"), &stru_1011C9AC0);
  v14 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Client Overrides For Server Controller UI"), &stru_1011C9B00);
  v15 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("SimJana"), &stru_1011C9B20);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100808A60;
  v23[3] = &unk_1011AEAC8;
  objc_copyWeak(&v24, location);
  v16 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Submitted Raps"), v23);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100808BC0;
  v21[3] = &unk_1011AEAC8;
  objc_copyWeak(&v22, location);
  v17 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100808D98;
  v19[3] = &unk_1011AEAC8;
  objc_copyWeak(&v20, location);
  v18 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

- (void)openAnalyticsWithURL:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));

  objc_msgSend(v5, "openURL:options:completionHandler:", v4, &__NSDictionary0__struct, 0);
}

- (void)simulateFixForProblemWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("RAPDebugSimJanaURL")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("simulator/fix")));

  v9 = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:", v8);
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("problem_id=%@"), v4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));
  objc_msgSend(v9, "setHTTPBody:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100809180;
  v15[3] = &unk_1011C9B48;
  v15[4] = self;
  v16 = v4;
  v13 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v9, v15));

  objc_msgSend(v14, "resume");
}

- (void)displayMessage:(id)a3 titled:(id)a4
{
  -[MapsRAPDebugController _maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:](self, "_maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:", a4, a3, CFSTR("OK"));
}

- (void)webBundleUpdatedWithWebBundlePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Web Bundle Updated with Path:%@"), v4));
  -[MapsRAPDebugController displayMessage:titled:](self, "displayMessage:titled:", v5, CFSTR("RAP Web Bundle Downloaded"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRAPDebugController deviceVersionNumberRow](self, "deviceVersionNumberRow"));
  objc_msgSend(v7, "setSubtitle:", v6);

  -[MapsDebugValuesViewController reloadData](self, "reloadData");
}

- (void)webBundleEncounteredError:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localizedDescription"));
  -[MapsRAPDebugController displayMessage:titled:](self, "displayMessage:titled:", v4, CFSTR("RAP Web Bundle Download Error"));

}

- (void)webBundleHadNoChanges
{
  -[MapsRAPDebugController displayMessage:titled:](self, "displayMessage:titled:", CFSTR("On device bundle is up to date.  No download required"), CFSTR("RAP Web Bundle Download Check"));
}

- (void)_refreshServerVersionNumber
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RAPWebBundleDownloadManager sharedInstance](RAPWebBundleDownloadManager, "sharedInstance"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100809584;
  v3[3] = &unk_1011C9B70;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "_downloadManifestWithForce:completion:", 1, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (MapsUGCEnvironmentSectionController)environmentsSectionController
{
  return self->_environmentsSectionController;
}

- (void)setEnvironmentsSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_environmentsSectionController, a3);
}

- (MapsDebugReadOnlyValueRow)serverVersionNumberRow
{
  return self->_serverVersionNumberRow;
}

- (void)setServerVersionNumberRow:(id)a3
{
  objc_storeStrong((id *)&self->_serverVersionNumberRow, a3);
}

- (MapsDebugReadOnlyValueRow)deviceVersionNumberRow
{
  return self->_deviceVersionNumberRow;
}

- (void)setDeviceVersionNumberRow:(id)a3
{
  objc_storeStrong((id *)&self->_deviceVersionNumberRow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceVersionNumberRow, 0);
  objc_storeStrong((id *)&self->_serverVersionNumberRow, 0);
  objc_storeStrong((id *)&self->_environmentsSectionController, 0);
}

@end
