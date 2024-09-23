@implementation MTPlayMetricsEvent

+ (id)eventWithAccessLog:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithAccessLogEvent:dataSource:", v7, v6);

  return v8;
}

- (MTPlayMetricsEvent)initWithAccessLogEvent:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  MTPlayMetricsEvent *v8;
  MTPlayMetricsEvent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTPlayMetricsEvent;
  v8 = -[MTPlayMetricsEvent init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MTPlayMetricsEvent setAccessLogEvent:](v8, "setAccessLogEvent:", v6);
    -[MTPlayMetricsEvent setDataSource:](v9, "setDataSource:", v7);
  }

  return v9;
}

- (BOOL)isRecorded
{
  MTPlayMetricsEvent *v2;
  BOOL recorded;

  v2 = self;
  objc_sync_enter(v2);
  recorded = v2->_recorded;
  objc_sync_exit(v2);

  return recorded;
}

- (void)record
{
  void *v2;
  void *v3;
  MTPlayMetricsEvent *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent dataSource](obj, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent _data](obj, "_data"));
  +[IMMetrics recordEvent:dataSource:data:](IMMetrics, "recordEvent:dataSource:data:", CFSTR("play_stats"), v2, v3);

  -[MTPlayMetricsEvent setRecorded:](obj, "setRecorded:", 1);
  objc_sync_exit(obj);

}

- (id)_data
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v35;
  void *v36;
  _QWORD v37[23];
  _QWORD v38[23];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent accessLogEvent](self, "accessLogEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "playbackStartDate"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = (uint64_t)(v4 * 1000.0);

  v37[0] = CFSTR("uri");
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URI"));
  v36 = (void *)v6;
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = &stru_1004C6D40;
  v38[0] = v7;
  v37[1] = CFSTR("server_address");
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serverAddress"));
  v35 = (void *)v8;
  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = &stru_1004C6D40;
  v38[1] = v9;
  v37[2] = CFSTR("number_of_server_address_changes");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v2, "numberOfServerAddressChanges")));
  v38[2] = v34;
  v37[3] = CFSTR("media_requests_wwan");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v2, "mediaRequestsWWAN")));
  v38[3] = v33;
  v37[4] = CFSTR("transfer_duration");
  objc_msgSend(v2, "transferDuration");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[4] = v32;
  v37[5] = CFSTR("number_of_bytes_transferred");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v2, "numberOfBytesTransferred")));
  v38[5] = v31;
  v37[6] = CFSTR("number_of_media_requests");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v2, "numberOfMediaRequests")));
  v38[6] = v30;
  v37[7] = CFSTR("playStartTime");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v5));
  v38[7] = v29;
  v37[8] = CFSTR("playback_session_id");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "playbackSessionID"));
  v38[8] = v28;
  v37[9] = CFSTR("playStartPosition");
  objc_msgSend(v2, "playbackStartOffset");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[9] = v27;
  v37[10] = CFSTR("playback_type");
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "playbackType"));
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1004C6D40;
  v38[10] = v12;
  v37[11] = CFSTR("startup_time");
  objc_msgSend(v2, "startupTime");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[11] = v26;
  v37[12] = CFSTR("playDuration");
  objc_msgSend(v2, "durationWatched");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[12] = v25;
  v37[13] = CFSTR("number_of_dropped_video_frames");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v2, "numberOfDroppedVideoFrames")));
  v38[13] = v24;
  v37[14] = CFSTR("number_of_stalls");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v2, "numberOfStalls")));
  v38[14] = v23;
  v37[15] = CFSTR("segments_downloaded_duration");
  objc_msgSend(v2, "segmentsDownloadedDuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[15] = v22;
  v37[16] = CFSTR("download_overdue");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v2, "downloadOverdue")));
  v38[16] = v13;
  v37[17] = CFSTR("observed_bitrate_stdev");
  objc_msgSend(v2, "observedBitrateStandardDeviation");
  objc_msgSend(v2, "observedBitrateStandardDeviation");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[17] = v14;
  v37[18] = CFSTR("observed_bitrate_max");
  objc_msgSend(v2, "observedMaxBitrate");
  objc_msgSend(v2, "observedMaxBitrate");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[18] = v15;
  v37[19] = CFSTR("observed_bitrate_min");
  objc_msgSend(v2, "observedMinBitrate");
  objc_msgSend(v2, "observedMinBitrate");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[19] = v16;
  v37[20] = CFSTR("switch_bitrate");
  objc_msgSend(v2, "switchBitrate");
  objc_msgSend(v2, "switchBitrate");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[20] = v17;
  v37[21] = CFSTR("indicated_bitrate");
  objc_msgSend(v2, "indicatedBitrate");
  objc_msgSend(v2, "indicatedBitrate");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[21] = v18;
  v37[22] = CFSTR("observed_bitrate");
  objc_msgSend(v2, "observedBitrate");
  objc_msgSend(v2, "observedBitrate");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38[22] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 23));

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = a3;
  v5 = objc_opt_class(MTPlayMetricsEvent);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent dataSource](self, "dataSource"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_data"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent _data](self, "_data"));
      v12 = objc_msgSend(v10, "isEqualToDictionary:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent dataSource](self, "dataSource"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent _data](self, "_data"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent accessLogEvent](self, "accessLogEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playbackStartDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent accessLogEvent](self, "accessLogEvent"));
  objc_msgSend(v5, "playbackStartOffset");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent accessLogEvent](self, "accessLogEvent"));
  objc_msgSend(v8, "durationWatched");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ @ %@: from %f for %f seconds"), CFSTR("play_stats"), v4, v7, v9));

  return v10;
}

- (AVPlayerItemAccessLogEvent)accessLogEvent
{
  return self->_accessLogEvent;
}

- (void)setAccessLogEvent:(id)a3
{
  objc_storeStrong((id *)&self->_accessLogEvent, a3);
}

- (MTEpisodeMetricDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)setRecorded:(BOOL)a3
{
  self->_recorded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_accessLogEvent, 0);
}

@end
