@implementation UpgradeSequencer

+ (id)getSharedInstance
{
  if (qword_10005A3D0 != -1)
    dispatch_once(&qword_10005A3D0, &stru_100055170);
  return (id)qword_10005A3D8;
}

- (UpgradeSequencer)init
{
  id v2;
  dispatch_queue_attr_t initially_inactive;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  os_log_t v18;
  void *v19;
  _QWORD handler[4];
  id v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)UpgradeSequencer;
  v2 = -[UpgradeSequencer init](&v23, "init");
  if (v2)
  {
    initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
    v4 = objc_claimAutoreleasedReturnValue(initially_inactive);
    v5 = dispatch_queue_create("com.apple.security.cryptexd.upgrade_sequencer_registration", v4);

    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    dispatch_set_qos_class(*((_QWORD *)v2 + 3), 25, 0);
    dispatch_activate(*((dispatch_object_t *)v2 + 3));
    v7 = dispatch_queue_create("com.apple.security.cryptexd.upgrade_sequencer_work", 0);
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v7;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 2), *((dispatch_queue_t *)v2 + 3));
    v9 = dispatch_queue_create("com.apple.security.cryptexd.upgrade_sequencer_lock_acquire", 0);
    v10 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v9;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 1), *((dispatch_queue_t *)v2 + 2));
    dispatch_suspend(*((dispatch_object_t *)v2 + 1));
    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 2));
    v12 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v11;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 8), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v13 = *((_QWORD *)v2 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000336C;
    handler[3] = &unk_1000550E0;
    v14 = v2;
    v22 = v14;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 8));
    v15 = (void *)v14[6];
    v14[6] = 0;

    v16 = objc_alloc_init((Class)NSMutableDictionary);
    v17 = (void *)v14[4];
    v14[4] = v16;

    v18 = os_log_create("com.apple.libcryptex", "upgrade_sequencer");
    v19 = (void *)v14[5];
    v14[5] = v18;

  }
  return (UpgradeSequencer *)v2;
}

- (void)startUpgradeForCryptexes:(id)a3 killingJobs:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003558;
  v13[3] = &unk_100055238;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

- (void)completeUpgradeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000041FC;
  v7[3] = &unk_100055260;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)onUpgradeCompleteForCryptex:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_suspend(v8);

  v9 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer registrationQueue](self, "registrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000431C;
  block[3] = &unk_100055288;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)onUpgradeSessionComplete:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_suspend(v5);

  v6 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer registrationQueue](self, "registrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000459C;
  block[3] = &unk_100055260;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

- (void)lockInterfaceForClient:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockAcquireQueue](self, "lockAcquireQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000469C;
  block[3] = &unk_100055288;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (BOOL)lockIsHeldByClient:(_rpc_cred *)a3
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004F78;
  block[3] = &unk_1000552B0;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (void)abortWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005088;
  v7[3] = &unk_100055260;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_isInterfaceLocked
{
  UpgradeSequencer *v2;
  NSObject *v3;
  void *v4;

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](v2, "lockingClient"));
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (int)_setKernelUpgradeOngoing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v4);

  return sub_1000365D8(v3);
}

- (id)_completeUpgradeSession
{
  NSObject *v3;
  unsigned int v4;
  signed int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  CFErrorRef v15;
  CFErrorRef v17;

  v3 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = -[UpgradeSequencer _setKernelUpgradeOngoing:](self, "_setKernelUpgradeOngoing:", 0);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));

    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v7, 16);

    }
    else
    {
      v9 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v15 = sub_10000A6F8("-[UpgradeSequencer _completeUpgradeSession]", "upgrade_sequencer.m", 611, "com.apple.security.cryptex.posix", v5, 0, v9);
    free(v9);
    return v15;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _unlockInterface](self, "_unlockInterface"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));

      if (v11)
      {
        v12 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          v13 = 3;
        else
          v13 = 2;
        v14 = (char *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v12, 16);

      }
      else
      {
        v14 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      }
      v17 = sub_10000A6F8("-[UpgradeSequencer _completeUpgradeSession]", "upgrade_sequencer.m", 620, "com.apple.security.cryptex.posix", 26, v10, v14);
      free(v14);

      return v17;
    }
    else
    {
      return 0;
    }
  }
}

- (void)_handleInterfaceLockCancel
{
  void *v2;
  _xpc_connection_s *v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _xpc_connection_s *v8;
  pid_t pid;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  pid_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  int v19;
  _OWORD *v20;
  __int16 v21;
  pid_t v22;
  _OWORD buffer[2];

  v5 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  if (v6)
  {
    buffer[0] = *(_OWORD *)"unknown";
    buffer[1] = *(_OWORD *)&qword_100044728;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conn"));
    pid = xpc_connection_get_pid(v8);
    proc_name(pid, buffer, 0x20u);

    v10 = *__error();
    v11 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "conn"));
      if (v13)
      {
        v2 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
        v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conn"));
        v14 = xpc_connection_get_pid(v3);
      }
      else
      {
        v14 = -1;
      }
      v19 = 136315394;
      v20 = buffer;
      v21 = 1024;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Client disconnected.", (uint8_t *)&v19, 0x12u);
      if (v13)
      {

      }
    }

    *__error() = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _abort](self, "_abort"));
    if (v15)
    {
      v16 = *__error();
      v17 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buffer[0]) = 138412290;
        *(_QWORD *)((char *)buffer + 4) = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to abort upgrade.: %@", (uint8_t *)buffer, 0xCu);
      }

      *__error() = v16;
    }
    v18 = -[UpgradeSequencer _unlockInterface](self, "_unlockInterface");

  }
}

- (id)_unlockInterface
{
  NSObject *v3;
  void *v4;

  v3 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  if (v4)
  {
    -[UpgradeSequencer _disableInterfaceLockTimeout](self, "_disableInterfaceLockTimeout");
    -[UpgradeSequencer setLockingClient:](self, "setLockingClient:", 0);
  }
  return 0;
}

- (void)_disableInterfaceLockTimeout
{
  void *v2;
  _xpc_connection_s *v3;
  NSObject *v5;
  void *v6;
  _xpc_connection_s *v7;
  pid_t pid;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  pid_t v13;
  NSObject *v14;
  int v15;
  _OWORD *v16;
  __int16 v17;
  pid_t v18;
  _OWORD buffer[2];

  v5 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = *(_OWORD *)&qword_100044728;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conn"));
  pid = xpc_connection_get_pid(v7);
  proc_name(pid, buffer, 0x20u);

  v9 = *__error();
  v10 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conn"));
    if (v12)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conn"));
      v13 = xpc_connection_get_pid(v3);
    }
    else
    {
      v13 = -1;
    }
    v15 = 136315394;
    v16 = buffer;
    v17 = 1024;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Suspending upgrade lock timeout.", (uint8_t *)&v15, 0x12u);
    if (v12)
    {

    }
  }

  *__error() = v9;
  v14 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockTimer](self, "lockTimer"));
  dispatch_source_set_timer(v14, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

}

- (void)_restartInterfaceLockTimeout
{
  void *v2;
  _xpc_connection_s *v3;
  NSObject *v5;
  void *v6;
  _xpc_connection_s *v7;
  pid_t pid;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  pid_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  int v16;
  _OWORD *v17;
  __int16 v18;
  pid_t v19;
  __int16 v20;
  int v21;
  _OWORD buffer[2];

  v5 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = *(_OWORD *)&qword_100044728;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conn"));
  pid = xpc_connection_get_pid(v7);
  proc_name(pid, buffer, 0x20u);

  v9 = *__error();
  v10 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conn"));
    if (v12)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conn"));
      v13 = xpc_connection_get_pid(v3);
    }
    else
    {
      v13 = -1;
    }
    v16 = 136315650;
    v17 = buffer;
    v18 = 1024;
    v19 = v13;
    v20 = 1024;
    v21 = 10;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Giving client another %d seconds to hold lock.", (uint8_t *)&v16, 0x18u);
    if (v12)
    {

    }
  }

  *__error() = v9;
  v14 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockTimer](self, "lockTimer"));
  v15 = dispatch_walltime(0, 10000000000);
  dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

}

- (id)_timeout
{
  void *v2;
  void *v3;
  _xpc_connection_s *v4;
  NSObject *v6;
  CFErrorRef v7;
  void *v8;
  _xpc_connection_s *v9;
  pid_t pid;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  pid_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  pid_t v21;
  char *v22;
  uint64_t v24;
  int v25;
  _OWORD *v26;
  __int16 v27;
  pid_t v28;
  __int16 v29;
  int v30;
  _OWORD buffer[2];

  v6 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v6);

  v7 = (CFErrorRef)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  if (v7)
  {
    buffer[0] = *(_OWORD *)"unknown";
    buffer[1] = *(_OWORD *)&qword_100044728;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conn"));
    pid = xpc_connection_get_pid(v9);
    proc_name(pid, buffer, 0x20u);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v13 = 3;
      else
        v13 = 2;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "conn"));
      if (v15)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
        v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conn"));
        v16 = xpc_connection_get_pid(v4);
      }
      else
      {
        v16 = -1;
      }
      v25 = 136315650;
      v26 = buffer;
      v27 = 1024;
      v28 = v16;
      v29 = 1024;
      v30 = 60;
      LODWORD(v24) = 24;
      v22 = (char *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v12, 16);
      if (v15)
      {

      }
    }
    else
    {
      v18 = &_os_log_default;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "conn"));
      if (v20)
      {
        v2 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conn"));
        v21 = xpc_connection_get_pid((xpc_connection_t)v3);
      }
      else
      {
        v21 = -1;
      }
      v25 = 136315650;
      v26 = buffer;
      v27 = 1024;
      v28 = v21;
      v29 = 1024;
      v30 = 60;
      LODWORD(v24) = 24;
      v22 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      if (v20)
      {

      }
      v12 = &_os_log_default;
    }

    v7 = sub_10000A6F8("-[UpgradeSequencer _timeout]", "upgrade_sequencer.m", 697, "com.apple.security.cryptex.posix", 60, 0, v22);
    free(v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _completeUpgradeWithError:](self, "_completeUpgradeWithError:", v7, &v25, v24));
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_abort
{
  NSObject *v3;
  char *v4;
  CFErrorRef v5;
  void *v6;
  uint64_t v8;
  _WORD v9[8];

  v3 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v9[0] = 0;
  LODWORD(v8) = 2;
  v4 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
  v5 = sub_10000A6F8("-[UpgradeSequencer _abort]", "upgrade_sequencer.m", 712, "com.apple.security.cryptex", 27, 0, v4);
  free(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _completeUpgradeWithError:](self, "_completeUpgradeWithError:", v5, v9, v8));

  return v6;
}

- (void)_startUpgradeForCryptex:(id)a3 withGraftPath:(id)a4 killingJobs:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, CFErrorRef);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  char *v19;
  CFErrorRef v20;
  UpgradeOperation *v21;
  UpgradeOperation *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  char *v27;
  CFErrorRef v28;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, CFErrorRef))a6;
  v13 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer upgradesUnderway](self, "upgradesUnderway"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v10));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));

    if (v16)
    {
      v17 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        v18 = 3;
      else
        v18 = 2;
      v19 = (char *)_os_log_send_and_compose_impl(v18, 0, 0, 0, &_mh_execute_header, v17, 16);

    }
    else
    {
      v19 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v20 = sub_10000A6F8("-[UpgradeSequencer _startUpgradeForCryptex:withGraftPath:killingJobs:withCompletion:]", "upgrade_sequencer.m", 732, "com.apple.security.cryptex", 29, 0, v19);
    free(v19);
    v12[2](v12, v20);
  }
  else
  {
    v20 = 0;
  }
  v21 = -[UpgradeOperation initWithCryptexName:graftPath:]([UpgradeOperation alloc], "initWithCryptexName:graftPath:", v10, v11);
  v22 = v21;
  if (v21)
  {
    -[UpgradeOperation startUpgrade](v21, "startUpgrade");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer upgradesUnderway](self, "upgradesUnderway"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v10);

    if (v7)
      -[UpgradeOperation terminateJobsWithCompletion:](v22, "terminateJobsWithCompletion:", v12);
    else
      v12[2](v12, 0);
    v28 = v20;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));

    if (v24)
    {
      v25 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        v26 = 3;
      else
        v26 = 2;
      v27 = (char *)_os_log_send_and_compose_impl(v26, 0, 0, 0, &_mh_execute_header, v25, 16);

    }
    else
    {
      v27 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v28 = sub_10000A6F8("-[UpgradeSequencer _startUpgradeForCryptex:withGraftPath:killingJobs:withCompletion:]", "upgrade_sequencer.m", 742, "com.apple.security.cryptex", 24, 0, v27);
    free(v27);

    v12[2](v12, v28);
  }

}

- (id)_completeUpgradeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer upgradesUnderway](self, "upgradesUnderway"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000063C4;
  v13[3] = &unk_1000552D8;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer upgradesUnderway](self, "upgradesUnderway"));
  objc_msgSend(v8, "removeAllObjects");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer sessionCompleteCallback](self, "sessionCompleteCallback"));
  if (v9)
  {
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[UpgradeSequencer sessionCompleteCallback](self, "sessionCompleteCallback"));
    ((void (**)(_QWORD, id))v10)[2](v10, v7);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _completeUpgradeSession](self, "_completeUpgradeSession"));

  return v11;
}

- (OS_dispatch_queue)lockAcquireQueue
{
  return self->_lockAcquireQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)registrationQueue
{
  return self->_registrationQueue;
}

- (NSMutableDictionary)upgradesUnderway
{
  return self->_upgradesUnderway;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (id)sessionCompleteCallback
{
  return self->_sessionCompleteCallback;
}

- (void)setSessionCompleteCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UpgradeClient)lockingClient
{
  return self->_lockingClient;
}

- (void)setLockingClient:(id)a3
{
  objc_storeStrong((id *)&self->_lockingClient, a3);
}

- (OS_dispatch_source)lockTimer
{
  return self->_lockTimer;
}

- (void)setLockTimer:(id)a3
{
  objc_storeStrong((id *)&self->_lockTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockTimer, 0);
  objc_storeStrong((id *)&self->_lockingClient, 0);
  objc_storeStrong(&self->_sessionCompleteCallback, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_upgradesUnderway, 0);
  objc_storeStrong((id *)&self->_registrationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lockAcquireQueue, 0);
}

@end
