@implementation SFSSAudioConverter

- (id)createAudioConverter:(AudioStreamBasicDescription *)a3 dstAsbd:(AudioStreamBasicDescription *)a4
{
  OSStatus v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  OSStatus v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  OSStatus v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = AudioConverterNew(a3, a4, &self->_decoder);
  v8 = *(_QWORD *)&a3->mBitsPerChannel;
  v9 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_OWORD *)&self->_srcAsbd.mSampleRate = *(_OWORD *)&a3->mSampleRate;
  *(_OWORD *)&self->_srcAsbd.mBytesPerPacket = v9;
  *(_QWORD *)&self->_srcAsbd.mBitsPerChannel = v8;
  v11 = *(_OWORD *)&a4->mSampleRate;
  v10 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_QWORD *)&self->_dstAsbd.mBitsPerChannel = *(_QWORD *)&a4->mBitsPerChannel;
  *(_OWORD *)&self->_dstAsbd.mSampleRate = v11;
  *(_OWORD *)&self->_dstAsbd.mBytesPerPacket = v10;
  if (v7)
  {
    v12 = v7;
    SFSSGetLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v12;
      _os_log_error_impl(&dword_21E284000, v13, OS_LOG_TYPE_ERROR, "Could not create Opus decoder: %d", buf, 8u);
    }

    v14 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FD8];
    v19 = CFSTR("Failed to create opus decoder");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisAudioErrorDomain"), v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (void)reset
{
  NSObject *v3;
  OpaqueAudioConverter *decoder;
  uint8_t v5[16];

  SFSSGetLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "Reset audio decoder.", v5, 2u);
  }

  decoder = self->_decoder;
  if (decoder)
    AudioConverterReset(decoder);
}

- (void)dealloc
{
  OpaqueAudioConverter *decoder;
  objc_super v4;

  decoder = self->_decoder;
  if (decoder)
  {
    AudioConverterDispose(decoder);
    self->_decoder = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFSSAudioConverter;
  -[SFSSAudioConverter dealloc](&v4, sel_dealloc);
}

- (id)convertChunks:(id)a3 srcAsbd:(AudioStreamBasicDescription *)a4 dstAsbd:(AudioStreamBasicDescription *)a5 outError:(id *)a6
{
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  UInt32 v28;
  uint64_t v29;
  uint64_t j;
  UInt32 mFramesPerPacket;
  SFSSAudioDataWrapper *v32;
  void *v33;
  id v34;
  int v35;
  OSStatus v36;
  OSStatus v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  UInt32 ioOutputDataPacketSize;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE outOutputData[32];
  uint64_t v54;
  uint64_t v55;
  const __CFString *v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[16];
  __int128 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v12 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)outOutputData = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&outOutputData[16] = v12;
  v54 = *(_QWORD *)&a4->mBitsPerChannel;
  v13 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a5->mSampleRate;
  v60 = v13;
  v61 = *(_QWORD *)&a5->mBitsPerChannel;
  if (+[SFSSAudioConverter isAsbdSameAs:dstAsbd:](SFSSAudioConverter, "isAsbdSameAs:dstAsbd:", outOutputData, buf))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v50 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "audioData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendData:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v16);
    }

LABEL_26:
    v24 = v11;
    goto LABEL_27;
  }
  -[SFSSAudioConverter reset](self, "reset");
  v20 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)outOutputData = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&outOutputData[16] = v20;
  v54 = *(_QWORD *)&a4->mBitsPerChannel;
  v21 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a5->mSampleRate;
  v60 = v21;
  v61 = *(_QWORD *)&a5->mBitsPerChannel;
  -[SFSSAudioConverter createAudioConverter:dstAsbd:](self, "createAudioConverter:dstAsbd:", outOutputData, buf);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    ioOutputDataPacketSize = 0;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v25 = v10;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    v43 = a6;
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v45 != v29)
            objc_enumerationMutation(v25);
          mFramesPerPacket = self->_srcAsbd.mFramesPerPacket;
          v28 += mFramesPerPacket * objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "packetCount");
          ioOutputDataPacketSize = v28;
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v27);
    }
    else
    {
      v28 = 0;
    }

    v32 = -[SFSSAudioDataWrapper initWithAudioChunks:]([SFSSAudioDataWrapper alloc], "initWithAudioChunks:", v25);
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", self->_dstAsbd.mBytesPerFrame * v28);
    *(_QWORD *)outOutputData = 1;
    v34 = objc_retainAutorelease(v33);
    *(_QWORD *)&outOutputData[16] = objc_msgSend(v34, "mutableBytes");
    v35 = objc_msgSend(v34, "length");
    *(_DWORD *)&outOutputData[8] = 1;
    *(_DWORD *)&outOutputData[12] = v35;
    v36 = AudioConverterFillComplexBuffer(self->_decoder, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_Callback, v32, &ioOutputDataPacketSize, (AudioBufferList *)outOutputData, 0);
    if (v36)
    {
      v37 = v36;
      SFSSGetLogObject();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v37;
        _os_log_error_impl(&dword_21E284000, v38, OS_LOG_TYPE_ERROR, "Audio converting error: %d", buf, 8u);
      }

      v39 = (void *)MEMORY[0x24BDD1540];
      v55 = *MEMORY[0x24BDD0FD8];
      v56 = CFSTR("Audio converting error.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisAudioErrorDomain"), v37, v40);
      *v43 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)&outOutputData[16], *(unsigned int *)&outOutputData[12]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendData:", v41);

    -[SFSSAudioConverter reset](self, "reset");
    goto LABEL_26;
  }
  v23 = objc_retainAutorelease(v22);
  *a6 = v23;

  v24 = 0;
LABEL_27:

  return v24;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1550 != -1)
    dispatch_once(&sharedInstance_onceToken_1550, &__block_literal_global_1551);
  return (id)sharedInstance_sSharedInstance;
}

+ (BOOL)isAsbdSameAs:(AudioStreamBasicDescription *)a3 dstAsbd:(AudioStreamBasicDescription *)a4
{
  return a3->mBitsPerChannel == a4->mBitsPerChannel
      && a3->mFormatID == a4->mFormatID
      && a3->mFormatFlags == a4->mFormatFlags
      && a3->mBytesPerPacket == a4->mBytesPerPacket
      && a3->mFramesPerPacket == a4->mFramesPerPacket
      && a3->mBytesPerFrame == a4->mBytesPerFrame
      && a3->mChannelsPerFrame == a4->mChannelsPerFrame
      && a3->mReserved == a4->mReserved;
}

void __36__SFSSAudioConverter_sharedInstance__block_invoke()
{
  SFSSAudioConverter *v0;
  void *v1;

  v0 = objc_alloc_init(SFSSAudioConverter);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

@end
