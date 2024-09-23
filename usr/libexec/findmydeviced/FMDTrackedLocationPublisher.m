@implementation FMDTrackedLocationPublisher

- (void)startPublishingWithBlock:(id)a3
{
  -[FMDTrackedLocationPublisher setPublishingBlock:](self, "setPublishingBlock:", a3);
  -[FMDTrackedLocationPublisher setStartedPublishing:](self, "setStartedPublishing:", 1);
}

- (void)updatedLocations:(id)a3
{
  -[FMDTrackedLocationPublisher updatedLocations:reason:](self, "updatedLocations:reason:", a3, 0);
}

- (void)updatedLocations:(id)a3 reason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  id v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  NSObject *v45;
  _BOOL4 v46;
  id v47;
  NSObject *v48;
  _BOOL4 v49;
  FMDTrackedLocationPublisher *v50;
  NSObject *v51;
  id v52;
  id v53;
  NSObject *v54;
  int v55;
  double v56;

  v6 = a3;
  if (!-[FMDTrackedLocationPublisher startedPublishing](self, "startedPublishing"))
  {
    v52 = sub_100052EEC();
    v7 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100226A80(v7);
    goto LABEL_27;
  }
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v8 = objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationPublisher lastLocation](self, "lastLocation"));
    -[FMDTrackedLocationPublisher setLastLocation:](self, "setLastLocation:", v7);
    if (!v8)
    {
      v53 = sub_1000031B8();
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v55) = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "New location is the first recorded location. Recording this location...", (uint8_t *)&v55, 2u);
      }

      -[FMDTrackedLocationPublisher _publishResultLocation:reason:](self, "_publishResultLocation:reason:", v7, a4);
      goto LABEL_26;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject latitude](v7, "latitude"));
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject longitude](v7, "longitude"));
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v7, "horizontalAccuracy"));
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject verticalAccuracy](v7, "verticalAccuracy"));
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject floor](v7, "floor"));
    v22 = objc_msgSend(v21, "integerValue");

    v23 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v11, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject latitude](v8, "latitude"));
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject longitude](v8, "longitude"));
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject horizontalAccuracy](v8, "horizontalAccuracy"));
    objc_msgSend(v30, "doubleValue");
    v32 = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject verticalAccuracy](v8, "verticalAccuracy"));
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject floor](v8, "floor"));
    v37 = objc_msgSend(v36, "integerValue");

    v38 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v26, v29);
    objc_msgSend(v23, "distanceFromLocation:", v38);
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationPublisher minimumDistance](self, "minimumDistance"));
    objc_msgSend(v41, "doubleValue");
    v43 = v42;

    v44 = sub_1000031B8();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    if (v40 < v43 && v37 == v22)
    {
      if (v46)
      {
        v55 = 134217984;
        v56 = v40;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "New location was %f metres away (not significant enough) from the previous recorded location.", (uint8_t *)&v55, 0xCu);
      }

      v47 = sub_1000031B8();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
      if (v17 >= v32 && v20 >= v35)
      {
        if (v49)
        {
          LOWORD(v55) = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "New location does not have a better accuracy.", (uint8_t *)&v55, 2u);
        }

        v50 = self;
        v51 = v8;
        goto LABEL_25;
      }
      if (v49)
      {
        LOWORD(v55) = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "New location has a better accuracy. Replacing the previous recorded location...", (uint8_t *)&v55, 2u);
      }

    }
    else
    {
      if (v46)
      {
        v55 = 134217984;
        v56 = v40;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "New location was %f metres away (significant enough) from the previous recorded location. Recording this location anew...", (uint8_t *)&v55, 0xCu);
      }

    }
    v50 = self;
    v51 = v7;
LABEL_25:
    -[FMDTrackedLocationPublisher _publishResultLocation:reason:](v50, "_publishResultLocation:reason:", v51, a4);

LABEL_26:
LABEL_27:

  }
}

- (void)_publishResultLocation:(id)a3 reason:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int64_t v12;

  v6 = a3;
  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDTrackedLocationPublisher _publishResultLocation %li", (uint8_t *)&v11, 0xCu);
  }

  -[FMDTrackedLocationPublisher setLastPublishedLocation:](self, "setLastPublishedLocation:", v6);
  v9 = objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationPublisher publishingBlock](self, "publishingBlock"));
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id, int64_t))(v9 + 16))(v9, 0, v6, a4);

}

- (void)flushLocations
{
  void *v3;
  void *v4;
  void *v5;

  -[FMDTrackedLocationPublisher setLastLocation:](self, "setLastLocation:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationPublisher lastLocation](self, "lastLocation"));
  if (v3)
  {
    v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationPublisher lastPublishedLocation](self, "lastPublishedLocation"));

    v3 = v5;
    if (v5 != v4)
    {
      -[FMDTrackedLocationPublisher _publishResultLocation:reason:](self, "_publishResultLocation:reason:", v5, 5);
      -[FMDTrackedLocationPublisher setLastLocation:](self, "setLastLocation:", 0);
      v3 = v5;
    }
  }

}

- (NSNumber)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_startThreshold, a3);
}

- (NSNumber)endThreshold
{
  return self->_endThreshold;
}

- (void)setEndThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_endThreshold, a3);
}

- (NSNumber)decayFactor
{
  return self->_decayFactor;
}

- (void)setDecayFactor:(id)a3
{
  objc_storeStrong((id *)&self->_decayFactor, a3);
}

- (NSNumber)publishTimeInterval
{
  return self->_publishTimeInterval;
}

- (void)setPublishTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_publishTimeInterval, a3);
}

- (NSNumber)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDistance, a3);
}

- (NSNumber)cachedLocationValidityTimeInterval
{
  return self->_cachedLocationValidityTimeInterval;
}

- (void)setCachedLocationValidityTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLocationValidityTimeInterval, a3);
}

- (id)publishingBlock
{
  return self->_publishingBlock;
}

- (void)setPublishingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)startedPublishing
{
  return self->_startedPublishing;
}

- (void)setStartedPublishing:(BOOL)a3
{
  self->_startedPublishing = a3;
}

- (FMGeoLocatable)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (FMGeoLocatable)lastPublishedLocation
{
  return self->_lastPublishedLocation;
}

- (void)setLastPublishedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastPublishedLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPublishedLocation, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong(&self->_publishingBlock, 0);
  objc_storeStrong((id *)&self->_cachedLocationValidityTimeInterval, 0);
  objc_storeStrong((id *)&self->_minimumDistance, 0);
  objc_storeStrong((id *)&self->_publishTimeInterval, 0);
  objc_storeStrong((id *)&self->_decayFactor, 0);
  objc_storeStrong((id *)&self->_endThreshold, 0);
  objc_storeStrong((id *)&self->_startThreshold, 0);
}

@end
