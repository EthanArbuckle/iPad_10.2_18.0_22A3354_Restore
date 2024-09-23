@implementation PFRWSampleBufferChannel

- (PFRWSampleBufferChannel)init
{
  return -[PFRWSampleBufferChannel initWithAssetReaderOutput:assetWriterInput:useAdaptor:](self, "initWithAssetReaderOutput:assetWriterInput:useAdaptor:", 0, 0, 0);
}

- (PFRWSampleBufferChannel)initWithAssetReaderOutput:(id)a3 assetWriterInput:(id)a4 useAdaptor:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  PFRWSampleBufferChannel *v11;
  PFRWSampleBufferChannel *v12;
  void *v13;
  uint64_t v14;
  AVAssetWriterInputPixelBufferAdaptor *adaptor;
  dispatch_queue_t v16;
  OS_dispatch_queue *serializationQueue;
  objc_super v19;
  uint64_t v20;
  _QWORD v21[2];

  v5 = a5;
  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PFRWSampleBufferChannel;
  v11 = -[PFRWSampleBufferChannel init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetReaderOutput, a3);
    objc_storeStrong((id *)&v12->_assetWriterInput, a4);
    v12->_finished = 0;
    v12->_useAdaptor = v5;
    if (v5)
    {
      v20 = *MEMORY[0x1E0CA9040];
      v21[0] = &unk_1E45CA190;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B038], "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", v10, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      adaptor = v12->_adaptor;
      v12->_adaptor = (AVAssetWriterInputPixelBufferAdaptor *)v14;

    }
    v16 = dispatch_queue_create("com.apple.PFRWSampleBufferChannel.serializationQueue", 0);
    serializationQueue = v12->serializationQueue;
    v12->serializationQueue = (OS_dispatch_queue *)v16;

  }
  return v12;
}

- (void)callCompletionHandlerIfNecessary
{
  BOOL v3;
  void *v4;
  id completionHandler;
  void *v6;
  id v7;

  v3 = -[PFRWSampleBufferChannel finished](self, "finished");
  -[PFRWSampleBufferChannel setFinished:](self, "setFinished:", 1);
  if (!v3)
  {
    -[PFRWSampleBufferChannel assetWriterInput](self, "assetWriterInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markAsFinished");

    v7 = (id)MEMORY[0x1A1B0CFA4](self->completionHandler);
    completionHandler = self->completionHandler;
    self->completionHandler = 0;

    v6 = v7;
    if (v7)
    {
      (*((void (**)(id))v7 + 2))(v7);
      v6 = v7;
    }

  }
}

- (void)startWithDelegate:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id completionHandler;
  void *v9;
  OS_dispatch_queue *serializationQueue;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  completionHandler = self->completionHandler;
  self->completionHandler = v7;

  -[PFRWSampleBufferChannel assetWriterInput](self, "assetWriterInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  serializationQueue = self->serializationQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PFRWSampleBufferChannel_startWithDelegate_completionHandler___block_invoke;
  v12[3] = &unk_1E45A4B40;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "requestMediaDataWhenReadyOnQueue:usingBlock:", serializationQueue, v12);

}

- (void)cancel
{
  NSObject *serializationQueue;
  _QWORD block[5];

  serializationQueue = self->serializationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PFRWSampleBufferChannel_cancel__block_invoke;
  block[3] = &unk_1E45A4AC8;
  block[4] = self;
  dispatch_async(serializationQueue, block);
}

- (BOOL)useAdaptor
{
  return self->_useAdaptor;
}

- (void)setUseAdaptor:(BOOL)a3
{
  self->_useAdaptor = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_assetWriterInput;
}

- (void)setAssetWriterInput:(id)a3
{
  objc_storeStrong((id *)&self->_assetWriterInput, a3);
}

- (AVAssetReaderOutput)assetReaderOutput
{
  return self->_assetReaderOutput;
}

- (void)setAssetReaderOutput:(id)a3
{
  objc_storeStrong((id *)&self->_assetReaderOutput, a3);
}

- (AVAssetWriterInputPixelBufferAdaptor)adaptor
{
  return self->_adaptor;
}

- (void)setAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->_adaptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptor, 0);
  objc_storeStrong((id *)&self->_assetReaderOutput, 0);
  objc_storeStrong((id *)&self->_assetWriterInput, 0);
  objc_storeStrong((id *)&self->serializationQueue, 0);
  objc_storeStrong(&self->completionHandler, 0);
}

uint64_t __33__PFRWSampleBufferChannel_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNecessary");
}

void __63__PFRWSampleBufferChannel_startWithDelegate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  opaqueCMSampleBuffer *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  __CVPixelBufferPool *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  CMTime v18;
  CMTime v19;
  CVPixelBufferRef pixelBufferOut;

  if ((objc_msgSend(*(id *)(a1 + 32), "finished") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetWriterInput");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isReadyForMoreMediaData");

    if (v3)
    {
      do
      {
        v4 = (void *)MEMORY[0x1A1B0CDDC]();
        objc_msgSend(*(id *)(a1 + 32), "assetReaderOutput");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (opaqueCMSampleBuffer *)objc_msgSend(v5, "copyNextSampleBuffer");

        if (v6)
        {
          objc_msgSend(*(id *)(a1 + 32), "adaptor");
          v7 = objc_claimAutoreleasedReturnValue();
          if (v7 && (v8 = (void *)v7, v9 = objc_opt_respondsToSelector(), v8, (v9 & 1) != 0))
          {
            pixelBufferOut = 0;
            objc_msgSend(*(id *)(a1 + 32), "adaptor");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (__CVPixelBufferPool *)objc_msgSend(v10, "pixelBufferPool");

            CVPixelBufferPoolCreatePixelBuffer(0, v11, &pixelBufferOut);
            memset(&v19, 0, sizeof(v19));
            CMSampleBufferGetPresentationTimeStamp(&v19, v6);
            objc_msgSend(*(id *)(a1 + 40), "sampleBufferChannel:didReadSampleBuffer:andMadeWriteSampleBuffer:", *(_QWORD *)(a1 + 32), v6, pixelBufferOut);
            objc_msgSend(*(id *)(a1 + 32), "adaptor");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v19;
            v13 = objc_msgSend(v12, "appendPixelBuffer:withPresentationTime:", pixelBufferOut, &v18);

            CFRelease(pixelBufferOut);
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(*(id *)(a1 + 40), "sampleBufferChannel:didReadSampleBuffer:", *(_QWORD *)(a1 + 32), v6);
            objc_msgSend(*(id *)(a1 + 32), "assetWriterInput");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v14, "appendSampleBuffer:", v6);

          }
          CFRelease(v6);
          v15 = v13 ^ 1;
        }
        else
        {
          v15 = 1;
        }
        objc_autoreleasePoolPop(v4);
        objc_msgSend(*(id *)(a1 + 32), "assetWriterInput");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isReadyForMoreMediaData");

      }
      while (v17 && !v15);
      if (v15)
        objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNecessary");
    }
  }
}

@end
