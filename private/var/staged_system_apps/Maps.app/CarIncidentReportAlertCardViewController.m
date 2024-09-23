@implementation CarIncidentReportAlertCardViewController

- (CarIncidentReportAlertCardViewController)initWithDelegate:(id)a3 incidentLayoutItem:(id)a4 report:(id)a5
{
  id v8;
  id v9;
  id v10;
  CarIncidentReportAlertCardViewController *v11;
  CarIncidentReportAlertCardViewController *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CarIncidentReportAlertCardViewController;
  v11 = -[CarIncidentReportAlertCardViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_incidentLayoutItem, a4);
    objc_storeStrong((id *)&v12->_report, a5);
  }

  return v12;
}

- (void)loadView
{
  CarTrafficAlertView *v3;

  v3 = -[CarTrafficAlertView initWithDelegate:incidentLayoutItem:]([CarTrafficAlertView alloc], "initWithDelegate:incidentLayoutItem:", self, self->_incidentLayoutItem);
  -[CarTrafficAlertView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CarIncidentReportAlertCardViewController setView:](self, "setView:", v3);
  -[CarIncidentReportAlertCardViewController setTrafficAlertView:](self, "setTrafficAlertView:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double Double;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CarIncidentReportAlertCardViewController;
  -[CarIncidentReportAlertCardViewController viewDidAppear:](&v15, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportAlertCardViewController trafficAlertView](self, "trafficAlertView"));
  objc_msgSend(v4, "setAcceptProgress:", 0.0);

  Double = GEOConfigGetDouble(MapsConfig_TrafficIncidentsSelectionDismissDelay, off_1014B34E8);
  if (Double > 0.0)
  {
    v6 = Double;
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1008FA764;
    v12[3] = &unk_1011AD260;
    objc_copyWeak(&v13, &location);
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, 0, v6);
    -[CarIncidentReportAlertCardViewController _cancelDismissTimer](self, "_cancelDismissTimer");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1008FA7AC;
    v10[3] = &unk_1011ADF20;
    objc_copyWeak(&v11, &location);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, v6));
    -[CarIncidentReportAlertCardViewController setDismissTimer:](self, "setDismissTimer:", v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  if (!-[TrafficIncidentReport isSiriContext](self->_report, "isSiriContext"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutItem incidentTypeAsString](self->_incidentLayoutItem, "incidentTypeAsString"));
    objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 2152, 1001, v9);

  }
  -[TrafficIncidentReport submitWithCompletionHandler:](self->_report, "submitWithCompletionHandler:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarIncidentReportAlertCardViewController;
  -[CarIncidentReportAlertCardViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[CarIncidentReportAlertCardViewController _cancelDismissTimer](self, "_cancelDismissTimer");
}

- (void)updateIncidentLayoutItem:(id)a3 report:(id)a4
{
  TrafficIncidentLayoutItem *v6;
  id v7;
  TrafficIncidentLayoutItem *incidentLayoutItem;
  TrafficIncidentLayoutItem *v9;
  TrafficIncidentLayoutItem *v10;
  id v11;

  v6 = (TrafficIncidentLayoutItem *)a3;
  objc_storeStrong((id *)&self->_report, a4);
  v7 = a4;
  incidentLayoutItem = self->_incidentLayoutItem;
  self->_incidentLayoutItem = v6;
  v9 = v6;

  v10 = self->_incidentLayoutItem;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CarIncidentReportAlertCardViewController trafficAlertView](self, "trafficAlertView"));
  objc_msgSend(v11, "setIncidentLayoutItem:", v10);

}

- (void)_cancelDismissTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportAlertCardViewController dismissTimer](self, "dismissTimer"));
  objc_msgSend(v3, "invalidate");

  -[CarIncidentReportAlertCardViewController setDismissTimer:](self, "setDismissTimer:", 0);
}

- (void)_dismissTrafficAlert
{
  id v3;

  -[CarIncidentReportAlertCardViewController _cancelDismissTimer](self, "_cancelDismissTimer");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarIncidentReportAlertCardViewController delegate](self, "delegate"));
  objc_msgSend(v3, "trafficAlertCardViewControllerDismiss:", self);

}

- (NSArray)focusOrderSubItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportAlertCardViewController trafficAlertView](self, "trafficAlertView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "focusOrderSubItems"));

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportAlertCardViewController trafficAlertView](self, "trafficAlertView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredFocusEnvironments"));

  return (NSArray *)v3;
}

- (CarIncidentReportAlertViewControllerDelegate)delegate
{
  return (CarIncidentReportAlertViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TrafficIncidentLayoutItem)incidentLayoutItem
{
  return self->_incidentLayoutItem;
}

- (void)setIncidentLayoutItem:(id)a3
{
  objc_storeStrong((id *)&self->_incidentLayoutItem, a3);
}

- (CarTrafficAlertView)trafficAlertView
{
  return self->_trafficAlertView;
}

- (void)setTrafficAlertView:(id)a3
{
  objc_storeStrong((id *)&self->_trafficAlertView, a3);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (NSTimer)dismissTimer
{
  return self->_dismissTimer;
}

- (void)setDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_trafficAlertView, 0);
  objc_storeStrong((id *)&self->_incidentLayoutItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
