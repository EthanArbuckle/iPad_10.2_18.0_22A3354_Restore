@implementation ARConfiguration

- (id)recordingConfigurationWithFileName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  ARConfiguration *v15;
  id v16;
  NSObject *v17;
  unsigned int v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager _maps_globalCachesURL](NSFileManager, "_maps_globalCachesURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("ARTraces")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      v12 = objc_msgSend(v10, "isWritableFileAtPath:", v7);

      if ((v12 & 1) == 0)
      {
        v13 = sub_100269010();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v7;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "ARKit recording directory (%@) is not writable. Please check its permissions on disk.", buf, 0xCu);
        }

        v15 = self;
        goto LABEL_21;
      }
    }
    else
    {
      v28 = 0;
      v18 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v28);
      v19 = v28;

      v20 = sub_100269010();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = v21;
      if (!v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v7;
          v31 = 2112;
          v32 = v19;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error creating ARKit recording directory (%@): %@", buf, 0x16u);
        }

        v15 = self;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v7;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Successfully created ARKit recording directory (%@)", buf, 0xCu);
      }

    }
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v4));
    v23 = objc_alloc((Class)ARRecordingConfiguration);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v19));
    v15 = (ARConfiguration *)objc_msgSend(v23, "initWithBaseConfiguration:fileURL:", self, v24);

    -[ARConfiguration startRecording](v15, "startRecording");
    v25 = sub_100269010();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Created recording configuration with path: %@", buf, 0xCu);
    }

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }
  v16 = sub_100269010();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "fileName cannot be nil", buf, 2u);
  }

  v15 = self;
LABEL_22:

  return v15;
}

- (BOOL)isVIO
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ARConfiguration _underlyingConfiguration](self, "_underlyingConfiguration"));
  v3 = objc_opt_class(ARPositionalTrackingConfiguration);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (BOOL)isVLF
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  unsigned int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ARConfiguration _underlyingConfiguration](self, "_underlyingConfiguration"));
  v3 = objc_opt_class(ARGeoTrackingConfiguration);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(v5, "visualLocalizationUpdatesRequested") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (BOOL)isPedestrianAR
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ARConfiguration _underlyingConfiguration](self, "_underlyingConfiguration"));
  v3 = objc_opt_class(ARGeoTrackingConfiguration);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (id)_underlyingConfiguration
{
  ARConfiguration *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  v3 = objc_opt_class(ARCustomTechniquesConfiguration);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ARConfiguration templateConfiguration](v2, "templateConfiguration"));

    v2 = (ARConfiguration *)v4;
  }
  return v2;
}

@end
