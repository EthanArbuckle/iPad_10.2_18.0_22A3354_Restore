@implementation _LTAudioDecoder

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sSharedInstance;
}

- (OpaqueAudioConverter)_audioDecoderFrom:(AudioStreamBasicDescription *)a3 to:(AudioStreamBasicDescription *)a4
{
  OpaqueAudioConverter *result;
  OpaqueAudioConverter **p_decoder;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  p_decoder = &self->_decoder;
  result = self->_decoder;
  if (!result)
  {
    v9 = AudioConverterNew(a3, a4, p_decoder);
    if ((_DWORD)v9)
    {
      v10 = v9;
      v11 = _LTOSLogTTS();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_LTAudioDecoder _audioDecoderFrom:to:].cold.1(v11, v10);
      return 0;
    }
    else
    {
      v12 = *(_OWORD *)&a3->mSampleRate;
      v13 = *(_OWORD *)&a3->mBytesPerPacket;
      *(_QWORD *)&self->_fromASBD.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
      *(_OWORD *)&self->_fromASBD.mSampleRate = v12;
      *(_OWORD *)&self->_fromASBD.mBytesPerPacket = v13;
      v14 = *(_OWORD *)&a4->mSampleRate;
      v15 = *(_OWORD *)&a4->mBytesPerPacket;
      *(_QWORD *)&self->_toASBD.mBitsPerChannel = *(_QWORD *)&a4->mBitsPerChannel;
      *(_OWORD *)&self->_toASBD.mBytesPerPacket = v15;
      *(_OWORD *)&self->_toASBD.mSampleRate = v14;
      return self->_decoder;
    }
  }
  return result;
}

- (id)decodeChunks:(id)a3 from:(AudioStreamBasicDescription *)a4 to:(AudioStreamBasicDescription *)a5 outError:(id *)a6
{
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  UInt32 mFramesPerPacket;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = *(_QWORD *)&a5->mBitsPerChannel;
  v12 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)&self->_toASBD.mSampleRate = *(_OWORD *)&a5->mSampleRate;
  *(_OWORD *)&self->_toASBD.mBytesPerPacket = v12;
  *(_QWORD *)&self->_toASBD.mBitsPerChannel = v11;
  v13 = *(_OWORD *)&a4->mBytesPerPacket;
  v35[0] = *(_OWORD *)&a4->mSampleRate;
  v35[1] = v13;
  v36 = *(_QWORD *)&a4->mBitsPerChannel;
  -[_LTAudioDecoder beginChunkDecoderForStreamDescription:](self, "beginChunkDecoderForStreamDescription:", v35);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a6 && v14)
  {
    v16 = 0;
    *a6 = objc_retainAutorelease(v14);
  }
  else
  {
    mFramesPerPacket = a4->mFramesPerPacket;
    v18 = 2 * mFramesPerPacket * objc_msgSend(v10, "count");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", v18);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v20)
    {
      v21 = v20;
      v29 = v10;
      v22 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v30 = 0;
          -[_LTAudioDecoder decodeChunk:outError:](self, "decodeChunk:outError:", v24, &v30, v29);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v30;
          if (v26)
          {
            v27 = v26;

            goto LABEL_14;
          }
          objc_msgSend(v16, "appendData:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v21)
          continue;
        break;
      }
      v27 = 0;
LABEL_14:
      v10 = v29;
    }
    else
    {
      v27 = 0;
    }

    -[_LTAudioDecoder endChunkDecoding](self, "endChunkDecoding");
    if (v27)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v27);

      v16 = 0;
    }

  }
  return v16;
}

- (id)decodeTo48KHzPCMFromChunks:(id)a3 from:(AudioStreamBasicDescription *)a4 outError:(id *)a5
{
  id v8;
  __int128 v9;
  void *v10;
  _OWORD v12[2];
  uint64_t v13;
  _BYTE v14[40];

  v8 = a3;
  -[_LTAudioDecoder get48khzPCMDescription](self, "get48khzPCMDescription");
  v9 = *(_OWORD *)&a4->mBytesPerPacket;
  v12[0] = *(_OWORD *)&a4->mSampleRate;
  v12[1] = v9;
  v13 = *(_QWORD *)&a4->mBitsPerChannel;
  -[_LTAudioDecoder decodeChunks:from:to:outError:](self, "decodeChunks:from:to:outError:", v8, v12, v14, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)beginChunkDecoderForStreamDescription:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];
  uint64_t v10;
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_OWORD *)&a3->mBytesPerPacket;
  v11[0] = *(_OWORD *)&a3->mSampleRate;
  v11[1] = v3;
  v12 = *(_QWORD *)&a3->mBitsPerChannel;
  v4 = *(_OWORD *)&self->_toASBD.mBytesPerPacket;
  v9[0] = *(_OWORD *)&self->_toASBD.mSampleRate;
  v9[1] = v4;
  v10 = *(_QWORD *)&self->_toASBD.mBitsPerChannel;
  if (-[_LTAudioDecoder _audioDecoderFrom:to:](self, "_audioDecoderFrom:to:", v11, v9))
    return 0;
  v6 = (void *)MEMORY[0x24BDD1540];
  v13 = *MEMORY[0x24BDD0FD8];
  v14[0] = CFSTR("Failed to create opus decoder");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("TranslationInternalErrorDomain"), 10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)endChunkDecoding
{
  AudioConverterReset(self->_decoder);
}

- (id)decodeChunk:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  OpaqueAudioConverter *decoder;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD inInputDataProcUserData[4];
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  char *v27;
  _QWORD v28[4];
  _QWORD v29[3];
  int v30;
  UInt32 ioOutputDataPacketSize;
  AudioBufferList outOutputData;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 2 * self->_fromASBD.mFramesPerPacket);
  *(_QWORD *)&outOutputData.mNumberBuffers = 1;
  v8 = objc_retainAutorelease(v7);
  outOutputData.mBuffers[0].mData = (void *)objc_msgSend(v8, "mutableBytes");
  outOutputData.mBuffers[0].mNumberChannels = 1;
  outOutputData.mBuffers[0].mDataByteSize = objc_msgSend(v8, "length");
  ioOutputDataPacketSize = self->_fromASBD.mFramesPerPacket;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 1;
  decoder = self->_decoder;
  inInputDataProcUserData[0] = MEMORY[0x24BDAC760];
  inInputDataProcUserData[1] = 3221225472;
  inInputDataProcUserData[2] = __40___LTAudioDecoder_decodeChunk_outError___block_invoke;
  inInputDataProcUserData[3] = &unk_251A11178;
  v25 = v28;
  v27 = &v37;
  v10 = v6;
  v24 = v10;
  v26 = v29;
  v11 = AudioConverterFillComplexBuffer(decoder, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
  if ((_DWORD)v11 != 1836086393 && (_DWORD)v11)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "vs_stringFrom4CC:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Could not finish decoding, res %@"), v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0FD8];
    v34 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("TranslationInternalErrorDomain"), 10, v17);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = (id)v18;

    v13 = 0;
    if (a4 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v13 = 0;
      *a4 = v12;
    }
    goto LABEL_13;
  }
  v12 = 0;
  if (!ioOutputDataPacketSize)
  {
    v13 = 0;
    goto LABEL_13;
  }
  v13 = 0;
  if (outOutputData.mNumberBuffers)
  {
    v14 = 2 * ioOutputDataPacketSize;
    if (v14 <= outOutputData.mBuffers[0].mDataByteSize)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", outOutputData.mBuffers[0].mData);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("decoder gave us %d bytes bytes but we really only expected %d"), v14, outOutputData.mBuffers[0].mDataByteSize);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FD8];
    v36 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("TranslationInternalErrorDomain"), 10, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_13:

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);

  return v13;
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
  v4.super_class = (Class)_LTAudioDecoder;
  -[_LTAudioDecoder dealloc](&v4, sel_dealloc);
}

- (AudioStreamBasicDescription)get48khzPCMDescription
{
  *(_OWORD *)&retstr->mSampleRate = xmmword_249338538;
  *(_OWORD *)&retstr->mBytesPerPacket = unk_249338548;
  *(_QWORD *)&retstr->mBitsPerChannel = 16;
  return self;
}

- (id)extractAudioChunksFromOpusWithData:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;

  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v8, "length");
  if (a4 && v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = 0;
    v18 = 0;
    if (a4 >= 1)
    {
      v11 = 0;
      do
      {
        objc_msgSend(v8, "getBytes:range:", &v17, v11, 16);
        v12 = (void *)MEMORY[0x24BDBCE50];
        v13 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
        objc_msgSend(v12, "dataWithBytes:length:", v13 + v17, HIDWORD(v18));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

        v11 += 16;
        --a4;
      }
      while (a4);
    }
  }
  else
  {
    v15 = _LTOSLogTTS();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_LTAudioDecoder extractAudioChunksFromOpusWithData:packetCount:packetDescriptions:].cold.1(v15);
    v10 = (id)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

- (void)_audioDecoderFrom:(void *)a1 to:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(v3, "vs_stringFrom4CC:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543362;
  v8 = v5;
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v4, v6, "Could not create Opus decoder: %{public}@", (uint8_t *)&v7);

}

- (void)extractAudioChunksFromOpusWithData:(os_log_t)log packetCount:packetDescriptions:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Empty packet descriptions, cannot extract data chunks", v1, 2u);
}

@end
