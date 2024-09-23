@implementation AudioFileWriter

- (AudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  const __CFURL *v8;
  AudioFileWriter *v9;
  AudioFileWriter *v10;
  OSStatus v11;
  OSStatus v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  const __CFURL *v17;
  __int16 v18;
  OSStatus v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = (const __CFURL *)a3;
  v15.receiver = self;
  v15.super_class = (Class)AudioFileWriter;
  v9 = -[AudioFileWriter init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    a5->mSampleRate = a4->mSampleRate;
    v11 = ExtAudioFileCreateWithURL(v8, 0x57415645u, a5, 0, 1u, &v9->fFile);
    if (v11)
    {
      v12 = v11;
      v13 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v17 = v8;
        v18 = 1026;
        v19 = v12;
        _os_log_error_impl(&dword_20D965000, v13, OS_LOG_TYPE_ERROR, "::: Error creating output file %{public}@, err: %{public}d", buf, 0x12u);
      }
    }
    ExtAudioFileSetProperty(v10->fFile, 0x63666D74u, 0x28u, a4);
    v10->isWriting = 1;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[AudioFileWriter close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)AudioFileWriter;
  -[AudioFileWriter dealloc](&v3, sel_dealloc);
}

- (void)close
{
  OpaqueExtAudioFile *fFile;

  fFile = self->fFile;
  if (fFile)
    ExtAudioFileDispose(fFile);
  self->isWriting = 0;
}

- (signed)addSamples:(void *)a3 len:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v8[8];
  AudioBufferList ioData;
  uint64_t v10;
  uint64_t v11;

  if (a4 >= 1)
  {
    v10 = v4;
    v11 = v5;
    if (self->isWriting)
    {
      *(_QWORD *)&ioData.mNumberBuffers = 1;
      ioData.mBuffers[0].mNumberChannels = 1;
      ioData.mBuffers[0].mDataByteSize = 2 * a4;
      ioData.mBuffers[0].mData = a3;
      if (ExtAudioFileWrite(self->fFile, a4, &ioData))
      {
        v6 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v8 = 0;
          _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "::: Error writing to output wave file.", v8, 2u);
        }
      }
    }
  }
  return 0;
}

@end
