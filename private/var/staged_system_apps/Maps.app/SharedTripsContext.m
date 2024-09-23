@implementation SharedTripsContext

- (SharedTripsContext)init
{
  SharedTripsContext *v2;
  id v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  SharedTripsContext *v8;

  v6.receiver = self;
  v6.super_class = (Class)SharedTripsContext;
  v2 = -[SharedTripsContext init](&v6, "init");
  if (v2)
  {
    v3 = sub_10096E668();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    -[SharedTripsContext _updateSharedTrips](v2, "_updateSharedTrips");
  }
  return v2;
}

- (SharedTripsContext)initWithInitialSelectedSharedTrip:(id)a3
{
  id v4;
  SharedTripsContext *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSString *selectedTripID;
  int v12;
  SharedTripsContext *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = -[SharedTripsContext init](self, "init");
  if (v5)
  {
    v6 = sub_10096E668();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
      v12 = 134349314;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with shared trip: %@", (uint8_t *)&v12, 0x16u);

    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
    selectedTripID = v5->_selectedTripID;
    v5->_selectedTripID = (NSString *)v9;

  }
  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  SharedTripsContext *v7;

  v3 = sub_10096E668();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SharedTripsContext;
  -[SharedTripsContext dealloc](&v5, "dealloc");
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldShowRoute
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext mapView](self, "mapView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom") != (id)3;

  return v4;
}

- (void)recenterOnRouteAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTripsAnnotationsController](self, "sharedTripsAnnotationsController"));
  objc_msgSend(v4, "recenterOnRouteAnimated:", v3);

}

- (void)becomeCurrent:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSString *v8;
  NSString *selectedTripID;
  void *v10;
  void *v11;
  id v12;

  -[SharedTripsContext _updateSharedTrips](self, "_updateSharedTrips", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTrips](self, "sharedTrips"));
    v6 = objc_msgSend(v5, "count");

    if (v6 != (id)1)
      goto LABEL_5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTrips](self, "sharedTrips"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
    selectedTripID = self->_selectedTripID;
    self->_selectedTripID = v8;

  }
LABEL_5:
  v12 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));
  if (v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTripsAnnotationsController](self, "sharedTripsAnnotationsController"));
    objc_msgSend(v10, "setSharedTrip:", v12);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  objc_msgSend(v11, "addReceivingObserver:", self);

}

- (void)resignCurrent:(BOOL)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance", a3));
  objc_msgSend(v4, "removeReceivingObserver:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTripsAnnotationsController](self, "sharedTripsAnnotationsController"));
  objc_msgSend(v5, "setSharedTrip:", 0);

}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTripsAnnotationsController](self, "sharedTripsAnnotationsController", a3, a4, a5));
  objc_msgSend(v5, "setAutomaticallyRecenter:", 0);

}

- (void)_updateEverything
{
  void *v3;

  -[SharedTripsContext _updateSharedTrips](self, "_updateSharedTrips");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTripsAnnotationsController](self, "sharedTripsAnnotationsController"));
  objc_msgSend(v3, "reload");

  if (!-[NSArray count](self->_sharedTrips, "count"))
    -[SharedTripsContext dismiss](self, "dismiss");
}

- (void)_updateSharedTrips
{
  NSArray *v3;
  NSArray *sharedTrips;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "receivedTrips"));
  sharedTrips = self->_sharedTrips;
  self->_sharedTrips = v3;

}

- (void)setSelectedTrip:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  SharedTripsContext *v7;
  SharedTripsContext *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSString *v16;
  NSString *selectedTripID;
  __CFString *v18;
  id v19;
  NSObject *v20;
  SharedTripsContext *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  id v28;
  NSObject *v29;
  SharedTripsContext *v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  id v38;
  __CFString *v39;
  id v40;
  SharedTripsContext *v41;
  objc_class *v42;
  NSString *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  uint64_t v49;
  void *v50;
  uint64_t UInteger;
  uint8_t buf[4];
  __CFString *v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  unsigned int v61;

  v4 = a3;
  v5 = sub_10096E668();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
    *(_DWORD *)buf = 138544386;
    v53 = v14;
    v54 = 2112;
    v55 = v15;
    v56 = 2048;
    v57 = objc_msgSend(v4, "transportType");
    v58 = 2048;
    v59 = objc_msgSend(v4, "protocolVersion");
    v60 = 1024;
    v61 = objc_msgSend(v4, "referenceFrame");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Selecting trip: %@, transportType: %lu, protocolVersion: %lu, referenceFrame: %d", buf, 0x30u);

  }
  v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
  selectedTripID = self->_selectedTripID;
  self->_selectedTripID = v16;

  v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));
  if (!v18)
    goto LABEL_38;
  if (!-[__CFString disallowDetailsForChina](v18, "disallowDetailsForChina"))
  {
    if (-[__CFString disallowDetailsForTransportType](v18, "disallowDetailsForTransportType"))
    {
      v28 = sub_10096E668();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = self;
        v31 = (objc_class *)objc_opt_class(v30);
        v32 = NSStringFromClass(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        if ((objc_opt_respondsToSelector(v30, "accessibilityIdentifier") & 1) != 0)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext performSelector:](v30, "performSelector:", "accessibilityIdentifier"));
          v35 = v34;
          if (v34 && !objc_msgSend(v34, "isEqualToString:", v33))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v33, v30, v35));

            goto LABEL_28;
          }

        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v33, v30));
LABEL_28:

        v37 = v36;
        v38 = -[__CFString transportType](v18, "transportType");
        if (v38 >= 7)
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v38));
        else
          v39 = off_1011DCE98[(int)v38];
        UInteger = GEOConfigGetUInteger(GEOConfigMSPShareETASupportedReceivingTransportTypes[0], GEOConfigMSPShareETASupportedReceivingTransportTypes[1]);
        *(_DWORD *)buf = 138544130;
        v53 = v37;
        v54 = 2112;
        v55 = v39;
        v56 = 2048;
        v57 = UInteger;
        v58 = 2112;
        v59 = (unint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%{public}@] Selected trip is not allowed for transport type: %@. Allowed transport type bitmask: %lu. Trip: %@", buf, 0x2Au);

      }
LABEL_42:

      -[SharedTripsContext presentErrorForUnsupportedProtocolOrTransportWithTrip:](self, "presentErrorForUnsupportedProtocolOrTransportWithTrip:", v18);
      goto LABEL_43;
    }
    if (-[__CFString disallowDetailsForProtocolVersion](v18, "disallowDetailsForProtocolVersion"))
    {
      v40 = sub_10096E668();
      v29 = objc_claimAutoreleasedReturnValue(v40);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      v41 = self;
      v42 = (objc_class *)objc_opt_class(v41);
      v43 = NSStringFromClass(v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      if ((objc_opt_respondsToSelector(v41, "accessibilityIdentifier") & 1) != 0)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext performSelector:](v41, "performSelector:", "accessibilityIdentifier"));
        v46 = v45;
        if (v45 && !objc_msgSend(v45, "isEqualToString:", v44))
        {
          v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v44, v41, v46));

          goto LABEL_37;
        }

      }
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v44, v41));
LABEL_37:

      v48 = (__CFString *)-[__CFString protocolVersion](v18, "protocolVersion");
      v49 = GEOConfigGetUInteger(MapsConfig_ShareETASupportedReceivedProtocolVersion, off_1014B3638);
      *(_DWORD *)buf = 138544130;
      v53 = v47;
      v54 = 2048;
      v55 = v48;
      v56 = 2048;
      v57 = v49;
      v58 = 2112;
      v59 = (unint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%{public}@] Selected trip protocol (%lu) is greater than ours (%lu). Trip: %@", buf, 0x2Au);

      goto LABEL_42;
    }
LABEL_38:
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTripsAnnotationsController](self, "sharedTripsAnnotationsController"));
    objc_msgSend(v50, "setSharedTrip:", v18);

    -[SharedTripsContext presentDetailsForSelectedTrip](self, "presentDetailsForSelectedTrip");
    goto LABEL_43;
  }
  v19 = sub_10096E668();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = self;
    v22 = (objc_class *)objc_opt_class(v21);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((objc_opt_respondsToSelector(v21, "accessibilityIdentifier") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext performSelector:](v21, "performSelector:", "accessibilityIdentifier"));
      v26 = v25;
      if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
      {
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

        goto LABEL_19;
      }

    }
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
LABEL_19:

    *(_DWORD *)buf = 138543618;
    v53 = v27;
    v54 = 2112;
    v55 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Selected trip is not allowed for China: %@", buf, 0x16u);

  }
  -[SharedTripsContext presentErrorForChinaTrip:](self, "presentErrorForChinaTrip:", v18);
LABEL_43:

}

- (GEOSharedNavState)selectedTrip
{
  NSArray *sharedTrips;
  id v4;
  _QWORD v6[5];

  sharedTrips = self->_sharedTrips;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10096F210;
  v6[3] = &unk_1011B06F0;
  v6[4] = self;
  v4 = -[NSArray indexOfObjectPassingTest:](sharedTrips, "indexOfObjectPassingTest:", v6);
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    return (GEOSharedNavState *)0;
  else
    return (GEOSharedNavState *)(id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sharedTrips, "objectAtIndexedSubscript:", v4));
}

- (void)presentDetailsForSelectedTrip
{
  -[SharedTripsContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)presentErrorForChinaTrip:(id)a3
{
  -[SharedTripsContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)presentErrorForUnsupportedProtocolOrTransportWithTrip:(id)a3
{
  -[SharedTripsContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
  void *v5;
  unsigned int v6;
  id v7;

  v7 = a4;
  -[SharedTripsContext _updateSharedTrips](self, "_updateSharedTrips");
  if (-[NSArray count](self->_sharedTrips, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupIdentifier"));
    v6 = objc_msgSend(v5, "isEqualToString:", self->_selectedTripID);

    if (v6)
      -[SharedTripsContext setSelectedTrip:](self, "setSelectedTrip:", 0);
  }
  else
  {
    -[SharedTripsContext dismiss](self, "dismiss");
  }

}

- (MapCameraController)cameraController
{
  return self->_cameraController;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (PersonalizedItemManager)personalizedItemManager
{
  return self->_personalizedItemManager;
}

- (RouteAnnotationsController)routeAnnotationsController
{
  return self->_routeAnnotationsController;
}

- (SharedTripsAnnotationsController)sharedTripsAnnotationsController
{
  return self->_sharedTripsAnnotationsController;
}

- (SearchPinsManager)searchPinsManager
{
  return self->_searchPinsManager;
}

- (NSArray)sharedTrips
{
  return self->_sharedTrips;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTrips, 0);
  objc_storeStrong((id *)&self->_searchPinsManager, 0);
  objc_storeStrong((id *)&self->_sharedTripsAnnotationsController, 0);
  objc_storeStrong((id *)&self->_routeAnnotationsController, 0);
  objc_storeStrong((id *)&self->_personalizedItemManager, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_cameraController, 0);
  objc_storeStrong((id *)&self->_selectedTripID, 0);
}

@end
