@implementation MSDProcessTestEvents

+ (id)sharedInstance
{
  if (qword_100175408 != -1)
    dispatch_once(&qword_100175408, &stru_10013EF38);
  return (id)qword_100175400;
}

- (BOOL)establishConnection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  NSLog(CFSTR("going to establish connection.\n"));
  v5 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.msdtest.service"), 4096);
  NSLog(CFSTR("established connection:%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MSDSendTestCommand));
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MSDPushTestLog));
  objc_msgSend(v5, "setExportedInterface:", v7);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");
  NSLog(CFSTR("sending following commands to demod: %@"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxy"));
  objc_msgSend(v8, "sendCommandsToDemod:replyFromDemod:", v4, &stru_10013EF78);

  return 1;
}

- (void)pushTestLog:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/"), "stringByAppendingPathComponent:", CFSTR("testLogs.plist")));
  -[MSDProcessTestEvents setLogsToWrite:](self, "setLogsToWrite:", -[MSDProcessTestEvents logsToWrite](self, "logsToWrite") + 1);
  NSLog(CFSTR("testLog:%@"), v14);
  if (objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProcessTestEvents logCache](self, "logCache"));

    if (!v6)
    {
      if (!objc_msgSend(v4, "fileExistsAtPath:", v5))
        goto LABEL_5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributesOfItemAtPath:error:", v5, 0));
      v9 = objc_msgSend(v8, "fileSize");

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithContentsOfFile:](NSMutableArray, "arrayWithContentsOfFile:", v5));
      -[MSDProcessTestEvents setLogCache:](self, "setLogCache:", v10);

      if ((unint64_t)v9 > 0xA00000)
      {
LABEL_5:
        v11 = objc_alloc_init((Class)NSMutableArray);
        -[MSDProcessTestEvents setLogCache:](self, "setLogCache:", v11);

      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProcessTestEvents logCache](self, "logCache"));
    objc_msgSend(v12, "addObject:", v14);

    if (-[MSDProcessTestEvents logsToWrite](self, "logsToWrite") == 10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProcessTestEvents logCache](self, "logCache"));
      objc_msgSend(v13, "writeToFile:atomically:", v5, 1);

      -[MSDProcessTestEvents setLogsToWrite:](self, "setLogsToWrite:", 0);
    }
  }

}

- (int)logsToWrite
{
  return self->_logsToWrite;
}

- (void)setLogsToWrite:(int)a3
{
  self->_logsToWrite = a3;
}

- (NSMutableArray)logCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCache, 0);
}

@end
