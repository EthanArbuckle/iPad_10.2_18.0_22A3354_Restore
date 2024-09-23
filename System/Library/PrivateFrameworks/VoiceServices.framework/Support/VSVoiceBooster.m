@implementation VSVoiceBooster

- (VSVoiceBooster)initWithStreamDescription:(AudioStreamBasicDescription *)a3 pcmBufferSize:(unint64_t)a4
{
  VSVoiceBooster *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VSVoiceBooster;
  result = -[VSVoiceBooster init](&v9, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a3->mSampleRate;
    v8 = *(_OWORD *)&a3->mBytesPerPacket;
    *(_QWORD *)&result->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
    *(_OWORD *)&result->_asbd.mSampleRate = v7;
    *(_OWORD *)&result->_asbd.mBytesPerPacket = v8;
    result->_pcmBufferSize = a4;
    result->_audioTimeStamp.mFlags = 2;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[VSVoiceBooster uninitialize](self, "uninitialize");
  v3.receiver = self;
  v3.super_class = (Class)VSVoiceBooster;
  -[VSVoiceBooster dealloc](&v3, sel_dealloc);
}

- (BOOL)initialize
{
  AudioStreamBasicDescription *p_asbd;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  AudioComponentDescription *p_buf;
  OpaqueAudioComponent *Next;
  OpaqueAudioComponentInstance **p_voiceBoostUnit;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  UInt32 inData;
  AudioStreamBasicDescription inDestinationFormat;
  int v28;
  void *v29;
  AudioComponentDescription buf;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  p_asbd = &self->_asbd;
  v4 = *(_OWORD *)&self->_asbd.mBytesPerPacket;
  *(_OWORD *)&inDestinationFormat.mSampleRate = *(_OWORD *)&self->_asbd.mSampleRate;
  *(_OWORD *)&inDestinationFormat.mBytesPerPacket = v4;
  *(_QWORD *)&inDestinationFormat.mBitsPerChannel = *(_QWORD *)&self->_asbd.mBitsPerChannel;
  *(_QWORD *)&inDestinationFormat.mFormatFlags = 0x400000029;
  inDestinationFormat.mBytesPerFrame = 4;
  inDestinationFormat.mBitsPerChannel = 32;
  v5 = AudioConverterNew(&self->_asbd, &inDestinationFormat, &self->_floatConverter);
  if ((_DWORD)v5)
  {
    v6 = v5;
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      buf.componentType = 138412290;
      *(_QWORD *)&buf.componentSubType = v8;
      v9 = "Error AudioUnitSetProperty _floatConverter %@";
LABEL_7:
      p_buf = &buf;
LABEL_8:
      _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, v9, (uint8_t *)p_buf, 0xCu);

    }
  }
  else
  {
    v10 = AudioConverterNew(&inDestinationFormat, p_asbd, &self->_integerConverter);
    if (!(_DWORD)v10)
    {
      BYTE1(buf.componentFlags) = 0;
      HIWORD(buf.componentFlags) = 0;
      buf.componentFlagsMask = 0;
      strcpy((char *)&buf, "xfuakrfclppa");
      Next = AudioComponentFindNext(0, &buf);
      p_voiceBoostUnit = &self->_voiceBoostUnit;
      v15 = AudioComponentInstanceNew(Next, &self->_voiceBoostUnit);
      if ((_DWORD)v15)
      {
        v16 = v15;
        VSGetLogDefault();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412290;
        v29 = v8;
        v9 = "Error AudioComponentInstanceNew _voiceBoostUnit %@";
      }
      else
      {
        inData = LODWORD(self->_pcmBufferSize) / self->_asbd.mBytesPerFrame;
        v17 = AudioUnitSetProperty(self->_voiceBoostUnit, 0xEu, 0, 0, &inData, 4u);
        if ((_DWORD)v17)
        {
          v18 = v17;
          VSGetLogDefault();
          v7 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138412290;
          v29 = v8;
          v9 = "Error AudioUnitSetProperty _voiceBoostUnit, kAudioUnitProperty_MaximumFramesPerSlice %@";
        }
        else
        {
          v19 = AudioUnitSetProperty(*p_voiceBoostUnit, 8u, 1u, 0, &inDestinationFormat, 0x28u);
          if ((_DWORD)v19)
          {
            v20 = v19;
            VSGetLogDefault();
            v7 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
              goto LABEL_23;
            objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v20);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 138412290;
            v29 = v8;
            v9 = "Error AudioUnitSetProperty _voiceBoostUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Input %@";
          }
          else
          {
            v21 = AudioUnitSetProperty(*p_voiceBoostUnit, 8u, 2u, 0, &inDestinationFormat, 0x28u);
            if ((_DWORD)v21)
            {
              v22 = v21;
              VSGetLogDefault();
              v7 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
                goto LABEL_23;
              objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v22);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = 138412290;
              v29 = v8;
              v9 = "Error AudioUnitSetProperty _voiceBoostUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Output, %@";
            }
            else
            {
              v23 = AudioUnitInitialize(*p_voiceBoostUnit);
              if (!(_DWORD)v23)
                return 1;
              v24 = v23;
              VSGetLogDefault();
              v7 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
                goto LABEL_23;
              objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v24);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = 138412290;
              v29 = v8;
              v9 = "Error AudioUnitInitialize _voiceBoostUnit %@";
            }
          }
        }
      }
      p_buf = (AudioComponentDescription *)&v28;
      goto LABEL_8;
    }
    v11 = v10;
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      buf.componentType = 138412290;
      *(_QWORD *)&buf.componentSubType = v8;
      v9 = "Error AudioUnitSetProperty _integerConverter %@";
      goto LABEL_7;
    }
  }
LABEL_23:

  return 0;
}

- (void)uninitialize
{
  OpaqueAudioConverter *floatConverter;
  OpaqueAudioConverter *integerConverter;
  OpaqueAudioComponentInstance *voiceBoostUnit;

  floatConverter = self->_floatConverter;
  if (floatConverter)
  {
    AudioConverterDispose(floatConverter);
    self->_floatConverter = 0;
  }
  integerConverter = self->_integerConverter;
  if (integerConverter)
  {
    AudioConverterDispose(integerConverter);
    self->_integerConverter = 0;
  }
  voiceBoostUnit = self->_voiceBoostUnit;
  if (voiceBoostUnit)
  {
    AudioComponentInstanceDispose(voiceBoostUnit);
    self->_voiceBoostUnit = 0;
  }
}

- (void)setVoiceBoostGainDecibels:(float)a3
{
  OpaqueAudioComponentInstance *voiceBoostUnit;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_voiceBoostGainDecibels != a3)
  {
    voiceBoostUnit = self->_voiceBoostUnit;
    if (!voiceBoostUnit)
    {
      if (!-[VSVoiceBooster initialize](self, "initialize"))
      {
        -[VSVoiceBooster uninitialize](self, "uninitialize");
        return;
      }
      voiceBoostUnit = self->_voiceBoostUnit;
    }
    v6 = AudioUnitSetParameter(voiceBoostUnit, 2u, 0, 0, a3, 0);
    if ((_DWORD)v6)
    {
      v7 = v6;
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_error_impl(&dword_21AA84000, v8, OS_LOG_TYPE_ERROR, "Error AudioUnitSetParameter %@", (uint8_t *)&v10, 0xCu);

      }
    }
    else
    {
      self->_voiceBoostGainDecibels = a3;
    }
  }
}

- (id)processData:(id)a3
{
  id v4;
  float v5;
  void *v6;
  UInt32 v8;
  UInt32 mBytesPerFrame;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  UInt32 v14;
  UInt32 v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  AudioBufferList v26;
  AudioBufferList inInputData;
  int v28;
  int v29;
  unsigned int v30;
  AudioUnitRenderActionFlags ioActionFlags;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_voiceBoostUnit
    && (-[VSVoiceBooster voiceBoostGainDecibels](self, "voiceBoostGainDecibels"), v5 != 0.0)
    && objc_msgSend(v4, "length")
    && (ioActionFlags = 512,
        v8 = objc_msgSend(v4, "length"),
        mBytesPerFrame = self->_asbd.mBytesPerFrame,
        v10 = -[VSVoiceBooster pcmBufferSize](self, "pcmBufferSize"),
        -[VSVoiceBooster asbd](self, "asbd"),
        mBytesPerFrame <= v8))
  {
    v11 = 0;
    v12 = v8 / mBytesPerFrame;
    v13 = v10 / v30;
    while (1)
    {
      if (v12 - v11 >= v13)
        v14 = v13;
      else
        v14 = v12 - v11;
      -[VSVoiceBooster asbd](self, "asbd");
      v15 = v29 * v14;
      -[VSVoiceBooster asbd](self, "asbd");
      v16 = v28 * v11;
      *(&inInputData.mNumberBuffers + 1) = 0;
      inInputData.mBuffers[0].mData = 0;
      inInputData.mNumberBuffers = 1;
      inInputData.mBuffers[0].mNumberChannels = 1;
      inInputData.mBuffers[0].mDataByteSize = v15;
      inInputData.mBuffers[0].mData = (void *)(objc_msgSend(objc_retainAutorelease(v4), "mutableBytes") + v16);
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 2 * v15, 1, 1, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26.mBuffers[0].mDataByteSize = objc_msgSend(v17, "length");
      v18 = objc_retainAutorelease(v17);
      v26.mBuffers[0].mData = (void *)objc_msgSend(v18, "mutableBytes");
      v19 = AudioConverterConvertComplexBuffer(self->_floatConverter, v14, &inInputData, &v26);
      if ((_DWORD)v19)
      {
        v22 = v19;
        VSGetLogDefault();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v24;
        v25 = "Error AudioConverterConvertComplexBuffer _floatConverter %@";
        goto LABEL_23;
      }
      v20 = AudioUnitProcess(self->_voiceBoostUnit, &ioActionFlags, &self->_audioTimeStamp, v14, &v26);
      if ((_DWORD)v20)
      {
        v22 = v20;
        VSGetLogDefault();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v24;
        v25 = "Error AudioUnitProcess _voiceBoostUnit %@";
        goto LABEL_23;
      }
      v21 = AudioConverterConvertComplexBuffer(self->_integerConverter, v14, &v26, &inInputData);
      if ((_DWORD)v21)
        break;
      v11 += v14;
      self->_audioTimeStamp.mSampleTime = self->_audioTimeStamp.mSampleTime + (double)v14;

      if (v11 >= v12)
        goto LABEL_3;
    }
    v22 = v21;
    VSGetLogDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v24;
    v25 = "Error AudioConverterConvertComplexBuffer _integerConverter %@";
LABEL_23:
    _os_log_error_impl(&dword_21AA84000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

LABEL_21:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], (int)v22, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_3:
    v6 = 0;
  }

  return v6;
}

- (float)voiceBoostGainDecibels
{
  return self->_voiceBoostGainDecibels;
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

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
}

- (unint64_t)pcmBufferSize
{
  return self->_pcmBufferSize;
}

- (void)setPcmBufferSize:(unint64_t)a3
{
  self->_pcmBufferSize = a3;
}

- (OpaqueAudioConverter)floatConverter
{
  return self->_floatConverter;
}

- (void)setFloatConverter:(OpaqueAudioConverter *)a3
{
  self->_floatConverter = a3;
}

- (OpaqueAudioConverter)integerConverter
{
  return self->_integerConverter;
}

- (void)setIntegerConverter:(OpaqueAudioConverter *)a3
{
  self->_integerConverter = a3;
}

- (OpaqueAudioComponentInstance)voiceBoostUnit
{
  return self->_voiceBoostUnit;
}

- (void)setVoiceBoostUnit:(OpaqueAudioComponentInstance *)a3
{
  self->_voiceBoostUnit = a3;
}

- (AudioTimeStamp)audioTimeStamp
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].mSMPTETime.mType;
  *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)&self[1].mWordClockTime;
  *(_OWORD *)&retstr->mRateScalar = v3;
  v4 = *(_OWORD *)&self[2].mHostTime;
  *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)&self[1].mFlags;
  *(_OWORD *)&retstr->mSMPTETime.mHours = v4;
  return self;
}

- (void)setAudioTimeStamp:(AudioTimeStamp *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->mSampleTime;
  v4 = *(_OWORD *)&a3->mRateScalar;
  v5 = *(_OWORD *)&a3->mSMPTETime.mSubframes;
  *(_OWORD *)&self->_audioTimeStamp.mSMPTETime.mHours = *(_OWORD *)&a3->mSMPTETime.mHours;
  *(_OWORD *)&self->_audioTimeStamp.mSMPTETime.mSubframes = v5;
  *(_OWORD *)&self->_audioTimeStamp.mRateScalar = v4;
  *(_OWORD *)&self->_audioTimeStamp.mSampleTime = v3;
}

@end
