@implementation CarBasicRouteGeniusModeController

- (CarBasicRouteGeniusModeController)initWithSuggestion:(id)a3
{
  id v5;
  CarBasicRouteGeniusModeController *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarBasicRouteGeniusModeController;
  v6 = -[CarBasicRouteGeniusModeController init](&v11, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_state = 0;
    objc_storeStrong((id *)&v6->_currentSuggestion, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
    objc_msgSend(v9, "registerObserver:", v6);

  }
  return v6;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
    self->_state = a3;
}

- (void)_updateForCurrentRoute
{
  void *v3;
  unsigned __int8 v4;
  GEOComposedRoute *currentlyDisplayedRoute;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  CarBasicRouteGeniusModeController *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  CarBasicRouteGeniusModeController *v27;
  CarBasicRouteGeniusModeController *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  CarBasicRouteGeniusModeController *v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  GEOComposedRoute *v42;
  __CFString *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  GEOComposedRoute *v50;
  GEOComposedRoute *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  __CFString *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  unint64_t v64;
  __int16 v65;
  unint64_t v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v4 = objc_msgSend(v3, "isCurrentContext:", self);

  if ((v4 & 1) != 0)
  {
    currentlyDisplayedRoute = self->_currentlyDisplayedRoute;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](self, "currentRoute"));
    v7 = -[GEOComposedRoute _MapsCarPlay_isEqual:](currentlyDisplayedRoute, "_MapsCarPlay_isEqual:", v6);

    v8 = sub_1004336BC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (!v10)
      {
LABEL_10:

        -[CarBasicRouteGeniusModeController recenterCameraOnRouteAnimated:](self, "recenterCameraOnRouteAnimated:", 1);
        return;
      }
      v11 = self;
      v12 = (objc_class *)objc_opt_class(v11);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
        v16 = v15;
        if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
        {
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

          goto LABEL_9;
        }

      }
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_9:

      v18 = v17;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](v11, "currentRoute"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "name"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](v11, "currentRoute"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "uniqueRouteID"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "UUIDString"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](v11, "currentRoute"));
      v20 = objc_msgSend(v19, "pointCount");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](self->_currentlyDisplayedRoute, "name"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](self->_currentlyDisplayedRoute, "uniqueRouteID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
      v24 = -[GEOComposedRoute pointCount](self->_currentlyDisplayedRoute, "pointCount");

      *(_DWORD *)buf = 138544898;
      v58 = v17;
      v59 = 2112;
      v60 = v53;
      v61 = 2112;
      v62 = v52;
      v63 = 2048;
      v64 = v20;
      v65 = 2112;
      v66 = (unint64_t)v21;
      v67 = 2112;
      v68 = v23;
      v69 = 2048;
      v70 = v24;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] setRoute, new route (name: %@, id: %@, points: %lu) was considered equal to current route (name: %@, id: %@, points: %lu), just recenter instead.", buf, 0x48u);

      goto LABEL_10;
    }
    if (!v10)
      goto LABEL_26;
    v35 = self;
    v36 = (objc_class *)objc_opt_class(v35);
    v37 = NSStringFromClass(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    if ((objc_opt_respondsToSelector(v35, "accessibilityIdentifier") & 1) != 0)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v35, "performSelector:", "accessibilityIdentifier"));
      v40 = v39;
      if (v39 && !objc_msgSend(v39, "isEqualToString:", v38))
      {
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v38, v35, v40));

        goto LABEL_25;
      }

    }
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v38, v35));
LABEL_25:

    v42 = self->_currentlyDisplayedRoute;
    v43 = v41;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](v42, "name"));
    v45 = -[GEOComposedRoute pointCount](self->_currentlyDisplayedRoute, "pointCount");

    v46 = (void *)v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](v35, "currentRoute"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](v35, "currentRoute"));
    *(_DWORD *)buf = 138544386;
    v58 = v41;
    v59 = 2112;
    v60 = v44;
    v61 = 2048;
    v62 = v46;
    v63 = 2112;
    v64 = (unint64_t)v48;
    v65 = 2048;
    v66 = objc_msgSend(v49, "pointCount");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] _updateForCurrentRoute route changed, updating pins and route annotations, previous: (%@, points: %lu), new: (%@, points: %lu)", buf, 0x34u);

LABEL_26:
    v50 = (GEOComposedRoute *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](self, "currentRoute"));
    v51 = self->_currentlyDisplayedRoute;
    self->_currentlyDisplayedRoute = v50;

    -[CarBasicRouteGeniusModeController updateRouteAnnotations](self, "updateRouteAnnotations");
    -[CarBasicRouteGeniusModeController updateSearchPins](self, "updateSearchPins");
    return;
  }
  v25 = sub_1004336BC();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = self;
    v28 = v27;
    if (!v27)
    {
      v34 = CFSTR("<nil>");
      goto LABEL_28;
    }
    v29 = (objc_class *)objc_opt_class(v27);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    if ((objc_opt_respondsToSelector(v28, "accessibilityIdentifier") & 1) != 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v28, "performSelector:", "accessibilityIdentifier"));
      v33 = v32;
      if (v32 && !objc_msgSend(v32, "isEqualToString:", v31))
      {
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v31, v28, v33));

        goto LABEL_18;
      }

    }
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v31, v28));
LABEL_18:

LABEL_28:
    *(_DWORD *)buf = 138543362;
    v58 = v34;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[%{public}@] _updateForCurrentRoute route changed, but we are not the current context; ignoring",
      buf,
      0xCu);

  }
}

- (void)updateSearchPins
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  CarBasicRouteGeniusModeController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const __CFString *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult carSearchResultFromDestination:](SearchResult, "carSearchResultFromDestination:", v3));
  -[CarBasicRouteGeniusModeController setDestinationPin:](self, "setDestinationPin:", v4);

  v5 = sub_1004336BC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_10;
  v7 = self;
  v8 = (objc_class *)objc_opt_class(v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

      goto LABEL_7;
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_7:

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController destinationPin](v7, "destinationPin"));
  v15 = CFSTR("updating");
  if (!v14)
    v15 = CFSTR("clearing");
  *(_DWORD *)buf = 138543618;
  v29 = v13;
  v30 = 2112;
  v31 = v15;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] %@ pins.", buf, 0x16u);

LABEL_10:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](self, "currentRoute"));
  v17 = v16 != 0;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "searchPinsManager"));
  objc_msgSend(v19, "setDisableStartPin:", v17);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "searchPinsManager"));
  objc_msgSend(v21, "setDisableEndPins:", v17);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController destinationPin](self, "destinationPin"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchPinsManager"));
  v25 = v24;
  if (v22)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController destinationPin](self, "destinationPin"));
    objc_msgSend(v25, "setStartPin:endPin:", v26, v27);

  }
  else
  {
    objc_msgSend(v24, "clearDirectionsPins");
  }

}

- (void)updateRouteAnnotations
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  unsigned __int8 v67;
  NSObject *v68;
  void *v69;
  id v70;
  CarBasicRouteGeniusModeController *v71;
  objc_class *v72;
  NSString *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  NSObject *v85;
  CarBasicRouteGeniusModeController *v86;
  CarBasicRouteGeniusModeController *v87;
  objc_class *v88;
  NSString *v89;
  void *v90;
  void *v91;
  void *v92;
  __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  unsigned int v97;
  __CFString *v98;
  __CFString *v99;
  unsigned int v100;
  void *v101;
  void *v102;
  CarBasicRouteGeniusModeController *v103;
  uint64_t v104;
  id v105;
  id v106;
  id obj;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE buf[22];
  __int16 v118;
  void *v119;
  __int16 v120;
  uint64_t v121;
  __int16 v122;
  __CFString *v123;
  _BYTE v124[128];
  _BYTE v125[128];

  v3 = objc_alloc((Class)MKMapItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRouteGeniusEntry entry](self->_currentSuggestion, "entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));
  v6 = objc_msgSend(v3, "initWithGeoMapItem:isPlaceHolderPlace:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeGeniusAnnotationsManager"));
  objc_msgSend(v8, "setDestination:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](self, "currentRoute"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](self, "currentRoute"));
    v11 = objc_msgSend(v10, "isNavigable");

  }
  else
  {
    v11 = 1;
  }

  v12 = 0;
  v100 = v11;
  if (!-[CarBasicRouteGeniusModeController navigationAidedDrivingEnabled](self, "navigationAidedDrivingEnabled") && v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](self, "currentRoute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entry"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:](SearchFieldItem, "searchFieldItemsForRouteInSuggestionsEntry:", v14));

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "waypoints"));
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v114;
    v18 = GEOMapItemEquivalenceDistanceThreshold;
    v103 = self;
    v104 = *(_QWORD *)v114;
    v101 = v12;
    do
    {
      v19 = 0;
      v105 = v16;
      do
      {
        if (*(_QWORD *)v114 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)v19);
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "origin"));
        if (v20 == (void *)v21)
          goto LABEL_35;
        v22 = (void *)v21;
        v23 = objc_msgSend(v20, "hasStyleAttributesData");

        if ((v23 & 1) != 0)
          goto LABEL_36;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "entry"));
        v26 = (uint64_t)objc_msgSend(v25, "type");

        if (v26 <= 6)
        {
          if (v26 == 1)
          {
            v27 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
            goto LABEL_28;
          }
          if (v26 == 2)
          {
            v27 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
            goto LABEL_28;
          }
        }
        else
        {
          switch(v26)
          {
            case 7:
              v27 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes parkedCarStyleAttributes](GEOFeatureStyleAttributes, "parkedCarStyleAttributes"));
              goto LABEL_28;
            case 19:
              v27 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
              goto LABEL_28;
            case 24:
              v27 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes sharedLocationStyleAttributes](GEOFeatureStyleAttributes, "sharedLocationStyleAttributes"));
              goto LABEL_28;
          }
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "destination"));

        if (v20 == v28)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "entry"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "geoMapItem"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "_styleAttributes"));

          goto LABEL_29;
        }
        v29 = objc_opt_class(GEOComposedWaypointEVStop);
        if ((objc_opt_isKindOfClass(v20, v29) & 1) == 0)
        {
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          v106 = v102;
          v45 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v110;
LABEL_41:
            v48 = 0;
            while (1)
            {
              if (*(_QWORD *)v110 != v47)
                objc_enumerationMutation(v106);
              v49 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v48);
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "searchResult"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "mapItem"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "_geoMapItem"));

              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geoMapItem"));
              objc_msgSend(v52, "coordinate");
              v55 = v54;
              v57 = v56;
              v58 = objc_msgSend(v53, "coordinate");
              if (GEOCalculateDistance(v58, v55, v57, v59, v60) < v18)
              {
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "name"));
                v108 = v49;
                v62 = v19;
                v63 = v20;
                v64 = v46;
                v65 = v47;
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "name"));
                v67 = objc_msgSend(v61, "isEqualToString:", v66);

                v47 = v65;
                v46 = v64;
                v20 = v63;
                v19 = v62;

                if ((v67 & 1) != 0)
                  break;
              }

              if (v46 == (id)++v48)
              {
                v46 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
                if (v46)
                  goto LABEL_41;
                goto LABEL_48;
              }
            }
            v68 = v108;

            if (!v68)
              goto LABEL_51;
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject searchResult](v68, "searchResult"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes styleAttributesForSearchResult:](GEOFeatureStyleAttributes, "styleAttributesForSearchResult:", v69));

            v12 = v101;
            self = v103;
            goto LABEL_59;
          }
LABEL_48:

LABEL_51:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes genericMarkerStyleAttributes](GEOFeatureStyleAttributes, "genericMarkerStyleAttributes"));
          v70 = sub_1004336BC();
          v68 = objc_claimAutoreleasedReturnValue(v70);
          self = v103;
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v71 = v103;
            v72 = (objc_class *)objc_opt_class(v71);
            v73 = NSStringFromClass(v72);
            v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
            if ((objc_opt_respondsToSelector(v71, "accessibilityIdentifier") & 1) == 0)
              goto LABEL_56;
            v75 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v71, "performSelector:", "accessibilityIdentifier"));
            v76 = v75;
            if (v75 && !objc_msgSend(v75, "isEqualToString:", v74))
            {
              v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v74, v71, v76));

            }
            else
            {

LABEL_56:
              v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v74, v71));
            }

            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v77;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v20;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get styleAttributes for waypoint: %@", buf, 0x16u);

          }
          v12 = v101;
LABEL_59:

          goto LABEL_29;
        }
        v27 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes evChargerStyleAttributes](GEOFeatureStyleAttributes, "evChargerStyleAttributes"));
LABEL_28:
        v30 = (void *)v27;
LABEL_29:
        v31 = objc_msgSend(v30, "copy");

        *(_OWORD *)buf = xmmword_100E3D050;
        objc_msgSend(v31, "replaceAttributes:count:", buf, 2);
        objc_msgSend(v20, "setStyleAttributes:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mapItemStorage"));

        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mapItemStorage"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "userValues"));
          v35 = v34;
          if (v34)
            v36 = v34;
          else
            v36 = (id)objc_opt_new(GEOMapItemStorageUserValues);
          v37 = v36;

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "entry"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "poiTitle"));
          objc_msgSend(v37, "setName:", v40);

          self = v103;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mapItemStorage"));
          objc_msgSend(v41, "setUserValues:", v37);

        }
        v20 = v31;
        v17 = v104;
        v16 = v105;
LABEL_35:

LABEL_36:
        v19 = (char *)v19 + 1;
      }
      while (v19 != v16);
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
      v16 = v78;
    }
    while (v78);
  }

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "routeGeniusAnnotationsManager"));
  objc_msgSend(v80, "setComposedRoute:", v12);

  if (v12)
  {
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v81, "captureUserAction:", 3072);

  }
  if (!-[CarBasicRouteGeniusModeController wantsNavigationDisplay](self, "wantsNavigationDisplay"))
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentRoute](self, "currentRoute"));

    if (v82)
    {
      -[CarBasicRouteGeniusModeController recenterCameraOnRouteAnimated:](self, "recenterCameraOnRouteAnimated:", 1);
    }
    else
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController routeGeniusMapSettings](self, "routeGeniusMapSettings"));
      objc_msgSend(v83, "applyToMapViewAnimated:duration:completion:", 1, 0, 0.0);

    }
  }
  v84 = sub_1004336BC();
  v85 = objc_claimAutoreleasedReturnValue(v84);
  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
  {
    v86 = self;
    v87 = v86;
    if (!v86)
    {
      v93 = CFSTR("<nil>");
      goto LABEL_77;
    }
    v88 = (objc_class *)objc_opt_class(v86);
    v89 = NSStringFromClass(v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    if ((objc_opt_respondsToSelector(v87, "accessibilityIdentifier") & 1) != 0)
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v87, "performSelector:", "accessibilityIdentifier"));
      v92 = v91;
      if (v91 && !objc_msgSend(v91, "isEqualToString:", v90))
      {
        v93 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v90, v87, v92));

        goto LABEL_75;
      }

    }
    v93 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v90, v87));
LABEL_75:

LABEL_77:
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueRouteID"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "UUIDString"));
    v97 = objc_msgSend(v12, "pointCount");
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v93;
    v98 = CFSTR("NO");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v94;
    if (v100)
      v98 = CFSTR("YES");
    v118 = 2112;
    v119 = v96;
    v120 = 2048;
    v121 = v97;
    v122 = 2112;
    v123 = v98;
    v99 = v98;
    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "[%{public}@] updating route annotations for route: %@, id: %@, points: %lu, isNavigable: %@", buf, 0x34u);

  }
}

- (id)personalizedItemSources
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchPinsManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeStartEndItemSource"));

  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (BOOL)wantsNavigationDisplay
{
  int IsDriveCameraEnabled;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  IsDriveCameraEnabled = CarDisplayIsDriveCameraEnabled();
  if (IsDriveCameraEnabled)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultMapSettings"));
    v6 = objc_msgSend(v5, "pitched");

    LOBYTE(IsDriveCameraEnabled) = v6;
  }
  return IsDriveCameraEnabled;
}

- (BOOL)shouldAccessoriesModifyMapInsets
{
  return 1;
}

- (BOOL)shouldMapControlsModifyMapInsets
{
  return 1;
}

- (void)configureNavigationDisplay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setCameraStyle:", 4);
  objc_msgSend(v4, "setCameraPaused:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  objc_msgSend(v4, "setRouteGeniusEntry:", v5);

}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  CarBasicRouteGeniusModeController *v14;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));

  if (v8)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100A77358;
    v15[3] = &unk_1011AC860;
    v15[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A775CC;
    v12[3] = &unk_1011AC8B0;
    v13 = v6;
    v14 = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A77698;
    v10[3] = &unk_1011ACCB8;
    v10[4] = self;
    v11 = v13;
    objc_msgSend(v7, "addPreparation:animations:completion:", v15, v12, v10);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v9, "endRouteGenius");

  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A77B74;
  v6[3] = &unk_1011AC8B0;
  v6[4] = self;
  v7 = a3;
  v5 = v7;
  objc_msgSend(a4, "addPreparation:", v6);

}

- (void)_clearAnnotations
{
  void *v3;
  void *v4;
  GEOComposedRoute *currentlyDisplayedRoute;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeGeniusAnnotationsManager"));
  objc_msgSend(v4, "clearAnnotations");

  currentlyDisplayedRoute = self->_currentlyDisplayedRoute;
  self->_currentlyDisplayedRoute = 0;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchPinsManager"));
  objc_msgSend(v6, "clearDirectionsPins");

}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (id)routeAnnotationsProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeGeniusAnnotationsManager"));

  return v3;
}

- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  CarBasicRouteGeniusModeController *v13;
  CarBasicRouteGeniusModeController *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  __CFString *v25;
  uint8_t buf[4];
  __CFString *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  __CFString *v31;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v10 = objc_msgSend(v9, "isCurrentContext:", self);

  if (v10)
  {
    v11 = sub_1004336BC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_17:

      -[CarBasicRouteGeniusModeController frameRouteAnimated:](self, "frameRouteAnimated:", 1);
      goto LABEL_18;
    }
    v13 = self;
    v14 = v13;
    if (!v13)
    {
      v20 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v15 = (objc_class *)objc_opt_class(v13);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_9;
      }

    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_9:

LABEL_11:
    v21 = v20;
    v22 = v8;
    v23 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "count"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", ")));
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v23, v24));

      }
      else
      {
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v23));
      }
    }
    else
    {
      v25 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138543874;
    v27 = v21;
    v28 = 2112;
    v29 = v7;
    v30 = 2112;
    v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] poiShapeLoader:didLoadStartPOIShape: %@, endPOIShapes: %@", buf, 0x20u);

    goto LABEL_17;
  }
LABEL_18:

}

- (void)_externalDeviceUpdated:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance", a3));
  -[CarBasicRouteGeniusModeController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", objc_msgSend(v4, "isNavigationAidedDrivingEnabled"));

}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    -[CarBasicRouteGeniusModeController updateRouteAnnotations](self, "updateRouteAnnotations");
  }
}

- (void)frameRouteAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  CarBasicRouteGeniusModeController *v11;
  CarBasicRouteGeniusModeController *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  CarBasicRouteGeniusModeController *v19;
  CarBasicRouteGeniusModeController *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  uint8_t buf[4];
  __CFString *v29;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeGeniusAnnotationsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));

  v8 = sub_1004336BC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      v10 = objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeGeniusAnnotationsManager](v10, "routeGeniusAnnotationsManager"));
      objc_msgSend(v27, "frameRouteAnimated:", v3);

      goto LABEL_23;
    }
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_9;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_9:

LABEL_19:
    *(_DWORD *)buf = 138543362;
    v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] framing route.", buf, 0xCu);

    goto LABEL_20;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v19 = self;
    v20 = v19;
    if (!v19)
    {
      v26 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v21 = (objc_class *)objc_opt_class(v19);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_17;
      }

    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_17:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v29 = v26;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] new routeGeniusAnnotationsManager.destination is nil. won't be framing on route.", buf, 0xCu);

  }
LABEL_23:

}

- (void)recenterCameraOnRouteAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  CarBasicRouteGeniusModeController *v11;
  CarBasicRouteGeniusModeController *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  CarBasicRouteGeniusModeController *v19;
  CarBasicRouteGeniusModeController *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  uint8_t buf[4];
  __CFString *v29;

  v3 = a3;
  if (!-[CarBasicRouteGeniusModeController wantsNavigationDisplay](self, "wantsNavigationDisplay"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeGeniusAnnotationsManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));

    v8 = sub_1004336BC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v7)
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        v10 = objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeGeniusAnnotationsManager](v10, "routeGeniusAnnotationsManager"));
        objc_msgSend(v27, "recenterCameraOnRouteAnimated:", v3);

        goto LABEL_24;
      }
      v11 = self;
      v12 = v11;
      if (!v11)
      {
        v18 = CFSTR("<nil>");
        goto LABEL_20;
      }
      v13 = (objc_class *)objc_opt_class(v11);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
        v17 = v16;
        if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
        {
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

          goto LABEL_10;
        }

      }
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_10:

LABEL_20:
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] recentering on route.", buf, 0xCu);

      goto LABEL_21;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_24:

      return;
    }
    v19 = self;
    v20 = v19;
    if (!v19)
    {
      v26 = CFSTR("<nil>");
      goto LABEL_23;
    }
    v21 = (objc_class *)objc_opt_class(v19);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_18;
      }

    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_18:

LABEL_23:
    *(_DWORD *)buf = 138543362;
    v29 = v26;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] new routeGeniusAnnotationsManager.destination is nil. won't be recentering on route.", buf, 0xCu);

    goto LABEL_24;
  }
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  -[MapsThrottler setValue:](self->_locationUpdateReframingThrottler, "setValue:", a4);
}

- (void)setCurrentSuggestion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  CarBasicRouteGeniusModeController *v10;
  CarBasicRouteGeniusModeController *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  CarBasicRouteGeniusModeController *v18;
  id *p_isa;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  unint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;

  v5 = a3;
  v6 = -[CarBasicRouteGeniusModeController state](self, "state");
  v7 = sub_1004336BC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6 >= 1)
  {
    if (!v9)
    {
LABEL_23:

      goto LABEL_29;
    }
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_9;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_9:

LABEL_19:
    v26 = -[CarBasicRouteGeniusModeController state](v11, "state");
    if (v26 > 4)
      v27 = CFSTR("Unknown");
    else
      v27 = off_1011E0FF8[v26];
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](v11, "currentSuggestion"));
    *(_DWORD *)buf = 138544131;
    v37 = v17;
    v38 = 2112;
    v39 = v27;
    v40 = 2113;
    v41 = v5;
    v42 = 2113;
    v43 = v28;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] ignoring changed prediction, state=%@ currentCommuteDestination=%{private}@ _currentCommuteDestination=%{private}@", buf, 0x2Au);

    goto LABEL_23;
  }
  if (v9)
  {
    v18 = self;
    p_isa = (id *)&v18->super.isa;
    if (!v18)
    {
      v25 = CFSTR("<nil>");
      goto LABEL_25;
    }
    v20 = (objc_class *)objc_opt_class(v18);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if ((objc_opt_respondsToSelector(p_isa, "accessibilityIdentifier") & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "performSelector:", "accessibilityIdentifier"));
      v24 = v23;
      if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
      {
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, p_isa, v24));

        goto LABEL_17;
      }

    }
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, p_isa));
LABEL_17:

LABEL_25:
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[6], "entry"));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "title"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entry"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "title"));
    *(_DWORD *)buf = 138543875;
    v37 = v25;
    v38 = 2113;
    v39 = v30;
    v40 = 2113;
    v41 = v32;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] setting currentCommute destination. _currentCommuteDestination: %{private}@, currentCommuteDestination: %{private}@", buf, 0x20u);

  }
  objc_storeStrong((id *)&self->_currentSuggestion, a3);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v34 = objc_msgSend(v33, "isTopContext:", self);

  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
    objc_msgSend(v35, "setNeedsUpdateComponent:animated:", CFSTR("navigationDisplay"), 1);

  }
  -[CarBasicRouteGeniusModeController _updateForCurrentRoute](self, "_updateForCurrentRoute");
LABEL_29:

}

- (id)currentRoute
{
  return -[MapsSuggestionsRouteGeniusEntry route](self->_currentSuggestion, "route");
}

- (MapsSuggestionsRouteGeniusEntry)currentSuggestion
{
  return self->_currentSuggestion;
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)didUpdateRouteGenius:(id)a3
{
  -[CarBasicRouteGeniusModeController setCurrentSuggestion:](self, "setCurrentSuggestion:", a3);
  -[CarBasicRouteGeniusModeController _updateForCurrentRoute](self, "_updateForCurrentRoute");
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)navigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (ChromeMapSettings)routeGeniusMapSettings
{
  return self->_routeGeniusMapSettings;
}

- (void)setRouteGeniusMapSettings:(id)a3
{
  objc_storeStrong((id *)&self->_routeGeniusMapSettings, a3);
}

- (SearchResult)destinationPin
{
  return self->_destinationPin;
}

- (void)setDestinationPin:(id)a3
{
  objc_storeStrong((id *)&self->_destinationPin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPin, 0);
  objc_storeStrong((id *)&self->_routeGeniusMapSettings, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_locationUpdateReframingThrottler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentlyDisplayedRoute, 0);
}

@end
