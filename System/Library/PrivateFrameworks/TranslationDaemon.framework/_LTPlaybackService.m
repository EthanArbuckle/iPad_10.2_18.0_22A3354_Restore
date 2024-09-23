@implementation _LTPlaybackService

- (_LTPlaybackService)initWithContext:(id)a3 ASBD:(AudioStreamBasicDescription *)a4
{
  id v7;
  char *v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  AudioQueueRef *v13;
  NSObject *v14;
  _LTPlaybackService *v15;
  double v16;
  OpaqueAudioQueue *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  int inData;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_LTPlaybackService;
  v8 = -[_LTPlaybackService init](&v37, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_5:
    v15 = 0;
    goto LABEL_20;
  }
  v10 = *(_OWORD *)&a4->mSampleRate;
  v11 = *(_OWORD *)&a4->mBytesPerPacket;
  *((_QWORD *)v8 + 5) = *(_QWORD *)&a4->mBitsPerChannel;
  *(_OWORD *)(v8 + 24) = v11;
  *(_OWORD *)(v8 + 8) = v10;
  objc_storeStrong((id *)v8 + 21, a3);
  v12 = objc_msgSend(v7, "audioSessionID");
  *((_QWORD *)v9 + 7) = 850045863;
  *((_OWORD *)v9 + 4) = 0u;
  *((_OWORD *)v9 + 5) = 0u;
  *((_OWORD *)v9 + 6) = 0u;
  *((_QWORD *)v9 + 14) = 0;
  *((_QWORD *)v9 + 15) = 1018212795;
  *((_OWORD *)v9 + 8) = 0u;
  *((_OWORD *)v9 + 9) = 0u;
  *((_QWORD *)v9 + 20) = 0;
  v13 = (AudioQueueRef *)(v9 + 48);
  if (AudioQueueNewOutputWithAudioSession())
  {
    v14 = _LTOSLogTTS();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_LTPlaybackService initWithContext:ASBD:].cold.1();
    goto LABEL_5;
  }
  objc_msgSend(v7, "ttsPlaybackRate");
  if (v16 != 1.0)
  {
    inData = 1;
    AudioQueueSetProperty(*v13, 0x715F7470u, &inData, 4u);
    inData = 1953064047;
    AudioQueueSetProperty(*v13, 0x71747061u, &inData, 4u);
    v17 = *v13;
    objc_msgSend(v7, "ttsPlaybackRate");
    *(float *)&v18 = v18;
    AudioQueueSetParameter(v17, 2u, *(AudioQueueParameterValue *)&v18);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB1858], "retrieveSessionWithID:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentRoute");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v21, "outputs", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26), "portType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v24);
  }

  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = _LTOSLogTTS();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    inData = 138412290;
    v39 = v28;
    _os_log_impl(&dword_2491B9000, v29, OS_LOG_TYPE_INFO, "Current audio output route: %@", (uint8_t *)&inData, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:selector:name:object:", v9, sel_handleMediaServerReset, *MEMORY[0x24BDB1610], 0);

  v31 = _LTOSLogTTS();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    inData = 67109120;
    LODWORD(v39) = v12;
    _os_log_impl(&dword_2491B9000, v31, OS_LOG_TYPE_INFO, "AudioQueue initialized with session id: %d", (uint8_t *)&inData, 8u);
  }
  v15 = v9;

LABEL_20:
  return v15;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_2491B9000, v0, v1, "Error disposing audio queue %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)handleMediaServerReset
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = _LTOSLogTTS();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "mediaserverd reset", v4, 2u);
  }
  -[_LTPlaybackService stop](self, "stop");
}

- (BOOL)_currentOutputRouteIsSpeaker
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x24BDB1858], "retrieveSessionWithID:", -[_LTTranslationContext audioSessionID](self->_context, "audioSessionID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "currentRoute");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "portType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Speaker"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)start
{
  OSStatus v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = AudioQueueStart(self->_audioQueue, 0);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = *MEMORY[0x24BDD1100];
    v6 = v3;
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("Error AudioQueueStart");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = _LTOSLogTTS();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LTPlaybackService start].cold.2();
  }
  else
  {
    if (-[_LTTranslationContext muteTTSBasedOnRingerSwitchIfPossible](self->_context, "muteTTSBasedOnRingerSwitchIfPossible")&& -[_LTPlaybackService _currentOutputRouteIsSpeaker](self, "_currentOutputRouteIsSpeaker"))
    {
      objc_msgSend(MEMORY[0x24BDB1858], "retrieveSessionWithID:", -[_LTTranslationContext audioSessionID](self->_context, "audioSessionID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v10, "setMXSessionProperty:value:error:", CFSTR("MutesAudioBasedOnRingerSwitchState"), v11, &v15);
      v12 = v15;

      if (v12)
      {
        v13 = _LTOSLogTTS();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[_LTPlaybackService start].cold.1((uint64_t)v12, v13);
      }

    }
    v8 = 0;
    self->_state = 1;
  }
  return v8;
}

- (id)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  UInt32 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  OSStatus v12;
  void *v13;
  NSObject *v14;
  void *mAudioData;
  id v16;
  UInt32 v17;
  OpaqueAudioQueue *audioQueue;
  AudioQueueBuffer *v19;
  id v20;
  OSStatus v21;
  NSObject *v22;
  NSObject *v23;
  const __CFString *v24;
  Float64 mSampleTime;
  NSObject *v26;
  uint64_t v27;
  AudioQueueBufferRef outBuffer;
  uint8_t v30[4];
  const __CFString *v31;
  __int16 v32;
  Float64 v33;
  __int16 v34;
  uint64_t v35;
  AudioTimeStamp buf;
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(v8, "length"))
  {
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  v10 = _LTOSLogTTS();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    LODWORD(buf.mSampleTime) = 134217984;
    *(_QWORD *)((char *)&buf.mSampleTime + 4) = objc_msgSend(v8, "length");
    _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_INFO, "Creating buffer of length: %zu", (uint8_t *)&buf, 0xCu);

  }
  outBuffer = 0;
  v12 = AudioQueueAllocateBuffer(self->_audioQueue, objc_msgSend(v8, "length"), &outBuffer);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _LTOSLogTTS();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_LTPlaybackService enqueue:packetCount:packetDescriptions:].cold.2();
    goto LABEL_16;
  }
  mAudioData = outBuffer->mAudioData;
  v16 = objc_retainAutorelease(v8);
  memcpy(mAudioData, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
  v17 = objc_msgSend(v16, "length");
  outBuffer->mAudioDataByteSize = v17;
  memset(&buf, 0, sizeof(buf));
  AudioQueueGetCurrentTime(self->_audioQueue, 0, &buf, 0);
  audioQueue = self->_audioQueue;
  v19 = outBuffer;
  v20 = objc_retainAutorelease(v9);
  v21 = AudioQueueEnqueueBuffer(audioQueue, v19, v6, (const AudioStreamPacketDescription *)objc_msgSend(v20, "bytes"));
  if (!v21)
  {
    v23 = _LTOSLogTTS();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      if (v20)
        v24 = CFSTR("Opus");
      else
        v24 = CFSTR("PCM");
      mSampleTime = buf.mSampleTime;
      v26 = v23;
      v27 = objc_msgSend(v16, "length");
      *(_DWORD *)v30 = 138543874;
      v31 = v24;
      v32 = 2048;
      v33 = mSampleTime;
      v34 = 2048;
      v35 = v27;
      _os_log_impl(&dword_2491B9000, v26, OS_LOG_TYPE_INFO, "Enqueued %{public}@ audio buffer at sample title: %.2f, size: %zu", v30, 0x20u);

    }
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v21, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = _LTOSLogTTS();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[_LTPlaybackService enqueue:packetCount:packetDescriptions:].cold.1();
LABEL_16:

  return v13;
}

- (void)signalQueueRunningStateChanged
{
  _opaque_pthread_mutex_t *p_waitForStateChange;
  NSObject *v4;
  uint8_t v5[16];

  p_waitForStateChange = &self->_waitForStateChange;
  pthread_mutex_lock(&self->_waitForStateChange);
  v4 = _LTOSLogTTS();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Playback service running state changed", v5, 2u);
  }
  pthread_cond_broadcast(&self->_stateChangeCondition);
  pthread_mutex_unlock(p_waitForStateChange);
}

- (void)waitForAudioQueueStop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_2491B9000, v0, v1, "Error adding audio queue property listener %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)flushAndStop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_2491B9000, v0, v1, "Error flushing audio queue %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)stop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_2491B9000, v0, v1, "Error AudioQueueStop %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)reset
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_2491B9000, v0, v1, "Error AudioQueueReset %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (BOOL)isAudioQueueRunning
{
  NSObject *v2;
  UInt32 ioDataSize;
  int outData;

  ioDataSize = 4;
  outData = 0;
  if (AudioQueueGetProperty(self->_audioQueue, 0x6171726Eu, &outData, &ioDataSize))
  {
    v2 = _LTOSLogTTS();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[_LTPlaybackService isAudioQueueRunning].cold.1();
  }
  return outData != 0;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithContext:ASBD:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_2491B9000, v0, v1, "Error creating playback service, %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)start
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_5(&dword_2491B9000, v0, v1, "Error starting audio queue %d: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)enqueue:packetCount:packetDescriptions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_5(&dword_2491B9000, v0, v1, "Failed to enqueue audio data: %d: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)enqueue:packetCount:packetDescriptions:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_5(&dword_2491B9000, v0, v1, "Failed to create audio buffer: %d: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)isAudioQueueRunning
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_2491B9000, v0, v1, "Error checking is running property: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
