@implementation RAPGraphDirectionsRecorder

- (RAPGraphDirectionsRecorder)init
{
  RAPGraphDirectionsRecorder *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *recordingQueue;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RAPGraphDirectionsRecorder;
  v2 = -[RAPGraphDirectionsRecorder init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.Maps.RAPDirectionsRecorder", v4);
    recordingQueue = v2->_recordingQueue;
    v2->_recordingQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_savePartialRecording", UIApplicationWillResignActiveNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[RAPGraphDirectionsRecorder isRecording](self, "isRecording"))
    -[RAPGraphDirectionsRecorder stopRecording](self, "stopRecording");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RAPGraphDirectionsRecorder;
  -[RAPGraphDirectionsRecorder dealloc](&v4, "dealloc");
}

- (void)startRecording
{
  RAPDirectionsRecording *v3;
  RAPDirectionsRecording *recording;
  RAPAuxiliaryControlsRecorder *v5;
  RAPAuxiliaryControlsRecorder *auxiliaryControlsRecorder;
  id v7;

  v3 = objc_alloc_init(RAPDirectionsRecording);
  recording = self->_recording;
  self->_recording = v3;

  -[RAPGraphDirectionsRecorder setIsRecording:](self, "setIsRecording:", 1);
  v5 = objc_alloc_init(RAPAuxiliaryControlsRecorder);
  auxiliaryControlsRecorder = self->_auxiliaryControlsRecorder;
  self->_auxiliaryControlsRecorder = v5;

  -[RAPAuxiliaryControlsRecorder start](self->_auxiliaryControlsRecorder, "start");
  if (self->_hasAuxiliaryControlsOrigin)
    -[RAPAuxiliaryControlsRecorder setOriginatingDeviceFromOrigin:](self->_auxiliaryControlsRecorder, "setOriginatingDeviceFromOrigin:", self->_auxiliaryControlsOrigin);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v7, "registerObserver:", self);

}

- (id)copyCurrentPartialRecording
{
  OS_dispatch_queue *recordingQueue;
  NSObject *v4;
  void ***v5;
  const char *label;
  const char *v7;
  void *v9;
  uint64_t v10;
  RAPAuxiliaryControlsRecording *v11;
  id v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  RAPGraphDirectionsRecorder *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  if (!-[RAPGraphDirectionsRecorder isRecording](self, "isRecording"))
    return 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100489084;
  v23 = sub_100489094;
  v24 = 0;
  recordingQueue = self->_recordingQueue;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10048909C;
  v16 = &unk_1011ADF48;
  v17 = self;
  v18 = &v19;
  v4 = recordingQueue;
  v5 = &v13;
  label = dispatch_queue_get_label(v4);
  v7 = dispatch_queue_get_label(0);
  if (label == v7 || label && v7 && !strcmp(label, v7))
  {
    v9 = objc_autoreleasePoolPush();
    v15((uint64_t)v5);
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    dispatch_sync(v4, v5);
  }

  v10 = v20[5];
  v11 = -[RAPAuxiliaryControlsRecorder copyCurrentPartialRecording](self->_auxiliaryControlsRecorder, "copyCurrentPartialRecording", v13, v14);
  -[RAPGraphDirectionsRecorder _immediatelyUpdateRecording:withAuxiliaryControlsRecording:](self, "_immediatelyUpdateRecording:withAuxiliaryControlsRecording:", v10, v11);

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (void)_immediatelyUpdateRecording:(id)a3 withAuxiliaryControlsRecording:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "auxiliaryControls"));
    v8 = objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "setAuxiliaryControls:", v8);

    if (objc_msgSend(v6, "hasOriginatingAuxiliaryControlIndex"))
      objc_msgSend(v9, "setOriginatingAuxiliaryControlIndex:", objc_msgSend(v6, "originatingAuxiliaryControlIndex"));
    else
      objc_msgSend(v9, "setHasOriginatingAuxiliaryControlIndex:", 0);
  }

}

- (void)setOriginatingDeviceFromOrigin:(int64_t)a3
{
  RAPAuxiliaryControlsRecorder *auxiliaryControlsRecorder;

  self->_auxiliaryControlsOrigin = a3;
  self->_hasAuxiliaryControlsOrigin = 1;
  auxiliaryControlsRecorder = self->_auxiliaryControlsRecorder;
  if (auxiliaryControlsRecorder)
    -[RAPAuxiliaryControlsRecorder setOriginatingDeviceFromOrigin:](auxiliaryControlsRecorder, "setOriginatingDeviceFromOrigin:");
}

- (void)_savePartialRecording
{
  -[RAPGraphDirectionsRecorder savePartialRecordingWithCompletion:](self, "savePartialRecordingWithCompletion:", 0);
}

- (void)savePartialRecordingWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  RAPAuxiliaryControlsRecording *v7;
  void *v8;
  OS_dispatch_queue *recordingQueue;
  RAPAuxiliaryControlsRecording *v10;
  id v11;
  NSObject *v12;
  _QWORD *v13;
  const char *label;
  const char *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  void (*v19)(uint64_t);
  void *v20;
  RAPGraphDirectionsRecorder *v21;
  RAPAuxiliaryControlsRecording *v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1004893A8;
  v25[3] = &unk_1011B77A8;
  v4 = a3;
  v26 = v4;
  v5 = objc_retainBlock(v25);
  if (!-[RAPGraphDirectionsRecorder isRecording](self, "isRecording"))
  {
    v16 = CFSTR("not recording");
LABEL_10:
    v10 = (RAPAuxiliaryControlsRecording *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](NSError, "GEOErrorWithCode:reason:", -13, v16));
    ((void (*)(_QWORD *, _QWORD, RAPAuxiliaryControlsRecording *))v5[2])(v5, 0, v10);
    goto LABEL_13;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPGraphDirectionsRecorder historyItemIdentifier](self, "historyItemIdentifier"));

  if (!v6)
  {
    v16 = CFSTR("historyItemIdentifier wasn't set when trying to save partial recording");
    goto LABEL_10;
  }
  v7 = -[RAPAuxiliaryControlsRecorder copyCurrentPartialRecording](self->_auxiliaryControlsRecorder, "copyCurrentPartialRecording");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RAPStorageHistoryContainer directionsRecordingStorage](RAPStorageHistoryContainer, "directionsRecordingStorage"));
  recordingQueue = self->_recordingQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v19 = sub_100489478;
  v20 = &unk_1011B4320;
  v21 = self;
  v10 = v7;
  v22 = v10;
  v11 = v8;
  v23 = v11;
  v24 = v5;
  v12 = recordingQueue;
  v13 = v18;
  label = dispatch_queue_get_label(v12);
  v15 = dispatch_queue_get_label(0);
  if (label == v15 || label && v15 && !strcmp(label, v15))
  {
    v17 = objc_autoreleasePoolPush();
    v19((uint64_t)v13);
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    dispatch_sync(v12, v13);
  }

LABEL_13:
}

- (void)stopRecording
{
  void *v3;
  RAPAuxiliaryControlsRecorder *auxiliaryControlsRecorder;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  -[RAPGraphDirectionsRecorder _savePartialRecording](self, "_savePartialRecording");
  -[RAPAuxiliaryControlsRecorder stop](self->_auxiliaryControlsRecorder, "stop");
  auxiliaryControlsRecorder = self->_auxiliaryControlsRecorder;
  self->_auxiliaryControlsRecorder = 0;

  -[RAPGraphDirectionsRecorder setIsRecording:](self, "setIsRecording:", 0);
}

- (void)_optimizeRecordingData
{
  void *v3;
  id v4;
  unint64_t v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  id v16;
  unsigned int v17;
  RAPGraphDirectionsRecorder *v18;
  void *v19;
  id v20;
  char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  char *v29;
  id v30;
  NSObject *v31;
  void *v32;
  char *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  unint64_t k;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *m;
  char *v45;
  char *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  char *numRecordedRoutes;
  NSMutableIndexSet *v54;
  NSMutableIndexSet *v55;
  uint64_t v56;
  RAPGraphDirectionsRecorder *v57;
  id v58;
  void *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  char *v80;
  _BYTE v81[128];
  _BYTE v82[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsResponses](self->_recording, "directionsResponses"));
  if (objc_msgSend(v59, "count") == (id)1)
  {

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording userPaths](self->_recording, "userPaths"));
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v57 = self;
      v5 = -[RAPDirectionsRecording directionsResponsesCount](self->_recording, "directionsResponsesCount");
      v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v5);
      if (v5)
      {
        v7 = v5;
        do
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          objc_msgSend(v6, "addObject:", v8);

          --v7;
        }
        while (v7);
      }
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording userPaths](v57->_recording, "userPaths"));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v74 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
            if (v5 <= objc_msgSend(v14, "routeIndex"))
            {
              v16 = sub_100431F8C();
              v15 = objc_claimAutoreleasedReturnValue(v16);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
              {
                v17 = objc_msgSend(v14, "routeIndex");
                *(_DWORD *)buf = 67109120;
                LODWORD(v80) = v17;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Route index: %u out of bounds for RAP user path entry.", buf, 8u);
              }
            }
            else
            {
              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v14, "routeIndex")));
              -[NSObject addObject:](v15, "addObject:", v14);
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
        }
        while (v11);
      }

      v55 = objc_opt_new(NSMutableIndexSet);
      v18 = v57;
      v54 = objc_opt_new(NSMutableIndexSet);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v20 = v6;
      v58 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
      if (v58)
      {
        v21 = 0;
        v56 = *(_QWORD *)v70;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v70 != v56)
              objc_enumerationMutation(v20);
            v23 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v22);
            v60 = v22;
            if (-[RAPGraphDirectionsRecorder _bucketHasOnlyStoredSteps:](v18, "_bucketHasOnlyStoredSteps:", v23)
              || -[RAPGraphDirectionsRecorder _bucketHasOnlyMissedStep:](v18, "_bucketHasOnlyMissedStep:", v23))
            {
              v24 = sub_100431F8C();
              v25 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v80 = v21;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Removing route #%lu", buf, 0xCu);
              }

              v26 = sub_100431F8C();
              v27 = objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsRequests](v18->_recording, "directionsRequests"));
                v29 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v21));
                *(_DWORD *)buf = 134217984;
                v80 = v29;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "\t Request: %p", buf, 0xCu);

              }
              -[NSMutableIndexSet addIndex:](v55, "addIndex:", v21);
              v30 = sub_100431F8C();
              v31 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsResponses](v18->_recording, "directionsResponses"));
                v33 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", v21));
                *(_DWORD *)buf = 134217984;
                v80 = v33;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "\tResponse: %p", buf, 0xCu);

              }
              -[NSMutableIndexSet addIndex:](v54, "addIndex:", v21);
              v67 = 0u;
              v68 = 0u;
              v65 = 0u;
              v66 = 0u;
              v34 = v23;
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
              if (v35)
              {
                v36 = v35;
                v37 = *(_QWORD *)v66;
                do
                {
                  for (j = 0; j != v36; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v66 != v37)
                      objc_enumerationMutation(v34);
                    objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j));
                  }
                  v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
                }
                while (v36);
              }

              for (k = (unint64_t)(v21 + 1); k < v5; ++k)
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", k));
                v61 = 0u;
                v62 = 0u;
                v63 = 0u;
                v64 = 0u;
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
                if (v41)
                {
                  v42 = v41;
                  v43 = *(_QWORD *)v62;
                  do
                  {
                    for (m = 0; m != v42; m = (char *)m + 1)
                    {
                      if (*(_QWORD *)v62 != v43)
                        objc_enumerationMutation(v40);
                      objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)m), "setRouteIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)m), "routeIndex") - 1);
                    }
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
                  }
                  while (v42);
                }

              }
            }
            else
            {
              v45 = (char *)objc_msgSend(v23, "count");
              v46 = v45 - 1;
              if (v45 != (char *)1)
              {
                while (1)
                {
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v46));
                  if (objc_msgSend(v47, "traversal"))
                    break;
                  objc_msgSend(v19, "addObject:", v47);

                  if (!--v46)
                    goto LABEL_53;
                }

              }
            }
LABEL_53:
            ++v21;
            v22 = v60 + 1;
            v18 = v57;
          }
          while ((id)(v60 + 1) != v58);
          v58 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        }
        while (v58);
      }

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsRequests](v18->_recording, "directionsRequests"));
      objc_msgSend(v48, "removeObjectsAtIndexes:", v55);

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsResponses](v18->_recording, "directionsResponses"));
      objc_msgSend(v49, "removeObjectsAtIndexes:", v54);

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording userPaths](v18->_recording, "userPaths"));
      objc_msgSend(v50, "removeObjectsInArray:", v19);

      v18->_numRecordedRoutes = -[RAPDirectionsRecording directionsResponsesCount](v18->_recording, "directionsResponsesCount");
      v51 = sub_100431F8C();
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        numRecordedRoutes = (char *)v18->_numRecordedRoutes;
        *(_DWORD *)buf = 134217984;
        v80 = numRecordedRoutes;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "_optimizeRecordingData _numRecordedRoutes %lu", buf, 0xCu);
      }

    }
  }
}

- (BOOL)_bucketHasOnlyStoredSteps:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "traversal", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)_bucketHasOnlyMissedStep:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        v8 = v5;
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "traversal", (_QWORD)v11) == 2
          && (!objc_msgSend(v9, "stepIndex") || v8 && !objc_msgSend(v8, "traversal")))
        {
          LOBYTE(v4) = 1;
          goto LABEL_14;
        }
        v5 = v9;

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
    v8 = v5;
LABEL_14:

  }
  return (char)v4;
}

- (void)setSelectedRoute:(id)a3 fromRouteList:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  RAPGraphDirectionsRecorder *v13;
  id v14;
  BOOL v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "transportType") == 1;
  -[RAPGraphDirectionsRecorder setObservedRoute:](self, "setObservedRoute:", v6);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10048A018;
  v11[3] = &unk_1011AED08;
  v15 = v8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v11);

}

- (void)_updateRideSelectionsWithComposedRoute:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideSelectionsAsNSData")));
  v6 = objc_msgSend(v5, "bytes");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideSelections"));
  v8 = objc_msgSend(v7, "count");

  -[RAPDirectionsRecording setClusteredRouteRideSelections:count:](self->_recording, "setClusteredRouteRideSelections:count:", v6, v8);
}

- (void)updateRideSelectionsWithComposedRoute:(id)a3
{
  id v3;
  _QWORD v4[4];
  RAPGraphDirectionsRecorder *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10048A2C4;
  v4[3] = &unk_1011AC8B0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[RAPGraphDirectionsRecorder _dispatch:](v5, "_dispatch:", v4);

}

- (id)_userSearchInputForWaypoint:(id)a3
{
  id v3;
  RAPUserSearchInput *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  id v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = objc_alloc_init(RAPUserSearchInput);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestSearchString"));
  -[RAPUserSearchInput setSearchString:](v4, "setSearchString:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestAddress"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestAddress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "singleLineAddress"));
    -[RAPUserSearchInput setSingleLineAddressString:](v4, "setSingleLineAddressString:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestSearch"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoMapItem"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoMapItemStorageForPersistence"));
    -[RAPUserSearchInput setPlaceMapItemStorage:](v4, "setPlaceMapItemStorage:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completion"));
  v14 = objc_msgSend(v13, "copyStorage");
  -[RAPUserSearchInput setCompletionStorage:](v4, "setCompletionStorage:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestSearch"));
  v16 = v15;
  if (v15)
  {
    v17 = objc_msgSend(v15, "type");
    if (v17 == 3)
      v18 = 3;
    else
      v18 = 2 * (v17 == 4);
    -[RAPUserSearchInput setOrigin:](v4, "setOrigin:", v18);
    v19 = objc_alloc_init((Class)GEOLatLng);
    objc_msgSend(v16, "coordinate");
    objc_msgSend(v19, "setLat:");
    objc_msgSend(v16, "coordinate");
    objc_msgSend(v19, "setLng:", v20);
    -[RAPUserSearchInput setCoordinate:](v4, "setCoordinate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "findMyHandle"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "findMyHandle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
      -[RAPUserSearchInput setFindMyHandleID:](v4, "setFindMyHandleID:", v23);

    }
  }

  return v4;
}

- (void)recordWaypoints:(id)a3 startWaypointSearchTicket:(id)a4 endWaypointSearchTicket:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];

  v8 = a4;
  v9 = a5;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10048A5DC;
  v18[3] = &unk_1011B8140;
  v18[4] = self;
  v10 = sub_10039DCD4(a3, v18);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10048A644;
  v14[3] = &unk_1011AF1B0;
  v14[4] = self;
  v15 = (id)objc_claimAutoreleasedReturnValue(v10);
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v15;
  -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v14);

}

- (void)recordNewRequest:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10048A7B4;
    v6[3] = &unk_1011AC8B0;
    v6[4] = self;
    v7 = v4;
    -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v6);

  }
}

- (void)recordNewResponse:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10048A8E4;
    v6[3] = &unk_1011AC8B0;
    v6[4] = self;
    v7 = v4;
    -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v6);

  }
}

- (void)recordNewRoute:(id)a3
{
  -[RAPGraphDirectionsRecorder recordNewRoute:fromStepIndex:](self, "recordNewRoute:fromStepIndex:", a3, 0);
}

- (void)recordNewRoute:(id)a3 fromStepIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoWaypointRoute"));

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10048AA5C;
    v8[3] = &unk_1011B15B0;
    v8[4] = self;
    v9 = v6;
    v10 = a4;
    -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v8);

  }
}

- (void)clearAll
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10048ABEC;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v2);
}

- (void)recordNewSessionID:(GEOSessionID)a3
{
  _QWORD v3[5];
  GEOSessionID v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10048AD18;
  v3[3] = &unk_1011AED30;
  v3[4] = self;
  v4 = a3;
  -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v3);
}

- (void)_dispatch:(id)a3
{
  id v4;
  void *v5;
  NSObject *recordingQueue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = v4;
  recordingQueue = self->_recordingQueue;
  if (recordingQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10048ADA8;
    block[3] = &unk_1011ADA00;
    v8 = v4;
    dispatch_async(recordingQueue, block);

  }
}

- (void)setObservedRoute:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observedRoute);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_observedRoute);
    objc_msgSend(v5, "unregisterObserver:", self);

    v6 = objc_storeWeak((id *)&self->_observedRoute, obj);
    objc_msgSend(obj, "registerObserver:", self);

  }
}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RAPGraphDirectionsRecorder observedRoute](self, "observedRoute"));

  v8 = v9;
  if (v7 == v9)
  {
    -[RAPGraphDirectionsRecorder updateRideSelectionsWithComposedRoute:](self, "updateRideSelectionsWithComposedRoute:", v9);
    v8 = v9;
  }

}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));
    v11 = objc_msgSend(v10, "isGoodMatch");

    if (v11)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10048AFE4;
      v13[3] = &unk_1011AC8B0;
      v13[4] = self;
      v14 = v7;
      -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v13);

    }
  }
  if (self->_switchedTransportTypeWaitingForLocation)
  {
    self->_switchedTransportTypeWaitingForLocation = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
    -[RAPGraphDirectionsRecorder _handleNewRoute:fromStepIndex:](self, "_handleNewRoute:fromStepIndex:", v12, objc_msgSend(v7, "stepIndex"));

  }
}

- (void)setLastGoodLocation:(id)a3
{
  id v5;
  GEORouteMatch **p_lastGoodLocation;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  p_lastGoodLocation = &self->_lastGoodLocation;
  objc_storeStrong((id *)p_lastGoodLocation, a3);
  v7 = sub_100431F8C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = -[GEORouteMatch stepIndex](*p_lastGoodLocation, "stepIndex");
    v10 = 134217984;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Changing last good location:\tcurr step: %lu\n", (uint8_t *)&v10, 0xCu);
  }

}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  _QWORD v6[7];

  if (a4 <= 0x7FFFFFFFFFFFFFFELL && self->_numRecordedRoutes != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10048B168;
    v6[3] = &unk_1011AED30;
    v6[4] = self;
    v6[5] = a4;
    v6[6] = a5;
    -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v6);
  }
}

- (void)navigationServiceWillReroute:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10048B2C0;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  -[RAPGraphDirectionsRecorder _dispatch:](self, "_dispatch:", v3);
}

- (void)_storeUserPathWithRouteIndex:(unint64_t)a3 stepIndex:(unint64_t)a4
{
  RAPUserPathEntry *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __CFString *v13;
  uint8_t buf[4];
  RAPUserPathEntry *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  __CFString *v21;

  v7 = objc_alloc_init(RAPUserPathEntry);
  -[RAPUserPathEntry setRouteIndex:](v7, "setRouteIndex:", a3);
  -[RAPUserPathEntry setStepIndex:](v7, "setStepIndex:", a4);
  -[RAPUserPathEntry setTraversal:](v7, "setTraversal:", 0);
  v8 = sub_100431F8C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = -[RAPUserPathEntry routeIndex](v7, "routeIndex");
    v11 = -[RAPUserPathEntry stepIndex](v7, "stepIndex");
    v12 = (id)-[RAPUserPathEntry traversal](v7, "traversal");
    if (v12 >= 3)
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v12));
    else
      v13 = off_1011B8160[(int)v12];
    *(_DWORD *)buf = 134218754;
    v15 = v7;
    v16 = 2048;
    v17 = v10;
    v18 = 2048;
    v19 = v11;
    v20 = 2112;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "\nStoring path entry %p:\n\trte: %lu\n\tstp: %lu\n\ttrv: %@\n", buf, 0x2Au);

  }
  -[RAPDirectionsRecording addUserPath:](self->_recording, "addUserPath:", v7);

}

- (void)_replaceUserPathWithRouteIndex:(unint64_t)a3 stepIndex:(unint64_t)a4 traversal:(int)a5
{
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __CFString *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  __CFString *v29;

  v5 = *(_QWORD *)&a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPGraphDirectionsRecorder _userPathEntryWithRouteIndex:stepIndex:](self, "_userPathEntryWithRouteIndex:stepIndex:", a3, a4));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setTraversal:", v5);
    if (objc_msgSend(v8, "traversal") == 2)
    {
      v9 = objc_alloc((Class)GEOLatLng);
      -[GEORouteMatch locationCoordinate3D](self->_lastGoodLocation, "locationCoordinate3D");
      v11 = v10;
      -[GEORouteMatch locationCoordinate3D](self->_lastGoodLocation, "locationCoordinate3D");
      v12 = objc_msgSend(v9, "initWithLatitude:longitude:", v11);
      objc_msgSend(v8, "setRerouteLocation:", v12);

      -[GEORouteMatch locationCoordinate3D](self->_lastGoodLocation, "locationCoordinate3D");
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rerouteLocation"));
      objc_msgSend(v15, "setElevationM:", v14);

    }
    v16 = sub_100431F8C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_msgSend(v8, "routeIndex");
      v19 = objc_msgSend(v8, "stepIndex");
      v20 = objc_msgSend(v8, "traversal");
      if (v20 >= 3)
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v20));
      else
        v21 = off_1011B8160[(int)v20];
      *(_DWORD *)buf = 134218754;
      v23 = v8;
      v24 = 2048;
      v25 = v18;
      v26 = 2048;
      v27 = v19;
      v28 = 2112;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "\nReplaced path entry %p:\n\trte: %lu\n\tstp: %lu\n\ttrv: %@\n", buf, 0x2Au);

    }
  }

}

- (id)_userPathEntryWithRouteIndex:(unint64_t)a3 stepIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording userPaths](self->_recording, "userPaths", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "routeIndex") == a3 && objc_msgSend(v11, "stepIndex") == a4)
        {
          v12 = v11;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (void)_handleNewRoute:(id)a3 fromStepIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeInitializerData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsRequest"));
  -[RAPGraphDirectionsRecorder recordNewRequest:](self, "recordNewRequest:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeInitializerData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "directionsResponse"));
  -[RAPGraphDirectionsRecorder recordNewResponse:](self, "recordNewResponse:", v9);

  -[RAPGraphDirectionsRecorder recordNewRoute:fromStepIndex:](self, "recordNewRoute:fromStepIndex:", v10, a4);
  -[RAPGraphDirectionsRecorder setObservedRoute:](self, "setObservedRoute:", v10);

}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = sub_100431F8C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Did reroute", v9, 2u);
  }

  -[RAPGraphDirectionsRecorder _handleNewRoute:fromStepIndex:](self, "_handleNewRoute:fromStepIndex:", v6, 0);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v7 = sub_100431F8C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didSwitchToNewTransportType", v9, 2u);
  }

  self->_switchedTransportTypeWaitingForLocation = 1;
}

- (NSUUID)historyItemIdentifier
{
  return self->_historyItemIdentifier;
}

- (void)setHistoryItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_historyItemIdentifier, a3);
}

- (GEOComposedRoute)observedRoute
{
  return (GEOComposedRoute *)objc_loadWeakRetained((id *)&self->_observedRoute);
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (GEORouteMatch)lastGoodLocation
{
  return self->_lastGoodLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGoodLocation, 0);
  objc_destroyWeak((id *)&self->_observedRoute);
  objc_storeStrong((id *)&self->_historyItemIdentifier, 0);
  objc_storeStrong((id *)&self->_recording, 0);
  objc_storeStrong((id *)&self->_auxiliaryControlsRecorder, 0);
  objc_storeStrong((id *)&self->_recordingQueue, 0);
}

@end
