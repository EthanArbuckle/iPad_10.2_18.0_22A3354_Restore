@implementation MapsApplicationDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Maps");
}

- (void)addVisualEffectSettingsTo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B54C4C;
  v6[3] = &unk_1011AEAC8;
  objc_copyWeak(&v7, &location);
  v5 = objc_msgSend(v4, "addSectionWithTitle:content:", 0, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)addAppUISectionTo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B54FCC;
  v6[3] = &unk_1011C1918;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v5 = objc_msgSend(v4, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("App UI"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)addChromeSettingsTo:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B557D4;
  v4[3] = &unk_1011B7F10;
  v4[4] = self;
  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Chrome"), v4);
}

- (void)_promptForRestart
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)UIAlertController);
  objc_msgSend(v5, "setTitle:", CFSTR("This change will be effective once Maps restarts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Later"), 1, 0));
  objc_msgSend(v5, "addAction:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Quit Maps"), 2, &stru_1011E4528));
  objc_msgSend(v5, "addAction:", v4);

  -[MapsApplicationDebugController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)addCarPlaySectionTo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B579A0;
  v6[3] = &unk_1011C1B08;
  objc_copyWeak(&v7, &location);
  v5 = objc_msgSend(v4, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("CarPlay"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)addMapsHomeSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Maps Home"), &stru_1011E55A8);
}

- (void)addDoomSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("DooM"), &stru_1011E5608);
}

- (void)addTransitSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Transit"), &stru_1011E56C8);
}

- (void)addMapsSuggestionsSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Maps Suggestions"), &stru_1011E58A8);
}

- (void)addFindMyCarSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Find My Car"), &stru_1011E5988);
}

- (void)addPoisInjectionSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Personalized Maps"), &stru_1011E5A48);
}

- (void)addAutocompleteSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Autocomplete"), &stru_1011E5B88);
}

- (void)addSearchSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Search"), &stru_1011E5C48);
}

- (void)addFeaturesSectionTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Others"), &stru_1011E5CE8);
}

- (void)addCoreRecentsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("CoreRecents"), &stru_1011E5DC8);
}

- (void)addMapsResetLaunchAlertsTo:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B5FDF4;
  v4[3] = &unk_1011B7F10;
  v4[4] = self;
  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Launch Alerts"), v4);
}

- (void)promptCLReset
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Reset CoreLocation Auth?"), CFSTR("Resetting CL Auth will immediately trigger all necessary launch alerts/prompts"), 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Reset"), 1, &stru_1011E5FA8));
  objc_msgSend(v3, "addAction:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Reset and Quit"), 1, &stru_1011E5FC8));
  objc_msgSend(v3, "addAction:", v5);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B60800;
  v8[3] = &unk_1011AD938;
  v9 = v3;
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Don't Reset CL"), 1, v8));
  objc_msgSend(v6, "addAction:", v7);

  -[MapsApplicationDebugController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)addOthersTo:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Location Simulation"), &stru_1011E5FE8);
  v4 = objc_msgSend(v6, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Routing Apps"), &stru_1011E6088);
  v5 = objc_msgSend(v6, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Performance throttling"), &stru_1011E60C8);

}

- (void)addLookAroundSettingsTo:(id)a3
{
  void *v3;
  unsigned int v4;
  id v5;
  id v6;

  v6 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v4 = objc_msgSend(v3, "isMuninEnabled");

  if (v4)
    v5 = objc_msgSend(v6, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Look Around"), &stru_1011E6148);

}

- (void)addCollectionSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Guides"), &stru_1011E6188);
}

- (void)addShareETASettingsTo:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B60ED0;
  v4[3] = &unk_1011B7F10;
  v4[4] = self;
  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Share ETA"), v4);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CNContactPickerViewController *shareTripContactPicker;
  _QWORD v10[4];
  id v11;
  MapsApplicationDebugController *v12;

  if (self->_shareTripContactPicker == a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactsFromCNContact:](MSPSharedTripContact, "contactsFromCNContact:", a4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B62768;
    v10[3] = &unk_1011E6498;
    v11 = v6;
    v12 = self;
    v8 = v6;
    objc_msgSend(v7, "startSharingWithContact:completion:", v8, v10);

    shareTripContactPicker = self->_shareTripContactPicker;
    self->_shareTripContactPicker = 0;

  }
}

- (void)contactPickerDidCancel:(id)a3
{
  CNContactPickerViewController *v4;
  CNContactPickerViewController *v5;

  v4 = (CNContactPickerViewController *)a3;
  if (self->_shareTripContactPicker == v4)
  {
    self->_shareTripContactPicker = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (void)addScreenshot2SettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Screenshot 2.0"), &stru_1011E64B8);
}

- (void)addRoutePlanningSettingsTo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];

  v4 = a3;
  if (qword_1014D4138 != -1)
    dispatch_once(&qword_1014D4138, &stru_1011E64F8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B62AA4;
  v6[3] = &unk_1011B7F10;
  v6[4] = self;
  v5 = objc_msgSend(v4, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Route Planning"), v6);

}

- (void)_searchForWaypointsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc((Class)MKLocalSearchRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("__internal_ResumeRouteTestSearchQuery")));
  v8 = objc_msgSend(v5, "initWithNaturalLanguageQuery:", v7);

  v9 = objc_msgSend(objc_alloc((Class)MKLocalSearch), "initWithRequest:", v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100B63F3C;
  v11[3] = &unk_1011E66D8;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  objc_msgSend(v9, "startWithCompletionHandler:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_requestRouteWithWaypoints:(id)a3 traits:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = objc_msgSend(v8, "copy");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NanoRoutePlanningRequest requestWithWaypoints:viaTransportType:traits:companionRouteContext:](NanoRoutePlanningRequest, "requestWithWaypoints:viaTransportType:traits:companionRouteContext:", v11, 0, v9, 0));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100B64288;
  v15[3] = &unk_1011E6700;
  objc_copyWeak(&v18, &location);
  v13 = v8;
  v16 = v13;
  v14 = v10;
  v17 = v14;
  +[NanoRoutePlanningSession processRequest:withCompletion:](NanoRoutePlanningSession, "processRequest:withCompletion:", v12, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)addHikingSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Hiking"), &stru_1011E6720);
}

- (void)addDavisSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Cycling"), &stru_1011E67A0);
}

- (void)addEnhancedBusinessSettingsTo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B64B88;
  v6[3] = &unk_1011C1B08;
  objc_copyWeak(&v7, &location);
  v5 = objc_msgSend(v4, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Enhanced Business Place Card"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)addImpressionLoggingSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Impression Logging"), &stru_1011E68E0);
}

- (void)addSmartCardsSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Maps 100"), &stru_1011E6960);
}

- (void)addUGCSettingsTo:(id)a3
{
  id v4;
  MapsUGCEnvironmentSectionController *v5;
  MapsUGCEnvironmentSectionController *ugcEnvironmentController;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v5 = -[MapsUGCEnvironmentSectionController initWithSubmissionURL:lookupURL:]([MapsUGCEnvironmentSectionController alloc], "initWithSubmissionURL:lookupURL:", 53, 43);
  ugcEnvironmentController = self->_ugcEnvironmentController;
  self->_ugcEnvironmentController = v5;

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B651FC;
  v8[3] = &unk_1011C1B08;
  objc_copyWeak(&v9, &location);
  v7 = objc_msgSend(v4, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("User Generated Content"), v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)addLPRSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Alberta"), &stru_1011E6C60);
}

- (void)addMFDSettingsTo:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Feature Discovery"), &stru_1011E6CE0);
}

- (void)prepareContent
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B65E7C;
  v10[3] = &unk_1011AEAC8;
  objc_copyWeak(&v11, &location);
  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B65F24;
  v8[3] = &unk_1011AEAC8;
  objc_copyWeak(&v9, &location);
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B66194;
  v6[3] = &unk_1011AEAC8;
  objc_copyWeak(&v7, &location);
  v5 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCardSearchQuery, 0);
  objc_storeStrong((id *)&self->_ugcEnvironmentController, 0);
  objc_storeStrong((id *)&self->_shareTripContactPicker, 0);
}

@end
