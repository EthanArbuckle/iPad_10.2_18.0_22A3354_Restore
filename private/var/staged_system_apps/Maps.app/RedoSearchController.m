@implementation RedoSearchController

- (RedoSearchController)initWithMapState:(id)a3 zoomLevel:(double)a4
{
  id v6;
  RedoSearchController *v7;
  RedoSearchMapState *v8;
  RedoSearchMapState *originalState;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RedoSearchController;
  v7 = -[RedoSearchController init](&v11, "init");
  if (v7)
  {
    v8 = -[RedoSearchMapState initWithMapRegion:zoomLevel:]([RedoSearchMapState alloc], "initWithMapRegion:zoomLevel:", v6, a4);
    originalState = v7->_originalState;
    v7->_originalState = v8;

  }
  return v7;
}

- (BOOL)shouldShowManualRedoSearchButton:(id)a3 searchResults:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "numberOfVisiblePoisThreshold");
  objc_msgSend(v7, "panDeltaThresholdInMeters");
  v10 = v9;
  objc_msgSend(v7, "zoomInPercentThreshold");
  v12 = v11;
  objc_msgSend(v7, "zoomOutPercentThreshold");
  v14 = v13;

  LOBYTE(v7) = -[RedoSearchController shouldTriggerSearchHereWithMinimumNumberOfVisiblePOIs:panDeltaThresholdInMeters:zoomInPercentageThreshold:zoomOutPercentageThreshold:searchResults:](self, "shouldTriggerSearchHereWithMinimumNumberOfVisiblePOIs:panDeltaThresholdInMeters:zoomInPercentageThreshold:zoomOutPercentageThreshold:searchResults:", v8, v6, v10, v12, v14);
  return (char)v7;
}

- (BOOL)shouldTriggerAutoRedoWithThreshold:(id)a3 searchResults:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "numberOfVisiblePoisThreshold");
  objc_msgSend(v7, "panDeltaThresholdInMeters");
  v10 = v9;
  objc_msgSend(v7, "zoomInPercentThreshold");
  v12 = v11;
  objc_msgSend(v7, "zoomOutPercentThreshold");
  v14 = v13;

  LOBYTE(v7) = -[RedoSearchController shouldTriggerSearchHereWithMinimumNumberOfVisiblePOIs:panDeltaThresholdInMeters:zoomInPercentageThreshold:zoomOutPercentageThreshold:searchResults:](self, "shouldTriggerSearchHereWithMinimumNumberOfVisiblePOIs:panDeltaThresholdInMeters:zoomInPercentageThreshold:zoomOutPercentageThreshold:searchResults:", v8, v6, v10, v12, v14);
  return (char)v7;
}

- (BOOL)shouldTriggerSearchHereWithMinimumNumberOfVisiblePOIs:(unint64_t)a3 panDeltaThresholdInMeters:(double)a4 zoomInPercentageThreshold:(double)a5 zoomOutPercentageThreshold:(double)a6 searchResults:(id)a7
{
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  unint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  unint64_t v45;
  BOOL v47;
  const __CFString *v48;
  id v49;
  NSObject *v50;
  id v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  unint64_t v58;
  uint8_t buf[4];
  double v60;
  __int16 v61;
  double v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  const __CFString *v70;

  v12 = a7;
  v13 = objc_claimAutoreleasedReturnValue(-[RedoSearchController currentState](self, "currentState"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController originalState](self, "originalState"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController currentState](self, "currentState"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController originalState](self, "originalState"));
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (v18)
      {
        v19 = sub_100432AEC();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Current and Original states are equal, ignoring.", buf, 2u);
        }
        LOBYTE(v15) = 0;
LABEL_30:

        goto LABEL_31;
      }
      v58 = a3;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController originalState](self, "originalState"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mapRegion"));
      objc_msgSend(v22, "centerLat");
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController originalState](self, "originalState"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mapRegion"));
      objc_msgSend(v26, "centerLng");
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController currentState](self, "currentState"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mapRegion"));
      objc_msgSend(v30, "centerLat");
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController currentState](self, "currentState"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "mapRegion"));
      v35 = objc_msgSend(v34, "centerLng");
      v37 = GEOCalculateDistance(v35, v24, v28, v32, v36);

      *(double *)&v38 = COERCE_DOUBLE((id)-[RedoSearchController numberOfVisibleSearchResults:](self, "numberOfVisibleSearchResults:", v12));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController currentState](self, "currentState"));
      objc_msgSend(v39, "zoomLevel");
      v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController originalState](self, "originalState"));
      objc_msgSend(v42, "zoomLevel");
      v44 = v41 / v43 * 100.0;

      if (v44 <= 100.0)
      {
        v45 = v58;
        if (v44 >= 100.0)
        {
          if (v37 > a4 && v38 < v58)
          {
            v48 = CFSTR("Triggered with reason: distance && visible results number");
            LOBYTE(v15) = 1;
            goto LABEL_26;
          }
LABEL_22:
          LOBYTE(v15) = 0;
          v48 = CFSTR("Not triggered");
LABEL_26:
          v49 = sub_100432AEC();
          v50 = objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218752;
            v60 = *(double *)&v45;
            v61 = 2048;
            v62 = a4;
            v63 = 2048;
            v64 = a5;
            v65 = 2048;
            v66 = a6;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Thresholds - Number of results: %lu. Distance: %f Zoom in: %f. Zoom out: %f.", buf, 0x2Au);
          }

          v51 = sub_100432AEC();
          v20 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController currentState](self, "currentState"));
            objc_msgSend(v52, "zoomLevel");
            v54 = v53;
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController originalState](self, "originalState"));
            objc_msgSend(v55, "zoomLevel");
            *(_DWORD *)buf = 134219266;
            v60 = v37;
            v61 = 2048;
            v62 = *(double *)&v38;
            v63 = 2048;
            v64 = v54;
            v65 = 2048;
            v66 = v56;
            v67 = 2048;
            v68 = v44;
            v69 = 2112;
            v70 = v48;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Distance: %f. Number of Visible results: %lu. Current zoom: %f. Original zoom: %f. Percentage: %f. %@", buf, 0x3Eu);

          }
          goto LABEL_30;
        }
        v47 = 100.0 - v44 > a6;
      }
      else
      {
        v45 = v58;
        v47 = v44 + -100.0 > a5 && v38 < v58;
      }
      if (v37 > a4 && v38 < v45)
        v48 = CFSTR("Triggered with reason: distance && visible results number");
      else
        v48 = CFSTR("Triggered with reason: zoom level");
      LOBYTE(v15) = 1;
      if (v37 > a4 && v38 < v45 || v47)
        goto LABEL_26;
      goto LABEL_22;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
LABEL_31:

  return (char)v15;
}

- (unint64_t)numberOfVisibleSearchResults:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100631B48;
  v7[3] = &unk_1011BE900;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (RedoSearchMapState)originalState
{
  return self->_originalState;
}

- (void)setOriginalState:(id)a3
{
  objc_storeStrong((id *)&self->_originalState, a3);
}

- (RedoSearchMapState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_originalState, 0);
}

@end
