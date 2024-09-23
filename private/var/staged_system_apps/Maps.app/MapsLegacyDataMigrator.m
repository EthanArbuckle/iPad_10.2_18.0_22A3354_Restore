@implementation MapsLegacyDataMigrator

- (void)performMigration
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t Log;
  NSObject *v18;
  void *v19;
  int v20;
  unsigned int v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
  v4 = (unint64_t)objc_msgSend(v3, "integerForKey:", CFSTR("LegacyDataMigratorVersionCompletionStatus"));

  if (v4 == 7)
    return;
  v5 = v4;
  if ((v4 & 1) == 0)
  {
    v5 = v4;
    if (GEOConfigGetBOOL(MapsConfig_EnableMapsLegacyDataMigration, off_1014B5428))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));

      if (!v6)
      {
        Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
        v18 = objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "There is no Maps container, so we're skipping migration for all those things that should execute inside the Maps container.", (uint8_t *)&v20, 2u);
        }

        v5 = v4;
        if ((v4 & 2) != 0)
          goto LABEL_19;
        goto LABEL_13;
      }
      v7 = -[MapsLegacyDataMigrator _migratePathsIntoContainer](self, "_migratePathsIntoContainer");
      v8 = DefaultLoggingSubsystem;
      v9 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v20 = 67109120;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Containerize: %d", (uint8_t *)&v20, 8u);
      }

      v11 = -[MapsLegacyDataMigrator _migrateDefaults](self, "_migrateDefaults");
      v12 = GEOFindOrCreateLog(v8, "MapsLegacyDataMigrator");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v20 = 67109120;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Defaults: %d", (uint8_t *)&v20, 8u);
      }

      v14 = -[MapsLegacyDataMigrator _migrateFiles](self, "_migrateFiles");
      v15 = GEOFindOrCreateLog(v8, "MapsLegacyDataMigrator");
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v20 = 67109120;
        v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Files: %d", (uint8_t *)&v20, 8u);
      }

      v5 = v4 | v7 & v11 & v14 & 1;
    }
  }
  if ((v4 & 2) == 0)
  {
LABEL_13:
    if (GEOConfigGetBOOL(MapsConfig_EnableMapsLegacyFavoritesMigration, off_1014B5438)
      && MapsFeature_IsEnabled_MyPlacesFeatures())
    {
      -[MapsLegacyDataMigrator _migratePreCrystalFavorites](self, "_migratePreCrystalFavorites");
      v5 |= 2uLL;
    }
  }
LABEL_19:
  if ((v4 & 4) == 0 && GEOConfigGetBOOL(MapsConfig_EnableMapsOrphanedRAPWebBundleRemoval, off_1014B56A8))
  {
    if (-[MapsLegacyDataMigrator _removeOrphanedRAPWebBundles](self, "_removeOrphanedRAPWebBundles"))
      v5 |= 4uLL;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
  objc_msgSend(v19, "setInteger:forKey:", v5, CFSTR("LegacyDataMigratorVersionCompletionStatus"));

}

- (BOOL)_migratePathsIntoContainer
{
  BOOL v2;
  void *v3;
  _UNKNOWN **v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  uint64_t Log;
  NSObject *v30;
  void *v32;
  id obj;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unsigned __int8 v41;
  uint8_t buf[4];
  id v43;
  _BYTE v44[128];

  v2 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths pathsAtLocation:](MSPMapsPaths, "pathsAtLocation:", 1));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));
  v4 = MKPlaceCollectionsLogicController_ptr;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v41 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v41);
  v8 = v41;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v11, 0));

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v13)
    {
      v14 = v13;
      v32 = v5;
      obj = v12;
      v15 = *(_QWORD *)v38;
      v16 = 1;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v19 = v3;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathComponent:", v18));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mapsDirectory"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", v18));
          v24 = -[MapsLegacyDataMigrator _moveItemAtPathIfExists:toPathCreatingIntermediateDirectories:](self, "_moveItemAtPathIfExists:toPathCreatingIntermediateDirectories:", v21, v23);

          v3 = v19;
          v16 &= v24;
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v14);

      v5 = v32;
      v4 = MKPlaceCollectionsLogicController_ptr;
      if (!v16)
      {
        v2 = 0;
        goto LABEL_22;
      }
    }
    else
    {

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[337], "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
    v36 = 0;
    v27 = objc_msgSend(v25, "removeItemAtPath:error:", v26, &v36);
    v28 = v36;

    if ((v27 & 1) != 0 || -[MapsLegacyDataMigrator _maps_isFileNotFoundError:](self, "_maps_isFileNotFoundError:", v28))
    {
      v2 = 1;
    }
    else
    {
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
      v30 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "There was an error removing the old Maps directory: %@", buf, 0xCu);
      }

      v2 = 0;
    }

  }
LABEL_22:

  return v2;
}

- (BOOL)_maps_isFileNotFoundError:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  BOOL v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqual:", NSPOSIXErrorDomain);

  if ((v5 & 1) != 0)
  {
    v6 = 2;
LABEL_8:
    v9 = objc_msgSend(v3, "code") == (id)v6;
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v8 = objc_msgSend(v7, "isEqual:", NSCocoaErrorDomain);

  if (v8)
  {
    if (objc_msgSend(v3, "code") != (id)4)
    {
      v6 = 260;
      goto LABEL_8;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
LABEL_9:

  return v9;
}

- (BOOL)_moveItemAtPathIfExists:(id)a3 toPathCreatingIntermediateDirectories:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned int v10;
  uint64_t Log;
  NSObject *v12;
  unsigned int v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  NSObject *v32;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v5);

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v6);

    if (v10)
    {
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
      v12 = objc_claimAutoreleasedReturnValue(Log);
      LOBYTE(v13) = 1;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v5;
        v29 = 2112;
        v30 = v6;
        v14 = "File %@ will not be moved over because the file exists already at destination path. %@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v14, buf, 0x16u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingLastPathComponent"));
    objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = 0;
    v13 = objc_msgSend(v18, "copyItemAtPath:toPath:error:", v5, v6, &v26);
    v12 = v26;

    v19 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412546;
        v28 = v5;
        v29 = 2112;
        v30 = v6;
        v22 = "Migrated item at path %@ to path %@";
        v23 = v20;
        v24 = 22;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v22, buf, v24);
      }
    }
    else if (v21)
    {
      *(_DWORD *)buf = 138412802;
      v28 = v5;
      v29 = 2112;
      v30 = v6;
      v31 = 2112;
      v32 = v12;
      v22 = "There was an error migrating item at path %@ into path %@: %@";
      v23 = v20;
      v24 = 32;
      goto LABEL_13;
    }

    goto LABEL_15;
  }
  v15 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
  v12 = objc_claimAutoreleasedReturnValue(v15);
  LOBYTE(v13) = 1;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v5;
    v29 = 2112;
    v30 = v6;
    v14 = "File %@ will not be moved over because the source file does not exist (would have been moved to %@)";
    goto LABEL_7;
  }
LABEL_15:

  return v13;
}

- (BOOL)_removeItemAtPathIfExists:(id)a3
{
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t Log;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  NSObject *v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v3, &v14);
    v8 = v14;

    if ((v7 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
      v12 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove file: %@", buf, 0xCu);
      }

      v9 = 0;
    }
  }
  else
  {
    v10 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
    v8 = objc_claimAutoreleasedReturnValue(v10);
    v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "File %@ does not exist and will not be removed", buf, 0xCu);
    }
  }

  return v9;
}

- (BOOL)_migrateDefaults
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t Log;
  NSObject *v13;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = objc_msgSend(&off_101274130, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(&off_101274130);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("DistanceUnits"))
          || (objc_msgSend(v8, "isEqualToString:", CFSTR("Imperial")) & 1) != 0
          || objc_msgSend(v8, "isEqualToString:", CFSTR("Metric")))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6));

          if (!v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
            objc_msgSend(v11, "setObject:forKey:", v8, v6);

          }
        }

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(&off_101274130, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
  v13 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Finished migrating shared defaults", v15, 2u);
  }

  return 1;
}

- (BOOL)_migrateFiles
{
  unsigned __int8 v3;

  v3 = -[MapsLegacyDataMigrator _migrateOrphanedWatchResources](self, "_migrateOrphanedWatchResources");
  return v3 & -[MapsLegacyDataMigrator _removeLegacyFiles](self, "_removeLegacyFiles");
}

- (BOOL)_migrateOrphanedWatchResources
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  BOOL v18;
  void *v19;
  void *v20;
  unsigned int v21;
  int v22;
  BOOL v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  id v34;
  uint64_t Log;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  id v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  unsigned __int8 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;

  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("DeviceRegistry")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v66 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, &v66));
    v8 = v66;

    if (v7)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v9 = v7;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      if (v10)
      {
        v11 = v10;
        v46 = v8;
        v47 = v7;
        v12 = *(_QWORD *)v63;
        v54 = DefaultLoggingSubsystem;
        v49 = v9;
        v50 = v5;
        v48 = *(_QWORD *)v63;
        do
        {
          v13 = 0;
          v51 = v11;
          do
          {
            if (*(_QWORD *)v63 != v12)
              objc_enumerationMutation(v9);
            v53 = v13;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v13), v46, v47));
            v61 = 0;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v16 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v14, &v61);
            v17 = v61;

            if (v16)
              v18 = v17 == 0;
            else
              v18 = 1;
            if (!v18)
            {
              v52 = v14;
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("GeoServices")));
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
              v21 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v19, &v61);
              v22 = v61;

              if (v21)
                v23 = v22 == 0;
              else
                v23 = 1;
              if (!v23)
              {
                v59 = 0u;
                v60 = 0u;
                v57 = 0u;
                v58 = 0u;
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", v19, 0));

                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
                if (v26)
                {
                  v27 = v26;
                  v28 = *(_QWORD *)v58;
                  do
                  {
                    for (i = 0; i != v27; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v58 != v28)
                        objc_enumerationMutation(v25);
                      v30 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
                      if (objc_msgSend(v30, "hasPrefix:", CFSTR("hw_")))
                      {
                        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathComponent:", v30));
                        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                        v56 = 0;
                        v33 = objc_msgSend(v32, "removeItemAtPath:error:", v31, &v56);
                        v34 = v56;

                        if ((v33 & 1) == 0)
                        {
                          Log = GEOFindOrCreateLog(v54, "MapsLegacyDataMigrator");
                          v36 = objc_claimAutoreleasedReturnValue(Log);
                          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            v70 = v34;
                            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Failed to remove orphaned Watch directory: %@", buf, 0xCu);
                          }

                        }
                      }
                    }
                    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
                  }
                  while (v27);
                }

                v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "contentsOfDirectoryAtPath:error:", v19, 0));

                v5 = v50;
                v12 = v48;
                if (v38 && !objc_msgSend(v38, "count"))
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                  v55 = 0;
                  v40 = objc_msgSend(v39, "removeItemAtPath:error:", v19, &v55);
                  v41 = v55;

                  if ((v40 & 1) == 0)
                  {
                    v42 = GEOFindOrCreateLog(v54, "MapsLegacyDataMigrator");
                    v43 = objc_claimAutoreleasedReturnValue(v42);
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v70 = v41;
                      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Failed to remove orphaned Watch directory: %@", buf, 0xCu);
                    }

                  }
                }

                v9 = v49;
              }

              v11 = v51;
              v14 = v52;
            }

            v13 = v53 + 1;
          }
          while ((id)(v53 + 1) != v11);
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
        }
        while (v11);
        v8 = v46;
        v7 = v47;
      }
    }
    else
    {
      v44 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
      v9 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Couldn't get contents of DeviceRegistry directory: %@", buf, 0xCu);
      }
    }

  }
  return 1;
}

- (BOOL)_removeLegacyFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[14];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));
  v40[0] = CFSTR("/var/mobile/Library/Preferences/com.apple.GMM.plist");
  v40[1] = CFSTR("/var/mobile/Library/Caches/gmmd");
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheDirectory"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingPathComponent:", CFSTR("Maps/SuspendLocation.plist")));
  v40[2] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingPathComponent:", CFSTR("Route.plist")));
  v40[3] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingPathComponent:", CFSTR("Directions.plist")));
  v40[4] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingPathComponent:", CFSTR("Directions.mapsdata")));
  v40[5] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingPathComponent:", CFSTR("History.plist")));
  v40[6] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("History.mapsdata")));
  v40[7] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("History.synced")));
  v40[8] = v21;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("FailedSearches.mapsdata")));
  v40[9] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookmarksSettingsPath"));
  v40[10] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("navd.cache")));
  v40[11] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("navd.cache-wal")));
  v40[12] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDirectory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("navd.cache-shm")));
  v40[13] = v11;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 14));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = v20;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    v16 = 1;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        v16 &= -[MapsLegacyDataMigrator _removeItemAtPathIfExists:](self, "_removeItemAtPathIfExists:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v14);
  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (void)_migratePreCrystalFavorites
{
  uint64_t Log;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  os_signpost_id_t v19;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsLegacyDataMigrator");
  v3 = objc_claimAutoreleasedReturnValue(Log);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v19 = os_signpost_id_generate(v3);
  v4 = v3;
  v5 = v4;
  v6 = v17[3];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, v6, "MigratePreCrystalFavorites", ", buf, 2u);
  }

  v7 = v5;
  v8 = v7;
  v9 = v17[3];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MigratePreCrystalFavoritesDuration", ", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009C8C04;
  v12[3] = &unk_1011DE7B8;
  v11 = v8;
  v13 = v11;
  v14 = &v16;
  objc_msgSend(v10, "migrateFavoritesIfNeededWithCompletionHandler:", v12);

  _Block_object_dispose(&v16, 8);
}

- (BOOL)_removeOrphanedRAPWebBundles
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[2];

  v15[0] = CFSTR("/private/var/mobile/Library/Caches/com.apple.maps/RAPWebBundle");
  v15[1] = CFSTR("/private/var/mobile/Library/Caches/com.apple.Maps/RAPWebBundle");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v7 &= -[MapsLegacyDataMigrator _removeItemAtPathIfExists:](self, "_removeItemAtPathIfExists:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), (_QWORD)v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

@end
