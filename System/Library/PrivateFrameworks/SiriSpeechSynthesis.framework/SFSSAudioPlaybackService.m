@implementation SFSSAudioPlaybackService

- (SFSSAudioPlaybackService)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4
{
  void *v7;
  SFSSAudioPlaybackService *v8;
  SFSSAudioPlaybackService *v9;
  __int128 v10;
  __int128 v11;
  unsigned int *p_sessionID;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  NSString *outputRoute;
  NSObject *v28;
  SFSSAudioPlaybackService *v29;
  OSStatus v30;
  OSStatus v31;
  NSObject *v32;
  void *v33;
  OSStatus v34;
  NSObject *v35;
  NSObject *v36;
  SFSSAudioPlaybackService *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  uint8_t buf[4];
  SFSSAudioPlaybackService *v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47.receiver = self;
  v47.super_class = (Class)SFSSAudioPlaybackService;
  v8 = -[SFSSAudioPlaybackService init](&v47, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a4->mSampleRate;
    v11 = *(_OWORD *)&a4->mBytesPerPacket;
    *(_QWORD *)&v8->_asbd.mBitsPerChannel = *(_QWORD *)&a4->mBitsPerChannel;
    *(_OWORD *)&v8->_asbd.mSampleRate = v10;
    *(_OWORD *)&v8->_asbd.mBytesPerPacket = v11;
    if (a3)
    {
      v8->_sessionID = a3;
      p_sessionID = &v8->_sessionID;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_sessionID = objc_msgSend(v13, "opaqueSessionID");
      p_sessionID = &v9->_sessionID;

    }
    v14 = AudioQueueNewOutputWithAudioSession();
    if (v14)
    {
      v15 = v14;
      SFSSGetLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v15;
        _os_log_error_impl(&dword_21E284000, v16, OS_LOG_TYPE_ERROR, "Error AudioQueueNewOutputWithAudioSession %d", buf, 8u);
      }

LABEL_26:
      v37 = 0;
      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x24BDB1858], "retrieveSessionWithID:", *p_sessionID);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentRoute");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v42 = v18;
    objc_msgSend(v18, "outputs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v44 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "portType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v22);
    }

    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
    v26 = objc_claimAutoreleasedReturnValue();
    outputRoute = v9->_outputRoute;
    v9->_outputRoute = (NSString *)v26;

    SFSSGetLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (SFSSAudioPlaybackService *)v9->_outputRoute;
      *(_DWORD *)buf = 138412290;
      v49 = v29;
      _os_log_impl(&dword_21E284000, v28, OS_LOG_TYPE_INFO, "Current audio output route: %@", buf, 0xCu);
    }

    v30 = AudioQueueSetProperty(v9->_audioQueue, 0x63756964u, &AudioPlaybackAudioQueueUID, 8u);
    if (v30)
    {
      v31 = v30;
      SFSSGetLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v31;
        _os_log_error_impl(&dword_21E284000, v32, OS_LOG_TYPE_ERROR, "Unable to set kAudioQueueProperty_ClientUID, errno: %d", buf, 8u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v9, sel_handleMediaServerReset, *MEMORY[0x24BDB1610], 0);

    v34 = AudioQueueAddPropertyListener(v9->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)_audioPlaybackServiceRunningStateChanged, v9);
    SFSSGetLogObject();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v34;
        _os_log_error_impl(&dword_21E284000, v36, OS_LOG_TYPE_ERROR, "Error AudioQueueAddPropertyListener %d", buf, 8u);
      }

      goto LABEL_26;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = a3;
      _os_log_impl(&dword_21E284000, v36, OS_LOG_TYPE_INFO, "AudioQueue initialized with session ID: %d", buf, 8u);
    }

  }
  objc_msgSend(v7, "timeIntervalSinceNow");
  v39 = v38;
  SFSSGetLogObject();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v49 = v9;
    v50 = 2048;
    v51 = v39;
    _os_log_impl(&dword_21E284000, v40, OS_LOG_TYPE_INFO, "AudioPlaybackService %p init latency: %.3f", buf, 0x16u);
  }

  v37 = v9;
LABEL_33:

  return v37;
}

- (id)start
{
  OSStatus v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v11;
  SFSSAudioPlaybackService *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = AudioQueueStart(self->_audioQueue, 0);
  SFSSGetLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11 = 67109120;
      LODWORD(v12) = v3;
      _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueStart %d", (uint8_t *)&v11, 8u);
    }

    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD1100];
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("Error AudioQueueStart");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_21E284000, v5, OS_LOG_TYPE_INFO, "AudioPlaybackService %p success AudioQueueStart", (uint8_t *)&v11, 0xCu);
    }

    if (!-[SFSSAudioPlaybackService isAudioQueueRunning](self, "isAudioQueueRunning"))
    {
      do
        -[SFSSAudioPlaybackService waitForQueueRunningStateChange](self, "waitForQueueRunningStateChange");
      while (!-[SFSSAudioPlaybackService isAudioQueueRunning](self, "isAudioQueueRunning"));
    }
    SFSSGetLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_21E284000, v8, OS_LOG_TYPE_INFO, "AudioPlaybackService %p success AudioQueueStart started", (uint8_t *)&v11, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (void)flushAndStop
{
  OSStatus v3;
  OSStatus v4;
  NSObject *v5;
  const char *v6;
  OSStatus v7;
  OSStatus v8;
  int v9;
  OSStatus v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = AudioQueueFlush(self->_audioQueue);
  if (v3)
  {
    v4 = v3;
    SFSSGetLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 67109120;
      v10 = v4;
      v6 = "Error AudioQueueFlush %d";
LABEL_10:
      _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    v7 = AudioQueueStop(self->_audioQueue, 0);
    if (!v7)
    {
      self->_enqueuedSampleCount = 0.0;
      return;
    }
    v8 = v7;
    SFSSGetLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 67109120;
      v10 = v8;
      v6 = "Error AudioQueueStop %d";
      goto LABEL_10;
    }
  }

}

- (void)stop
{
  OSStatus v3;
  OSStatus v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = AudioQueueStop(self->_audioQueue, 1u);
  if (v3)
  {
    v4 = v3;
    SFSSGetLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueStop %d", (uint8_t *)v6, 8u);
    }

  }
  self->_enqueuedSampleCount = 0.0;
}

- (void)waitForAudioQueueStop
{
  OSStatus v3;
  OSStatus v4;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[SFSSAudioPlaybackService isAudioQueueRunning](self, "isAudioQueueRunning"))
  {
    do
      -[SFSSAudioPlaybackService waitForQueueRunningStateChange](self, "waitForQueueRunningStateChange");
    while (-[SFSSAudioPlaybackService isAudioQueueRunning](self, "isAudioQueueRunning"));
  }
  v3 = AudioQueueRemovePropertyListener(self->_audioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)_audioPlaybackServiceRunningStateChanged, self);
  if (v3)
  {
    v4 = v3;
    SFSSGetLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueRemovePropertyListener %d", (uint8_t *)v7, 8u);
    }

  }
  SFSSGetLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_21E284000, v6, OS_LOG_TYPE_INFO, "Audio queue stopped.", (uint8_t *)v7, 2u);
  }

}

- (void)pause
{
  OSStatus v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  SFSSAudioPlaybackService *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = AudioQueuePause(self->_audioQueue);
  SFSSGetLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 67109120;
      LODWORD(v7) = v3;
      _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueuePause %d", (uint8_t *)&v6, 8u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_21E284000, v5, OS_LOG_TYPE_INFO, "VSAudioPlaybackServices %p success AudioQueuePause", (uint8_t *)&v6, 0xCu);
  }

}

- (void)reset
{
  OSStatus v3;
  OSStatus v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = AudioQueueReset(self->_audioQueue);
  if (v3)
  {
    v4 = v3;
    SFSSGetLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Error AudioQueueReset %d", (uint8_t *)v6, 8u);
    }

  }
  self->_enqueuedSampleCount = 0.0;
}

- (id)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  id v8;
  id v9;
  OSStatus v10;
  OSStatus v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *mAudioData;
  id v17;
  UInt32 v18;
  AudioQueueBuffer *v19;
  OpaqueAudioQueue *audioQueue;
  id v21;
  OSStatus v22;
  OSStatus v23;
  NSObject *v24;
  void *v25;
  double v26;
  double v27;
  double mSampleRate;
  NSObject *v29;
  uint64_t v30;
  double enqueuedSampleCount;
  AudioQueueBufferRef outBuffer;
  uint8_t buf[4];
  SFSSAudioPlaybackService *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(v8, "length"))
    goto LABEL_18;
  outBuffer = 0;
  v10 = AudioQueueAllocateBuffer(self->_audioQueue, objc_msgSend(v8, "length"), &outBuffer);
  if (!v10)
  {
    mAudioData = outBuffer->mAudioData;
    v17 = objc_retainAutorelease(v8);
    memcpy(mAudioData, (const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
    v18 = objc_msgSend(v17, "length");
    v19 = outBuffer;
    outBuffer->mAudioDataByteSize = v18;
    audioQueue = self->_audioQueue;
    v21 = objc_retainAutorelease(v9);
    v22 = AudioQueueEnqueueBuffer(audioQueue, v19, a4, (const AudioStreamPacketDescription *)objc_msgSend(v21, "bytes"));
    if (v22)
    {
      v23 = v22;
      SFSSGetLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v35) = v23;
        _os_log_error_impl(&dword_21E284000, v24, OS_LOG_TYPE_ERROR, "Error AudioQueueEnqueueBuffer %d", buf, 8u);
      }

      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BDD1100];
      v15 = v23;
      goto LABEL_10;
    }
    if (a4 && v21)
      v26 = (double)(self->_asbd.mFramesPerPacket * a4);
    else
      v26 = (double)(objc_msgSend(v17, "length") / (unint64_t)self->_asbd.mBytesPerFrame);
    v27 = v26 + self->_enqueuedSampleCount;
    self->_enqueuedSampleCount = v27;
    mSampleRate = self->_asbd.mSampleRate;
    SFSSGetLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = objc_msgSend(v17, "length");
      enqueuedSampleCount = self->_enqueuedSampleCount;
      *(_DWORD *)buf = 134219008;
      v35 = self;
      v36 = 2048;
      v37 = 0;
      v38 = 2048;
      v39 = v30;
      v40 = 2048;
      v41 = enqueuedSampleCount;
      v42 = 2048;
      v43 = v27 / mSampleRate;
      _os_log_impl(&dword_21E284000, v29, OS_LOG_TYPE_INFO, "AudioPlaybackService %p enqueued audio buffer at sample time: %.2f, size: %ld, total enqueued samples: %.0f, enqueued audio duration: %.3f", buf, 0x34u);
    }

LABEL_18:
    v25 = 0;
    goto LABEL_19;
  }
  v11 = v10;
  SFSSGetLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v35) = v11;
    _os_log_error_impl(&dword_21E284000, v12, OS_LOG_TYPE_ERROR, "Error AudioQueueAllocateBuffer %d", buf, 8u);
  }

  v13 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BDD1100];
  v15 = v11;
LABEL_10:
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v25;
}

- (BOOL)isAudioQueueRunning
{
  OSStatus Property;
  OSStatus v3;
  NSObject *v4;
  UInt32 ioDataSize;
  int outData;
  uint8_t buf[4];
  OSStatus v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  ioDataSize = 4;
  outData = 0;
  Property = AudioQueueGetProperty(self->_audioQueue, 0x6171726Eu, &outData, &ioDataSize);
  if (Property)
  {
    v3 = Property;
    SFSSGetLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v3;
      _os_log_error_impl(&dword_21E284000, v4, OS_LOG_TYPE_ERROR, "Error AudioQueueGetProperty isRunning %d", buf, 8u);
    }

  }
  return outData != 0;
}

- (void)handleMediaServerReset
{
  NSObject *v3;
  uint8_t v4[16];

  SFSSGetLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "mediaserverd reset", v4, 2u);
  }

  -[SFSSAudioPlaybackService stop](self, "stop");
}

- (void)signalQueueRunningStateChange
{
  -[NSCondition lock](self->_audioQueueStateCondition, "lock");
  -[NSCondition broadcast](self->_audioQueueStateCondition, "broadcast");
  -[NSCondition unlock](self->_audioQueueStateCondition, "unlock");
}

- (void)waitForQueueRunningStateChange
{
  -[NSCondition lock](self->_audioQueueStateCondition, "lock");
  -[NSCondition wait](self->_audioQueueStateCondition, "wait");
  -[NSCondition unlock](self->_audioQueueStateCondition, "unlock");
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[2].mSampleRate;
  return self;
}

- (OpaqueAudioQueue)audioQueue
{
  return self->_audioQueue;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (NSString)outputRoute
{
  return self->_outputRoute;
}

- (BOOL)discontinuedDuringPlayback
{
  return self->_discontinuedDuringPlayback;
}

- (NSCondition)audioQueueStateCondition
{
  return self->_audioQueueStateCondition;
}

- (void)setAudioQueueStateCondition:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueueStateCondition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioQueueStateCondition, 0);
  objc_storeStrong((id *)&self->_outputRoute, 0);
}

@end
