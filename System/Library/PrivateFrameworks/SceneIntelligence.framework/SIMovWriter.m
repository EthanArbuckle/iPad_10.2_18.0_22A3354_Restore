@implementation SIMovWriter

- (id)initWriterWithVideoURL:(id)a3 frameSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  SIMovWriter *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  AVAssetWriter *writer;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  AVAssetWriterInput *writerInput;
  uint64_t v23;
  AVAssetWriterInputPixelBufferAdaptor *inputAdaptor;
  NSObject *v25;
  SIMovWriter *v26;
  NSObject *v27;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  height = a4.height;
  width = a4.width;
  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SIMovWriter;
  v8 = -[SIMovWriter init](&v30, sel_init);
  if (!v8)
  {
LABEL_6:
    v26 = v8;
    goto LABEL_10;
  }
  v9 = objc_alloc(MEMORY[0x24BDB2400]);
  v10 = *MEMORY[0x24BDB1C40];
  v29 = 0;
  v11 = objc_msgSend(v9, "initWithURL:fileType:error:", v7, v10, &v29);
  v12 = v29;
  writer = v8->_writer;
  v8->_writer = (AVAssetWriter *)v11;

  if (v8->_writer)
  {
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = *MEMORY[0x24BDB2298];
    v16 = *MEMORY[0x24BDB2268];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)width);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDB2368];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)height);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, v16, v17, v18, v19, *MEMORY[0x24BDB2310], 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB2408], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x24BDB1D50], v20);
    v21 = objc_claimAutoreleasedReturnValue();
    writerInput = v8->_writerInput;
    v8->_writerInput = (AVAssetWriterInput *)v21;

    objc_msgSend(MEMORY[0x24BDB2418], "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", v8->_writerInput, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    inputAdaptor = v8->_inputAdaptor;
    v8->_inputAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)v23;

    -[SIMovWriter startRecording](v8, "startRecording");
    __SceneIntelligenceLogSharedInstance();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
      v33 = 1025;
      v34 = 48;
      _os_log_impl(&dword_21071A000, v25, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** start recording ***", buf, 0x12u);
    }

    goto LABEL_6;
  }
  __SceneIntelligenceLogSharedInstance();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136381187;
    v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
    v33 = 1025;
    v34 = 34;
    v35 = 2113;
    v36 = v12;
    _os_log_impl(&dword_21071A000, v27, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** Couldn't instantiate a AVAssetWriter with error %{private}@ ***", buf, 0x1Cu);
  }

  v26 = 0;
LABEL_10:

  return v26;
}

- (void)writeFrame:(__CVBuffer *)a3 andTime:(id *)a4
{
  AVAssetWriterInputPixelBufferAdaptor *inputAdaptor;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  _BYTE v16[28];
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[AVAssetWriterInput isReadyForMoreMediaData](self->_writerInput, "isReadyForMoreMediaData"))
  {
    inputAdaptor = self->_inputAdaptor;
    *(_OWORD *)v16 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v16[16] = a4->var3;
    if (!-[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:](inputAdaptor, "appendPixelBuffer:withPresentationTime:", a3, v16))
    {
      __SceneIntelligenceLogSharedInstance();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[AVAssetWriter error](self->_writer, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "code");
        -[AVAssetWriter error](self->_writer, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedDescription");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = objc_msgSend(v12, "UTF8String");
        *(_DWORD *)v16 = 136381443;
        *(_QWORD *)&v16[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
        *(_WORD *)&v16[12] = 1025;
        *(_DWORD *)&v16[14] = 59;
        *(_WORD *)&v16[18] = 2048;
        *(_QWORD *)&v16[20] = v10;
        v17 = 2081;
        v18 = v13;
        _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** assetWriter.error %ld %{private}s \n ***", v16, 0x26u);

      }
      __SceneIntelligenceLogSharedInstance();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = -[AVAssetWriter status](self->_writer, "status");
        *(_DWORD *)v16 = 136381187;
        *(_QWORD *)&v16[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
        *(_WORD *)&v16[12] = 1025;
        *(_DWORD *)&v16[14] = 60;
        *(_WORD *)&v16[18] = 1024;
        *(_DWORD *)&v16[20] = v15;
        _os_log_impl(&dword_21071A000, v14, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** assetWriter.status = %u\n ***", v16, 0x18u);
      }

    }
  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[SIMovWriter finishRecording](self, "finishRecording");
  __SceneIntelligenceLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136380931;
    v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
    v7 = 1025;
    v8 = 67;
    _os_log_impl(&dword_21071A000, v3, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** finish recording ***", buf, 0x12u);
  }

  v4.receiver = self;
  v4.super_class = (Class)SIMovWriter;
  -[SIMovWriter dealloc](&v4, sel_dealloc);
}

- (void)startRecording
{
  AVAssetWriter *writer;
  __int128 v4;
  uint64_t v5;

  -[AVAssetWriter addInput:](self->_writer, "addInput:", self->_writerInput);
  -[AVAssetWriter startWriting](self->_writer, "startWriting");
  writer = self->_writer;
  v4 = *MEMORY[0x24BDC0D88];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  -[AVAssetWriter startSessionAtSourceTime:](writer, "startSessionAtSourceTime:", &v4);
}

- (void)finishRecording
{
  -[AVAssetWriterInput markAsFinished](self->_writerInput, "markAsFinished");
  -[AVAssetWriter finishWritingWithCompletionHandler:](self->_writer, "finishWritingWithCompletionHandler:", &__block_literal_global);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAdaptor, 0);
  objc_storeStrong((id *)&self->_writerInput, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_trackName, 0);
}

@end
