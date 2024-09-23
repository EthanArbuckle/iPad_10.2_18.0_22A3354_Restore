@implementation MapsCarPlayExternalDeviceMonitor

+ (id)sharedInstance
{
  if (qword_1014D4118 != -1)
    dispatch_once(&qword_1014D4118, &stru_1011E3F18);
  return (id)qword_1014D4120;
}

- (MapsCarPlayExternalDeviceMonitor)init
{
  id v2;
  id v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  id v15;
  uint8_t v16[8];
  _QWORD v17[4];
  id v18;
  id buf[2];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MapsCarPlayExternalDeviceMonitor;
  v2 = -[MapsCarPlayExternalDeviceMonitor init](&v20, "init");
  if (v2)
  {
    v3 = sub_100B53CF0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing", (uint8_t *)buf, 2u);
    }

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("MapsCarPlayExternalDeviceMonitor.queue", v6);
    v8 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v7;

    objc_initWeak(buf, v2);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100B53D30;
    v17[3] = &unk_1011BCB28;
    objc_copyWeak(&v18, buf);
    v9 = objc_retainBlock(v17);
    if (notify_register_dispatch("com.apple.coremedia.active-endpoint-changed", (int *)v2 + 6, *((dispatch_queue_t *)v2 + 1), v9))
    {
      v10 = sub_100B53CF0();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to register for CarPlay external devices", v16, 2u);
      }

    }
    v12 = *((_QWORD *)v2 + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B53D5C;
    block[3] = &unk_1011AC860;
    v15 = v2;
    dispatch_async(v12, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
  return (MapsCarPlayExternalDeviceMonitor *)v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)MapsCarPlayExternalDeviceMonitor;
  -[MapsCarPlayExternalDeviceMonitor dealloc](&v3, "dealloc");
}

- (AVExternalDevice)carPlayExternalDevice
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100B53E60;
  v10 = sub_100B53E70;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B53E78;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVExternalDevice *)v3;
}

- (void)_populateExternalDevice
{
  AVExternalDevice *v3;
  id v4;
  NSObject *v5;
  AVExternalDevice *v6;
  AVExternalDevice *externalDevice;
  id v8;
  NSObject *v9;
  AVExternalDevice *v10;
  _QWORD block[4];
  AVExternalDevice *v12;
  uint8_t buf[4];
  AVExternalDevice *v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_externalDevice;
  v4 = sub_100B53CF0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching currentCarPlayExternalDevice", buf, 2u);
  }

  v6 = (AVExternalDevice *)objc_claimAutoreleasedReturnValue(+[AVExternalDevice currentCarPlayExternalDevice](AVExternalDevice, "currentCarPlayExternalDevice"));
  externalDevice = self->_externalDevice;
  self->_externalDevice = v6;

  v8 = sub_100B53CF0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_externalDevice;
    *(_DWORD *)buf = 138543362;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got currentCarPlayExternalDevice: %{public}@", buf, 0xCu);
  }

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B54000;
    block[3] = &unk_1011AC860;
    v12 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
