@implementation W5XPCConnection

- (W5XPCConnection)initWithXPCConnection:(id)a3
{
  W5XPCConnection *v4;
  W5XPCConnection *v5;
  NSXPCConnection *v6;
  id v7;
  NSString *v8;
  dispatch_queue_t v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableSet *v12;
  NSDateFormatter *v13;
  NSUUID *v14;
  objc_super v16;
  _BYTE buffer[4096];

  v16.receiver = self;
  v16.super_class = (Class)W5XPCConnection;
  v4 = -[W5XPCConnection init](&v16, "init");
  v5 = v4;
  if (!a3)
    goto LABEL_12;
  if (!v4)
    goto LABEL_12;
  v6 = (NSXPCConnection *)a3;
  v5->_connection = v6;
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath(-[NSXPCConnection processIdentifier](v6, "processIdentifier"), buffer, 0x1000u) < 1)
    goto LABEL_12;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", buffer, 4);
  if (!v7)
    goto LABEL_12;
  v8 = (NSString *)objc_msgSend(objc_msgSend(v7, "lastPathComponent"), "copy");
  v5->_processName = v8;
  if (!v8)
    goto LABEL_12;
  v9 = dispatch_queue_create("com.apple.wifivelocity.xpc-connection", 0);
  v5->_queue = (OS_dispatch_queue *)v9;
  if (!v9)
    goto LABEL_12;
  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_mutableActiveRequests = v10;
  if (!v10)
    goto LABEL_12;
  v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_mutableEventIDs = v11;
  if (!v11
    || (v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet),
        (v5->_mutableFaultEventMonitoringPeers = v12) == 0)
    || (v13 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter), (v5->_formatter = v13) == 0)
    || (-[NSDateFormatter setDateFormat:](v13, "setDateFormat:", CFSTR("MM/dd/yy HH:mm:ss.SSS")),
        v14 = +[NSUUID UUID](NSUUID, "UUID"),
        (v5->_uuid = v14) == 0))
  {
LABEL_12:

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v4.receiver = self;
  v4.super_class = (Class)W5XPCConnection;
  -[W5XPCConnection dealloc](&v4, "dealloc");
}

- (NSArray)activeRequests
{
  NSObject *queue;
  NSArray *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_10007DDD0;
  v10 = sub_10007DDE0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007DDEC;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)eventIDs
{
  NSObject *queue;
  NSArray *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_10007DDD0;
  v10 = sub_10007DDE0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007DEF0;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSSet)faultEventMonitoringPeers
{
  NSObject *queue;
  NSSet *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_10007DDD0;
  v10 = sub_10007DDE0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007DFF4;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBrowsing
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
  v5[2] = sub_10007E0C4;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAdvertising
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
  v5[2] = sub_10007E184;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSURL)additionalLog
{
  NSObject *queue;
  NSURL *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_10007DDD0;
  v10 = sub_10007DDE0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007E278;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__activeRequestWithUUID:(id)a3
{
  NSMutableArray *mutableActiveRequests;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
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
  mutableActiveRequests = self->_mutableActiveRequests;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableActiveRequests, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(mutableActiveRequests);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(a3, "isEqual:", objc_msgSend(v9, "uuid")))
        {
          v5 = objc_msgSend(v9, "copy");
          return v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableActiveRequests, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (void)__logMessage:(id)a3 timestamped:(BOOL)a4
{
  _BOOL4 v4;
  NSFileHandle *fileHandle;
  NSURL *v8;
  NSString *v9;
  uint64_t v10;

  v4 = a4;
  if (self->_additionalLogURL)
  {
    fileHandle = self->_fileHandle;
  }
  else
  {
    v8 = (NSURL *)-[NSURL copy](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", -[NSString stringByAppendingPathExtension:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString")), "stringByAppendingPathExtension:", CFSTR("log"))), "copy");
    self->_additionalLogURL = v8;
    if (!v8)
      return;
    if (!-[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", -[NSURL path](self->_additionalLogURL, "path"), 0, 0))return;
    fileHandle = +[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", -[NSURL path](self->_additionalLogURL, "path"));
    self->_fileHandle = fileHandle;
    if (!fileHandle)
      return;
  }
  -[NSFileHandle seekToEndOfFile](fileHandle, "seekToEndOfFile");
  if (v4)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@\n"), -[NSDateFormatter stringFromDate:](self->_formatter, "stringFromDate:", +[NSDate date](NSDate, "date")), a3);
  else
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n"), a3, v10);
  -[NSFileHandle writeData:](self->_fileHandle, "writeData:", -[NSString dataUsingEncoding:](v9, "dataUsingEncoding:", 4));
}

- (void)startMonitoringEvents:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E674;
  block[3] = &unk_1000D5C70;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)stopMonitoringEvents:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E804;
  block[3] = &unk_1000D5C70;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryLocalPeerAndReply:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007E990;
  v4[3] = &unk_1000D5C20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)queryStatusForPeer:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007EA20;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryDatabaseForPeer:(id)a3 fetch:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007EAB4;
  v6[3] = &unk_1000D6068;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)requestFileFromPeer:(id)a3 remoteFilePath:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007EB48;
  v6[3] = &unk_1000D6068;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)listFilesFromPeer:(id)a3 remoteDirPath:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007EBDC;
  v6[3] = &unk_1000D6068;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)queryDebugConfigurationForPeer:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007EC70;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)setDebugConfiguration:(id)a3 peer:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007ED04;
  v6[3] = &unk_1000D6068;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007ED9C;
  block[3] = &unk_1000D61D0;
  block[4] = a5;
  block[5] = a4;
  block[6] = self;
  block[7] = a3;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)runDiagnosticsForPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  NSObject *queue;
  _QWORD v8[10];

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007EFC0;
  v8[3] = &unk_1000D6180;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = self;
  v8[7] = a3;
  v8[8] = a4;
  v8[9] = a7;
  dispatch_async(queue, v8);
}

- (void)registerRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007F1E0;
  v6[3] = &unk_1000D6068;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)unregisterRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007F274;
  v6[3] = &unk_1000D6068;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)queryRegisteredDiagnosticsPeersWithReply:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007F304;
  v4[3] = &unk_1000D5C20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F394;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007F428;
  v6[3] = &unk_1000D6068;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)queryDiagnosticsModeForPeer:(id)a3 info:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007F4BC;
  v6[3] = &unk_1000D6068;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)collectLogs:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F554;
  block[3] = &unk_1000D61D0;
  block[4] = a5;
  block[5] = a4;
  block[6] = self;
  block[7] = a3;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)collectLogsDiagnosticMode:(id)a3 uuid:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007F778;
  v6[3] = &unk_1000D6068;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)startPeerDiscoveryWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007F998;
  v6[3] = &unk_1000D6068;
  v6[4] = a4;
  v6[5] = self;
  v6[6] = a3;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)stopPeerDiscoveryWithUUID:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007FB6C;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7
{
  NSObject *queue;
  _QWORD v8[10];

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007FC08;
  v8[3] = &unk_1000D72A0;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = self;
  v8[7] = a3;
  *(double *)&v8[9] = a4;
  v8[8] = a7;
  dispatch_async(queue, v8);
}

- (void)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 uuid:(id)a6 reply:(id)a7
{
  NSObject *queue;
  _QWORD v8[10];

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007FE14;
  v8[3] = &unk_1000D72A0;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = self;
  v8[7] = a3;
  *(double *)&v8[9] = a4;
  v8[8] = a7;
  dispatch_async(queue, v8);
}

- (void)runWiFiPerformanceLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100080010;
  v6[3] = &unk_1000D6068;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = self;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008020C;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)cancelAllRequestsAndReply:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000803D4;
  v4[3] = &unk_1000D5C20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)cancelRequestWithUUID:(id)a3 OnPeer:(id)a4 OfType:(int64_t)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008061C;
  block[3] = &unk_1000D72F0;
  block[7] = a6;
  block[8] = a5;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)log:(id)a3 timestamp:(BOOL)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[7];
  BOOL v7;

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000806D8;
  v6[3] = &unk_1000D7318;
  v6[4] = self;
  v6[5] = a3;
  v7 = a4;
  v6[6] = a5;
  dispatch_async(queue, v6);
}

- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008077C;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080870;
  block[3] = &unk_1000D5C70;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)submitFaultEvent:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008092C;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000809C0;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryPeerCacheAndReply:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)startAdvertisingAndReply:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)startBrowsingAndReply:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)stopAdvertisingAndReply:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)stopBrowsingAndReply:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (W5XPCConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (W5XPCConnectionDelegate *)a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

@end
