@implementation RPClipWriter

- (RPClipWriter)initWithWindowSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  char *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  dispatch_group_t v13;
  void *v14;
  dispatch_queue_t v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;

  height = a3.height;
  width = a3.width;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[RPClipWriter initWithWindowSize:]";
    v21 = 1024;
    v22 = 60;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v18.receiver = self;
  v18.super_class = (Class)RPClipWriter;
  v6 = -[RPClipWriter init](&v18, "init");
  if (v6)
  {
    v7 = -[RPClipBuffer initForVideo:]([RPClipBuffer alloc], "initForVideo:", 1);
    v8 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v7;

    v9 = -[RPClipBuffer initForVideo:]([RPClipBuffer alloc], "initForVideo:", 0);
    v10 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v9;

    v11 = -[RPClipBuffer initForVideo:]([RPClipBuffer alloc], "initForVideo:", 0);
    v12 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v11;

    v13 = dispatch_group_create();
    v14 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v13;

    v15 = dispatch_queue_create("com.apple.ReplayKit.RPClipWriterQueue", 0);
    v16 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v15;

    *((CGFloat *)v6 + 7) = width;
    *((CGFloat *)v6 + 8) = height;
    *(_OWORD *)(v6 + 120) = *(_OWORD *)&kCMTimeNegativeInfinity.value;
    *((_QWORD *)v6 + 17) = kCMTimeNegativeInfinity.epoch;
  }
  return (RPClipWriter *)v6;
}

- (void)setupAssetWriter
{
  AVAssetWriterInput *videoInput;
  AVAssetWriterInput *audioInput1;
  AVAssetWriterInput *audioInput2;
  id v6;
  NSURL *outputURL;
  AVAssetWriter *v8;
  id v9;
  AVAssetWriter *assetWriter;
  AVAssetWriterInput *v11;
  AVAssetWriterInput *v12;
  void *v13;
  void *v14;
  AVAssetWriterInput *v15;
  AVAssetWriterInput *v16;
  AVAssetWriterInput *v17;
  AVAssetWriterInput *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];

  videoInput = self->_videoInput;
  self->_videoInput = 0;

  audioInput1 = self->_audioInput1;
  self->_audioInput1 = 0;

  audioInput2 = self->_audioInput2;
  self->_audioInput2 = 0;

  v6 = objc_alloc((Class)AVAssetWriter);
  outputURL = self->_outputURL;
  v24 = 0;
  v8 = (AVAssetWriter *)objc_msgSend(v6, "initWithURL:fileType:error:", outputURL, AVFileTypeMPEG4, &v24);
  v9 = v24;
  assetWriter = self->_assetWriter;
  self->_assetWriter = v8;

  if (v9)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100051D3C(v9);
  }
  else
  {
    v11 = (AVAssetWriterInput *)objc_msgSend(objc_alloc((Class)AVAssetWriterInput), "initWithMediaType:outputSettings:sourceFormatHint:", AVMediaTypeVideo, 0, -[RPClipBuffer getFormatDescription](self->_clipBufferVideo, "getFormatDescription"));
    v12 = self->_videoInput;
    self->_videoInput = v11;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_videoInput, "setExpectsMediaDataInRealTime:", 0);
    -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", self->_videoInput);
    v21 = 0;
    v20 = 0;
    v23 = 0;
    v22 = 0;
    v19 = 6619138;
    v25[0] = AVFormatIDKey;
    v25[1] = AVNumberOfChannelsKey;
    v26[0] = &off_100085BE8;
    v26[1] = &off_100085C00;
    v26[2] = &off_100085C58;
    v25[2] = AVSampleRateKey;
    v25[3] = AVChannelLayoutKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v19, 32));
    v25[4] = AVEncoderBitRateKey;
    v26[3] = v13;
    v26[4] = &off_100085C18;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 5));

    v15 = (AVAssetWriterInput *)objc_msgSend(objc_alloc((Class)AVAssetWriterInput), "initWithMediaType:outputSettings:", AVMediaTypeAudio, v14);
    v16 = self->_audioInput1;
    self->_audioInput1 = v15;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_audioInput1, "setExpectsMediaDataInRealTime:", 0);
    -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", self->_audioInput1);
    if (self->_enableMic)
    {
      v17 = (AVAssetWriterInput *)objc_msgSend(objc_alloc((Class)AVAssetWriterInput), "initWithMediaType:outputSettings:", AVMediaTypeAudio, v14);
      v18 = self->_audioInput2;
      self->_audioInput2 = v17;

      -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_audioInput2, "setExpectsMediaDataInRealTime:", 0);
      -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", self->_audioInput2);
    }

  }
}

- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  RPClipWriter *v12;

  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPClipWriter appendVideoSampleBuffer:]";
    v9 = 1024;
    v10 = 109;
    v11 = 2048;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %p", buf, 0x1Cu);
  }
  CFRetain(a3);
  v5 = objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004376C;
  v6[3] = &unk_100080EE0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  RPClipWriter *v12;

  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPClipWriter appendAudio1SampleBuffer:]";
    v9 = 1024;
    v10 = 133;
    v11 = 2048;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %p", buf, 0x1Cu);
  }
  CFRetain(a3);
  v5 = objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100043940;
  v6[3] = &unk_100080EE0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  RPClipWriter *v12;

  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPClipWriter appendAudio2SampleBuffer:]";
    v9 = 1024;
    v10 = 143;
    v11 = 2048;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %p", buf, 0x1Cu);
  }
  CFRetain(a3);
  v5 = objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100043AAC;
  v6[3] = &unk_100080EE0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)updateLatestSampleTime:(opaqueCMSampleBuffer *)a3
{
  double Seconds;
  CMTime latestCMSamplePresentationTime;
  CMTime v6;

  memset(&v6, 0, sizeof(v6));
  CMSampleBufferGetPresentationTimeStamp(&v6, a3);
  latestCMSamplePresentationTime = (CMTime)self->_latestCMSamplePresentationTime;
  Seconds = CMTimeGetSeconds(&latestCMSamplePresentationTime);
  latestCMSamplePresentationTime = v6;
  if (Seconds < CMTimeGetSeconds(&latestCMSamplePresentationTime))
    self->_latestCMSamplePresentationTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
}

- (void)queueAndWaitForSample:(int)a3 withAssetInput:(id)a4 withBuffer:(id)a5 didAppendIdleFrame:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *clipWriterQueue;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  RPClipWriter *v19;
  _QWORD *v20;
  _BYTE *v21;
  _QWORD *v22;
  int v23;
  BOOL v24;
  _QWORD v25[3];
  char v26;
  _QWORD v27[4];
  _BYTE buf[24];
  uint64_t v29;

  v10 = a4;
  v11 = a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 160;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v29 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v12 = objc_msgSend(v11, "count");
  *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v12;
  dispatch_group_enter((dispatch_group_t)self->_clipWriterDispatchGroup);
  clipWriterQueue = self->_clipWriterQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100043DAC;
  v16[3] = &unk_1000820C8;
  v23 = a3;
  v20 = v27;
  v21 = buf;
  v14 = v10;
  v17 = v14;
  v22 = v25;
  v15 = v11;
  v18 = v15;
  v19 = self;
  v24 = a6;
  objc_msgSend(v14, "requestMediaDataWhenReadyOnQueue:usingBlock:", clipWriterQueue, v16);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(buf, 8);

}

- (void)waitForCompletionAndFinishWriting:(id *)a3 withHandler:(id)a4
{
  id v6;
  NSObject *clipWriterDispatchGroup;
  NSObject *clipWriterQueue;
  id v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  int64_t var3;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v6 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]";
    v16 = 1024;
    v17 = 212;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  clipWriterDispatchGroup = self->_clipWriterDispatchGroup;
  clipWriterQueue = self->_clipWriterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044410;
  block[3] = &unk_1000820F0;
  v12 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_group_notify(clipWriterDispatchGroup, clipWriterQueue, block);

}

- (void)flushClipBuffer
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  RPClipWriter *v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v6 = "-[RPClipWriter flushClipBuffer]";
    v7 = 1024;
    v8 = 231;
    v9 = 2048;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3 = objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000446AC;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  double Seconds;
  NSObject *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  float v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  $95D729B680665BEAEFA1D6FCA8238556 *p_buf;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD block[8];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  int64_t epoch;
  _BYTE v41[24];
  $95D729B680665BEAEFA1D6FCA8238556 buf;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v9 = a3;
  v10 = a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 136446466;
    *(int64_t *)((char *)&buf.value + 4) = (int64_t)"-[RPClipWriter exportClipToURL:duration:completionHandler:]";
    LOWORD(buf.flags) = 1024;
    *(unsigned int *)((char *)&buf.flags + 2) = 240;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&buf, 0x12u);
  }
  v39 = *(_OWORD *)&self->_latestCMSamplePresentationTime.value;
  epoch = self->_latestCMSamplePresentationTime.epoch;
  buf = self->_latestCMSamplePresentationTime;
  Seconds = CMTimeGetSeconds((CMTime *)&buf);
  objc_storeStrong((id *)&self->_outputURL, a3);
  buf.value = 0;
  *(_QWORD *)&buf.timescale = &buf;
  buf.epoch = 0x3032000000;
  v43 = sub_100044C34;
  v44 = sub_100044C44;
  v45 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100044C34;
  v37 = sub_100044C44;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100044C34;
  v31 = sub_100044C44;
  v32 = 0;
  v12 = objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044C4C;
  block[3] = &unk_100082118;
  block[4] = self;
  block[5] = &buf;
  block[6] = &v33;
  block[7] = &v27;
  dispatch_sync(v12, block);

  self->_enableMic = objc_msgSend((id)v28[5], "getTotalNumberOfSamples") != 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100044CC4;
  v21[3] = &unk_100082140;
  p_buf = &buf;
  v24 = &v33;
  v25 = &v27;
  v13 = v10;
  v22 = v13;
  v14 = objc_retainBlock(v21);
  if (-[RPClipBuffer getTotalNumberOfSamples](self->_clipBufferVideo, "getTotalNumberOfSamples"))
  {
    -[RPClipWriter setupAssetWriter](self, "setupAssetWriter");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](AVMutableMetadataItem, "metadataItem"));
    objc_msgSend(v15, "setKeySpace:", AVMetadataKeySpaceQuickTimeMetadata);
    objc_msgSend(v15, "setKey:", AVMetadataQuickTimeMetadataKeyAuthor);
    objc_msgSend(v15, "setValue:", CFSTR("ReplayKitRecording"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v15, 0));
    -[AVAssetWriter setMetadata:](self->_assetWriter, "setMetadata:", v16);

    -[AVAssetWriter startWriting](self->_assetWriter, "startWriting");
    v17 = Seconds;
    self->_didAppendFirstSample = 0;
    if (self->_videoInput)
    {
      v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
      -[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:](self, "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:", 0, self->_videoInput, v18, objc_msgSend(*(id *)(*(_QWORD *)&buf.timescale + 40), "getSamplesForDuration:latestSeconds:withOutputArray:", v18, a4, v17));

    }
    if (self->_audioInput1)
    {
      v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
      -[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:](self, "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:", 1, self->_audioInput1, v19, objc_msgSend((id)v34[5], "getSamplesForDuration:latestSeconds:withOutputArray:", v19, a4, v17));

    }
    if (self->_audioInput2)
    {
      v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
      -[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:](self, "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:", 2, self->_audioInput2, v20, objc_msgSend((id)v28[5], "getSamplesForDuration:latestSeconds:withOutputArray:", v20, a4, v17));

    }
    *(_OWORD *)v41 = v39;
    *(_QWORD *)&v41[16] = epoch;
    -[RPClipWriter waitForCompletionAndFinishWriting:withHandler:](self, "waitForCompletionAndFinishWriting:withHandler:", v41, v14);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v41 = 136446466;
      *(_QWORD *)&v41[4] = "-[RPClipWriter exportClipToURL:duration:completionHandler:]";
      *(_WORD *)&v41[12] = 1024;
      *(_DWORD *)&v41[14] = 313;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d No video samples found", v41, 0x12u);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5822, 0));
    ((void (*)(_QWORD *, void *))v14[2])(v14, v15);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
}

- (id)dispatchClipWriterQueue
{
  if (qword_100095D18 != -1)
    dispatch_once(&qword_100095D18, &stru_100082160);
  return (id)qword_100095D10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInput2, 0);
  objc_storeStrong((id *)&self->_audioInput1, 0);
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_clipWriterQueue, 0);
  objc_storeStrong((id *)&self->_clipWriterDispatchGroup, 0);
  objc_storeStrong((id *)&self->_clipBufferMicAudio, 0);
  objc_storeStrong((id *)&self->_clipBufferAppAudio, 0);
  objc_storeStrong((id *)&self->_clipBufferVideo, 0);
}

@end
