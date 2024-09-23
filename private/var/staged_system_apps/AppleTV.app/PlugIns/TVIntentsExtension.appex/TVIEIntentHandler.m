@implementation TVIEIntentHandler

- (void)confirmPlayMedia:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)INPlayMediaIntentResponse), "initWithCode:userActivity:", 1, 0);
  (*((void (**)(id, id))a4 + 2))(v5, v6);

  v7 = sub_1000022A0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100002D18();

}

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002428;
  v7[3] = &unk_1000041F0;
  v8 = a4;
  v6 = v8;
  -[TVIEIntentHandler _buildPlayUrlForIntent:completion:](self, "_buildPlayUrlForIntent:completion:", a3, v7);

}

- (void)_buildPlayUrlForIntent:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)WLKContinueWatchingRequestOperation);
  objc_initWeak(&location, v7);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000026EC;
  v14 = &unk_100004218;
  objc_copyWeak(&v17, &location);
  v8 = v5;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "setCompletionBlock:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue wlkDefaultQueue](NSOperationQueue, "wlkDefaultQueue", v11, v12, v13, v14));
  objc_msgSend(v10, "addOperation:", v7);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

@end
