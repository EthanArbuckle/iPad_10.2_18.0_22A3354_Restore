@implementation ParkedCarLocationRefinementViewController

- (ParkedCarLocationRefinementViewController)initWithCamera:(id)a3 parkedCar:(id)a4
{
  id v7;
  ParkedCarLocationRefinementViewController *v8;
  ParkedCarLocationRefinementViewController *v9;
  ParkedCarLocationRefinementViewController *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ParkedCarLocationRefinementViewController;
  v8 = -[LocationRefinementViewController initWithCamera:crosshairType:](&v12, "initWithCamera:crosshairType:", a3, 4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parkedCar, a4);
    v10 = v9;
  }

  return v9;
}

- (ParkedCarLocationRefinementViewController)initWithCamera:(id)a3 crosshairType:(unint64_t)a4
{
  return -[ParkedCarLocationRefinementViewController initWithCamera:parkedCar:](self, "initWithCamera:parkedCar:", a3, 0);
}

- (void)viewDidLoad
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  MKMarkerAnnotationView *v15;
  MKMarkerAnnotationView *annotationView;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ParkedCarLocationRefinementViewController;
  -[LocationRefinementViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  if (v4)
    v5 = 0;
  else
    v5 = 2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  objc_msgSend(v6, "setMapType:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Parked Car [Location Refinement]"), CFSTR("localized string not found"), 0));
  -[ParkedCarLocationRefinementViewController setTitle:](self, "setTitle:", v8);

  v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancel:");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarLocationRefinementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "setLeftBarButtonItem:", v9);

  v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_done:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarLocationRefinementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v12, "setRightBarButtonItem:", v11);

  v13 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v13, "configureWithDefaultBackground");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarLocationRefinementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v14, "setScrollEdgeAppearance:", v13);

  v15 = (MKMarkerAnnotationView *)objc_msgSend(objc_alloc((Class)MKMarkerAnnotationView), "initWithAnnotation:reuseIdentifier:", 0, 0);
  annotationView = self->_annotationView;
  self->_annotationView = v15;

  -[MKMarkerAnnotationView setHidden:](self->_annotationView, "setHidden:", 1);
  -[MKMarkerAnnotationView setSelected:](self->_annotationView, "setSelected:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarLocationRefinementViewController view](self, "view"));
  objc_msgSend(v17, "addSubview:", self->_annotationView);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ParkedCar_LocationRefinement_Instructions"), CFSTR("localized string not found"), 0));
  -[LocationRefinementViewController setInstructionsText:](self, "setInstructionsText:", v19);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGImage *v16;
  CGFloat v17;
  CGImage *v18;
  void *v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)ParkedCarLocationRefinementViewController;
  -[LocationRefinementViewController viewWillAppear:](&v20, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarLocationRefinementViewController presentingViewController](self, "presentingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes parkedCarStyleAttributes](GEOFeatureStyleAttributes, "parkedCarStyleAttributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes styleAttributesForCalloutWithAttributes:](GEOFeatureStyleAttributes, "styleAttributesForCalloutWithAttributes:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_mapLayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "iconForStyleAttributes:contentScale:size:transparent:", v11, 8, 1, v9));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v14, "fillColor")));
    -[MKMarkerAnnotationView setMarkerTintColor:](self->_annotationView, "setMarkerTintColor:", v15);

    v16 = CGImageRetain((CGImageRef)objc_msgSend(v14, "image"));
    v17 = ((double)CGImageGetWidth(v16) + v9 * -40.0) * 0.5;
    v21.origin.y = ((double)CGImageGetHeight(v16) + v9 * -40.0) * 0.5;
    v21.size.width = v9 * 40.0;
    v21.origin.x = v17;
    v21.size.height = v9 * 40.0;
    v18 = CGImageCreateWithImageInRect(v16, v21);
    CGImageRelease(v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v18, 0, v9));
    -[MKMarkerAnnotationView setGlyphImage:](self->_annotationView, "setGlyphImage:", v19);

    CGImageRelease(v18);
    -[MKMarkerAnnotationView prepareForDisplay](self->_annotationView, "prepareForDisplay");
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double MaxY;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double MidX;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  if (-[LocationRefinementViewController needsInitialCameraPosition](self, "needsInitialCameraPosition"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController instructionsContainer](self, "instructionsContainer"));
    objc_msgSend(v3, "frame");
    MaxY = CGRectGetMaxY(v28);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v5, "frame");
    v6 = MaxY - CGRectGetMinY(v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v7, "_setEdgeInsets:", v6, 0.0, 0.0, 0.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
    objc_msgSend(v17, "_edgeInsets");
    v19 = v10 + v18;
    v21 = v12 + v20;
    v23 = v14 - (v18 + v22);
    v25 = v16 - (v20 + v24);

    v30.origin.x = v19;
    v30.origin.y = v21;
    v30.size.width = v23;
    v30.size.height = v25;
    MidX = CGRectGetMidX(v30);
    v31.origin.x = v19;
    v31.origin.y = v21;
    v31.size.width = v23;
    v31.size.height = v25;
    -[MKMarkerAnnotationView setCenter:](self->_annotationView, "setCenter:", MidX, CGRectGetMidY(v31));
    -[MKMarkerAnnotationView setHidden:](self->_annotationView, "setHidden:", 0);
  }
  v27.receiver = self;
  v27.super_class = (Class)ParkedCarLocationRefinementViewController;
  -[LocationRefinementViewController viewDidLayoutSubviews](&v27, "viewDidLayoutSubviews");
}

- (void)_done:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 17, 623, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  -[MKMarkerAnnotationView center](self->_annotationView, "center");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarLocationRefinementViewController view](self, "view"));
  objc_msgSend(v5, "convertPoint:toCoordinateFromView:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController delegate](self, "delegate"));
  objc_msgSend(v15, "locationRefinementViewController:didSelectCoordinate:", self, v12, v14);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarLocationRefinementViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_cancel:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 18, 623, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarLocationRefinementViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_annotationView, 0);
  objc_storeStrong((id *)&self->_parkedCar, 0);
}

@end
