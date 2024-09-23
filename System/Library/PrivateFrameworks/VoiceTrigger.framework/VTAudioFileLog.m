@implementation VTAudioFileLog

- (VTAudioFileLog)init
{
  id v2;
  void *v3;
  int v4;
  dispatch_queue_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  VTAudioFileLog *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VTAudioFileLog;
  v2 = -[VTAudioFileLog init](&v11, sel_init);
  if (v2)
  {
    +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileLoggingIsEnabled");

    if (!v4)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v5 = dispatch_queue_create("VTAudioFileLogQueue", 0);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = *((_QWORD *)v2 + 1);
    dispatch_get_global_queue(17, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v7, v8);

    *((_QWORD *)v2 + 3) = 0x40CF400000000000;
    *((_OWORD *)v2 + 2) = xmmword_20DA245E0;
    *((_OWORD *)v2 + 3) = xmmword_20DA245F0;
  }
  v9 = (VTAudioFileLog *)v2;
LABEL_6:

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[VTAudioFileLog _closeAudioFile](self, "_closeAudioFile");
  v3.receiver = self;
  v3.super_class = (Class)VTAudioFileLog;
  -[VTAudioFileLog dealloc](&v3, sel_dealloc);
}

- (void)_closeAudioFile
{
  OpaqueExtAudioFile *audioFile;
  OSStatus v4;
  OSStatus v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  audioFile = self->_audioFile;
  if (audioFile)
  {
    v4 = ExtAudioFileDispose(audioFile);
    if (v4)
    {
      v5 = v4;
      v6 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67240192;
        v7[1] = v5;
        _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "Failure disposing audio file %{public}d", (uint8_t *)v7, 8u);
      }
    }
    self->_audioFile = 0;
  }
}

- (void)startRecording
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__VTAudioFileLog_startRecording__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)appendAudioData:(AudioBuffer)a3
{
  void *mData;
  uint64_t mDataByteSize;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;

  mData = a3.mData;
  mDataByteSize = a3.mDataByteSize;
  v6 = (void *)MEMORY[0x212BACE10](self, a2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", mData, mDataByteSize);
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__VTAudioFileLog_appendAudioData___block_invoke;
  v10[3] = &unk_24C7F4DC0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, v10);

  objc_autoreleasePoolPop(v6);
}

- (void)stopRecording
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__VTAudioFileLog_stopRecording__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __31__VTAudioFileLog_stopRecording__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 64);
    LODWORD(v3) = *(_DWORD *)(v3 + 72);
    v6 = 138543618;
    v7 = v4;
    v8 = 1026;
    v9 = v3;
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "Closing file at URL %{public}@, audio size: %{public}u", (uint8_t *)&v6, 0x12u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_closeAudioFile");
}

void __34__VTAudioFileLog_appendAudioData___block_invoke(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  unsigned int v4;
  UInt32 v5;
  OSStatus v6;
  OSStatus v7;
  NSObject *v8;
  NSObject *v9;
  AudioBufferList v10;
  uint8_t buf[4];
  OSStatus v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "length");
    v3 = *(void **)(a1 + 40);
    v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v10.mBuffers[0].mNumberChannels = 1;
    v5 = v2 / v4;
    v10.mBuffers[0].mDataByteSize = objc_msgSend(v3, "length", 1, *(_QWORD *)&v10.mBuffers[0].mNumberChannels);
    v10.mBuffers[0].mData = (void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    v6 = ExtAudioFileWrite(*(ExtAudioFileRef *)(*(_QWORD *)(a1 + 32) + 16), v5, &v10);
    if (v6)
    {
      v7 = v6;
      v8 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        v12 = v7;
        _os_log_error_impl(&dword_20D965000, v8, OS_LOG_TYPE_ERROR, "Failed writing audio file %{public}d", buf, 8u);
      }
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) += objc_msgSend(*(id *)(a1 + 40), "length");
  }
  else
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10.mNumberBuffers) = 0;
      _os_log_error_impl(&dword_20D965000, v9, OS_LOG_TYPE_ERROR, "No audio file to append data", (uint8_t *)&v10, 2u);
    }
  }
}

void __32__VTAudioFileLog_startRecording__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  OSStatus v10;
  OSStatus v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  OSStatus v17;
  OSStatus v18;
  uint64_t v19;
  _QWORD *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  OSStatus v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_20D965000, v3, OS_LOG_TYPE_ERROR, "Audio file already configured, closing first", (uint8_t *)&v21, 2u);
      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "_closeAudioFile");
  }
  VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_24C7F6FB8, CFSTR("-activation.wav"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v5;

  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v21 = 138543362;
    v22 = v9;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "Creating audio file at URL %{public}@", (uint8_t *)&v21, 0xCu);
  }
  v10 = ExtAudioFileCreateWithURL(*(CFURLRef *)(*(_QWORD *)(a1 + 32) + 64), 0x57415645u, (const AudioStreamBasicDescription *)(*(_QWORD *)(a1 + 32) + 24), 0, 1u, (ExtAudioFileRef *)(*(_QWORD *)(a1 + 32) + 16));
  if (v10)
  {
    v11 = v10;
    v12 = VTLogContextFacilityVoiceTrigger;
    if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v21 = 138543618;
    v22 = v13;
    v23 = 1026;
    v24 = v11;
    v14 = "Failed creating audio file at url %{public}@ %{public}d";
    v15 = v12;
    v16 = 18;
    goto LABEL_16;
  }
  v17 = ExtAudioFileSetProperty(*(ExtAudioFileRef *)(*(_QWORD *)(a1 + 32) + 16), 0x63666D74u, 0x28u, (const void *)(*(_QWORD *)(a1 + 32) + 24));
  if (!v17)
    goto LABEL_14;
  v18 = v17;
  v19 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v21 = 67240192;
    LODWORD(v22) = v18;
    v14 = "Error setting input format %{public}d";
    v15 = v19;
    v16 = 8;
LABEL_16:
    _os_log_error_impl(&dword_20D965000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v21, v16);
  }
LABEL_12:
  v20 = *(_QWORD **)(a1 + 32);
  if (v20[2])
    objc_msgSend(v20, "_closeAudioFile");
LABEL_14:
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4965 != -1)
    dispatch_once(&sharedInstance_onceToken_4965, &__block_literal_global_4966);
  return (id)sharedInstance_sSharedInstance;
}

void __32__VTAudioFileLog_sharedInstance__block_invoke()
{
  VTAudioFileLog *v0;
  void *v1;

  v0 = objc_alloc_init(VTAudioFileLog);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

@end
