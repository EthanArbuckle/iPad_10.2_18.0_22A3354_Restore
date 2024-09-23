@implementation PLLocationController

- (PLLocationController)init
{
  PLLocationController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLLocationController;
  v2 = -[PLLocationController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    DCIM_applicationWillResignActiveNotificationName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__applicationStateChanged_, v4, 0);

    DCIM_applicationDidBecomeActiveNotificationName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__applicationStateChanged_, v5, 0);

    DCIM_applicationSuspendedEventsOnlyNotificationName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__applicationStateChanged_, v6, 0);

    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__assetContainerChanged_, CFSTR("PLAssetContainerDidChangeNotification"), 0);
    -[PLLocationController performSelector:withObject:afterDelay:](v2, "performSelector:withObject:afterDelay:", sel__updateLocationRunState, 0, 0.0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PLLocationController _stopUpdating](self, "_stopUpdating");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PLLocationController;
  -[PLLocationController dealloc](&v4, sel_dealloc);
}

- (void)_updateLocationRunState
{
  if (self->_isEnabled && (DCIM_isApplicationSuspended() & 1) == 0)
  {
    if (!self->_isUpdating)
      -[PLLocationController _startUpdating](self, "_startUpdating");
  }
  else if (self->_isUpdating)
  {
    -[PLLocationController _stopUpdating](self, "_stopUpdating");
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    -[PLLocationController _updateLocationRunState](self, "_updateLocationRunState");
  }
}

- (void)setHeadingEnabled:(BOOL)a3
{
  CLLocationManager *locationManager;

  self->_isHeadingEnabled = a3;
  if (self->_isUpdating)
  {
    locationManager = self->_locationManager;
    if (a3)
      -[CLLocationManager startUpdatingHeading](locationManager, "startUpdatingHeading");
    else
      -[CLLocationManager stopUpdatingHeading](locationManager, "stopUpdatingHeading");
  }
}

- (void)_startUpdating
{
  CLLocationManager *locationManager;
  CLLocationManager *v4;
  CLLocationManager *v5;

  if (!self->_isUpdating && self->_isEnabled)
  {
    self->_isUpdating = 1;
    locationManager = self->_locationManager;
    if (locationManager)
      goto LABEL_11;
    if (objc_msgSend((id)objc_opt_class(), "usesEffectiveBundleIdentifier"))
    {
      if (objc_msgSend(MEMORY[0x1E0C9E3C8], "authorizationStatusForBundleIdentifier:", CFSTR("com.apple.camera")) != 3)
      {
LABEL_10:
        -[CLLocationManager setDistanceFilter:](self->_locationManager, "setDistanceFilter:", *MEMORY[0x1E0C9E480]);
        -[CLLocationManager setHeadingFilter:](self->_locationManager, "setHeadingFilter:", 5.0);
        -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", *MEMORY[0x1E0C9E490]);
        locationManager = self->_locationManager;
LABEL_11:
        -[CLLocationManager setDelegate:](locationManager, "setDelegate:", self);
        -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
        if (self->_isHeadingEnabled)
          -[CLLocationManager startUpdatingHeading](self->_locationManager, "startUpdatingHeading");
        return;
      }
      v4 = (CLLocationManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "initWithEffectiveBundleIdentifier:delegate:onQueue:", CFSTR("com.apple.camera"), 0, 0);
    }
    else
    {
      v4 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E0C9E3C8]);
    }
    v5 = self->_locationManager;
    self->_locationManager = v4;

    goto LABEL_10;
  }
}

- (void)_stopUpdating
{
  NSDictionary *exifDictionary;
  NSString *locationStr;

  if (self->_isUpdating)
  {
    self->_isUpdating = 0;
    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    -[CLLocationManager stopUpdatingHeading](self->_locationManager, "stopUpdatingHeading");
    exifDictionary = self->_exifDictionary;
    self->_exifDictionary = 0;

    locationStr = self->_locationStr;
    self->_locationStr = 0;

  }
}

- (id)location
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[CLLocationManager location](self->_locationManager, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "horizontalAccuracy");
    v5 = v4;
    objc_msgSend(v3, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = v7;

    if (v8 < -60.0 || v5 < 0.0)
    {

      v3 = 0;
    }
  }
  return v3;
}

- (id)locationDictionaryForImageWithDeviceOrientation:(int)a3 rearFacingCamera:(BOOL)a4
{
  void *v7;
  NSDictionary *v8;
  double v9;
  float v10;
  double v11;
  float v12;
  float v13;
  const __CFString *v14;
  float v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  NSDictionary *exifDictionary;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  const __CFString *v36;
  double v37;
  void *v38;

  -[PLLocationController location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (self->_exifDictionary)
      goto LABEL_18;
    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "coordinate");
    v10 = v9;
    objc_msgSend(v7, "coordinate");
    v12 = v11;
    v13 = fabsf(v10);
    if (v10 >= 0.0)
      v14 = CFSTR("N");
    else
      v14 = CFSTR("S");
    if (v10 < 0.0)
      v10 = v13;
    v15 = fabsf(v12);
    if (v12 >= 0.0)
      v16 = CFSTR("E");
    else
      v16 = CFSTR("W");
    if (v12 < 0.0)
      v12 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v17, *MEMORY[0x1E0CBCDA0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v18, *MEMORY[0x1E0CBCD90]);

    -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v14, *MEMORY[0x1E0CBCD98]);
    -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v16, *MEMORY[0x1E0CBCDA8]);
    objc_msgSend(v7, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTimeZone:", v21);

      objc_msgSend(v20, "setDateFormat:", CFSTR("HH:mm:ss.SS"));
      objc_msgSend(v20, "stringFromDate:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v22, *MEMORY[0x1E0CBCDE8]);

    }
    objc_msgSend(v7, "verticalAccuracy");
    if (v23 >= 0.0)
    {
      objc_msgSend(v7, "altitude");
      v25 = v24 < 0.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v26, *MEMORY[0x1E0CBCD00]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v27, *MEMORY[0x1E0CBCD08]);

    }
    exifDictionary = self->_exifDictionary;
    self->_exifDictionary = v8;

    if (self->_exifDictionary)
    {
LABEL_18:
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a3 - 2) >= 3)
        v30 = 1;
      else
        v30 = a3;
      -[CLLocationManager setHeadingOrientation:](self->_locationManager, "setHeadingOrientation:", v30);
      -[CLLocationManager heading](self->_locationManager, "heading");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (!v31)
        goto LABEL_35;
      objc_msgSend(v31, "headingAccuracy");
      if (v33 < 0.0)
        goto LABEL_35;
      if (CFPreferencesGetAppBooleanValue(CFSTR("kMagneticNorth"), CFSTR("com.apple.compass"), 0)
        || (objc_msgSend(v32, "trueHeading"), v34 < 0.0))
      {
        objc_msgSend(v32, "magneticHeading");
        v36 = CFSTR("M");
        if (a4)
          goto LABEL_34;
      }
      else
      {
        objc_msgSend(v32, "trueHeading");
        v36 = CFSTR("T");
        if (a4)
          goto LABEL_34;
      }
      v35 = v35 + 180.0;
      v37 = 360.0;
      if (v35 >= 360.0)
      {
        v37 = -360.0;
      }
      else if (v35 >= 0.0)
      {
        goto LABEL_34;
      }
      v35 = v35 + v37;
LABEL_34:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v38, *MEMORY[0x1E0CBCD80]);

      objc_msgSend(v29, "setObject:forKey:", v36, *MEMORY[0x1E0CBCD88]);
LABEL_35:

      goto LABEL_36;
    }
  }
  v29 = 0;
LABEL_36:

  return v29;
}

- (id)locationString
{
  NSString *locationStr;
  void *v4;
  NSString *v5;
  NSString *v6;

  locationStr = self->_locationStr;
  if (!locationStr)
  {
    -[PLLocationController location](self, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iso6709Notation");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_locationStr;
    self->_locationStr = v5;

    locationStr = self->_locationStr;
  }
  return locationStr;
}

- (id)photoLibrary
{
  PLLocationController *v2;
  PLPhotoLibrary *photoLibrary;
  uint64_t v4;
  PLPhotoLibrary *v5;
  PLPhotoLibrary *v6;

  v2 = self;
  objc_sync_enter(v2);
  photoLibrary = v2->_photoLibrary;
  if (!photoLibrary)
  {
    +[PLPhotoLibrary cameraPhotoLibrary](PLPhotoLibrary, "cameraPhotoLibrary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_photoLibrary;
    v2->_photoLibrary = (PLPhotoLibrary *)v4;

    photoLibrary = v2->_photoLibrary;
  }
  v6 = photoLibrary;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)_addLocationToAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("PLLocationAssetURLKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PLLocationDeviceOrientationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("PLLocationCameraWasRearFacingKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "BOOLValue");
  -[PLLocationController photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoFromAssetURL:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (objc_msgSend(v11, "pathForOriginalFile"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    if (objc_msgSend(v11, "isVideo"))
    {
      objc_msgSend(v11, "pathForVideoFile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLocationController locationString](self, "locationString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v15 = v13 == 0;
      else
        v15 = 1;
      v16 = !v15;
      if (!v15)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C8B278]);
        objc_msgSend(v17, "setKeySpace:", *MEMORY[0x1E0C8A9D0]);
        objc_msgSend(v17, "setKey:", *MEMORY[0x1E0C8A8A0]);
        objc_msgSend(v17, "setValue:", v14);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v17, 0);
        v19 = (void *)MEMORY[0x1E0C8B0D0];
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        objc_msgSend(v19, "updateMovieMetadataInFile:withMetadata:error:", v20, v18, &v27);
        v21 = v27;

        if (v21)
          NSLog(CFSTR("Error writing location"));

      }
    }
    else
    {
      objc_msgSend(v11, "pathForOriginalFile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLocationController locationDictionaryForImageWithDeviceOrientation:rearFacingCamera:](self, "locationDictionaryForImageWithDeviceOrientation:rearFacingCamera:", v7, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v22 != 0;
      if (v22)
      {
        v23 = objc_alloc(MEMORY[0x1E0C99D80]);
        v24 = (void *)objc_msgSend(v23, "initWithObjectsAndKeys:", v22, *MEMORY[0x1E0CBCD68], 0);
        if ((CGImageCopyFileWithGPSInformation() & 1) == 0)
          NSLog(CFSTR("Error writing location"));
        -[PLLocationController photoLibrary](self, "photoLibrary");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "modifyDCIMEntryForPhoto:", v11);

      }
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)addLocationToMediaWithAssetURLWhenAvailable:(id)a3 deviceOrientation:(int)a4 cameraWasRearFacing:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  int v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *locationPendingAssets;
  NSMutableArray *v16;
  NSMutableArray *v17;
  id v18;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v18 = a3;
  if (objc_msgSend((id)objc_opt_class(), "usesEffectiveBundleIdentifier"))
    v8 = objc_msgSend(MEMORY[0x1E0C9E3C8], "authorizationStatusForBundleIdentifier:", CFSTR("com.apple.camera")) == 3;
  else
    v8 = -[CLLocationManager locationServicesApproved](self->_locationManager, "locationServicesApproved");
  if (objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled"))
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", v18, CFSTR("PLLocationAssetURLKey"), v11, CFSTR("PLLocationAssetTimestampKey"), v12, CFSTR("PLLocationDeviceOrientationKey"), v13, CFSTR("PLLocationCameraWasRearFacingKey"), 0);

    if (!-[PLLocationController _addLocationToAsset:](self, "_addLocationToAsset:", v14))
    {
      locationPendingAssets = self->_locationPendingAssets;
      if (!locationPendingAssets)
      {
        v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = self->_locationPendingAssets;
        self->_locationPendingAssets = v16;

        locationPendingAssets = self->_locationPendingAssets;
      }
      -[NSMutableArray addObject:](locationPendingAssets, "addObject:", v14);
    }

  }
}

- (void)_updatePendingAssets
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;

  v3 = -[NSMutableArray count](self->_locationPendingAssets, "count");
  if (v3 >= 1)
  {
    v4 = v3;
    -[PLLocationController location](self, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v4 + 1;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_locationPendingAssets, "objectAtIndex:", v6 - 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("PLLocationAssetTimestampKey"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceNow");
        if (v9 < -30.0 || -[PLLocationController _addLocationToAsset:](self, "_addLocationToAsset:", v7))
          -[NSMutableArray removeObjectAtIndex:](self->_locationPendingAssets, "removeObjectAtIndex:", v6 - 2);

        --v6;
      }
      while (v6 > 1);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  NSDictionary *exifDictionary;
  NSString *locationStr;

  exifDictionary = self->_exifDictionary;
  self->_exifDictionary = 0;

  locationStr = self->_locationStr;
  self->_locationStr = 0;

  if (self->_isUpdating)
    -[PLLocationController _updatePendingAssets](self, "_updatePendingAssets");
}

- (void)_assetContainerChanged:(id)a3
{
  if (self->_isUpdating)
    -[PLLocationController _updatePendingAssets](self, "_updatePendingAssets", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_locationStr, 0);
  objc_storeStrong((id *)&self->_exifDictionary, 0);
  objc_storeStrong((id *)&self->_locationPendingAssets, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

+ (BOOL)usesEffectiveBundleIdentifier
{
  return __usesEffectiveBundleIdentifier;
}

+ (void)setUsesEffectiveBundleIdentifier:(BOOL)a3
{
  __usesEffectiveBundleIdentifier = a3;
}

+ (id)sharedInstance
{
  void *v2;
  PLLocationController *v3;
  void *v4;

  v2 = (void *)__sharedLocationController;
  if (!__sharedLocationController)
  {
    v3 = objc_alloc_init(PLLocationController);
    v4 = (void *)__sharedLocationController;
    __sharedLocationController = (uint64_t)v3;

    v2 = (void *)__sharedLocationController;
  }
  return v2;
}

@end
