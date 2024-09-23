@implementation ValidDelegate

- (void)reschedule
{
  const void *v3;
  NSObject *v4;
  const char *v5;
  OS_os_transaction *transaction;
  int v7;
  const char *v8;
  __int16 v9;
  CFAbsoluteTime Current;

  v3 = sub_100011628("validupdate");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_finishedDownloading)
      v5 = "update";
    else
      v5 = "download";
    v7 = 136315394;
    v8 = v5;
    v9 = 2048;
    Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s canceled at %f", (uint8_t *)&v7, 0x16u);
  }

  (*((void (**)(void))self->_handler + 2))();
  qword_100082E00 = sub_10004CCFC(0);
  sub_100046288(*(double *)&qword_100082E00);
  qword_100082DF8 = 0;
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;

  }
}

- (void)updateDb:(int64_t)a3
{
  NSURL *v5;
  NSFileHandle *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  dispatch_source_t v9;
  void *v10;
  NSObject *v11;
  NSObject *revDbUpdateQueue;
  _QWORD v13[11];
  _QWORD handler[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  NSFileHandle *v24;
  _QWORD v25[5];
  NSString *v26;
  _QWORD v27[5];
  NSURL *v28;

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_10003CE90;
  v27[4] = sub_10003CEA0;
  v5 = self->_currentUpdateFileURL;
  v28 = v5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10003CE90;
  v25[4] = sub_10003CEA0;
  v26 = self->_currentUpdateServer;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10003CE90;
  v23[4] = sub_10003CEA0;
  v6 = self->_currentUpdateFile;
  v24 = v6;
  if (v5 && v6)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = sub_10003CE90;
    v21[4] = sub_10003CEA0;
    v22 = (id)0xAAAAAAAAAAAAAAAALL;
    v22 = (id)os_transaction_create("com.apple.trustd.valid.updateDb");
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_10003CE90;
    v19 = sub_10003CEA0;
    v20 = 0;
    global_queue = dispatch_get_global_queue(25, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v8);
    v10 = (void *)v16[5];
    v16[5] = (uint64_t)v9;

    v11 = v16[5];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003CEA8;
    handler[3] = &unk_100077360;
    handler[4] = v21;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate((dispatch_object_t)v16[5]);
    revDbUpdateQueue = self->_revDbUpdateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003CF2C;
    v13[3] = &unk_100077388;
    v13[4] = self;
    v13[5] = v27;
    v13[6] = &v15;
    v13[7] = v21;
    v13[8] = v25;
    v13[9] = v23;
    v13[10] = a3;
    dispatch_async(revDbUpdateQueue, v13);
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(v21, 8);
  }
  else
  {
    -[ValidDelegate reschedule](self, "reschedule");
  }
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);

}

- (int64_t)versionFromTask:(id)a3
{
  id v3;
  int64_t v4;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "taskDescription")));
  v4 = atol((const char *)objc_msgSend(v3, "cStringUsingEncoding:", 4));

  return v4;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  OS_os_transaction *v14;
  OS_os_transaction *transaction;
  id v16;
  const void *v17;
  NSObject *v18;
  const void *v19;
  NSObject *v20;
  CFURLRef v21;
  NSURL *currentUpdateFileURL;
  NSURL *v23;
  const std::__fs::filesystem::path *v24;
  std::error_code *v25;
  const char *v26;
  int v27;
  const void *v28;
  NSObject *v29;
  const void *v30;
  NSObject *v31;
  NSURL *v32;
  int v33;
  const void *v34;
  NSObject *v35;
  CFAbsoluteTime Current;
  NSURL *v37;
  NSFileHandle *v38;
  id v39;
  NSFileHandle *currentUpdateFile;
  const void *v41;
  NSObject *v42;
  NSURL *v43;
  void *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  CFAbsoluteTime v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  v14 = (OS_os_transaction *)os_transaction_create("com.apple.trustd.valid.download");
  transaction = self->_transaction;
  self->_transaction = v14;

  v16 = objc_msgSend(v12, "statusCode");
  v17 = sub_100011628("validupdate");
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MIMEType"));
    *(_DWORD *)buf = 138413314;
    v48 = *(double *)&v10;
    v49 = 2112;
    v50 = v11;
    v51 = 2048;
    v52 = v16;
    v53 = 2112;
    v54 = v45;
    v55 = 2048;
    v56 = objc_msgSend(v12, "expectedContentLength");
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Session %@ data task %@ returned response %ld (%@), expecting %lld bytes", buf, 0x34u);

  }
  if (sub_10004ED44() == qword_100082918 && v16 == (id)403)
  {
    v19 = sub_100011628("validupdate");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = *(double *)&v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "failed to connect to URL. canceling task %@", buf, 0xCu);
    }

    v13[2](v13, 0);
    qword_100082918 = 4;
LABEL_17:
    -[ValidDelegate reschedule](self, "reschedule");
    goto LABEL_29;
  }
  v21 = sub_10001DCB8((uint64_t)CFSTR("update-current"));
  currentUpdateFileURL = self->_currentUpdateFileURL;
  if (v21)
    v23 = (NSURL *)v21;
  else
    v23 = 0;
  self->_currentUpdateFileURL = v23;

  v24 = -[NSURL fileSystemRepresentation](self->_currentUpdateFileURL, "fileSystemRepresentation");
  if (!v24)
  {
    v28 = sub_100011628("validupdate");
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = *(double *)&v11;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "failed to find revocation info directory. canceling task %@", buf, 0xCu);
    }

    v13[2](v13, 0);
    goto LABEL_17;
  }
  v26 = (const char *)v24;
  remove(v24, v25);
  v27 = open(v26, 1538, 420);
  if (v27 < 0)
  {
    v30 = sub_100011628("validupdate");
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = self->_currentUpdateFileURL;
      v33 = *__error();
      *(_DWORD *)buf = 138412546;
      v48 = *(double *)&v32;
      v49 = 1024;
      LODWORD(v50) = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "unable to open %@ (errno %d)", buf, 0x12u);
    }

  }
  else
  {
    close(v27);
  }
  v34 = sub_100011628("validupdate");
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    v48 = Current;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "download started at %f", buf, 0xCu);
  }

  v37 = self->_currentUpdateFileURL;
  v46 = 0;
  v38 = (NSFileHandle *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingToURL:error:](NSFileHandle, "fileHandleForWritingToURL:error:", v37, &v46));
  v39 = v46;
  currentUpdateFile = self->_currentUpdateFile;
  self->_currentUpdateFile = v38;

  if (self->_currentUpdateFile)
  {
    v13[2](v13, 1);
  }
  else
  {
    v41 = sub_100011628("validupdate");
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = self->_currentUpdateFileURL;
      *(_DWORD *)buf = 138412802;
      v48 = *(double *)&v43;
      v49 = 2112;
      v50 = v39;
      v51 = 2112;
      v52 = v11;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "failed to open %@: %@. canceling task %@", buf, 0x20u);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](TrustAnalytics, "logger"));
    objc_msgSend(v44, "logResultForEvent:hardFailure:result:", CFSTR("ValidUpdateEvent"), 0, v39);

    v13[2](v13, 0);
    -[ValidDelegate reschedule](self, "reschedule");
  }

LABEL_29:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSFileHandle *currentUpdateFile;
  const void *v12;
  NSObject *v13;
  uint8_t v14[24];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  currentUpdateFile = self->_currentUpdateFile;
  if (currentUpdateFile)
  {
    -[NSFileHandle writeData:](currentUpdateFile, "writeData:", v10);
  }
  else
  {
    v12 = sub_100011628("validupdate");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "received data, but output file is not open", v14, 2u);
    }

    objc_msgSend(v9, "cancel");
    -[ValidDelegate reschedule](self, "reschedule");
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  const void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  NSFileHandle *currentUpdateFile;
  NSString *currentUpdateServer;
  NSURL *currentUpdateFileURL;
  OS_os_transaction *transaction;
  int v19;
  CFAbsoluteTime Current;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100011628("validupdate");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      v19 = 138412802;
      Current = *(double *)&v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Session %@ task %@ failed with error %@", (uint8_t *)&v19, 0x20u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](TrustAnalytics, "logger"));
    objc_msgSend(v14, "logResultForEvent:hardFailure:result:", CFSTR("ValidUpdateEvent"), 0, v10);

    -[ValidDelegate reschedule](self, "reschedule");
    -[NSFileHandle closeFile](self->_currentUpdateFile, "closeFile");
    currentUpdateFile = self->_currentUpdateFile;
    self->_currentUpdateFile = 0;

    currentUpdateServer = self->_currentUpdateServer;
    self->_currentUpdateServer = 0;

    currentUpdateFileURL = self->_currentUpdateFileURL;
    self->_currentUpdateFileURL = 0;

  }
  else
  {
    if (v13)
    {
      v19 = 134217984;
      Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "download finished at %f", (uint8_t *)&v19, 0xCu);
    }

    self->_finishedDownloading = 1;
    -[ValidDelegate updateDb:](self, "updateDb:", -[ValidDelegate versionFromTask:](self, "versionFromTask:", v9));
  }
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;

  }
}

- (id)handler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)revDbUpdateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRevDbUpdateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)currentUpdateServer
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentUpdateServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSFileHandle)currentUpdateFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentUpdateFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSURL)currentUpdateFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentUpdateFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)finishedDownloading
{
  return self->_finishedDownloading;
}

- (void)setFinishedDownloading:(BOOL)a3
{
  self->_finishedDownloading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUpdateFileURL, 0);
  objc_storeStrong((id *)&self->_currentUpdateFile, 0);
  objc_storeStrong((id *)&self->_currentUpdateServer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_revDbUpdateQueue, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
