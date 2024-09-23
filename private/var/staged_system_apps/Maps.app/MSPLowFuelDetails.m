@implementation MSPLowFuelDetails

- (id)initWithMapsSuggestionsEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MSPLowFuelDetails *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("MapsSuggestionsCarPlayEnergyBulletinTitle")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("MapsSuggestionsCarPlayEnergyBulletinSubtitle")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberForKey:", CFSTR("MapsSuggestionsCarPlayEnergyBulletinEngineType")));
  v8 = -[MSPLowFuelDetails initWithTitle:subtitle:engineType:](self, "initWithTitle:subtitle:engineType:", v5, v6, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSPLowFuelDetails _lowFuelImageDataForEngineType:isCarPlay:](v8, "_lowFuelImageDataForEngineType:isCarPlay:", objc_msgSend(v4, "engineType"), 0));
  -[MSPLowFuelDetails setIconData:](v8, "setIconData:", v9);

  v10 = objc_msgSend(v4, "engineType");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSPLowFuelDetails _lowFuelImageDataForEngineType:isCarPlay:](v8, "_lowFuelImageDataForEngineType:isCarPlay:", v10, 1));
  -[MSPLowFuelDetails setIconDataCarPlay:](v8, "setIconDataCarPlay:", v11);

  return v8;
}

- (id)_lowFuelImageDataForEngineType:(int)a3 isCarPlay:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  UIImage *v13;
  UIImage *v14;
  NSData *v15;
  void *v16;
  double y;
  UIImage *ImageFromCurrentImageContext;
  UIImage *v19;
  NSData *v20;
  CGSize v22;

  v4 = a4;
  if (a3 == 1
    || ((a3 >> 1) & 1) + (a3 & 1) + ((a3 >> 2) & 1) + ((a3 >> 3) & 1) >= 2)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes gasStationStyleAttributes](GEOFeatureStyleAttributes, "gasStationStyleAttributes"));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes evChargerStyleAttributes](GEOFeatureStyleAttributes, "evChargerStyleAttributes"));
  }
  v6 = (void *)v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screenTraitCollection"));
    objc_msgSend(v8, "displayScale");
    v10 = v9;

    v11 = 5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    objc_msgSend(v7, "screenScale");
    v10 = v12;
    v11 = 2;
  }

  v13 = (UIImage *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:", v6, v11, 1, 0, 0, v4, v10));
  v14 = v13;
  if (v4)
  {
    v15 = UIImagePNGRepresentation(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }
  else
  {
    y = CGPointZero.y;
    v22.width = 20.0;
    v22.height = 20.0;
    UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
    -[UIImage drawInRect:](v14, "drawInRect:", CGPointZero.x, y, 20.0, 20.0);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v19 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    v20 = UIImagePNGRepresentation(v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v20);

  }
  return v16;
}

@end
