@implementation VSStreamAudioData

- (VSStreamAudioData)initWithASBD:(AudioStreamBasicDescription *)a3
{
  char *v4;
  VSStreamAudioData *v5;
  __int128 v6;
  __int128 v7;
  VSMappedData *v8;
  VSMappedData *mappedData;
  uint64_t v10;
  NSMutableArray *mappedAudioInfo;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VSStreamAudioData;
  v4 = -[VSStreamAudioData init](&v13, sel_init);
  v5 = (VSStreamAudioData *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->mSampleRate;
    v7 = *(_OWORD *)&a3->mBytesPerPacket;
    *((_QWORD *)v4 + 7) = *(_QWORD *)&a3->mBitsPerChannel;
    *(_OWORD *)(v4 + 40) = v7;
    *(_OWORD *)(v4 + 24) = v6;
    v8 = (VSMappedData *)objc_alloc_init(MEMORY[0x24BEC0D98]);
    mappedData = v5->_mappedData;
    v5->_mappedData = v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    mappedAudioInfo = v5->_mappedAudioInfo;
    v5->_mappedAudioInfo = (NSMutableArray *)v10;

  }
  return v5;
}

- (void)appendAudioData:(id)a3 packetCount:(unint64_t)a4 packetDescriptions:(id)a5
{
  VSMappedData *mappedData;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VSStreamAudioMappedInfo *v17;

  mappedData = self->_mappedData;
  v9 = a5;
  v10 = a3;
  -[VSMappedData appendData:](mappedData, "appendData:", v10);
  -[VSMappedData appendData:](self->_mappedData, "appendData:", v9);
  v17 = objc_alloc_init(VSStreamAudioMappedInfo);
  v11 = -[VSMappedData appendData:](self->_mappedData, "appendData:", v10);
  v13 = v12;

  -[VSStreamAudioMappedInfo setAudioBytesRange:](v17, "setAudioBytesRange:", v11, v13);
  -[VSStreamAudioMappedInfo setPacketCount:](v17, "setPacketCount:", a4);
  v14 = -[VSMappedData appendData:](self->_mappedData, "appendData:", v9);
  v16 = v15;

  -[VSStreamAudioMappedInfo setPacketDescriptionsRange:](v17, "setPacketDescriptionsRange:", v14, v16);
  -[NSMutableArray addObject:](self->_mappedAudioInfo, "addObject:", v17);

}

- (void)enumerateAudioWithBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unsigned __int8 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, uint64_t, void *, _BYTE *))a3;
  v23 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_mappedAudioInfo;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
      v10 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v9, "audioBytesRange"));
      v11 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v9, "audioBytesRange");
      objc_msgSend(v11, "dataWithBytesNoCopy:length:freeWhenDone:", v10, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v9, "packetDescriptionsRange"));
      v15 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v9, "packetDescriptionsRange");
      objc_msgSend(v15, "dataWithBytesNoCopy:length:freeWhenDone:", v14, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v13, objc_msgSend(v9, "packetCount"), v17, &v23);
      LODWORD(v9) = v23;

      if ((_DWORD)v9)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (double)duration
{
  NSMutableArray *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  AudioFormatID mFormatID;
  double v17;
  double mSampleRate;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_mappedAudioInfo;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (v4)
  {
    v8 = v4;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v3);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "audioBytesRange", (_QWORD)v20);
        v10 += v14;
        v9 += objc_msgSend(v13, "packetCount");
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
    v6 = (double)v9;
    v7 = (double)v10;
  }

  mFormatID = self->_asbd.mFormatID;
  if (mFormatID == 1869641075)
  {
    mSampleRate = self->_asbd.mSampleRate;
    if (mSampleRate != 0.0)
    {
      LODWORD(v15) = self->_asbd.mFramesPerPacket;
      return v6 * (double)v15 / mSampleRate;
    }
  }
  else if (mFormatID == 1819304813)
  {
    LODWORD(v15) = self->_asbd.mBytesPerFrame;
    v17 = self->_asbd.mSampleRate * (double)v15;
    if (v17 != 0.0)
      return v7 / v17;
  }
  return v5;
}

- (BOOL)writeWaveToFilePath:(id)a3
{
  id v4;
  const __CFURL *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  __int128 v10;
  uint64_t v11;
  NSObject *v12;
  SInt64 v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  OpaqueAudioFileID *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  BOOL v35;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  void *v42;
  const __CFURL *v43;
  id v44;
  uint64_t v45;
  NSMutableArray *obj;
  uint64_t v47;
  SInt64 inStartingByte;
  UInt32 ioNumBytes;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  AudioFileID outAudioFile;
  AudioStreamBasicDescription inFormat;
  _BYTE v57[128];
  _BYTE buf[32];
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  inFormat.mSampleRate = self->_asbd.mSampleRate;
  *(_OWORD *)&inFormat.mFormatID = xmmword_21AACED20;
  *(_OWORD *)&inFormat.mBytesPerFrame = xmmword_21AACED30;
  outAudioFile = 0;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v6 = AudioFileCreateWithURL(v5, 0x57415645u, &inFormat, 1u, &outAudioFile);
  if ((_DWORD)v6)
  {
    v7 = v6;
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_error_impl(&dword_21AA84000, v8, OS_LOG_TYPE_ERROR, "Error AudioFileCreateWithURL: '%@', code: %@", buf, 0x16u);
      goto LABEL_31;
    }
LABEL_36:
    v35 = 0;
    goto LABEL_37;
  }
  if (self->_asbd.mFormatID == 1869641075)
  {
    v8 = objc_alloc_init(MEMORY[0x24BEC0DB0]);
    v10 = *(_OWORD *)&self->_asbd.mBytesPerPacket;
    *(_OWORD *)buf = *(_OWORD *)&self->_asbd.mSampleRate;
    *(_OWORD *)&buf[16] = v10;
    v59 = *(_QWORD *)&self->_asbd.mBitsPerChannel;
    -[NSObject beginChunkDecoderForStreamDescription:](v8, "beginChunkDecoderForStreamDescription:", buf);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v9 = v11;
      VSGetLogDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        v39 = "Unable to begin OPUS decoder, %@";
        v40 = v12;
        v41 = 12;
        goto LABEL_44;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v8 = 0;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->_mappedAudioInfo;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (!v45)
    goto LABEL_27;
  v13 = 0;
  v47 = *(_QWORD *)v52;
  v43 = v5;
  v44 = v4;
  while (2)
  {
    for (i = 0; i != v45; ++i)
    {
      if (*(_QWORD *)v52 != v47)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      inStartingByte = v13;
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDBCEC8], "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "packetCount"))
        {
          v17 = 0;
          v18 = 0;
          while (1)
          {
            v19 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v15, "packetDescriptionsRange", v43, v44));
            v20 = *(unsigned int *)(v19 + v17 + 12);
            v21 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v15, "audioBytesRange") + *(_QWORD *)(v19 + v17));
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v21, v20, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = 0;
            -[NSObject decodeChunk:outError:](v8, "decodeChunk:outError:", v22, &v50);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v50;
            if (v24)
              break;
            objc_msgSend(v16, "appendData:", v23);

            ++v18;
            v17 += 16;
            if (objc_msgSend(v15, "packetCount") <= v18)
            {
              v5 = v43;
              v4 = v44;
              goto LABEL_21;
            }
          }
          v33 = v24;
          VSGetLogDefault();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v33;
            _os_log_error_impl(&dword_21AA84000, v34, OS_LOG_TYPE_ERROR, "Error during decoding, %@", buf, 0xCu);
          }

          v5 = v43;
          v4 = v44;
          goto LABEL_35;
        }
      }
      else
      {
        v25 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v15, "audioBytesRange"));
        v26 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v15, "audioBytesRange");
        objc_msgSend(v26, "dataWithBytesNoCopy:length:freeWhenDone:", v25, v27, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_21:
      if (objc_msgSend(v16, "length", v43, v44))
      {
        ioNumBytes = 0;
        ioNumBytes = objc_msgSend(v16, "length");
        v28 = outAudioFile;
        v29 = objc_retainAutorelease(v16);
        v30 = AudioFileWriteBytes(v28, 0, inStartingByte, &ioNumBytes, (const void *)objc_msgSend(v29, "bytes"));
        if ((_DWORD)v30)
        {
          v37 = v30;
          VSGetLogDefault();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v37);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v4;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v42;
            _os_log_error_impl(&dword_21AA84000, v38, OS_LOG_TYPE_ERROR, "Error AudioFileWriteBytes: '%@', code: %@", buf, 0x16u);

          }
          v16 = v29;
LABEL_35:

          goto LABEL_36;
        }
        v13 = inStartingByte + ioNumBytes;
      }
      else
      {
        v13 = inStartingByte;
      }

    }
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v45)
      continue;
    break;
  }
LABEL_27:

  if (v8)
    -[NSObject endChunkDecoding](v8, "endChunkDecoding");
  v31 = AudioFileClose(outAudioFile);
  if ((_DWORD)v31)
  {
    v32 = v31;
    VSGetLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_31:

      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v32);
    v12 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    v39 = "Error AudioFileClose: '%@', code: %@";
    v40 = v9;
    v41 = 22;
LABEL_44:
    _os_log_error_impl(&dword_21AA84000, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
LABEL_7:

    goto LABEL_31;
  }
  v35 = 1;
LABEL_37:

  return v35;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[1].mBytesPerPacket;
  return self;
}

- (VSMappedData)mappedData
{
  return self->_mappedData;
}

- (void)setMappedData:(id)a3
{
  objc_storeStrong((id *)&self->_mappedData, a3);
}

- (NSMutableArray)mappedAudioInfo
{
  return self->_mappedAudioInfo;
}

- (void)setMappedAudioInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mappedAudioInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedAudioInfo, 0);
  objc_storeStrong((id *)&self->_mappedData, 0);
}

@end
