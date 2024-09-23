@implementation GKNWDatagramConnectionWrapper

- (GKNWDatagramConnectionWrapper)initWithDatagramConnection:(id)a3 connectionID:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v10;
  GKNWDatagramConnectionWrapper *v11;
  id v12;
  dispatch_queue_t v13;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GKNWDatagramConnectionWrapper;
  v11 = -[GKNWConnectionWrapper initWithConnection:delegate:delegateQueue:](&v15, "initWithConnection:delegate:delegateQueue:", a3, a5, a6);
  if (v11)
  {
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.gamed.ids.datagramwriteq_%@"), v10)));
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
    -[GKNWConnectionWrapper setWriteQueue:](v11, "setWriteQueue:", v13);

  }
  return v11;
}

- (void)_sendData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[GKNWConnectionWrapper writeQueue](self, "writeQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010F810;
  v7[3] = &unk_1002BB658;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)readData
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKNWConnectionWrapper connection](self, "connection"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010FA60;
  v4[3] = &unk_1002C3850;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "readDatagramsWithMinimumCount:maximumCount:completionHandler:", 1, 100, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

@end
