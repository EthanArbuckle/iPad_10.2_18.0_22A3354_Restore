@implementation W5WiFiPerfLoggingManager

- (W5WiFiPerfLoggingManager)initWithStatusManager:(id)a3
{
  W5WiFiPerfLoggingManager *v4;
  W5WiFiPerfLoggingManager *v5;
  dispatch_queue_t v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSDateFormatter *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)W5WiFiPerfLoggingManager;
  v4 = -[W5WiFiPerfLoggingManager init](&v11, "init");
  v5 = v4;
  if (!a3)
    goto LABEL_9;
  if (!v4)
    goto LABEL_9;
  v4->_status = (W5StatusManager *)a3;
  v6 = dispatch_queue_create("com.apple.wifivelocity.wifiperf", 0);
  v5->_queue = (OS_dispatch_queue *)v6;
  if (!v6)
    goto LABEL_9;
  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_pendingRequests = v7;
  if (v7
    && (v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray), (v5->_runningTasks = v8) != 0)
    && (v9 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter), (v5->_dateFormatter = v9) != 0))
  {
    -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
  }
  else
  {
LABEL_9:

    return 0;
  }
  return v5;
}

- (W5WiFiPerfLoggingManager)init
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("-[W5WiFiPerfLoggingManager init] unavailable"), 0));
}

- (void)dealloc
{
  NSObject *awdlQueryTimer;
  NSObject *nanQueryTimer;
  NSObject *coreCaptureTriggerTimer;
  NSObject *beginGroup;
  NSObject *endGroup;
  NSObject *queue;
  objc_super v9;

  awdlQueryTimer = self->_awdlQueryTimer;
  if (awdlQueryTimer)
  {
    dispatch_source_cancel(awdlQueryTimer);
    dispatch_release((dispatch_object_t)self->_awdlQueryTimer);
    self->_awdlQueryTimer = 0;
  }
  nanQueryTimer = self->_nanQueryTimer;
  if (nanQueryTimer)
  {
    dispatch_source_cancel(nanQueryTimer);
    dispatch_release((dispatch_object_t)self->_nanQueryTimer);
    self->_nanQueryTimer = 0;
  }
  coreCaptureTriggerTimer = self->_coreCaptureTriggerTimer;
  if (coreCaptureTriggerTimer)
  {
    dispatch_source_cancel(coreCaptureTriggerTimer);
    dispatch_release((dispatch_object_t)self->_coreCaptureTriggerTimer);
    self->_coreCaptureTriggerTimer = 0;
  }
  beginGroup = self->_beginGroup;
  if (beginGroup)
    dispatch_release(beginGroup);
  endGroup = self->_endGroup;
  if (endGroup)
    dispatch_release(endGroup);
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v9.receiver = self;
  v9.super_class = (Class)W5WiFiPerfLoggingManager;
  -[W5WiFiPerfLoggingManager dealloc](&v9, "dealloc");
}

- (void)teardownAndNotify:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F020;
  v4[3] = &unk_1000D5C20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)addRequest:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F0F4;
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
  block[2] = sub_10001F294;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)__dumpCoreCaptureLogsWithReason:(id)a3
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F4A8;
  block[3] = &unk_1000D5C98;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

- (void)__startCoreCaptureTriggerTimerWithInterval:(unint64_t)a3
{
  OS_dispatch_source *v5;
  NSObject *coreCaptureTriggerTimer;
  dispatch_time_t v7;
  _QWORD handler[5];

  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_coreCaptureTriggerTimer = v5;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001F7CC;
  handler[3] = &unk_1000D5C98;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  coreCaptureTriggerTimer = self->_coreCaptureTriggerTimer;
  a3 *= 1000000000;
  v7 = dispatch_time(0, a3);
  dispatch_source_set_timer(coreCaptureTriggerTimer, v7, a3, 0);
  dispatch_resume((dispatch_object_t)self->_coreCaptureTriggerTimer);
}

- (void)__startPerfLogging
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSArray *v8;
  id v9;
  id v10;
  NSArray *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[2];
  _QWORD v37[17];
  _QWORD v38[2];
  _QWORD v39[7];
  _QWORD v40[7];
  _QWORD v41[5];
  _QWORD v42[4];
  _QWORD v43[8];

  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  v3 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), CFSTR("tcpdump.pcap")));
  v43[0] = CFSTR("-n");
  v43[1] = CFSTR("-p");
  v43[2] = CFSTR("-i");
  v43[3] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v43[4] = CFSTR("-s");
  v43[5] = CFSTR("300");
  v43[6] = CFSTR("-w");
  v43[7] = v3;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100020230;
  v35[3] = &unk_1000D5CC0;
  v35[4] = self;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000202D4;
  v34[3] = &unk_1000D5CE8;
  v34[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", CFSTR("/usr/sbin/tcpdump"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 8), v35, v34);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  v4 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), CFSTR("netstat_inout.txt")));
  v42[0] = CFSTR("-I");
  v42[1] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v42[2] = CFSTR("-w");
  v42[3] = CFSTR("1");
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000202F0;
  v33[3] = &unk_1000D5CC0;
  v33[4] = self;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100020394;
  v32[3] = &unk_1000D5CE8;
  v32[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4), v4, v33, v32);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  v5 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), CFSTR("netstat_queue.txt")));
  v41[0] = CFSTR("-I");
  v41[1] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v41[2] = CFSTR("-w");
  v41[3] = CFSTR("1");
  v41[4] = CFSTR("-qq");
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000203B0;
  v31[3] = &unk_1000D5CC0;
  v31[4] = self;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100020454;
  v30[3] = &unk_1000D5CE8;
  v30[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 5), v5, v31, v30);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  v6 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), CFSTR("netstat_tcp.txt")));
  v40[0] = CFSTR("-I");
  v40[1] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v40[2] = CFSTR("-w");
  v40[3] = CFSTR("1");
  v40[4] = CFSTR("-s");
  v40[5] = CFSTR("-p");
  v40[6] = CFSTR("tcp");
  v28[4] = self;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100020470;
  v29[3] = &unk_1000D5CC0;
  v29[4] = self;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100020514;
  v28[3] = &unk_1000D5CE8;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 7), v6, v29, v28);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  v7 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), CFSTR("netstat_udp.txt")));
  v39[0] = CFSTR("-I");
  v39[1] = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  v39[2] = CFSTR("-w");
  v39[3] = CFSTR("1");
  v39[4] = CFSTR("-s");
  v39[5] = CFSTR("-p");
  v39[6] = CFSTR("udp");
  v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 7);
  v26[4] = self;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100020530;
  v27[3] = &unk_1000D5CC0;
  v27[4] = self;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000205D4;
  v26[3] = &unk_1000D5CE8;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), v8, v7, v27, v26);
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  v9 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"), CFSTR("nettop.txt")));
  v24[4] = self;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000205F0;
  v25[3] = &unk_1000D5CC0;
  v25[4] = self;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100020694;
  v24[3] = &unk_1000D5CE8;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/bin/nettop"), &off_1000E7410, v9, v25, v24);
  v10 = -[NSDictionary objectForKeyedSubscript:](-[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"), "objectForKeyedSubscript:", CFSTR("WiFiStatsSampleInterval"));
  if (v10)
  {
    v38[0] = CFSTR("-vrftsR");
    v38[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v10, "integerValue"));
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2);
  }
  else
  {
    v11 = (NSArray *)&off_1000E7428;
  }
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  v12 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", CFSTR("wifistats.txt"));
  v22[4] = self;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000206B0;
  v23[3] = &unk_1000D5CC0;
  v23[4] = self;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100020754;
  v22[3] = &unk_1000D5CE8;
  +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/local/bin/wifistats"), v11, v12, v23, v22);
  v13 = -[NSDictionary objectForKeyedSubscript:](-[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"), "objectForKeyedSubscript:", CFSTR("PowermetricsCPUSampleInterval"));
  if (v13)
    v14 = objc_msgSend(v13, "integerValue");
  else
    v14 = 0;
  dispatch_group_enter((dispatch_group_t)self->_beginGroup);
  v15 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", CFSTR("powermetrics.txt"));
  v37[0] = CFSTR("-b");
  v37[1] = CFSTR("/usr/local/bin/powermetrics");
  v37[2] = CFSTR("-i");
  v37[3] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v14);
  v37[4] = CFSTR("--samplers");
  v37[5] = CFSTR("cpu_power,tasks,network,interrupts");
  v37[6] = CFSTR("--show-usage-summary");
  v37[7] = CFSTR("--show-plimits");
  v37[8] = CFSTR("--show-process-qos");
  v37[9] = CFSTR("--show-process-netstats");
  v37[10] = CFSTR("--show-process-energy");
  v37[11] = CFSTR("--show-process-samp-norm");
  v37[12] = CFSTR("--show-process-gpu");
  v37[13] = CFSTR("--show-process-io");
  v37[14] = CFSTR("--show-process-wait-times");
  v37[15] = CFSTR("-u");
  v37[16] = v15;
  v20[4] = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100020770;
  v21[3] = &unk_1000D5CC0;
  v21[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100020814;
  v20[3] = &unk_1000D5CE8;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", CFSTR("/usr/sbin/taskpolicy"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 17), v21, v20);
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"), "objectForKeyedSubscript:", CFSTR("IncludeArtrace")), "BOOLValue"))
  {
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v16 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", CFSTR("wifiperf.artrace"));
    v36[0] = CFSTR("-o");
    v36[1] = v16;
    v18[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100020830;
    v19[3] = &unk_1000D5CC0;
    v19[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000208D4;
    v18[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", CFSTR("/usr/local/bin/artrace"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2), v19, v18);
  }
  v17 = -[NSDictionary objectForKeyedSubscript:](-[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"), "objectForKeyedSubscript:", CFSTR("CoreCaptureTriggerInterval"));
  if (v17)
    -[W5WiFiPerfLoggingManager __startCoreCaptureTriggerTimerWithInterval:](self, "__startCoreCaptureTriggerTimerWithInterval:", objc_msgSend(v17, "unsignedIntegerValue"));
}

- (void)__startAWDLPerfLogging
{
  NSString *v3;
  NSString *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[15];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[7];
  _QWORD v24[7];
  _QWORD v25[5];
  _QWORD v26[4];
  _QWORD v27[8];
  _QWORD v28[5];

  v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName");
  if (v3)
  {
    v4 = v3;
    -[W5WiFiPerfLoggingManager __startAWDLQueryTimer](self, "__startAWDLQueryTimer");
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v5 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("io80211.pcap")));
    v28[0] = v4;
    v28[1] = CFSTR("-logf='vv el+ set'");
    v28[2] = CFSTR("-quiet");
    v28[3] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-outfile=%@"), v5);
    v28[4] = CFSTR("-dlog");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100021008;
    v22[3] = &unk_1000D5CC0;
    v22[4] = self;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000210AC;
    v21[3] = &unk_1000D5CE8;
    v21[4] = self;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 5), v22, v21);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v6 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("tcpdump.pcap")));
    v27[0] = CFSTR("-n");
    v27[1] = CFSTR("-p");
    v27[2] = CFSTR("-i");
    v27[3] = v4;
    v27[4] = CFSTR("-s");
    v27[5] = CFSTR("300");
    v27[6] = CFSTR("-w");
    v27[7] = v6;
    v19[4] = self;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000210C8;
    v20[3] = &unk_1000D5CC0;
    v20[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002116C;
    v19[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", CFSTR("/usr/sbin/tcpdump"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 8), v20, v19);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v7 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("netstat_inout.txt")));
    v26[0] = CFSTR("-I");
    v26[1] = v4;
    v26[2] = CFSTR("-w");
    v26[3] = CFSTR("1");
    v17[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100021188;
    v18[3] = &unk_1000D5CC0;
    v18[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002122C;
    v17[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4), v7, v18, v17);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("netstat_queue.txt")));
    v25[0] = CFSTR("-I");
    v25[1] = v4;
    v25[2] = CFSTR("-w");
    v25[3] = CFSTR("1");
    v25[4] = CFSTR("-qq");
    +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 5);
    v16[9] = self;
    v16[10] = _NSConcreteStackBlock;
    v16[11] = 3221225472;
    v16[12] = sub_100021248;
    v16[13] = &unk_1000D5CC0;
    v16[14] = self;
    v16[5] = _NSConcreteStackBlock;
    v16[6] = 3221225472;
    v16[7] = sub_1000212EC;
    v16[8] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:");
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v8 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("netstat_tcp.txt")));
    v24[0] = CFSTR("-I");
    v24[1] = v4;
    v24[2] = CFSTR("-w");
    v24[3] = CFSTR("1");
    v24[4] = CFSTR("-s");
    v24[5] = CFSTR("-p");
    v24[6] = CFSTR("tcp");
    v15[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100021308;
    v16[3] = &unk_1000D5CC0;
    v16[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000213AC;
    v15[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 7), v8, v16, v15);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v9 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("netstat_udp.txt")));
    v23[0] = CFSTR("-I");
    v23[1] = v4;
    v23[2] = CFSTR("-w");
    v23[3] = CFSTR("1");
    v23[4] = CFSTR("-s");
    v23[5] = CFSTR("-p");
    v23[6] = CFSTR("udp");
    v13[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000213C8;
    v14[3] = &unk_1000D5CC0;
    v14[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002146C;
    v13[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 7), v9, v14, v13);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v10 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("nettop.txt")));
    v11[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100021488;
    v12[3] = &unk_1000D5CC0;
    v12[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002152C;
    v11[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/bin/nettop"), &off_1000E7440, v10, v12, v11);
  }
}

- (void)__startAWDLQueryTimer
{
  id v3;
  OS_dispatch_source *v4;
  NSObject *awdlQueryTimer;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  _QWORD handler[5];

  v3 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("awdl_%@"), CFSTR("apple80211.txt")));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v3, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v3, 0, 0);
  self->_awdlQueryFileHandle = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v3);
  v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_awdlQueryTimer = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000216C0;
  handler[3] = &unk_1000D5C98;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
  awdlQueryTimer = self->_awdlQueryTimer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000217E4;
  v8[3] = &unk_1000D5C98;
  v8[4] = self;
  dispatch_source_set_cancel_handler(awdlQueryTimer, v8);
  v6 = self->_awdlQueryTimer;
  v7 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_awdlQueryTimer);
}

- (void)__startNANPerfLogging
{
  NSString *v3;
  NSString *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[5];
  _QWORD v23[8];
  _QWORD v24[5];

  v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager nan](self->_status, "nan"), "interfaceName");
  if (v3)
  {
    v4 = v3;
    -[W5WiFiPerfLoggingManager __startNANQueryTimer](self, "__startNANQueryTimer");
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v5 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("io80211.pcap")));
    v24[0] = v4;
    v24[1] = CFSTR("-logf='vv el+ set'");
    v24[2] = CFSTR("-quiet");
    v24[3] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-outfile=%@"), v5);
    v24[4] = CFSTR("-dlog");
    v18[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100021D5C;
    v19[3] = &unk_1000D5CC0;
    v19[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100021E00;
    v18[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 5), v19, v18);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v6 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("tcpdump.pcap")));
    v23[0] = CFSTR("-n");
    v23[1] = CFSTR("-p");
    v23[2] = CFSTR("-i");
    v23[3] = v4;
    v23[4] = CFSTR("-s");
    v23[5] = CFSTR("300");
    v23[6] = CFSTR("-w");
    v23[7] = v6;
    v16[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100021E1C;
    v17[3] = &unk_1000D5CC0;
    v17[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100021EC0;
    v16[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", CFSTR("/usr/sbin/tcpdump"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 8), v17, v16);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v7 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("netstat_queue.txt")));
    v22[0] = CFSTR("-I");
    v22[1] = v4;
    v22[2] = CFSTR("-w");
    v22[3] = CFSTR("1");
    v22[4] = CFSTR("-qq");
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100021EDC;
    v15[3] = &unk_1000D5CC0;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100021F80;
    v14[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 5), v7, v15, v14);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v8 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("netstat_tcp.txt")));
    v21[0] = CFSTR("-I");
    v21[1] = v4;
    v21[2] = CFSTR("-w");
    v21[3] = CFSTR("1");
    v21[4] = CFSTR("-s");
    v21[5] = CFSTR("-p");
    v21[6] = CFSTR("tcp");
    v12[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100021F9C;
    v13[3] = &unk_1000D5CC0;
    v13[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100022040;
    v12[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 7), v8, v13, v12);
    dispatch_group_enter((dispatch_group_t)self->_beginGroup);
    v9 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, CFSTR("netstat_udp.txt")));
    v20[0] = CFSTR("-I");
    v20[1] = v4;
    v20[2] = CFSTR("-w");
    v20[3] = CFSTR("1");
    v20[4] = CFSTR("-s");
    v20[5] = CFSTR("-p");
    v20[6] = CFSTR("udp");
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002205C;
    v11[3] = &unk_1000D5CC0;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100022100;
    v10[3] = &unk_1000D5CE8;
    +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:", CFSTR("/usr/sbin/netstat"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 7), v9, v11, v10);
  }
}

- (void)__startNANQueryTimer
{
  id v3;
  OS_dispatch_source *v4;
  NSObject *nanQueryTimer;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  _QWORD handler[5];

  v3 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("nan_%@"), CFSTR("apple80211.txt")));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v3, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v3, 0, 0);
  self->_nanQueryFileHandle = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v3);
  v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_nanQueryTimer = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100022294;
  handler[3] = &unk_1000D5C98;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
  nanQueryTimer = self->_nanQueryTimer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000223A0;
  v8[3] = &unk_1000D5C98;
  v8[4] = self;
  dispatch_source_set_cancel_handler(nanQueryTimer, v8);
  v6 = self->_nanQueryTimer;
  v7 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_nanQueryTimer);
}

- (void)__startP2PPerfLogging
{
  -[W5WiFiPerfLoggingManager __startAWDLPerfLogging](self, "__startAWDLPerfLogging");
  -[W5WiFiPerfLoggingManager __startNANPerfLogging](self, "__startNANPerfLogging");
}

- (void)__setupWatchdogTask
{
  NSMutableString *v3;
  NSMutableArray *runningTasks;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  NSString *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];
  _BYTE v17[128];

  v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("( "));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  runningTasks = self->_runningTasks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](runningTasks, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(runningTasks);
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%d "), objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "processIdentifier"));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](runningTasks, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }
  -[NSMutableString appendString:](v3, "appendString:", CFSTR(")"));
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CHILDPIDS=%@; while kill -0 %d; do sleep 10; done; for PID in ${CHILDPIDS[@]}; do kill -9 $PID; done;"),
         v3,
         -[NSProcessInfo processIdentifier](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "processIdentifier"));
  v16[0] = CFSTR("-c");
  v16[1] = v9;
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000225DC;
  v11[3] = &unk_1000D5CC0;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022674;
  v10[3] = &unk_1000D5CE8;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:launchHandler:reply:", CFSTR("/bin/sh"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2), v11, v10);
}

- (void)__nextRequest
{
  NSObject *beginGroup;
  NSObject *endGroup;
  id v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  _QWORD v9[2];

  if (!self->_activeRequest && -[NSMutableArray count](self->_pendingRequests, "count"))
  {
    self->_activeRequest = (W5WiFiPerfLoggingRequest *)objc_msgSend(-[NSMutableArray firstObject](self->_pendingRequests, "firstObject"), "copy");
    -[NSMutableArray removeObjectAtIndex:](self->_pendingRequests, "removeObjectAtIndex:", 0);
    beginGroup = self->_beginGroup;
    if (beginGroup)
      dispatch_release(beginGroup);
    self->_beginGroup = (OS_dispatch_group *)dispatch_group_create();
    endGroup = self->_endGroup;
    if (endGroup)
      dispatch_release(endGroup);
    self->_endGroup = (OS_dispatch_group *)dispatch_group_create();
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), 0, 0, 0);
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), 0, 0, 0);
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), 0, 0, 0);
    v5 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", CFSTR("thermtune.csv"));
    v9[0] = CFSTR("--tGraphLogFile");
    v9[1] = v5;
    +[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", CFSTR("/usr/local/bin/thermtune"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2), 0);
    -[W5WiFiPerfLoggingManager __collectWiFiCountersPRE](self, "__collectWiFiCountersPRE");
    -[W5WiFiPerfLoggingManager __collectNetworkCountersPRE](self, "__collectNetworkCountersPRE");
    -[W5WiFiPerfLoggingManager __collectWiFiMemoryStatsWithFilename:](self, "__collectWiFiMemoryStatsWithFilename:", CFSTR("wifi_memory_usage_pre.txt"));
    -[W5WiFiPerfLoggingManager __startPerfLogging](self, "__startPerfLogging");
    if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[W5WiFiPerfLoggingRequest configuration](self->_activeRequest, "configuration"), "objectForKeyedSubscript:", CFSTR("IncludeP2P")), "BOOLValue"))-[W5WiFiPerfLoggingManager __startP2PPerfLogging](self, "__startP2PPerfLogging");
    queue = self->_queue;
    v6 = self->_beginGroup;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000228A0;
    v8[3] = &unk_1000D5C98;
    v8[4] = self;
    dispatch_group_notify(v6, queue, v8);
  }
}

- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5
{
  -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", a3, 0, a4, a5, 1, 1);
}

- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v12;
  id v15;
  id v16;
  NSDate *v17;
  NSDate *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a8;
  v9 = a7;
  v12 = a4;
  if (a7)
  {
    v15 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v15, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(v15, "appendFormat:", CFSTR("%@ %@\n"), objc_msgSend(a5, "lastPathComponent"), objc_msgSend(a6, "componentsJoinedByString:", CFSTR(" ")));
    objc_msgSend(v15, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(a3, "writeData:", objc_msgSend(v15, "dataUsingEncoding:", 4));
  }
  v16 = objc_msgSend(a3, "offsetInFile");
  v17 = +[NSDate date](NSDate, "date");
  if (v8)
  {
    v18 = v17;
    v19 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v19, "appendFormat:", CFSTR("BEGIN: %@, END: 00:00:00.000\n"), -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18));
    objc_msgSend(v19, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(a3, "writeData:", objc_msgSend(v19, "dataUsingEncoding:", 4));
    if (v12)
      v20 = 0;
    else
      v20 = a3;
    if (v12)
      v21 = a3;
    else
      v21 = 0;
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:", a5, a6, v20, v21, 0, 0, 10.0, 0);
    objc_msgSend(a3, "seekToFileOffset:", v16);
    v22 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v22, "appendFormat:", CFSTR("BEGIN: %@, END: %@\n"), -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18), -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", +[NSDate date](NSDate, "date")));
    objc_msgSend(v22, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(a3, "writeData:", objc_msgSend(v22, "dataUsingEncoding:", 4));
    objc_msgSend(a3, "seekToEndOfFile");
LABEL_18:
    objc_msgSend(a3, "writeData:", objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4));
    return;
  }
  if (v12)
    v23 = 0;
  else
    v23 = a3;
  if (v12)
    v24 = a3;
  else
    v24 = 0;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:", a5, a6, v23, v24, 0, 0, 10.0, 0);
  if (v9)
    goto LABEL_18;
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4
{
  -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:](self, "__wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:", a3, a4, 1, 1);
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v11;

  v6 = a6;
  v7 = a5;
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", a4, 0, CFSTR("/usr/local/bin/wl"), a3, v7, v6);
  }
  else if (v7)
  {
    v11 = +[NSMutableString string](NSMutableString, "string");
    objc_msgSend(v11, "appendString:", CFSTR("--------------------------------------------------------------------\n"));
    objc_msgSend(v11, "appendFormat:", CFSTR("%@ %@ -- NOT ASSOCIATED, NOOP\n"), objc_msgSend(CFSTR("/usr/local/bin/wl"), "lastPathComponent"), objc_msgSend(a3, "componentsJoinedByString:", CFSTR(" ")));
    objc_msgSend(v11, "appendString:", CFSTR("--------------------------------------------------------------------\n\n"));
    objc_msgSend(a4, "writeData:", objc_msgSend(v11, "dataUsingEncoding:", 4));
  }
}

- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5
{
  if (!-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
    return 0;
  if (a4)
    return +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:](NSTask, "runTaskWithLaunchPath:arguments:outputFilePath:error:", CFSTR("/usr/local/bin/wl"), a3, a4, 0);
  if (a5)
    return +[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", CFSTR("/usr/local/bin/wl"), a3, a5, 0);
  else
    return 0;
}

- (void)__collectWiFiMemoryStatsWithFilename:(id)a3
{
  id v4;
  NSFileHandle *v5;

  v4 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", a3);
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v4, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v4, 0, 0);
  v5 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v4);
  if (v5)
  {
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:](self, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:", v5, 1, CFSTR("/usr/local/bin/easyperf"), &off_1000E74D0, 1, 1);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v5, CFSTR("/usr/bin/heap"), &off_1000E74E8);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v5, CFSTR("/usr/bin/vmmap"), &off_1000E7500);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v5, CFSTR("/usr/bin/footprint"), &off_1000E7518);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v5, CFSTR("/usr/bin/zprint"), 0);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v5, CFSTR("/usr/local/bin/jetsam_priority"), &off_1000E7530);
  }
  -[NSFileHandle closeFile](v5, "closeFile");
}

- (void)__collectNetworkCountersPRE
{
  id v3;
  NSFileHandle *v4;

  v3 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", CFSTR("network_counters_pre.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v3, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v3, 0, 0);
  v4 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v3);
  if (v4)
  {
    +[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", CFSTR("/usr/local/bin/netusage"), &off_1000E7548, 0);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/local/bin/netusage"), &off_1000E7560);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E7578);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E7590);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E75A8);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E75C0);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E75D8);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/bin/nettop"), &off_1000E75F0);
  }
  -[NSFileHandle closeFile](v4, "closeFile");
}

- (void)__collectNetworkCountersPOST
{
  id v3;
  NSFileHandle *v4;

  v3 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", CFSTR("network_counters_post.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v3, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v3, 0, 0);
  v4 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v3);
  if (v4)
  {
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/local/bin/netusage"), &off_1000E7608);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E7620);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E7638);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E7650);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E7668);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/sbin/netstat"), &off_1000E7680);
    -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v4, CFSTR("/usr/bin/nettop"), &off_1000E7698);
  }
  -[NSFileHandle closeFile](v4, "closeFile");
}

- (void)__collectWiFiCountersPRE
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  id v7;
  NSFileHandle *v8;
  NSMutableData *v9;
  id v10;
  _UNKNOWN **v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v3)
  {
    v4 = v3;
    v5 = -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName");
    v6 = -[W5WiFiInterface interfaceName](-[W5StatusManager nan](self->_status, "nan"), "interfaceName");
    v7 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", CFSTR("wifi_counters_pre.txt"));
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v7, 0);
    -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v7, 0, 0);
    v8 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v7);
    if (v8)
    {
      v9 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E76B0, 0, v9);
      v10 = objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v9, 4), "componentsSeparatedByString:", CFSTR(" "));
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E76C8, 0, 0);
      if (objc_msgSend(v10, "containsObject:", CFSTR("bcntrim")))
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E76E0, 0, 0);
      if (objc_msgSend(v10, "containsObject:", CFSTR("ops")))
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E76F8, 0, 0);
      if (objc_msgSend(v10, "containsObject:", CFSTR("rsdb")))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E7710, 0, 0);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E7728, 0, 0);
        if (objc_msgSend(v10, "containsObject:", CFSTR("tdmtx")))
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E7740, 0, 0);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7758, v8);
        v11 = &off_1000E7770;
      }
      else
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E7788, 0, 0);
        v11 = &off_1000E77A0;
      }
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", v11, v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E77B8, v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E77D0, v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E77E8, v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7800, v8);
      v19[0] = v4;
      v19[1] = CFSTR("-leaky_ap_stats=0");
      +[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2), 0);
      v18[0] = v4;
      v18[1] = CFSTR("-dbg=getmimops");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
      v17[0] = v4;
      v17[1] = CFSTR("-dbg=print_packets");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
      v16[0] = v4;
      v16[1] = CFSTR("-dbg=print_peers");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
      v15[0] = v4;
      v15[1] = CFSTR("-dbg=m");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
      v14[0] = v4;
      v14[1] = CFSTR("-dbg=proptx");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
      if (v5)
      {
        v13[0] = v5;
        v13[1] = CFSTR("-dbg=print_peers");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
      }
      if (v6)
      {
        v12[0] = v6;
        v12[1] = CFSTR("-dbg=print_peers");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
      }
    }
  }
  else
  {
    v8 = 0;
  }
  -[NSFileHandle closeFile](v8, "closeFile");
}

- (void)__collectWiFiCountersPOST
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  id v7;
  NSFileHandle *v8;
  NSMutableData *v9;
  id v10;
  _UNKNOWN **v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (!v3)
  {
    v8 = 0;
    goto LABEL_16;
  }
  v4 = v3;
  v5 = -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName");
  v6 = -[W5WiFiInterface interfaceName](-[W5StatusManager nan](self->_status, "nan"), "interfaceName");
  v7 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", CFSTR("wifi_counters_post.txt"));
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v7, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v7, 0, 0);
  v8 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v7);
  if (v8)
  {
    v9 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
    -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E7818, 0, v9);
    v10 = objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v9, 4), "componentsSeparatedByString:", CFSTR(" "));
    -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7830, v8);
    if (objc_msgSend(v10, "containsObject:", CFSTR("rsdb")))
    {
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7848, v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7860, v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7878, v8);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7890, v8);
      if ((objc_msgSend(v10, "containsObject:", CFSTR("tdmtx")) & 1) == 0)
      {
LABEL_8:
        if (objc_msgSend(v10, "containsObject:", CFSTR("bcntrim")))
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E78F0, v8);
        if (objc_msgSend(v10, "containsObject:", CFSTR("ops")))
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7908, v8);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7920, v8);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7938, v8);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7950, v8);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7968, v8);
        v19[0] = v4;
        v19[1] = CFSTR("-leaky_ap_stats");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
        v18[0] = v4;
        v18[1] = CFSTR("-dbg=getmimops");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
        v17[0] = v4;
        v17[1] = CFSTR("-dbg=print_packets");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
        v16[0] = v4;
        v16[1] = CFSTR("-dbg=print_peers");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
        v15[0] = v4;
        v15[1] = CFSTR("-dbg=m");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
        v14[0] = v4;
        v14[1] = CFSTR("-dbg=proptx");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
        if (v5)
        {
          v13[0] = v5;
          v13[1] = CFSTR("-dbg=print_peers");
          -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
        }
        if (v6)
        {
          v12[0] = v6;
          v12[1] = CFSTR("-dbg=print_peers");
          -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v8, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
        }
        goto LABEL_16;
      }
      v11 = &off_1000E78A8;
    }
    else
    {
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E78C0, v8);
      v11 = &off_1000E78D8;
    }
    -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", v11, v8);
    goto LABEL_8;
  }
LABEL_16:
  -[NSFileHandle closeFile](v8, "closeFile");
}

- (void)__collectWiFiDeviceConfig
{
  NSString *v3;
  NSString *v4;
  id v5;
  NSFileHandle *v6;
  NSMutableData *v7;
  id v8;
  id v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];

  v3 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), "stringByAppendingPathComponent:", -[NSUUID UUIDString](-[W5WiFiPerfLoggingRequest uuid](self->_activeRequest, "uuid"), "UUIDString")), "stringByAppendingPathComponent:", CFSTR("wifi_device_config.txt"));
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v5, 0);
    -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v5, 0, 0);
    v6 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v5);
    if (v6)
    {
      v7 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0);
      v29[0] = v4;
      v29[1] = CFSTR("-cardcap");
      +[NSTask runTaskWithLaunchPath:arguments:outputData:error:](NSTask, "runTaskWithLaunchPath:arguments:outputData:error:", CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2), v7, 0);
      v8 = objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4), "componentsSeparatedByString:", CFSTR("\n"));
      -[NSMutableData setLength:](v7, "setLength:", 0);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFilePath:outputData:](self, "__wlCLIWithArguments:outputFilePath:outputData:", &off_1000E7980, 0, v7);
      v9 = objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4), "componentsSeparatedByString:", CFSTR(" "));
      v28[0] = v4;
      v28[1] = CFSTR("-driver_ver");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
      v27[0] = v4;
      v27[1] = CFSTR("-hardware_ver");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
      v26[0] = v4;
      v26[1] = CFSTR("-ssid");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
      v25[0] = v4;
      v25[1] = CFSTR("-bssid");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
      v24[0] = v4;
      v24[1] = CFSTR("-rssi");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
      v23[0] = v4;
      v23[1] = CFSTR("-noise");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
      v22[0] = v4;
      v22[1] = CFSTR("-channel");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
      v21[0] = v4;
      v21[1] = CFSTR("-authtype");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
      v20[0] = v4;
      v20[1] = CFSTR("-country_code");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
      v19[0] = v4;
      v19[1] = CFSTR("-rateset");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
      v18[0] = v4;
      v18[1] = CFSTR("-leaky_ap_stats_mode");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
      v17[0] = v4;
      v17[1] = CFSTR("-cardcap");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
      v16[0] = v4;
      v16[1] = CFSTR("-dbg=mimopsstatus");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
      if (objc_msgSend(v8, "containsObject:", CFSTR("roam")))
      {
        v15[0] = v4;
        v15[1] = CFSTR("-dbg=print-roam");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
      }
      if (objc_msgSend(v8, "containsObject:", CFSTR("ocl")))
      {
        v14[0] = v4;
        v14[1] = CFSTR("-dbg=ocl_status");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
        v13[0] = v4;
        v13[1] = CFSTR("-dbg=ocl_rssi_threshold");
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
      }
      if (objc_msgSend(v8, "containsObject:", CFSTR("awdl")))
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), &off_1000E7998);
      if (objc_msgSend(v8, "containsObject:", CFSTR("timesync")))
        -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), &off_1000E79B0);
      v12[0] = v4;
      v12[1] = CFSTR("-dbg=bgscan-private-mac");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
      v11[0] = v4;
      v11[1] = CFSTR("-dbg=dtim");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
      v10[0] = v4;
      v10[1] = CFSTR("-dbg=private-mac");
      -[W5WiFiPerfLoggingManager __runToolWithOutputFileHandle:launchPath:arguments:](self, "__runToolWithOutputFileHandle:launchPath:arguments:", v6, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E79C8, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E79E0, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E79F8, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7A10, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7A28, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7A40, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7A58, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7A70, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7A88, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7AA0, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7AB8, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7AD0, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7AE8, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7B00, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7B18, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7B30, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7B48, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7B60, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7B78, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7B90, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7BA8, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7BC0, v6);
      if (objc_msgSend(v9, "containsObject:", CFSTR("ampdu")))
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7BD8, v6);
      if (objc_msgSend(v9, "containsObject:", CFSTR("amsdu")))
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7BF0, v6);
      if (objc_msgSend(v9, "containsObject:", CFSTR("ocl")))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7C08, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7C20, v6);
      }
      if (objc_msgSend(v9, "containsObject:", CFSTR("txcap")))
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7C38, v6);
      if (objc_msgSend(v9, "containsObject:", CFSTR("mim_ps")))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7C50, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7C68, v6);
      }
      if (objc_msgSend(v9, "containsObject:", CFSTR("ops")))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7C80, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7C98, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7CB0, v6);
      }
      if (objc_msgSend(v9, "containsObject:", CFSTR("nap")))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7CC8, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7CE0, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7CF8, v6);
      }
      if (objc_msgSend(v9, "containsObject:", CFSTR("bcntrim")))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7D10, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7D28, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7D40, v6);
      }
      if (objc_msgSend(v9, "containsObject:", CFSTR("rsdb")))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7D58, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7D70, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7D88, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7DA0, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7DB8, v6);
        if (objc_msgSend(v9, "containsObject:", CFSTR("tdmtx")))
        {
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7DD0, v6);
          -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7DE8, v6);
        }
      }
      if (objc_msgSend(v9, "containsObject:", CFSTR("tvpm")))
      {
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7E00, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7E18, v6);
        -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7E30, v6);
      }
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7E48, v6);
      -[W5WiFiPerfLoggingManager __wlCLIWithArguments:outputFileHandle:](self, "__wlCLIWithArguments:outputFileHandle:", &off_1000E7E60, v6);
    }
  }
  else
  {
    v6 = 0;
  }
  -[NSFileHandle closeFile](v6, "closeFile");
}

- (void)__cancelActiveRequestAndReply:(id)a3
{
  NSObject *coreCaptureTriggerTimer;
  NSObject *awdlQueryTimer;
  NSObject *nanQueryTimer;
  NSMutableArray *runningTasks;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  NSObject *endGroup;
  NSObject *queue;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (self->_activeRequest)
  {
    coreCaptureTriggerTimer = self->_coreCaptureTriggerTimer;
    if (coreCaptureTriggerTimer)
    {
      dispatch_source_cancel(coreCaptureTriggerTimer);
      dispatch_release((dispatch_object_t)self->_coreCaptureTriggerTimer);
      self->_coreCaptureTriggerTimer = 0;
    }
    awdlQueryTimer = self->_awdlQueryTimer;
    if (awdlQueryTimer)
    {
      dispatch_source_cancel(awdlQueryTimer);
      dispatch_release((dispatch_object_t)self->_awdlQueryTimer);
      self->_awdlQueryTimer = 0;
    }
    nanQueryTimer = self->_nanQueryTimer;
    if (nanQueryTimer)
    {
      dispatch_source_cancel(nanQueryTimer);
      dispatch_release((dispatch_object_t)self->_nanQueryTimer);
      self->_nanQueryTimer = 0;
    }
    +[NSTask runTaskWithLaunchPath:arguments:error:](NSTask, "runTaskWithLaunchPath:arguments:error:", CFSTR("/usr/local/bin/thermtune"), &off_1000E7E78, 0);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    runningTasks = self->_runningTasks;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](runningTasks, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(runningTasks);
          kill((pid_t)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "processIdentifier"), 9);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](runningTasks, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    -[NSMutableArray removeAllObjects](self->_runningTasks, "removeAllObjects");
    -[W5WiFiPerfLoggingManager __collectWiFiCountersPOST](self, "__collectWiFiCountersPOST");
    -[W5WiFiPerfLoggingManager __collectNetworkCountersPOST](self, "__collectNetworkCountersPOST");
    -[W5WiFiPerfLoggingManager __collectWiFiMemoryStatsWithFilename:](self, "__collectWiFiMemoryStatsWithFilename:", CFSTR("wifi_memory_usage_post.txt"));
    -[W5WiFiPerfLoggingManager __collectWiFiDeviceConfig](self, "__collectWiFiDeviceConfig");
    endGroup = self->_endGroup;
    queue = self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100024AE8;
    v15[3] = &unk_1000D5C20;
    v15[4] = self;
    v15[5] = a3;
    dispatch_group_notify(endGroup, queue, v15);
  }
  else
  {
    -[W5WiFiPerfLoggingManager __nextRequest](self, "__nextRequest");
    if (a3)
      (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

@end
