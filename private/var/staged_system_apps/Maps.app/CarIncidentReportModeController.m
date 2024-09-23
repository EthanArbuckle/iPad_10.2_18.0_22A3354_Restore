@implementation CarIncidentReportModeController

- (CarIncidentReportModeController)init
{
  CarIncidentReportModeController *v2;
  CarIncidentReportModeController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarIncidentReportModeController;
  v2 = -[CarIncidentReportModeController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CarIncidentReportModeController _commonInit](v2, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  CarIncidentsListCardViewController *v3;
  CarIncidentsListCardViewController *carIncidentsListCardViewController;
  GEOLocation *v5;
  GEOLocation *incidentLocation;
  id v7;

  self->_state = 1;
  v3 = -[CarIncidentsListCardViewController initWithDelegate:]([CarIncidentsListCardViewController alloc], "initWithDelegate:", self);
  carIncidentsListCardViewController = self->_carIncidentsListCardViewController;
  self->_carIncidentsListCardViewController = v3;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v5 = (GEOLocation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentLocation"));
  incidentLocation = self->_incidentLocation;
  self->_incidentLocation = v5;

}

- (void)setIncidentLayoutItem:(id)a3 report:(id)a4
{
  id v7;
  id v8;
  CarIncidentReportAlertCardViewController *v9;
  CarIncidentReportAlertCardViewController *carIncidentReportAlertViewController;

  objc_storeStrong((id *)&self->_selectedIncidentLayoutItem, a3);
  v7 = a3;
  v8 = a4;
  v9 = -[CarIncidentReportAlertCardViewController initWithDelegate:incidentLayoutItem:report:]([CarIncidentReportAlertCardViewController alloc], "initWithDelegate:incidentLayoutItem:report:", self, self->_selectedIncidentLayoutItem, v8);

  carIncidentReportAlertViewController = self->_carIncidentReportAlertViewController;
  self->_carIncidentReportAlertViewController = v9;

  -[CarIncidentReportModeController setState:](self, "setState:", 2);
}

- (void)setState:(int64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;

  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = CFSTR("Unknown");
      if (a3 == 1)
        v7 = CFSTR("IncidentList");
      if (a3 == 2)
        v7 = CFSTR("IncidentReport");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CarReportIncidentModeController: setState: %@, -> updating cardsOverlay.", (uint8_t *)&v9, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportModeController carChromeViewController](self, "carChromeViewController"));
    objc_msgSend(v8, "updateCardsForContext:animated:", self, 1);

  }
}

- (id)_cardTitle
{
  void *v2;
  void *v3;

  if ((id)-[CarIncidentReportModeController state](self, "state") == (id)1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Report Incident [Nav, Tray]"), CFSTR("localized string not found"), 0));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- (id)desiredCards
{
  const __CFString *v3;

  v3 = CFSTR("primary");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportModeController _cardTitle](self, "_cardTitle"));
  objc_msgSend(v5, "setTitle:", v6);

  HIDWORD(v26) = 0;
  *(_DWORD *)((char *)&v26 + 1) = 0;
  v15 = xmmword_100E34B90;
  v16 = 1;
  v17 = 0;
  v18 = 0;
  v19 = 1065353216;
  v20 = 2;
  LODWORD(v21) = 1148846080;
  v22 = 0;
  v23 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  v24 = _Q0;
  v25 = _Q0;
  LOBYTE(v26) = 1;
  v27 = 8;
  LOBYTE(v28) = 0;
  if (v5)
    objc_msgSend(v5, "setLayout:", &v15);
  v12 = -[CarIncidentReportModeController state](self, "state", v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
  v13 = v12;
  if (v12 == 1)
  {
    v14 = 40;
    goto LABEL_7;
  }
  if (v12 == 2)
  {
    v13 = 0;
    v14 = 48;
LABEL_7:
    objc_msgSend(v5, "setContent:", *(Class *)((char *)&self->super.isa + v14));
    objc_msgSend(v5, "setAccessory:", v13);
  }

}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarIncidentReportModeController carChromeViewController](self, "carChromeViewController", a3, a4));
  objc_msgSend(v5, "setHardwareBackButtonBehavior:forContext:", 0, self);

}

- (void)incidentsListCard:(id)a3 didSelectIncident:(id)a4
{
  TrafficIncidentReport *v6;
  CarIncidentReportAlertCardViewController *carIncidentReportAlertViewController;
  CarIncidentReportAlertCardViewController *v8;
  id v9;

  v9 = a4;
  objc_storeStrong((id *)&self->_selectedIncidentLayoutItem, a4);
  v6 = -[TrafficIncidentReport initWithUserLocation:type:userPath:]([TrafficIncidentReport alloc], "initWithUserLocation:type:userPath:", self->_incidentLocation, -[TrafficIncidentLayoutItem incidentType](self->_selectedIncidentLayoutItem, "incidentType"), 5);
  -[TrafficIncidentReport setReportedFromCarplay:](v6, "setReportedFromCarplay:", 1);
  if (self->_carIncidentReportAlertViewController)
  {
    carIncidentReportAlertViewController = (CarIncidentReportAlertCardViewController *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportModeController carIncidentReportAlertViewController](self, "carIncidentReportAlertViewController"));
    -[CarIncidentReportAlertCardViewController updateIncidentLayoutItem:report:](carIncidentReportAlertViewController, "updateIncidentLayoutItem:report:", self->_selectedIncidentLayoutItem, v6);
  }
  else
  {
    v8 = -[CarIncidentReportAlertCardViewController initWithDelegate:incidentLayoutItem:report:]([CarIncidentReportAlertCardViewController alloc], "initWithDelegate:incidentLayoutItem:report:", self, self->_selectedIncidentLayoutItem, v6);
    carIncidentReportAlertViewController = self->_carIncidentReportAlertViewController;
    self->_carIncidentReportAlertViewController = v8;
  }

  -[CarIncidentReportModeController setState:](self, "setState:", 2);
}

- (void)trafficAlertCardViewControllerDismiss:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance", a3));
  objc_msgSend(v4, "popFromContext:", self);

}

- (NSArray)preferredCarFocusEnvironments
{
  int64_t v3;
  void *v4;
  void *v5;
  void **v6;
  void *v7;
  void *v9;
  void *v10;

  v3 = -[CarIncidentReportModeController state](self, "state");
  if (v3 == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportModeController carIncidentReportAlertViewController](self, "carIncidentReportAlertViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
    v9 = v5;
    v6 = &v9;
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportModeController carIncidentsListCardViewController](self, "carIncidentsListCardViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
    v10 = v5;
    v6 = &v10;
LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 1));

    return (NSArray *)v7;
  }
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)carFocusOrderSequences
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentReportModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "itemRepresentingOverlays"));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v4, 5));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return (NSArray *)v6;
}

- (int)currentUsageTarget
{
  return 0;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (CarIncidentsListCardViewController)carIncidentsListCardViewController
{
  return self->_carIncidentsListCardViewController;
}

- (void)setCarIncidentsListCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_carIncidentsListCardViewController, a3);
}

- (CarIncidentReportAlertCardViewController)carIncidentReportAlertViewController
{
  return self->_carIncidentReportAlertViewController;
}

- (void)setCarIncidentReportAlertViewController:(id)a3
{
  objc_storeStrong((id *)&self->_carIncidentReportAlertViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carIncidentReportAlertViewController, 0);
  objc_storeStrong((id *)&self->_carIncidentsListCardViewController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_incidentLocation, 0);
  objc_storeStrong((id *)&self->_selectedIncidentLayoutItem, 0);
}

@end
