@implementation RMInternalServiceHandler

- (RMInternalServiceHandler)initWithEndpoint:(id)a3 managedListener:(id)a4
{
  id *v6;
  id v7;
  RMInternalServiceHandler *v8;
  objc_super v10;

  v6 = (id *)a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RMInternalServiceHandler;
  v8 = -[RMInternalServiceHandler init](&v10, "init");
  if (v8)
  {
    sub_1000163B4(v6, v8);
    -[RMInternalServiceHandler setEndpoint:](v8, "setEndpoint:", v6);
    -[RMInternalServiceHandler setListener:](v8, "setListener:", v7);
  }

  return v8;
}

- (void)dealloc
{
  id *v3;
  objc_super v4;

  v3 = (id *)objc_claimAutoreleasedReturnValue(-[RMInternalServiceHandler endpoint](self, "endpoint"));
  sub_1000163B4(v3, 0);

  -[RMInternalServiceHandler setEndpoint:](self, "setEndpoint:", 0);
  v4.receiver = self;
  v4.super_class = (Class)RMInternalServiceHandler;
  -[RMInternalServiceHandler dealloc](&v4, "dealloc");
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  RMConnectionListener *listener;
  RMConnectionListener *v16;
  RMConnectionListener *v17;
  id v18;
  void *v19;
  id v20;
  RMConnectionListener *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  __int128 *v29;
  id v30;
  _QWORD v31[4];
  _QWORD *v32;
  __int128 *v33;
  _QWORD v34[4];
  _QWORD *v35;
  __int128 *v36;
  _QWORD v37[4];
  _QWORD *v38;
  __int128 *p_buf;
  _QWORD v40[5];
  id v41;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  NSMutableArray *v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100007BE4;
  v40[3] = &unk_100024A38;
  v40[4] = self;
  v13 = a6;
  v41 = v13;
  v14 = objc_retainBlock(v40);
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("RMSpiGetNumClients")))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v43 = 0x2020000000;
    v44 = 0;
    listener = self->_listener;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100007CDC;
    v37[3] = &unk_100024A60;
    p_buf = &buf;
    v38 = v14;
    -[RMConnectionListener traverseEndpointsAsynchronously:](listener, "traverseEndpointsAsynchronously:", v37);

LABEL_5:
    _Block_object_dispose(&buf, 8);
    goto LABEL_6;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("RMSpiDisconnectAllClients")))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v43 = 0x2020000000;
    v44 = 0;
    v16 = self->_listener;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100007D98;
    v34[3] = &unk_100024A60;
    v36 = &buf;
    v35 = v14;
    -[RMConnectionListener traverseEndpointsAsynchronously:](v16, "traverseEndpointsAsynchronously:", v34);

    goto LABEL_5;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("RMSpiListClients")))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v43 = 0x3032000000;
    v44 = sub_100007E5C;
    v45 = sub_100007E6C;
    v46 = objc_opt_new(NSMutableArray);
    v17 = self->_listener;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100007E74;
    v31[3] = &unk_100024A60;
    v33 = &buf;
    v32 = v14;
    -[RMConnectionListener traverseEndpointsAsynchronously:](v17, "traverseEndpointsAsynchronously:", v31);

    _Block_object_dispose(&buf, 8);
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RMSpiDisconnectClient")))
  {
    v30 = 0;
    v18 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSString), v12, &v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = v30;
    if (v19)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v43 = 0x2020000000;
      v44 = 0;
      v21 = self->_listener;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100007F18;
      v26[3] = &unk_100024A88;
      v27 = v19;
      v29 = &buf;
      v28 = v14;
      -[RMConnectionListener traverseEndpointsAsynchronously:](v21, "traverseEndpointsAsynchronously:", v26);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, 0));
      ((void (*)(_QWORD *, const __CFString *, void *))v14[2])(v14, CFSTR("RMSpiError"), v25);

    }
  }
  else
  {
    if (qword_10002C4C0 != -1)
      dispatch_once(&qword_10002C4C0, &stru_100024AA8);
    v22 = qword_10002C4C8;
    if (os_log_type_enabled((os_log_t)qword_10002C4C8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unknown message: %@", (uint8_t *)&buf, 0xCu);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RMSpiError"), -699, 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, 0));
    ((void (*)(_QWORD *, const __CFString *, void *))v14[2])(v14, CFSTR("RMSpiError"), v24);

  }
LABEL_6:

}

- (RMConnectionEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (RMConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
