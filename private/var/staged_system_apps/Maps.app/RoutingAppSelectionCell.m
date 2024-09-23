@implementation RoutingAppSelectionCell

+ (id)sharedLockupViewGroup
{
  if (qword_1014D30F8 != -1)
    dispatch_once(&qword_1014D30F8, &stru_1011C58B8);
  return (id)qword_1014D30F0;
}

- (RoutingAppSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RoutingAppSelectionCell *v4;
  RoutingAppSelectionCell *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RoutingAppSelectionCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v18, "initWithStyle:reuseIdentifier:", 0, a4);
  v5 = v4;
  if (v4)
  {
    -[RoutingAppSelectionCell setBackgroundView:](v4, "setBackgroundView:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[RoutingAppSelectionCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = objc_alloc((Class)ASCLockupView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell contentView](v5, "contentView"));
    objc_msgSend(v8, "bounds");
    v9 = objc_msgSend(v7, "initWithFrame:");

    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setDelegate:", v5);
    v10 = objc_msgSend((id)objc_opt_class(v5), "sharedLockupViewGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "setGroup:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell contentView](v5, "contentView"));
    objc_msgSend(v12, "addSubview:", v9);

    -[RoutingAppSelectionCell setLockupView:](v5, "setLockupView:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell contentView](v5, "contentView"));
    LODWORD(v14) = 1148846080;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v13, 10.0, 16.0, 10.0, 16.0, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  return v5;
}

- (void)prepareForReuse
{
  GEOAppleMediaServicesResult *appStoreApp;
  LSApplicationProxy *appProxy;
  ASCLockupRequest *request;
  ASCLockup *lockup;
  void *v7;
  objc_super v8;

  appStoreApp = self->_appStoreApp;
  self->_appStoreApp = 0;

  appProxy = self->_appProxy;
  self->_appProxy = 0;

  request = self->_request;
  self->_request = 0;

  lockup = self->_lockup;
  self->_lockup = 0;

  -[ASCLockupView setRequest:](self->_lockupView, "setRequest:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell _dummyLockup](self, "_dummyLockup"));
  -[ASCLockupView setLockup:](self->_lockupView, "setLockup:", v7);

  -[ASCLockupView setAutomaticallyPresentsProductDetails:](self->_lockupView, "setAutomaticallyPresentsProductDetails:", 0);
  v8.receiver = self;
  v8.super_class = (Class)RoutingAppSelectionCell;
  -[RoutingAppSelectionCell prepareForReuse](&v8, "prepareForReuse");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell lockupView](self, "lockupView", a3.width, a3.height));
  objc_msgSend(v6, "sizeThatFits:", width, 1.79769313e308);
  v8 = v7;

  v9 = v8 + 20.0;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setAppStoreApp:(id)a3
{
  id v5;
  GEOAppleMediaServicesResult *appStoreApp;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;

  v5 = a3;
  appStoreApp = self->_appStoreApp;
  v10 = (unint64_t)v5;
  v7 = appStoreApp;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v10, "isEqual:", v7);

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_appStoreApp, a3);
      -[RoutingAppSelectionCell _updateContent](self, "_updateContent");
      v8 = (void *)v10;
    }
  }

}

- (void)setAppProxy:(id)a3
{
  id v5;
  LSApplicationProxy *appProxy;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;

  v5 = a3;
  appProxy = self->_appProxy;
  v10 = (unint64_t)v5;
  v7 = appProxy;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v10, "isEqual:", v7);

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_appProxy, a3);
      -[RoutingAppSelectionCell _updateContent](self, "_updateContent");
      v8 = (void *)v10;
    }
  }

}

- (void)setIntendedTransportType:(int64_t)a3
{
  if (self->_intendedTransportType != a3)
  {
    self->_intendedTransportType = a3;
    -[RoutingAppSelectionCell _updateContent](self, "_updateContent");
  }
}

- (void)_route
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "routingAppSelectionCellRoutePressed:", self);

}

- (void)_updateContent
{
  void *v3;
  void *v4;
  ASCLockup *v5;
  ASCLockup *lockup;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  ASCLockup *v15;
  ASCLockup *v16;
  id v17;
  void *v18;
  ASCLockupRequest *v19;
  ASCLockupRequest *request;
  _QWORD v21[4];
  id v22;
  RoutingAppSelectionCell *v23;

  if (self->_lockup)
  {
    -[ASCLockupView setLockup:](self->_lockupView, "setLockup:");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell appProxy](self, "appProxy"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell appProxy](self, "appProxy"));
      v5 = (ASCLockup *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell _lockupWithAppProxy:appIcon:](self, "_lockupWithAppProxy:appIcon:", v4, 0));
      lockup = self->_lockup;
      self->_lockup = v5;

      -[ASCLockupView setLockup:](self->_lockupView, "setLockup:", self->_lockup);
      -[ASCLockupView setAutomaticallyPresentsProductDetails:](self->_lockupView, "setAutomaticallyPresentsProductDetails:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell appProxy](self, "appProxy"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell appProxy](self, "appProxy"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10075A40C;
      v21[3] = &unk_1011BB6C8;
      v22 = v8;
      v23 = self;
      v12 = v8;
      objc_msgSend(v9, "getImageForAppIcon:format:completion:", v11, 2, v21);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell appStoreApp](self, "appStoreApp"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell appStoreApp](self, "appStoreApp"));
        v15 = (ASCLockup *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell _lockupWithAppStoreApp:](self, "_lockupWithAppStoreApp:", v14));
        v16 = self->_lockup;
        self->_lockup = v15;

        if (!self->_request)
        {
          v17 = objc_alloc((Class)ASCLockupRequest);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup id](self->_lockup, "id"));
          v19 = (ASCLockupRequest *)objc_msgSend(v17, "initWithID:kind:context:", v18, ASCLockupKindApp, ASCLockupContextStandard);
          request = self->_request;
          self->_request = v19;

          -[ASCLockupView setRequest:](self->_lockupView, "setRequest:", self->_request);
        }
        -[ASCLockupView setLockup:](self->_lockupView, "setLockup:", self->_lockup);
        -[ASCLockupView setAutomaticallyPresentsProductDetails:](self->_lockupView, "setAutomaticallyPresentsProductDetails:", 1);
      }
    }
  }
}

- (id)_lockupWithAppProxy:(id)a3 appIcon:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v25 = objc_msgSend(objc_alloc((Class)ASCAdamID), "initWithStringValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsModes"));
  v10 = objc_msgSend((id)objc_opt_class(self), "_labelForRoutingModeKeys:intendedTransportType:", v9, self->_intendedTransportType);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "string"));

  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Open [Routing App, Cell]"), CFSTR("localized string not found"), 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ASCOfferMetadata textMetadataWithTitle:subtitle:](ASCOfferMetadata, "textMetadataWithTitle:subtitle:", v14, 0));
  v24 = (void *)v8;

  v16 = objc_alloc((Class)ASCLocalOffer);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10075A760;
  v26[3] = &unk_1011AD260;
  objc_copyWeak(&v27, &location);
  v17 = objc_msgSend(v16, "initWithMetadata:action:", v15, v26);
  v18 = objc_alloc((Class)ASCLockup);
  if (v7)
    v19 = objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell _artworkWithUIImage:](self, "_artworkWithUIImage:", v7));
  else
    v19 = objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell _dummyArtwork](self, "_dummyArtwork"));
  v20 = (void *)v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedName"));
  v22 = objc_msgSend(v18, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:", v25, ASCLockupKindApp, 0, v20, 0, v21, v12, 0, v17);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v22;
}

- (id)_lockupWithAppStoreApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "integerValue")));

  v7 = objc_msgSend(objc_alloc((Class)ASCAdamID), "initWithNumberValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitModes"));
  v9 = objc_msgSend((id)objc_opt_class(self), "_labelForRoutingModeKeys:intendedTransportType:", v8, self->_intendedTransportType);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_alloc((Class)ASCLockup);
  v12 = ASCLockupKindApp;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell _dummyArtwork](self, "_dummyArtwork"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "string"));
  v16 = objc_msgSend(v11, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:", v7, v12, 0, v13, 0, v14, v15, 0, 0);

  return v16;
}

- (id)_lockupByAddingRoutingModes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell appStoreApp](self, "appStoreApp"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitModes"));

  v6 = objc_msgSend((id)objc_opt_class(self), "_labelForRoutingModeKeys:intendedTransportType:", v20, self->_intendedTransportType);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v18 = objc_alloc((Class)ASCLockup);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kind"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "icon"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heading"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ageRating"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "offer"));

  v16 = objc_msgSend(v18, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:", v7, v8, v9, v10, v11, v12, v13, v14, v15);
  return v16;
}

- (id)_dummyLockup
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)ASCLockup);
  v4 = objc_msgSend(objc_alloc((Class)ASCAdamID), "initWithInt64:", 0);
  v5 = ASCLockupKindApp;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell _dummyArtwork](self, "_dummyArtwork"));
  v7 = objc_msgSend(v3, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:", v4, v5, 0, v6, 0, 0, 0, 0, 0);

  return v7;
}

- (id)_dummyArtwork
{
  id v2;

  v2 = objc_alloc((Class)ASCArtwork);
  return objc_msgSend(v2, "initWithURLTemplate:width:height:decoration:preferredCrop:preferredFormat:", &stru_1011EB268, ASCArtworkDecorationRoundedRect, ASCArtworkCropBoundingBox, ASCArtworkFormatPNG, 0.0, 0.0);
}

- (id)_artworkWithUIImage:(id)a3
{
  NSData *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = UIImagePNGRepresentation((UIImage *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("data:image/png;base64,%@"),
                   v5));
  v7 = objc_alloc((Class)ASCArtwork);
  v8 = objc_msgSend(v7, "initWithURLTemplate:width:height:decoration:preferredCrop:preferredFormat:", v6, ASCArtworkDecorationRoundedRect, ASCArtworkCropBoundingBox, ASCArtworkFormatPNG, 0.0, 0.0);

  return v8;
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4;
  ASCLockupRequest *request;
  ASCLockupRequest *v6;
  void *v7;
  void *v8;
  ASCLockup *v9;
  ASCLockup *lockup;
  id v11;

  v4 = a3;
  request = self->_request;
  v11 = v4;
  v6 = (ASCLockupRequest *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));

  if (request == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lockup"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionCell _lockupByAddingRoutingModes:](self, "_lockupByAddingRoutingModes:", v7));
    objc_msgSend(v11, "setLockup:", v8);

    v9 = (ASCLockup *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lockup"));
    lockup = self->_lockup;
    self->_lockup = v9;

  }
}

+ (id)_labelForRoutingMode:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1014D3100;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D3100, &stru_1011C58D8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3108, "objectForKeyedSubscript:", v4));

  return v5;
}

+ (id)_labelForRoutingModeKeys:(id)a3 intendedTransportType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  id v36;
  uint64_t v37;
  void *v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _BYTE v49[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_preferredModesForTransportType:", a4));
  if (objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10075BC64;
    v46[3] = &unk_1011C5900;
    v47 = v7;
    v48 = v6;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingComparator:", v46));

  }
  v8 = objc_msgSend(v6, "count");
  if (v8 == (id)1)
  {
    v13 = objc_alloc((Class)NSAttributedString);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_labelForRoutingMode:", v11));
    v15 = v13;
    goto LABEL_30;
  }
  v9 = (unint64_t)v8;
  if (v8)
  {
    v41 = v7;
    if ((unint64_t)v8 >= 3)
      v16 = 3;
    else
      v16 = (uint64_t)v8;
    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v16);
    for (i = 0; i != v16; ++i)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", i));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_labelForRoutingMode:", v18));
      if (v19)
        objc_msgSend(v11, "addObject:", v19);
      else
        NSLog(CFSTR("Warning: %@ is an unrecognized routing mode key."), v18);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("RoutingModeCommaJoin"), CFSTR("localized string not found"), 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", v21));

    if (v9 > 3)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("RoutingContinuationEllipsis"), CFSTR("localized string not found"), 0));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", v23));

      v14 = (void *)v24;
    }
    v7 = v41;
    if (objc_msgSend(v41, "count"))
    {
      v40 = v11;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fontDescriptor"));

      v39 = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "fontDescriptorWithSymbolicTraits:", 2));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v27, 0.0));

      v29 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v14);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v30 = v41;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(_QWORD *)v43 != v33)
              objc_enumerationMutation(v30);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_labelForRoutingMode:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j)));
            v36 = objc_msgSend(v14, "rangeOfString:", v35);
            if (v36 != (id)0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v29, "addAttribute:value:range:", NSFontAttributeName, v28, v36, v37);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v32);
      }

      v12 = objc_msgSend(v29, "copy");
      v7 = v41;
      v11 = v40;
      goto LABEL_31;
    }
    v15 = objc_alloc((Class)NSAttributedString);
LABEL_30:
    v12 = objc_msgSend(v15, "initWithString:", v14);
LABEL_31:

    goto LABEL_32;
  }
  v10 = objc_alloc((Class)NSAttributedString);
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_labelForRoutingMode:", CFSTR("other")));
  v12 = objc_msgSend(v10, "initWithString:", v11);
LABEL_32:

  return v12;
}

+ (id)_preferredModesForTransportType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return &__NSArray0__struct;
  else
    return off_1011C5920[a3 - 1];
}

- (RoutingAppSelectionCellDelegate)delegate
{
  return (RoutingAppSelectionCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LSApplicationProxy)appProxy
{
  return self->_appProxy;
}

- (GEOAppleMediaServicesResult)appStoreApp
{
  return self->_appStoreApp;
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
  objc_storeStrong((id *)&self->_lockupView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_appStoreApp, 0);
  objc_storeStrong((id *)&self->_appProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
}

@end
