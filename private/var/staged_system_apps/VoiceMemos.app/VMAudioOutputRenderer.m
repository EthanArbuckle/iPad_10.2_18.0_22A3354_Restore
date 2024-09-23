@implementation VMAudioOutputRenderer

- (VMAudioOutputRenderer)initWithQueue:(id)a3
{
  id v4;
  VMAudioOutputRenderer *v5;
  AVAudioEngine *v6;
  AVAudioEngine *audioEngine;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *inputPollingQueue;
  AVAudioMixerNode *v10;
  AVAudioMixerNode *mixerNode;
  VMProcessor *v12;
  VMProcessor *enhanceProcessor;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VMAudioOutputRenderer;
  v5 = -[VMAudioOutputRenderer init](&v15, "init");
  if (v5)
  {
    v6 = objc_opt_new(AVAudioEngine);
    audioEngine = v5->_audioEngine;
    v5->_audioEngine = v6;

    if (v4)
      v8 = (OS_dispatch_queue *)v4;
    else
      v8 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(-[VMAudioOutputRenderer _createQueue:](v5, "_createQueue:", 1));
    inputPollingQueue = v5->_inputPollingQueue;
    v5->_inputPollingQueue = v8;

    v10 = objc_opt_new(AVAudioMixerNode);
    mixerNode = v5->_mixerNode;
    v5->_mixerNode = v10;

    v5->_renderLock._os_unfair_lock_opaque = 0;
    -[AVAudioEngine attachNode:](v5->_audioEngine, "attachNode:", v5->_mixerNode);
    v5->_timeStretchRate = 1.0;
    v12 = -[VMProcessor initForRealTime:]([VMProcessor alloc], "initForRealTime:", 1);
    enhanceProcessor = v5->_enhanceProcessor;
    v5->_enhanceProcessor = v12;

    -[VMAudioOutputRenderer registerNotifications](v5, "registerNotifications");
  }

  return v5;
}

- (id)_createQueue:(BOOL)a3
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;

  if (a3)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v4 = objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = 0;
  }
  v5 = dispatch_queue_create("VMAudioOutputRenderer.pollingQueue", v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[VMAudioOutputRenderer unprepare](self, "unprepare");
  v3.receiver = self;
  v3.super_class = (Class)VMAudioOutputRenderer;
  -[VMAudioOutputRenderer dealloc](&v3, "dealloc");
}

- (void)unprepare
{
  AVAudioSourceNode *sourceNode;
  AVAudioFormat *processingFormat;
  id inputPollingBlock;

  if (-[AVAudioEngine isRunning](self->_audioEngine, "isRunning"))
    -[AVAudioEngine stop](self->_audioEngine, "stop");
  if (self->_sourceNode)
  {
    -[AVAudioEngine detachNode:](self->_audioEngine, "detachNode:");
    sourceNode = self->_sourceNode;
    self->_sourceNode = 0;

  }
  processingFormat = self->_processingFormat;
  self->_processingFormat = 0;

  inputPollingBlock = self->_inputPollingBlock;
  self->_inputPollingBlock = 0;

  -[VMAudioOutputRenderer _tearDownTimeStretch](self, "_tearDownTimeStretch", sub_10002ADDC((uint64_t)&self->_ringBuffer));
}

- (void)_tearDownTimeStretch
{
  OpaqueAudioComponentInstance *timeStretchAudiounit;

  timeStretchAudiounit = self->_timeStretchAudiounit;
  if (timeStretchAudiounit)
  {
    AudioUnitUninitialize(timeStretchAudiounit);
    AudioComponentInstanceDispose(self->_timeStretchAudiounit);
    self->_timeStretchAudiounit = 0;
  }
}

- (BOOL)prepareToRender:(id)a3 inputBlock:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  unsigned __int8 v11;
  void *v12;
  id inputPollingBlock;
  void *v14;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v9 = a3;
  v10 = a4;
  -[VMAudioOutputRenderer unprepare](self, "unprepare");
  v11 = objc_msgSend(v9, "isStandard");
  if ((v11 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_processingFormat, a3);
    self->_maxBufferFill = 12288;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioOutputRenderer _createPollingBlock:](self, "_createPollingBlock:", v10));
    inputPollingBlock = self->_inputPollingBlock;
    self->_inputPollingBlock = v12;

    sub_10003B88C((uint64_t)&self->_ringBuffer, 2 * self->_maxBufferFill, (int)objc_msgSend(v9, "channelCount"), 0);
  }
  else if (a5)
  {
    v16 = NSLocalizedDescriptionKey;
    v17 = CFSTR("VMAudioOutputRenderer must use deinterleaved float PCM format");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", RCVoiceMemosErrorDomain, 1, v14));

  }
  return v11;
}

- (void)_prepareRenderChainIfNeeded
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  id v9;
  AVAudioFormat *processingFormat;
  void *v11;
  AVAudioSourceNode *v12;
  AVAudioSourceNode *sourceNode;
  void *v14;
  NSObject *v15;
  AVAudioEngine *audioEngine;
  AVAudioMixerNode *mixerNode;
  void *v18;
  void *v19;
  unsigned int v20;
  const AudioStreamBasicDescription *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[2];
  uint64_t v26;
  _QWORD block[5];

  if (!self->_processingFormat)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/VoiceMemos/Application/AudioServices/AudioPlayer/VMAudioOutputRenderer.mm"));
    v5 = (void *)v4;
    v6 = CFSTR("<Unknown File>");
    if (v4)
      v6 = (__CFString *)v4;
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 144, CFSTR("prepareToRender must be called before _prepareRenderChainIfNeeded"), 0, 0, 0, 0, 0);

  }
  if (!self->_sourceNode)
  {
    v9 = objc_alloc((Class)AVAudioSourceNode);
    processingFormat = self->_processingFormat;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioOutputRenderer _sourceNodeInputBlock](self, "_sourceNodeInputBlock"));
    v12 = (AVAudioSourceNode *)objc_msgSend(v9, "initWithFormat:renderBlock:", processingFormat, v11);
    sourceNode = self->_sourceNode;
    self->_sourceNode = v12;

    -[AVAudioEngine attachNode:](self->_audioEngine, "attachNode:", self->_sourceNode);
    -[AVAudioEngine connect:to:format:](self->_audioEngine, "connect:to:format:", self->_sourceNode, self->_mixerNode, self->_processingFormat);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioOutputRenderer delegate](self, "delegate"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "audioEngineOutputNodeAccessQueue"));

    if (v15)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003BB48;
      block[3] = &unk_1001ABD58;
      block[4] = self;
      dispatch_sync(v15, block);
    }
    else
    {
      audioEngine = self->_audioEngine;
      mixerNode = self->_mixerNode;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AVAudioEngine outputNode](audioEngine, "outputNode"));
      -[AVAudioEngine connect:to:format:](audioEngine, "connect:to:format:", mixerNode, v18, 0);

    }
    -[AVAudioEngine prepare](self->_audioEngine, "prepare");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AVAudioSourceNode AUAudioUnit](self->_sourceNode, "AUAudioUnit"));
    v20 = objc_msgSend(v19, "maximumFramesToRender");

    v21 = -[AVAudioFormat streamDescription](self->_processingFormat, "streamDescription");
    if (v20 <= 0x1000)
      v22 = 4096;
    else
      v22 = v20;
    v23 = *(_OWORD *)&v21->mSampleRate;
    v24 = *(_OWORD *)&v21->mBytesPerPacket;
    v26 = *(_QWORD *)&v21->mBitsPerChannel;
    v25[0] = v23;
    v25[1] = v24;
    -[VMAudioOutputRenderer _prepareAudioUnits:maxFramesPerRender:](self, "_prepareAudioUnits:maxFramesPerRender:", v25, v22);

  }
}

- (void)_prepareAudioUnits:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4
{
  uint64_t v4;
  __int128 v7;
  OpaqueAudioComponentInstance *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  VMProcessor *enhanceProcessor;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;
  id v16;
  _OWORD v17[2];
  uint64_t v18;

  v4 = *(_QWORD *)&a4;
  -[VMAudioOutputRenderer _tearDownTimeStretch](self, "_tearDownTimeStretch");
  v7 = *(_OWORD *)&a3->mBytesPerPacket;
  v17[0] = *(_OWORD *)&a3->mSampleRate;
  v17[1] = v7;
  v18 = *(_QWORD *)&a3->mBitsPerChannel;
  v16 = 0;
  v8 = -[VMAudioOutputRenderer _createTimeStretch:maxFramesPerRender:error:](self, "_createTimeStretch:maxFramesPerRender:error:", v17, v4, &v16);
  v9 = v16;
  self->_timeStretchAudiounit = v8;
  if (!v8)
  {
    v10 = OSLogForCategory(kVMLogCategoryService);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_10010AECC((uint64_t)v9, v11);

  }
  if (self->_timeStretchRate != 1.0)
    -[VMAudioOutputRenderer setRate:](self, "setRate:");
  enhanceProcessor = self->_enhanceProcessor;
  v13 = *(_OWORD *)&a3->mBytesPerPacket;
  v14[0] = *(_OWORD *)&a3->mSampleRate;
  v14[1] = v13;
  v15 = *(_QWORD *)&a3->mBitsPerChannel;
  -[VMProcessor prepareWithFormat:maxFramesPerRender:](enhanceProcessor, "prepareWithFormat:maxFramesPerRender:", v14, v4);

}

- (void)sendEmptyQueueSignal
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BD34;
  block[3] = &unk_1001ABD58;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)registerNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleAVAudioEngineConfigurationChangeNotification:", AVAudioEngineConfigurationChangeNotification, self->_audioEngine);

}

- (void)_handleAVAudioEngineConfigurationChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BE50;
  block[3] = &unk_1001ABD58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)startAndReturnError:(id *)a3
{
  double v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  if (self->_processingFormat)
  {
    -[VMAudioOutputRenderer _prepareRenderChainIfNeeded](self, "_prepareRenderChainIfNeeded");
    if (-[AVAudioEngine isRunning](self->_audioEngine, "isRunning"))
    {
LABEL_5:
      LOBYTE(v6) = 1;
      return v6;
    }
    -[VMAudioOutputRenderer currentSampleTime](self, "currentSampleTime");
    self->_playbackSampleIndexAtSeek = (unint64_t)v5;
    self->_playbackSampleIndexAtStart = (unint64_t)v5;
    -[VMAudioOutputRenderer _resetRenderTimes](self, "_resetRenderTimes");
    -[VMAudioOutputRenderer _resetTimeStretchAudioUnit](self, "_resetTimeStretchAudioUnit");
    v6 = -[AVAudioEngine startAndReturnError:](self->_audioEngine, "startAndReturnError:", a3);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
      objc_msgSend(v7, "IOBufferDuration");
      -[VMAudioOutputRenderer startPollingTimer:](self, "startPollingTimer:");

      goto LABEL_5;
    }
  }
  else
  {
    if (a3)
    {
      v10 = NSLocalizedDescriptionKey;
      v11 = CFSTR("VMAudioOutputRenderer - prepareToRender must be called before starting render");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", RCVoiceMemosErrorDomain, 1, v8));

    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_resetRenderTimes
{
  os_unfair_lock_s *p_renderLock;

  self->_hostTimeAtRenderStart = 0;
  self->_sampleTimeAtRenderStart = 0.0;
  self->_framesOfSilenceOffset = 0;
  *(_WORD *)&self->_shouldSignalQueueEmpty = 0;
  p_renderLock = &self->_renderLock;
  os_unfair_lock_lock(&self->_renderLock);
  self->_framesOfSilenceRendered = 0;
  self->_renderSampleTime = 0.0;
  self->_renderRateScalar = 0.0;
  self->_renderHostTime = 0;
  os_unfair_lock_unlock(p_renderLock);
}

- (void)_resetTimeStretchAudioUnit
{
  OpaqueAudioComponentInstance *timeStretchAudiounit;

  timeStretchAudiounit = self->_timeStretchAudiounit;
  if (timeStretchAudiounit)
    AudioUnitReset(timeStretchAudiounit, 0, 0);
}

- (void)startPollingTimer:(double)a3
{
  VMDispatchTimer *v4;
  VMDispatchTimer *inputPollingTimer;

  if (self->_inputPollingBlock)
  {
    v4 = -[VMDispatchTimer init:leeway:queue:block:]([VMDispatchTimer alloc], "init:leeway:queue:block:", self->_inputPollingQueue, self->_inputPollingBlock, a3, a3 * 0.5);
    inputPollingTimer = self->_inputPollingTimer;
    self->_inputPollingTimer = v4;

  }
}

- (void)stopPollingTimer
{
  VMDispatchTimer *inputPollingTimer;

  inputPollingTimer = self->_inputPollingTimer;
  self->_inputPollingTimer = 0;

}

- (unsigned)channelCount
{
  return -[AVAudioFormat channelCount](self->_processingFormat, "channelCount");
}

- (double)sampleRate
{
  double result;

  -[AVAudioFormat sampleRate](self->_processingFormat, "sampleRate");
  return result;
}

- (BOOL)isPlaying
{
  return -[AVAudioEngine isRunning](self->_audioEngine, "isRunning");
}

- (BOOL)isPrepared
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
  return v2 > 0;
}

- (double)currentSampleTime
{
  os_unfair_lock_s *p_renderLock;
  unint64_t renderHostTime;
  double renderRateScalar;
  double renderSampleTime;
  unint64_t framesOfSilenceOffset;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double result;

  p_renderLock = &self->_renderLock;
  os_unfair_lock_lock(&self->_renderLock);
  renderHostTime = self->_renderHostTime;
  renderSampleTime = self->_renderSampleTime;
  renderRateScalar = self->_renderRateScalar;
  framesOfSilenceOffset = self->_framesOfSilenceOffset;
  os_unfair_lock_unlock(p_renderLock);
  if (!renderHostTime || renderRateScalar == 0.0)
    return (double)self->_playbackSampleIndexAtSeek;
  v8 = mach_absolute_time();
  if (qword_1001ED860 != -1)
    dispatch_once(&qword_1001ED860, &stru_1001ABDC0);
  v9 = *(double *)&qword_1001ED858 * (double)(uint64_t)(v8 - renderHostTime);
  v10 = renderSampleTime
      - self->_sampleTimeAtRenderStart
      + (double)self->_playbackSampleIndexAtStart
      - (double)framesOfSilenceOffset;
  -[AVAudioFormat sampleRate](self->_processingFormat, "sampleRate");
  result = v10 + v9 * v11 / renderRateScalar;
  if (result <= (double)self->_playbackSampleIndexAtSeek)
    return (double)self->_playbackSampleIndexAtSeek;
  return result;
}

- (void)setSampleOffset:(double)a3
{
  self->_playbackSampleIndexAtSeek = (unint64_t)a3;
}

- (void)setShouldRenderSilenceOnEmptyQueue:(BOOL)a3
{
  self->_shouldRenderSilenceOnEmptyQueue = a3;
}

- (void)reset
{
  int v3;

  -[VMAudioOutputRenderer pause](self, "pause");
  v3 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
  sub_10002B3AC((uint64_t)&self->_ringBuffer, v3);
}

- (void)pause
{
  double v3;

  -[VMAudioOutputRenderer currentSampleTime](self, "currentSampleTime");
  self->_playbackSampleIndexAtSeek = (unint64_t)v3;
  -[AVAudioEngine pause](self->_audioEngine, "pause");
  -[VMAudioOutputRenderer stopPollingTimer](self, "stopPollingTimer");
  -[VMAudioOutputRenderer _resetRenderTimes](self, "_resetRenderTimes");
}

- (void)prepare
{
  void (**v2)(void);

  v2 = (void (**)(void))objc_retainBlock(self->_inputPollingBlock);
  if (v2)
    v2[2]();

}

- (id)_createPollingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003C384;
  v8[3] = &unk_1001ABD80;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = objc_retainBlock(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (id)_sourceNodeInputBlock
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003C4BC;
  v3[3] = &unk_1001ABDA0;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (void)setRate:(float)a3
{
  OpaqueAudioComponentInstance *timeStretchAudiounit;

  self->_timeStretchRate = a3;
  timeStretchAudiounit = self->_timeStretchAudiounit;
  if (timeStretchAudiounit)
    AudioUnitSetParameter(timeStretchAudiounit, 0, 0, 0, a3, 0);
}

- (float)rate
{
  float result;
  OpaqueAudioComponentInstance *timeStretchAudiounit;
  AudioUnitParameterValue outValue;

  result = self->_timeStretchRate;
  outValue = result;
  timeStretchAudiounit = self->_timeStretchAudiounit;
  if (timeStretchAudiounit)
  {
    AudioUnitGetParameter(timeStretchAudiounit, 0, 0, 0, &outValue);
    return outValue;
  }
  return result;
}

- (void)setEnhanceEnabled:(BOOL)a3
{
  -[VMProcessor setEnabled:](self->_enhanceProcessor, "setEnabled:", a3);
}

- (BOOL)enhanceEnabled
{
  return -[VMProcessor enabled](self->_enhanceProcessor, "enabled");
}

- (OpaqueAudioComponentInstance)_createTimeStretch:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4 error:(id *)a5
{
  signed int v8;
  _BOOL4 v9;
  OpaqueAudioComponentInstance *result;
  signed int v11;
  __int128 v12;
  signed int v13;
  __int128 v14;
  signed int v15;
  OSStatus v16;
  OSStatus v17;
  _OWORD v18[2];
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;
  _QWORD inData[2];
  AudioComponentInstance v23;

  inData[1] = self;
  v23 = 0;
  inData[0] = sub_10003C524;
  v8 = sub_1000756F4(0x61756663u, 0x6970746Fu, &v23);
  v9 = sub_1000755F4(v8, a5);
  result = v23;
  if (v9)
  {
    v11 = sub_100075AEC(v23, a4);
    if (!sub_1000755F4(v11, a5))
      goto LABEL_8;
    v12 = *(_OWORD *)&a3->mBytesPerPacket;
    v20[0] = *(_OWORD *)&a3->mSampleRate;
    v20[1] = v12;
    v21 = *(_QWORD *)&a3->mBitsPerChannel;
    v13 = sub_100075740(v23, v20, 1);
    if (!sub_1000755F4(v13, a5))
      goto LABEL_8;
    v14 = *(_OWORD *)&a3->mBytesPerPacket;
    v18[0] = *(_OWORD *)&a3->mSampleRate;
    v18[1] = v14;
    v19 = *(_QWORD *)&a3->mBitsPerChannel;
    v15 = sub_100075740(v23, v18, 0);
    if (sub_1000755F4(v15, a5)
      && (v16 = AudioUnitSetProperty(v23, 0x17u, 1u, 0, inData, 0x10u), sub_1000755F4(v16, a5))
      && (v17 = AudioUnitInitialize(v23), sub_1000755F4(v17, a5)))
    {
      return v23;
    }
    else
    {
LABEL_8:
      AudioComponentInstanceDispose(v23);
      return 0;
    }
  }
  return result;
}

- (VMAudioOutputRendererDelegate)delegate
{
  return (VMAudioOutputRendererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enhanceProcessor, 0);
  objc_storeStrong((id *)&self->_inputPollingTimer, 0);
  objc_storeStrong((id *)&self->_inputPollingQueue, 0);
  objc_storeStrong(&self->_inputPollingBlock, 0);
  objc_storeStrong((id *)&self->_processingFormat, 0);
  objc_storeStrong((id *)&self->_mixerNode, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 20) = 0;
  return self;
}

@end
