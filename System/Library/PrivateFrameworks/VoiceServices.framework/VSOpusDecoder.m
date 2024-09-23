@implementation VSOpusDecoder

- (OpaqueAudioConverter)_opusDecoder:(AudioStreamBasicDescription *)a3
{
  OpaqueAudioConverter *result;
  OpaqueAudioConverter **p_decoder;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  AudioStreamBasicDescription *v12;
  __int128 v13;
  __int128 v14;
  AudioStreamBasicDescription v15;
  uint8_t buf[4];
  AudioStreamBasicDescription *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_decoder = &self->_decoder;
  result = self->_decoder;
  if (!result)
  {
    if (a3->mSampleRate == 16000.0)
    {
      v7 = &VSAudioFormat16khzPCM;
    }
    else
    {
      if (a3->mSampleRate != 48000.0)
      {
        VSGetLogDefault();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = a3;
          _os_log_error_impl(&dword_1DE15E000, v11, OS_LOG_TYPE_ERROR, "Invalid target asbd: %@", buf, 0xCu);
        }
LABEL_12:

        return 0;
      }
      v7 = &VSAudioFormat48khzPCM;
    }
    v8 = v7[1];
    *(_OWORD *)&v15.mSampleRate = *v7;
    *(_OWORD *)&v15.mBytesPerPacket = v8;
    *(_QWORD *)&v15.mBitsPerChannel = 16;
    v9 = AudioConverterNew(a3, &v15, p_decoder);
    if (!(_DWORD)v9)
    {
      v13 = *(_OWORD *)&a3->mSampleRate;
      v14 = *(_OWORD *)&a3->mBytesPerPacket;
      *(_QWORD *)&self->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
      *(_OWORD *)&self->_asbd.mSampleRate = v13;
      *(_OWORD *)&self->_asbd.mBytesPerPacket = v14;
      return self->_decoder;
    }
    v10 = v9;
    VSGetLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "vs_stringFrom4CC:", v10);
      v12 = (AudioStreamBasicDescription *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_error_impl(&dword_1DE15E000, v11, OS_LOG_TYPE_ERROR, "Could not create Opus decoder: %{public}@", buf, 0xCu);

    }
    goto LABEL_12;
  }
  return result;
}

- (id)decodeChunks:(id)a3 streamDescription:(AudioStreamBasicDescription *)a4 outError:(id *)a5
{
  id v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  UInt32 mFramesPerPacket;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[2];
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = *(_OWORD *)&a4->mBytesPerPacket;
  v31[0] = *(_OWORD *)&a4->mSampleRate;
  v31[1] = v9;
  v32 = *(_QWORD *)&a4->mBitsPerChannel;
  -[VSOpusDecoder beginChunkDecoderForStreamDescription:](self, "beginChunkDecoderForStreamDescription:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5 && v10)
  {
    v12 = 0;
    *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    mFramesPerPacket = a4->mFramesPerPacket;
    v14 = 2 * mFramesPerPacket * objc_msgSend(v8, "count");
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v14);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v16)
    {
      v17 = v16;
      v25 = v8;
      v18 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v26 = 0;
          -[VSOpusDecoder decodeChunk:outError:](self, "decodeChunk:outError:", v20, &v26, v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v26;
          if (v22)
          {
            v23 = v22;

            goto LABEL_14;
          }
          objc_msgSend(v12, "appendData:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v17)
          continue;
        break;
      }
      v23 = 0;
LABEL_14:
      v8 = v25;
    }
    else
    {
      v23 = 0;
    }

    -[VSOpusDecoder endChunkDecoding](self, "endChunkDecoding");
    if (v23)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v23);

      v12 = 0;
    }

  }
  return v12;
}

- (id)beginChunkDecoderForStreamDescription:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&a3->mBytesPerPacket;
  v8[0] = *(_OWORD *)&a3->mSampleRate;
  v8[1] = v3;
  v9 = *(_QWORD *)&a3->mBitsPerChannel;
  if (-[VSOpusDecoder _opusDecoder:](self, "_opusDecoder:", v8))
    return 0;
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D68];
  v11[0] = CFSTR("Failed to create opus decoder");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("VSSpeechServiceDecoderErrorDomain"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2 * self->_asbd.mFramesPerPacket);
  *(_QWORD *)&outOutputData.mNumberBuffers = 1;
  v8 = objc_retainAutorelease(v7);
  outOutputData.mBuffers[0].mData = (void *)objc_msgSend(v8, "mutableBytes");
  outOutputData.mBuffers[0].mNumberChannels = 1;
  outOutputData.mBuffers[0].mDataByteSize = objc_msgSend(v8, "length");
  ioOutputDataPacketSize = self->_asbd.mFramesPerPacket;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 1;
  decoder = self->_decoder;
  inInputDataProcUserData[0] = MEMORY[0x1E0C809B0];
  inInputDataProcUserData[1] = 3221225472;
  inInputDataProcUserData[2] = __38__VSOpusDecoder_decodeChunk_outError___block_invoke;
  inInputDataProcUserData[3] = &unk_1EA8AF7F0;
  v25 = v28;
  v27 = &v37;
  v10 = v6;
  v24 = v10;
  v26 = v29;
  v11 = AudioConverterFillComplexBuffer(decoder, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
  if ((_DWORD)v11 != 1836086393 && (_DWORD)v11)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "vs_stringFrom4CC:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Could not finish decoding, res %@"), v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D68];
    v34 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("VSSpeechServiceDecoderErrorDomain"), 0, v17);
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
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", outOutputData.mBuffers[0].mData);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("decoder gave us %d bytes bytes but we really only expected %d"), v14, outOutputData.mBuffers[0].mDataByteSize);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D68];
    v36 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("VSSpeechServiceDecoderErrorDomain"), 0, v17);
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
  v4.super_class = (Class)VSOpusDecoder;
  -[VSOpusDecoder dealloc](&v4, sel_dealloc);
}

uint64_t __38__VSOpusDecoder_decodeChunk_outError___block_invoke(uint64_t a1, _DWORD *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v8;
  uint64_t result;
  _QWORD *v10;
  int v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = *a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= v8)
  {
    if ((_DWORD)v8 == 1)
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "length");
      v12 = objc_retainAutorelease(*(id *)(a1 + 32));
      *(_QWORD *)(a3 + 16) = objc_msgSend(v12, "bytes");
      *(_DWORD *)(a3 + 12) = v11;
      if (a4)
      {
        v13 = *(_QWORD *)(a1 + 56);
        *(_QWORD *)v13 = 0;
        *(_DWORD *)(v13 + 8) = 0;
        *(_DWORD *)(v13 + 12) = v11;
        *a4 = v13;
      }
      --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      return 0;
    }
    else
    {
      VSGetLogDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *a2;
        v16 = 134217984;
        v17 = v15;
        _os_log_error_impl(&dword_1DE15E000, v14, OS_LOG_TYPE_ERROR, "Only expecting to get 1 packet at a time, not %lu", (uint8_t *)&v16, 0xCu);
      }

      return 1752524863;
    }
  }
  else
  {
    result = 1836086393;
    *a2 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_DWORD *)(a3 + 12) = 0;
    if (a4)
    {
      v10 = *(_QWORD **)(a1 + 56);
      *v10 = 0;
      v10[1] = 0;
      *a4 = v10;
    }
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1233);
  return (id)sharedInstance_sSharedInstance;
}

void __31__VSOpusDecoder_sharedInstance__block_invoke()
{
  VSOpusDecoder *v0;
  void *v1;

  v0 = objc_alloc_init(VSOpusDecoder);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

@end
