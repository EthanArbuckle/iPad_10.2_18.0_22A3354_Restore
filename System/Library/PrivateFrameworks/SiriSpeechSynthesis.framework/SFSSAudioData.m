@implementation SFSSAudioData

- (SFSSAudioData)initWithASBD:(AudioStreamBasicDescription *)a3 rawData:(id)a4
{
  id v6;
  SFSSAudioData *v7;
  SFSSAudioData *v8;
  __int128 v9;
  __int128 v10;
  AudioFormatID mFormatID;
  SFSSAudioData *v12;
  NSObject *v13;
  AudioFormatID v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  AudioFormatID v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SFSSAudioData;
  v7 = -[SFSSAudioData init](&v19, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_6;
  v10 = *(_OWORD *)&a3->mSampleRate;
  v9 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&v7->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&v7->_asbd.mSampleRate = v10;
  *(_OWORD *)&v7->_asbd.mBytesPerPacket = v9;
  mFormatID = v7->_asbd.mFormatID;
  if (mFormatID == 1869641075)
  {
    if (-[SFSSAudioData populateWithOpusData:](v7, "populateWithOpusData:", v6))
      goto LABEL_6;
    SFSSGetLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SFSSAudioData initWithASBD:rawData:]";
      v15 = "%s, invalid opus data";
      v16 = v13;
      v17 = 12;
      goto LABEL_13;
    }
LABEL_10:

    v12 = 0;
    goto LABEL_11;
  }
  if (mFormatID != 1819304813)
  {
    SFSSGetLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v8->_asbd.mFormatID;
      *(_DWORD *)buf = 136315394;
      v21 = "-[SFSSAudioData initWithASBD:rawData:]";
      v22 = 1024;
      v23 = v14;
      v15 = "%s, Unknown format: %d";
      v16 = v13;
      v17 = 18;
LABEL_13:
      _os_log_error_impl(&dword_21E284000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  -[SFSSAudioData populateWithPCMData:](v7, "populateWithPCMData:", v6);
LABEL_6:
  v12 = v8;
LABEL_11:

  return v12;
}

- (BOOL)populateWithPCMData:(id)a3
{
  -[SFSSAudioData setAudioData:](self, "setAudioData:", a3);
  -[SFSSAudioData setPacketCount:](self, "setPacketCount:", 0);
  -[SFSSAudioData setPacketDescriptions:](self, "setPacketDescriptions:", 0);
  return 1;
}

- (BOOL)populateWithOpusData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  NSObject *v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "length");
  v8 = objc_retainAutorelease(v4);
  v9 = objc_msgSend(v8, "bytes");
  if (v7)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      LODWORD(v13) = 0;
      do
      {
        v14 = *(_BYTE *)(v10 + v11);
        v13 = v14 & 0x7Fu | ((_DWORD)v13 << 7);
        ++v11;
      }
      while (v14 < 0);
      if (!(_DWORD)v13)
        break;
      v15 = v11 + v13;
      if (v15 > v7)
        break;
      v19 = objc_msgSend(v5, "length", 0, 0);
      LODWORD(v20) = 0;
      HIDWORD(v20) = v13;
      objc_msgSend(v6, "appendBytes:length:", &v19, 16);
      objc_msgSend(v5, "appendBytes:length:", v10 + v11, v13);
      ++v12;
      v11 += v13;
      if (v15 >= v7)
        goto LABEL_13;
    }
    SFSSGetLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v19) = 67109632;
      HIDWORD(v19) = v13;
      LOWORD(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 2) = v11;
      HIWORD(v20) = 1024;
      v21 = v7;
      _os_log_error_impl(&dword_21E284000, v16, OS_LOG_TYPE_ERROR, "Invalid chunk size: %d at offset %d, bytes count = %d\n", (uint8_t *)&v19, 0x14u);
    }

    v17 = 0;
  }
  else
  {
    v12 = 0;
LABEL_13:
    -[SFSSAudioData setPacketCount:](self, "setPacketCount:", v12);
    -[SFSSAudioData setPacketDescriptions:](self, "setPacketDescriptions:", v6);
    -[SFSSAudioData setAudioData:](self, "setAudioData:", v5);
    v17 = 1;
  }

  return v17;
}

- (double)duration
{
  unint64_t v3;
  double v4;
  void *v5;
  double v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  double v12;
  int v13;
  double v14;
  int v15;
  int v16;
  double v17;
  int v18;
  double v19;
  int v20;

  -[SFSSAudioData asbd](self, "asbd");
  if (v20 == 1819304813)
  {
    -[SFSSAudioData asbd](self, "asbd");
    -[SFSSAudioData asbd](self, "asbd");
    LODWORD(v3) = v18;
    v4 = 0.0;
    if (v19 * (double)v3 != 0.0)
    {
      -[SFSSAudioData audioData](self, "audioData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (double)(unint64_t)objc_msgSend(v5, "length");
      -[SFSSAudioData asbd](self, "asbd");
      -[SFSSAudioData asbd](self, "asbd");
      LODWORD(v7) = v16;
      v4 = v6 / (v17 * (double)v7);

    }
  }
  else
  {
    -[SFSSAudioData asbd](self, "asbd");
    v4 = 0.0;
    if (v15 == 1869641075)
    {
      -[SFSSAudioData asbd](self, "asbd");
      if (v14 != 0.0)
      {
        v8 = (double)-[SFSSAudioData packetCount](self, "packetCount", v14);
        -[SFSSAudioData asbd](self, "asbd");
        LODWORD(v9) = v13;
        v10 = v8 * (double)v9;
        -[SFSSAudioData asbd](self, "asbd");
        return v10 / v12;
      }
    }
  }
  return v4;
}

- (NSData)audioData
{
  return self->_audioData;
}

- (void)setAudioData:(id)a3
{
  objc_storeStrong((id *)&self->_audioData, a3);
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[1].mBytesPerFrame;
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

- (int64_t)packetCount
{
  return self->_packetCount;
}

- (void)setPacketCount:(int64_t)a3
{
  self->_packetCount = a3;
}

- (NSData)packetDescriptions
{
  return self->_packetDescriptions;
}

- (void)setPacketDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_packetDescriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetDescriptions, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
}

@end
