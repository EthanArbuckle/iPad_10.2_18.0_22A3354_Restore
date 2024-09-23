@implementation VLFSessionIndoorOutdoorAnalyticsRecorder

- (VLFSessionIndoorOutdoorAnalyticsRecorder)init
{
  VLFSessionIndoorOutdoorAnalyticsRecorder *v2;
  uint64_t UInteger;
  id v4;
  NSObject *v5;
  MapsRingBuffer *v6;
  MapsRingBuffer *entries;
  objc_super v9;
  uint8_t buf[4];
  VLFSessionIndoorOutdoorAnalyticsRecorder *v11;
  __int16 v12;
  uint64_t v13;

  v9.receiver = self;
  v9.super_class = (Class)VLFSessionIndoorOutdoorAnalyticsRecorder;
  v2 = -[VLFSessionIndoorOutdoorAnalyticsRecorder init](&v9, "init");
  if (v2)
  {
    UInteger = GEOConfigGetUInteger(MapsConfig_VLFSessionIndoorOutdoorAnalyticsRecorderEntryCount, off_1014B4988);
    v4 = sub_100A5973C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v11 = v2;
      v12 = 2048;
      v13 = UInteger;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with max entries: %lu", buf, 0x16u);
    }

    v6 = -[MapsRingBuffer initWithLength:]([MapsRingBuffer alloc], "initWithLength:", UInteger);
    entries = v2->_entries;
    v2->_entries = v6;

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  VLFSessionIndoorOutdoorAnalyticsRecorder *v7;

  v3 = sub_100A5973C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)VLFSessionIndoorOutdoorAnalyticsRecorder;
  -[VLFSessionIndoorOutdoorAnalyticsRecorder dealloc](&v5, "dealloc");
}

- (void)recordFrame:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  double Double;
  VLFSessionIndoorOutdoorAnalyticsRecorder *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  _BOOL8 v21;
  id v22;
  NSObject *v23;
  const __CFString *v24;
  VLFSessionIndoorOutdoorAnalyticsRecorder *v25;
  void *v26;
  int v27;
  VLFSessionIndoorOutdoorAnalyticsRecorder *v28;
  __int16 v29;
  double v30;

  v4 = a3;
  v5 = sub_100A5973C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v27 = 134349312;
    v28 = self;
    v29 = 2048;
    v30 = *(double *)&v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Received frame: %p", (uint8_t *)&v27, 0x16u);
  }

  Double = GEOConfigGetDouble(MapsConfig_VLFSessionIndoorOutdoorAnalyticsRecorderTimeInterval, off_1014B4978);
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionIndoorOutdoorAnalyticsRecorder lastUpdate](v8, "lastUpdate"));
  if (v9
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionIndoorOutdoorAnalyticsRecorder lastUpdate](v8, "lastUpdate")),
        objc_msgSend(v10, "timeIntervalSinceDate:", v11),
        v13 = v12 < Double,
        v11,
        v10,
        v9,
        v13))
  {
    v14 = sub_100A5973C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v27 = 134349312;
      v28 = v8;
      v29 = 2048;
      v30 = Double;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}p] Last frame update was too soon (< %0.2fs ago); ignoring",
        (uint8_t *)&v27,
        0x16u);
    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[VLFSessionIndoorOutdoorAnalyticsRecorder setLastUpdate:](v8, "setLastUpdate:", v16);

    objc_sync_exit(v8);
    objc_msgSend(v4, "indoorConfidence");
    v18 = v17;
    objc_msgSend(v4, "outdoorConfidence");
    v20 = v19;
    v21 = v18 < v19;
    v22 = sub_100A5973C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = CFSTR("Indoor");
      if (v18 < v20)
        v24 = CFSTR("Outdoor");
      v27 = 134349314;
      v28 = v8;
      v29 = 2112;
      v30 = *(double *)&v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}p] Recording frame with type: %@", (uint8_t *)&v27, 0x16u);
    }

    v25 = v8;
    objc_sync_enter(v25);
    v15 = objc_claimAutoreleasedReturnValue(-[VLFSessionIndoorOutdoorAnalyticsRecorder entries](v25, "entries"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));
    -[NSObject push:](v15, "push:", v26);

  }
  objc_sync_exit(v8);

}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdate, a3);
}

- (MapsRingBuffer)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
}

@end
