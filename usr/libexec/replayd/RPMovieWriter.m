@implementation RPMovieWriter

- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4
{
  return -[RPMovieWriter initWithWindowSize:outputPath:videoCodecType:](self, "initWithWindowSize:outputPath:videoCodecType:", a4, AVVideoCodecTypeH264, a3.width, a3.height);
}

- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4 videoCodecType:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  RPMovieWriter *v11;
  const CMBufferCallbacks *CallbacksForUnsortedSampleBuffers;
  const CMBufferCallbacks *v13;
  const CMBufferCallbacks *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *movieWriterQueue;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *movieSaveQueue;
  UNUserNotificationCenter *v21;
  UNUserNotificationCenter *userNotificationCenter;
  __int128 v24;
  CMTimeEpoch epoch;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  RPMovieWriter *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)RPMovieWriter;
  v11 = -[RPMovieWriter init](&v26, "init");
  if (v11)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v28 = "-[RPMovieWriter initWithWindowSize:outputPath:videoCodecType:]";
      v29 = 1024;
      v30 = 119;
      v31 = 2048;
      v32 = v11;
      v33 = 2048;
      v34 = width;
      v35 = 2048;
      v36 = height;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p window size width %.1f x height:%.1f", buf, 0x30u);
    }
    -[RPMovieWriter setOutputPath:](v11, "setOutputPath:", v9);
    -[RPMovieWriter setOriginalOutputPath:](v11, "setOriginalOutputPath:", v9);
    -[RPMovieWriter setAssetWriterStartCount:](v11, "setAssetWriterStartCount:", 0);
    -[RPMovieWriter setWindowSize:](v11, "setWindowSize:", width, height);
    -[RPMovieWriter setDidProcessFirstSample:](v11, "setDidProcessFirstSample:", 0);
    -[RPMovieWriter setIsFinishingWriting:](v11, "setIsFinishingWriting:", 0);
    v24 = *(_OWORD *)&kCMTimeInvalid.value;
    epoch = kCMTimeInvalid.epoch;
    -[RPMovieWriter setTrimVideoPresentationTime:](v11, "setTrimVideoPresentationTime:", &v24);
    -[RPMovieWriter setVideoCodecType:](v11, "setVideoCodecType:", v10);
    CallbacksForUnsortedSampleBuffers = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(kCFAllocatorDefault, 0, CallbacksForUnsortedSampleBuffers, &v11->_audioBufferQueue1);
    v13 = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(kCFAllocatorDefault, 0, v13, &v11->_audioBufferQueue2);
    v14 = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(kCFAllocatorDefault, 0, v14, &v11->_videoBufferQueue);
    v15 = dispatch_queue_create("com.apple.ReplayKit.RPMovieWriterQueue", 0);
    movieWriterQueue = v11->_movieWriterQueue;
    v11->_movieWriterQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("com.apple.ReplayKit.movieSaveQueue", v18);
    movieSaveQueue = v11->_movieSaveQueue;
    v11->_movieSaveQueue = (OS_dispatch_queue *)v19;

    v21 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.ReplayKitNotifications"));
    userNotificationCenter = v11->_userNotificationCenter;
    v11->_userNotificationCenter = v21;

    -[UNUserNotificationCenter setDelegate:](v11->_userNotificationCenter, "setDelegate:", v11);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v11->_userNotificationCenter, "setWantsNotificationResponsesDelivered");

  }
  return v11;
}

- (void)startWritingHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000075A4;
  v7[3] = &unk_100080E90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4
{
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  _QWORD block[7];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v7 = objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  block[1] = 3221225472;
  v8 = *(_OWORD *)&a4->c;
  v12 = *(_OWORD *)&a4->a;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100007850;
  block[3] = &unk_100080EB8;
  block[4] = self;
  block[5] = &v15;
  block[6] = a3;
  v9 = *(_OWORD *)&a4->tx;
  v13 = v8;
  v14 = v9;
  dispatch_sync(v7, block);

  LOBYTE(a4) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)a4;
}

- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000791C;
  v6[3] = &unk_100080EE0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000079A0;
  v6[3] = &unk_100080EE0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)finishWritingWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPMovieWriter finishWritingWithHandler:]";
    v11 = 1024;
    v12 = 188;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007AE8;
  v7[3] = &unk_100080E90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)finishWritingAndSaveToCameraRollWithSessionID:(id)a3 mixAudioTracks:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;

  v8 = a3;
  v9 = a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "-[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]";
    v18 = 1024;
    v19 = 263;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008204;
  v12[3] = &unk_100080F30;
  v13 = v8;
  v14 = v9;
  v12[4] = self;
  v15 = a4;
  v10 = v8;
  v11 = v9;
  -[RPMovieWriter finishWritingWithHandler:](self, "finishWritingWithHandler:", v12);

}

- (void)trimMovieWithURL:(id)a3 startClipDuration:(double)a4 endClipDuration:(double)a5 outputFileURL:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  double v23;
  double v24;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000085D4;
  block[3] = &unk_100080F80;
  v21 = v12;
  v22 = v14;
  v20 = v13;
  v23 = a4;
  v24 = a5;
  v16 = v12;
  v17 = v14;
  v18 = v13;
  dispatch_async(v15, block);

}

- (void)dealloc
{
  opaqueCMBufferQueue *audioBufferQueue1;
  opaqueCMBufferQueue *audioBufferQueue2;
  opaqueCMBufferQueue *videoBufferQueue;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  RPMovieWriter *v12;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPMovieWriter dealloc]";
    v9 = 1024;
    v10 = 346;
    v11 = 2048;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  audioBufferQueue1 = self->_audioBufferQueue1;
  if (audioBufferQueue1)
    CFRelease(audioBufferQueue1);
  audioBufferQueue2 = self->_audioBufferQueue2;
  if (audioBufferQueue2)
    CFRelease(audioBufferQueue2);
  videoBufferQueue = self->_videoBufferQueue;
  if (videoBufferQueue)
    CFRelease(videoBufferQueue);
  v6.receiver = self;
  v6.super_class = (Class)RPMovieWriter;
  -[RPMovieWriter dealloc](&v6, "dealloc");
}

- (NSURL)outputURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter outputPath](self, "outputPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));

  return (NSURL *)v3;
}

- (void)updateOutputPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unsigned int v19;

  -[RPMovieWriter setAssetWriterStartCount:](self, "setAssetWriterStartCount:", -[RPMovieWriter assetWriterStartCount](self, "assetWriterStartCount") + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter originalOutputPath](self, "originalOutputPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingPathExtension"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%d.%@"), v7, -[RPMovieWriter assetWriterStartCount](self, "assetWriterStartCount"), v5));
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter outputPath](self, "outputPath"));
    *(_DWORD *)buf = 136447234;
    v11 = "-[RPMovieWriter updateOutputPath]";
    v12 = 1024;
    v13 = 362;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v8;
    v18 = 1024;
    v19 = -[RPMovieWriter assetWriterStartCount](self, "assetWriterStartCount");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Updating the AVAssetWriter path from %@ to %@ with start count of %d", buf, 0x2Cu);

  }
  -[RPMovieWriter setOutputPath:](self, "setOutputPath:", v8);

}

- (id)averageVideoBitrate
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  NSString *videoCodecType;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  NSString *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("RPBitRateOverride")));

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[RPMovieWriter windowSize](self, "windowSize");
    v7 = v6 * 11.4;
    -[RPMovieWriter windowSize](self, "windowSize");
    if ((uint64_t)(v7 * v8) <= 64000)
      v9 = 64000;
    else
      v9 = (uint64_t)(v7 * v8);
    if (-[NSString isEqualToString:](self->_videoCodecType, "isEqualToString:", AVVideoCodecTypeHEVC))
      v10 = 15000000;
    else
      v10 = 25000000;
    if (v9 <= v10)
    {
      v10 = v9;
    }
    else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      videoCodecType = self->_videoCodecType;
      v14 = 136447234;
      v15 = "-[RPMovieWriter averageVideoBitrate]";
      v16 = 1024;
      v17 = 381;
      v18 = 2048;
      v19 = v9;
      v20 = 2048;
      v21 = v10;
      v22 = 2112;
      v23 = videoCodecType;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d bitrate=%ld exceed maxBitrate=%ld for videoCodecType=%@, cap at max", (uint8_t *)&v14, 0x30u);
    }
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
  }
  v12 = v5;

  return v12;
}

- (void)setUpAssetWriterWithHandler:(id)a3
{
  void (**v4)(id, void *);
  CMTimeEpoch v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  id *v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  void *v53;
  id v54;
  __int128 v55;
  CMTimeEpoch v56;
  __int128 v57;
  CMTimeEpoch v58;
  __int128 v59;
  CMTimeEpoch epoch;
  _QWORD v61[5];
  _QWORD v62[5];
  uint8_t buf[4];
  const char *v64;
  uint64_t v65;
  id v66;
  int v67;
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[4];

  v4 = (void (**)(id, void *))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v64 = "-[RPMovieWriter setUpAssetWriterWithHandler:]";
    LOWORD(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 2) = 388;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  -[RPMovieWriter updateOutputPath](self, "updateOutputPath");
  CMBufferQueueReset(self->_videoBufferQueue);
  CMBufferQueueReset(self->_audioBufferQueue1);
  CMBufferQueueReset(self->_audioBufferQueue2);
  v59 = *(_OWORD *)&kCMTimeInvalid.value;
  v52 = v59;
  epoch = kCMTimeInvalid.epoch;
  v5 = epoch;
  -[RPMovieWriter setLastVideoPresentationTime:](self, "setLastVideoPresentationTime:", &v59);
  v57 = v52;
  v58 = v5;
  -[RPMovieWriter setLastAudio1PresentationTime:](self, "setLastAudio1PresentationTime:", &v57);
  v55 = v52;
  v56 = v5;
  -[RPMovieWriter setLastAudio2PresentationTime:](self, "setLastAudio2PresentationTime:", &v55);
  v6 = objc_alloc((Class)AVAssetWriter);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter outputURL](self, "outputURL"));
  v54 = 0;
  v8 = objc_msgSend(v6, "initWithURL:fileType:error:", v7, AVFileTypeMPEG4, &v54);
  v9 = v54;
  -[RPMovieWriter setAssetWriter:](self, "setAssetWriter:", v8);

  if (!v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](AVMutableMetadataItem, "metadataItem"));
    objc_msgSend(v11, "setKeySpace:", AVMetadataKeySpaceQuickTimeMetadata);
    objc_msgSend(v11, "setKey:", AVMetadataQuickTimeMetadataKeyAuthor);
    objc_msgSend(v11, "setValue:", CFSTR("ReplayKitRecording"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v11, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    objc_msgSend(v13, "setMetadata:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter averageVideoBitrate](self, "averageVideoBitrate"));
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v15, "integerValue");
      *(_DWORD *)buf = 136446722;
      v64 = "-[RPMovieWriter setUpAssetWriterWithHandler:]";
      v65 = 0x800000001AF0400;
      v66 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d bit rate set to %ld", buf, 0x1Cu);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoCodecType](self, "videoCodecType"));
    v18 = objc_msgSend(v17, "isEqualToString:", AVVideoCodecTypeH264);

    if ((v18 & 1) != 0)
    {
      v19 = (id *)&AVVideoProfileLevelH264HighAutoLevel;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoCodecType](self, "videoCodecType"));
      v21 = objc_msgSend(v20, "isEqualToString:", AVVideoCodecTypeHEVC);

      if (!v21)
      {
        v22 = 0;
LABEL_18:
        v70[0] = AVVideoExpectedSourceFrameRateKey;
        v70[1] = AVVideoProfileLevelKey;
        v71[0] = &off_1000859F0;
        v71[1] = v22;
        v51 = v22;
        v70[2] = AVVideoAverageBitRateKey;
        v70[3] = AVVideoMaxKeyFrameIntervalKey;
        v53 = v15;
        v71[2] = v15;
        v71[3] = &off_1000859F0;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 4));
        objc_msgSend(v14, "addEntriesFromDictionary:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPBroadcastConfiguration videoCompressionProperties](self->_broadcastConfig, "videoCompressionProperties"));
        if (v24)
        {
          if (dword_100095B40 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v64 = "-[RPMovieWriter setUpAssetWriterWithHandler:]";
            LOWORD(v65) = 1024;
            *(_DWORD *)((char *)&v65 + 2) = 448;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d using custom video compression properties", buf, 0x12u);
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPBroadcastConfiguration videoCompressionProperties](self->_broadcastConfig, "videoCompressionProperties"));
          objc_msgSend(v14, "addEntriesFromDictionary:", v25);

        }
        -[RPMovieWriter windowSize](self, "windowSize");
        if ((uint64_t)v26 >= -1)
          v27 = (uint64_t)v26 + 1;
        else
          v27 = (uint64_t)v26 + 2;
        v28 = (double)(uint64_t)(v27 & 0xFFFFFFFFFFFFFFFELL);
        -[RPMovieWriter windowSize](self, "windowSize");
        if ((uint64_t)v29 >= -1)
          v30 = (uint64_t)v29 + 1;
        else
          v30 = (uint64_t)v29 + 2;
        v31 = (double)(uint64_t)(v30 & 0xFFFFFFFFFFFFFFFELL);
        v68[0] = AVVideoCodecKey;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoCodecType](self, "videoCodecType"));
        v69[0] = v32;
        v68[1] = AVVideoWidthKey;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
        v69[1] = v33;
        v68[2] = AVVideoHeightKey;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v31));
        v68[3] = AVVideoCompressionPropertiesKey;
        v69[2] = v34;
        v69[3] = v14;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 4));

        v36 = objc_msgSend(objc_alloc((Class)AVAssetWriterInput), "initWithMediaType:outputSettings:", AVMediaTypeVideo, v35);
        -[RPMovieWriter setVideoInput:](self, "setVideoInput:", v36);

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
        objc_msgSend(v37, "setExpectsMediaDataInRealTime:", 1);

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
        objc_msgSend(v38, "addInput:", v39);

        v65 = 0;
        v64 = 0;
        v66 = 0;
        v67 = 0;
        *(_DWORD *)buf = 6619138;
        v61[0] = AVFormatIDKey;
        v61[1] = AVNumberOfChannelsKey;
        v62[0] = &off_100085A08;
        v62[1] = &off_100085A20;
        v62[2] = &off_100085C48;
        v61[2] = AVSampleRateKey;
        v61[3] = AVChannelLayoutKey;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 32));
        v61[4] = AVEncoderBitRateKey;
        v62[3] = v40;
        v62[4] = &off_100085A38;
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 5));

        v42 = objc_msgSend(objc_alloc((Class)AVAssetWriterInput), "initWithMediaType:outputSettings:", AVMediaTypeAudio, v41);
        -[RPMovieWriter setAudioInput1:](self, "setAudioInput1:", v42);

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1"));
        objc_msgSend(v43, "setExpectsMediaDataInRealTime:", 1);

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1"));
        objc_msgSend(v44, "addInput:", v45);

        v46 = objc_msgSend(objc_alloc((Class)AVAssetWriterInput), "initWithMediaType:outputSettings:", AVMediaTypeAudio, v41);
        -[RPMovieWriter setAudioInput2:](self, "setAudioInput2:", v46);

        v47 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2"));
        objc_msgSend(v47, "setExpectsMediaDataInRealTime:", 1);

        v48 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2"));
        objc_msgSend(v48, "addInput:", v49);

        if (v4)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
          if (v50)
            v10 = 0;
          else
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5824, 0));

          goto LABEL_34;
        }
        goto LABEL_35;
      }
      v19 = (id *)&kVTProfileLevel_HEVC_Main_AutoLevel;
    }
    v22 = *v19;
    goto LABEL_18;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004C640(v9);
    if (!v4)
      goto LABEL_35;
    goto LABEL_8;
  }
  if (v4)
  {
LABEL_8:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5824, 0));
LABEL_34:
    v4[2](v4, v10);

  }
LABEL_35:

}

- (BOOL)dispatchedAppendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4
{
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  CMBufferRef v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unsigned __int8 v20;
  void *v22;
  __int128 v23;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastVideoPresentationTime;
  _BOOL4 v25;
  opaqueCMSampleBuffer *v26;
  CMTimeValue value;
  float v28;
  float v29;
  CMTimeEpoch v30;
  int v31;
  void *v32;
  __int128 v33;
  _QWORD v34[7];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CMTime time2;
  char v39;
  CMTime v40;
  int v41;
  CMTimeEpoch v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime buf[2];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  v8 = v7;
  if (!a3 || !v7)
  {

    return 1;
  }
  v9 = -[RPMovieWriter isFinishingWriting](self, "isFinishingWriting");

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    if (objc_msgSend(v10, "status") == (id)1)
    {
      v11 = -[RPMovieWriter didProcessFirstSample](self, "didProcessFirstSample");

      if (v11)
      {
        if (CMBufferQueueGetBufferCount(self->_videoBufferQueue) >= 5)
        {
          if (dword_100095B40 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf[0].value) = 136446466;
            *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSampleBuffer"
                                                                       ":withWindowTransform:]";
            LOWORD(buf[0].flags) = 1024;
            *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 503;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Dropping oldest sample buffer from video buffer queue", (uint8_t *)buf, 0x12u);
          }
          v12 = CMBufferQueueDequeueAndRetain(self->_videoBufferQueue);
          if (v12)
            CFRelease(v12);
        }
        if (CMBufferQueueEnqueue(self->_videoBufferQueue, a3))
        {
          if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_10004C6BC();
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
          if (objc_msgSend(v22, "isReadyForMoreMediaData"))
          {
            p_lastVideoPresentationTime = &self->_lastVideoPresentationTime;
            *(_QWORD *)&v23 = 136446722;
            v33 = v23;
            while (1)
            {
              v25 = CMBufferQueueIsEmpty(self->_videoBufferQueue) == 0;

              if (!v25)
                break;
              v26 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_videoBufferQueue);
              if (v26)
              {
                *(_OWORD *)&buf[0].value = *(_OWORD *)&p_lastVideoPresentationTime->value;
                buf[0].epoch = self->_lastVideoPresentationTime.epoch;
                time2 = kCMTimeInvalid;
                if (CMTimeCompare(buf, &time2))
                {
                  value = p_lastVideoPresentationTime->value;
                  CMSampleBufferGetPresentationTimeStamp(&v45, v26);
                  if (value >= v45.value)
                  {
                    if (dword_100095B40 <= 1
                      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf[0].value) = 136446466;
                      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSa"
                                                                                 "mpleBuffer:withWindowTransform:]";
                      LOWORD(buf[0].flags) = 1024;
                      *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 520;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d discarding video sample buffer due to timestamp earlier than previous", (uint8_t *)buf, 0x12u);
                    }
                    CFRelease(v26);
                    return 1;
                  }
                }
                else
                {
                  v28 = sub_100047668(a3);
                  if (dword_100095B40 <= 1)
                  {
                    v29 = v28;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf[0].value) = v33;
                      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSa"
                                                                                 "mpleBuffer:withWindowTransform:]";
                      LOWORD(buf[0].flags) = 1024;
                      *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 526;
                      WORD1(buf[0].epoch) = 2048;
                      *(double *)((char *)&buf[0].epoch + 4) = v29;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d video first sample received at time %.3f", (uint8_t *)buf, 0x1Cu);
                    }
                  }
                }
                CMSampleBufferGetPresentationTimeStamp(&v44, v26);
                v43 = v44;
                -[RPMovieWriter setLastVideoPresentationTime:](self, "setLastVideoPresentationTime:", &v43);
                if (dword_100095B40 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  -[RPMovieWriter lastVideoPresentationTime](self, "lastVideoPresentationTime");
                  v30 = v42;
                  -[RPMovieWriter lastVideoPresentationTime](self, "lastVideoPresentationTime");
                  v31 = v41;
                  CMSampleBufferGetDuration(&v40, v26);
                  LODWORD(buf[0].value) = 136447234;
                  *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSample"
                                                                             "Buffer:withWindowTransform:]";
                  LOWORD(buf[0].flags) = 1024;
                  *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 530;
                  WORD1(buf[0].epoch) = 2048;
                  *(CMTimeEpoch *)((char *)&buf[0].epoch + 4) = v30;
                  WORD2(buf[1].value) = 1024;
                  *(_DWORD *)((char *)&buf[1].value + 6) = v31;
                  HIWORD(buf[1].timescale) = 2048;
                  *(_QWORD *)&buf[1].flags = v40.value;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appending video sample with timestamp:%lld scale:%d duration:%lld", (uint8_t *)buf, 0x2Cu);
                }
                v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput", v33));
                objc_msgSend(v32, "appendSampleBuffer:", v26);

                CFRelease(v26);
              }
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput", v33));
              if ((objc_msgSend(v22, "isReadyForMoreMediaData") & 1) == 0)
                goto LABEL_40;
            }
          }
          else
          {
LABEL_40:

          }
        }
        return 1;
      }
    }
    else
    {

    }
    time2.value = 0;
    *(_QWORD *)&time2.timescale = &time2;
    time2.epoch = 0x2020000000;
    v39 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    v14 = objc_msgSend(v13, "status") == (id)3;

    if (v14)
    {
      if (-[RPMovieWriter didProcessFirstSample](self, "didProcessFirstSample"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter outputURL](self, "outputURL"));
        objc_msgSend(v15, "_srRemoveFile:completion:", v16, &stru_100080FA0);

      }
      v34[1] = 3221225472;
      v17 = *(_OWORD *)&a4->c;
      v35 = *(_OWORD *)&a4->a;
      v34[0] = _NSConcreteStackBlock;
      v34[2] = sub_100009F38;
      v34[3] = &unk_100080FC8;
      v34[4] = self;
      v34[5] = &time2;
      v34[6] = a3;
      v18 = *(_OWORD *)&a4->tx;
      v36 = v17;
      v37 = v18;
      -[RPMovieWriter setUpAssetWriterWithHandler:](self, "setUpAssetWriterWithHandler:", v34);
    }
    else
    {
      v19 = *(_OWORD *)&a4->c;
      *(_OWORD *)&buf[0].value = *(_OWORD *)&a4->a;
      *(_OWORD *)&buf[0].epoch = v19;
      *(_OWORD *)&buf[1].timescale = *(_OWORD *)&a4->tx;
      v20 = -[RPMovieWriter appendInitialSampleBuffer:withTransform:](self, "appendInitialSampleBuffer:withTransform:", a3, buf);
      *(_BYTE *)(*(_QWORD *)&time2.timescale + 24) = v20;
    }
    _Block_object_dispose(&time2, 8);
  }
  return 1;
}

- (BOOL)appendInitialSampleBuffer:(opaqueCMSampleBuffer *)a3 withTransform:(CGAffineTransform *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  unsigned int v30;
  const char *v31;
  _BOOL4 v32;
  _OWORD v34[3];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CMTime v38;
  CMTime buf;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    LODWORD(buf.value) = 136446722;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
    LOWORD(buf.flags) = 1024;
    *(CMTimeFlags *)((char *)&buf.flags + 2) = 578;
    WORD1(buf.epoch) = 1024;
    HIDWORD(buf.epoch) = objc_msgSend(v7, "status");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer status %d", (uint8_t *)&buf, 0x18u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if (objc_msgSend(v8, "status") == (id)1)
  {

    goto LABEL_11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  v10 = objc_msgSend(v9, "status");

  if (v10 == (id)3)
  {
LABEL_11:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    v18 = objc_msgSend(v17, "status");

    if (v18 == (id)1)
    {
      memset(&buf, 0, sizeof(buf));
      CMSampleBufferGetPresentationTimeStamp(&buf, a3);
      if ((buf.flags & 1) == 0)
      {
        if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10004C830((uint64_t)&buf.flags, v19, v20, v21, v22, v23, v24, v25);
        goto LABEL_35;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
      v38 = buf;
      objc_msgSend(v26, "startSessionAtSourceTime:", &v38);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
      v28 = objc_msgSend(v27, "isReadyForMoreMediaData");

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
        v30 = objc_msgSend(v29, "appendSampleBuffer:", a3);

        -[RPMovieWriter setDidProcessFirstSample:](self, "setDidProcessFirstSample:", 1);
        if (!v30)
        {
          if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_10004C8C0();
          goto LABEL_35;
        }
        if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_35:
          LOBYTE(v32) = 1;
          return v32;
        }
        LODWORD(v38.value) = 136446466;
        *(CMTimeValue *)((char *)&v38.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
        LOWORD(v38.flags) = 1024;
        *(CMTimeFlags *)((char *)&v38.flags + 2) = 603;
        v31 = " [INFO] %{public}s:%d asset writer appended first sample";
      }
      else
      {
        if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        LODWORD(v38.value) = 136446466;
        *(CMTimeValue *)((char *)&v38.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
        LOWORD(v38.flags) = 1024;
        *(CMTimeFlags *)((char *)&v38.flags + 2) = 608;
        v31 = " [INFO] %{public}s:%d asset writer started but video input not ready for data";
      }
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v38, 0x12u);
      goto LABEL_35;
    }
    goto LABEL_24;
  }
  v11 = *(_OWORD *)&a4->c;
  v35 = *(_OWORD *)&a4->a;
  v36 = v11;
  v37 = *(_OWORD *)&a4->tx;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  objc_msgSend(v12, "setTransform:", v34);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  v14 = objc_msgSend(v13, "startWriting");

  if ((v14 & 1) != 0)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
      v16 = objc_msgSend(v15, "status");
      LODWORD(buf.value) = 136446722;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = 585;
      WORD1(buf.epoch) = 1024;
      HIDWORD(buf.epoch) = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer started with status %d", (uint8_t *)&buf, 0x18u);

    }
    goto LABEL_11;
  }
  if (dword_100095B40 > 2)
  {
LABEL_27:
    LOBYTE(v32) = 0;
    return v32;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004C9B8(self);
LABEL_24:
  if (dword_100095B40 > 2)
    goto LABEL_27;
  v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v32)
  {
    sub_10004C93C();
    goto LABEL_27;
  }
  return v32;
}

- (void)dispatchedAppendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  unsigned __int8 v6;
  unsigned int v7;
  void *v8;
  __int128 v9;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastAudio1PresentationTime;
  int IsEmpty;
  opaqueCMSampleBuffer *v12;
  opaqueCMSampleBuffer *v13;
  CMTimeValue value;
  float v15;
  float v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  CMTime v23;
  int v24;
  uint64_t v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  CMTime time2;
  _BYTE time1[28];
  __int16 v31;
  int v32;
  __int16 v33;
  CMTimeValue v34;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if (!a3 || !v5)
    goto LABEL_11;
  v21 = v5;
  v6 = -[RPMovieWriter isFinishingWriting](self, "isFinishingWriting");

  if ((v6 & 1) != 0)
    return;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if (objc_msgSend(v22, "status") != (id)1)
  {
    v5 = v22;
LABEL_11:

    return;
  }
  v7 = -[RPMovieWriter didProcessFirstSample](self, "didProcessFirstSample");

  if (v7)
  {
    if (CMBufferQueueEnqueue(self->_audioBufferQueue1, a3))
    {
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004CAA8();
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1"));
      if (objc_msgSend(v8, "isReadyForMoreMediaData"))
      {
        p_lastAudio1PresentationTime = &self->_lastAudio1PresentationTime;
        *(_QWORD *)&v9 = 136446722;
        v20 = v9;
        while (1)
        {
          IsEmpty = CMBufferQueueIsEmpty(self->_audioBufferQueue1);

          if (IsEmpty)
            break;
          v12 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_audioBufferQueue1);
          if (v12)
          {
            v13 = v12;
            *(_OWORD *)time1 = *(_OWORD *)&p_lastAudio1PresentationTime->value;
            *(_QWORD *)&time1[16] = self->_lastAudio1PresentationTime.epoch;
            time2 = kCMTimeInvalid;
            if (CMTimeCompare((CMTime *)time1, &time2))
            {
              value = p_lastAudio1PresentationTime->value;
              CMSampleBufferGetPresentationTimeStamp(&v28, v13);
              if (value >= v28.value)
              {
                if (dword_100095B40 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = 136446466;
                  *(_QWORD *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio1SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 640;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d discarding audio 1 sample buffer due to timestamp earlier than previous", time1, 0x12u);
                }
                CFRelease(v13);
                return;
              }
            }
            else
            {
              v15 = sub_100047668(a3);
              if (dword_100095B40 <= 1)
              {
                v16 = v15;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = v20;
                  *(_QWORD *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio1SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 646;
                  *(_WORD *)&time1[18] = 2048;
                  *(double *)&time1[20] = v16;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d audio first sample received at time %.3f", time1, 0x1Cu);
                }
              }
            }
            CMSampleBufferGetPresentationTimeStamp(&v27, v13);
            v26 = v27;
            -[RPMovieWriter setLastAudio1PresentationTime:](self, "setLastAudio1PresentationTime:", &v26);
            if (dword_100095B40 <= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              -[RPMovieWriter lastAudio1PresentationTime](self, "lastAudio1PresentationTime");
              v17 = v25;
              -[RPMovieWriter lastAudio1PresentationTime](self, "lastAudio1PresentationTime");
              v18 = v24;
              CMSampleBufferGetDuration(&v23, v13);
              *(_DWORD *)time1 = 136447234;
              *(_QWORD *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio1SampleBuffer:]";
              *(_WORD *)&time1[12] = 1024;
              *(_DWORD *)&time1[14] = 650;
              *(_WORD *)&time1[18] = 2048;
              *(_QWORD *)&time1[20] = v17;
              v31 = 1024;
              v32 = v18;
              v33 = 2048;
              v34 = v23.value;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appending app audio sample with timestamp:%lld scale:%d duration:%lld", time1, 0x2Cu);
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1", v20));
            objc_msgSend(v19, "appendSampleBuffer:", v13);

            CFRelease(v13);
          }
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1", v20));
          if ((objc_msgSend(v8, "isReadyForMoreMediaData") & 1) == 0)
            goto LABEL_27;
        }
      }
      else
      {
LABEL_27:

      }
    }
  }
}

- (void)dispatchedAppendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  unsigned __int8 v6;
  unsigned int v7;
  void *v8;
  __int128 v9;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastAudio2PresentationTime;
  int IsEmpty;
  opaqueCMSampleBuffer *v12;
  opaqueCMSampleBuffer *v13;
  CMTimeValue value;
  float v15;
  float v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  CMTime v23;
  int v24;
  uint64_t v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  CMTime time2;
  _BYTE time1[28];
  __int16 v31;
  int v32;
  __int16 v33;
  CMTimeValue v34;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if (!a3 || !v5)
    goto LABEL_11;
  v21 = v5;
  v6 = -[RPMovieWriter isFinishingWriting](self, "isFinishingWriting");

  if ((v6 & 1) != 0)
    return;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if (objc_msgSend(v22, "status") != (id)1)
  {
    v5 = v22;
LABEL_11:

    return;
  }
  v7 = -[RPMovieWriter didProcessFirstSample](self, "didProcessFirstSample");

  if (v7)
  {
    if (CMBufferQueueEnqueue(self->_audioBufferQueue2, a3))
    {
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004CB24();
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2"));
      if (objc_msgSend(v8, "isReadyForMoreMediaData"))
      {
        p_lastAudio2PresentationTime = &self->_lastAudio2PresentationTime;
        *(_QWORD *)&v9 = 136446722;
        v20 = v9;
        while (1)
        {
          IsEmpty = CMBufferQueueIsEmpty(self->_audioBufferQueue2);

          if (IsEmpty)
            break;
          v12 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_audioBufferQueue2);
          if (v12)
          {
            v13 = v12;
            *(_OWORD *)time1 = *(_OWORD *)&p_lastAudio2PresentationTime->value;
            *(_QWORD *)&time1[16] = self->_lastAudio2PresentationTime.epoch;
            time2 = kCMTimeInvalid;
            if (CMTimeCompare((CMTime *)time1, &time2))
            {
              value = p_lastAudio2PresentationTime->value;
              CMSampleBufferGetPresentationTimeStamp(&v28, v13);
              if (value >= v28.value)
              {
                if (dword_100095B40 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = 136446466;
                  *(_QWORD *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio2SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 684;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d discarding audio 2 sample buffer due to timestamp earlier than previous", time1, 0x12u);
                }
                CFRelease(v13);
                return;
              }
            }
            else
            {
              v15 = sub_100047668(a3);
              if (dword_100095B40 <= 1)
              {
                v16 = v15;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = v20;
                  *(_QWORD *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio2SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 690;
                  *(_WORD *)&time1[18] = 2048;
                  *(double *)&time1[20] = v16;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d mic first sample received at time %.3f", time1, 0x1Cu);
                }
              }
            }
            CMSampleBufferGetPresentationTimeStamp(&v27, v13);
            v26 = v27;
            -[RPMovieWriter setLastAudio2PresentationTime:](self, "setLastAudio2PresentationTime:", &v26);
            if (dword_100095B40 <= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              -[RPMovieWriter lastAudio2PresentationTime](self, "lastAudio2PresentationTime");
              v17 = v25;
              -[RPMovieWriter lastAudio2PresentationTime](self, "lastAudio2PresentationTime");
              v18 = v24;
              CMSampleBufferGetDuration(&v23, v13);
              *(_DWORD *)time1 = 136447234;
              *(_QWORD *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio2SampleBuffer:]";
              *(_WORD *)&time1[12] = 1024;
              *(_DWORD *)&time1[14] = 694;
              *(_WORD *)&time1[18] = 2048;
              *(_QWORD *)&time1[20] = v17;
              v31 = 1024;
              v32 = v18;
              v33 = 2048;
              v34 = v23.value;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appending mic audio sample with timestamp:%lld scale:%d duration:%lld", time1, 0x2Cu);
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2", v20));
            objc_msgSend(v19, "appendSampleBuffer:", v13);

            CFRelease(v13);
          }
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2", v20));
          if ((objc_msgSend(v8, "isReadyForMoreMediaData") & 1) == 0)
            goto LABEL_27;
        }
      }
      else
      {
LABEL_27:

      }
    }
  }
}

- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 handler:(id)a5
{
  -[RPMovieWriter saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:](self, "saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:", a3, a4, 1, a5);
}

- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 mixAudioTracks:(BOOL)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *movieSaveQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  movieSaveQueue = self->_movieSaveQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ADB8;
  block[3] = &unk_100081040;
  v21 = a5;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(movieSaveQueue, block);

}

- (id)createAssetURLFromPhotosIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://asset?uuid=%@&albumname=camera-roll"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));

  return v5;
}

- (void)displayScreenRecorderNotificationWithURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  RPMovieWriter *v11;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPMovieWriter displayScreenRecorderNotificationWithURL:]";
    v8 = 1024;
    v9 = 776;
    v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v6, 0x1Cu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter createNotificationRequestWithAssetURL:](self, "createNotificationRequestWithAssetURL:", v4));
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v5, &stru_100081060);

}

- (id)createNotificationRequestWithAssetURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  RPMovieWriter *v21;
  _QWORD v22[2];
  const __CFString *v23;
  id v24;

  v4 = a3;
  v21 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter createAssetURLFromPhotosIdentifier:](self, "createAssetURLFromPhotosIdentifier:", v4));
  v6 = objc_alloc_init((Class)UNMutableNotificationContent);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("CONTROL_CENTER_TITLE")));
  objc_msgSend(v6, "setTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_BULLETIN_MESSAGE")));
  objc_msgSend(v6, "setBody:", v8);

  objc_msgSend(v6, "setThreadIdentifier:", CFSTR("orginalRecordID"));
  if (v4)
  {
    v23 = CFSTR("photoAssetIdKey");
    v24 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    objc_msgSend(v6, "setUserInfo:", v9);

  }
  objc_msgSend(v6, "setDefaultActionURL:", v5);
  objc_msgSend(v6, "setShouldIgnoreDoNotDisturb:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("photo.fill")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("SYSTEM_RECORDING_LONG_PRESS_VIEW")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:url:options:icon:](UNNotificationAction, "actionWithIdentifier:title:url:options:icon:", CFSTR("viewAction"), v11, v5, 0, v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("xmark.circle")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("SYSTEM_RECORDING_LONG_PRESS_DELETE")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("deleteAction"), v14, 3, v13));

  v22[0] = v12;
  v22[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("orginalRecordID"), v16, &__NSArray0__struct, 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v17));
  -[UNUserNotificationCenter setNotificationCategories:](v21->_userNotificationCenter, "setNotificationCategories:", v18);

  objc_msgSend(v6, "setCategoryIdentifier:", CFSTR("orginalRecordID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", CFSTR("orginalRecordID"), v6, 0));

  return v19;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  RPMovieWriter *v34;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v30 = "-[RPMovieWriter userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    v31 = 1024;
    v32 = 837;
    v33 = 2048;
    v34 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionIdentifier"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("deleteAction"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notification"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "request"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "content"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));

    if (!v16)
      goto LABEL_20;
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("photoAssetIdKey")));
    if (!v17)
      goto LABEL_20;
    v18 = (void *)v17;
    v28 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v19, 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000B9C4;
      v26[3] = &unk_100080E00;
      v23 = v21;
      v27 = v23;
      v25 = 0;
      objc_msgSend(v22, "performChangesAndWait:error:", v26, &v25);
      v24 = v25;

      if (v24
        && dword_100095B40 <= 2
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10004CC98();
      }
      v10[2](v10);

    }
    else
    {
LABEL_20:
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004CC1C();
    }

  }
}

- (void)notifyRecordingMayBeStopped
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  -[RPMovieWriter lastVideoPresentationTime](self, "lastVideoPresentationTime");
  v3 = v5;
  v4 = v6;
  -[RPMovieWriter setTrimVideoPresentationTime:](self, "setTrimVideoPresentationTime:", &v3);
}

- (void)notifyRecordingResumed
{
  __int128 v2;
  CMTimeEpoch epoch;

  v2 = *(_OWORD *)&kCMTimeInvalid.value;
  epoch = kCMTimeInvalid.epoch;
  -[RPMovieWriter setTrimVideoPresentationTime:](self, "setTrimVideoPresentationTime:", &v2);
}

- (RPBroadcastConfiguration)broadcastConfig
{
  return self->_broadcastConfig;
}

- (void)setBroadcastConfig:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastConfig, a3);
}

- (BOOL)systemRecording
{
  return self->_systemRecording;
}

- (void)setSystemRecording:(BOOL)a3
{
  self->_systemRecording = a3;
}

- (OS_dispatch_queue)movieWriterQueue
{
  return self->_movieWriterQueue;
}

- (OS_dispatch_queue)movieSaveQueue
{
  return self->_movieSaveQueue;
}

- (AVAssetWriter)assetWriter
{
  return self->_assetWriter;
}

- (void)setAssetWriter:(id)a3
{
  objc_storeStrong((id *)&self->_assetWriter, a3);
}

- (AVAssetWriterInput)videoInput
{
  return self->_videoInput;
}

- (void)setVideoInput:(id)a3
{
  objc_storeStrong((id *)&self->_videoInput, a3);
}

- (AVAssetWriterInput)audioInput1
{
  return self->_audioInput1;
}

- (void)setAudioInput1:(id)a3
{
  objc_storeStrong((id *)&self->_audioInput1, a3);
}

- (AVAssetWriterInput)audioInput2
{
  return self->_audioInput2;
}

- (void)setAudioInput2:(id)a3
{
  objc_storeStrong((id *)&self->_audioInput2, a3);
}

- (NSString)outputPath
{
  return self->_outputPath;
}

- (void)setOutputPath:(id)a3
{
  objc_storeStrong((id *)&self->_outputPath, a3);
}

- (NSString)originalOutputPath
{
  return self->_originalOutputPath;
}

- (void)setOriginalOutputPath:(id)a3
{
  objc_storeStrong((id *)&self->_originalOutputPath, a3);
}

- (int)assetWriterStartCount
{
  return self->_assetWriterStartCount;
}

- (void)setAssetWriterStartCount:(int)a3
{
  self->_assetWriterStartCount = a3;
}

- (CGSize)windowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_windowSize.width;
  height = self->_windowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setWindowSize:(CGSize)a3
{
  self->_windowSize = a3;
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (void)setVideoCodecType:(id)a3
{
  objc_storeStrong((id *)&self->_videoCodecType, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastVideoPresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (void)setLastVideoPresentationTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastVideoPresentationTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastVideoPresentationTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio1PresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setLastAudio1PresentationTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastAudio1PresentationTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastAudio1PresentationTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio2PresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (void)setLastAudio2PresentationTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastAudio2PresentationTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastAudio2PresentationTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimVideoPresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (void)setTrimVideoPresentationTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_trimVideoPresentationTime.epoch = a3->var3;
  *(_OWORD *)&self->_trimVideoPresentationTime.value = v3;
}

- (opaqueCMBufferQueue)audioBufferQueue1
{
  return self->_audioBufferQueue1;
}

- (void)setAudioBufferQueue1:(opaqueCMBufferQueue *)a3
{
  self->_audioBufferQueue1 = a3;
}

- (opaqueCMBufferQueue)audioBufferQueue2
{
  return self->_audioBufferQueue2;
}

- (void)setAudioBufferQueue2:(opaqueCMBufferQueue *)a3
{
  self->_audioBufferQueue2 = a3;
}

- (opaqueCMBufferQueue)videoBufferQueue
{
  return self->_videoBufferQueue;
}

- (void)setVideoBufferQueue:(opaqueCMBufferQueue *)a3
{
  self->_videoBufferQueue = a3;
}

- (BOOL)didProcessFirstSample
{
  return self->_didProcessFirstSample;
}

- (void)setDidProcessFirstSample:(BOOL)a3
{
  self->_didProcessFirstSample = a3;
}

- (BOOL)isFinishingWriting
{
  return self->_isFinishingWriting;
}

- (void)setIsFinishingWriting:(BOOL)a3
{
  self->_isFinishingWriting = a3;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(double)a3
{
  self->_durationInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCodecType, 0);
  objc_storeStrong((id *)&self->_originalOutputPath, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_audioInput2, 0);
  objc_storeStrong((id *)&self->_audioInput1, 0);
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_movieSaveQueue, 0);
  objc_storeStrong((id *)&self->_movieWriterQueue, 0);
  objc_storeStrong((id *)&self->_broadcastConfig, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end
