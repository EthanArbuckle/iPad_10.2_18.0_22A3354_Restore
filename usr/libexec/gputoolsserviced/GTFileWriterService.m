@implementation GTFileWriterService

- (GTFileWriterService)initWithConnectionProvider:(id)a3 deviceUDID:(id)a4 urlAccessProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  GTFileWriterService *v12;
  NSString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  os_log_t v17;
  OS_os_log *log;
  NSMutableDictionary *v19;
  NSMutableDictionary *sessions;
  dispatch_queue_t v21;
  OS_dispatch_queue *fileTransferQueue;
  dispatch_semaphore_t v23;
  OS_dispatch_semaphore *writeSem;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)GTFileWriterService;
  v12 = -[GTFileWriterService init](&v26, "init");
  if (v12)
  {
    v13 = NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    DeleteAllArchives(v14);

    v15 = GTTransportArchiveDirectory();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    DeleteAllArchives(v16);

    v17 = os_log_create("com.apple.gputools.transport", "FileWriterService");
    log = v12->_log;
    v12->_log = (OS_os_log *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessions = v12->_sessions;
    v12->_sessions = v19;

    objc_storeStrong((id *)&v12->_connectionProvider, a3);
    objc_storeStrong((id *)&v12->_deviceUDID, a4);
    objc_storeStrong((id *)&v12->_urlAccessProvider, a5);
    v21 = dispatch_queue_create("com.apple.gputools.filetransfer", 0);
    fileTransferQueue = v12->_fileTransferQueue;
    v12->_fileTransferQueue = (OS_dispatch_queue *)v21;

    v23 = dispatch_semaphore_create(1);
    writeSem = v12->_writeSem;
    v12->_writeSem = (OS_dispatch_semaphore *)v23;

  }
  return v12;
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = GTTransportArchiveDirectory();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", v15));
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v19, 1));

  -[GTFileWriterService initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:](self, "initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:", v16, v15, v14, v20, v13, v12);
}

- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;

  v11 = a4;
  v12 = a7;
  ++dword_10003DCFC;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByDeletingPathExtension"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathExtension"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("-%04u"), dword_10003DCFC));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathExtension:", v18));

  v21 = NSTemporaryDirectory();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", v20));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v23, 1));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000BEA8;
  v28[3] = &unk_100030A18;
  v29 = v24;
  v30 = v12;
  v28[4] = self;
  v25 = v24;
  v26 = v12;
  -[GTFileWriterService initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:](self, "initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:", v15, v11, v14, v25, v13, v28);

}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 toURL:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *log;
  void *v20;
  id v21;
  unint64_t v22;
  NSMutableDictionary *sessions;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  GTFileWriterServiceXPCProxy *v29;
  void *v30;
  GTFileWriterServiceXPCProxy *v31;
  NSString *deviceUDID;
  void *v33;
  NSString *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  unint64_t v44;
  const char *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  unint64_t v52;
  id v53;
  NSErrorUserInfoKey v54;
  void *v55;
  NSErrorUserInfoKey v56;
  void *v57;
  NSErrorUserInfoKey v58;
  void *v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  const char *v69;

  v14 = a3;
  v49 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v42 = log;
    v43 = objc_msgSend(v17, "chunkSize");
    v44 = (unint64_t)objc_msgSend(v17, "compressionAlgorithm");
    if (v44 > 5)
      v45 = "<UNKNOWN>";
    else
      v45 = off_100030B40[v44];
    *(_DWORD *)buf = 138413314;
    v61 = v49;
    v62 = 2112;
    v63 = v15;
    v64 = 2112;
    v65 = v16;
    v66 = 2048;
    v67 = v43;
    v68 = 2080;
    v69 = v45;
    _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Initiate transfer basePath:%@ device:%@ toURL:%@ chunkSize:%lu compression:%s", buf, 0x34u);

  }
  if (sub_10000C44C(v17))
  {
    v53 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[GTFileWriterSession sessionWithFileEntries:relativeToURL:options:error:](GTFileWriterSession, "sessionWithFileEntries:relativeToURL:options:error:", v14, v16, v17, &v53));
    v21 = v53;
    if (v20)
    {
      v47 = v16;
      v48 = v14;
      v22 = self->_sessionCounts + 1;
      self->_sessionCounts = v22;
      sessions = self->_sessions;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v22));
      -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v20, v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[GTConnectionProvider connectionForDeviceUDID:](self->_connectionProvider, "connectionForDeviceUDID:", v15));
      v26 = v25;
      if (v25)
      {
        v27 = sub_100008298(v25, v15, self->_connectionProvider);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        if (v28)
        {
          v29 = [GTFileWriterServiceXPCProxy alloc];
          v46 = v15;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "serviceProperties"));
          v31 = -[GTFileWriterServiceXPCProxy initWithConnection:remoteProperties:](v29, "initWithConnection:remoteProperties:", v26, v30);

          deviceUDID = self->_deviceUDID;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_10000C49C;
          v50[3] = &unk_100030A40;
          v50[4] = self;
          v52 = v22;
          v51 = v18;
          v33 = v49;
          v34 = deviceUDID;
          v15 = v46;
          -[GTFileWriterServiceXPCProxy beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:](v31, "beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:", v48, v49, v34, v17, v22, v50);

        }
        else
        {
          v54 = NSLocalizedDescriptionKey;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Service is unavailable: \"%@\"), CFSTR("GTFileWriterService")));
          v55 = v40;
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
          v31 = (GTFileWriterServiceXPCProxy *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 1, v41));

          (*((void (**)(id, GTFileWriterServiceXPCProxy *))v18 + 2))(v18, v31);
          v33 = v49;
        }

      }
      else
      {
        v56 = NSLocalizedDescriptionKey;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to find remote connection")));
        v57 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 5, v39));

        (*((void (**)(id, void *))v18 + 2))(v18, v28);
        v33 = v49;
      }

      v16 = v47;
      v14 = v48;
    }
    else
    {
      (*((void (**)(id, id))v18 + 2))(v18, v21);
      v33 = v49;
    }

  }
  else
  {
    v58 = NSLocalizedDescriptionKey;
    v35 = v16;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterService"), CFSTR("options sent to initiateTransfer are invalid.")));
    v59 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v37));

    v16 = v35;
    (*((void (**)(id, id))v18 + 2))(v18, v21);
    v33 = v49;
  }

}

- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  GTFileWriterServiceXPCProxy *v25;
  void *v26;
  GTFileWriterServiceXPCProxy *v27;
  void *v28;
  NSObject *fileTransferQueue;
  GTFileWriterServiceXPCProxy *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  GTFileWriterService *v48;
  GTFileWriterServiceXPCProxy *v49;
  id v50;
  id v51;
  unint64_t v52;
  NSErrorUserInfoKey v53;
  void *v54;
  NSErrorUserInfoKey v55;
  void *v56;
  NSErrorUserInfoKey v57;
  void *v58;
  NSErrorUserInfoKey v59;
  const __CFString *v60;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GTURLAccessProvider urlForPath:](self->_urlAccessProvider, "urlForPath:", v15));
  if (objc_msgSend(v14, "count"))
  {
    if (sub_10000C44C(v17))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GTConnectionProvider connectionForDeviceUDID:](self->_connectionProvider, "connectionForDeviceUDID:", v16));
      v21 = v20;
      if (v20)
      {
        v41 = v16;
        v22 = sub_100008298(v20, v16, self->_connectionProvider);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        v42 = (void *)v23;
        if (v23)
        {
          v24 = (void *)v23;
          v25 = [GTFileWriterServiceXPCProxy alloc];
          v43 = v19;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "serviceProperties"));
          v27 = -[GTFileWriterServiceXPCProxy initWithConnection:remoteProperties:](v25, "initWithConnection:remoteProperties:", v21, v26);

          objc_msgSend(v43, "startAccessingSecurityScopedResource");
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v15, 1));
          fileTransferQueue = self->_fileTransferQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000CA5C;
          block[3] = &unk_100030AB8;
          v45 = v14;
          v46 = v28;
          v47 = v17;
          v48 = self;
          v49 = v27;
          v52 = a7;
          v50 = v43;
          v51 = v18;
          v30 = v27;
          v31 = v28;
          v19 = v43;
          v32 = v31;
          dispatch_async(fileTransferQueue, block);

        }
        else
        {
          v53 = NSLocalizedDescriptionKey;
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Service is unavailable: \"%@\"), CFSTR("GTFileWriterService")));
          v54 = v39;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          v32 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 1, v40));

          (*((void (**)(id, id))v18 + 2))(v18, v32);
        }

        v16 = v41;
        v38 = v42;
      }
      else
      {
        v55 = NSLocalizedDescriptionKey;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to find remote connection")));
        v56 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 5, v37));

        (*((void (**)(id, void *))v18 + 2))(v18, v38);
      }

    }
    else
    {
      v57 = NSLocalizedDescriptionKey;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterService"), CFSTR("options sent to beginTransferSessionWithFileEntries is invalid")));
      v58 = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v35));

      (*((void (**)(id, void *))v18 + 2))(v18, v21);
    }
  }
  else
  {
    v59 = NSLocalizedDescriptionKey;
    v60 = CFSTR("No files specified");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, v21));
    (*((void (**)(id, void *))v18 + 2))(v18, v33);

  }
}

- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5
{
  NSMutableDictionary *sessions;
  id v8;
  id v9;
  void *v10;
  id v11;

  sessions = self->_sessions;
  v8 = a5;
  v9 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v11));
  objc_msgSend(v10, "writeFileData:completionHandler:", v9, v8);

}

- (BOOL)_finishSession:(unint64_t)a3 error:(id *)a4
{
  NSMutableDictionary *sessions;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;

  sessions = self->_sessions;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v8));

  v10 = self->_sessions;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

  LOBYTE(a4) = objc_msgSend(v9, "finish:", a4);
  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeSem, 0);
  objc_storeStrong((id *)&self->_urlAccessProvider, 0);
  objc_storeStrong((id *)&self->_fileTransferQueue, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
