@implementation RCAssetWriter

- (id)initForWriting:(id)a3 settings:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  RCAssetWriter *v12;
  RCAssetWriter *v13;
  uint64_t v14;
  AVAudioFormat *fileFormat;
  id v16;
  double v17;
  uint64_t v18;
  AVAudioFormat *processingFormat;
  dispatch_queue_t v20;
  OS_dispatch_queue *bufferQueue;
  dispatch_group_t v22;
  OS_dispatch_group *bufferGroup;
  uint64_t v24;
  NSMutableArray *buffers;
  uint64_t v26;
  id formatDescription;
  double v28;
  uint64_t v29;
  AVAssetWriterInput *input;
  RCAssetWriter *v31;
  OSStatus v32;
  id v34;
  CMTime v35;
  CMTime v36;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  objc_super v38;

  v9 = a3;
  v10 = a4;
  v11 = *MEMORY[0x1E0C8A2A8];
  v38.receiver = self;
  v38.super_class = (Class)RCAssetWriter;
  v12 = -[AVAssetWriter initWithURL:fileType:error:](&v38, sel_initWithURL_fileType_error_, v9, v11, a5);
  v13 = v12;
  if (!v12)
    goto LABEL_7;
  objc_storeStrong((id *)&v12->_url, a3);
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithSettings:", v10);
  fileFormat = v13->_fileFormat;
  v13->_fileFormat = (AVAudioFormat *)v14;

  if (!checkAudioFormat((uint64_t)v13->_fileFormat, (uint64_t)v10, a5)
    || (v16 = objc_alloc(MEMORY[0x1E0C89AA8]),
        -[AVAudioFormat sampleRate](v13->_fileFormat, "sampleRate"),
        v18 = objc_msgSend(v16, "initWithCommonFormat:sampleRate:channels:interleaved:", 1, -[AVAudioFormat channelCount](v13->_fileFormat, "channelCount"), 0, v17), processingFormat = v13->_processingFormat, v13->_processingFormat = (AVAudioFormat *)v18, processingFormat, !checkAudioFormat((uint64_t)v13->_processingFormat, (uint64_t)v10, a5)))
  {
LABEL_13:
    v31 = 0;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v13->_settings, a4);
  v20 = dispatch_queue_create(0, 0);
  bufferQueue = v13->_bufferQueue;
  v13->_bufferQueue = (OS_dispatch_queue *)v20;

  v22 = dispatch_group_create();
  bufferGroup = v13->_bufferGroup;
  v13->_bufferGroup = (OS_dispatch_group *)v22;

  v24 = objc_opt_new();
  buffers = v13->_buffers;
  v13->_buffers = (NSMutableArray *)v24;

  -[AVAudioFormat formatDescription](v13->_processingFormat, "formatDescription");
  v26 = objc_claimAutoreleasedReturnValue();
  formatDescription = v13->_formatDescription;
  v13->_formatDescription = (id)v26;

  if (!v13->_formatDescription)
  {
    formatDescriptionOut = 0;
    v32 = CMAudioFormatDescriptionCreate(0, -[AVAudioFormat streamDescription](v13->_processingFormat, "streamDescription"), 0, 0, 0, 0, 0, &formatDescriptionOut);
    if (v32)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v32, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_13;
    }
    v34 = v13->_formatDescription;
    v13->_formatDescription = formatDescriptionOut;

  }
  -[AVAudioFormat sampleRate](v13->_processingFormat, "sampleRate");
  v13->_sampleRate = (int)v28;
  objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x1E0C8A7A0], v13->_settings, v13->_formatDescription);
  v29 = objc_claimAutoreleasedReturnValue();
  input = v13->_input;
  v13->_input = (AVAssetWriterInput *)v29;

  -[AVAssetWriterInput setExpectsMediaDataInRealTime:](v13->_input, "setExpectsMediaDataInRealTime:", 1);
  if (!-[AVAssetWriter canAddInput:](v13, "canAddInput:", v13->_input))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8A2F8], -11861, v10);
      v31 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  -[AVAssetWriter addInput:](v13, "addInput:", v13->_input);
  CMTimeMakeWithSeconds(&v36, 2.0, kCMDefaultTimeScale);
  v35 = v36;
  -[AVAssetWriter setMovieFragmentInterval:](v13, "setMovieFragmentInterval:", &v35);
LABEL_7:
  v31 = v13;
LABEL_14:

  return v31;
}

- (BOOL)startWritingAudioFile:(id *)a3
{
  _BOOL4 v5;
  __int128 v7;
  uint64_t v8;

  v5 = -[AVAssetWriter startWriting](self, "startWriting");
  if (v5)
  {
    v7 = *MEMORY[0x1E0CA2E68];
    v8 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    -[AVAssetWriter startSessionAtSourceTime:](self, "startSessionAtSourceTime:", &v7);
  }
  else if (a3)
  {
    -[AVAssetWriter error](self, "error");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_appendBufferOnQueue:(id)a3 error:(id *)a4
{
  id v6;
  const opaqueCMFormatDescription *formatDescription;
  id v8;
  unsigned int v9;
  OSStatus v10;
  BOOL v11;
  CMSampleBufferRef v13;
  CMTime v14;
  CMTime presentationTimeStamp;
  CMSampleBufferRef v16;

  v6 = a3;
  formatDescription = (const opaqueCMFormatDescription *)self->_formatDescription;
  CMTimeMake(&v14, self->_frameCount, self->_sampleRate);
  v8 = v6;
  v16 = 0;
  v9 = objc_msgSend(v8, "frameLength");
  presentationTimeStamp = v14;
  v10 = CMAudioSampleBufferCreateWithPacketDescriptions(0, 0, 0, 0, 0, formatDescription, v9, &presentationTimeStamp, 0, &v16);
  if (v10
    || (v10 = CMSampleBufferSetDataBufferFromAudioBufferList(v16, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (const AudioBufferList *)objc_msgSend(v8, "audioBufferList"))) != 0|| (v10 = CMSampleBufferSetDataReady(v16)) != 0)
  {
    if (v16)
      CFRelease(v16);

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v13 = v16;

    -[AVAssetWriterInput appendSampleBuffer:](self->_input, "appendSampleBuffer:", v13);
    CFRelease(v13);
    self->_frameCount += objc_msgSend(v8, "frameLength");
    v11 = 1;
  }

  return v11;
}

- (void)finishWritingAudioFile:(id)a3
{
  id v4;
  NSObject *bufferGroup;
  NSObject *bufferQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  bufferGroup = self->_bufferGroup;
  bufferQueue = self->_bufferQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__RCAssetWriter_finishWritingAudioFile___block_invoke;
  v8[3] = &unk_1E769CC78;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(bufferGroup, bufferQueue, v8);

}

uint64_t __40__RCAssetWriter_finishWritingAudioFile___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "status") != 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "markAsFinished");
  return objc_msgSend(*(id *)(a1 + 32), "finishWritingWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (BOOL)writeFromBuffer:(id)a3 error:(id *)a4
{
  id v6;
  AVAssetWriterInput *v7;
  OS_dispatch_group *v8;
  OS_dispatch_queue *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  AVAssetWriterInput *v12;
  id v13;
  OS_dispatch_group *v14;
  NSObject *v15;
  int v16;
  BOOL v17;
  _QWORD v19[5];
  NSMutableArray *v20;
  AVAssetWriterInput *v21;
  id v22;
  OS_dispatch_group *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v32 = 0;
  v7 = self->_input;
  v8 = self->_bufferGroup;
  v9 = self->_bufferQueue;
  v10 = self->_buffers;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __39__RCAssetWriter_writeFromBuffer_error___block_invoke;
  v19[3] = &unk_1E769D568;
  v19[4] = self;
  v25 = &v27;
  v11 = v10;
  v20 = v11;
  v12 = v7;
  v21 = v12;
  v26 = &v33;
  v13 = v6;
  v22 = v13;
  v14 = v8;
  v23 = v14;
  v15 = v9;
  v24 = v15;
  dispatch_sync(v15, v19);
  v16 = *((unsigned __int8 *)v34 + 24);
  if (a4 && !*((_BYTE *)v34 + 24))
  {
    *a4 = objc_retainAutorelease((id)v28[5]);
    v16 = *((unsigned __int8 *)v34 + 24);
  }
  v17 = v16 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __39__RCAssetWriter_writeFromBuffer_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v2);
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "count");
    if (v3 || !objc_msgSend(*(id *)(a1 + 48), "isReadyForMoreMediaData"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      v8 = *(void **)(a1 + 40);
      v9 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
      objc_msgSend(v8, "addObject:", v9);

      dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
      if (!v3)
      {
        v10 = *(void **)(a1 + 48);
        v11 = *(_QWORD *)(a1 + 72);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __39__RCAssetWriter_writeFromBuffer_error___block_invoke_2;
        v14[3] = &unk_1E769C388;
        v15 = v10;
        v12 = *(id *)(a1 + 40);
        v13 = *(_QWORD *)(a1 + 32);
        v16 = v12;
        v17 = v13;
        v18 = *(id *)(a1 + 64);
        objc_msgSend(v15, "requestMediaDataWhenReadyOnQueue:usingBlock:", v11, v14);

      }
    }
    else
    {
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v19 = *(id *)(v6 + 40);
      v7 = objc_msgSend(v4, "_appendBufferOnQueue:error:", v5, &v19);
      objc_storeStrong((id *)(v6 + 40), v19);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v7;
    }
  }
}

uint64_t __39__RCAssetWriter_writeFromBuffer_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  id v8;

  result = objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData");
  if ((_DWORD)result)
  {
    do
    {
      result = objc_msgSend(*(id *)(a1 + 40), "count");
      if (!result)
        break;
      objc_msgSend(*(id *)(a1 + 40), "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = *(void **)(a1 + 48);
        v8 = 0;
        v5 = objc_msgSend(v4, "_appendBufferOnQueue:error:", v3, &v8);
        v6 = v8;
        v7 = v8;
        if ((v5 & 1) == 0)
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 80), v6);
        objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", 0);
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

      }
      result = objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData");
    }
    while ((result & 1) != 0);
  }
  return result;
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (AVAudioFormat)fileFormat
{
  return self->_fileFormat;
}

- (AVAudioFormat)processingFormat
{
  return self->_processingFormat;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_processingFormat, 0);
  objc_storeStrong((id *)&self->_fileFormat, 0);
  objc_storeStrong((id *)&self->_appendError, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_bufferGroup, 0);
  objc_storeStrong((id *)&self->_bufferQueue, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong(&self->_formatDescription, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
