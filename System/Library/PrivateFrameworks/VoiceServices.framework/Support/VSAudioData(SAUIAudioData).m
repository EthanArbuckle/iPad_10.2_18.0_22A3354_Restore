@implementation VSAudioData(SAUIAudioData)

- (uint64_t)populateWithPCMData:()SAUIAudioData
{
  objc_msgSend(a1, "setAudioData:");
  objc_msgSend(a1, "setPacketCount:", 0);
  objc_msgSend(a1, "setPacketDescriptions:", 0);
  return 1;
}

- (uint64_t)populateWithOpusData:()SAUIAudioData
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
  uint64_t v17;
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
    VSGetLogDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v19) = 67109632;
      HIDWORD(v19) = v13;
      LOWORD(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 2) = v11;
      HIWORD(v20) = 1024;
      v21 = v7;
      _os_log_error_impl(&dword_21AA84000, v16, OS_LOG_TYPE_ERROR, "Invalid chunk size: %d at offset %d, bytes count = %d\n", (uint8_t *)&v19, 0x14u);
    }

    v17 = 0;
  }
  else
  {
    v12 = 0;
LABEL_13:
    objc_msgSend(a1, "setPacketCount:", v12);
    objc_msgSend(a1, "setPacketDescriptions:", v6);
    objc_msgSend(a1, "setAudioData:", v5);
    v17 = 1;
  }

  return v17;
}

- (uint64_t)populatePCMDataWithSiriOpusSData:()SAUIAudioData withOpusASBD:
{
  id v6;
  void *v7;
  __int128 v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v26;
  id v27;
  uint8_t buf[16];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEC0DB0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)buf = *(_OWORD *)a4;
  v29 = v8;
  v30 = *(_QWORD *)(a4 + 32);
  v9 = (id)objc_msgSend(v7, "beginChunkDecoderForStreamDescription:", buf);

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "length");
  v12 = objc_retainAutorelease(v6);
  v13 = objc_msgSend(v12, "bytes");
  if (v11)
  {
    v14 = v13;
    v26 = v12;
    v15 = 0;
    LODWORD(v16) = 0;
    while (1)
    {
      do
      {
        v17 = *(_BYTE *)(v14 + v15);
        v16 = v17 & 0x7Fu | ((_DWORD)v16 << 7);
        ++v15;
      }
      while (v17 < 0);
      if (!(_DWORD)v16)
        break;
      v18 = v15 + v16;
      if (v18 > v11)
        break;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v14 + v15, v16);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC0DB0], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend(v20, "decodeChunk:outError:", v19, &v27);
      v16 = objc_claimAutoreleasedReturnValue();
      v21 = v27;

      if (v21)
      {
        VSGetLogDefault();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v21;
          _os_log_error_impl(&dword_21AA84000, v23, OS_LOG_TYPE_ERROR, "Unable to convert OPUS to PCM. %@", buf, 0xCu);
        }

        v12 = v26;
        goto LABEL_16;
      }
      objc_msgSend(v10, "appendData:", v16);

      LODWORD(v16) = 0;
      v15 = v18;
      if (v18 >= v11)
      {
        v22 = 1;
        v12 = v26;
        goto LABEL_17;
      }
    }
    VSGetLogDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    v12 = v26;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v16;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v15;
      *(_WORD *)&buf[14] = 1024;
      LODWORD(v29) = v11;
      _os_log_error_impl(&dword_21AA84000, v19, OS_LOG_TYPE_ERROR, "Invalid chunk size: %d at offset %d, bytes count = %d\n", buf, 0x14u);
    }
LABEL_16:

    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BEC0DB0], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "endChunkDecoding");

  objc_msgSend(a1, "setAudioData:", v10);
  return v22;
}

- (uint64_t)writeToFilePath:()SAUIAudioData
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const __CFURL *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UInt32 ioNumBytes;
  AudioFileID outAudioFile;
  int v24;
  AudioStreamBasicDescription inFormat;
  AudioStreamBasicDescription buf;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "audioData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&inFormat, 0, sizeof(inFormat));
  objc_msgSend(a1, "asbd");
  objc_msgSend(a1, "asbd");
  if (v24 == 1869641075)
  {
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.mSampleRate) = 0;
      _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_INFO, "Decoding opus for dumping.", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BEC0D78], "pcmAudioDataFromOpusAudio:", a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.mSampleRate) = 0;
      _os_log_impl(&dword_21AA84000, v8, OS_LOG_TYPE_INFO, "Opus decoded for dumping.", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(v7, "audioData");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v7, "asbd");
    else
      memset(&buf, 0, sizeof(buf));
    inFormat = buf;

    v5 = (void *)v9;
  }
  outAudioFile = 0;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v11 = AudioFileCreateWithURL(v10, 0x57415645u, &inFormat, 1u, &outAudioFile);
  if ((_DWORD)v11)
  {
    v12 = v11;
    VSGetLogDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.mSampleRate) = 138412546;
      *(_QWORD *)((char *)&buf.mSampleRate + 4) = v4;
      LOWORD(buf.mFormatFlags) = 2112;
      *(_QWORD *)((char *)&buf.mFormatFlags + 2) = v14;
      v15 = "Error AudioFileCreateWithURL: '%@', code: %@";
LABEL_19:
      _os_log_error_impl(&dword_21AA84000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&buf, 0x16u);

    }
  }
  else
  {
    ioNumBytes = objc_msgSend(v5, "length");
    v16 = AudioFileWriteBytes(outAudioFile, 0, 0, &ioNumBytes, (const void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"));
    if ((_DWORD)v16)
    {
      v17 = v16;
      VSGetLogDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.mSampleRate) = 138412546;
        *(_QWORD *)((char *)&buf.mSampleRate + 4) = v4;
        LOWORD(buf.mFormatFlags) = 2112;
        *(_QWORD *)((char *)&buf.mFormatFlags + 2) = v14;
        v15 = "Error AudioFileWriteBytes: '%@', code: %@";
        goto LABEL_19;
      }
    }
    else
    {
      v18 = AudioFileClose(outAudioFile);
      if (!(_DWORD)v18)
      {
        v20 = 1;
        goto LABEL_21;
      }
      v19 = v18;
      VSGetLogDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.mSampleRate) = 138412546;
        *(_QWORD *)((char *)&buf.mSampleRate + 4) = v4;
        LOWORD(buf.mFormatFlags) = 2112;
        *(_QWORD *)((char *)&buf.mFormatFlags + 2) = v14;
        v15 = "Error AudioFileClose: '%@', code: %@";
        goto LABEL_19;
      }
    }
  }

  v20 = 0;
LABEL_21:

  return v20;
}

+ (id)audioDataFromFile:()SAUIAudioData error:
{
  const __CFURL *v5;
  OSStatus v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString **v10;
  uint64_t *v11;
  OSStatus Property;
  OSStatus v13;
  void *v14;
  id v15;
  OSStatus v17;
  void *v18;
  uint64_t v19;
  id v20;
  AudioStreamPacketDescription *v21;
  id v22;
  void *v23;
  OSStatus PacketData;
  void *v25;
  uint64_t v26;
  void *v27;
  _OWORD v28[2];
  uint64_t v29;
  UInt32 ioNumPackets[2];
  UInt32 ioNumBytes[3];
  UInt32 ioDataSize;
  __int128 outPropertyData;
  __int128 v34;
  uint64_t v35;
  AudioFileID outAudioFile;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  outAudioFile = 0;
  v6 = AudioFileOpenURL(v5, kAudioFileReadPermission, 0, &outAudioFile);
  if (v6)
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = v6;
      v45 = *MEMORY[0x24BDD0FD8];
      v46[0] = CFSTR("AudioFileOpenURL");
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = (const __CFString **)v46;
      v11 = &v45;
LABEL_10:
      objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("audioDataFromFile:error:"), v8, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v35 = 0;
    outPropertyData = 0u;
    v34 = 0u;
    ioDataSize = 40;
    Property = AudioFileGetProperty(outAudioFile, 0x64666D74u, &ioDataSize, &outPropertyData);
    if (Property)
    {
      if (a4)
      {
        v7 = (void *)MEMORY[0x24BDD1540];
        v8 = Property;
        v43 = *MEMORY[0x24BDD0FD8];
        v44 = CFSTR("AudioFileGetProperty kAudioFilePropertyDataFormat");
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = &v44;
        v11 = &v43;
        goto LABEL_10;
      }
    }
    else
    {
      *(_QWORD *)ioNumBytes = 0;
      ioDataSize = 8;
      v13 = AudioFileGetProperty(outAudioFile, 0x62636E74u, &ioDataSize, ioNumBytes);
      if (!v13)
      {
        *(_QWORD *)ioNumPackets = 0;
        ioDataSize = 8;
        v17 = AudioFileGetProperty(outAudioFile, 0x70636E74u, &ioDataSize, ioNumPackets);
        if (v17)
        {
          if (!a4)
            goto LABEL_11;
          v18 = (void *)MEMORY[0x24BDD1540];
          v19 = v17;
          v39 = *MEMORY[0x24BDD0FD8];
          v40 = CFSTR("AudioFileGetProperty kAudioFilePropertyAudioDataPacketCount");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("audioDataFromFile:error:"), v19, v20);
          v15 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16 * *(_QWORD *)ioNumPackets);
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v21 = (AudioStreamPacketDescription *)objc_msgSend(v20, "mutableBytes");
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", *(_QWORD *)ioNumBytes);
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = (void *)objc_msgSend(v22, "mutableBytes");
          PacketData = AudioFileReadPacketData(outAudioFile, 0, ioNumBytes, v21, 0, ioNumPackets, v23);
          if (PacketData)
          {
            if (a4)
            {
              v25 = (void *)MEMORY[0x24BDD1540];
              v26 = PacketData;
              v37 = *MEMORY[0x24BDD0FD8];
              v38 = CFSTR("AudioFileGetProperty kAudioFilePropertyAudioDataPacketCount");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("audioDataFromFile:error:"), v26, v27);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            v15 = 0;
          }
          else
          {
            v15 = objc_alloc_init(MEMORY[0x24BEC0D78]);
            v28[0] = outPropertyData;
            v28[1] = v34;
            v29 = v35;
            objc_msgSend(v15, "setAsbd:", v28);
            objc_msgSend(v15, "setAudioData:", v22);
            objc_msgSend(v15, "setPacketCount:", *(_QWORD *)ioNumPackets);
            objc_msgSend(v15, "setPacketDescriptions:", v20);
          }

        }
        goto LABEL_12;
      }
      if (a4)
      {
        v7 = (void *)MEMORY[0x24BDD1540];
        v8 = v13;
        v41 = *MEMORY[0x24BDD0FD8];
        v42 = CFSTR("AudioFileGetProperty kAudioFilePropertyAudioDataByteCount");
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = &v42;
        v11 = &v41;
        goto LABEL_10;
      }
    }
  }
LABEL_11:
  v15 = 0;
LABEL_12:

  return v15;
}

+ (id)audioDataFromSAUIAudioData:()SAUIAudioData
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BEC0D78]);
  v41 = v3;
  objc_msgSend(v3, "decoderStreamDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "formatID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sampleRate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v52 = v37;
    v53 = 2112;
    v54 = v38;
    _os_log_debug_impl(&dword_21AA84000, v6, OS_LOG_TYPE_DEBUG, "decoderStreamDescription formatID: %@, sample rate: %@", buf, 0x16u);

  }
  objc_msgSend(v5, "formatID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v5, "sampleRate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v5, "formatFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  objc_msgSend(v5, "bytesPerPacket");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntValue");

  objc_msgSend(v5, "framesPerPacket");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntValue");

  objc_msgSend(v5, "bytesPerFrame");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntValue");

  objc_msgSend(v5, "channelsPerFrame");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntValue");

  objc_msgSend(v5, "bitsPerChannel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v22, "unsignedIntValue");

  objc_msgSend(v5, "reserved");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedIntValue");

  if (v8 == 1869641075)
  {
    v39 = v21;
    v25 = v19;
    v26 = v17;
    v27 = v15;
    v28 = v13;
    objc_msgSend(v41, "audioBuffer");
    v30 = v4;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v30, "populateWithOpusData:", v33);

    if (!v34)
      goto LABEL_6;
    goto LABEL_8;
  }
  if (v8 == 1819304813)
  {
    v39 = v21;
    v25 = v19;
    v26 = v17;
    v27 = v15;
    v28 = v13;
    objc_msgSend(v41, "audioBuffer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v4;
    v31 = objc_msgSend(v4, "populateWithPCMData:", v29);

    if ((v31 & 1) == 0)
    {
LABEL_6:
      v32 = 0;
LABEL_9:
      v4 = v30;
      goto LABEL_13;
    }
LABEL_8:
    v42 = v11;
    v43 = v8;
    v44 = v28;
    v45 = v27;
    v46 = v26;
    v47 = v25;
    v48 = v39;
    v49 = v40;
    v50 = v24;
    objc_msgSend(v30, "setAsbd:", &v42);
    v32 = v30;
    goto LABEL_9;
  }
  VSGetLogDefault();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v52) = v8;
    _os_log_error_impl(&dword_21AA84000, v35, OS_LOG_TYPE_ERROR, "Unknown server audio format ID: %d", buf, 8u);
  }

  v32 = 0;
LABEL_13:

  return v32;
}

+ (id)audioDataFromPresynthesisRequest:()SAUIAudioData
{
  id v3;
  id v4;
  id v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BEC0D78]);
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  if (v3)
  {
    objc_msgSend(v3, "playerStreamDescription");
    v9 = 0;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(v3, "decoderStreamDescription");
  }
  v5 = 0;

  return v5;
}

+ (id)pcmAudioDataFromOpusAudio:()SAUIAudioData
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0;
  v23 = 0;
  if (objc_msgSend(v3, "packetCount") >= 1)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      objc_msgSend(v3, "packetDescriptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getBytes:range:", &v22, v5, 16);

      v8 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v3, "audioData");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "bytes");
      objc_msgSend(v8, "dataWithBytes:length:", v10 + v22, HIDWORD(v23));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "addObject:", v11);
      ++v6;
      v5 += 16;
    }
    while (objc_msgSend(v3, "packetCount") > v6);
  }
  v12 = objc_alloc_init(MEMORY[0x24BEC0DB0]);
  if (v3)
  {
    objc_msgSend(v3, "asbd");
  }
  else
  {
    v21 = 0;
    memset(v20, 0, sizeof(v20));
  }
  v19 = 0;
  objc_msgSend(v12, "decodeChunks:streamDescription:outError:", v4, v20, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (!v19)
  {
    v14 = objc_alloc_init(MEMORY[0x24BEC0D78]);
    objc_msgSend(v14, "setAudioData:", v13);
    v16 = 0x40E7700000000000;
    v17 = xmmword_21AACED20;
    v18 = xmmword_21AACED30;
    objc_msgSend(v14, "setAsbd:", &v16);
  }

  return v14;
}

+ (id)audioDataWithASBD:()SAUIAudioData rawData:
{
  id v5;
  id v6;
  __int128 v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v15;
  int v16;
  int v17;
  int v18;
  _OWORD v19[2];
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BEC0D78]);
  v7 = *(_OWORD *)(a3 + 16);
  v19[0] = *(_OWORD *)a3;
  v19[1] = v7;
  v20 = *(_QWORD *)(a3 + 32);
  objc_msgSend(v6, "setAsbd:", v19);
  if (!v6)
    goto LABEL_10;
  objc_msgSend(v6, "asbd");
  if (v18 != 1819304813)
  {
    objc_msgSend(v6, "asbd");
    if (v17 == 1869641075)
    {
      if ((objc_msgSend(v6, "populateWithOpusData:", v5) & 1) != 0)
        goto LABEL_4;
      VSGetLogDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "+[VSAudioData(SAUIAudioData) audioDataWithASBD:rawData:]";
        v11 = "%s, invalid opus data";
        v12 = v10;
        v13 = 12;
LABEL_17:
        _os_log_error_impl(&dword_21AA84000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
LABEL_10:
    VSGetLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (v6)
      {
        objc_msgSend(v6, "asbd");
        v15 = v16;
      }
      else
      {
        v15 = 0;
      }
      *(_DWORD *)buf = 136315394;
      v22 = "+[VSAudioData(SAUIAudioData) audioDataWithASBD:rawData:]";
      v23 = 1024;
      v24 = v15;
      v11 = "%s, Unknown format: %d";
      v12 = v10;
      v13 = 18;
      goto LABEL_17;
    }
LABEL_11:

    v9 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "audioData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "populateWithPCMData:", v8);

LABEL_4:
  v9 = v6;
LABEL_12:

  return v9;
}

+ (void)asbdFromDescription:()SAUIAudioData
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v3 = a1;
  objc_msgSend(v3, "formatID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(a2 + 8) = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v3, "sampleRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  *(_QWORD *)a2 = v6;

  objc_msgSend(v3, "formatFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(a2 + 12) = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v3, "bytesPerPacket");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(a2 + 16) = objc_msgSend(v8, "unsignedIntValue");

  objc_msgSend(v3, "framesPerPacket");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(a2 + 20) = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v3, "bytesPerFrame");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(a2 + 24) = objc_msgSend(v10, "unsignedIntValue");

  objc_msgSend(v3, "channelsPerFrame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(a2 + 28) = objc_msgSend(v11, "unsignedIntValue");

  objc_msgSend(v3, "bitsPerChannel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(a2 + 32) = objc_msgSend(v12, "unsignedIntValue");

  objc_msgSend(v3, "reserved");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  *(_DWORD *)(a2 + 36) = objc_msgSend(v13, "unsignedIntValue");
}

@end
