@implementation RSDNCMInterface

- (RSDNCMInterface)initWithService:(unsigned int)a3 notificationPort:(IONotificationPort *)a4 queue:(id)a5
{
  uint64_t v6;
  id v8;
  RSDNCMInterface *v9;
  RSDNCMInterface *v10;
  objc_super v12;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = 0;
  if ((_DWORD)v6 && a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)RSDNCMInterface;
    v10 = -[RSDNCMInterface init](&v12, "init");
    self = v10;
    if (v10)
    {
      -[RSDNCMInterface setService:](v10, "setService:", v6);
      IOObjectRetain(-[RSDNCMInterface service](self, "service"));
      -[RSDNCMInterface setState:](self, "setState:", 0);
      -[RSDNCMInterface setNotification_port:](self, "setNotification_port:", a4);
      -[RSDNCMInterface setQueue:](self, "setQueue:", v8);
      self = self;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)activate
{
  kern_return_t v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  int v12;
  io_object_t notification;
  uint8_t buf[4];
  const char *v15;

  notification = 0;
  v3 = IOServiceAddInterestNotification(-[RSDNCMInterface notification_port](self, "notification_port"), -[RSDNCMInterface service](self, "service"), "IOGeneralInterest", (IOServiceInterestCallback)sub_10002B7F0, self, &notification);
  if (v3)
  {
    v4 = sub_10002AEC8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10003BD64(v3, v5);

  }
  else
  {
    -[RSDNCMInterface setNotification:](self, "setNotification:", notification);
    v12 = 0;
    if (sub_100010B5C(-[RSDNCMInterface service](self, "service"), &v12))
    {
      v6 = sub_10002AEC8();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if ((v12 - 1) > 2)
          v8 = "<unknown>";
        else
          v8 = (&off_100051FC8)[v12 - 1];
        *(_DWORD *)buf = 136446210;
        v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "initial linkstatus: %{public}s", buf, 0xCu);
      }

      if (v12 == 3)
      {
        v9 = sub_10002AEC8();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "arming the connected device", buf, 2u);
        }

        -[RSDNCMInterface advanceState:](self, "advanceState:", 1);
      }
    }
  }
  return v3 == 0;
}

- (void)deactivate
{
  if (-[RSDNCMInterface notification](self, "notification"))
  {
    IOObjectRelease(-[RSDNCMInterface notification](self, "notification"));
    -[RSDNCMInterface setNotification:](self, "setNotification:", 0);
  }
}

- (BOOL)address
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  char *v16;
  id v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  char __s1[16];
  uint8_t buf[4];
  RSDNCMInterface *v24;
  __int16 v25;
  _BYTE v26[10];
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;

  memset(__s1, 170, sizeof(__s1));
  WORD2(v20) = -21846;
  LODWORD(v20) = -1431655766;
  v3 = sub_10002AEC8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10003BFD4();

  if (!sub_100010C68(-[RSDNCMInterface service](self, "service"), __s1))
  {
    v17 = sub_10002AEC8();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10003BF74();

    return 0;
  }
  if (*(unsigned __int16 *)__s1 != 28261 && *(_DWORD *)__s1 != 1768975969)
    sub_10003BF0C(&v21, buf);
  v5 = sub_10002AEC8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = self;
    v25 = 2082;
    *(_QWORD *)v26 = __s1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%p] ifname: %{public}s", buf, 0x16u);
  }

  v7 = if_nametoindex(__s1);
  if (!(_DWORD)v7)
    sub_10003BE44(&v21, buf);
  v8 = v7;
  v9 = sub_10002AEC8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v24 = self;
    v25 = 1024;
    *(_DWORD *)v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%p] ifindex: %d", buf, 0x12u);
  }

  v11 = sub_1000110DC(-[RSDNCMInterface service](self, "service"), (uint64_t)&v20);
  v12 = sub_10002AEC8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10003BEAC();

    return 0;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219520;
    v24 = self;
    v25 = 1024;
    *(_DWORD *)v26 = v20;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = BYTE1(v20);
    v27 = 1024;
    v28 = BYTE2(v20);
    v29 = 1024;
    v30 = BYTE3(v20);
    v31 = 1024;
    v32 = BYTE4(v20);
    v33 = 1024;
    v34 = BYTE5(v20);
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%p] MAC Address: %02x:%02x:%02x:%02x:%02x:%02x", buf, 0x30u);
  }

  if (_dispatch_is_multithreaded())
  {
    v15 = strdup(__s1);
    if (!v15)
    {
      do
      {
        __os_temporary_resource_shortage();
        v16 = strdup(__s1);
      }
      while (!v16);
      v15 = v16;
    }
  }
  else
  {
    v15 = strdup(__s1);
    if (!v15)
      sub_100035B64(__s1, &v21, buf);
  }
  -[RSDNCMInterface setName:](self, "setName:", v15, v20);
  -[RSDNCMInterface setIndex:](self, "setIndex:", v8);
  -[RSDNCMInterface setMac_addr:](self, "setMac_addr:", memdup2_np(&v20, 6));
  return 1;
}

- (void)addressWithRetry
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  if ((id)-[RSDNCMInterface state](self, "state") == (id)1)
  {
    ++self->address_tries;
    if (-[RSDNCMInterface address](self, "address"))
    {
      -[RSDNCMInterface advanceState:](self, "advanceState:", 2);
    }
    else
    {
      if (self->address_tries == 60)
        sub_10003C034();
      v3 = dispatch_time(0, 5000000000);
      v4 = objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002BE68;
      block[3] = &unk_1000510D0;
      block[4] = self;
      dispatch_after(v3, v4, block);

    }
  }
}

- (void)advanceState:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void **v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  RSDNCMInterface *v23;
  id v24;
  _QWORD v25[5];
  void *v26;
  _QWORD block[5];
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint8_t buf[4];
  RSDNCMInterface *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;

  v5 = -[RSDNCMInterface state](self, "state");
  if (v5 != a3)
  {
    v6 = v5;
    v7 = sub_10002AEC8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v32 = self;
      v33 = 2048;
      v34 = v6;
      v35 = 2048;
      v36 = a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%p] advancing state from %llu to %llu", buf, 0x20u);
    }

    switch(v6)
    {
      case 0uLL:
        if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
          sub_10003C04C(&v30, buf);
        return;
      case 1uLL:
        if (a3 - 2 >= 2 && a3)
          sub_10003C0B4(a3, &v30, buf);
        return;
      case 2uLL:
        if (a3 && a3 != 3)
          sub_10003C140(a3, &v30, buf);
        return;
      case 3uLL:
        sub_10003C1CC();
      default:
        break;
    }
    -[RSDNCMInterface setState:](self, "setState:", a3);
    self->address_tries = 0;
    switch(a3)
    {
      case 0uLL:
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface inactive_callback](self, "inactive_callback"));

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface inactive_callback](self, "inactive_callback"));
          v11 = objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10002C1E4;
          block[3] = &unk_100051F88;
          block[4] = self;
          v28 = v10;
          v12 = v10;
          dispatch_async(v11, block);

          v13 = v28;
          goto LABEL_17;
        }
        break;
      case 1uLL:
        v14 = objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10002C1DC;
        v29[3] = &unk_1000510D0;
        v29[4] = self;
        dispatch_async(v14, v29);
        goto LABEL_19;
      case 2uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface addressed_callback](self, "addressed_callback"));
        v16 = objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10002C1F4;
        v25[3] = &unk_100051F88;
        v25[4] = self;
        v26 = v15;
        v12 = v15;
        dispatch_async(v16, v25);

        v13 = v26;
LABEL_17:

        break;
      case 3uLL:
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface detached_callback](self, "detached_callback"));
        v18 = objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
        v19 = _NSConcreteStackBlock;
        v20 = 3221225472;
        v21 = sub_10002C204;
        v22 = &unk_100051F88;
        v23 = self;
        v24 = v17;
        v14 = v17;
        dispatch_async(v18, &v19);

        -[RSDNCMInterface setInactive_callback:](self, "setInactive_callback:", 0, v19, v20, v21, v22, v23);
        -[RSDNCMInterface setAddressed_callback:](self, "setAddressed_callback:", 0);
        -[RSDNCMInterface setDetached_callback:](self, "setDetached_callback:", 0);

LABEL_19:
        break;
      default:
        return;
    }
  }
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;

  v3 = sub_10002AEC8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10003C1E4();

  if (-[RSDNCMInterface name](self, "name"))
  {
    free(-[RSDNCMInterface name](self, "name"));
    -[RSDNCMInterface setName:](self, "setName:", 0);
  }
  if (-[RSDNCMInterface mac_addr](self, "mac_addr"))
  {
    free(-[RSDNCMInterface mac_addr](self, "mac_addr"));
    -[RSDNCMInterface setMac_addr:](self, "setMac_addr:", 0);
  }
  -[RSDNCMInterface setIndex:](self, "setIndex:", 0);
  if (-[RSDNCMInterface service](self, "service"))
  {
    IOObjectRelease(-[RSDNCMInterface service](self, "service"));
    -[RSDNCMInterface setService:](self, "setService:", 0);
  }
  -[RSDNCMInterface deactivate](self, "deactivate");
  v5.receiver = self;
  v5.super_class = (Class)RSDNCMInterface;
  -[RSDNCMInterface dealloc](&v5, "dealloc");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)inactive_callback
{
  return self->_inactive_callback;
}

- (void)setInactive_callback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)addressed_callback
{
  return self->_addressed_callback;
}

- (void)setAddressed_callback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)detached_callback
{
  return self->_detached_callback;
}

- (void)setDetached_callback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (char)name
{
  return self->_name;
}

- (void)setName:(char *)a3
{
  self->_name = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_notification = a3;
}

- (IONotificationPort)notification_port
{
  return self->_notification_port;
}

- (void)setNotification_port:(IONotificationPort *)a3
{
  self->_notification_port = a3;
}

- (RSDRemoteNCMDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BOOL)is_private
{
  return self->_is_private;
}

- (void)setIs_private:(BOOL)a3
{
  self->_is_private = a3;
}

- (char)mac_addr
{
  return self->_mac_addr;
}

- (void)setMac_addr:(char *)a3
{
  self->_mac_addr = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_detached_callback, 0);
  objc_storeStrong(&self->_addressed_callback, 0);
  objc_storeStrong(&self->_inactive_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
