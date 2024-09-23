@implementation GKDelayedSetPhotoNetworkWriter

+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4
{
  id v5;
  id v6;
  GKDelayedSetPhotoNetworkWriter *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GKDelayedSetPhotoNetworkWriter initWithTransport:forBagKey:]([GKDelayedSetPhotoNetworkWriter alloc], "initWithTransport:forBagKey:", v6, v5);

  return v7;
}

- (GKDelayedSetPhotoNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4
{
  id v6;
  id v7;
  GKDelayedSetPhotoNetworkWriter *v8;
  GKDelayedSetPhotoNetworkWriter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKDelayedSetPhotoNetworkWriter;
  v8 = -[GKDelayedSetPhotoNetworkWriter init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[GKDelayedSetPhotoNetworkWriter setTransport:](v8, "setTransport:", v6);
    -[GKDelayedSetPhotoNetworkWriter setBagKey:](v9, "setBagKey:", v7);
  }

  return v9;
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  dispatch_queue_global_t global_queue;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  GKDelayedSetPhotoNetworkWriter *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  GKDelayedSetPhotoNetworkWriter *v33;
  id v34;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_gkValuesForKeyPath:", CFSTR("resourceID")));
  v9 = objc_msgSend(v8, "count");
  if ((unint64_t)v9 >= 2)
  {
    v22 = objc_opt_class(self, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKDelayedSetPhotoNetworkWriter bagKey](self, "bagKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is being asked to submit a delayed request for multiple players:%@. This is not currently supported. Bag key: %@"), v8, v22, v23));
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v24, 0));

    objc_exception_throw(v25);
  }
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v9);
  v12 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKDelayedSetPhotoNetworkWriter: starting avatar image upload process.", buf, 2u);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDelayedSetPhotoNetworkWriter.m", 57, "-[GKDelayedSetPhotoNetworkWriter writeResources:handler:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v13));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000CEAA0;
  v30[3] = &unk_1002BC3A8;
  v31 = v8;
  v32 = v6;
  v33 = self;
  v15 = v14;
  v34 = v15;
  v16 = v6;
  v17 = v8;
  objc_msgSend(v15, "perform:", v30);
  global_queue = dispatch_get_global_queue(0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000CED7C;
  v26[3] = &unk_1002BB608;
  v28 = self;
  v29 = v7;
  v27 = v15;
  v20 = v7;
  v21 = v15;
  objc_msgSend(v21, "notifyOnQueue:block:", v19, v26);

}

- (void)uploadImageData:(id)a3 toURL:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  dispatch_queue_global_t global_queue;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  GKDelayedSetPhotoNetworkWriter *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDelayedSetPhotoNetworkWriter.m", 97, "-[GKDelayedSetPhotoNetworkWriter uploadImageData:toURL:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000CEFFC;
  v26[3] = &unk_1002BB4A0;
  v13 = v9;
  v27 = v13;
  v28 = v8;
  v14 = v12;
  v29 = v14;
  v15 = v8;
  objc_msgSend(v14, "perform:", v26);
  global_queue = dispatch_get_global_queue(0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000CF60C;
  v21[3] = &unk_1002BB518;
  v22 = v14;
  v23 = self;
  v24 = v13;
  v25 = v10;
  v18 = v10;
  v19 = v13;
  v20 = v14;
  objc_msgSend(v20, "notifyOnQueue:block:", v17, v21);

}

- (void)uploadProfileImageMetadata:(id)a3 fromUploadURL:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  dispatch_queue_global_t global_queue;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  GKDelayedSetPhotoNetworkWriter *v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDelayedSetPhotoNetworkWriter.m", 163, "-[GKDelayedSetPhotoNetworkWriter uploadProfileImageMetadata:fromUploadURL:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000CF840;
  v21[3] = &unk_1002BC3A8;
  v13 = v9;
  v22 = v13;
  v14 = v8;
  v23 = v14;
  v24 = self;
  v15 = v12;
  v25 = v15;
  objc_msgSend(v15, "perform:", v21);
  if (v10)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000CFC58;
    v18[3] = &unk_1002BB450;
    v20 = v10;
    v19 = v15;
    objc_msgSend(v19, "notifyOnQueue:block:", v17, v18);

  }
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
  objc_storeStrong((id *)&self->_bagKey, a3);
}

- (GKDataTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (NSNumber)avatarType
{
  return self->_avatarType;
}

- (void)setAvatarType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarType, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_bagKey, 0);
}

@end
