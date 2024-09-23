@implementation CRLBufferedReadChannel

- (CRLBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5
{
  return -[CRLBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:](self, "initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:", a3, 0x200000, a4, a5);
}

- (CRLBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CRLBufferedReadChannel;
  v14 = -[CRLBufferedReadChannel init](&v33, "init");
  if (v14)
  {
    if (v11)
    {
      if (v13)
        goto LABEL_4;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101235268);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF62B8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101235288);
      v23 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 68, 0, "invalid nil value for '%{public}s'", "sourceReadChannel");

      if (v13)
      {
LABEL_4:
        if (a4)
          goto LABEL_5;
        goto LABEL_26;
      }
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012352A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF622C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012352C8);
    v26 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 69, 0, "invalid nil value for '%{public}s'", "streamReadChannelBlock");

    if (a4)
    {
LABEL_5:
      if (v11 && v13)
      {
        v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v17 = dispatch_queue_create("CRLBufferedReadChannel.Read", v16);
        v18 = (void *)*((_QWORD *)v14 + 1);
        *((_QWORD *)v14 + 1) = v17;

        dispatch_queue_set_specific(*((dispatch_queue_t *)v14 + 1), off_1013D9400, off_1013D9400, 0);
        objc_storeStrong((id *)v14 + 2, a3);
        *((_QWORD *)v14 + 3) = a4;
        *((_QWORD *)v14 + 4) = 0x7FFFFFFFFFFFFFFFLL;
        v19 = objc_msgSend(v12, "copy");
        v20 = (void *)*((_QWORD *)v14 + 7);
        *((_QWORD *)v14 + 7) = v19;

        v21 = objc_retainBlock(v13);
        v22 = (void *)*((_QWORD *)v14 + 8);
        *((_QWORD *)v14 + 8) = v21;

        *((_QWORD *)v14 + 12) = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_36;
      }
LABEL_35:

      v14 = 0;
      goto LABEL_36;
    }
LABEL_26:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012352E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF61A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235308);
    v29 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 70, 0, "Buffer size too small: %zu", 0);

    goto LABEL_35;
  }
LABEL_36:

  return (CRLBufferedReadChannel *)v14;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLBufferedReadChannel _close](self, "_close");
  v3.receiver = self;
  v3.super_class = (Class)CRLBufferedReadChannel;
  -[CRLBufferedReadChannel dealloc](&v3, "dealloc");
}

- (void)close
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  NSObject *readQueue;
  _QWORD block[5];

  v3 = off_1013D9400;
  if (dispatch_get_specific(off_1013D9400) == v3)
    goto LABEL_3;
  v5 = objc_opt_class(NSNumber, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "threadDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRLBufferedReadChannelInvokingHandler")));
  v9 = sub_100221D0C(v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
LABEL_3:
    -[CRLBufferedReadChannel _close](self, "_close");
  }
  else
  {
    readQueue = self->_readQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C5D6C;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_sync(readQueue, block);
  }
}

- (void)_close
{
  CRLReadChannel *sourceReadChannel;
  id streamReadChannelSourceHandler;

  -[CRLBufferedReadChannel _closeStreamReadChannel](self, "_closeStreamReadChannel");
  -[CRLReadChannel close](self->_sourceReadChannel, "close");
  sourceReadChannel = self->_sourceReadChannel;
  self->_sourceReadChannel = 0;

  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = 0;

}

- (void)_closeStreamReadChannel
{
  CRLStreamReadChannel *streamReadChannel;

  -[CRLStreamReadChannel close](self->_streamReadChannel, "close");
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = 0;

}

- (void)_resetStreamReadChannelIfNeededForOffset:(int64_t)a3 length:(unint64_t)a4
{
  int64_t v5;
  int64_t streamOutputOffset;
  unint64_t streamOutputOutstandingLength;
  unint64_t v9;
  NSUInteger v11;
  NSUInteger v12;
  id v13;
  id v14;
  char *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  char *v28;
  id v29;
  OS_dispatch_data *currentStreamOutputData;
  id streamReadChannelSourceHandler;
  uint64_t (**streamReadChannelBlock)(id, CRLBufferedReadChannelHelper *, void *);
  CRLBufferedReadChannelHelper *v33;
  uint64_t v34;
  CRLStreamReadChannel *v35;
  CRLStreamReadChannel *streamReadChannel;
  CRLStreamReadChannel *v37;
  unint64_t v38;
  int64_t v39;
  NSArray *obj;
  uint64_t v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  unsigned int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  _BYTE v57[128];

  v5 = a3;
  streamOutputOffset = self->_streamOutputOffset;
  if (streamOutputOffset <= a3)
  {
    streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
    v9 = streamOutputOutstandingLength + streamOutputOffset;
    if (streamOutputOutstandingLength == -1 || v9 > a3)
      return;
  }
  -[CRLBufferedReadChannel _closeStreamReadChannel](self, "_closeStreamReadChannel");
  *(_OWORD *)&self->_sourceOffset = xmmword_100EEC720;
  *(_OWORD *)&self->_streamOutputOffset = xmmword_100EEC720;
  self->_streamOutputLength = 0;
  v11 = -[NSArray count](self->_blockInfos, "count");
  if (!v11)
  {
    v17 = 0;
    goto LABEL_37;
  }
  v12 = v11;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = self->_blockInfos;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (!v13)
  {
    v17 = 0;
    goto LABEL_36;
  }
  v14 = v13;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v41 = *(_QWORD *)v44;
  v38 = a4;
  v39 = v5;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v44 != v41)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v18);
      v16 += (int64_t)objc_msgSend(v19, "decodedLength");
      if (v15)
      {
        objc_msgSend(v17, "addObject:", v19);
        self->_sourceLength += (unint64_t)objc_msgSend(v19, "encodedLength");
        v15 = &v15[(_QWORD)objc_msgSend(v19, "decodedLength")];
        v20 = (char *)objc_msgSend(v19, "decodedLength") + self->_streamOutputOutstandingLength;
      }
      else
      {
        if (v16 <= v5)
        {
          self->_sourceOffset += (int64_t)objc_msgSend(v19, "encodedLength");
          v15 = 0;
          self->_streamOutputOffset += (int64_t)objc_msgSend(v19, "decodedLength");
          goto LABEL_27;
        }
        if (v17)
        {
          v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101235328);
          v22 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v48 = v21;
            v49 = 2082;
            v50 = "-[CRLBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]";
            v51 = 2082;
            v52 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m";
            v53 = 1024;
            v54 = 147;
            v55 = 2082;
            v56 = "blockInfos";
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101235348);
          v23 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v27 = v23;
            v28 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v48 = v21;
            v49 = 2114;
            v50 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 147, 0, "expected nil value for '%{public}s'", "blockInfos");

          a4 = v38;
        }
        v26 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);

        objc_msgSend(v26, "addObject:", v19);
        self->_sourceLength = (unint64_t)objc_msgSend(v19, "encodedLength");
        v15 = (char *)objc_msgSend(v19, "decodedLength");
        v20 = (char *)objc_msgSend(v19, "decodedLength");
        v17 = v26;
        v5 = v39;
      }
      self->_streamOutputOutstandingLength = (unint64_t)v20;
      if ((unint64_t)v15 > a4)
        goto LABEL_36;
LABEL_27:
      if (!--v12)
      {
        self->_sourceLength = -1;
        self->_streamOutputOutstandingLength = -1;
      }
      v18 = (char *)v18 + 1;
    }
    while (v14 != v18);
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    v14 = v29;
  }
  while (v29);
LABEL_36:

LABEL_37:
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  self->_isStreamOutputDone = 0;
  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = 0;

  streamReadChannelBlock = (uint64_t (**)(id, CRLBufferedReadChannelHelper *, void *))self->_streamReadChannelBlock;
  v33 = -[CRLBufferedReadChannelHelper initWithBufferedReadChannel:]([CRLBufferedReadChannelHelper alloc], "initWithBufferedReadChannel:", self);
  v34 = streamReadChannelBlock[2](streamReadChannelBlock, v33, v17);
  v35 = (CRLStreamReadChannel *)objc_claimAutoreleasedReturnValue(v34);
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = v35;

  v37 = self->_streamReadChannel;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000C6358;
  v42[3] = &unk_1012353B0;
  v42[4] = self;
  -[CRLStreamReadChannel readWithHandler:](v37, "readWithHandler:", v42);

}

- (void)setStreamReadChannelSourceHandler:(id)a3
{
  id v4;
  id streamReadChannelSourceHandler;

  v4 = objc_retainBlock(a3);
  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = v4;

}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8;
  NSObject *readQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  unint64_t v14;

  v8 = a5;
  readQueue = self->_readQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C668C;
  v11[3] = &unk_1012353D8;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(readQueue, v11);

}

- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  +[CRLIOUtils readFromOffsetAndWait:offset:length:handler:](CRLIOUtils, "readFromOffsetAndWait:offset:length:handler:", self, a3, a4, a5);
}

- (void)readWithHandler:(id)a3
{
  -[CRLBufferedReadChannel readFromOffset:length:handler:](self, "readFromOffset:length:handler:", 0, -1, a3);
}

- (void)readWithHandlerAndWait:(id)a3
{
  +[CRLIOUtils readWithHandlerAndWait:handler:](CRLIOUtils, "readWithHandlerAndWait:handler:", self, a3);
}

- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8;
  unint64_t v9;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;
  size_t size;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  OS_dispatch_data *currentStreamOutputData;
  unint64_t streamOutputLength;
  unint64_t streamOutputOutstandingLength;
  CRLReadChannel *sourceReadChannel;
  int64_t sourceOffset;
  unint64_t sourceReadBufferSize;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  _QWORD v30[4];
  unsigned __int8 v31;

  v8 = a5;
  v9 = (a3 & (a3 >> 63)) + a4;
  v10 = a3 & ~(a3 >> 63);
  -[CRLBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:](self, "_resetStreamReadChannelIfNeededForOffset:length:", v10, v9);
  v31 = 0;
  v11 = objc_claimAutoreleasedReturnValue(-[CRLBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:](self, "_currentDataIntersectionWithOffset:length:isReadDone:", v10, v9, &v31));
  v12 = v11;
  if (v11)
  {
    size = dispatch_data_get_size(v11);
    v10 += size;
    v9 -= size;
  }
  else if (!v31)
  {
    goto LABEL_6;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "threadDictionary"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("CRLBufferedReadChannelInvokingHandler"));

  (*((void (**)(id, _QWORD, NSObject *, _QWORD))v8 + 2))(v8, v31, v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "threadDictionary"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("CRLBufferedReadChannelInvokingHandler"));

  if (v31)
  {
    dispatch_resume((dispatch_object_t)self->_readQueue);
    goto LABEL_12;
  }
LABEL_6:
  -[CRLBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:](self, "_resetStreamReadChannelIfNeededForOffset:length:", v10, v9);
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
  streamOutputLength = self->_streamOutputLength;
  self->_streamOutputOffset += streamOutputLength;
  if (streamOutputOutstandingLength != -1)
    self->_streamOutputOutstandingLength = streamOutputOutstandingLength - streamOutputLength;
  self->_streamOutputLength = 0;
  sourceReadChannel = self->_sourceReadChannel;
  sourceOffset = self->_sourceOffset;
  if (self->_sourceLength >= self->_sourceReadBufferSize)
    sourceReadBufferSize = self->_sourceReadBufferSize;
  else
    sourceReadBufferSize = self->_sourceLength;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000C6A00;
  v24[3] = &unk_101235500;
  v24[4] = self;
  v25 = v8;
  v26 = v30;
  v27 = sourceReadBufferSize;
  v28 = v10;
  v29 = v9;
  -[CRLReadChannel readFromOffset:length:handler:](sourceReadChannel, "readFromOffset:length:handler:", sourceOffset, sourceReadBufferSize, v24);

  _Block_object_dispose(v30, 8);
LABEL_12:

}

- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5
{
  unint64_t v8;
  int64_t streamOutputOffset;
  unint64_t streamOutputLength;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  dispatch_data_t subrange;
  BOOL v21;
  int64_t v23;
  unint64_t v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  unint64_t v36;

  if (__CFADD__(a3, a4))
    v8 = -1;
  else
    v8 = a3 + a4;
  streamOutputOffset = self->_streamOutputOffset;
  streamOutputLength = self->_streamOutputLength;
  if (streamOutputLength >= ~streamOutputOffset)
  {
    v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235520);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v23 = self->_streamOutputOffset;
      v24 = self->_streamOutputLength;
      *(_DWORD *)buf = 67110402;
      v26 = v11;
      v27 = 2082;
      v28 = "-[CRLBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]";
      v29 = 2082;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m";
      v31 = 1024;
      v32 = 336;
      v33 = 2048;
      v34 = v23;
      v35 = 2048;
      v36 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Overflow in the output stream: data offset %lli data length %zu", buf, 0x36u);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235540);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 336, 0, "Overflow in the output stream: data offset %lli data length %zu", self->_streamOutputOffset, self->_streamOutputLength);

    streamOutputOffset = self->_streamOutputOffset;
    streamOutputLength = self->_streamOutputLength;
  }
  if (streamOutputOffset <= a3)
    v16 = a3;
  else
    v16 = streamOutputOffset;
  v17 = streamOutputLength + streamOutputOffset;
  if (v8 >= streamOutputLength + streamOutputOffset)
    v18 = streamOutputLength + streamOutputOffset;
  else
    v18 = v8;
  if (v18 <= v16)
  {
    subrange = 0;
    if (!a5)
      return subrange;
  }
  else
  {
    subrange = dispatch_data_create_subrange((dispatch_data_t)self->_currentStreamOutputData, v16 - streamOutputOffset, v18 - v16);
    if (!a5)
      return subrange;
  }
  v21 = self->_isStreamOutputDone || v8 <= v17;
  *a5 = v21;
  return subrange;
}

- (void)setLowWater:(unint64_t)a3
{
  -[CRLReadChannel setLowWater:](self->_sourceReadChannel, "setLowWater:", a3);
}

- (void)addBarrier:(id)a3
{
  -[CRLReadChannel addBarrier:](self->_sourceReadChannel, "addBarrier:", a3);
}

- (BOOL)isValid
{
  return -[CRLReadChannel isValid](self->_sourceReadChannel, "isValid");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamOutputData, 0);
  objc_storeStrong(&self->_streamReadChannelSourceHandler, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong(&self->_streamReadChannelBlock, 0);
  objc_storeStrong((id *)&self->_blockInfos, 0);
  objc_storeStrong((id *)&self->_sourceReadChannelError, 0);
  objc_storeStrong((id *)&self->_sourceReadChannel, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
}

@end
