@implementation VSAudioPlaybackServiceAT

- (VSAudioPlaybackServiceAT)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4
{
  char *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  VSAudioPlaybackServiceAT *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const __CFAllocator *v25;
  OpaqueCMClock *HostTimeClock;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  char *v35;
  char *v36;
  char *v37;
  objc_super v38;
  uint8_t buf[4];
  char *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  mach_absolute_time();
  v38.receiver = self;
  v38.super_class = (Class)VSAudioPlaybackServiceAT;
  v7 = -[VSAudioPlaybackServiceAT init](&v38, sel_init);
  v8 = v7;
  if (v7)
  {
    *((_QWORD *)v7 + 5) = 1;
    v9 = *(_OWORD *)&a4->mSampleRate;
    v10 = *(_OWORD *)&a4->mBytesPerPacket;
    *((_QWORD *)v7 + 17) = *(_QWORD *)&a4->mBitsPerChannel;
    *(_OWORD *)(v7 + 120) = v10;
    *(_OWORD *)(v7 + 104) = v9;
    if (a3)
    {
      *((_DWORD *)v7 + 3) = a3;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v8 + 3) = objc_msgSend(v11, "opaqueSessionID");

    }
    *((_QWORD *)v8 + 18) = 1018212795;
    *(_OWORD *)(v8 + 200) = 0u;
    *(_OWORD *)(v8 + 216) = 0u;
    *(_OWORD *)(v8 + 232) = 0u;
    *(_OWORD *)(v8 + 152) = 0u;
    *(_OWORD *)(v8 + 168) = 0u;
    *((_QWORD *)v8 + 23) = 0;
    *((_QWORD *)v8 + 24) = 850045863;
    *((_QWORD *)v8 + 31) = 0;
    *((_QWORD *)v8 + 32) = 0x47EFFFFFE0000000;
    v12 = objc_alloc_init(MEMORY[0x24BEC0D98]);
    v13 = (void *)*((_QWORD *)v8 + 9);
    *((_QWORD *)v8 + 9) = v12;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v8 + 10);
    *((_QWORD *)v8 + 10) = v14;

    v16 = objc_alloc_init(MEMORY[0x24BDD14C8]);
    v17 = (void *)*((_QWORD *)v8 + 12);
    *((_QWORD *)v8 + 12) = v16;

    v18 = AudioQueueNewOutputWithAudioSession();
    if ((_DWORD)v18)
    {
      v19 = v18;
      VSGetLogDefault();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v19);
        v35 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v35;
        _os_log_error_impl(&dword_21AA84000, v20, OS_LOG_TYPE_ERROR, "Error AudioQueueNewOutputWithAudioSession %@", buf, 0xCu);

      }
      v21 = 0;
      goto LABEL_23;
    }
    v22 = AudioQueueSetProperty(*((AudioQueueRef *)v8 + 2), 0x63756964u, &VSAudioPlaybackAudioQueueUID, 8u);
    if ((_DWORD)v22)
    {
      v23 = v22;
      VSGetLogDefault();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v23);
        v36 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v36;
        _os_log_error_impl(&dword_21AA84000, v24, OS_LOG_TYPE_ERROR, "Unable to set kAudioQueueProperty_ClientUID, errno: %@", buf, 0xCu);

      }
    }
    v25 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    HostTimeClock = CMClockGetHostTimeClock();
    v27 = CMTimebaseCreateWithSourceClock(v25, HostTimeClock, (CMTimebaseRef *)v8 + 4);
    if ((_DWORD)v27)
    {
      v28 = v27;
      VSGetLogDefault();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v28);
        v37 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v37;
        _os_log_error_impl(&dword_21AA84000, v29, OS_LOG_TYPE_ERROR, "Error CMTimebaseCreateWithSourceClock: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v8, sel_handleMediaServerReset, *MEMORY[0x24BDB1610], 0);

    VSGetLogDefault();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = a3;
      _os_log_impl(&dword_21AA84000, v31, OS_LOG_TYPE_DEFAULT, "AudioQueue initialized with session ID: %d", buf, 8u);
    }

  }
  mach_absolute_time();
  VSGetLogDefault();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    VSAbsoluteTimeToSecond();
    *(_DWORD *)buf = 134218240;
    v40 = v8;
    v41 = 2048;
    v42 = v33;
    _os_log_impl(&dword_21AA84000, v32, OS_LOG_TYPE_INFO, "VSAudioPlaybackService %p init latency: %.3f", buf, 0x16u);
  }

  v21 = v8;
LABEL_23:

  return v21;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  OpaqueCMTimebase *timebase;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4 = AudioQueueDispose(self->_audioQueue, 1u);
  if ((_DWORD)v4)
  {
    v5 = v4;
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_21AA84000, v6, OS_LOG_TYPE_ERROR, "Error AudioQueueDispose %@", buf, 0xCu);

    }
  }
  timebase = self->_timebase;
  if (timebase)
    CFRelease(timebase);
  v9.receiver = self;
  v9.super_class = (Class)VSAudioPlaybackServiceAT;
  -[VSAudioPlaybackServiceAT dealloc](&v9, sel_dealloc);
}

- (void)handleMediaServerReset
{
  NSObject *v3;
  uint8_t v4[16];

  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEFAULT, "mediaserverd reset", v4, 2u);
  }

  -[VSAudioPlaybackServiceAT stop](self, "stop");
}

- (void)signalQueueRunningStateChange
{
  _opaque_pthread_mutex_t *p_waitForStateChangeMutex;
  NSObject *v4;
  uint8_t v5[16];

  p_waitForStateChangeMutex = &self->_waitForStateChangeMutex;
  pthread_mutex_lock(&self->_waitForStateChangeMutex);
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21AA84000, v4, OS_LOG_TYPE_INFO, "Signal AudioQueue running state change", v5, 2u);
  }

  pthread_cond_broadcast(&self->_stateChangeCondition);
  pthread_mutex_unlock(p_waitForStateChangeMutex);
}

- (id)start
{
  NSError *error;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSDate *v11;
  NSDate *audioQueueStartDate;
  NSDate *v13;
  NSDate *audioQueueFutureEndDate;
  NSObject *v15;
  OpaqueCMTimebase *timebase;
  OpaqueCMTimebase *v17;
  void *v19;
  CMTime v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  error = self->_error;
  self->_error = 0;

  v4 = AudioQueueStart(self->_audioQueue, 0);
  if ((_DWORD)v4)
  {
    v5 = v4;
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20.value) = 138412290;
      *(CMTimeValue *)((char *)&v20.value + 4) = (CMTimeValue)v19;
      _os_log_error_impl(&dword_21AA84000, v6, OS_LOG_TYPE_ERROR, "Error AudioQueueStart %@", (uint8_t *)&v20, 0xCu);

    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD1100];
    v21 = *MEMORY[0x24BDD0FC8];
    v22[0] = CFSTR("Error AudioQueueStart");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, (int)v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    self->_state = 2;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    audioQueueStartDate = self->_audioQueueStartDate;
    self->_audioQueueStartDate = v11;

    -[NSDate dateByAddingTimeInterval:](self->_audioQueueStartDate, "dateByAddingTimeInterval:", self->_enqueuedSampleCount / self->_asbd.mSampleRate);
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    audioQueueFutureEndDate = self->_audioQueueFutureEndDate;
    self->_audioQueueFutureEndDate = v13;

    VSGetLogDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v20.value) = 134217984;
      *(CMTimeValue *)((char *)&v20.value + 4) = (CMTimeValue)self;
      _os_log_impl(&dword_21AA84000, v15, OS_LOG_TYPE_DEFAULT, "VSAudioPlaybackService %p success AudioQueueStart", (uint8_t *)&v20, 0xCu);
    }

    timebase = self->_timebase;
    if (timebase)
    {
      CMTimebaseSetRate(timebase, 1.0);
      v17 = self->_timebase;
      v20 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
      CMTimebaseSetTime(v17, &v20);
    }
    v10 = 0;
  }
  return v10;
}

- (void)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VSAudioMappedInfoAT *v16;

  v8 = a5;
  v9 = a3;
  pthread_mutex_lock(&__VSAudioQueueBufferLock);
  v16 = objc_alloc_init(VSAudioMappedInfoAT);
  v10 = -[VSMappedData appendData:](self->_mappedData, "appendData:", v9);
  v12 = v11;

  -[VSAudioMappedInfoAT setAudioBytesRange:](v16, "setAudioBytesRange:", v10, v12);
  -[VSAudioMappedInfoAT setPacketCount:](v16, "setPacketCount:", a4);
  v13 = -[VSMappedData appendData:](self->_mappedData, "appendData:", v8);
  v15 = v14;

  -[VSAudioMappedInfoAT setPacketDescriptionsRange:](v16, "setPacketDescriptionsRange:", v13, v15);
  -[NSMutableArray addObject:](self->_enqueuedMappedAudioInfo, "addObject:", v16);
  -[VSAudioPlaybackServiceAT dequeueAvailableMappedAudio](self, "dequeueAvailableMappedAudio");
  pthread_mutex_unlock(&__VSAudioQueueBufferLock);

}

- (void)dequeueAvailableMappedAudio
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (self->_playingBufferCount <= 2)
  {
    do
    {
      if (!-[NSMutableArray count](self->_enqueuedMappedAudioInfo, "count") || self->_state == 4)
        break;
      -[NSMutableArray firstObject](self->_enqueuedMappedAudioInfo, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_enqueuedMappedAudioInfo, "removeObjectAtIndex:", 0);
      objc_msgSend(v3, "audioBytesRange");
      -[VSAudioPlaybackServiceAT _enqueueAudioBytesLength:audioBytes:packetCount:packetDescriptions:](self, "_enqueueAudioBytesLength:audioBytes:packetCount:packetDescriptions:", v4, -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v3, "audioBytesRange")), objc_msgSend(v3, "packetCount"), -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v3, "packetDescriptionsRange")));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        ++self->_playingBufferCount;
      -[NSCondition lock](self->_dequeueCondition, "lock");
      -[NSCondition broadcast](self->_dequeueCondition, "broadcast");
      -[NSCondition unlock](self->_dequeueCondition, "unlock");

    }
    while (self->_playingBufferCount < 3);
  }
}

- (id)_enqueueAudioBytesLength:(unsigned int)a3 audioBytes:(const void *)a4 packetCount:(int64_t)a5 packetDescriptions:(const void *)a6
{
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  OSStatus CurrentTime;
  NSDate *v18;
  NSDate *audioQueueStartDate;
  double mSampleTime;
  AudioTimeStamp *p_audioStartTimeStamp;
  __int128 v22;
  __int128 v23;
  NSObject *v24;
  double v25;
  double v26;
  double enqueuedSampleCount;
  BOOL discontinuedDuringPlayback;
  double v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  double v35;
  double v36;
  NSDate *v37;
  NSDate *audioQueueFutureEndDate;
  NSObject *v39;
  double v40;
  _BOOL4 v41;
  void *v43;
  VSAudioPlaybackServiceAT *v44;
  AudioQueueBufferRef outBuffer;
  uint8_t buf[4];
  VSAudioPlaybackServiceAT *v47;
  __int16 v48;
  Float64 v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  double v53;
  __int16 v54;
  _BOOL4 v55;
  AudioTimeStamp outTimeStamp;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    goto LABEL_31;
  outBuffer = 0;
  v11 = AudioQueueAllocateBuffer(self->_audioQueue, a3, &outBuffer);
  if (!(_DWORD)v11)
  {
    memcpy(outBuffer->mAudioData, a4, a3);
    outBuffer->mAudioDataByteSize = a3;
    memset(&outTimeStamp, 0, sizeof(outTimeStamp));
    CurrentTime = AudioQueueGetCurrentTime(self->_audioQueue, 0, &outTimeStamp, 0);
    if (self->_enqueuedSampleCount == 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
      audioQueueStartDate = self->_audioQueueStartDate;
      self->_audioQueueStartDate = v18;

    }
    if (!CurrentTime)
    {
      mSampleTime = self->_audioStartTimeStamp.mSampleTime;
      if (mSampleTime == 3.40282347e38)
      {
        p_audioStartTimeStamp = &self->_audioStartTimeStamp;
        v22 = *(_OWORD *)&outTimeStamp.mRateScalar;
        *(_OWORD *)&self->_audioStartTimeStamp.mSampleTime = *(_OWORD *)&outTimeStamp.mSampleTime;
        *(_OWORD *)&self->_audioStartTimeStamp.mRateScalar = v22;
        v23 = *(_OWORD *)&outTimeStamp.mSMPTETime.mHours;
        *(_OWORD *)&self->_audioStartTimeStamp.mSMPTETime.mSubframes = *(_OWORD *)&outTimeStamp.mSMPTETime.mSubframes;
        *(_OWORD *)&self->_audioStartTimeStamp.mSMPTETime.mHours = v23;
        VSGetLogDefault();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = p_audioStartTimeStamp->mSampleTime;
          *(_DWORD *)buf = 134217984;
          v47 = *(VSAudioPlaybackServiceAT **)&v25;
          _os_log_impl(&dword_21AA84000, v24, OS_LOG_TYPE_INFO, "Audio queue start sample time: %.0f", buf, 0xCu);
        }

        mSampleTime = p_audioStartTimeStamp->mSampleTime;
      }
      v26 = outTimeStamp.mSampleTime;
      enqueuedSampleCount = self->_enqueuedSampleCount;
      discontinuedDuringPlayback = self->_discontinuedDuringPlayback;
      if (outTimeStamp.mSampleTime > enqueuedSampleCount + mSampleTime)
        discontinuedDuringPlayback = 1;
      self->_discontinuedDuringPlayback = discontinuedDuringPlayback;
      if (v26 > enqueuedSampleCount + mSampleTime)
      {
        v29 = v26 - enqueuedSampleCount - mSampleTime;
        VSGetLogDefault();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v47) = (int)v29;
          _os_log_error_impl(&dword_21AA84000, v30, OS_LOG_TYPE_ERROR, "Detected stalled audio generation, will enqueue %d silence frame to compensate.", buf, 8u);
        }

        AudioQueueEnqueueSilence();
        self->_enqueuedSampleCount = v29 + self->_enqueuedSampleCount;
      }
    }
    v31 = AudioQueueEnqueueBuffer(self->_audioQueue, outBuffer, a5, (const AudioStreamPacketDescription *)a6);
    if ((_DWORD)v31)
    {
      v32 = v31;
      VSGetLogDefault();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v32);
        v44 = (VSAudioPlaybackServiceAT *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v44;
        _os_log_error_impl(&dword_21AA84000, v33, OS_LOG_TYPE_ERROR, "Error AudioQueueEnqueueBuffer %@", buf, 0xCu);

      }
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDD1100];
      v16 = (int)v32;
      goto LABEL_23;
    }
    kdebug_trace();
    if (a5 && a6)
      v35 = (double)(self->_asbd.mFramesPerPacket * a5);
    else
      v35 = (double)(a3 / self->_asbd.mBytesPerFrame);
    v36 = v35 + self->_enqueuedSampleCount;
    self->_enqueuedSampleCount = v36;
    -[NSDate dateByAddingTimeInterval:](self->_audioQueueStartDate, "dateByAddingTimeInterval:", v36 / self->_asbd.mSampleRate);
    v37 = (NSDate *)objc_claimAutoreleasedReturnValue();
    audioQueueFutureEndDate = self->_audioQueueFutureEndDate;
    self->_audioQueueFutureEndDate = v37;

    VSGetLogDefault();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = self->_enqueuedSampleCount;
      v41 = self->_discontinuedDuringPlayback;
      *(_DWORD *)buf = 134219008;
      v47 = self;
      v48 = 2048;
      v49 = outTimeStamp.mSampleTime;
      v50 = 2048;
      v51 = a3;
      v52 = 2048;
      v53 = v40;
      v54 = 1024;
      v55 = v41;
      _os_log_impl(&dword_21AA84000, v39, OS_LOG_TYPE_INFO, "VSAudioPlaybackService %p enqueued audio buffer at sample time: %.2f, size: %ld, total enqueued samples: %.0f, discontinuity: %{BOOL}d", buf, 0x30u);
    }

LABEL_31:
    v34 = 0;
    return v34;
  }
  v12 = v11;
  VSGetLogDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v12);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(outTimeStamp.mSampleTime) = 138412290;
    *(_QWORD *)((char *)&outTimeStamp.mSampleTime + 4) = v43;
    _os_log_error_impl(&dword_21AA84000, v13, OS_LOG_TYPE_ERROR, "Error AudioQueueAllocateBuffer %@", (uint8_t *)&outTimeStamp, 0xCu);

  }
  v14 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BDD1100];
  v16 = (int)v12;
LABEL_23:
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  return v34;
}

- (void)flushAndStop
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString **v11;
  uint64_t *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSError *v16;
  NSError *error;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSError *v24;
  NSError *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_INFO, "AudioQueue will flushAndStop", buf, 2u);
  }

  self->_state = 3;
  -[NSCondition lock](self->_dequeueCondition, "lock");
  while (-[NSMutableArray count](self->_enqueuedMappedAudioInfo, "count"))
  {
    if (!-[NSCondition waitUntilDate:](self->_dequeueCondition, "waitUntilDate:", self->_audioQueueFutureEndDate))
    {
      VSGetLogDefault();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v4, OS_LOG_TYPE_ERROR, "Timeout in AudioQueue dequeue condition.", buf, 2u);
      }

      break;
    }
  }
  -[NSCondition unlock](self->_dequeueCondition, "unlock");
  v5 = AudioQueueFlush(self->_audioQueue);
  if ((_DWORD)v5)
  {
    v6 = v5;
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v26;
      _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "Error AudioQueueFlush %@", buf, 0xCu);

    }
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD1100];
    v6 = (int)v6;
    v33 = *MEMORY[0x24BDD0FC8];
    v34 = CFSTR("Error AudioQueueFlush");
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = &v34;
    v12 = &v33;
LABEL_17:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v6, v15);
    v16 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v16;

    return;
  }
  v13 = AudioQueueStop(self->_audioQueue, 0);
  if ((_DWORD)v13)
  {
    v6 = v13;
    VSGetLogDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v27;
      _os_log_error_impl(&dword_21AA84000, v14, OS_LOG_TYPE_ERROR, "Error AudioQueueStop %@", buf, 0xCu);

    }
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD1100];
    v6 = (int)v6;
    v31 = *MEMORY[0x24BDD0FC8];
    v32 = CFSTR("Error AudioQueueStop");
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = &v32;
    v12 = &v31;
    goto LABEL_17;
  }
  -[VSAudioPlaybackServiceAT waitForAudioQueueStop](self, "waitForAudioQueueStop");
  v18 = AudioQueueStop(self->_audioQueue, 1u);
  if ((_DWORD)v18)
  {
    v19 = v18;
    VSGetLogDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v19);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_error_impl(&dword_21AA84000, v20, OS_LOG_TYPE_ERROR, "Error AudioQueueStop %@", buf, 0xCu);

    }
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD1100];
    v29 = *MEMORY[0x24BDD0FC8];
    v30 = CFSTR("Error AudioQueueStop");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, (int)v19, v23);
    v24 = (NSError *)objc_claimAutoreleasedReturnValue();
    v25 = self->_error;
    self->_error = v24;

  }
  -[VSAudioPlaybackServiceAT didEndAccessPower](self, "didEndAccessPower");
  self->_state = 4;
  self->_enqueuedSampleCount = 0.0;
}

- (void)stop
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSError *v10;
  NSError *error;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_INFO, "AudioQueue will stop", buf, 2u);
  }

  self->_state = 4;
  pthread_mutex_lock(&__VSAudioQueueBufferLock);
  -[NSMutableArray removeAllObjects](self->_enqueuedMappedAudioInfo, "removeAllObjects");
  -[NSCondition lock](self->_dequeueCondition, "lock");
  -[NSCondition signal](self->_dequeueCondition, "signal");
  -[NSCondition unlock](self->_dequeueCondition, "unlock");
  pthread_mutex_unlock(&__VSAudioQueueBufferLock);
  v4 = AudioQueueStop(self->_audioQueue, 1u);
  if ((_DWORD)v4)
  {
    v5 = v4;
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_error_impl(&dword_21AA84000, v6, OS_LOG_TYPE_ERROR, "Error AudioQueueStop %@", buf, 0xCu);

    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD1100];
    v13 = *MEMORY[0x24BDD0FC8];
    v14 = CFSTR("Error AudioQueueStop");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, (int)v5, v9);
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v10;

  }
  -[VSAudioPlaybackServiceAT signalQueueRunningStateChange](self, "signalQueueRunningStateChange");
  -[VSAudioPlaybackServiceAT didEndAccessPower](self, "didEndAccessPower");
  self->_enqueuedSampleCount = 0.0;
}

- (void)pause
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSError *v8;
  NSError *error;
  OpaqueCMTimebase *timebase;
  VSAudioPlaybackServiceAT *v11;
  uint64_t v12;
  const __CFString *v13;
  uint8_t buf[4];
  VSAudioPlaybackServiceAT *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = AudioQueuePause(self->_audioQueue);
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v3);
      v11 = (VSAudioPlaybackServiceAT *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_error_impl(&dword_21AA84000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueuePause %@", buf, 0xCu);

    }
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD1100];
    v12 = *MEMORY[0x24BDD0FC8];
    v13 = CFSTR("Error AudioQueuePause");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, (int)v3, v5);
    v8 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v8;

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_21AA84000, v5, OS_LOG_TYPE_INFO, "VSAudioPlaybackService %p success AudioQueuePause", buf, 0xCu);
  }

  timebase = self->_timebase;
  if (timebase)
    CMTimebaseSetRate(timebase, 0.0);
}

- (void)waitForAudioQueueStop
{
  int64_t state;
  _opaque_pthread_mutex_t *p_waitForStateChangeMutex;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString **v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSError *v20;
  NSError *error;
  void *v22;
  void *v23;
  timespec v24;
  uint64_t v25;
  const __CFString *v26;
  timeval v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  state = self->_state;
  if (state != 1 && state != 4)
  {
    p_waitForStateChangeMutex = &self->_waitForStateChangeMutex;
    pthread_mutex_lock(&self->_waitForStateChangeMutex);
    v6 = AudioQueueAddPropertyListener(self->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)_VSAudioPlaybackServiceRunningStateChanged, self);
    if ((_DWORD)v6)
    {
      v7 = v6;
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27.tv_sec) = 138412290;
        *(__darwin_time_t *)((char *)&v27.tv_sec + 4) = (__darwin_time_t)v22;
        _os_log_error_impl(&dword_21AA84000, v8, OS_LOG_TYPE_ERROR, "Error AudioQueueAddPropertyListener %@", (uint8_t *)&v27, 0xCu);

      }
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BDD1100];
      v11 = (int)v7;
      v28 = *MEMORY[0x24BDD0FC8];
      v29[0] = CFSTR("Error AudioQueueAddPropertyListener");
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = (const __CFString **)v29;
      v14 = &v28;
    }
    else
    {
      do
      {
        v27.tv_sec = 0;
        *(_QWORD *)&v27.tv_usec = 0;
        v24.tv_sec = 0;
        v24.tv_nsec = 0;
        gettimeofday(&v27, 0);
        v24.tv_sec = v27.tv_sec + 1;
        v24.tv_nsec = 1000 * v27.tv_usec;
        v15 = pthread_cond_timedwait(&self->_stateChangeCondition, p_waitForStateChangeMutex, &v24);
      }
      while (-[VSAudioPlaybackServiceAT isAudioQueueRunning](self, "isAudioQueueRunning")
           && (v15 != 60 || !-[VSAudioPlaybackServiceAT isAudioQueueStalled](self, "isAudioQueueStalled")));
      v16 = AudioQueueRemovePropertyListener(self->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)_VSAudioPlaybackServiceRunningStateChanged, self);
      if (!(_DWORD)v16)
        goto LABEL_17;
      v17 = v16;
      VSGetLogDefault();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27.tv_sec) = 138412290;
        *(__darwin_time_t *)((char *)&v27.tv_sec + 4) = (__darwin_time_t)v23;
        _os_log_error_impl(&dword_21AA84000, v18, OS_LOG_TYPE_ERROR, "Error AudioQueueRemovePropertyListener %@", (uint8_t *)&v27, 0xCu);

      }
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BDD1100];
      v11 = (int)v17;
      v25 = *MEMORY[0x24BDD0FC8];
      v26 = CFSTR("Error AudioQueueRemovePropertyListener");
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = &v26;
      v14 = &v25;
    }
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v19);
    v20 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v20;

LABEL_17:
    pthread_mutex_unlock(p_waitForStateChangeMutex);
  }
}

- (BOOL)isAudioQueueStalled
{
  void *v3;
  double v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_state != 3)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_audioQueueFutureEndDate);
  v5 = v4 > 5.0;
  if (v4 > 5.0)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v6, "setDateFormat:", CFSTR("YYYY-MM-dd hh:mm:ss:SSS"));
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "stringFromDate:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringFromDate:", self->_audioQueueFutureEndDate);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2048;
      v16 = 0x4014000000000000;
      _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "Detected stall of audio queue, based on NSDate. Now: %@, supposed end time: %@, Tolerance: %.2f", (uint8_t *)&v11, 0x20u);

    }
  }

  return v5;
}

- (BOOL)isAudioQueueRunning
{
  uint64_t Property;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSError *v9;
  NSError *error;
  void *v12;
  UInt32 ioDataSize;
  int outData;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  ioDataSize = 4;
  outData = 0;
  Property = AudioQueueGetProperty(self->_audioQueue, 0x6171726Eu, &outData, &ioDataSize);
  if ((_DWORD)Property)
  {
    v4 = Property;
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_error_impl(&dword_21AA84000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueGetProperty isRunning %@", buf, 0xCu);

    }
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD1100];
    v15 = *MEMORY[0x24BDD0FC8];
    v16 = CFSTR("Error AudioQueueGetProperty isRunning");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, (int)v4, v8);
    v9 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v9;

  }
  return outData != 0;
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  VSOccasionalTimesObserver *v8;

  if (self->_timebase)
  {
    v6 = a4;
    v7 = a3;
    v8 = -[VSOccasionalTimesObserver initWithTimebase:times:queue:block:]([VSOccasionalTimesObserver alloc], "initWithTimebase:times:queue:block:", self->_timebase, v7, 0, v6);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)removeTimeObserver:(id)a3
{
  objc_msgSend(a3, "invalidate");
}

- (void)willBeginAccessPower
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSError *v9;
  NSError *error;
  void *v11;
  int inData;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  inData = 1;
  v3 = AudioQueueSetProperty(self->_audioQueue, 0x61716D65u, &inData, 4u);
  if ((_DWORD)v3)
  {
    v4 = v3;
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_error_impl(&dword_21AA84000, v5, OS_LOG_TYPE_ERROR, "Unable to enable kAudioQueueProperty_EnableLevelMetering, err: %@", buf, 0xCu);

    }
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD1100];
    v13 = *MEMORY[0x24BDD0FC8];
    v14 = CFSTR("Unable to enable kAudioQueueProperty_EnableLevelMetering");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, (int)v4, v8);
    v9 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v9;

  }
}

- (void)didEndAccessPower
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSError *v9;
  NSError *error;
  OpaqueCMTimebase *timebase;
  void *v12;
  int inData;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  inData = 0;
  v3 = AudioQueueSetProperty(self->_audioQueue, 0x61716D65u, &inData, 4u);
  if ((_DWORD)v3)
  {
    v4 = v3;
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_error_impl(&dword_21AA84000, v5, OS_LOG_TYPE_ERROR, "Unable to disable kAudioQueueProperty_EnableLevelMetering, err: %@", buf, 0xCu);

    }
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD1100];
    v14 = *MEMORY[0x24BDD0FC8];
    v15 = CFSTR("Unable to disable kAudioQueueProperty_EnableLevelMetering");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, (int)v4, v8);
    v9 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v9;

  }
  timebase = self->_timebase;
  if (timebase)
    CMTimebaseSetRate(timebase, 0.0);
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  _BOOL4 v7;
  uint64_t Property;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSError *v14;
  NSError *error;
  int v16;
  void *v17;
  UInt32 ioDataSize;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _DWORD outData[2];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  ioDataSize = 8;
  v7 = -[VSAudioPlaybackServiceAT isAudioQueueRunning](self, "isAudioQueueRunning");
  if (v7)
  {
    Property = AudioQueueGetProperty(self->_audioQueue, 0x61716D64u, outData, &ioDataSize);
    if ((_DWORD)Property)
    {
      v9 = Property;
      VSGetLogDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v23 = "-[VSAudioPlaybackServiceAT getAveragePower:andPeakPower:]";
        v24 = 2112;
        v25 = v17;
        _os_log_error_impl(&dword_21AA84000, v10, OS_LOG_TYPE_ERROR, "Error: %s, errno: %@", buf, 0x16u);

      }
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BDD1100];
      v20 = *MEMORY[0x24BDD0FC8];
      v21 = CFSTR("Unable to get kAudioQueueProperty_CurrentLevelMeterDB");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, (int)v9, v13);
      v14 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v14;

      LOBYTE(v7) = 0;
    }
    else
    {
      v16 = outData[1];
      *a3 = *(float *)outData;
      *(_DWORD *)a4 = v16;
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[2].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[3].mBytesPerPacket;
  return self;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
}

- (OpaqueAudioQueue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_audioQueue = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (BOOL)discontinuedDuringPlayback
{
  return self->_discontinuedDuringPlayback;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (OpaqueCMTimebase)timebase
{
  return self->_timebase;
}

- (void)setTimebase:(OpaqueCMTimebase *)a3
{
  self->_timebase = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (_opaque_pthread_mutex_t)waitForStateChangeMutex
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[3].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[3].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[3].__opaque[40];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[3].__opaque[24];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setWaitForStateChangeMutex:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_waitForStateChangeMutex.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_waitForStateChangeMutex.__opaque[40] = v5;
  *(_OWORD *)&self->_waitForStateChangeMutex.__sig = v3;
  *(_OWORD *)&self->_waitForStateChangeMutex.__opaque[8] = v4;
}

- (_opaque_pthread_cond_t)stateChangeCondition
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[3].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[3].__opaque[24];
  return self;
}

- (void)setStateChangeCondition:(_opaque_pthread_cond_t *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_stateChangeCondition.__opaque[8] = *(_OWORD *)&a3->__opaque[8];
  *(_OWORD *)&self->_stateChangeCondition.__opaque[24] = v4;
  *(_OWORD *)&self->_stateChangeCondition.__sig = v3;
}

- (double)enqueuedSampleCount
{
  return self->_enqueuedSampleCount;
}

- (void)setEnqueuedSampleCount:(double)a3
{
  self->_enqueuedSampleCount = a3;
}

- (AudioTimeStamp)audioStartTimeStamp
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[4].mRateScalar;
  *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)&self[4].mSampleTime;
  *(_OWORD *)&retstr->mRateScalar = v3;
  v4 = *(_OWORD *)&self[4].mSMPTETime.mHours;
  *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)&self[4].mSMPTETime.mSubframes;
  *(_OWORD *)&retstr->mSMPTETime.mHours = v4;
  return self;
}

- (void)setAudioStartTimeStamp:(AudioTimeStamp *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->mSampleTime;
  v4 = *(_OWORD *)&a3->mRateScalar;
  v5 = *(_OWORD *)&a3->mSMPTETime.mHours;
  *(_OWORD *)&self->_audioStartTimeStamp.mSMPTETime.mSubframes = *(_OWORD *)&a3->mSMPTETime.mSubframes;
  *(_OWORD *)&self->_audioStartTimeStamp.mSMPTETime.mHours = v5;
  *(_OWORD *)&self->_audioStartTimeStamp.mSampleTime = v3;
  *(_OWORD *)&self->_audioStartTimeStamp.mRateScalar = v4;
}

- (NSDate)audioQueueStartDate
{
  return self->_audioQueueStartDate;
}

- (void)setAudioQueueStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueueStartDate, a3);
}

- (NSDate)audioQueueFutureEndDate
{
  return self->_audioQueueFutureEndDate;
}

- (void)setAudioQueueFutureEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueueFutureEndDate, a3);
}

- (VSMappedData)mappedData
{
  return self->_mappedData;
}

- (void)setMappedData:(id)a3
{
  objc_storeStrong((id *)&self->_mappedData, a3);
}

- (NSMutableArray)enqueuedMappedAudioInfo
{
  return self->_enqueuedMappedAudioInfo;
}

- (void)setEnqueuedMappedAudioInfo:(id)a3
{
  objc_storeStrong((id *)&self->_enqueuedMappedAudioInfo, a3);
}

- (unint64_t)playingBufferCount
{
  return self->_playingBufferCount;
}

- (void)setPlayingBufferCount:(unint64_t)a3
{
  self->_playingBufferCount = a3;
}

- (NSCondition)dequeueCondition
{
  return self->_dequeueCondition;
}

- (void)setDequeueCondition:(id)a3
{
  objc_storeStrong((id *)&self->_dequeueCondition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dequeueCondition, 0);
  objc_storeStrong((id *)&self->_enqueuedMappedAudioInfo, 0);
  objc_storeStrong((id *)&self->_mappedData, 0);
  objc_storeStrong((id *)&self->_audioQueueFutureEndDate, 0);
  objc_storeStrong((id *)&self->_audioQueueStartDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
