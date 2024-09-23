@implementation _DASContinuedProcessingTaskUIClient

- (_DASContinuedProcessingTaskUIClient)init
{
  _DASContinuedProcessingTaskUIClient *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASContinuedProcessingTaskUIClient;
  v2 = -[_DASContinuedProcessingTaskUIClient init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.dasd.progressuiqueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

+ (id)sharedClient
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009972C;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABC78 != -1)
    dispatch_once(&qword_1001ABC78, block);
  return (id)qword_1001ABC80;
}

- (SLAPKActivityProgressUIServer)server
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000997D4;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  if (qword_1001ABC88 != -1)
    dispatch_once(&qword_1001ABC88, block);
  return self->_server;
}

- (void)activateConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BSServiceConnectionClient *v7;
  BSServiceConnectionClient *connection;
  dispatch_semaphore_t v9;
  BSServiceConnectionClient *v10;
  id v11;
  void *v12;
  BSServiceConnectionClient *v13;
  void *v14;
  SLAPKActivityProgressUIServer *v15;
  SLAPKActivityProgressUIServer *server;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _DASContinuedProcessingTaskUIClient *v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSMutableServiceInterface interfaceWithIdentifier:](BSMutableServiceInterface, "interfaceWithIdentifier:", CFSTR("com.apple.activityprogress.activityprogressui.session-service")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", &OBJC_PROTOCOL___SLAPKActivityProgressUIServer));
  objc_msgSend(v3, "setServer:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", &OBJC_PROTOCOL___SLAPKActivityProgressUIClient));
  objc_msgSend(v3, "setClient:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnectionEndpoint endpointForMachName:service:instance:](BSServiceConnectionEndpoint, "endpointForMachName:service:instance:", CFSTR("com.apple.activityprogress.activityprogressui.services"), CFSTR("com.apple.activityprogress.activityprogressui.session-service"), 0));
  v7 = (BSServiceConnectionClient *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection connectionWithEndpoint:](BSServiceConnection, "connectionWithEndpoint:", v6));
  connection = self->_connection;
  self->_connection = v7;

  v9 = dispatch_semaphore_create(0);
  v10 = self->_connection;
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_1000999D8;
  v20 = &unk_10015F720;
  v21 = v3;
  v22 = self;
  v11 = v3;
  -[BSServiceConnectionClient configureConnection:](v10, "configureConnection:", &v17);
  -[BSServiceConnectionClient activate](self->_connection, "activate", v17, v18, v19, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v13 = self->_connection;
  v23 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v15 = (SLAPKActivityProgressUIServer *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](v13, "remoteTargetWithLaunchingAssertionAttributes:", v14));
  server = self->_server;
  self->_server = v15;

}

- (void)invalidateConnection
{
  SLAPKActivityProgressUIServer *server;
  BSServiceConnectionClient *connection;

  -[BSServiceConnectionClient invalidate](self->_connection, "invalidate");
  server = self->_server;
  self->_server = 0;

  connection = self->_connection;
  self->_connection = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionClient invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_DASContinuedProcessingTaskUIClient;
  -[_DASContinuedProcessingTaskUIClient dealloc](&v3, "dealloc");
}

- (void)startActivityForIdentifier:(id)a3 bundleIdentifier:(id)a4 imageUTI:(id)a5 activityName:(id)a6 activityDescription:(id)a7 progress:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a5;
  v19 = a4;
  v20 = objc_alloc((Class)sub_100099D00());
  v21 = v20;
  if (v17)
  {
    v22 = objc_msgSend(v20, "initWithProgress:", v17);
  }
  else
  {
    v23 = objc_alloc_init((Class)NSProgress);
    v22 = objc_msgSend(v21, "initWithProgress:", v23);

  }
  v24 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("continuedProgress")));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v26 = 138412802;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Starting activity %@ %@ %@", (uint8_t *)&v26, 0x20u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASContinuedProcessingTaskUIClient server](self, "server"));
  objc_msgSend(v25, "startActivityForIdentifier:bundleIdentifier:imageUTI:activityName:activityDescription:progress:", v14, v19, v18, v15, v16, v22);

}

- (void)updateTitle:(id)a3 andDescription:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("continuedProgress")));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Updating title to %@ and description to %@ for %@", (uint8_t *)&v13, 0x20u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASContinuedProcessingTaskUIClient server](self, "server"));
  objc_msgSend(v12, "updateActivityName:activityDescription:forIdentifier:", v8, v9, v10);

}

- (void)updateProgress:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)sub_100099D00()), "initWithProgress:", v6);
  v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("continuedProgress")));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1000E8638((uint64_t)v7, (uint64_t)v6, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASContinuedProcessingTaskUIClient server](self, "server"));
  objc_msgSend(v10, "updateProgress:forIdentifier:", v8, v7);

}

- (void)cancelActivities:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "taskIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  objc_msgSend(v3, "suspendActivitiesWithIdentifiers:", v4);

}

- (BSServiceConnectionClient)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
