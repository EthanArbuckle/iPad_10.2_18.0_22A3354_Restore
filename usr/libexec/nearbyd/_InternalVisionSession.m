@implementation _InternalVisionSession

- (id)_initInternal
{
  NSObject *v3;
  _InternalVisionSession *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _QWORD block[4];
  _InternalVisionSession *v12;
  objc_super v13;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,_initInternal", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)_InternalVisionSession;
  v4 = -[_InternalVisionSession init](&v13, "init");
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.nearbyd.vision", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v9 = v4->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001FE0BC;
    block[3] = &unk_1007FB340;
    v12 = v4;
    dispatch_sync(v9, block);

  }
  return v4;
}

+ (id)sharedInstance
{
  if (qword_100859128 != -1)
    dispatch_once(&qword_100859128, &stru_10080E710);
  return (id)qword_100859120;
}

- (void)registerObserver:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FE218;
  block[3] = &unk_100809CB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)unregisterObserverWithIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001FE398;
  v7[3] = &unk_1007FA518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (void)_setUpARSession
{
  NSObject *v3;
  ARSession *v4;
  ARSession *arSession;
  ARSession *v6;
  id v7;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,Set up ARSession", v8, 2u);
  }
  if (!self->_arSession)
  {
    v4 = objc_opt_new(ARSession);
    arSession = self->_arSession;
    self->_arSession = v4;

    -[ARSession setDelegateQueue:](self->_arSession, "setDelegateQueue:", self->_queue);
    -[ARSession _addObserver:](self->_arSession, "_addObserver:", self);
    v6 = self->_arSession;
    v7 = objc_alloc_init((Class)ARWorldTrackingConfiguration);
    -[ARSession runWithConfiguration:options:](v6, "runWithConfiguration:options:", v7, 1);

  }
}

- (void)_tearDownARSession
{
  NSObject *v3;
  ARSession *arSession;
  ARSession *v5;
  uint8_t v6[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,Tear down ARSession", v6, 2u);
  }
  arSession = self->_arSession;
  if (arSession)
  {
    -[ARSession pause](arSession, "pause");
    -[ARSession _removeObserver:](self->_arSession, "_removeObserver:", self);
    v5 = self->_arSession;
    self->_arSession = 0;

  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001FE688;
  v8[3] = &unk_1007FA518;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);

}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  _QWORD block[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if (!v7)
    __assert_rtn("-[_InternalVisionSession sessionShouldAttemptRelocalization:completion:]", "NIServerVisionInternalSession.mm", 144, "completion");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FE760;
  block[3] = &unk_10080AC38;
  v11 = v7;
  v9 = v7;
  dispatch_async((dispatch_queue_t)queue, block);

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003DC57C((uint64_t)v4, v5);

}

- (void)sessionWasInterrupted:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,Session was interrupted", v4, 2u);
  }
}

- (void)sessionInterruptionEnded:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,Session interrupted ended", v4, 2u);
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  int v4;
  NSObject *v5;
  _DWORD v6[2];

  v4 = a4;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#vision,Session changed state: %d", (uint8_t *)v6, 8u);
  }
}

- (void)_handleARSessionDidUpdateFrame:(id)a3
{
  void *v3;
  id v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NIVisionInput *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  NIVisionInput *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint8_t buf[4];
  id v33;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#vision,Updated ARFrame: %{private}@", buf, 0xCu);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "camera"));
  v8 = (unint64_t)objc_msgSend(v7, "trackingState");

  if (v8 != 2)
    v8 = v8 == 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "worldTrackingState"));
  v10 = v9 == 0;

  if (v10)
  {
    v14 = 0;
    v12 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "worldTrackingState"));
    v12 = objc_msgSend(v11, "majorRelocalization");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "worldTrackingState"));
    v14 = objc_msgSend(v13, "minorRelocalization");

  }
  v15 = [NIVisionInput alloc];
  objc_msgSend(v5, "timestamp");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "camera"));
  objc_msgSend(v18, "transform");
  v30 = v20;
  v31 = v19;
  v28 = v22;
  v29 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lightEstimate"));
  if (v23)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lightEstimate"));
    objc_msgSend(v3, "ambientIntensity");
    v25 = v24;
  }
  else
  {
    v25 = *(double *)&NIARLightEstimateNotAvailable;
  }
  v26 = -[NIVisionInput initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:](v15, "initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:", v8, v12, v14, v17, v31, v30, v29, v28, v25);
  if (v23)

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerVisionDataDistributor sharedProvider](NIServerVisionDataDistributor, "sharedProvider"));
  objc_msgSend(v27, "processVisionInput:", v26);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arSession, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
