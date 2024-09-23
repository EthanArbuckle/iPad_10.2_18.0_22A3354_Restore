@implementation PrintController

- (PrintController)initWithMapView:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PrintController *v9;
  PrintController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PrintController;
  v9 = -[PrintController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapView, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (BOOL)isPrinting
{
  return self->_printTaskBackgroundIdentifier != UIBackgroundTaskInvalid;
}

- (BOOL)_isInBackground
{
  void *v2;
  id v3;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "applicationState");

  if (v3 != (id)1)
    return v3 == (id)2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "isSuspendedUnderLock");

  return v6;
}

- (void)_endBackgroundTask
{
  void *v3;
  void *v4;

  if (-[PrintController isPrinting](self, "isPrinting"))
  {
    if (-[PrintController _isInBackground](self, "_isInBackground"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "delegate"));
      objc_msgSend(v3, "sendDidEnterBackgroundNotification");

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v4, "endBackgroundTask:", self->_printTaskBackgroundIdentifier);

    self->_printTaskBackgroundIdentifier = UIBackgroundTaskInvalid;
  }
}

- (id)_printControllerForRoute:(id)a3 searchString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PrintController _printInfoForSearchString:route:title:](self, "_printInfoForSearchString:route:title:", v6, v7, 0));

  objc_msgSend(v8, "setPrintInfo:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PrintController _rendererForRoute:](self, "_rendererForRoute:", v7));

  objc_msgSend(v8, "setPrintPageRenderer:", v10);
  return v8;
}

- (id)_printControllerForSearchString:(id)a3 searchResults:(id)a4 title:(id)a5 subTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PrintController _printInfoForSearchString:route:title:](self, "_printInfoForSearchString:route:title:", v13, 0, v11));

  objc_msgSend(v14, "setPrintInfo:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PrintController _rendererForSearchResults:title:subTitle:](self, "_rendererForSearchResults:title:subTitle:", v12, v11, v10));

  objc_msgSend(v14, "setPrintPageRenderer:", v16);
  return v14;
}

- (void)printRoute:(id)a3 searchString:(id)a4
{
  UIPrintInteractionController *v5;
  UIPrintInteractionController *pic;

  v5 = (UIPrintInteractionController *)objc_claimAutoreleasedReturnValue(-[PrintController _printControllerForRoute:searchString:](self, "_printControllerForRoute:searchString:", a3, a4));
  pic = self->_pic;
  self->_pic = v5;

  -[PrintController _print:](self, "_print:", self->_pic);
}

- (void)_print:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[5];

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003C8144;
  v17[3] = &unk_1011B4418;
  v17[4] = self;
  v5 = objc_retainBlock(v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "popoverPresentationRectForPrintController:", self);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(v4, "presentFromRect:inView:animated:completionHandler:", self->_presentationView, 1, v5, v10, v12, v14, v16);
    self->_isShowingPopover = 1;
  }
  else
  {
    objc_msgSend(v4, "presentAnimated:completionHandler:", 1, v5);
  }

}

- (void)printSearchString:(id)a3 searchResults:(id)a4 title:(id)a5 subTitle:(id)a6
{
  UIPrintInteractionController *v7;
  UIPrintInteractionController *pic;

  v7 = (UIPrintInteractionController *)objc_claimAutoreleasedReturnValue(-[PrintController _printControllerForSearchString:searchResults:title:subTitle:](self, "_printControllerForSearchString:searchResults:title:subTitle:", a3, a4, a5, a6));
  pic = self->_pic;
  self->_pic = v7;

  -[PrintController _print:](self, "_print:", self->_pic);
}

- (void)print
{
  -[PrintController _print:](self, "_print:", self->_pic);
}

- (void)orientationWillChange
{
  void *v3;
  void *v4;
  id v5;
  _BOOL4 isShowingPopover;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)1)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != (id)5)
      return;
  }
  isShowingPopover = self->_isShowingPopover;
  self->_shouldShowPopoverAfterOrientationChange = isShowingPopover;
  if (isShowingPopover)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[UIPrintInteractionController printPageRenderer](self->_pic, "printPageRenderer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
    objc_msgSend(v7, "dismissAnimated:", 0);

    -[UIPrintInteractionController setPrintPageRenderer:](self->_pic, "setPrintPageRenderer:", v8);
  }
}

- (void)orientationDidChange
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)1)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != (id)5)
      return;
  }
  if (self->_shouldShowPopoverAfterOrientationChange)
    -[PrintController print](self, "print");
}

- (id)mapRegion:(id)a3 insetLat:(double)a4 insetLng:(double)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v7 = a3;
  v8 = objc_alloc_init((Class)GEOMapRegion);
  objc_msgSend(v7, "southLat");
  v9 = a4 * 0.5;
  v11 = v9 + v10;
  v12 = -90.0;
  if (v11 > -90.0)
  {
    objc_msgSend(v7, "southLat");
    v12 = v9 + v13;
  }
  objc_msgSend(v8, "setSouthLat:", v12);
  objc_msgSend(v7, "northLat");
  v15 = v14 - v9;
  v16 = 90.0;
  if (v15 < 90.0)
  {
    objc_msgSend(v7, "northLat");
    v16 = v17 - v9;
  }
  objc_msgSend(v8, "setNorthLat:", v16);
  objc_msgSend(v7, "westLng");
  v18 = a5 * 0.5;
  v20 = v18 + v19;
  v21 = -180.0;
  if (v20 > -180.0)
  {
    objc_msgSend(v7, "westLng");
    v21 = v18 + v22;
  }
  objc_msgSend(v8, "setWestLng:", v21);
  objc_msgSend(v7, "eastLng");
  v24 = v23 - v18;
  v25 = 180.0;
  if (v24 < 180.0)
  {
    objc_msgSend(v7, "eastLng");
    v25 = v26 - v18;
  }
  objc_msgSend(v8, "setEastLng:", v25);

  return v8;
}

- (BOOL)_searchResults:(id)a3 areFarAwayFromView:(id)a4
{
  id v5;
  double x;
  double y;
  double width;
  double height;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  CLLocationCoordinate2D v22;
  MKMapPoint v23;
  MKMapRect v24;
  MKMapRect v25;
  MKMapRect v26;

  v5 = a3;
  objc_msgSend(a4, "visibleMapRect");
  v25 = MKMapRectInset(v24, -v24.size.width, -v24.size.height);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "coordinate", (_QWORD)v17);
        v23 = MKMapPointForCoordinate(v22);
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        if (MKMapRectContainsPoint(v26, v23))
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (id)_rendererForRoute:(id)a3
{
  id v4;
  MapRoutePageRenderer *v5;

  v4 = a3;
  v5 = -[MapRoutePageRenderer initWithRoute:mapView:]([MapRoutePageRenderer alloc], "initWithRoute:mapView:", v4, self->_mapView);

  return v5;
}

- (id)_rendererForSearchResults:(id)a3 title:(id)a4 subTitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  SearchResultsPageRenderer *v11;
  SearchResultsPageRenderer *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count")
    && !-[PrintController _searchResults:areFarAwayFromView:](self, "_searchResults:areFarAwayFromView:", v8, self->_mapView))
  {
    v11 = -[SearchResultsPageRenderer initWithSearchResults:title:subTitle:mapView:]([SearchResultsPageRenderer alloc], "initWithSearchResults:title:subTitle:mapView:", v8, v9, v10, self->_mapView);
  }
  else
  {
    v11 = -[SimpleMapPageRenderer initWithMapView:]([SimpleMapPageRenderer alloc], "initWithMapView:", self->_mapView);
  }
  v12 = v11;

  return v12;
}

- (id)_printInfoForSearchString:(id)a3 route:(id)a4 title:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInfo printInfo](UIPrintInfo, "printInfo"));
  objc_msgSend(v7, "setOutputType:", 0);
  objc_msgSend(v7, "setOrientation:", 1);
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if (a4)
      v10 = CFSTR("Directions Title [Printing]");
    else
      v10 = CFSTR("Search Result Title [Printing]");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v6));
    objc_msgSend(v7, "setJobName:", v14);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v11;
    if (a4)
      v12 = CFSTR("PrintController_Directions");
    else
      v12 = CFSTR("PrintController_Untitled");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v12, CFSTR("localized string not found"), 0));
    objc_msgSend(v7, "setJobName:", v13);
  }

  return v7;
}

- (void)printInteractionControllerDidPresentPrinterOptions:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "printControllerDidPresentPrinterOptions:", self);

}

- (void)printInteractionControllerWillStartJob:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003C88E0;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  self->_printTaskBackgroundIdentifier = (unint64_t)objc_msgSend(v4, "beginBackgroundTaskWithExpirationHandler:", v5);

}

- (void)printInteractionControllerDidFinishJob:(id)a3
{
  -[PrintController _endBackgroundTask](self, "_endBackgroundTask", a3);
}

- (PrintControllerDelegate)delegate
{
  return (PrintControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (UIView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pic, 0);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
