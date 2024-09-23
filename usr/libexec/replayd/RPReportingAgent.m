@implementation RPReportingAgent

- (RPReportingAgent)initWithServiceName:(id)a3
{
  id v4;
  RPReportingAgent *v5;
  RPThermalPressure *v6;
  RPThermalPressure *thermalPressureMonitor;
  NSMutableDictionary *v8;
  NSMutableDictionary *thermalResults;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  RPReportingAgent *v17;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPReportingAgent;
  v5 = -[RPReportingAgent init](&v11, "init");
  if (v5)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "-[RPReportingAgent initWithServiceName:]";
      v14 = 1024;
      v15 = 46;
      v16 = 2048;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    -[RPReportingAgent setServiceName:](v5, "setServiceName:", v4);
    v6 = objc_alloc_init(RPThermalPressure);
    thermalPressureMonitor = v5->_thermalPressureMonitor;
    v5->_thermalPressureMonitor = v6;

    -[RPThermalPressure setDelegate:](v5->_thermalPressureMonitor, "setDelegate:", v5);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    thermalResults = v5->_thermalResults;
    v5->_thermalResults = v8;

    -[RPReportingAgent resetThermalResults](v5, "resetThermalResults");
  }

  return v5;
}

- (id)collectSummaryEventMetrics
{
  double v3;
  double v4;
  double v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  _QWORD v30[16];
  _QWORD v31[16];

  -[RPReportingAgent addToThermalResultsWithLevel:](self, "addToThermalResultsWithLevel:", -[RPThermalPressure getCurrentPressureLevel](self->_thermalPressureMonitor, "getCurrentPressureLevel"));
  v20 = objc_alloc((Class)NSMutableDictionary);
  v30[0] = CFSTR("ActiveDuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v23, "timeIntervalSinceDate:", self->_captureStartTime);
  *(float *)&v3 = v3;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llroundf(*(float *)&v3)));
  v31[0] = v22;
  v30[1] = CFSTR("VideoCaptureWidth");
  -[RPReportingAgent videoCaptureSize](self, "videoCaptureSize");
  *(float *)&v4 = v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llroundf(*(float *)&v4)));
  v31[1] = v21;
  v30[2] = CFSTR("VideoCaptureHeight");
  -[RPReportingAgent videoCaptureSize](self, "videoCaptureSize");
  v6 = v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llroundf(v6)));
  v31[2] = v19;
  v30[3] = CFSTR("VideoCaptureRate");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[RPReportingAgent videoCaptureRate](self, "videoCaptureRate")));
  v31[3] = v18;
  v30[4] = CFSTR("VideoFrameCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[RPReportingAgent videoFrameCount](self, "videoFrameCount")));
  v31[4] = v7;
  v31[5] = &off_100085AF8;
  v30[5] = CFSTR("AppAudioCaptureRate");
  v30[6] = CFSTR("AppAudioFrameCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[RPReportingAgent appAudioFrameCount](self, "appAudioFrameCount")));
  v31[6] = v8;
  v31[7] = &off_100085AF8;
  v30[7] = CFSTR("MicCaptureRate");
  v30[8] = CFSTR("MicFrameCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[RPReportingAgent micFrameCount](self, "micFrameCount")));
  v31[8] = v9;
  v30[9] = CFSTR("FrontCameraUsed");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RPReportingAgent frontCameraUsed](self, "frontCameraUsed")));
  v31[9] = v10;
  v30[10] = CFSTR("BackCameraUsed");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RPReportingAgent backCameraUsed](self, "backCameraUsed")));
  v31[10] = v11;
  v30[11] = CFSTR("RecordedFileSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[RPReportingAgent recordedFileSize](self, "recordedFileSize")));
  v31[11] = v12;
  v31[12] = &stru_100083968;
  v30[12] = CFSTR("BroadcastExtensionBundleID");
  v30[13] = CFSTR("ClientAppBundleID");
  v31[13] = &stru_100083968;
  v30[14] = CFSTR("EndReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[RPReportingAgent endReason](self, "endReason")));
  v31[14] = v13;
  v30[15] = CFSTR("TPL");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPReportingAgent thermalDescription](self, "thermalDescription"));
  v31[15] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 16));
  v16 = objc_msgSend(v20, "initWithDictionary:", v15);

  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v25 = "-[RPReportingAgent collectSummaryEventMetrics]";
    v26 = 1024;
    v27 = 76;
    v28 = 2112;
    v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@", buf, 0x1Cu);
  }
  return v16;
}

- (id)thermalDescription
{
  id v3;
  __CFString *v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const __CFString *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_thermalResults, "allKeys"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v4 = &stru_100083968;
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_thermalResults, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8)));
        v11 = (void *)v10;
        v12 = ",";
        if (!(v6 + (_DWORD)v8))
          v12 = "";
        if (v10)
          v13 = (const __CFString *)v10;
        else
          v13 = &stru_100083968;
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("%s%@"), v12, v13));

        v8 = (char *)v8 + 1;
        v9 = v4;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v6 += (int)v8;
    }
    while (v5);
  }

  return v4;
}

- (void)resetReportingMetrics
{
  self->_captureStartTime = (NSDate *)+[NSDate date](NSDate, "date");
  self->_videoCaptureSize = CGSizeZero;
  *(_WORD *)&self->_frontCameraUsed = 0;
  *(_OWORD *)&self->_videoCaptureRate = 0u;
  *(_OWORD *)&self->_appAudioFrameCount = 0u;
  *(_OWORD *)&self->_recordedFileSize = 0u;
  -[RPReportingAgent resetThermalResults](self, "resetThermalResults");
}

- (void)resetThermalResults
{
  NSDate *v3;
  NSDate *thermalLevelIntervalStartTime;

  -[RPThermalPressure stopMonitoring](self->_thermalPressureMonitor, "stopMonitoring");
  -[NSMutableDictionary removeAllObjects](self->_thermalResults, "removeAllObjects");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085B10, &off_100085B28);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085B10, &off_100085B40);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085B10, &off_100085B58);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085B10, &off_100085B70);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085B10, &off_100085B88);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_thermalResults, "setObject:forKeyedSubscript:", &off_100085B10, &off_100085BA0);
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  thermalLevelIntervalStartTime = self->_thermalLevelIntervalStartTime;
  self->_thermalLevelIntervalStartTime = v3;

  -[RPThermalPressure startMonitoring](self->_thermalPressureMonitor, "startMonitoring");
}

- (void)reportEventWithType:(unsigned __int16)a3 dictionary:(id)a4 clientBundleId:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[RPReportingAgent serviceName](self, "serviceName"));
  +[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:](RPReportingAgent, "sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:", v6, v9, v10, v8, &stru_100083968);

}

- (void)reportSCEventWithType:(unsigned __int16)a3 dictionary:(id)a4 streamID:(id)a5
{
  +[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:](RPReportingAgent, "sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:", a3, a4, CFSTR("SCKCapture"), CFSTR("com.apple.replayd"), a5);
}

+ (void)sendReportEventWithType:(unsigned __int16)a3 dictionary:(id)a4 withServiceName:(id)a5 clientBundleId:(id)a6 sessionID:(id)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[6];
  _QWORD v33[6];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (v11)
  {
    if (objc_msgSend(v14, "length"))
    {
      v16 = (unint64_t)objc_msgSend(v15, "hash");
      v17 = v16 + (v16 / 0xFFFFFFFF);
    }
    else
    {
      v17 = 0;
    }
    v32[0] = kRTCReportingSessionInfoClientType;
    v32[1] = kRTCReportingSessionInfoClientVersion;
    v33[0] = &off_100085BB8;
    v33[1] = &off_100085BD0;
    v32[2] = kRTCReportingSessionInfoSessionID;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
    v33[2] = v18;
    v33[3] = &__kCFBooleanTrue;
    v32[3] = kRTCReportingSessionInfoBatchEvent;
    v32[4] = kRTCReportingSessionInfoRequireUserInfo;
    v32[5] = kRTCReportingSessionInfoClientBundleID;
    v33[4] = &__kCFBooleanTrue;
    v33[5] = v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 6));

    v30[0] = kRTCReportingUserInfoClientName;
    v30[1] = kRTCReportingUserInfoServiceName;
    v31[0] = CFSTR("ReplayKit");
    v31[1] = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
    v23 = 0;
    v21 = +[RTCReporting sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:](RTCReporting, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v19, v20, v10, 0, v11, &v23);
    v22 = v23;
    if ((v21 & 1) != 0)
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v25 = "+[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:]";
        v26 = 1024;
        v27 = 158;
        v28 = 1024;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d reported eventType:%d", buf, 0x18u);
      }
    }
    else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004E5B8(v10, v22);
    }

  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004E524();
  }

}

+ (void)sendReportSessionEnded:(unsigned __int16)a3 endReason:(id)a4 withServiceName:(id)a5 clientBundleId:(id)a6 sessionID:(id)a7 payload:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136446722;
    v21 = "+[RPReportingAgent sendReportSessionEnded:endReason:withServiceName:clientBundleId:sessionID:payload:]";
    v22 = 1024;
    v23 = 163;
    v24 = 2048;
    v25 = objc_msgSend(v13, "code");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d reporting with endReason=%ld", (uint8_t *)&v20, 0x1Cu);
  }
  v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v13, "code")));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("EndReason"));

  +[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:](RPReportingAgent, "sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:", v12, v18, v14, v15, v16);
}

+ (void)reportSessionEnded:(unsigned __int16)a3 endReason:(id)a4 withServiceName:(id)a5 clientBundleId:(id)a6
{
  objc_msgSend(a1, "sendReportSessionEnded:endReason:withServiceName:clientBundleId:sessionID:payload:", a3, a4, a5, a6, &stru_100083968, &__NSDictionary0__struct);
}

+ (void)reportSCSessionErroredWithEventType:(unsigned __int16)a3 endReason:(id)a4 streamID:(id)a5 payload:(id)a6
{
  objc_msgSend(a1, "sendReportSessionEnded:endReason:withServiceName:clientBundleId:sessionID:payload:", a3, a4, CFSTR("SCKCapture"), CFSTR("com.apple.replayd"), a5, a6);
}

- (void)thermalPressureDidChangeWithLevel:(int64_t)a3
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int64_t v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446722;
    v6 = "-[RPReportingAgent thermalPressureDidChangeWithLevel:]";
    v7 = 1024;
    v8 = 180;
    v9 = 2048;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d level=%ld", (uint8_t *)&v5, 0x1Cu);
  }
  -[RPReportingAgent addToThermalResultsWithLevel:](self, "addToThermalResultsWithLevel:", a3);
}

- (void)addToThermalResultsWithLevel:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  NSMutableDictionary *thermalResults;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSDate *v16;
  NSDate *thermalLevelIntervalStartTime;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_thermalLevelIntervalStartTime);
  *(float *)&v6 = v6;
  v7 = (double)(uint64_t)llroundf(*(float *)&v6);

  thermalResults = self->_thermalResults;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](thermalResults, "objectForKeyedSubscript:", v9));
  objc_msgSend(v10, "doubleValue");
  v12 = v11 + v7;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
  v14 = self->_thermalResults;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  thermalLevelIntervalStartTime = self->_thermalLevelIntervalStartTime;
  self->_thermalLevelIntervalStartTime = v16;

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSDate)captureStartTime
{
  return self->_captureStartTime;
}

- (void)setCaptureStartTime:(id)a3
{
  self->_captureStartTime = (NSDate *)a3;
}

- (CGSize)videoCaptureSize
{
  double width;
  double height;
  CGSize result;

  width = self->_videoCaptureSize.width;
  height = self->_videoCaptureSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setVideoCaptureSize:(CGSize)a3
{
  self->_videoCaptureSize = a3;
}

- (int64_t)videoCaptureRate
{
  return self->_videoCaptureRate;
}

- (void)setVideoCaptureRate:(int64_t)a3
{
  self->_videoCaptureRate = a3;
}

- (int64_t)videoFrameCount
{
  return self->_videoFrameCount;
}

- (void)setVideoFrameCount:(int64_t)a3
{
  self->_videoFrameCount = a3;
}

- (int64_t)appAudioFrameCount
{
  return self->_appAudioFrameCount;
}

- (void)setAppAudioFrameCount:(int64_t)a3
{
  self->_appAudioFrameCount = a3;
}

- (int64_t)micFrameCount
{
  return self->_micFrameCount;
}

- (void)setMicFrameCount:(int64_t)a3
{
  self->_micFrameCount = a3;
}

- (BOOL)frontCameraUsed
{
  return self->_frontCameraUsed;
}

- (void)setFrontCameraUsed:(BOOL)a3
{
  self->_frontCameraUsed = a3;
}

- (BOOL)backCameraUsed
{
  return self->_backCameraUsed;
}

- (void)setBackCameraUsed:(BOOL)a3
{
  self->_backCameraUsed = a3;
}

- (unint64_t)recordedFileSize
{
  return self->_recordedFileSize;
}

- (void)setRecordedFileSize:(unint64_t)a3
{
  self->_recordedFileSize = a3;
}

- (int64_t)endReason
{
  return self->_endReason;
}

- (void)setEndReason:(int64_t)a3
{
  self->_endReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_thermalLevelIntervalStartTime, 0);
  objc_storeStrong((id *)&self->_thermalResults, 0);
  objc_storeStrong((id *)&self->_thermalPressureMonitor, 0);
}

@end
