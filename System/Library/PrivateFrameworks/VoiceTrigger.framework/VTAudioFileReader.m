@implementation VTAudioFileReader

- (VTAudioFileReader)initWithURL:(id)a3
{
  const __CFURL *v4;
  VTAudioFileReader *v5;
  VTAudioFileReader *v6;
  OSStatus v7;
  OSStatus v8;
  NSObject *v9;
  VTAudioFileReader *v10;
  objc_super v12;
  uint8_t buf[4];
  const __CFURL *v14;
  __int16 v15;
  OSStatus v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFURL *)a3;
  v12.receiver = self;
  v12.super_class = (Class)VTAudioFileReader;
  v5 = -[VTAudioFileReader init](&v12, sel_init);
  v6 = v5;
  if (v5 && (v7 = ExtAudioFileOpenURL(v4, &v5->_fFile)) != 0)
  {
    v8 = v7;
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 1024;
      v16 = v8;
      _os_log_error_impl(&dword_20D965000, v9, OS_LOG_TYPE_ERROR, "::: Error reading file %@, err: %d", buf, 0x12u);
    }
    v10 = 0;
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[VTAudioFileReader close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)VTAudioFileReader;
  -[VTAudioFileReader dealloc](&v3, sel_dealloc);
}

- (id)readSamples:(unint64_t)a3
{
  unint64_t v4;
  id v5;
  OSStatus v6;
  UInt32 v7;
  BOOL v8;
  OSStatus v9;
  NSObject *v10;
  UInt32 ioNumberFrames;
  AudioBufferList ioData;
  uint8_t buf[4];
  UInt32 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = 2 * a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 2 * a3);
  *(_QWORD *)&ioData.mNumberBuffers = 1;
  ioData.mBuffers[0].mNumberChannels = 1;
  ioData.mBuffers[0].mDataByteSize = v4;
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  ioData.mBuffers[0].mData = (void *)objc_msgSend(v5, "bytes");
  ioNumberFrames = v4;
  v6 = ExtAudioFileRead(self->_fFile, &ioNumberFrames, &ioData);
  v7 = ioNumberFrames;
  if (v6)
    v8 = 1;
  else
    v8 = ioNumberFrames == 0;
  if (v8)
  {
    v9 = v6;
    v10 = VTLogContextFacilityVoiceTrigger;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v15 = v9;
        _os_log_error_impl(&dword_20D965000, v10, OS_LOG_TYPE_ERROR, "::: Error reading data from audio file : %d", buf, 8u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v15 = v7;
        _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "Reach to EOF: appending digital zero, chunkSize = %d", buf, 8u);
      }
      bzero((void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v4);
    }
  }
  return v5;
}

- (void)close
{
  OpaqueExtAudioFile *fFile;

  fFile = self->_fFile;
  if (fFile)
    ExtAudioFileDispose(fFile);
}

@end
