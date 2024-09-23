@implementation GEOMuninViewState

- (GEOMuninViewState)initWithGEOPDMuninViewState:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class(self));

  if (v5)
  {
    v6 = objc_alloc_init((Class)GEOCameraFrame);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraFrame"));
    objc_msgSend(v7, "altitude");
    objc_msgSend(v6, "setAltitude:");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraFrame"));
    objc_msgSend(v8, "latitude");
    objc_msgSend(v6, "setLatitude:");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraFrame"));
    objc_msgSend(v9, "longitude");
    objc_msgSend(v6, "setLongitude:");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraFrame"));
    objc_msgSend(v10, "pitch");
    objc_msgSend(v6, "setPitch:");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraFrame"));
    objc_msgSend(v11, "roll");
    objc_msgSend(v6, "setRoll:");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraFrame"));
    objc_msgSend(v12, "yaw");
    objc_msgSend(v6, "setYaw:");

    objc_msgSend(v5, "setCameraFrame:", v6);
    v13 = objc_alloc_init((Class)GEOLocationInfo);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locationInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localityName"));
    objc_msgSend(v13, "setLocalityName:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locationInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "locationName"));
    objc_msgSend(v13, "setLocationName:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locationInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "secondaryLocationName"));
    objc_msgSend(v13, "setSecondaryLocationName:", v19);

    objc_msgSend(v5, "setLocationInfo:", v13);
  }

  return (GEOMuninViewState *)v5;
}

- (id)toGEOPDMuninViewState
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init((Class)GEOPDMuninViewState);
  v4 = objc_alloc_init((Class)GEOPDCameraFrame);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState cameraFrame](self, "cameraFrame"));
  objc_msgSend(v5, "altitude");
  objc_msgSend(v4, "setAltitude:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState cameraFrame](self, "cameraFrame"));
  objc_msgSend(v6, "latitude");
  objc_msgSend(v4, "setLatitude:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState cameraFrame](self, "cameraFrame"));
  objc_msgSend(v7, "longitude");
  objc_msgSend(v4, "setLongitude:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState cameraFrame](self, "cameraFrame"));
  objc_msgSend(v8, "pitch");
  objc_msgSend(v4, "setPitch:");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState cameraFrame](self, "cameraFrame"));
  objc_msgSend(v9, "roll");
  objc_msgSend(v4, "setRoll:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState cameraFrame](self, "cameraFrame"));
  objc_msgSend(v10, "yaw");
  objc_msgSend(v4, "setYaw:");

  objc_msgSend(v3, "setCameraFrame:", v4);
  v11 = objc_alloc_init((Class)GEOPDLocationInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState locationInfo](self, "locationInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localityName"));
  objc_msgSend(v11, "setLocalityName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState locationInfo](self, "locationInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "locationName"));
  objc_msgSend(v11, "setLocationName:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState locationInfo](self, "locationInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "secondaryLocationName"));
  objc_msgSend(v11, "setSecondaryLocationName:", v17);

  objc_msgSend(v3, "setLocationInfo:", v11);
  return v3;
}

@end
