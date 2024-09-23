@implementation RidesharingAnnotationsManager

- (RidesharingAnnotationsManager)initWithMapView:(id)a3
{
  id v5;
  RidesharingAnnotationsManager *v6;
  RidesharingAnnotationsManager *v7;
  _MKCustomFeatureStore *v8;
  _MKCustomFeatureStore *customFeatureStore;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RidesharingAnnotationsManager;
  v6 = -[RidesharingAnnotationsManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapView, a3);
    v8 = (_MKCustomFeatureStore *)objc_msgSend(objc_alloc((Class)_MKCustomFeatureStore), "initWithClustering:", 0);
    customFeatureStore = v7->_customFeatureStore;
    v7->_customFeatureStore = v8;

  }
  return v7;
}

- (void)addCurrentRideWithApplicationIdentifier:(id)a3
{
  id v4;
  MKMapView *mapView;
  void *v6;
  id v7;
  RideBookingRideStatusObserverProxy *v8;

  v4 = a3;
  -[RidesharingAnnotationsManager removeCurrentRide](self, "removeCurrentRide");
  mapView = self->_mapView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager customFeatureStore](self, "customFeatureStore"));
  -[MKMapView _addCustomFeatureDataSource:](mapView, "_addCustomFeatureDataSource:", v6);

  self->_shouldReframeMapView = 1;
  v7 = objc_msgSend(v4, "copy");

  -[RidesharingAnnotationsManager setApplicationIdentifier:](self, "setApplicationIdentifier:", v7);
  v8 = -[RideBookingRideStatusObserverProxy initWithDelegate:]([RideBookingRideStatusObserverProxy alloc], "initWithDelegate:", self);
  -[RidesharingAnnotationsManager setRideStatusObserverProxy:](self, "setRideStatusObserverProxy:", v8);

}

- (void)removeCurrentRide
{
  uint64_t Log;
  NSObject *v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MKMapView *mapView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  char *v21;
  __int16 v22;
  id v23;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Removing current ride"));
    *(_DWORD *)buf = 136315394;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager chromeViewController](self, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentIOSBasedContext"));
  v9 = objc_opt_class(RidesharingModeController);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  -[RidesharingAnnotationsManager setRideStatusObserverProxy:](self, "setRideStatusObserverProxy:", 0);
  -[RidesharingAnnotationsManager setApplicationIdentifier:](self, "setApplicationIdentifier:", 0);
  -[RidesharingAnnotationsManager setVehicleAnnotation:](self, "setVehicleAnnotation:", 0);
  -[RidesharingAnnotationsManager setVehicleAnnotationView:](self, "setVehicleAnnotationView:", 0);
  -[RidesharingAnnotationsManager setPickupAnnotation:](self, "setPickupAnnotation:", 0);
  -[RidesharingAnnotationsManager setPickupAnnotationView:](self, "setPickupAnnotationView:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager dropoffAnnotation](self, "dropoffAnnotation"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager customFeatureStore](self, "customFeatureStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager dropoffAnnotation](self, "dropoffAnnotation"));
    v19 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    objc_msgSend(v12, "removeAnnotations:", v14);

    -[RidesharingAnnotationsManager setDropoffAnnotation:](self, "setDropoffAnnotation:", 0);
  }
  mapView = self->_mapView;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager customFeatureStore](self, "customFeatureStore"));
  -[MKMapView _removeCustomFeatureDataSource:](mapView, "_removeCustomFeatureDataSource:", v16);

  -[RidesharingAnnotationsManager setWaypointAnnotations:](self, "setWaypointAnnotations:", 0);
  -[RidesharingAnnotationsManager setETAView:](self, "setETAView:", 0);
  -[RidesharingAnnotationsManager setLastVehicleLocationUpdateDate:](self, "setLastVehicleLocationUpdateDate:", 0);
  if ((isKindOfClass & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
    objc_msgSend(v17, "_setApplicationState:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
    objc_msgSend(v18, "setShowsUserLocation:", 1);

  }
}

- (void)rideStatusMapDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager applicationIdentifier](self, "applicationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  -[RidesharingAnnotationsManager setRideStatus:](self, "setRideStatus:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager rideStatus](self, "rideStatus"));
  -[RidesharingAnnotationsManager _updateFromRideStatus:](self, "_updateFromRideStatus:", v7);

}

- (void)_updateFromRideStatus:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double latitude;
  double longitude;
  double v15;
  uint64_t v16;
  uint64_t Log;
  NSObject *v18;
  char *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  char *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  NSObject *v49;
  char *v50;
  id v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  _BOOL4 v66;
  uint64_t v67;
  NSObject *v68;
  char *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  _BOOL4 v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  char *v81;
  id v82;
  void *v83;
  uint64_t v84;
  NSObject *v85;
  char *v86;
  id v87;
  uint64_t v88;
  char v89;
  id v90;
  uint64_t v91;
  NSObject *v92;
  char *v93;
  id v94;
  void *v95;
  uint64_t v96;
  const __CFString *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  unsigned __int8 isKindOfClass;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  id v111;
  RidesharingPOIAnnotation *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  _BOOL4 v120;
  char v121;
  id v122;
  char v123;
  double v124;
  uint64_t v125;
  NSObject *v126;
  char *v127;
  id v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  unsigned int v134;
  void *v135;
  uint64_t v136;
  NSObject *v137;
  char *v138;
  id v139;
  uint64_t v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  unsigned int v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  char v167;
  char v168;
  int v169;
  _BOOL4 v170;
  int v171;
  void *v172;
  _QWORD v173[5];
  id v174;
  double v175;
  double v176;
  void *v177;
  uint64_t v178;
  uint8_t buf[4];
  char *v180;
  __int16 v181;
  uint64_t v182;
  CLLocationCoordinate2D v183;
  CLLocationCoordinate2D v184;
  CLLocationCoordinate2D v185;
  CLLocationCoordinate2D v186;

  v4 = a3;
  if (objc_msgSend(v4, "isValidRide") && (objc_msgSend(v4, "isActiveRide") & 1) != 0)
  {
    v5 = (objc_msgSend(v4, "isScheduledRide") & 1) == 0 && objc_msgSend(v4, "phase") != (id)1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleLocation"));
    objc_msgSend(v6, "coordinate");
    v8 = v7;
    v10 = v9;

    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleLocation"));
    v12 = v11;
    if (!v11)
      goto LABEL_16;
    objc_msgSend(v11, "coordinate");
    latitude = v183.latitude;
    longitude = v183.longitude;
    if (!CLLocationCoordinate2DIsValid(v183))
      goto LABEL_16;
    v15 = -latitude;
    if (latitude >= 0.0)
      v15 = latitude;
    if (v15 > 2.22044605e-16)
    {
      if (longitude < 0.0)
        longitude = -longitude;

      if (longitude > 2.22044605e-16)
      {
        LODWORD(v16) = 1;
        goto LABEL_20;
      }
    }
    else
    {
LABEL_16:

    }
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v18 = (id)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
      v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Vehicle coordinate was invalid"));
      *(_DWORD *)buf = 136315394;
      v180 = v19;
      v181 = 2112;
      v182 = (uint64_t)v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    LODWORD(v16) = 0;
LABEL_20:
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v172 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:](RideBookingAccessProxy, "rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:", v22, v23));

    if (v5)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleLocation"));

      if (v24)
      {
        if ((v16 & 1) == 0)
          objc_msgSend(v172, "setInvalidVehicleLocation:", 1);
      }
      else
      {
        objc_msgSend(v172, "setMissingVehicleLocation:", 1);
      }
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pickupLocation"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "location"));
    objc_msgSend(v26, "coordinate");
    v28 = v27;
    v30 = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pickupLocation"));
    v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "location"));
    v33 = v32;
    if (!v32)
      goto LABEL_34;
    objc_msgSend(v32, "coordinate");
    v34 = v184.latitude;
    v35 = v184.longitude;
    if (!CLLocationCoordinate2DIsValid(v184))
      goto LABEL_34;
    v36 = -v34;
    if (v34 >= 0.0)
      v36 = v34;
    if (v36 > 2.22044605e-16)
    {
      if (v35 < 0.0)
        v35 = -v35;

      if (v35 > 2.22044605e-16)
      {
        v37 = 1;
        goto LABEL_38;
      }
    }
    else
    {
LABEL_34:

    }
    v38 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v39 = (id)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
      v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Pickup coordinate was invalid"));
      *(_DWORD *)buf = 136315394;
      v180 = v40;
      v181 = 2112;
      v182 = (uint64_t)v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    v37 = 0;
LABEL_38:
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dropoffLocation"));
    v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "location"));
    v44 = v43;
    if (!v43)
      goto LABEL_47;
    objc_msgSend(v43, "coordinate");
    v45 = v185.latitude;
    v46 = v185.longitude;
    if (!CLLocationCoordinate2DIsValid(v185))
      goto LABEL_47;
    v47 = -v45;
    if (v45 >= 0.0)
      v47 = v45;
    if (v47 > 2.22044605e-16)
    {
      if (v46 < 0.0)
        v46 = -v46;

      if (v46 > 2.22044605e-16)
      {
        v171 = 1;
        goto LABEL_51;
      }
    }
    else
    {
LABEL_47:

    }
    v48 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v49 = (id)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
      v51 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Dropoff coordinate was invalid"));
      *(_DWORD *)buf = 136315394;
      v180 = v50;
      v181 = 2112;
      v182 = (uint64_t)v51;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    v171 = 0;
LABEL_51:
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userLocation"));
    objc_msgSend(v53, "coordinate");
    v55 = v54;
    v57 = v56;

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "userLocation"));
    v60 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "location"));
    v61 = v60;
    if (!v60)
      goto LABEL_59;
    objc_msgSend(v60, "coordinate");
    v62 = v186.latitude;
    v63 = v186.longitude;
    if (!CLLocationCoordinate2DIsValid(v186))
      goto LABEL_59;
    v64 = -v62;
    if (v62 >= 0.0)
      v64 = v62;
    if (v64 > 2.22044605e-16)
    {
      v65 = -v63;
      if (v63 >= 0.0)
        v65 = v63;
      v66 = v65 > 2.22044605e-16;
    }
    else
    {
LABEL_59:
      v66 = 0;
    }

    if (!v66)
    {
      v67 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
      v68 = (id)objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
        v70 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("User location coordinate was invalid"));
        *(_DWORD *)buf = 136315394;
        v180 = v69;
        v181 = 2112;
        v182 = (uint64_t)v70;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

      }
    }
    v71 = objc_alloc_init((Class)NSMutableArray);
    if ((_DWORD)v16
      && (v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleImage")), v72, v72))
    {
      v169 = v37;
      v170 = v66;
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager lastVehicleLocationUpdateDate](self, "lastVehicleLocationUpdateDate"));
      if (v74)
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager lastVehicleLocationUpdateDate](self, "lastVehicleLocationUpdateDate"));
        objc_msgSend(v73, "timeIntervalSinceDate:", v75);
        v77 = v76 <= 10.0;

      }
      else
      {
        v77 = 1;
      }

      -[RidesharingAnnotationsManager setLastVehicleLocationUpdateDate:](self, "setLastVehicleLocationUpdateDate:", v73);
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotation](self, "vehicleAnnotation"));

      v78 = DefaultLoggingSubsystem;
      if (!v83)
      {
        v84 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
        v85 = (id)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          v86 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
          v87 = v71;
          v88 = v78;
          v89 = v16;
          v16 = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Creating vehicle annotation"));
          *(_DWORD *)buf = 136315394;
          v180 = v86;
          v181 = 2112;
          v182 = v16;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

          LOBYTE(v16) = v89;
          v78 = v88;
          v71 = v87;
        }

        self->_shouldReframeMapView = 1;
        v90 = objc_alloc_init((Class)MKPointAnnotation);
        -[RidesharingAnnotationsManager setVehicleAnnotation:](self, "setVehicleAnnotation:", v90);

        v77 = 0;
      }
      v91 = GEOFindOrCreateLog(v78, "RideBooking");
      v92 = (id)objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        v93 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
        v167 = v16;
        v94 = objc_alloc((Class)NSString);
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleLocation"));
        objc_msgSend(v95, "course");
        v97 = CFSTR("No");
        if (v77)
          v97 = CFSTR("Yes");
        v16 = (uint64_t)objc_msgSend(v94, "initWithFormat:", CFSTR("Updating vehicle annotation: %f,%f at %f with animation: %@"), *(_QWORD *)&v8, *(_QWORD *)&v10, v96, v97);
        *(_DWORD *)buf = 136315394;
        v180 = v93;
        v181 = 2112;
        v182 = v16;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

        LOBYTE(v16) = v167;
      }

      if (v77)
      {
        v173[0] = _NSConcreteStackBlock;
        v173[1] = 3221225472;
        v173[2] = sub_10082EEC0;
        v173[3] = &unk_1011B15D8;
        v173[4] = self;
        v175 = v8;
        v176 = v10;
        v174 = v4;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v173, 0, 0.6, 0.0);

      }
      else
      {
        v98 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotation](self, "vehicleAnnotation"));
        objc_msgSend(v98, "setCoordinate:", v8, v10);

        v99 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotationView](self, "vehicleAnnotationView"));
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleLocation"));
        objc_msgSend(v100, "course");
        objc_msgSend(v99, "_setDirection:");

        v101 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotationView](self, "vehicleAnnotationView"));
        objc_msgSend(v101, "setAlpha:", 1.0);

      }
      v102 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotation](self, "vehicleAnnotation"));
      objc_msgSend(v71, "addObject:", v102);

      v37 = v169;
      v66 = v170;
    }
    else
    {
      v78 = DefaultLoggingSubsystem;
      v79 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
      v80 = objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        v81 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
        v82 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Stale vehicle annotation"));
        *(_DWORD *)buf = 136315394;
        v180 = v81;
        v181 = 2112;
        v182 = (uint64_t)v82;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

      }
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotationView](self, "vehicleAnnotationView"));
      objc_msgSend(v73, "setAlpha:", 0.25);
    }

    if (!v37 || objc_msgSend(v4, "phase") == (id)3 || objc_msgSend(v4, "phase") == (id)4)
    {
      -[RidesharingAnnotationsManager setPickupAnnotation:](self, "setPickupAnnotation:", 0);
    }
    else
    {
      v157 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager pickupAnnotation](self, "pickupAnnotation"));

      if (!v157)
      {
        self->_shouldReframeMapView = 1;
        v158 = objc_alloc_init((Class)MKPointAnnotation);
        -[RidesharingAnnotationsManager setPickupAnnotation:](self, "setPickupAnnotation:", v158);

      }
      v159 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager pickupAnnotation](self, "pickupAnnotation"));
      objc_msgSend(v159, "setCoordinate:", v28, v30);

      v160 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager pickupAnnotationView](self, "pickupAnnotationView"));
      objc_msgSend(v160, "setSelected:animated:", 1, 1);

      v161 = objc_msgSend(v4, "isScheduledRide");
      v162 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager ETAView](self, "ETAView"));
      if (v161)
      {
        v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduledPickupWindowStartDateComponents"));
        objc_msgSend(v162, "setScheduledPickupWindowStart:", v163);
      }
      else
      {
        v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pickupETAMinutes"));
        objc_msgSend(v162, "setMinutes:withState:", v163, 0);
      }

      v164 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager pickupAnnotationView](self, "pickupAnnotationView"));
      v165 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager ETAView](self, "ETAView"));
      objc_msgSend(v164, "setSelectedContentView:", v165);

      v166 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager pickupAnnotation](self, "pickupAnnotation"));
      objc_msgSend(v71, "addObject:", v166);

    }
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager chromeViewController](self, "chromeViewController"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "currentIOSBasedContext"));
    v105 = objc_opt_class(RidesharingModeController);
    isKindOfClass = objc_opt_isKindOfClass(v104, v105);

    if (v171 && ((objc_msgSend(v4, "phase") == (id)3) & isKindOfClass) == 1)
    {
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager dropoffAnnotation](self, "dropoffAnnotation"));

      if (!v107)
      {
        self->_shouldReframeMapView = 1;
        v108 = objc_alloc((Class)MKMapItem);
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dropoffLocation"));
        v168 = v16;
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "_geoMapItem"));
        v111 = objc_msgSend(v108, "initWithGeoMapItem:isPlaceHolderPlace:", v110, 0);

        v112 = -[RidesharingPOIAnnotation initWithMapItem:]([RidesharingPOIAnnotation alloc], "initWithMapItem:", v111);
        -[RidesharingAnnotationsManager setDropoffAnnotation:](self, "setDropoffAnnotation:", v112);

        v113 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager customFeatureStore](self, "customFeatureStore"));
        v16 = objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager dropoffAnnotation](self, "dropoffAnnotation"));
        v178 = v16;
        v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v178, 1));
        objc_msgSend(v113, "addAnnotations:", v114);

        LOBYTE(v16) = v168;
        v115 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
        objc_msgSend(v115, "_setApplicationState:", 1);

      }
      v116 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager dropoffAnnotation](self, "dropoffAnnotation"));
      objc_msgSend(v71, "addObject:", v116);

      if (!v66)
        goto LABEL_104;
    }
    else
    {
      v117 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager dropoffAnnotation](self, "dropoffAnnotation"));

      if (v117)
      {
        v118 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager customFeatureStore](self, "customFeatureStore"));
        v119 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager dropoffAnnotation](self, "dropoffAnnotation"));
        v177 = v119;
        v120 = v66;
        v121 = v16;
        v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v177, 1));
        objc_msgSend(v118, "removeAnnotations:", v16);

        LOBYTE(v16) = v121;
        v66 = v120;

      }
      -[RidesharingAnnotationsManager setDropoffAnnotation:](self, "setDropoffAnnotation:", 0);
      if (!v66)
        goto LABEL_104;
    }
    v122 = objc_msgSend(v4, "phase");
    v123 = v16 ^ 1;
    if (v122 != (id)3)
      v123 = 1;
    if ((v123 & 1) == 0)
    {
      v124 = GEOCalculateDistance(v122, v55, v57, v8, v10);
      if (v124 < GEOConfigGetDouble(MapsConfig_RideBookingHideUserLocationThreshold, off_1014B2EE8))
      {
        v125 = GEOFindOrCreateLog(v78, "RideBooking");
        v126 = objc_claimAutoreleasedReturnValue(v125);
        if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
        {
          v127 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
          v128 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Hiding user location because it is close to the vehicle location"));
          *(_DWORD *)buf = 136315394;
          v180 = v127;
          v181 = 2112;
          v182 = (uint64_t)v128;
          _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

        }
        v129 = 0;
LABEL_105:

        if ((isKindOfClass & 1) != 0)
        {
          v131 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
          objc_msgSend(v131, "setShowsUserLocation:", v129);

        }
        if (!objc_msgSend(v71, "count") || (self->_shouldReframeMapView & isKindOfClass) != 1)
          goto LABEL_125;
        self->_shouldReframeMapView = 0;
        v132 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotation](self, "vehicleAnnotation"));
        if (objc_msgSend(v71, "containsObject:", v132))
        {

        }
        else
        {
          v133 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager dropoffAnnotation](self, "dropoffAnnotation"));
          v134 = objc_msgSend(v71, "containsObject:", v133);

          if (!v134)
          {
            v135 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
            objc_msgSend(v135, "showAnnotations:animated:", v71, 1);
LABEL_124:

LABEL_125:
            goto LABEL_126;
          }
        }
        v135 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _mapkit_mapRegionEnclosingAnnotations:](GEOMapRegion, "_mapkit_mapRegionEnclosingAnnotations:", v71));
        v136 = GEOFindOrCreateLog(v78, "RideBooking");
        v137 = (id)objc_claimAutoreleasedReturnValue(v136);
        if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
        {
          v138 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
          v139 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Enclosing map region for annotations: %@"), v135);
          *(_DWORD *)buf = 136315394;
          v180 = v138;
          v181 = 2112;
          v182 = (uint64_t)v139;
          _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

        }
        if (v135)
        {
          v141 = GEOMapRectForMapRegion(v135, v140);
          v143 = v142;
          v145 = v144;
          v147 = v146;
          v148 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotationView](self, "vehicleAnnotationView"));
          v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "image"));
          objc_msgSend(v149, "size");
          v151 = v150;
          v153 = v152;

          if (v153 <= v151)
            v154 = v151;
          else
            v154 = v153;
          v155 = v154 * 0.5 + 25.0;
          v156 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
          objc_msgSend(v156, "setVisibleMapRect:edgePadding:animated:", 1, v141, v143, v145, v147, v155, v155, v155, v155);

        }
        goto LABEL_124;
      }
    }
LABEL_104:
    v126 = objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userLocation](v126, "userLocation"));
    objc_msgSend(v71, "addObject:", v130);

    v129 = 1;
    goto LABEL_105;
  }
  -[RidesharingAnnotationsManager removeCurrentRide](self, "removeCurrentRide");
LABEL_126:

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotation](self, "vehicleAnnotation"));

  if (v6 == v5)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotationView](self, "vehicleAnnotationView"));
LABEL_6:
    v8 = (void *)v9;
    goto LABEL_7;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager pickupAnnotation](self, "pickupAnnotation"));

  if (v7 == v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager pickupAnnotationView](self, "pickupAnnotationView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager ETAView](self, "ETAView"));
    objc_msgSend(v10, "setSelectedContentView:", v11);

    v9 = objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager pickupAnnotationView](self, "pickupAnnotationView"));
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return 0;
}

- (void)setPickupAnnotation:(id)a3
{
  MKPointAnnotation *v5;
  MKPointAnnotation *pickupAnnotation;
  MKPointAnnotation **p_pickupAnnotation;
  void *v8;
  void *v9;
  MKPointAnnotation *v10;

  v5 = (MKPointAnnotation *)a3;
  p_pickupAnnotation = &self->_pickupAnnotation;
  pickupAnnotation = self->_pickupAnnotation;
  if (pickupAnnotation != v5)
  {
    v10 = v5;
    if (pickupAnnotation)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
      objc_msgSend(v8, "removeAnnotation:", self->_pickupAnnotation);

      v5 = v10;
    }
    if (v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
      objc_msgSend(v9, "addAnnotation:", v10);

    }
    objc_storeStrong((id *)p_pickupAnnotation, a3);
    v5 = v10;
  }

}

- (void)setVehicleAnnotation:(id)a3
{
  MKPointAnnotation *v5;
  MKPointAnnotation *vehicleAnnotation;
  MKPointAnnotation **p_vehicleAnnotation;
  void *v8;
  void *v9;
  MKPointAnnotation *v10;

  v5 = (MKPointAnnotation *)a3;
  p_vehicleAnnotation = &self->_vehicleAnnotation;
  vehicleAnnotation = self->_vehicleAnnotation;
  if (vehicleAnnotation != v5)
  {
    v10 = v5;
    if (vehicleAnnotation)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
      objc_msgSend(v8, "removeAnnotation:", self->_vehicleAnnotation);

      v5 = v10;
    }
    if (v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
      objc_msgSend(v9, "addAnnotation:", v10);

    }
    objc_storeStrong((id *)p_vehicleAnnotation, a3);
    v5 = v10;
  }

}

- (void)setWaypointAnnotations:(id)a3
{
  id v5;
  id *p_waypointAnnotations;
  void *v7;
  void *v8;
  uint64_t Log;
  NSObject *v10;
  char *v11;
  id v12;
  int v13;
  char *v14;
  __int16 v15;
  id v16;

  v5 = a3;
  if (v5)
  {
    p_waypointAnnotations = (id *)&self->_waypointAnnotations;
    if (!-[NSArray isEqualToArray:](self->_waypointAnnotations, "isEqualToArray:", v5))
    {
      if (*p_waypointAnnotations)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
        objc_msgSend(v7, "removeAnnotations:", self->_waypointAnnotations);

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager mapView](self, "mapView"));
      objc_msgSend(v8, "addAnnotations:", v5);

      objc_storeStrong(p_waypointAnnotations, a3);
    }
    objc_storeStrong(p_waypointAnnotations, a3);
  }
  else
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v10 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingAnnotationsManager.m");
      v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("waypointAnnotations is nil. Returning."));
      v13 = 136315394;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (MKMarkerAnnotationView)pickupAnnotationView
{
  MKMarkerAnnotationView *pickupAnnotationView;
  id v4;
  void *v5;
  MKMarkerAnnotationView *v6;
  MKMarkerAnnotationView *v7;
  MKMarkerAnnotationView *v8;
  UIImage *v9;
  MKMarkerAnnotationView *v10;
  void *v11;
  MKMarkerAnnotationView *v12;
  void *v13;

  pickupAnnotationView = self->_pickupAnnotationView;
  if (!pickupAnnotationView)
  {
    v4 = objc_alloc((Class)MKMarkerAnnotationView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager pickupAnnotation](self, "pickupAnnotation"));
    v6 = (MKMarkerAnnotationView *)objc_msgSend(v4, "initWithAnnotation:reuseIdentifier:", v5, CFSTR("RidesharingPickupAnnotationView"));
    v7 = self->_pickupAnnotationView;
    self->_pickupAnnotationView = v6;

    v8 = self->_pickupAnnotationView;
    v9 = objc_opt_new(UIImage);
    -[MKMarkerAnnotationView setGlyphImage:](v8, "setGlyphImage:", v9);

    -[MKMarkerAnnotationView setCanShowCallout:](self->_pickupAnnotationView, "setCanShowCallout:", 1);
    v10 = self->_pickupAnnotationView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingBalloonETAView balloonFillColor](RidesharingBalloonETAView, "balloonFillColor"));
    -[MKMarkerAnnotationView setMarkerTintColor:](v10, "setMarkerTintColor:", v11);

    v12 = self->_pickupAnnotationView;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager ETAView](self, "ETAView"));
    -[MKMarkerAnnotationView setSelectedContentView:](v12, "setSelectedContentView:", v13);

    -[MKMarkerAnnotationView setSelected:animated:](self->_pickupAnnotationView, "setSelected:animated:", 1, 1);
    pickupAnnotationView = self->_pickupAnnotationView;
  }
  return pickupAnnotationView;
}

- (MKAnnotationView)vehicleAnnotationView
{
  MKAnnotationView *vehicleAnnotationView;
  id v4;
  void *v5;
  MKAnnotationView *v6;
  MKAnnotationView *v7;
  void *v8;
  void *v9;
  double Double;
  id v11;
  void *v12;
  MKAnnotationView *v13;
  void *v14;

  vehicleAnnotationView = self->_vehicleAnnotationView;
  if (!vehicleAnnotationView)
  {
    v4 = objc_alloc((Class)MKAnnotationView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager vehicleAnnotation](self, "vehicleAnnotation"));
    v6 = (MKAnnotationView *)objc_msgSend(v4, "initWithAnnotation:reuseIdentifier:", v5, CFSTR("RidesharingVehicleAnnotationView"));
    v7 = self->_vehicleAnnotationView;
    self->_vehicleAnnotationView = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAnnotationsManager rideStatus](self, "rideStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vehicleImage"));
    Double = GEOConfigGetDouble(MapsConfig_RideBookingMaxVehicleAnnotationSizeWidth, off_1014B2EC8);
    v11 = objc_msgSend(v9, "_maps_imageWithAspectFitScalingForMaximumSize:", Double, GEOConfigGetDouble(MapsConfig_RideBookingMaxVehicleAnnotationSizeHeight, off_1014B2EB8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    -[MKAnnotationView setImage:](self->_vehicleAnnotationView, "setImage:", v12);
    v13 = self->_vehicleAnnotationView;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MKAnnotationView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[MKAnnotationView setSelected:animated:](self->_vehicleAnnotationView, "setSelected:animated:", 1, 1);
    vehicleAnnotationView = self->_vehicleAnnotationView;
  }
  return vehicleAnnotationView;
}

- (RidesharingBalloonETAView)ETAView
{
  RidesharingBalloonETAView *ETAView;
  RidesharingBalloonETAView *v4;
  RidesharingBalloonETAView *v5;

  ETAView = self->_ETAView;
  if (!ETAView)
  {
    v4 = objc_alloc_init(RidesharingBalloonETAView);
    v5 = self->_ETAView;
    self->_ETAView = v4;

    ETAView = self->_ETAView;
  }
  return ETAView;
}

- (IOSBasedChromeViewController)chromeViewController
{
  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (MKPointAnnotation)vehicleAnnotation
{
  return self->_vehicleAnnotation;
}

- (MKPointAnnotation)pickupAnnotation
{
  return self->_pickupAnnotation;
}

- (RidesharingPOIAnnotation)dropoffAnnotation
{
  return self->_dropoffAnnotation;
}

- (void)setDropoffAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_dropoffAnnotation, a3);
}

- (NSArray)waypointAnnotations
{
  return self->_waypointAnnotations;
}

- (void)setVehicleAnnotationView:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleAnnotationView, a3);
}

- (void)setPickupAnnotationView:(id)a3
{
  objc_storeStrong((id *)&self->_pickupAnnotationView, a3);
}

- (void)setETAView:(id)a3
{
  objc_storeStrong((id *)&self->_ETAView, a3);
}

- (BOOL)hasConfirmedRide
{
  return self->_hasConfirmedRide;
}

- (void)setHasConfirmedRide:(BOOL)a3
{
  self->_hasConfirmedRide = a3;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (_MKCustomFeatureStore)customFeatureStore
{
  return self->_customFeatureStore;
}

- (void)setCustomFeatureStore:(id)a3
{
  objc_storeStrong((id *)&self->_customFeatureStore, a3);
}

- (NSDate)lastVehicleLocationUpdateDate
{
  return self->_lastVehicleLocationUpdateDate;
}

- (void)setLastVehicleLocationUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastVehicleLocationUpdateDate, a3);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (RideBookingRideStatusObserverProxy)rideStatusObserverProxy
{
  return self->_rideStatusObserverProxy;
}

- (void)setRideStatusObserverProxy:(id)a3
{
  objc_storeStrong((id *)&self->_rideStatusObserverProxy, a3);
}

- (RideBookingRideStatus)rideStatus
{
  return self->_rideStatus;
}

- (void)setRideStatus:(id)a3
{
  objc_storeStrong((id *)&self->_rideStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideStatus, 0);
  objc_storeStrong((id *)&self->_rideStatusObserverProxy, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_lastVehicleLocationUpdateDate, 0);
  objc_storeStrong((id *)&self->_customFeatureStore, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_ETAView, 0);
  objc_storeStrong((id *)&self->_pickupAnnotationView, 0);
  objc_storeStrong((id *)&self->_vehicleAnnotationView, 0);
  objc_storeStrong((id *)&self->_waypointAnnotations, 0);
  objc_storeStrong((id *)&self->_dropoffAnnotation, 0);
  objc_storeStrong((id *)&self->_pickupAnnotation, 0);
  objc_storeStrong((id *)&self->_vehicleAnnotation, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
