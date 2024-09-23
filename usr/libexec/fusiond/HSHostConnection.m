@implementation HSHostConnection

- (void)listen:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD block[5];
  id v75;
  socklen_t v76;
  size_t cnt;
  int *fds;
  sockaddr v79;

  *(_QWORD *)&v79.sa_len = 0;
  *(_QWORD *)&v79.sa_data[6] = 0;
  cnt = 0;
  fds = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = launch_activate_socket((const char *)objc_msgSend(v4, "UTF8String"), &fds, &cnt);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to launch_activate_socket with error %s. service Name %@\n"), strerror(v6), v4);
    v68 = (void *)objc_claimAutoreleasedReturnValue(v9);
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  }
  if (fds)
  {
    v16 = cnt;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
    if (v16)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("found %@ socket"), v4));
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v19, v20, v21, v22, v23, v24, (uint64_t)v18);

      v25 = fds;
      v26 = *fds;
    }
    else
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("could not find %@ socket"), v4));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v27, v28, v29, v30, v31, v32, (uint64_t)v18);

      v26 = 0;
      v25 = fds;
    }
    free(v25);
    fds = 0;
  }
  else
  {
    v26 = 0;
  }
  v76 = 16;
  while (1)
  {
    v33 = accept(v26, &v79, &v76);
    if ((v33 & 0x80000000) != 0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastPathComponent"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR on accept")));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v36, v37, v38, v39, v40, v41, (uint64_t)v35);

    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastPathComponent"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received connection from host.")));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v44, v45, v46, v47, v48, v49, (uint64_t)v43);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[HSHostConnection queue](self, "queue"));
    v51 = (void *)xpc_remote_connection_create_with_connected_fd(v33, v50, 0x100000000000002, 1);

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastPathComponent"));
    if (v51)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Created xpc remote connection 0x%lx from socket: %d"), v51, v33, v72));
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v55, v56, v57, v58, v59, v60, (uint64_t)v53);

      v61 = objc_claimAutoreleasedReturnValue(-[HSHostConnection queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000064DC;
      block[3] = &unk_100010598;
      block[4] = self;
      v75 = v51;
      dispatch_async(v61, block);

    }
    else
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot create xpc remote connection.")));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v62, v63, v64, v65, v66, v67, (uint64_t)v53);

    }
  }
}

- (void)acceptConnectionsForService:(id)a3 InQueue:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_queue_t v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a3;
  v9 = a5;
  -[HSHostConnection setQueue:](self, "setQueue:", a4);
  -[HSHostConnection setHandler:](self, "setHandler:", v9);

  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR(".listen"))));
  v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
  -[HSHostConnection setListeningQueue:](self, "setListeningQueue:", v11);

  v12 = objc_claimAutoreleasedReturnValue(-[HSHostConnection listeningQueue](self, "listeningQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000066EC;
  v14[3] = &unk_100010598;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  dispatch_async(v12, v14);

}

- (OS_dispatch_queue)listeningQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setListeningQueue:(id)a3
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

- (id)handler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listeningQueue, 0);
}

@end
