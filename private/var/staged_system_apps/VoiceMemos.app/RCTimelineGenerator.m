@implementation RCTimelineGenerator

- (RCTimelineGenerator)initWithRecordingStartTimeInfo:(id)a3 elapsedRecordingTimeInfo:(id)a4
{
  id v7;
  id v8;
  RCTimelineGenerator *v9;
  RCTimelineGenerator *v10;
  uint64_t v11;
  NSDate *recordingStartTime;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RCTimelineGenerator;
  v9 = -[RCTimelineGenerator init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordingStartTimeInfo, a3);
    objc_storeStrong((id *)&v10->_elapsedRecordingTimeInfo, a4);
    v11 = objc_claimAutoreleasedReturnValue(-[RCTimelineGenerator _recordingStartTimeSyncedWithDisplayedTime](v10, "_recordingStartTimeSyncedWithDisplayedTime"));
    recordingStartTime = v10->_recordingStartTime;
    v10->_recordingStartTime = (NSDate *)v11;

  }
  return v10;
}

+ (id)emptyTimelineWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BLSAlwaysOnTimeline emptyTimelineWithIdentifier:](BLSAlwaysOnTimeline, "emptyTimelineWithIdentifier:", a3));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (id)timelinesForDateInterval:(id)a3 displayedRecordingTime:(double)a4 timelineIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineGenerator recordingStartTime](self, "recordingStartTime"));

  if (v10)
  {
    v31 = v9;
    v11 = objc_claimAutoreleasedReturnValue(-[RCTimelineGenerator recordingStartTimeInfo](self, "recordingStartTimeInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineGenerator recordingStartTime](self, "recordingStartTime"));
    -[NSObject recordingTimeAtStartTime](v11, "recordingTimeAtStartTime");
    v14 = v13;
    -[NSObject recordingDurationAtStartTime](v11, "recordingDurationAtStartTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineGenerator _dateEntriesForRecordingStartTime:lastRecordingTime:elapsedTimeAtRecordingStart:recordingDurationAtRecordingStart:timelineDateInterval:](self, "_dateEntriesForRecordingStartTime:lastRecordingTime:elapsedTimeAtRecordingStart:recordingDurationAtRecordingStart:timelineDateInterval:", v12, v8, a4, v14, v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dateEntry"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[BLSAlwaysOnTimelineUnconfiguredEntry entryForPresentationTime:withRequestedFidelity:](BLSAlwaysOnTimelineUnconfiguredEntry, "entryForPresentationTime:withRequestedFidelity:", v24, objc_msgSend(v23, "updateFidelity")));

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userInfo"));
          objc_msgSend(v25, "setUserObject:", v26);

          objc_msgSend(v17, "addObject:", v25);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v20);
    }

    v9 = v31;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[BLSAlwaysOnTimeline timelineWithEntries:identifier:configure:](BLSAlwaysOnTimeline, "timelineWithEntries:identifier:configure:", v17, v31, 0));
    v36 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));

  }
  else
  {
    v29 = OSLogForCategory(kVMLogCategoryDefault);
    v11 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_10010B6F8(v11);
    v28 = &__NSArray0__struct;
  }

  return v28;
}

- (id)_dateEntriesForRecordingStartTime:(id)a3 lastRecordingTime:(double)a4 elapsedTimeAtRecordingStart:(double)a5 recordingDurationAtRecordingStart:(double)a6 timelineDateInterval:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  __int128 v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  RCTimelineDateEntryUserInfo *v41;
  RCTimelineDateEntry *v42;
  uint64_t v43;
  NSObject *v44;
  double v45;
  void *i;
  void *v47;
  void *v48;
  id v49;
  double v50;
  RCTimelineDateEntryUserInfo *v51;
  RCTimelineDateEntry *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  __int128 v57;
  void *v58;
  uint64_t v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  RCTimelineDateEntry *v63;

  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
  v58 = v12;
  v15 = objc_msgSend(v12, "compare:", v14);

  if (v15 == (id)1)
  {
    v16 = OSLogForCategory(kVMLogCategoryDefault);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      sub_10010B778((uint64_t)v12, v13, v17);
    v18 = &__NSArray0__struct;
    goto LABEL_39;
  }
  v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = ((uint64_t (*)(void))RCSupportsDebugAODLogs)();
  v20 = kVMLogCategoryDefault;
  if (v19)
  {
    v21 = OSLogForCategory(kVMLogCategoryDefault);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      sub_10010B9EC(v58);

    v23 = OSLogForCategory(v20);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_10010B968();

    v25 = OSLogForCategory(v20);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      sub_10010B8D0(v13);

    v27 = OSLogForCategory(v20);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      sub_10010B838(v13);

  }
  v59 = v20;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
  objc_msgSend(v29, "timeIntervalSinceDate:", v58);
  v31 = v30;

  v33 = vcvtpd_u64_f64(v31);
  v34 = vcvtpd_u64_f64(a4);
  if (v33 <= v34)
    v35 = v34;
  else
    v35 = v33;
  *(_QWORD *)&v32 = 136315394;
  v57 = v32;
  do
  {
    v36 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v58, (double)v35 - a5, v57));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
    if (objc_msgSend(v36, "compare:", v37) == (id)-1)
    {

    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
      v39 = objc_msgSend(v36, "compare:", v38);

      if (v39)
      {
        v18 = -[NSObject copy](v17, "copy");
        goto LABEL_38;
      }
    }
    -[RCTimelineGenerator _recordingDurationForDurationAtStartTime:currentTime:](self, "_recordingDurationForDurationAtStartTime:currentTime:", a6, (double)v35);
    v41 = -[RCTimelineDateEntryUserInfo initWithCurrentTime:recordingDuration:]([RCTimelineDateEntryUserInfo alloc], "initWithCurrentTime:recordingDuration:", (double)v35, v40);
    v42 = -[RCTimelineDateEntry initWithDateEntry:updateFidelity:userInfo:]([RCTimelineDateEntry alloc], "initWithDateEntry:updateFidelity:userInfo:", v36, 2, v41);
    if (RCSupportsDebugAODLogs(-[NSObject addObject:](v17, "addObject:", v42)))
    {
      v43 = OSLogForCategory(v59);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v57;
        v61 = "-[RCTimelineGenerator _dateEntriesForRecordingStartTime:lastRecordingTime:elapsedTimeAtRecordingStart:reco"
              "rdingDurationAtRecordingStart:timelineDateInterval:]";
        v62 = 2112;
        v63 = v42;
        _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%s -- per second date entry: %@", buf, 0x16u);
      }

    }
    ++v35;

  }
  while (v35 < 0x3C);
  v45 = (double)(60 * (unint64_t)(a4 / 60.0) + 60);
  v36 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v58, v45 - a5));
  for (i = v36; ; i = (void *)v55)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
    if (objc_msgSend(i, "compare:", v47) != (id)-1)
      break;

LABEL_33:
    -[RCTimelineGenerator _recordingDurationForDurationAtStartTime:currentTime:](self, "_recordingDurationForDurationAtStartTime:currentTime:", a6, v45);
    v51 = -[RCTimelineDateEntryUserInfo initWithCurrentTime:recordingDuration:]([RCTimelineDateEntryUserInfo alloc], "initWithCurrentTime:recordingDuration:", v45, v50);
    v52 = -[RCTimelineDateEntry initWithDateEntry:updateFidelity:userInfo:]([RCTimelineDateEntry alloc], "initWithDateEntry:updateFidelity:userInfo:", i, 1, v51);
    if (RCSupportsDebugAODLogs(-[NSObject addObject:](v17, "addObject:", v52)))
    {
      v53 = OSLogForCategory(v59);
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v57;
        v61 = "-[RCTimelineGenerator _dateEntriesForRecordingStartTime:lastRecordingTime:elapsedTimeAtRecordingStart:reco"
              "rdingDurationAtRecordingStart:timelineDateInterval:]";
        v62 = 2112;
        v63 = v52;
        _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "%s -- per minute date entry: %@", buf, 0x16u);
      }

    }
    v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(i, "dateByAddingTimeInterval:", 60.0));

    v45 = v45 + 60.0;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
  v49 = objc_msgSend(i, "compare:", v48);

  if (!v49)
    goto LABEL_33;
  v18 = -[NSObject copy](v17, "copy");

LABEL_38:
LABEL_39:

  return v18;
}

- (double)_recordingDurationForDurationAtStartTime:(double)result currentTime:(double)a4
{
  if (result < a4)
    return a4;
  return result;
}

- (id)_recordingStartTimeSyncedWithDisplayedTime
{
  void *v3;
  void *v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _BYTE *v10;
  double v11;
  double v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineGenerator recordingStartTimeInfo](self, "recordingStartTimeInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateRecordingStartTime"));
  v5 = objc_msgSend(v3, "machRecordingStartTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineGenerator elapsedRecordingTimeInfo](self, "elapsedRecordingTimeInfo"));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "elapsedRecordingTime");
    v9 = v8;
    v10 = objc_msgSend(v7, "machElapsedRecordingTime");
  }
  else
  {
    objc_msgSend(v3, "recordingTimeAtStartTime");
    v9 = v11;
    v10 = v5;
  }
  objc_msgSend(v3, "recordingTimeAtStartTime");
  +[AVAudioTime secondsForHostTime:](AVAudioTime, "secondsForHostTime:", v10 - v5 - +[AVAudioTime hostTimeForSeconds:](AVAudioTime, "hostTimeForSeconds:", v9 - v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:"));

  return v13;
}

- (NSDate)recordingStartTime
{
  return self->_recordingStartTime;
}

- (RCRecordingStartTimeInfo)recordingStartTimeInfo
{
  return self->_recordingStartTimeInfo;
}

- (void)setRecordingStartTimeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_recordingStartTimeInfo, a3);
}

- (RCElapsedRecordingTimeInfo)elapsedRecordingTimeInfo
{
  return self->_elapsedRecordingTimeInfo;
}

- (void)setElapsedRecordingTimeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedRecordingTimeInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elapsedRecordingTimeInfo, 0);
  objc_storeStrong((id *)&self->_recordingStartTimeInfo, 0);
  objc_storeStrong((id *)&self->_recordingStartTime, 0);
}

@end
