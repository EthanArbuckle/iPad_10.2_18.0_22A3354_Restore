@implementation APLogVideoAnalyticsEventRequester

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBLogVideoAnalyticsEventResponse, a2);
}

- (BOOL)isAllowedEmptyResponse
{
  return 1;
}

- (APLogVideoAnalyticsEventRequester)initWithMetric:(id)a3 internalContent:(id)a4 andContext:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12;
  id v13;
  APLogVideoAnalyticsEventRequester *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  APLogVideoAnalyticsEventRequester *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  int *p_duration;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  double *p_position;
  double v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  double *p_volume;
  double v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  int v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  int v99;
  objc_super v100;
  uint8_t buf[4];
  uint64_t v102;
  __int16 v103;
  id v104;

  v12 = a3;
  v13 = a4;
  v100.receiver = self;
  v100.super_class = (Class)APLogVideoAnalyticsEventRequester;
  v14 = -[APLegacyMetricRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:](&v100, "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v12, v13, a5, a6, a7);
  if (!v14)
    goto LABEL_66;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
  v16 = objc_msgSend(v15, "videoUnloadedSent");

  if (!v16)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
    v24 = metricPropertyValue(v23, (void *)0x12);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
      v28 = metricPropertyValue(v27, (void *)0x12);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v14->_visiblePercent = (int)objc_msgSend(v29, "intValue");

    }
    else
    {
      v14->_visiblePercent = -1;
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
    v31 = metricPropertyValue(v30, (void *)8);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
      v35 = metricPropertyValue(v34, (void *)8);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      p_duration = &v14->_duration;
      v14->_duration = objc_msgSend(v36, "intValue");

    }
    else
    {
      p_duration = &v14->_duration;
      v14->_duration = -1;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
    v39 = metricPropertyValue(v38, (void *)0x17);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
      v43 = metricPropertyValue(v42, (void *)0x17);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v99 = objc_msgSend(v44, "intValue");

    }
    else
    {
      v99 = -1;
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
    v46 = metricPropertyValue(v45, (void *)0x16);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v48 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
      v50 = metricPropertyValue(v49, (void *)0x16);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      objc_msgSend(v51, "doubleValue");
      p_position = &v14->_position;
      v14->_position = v53;

    }
    else
    {
      p_position = &v14->_position;
      v14->_position = -1.0;
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
    v55 = metricPropertyValue(v54, (void *)0x2C);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v57 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v56, v57) & 1) != 0)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
      v59 = metricPropertyValue(v58, (void *)0x2C);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      objc_msgSend(v60, "doubleValue");
      p_volume = &v14->_volume;
      v14->_volume = v62;

    }
    else
    {
      p_volume = &v14->_volume;
      v14->_volume = -1.0;
    }

    v14->_videoState = -1;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
    v64 = (uint64_t)objc_msgSend(v63, "metric");

    if (v64 > 2502)
    {
      if (v64 == 2503)
      {
        v66 = 16;
LABEL_64:
        v14->_videoState = v66;
      }
      else
      {
        if (v64 != 77003)
        {
LABEL_31:
          v67 = APLogForCategory(21);
          v18 = objc_claimAutoreleasedReturnValue(v67);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_6;
          v68 = objc_opt_class(v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
          v69 = objc_msgSend(v20, "metric");
          *(_DWORD *)buf = 138543618;
          v102 = v68;
          v103 = 2048;
          v104 = v69;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid metric type for %{public}@: %ld. Not sending legacy metric.", buf, 0x16u);
          goto LABEL_5;
        }
        v14->_videoState = 1;
        objc_msgSend(v13, "videoUnloaded");
      }
    }
    else
    {
      switch(v64)
      {
        case 1600:
          v14->_videoState = 0;
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent"));
          objc_msgSend(v65, "videoLoaded:", (double)*p_duration);

          break;
        case 1601:
          goto LABEL_31;
        case 1602:
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "transientContent"));
          v72 = objc_msgSend(v71, "playbackInProgress");

          v73 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent"));
          v74 = *p_position;
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
          objc_msgSend(v73, "videoStateChanged:fromMetric:", objc_msgSend(v75, "metric"), v74);

          if ((v72 & 1) != 0)
            goto LABEL_7;
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "transientContent"));
          objc_msgSend(v77, "lastPosition");
          v79 = v78;

          if (v79 <= 0.0)
            goto LABEL_7;
          v66 = 5;
          goto LABEL_64;
        case 1603:
          v80 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent"));
          v81 = *p_position;
          v82 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
          objc_msgSend(v80, "videoStateChanged:fromMetric:", objc_msgSend(v82, "metric"), v81);

          v66 = 4;
          goto LABEL_64;
        case 1604:
          v83 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent"));
          v84 = *p_position;
          v85 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
          objc_msgSend(v83, "videoStateChanged:fromMetric:", objc_msgSend(v85, "metric"), v84);

          v66 = 6;
          goto LABEL_64;
        case 1605:
          v86 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "transientContent"));
          objc_msgSend(v87, "volume");
          v89 = v88;

          if (v89 > 0.0 && (v90 = *p_volume, *p_volume <= 0.0) || v89 == -1.0 && (v90 = *p_volume, *p_volume <= 0.0))
          {
            v91 = 7;
            goto LABEL_55;
          }
          if (v89 == 0.0 && (v90 = *p_volume, *p_volume > 0.0)
            || (v90 = -1.0, v89 == -1.0) && (v90 = *p_volume, *p_volume > 0.0))
          {
            v91 = 8;
LABEL_55:
            v14->_videoState = v91;
          }
          v94 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent", v90));
          v95 = *p_position;
          v96 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
          objc_msgSend(v94, "videoStateChanged:fromMetric:", objc_msgSend(v96, "metric"), v95);

          v97 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent"));
          objc_msgSend(v97, "volumeChanged:", *p_volume);

          if (v14->_videoState < 0)
            goto LABEL_7;
          break;
        case 1606:
          v66 = 9;
          goto LABEL_64;
        case 1607:
          v66 = 10;
          goto LABEL_64;
        case 1608:
          v66 = 11;
          goto LABEL_64;
        case 1609:
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v14, "internalContent"));
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](v14, "metric"));
          objc_msgSend(v92, "videoStateChanged:fromMetric:", objc_msgSend(v93, "metric"), (double)v99 / 100.0);

          if (v99)
          {
            if ((v99 - 25) > 0x18)
            {
              if ((v99 - 50) > 0x18)
              {
                if ((v99 - 75) > 0x18)
                  v66 = 3;
                else
                  v66 = 14;
              }
              else
              {
                v66 = 13;
              }
            }
            else
            {
              v66 = 12;
            }
          }
          else
          {
            v66 = 2;
          }
          goto LABEL_64;
        default:
          if (v64 != 1406)
            goto LABEL_31;
          v66 = 15;
          goto LABEL_64;
      }
    }
    objc_msgSend(v13, "incrementVideoEventSequence");
LABEL_66:
    v22 = v14;
    goto LABEL_67;
  }
  v17 = APLogForCategory(21);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = objc_msgSend(v12, "metric");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
    *(_DWORD *)buf = 134218242;
    v102 = (uint64_t)v19;
    v103 = 2114;
    v104 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Attempting to send LogVideoAnalytic for metric %ld for content %{public}@, but Unloaded has already been sent.", buf, 0x16u);

LABEL_5:
  }
LABEL_6:

LABEL_7:
  v22 = 0;
LABEL_67:

  return v22;
}

- (id)protoBuffer
{
  APPBLogVideoAnalyticsEventRequest *v3;
  void *v4;
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
  double v15;
  double v16;

  v3 = objc_alloc_init(APPBLogVideoAnalyticsEventRequest);
  -[APPBLogVideoAnalyticsEventRequest setVideoState:](v3, "setVideoState:", -[APLogVideoAnalyticsEventRequester videoState](self, "videoState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester logMetadata](self, "logMetadata"));
  -[APPBLogVideoAnalyticsEventRequest setMetaData:](v3, "setMetaData:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRequester bundleID](self, "bundleID"));
  -[APPBLogVideoAnalyticsEventRequest setBundleID:](v3, "setBundleID:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transientContent"));
  objc_msgSend(v7, "accumulatedPlaybackTime");
  -[APPBLogVideoAnalyticsEventRequest setCurrentPlaybackTime:](v3, "setCurrentPlaybackTime:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transientContent"));
  objc_msgSend(v9, "duration");
  -[APPBLogVideoAnalyticsEventRequest setTotalDuration:](v3, "setTotalDuration:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester metric](self, "metric"));
  v11 = objc_msgSend(v10, "metric");

  if (v11 == (id)1406)
  {
    -[APLogVideoAnalyticsEventRequester videoVisibility](self, "videoVisibility");
    -[APPBLogVideoAnalyticsEventRequest setVisiblePercentage:](v3, "setVisiblePercentage:");
    -[APLogVideoAnalyticsEventRequester visibilityTimestamp](self, "visibilityTimestamp");
    -[APPBLogVideoAnalyticsEventRequest setTimestamp:](v3, "setTimestamp:");
  }
  else
  {
    -[APPBLogVideoAnalyticsEventRequest setVisiblePercentage:](v3, "setVisiblePercentage:", (double)-[APLogVideoAnalyticsEventRequester visiblePercent](self, "visiblePercent") / 100.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v12, "timeIntervalSince1970");
    -[APPBLogVideoAnalyticsEventRequest setTimestamp:](v3, "setTimestamp:");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
  -[APPBLogVideoAnalyticsEventRequest setEventSequence:](v3, "setEventSequence:", objc_msgSend(v14, "videoEventSequence"));

  -[APLogVideoAnalyticsEventRequester volume](self, "volume");
  if (v15 >= 0.0)
  {
    -[APLogVideoAnalyticsEventRequester volume](self, "volume");
    *(float *)&v16 = v16;
    -[APPBLogVideoAnalyticsEventRequest setVolume:](v3, "setVolume:", v16);
  }
  return v3;
}

- (double)videoVisibility
{
  return self->_videoVisibility;
}

- (void)setVideoVisibility:(double)a3
{
  self->_videoVisibility = a3;
}

- (double)visibilityTimestamp
{
  return self->_visibilityTimestamp;
}

- (void)setVisibilityTimestamp:(double)a3
{
  self->_visibilityTimestamp = a3;
}

- (int)videoState
{
  return self->_videoState;
}

- (void)setVideoState:(int)a3
{
  self->_videoState = a3;
}

- (int)duration
{
  return self->_duration;
}

- (void)setDuration:(int)a3
{
  self->_duration = a3;
}

- (double)position
{
  return self->_position;
}

- (void)setPosition:(double)a3
{
  self->_position = a3;
}

- (int64_t)visiblePercent
{
  return self->_visiblePercent;
}

- (void)setVisiblePercent:(int64_t)a3
{
  self->_visiblePercent = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

@end
