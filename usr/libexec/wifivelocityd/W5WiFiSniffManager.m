@implementation W5WiFiSniffManager

- (W5WiFiSniffManager)initWithStatusManager:(id)a3 andUserNotificationManager:(id)a4
{
  W5WiFiSniffManager *v6;
  W5WiFiSniffManager *v7;
  W5UserNotificationManager *v8;
  dispatch_queue_t v9;
  NSMutableArray *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)W5WiFiSniffManager;
  v6 = -[W5WiFiSniffManager init](&v12, "init");
  v7 = v6;
  if (!a3
    || !v6
    || ((v6->_status = (W5StatusManager *)a3, !a4)
      ? (v8 = 0)
      : (v8 = (W5UserNotificationManager *)a4),
        (v7->_notification = v8,
         v9 = dispatch_queue_create("com.apple.wifivelocity.wifi-sniffer", 0),
         (v7->_queue = (OS_dispatch_queue *)v9) == 0)
     || (v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray),
         (v7->_pendingRequests = v10) == 0)))
  {

    return 0;
  }
  return v7;
}

- (W5WiFiSniffManager)init
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("-[W5WiFiSniffManager init] unavailable"), 0));
}

- (void)dealloc
{
  W5UserNotificationManager *notification;
  NSObject *queue;
  objc_super v5;

  notification = self->_notification;
  if (notification)

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiSniffManager;
  -[W5WiFiSniffManager dealloc](&v5, "dealloc");
}

- (void)addRequest:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051F58;
  v4[3] = &unk_1000D5C48;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)__pendingRequestWithUUID:(id)a3
{
  NSMutableArray *pendingRequests;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  pendingRequests = self->_pendingRequests;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingRequests, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(pendingRequests);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(objc_msgSend(v9, "uuid"), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingRequests, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000520F4;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)__setupWatchdogTask
{
  NSString *v3;
  _QWORD v4[5];
  _QWORD v5[2];

  self->_watchdogTask = 0;
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("while kill -0 %d; do sleep 10; done; kill -9 %d;"),
         -[NSProcessInfo processIdentifier](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "processIdentifier"), -[NSTask processIdentifier](self->_task, "processIdentifier"));
  v5[0] = CFSTR("-c");
  v5[1] = v3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000524A4;
  v4[3] = &unk_1000D5CC0;
  v4[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", CFSTR("/bin/sh"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2), v4, 0);
}

- (void)__nextRequest
{
  W5WiFiActiveSnifferRequest *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  uint64_t v7;
  NSObject *v8;
  W5WiFiChannel *v9;
  unsigned int v10;
  NSObject *v11;
  _BOOL4 v12;
  NSArray *v13;
  double v14;
  NSArray *v15;
  unsigned int v16;
  NSObject *v17;
  _BOOL4 v18;
  double v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  const char *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[2];
  void (*v29)(uint64_t, uint64_t, uint64_t);
  void *v30;
  W5WiFiSniffManager *v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  _QWORD v34[11];
  _QWORD v35[9];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[5];
  int v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  W5WiFiChannel *v48;

  if (!self->_activeRequest && -[NSMutableArray count](self->_pendingRequests, "count"))
  {
    self->_activeRequest = objc_alloc_init(W5WiFiActiveSnifferRequest);
    -[W5WiFiActiveSnifferRequest setRequestInfo:](self->_activeRequest, "setRequestInfo:", objc_msgSend(-[NSMutableArray firstObject](self->_pendingRequests, "firstObject"), "copy"));
    v3 = self->_activeRequest;
    -[NSMutableArray removeObjectAtIndex:](self->_pendingRequests, "removeObjectAtIndex:", 0);
    v27[4] = self;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v29 = sub_100052DAC;
    v30 = &unk_1000D6B50;
    v31 = self;
    v26[4] = self;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100053084;
    v27[3] = &unk_1000D6B50;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10005320C;
    v26[3] = &unk_1000D6B78;
    v4 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
    v5 = -[NSURL path](-[W5WiFiSnifferRequest outputFile](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "outputFile"), "path");
    if (!v4 || (v6 = v5) == 0)
    {
      v32 = NSLocalizedFailureReasonErrorKey;
      v33 = CFSTR("W5ParamErr");
      v29((uint64_t)v28, 0, (uint64_t)+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1)));
      return;
    }
    if ((_os_feature_enabled_impl("WiFiVelocity", "BloodHoundSniffer") & 1) == 0)
      -[W5WiFiSnifferRequest setTcpDump:](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "setTcpDump:", 1);
    if (!objc_opt_class(BhoundBpfFileDescriptor, v7))
      -[W5WiFiSnifferRequest setTcpDump:](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "setTcpDump:", 1);
    if (-[W5WiFiSnifferRequest monitorMode](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "monitorMode"))
    {
      -[W5WiFiInterface disassociate](-[W5StatusManager wifi](self->_status, "wifi"), "disassociate");
      -[W5WiFiInterface setChannel:](-[W5StatusManager wifi](self->_status, "wifi"), "setChannel:", -[W5WiFiSnifferRequest channel](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "channel"));
      v8 = sub_10008F56C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = -[W5WiFiSnifferRequest channel](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "channel");
        v41 = 136315906;
        v42 = "-[W5WiFiSniffManager __nextRequest]";
        v43 = 2080;
        v44 = "W5WiFiSniffManager.m";
        v45 = 1024;
        v46 = 469;
        v47 = 2114;
        v48 = v9;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) Setting Channel: %{public}@", &v41, 38);
      }
      v10 = -[W5WiFiSnifferRequest tcpDump](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "tcpDump");
      v11 = sub_10008F56C();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          v41 = 136315650;
          v42 = "-[W5WiFiSniffManager __nextRequest]";
          v43 = 2080;
          v44 = "W5WiFiSniffManager.m";
          v45 = 1024;
          v46 = 472;
          LODWORD(v25) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) Sniff via tcp dump", (const char *)&v41, v25, LODWORD(v26[0]));
        }
        if (-[W5WiFiSnifferRequest noAutoStop](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "noAutoStop"))
        {
          v13 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
          v40[0] = CFSTR("-i");
          v40[1] = v4;
          v40[2] = CFSTR("-I");
          v40[3] = CFSTR("-G");
          v40[4] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), -[W5WiFiSnifferRequest rotationInterval](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "rotationInterval"));
          -[NSArray addObjectsFromArray:](v13, "addObjectsFromArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 5));
          if (-[W5WiFiSnifferRequest maxSize](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "maxSize") >= 1)
          {
            v39[0] = CFSTR("-C");
            v39[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), -[W5WiFiSnifferRequest maxSize](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "maxSize"));
            -[NSArray addObjectsFromArray:](v13, "addObjectsFromArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
          }
          if (-[W5WiFiSnifferRequest maxFiles](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "maxFiles") >= 1)
          {
            v38[0] = CFSTR("-W");
            v38[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), -[W5WiFiSnifferRequest maxFiles](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "maxFiles"));
            -[NSArray addObjectsFromArray:](v13, "addObjectsFromArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
          }
          if (-[W5WiFiSnifferRequest snaplen](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "snaplen") >= 1)
          {
            v37[0] = CFSTR("-s");
            v37[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), -[W5WiFiSnifferRequest snaplen](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "snaplen"));
            -[NSArray addObjectsFromArray:](v13, "addObjectsFromArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
          }
          v36[0] = CFSTR("-w");
          v36[1] = v6;
          -[NSArray addObjectsFromArray:](v13, "addObjectsFromArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
          -[W5WiFiSnifferRequest duration](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "duration");
          v15 = v13;
          goto LABEL_36;
        }
        v35[0] = CFSTR("-i");
        v35[1] = v4;
        v35[2] = CFSTR("-I");
        v35[3] = CFSTR("-G");
        -[W5WiFiSnifferRequest duration](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "duration");
        LODWORD(v24) = vcvtpd_s64_f64(v23);
        v35[4] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v24);
        v35[5] = CFSTR("-W");
        v35[6] = CFSTR("1");
        v35[7] = CFSTR("-w");
        v35[8] = v6;
        v21 = v35;
        v22 = 9;
LABEL_35:
        v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, v22);
        v14 = 0.0;
LABEL_36:
        +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:](NSTask, "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:", CFSTR("/usr/sbin/tcpdump"), v15, v28, 0, v27, v14);
        return;
      }
      if (v12)
      {
        v41 = 136315650;
        v42 = "-[W5WiFiSniffManager __nextRequest]";
        v43 = 2080;
        v44 = "W5WiFiSniffManager.m";
        v45 = 1024;
        v46 = 488;
        LODWORD(v25) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) Sniff via bhound", &v41, v25);
      }
    }
    else
    {
      v16 = -[W5WiFiSnifferRequest tcpDump](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "tcpDump");
      v17 = sub_10008F56C();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          v41 = 136315650;
          v42 = "-[W5WiFiSniffManager __nextRequest]";
          v43 = 2080;
          v44 = "W5WiFiSniffManager.m";
          v45 = 1024;
          v46 = 512;
          LODWORD(v25) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) Sniff via tcp dump", (const char *)&v41, v25, LODWORD(v26[0]));
        }
        v34[0] = CFSTR("-q");
        v34[1] = CFSTR("-n");
        v34[2] = CFSTR("-i");
        v34[3] = v4;
        v34[4] = CFSTR("-I");
        v34[5] = CFSTR("-G");
        -[W5WiFiSnifferRequest duration](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "duration");
        LODWORD(v20) = vcvtpd_s64_f64(v19);
        v34[6] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v20);
        v34[7] = CFSTR("-W");
        v34[8] = CFSTR("1");
        v34[9] = CFSTR("-w");
        v34[10] = v6;
        v21 = v34;
        v22 = 11;
        goto LABEL_35;
      }
      if (v18)
      {
        v41 = 136315650;
        v42 = "-[W5WiFiSniffManager __nextRequest]";
        v43 = 2080;
        v44 = "W5WiFiSniffManager.m";
        v45 = 1024;
        v46 = 516;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) Sniff via bhound", &v41, 28);
      }
    }
    -[W5WiFiSniffManager startSniffingWithRequest:interfaceName:reply:](self, "startSniffingWithRequest:interfaceName:reply:", -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), v4, v26);
  }
}

- (BOOL)__isCancelled
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000533F0;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)teardownAndNotify:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100053480;
  v4[3] = &unk_1000D5C20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)startSniffingWithRequest:(id)a3 interfaceName:(id)a4 reply:(id)a5
{
  NSObject *v8;
  unsigned int v9;
  BhoundBpfFileDescriptor *v10;
  BhoundPcap *v11;
  double v12;
  OS_dispatch_source *v13;
  OS_dispatch_source *v14;
  double v15;
  dispatch_time_t v16;
  NSError *v17;
  const __CFString **v18;
  NSErrorUserInfoKey *v19;
  NSObject *v20;
  const char *v21;
  int v22;
  int v23;
  _QWORD handler[5];
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  BhoundBpfFileDescriptor *v36;
  __int16 v37;
  BhoundPcap *v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;

  -[W5WiFiActiveSnifferRequest setActiveFileHandle:](self->_activeRequest, "setActiveFileHandle:", -[W5WiFiSniffManager fetchFileHandleForInterface:](self, "fetchFileHandleForInterface:", a4));
  if (!-[W5WiFiActiveSnifferRequest activeFileHandle](self->_activeRequest, "activeFileHandle"))
  {
    v20 = sub_10008F56C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315650;
      v28 = "-[W5WiFiSniffManager startSniffingWithRequest:interfaceName:reply:]";
      v29 = 2080;
      v30 = "W5WiFiSniffManager.m";
      v31 = 1024;
      v32 = 589;
      LODWORD(v21) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] %s (%s:%u) Could not open bpf interface", (const char *)&v27, v21, v23);
    }
    if (!a5)
      return;
    v39 = NSLocalizedFailureReasonErrorKey;
    v40 = CFSTR("W5ParamErr");
    v18 = &v40;
    v19 = &v39;
LABEL_16:
    v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v19, 1));
    goto LABEL_17;
  }
  -[W5WiFiActiveSnifferRequest setActiveBFD:](self->_activeRequest, "setActiveBFD:", objc_msgSend(objc_alloc((Class)BhoundBpfFileDescriptor), "initWithFileDescriptor:datalinkType:delegate:delegateQueue:", -[NSFileHandle fileDescriptor](-[W5WiFiActiveSnifferRequest activeFileHandle](self->_activeRequest, "activeFileHandle"), "fileDescriptor"), 127, self, self->_queue));
  -[W5WiFiActiveSnifferRequest setActivePCap:](self->_activeRequest, "setActivePCap:", objc_msgSend(objc_alloc((Class)BhoundPcap), "initWithSaveFileName:dataLinkTypeValue:sizeLimit:countLimit:circularSaveFiles:timestampSaveFiles:", objc_msgSend(objc_msgSend(a3, "outputFile"), "path"), 127, 0, 0, 0, 0));
  v8 = sub_10008F56C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[NSFileHandle fileDescriptor](-[W5WiFiActiveSnifferRequest activeFileHandle](self->_activeRequest, "activeFileHandle"), "fileDescriptor");
    v10 = -[W5WiFiActiveSnifferRequest activeBFD](self->_activeRequest, "activeBFD");
    v11 = -[W5WiFiActiveSnifferRequest activePCap](self->_activeRequest, "activePCap");
    v27 = 136316418;
    v28 = "-[W5WiFiSniffManager startSniffingWithRequest:interfaceName:reply:]";
    v29 = 2080;
    v30 = "W5WiFiSniffManager.m";
    v31 = 1024;
    v32 = 599;
    v33 = 1024;
    v34 = v9;
    v35 = 2114;
    v36 = v10;
    v37 = 2114;
    v38 = v11;
    v22 = 54;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) ActiveFH descriptor %d, BFD %{public}@, PCAP %{public}@", &v27, v22);
  }
  if (!-[W5WiFiActiveSnifferRequest activeBFD](self->_activeRequest, "activeBFD")
    || !-[W5WiFiActiveSnifferRequest activePCap](self->_activeRequest, "activePCap"))
  {
    if (!a5)
      return;
    v25 = NSLocalizedFailureReasonErrorKey;
    v26 = CFSTR("W5ParamErr");
    v18 = &v26;
    v19 = &v25;
    goto LABEL_16;
  }
  objc_msgSend(a3, "duration");
  if (v12 > 0.0)
  {
    -[W5WiFiActiveSnifferRequest setTimeoutTimer:](self->_activeRequest, "setTimeoutTimer:", dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue));
    v13 = -[W5WiFiActiveSnifferRequest timeoutTimer](self->_activeRequest, "timeoutTimer");
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000539E0;
    handler[3] = &unk_1000D5C98;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v13, handler);
    v14 = -[W5WiFiActiveSnifferRequest timeoutTimer](self->_activeRequest, "timeoutTimer");
    objc_msgSend(a3, "duration");
    v16 = dispatch_time(0, 1000000000 * (uint64_t)v15);
    dispatch_source_set_timer((dispatch_source_t)v14, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate((dispatch_object_t)-[W5WiFiActiveSnifferRequest timeoutTimer](self->_activeRequest, "timeoutTimer"));
  }
  -[BhoundBpfFileDescriptor resume](-[W5WiFiActiveSnifferRequest activeBFD](self->_activeRequest, "activeBFD"), "resume");
  if (a5)
  {
    v17 = 0;
LABEL_17:
    (*((void (**)(id, NSError *))a5 + 2))(a5, v17);
  }
}

- (void)stopSniffingActiveRequestWithError:(id)a3
{
  W5WiFiActiveSnifferRequest *activeRequest;
  void (**v6)(id, id);

  activeRequest = self->_activeRequest;
  if (activeRequest && -[W5WiFiActiveSnifferRequest activeBFD](activeRequest, "activeBFD"))
  {
    -[BhoundBpfFileDescriptor cancel](-[W5WiFiActiveSnifferRequest activeBFD](self->_activeRequest, "activeBFD"), "cancel");
    if (-[W5WiFiActiveSnifferRequest timeoutTimer](self->_activeRequest, "timeoutTimer")
      && !dispatch_source_testcancel((dispatch_source_t)-[W5WiFiActiveSnifferRequest timeoutTimer](self->_activeRequest, "timeoutTimer")))
    {
      dispatch_source_cancel((dispatch_source_t)-[W5WiFiActiveSnifferRequest timeoutTimer](self->_activeRequest, "timeoutTimer"));
    }
    if (-[W5WiFiSnifferRequest reply](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "reply"))
    {
      v6 = -[W5WiFiSnifferRequest reply](-[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"), "reply");
      v6[2](v6, a3);
    }
    -[BhoundPcap shutdown](-[W5WiFiActiveSnifferRequest activePCap](self->_activeRequest, "activePCap"), "shutdown");

    self->_activeRequest = 0;
    -[W5WiFiSniffManager __nextRequest](self, "__nextRequest");
  }
}

- (id)fetchFileHandleForInterface:(id)a3
{
  pcap *v3;
  uint64_t selectable_fd;

  v3 = -[W5WiFiSniffManager openPcapForInterface:datalinkType:](self, "openPcapForInterface:datalinkType:", a3, 127);
  if (!v3)
    return 0;
  selectable_fd = pcap_get_selectable_fd(v3);
  if ((selectable_fd & 0x80000000) != 0)
    return 0;
  else
    return objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", selectable_fd, 1);
}

- (void)BhoundBpfFileDescriptor:(id)a3 receivedPacket:(id)a4
{
  if (a4)
  {
    if (-[W5WiFiActiveSnifferRequest activePCap](self->_activeRequest, "activePCap", a3))
      -[BhoundPcap savePacket:](-[W5WiFiActiveSnifferRequest activePCap](self->_activeRequest, "activePCap"), "savePacket:", a4);
  }
}

- (void)BhoundBpfFileDescriptor:(id)a3 errorOccurred:(id)a4
{
  NSObject *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;

  v6 = sub_10008F56C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315906;
    v9 = "-[W5WiFiSniffManager BhoundBpfFileDescriptor:errorOccurred:]";
    v10 = 2080;
    v11 = "W5WiFiSniffManager.m";
    v12 = 1024;
    v13 = 668;
    v14 = 2114;
    v15 = a4;
    v7 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) Received new packet error %{public}@", &v8, v7);
  }
  -[W5WiFiSniffManager stopSniffingActiveRequestWithError:](self, "stopSniffingActiveRequestWithError:", a4);
}

- (pcap)openPcapForInterface:(id)a3 datalinkType:(int)a4
{
  pcap_t *v5;
  int selectable_fd;
  int v8;
  char v9[256];

  v5 = pcap_create((const char *)objc_msgSend(a3, "UTF8String"), v9);
  if (pcap_set_snaplen(v5, 0x80000))
    return 0;
  pcap_set_promisc(v5, 1);
  if (pcap_set_timeout(v5, 0)
    || (a4 - 105) <= 0x3A
    && ((1 << (a4 - 105)) & 0x40000000040C001) != 0
    && pcap_set_rfmon(v5, 1))
  {
    return 0;
  }
  pcap_activate(v5);
  if (pcap_set_datalink(v5, a4))
    return 0;
  selectable_fd = pcap_get_selectable_fd(v5);
  v8 = 1;
  if (ioctl(selectable_fd, 0x80044270uLL, &v8))
    return 0;
  else
    return v5;
}

@end
