@implementation HSMessaging

- (void)startMessaging
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
  -[HSMessaging setHostConnection:](self, "setHostConnection:", v3);

  v4 = dispatch_queue_create("com.apple.horizond.messaging", 0);
  -[HSMessaging setQueue:](self, "setQueue:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSMessaging hostConnection](self, "hostConnection"));
  v6 = off_100014C38;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSMessaging queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006DC4;
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received something from remote xpc connection.")));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);

  type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v26 = objc_autoreleasePoolPush();
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSMessaging handleMessage:](self, "handleMessage:", object));
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
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
      -[HSMessaging handleError:](self, "handleError:", object);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unrecognized message type: %@"), v16, 102, v36));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v20, v21, v22, v23, v24, v25, (uint64_t)v18);

    }
  }

}

- (id)handleMessage:(id)a3
{
  id v3;
  xpc_object_t reply;
  const void *data;
  const void *v6;
  HSMessageProcessor *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  const char *v17;
  id v18;
  const char *string;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  const char *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSSet *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  HSMessageProcessor *v113;
  id v114;
  id v115;
  size_t length;

  v3 = a3;
  length = 0;
  reply = xpc_dictionary_create_reply(v3);
  data = xpc_dictionary_get_data(v3, (const char *)objc_msgSend(CFSTR("SerializedMessage"), "UTF8String"), &length);
  if (data)
  {
    v6 = data;
    v7 = objc_alloc_init(HSMessageProcessor);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v6, length));
    v9 = sub_100003ED8(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("Command")));

    if (v11)
    {
      v115 = 0;
      v12 = -[HSMessageProcessor processMessage:response:](v7, "processMessage:response:", v10, &v115);
      v13 = v115;
      v14 = v13;
      if (!v12 && v13)
        goto LABEL_5;
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "lastPathComponent"));
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Process message failed.")));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v89, v90, v91, v92, v93, v94, (uint64_t)v88);

      if (v14)
        goto LABEL_5;
    }
    else
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "lastPathComponent"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot find command from in-coming message.")));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v81, v82, v83, v84, v85, v86, (uint64_t)v80);

    }
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v95, CFSTR("Status"), CFSTR("Failed to get a response from the device."), CFSTR("Error"), &stru_1000108C0, CFSTR("Output"), 0, CFSTR("Data"), 0));

LABEL_5:
    v15 = sub_100004088(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = (const char *)objc_msgSend(CFSTR("SerializedMessage"), "UTF8String");
    v18 = objc_retainAutorelease(v16);
    xpc_dictionary_set_data(reply, v17, objc_msgSend(v18, "bytes"), (size_t)objc_msgSend(v18, "length"));

LABEL_6:
    goto LABEL_20;
  }
  string = xpc_dictionary_get_string(v3, (const char *)objc_msgSend(CFSTR("Command"), "UTF8String"));
  if (string)
  {
    v20 = string;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received a horizon command: %s"), v20));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v23, v24, v25, v26, v27, v28, (uint64_t)v22);

    xpc_dictionary_set_BOOL(reply, "done", 1);
    goto LABEL_20;
  }
  v29 = xpc_dictionary_get_string(v3, (const char *)objc_msgSend(CFSTR("Query"), "UTF8String"));
  if (v29)
  {
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastPathComponent"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Got a query: %s"), v30));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v33, v34, v35, v36, v37, v38, (uint64_t)v32);

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v30));
    if ((objc_msgSend(&off_100011F90, "containsObject:", v39) & 1) != 0)
    {
      v40 = MGCopyAnswer(v39, 0);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (v41)
      {
        v42 = (void *)v41;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v43, CFSTR("Status"), &stru_1000108C0, CFSTR("Error"), &stru_1000108C0, CFSTR("Output"), v42, CFSTR("Data"), 0));

        if (v44)
        {
LABEL_14:
          v46 = sub_100004088(v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
          v48 = (const char *)objc_msgSend(CFSTR("SerializedMessage"), "UTF8String");
          v49 = objc_retainAutorelease(v47);
          xpc_dictionary_set_data(reply, v48, objc_msgSend(v49, "bytes"), (size_t)objc_msgSend(v49, "length"));

          goto LABEL_20;
        }
LABEL_13:
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v45, CFSTR("Status"), CFSTR("Failed to read gestalt key."), CFSTR("Error"), &stru_1000108C0, CFSTR("Output"), 0, CFSTR("Data"), 0));

        goto LABEL_14;
      }
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "lastPathComponent"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot read gestalt key %@"), v39, 169, v106));
    }
    else
    {
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "lastPathComponent"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reading gestalt key %@ is not allowed."), v39, 169, v106));
    }
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v98, v99, v100, v101, v102, v103, (uint64_t)v97);

    v42 = 0;
    goto LABEL_13;
  }
  if (!xpc_dictionary_get_data(v3, (const char *)objc_msgSend(CFSTR("SerializedObject"), "UTF8String"), &length))
  {
    v7 = (HSMessageProcessor *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[HSMessageProcessor lastPathComponent](v7, "lastPathComponent"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid message from host.")));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v73, v74, v75, v76, v77, v78, (uint64_t)v72);

    goto LABEL_6;
  }
  v113 = objc_alloc_init(HSMessageProcessor);
  v112 = objc_opt_class(NSArray);
  v111 = objc_opt_class(NSDictionary);
  v50 = objc_opt_class(NSNumber);
  v51 = objc_opt_class(NSString);
  v52 = objc_opt_class(NSMutableDictionary);
  v53 = objc_opt_class(NSMutableArray);
  v54 = objc_opt_class(NSMutableString);
  v55 = objc_opt_class(NSNull);
  v56 = objc_opt_class(NSURL);
  v57 = objc_opt_class(HSMessageRequest);
  v58 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v112, v111, v50, v51, v52, v53, v54, v55, v56, v57, objc_opt_class(HSMessageResponse), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchiveXPCObject:allowedClasses:](NSKeyedUnarchiver, "unarchiveXPCObject:allowedClasses:", v3, v59));
  if (sub_100006C1C() == 1)
    v61 = CFSTR("Ramdisk");
  else
    v61 = CFSTR("NonUI");
  objc_msgSend(v60, "setDeviceEnvironment:", v61);
  v114 = 0;
  -[HSMessageProcessor processMessagev1:response:](v113, "processMessagev1:response:", v60, &v114);
  v62 = v114;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "lastPathComponent"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Archiving Message Received from XPC Pluging")));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v65, v66, v67, v68, v69, v70, (uint64_t)v64);

  +[NSKeyedArchiver archiveObject:to:](NSKeyedArchiver, "archiveObject:to:", v62, reply);
LABEL_20:

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
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connection to client is invalid.")));
LABEL_6:
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v15, v16, v17, v18, v19, v20, (uint64_t)v14);

    goto LABEL_7;
  }
  if (v3 == &_xpc_error_connection_interrupted)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connection to client interrupted.")));
    goto LABEL_6;
  }
  v4 = xpc_copy_description(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
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
