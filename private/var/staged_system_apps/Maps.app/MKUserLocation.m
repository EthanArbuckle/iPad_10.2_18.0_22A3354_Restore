@implementation MKUserLocation

- (id)floorOrdinalInVenue:(id)a3 forMapView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKUserLocation location](self, "location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "floor"));
  if (v9)
  {
    objc_msgSend(v8, "coordinate");
    v11 = v10;
    objc_msgSend(v8, "coordinate");
    v13 = VKLocationCoordinate2DMake(v11, v12);
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_mapLayer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "venueAtLocation:withMarginForError:", 0, v13, v15));

    v18 = objc_msgSend(v17, "venueID");
    if (v18 == objc_msgSend(v6, "venueID"))
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "level")));
    else
      v19 = 0;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
