@implementation HSFileTransfer

- (void)startFileTransferService
{
  HSHostConnection *v3;
  dispatch_queue_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(HSHostConnection);
  -[HSFileTransfer setHostConnection:](self, "setHostConnection:", v3);

  v4 = dispatch_queue_create("com.apple.horizond.file_transfer", 0);
  -[HSFileTransfer setQueue:](self, "setQueue:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSFileTransfer hostConnection](self, "hostConnection"));
  v6 = off_100014C40;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSFileTransfer queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B490;
  v8[3] = &unk_100010650;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "acceptConnectionsForService:InQueue:withHandler:", v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleEvent:(id)a3 from:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  xpc_type_t type;
  xpc_type_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  xpc_object_t object;

  object = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received something from remote xpc connection.")));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);

  type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v26 = objc_autoreleasePoolPush();
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSFileTransfer handleMessage:](self, "handleMessage:", object));
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Server replying.")));
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v30, v31, v32, v33, v34, v35, (uint64_t)v29);

      xpc_remote_connection_send_message(v6, v27);
    }

    objc_autoreleasePoolPop(v26);
  }
  else
  {
    v16 = type;
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      -[HSFileTransfer handleError:](self, "handleError:", object);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unrecognized message type: %@"), v16, 48, v36));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v20, v21, v22, v23, v24, v25, (uint64_t)v18);

    }
  }

}

- (id)handleMessage:(id)a3
{
  id v3;
  xpc_object_t reply;
  const char *string;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v3 = a3;
  reply = xpc_dictionary_create_reply(v3);
  string = xpc_dictionary_get_string(v3, "retrieve_file");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  if (!string)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation not supported.")));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v21, v22, v23, v24, v25, v26, (uint64_t)v7);

    xpc_dictionary_set_string(reply, "error", "Operation not supported.");
    return reply;
  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Retrieving file from device to host...")));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByStandardizingPath"));

  if (v15 && (objc_msgSend(v15, "hasPrefix:", CFSTR("/var/mobile/Media/FactoryLogs")) & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v17 = objc_msgSend(v16, "fileExistsAtPath:", v15);

    if ((v17 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contentsAtPath:", v19));

      if ((unint64_t)objc_msgSend(v20, "length") > 0xA00000)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "lastPathComponent"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("File to retrieve is too big. Limit is 10M.")));
        sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v48, v49, v50, v51, v52, v53, (uint64_t)v47);

        xpc_dictionary_set_string(reply, "error", "File to retrieve is too big. Limit is 10M.");
      }
      else
      {
        v20 = objc_retainAutorelease(v20);
        xpc_dictionary_set_data(reply, "content", objc_msgSend(v20, "bytes"), (size_t)objc_msgSend(v20, "length"));
      }

      goto LABEL_8;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastPathComponent"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("File does not exist: %@."), v15, 76, v54));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v40, v41, v42, v43, v44, v45, (uint64_t)v38);

    v36 = "File does not exist";
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Only files under /private/var/mobile/Media/FactoryLogs can be copied.")));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v30, v31, v32, v33, v34, v35, (uint64_t)v29);

    v36 = "Only files under /private/var/mobile/Media/FactoryLogs can be copied.";
  }
  xpc_dictionary_set_string(reply, "error", v36);
LABEL_8:

  return reply;
}

- (void)handleError:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  xpc_object_t object;

  v3 = a3;
  object = v3;
  if (v3 == &_xpc_error_connection_invalid)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connection to client is invalid.")));
LABEL_6:
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v15, v16, v17, v18, v19, v20, (uint64_t)v14);

    goto LABEL_7;
  }
  if (v3 == &_xpc_error_connection_interrupted)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connection to client interrupted.")));
    goto LABEL_6;
  }
  v4 = xpc_copy_description(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unrecognized XPC error: %s"), v4));
  sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  free(v4);
LABEL_7:

}

- (HSHostConnection)hostConnection
{
  return (HSHostConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHostConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hostConnection, 0);
}

@end
