@implementation RAPWebBundleHomeViewController

- (RAPWebBundleHomeViewController)initWithReport:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  RAPWebBundleHomeViewController *v9;
  RAPWebBundleHomeViewController *v10;
  id v11;
  id completion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPWebBundleHomeViewController;
  v9 = -[RAPWebBundleBaseMapViewController initWithReport:](&v14, "initWithReport:", v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_report, a3);
    v11 = objc_retainBlock(v8);
    completion = v10->_completion;
    v10->_completion = v11;

  }
  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPWebBundleHomeViewController;
  -[RAPWebBundleBaseMapViewController viewDidLoad](&v3, "viewDidLoad");
  -[RAPWebBundleBaseViewController loadWebView](self, "loadWebView");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPWebBundleHomeViewController;
  -[RAPWebBundleHomeViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  +[RAPAnalyticsManager captureRAPRevealActionFromReport:](RAPAnalyticsManager, "captureRAPRevealActionFromReport:", self->_report);
}

- (void)_dismiss
{
  id completion;

  +[RAPAnalyticsManager captureRAPCancelActionFromReport:](RAPAnalyticsManager, "captureRAPCancelActionFromReport:", self->_report);
  -[RAPWebBundleBaseViewController removeAllPhotos](self, "removeAllPhotos");
  completion = self->_completion;
  if (completion)
    (*((void (**)(id, RAPWebBundleHomeViewController *, _QWORD, _QWORD))completion + 2))(completion, self, 0, 0);
}

- (void)_reportSent
{
  -[RAPWebBundleHomeViewController _reportSentWithDismissalGesture:](self, "_reportSentWithDismissalGesture:", 0);
}

- (void)_reportSentWithDismissalGesture:(BOOL)a3
{
  _BOOL8 v3;
  void (**completion)(id, RAPWebBundleHomeViewController *, uint64_t, _BOOL8);

  v3 = a3;
  +[RAPAnalyticsManager captureRAPAcknowledgementDoneActionFromReport:](RAPAnalyticsManager, "captureRAPAcknowledgementDoneActionFromReport:", self->_report);
  -[RAPWebBundleBaseViewController removeAllPhotos](self, "removeAllPhotos");
  completion = (void (**)(id, RAPWebBundleHomeViewController *, uint64_t, _BOOL8))self->_completion;
  if (completion)
    completion[2](completion, self, 1, v3);
}

- (void)_submit
{
  _QWORD *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005D588C;
  v10[3] = &unk_1011AD260;
  objc_copyWeak(&v11, &location);
  v3 = objc_retainBlock(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](self, "webBundleQuestion"));
  if (objc_msgSend(v4, "isAnonymous"))
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
    v6 = objc_msgSend(v5, "inChina");

    if ((v6 & 1) == 0)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1005D59F4;
      v7[3] = &unk_1011BD1E0;
      objc_copyWeak(&v9, &location);
      v8 = v3;
      +[RAPPrivacy performPrivacyCheckWithAppearance:completion:](RAPPrivacy, "performPrivacyCheckWithAppearance:completion:", 4, v7);

      objc_destroyWeak(&v9);
      goto LABEL_6;
    }
  }
  ((void (*)(_QWORD *))v3[2])(v3);
LABEL_6:

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setupViews
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  -[RAPWebBundleHomeViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("RAPHomeView"));
  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_dismiss");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHomeViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[RAP Web UI] Send"), CFSTR("localized string not found"), 0));
  v8 = objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 2, self, "_submit");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHomeViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHomeViewController _headerTitle](self, "_headerTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHomeViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v11, "setTitle:", v10);

  v12.receiver = self;
  v12.super_class = (Class)RAPWebBundleHomeViewController;
  -[RAPWebBundleBaseViewController setupViews](&v12, "setupViews");
}

- (id)_headerTitle
{
  void *v2;
  id v3;
  int BOOL;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](self, "webBundleQuestion"));
  v3 = objc_msgSend(v2, "questionType");

  switch((unint64_t)v3)
  {
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 0x1CuLL:
      BOOL = GEOConfigGetBOOL(MapKitConfig_RAPFlowReportSomethingMissing[0], MapKitConfig_RAPFlowReportSomethingMissing[1]);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      if (BOOL)
        v7 = CFSTR("[RAP Web UI] Report Something Missing");
      else
        v7 = CFSTR("[RAP Web UI] Add to Maps");
      break;
    case 0xDuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("[RAP Web UI] Add Address");
      break;
    case 0xEuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("[RAP Web UI] Add Hours");
      break;
    case 0xFuLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("[RAP Web UI] Add Phone Number");
      break;
    case 0x10uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("[RAP Web UI] Add Website");
      break;
    default:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("[RAP Web UI] Report an Issue");
      break;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

  return v8;
}

- (void)_uploadForm:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  RAPReport *report;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  RAPWebBundleHomeViewController *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](self, "webBundleQuestion"));
  objc_msgSend(v5, "setDynamicForm:", v4);
  v6 = sub_10085876C();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_initWeak(&location, self);
  report = self->_report;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005D5E88;
  v15[3] = &unk_1011B03B8;
  objc_copyWeak(&v17, &location);
  v9 = v7;
  v16 = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005D5F44;
  v11[3] = &unk_1011B08D0;
  objc_copyWeak(&v14, &location);
  v10 = v9;
  v12 = v10;
  v13 = self;
  -[RAPReport submitWithPrivacyRequestHandler:willStartSubmitting:didFinishSubmitting:](report, "submitWithPrivacyRequestHandler:willStartSubmitting:didFinishSubmitting:", &stru_1011BD200, v15, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)didDismissByGesture
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleHomeViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
  v5 = objc_opt_class(UGCCommunityAcknowledgementViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
    -[RAPWebBundleHomeViewController _reportSentWithDismissalGesture:](self, "_reportSentWithDismissalGesture:", 1);
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  id replyHandler;
  void *v23;
  unsigned int v24;
  id v25;
  id v26;
  void *v27;
  ReportAProblemCategoryChooserViewController *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  unsigned int v41;
  id v42;
  id v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  RAPWebBundleDataDrivenViewController *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id location;
  objc_super v54;
  void *v55;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)RAPWebBundleHomeViewController;
  -[RAPWebBundleBaseMapViewController didReceiveMessageFromUserContentController:message:replyHandler:](&v54, "didReceiveMessageFromUserContentController:message:replyHandler:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("context"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("supportedLocales")));
    v14 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
    {
      v15 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));

      v13 = (void *)v15;
    }
    -[RAPWebBundleHomeViewController _contextFromQuestionWithLocales:withReplyHandler:](self, "_contextFromQuestionWithLocales:withReplyHandler:", v13, v10);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("setValid"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController delegate](self, "delegate"));
      objc_msgSend(v18, "enableDismissByGesture:", 0);

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("getAddress"));

      if (v20)
      {
        v21 = objc_retainBlock(v10);
        replyHandler = self->_replyHandler;
        self->_replyHandler = v21;

        -[RAPWebBundleHomeViewController _presentAddressUI](self, "_presentAddressUI");
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("getCategories"));

        if (v24)
        {
          v25 = objc_retainBlock(v10);
          v26 = self->_replyHandler;
          self->_replyHandler = v25;

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("categories")));
          v28 = -[ReportAProblemCategoryChooserViewController initWithPresentationStyle:selectedCategoryNames:]([ReportAProblemCategoryChooserViewController alloc], "initWithPresentationStyle:selectedCategoryNames:", 1, v27);
          -[ReportAProblemCategoryChooserViewController setChooserDelegate:](v28, "setChooserDelegate:", self);
          -[RAPWebBundleBaseViewController presentAccessoryViewController:](self, "presentAccessoryViewController:", v28);

        }
        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
          v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("showPoi"));

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id")));
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v31, "unsignedLongLongValue")));

            v33 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
            v55 = v32;
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "defaultTraits"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "ticketForMUIDs:traits:", v34, v36));

            objc_initWeak(&location, self);
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_1005D6840;
            v50[3] = &unk_1011ADF70;
            objc_copyWeak(&v52, &location);
            v38 = v32;
            v51 = v38;
            v39 = &_dispatch_main_q;
            objc_msgSend(v37, "submitWithHandler:networkActivity:queue:", v50, 0, &_dispatch_main_q);

            objc_destroyWeak(&v52);
            objc_destroyWeak(&location);

          }
          else
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
            v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("getPoi"));

            if (v41)
            {
              v42 = objc_retainBlock(v10);
              v43 = self->_replyHandler;
              self->_replyHandler = v42;

              -[RAPWebBundleHomeViewController _presentContainmentUIIsParentContainment:currentlySelectedMUIDs:](self, "_presentContainmentUIIsParentContainment:currentlySelectedMUIDs:", 0, &__NSArray0__struct);
            }
            else
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
              v45 = objc_msgSend(v44, "hasPrefix:", CFSTR("showModal"));

              if (v45)
              {
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("url")));
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("title")));
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("modalData")));
                v49 = -[RAPWebBundleDataDrivenViewController initWithEntryPoint:report:title:data:replyHandler:]([RAPWebBundleDataDrivenViewController alloc], "initWithEntryPoint:report:title:data:replyHandler:", v46, self->_report, v47, v48, v10);
                -[RAPWebBundleBaseViewController presentAccessoryViewController:](self, "presentAccessoryViewController:", v49);

              }
            }
          }
        }
      }
    }
  }

}

- (void)_presentAddressUI
{
  RAPPlaceCorrectableAddress *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](self, "webBundleQuestion"));
  v3 = [RAPPlaceCorrectableAddress alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reportedPlace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  v6 = -[RAPPlaceCorrectableAddress _initWithMapItem:](v3, "_initWithMapItem:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "freeformAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSearchAutocompleteViewController addressAutocompleteViewControllerWithInitialSearchString:](RAPSearchAutocompleteViewController, "addressAutocompleteViewControllerWithInitialSearchString:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](self, "webBundleQuestion"));
  v11 = (char *)objc_msgSend(v10, "questionType");

  if ((unint64_t)(v11 - 2) < 5 || v11 == (char *)28)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = v12;
    v14 = CFSTR("Add Address [RAP]");
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = v12;
    v14 = CFSTR("Change Address [RAP]");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, CFSTR("localized string not found"), 0));
  objc_msgSend(v9, "setTitleText:", v15);

  -[RAPWebBundleHomeViewController _presentAutocompleteViewController:forItemKind:](self, "_presentAutocompleteViewController:forItemKind:", v9, 0);
}

- (void)_contextFromQuestionWithLocales:(id)a3 withReplyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](self, "webBundleQuestion"));
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005D6C04;
  v10[3] = &unk_1011BD250;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "retrieveContextwithLocales:contextCompletion:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_presentContainmentUIIsParentContainment:(BOOL)a3 currentlySelectedMUIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webBundleQuestion](self, "webBundleQuestion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "report"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapCamera"));
  objc_msgSend(v9, "centerCoordinate");
  v11 = v10;
  v13 = v12;

  v14 = GEOCoordinateRegionMakeWithDistance(v11, v13, 50.0, 50.0);
  v21 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithCoordinateRegion:", v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSearchAutocompleteViewController poiAutocompleteViewControllerWithBoundedMapRegion:excludedMUIDs:](RAPSearchAutocompleteViewController, "poiAutocompleteViewControllerWithBoundedMapRegion:excludedMUIDs:", v21, v5));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Choose a Place [RAP]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v18, "setTitleText:", v20);

  -[RAPWebBundleHomeViewController _presentAutocompleteViewController:forItemKind:](self, "_presentAutocompleteViewController:forItemKind:", v18, 1);
}

- (void)_presentAutocompleteViewController:(id)a3 forItemKind:(int64_t)a4
{
  id v5;

  self->_currentAutocompleteSelectionKind = a4;
  v5 = a3;
  objc_msgSend(v5, "setDelegate:", self);
  -[RAPWebBundleBaseViewController presentAccessoryViewController:](self, "presentAccessoryViewController:", v5);

}

- (void)rapSearchAutocompleteViewController:(id)a3 finishedPickingAutocompleteResult:(id)a4 isAutocompleteResult:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  int64_t currentAutocompleteSelectionKind;
  void *v12;
  RAPWebBundleImageContext *v13;
  void *v14;
  void *v15;
  UIImage *v16;
  NSData *v17;
  void *v18;
  void *v19;
  void *v20;
  RAPWebBundlePlaceSummaryContext *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void (**replyHandler)(id, void *, _QWORD);
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  RAPPlaceCorrectableAddress *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void (**v42)(id, void *, _QWORD);
  void *v43;
  void *v44;
  id v45;
  UIImage *v46;
  id v47;
  __CFString *v48;
  const __CFString *v49;
  void *v50;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  currentAutocompleteSelectionKind = self->_currentAutocompleteSelectionKind;
  if (currentAutocompleteSelectionKind)
  {
    if (currentAutocompleteSelectionKind == 1)
    {
      v47 = v8;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedMapItem"));
      v13 = objc_alloc_init(RAPWebBundleImageContext);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_styleAttributes"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v15, "scale");
      v16 = (UIImage *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v14, 3, 0));

      v17 = UIImagePNGRepresentation(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      -[RAPWebBundleImageContext setImage:](v13, "setImage:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v12, "_muid")));
      -[RAPWebBundleImageContext setIdentifier:](v13, "setIdentifier:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleImageContext identifier](v13, "identifier"));
      v46 = v16;
      -[RAPWebBundleBaseViewController saveImage:withIdentifier:](self, "saveImage:withIdentifier:", v16, v20);

      v21 = objc_alloc_init(RAPWebBundlePlaceSummaryContext);
      -[RAPWebBundlePlaceSummaryContext setIdentifier:](v21, "setIdentifier:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      -[RAPWebBundlePlaceSummaryContext setTitle:](v21, "setTitle:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_addressFormattedAsShortenedAddress"));
      -[RAPWebBundlePlaceSummaryContext setSubtitle:](v21, "setSubtitle:", v23);

      v24 = -[RAPPlaceCorrectableAddress _initWithMapItem:]([RAPPlaceCorrectableAddress alloc], "_initWithMapItem:", v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "freeformAddress"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value"));
      -[RAPWebBundlePlaceSummaryContext setAddress:](v21, "setAddress:", v26);

      -[RAPWebBundlePlaceSummaryContext setImageContext:](v21, "setImageContext:", v13);
      replyHandler = (void (**)(id, void *, _QWORD))self->_replyHandler;
      if (replyHandler)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext context](v21, "context"));
        replyHandler[2](replyHandler, v28, 0);

        v29 = self->_replyHandler;
        self->_replyHandler = 0;

      }
      v8 = v47;
    }
  }
  else
  {
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchBarText"));
    v31 = (void *)v30;
    v32 = &stru_1011EB268;
    if (v30)
      v32 = (__CFString *)v30;
    v33 = v32;

    if (v5)
    {
      v34 = [RAPPlaceCorrectableAddress alloc];
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedMapItem"));
      v36 = -[RAPPlaceCorrectableAddress _initWithMapItem:](v34, "_initWithMapItem:", v35);

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "freeformAddress"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "value"));
      v39 = objc_msgSend(v38, "length");

      if (v39)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "freeformAddress"));
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "value"));

        v33 = (__CFString *)v41;
      }

    }
    v42 = (void (**)(id, void *, _QWORD))self->_replyHandler;
    if (v42)
    {
      v48 = v33;
      v49 = CFSTR("formattedAddress");
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
      v50 = v43;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
      v42[2](v42, v44, 0);

      v45 = self->_replyHandler;
      self->_replyHandler = 0;

    }
  }

}

- (void)rapSearchAutocompleteViewControllerDidCancel:(id)a3
{
  +[RAPAnalyticsManager captureRAPCancelSearchActionFromReport:](RAPAnalyticsManager, "captureRAPCancelSearchActionFromReport:", self->_report);
}

- (void)categoryChooserViewController:(id)a3 didReceiveSelectedCategories:(id)a4
{
  void (**replyHandler)(id, void *, _QWORD);
  id v6;
  void *v7;
  id v8;
  const __CFString *v9;
  id v10;

  replyHandler = (void (**)(id, void *, _QWORD))self->_replyHandler;
  if (replyHandler)
  {
    v9 = CFSTR("categories");
    v10 = a4;
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    replyHandler[2](replyHandler, v7, 0);

    v8 = self->_replyHandler;
    self->_replyHandler = 0;

  }
}

- (void)categoryChooserViewController:(id)a3 categoriesDidNotChange:(id)a4
{
  void (**replyHandler)(id, void *, _QWORD);
  id v6;
  void *v7;
  id v8;
  const __CFString *v9;
  id v10;

  replyHandler = (void (**)(id, void *, _QWORD))self->_replyHandler;
  if (replyHandler)
  {
    v9 = CFSTR("categories");
    v10 = a4;
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    replyHandler[2](replyHandler, v7, 0);

    v8 = self->_replyHandler;
    self->_replyHandler = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
