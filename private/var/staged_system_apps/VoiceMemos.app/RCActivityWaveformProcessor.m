@implementation RCActivityWaveformProcessor

- (RCActivityWaveformProcessor)init
{
  RCActivityWaveformProcessor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCActivityWaveformProcessor;
  result = -[RCActivityWaveformProcessor init](&v3, "init");
  if (result)
    result->_readerLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[RCActivityWaveformProcessor _tearDown](self, "_tearDown");
  v3.receiver = self;
  v3.super_class = (Class)RCActivityWaveformProcessor;
  -[RCActivityWaveformProcessor dealloc](&v3, "dealloc");
}

- (double)recordingStartTime
{
  double result;

  if (!self->_isPrepared)
    return 0.0;
  -[RCActivityWaveformProcessor referenceMediaTime](self, "referenceMediaTime");
  return result;
}

- (double)availableRangeStart
{
  if (self->_isPrepared)
    return self->_referenceMediaTime
         + (double)(uint64_t)-[RCActivityWaveformProcessor _bufferRange](self, "_bufferRange") / self->_sampleRate;
  else
    return 0.0;
}

- (double)availableRangeEnd
{
  id v3;
  uint64_t v4;

  if (!self->_isPrepared)
    return 0.0;
  v3 = -[RCActivityWaveformProcessor _bufferRange](self, "_bufferRange");
  return self->_referenceMediaTime + (double)((uint64_t)v3 + v4) / self->_sampleRate;
}

- (void)prepareToProcessWithFormat:(id)a3 audioTime:(id)a4 punchInTime:(double)a5
{
  id v8;
  id v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double sampleRate;
  float v15;
  double v16;
  RCAmplitudeAnalyzer *v17;
  RCAmplitudeAnalyzer *mainQueueAmplitudeAnalyzer;
  RCAmplitudeAnalyzer *v19;
  RCAmplitudeAnalyzer *audioQueueAmplitudeAnalyzer;
  void *v21;

  v8 = a3;
  v9 = a4;
  if (self->_isPrepared)
    -[RCActivityWaveformProcessor _tearDown](self, "_tearDown");
  objc_msgSend(v8, "sampleRate");
  self->_sampleRate = v10;
  self->_punchInTime = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v11, "activityWaveformTimeWindowDuration");
  v13 = v12;

  sampleRate = self->_sampleRate;
  +[AVAudioTime secondsForHostTime:](AVAudioTime, "secondsForHostTime:", objc_msgSend(v9, "hostTime"));
  v15 = v13 + 0.2 + 0.5;
  self->_referenceMediaTime = v16;
  self->_emptyFramesToLeaveInInputBuffer = (self->_sampleRate * 0.5);
  sub_10002AC20((uint64_t)&self->_ringBuffer, (int)(sampleRate * v15), 1, 0);
  v17 = objc_alloc_init(RCAmplitudeAnalyzer);
  mainQueueAmplitudeAnalyzer = self->_mainQueueAmplitudeAnalyzer;
  self->_mainQueueAmplitudeAnalyzer = v17;

  v19 = objc_alloc_init(RCAmplitudeAnalyzer);
  audioQueueAmplitudeAnalyzer = self->_audioQueueAmplitudeAnalyzer;
  self->_audioQueueAmplitudeAnalyzer = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v21, "activityWaveformRunningAverageDuration");

  operator new();
}

- (void)_tearDown
{
  void **rollingSumBuffer;
  void *v4;

  sub_10002ADDC((uint64_t)&self->_ringBuffer);
  rollingSumBuffer = (void **)self->_rollingSumBuffer;
  if (rollingSumBuffer)
  {
    v4 = *rollingSumBuffer;
    if (*rollingSumBuffer)
    {
      rollingSumBuffer[1] = v4;
      operator delete(v4);
    }
    operator delete();
  }
  self->_isPrepared = 0;
}

- (void)processAudioBuffer:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  const void **v11;
  id v12;
  id v13;
  int mCapacity;
  unsigned int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  float v20;
  _QWORD block[5];
  float v22;

  v5 = a3;
  if (!self->_isPrepared)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/VoiceMemos/Application/Helpers/RCActivityWaveformProcessor.mm"));
    v7 = (void *)v6;
    v8 = CFSTR("<Unknown File>");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 121, CFSTR("You must call prepareToProcessWithFormat:audioTime:punchInTime: prior to processing."), 0, 0, 0, 0, 0);

  }
  v11 = (const void **)objc_msgSend(v5, "floatChannelData");
  v12 = objc_msgSend(v5, "frameLength");
  v13 = v12;
  if ((_DWORD)v12)
  {
    mCapacity = self->_ringBuffer.mCapacity;
    v15 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
    if (mCapacity - v15 < v12)
      -[RCActivityWaveformProcessor consumeRingBufferIfNecessary](self, "consumeRingBufferIfNecessary");
    v16 = self->_ringBuffer.mCapacity;
    v17 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
    if (v16 - v17 >= v13)
    {
      memcpy(*(void **)self->_ringBuffer.mWritePointers, *v11, 4 * v13);
      sub_10002B058((uint64_t)&self->_ringBuffer, (int)v13);
      -[RCAmplitudeAnalyzer calculateAmplitude:sampleCount:channelCount:](self->_audioQueueAmplitudeAnalyzer, "calculateAmplitude:sampleCount:channelCount:", v11, v13, 1);
    }
    else
    {
      v18 = OSLogForCategory(kVMLogCategoryDefault);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10010AC1C(v19);

      v20 = -1.0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002B0DC;
    block[3] = &unk_1001AB950;
    v22 = v20;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (BOOL)getAmplitudes:(float *)a3 count:(int)a4 startTime:(double)a5 endTime:(double)a6
{
  os_unfair_lock_s *p_readerLock;
  double referenceMediaTime;
  double sampleRate;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  char *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  BOOL v29;
  char *v30;
  float v31;
  float *v33;

  if (!self->_isPrepared)
    return 0;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  referenceMediaTime = self->_referenceMediaTime;
  sampleRate = self->_sampleRate;
  v14 = (char *)-[RCActivityWaveformProcessor _bufferRange](self, "_bufferRange");
  if (a4 < 1)
  {
    v22 = 1;
  }
  else
  {
    v16 = v14;
    v17 = 0;
    v18 = (uint64_t)((a5 - referenceMediaTime) * sampleRate);
    v19 = (a6 - a5) / (double)a4;
    v20 = &v14[v15];
    v21 = a4;
    v22 = 1;
    do
    {
      v23 = (v19 * self->_sampleRate);
      v24 = (v17 * v23);
      v25 = v24 + v18;
      if ((uint64_t)v16 <= v24 + v18)
        v26 = (char *)(v24 + v18);
      else
        v26 = v16;
      v27 = (char *)(v25 + v23);
      if ((uint64_t)v20 < (uint64_t)v27)
        v27 = v20;
      v28 = v27 - v26;
      v29 = (v28 & ~(v28 >> 63)) == v23;
      if (v28 < 1)
      {
        v31 = 0.0;
      }
      else
      {
        v30 = &v26[-self->_inputBufferReadPosition];
        v33 = 0;
        v33 = &(*self->_ringBuffer.mReadPointers)[(_QWORD)v30];
        -[RCAmplitudeAnalyzer calculateAmplitude:sampleCount:channelCount:](self->_mainQueueAmplitudeAnalyzer, "calculateAmplitude:sampleCount:channelCount:", &v33);
      }
      v22 &= v29;
      a3[v17++] = v31;
    }
    while (v21 != v17);
  }
  os_unfair_lock_unlock(p_readerLock);
  -[RCActivityWaveformProcessor consumeRingBufferIfNecessary](self, "consumeRingBufferIfNecessary");
  return v22;
}

- (int)_excessFrames
{
  int mCapacity;
  unsigned int v3;
  unsigned int v4;
  unsigned int emptyFramesToLeaveInInputBuffer;
  BOOL v6;
  int v7;

  mCapacity = self->_ringBuffer.mCapacity;
  v3 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
  v4 = mCapacity - v3;
  emptyFramesToLeaveInInputBuffer = self->_emptyFramesToLeaveInInputBuffer;
  v6 = emptyFramesToLeaveInInputBuffer >= v4;
  v7 = emptyFramesToLeaveInInputBuffer - v4;
  if (v6)
    return v7;
  else
    return 0;
}

- (void)consumeRingBufferIfNecessary
{
  int v3;
  unsigned int v4;

  if (-[RCActivityWaveformProcessor _excessFrames](self, "_excessFrames") >= 1)
  {
    os_unfair_lock_lock(&self->_readerLock);
    v3 = -[RCActivityWaveformProcessor _excessFrames](self, "_excessFrames");
    if (v3 >= 1)
    {
      v4 = v3;
      sub_10002B3AC((uint64_t)&self->_ringBuffer, v3);
      self->_inputBufferReadPosition += v4;
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
}

- (float)runningAverage
{
  double *rollingSumBuffer;
  float v3;

  if (!self->_isPrepared)
    return 0.0;
  rollingSumBuffer = (double *)self->_rollingSumBuffer;
  v3 = rollingSumBuffer[5];
  return v3 / (float)*((int *)rollingSumBuffer + 6);
}

- (VMFrameRange)_bufferRange
{
  int64_t inputBufferReadPosition;
  signed int v3;
  int64_t v4;
  int64_t v5;
  VMFrameRange result;

  inputBufferReadPosition = self->_inputBufferReadPosition;
  v3 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
  v4 = v3;
  v5 = inputBufferReadPosition;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (double)punchInTime
{
  return self->_punchInTime;
}

- (RCActivityWaveformProcessorDelegate)delegate
{
  return (RCActivityWaveformProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)emptyFramesToLeaveInInputBuffer
{
  return self->_emptyFramesToLeaveInInputBuffer;
}

- (void)setEmptyFramesToLeaveInInputBuffer:(unsigned int)a3
{
  self->_emptyFramesToLeaveInInputBuffer = a3;
}

- (double)referenceMediaTime
{
  return self->_referenceMediaTime;
}

- (void)setReferenceMediaTime:(double)a3
{
  self->_referenceMediaTime = a3;
}

- (int64_t)inputBufferReadPosition
{
  return self->_inputBufferReadPosition;
}

- (void)setInputBufferReadPosition:(int64_t)a3
{
  self->_inputBufferReadPosition = a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioQueueAmplitudeAnalyzer, 0);
  objc_storeStrong((id *)&self->_mainQueueAmplitudeAnalyzer, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  return self;
}

@end
