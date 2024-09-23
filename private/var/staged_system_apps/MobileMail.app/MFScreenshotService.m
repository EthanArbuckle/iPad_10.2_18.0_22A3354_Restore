@implementation MFScreenshotService

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019F378;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA360 != -1)
    dispatch_once(&qword_1005AA360, block);
  return (OS_os_log *)(id)qword_1005AA358;
}

- (MFScreenshotService)initWithDelegate:(id)a3
{
  id v4;
  MFScreenshotService *v5;
  MFScreenshotService *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFScreenshotService;
  v5 = -[MFScreenshotService init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)fetchPDFRepresentationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MFMessagePrinter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MFMessagePrinter *v13;
  id v14;
  _QWORD v15[4];
  MFMessagePrinter *v16;
  id v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFScreenshotService delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageContentRepresentationRequestForScreenshotService:", self));

  if (v6)
  {
    v7 = -[MFMessagePrinter initWithContentRequest:]([MFMessagePrinter alloc], "initWithContentRequest:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "temporaryDirectory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("MFScreenshotService"), 1));

    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString ef_UUID](NSString, "ef_UUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", v11));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10019F68C;
    v15[3] = &unk_10051E640;
    v13 = v7;
    v16 = v13;
    v17 = v12;
    v18 = v6;
    v19 = v4;
    v14 = v12;
    -[MFMessagePrinter loadWithCompletion:](v13, "loadWithCompletion:", v15);

  }
}

- (MFScreenshotServiceDelegate)delegate
{
  return (MFScreenshotServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
