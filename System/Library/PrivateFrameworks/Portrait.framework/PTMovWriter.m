@implementation PTMovWriter

- (PTMovWriter)initWithURL:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  PTMovWriter *v8;
  PTMovWriter *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  uint64_t v14;
  AVAssetWriterInput *writerInput;
  AVAssetWriterInput *v16;
  __int128 v17;
  uint64_t v18;
  AVAssetWriterInputPixelBufferAdaptor *pbAdaptor;
  uint64_t v20;
  AVAssetWriter *writer;
  BOOL v22;
  AVAssetWriter *v23;
  void *v24;
  __int128 v26;
  uint64_t v27;
  _OWORD v28[3];
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PTMovWriter;
  v8 = -[PTMovWriter init](&v29, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PTMovWriter setFileURL:](v8, "setFileURL:", v6);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeItemAtURL:error:", v6, 0);

    v9->_frameNo = 0;
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AEB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AEC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "floatValue");
      v9->_framesPerSecond = v13;
    }
    objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v7);
    v14 = objc_claimAutoreleasedReturnValue();
    writerInput = v9->_writerInput;
    v9->_writerInput = (AVAssetWriterInput *)v14;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](v9->_writerInput, "setExpectsMediaDataInRealTime:", 0);
    v16 = v9->_writerInput;
    v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v28[0] = *MEMORY[0x1E0C9BAA8];
    v28[1] = v17;
    v28[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[AVAssetWriterInput setTransform:](v16, "setTransform:", v28);
    objc_msgSend(MEMORY[0x1E0C8B038], "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", v9->_writerInput, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    pbAdaptor = v9->_pbAdaptor;
    v9->_pbAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)v18;

    objc_msgSend(MEMORY[0x1E0C8B018], "assetWriterWithURL:fileType:error:", v6, *MEMORY[0x1E0C8A2E8], 0);
    v20 = objc_claimAutoreleasedReturnValue();
    writer = v9->_writer;
    v9->_writer = (AVAssetWriter *)v20;

    -[AVAssetWriter addInput:](v9->_writer, "addInput:", v9->_writerInput);
    v22 = -[AVAssetWriter startWriting](v9->_writer, "startWriting");
    v23 = v9->_writer;
    v26 = *MEMORY[0x1E0CA2E68];
    v27 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    -[AVAssetWriter startSessionAtSourceTime:](v23, "startSessionAtSourceTime:", &v26);
    if (!v22)
    {
      switch(-[AVAssetWriter status](v9->_writer, "status"))
      {
        case AVAssetWriterStatusUnknown:
          NSLog(CFSTR("Export Unknow"));
          goto LABEL_9;
        case AVAssetWriterStatusWriting:
          NSLog(CFSTR("Export writing"));
          goto LABEL_9;
        case AVAssetWriterStatusCompleted:
          NSLog(CFSTR("Export Complete"));
          break;
        case AVAssetWriterStatusFailed:
        case AVAssetWriterStatusCancelled:
          NSLog(CFSTR("Export Failed"));
LABEL_9:
          -[AVAssetWriter error](v9->_writer, "error");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("ExportSessionError: %@"), v24);

          break;
        default:
          break;
      }
    }

  }
  return v9;
}

- (void)addFrame:(__CVBuffer *)a3
{
  CMTime v5;

  CMTimeMake(&v5, self->_frameNo, (int)self->_framesPerSecond);
  -[PTMovWriter addFrame:time:](self, "addFrame:time:", a3, &v5);
}

- (void)addFrame:(__CVBuffer *)a3 time:(id *)a4
{
  AVAssetWriterInputPixelBufferAdaptor *pbAdaptor;
  AVAssetWriterStatus v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  int64_t var3;

  if (!-[AVAssetWriterInput isReadyForMoreMediaData](self->_writerInput, "isReadyForMoreMediaData"))
  {
    do
      usleep(0x3E8u);
    while (!-[AVAssetWriterInput isReadyForMoreMediaData](self->_writerInput, "isReadyForMoreMediaData"));
  }
  if (-[AVAssetWriterInput isReadyForMoreMediaData](self->_writerInput, "isReadyForMoreMediaData"))
  {
    pbAdaptor = self->_pbAdaptor;
    v12 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    if (!-[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:](pbAdaptor, "appendPixelBuffer:withPresentationTime:", a3, &v12))
    {
      v8 = -[AVAssetWriter status](self->_writer, "status");
      -[AVAssetWriter error](self->_writer, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("ERROR: %ld %@"), v8, v9);

    }
    v10 = (self->_frameNo + 1);
    self->_frameNo = v10;
    HIDWORD(v11) = -858993459 * v10 + 429496728;
    LODWORD(v11) = HIDWORD(v11);
    if ((v11 >> 1) <= 0x19999998)
      NSLog(CFSTR("Frames written: %d"), v10);
  }
  else
  {
    NSLog(CFSTR("ERROR: Dropped frame. readyForMoreMediaData was NO"));
  }
}

- (void)finalize
{
  dispatch_semaphore_t v3;
  AVAssetWriter *writer;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  NSObject *v8;

  v3 = dispatch_semaphore_create(0);
  if (self->_frameNo >= 1)
  {
    -[AVAssetWriterInput markAsFinished](self->_writerInput, "markAsFinished");
    writer = self->_writer;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __23__PTMovWriter_finalize__block_invoke;
    v7[3] = &unk_1E822A100;
    v5 = v3;
    v8 = v5;
    -[AVAssetWriter finishWritingWithCompletionHandler:](writer, "finishWritingWithCompletionHandler:", v7);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (-[AVAssetWriter status](self->_writer, "status") == AVAssetWriterStatusFailed)
  {
    -[AVAssetWriter error](self->_writer, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error: %@"), v6);

  }
}

intptr_t __23__PTMovWriter_finalize__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  self->_fileURL = (NSURL *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbAdaptor, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_writerInput, 0);
}

@end
