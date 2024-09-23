@implementation RidesharingPOIAnnotation

- (RidesharingPOIAnnotation)initWithMapItem:(id)a3
{
  id v4;
  RidesharingPOIAnnotation *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  VKCustomFeature *feature;
  objc_super v19;
  __int128 v20;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RidesharingPOIAnnotation;
  v5 = -[RidesharingPOIAnnotation init](&v19, "init");
  if (v5)
  {
    objc_msgSend(v4, "_coordinate");
    v7 = v6;
    objc_msgSend(v4, "_coordinate");
    v9 = v8;
    v10 = objc_msgSend(objc_alloc((Class)VKCustomFeature), "initWithCoordinate:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
    v12 = objc_msgSend(v11, "_hasMUID");

    if ((v12 & 1) != 0)
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_styleAttributes"));
    else
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
    v14 = v13;
    v15 = objc_msgSend(v13, "copy");

    v20 = xmmword_100E3D050;
    objc_msgSend(v15, "replaceAttributes:count:", &v20, 2);
    objc_msgSend(v10, "setStyleAttributes:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    objc_msgSend(v10, "setText:locale:", v16, 0);

    feature = v5->_feature;
    v5->_feature = (VKCustomFeature *)v10;

    v5->_coordinate.latitude = v7;
    v5->_coordinate.longitude = v9;

  }
  return v5;
}

- (id)feature
{
  return self->_feature;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
