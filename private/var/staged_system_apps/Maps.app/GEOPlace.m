@implementation GEOPlace

- (CLLocationCoordinate2D)mkCoordinate
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CLLocationCoordinate2D result;

  if (-[GEOPlace hasCenter](self, "hasCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlace center](self, "center"));
    objc_msgSend(v3, "lat");
    v5 = v4;
    objc_msgSend(v3, "lng");
LABEL_5:
    v8 = v6;

    goto LABEL_6;
  }
  if (-[GEOPlace hasMapRegion](self, "hasMapRegion"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlace mapRegion](self, "mapRegion"));
    objc_msgSend(v3, "centerLat");
    v5 = v7;
    objc_msgSend(v3, "centerLng");
    goto LABEL_5;
  }
  if (-[GEOPlace entryPointsCount](self, "entryPointsCount"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlace entryPoints](self, "entryPoints"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));

    objc_msgSend(v12, "lat");
    v5 = v13;
    objc_msgSend(v12, "lng");
    v8 = v14;

  }
  else
  {
    v5 = MKCoordinateInvalid[0];
    v8 = MKCoordinateInvalid[1];
  }
LABEL_6:
  v9 = v5;
  v10 = v8;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

@end
