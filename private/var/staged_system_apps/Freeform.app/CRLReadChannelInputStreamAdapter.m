@implementation CRLReadChannelInputStreamAdapter

- (CRLReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4
{
  return -[CRLReadChannelInputStreamAdapter initWithReadChannel:length:closeChannelOnClose:](self, "initWithReadChannel:length:closeChannelOnClose:", a3, a4, 1);
}

- (CRLReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4 closeChannelOnClose:(BOOL)a5
{
  id v9;
  CRLReadChannelInputStreamAdapter *v10;
  CRLReadChannelInputStreamAdapter *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLReadChannelInputStreamAdapter;
  v10 = -[CRLReadChannelInputStreamAdapter init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_readChannel, a3);
    objc_storeStrong((id *)&v11->_leftoverData, &_dispatch_data_empty);
    v11->_length = a4;
    v11->_closeChannelOnClose = a5;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLReadChannelInputStreamAdapter close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)CRLReadChannelInputStreamAdapter;
  -[CRLReadChannelInputStreamAdapter dealloc](&v3, "dealloc");
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  int64_t offset;
  unint64_t length;
  BOOL v6;
  int64_t v7;
  size_t v9;
  OS_dispatch_data *leftoverData;
  OS_dispatch_data *subrange;
  id v12;
  unint64_t v13;
  size_t v14;
  OS_dispatch_data *v15;
  size_t size;
  OS_dispatch_data *v17;
  NSObject *v18;
  _QWORD *v19;
  CRLReadChannel *readChannel;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  _QWORD v28[5];
  NSObject *v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[3];
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD applier[7];
  _QWORD v43[4];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  size_t v47;
  _BYTE v48[24];

  offset = self->_offset;
  length = self->_length;
  v6 = __OFSUB__(length, offset);
  v7 = length - offset;
  if (!((v7 < 0) ^ v6 | (v7 == 0)))
  {
    if (v7 >= a4)
      v9 = a4;
    else
      v9 = v7;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = v9;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = a3;
    leftoverData = self->_leftoverData;
    if (dispatch_data_get_size((dispatch_data_t)leftoverData))
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_100110B0C;
      applier[3] = &unk_101238DC0;
      applier[5] = &v44;
      applier[6] = v43;
      applier[4] = self;
      dispatch_data_apply((dispatch_data_t)leftoverData, applier);
      if (v45[3])
      {
        subrange = (OS_dispatch_data *)&_dispatch_data_empty;
        v12 = &_dispatch_data_empty;
      }
      else
      {
        v15 = self->_leftoverData;
        size = dispatch_data_get_size((dispatch_data_t)v15);
        subrange = (OS_dispatch_data *)dispatch_data_create_subrange((dispatch_data_t)v15, v9, size - v9);
      }
      v17 = self->_leftoverData;
      self->_leftoverData = subrange;

      v14 = v45[3];
      if (!v14)
        goto LABEL_28;
    }
    else
    {
      v14 = v9;
      if (!v9)
        goto LABEL_28;
    }
    if (self->_readChannel)
    {
      v36 = 0;
      v37 = &v36;
      v38 = 0x3032000000;
      v39 = sub_100110B9C;
      v40 = sub_100110BAC;
      v41 = 0;
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      v35 = 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100110BB4;
      v28[3] = &unk_101238E10;
      v30 = &v44;
      v31 = v43;
      v28[4] = self;
      v32 = &v36;
      v33 = v34;
      v18 = dispatch_semaphore_create(0);
      v29 = v18;
      v19 = objc_retainBlock(v28);
      readChannel = self->_readChannel;
      if (readChannel)
      {
        -[CRLReadChannel readFromOffset:length:handler:](readChannel, "readFromOffset:length:handler:", self->_offset, v45[3], v19);
      }
      else
      {
        v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101238E30);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DFBA40();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101238E50);
        v22 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DEE33C(v23, (uint64_t)v48, v21, v22);
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLReadChannelInputStreamAdapter readToBuffer:size:]"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLReadChannelInputStreamAdapter.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 116, 0, "nil read channels");

        dispatch_semaphore_signal(v18);
      }
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      v26 = v37[5] == 0;

      _Block_object_dispose(v34, 8);
      _Block_object_dispose(&v36, 8);

      if (!v26)
      {
        v13 = 0;
LABEL_29:
        _Block_object_dispose(v43, 8);
        _Block_object_dispose(&v44, 8);
        return v13;
      }
      v14 = v45[3];
    }
LABEL_28:
    v13 = v9 - v14;
    goto LABEL_29;
  }
  return 0;
}

- (void)close
{
  CRLReadChannel *readChannel;

  if (self->_closeChannelOnClose)
    -[CRLReadChannel close](self->_readChannel, "close");
  readChannel = self->_readChannel;
  self->_readChannel = 0;

}

- (BOOL)canSeek
{
  return self->_readChannel != 0;
}

- (void)seekToOffset:(int64_t)a3
{
  int64_t length;
  unint64_t v4;
  int64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_readChannel)
  {
    length = self->_length;
    if (length >= a3)
      v4 = a3;
    else
      v4 = self->_length;
    if (length >= 0)
      v5 = v4;
    else
      v5 = a3;
    self->_offset = v5;
    objc_storeStrong((id *)&self->_leftoverData, &_dispatch_data_empty);
  }
  else
  {
    v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238E70);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFBB7C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238E90);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFBAC4(v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLReadChannelInputStreamAdapter seekToOffset:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLReadChannelInputStreamAdapter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 155, 0, "Not a seekable stream");

  }
}

- (id)closeLocalStream
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftoverData, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
