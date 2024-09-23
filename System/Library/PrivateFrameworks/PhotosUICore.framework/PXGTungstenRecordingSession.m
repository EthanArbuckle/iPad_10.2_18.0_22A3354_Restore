@implementation PXGTungstenRecordingSession

- (PXGTungstenRecordingSession)initWithSerializer:(id)a3 directoryURL:(id)a4
{
  id v7;
  id v8;
  PXGTungstenRecordingSession *v9;
  PXGTungstenRecordingSession *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSURL *recordingURL;
  void *v17;
  void *v18;
  uint64_t v19;
  NSOutputStream *outputStream;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *outputQueue;
  NSObject *v26;
  _QWORD block[4];
  PXGTungstenRecordingSession *v29;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PXGTungstenRecordingSession;
  v9 = -[PXGTungstenRecordingSession init](&v30, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serializer, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v12, "setDateFormat:", CFSTR("YYYY.MM.dd_HH-mm-ss-SSSS"));
    objc_msgSend(v12, "stringFromDate:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TungstenRecording_%@.json"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    recordingURL = v10->_recordingURL;
    v10->_recordingURL = (NSURL *)v15;

    v17 = (void *)MEMORY[0x1E0C99E48];
    -[PXGTungstenRecordingSession recordingURL](v10, "recordingURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "outputStreamWithURL:append:", v18, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    outputStream = v10->_outputStream;
    v10->_outputStream = (NSOutputStream *)v19;

    -[PXGTungstenRecordingSession outputStream](v10, "outputStream");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "open");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_USER_INITIATED, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.photos.tungsten-recording", v23);
    outputQueue = v10->_outputQueue;
    v10->_outputQueue = (OS_dispatch_queue *)v24;

    -[PXGTungstenRecordingSession outputQueue](v10, "outputQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PXGTungstenRecordingSession_initWithSerializer_directoryURL___block_invoke;
    block[3] = &unk_1E5149198;
    v29 = v10;
    dispatch_async(v26, block);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[PXGTungstenRecordingSession isStopped](self, "isStopped"))
    -[PXGTungstenRecordingSession stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)PXGTungstenRecordingSession;
  -[PXGTungstenRecordingSession dealloc](&v3, sel_dealloc);
}

- (void)recordEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXGTungstenRecordingSession outputQueue](self, "outputQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PXGTungstenRecordingSession_recordEvent___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)stop
{
  NSObject *v3;
  NSObject *outputQueue;
  PXGTungstenRecordingSerializer *serializer;
  NSOutputStream *outputStream;
  OS_dispatch_queue *v7;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[PXGTungstenRecordingSession isStopped](self, "isStopped"))
  {
    PXAssertGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Error: Failed to stop recording session: session is already stopped", buf, 2u);
    }

  }
  else
  {
    outputQueue = self->_outputQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__PXGTungstenRecordingSession_stop__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_sync(outputQueue, block);
    -[NSOutputStream close](self->_outputStream, "close");
    serializer = self->_serializer;
    self->_serializer = 0;

    outputStream = self->_outputStream;
    self->_outputStream = 0;

    v7 = self->_outputQueue;
    self->_outputQueue = 0;

  }
}

- (BOOL)isStopped
{
  return self->_outputStream == 0;
}

- (void)startNextFrame
{
  PXGTungstenRecordingFrameState *v3;
  PXGTungstenRecordingFrameState *frameState;

  ++self->_frameNumber;
  v3 = objc_alloc_init(PXGTungstenRecordingFrameState);
  frameState = self->_frameState;
  self->_frameState = v3;

}

- (PXGTungstenRecordingFrameState)frameState
{
  return self->_frameState;
}

- (NSURL)recordingURL
{
  return self->_recordingURL;
}

- (int64_t)frameNumber
{
  return self->_frameNumber;
}

- (PXGTungstenRecordingSerializer)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setOutputStream:(id)a3
{
  objc_storeStrong((id *)&self->_outputStream, a3);
}

- (OS_dispatch_queue)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputQueue:(id)a3
{
  objc_storeStrong((id *)&self->_outputQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_recordingURL, 0);
  objc_storeStrong((id *)&self->_frameState, 0);
}

void __35__PXGTungstenRecordingSession_stop__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "serializer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "outputStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordingSessionWillEndToStream:", v2);

}

void __43__PXGTungstenRecordingSession_recordEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "serializer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "outputStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializeEvent:toStream:", v2, v3);

}

void __63__PXGTungstenRecordingSession_initWithSerializer_directoryURL___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "serializer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "outputStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordingSessionWillStartToStream:", v2);

}

@end
