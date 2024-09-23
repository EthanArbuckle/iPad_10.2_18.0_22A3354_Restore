@implementation PXChangeAssetLocationAction

- (PXChangeAssetLocationAction)initWithAssets:(id)a3 annotatedLocation:(id)a4 sourceType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PXChangeAssetLocationAction *v12;
  PXChangeAssetLocationAction *v13;
  id v14;
  void *v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CLLocation *v27;
  CLLocation *preciseLocation;
  void *v29;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = v8;
  }
  else
  {
    PXFilter();
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v31.receiver = self;
  v31.super_class = (Class)PXChangeAssetLocationAction;
  v12 = -[PXAssetsAction initWithAssets:](&v31, sel_initWithAssets_, v10);
  v13 = v12;
  if (v12)
  {
    v12->_sourceType = a5;
    objc_storeStrong((id *)&v12->_annotatedLocation, a4);
    objc_msgSend(v9, "location");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && (objc_msgSend(v14, "horizontalAccuracy"), v16 == 0.0))
    {
      v17 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(v15, "coordinate");
      v19 = v18;
      v21 = v20;
      objc_msgSend(v15, "altitude");
      v23 = v22;
      objc_msgSend(v15, "verticalAccuracy");
      v25 = v24;
      objc_msgSend(v15, "timestamp");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (CLLocation *)objc_msgSend(v17, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v26, v19, v21, v23, 1.0, v25);

    }
    else
    {
      v27 = v15;
    }

    preciseLocation = v13->_preciseLocation;
    v13->_preciseLocation = v27;

    if (v13->_preciseLocation)
    {
      objc_msgSend(v9, "location");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "coordinate");
      v13->_shifted = objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:");

    }
    else
    {
      v13->_shifted = 0;
    }
  }

  return v13;
}

- (id)actionIdentifier
{
  return CFSTR("ChangeAssetsLocation");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXChangeLocationActionName");
}

- (id)analyticsActionString
{
  unint64_t v2;

  v2 = -[PXChangeAssetLocationAction sourceType](self, "sourceType");
  if (v2 > 3)
    return CFSTR("unknown");
  else
    return *(&off_1E5119298 + v2);
}

- (id)analyticsPlaceLevelString
{
  void *v2;
  void *v3;

  -[PXAnnotatedLocation placeAnnotation](self->_annotatedLocation, "placeAnnotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeLevelAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4
{
  if (a4)
    *a4 = self->_shifted;
  return self->_preciseLocation;
}

- (PXAnnotatedLocation)annotatedLocation
{
  return self->_annotatedLocation;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotatedLocation, 0);
  objc_storeStrong((id *)&self->_preciseLocation, 0);
}

BOOL __75__PXChangeAssetLocationAction_initWithAssets_annotatedLocation_sourceType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
