@implementation _LTAudioData

- (_LTAudioData)initWithASBD:(AudioStreamBasicDescription *)a3 rawData:(id)a4 wordTimingInfo:(id)a5
{
  id v9;
  id v10;
  char *v11;
  id *v12;
  __int128 v13;
  __int128 v14;
  AudioFormatID mFormatID;
  id v16;
  _LTAudioData *v17;
  objc_super v19;

  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_LTAudioData;
  v11 = -[_LTAudioData init](&v19, sel_init);
  v12 = (id *)v11;
  if (!v11)
    goto LABEL_7;
  v13 = *(_OWORD *)&a3->mSampleRate;
  v14 = *(_OWORD *)&a3->mBytesPerPacket;
  *((_QWORD *)v11 + 5) = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)(v11 + 24) = v14;
  *(_OWORD *)(v11 + 8) = v13;
  objc_storeStrong((id *)v11 + 6, a4);
  objc_storeStrong(v12 + 9, a5);
  mFormatID = a3->mFormatID;
  if (mFormatID != 1869641075)
  {
    if (mFormatID == 1819304813)
    {
      v16 = v12[8];
      v12[7] = 0;
      v12[8] = 0;

    }
    goto LABEL_6;
  }
  if (!objc_msgSend(v12, "_populateWithOpusData:", v9))
  {
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
LABEL_6:
  v17 = v12;
LABEL_8:

  return v17;
}

- (BOOL)_populateWithOpusData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  NSObject *v17;
  void *v18;
  BOOL v19;
  id v21;
  uint8_t buf[8];
  uint64_t v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "length");
  v21 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v21, "bytes");
  if (v7)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = 0;
      LODWORD(v13) = 0;
      do
      {
        v14 = *(_BYTE *)(v9 + v11 + v12);
        v13 = v14 & 0x7Fu | ((_DWORD)v13 << 7);
        ++v12;
      }
      while (v14 < 0);
      v15 = v11 + v13 + v12;
      if (!(_DWORD)v13 || v15 > v7)
        break;
      *(_QWORD *)buf = 0;
      v23 = 0;
      *(_QWORD *)buf = objc_msgSend(v5, "length");
      LODWORD(v23) = 0;
      HIDWORD(v23) = v13;
      objc_msgSend(v6, "appendBytes:length:", buf, 16);
      objc_msgSend(v5, "appendBytes:length:", v9 + v11 + v12, v13);
      ++v10;
      v11 += v13 + v12;
      if (v15 >= v7)
        goto LABEL_15;
    }
    v17 = _LTOSLogSpeech();
    v18 = v21;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v13;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v11 + v12;
      HIWORD(v23) = 1024;
      v24 = v7;
      _os_log_error_impl(&dword_2491B9000, v17, OS_LOG_TYPE_ERROR, "Invalid chunk size: %d at offset %d, bytes count = %d\n", buf, 0x14u);
    }
    v19 = 0;
  }
  else
  {
    v10 = 0;
LABEL_15:
    self->_packetCount = v10;
    objc_storeStrong((id *)&self->_packetDescriptions, v6);
    objc_storeStrong((id *)&self->_rawData, v5);
    v19 = 1;
    v18 = v21;
  }

  return v19;
}

- (void)writeToURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSData *rawData;
  id v12;
  NSObject *v13;
  id v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "fileExistsAtPath:", v7) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      v15 = 0;
      objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v15);
      v8 = v15;
      if (v8)
      {
        v10 = _LTOSLogSpeech();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[_LTAudioData writeToURL:].cold.3();
      }
    }
    rawData = self->_rawData;
    v14 = 0;
    -[NSData writeToURL:options:error:](rawData, "writeToURL:options:error:", v4, 0, &v14);
    v12 = v14;
    if (v12)
    {
      v13 = _LTOSLogSpeech();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_LTAudioData writeToURL:].cold.2();
    }

  }
  else
  {
    v9 = _LTOSLogSpeech();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LTAudioData writeToURL:].cold.1(v9);
  }

}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[1].mSampleRate;
  return self;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (int64_t)packetCount
{
  return self->_packetCount;
}

- (NSData)packetDescriptions
{
  return self->_packetDescriptions;
}

- (NSArray)wordTimingInfo
{
  return self->_wordTimingInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimingInfo, 0);
  objc_storeStrong((id *)&self->_packetDescriptions, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

- (void)writeToURL:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Can't write audio data to URL because URL is nil", v1, 2u);
}

- (void)writeToURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "error %@ writing to url %{private}@");
}

- (void)writeToURL:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "error %@ creating directory at path %{private}@");
}

@end
