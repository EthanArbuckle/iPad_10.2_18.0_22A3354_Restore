@implementation _ShareCustomFeature

- (_ShareCustomFeature)initWithCustomFeature:(id)a3 coordinate:(id)a4
{
  double var1;
  double var0;
  id v8;
  _ShareCustomFeature *v9;
  _ShareCustomFeature *v10;
  _ShareCustomFeature *v11;
  objc_super v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ShareCustomFeature;
  v9 = -[_ShareCustomFeature init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feature, a3);
    v10->_coordinate.latitude = var0;
    v10->_coordinate.longitude = var1;
    v11 = v10;
  }

  return v10;
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

+ (id)customFeatureForMapItem:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _ShareCustomFeature *v13;
  __int128 v15;
  uint64_t v16;

  v3 = a3;
  objc_msgSend(v3, "_coordinate");
  v5 = v4;
  objc_msgSend(v3, "_coordinate");
  v7 = v6;
  v8 = objc_msgSend(objc_alloc((Class)VKCustomFeature), "initWithCoordinate:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_styleAttributes"));
  if (!objc_msgSend(v9, "hasAttributes") || objc_msgSend(v9, "isLabelPOI"))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));

    v9 = (void *)v10;
  }
  v11 = objc_msgSend(v9, "copy");

  v15 = xmmword_100E3CA90;
  v16 = 0x100010024;
  objc_msgSend(v11, "replaceAttributes:count:", &v15, 3);
  objc_msgSend(v8, "setStyleAttributes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  objc_msgSend(v8, "setText:locale:", v12, 0);

  v13 = -[_ShareCustomFeature initWithCustomFeature:coordinate:]([_ShareCustomFeature alloc], "initWithCustomFeature:coordinate:", v8, v5, v7);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
