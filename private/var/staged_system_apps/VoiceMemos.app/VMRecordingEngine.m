@implementation VMRecordingEngine

- (VMRecordingEngine)init
{
  VMRecordingEngine *v2;
  dispatch_group_t v3;
  OS_dispatch_group *group;
  dispatch_group_t v5;
  OS_dispatch_group *stopGroup;
  NSMutableArray *v7;
  NSMutableArray *inputBufferQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VMRecordingEngine;
  v2 = -[VMRecordingEngine init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    v5 = dispatch_group_create();
    stopGroup = v2->_stopGroup;
    v2->_stopGroup = (OS_dispatch_group *)v5;

    v2->_recordingTime = v2->_recordingTimes;
    v7 = objc_opt_new(NSMutableArray);
    inputBufferQueue = v2->_inputBufferQueue;
    v2->_inputBufferQueue = v7;

    v2->_inputWriteLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("targetState"), CFSTR("targetState"));

  v5.receiver = self;
  v5.super_class = (Class)VMRecordingEngine;
  -[VMRecordingEngine dealloc](&v5, "dealloc");
}

- (void)setController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("targetState"), CFSTR("targetState"));
  objc_storeWeak((id *)&self->_controller, obj);
  if (obj)
    objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("targetState"), 0, CFSTR("targetState"));
  -[VMRecordingEngine _updateIoStarted](self, "_updateIoStarted");

}

- (BOOL)sampleRecordingTime:(double *)a3
{
  AVAudioTime *startTime;
  VMRecordingEngine *v5;
  VMRecordingTime *recordingTime;
  int64_t hostTime;
  double frameCount;
  AVAudioTime *v9;
  double v10;
  double v11;
  double v12;

  startTime = self->_startTime;
  if (startTime)
  {
    v5 = self;
    recordingTime = self->_recordingTime;
    hostTime = recordingTime->hostTime;
    frameCount = (double)recordingTime->frameCount;
    v9 = startTime;
    -[AVAudioTime sampleRate](v9, "sampleRate");
    v11 = frameCount / v10 + v5->_punchInTime;
    LODWORD(v5) = -[VMRecordingEngine isRunning](v5, "isRunning");

    if ((_DWORD)v5)
    {
      +[AVAudioTime secondsForHostTime:](AVAudioTime, "secondsForHostTime:", mach_absolute_time() - hostTime);
      v11 = v11 + v12;
    }
    *a3 = v11;
  }
  return startTime != 0;
}

- (void)_recordingStopped
{
  _QWORD block[5];

  if (self->_stopTime == 0.0)
    self->_stopTime = RCCurrentMediaTime();
  -[VMRecordingEngine _processBufferQueue](self, "_processBufferQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022538;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopRecordingAtTime:(double)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *stopGroup;
  dispatch_block_t block;

  v6 = (void (**)(_QWORD))a4;
  block = v6;
  if (self->_startTime && (self->_stopTime = a3, (stopGroup = self->_stopGroup) != 0))
    dispatch_group_notify(stopGroup, (dispatch_queue_t)&_dispatch_main_q, v6);
  else
    v6[2](v6);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  VMRecordingController **p_controller;
  id WeakRetained;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  objc_super v14;

  if (a6 == CFSTR("targetState"))
  {
    p_controller = &self->_controller;
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v9 = objc_msgSend(WeakRetained, "targetState");

    if ((_DWORD)v9)
      v10 = (_DWORD)v9 == 3;
    else
      v10 = 1;
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
      v12 = objc_loadWeakRetained((id *)p_controller);
      objc_msgSend(v11, "stopRecordingWithController:error:", v12, 0);

    }
    else if ((_DWORD)v9 == 2)
    {
      -[VMRecordingEngine startAndReturnError:](self, "startAndReturnError:", 0);
    }
    v13 = objc_loadWeakRetained((id *)p_controller);
    objc_msgSend(v13, "setCurrentState:", v9);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VMRecordingEngine;
    -[VMRecordingEngine observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)handleConfigurationChangeNotification:(id)a3
{
  _QWORD block[5];

  if ((-[VMRecordingEngine isRunning](self, "isRunning", a3) & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022824;
    block[3] = &unk_1001AB588;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)inputNode:(id *)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VMRecordingEngine;
  v3 = -[VMRecordingEngine inputNode](&v5, "inputNode");
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (BOOL)configureWithAudioSettings:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  BOOL v19;
  double v20;
  unsigned int v21;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id WeakRetained;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  id v44;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _BYTE *v54;
  id v55[3];
  _QWORD v56[4];
  id v57;
  id v58;
  id location;
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AVSampleRateKey));
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AVNumberOfChannelsKey));
  v11 = objc_msgSend(v10, "intValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine inputNode:](self, "inputNode:", a4));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "inputFormatForBus:", 0));
    objc_msgSend(v14, "sampleRate");
    if (v15 == 0.0 || (v20 = v15, !objc_msgSend(v14, "channelCount")))
    {
      if (a4)
      {
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 5, 0));
        v16 = OSLogForCategory(kVMLogCategoryService);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *a4;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[VMRecordingEngine configureWithAudioSettings:error:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s -- serviceError = %@", buf, 0x16u);
        }

      }
      v19 = 0;
    }
    else
    {
      v21 = objc_msgSend(v14, "channelCount");
      v47 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      v61 = sub_100022F24;
      v62 = sub_100022F34;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v63 = 0;
      if (v20 != *(double *)&v9 || v21 != (_DWORD)v11)
      {
        v23 = objc_msgSend(objc_alloc((Class)AVAudioFormat), "initStandardFormatWithSampleRate:channels:", v11, *(double *)&v9);
        v24 = objc_msgSend(objc_alloc((Class)AVAudioConverter), "initFromFormat:toFormat:", v14, v23);
        objc_msgSend(v24, "setSampleRateConverterQuality:", 127);
        if (objc_msgSend(v14, "channelCount") > v11)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioDevice defaultInputAndReturnError:](VMAudioDevice, "defaultInputAndReturnError:", 0));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stereoChannels"));
          objc_msgSend(v24, "setChannelMap:", v26);

        }
        v47 = v24;
        v27 = objc_alloc((Class)AVAudioPCMBuffer);
        LODWORD(v28) = vcvtpd_u64_f64(*(double *)&v9 / 10.0);
        v29 = objc_msgSend(v27, "initWithPCMFormat:frameCapacity:", v23, v28);
        v30 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v29;

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "waveformDataSource"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "waveformGenerator"));

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
      objc_initWeak(&location, self);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100022F3C;
      v56[3] = &unk_1001AB670;
      objc_copyWeak(&v58, &location);
      v46 = v33;
      v57 = v46;
      v35 = objc_retainBlock(v56);
      v36 = objc_loadWeakRetained((id *)&self->_controller);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "activityWaveformProcessor"));

      v38 = objc_loadWeakRetained((id *)&self->_controller);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "liveTranscription"));

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100023014;
      v48[3] = &unk_1001AB6C0;
      objc_copyWeak(v55, &location);
      LODWORD(v38) = vcvtpd_u64_f64(v20 / 10.0);
      v55[1] = *(id *)&v20;
      v55[2] = v9;
      v40 = v37;
      v49 = v40;
      v41 = v39;
      v50 = v41;
      v42 = v47;
      v51 = v42;
      v54 = buf;
      v43 = v35;
      v53 = v43;
      v44 = v34;
      v52 = v44;
      objc_msgSend(v13, "installTapOnBus:bufferSize:format:block:", 0, v38, v14, v48);
      dispatch_group_enter((dispatch_group_t)self->_stopGroup);
      AudioUnitAddPropertyListener((AudioUnit)objc_msgSend(v13, "audioUnit"), 0x7D1u, (AudioUnitPropertyListenerProc)sub_1000234F8, self);

      objc_destroyWeak(v55);
      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);

      _Block_object_dispose(buf, 8);
      v19 = 1;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_updateRecordingTimesWithFrameCount:(unsigned int)a3 atHostTime:(unint64_t)a4
{
  int64_t frameCount;
  VMRecordingTime *recordingTime;
  uint64_t v6;
  VMRecordingTime *v7;

  frameCount = self->_frameCount;
  self->_frameCount = frameCount + a3;
  recordingTime = self->_recordingTime;
  v6 = 1;
  if (recordingTime != self->_recordingTimes)
    v6 = 0xFFFFFFFFFFFFFFFLL;
  v7 = &recordingTime[v6];
  self->_recordingTime = v7;
  v7->hostTime = a4;
  v7->frameCount = frameCount;
}

- (void)_enqueueAudioBuffer:(id)a3 when:(id)a4
{
  os_unfair_lock_s *p_inputWriteLock;
  id v7;
  id v8;
  id v9;
  VMRecordingEngineBuffer *v10;

  p_inputWriteLock = &self->_inputWriteLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_inputWriteLock);
  v10 = objc_opt_new(VMRecordingEngineBuffer);
  v9 = objc_msgSend(v8, "copy");

  -[VMRecordingEngineBuffer setAudioBuffer:](v10, "setAudioBuffer:", v9);
  -[VMRecordingEngineBuffer setAudioTime:](v10, "setAudioTime:", v7);

  -[NSMutableArray addObject:](self->_inputBufferQueue, "addObject:", v10);
  os_unfair_lock_unlock(p_inputWriteLock);

}

- (void)_processBufferQueue
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double stopTime;
  double v12;
  void *v13;
  double v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  os_unfair_lock_t lock;

  if (self->_stopTimeReached)
    return;
  lock = &self->_inputWriteLock;
  os_unfair_lock_lock(&self->_inputWriteLock);
  v3 = RCCurrentMediaTime();
  v4 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_inputBufferQueue, "firstObject"));
  if (!v4)
    goto LABEL_17;
  v5 = (void *)v4;
  while (1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioTime"));
    +[AVAudioTime secondsForHostTime:](AVAudioTime, "secondsForHostTime:", objc_msgSend(v6, "hostTime"));
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioBuffer"));
    v10 = v9;
    stopTime = self->_stopTime;
    if (stopTime != 0.0)
      break;
    v19 = (double)objc_msgSend(v9, "frameLength");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "format"));
    objc_msgSend(v20, "sampleRate");
    v22 = v19 / v21;

    if (v8 + v22 > v3 - VMAudioWriteDelay())
      goto LABEL_16;
    -[VMRecordingEngine _writeBufferToStorage:](self, "_writeBufferToStorage:", v10);
LABEL_14:
    -[NSMutableArray removeObjectAtIndex:](self->_inputBufferQueue, "removeObjectAtIndex:", 0);
    v23 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_inputBufferQueue, "firstObject"));

    v5 = (void *)v23;
    if (!v23)
      goto LABEL_17;
  }
  v12 = fmax(stopTime - v8, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "format"));
  objc_msgSend(v13, "sampleRate");
  v15 = (v12 * v14);

  v16 = objc_msgSend(v10, "frameLength");
  v17 = v16;
  if (v16 >= v15)
    v18 = v15;
  else
    v18 = v16;
  if (v18 < objc_msgSend(v10, "frameLength"))
    objc_msgSend(v10, "setFrameLength:", v18);
  -[VMRecordingEngine _writeBufferToStorage:](self, "_writeBufferToStorage:", v10);
  if (v17 < v15)
    goto LABEL_14;
  self->_stopTimeReached = 1;
LABEL_16:

LABEL_17:
  if (self->_stopTimeReached)
    -[NSMutableArray removeAllObjects](self->_inputBufferQueue, "removeAllObjects");
  os_unfair_lock_unlock(lock);
}

- (void)_writeBufferToStorage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];

  v4 = a3;
  if (objc_msgSend(v4, "frameLength"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCSAudioFile url](self->_assetWriter, "url"));
    if (v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100023974;
      v8[3] = &unk_1001AB710;
      v8[4] = self;
      -[NSObject writeAudioFile:buffer:completionBlock:](v6, "writeAudioFile:buffer:completionBlock:", v5, v4, v8);
    }
    else
    {
      v7 = OSLogForCategory(kVMLogCategoryService);
      v6 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10010AB20(v6);
    }

  }
}

- (BOOL)startAndReturnError:(id *)a3
{
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;

  v8.receiver = self;
  v8.super_class = (Class)VMRecordingEngine;
  v4 = -[VMRecordingEngine startAndReturnError:](&v8, "startAndReturnError:", a3);
  if (v4)
  {
    v5 = OSLogForCategory(kVMLogCategoryDefault);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[VMRecordingEngine startAndReturnError:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s -- Recording engine started", buf, 0xCu);
    }

  }
  -[VMRecordingEngine _updateIoStarted](self, "_updateIoStarted");
  return v4;
}

- (void)pause
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMRecordingEngine;
  -[VMRecordingEngine pause](&v3, "pause");
  -[VMRecordingEngine _updateIoStarted](self, "_updateIoStarted");
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMRecordingEngine;
  -[VMRecordingEngine reset](&v3, "reset");
  -[VMRecordingEngine _updateIoStarted](self, "_updateIoStarted");
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMRecordingEngine;
  -[VMRecordingEngine stop](&v3, "stop");
  -[VMRecordingEngine _updateIoStarted](self, "_updateIoStarted");
}

- (void)_updateIoStarted
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine controller](self, "controller"));
  v4 = objc_msgSend(v3, "ioStarted");
  v5 = -[VMRecordingEngine isRunning](self, "isRunning");

  if (v4 != v5)
  {
    v6 = -[VMRecordingEngine isRunning](self, "isRunning");
    v7 = (id)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine controller](self, "controller"));
    objc_msgSend(v7, "setIoStarted:", v6);

  }
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (RCSAudioFile)assetWriter
{
  return self->_assetWriter;
}

- (void)setAssetWriter:(id)a3
{
  objc_storeStrong((id *)&self->_assetWriter, a3);
}

- (NSMutableDictionary)audioSettings
{
  return self->_audioSettings;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameCount = a3;
}

- (double)punchInTime
{
  return self->_punchInTime;
}

- (void)setPunchInTime:(double)a3
{
  self->_punchInTime = a3;
}

- (double)punchOutTime
{
  return self->_punchOutTime;
}

- (void)setPunchOutTime:(double)a3
{
  self->_punchOutTime = a3;
}

- (VMRecordingController)controller
{
  return (VMRecordingController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (BOOL)internalRecording
{
  return self->_internalRecording;
}

- (void)setInternalRecording:(BOOL)a3
{
  self->_internalRecording = a3;
}

- (AVAudioTime)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (double)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(double)a3
{
  self->_stopTime = a3;
}

- (OS_dispatch_group)stopGroup
{
  return self->_stopGroup;
}

- (void)setStopGroup:(id)a3
{
  objc_storeStrong((id *)&self->_stopGroup, a3);
}

- (NSMutableArray)inputBufferQueue
{
  return self->_inputBufferQueue;
}

- (void)setInputBufferQueue:(id)a3
{
  objc_storeStrong((id *)&self->_inputBufferQueue, a3);
}

- (os_unfair_lock_s)inputWriteLock
{
  return self->_inputWriteLock;
}

- (void)setInputWriteLock:(os_unfair_lock_s)a3
{
  self->_inputWriteLock = a3;
}

- (BOOL)stopTimeReached
{
  return self->_stopTimeReached;
}

- (void)setStopTimeReached:(BOOL)a3
{
  self->_stopTimeReached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBufferQueue, 0);
  objc_storeStrong((id *)&self->_stopGroup, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_audioSettings, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
