@implementation SKRemoteAPFSFormatTask

- (SKRemoteAPFSFormatTask)initWithName:(id)a3 disk:(id)a4 caseSensitive:(BOOL)a5 password:(id)a6
{
  id v11;
  id v12;
  id v13;
  SKRemoteAPFSFormatTask *v14;
  uint64_t v15;
  SKProgress *progress;
  NSXPCConnection *v17;
  NSXPCConnection *connectionToService;
  void *v19;
  void *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SKRemoteAPFSFormatTask;
  v14 = -[SKRemoteAPFSFormatTask init](&v22, "init");
  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100));
    progress = v14->_progress;
    v14->_progress = (SKProgress *)v15;

    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v14->_disk, a4);
    v14->_caseSensitive = a5;
    objc_storeStrong((id *)&v14->_password, a6);
    v17 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:options:", CFSTR("com.apple.storagekitfsrunner"), 4096);
    connectionToService = v14->_connectionToService;
    v14->_connectionToService = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKRemoteTaskRunnerProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v14->_connectionToService, "setRemoteObjectInterface:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKRemoteTaskDataProtocol));
    -[NSXPCConnection setExportedInterface:](v14->_connectionToService, "setExportedInterface:", v20);

    -[NSXPCConnection setExportedObject:](v14->_connectionToService, "setExportedObject:", v14);
    -[NSXPCConnection setInterruptionHandler:](v14->_connectionToService, "setInterruptionHandler:", &stru_100045658);
    -[NSXPCConnection setInvalidationHandler:](v14->_connectionToService, "setInvalidationHandler:", &stru_100045678);
    -[NSXPCConnection resume](v14->_connectionToService, "resume");
  }

  return v14;
}

- (BOOL)waitWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1000233B8;
  v27 = sub_1000233C8;
  v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000233B8;
  v21 = sub_1000233C8;
  v22 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask connectionToService](self, "connectionToService"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000233D0;
  v16[3] = &unk_1000456A0;
  v16[4] = &v17;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v16));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask name](self, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask disk](self, "disk"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "diskIdentifier"));
  v10 = -[SKRemoteAPFSFormatTask caseSensitive](self, "caseSensitive");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask password](self, "password"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000233E0;
  v15[3] = &unk_1000456C8;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v6, "formatAPFSWithName:diskIdentifier:caseSensitive:password:withReply:", v7, v9, v10, v11, v15);

  v12 = (void *)v18[5];
  if (v12)
  {
    v13 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v12);
  }
  else
  {
    -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
    if (objc_msgSend((id)v24[5], "integerValue"))
      v13 = +[SKError failWithPOSIXCode:error:](SKError, "failWithPOSIXCode:error:", objc_msgSend((id)v24[5], "integerValue"), a3);
    else
      v13 = 1;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

- (void)sendStdout:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask stdoutParser](self, "stdoutParser"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask stdoutParser](self, "stdoutParser"));
    objc_msgSend(v5, "parseData:", v6);

  }
}

- (void)sendStderr:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask stderrParser](self, "stderrParser"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask stderrParser](self, "stderrParser"));
    objc_msgSend(v5, "parseData:", v6);

  }
}

- (SKTaskDataParser)stdoutParser
{
  return self->_stdoutParser;
}

- (void)setStdoutParser:(id)a3
{
  objc_storeStrong((id *)&self->_stdoutParser, a3);
}

- (SKTaskDataParser)stderrParser
{
  return self->_stderrParser;
}

- (void)setStderrParser:(id)a3
{
  objc_storeStrong((id *)&self->_stderrParser, a3);
}

- (NSXPCConnection)connectionToService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (SKDisk)disk
{
  return (SKDisk *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)caseSensitive
{
  return self->_caseSensitive;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)terminationStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTerminationStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminationStatus, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_disk, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_stderrParser, 0);
  objc_storeStrong((id *)&self->_stdoutParser, 0);
}

@end
