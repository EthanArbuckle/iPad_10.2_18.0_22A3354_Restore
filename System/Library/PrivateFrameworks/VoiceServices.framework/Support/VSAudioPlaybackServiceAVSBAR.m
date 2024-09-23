@implementation VSAudioPlaybackServiceAVSBAR

- (VSAudioPlaybackServiceAVSBAR)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4
{
  uint64_t v5;
  char *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  _DWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void **p_cache;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  uint64_t v38;
  VSAudioPlaybackServiceAVSBAR *v39;
  NSObject *v40;
  char v42;
  uint64_t v43;
  objc_super v44;
  uint8_t buf[4];
  _BYTE v46[10];
  uint64_t v47;
  uint64_t v48;

  v5 = *(_QWORD *)&a3;
  v48 = *MEMORY[0x24BDAC8D0];
  mach_absolute_time();
  v44.receiver = self;
  v44.super_class = (Class)VSAudioPlaybackServiceAVSBAR;
  v7 = -[VSAudioPlaybackServiceAVSBAR init](&v44, sel_init);
  v8 = v7;
  if (!v7)
  {
LABEL_15:
    mach_absolute_time();
    VSGetLogDefault();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      VSAbsoluteTimeToSecond();
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v46 = v8;
      *(_WORD *)&v46[8] = 2048;
      v47 = v38;
      _os_log_impl(&dword_21AA84000, v37, OS_LOG_TYPE_INFO, "VSAudioPlaybackService %p init latency: %.3f", buf, 0x16u);
    }

    v39 = v8;
    goto LABEL_21;
  }
  *((_QWORD *)v7 + 6) = 1;
  v9 = *(_OWORD *)&a4->mSampleRate;
  v10 = *(_OWORD *)&a4->mBytesPerPacket;
  *((_QWORD *)v7 + 19) = *(_QWORD *)&a4->mBitsPerChannel;
  *(_OWORD *)(v7 + 136) = v10;
  *(_OWORD *)(v7 + 120) = v9;
  if ((_DWORD)v5)
  {
    *((_DWORD *)v7 + 3) = v5;
    v11 = v7 + 12;
    v12 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v8 + 3) = objc_msgSend(v13, "opaqueSessionID");
    v11 = v8 + 12;

    v12 = *((unsigned int *)v8 + 3);
  }
  objc_msgSend(MEMORY[0x24BDB1858], "retrieveSessionWithID:", v12);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = objc_alloc_init(MEMORY[0x24BEC0D98]);
    v17 = (void *)*((_QWORD *)v8 + 9);
    *((_QWORD *)v8 + 9) = v16;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v8 + 10);
    *((_QWORD *)v8 + 10) = v18;

    v20 = MEMORY[0x24BDC0D88];
    *((_OWORD *)v8 + 6) = *MEMORY[0x24BDC0D88];
    *((_QWORD *)v8 + 14) = *(_QWORD *)(v20 + 16);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("VSAudioPlaybackServiceAVSBARQueue", v21);
    v23 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = v22;

    v24 = (void *)sLastSynchronizer;
    v25 = (id)sLastSynchronizer;
    objc_msgSend(v25, "renderers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    p_cache = (void **)(&OBJC_METACLASS___VSDurationEstimationTask + 16);
    if (v27)
    {
      objc_msgSend(v27, "audioSession");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "opaqueSessionID") != *v11 || v25 && (objc_msgSend(v25, "currentTime"), v43))
      {

        p_cache = &OBJC_METACLASS___VSDurationEstimationTask.cache;
      }
      else
      {
        v42 = sLastSynchronizerStartedProvidingData;

        p_cache = (void **)(&OBJC_METACLASS___VSDurationEstimationTask + 16);
        if ((v42 & 1) == 0)
        {
          objc_storeStrong((id *)v8 + 3, v27);
          objc_storeStrong((id *)v8 + 4, v24);
          goto LABEL_12;
        }
      }
    }
    v30 = objc_alloc_init(MEMORY[0x24BDB2688]);
    v31 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v30;

    objc_msgSend(*((id *)v8 + 3), "setAudioSession:", v15);
    v32 = objc_alloc_init(MEMORY[0x24BDB2698]);
    v33 = (void *)*((_QWORD *)v8 + 4);
    *((_QWORD *)v8 + 4) = v32;

    objc_msgSend(*((id *)v8 + 4), "setDelaysRateChangeUntilHasSufficientMediaData:", 0);
    objc_msgSend(*((id *)v8 + 4), "addRenderer:", *((_QWORD *)v8 + 3));
    objc_storeStrong((id *)&sLastSynchronizer, *((id *)v8 + 4));
    *((_BYTE *)p_cache + 3432) = 0;
LABEL_12:
    pthread_mutex_init((pthread_mutex_t *)(v8 + 224), 0);
    pthread_mutex_init((pthread_mutex_t *)(v8 + 160), 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v8, sel_handleMediaServerReset, *MEMORY[0x24BDB1610], 0);

    VSGetLogDefault();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *((_QWORD *)v8 + 4) == (_QWORD)v25;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v46 = v5;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v36;
      _os_log_impl(&dword_21AA84000, v35, OS_LOG_TYPE_DEFAULT, "#AVSBAR initialized with session ID: %d, reusing previous synchronizer: %{BOOL}d", buf, 0xEu);
    }

    goto LABEL_15;
  }
  VSGetLogDefault();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v46 = v5;
    _os_log_error_impl(&dword_21AA84000, v40, OS_LOG_TYPE_ERROR, "Can't retrieve session with ID: %d", buf, 8u);
  }

  v39 = 0;
LABEL_21:

  return v39;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[VSAudioPlaybackServiceAVSBAR stopWaiting](self, "stopWaiting");
  -[VSAudioPlaybackServiceAVSBAR freeAudioQueue](self, "freeAudioQueue");
  v4.receiver = self;
  v4.super_class = (Class)VSAudioPlaybackServiceAVSBAR;
  -[VSAudioPlaybackServiceAVSBAR dealloc](&v4, sel_dealloc);
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

  -[VSAudioPlaybackServiceAVSBAR stop](self, "stop");
}

- (id)start
{
  self->_state = 2;
  if (self->_rendererEnqueuedAudioDuration > 0.0)
    -[VSAudioPlaybackServiceAVSBAR _play](self, "_play");
  return self->_error;
}

- (void)_play
{
  NSObject *v3;
  double rendererEnqueuedAudioDuration;
  float v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  double v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    rendererEnqueuedAudioDuration = self->_rendererEnqueuedAudioDuration;
    -[AVSampleBufferRenderSynchronizer rate](self->_synchronizer, "rate");
    *(_DWORD *)buf = 134218240;
    v9 = rendererEnqueuedAudioDuration;
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEFAULT, "#AVSBAR synchronizer.rate will be set to 1 with enqueued audio duration %f sec. Previous rate: %f", buf, 0x16u);
  }

  dispatch_get_global_queue(33, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__VSAudioPlaybackServiceAVSBAR__play__block_invoke;
  block[3] = &unk_24DD8EBB0;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)createSampleBufferIdNeeded:(id)a3
{
  CMAttachmentBearerRef *v4;
  CMAttachmentBearerRef *v5;
  uint64_t v6;
  opaqueCMSampleBuffer *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  opaqueCMSampleBuffer *v11;
  __int16 v12;
  __int16 v13;

  v4 = (CMAttachmentBearerRef *)a3;
  v5 = v4;
  if (v4[1])
    goto LABEL_2;
  -[CMAttachmentBearerRef audioBytesRange](v4, "audioBytesRange");
  if (v6)
  {
    v7 = -[VSAudioPlaybackServiceAVSBAR createSampleBuffer:](self, "createSampleBuffer:", v5);
    v5[1] = v7;
    if (!v7)
    {
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v13 = 0;
        v9 = "Invalid sample buffer";
        v10 = (uint8_t *)&v13;
LABEL_13:
        _os_log_error_impl(&dword_21AA84000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v11 = -[VSAudioPlaybackServiceAVSBAR createSilenceEndBuffer](self, "createSilenceEndBuffer");
    v5[1] = v11;
    if (!v11)
    {
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = 0;
        v9 = "Invalid silence buffer";
        v10 = (uint8_t *)&v12;
        goto LABEL_13;
      }
LABEL_11:

      goto LABEL_2;
    }
  }
  if (-[CMAttachmentBearerRef endOfSiriTTSUtterance](v5, "endOfSiriTTSUtterance"))
    CMSetAttachment(v5[1], (CFStringRef)*MEMORY[0x24BDC0CF8], (CFTypeRef)*MEMORY[0x24BDBD270], 0);
LABEL_2:

}

- (opaqueCMSampleBuffer)createSampleBuffer:(id)a3
{
  id v4;
  const AudioStreamPacketDescription *packetDescriptions;
  unsigned int v6;
  unsigned int v7;
  const __CFAllocator *v8;
  int BlockBufferCopyingMemoryBlock;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSError *v18;
  NSError *v19;
  OSStatus v20;
  OSStatus v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSError *v26;
  NSError *error;
  opaqueCMSampleBuffer *v28;
  const opaqueCMFormatDescription *v30;
  OpaqueCMBlockBuffer *v31;
  CMItemCount v32;
  OSStatus v33;
  UInt32 mBytesPerFrame;
  OSStatus v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  CMTime rhs;
  CMTime lhs;
  CMTime v41;
  CMTime v42;
  CMTime presentationTimeStamp;
  CMSampleBufferRef v44;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  CMBlockBufferRef v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v46 = 0;
  -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v4, "audioBytesRange"));
  if (objc_msgSend(v4, "packetCount"))
    packetDescriptions = (const AudioStreamPacketDescription *)-[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v4, "packetDescriptionsRange"));
  else
    packetDescriptions = 0;
  objc_msgSend(v4, "audioBytesRange");
  v7 = v6;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  BlockBufferCopyingMemoryBlock = FigCreateBlockBufferCopyingMemoryBlock();
  if (BlockBufferCopyingMemoryBlock)
  {
    v10 = BlockBufferCopyingMemoryBlock;
    VSGetLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_21AA84000, v11, OS_LOG_TYPE_ERROR, "Error in creating block buffer for Sample buffer", (uint8_t *)&presentationTimeStamp, 2u);
    }

    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD1100];
    v51 = *MEMORY[0x24BDD0FC8];
    v52[0] = CFSTR("Error in creating block buffer for Sample buffer");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    v16 = v13;
    v17 = v10;
  }
  else
  {
    formatDescriptionOut = 0;
    v20 = CMAudioFormatDescriptionCreate(v8, &self->_asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
    if (v20)
    {
      v21 = v20;
      VSGetLogDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LOWORD(presentationTimeStamp.value) = 0;
        _os_log_error_impl(&dword_21AA84000, v22, OS_LOG_TYPE_ERROR, "Error in CMAudioFormatDescriptionCreate", (uint8_t *)&presentationTimeStamp, 2u);
      }

      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD1100];
      v49 = *MEMORY[0x24BDD0FC8];
      v50 = CFSTR("Error in CMAudioFormatDescriptionCreate");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v21, v25);
      v26 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v26;

      CFRelease(v46);
      goto LABEL_13;
    }
    v44 = 0;
    v30 = formatDescriptionOut;
    v31 = v46;
    if (packetDescriptions)
    {
      v32 = objc_msgSend(v4, "packetCount");
      presentationTimeStamp = (CMTime)self->_mappedAudioQueuedTimeStamp;
      v33 = CMAudioSampleBufferCreateWithPacketDescriptions(v8, v31, 1u, 0, 0, v30, v32, &presentationTimeStamp, packetDescriptions, &v44);
    }
    else
    {
      mBytesPerFrame = self->_asbd.mBytesPerFrame;
      presentationTimeStamp = (CMTime)self->_mappedAudioQueuedTimeStamp;
      v33 = CMAudioSampleBufferCreateWithPacketDescriptions(v8, v46, 1u, 0, 0, formatDescriptionOut, v7 / mBytesPerFrame, &presentationTimeStamp, 0, &v44);
    }
    v35 = v33;
    CFRelease(v46);
    CFRelease(formatDescriptionOut);
    if (!v35)
    {
      memset(&presentationTimeStamp, 0, sizeof(presentationTimeStamp));
      CMSampleBufferGetOutputPresentationTimeStamp(&presentationTimeStamp, v44);
      memset(&v42, 0, sizeof(v42));
      CMSampleBufferGetOutputDuration(&v42, v44);
      lhs = presentationTimeStamp;
      rhs = v42;
      CMTimeAdd(&v41, &lhs, &rhs);
      self->_mappedAudioQueuedTimeStamp = ($95D729B680665BEAEFA1D6FCA8238556)v41;
      v28 = v44;
      goto LABEL_14;
    }
    VSGetLogDefault();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_21AA84000, v36, OS_LOG_TYPE_ERROR, "Error in CMAudioSampleBufferCreateWithPacketDescriptions", (uint8_t *)&presentationTimeStamp, 2u);
    }

    v37 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD1100];
    v47 = *MEMORY[0x24BDD0FC8];
    v48 = CFSTR("Error in CMAudioSampleBufferCreateWithPacketDescriptions");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v37;
    v16 = v38;
    v17 = v35;
  }
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v14);
  v18 = (NSError *)objc_claimAutoreleasedReturnValue();
  v19 = self->_error;
  self->_error = v18;

LABEL_13:
  v28 = 0;
LABEL_14:

  return v28;
}

- (double)duration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  unint64_t v11;

  v4 = a3;
  v5 = v4;
  v6 = 0.0;
  if (self->_asbd.mSampleRate != 0.0)
  {
    if (objc_msgSend(v4, "packetCount"))
    {
      v8 = objc_msgSend(v5, "packetCount");
      LODWORD(v9) = self->_asbd.mFramesPerPacket;
      v6 = (double)v8 * (double)v9 / self->_asbd.mSampleRate;
    }
    else
    {
      LODWORD(v7) = self->_asbd.mBytesPerFrame;
      v10 = self->_asbd.mSampleRate * (double)v7;
      if (v10 != 0.0)
      {
        objc_msgSend(v5, "audioBytesRange");
        v6 = (double)v11 / v10;
      }
    }
  }

  return v6;
}

- (void)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  id v8;
  id v9;
  VSAudioMappedInfoAVSBAR *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if ((unint64_t)(self->_state - 3) > 1)
  {
    if (objc_msgSend(v8, "length"))
    {
      pthread_mutex_lock(&self->_audioQueueBufferLock);
      v10 = objc_alloc_init(VSAudioMappedInfoAVSBAR);
      v12 = -[VSMappedData appendData:](self->_mappedData, "appendData:", v8);
      -[VSAudioMappedInfoAVSBAR setAudioBytesRange:](v10, "setAudioBytesRange:", v12, v13);
      -[VSAudioMappedInfoAVSBAR setPacketCount:](v10, "setPacketCount:", a4);
      v14 = -[VSMappedData appendData:](self->_mappedData, "appendData:", v9);
      -[VSAudioMappedInfoAVSBAR setPacketDescriptionsRange:](v10, "setPacketDescriptionsRange:", v14, v15);
      VSGetLogDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[VSAudioPlaybackServiceAVSBAR duration:](self, "duration:", v10);
        v18 = 134217984;
        v19 = v17;
        _os_log_impl(&dword_21AA84000, v16, OS_LOG_TYPE_INFO, "Adding to enqueuedMappedAudioInfo: %f sec", (uint8_t *)&v18, 0xCu);
      }

      -[NSMutableArray addObject:](self->_enqueuedMappedAudioInfo, "addObject:", v10);
      pthread_mutex_unlock(&self->_audioQueueBufferLock);
      -[VSAudioPlaybackServiceAVSBAR _startProvidingData](self, "_startProvidingData");
    }
    else
    {
      VSGetLogDefault();
      v10 = (VSAudioMappedInfoAVSBAR *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        v11 = "#AVSBAR empty audio data: will not enqueue it";
        goto LABEL_11;
      }
    }
  }
  else
  {
    VSGetLogDefault();
    v10 = (VSAudioMappedInfoAVSBAR *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      v11 = "#AVSBAR already stopped or waiting for finish: will not enqueue more";
LABEL_11:
      _os_log_error_impl(&dword_21AA84000, &v10->super, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v18, 2u);
    }
  }

}

- (void)_startProvidingData
{
  AVSampleBufferAudioRenderer *renderer;
  OS_dispatch_queue *dataQueue;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_startedProvidingData)
  {
    self->_startedProvidingData = 1;
    if ((AVSampleBufferRenderSynchronizer *)sLastSynchronizer == self->_synchronizer)
      sLastSynchronizerStartedProvidingData = 1;
    objc_initWeak(&location, self);
    renderer = self->_renderer;
    dataQueue = self->_dataQueue;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __51__VSAudioPlaybackServiceAVSBAR__startProvidingData__block_invoke;
    v5[3] = &unk_24DD8E648;
    objc_copyWeak(&v6, &location);
    -[AVSampleBufferAudioRenderer requestMediaDataWhenReadyOnQueue:usingBlock:](renderer, "requestMediaDataWhenReadyOnQueue:usingBlock:", dataQueue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (opaqueCMSampleBuffer)createSilenceEndBuffer
{
  void *v3;
  const __CFAllocator *v4;
  OSStatus v5;
  OSStatus v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSError *v11;
  NSError *error;
  OSStatus v13;
  OSStatus v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSError *v19;
  NSError *v20;
  OSStatus v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSError *v26;
  NSError *v27;
  CMTime presentationTimeStamp;
  CMSampleBufferRef v30;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  CMBlockBufferRef blockBufferOut;
  AudioStreamBasicDescription asbd;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  asbd.mSampleRate = 48000.0;
  *(_OWORD *)&asbd.mFormatID = xmmword_21AACED20;
  *(_OWORD *)&asbd.mBytesPerFrame = xmmword_21AACED30;
  v3 = malloc_type_calloc(2uLL, 0x800uLL, 0x8D699448uLL);
  blockBufferOut = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], v3, 0x1000uLL, (CFAllocatorRef)*MEMORY[0x24BDBD248], 0, 0, 0x1000uLL, 0, &blockBufferOut);
  if (v5)
  {
    v6 = v5;
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "Error in creating block buffer for Silence buffer", (uint8_t *)&presentationTimeStamp, 2u);
    }

    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD1100];
    v38 = *MEMORY[0x24BDD0FC8];
    v39[0] = CFSTR("Error in creating block buffer for Silence buffer");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v6, v10);
    v11 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v11;

    free(v3);
    return 0;
  }
  formatDescriptionOut = 0;
  v13 = CMAudioFormatDescriptionCreate(v4, &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  if (v13)
  {
    v14 = v13;
    VSGetLogDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_21AA84000, v15, OS_LOG_TYPE_ERROR, "Error in CMAudioFormatDescriptionCreate from Silence buffer creation", (uint8_t *)&presentationTimeStamp, 2u);
    }

    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD1100];
    v36 = *MEMORY[0x24BDD0FC8];
    v37 = CFSTR("Error in CMAudioFormatDescriptionCreate from Silence buffer creation");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v14, v18);
    v19 = (NSError *)objc_claimAutoreleasedReturnValue();
    v20 = self->_error;
    self->_error = v19;

    CFRelease(blockBufferOut);
    return 0;
  }
  presentationTimeStamp = (CMTime)self->_mappedAudioQueuedTimeStamp;
  v30 = 0;
  v21 = CMAudioSampleBufferCreateWithPacketDescriptions(v4, blockBufferOut, 1u, 0, 0, formatDescriptionOut, 0x1000 / asbd.mBytesPerFrame, &presentationTimeStamp, 0, &v30);
  CFRelease(blockBufferOut);
  CFRelease(formatDescriptionOut);
  if (v21)
  {
    VSGetLogDefault();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(presentationTimeStamp.value) = 0;
      _os_log_error_impl(&dword_21AA84000, v22, OS_LOG_TYPE_ERROR, "Error in CMAudioSampleBufferCreateWithPacketDescriptions from silence buffer", (uint8_t *)&presentationTimeStamp, 2u);
    }

    v23 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD1100];
    v34 = *MEMORY[0x24BDD0FC8];
    v35 = CFSTR("Error in CMAudioSampleBufferCreateWithPacketDescriptions from silence buffer");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v21, v25);
    v26 = (NSError *)objc_claimAutoreleasedReturnValue();
    v27 = self->_error;
    self->_error = v26;

    return 0;
  }
  return v30;
}

- (void)addEndOfDataAttachment
{
  _opaque_pthread_mutex_t *p_audioQueueBufferLock;
  VSAudioMappedInfoAVSBAR *v4;
  VSAudioMappedInfoAVSBAR *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  p_audioQueueBufferLock = &self->_audioQueueBufferLock;
  pthread_mutex_lock(&self->_audioQueueBufferLock);
  -[NSMutableArray lastObject](self->_enqueuedMappedAudioInfo, "lastObject");
  v4 = (VSAudioMappedInfoAVSBAR *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[VSAudioMappedInfoAVSBAR setEndOfSiriTTSUtterance:](v4, "setEndOfSiriTTSUtterance:", 1);
  }
  else
  {
    v5 = objc_alloc_init(VSAudioMappedInfoAVSBAR);
    v6 = -[VSMappedData appendData:](self->_mappedData, "appendData:", 0);
    -[VSAudioMappedInfoAVSBAR setAudioBytesRange:](v5, "setAudioBytesRange:", v6, v7);
    -[VSAudioMappedInfoAVSBAR setPacketCount:](v5, "setPacketCount:", 0);
    v8 = -[VSMappedData appendData:](self->_mappedData, "appendData:", 0);
    -[VSAudioMappedInfoAVSBAR setPacketDescriptionsRange:](v5, "setPacketDescriptionsRange:", v8, v9);
    -[VSAudioMappedInfoAVSBAR setEndOfSiriTTSUtterance:](v5, "setEndOfSiriTTSUtterance:", 1);
    -[NSMutableArray addObject:](self->_enqueuedMappedAudioInfo, "addObject:", v5);
  }
  pthread_mutex_unlock(p_audioQueueBufferLock);
  VSGetLogDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_INFO, "#AVSBAR EndOfDataAttachment ready for enqueuing", v11, 2u);
  }

}

- (void)provideMoreData
{
  NSObject *v3;
  __int128 v4;
  uint64_t v5;
  CFTypeRef *v6;
  opaqueCMSampleBuffer *v7;
  double Seconds;
  NSObject *v9;
  AVSampleBufferAudioRenderer *renderer;
  void *v11;
  double v12;
  NSObject *v13;
  int64_t v14;
  NSObject *v15;
  AVSampleBufferAudioRenderer *v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  float v23;
  int64_t v24;
  int64_t state;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CMTime time;
  uint8_t v32[128];
  uint8_t buf[4];
  int64_t v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_enqueuedMappedAudioInfo, "count"))
  {
    VSGetLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      state = self->_state;
      *(_DWORD *)buf = 134217984;
      v34 = state;
      _os_log_debug_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEBUG, "#AVSBAR Call to provide more audio data during state %ld.", buf, 0xCu);
    }

  }
  if (-[AVSampleBufferAudioRenderer isReadyForMoreMediaData](self->_renderer, "isReadyForMoreMediaData"))
  {
    *(_QWORD *)&v4 = 134217984;
    v26 = v4;
    while (1)
    {
      pthread_mutex_lock(&self->_audioQueueBufferLock);
      -[NSMutableArray firstObject](self->_enqueuedMappedAudioInfo, "firstObject");
      v5 = objc_claimAutoreleasedReturnValue();
      if (!v5)
        break;
      v6 = (CFTypeRef *)v5;
      -[NSMutableArray removeObjectAtIndex:](self->_enqueuedMappedAudioInfo, "removeObjectAtIndex:", 0);
      -[VSAudioPlaybackServiceAVSBAR createSampleBufferIdNeeded:](self, "createSampleBufferIdNeeded:", v6);
      pthread_mutex_unlock(&self->_audioQueueBufferLock);
      v7 = (opaqueCMSampleBuffer *)v6[1];
      if (v7)
      {
        CMSampleBufferGetOutputDuration(&time, v7);
        Seconds = CMTimeGetSeconds(&time);
        VSGetLogDefault();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          renderer = self->_renderer;
          *(_DWORD *)buf = 138412546;
          v34 = (int64_t)renderer;
          v35 = 2048;
          v36 = Seconds;
          _os_log_impl(&dword_21AA84000, v9, OS_LOG_TYPE_INFO, "#AVSBAR Enqueuing to %@: %f sec", buf, 0x16u);
        }

        mach_absolute_time();
        -[VSAudioPlaybackServiceAVSBAR renderer](self, "renderer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "enqueueSampleBuffer:", v6[1]);

        mach_absolute_time();
        VSAbsoluteTimeToSecond();
        if (v12 > 0.25)
        {
          VSGetLogDefault();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            VSAbsoluteTimeToSecond();
            *(_DWORD *)buf = v26;
            v34 = v14;
            _os_log_error_impl(&dword_21AA84000, v13, OS_LOG_TYPE_ERROR, "_renderer enqueueSampleBuffer high latency: %.3f sec", buf, 0xCu);
          }

        }
        CFRelease(v6[1]);
        self->_rendererEnqueuedAudioDuration = Seconds + self->_rendererEnqueuedAudioDuration;
        kdebug_trace();
      }

      if ((-[AVSampleBufferAudioRenderer isReadyForMoreMediaData](self->_renderer, "isReadyForMoreMediaData") & 1) == 0)
        goto LABEL_19;
    }
    pthread_mutex_unlock(&self->_audioQueueBufferLock);
  }
LABEL_19:
  if (-[NSMutableArray count](self->_enqueuedMappedAudioInfo, "count", v26))
  {
    VSGetLogDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = self->_renderer;
      v17 = -[NSMutableArray count](self->_enqueuedMappedAudioInfo, "count");
      *(_DWORD *)buf = 138412546;
      v34 = (int64_t)v16;
      v35 = 2048;
      v36 = *(double *)&v17;
      _os_log_impl(&dword_21AA84000, v15, OS_LOG_TYPE_INFO, "#AVSBAR Renderer %@ not anymore ready for more media data. enqueuedMappedAudioInfo count left: %lu", buf, 0x16u);
    }

    if (self->_state == 3)
    {
      pthread_mutex_lock(&self->_audioQueueBufferLock);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = self->_enqueuedMappedAudioInfo;
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v18);
            -[VSAudioPlaybackServiceAVSBAR createSampleBufferIdNeeded:](self, "createSampleBufferIdNeeded:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          }
          v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v20);
      }

      pthread_mutex_unlock(&self->_audioQueueBufferLock);
    }
  }
  -[AVSampleBufferRenderSynchronizer rate](self->_synchronizer, "rate");
  if (v23 == 0.0)
  {
    v24 = self->_state;
    if (v24 == 3 || v24 == 2 && self->_rendererEnqueuedAudioDuration > 0.0)
      -[VSAudioPlaybackServiceAVSBAR _play](self, "_play");
  }
}

- (void)flushAndStop
{
  NSObject *v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *dataQueue;
  AVSampleBufferRenderSynchronizer *synchronizer;
  AVSampleBufferRenderSynchronizer *v9;
  void *v10;
  void *v11;
  OS_dispatch_queue *v12;
  void *v13;
  double v14;
  __int128 v15;
  NSObject *v16;
  Float64 Seconds;
  Float64 v18;
  dispatch_time_t v19;
  AVSampleBufferRenderSynchronizer *v20;
  float v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSError *v25;
  NSError *error;
  OS_dispatch_semaphore *noRemainTasks;
  float v28;
  double v29;
  Float64 v30;
  __int128 v31;
  CMTime v32;
  _QWORD v33[4];
  NSObject *v34;
  CMTime mappedAudioQueuedTimeStamp;
  CMTime buf;
  _QWORD block[5];
  uint64_t v38;
  const __CFString *v39;
  CMTime time2;
  CMTime time1;
  _QWORD v42[4];

  v42[1] = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_INFO, "#AVSBAR flushAndStop", (uint8_t *)&buf, 2u);
  }

  pthread_mutex_lock(&self->_stateLock);
  if ((unint64_t)(self->_state - 3) > 1)
  {
    v5 = dispatch_semaphore_create(0);
    objc_storeStrong((id *)&self->_noRemainTasks, v5);
    self->_state = 3;
    pthread_mutex_unlock(&self->_stateLock);
    -[VSAudioPlaybackServiceAVSBAR addEndOfDataAttachment](self, "addEndOfDataAttachment");
    v6 = MEMORY[0x24BDAC760];
    dataQueue = self->_dataQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__VSAudioPlaybackServiceAVSBAR_flushAndStop__block_invoke;
    block[3] = &unk_24DD8EBB0;
    block[4] = self;
    dispatch_sync(dataQueue, block);
    memset(&buf, 0, sizeof(buf));
    synchronizer = self->_synchronizer;
    if (synchronizer)
    {
      -[AVSampleBufferRenderSynchronizer currentTime](synchronizer, "currentTime");
      v9 = self->_synchronizer;
    }
    else
    {
      v9 = 0;
    }
    mappedAudioQueuedTimeStamp = (CMTime)self->_mappedAudioQueuedTimeStamp;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &mappedAudioQueuedTimeStamp, "{?=qiIq}");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_dataQueue;
    v33[0] = v6;
    v33[1] = 3221225472;
    v33[2] = __44__VSAudioPlaybackServiceAVSBAR_flushAndStop__block_invoke_2;
    v33[3] = &unk_24DD8EBB0;
    v4 = v5;
    v34 = v4;
    -[AVSampleBufferRenderSynchronizer addBoundaryTimeObserverForTimes:queue:usingBlock:](v9, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v11, v12, v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0.0;
    *(_QWORD *)&v15 = 134218240;
    v31 = v15;
    while (1)
    {
      time1 = buf;
      time2 = mappedAudioQueuedTimeStamp;
      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        break;
      VSGetLogDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        time1 = buf;
        Seconds = CMTimeGetSeconds(&time1);
        time1 = mappedAudioQueuedTimeStamp;
        v18 = CMTimeGetSeconds(&time1);
        LODWORD(time1.value) = v31;
        *(Float64 *)((char *)&time1.value + 4) = Seconds;
        LOWORD(time1.flags) = 2048;
        *(Float64 *)((char *)&time1.flags + 2) = v18;
        _os_log_impl(&dword_21AA84000, v16, OS_LOG_TYPE_DEFAULT, "#AVSBAR Waiting for synchronizer finishing playing between current %f sec and until %f sec", (uint8_t *)&time1, 0x16u);
      }

      v19 = dispatch_time(0, 1000000000);
      if (!dispatch_semaphore_wait(v4, v19) || !self->_noRemainTasks)
        break;
      memset(&time1, 0, sizeof(time1));
      v20 = self->_synchronizer;
      if (v20)
      {
        -[AVSampleBufferRenderSynchronizer currentTime](v20, "currentTime");
        v20 = self->_synchronizer;
      }
      -[AVSampleBufferRenderSynchronizer rate](v20, "rate", v31);
      if (v21 <= 0.0 || (time2 = time1, v32 = buf, CMTimeCompare(&time2, &v32) <= 0))
      {
        if (self->_state != 1)
        {
          v14 = v14 + 1.0;
          if (v14 >= 5.0)
          {
            VSGetLogDefault();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              -[AVSampleBufferRenderSynchronizer rate](self->_synchronizer, "rate");
              v29 = v28;
              time2 = time1;
              v30 = CMTimeGetSeconds(&time2);
              LODWORD(time2.value) = v31;
              *(double *)((char *)&time2.value + 4) = v29;
              LOWORD(time2.flags) = 2048;
              *(Float64 *)((char *)&time2.flags + 2) = v30;
              _os_log_error_impl(&dword_21AA84000, v22, OS_LOG_TYPE_ERROR, "#AVSBAR Synchronizer is stalled with rate %f at time %f.", (uint8_t *)&time2, 0x16u);
            }

            v23 = (void *)MEMORY[0x24BDD1540];
            v38 = *MEMORY[0x24BDD0FC8];
            v39 = CFSTR("Timeout waiting for AVSampleBufferRenderSynchronizer");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 450, v24);
            v25 = (NSError *)objc_claimAutoreleasedReturnValue();
            error = self->_error;
            self->_error = v25;

            break;
          }
        }
      }
      buf = time1;
    }
    -[AVSampleBufferRenderSynchronizer removeTimeObserver:](self->_synchronizer, "removeTimeObserver:", v13, v31);
    noRemainTasks = self->_noRemainTasks;
    self->_noRemainTasks = 0;

    -[VSAudioPlaybackServiceAVSBAR stop](self, "stop");
  }
  else
  {
    pthread_mutex_unlock(&self->_stateLock);
    VSGetLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_error_impl(&dword_21AA84000, v4, OS_LOG_TYPE_ERROR, "#AVSBAR already stopped or waiting for finish", (uint8_t *)&buf, 2u);
    }
  }

}

- (void)stopWaiting
{
  OS_dispatch_semaphore *noRemainTasks;
  OS_dispatch_semaphore *v4;
  OS_dispatch_semaphore *dsema;

  dsema = self->_noRemainTasks;
  noRemainTasks = self->_noRemainTasks;
  self->_noRemainTasks = 0;

  v4 = dsema;
  if (dsema)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)dsema);
    v4 = dsema;
  }

}

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  AVSampleBufferRenderSynchronizer *synchronizer;
  Float64 Seconds;
  AVSampleBufferRenderSynchronizer *v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  float v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[5];
  CMTime time;
  uint8_t buf[16];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEFAULT, "Stopping synchronizer and renderer", buf, 2u);
  }

  pthread_mutex_lock(&self->_stateLock);
  self->_state = 4;
  pthread_mutex_unlock(&self->_stateLock);
  -[VSAudioPlaybackServiceAVSBAR stopWaiting](self, "stopWaiting");
  -[AVSampleBufferAudioRenderer stopRequestingMediaData](self->_renderer, "stopRequestingMediaData");
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    synchronizer = self->_synchronizer;
    if (synchronizer)
      -[AVSampleBufferRenderSynchronizer currentTime](synchronizer, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    *(_DWORD *)buf = 134217984;
    *(Float64 *)&buf[4] = Seconds;
    _os_log_impl(&dword_21AA84000, v4, OS_LOG_TYPE_DEFAULT, "#AVSBAR synchronizer.rate will be set to 0 and time set to 0 (from current time: %f). Then renderer will be flushed.", buf, 0xCu);
  }

  mach_absolute_time();
  v7 = self->_synchronizer;
  *(_OWORD *)buf = *MEMORY[0x24BDC0D88];
  HIDWORD(v8) = *(_DWORD *)&buf[4];
  v18 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  LODWORD(v8) = 0;
  -[AVSampleBufferRenderSynchronizer setRate:time:](v7, "setRate:time:", buf, v8);
  mach_absolute_time();
  VSAbsoluteTimeToSecond();
  if (v9 > 0.25)
  {
    VSGetLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      VSAbsoluteTimeToSecond();
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v14;
      _os_log_error_impl(&dword_21AA84000, v10, OS_LOG_TYPE_ERROR, "_synchronizer stop rate high latency: %.3f sec", buf, 0xCu);
    }

  }
  VSGetLogDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[AVSampleBufferRenderSynchronizer rate](self->_synchronizer, "rate");
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v12;
    _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_INFO, "#AVSBAR synchronizer.rate was set to 0. Current rate: %f", buf, 0xCu);
  }

  dispatch_get_global_queue(33, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __36__VSAudioPlaybackServiceAVSBAR_stop__block_invoke;
  v15[3] = &unk_24DD8EBB0;
  v15[4] = self;
  dispatch_async(v13, v15);

}

- (void)pause
{
  NSObject *v3;
  NSObject *v4;
  AVSampleBufferRenderSynchronizer *synchronizer;
  Float64 Seconds;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  CMTime time;
  uint8_t buf[4];
  Float64 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEFAULT, "Pausing synchronizer", buf, 2u);
  }

  pthread_mutex_lock(&self->_stateLock);
  self->_state = 1;
  pthread_mutex_unlock(&self->_stateLock);
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    synchronizer = self->_synchronizer;
    if (synchronizer)
      -[AVSampleBufferRenderSynchronizer currentTime](synchronizer, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    *(_DWORD *)buf = 134217984;
    v13 = Seconds;
    _os_log_impl(&dword_21AA84000, v4, OS_LOG_TYPE_DEFAULT, "#AVSBAR synchronizer.rate will be set to 0 (at current time: %f).", buf, 0xCu);
  }

  mach_absolute_time();
  LODWORD(v7) = 0;
  -[AVSampleBufferRenderSynchronizer setRate:](self->_synchronizer, "setRate:", v7);
  mach_absolute_time();
  VSAbsoluteTimeToSecond();
  if (v8 > 0.25)
  {
    VSGetLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      VSAbsoluteTimeToSecond();
      *(_DWORD *)buf = 134217984;
      v13 = v10;
      _os_log_error_impl(&dword_21AA84000, v9, OS_LOG_TYPE_ERROR, "_synchronizer pause rate high latency: %.3f sec", buf, 0xCu);
    }

  }
}

- (void)freeAudioQueue
{
  _opaque_pthread_mutex_t *p_audioQueueBufferLock;
  NSObject *v4;
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_audioQueueBufferLock = &self->_audioQueueBufferLock;
  pthread_mutex_lock(&self->_audioQueueBufferLock);
  if (-[NSMutableArray count](self->_enqueuedMappedAudioInfo, "count"))
  {
    VSGetLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSMutableArray count](self->_enqueuedMappedAudioInfo, "count");
      *(_DWORD *)buf = 134217984;
      v18 = v5;
      _os_log_impl(&dword_21AA84000, v4, OS_LOG_TYPE_DEFAULT, "#AVSBAR Dropping %lu enqueued data", buf, 0xCu);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_enqueuedMappedAudioInfo;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(const void **)(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10) + 8);
          if (v11)
            CFRelease(v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[NSMutableArray removeAllObjects](self->_enqueuedMappedAudioInfo, "removeAllObjects", (_QWORD)v12);
  }
  pthread_mutex_unlock(p_audioQueueBufferLock);
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  AVSampleBufferRenderSynchronizer *synchronizer;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  synchronizer = self->_synchronizer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke_2;
  v13[3] = &unk_24DD8E238;
  objc_copyWeak(&v16, &location);
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  -[AVSampleBufferRenderSynchronizer addBoundaryTimeObserverForTimes:queue:usingBlock:](synchronizer, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v9, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

- (void)removeTimeObserver:(id)a3
{
  if (a3)
    -[AVSampleBufferRenderSynchronizer removeTimeObserver:](self->_synchronizer, "removeTimeObserver:");
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  int v7;
  int v8;

  -[AVSampleBufferAudioRenderer volume](self->_renderer, "volume");
  *(_DWORD *)a3 = v7;
  -[AVSampleBufferAudioRenderer volume](self->_renderer, "volume");
  *(_DWORD *)a4 = v8;
  return 1;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[3].mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[3].mBitsPerChannel;
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

- (_opaque_pthread_mutex_t)audioQueueBufferLock
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].__opaque[40];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[2].__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[3].__opaque[8];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[3].__sig;
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setAudioQueueBufferLock:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_audioQueueBufferLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_audioQueueBufferLock.__opaque[40] = v5;
  *(_OWORD *)&self->_audioQueueBufferLock.__sig = v3;
  *(_OWORD *)&self->_audioQueueBufferLock.__opaque[8] = v4;
}

- (AVSampleBufferAudioRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (AVSampleBufferRenderSynchronizer)synchronizer
{
  return self->_synchronizer;
}

- (void)setSynchronizer:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizer, a3);
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void)setDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataQueue, a3);
}

- (_opaque_pthread_mutex_t)stateLock
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[3].__opaque[40];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[3].__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[4].__opaque[8];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[4].__sig;
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setStateLock:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_stateLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_stateLock.__opaque[40] = v5;
  *(_OWORD *)&self->_stateLock.__sig = v3;
  *(_OWORD *)&self->_stateLock.__opaque[8] = v4;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mappedAudioQueuedTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setMappedAudioQueuedTimeStamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_mappedAudioQueuedTimeStamp.epoch = a3->var3;
  *(_OWORD *)&self->_mappedAudioQueuedTimeStamp.value = v3;
}

- (double)rendererEnqueuedAudioDuration
{
  return self->_rendererEnqueuedAudioDuration;
}

- (void)setRendererEnqueuedAudioDuration:(double)a3
{
  self->_rendererEnqueuedAudioDuration = a3;
}

- (NSString)outputRoute
{
  return self->_outputRoute;
}

- (void)setOutputRoute:(id)a3
{
  objc_storeStrong((id *)&self->_outputRoute, a3);
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

- (BOOL)startedProvidingData
{
  return self->_startedProvidingData;
}

- (void)setStartedProvidingData:(BOOL)a3
{
  self->_startedProvidingData = a3;
}

- (OS_dispatch_semaphore)noRemainTasks
{
  return self->_noRemainTasks;
}

- (void)setNoRemainTasks:(id)a3
{
  objc_storeStrong((id *)&self->_noRemainTasks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noRemainTasks, 0);
  objc_storeStrong((id *)&self->_enqueuedMappedAudioInfo, 0);
  objc_storeStrong((id *)&self->_mappedData, 0);
  objc_storeStrong((id *)&self->_outputRoute, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_synchronizer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

void __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0uLL;
    v11 = 0;
    v4 = (void *)*((_QWORD *)WeakRetained + 4);
    if (v4)
      objc_msgSend(v4, "currentTime");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke_3;
    v6[3] = &unk_24DD8E210;
    v8 = v10;
    v9 = v11;
    v5 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v6);

  }
}

void __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void (*v8)(void);
  CMTime v9;
  CMTime time1;
  CMTime v11;

  v6 = a2;
  v7 = v6;
  memset(&v11, 0, sizeof(v11));
  if (v6)
    objc_msgSend(v6, "CMTimeValue");
  time1 = v11;
  v9 = *(CMTime *)(a1 + 40);
  if (CMTimeCompare(&time1, &v9) <= 0)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    time1 = v11;
    v8();
    *a4 = 1;
  }

}

uint64_t __75__VSAudioPlaybackServiceAVSBAR_addBoundaryTimeObserverForTimes_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  CMTime v9;
  CMTime time1;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5)
      goto LABEL_3;
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  objc_msgSend(v4, "CMTimeValue");
  if (!v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "CMTimeValue");
LABEL_6:
  v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

void __36__VSAudioPlaybackServiceAVSBAR_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "flush");
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21AA84000, v2, OS_LOG_TYPE_INFO, "#AVSBAR renderer was flushed", v3, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  if (sLastSynchronizer == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    sLastSynchronizerStartedProvidingData = 0;
}

uint64_t __44__VSAudioPlaybackServiceAVSBAR_flushAndStop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "provideMoreData");
}

intptr_t __44__VSAudioPlaybackServiceAVSBAR_flushAndStop__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21AA84000, v2, OS_LOG_TYPE_INFO, "#AVSBAR Synchronizer reached endTime", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__VSAudioPlaybackServiceAVSBAR__startProvidingData__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "provideMoreData");

}

void __37__VSAudioPlaybackServiceAVSBAR__play__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  float v8;
  double v9;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 4 || objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    VSGetLogDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_21AA84000, v2, OS_LOG_TYPE_INFO, "#AVSBAR already stopped or paused: will not resume rate", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 32), "synchronizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = 1.0;
    objc_msgSend(v3, "setRate:", v4);

    mach_absolute_time();
    VSAbsoluteTimeToSecond();
    if (v5 > 0.25)
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        VSAbsoluteTimeToSecond();
        v10 = 134217984;
        v11 = v9;
        _os_log_error_impl(&dword_21AA84000, v6, OS_LOG_TYPE_ERROR, "_synchronizer play rate high latency: %.3f sec", (uint8_t *)&v10, 0xCu);
      }

    }
    VSGetLogDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "synchronizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rate");
      v10 = 134217984;
      v11 = v8;
      _os_log_impl(&dword_21AA84000, v2, OS_LOG_TYPE_INFO, "#AVSBAR synchronizer.rate was set to 1. Current rate: %f", (uint8_t *)&v10, 0xCu);

    }
  }

}

@end
