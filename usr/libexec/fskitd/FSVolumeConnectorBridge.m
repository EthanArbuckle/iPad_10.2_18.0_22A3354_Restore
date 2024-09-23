@implementation FSVolumeConnectorBridge

- (FSVolumeConnectorBridge)initWithConnection:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  FSVolumeConnectorBridge *v8;
  uint64_t v9;
  FSVolumeXPC *proxy;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FSVolumeConnectorBridge;
  v8 = -[FSVolumeConnectorBridge init](&v12, "init");
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v7));
    proxy = v8->_proxy;
    v8->_proxy = (FSVolumeXPC *)v9;

  }
  if (!v8->_proxy)
  {

    v8 = 0;
  }

  return v8;
}

- (FSVolumeConnectorBridge)initWithSyncConnection:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  FSVolumeConnectorBridge *v8;
  uint64_t v9;
  FSVolumeXPC *proxy;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FSVolumeConnectorBridge;
  v8 = -[FSVolumeConnectorBridge init](&v12, "init");
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v7));
    proxy = v8->_proxy;
    v8->_proxy = (FSVolumeXPC *)v9;

  }
  if (!v8->_proxy)
  {

    v8 = 0;
  }

  return v8;
}

+ (id)newWithConnection:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithConnection:errorHandler:", v7, v6);

  return v8;
}

+ (id)newWithSyncConnection:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithSyncConnection:errorHandler:", v7, v6);

  return v8;
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  FSVolumeXPC *proxy;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  proxy = self->_proxy;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011E38;
  v11[3] = &unk_100054F40;
  v12 = v8;
  v10 = v8;
  -[FSVolumeXPC abortSearch:requestID:replyHandler:](proxy, "abortSearch:requestID:replyHandler:", a3, a4, v11);

}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  NSUInteger length;
  NSUInteger location;
  id v15;
  FSVolumeXPC *proxy;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  v15 = a8;
  proxy = self->_proxy;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100011F2C;
  v19[3] = &unk_100054F68;
  v20 = v15;
  v18 = v15;
  -[FSVolumeXPC blockmapFile:range:startIO:flags:operationID:replyHandler:](proxy, "blockmapFile:range:startIO:flags:operationID:replyHandler:", v17, location, length, v10, v9, a7, v19);

}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10;
  FSVolumeXPC *proxy;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v10 = a6;
  proxy = self->_proxy;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011FFC;
  v14[3] = &unk_100054F40;
  v15 = v10;
  v13 = v10;
  -[FSVolumeXPC checkAccessTo:requestedAccess:requestID:replyHandler:](proxy, "checkAccessTo:requestedAccess:requestID:replyHandler:", v12, a4, a5, v14);

}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  uint64_t v7;
  id v10;
  FSVolumeXPC *proxy;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  proxy = self->_proxy;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000120CC;
  v14[3] = &unk_100054F40;
  v15 = v10;
  v13 = v10;
  -[FSVolumeXPC close:keepingMode:requestID:replyHandler:](proxy, "close:keepingMode:requestID:replyHandler:", v12, v7, a5, v14);

}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  FSVolumeXPC *proxy;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v12 = a7;
  proxy = self->_proxy;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000121BC;
  v18[3] = &unk_100054F90;
  v19 = v12;
  v17 = v12;
  -[FSVolumeXPC createIn:named:type:attributes:requestID:replyHandler:](proxy, "createIn:named:type:attributes:requestID:replyHandler:", v16, v15, 1, v14, a6, v18);

}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  NSUInteger length;
  NSUInteger location;
  id v15;
  FSVolumeXPC *proxy;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  v15 = a8;
  proxy = self->_proxy;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100012380;
  v19[3] = &unk_100054F40;
  v20 = v15;
  v18 = v15;
  -[FSVolumeXPC endIO:range:status:flags:operationID:replyHandler:](proxy, "endIO:range:status:flags:operationID:replyHandler:", v17, location, length, v10, v9, a7, v19);

}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  FSVolumeXPC *proxy;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  proxy = self->_proxy;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012420;
  v11[3] = &unk_100054FB8;
  v12 = v8;
  v10 = v8;
  -[FSVolumeXPC fetchVolumeMachPortLabeled:requestID:replyHandler:](proxy, "fetchVolumeMachPortLabeled:requestID:replyHandler:", a3, a4, v11);

}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  FSVolumeXPC *proxy;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  proxy = self->_proxy;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000124E4;
  v12[3] = &unk_100054FE0;
  v13 = v8;
  v11 = v8;
  -[FSVolumeXPC fileAttributes:requestedAttributes:requestID:replyHandler:](proxy, "fileAttributes:requestedAttributes:requestID:replyHandler:", v10, 81895, a4, v12);

}

- (void)getRootFileHandleWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  FSVolumeXPC *proxy;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;

  v4 = a3;
  v5 = fskit_std_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[FSVolumeConnectorBridge getRootFileHandleWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:start", buf, 0xCu);
  }

  proxy = self->_proxy;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000125FC;
  v9[3] = &unk_100055008;
  v10 = v4;
  v8 = v4;
  -[FSVolumeXPC getRootFileHandle:](proxy, "getRootFileHandle:", v9);

}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  FSVolumeXPC *proxy;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  proxy = self->_proxy;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100012848;
  v12[3] = &unk_100055030;
  v13 = v8;
  v11 = v8;
  -[FSVolumeXPC listXattrsOf:requestID:replyHandler:](proxy, "listXattrsOf:requestID:replyHandler:", v10, a4, v12);

}

- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  uint64_t v8;
  id v12;
  FSVolumeXPC *proxy;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = *(_QWORD *)&a5;
  v12 = a7;
  proxy = self->_proxy;
  v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100012928;
  v17[3] = &unk_100055058;
  v18 = v12;
  v16 = v12;
  -[FSVolumeXPC lookupIn:name:flags:requestID:replyHandler:](proxy, "lookupIn:name:flags:requestID:replyHandler:", v15, v14, v8, a6, v17);

}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  uint64_t v10;
  id v16;
  FSVolumeXPC *proxy;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v10 = *(_QWORD *)&a7;
  v16 = a9;
  proxy = self->_proxy;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataUsingEncoding:", 4));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100012BBC;
  v24[3] = &unk_100054F90;
  v25 = v16;
  v23 = v16;
  -[FSVolumeXPC makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:](proxy, "makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:", v21, v20, v22, v18, v10, a8, v24);

}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  FSVolumeXPC *proxy;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v12 = a7;
  proxy = self->_proxy;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100012D7C;
  v18[3] = &unk_100054F90;
  v19 = v12;
  v17 = v12;
  -[FSVolumeXPC createIn:named:type:attributes:requestID:replyHandler:](proxy, "createIn:named:type:attributes:requestID:replyHandler:", v16, v15, 2, v14, a6, v18);

}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  FSVolumeXPC *proxy;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v12 = a7;
  proxy = self->_proxy;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100013010;
  v19[3] = &unk_100055080;
  v20 = v12;
  v18 = v12;
  -[FSVolumeXPC makeLinkOf:named:inDirectory:requestID:replyHandler:](proxy, "makeLinkOf:named:inDirectory:requestID:replyHandler:", v16, v15, v17, a6, v19);

}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14;
  FSVolumeXPC *proxy;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v14 = a8;
  proxy = self->_proxy;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100013130;
  v22[3] = &unk_100054F90;
  v23 = v14;
  v21 = v14;
  -[FSVolumeXPC makeSymlinkIn:named:contents:attributes:requestID:replyHandler:](proxy, "makeSymlinkIn:named:contents:attributes:requestID:replyHandler:", v19, v18, v20, v16, a7, v22);

}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  uint64_t v7;
  id v10;
  FSVolumeXPC *proxy;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  proxy = self->_proxy;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000132CC;
  v14[3] = &unk_100054F40;
  v15 = v10;
  v13 = v10;
  -[FSVolumeXPC open:withMode:requestID:replyHandler:](proxy, "open:withMode:requestID:replyHandler:", v12, v7, a5, v14);

}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10;
  FSVolumeXPC *proxy;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  proxy = self->_proxy;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000133A4;
  v15[3] = &unk_100054FE0;
  v16 = v10;
  v14 = v10;
  -[FSVolumeXPC otherAttributeOf:named:requestID:replyHandler:](proxy, "otherAttributeOf:named:requestID:replyHandler:", v13, v12, a5, v15);

}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  FSVolumeXPC *proxy;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  proxy = self->_proxy;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013444;
  v11[3] = &unk_1000550A8;
  v12 = v8;
  v10 = v8;
  -[FSVolumeXPC parentsAndAttributesForItemsByID:requestID:replyHandler:](proxy, "parentsAndAttributesForItemsByID:requestID:replyHandler:", a3, a4, v11);

}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  _QWORD *v9;
  FSVolumeXPC *proxy;
  void *v11;
  FSVolumeXPC *v12;
  void *v13;
  FSVolumeXPC *v14;
  void *v15;
  FSVolumeXPC *v16;
  void *v17;
  FSVolumeXPC *v18;
  void *v19;
  FSVolumeXPC *v20;
  void *v21;
  FSVolumeXPC *v22;
  void *v23;
  void *v24;
  void (*v25)(_QWORD *, uint64_t, void *);
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = a3;
  v9 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3010000000;
  v37 = 0;
  v38 = 0;
  v36 = &unk_10004BE75;
  proxy = self->_proxy;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001379C;
  v32[3] = &unk_1000550D0;
  v32[4] = &v33;
  -[FSVolumeXPC pathConfigurationOf:propertyName:requestID:replyHandler:](proxy, "pathConfigurationOf:propertyName:requestID:replyHandler:", v11, 1, a4, v32);

  v12 = self->_proxy;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000137B4;
  v31[3] = &unk_1000550D0;
  v31[4] = &v33;
  -[FSVolumeXPC pathConfigurationOf:propertyName:requestID:replyHandler:](v12, "pathConfigurationOf:propertyName:requestID:replyHandler:", v13, 4, a4, v31);

  v14 = self->_proxy;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000137CC;
  v30[3] = &unk_1000550D0;
  v30[4] = &v33;
  -[FSVolumeXPC pathConfigurationOf:propertyName:requestID:replyHandler:](v14, "pathConfigurationOf:propertyName:requestID:replyHandler:", v15, 7, a4, v30);

  v16 = self->_proxy;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000137EC;
  v29[3] = &unk_1000550D0;
  v29[4] = &v33;
  -[FSVolumeXPC pathConfigurationOf:propertyName:requestID:replyHandler:](v16, "pathConfigurationOf:propertyName:requestID:replyHandler:", v17, 8, a4, v29);

  v18 = self->_proxy;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100013818;
  v28[3] = &unk_1000550D0;
  v28[4] = &v33;
  -[FSVolumeXPC pathConfigurationOf:propertyName:requestID:replyHandler:](v18, "pathConfigurationOf:propertyName:requestID:replyHandler:", v19, 11, a4, v28);

  v20 = self->_proxy;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100013844;
  v27[3] = &unk_1000550D0;
  v27[4] = &v33;
  -[FSVolumeXPC pathConfigurationOf:propertyName:requestID:replyHandler:](v20, "pathConfigurationOf:propertyName:requestID:replyHandler:", v21, 12, a4, v27);

  v22 = self->_proxy;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100013870;
  v26[3] = &unk_1000550D0;
  v26[4] = &v33;
  -[FSVolumeXPC pathConfigurationOf:propertyName:requestID:replyHandler:](v22, "pathConfigurationOf:propertyName:requestID:replyHandler:", v23, 18, a4, v26);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v34 + 4, 16));
  v25 = (void (*)(_QWORD *, uint64_t, void *))v9[2];
  if (v24)
    v25(v9, 0, v24);
  else
    v25(v9, 12, 0);

  _Block_object_dispose(&v33, 8);
}

- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14;
  id v15;
  void *v16;
  FSVolumeXPC *proxy;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v14 = a8;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FSMutableFileDataBuffer dataWithLength:](FSMutableFileDataBuffer, "dataWithLength:", a4));
  proxy = self->_proxy;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataUsingEncoding:", 4));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000139B0;
  v21[3] = &unk_1000550F8;
  v22 = v16;
  v23 = v14;
  v19 = v16;
  v20 = v14;
  -[FSVolumeXPC readDirectory:intoBuffer:cookie:verifier:requestID:replyHandler:](proxy, "readDirectory:intoBuffer:cookie:verifier:requestID:replyHandler:", v18, v19, a5, a6, a7, v21);

}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  FSVolumeXPC *proxy;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v14 = a4;
  v15 = a8;
  v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FSMutableFileDataBuffer dataWithLength:](FSMutableFileDataBuffer, "dataWithLength:", objc_msgSend(v14, "length")));
  proxy = self->_proxy;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataUsingEncoding:", 4));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100013B40;
  v23[3] = &unk_100055120;
  v24 = v14;
  v25 = v17;
  v26 = v15;
  v20 = v15;
  v21 = v17;
  v22 = v14;
  -[FSVolumeXPC readDirectory:intoBuffer:cookie:verifier:requestID:replyHandler:](proxy, "readDirectory:intoBuffer:cookie:verifier:requestID:replyHandler:", v19, v21, a5, a6, a7, v23);

}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v16;
  id v17;
  void *v18;
  FSVolumeXPC *proxy;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v16 = a9;
  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FSMutableFileDataBuffer dataWithLength:](FSMutableFileDataBuffer, "dataWithLength:", a4));
  proxy = self->_proxy;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100013CDC;
  v23[3] = &unk_1000550F8;
  v24 = v18;
  v25 = v16;
  v21 = v18;
  v22 = v16;
  -[FSVolumeXPC readDirectory:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:](proxy, "readDirectory:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:", v20, a5, v21, a6, a7, a8, v23);

}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  FSVolumeXPC *proxy;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v15 = a4;
  v16 = a9;
  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FSMutableFileDataBuffer dataWithLength:](FSMutableFileDataBuffer, "dataWithLength:", objc_msgSend(v15, "length")));
  proxy = self->_proxy;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100013E78;
  v24[3] = &unk_100055120;
  v25 = v15;
  v26 = v18;
  v27 = v16;
  v21 = v16;
  v22 = v18;
  v23 = v15;
  -[FSVolumeXPC readDirectory:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:](proxy, "readDirectory:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:", v20, a5, v22, a6, a7, a8, v24);

}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  FSVolumeXPC *proxy;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v12 = a5;
  v13 = a7;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FSMutableFileDataBuffer dataWithLength:](FSMutableFileDataBuffer, "dataWithLength:", objc_msgSend(v12, "length")));
  proxy = self->_proxy;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001401C;
  v21[3] = &unk_100055148;
  v22 = v12;
  v23 = v15;
  v24 = v13;
  v18 = v13;
  v19 = v15;
  v20 = v12;
  -[FSVolumeXPC readFrom:atOffset:intoBuffer:requestID:replyHandler:](proxy, "readFrom:atOffset:intoBuffer:requestID:replyHandler:", v17, a4, v19, a6, v21);

}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  void *v14;
  FSVolumeXPC *proxy;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v12 = a7;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FSMutableFileDataBuffer dataWithLength:](FSMutableFileDataBuffer, "dataWithLength:", a4));
  proxy = self->_proxy;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataUsingEncoding:", 4));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100014188;
  v19[3] = &unk_100055170;
  v20 = v14;
  v21 = v12;
  v17 = v14;
  v18 = v12;
  -[FSVolumeXPC readFrom:atOffset:intoBuffer:requestID:replyHandler:](proxy, "readFrom:atOffset:intoBuffer:requestID:replyHandler:", v16, a5, v17, a6, v19);

}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  FSVolumeXPC *proxy;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  proxy = self->_proxy;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001426C;
  v12[3] = &unk_100054F68;
  v13 = v8;
  v11 = v8;
  -[FSVolumeXPC readSymbolicLinkOf:requestID:replyHandler:](proxy, "readSymbolicLinkOf:requestID:replyHandler:", v10, a4, v12);

}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  FSVolumeXPC *proxy;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  proxy = self->_proxy;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100014328;
  v12[3] = &unk_100054FE0;
  v13 = v8;
  v11 = v8;
  -[FSVolumeXPC reclaim:requestID:replyHandler:](proxy, "reclaim:requestID:replyHandler:", v10, a4, v12);

}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9;
  id v14;
  FSVolumeXPC *proxy;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v9 = *(_QWORD *)&a6;
  v14 = a8;
  proxy = self->_proxy;
  v16 = a5;
  v17 = a4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001443C;
  v21[3] = &unk_100054F68;
  v22 = v14;
  v20 = v14;
  -[FSVolumeXPC removeDirectory:from:named:usingFlags:requestID:replyHandler:](proxy, "removeDirectory:from:named:usingFlags:requestID:replyHandler:", v18, v19, v16, v9, a7, v21);

}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9;
  id v14;
  FSVolumeXPC *proxy;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v9 = *(_QWORD *)&a6;
  v14 = a8;
  proxy = self->_proxy;
  v16 = a5;
  v17 = a4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100014550;
  v21[3] = &unk_100055080;
  v22 = v14;
  v20 = v14;
  -[FSVolumeXPC removeItem:from:named:usingFlags:requestID:replyHandler:](proxy, "removeItem:from:named:usingFlags:requestID:replyHandler:", v18, v19, v16, v9, a7, v21);

}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FSVolumeXPC *proxy;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v17 = a3;
  v29 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a11;
  if (a8)
    a8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a8, "dataUsingEncoding:", 4));
  proxy = self->_proxy;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));
  v24 = v17;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dataUsingEncoding:", 4));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataUsingEncoding:", 4));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000146FC;
  v30[3] = &unk_100055198;
  v31 = v21;
  v27 = v21;
  LODWORD(v28) = a9;
  -[FSVolumeXPC renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:](proxy, "renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:", v23, v29, v25, v26, v20, a8, v28, a10, v30);

}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  uint64_t v7;
  id v10;
  FSVolumeXPC *proxy;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  proxy = self->_proxy;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000147B8;
  v13[3] = &unk_100054F40;
  v14 = v10;
  v12 = v10;
  -[FSVolumeXPC replenishSearchCreditsFor:credits:requestID:replyHandler:](proxy, "replenishSearchCreditsFor:credits:requestID:replyHandler:", a3, v7, a5, v13);

}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  uint64_t v11;
  uint64_t v13;
  id v19;
  FSVolumeXPC *proxy;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v11 = *(_QWORD *)&a9;
  v13 = *(_QWORD *)&a7;
  v19 = a11;
  proxy = self->_proxy;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000148E8;
  v26[3] = &unk_100054F40;
  v27 = v19;
  v25 = v19;
  -[FSVolumeXPC search:token:criteria:resumeAt:maxData:maxDelay:initialCredits:requestID:replyHandler:](proxy, "search:token:criteria:resumeAt:maxData:maxDelay:initialCredits:requestID:replyHandler:", v24, v23, v22, v21, v13, v11, a8, a10, v26);

}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10;
  FSVolumeXPC *proxy;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  proxy = self->_proxy;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000149C0;
  v15[3] = &unk_1000551C0;
  v16 = v10;
  v14 = v10;
  -[FSVolumeXPC setFileAttributesOf:to:requestID:replyHandler:](proxy, "setFileAttributesOf:to:requestID:replyHandler:", v13, v12, a5, v15);

}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  FSVolumeXPC *proxy;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v12 = a7;
  proxy = self->_proxy;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100014AB0;
  v18[3] = &unk_100054F68;
  v19 = v12;
  v17 = v12;
  -[FSVolumeXPC setOtherAttributeOf:named:value:requestID:replyHandler:](proxy, "setOtherAttributeOf:named:value:requestID:replyHandler:", v16, v15, v14, a6, v18);

}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  _BOOL8 v7;
  id v10;
  FSVolumeXPC *proxy;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a4;
  v10 = a6;
  proxy = self->_proxy;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100014B7C;
  v14[3] = &unk_1000551E8;
  v15 = v10;
  v13 = v10;
  -[FSVolumeXPC setUpdateInterest:interest:requestID:replyHandler:](proxy, "setUpdateInterest:interest:requestID:replyHandler:", v12, v7, a5, v14);

}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14;
  FSVolumeXPC *proxy;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v14 = a8;
  proxy = self->_proxy;
  v16 = a5;
  v17 = a4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100014C7C;
  v20[3] = &unk_100054F40;
  v21 = v14;
  v19 = v14;
  -[FSVolumeXPC setXattrOf:named:value:how:requestID:replyHandler:](proxy, "setXattrOf:named:value:how:requestID:replyHandler:", v18, v17, v16, a6, a7, v20);

}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  FSVolumeXPC *proxy;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  proxy = self->_proxy;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100014D4C;
  v12[3] = &unk_100055210;
  v13 = v8;
  v11 = v8;
  -[FSVolumeXPC volumeStatistics:requestID:replyHandler:](proxy, "volumeStatistics:requestID:replyHandler:", v10, a4, v12);

}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  FSVolumeXPC *proxy;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v12 = a7;
  proxy = self->_proxy;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100014ED8;
  v17[3] = &unk_100055238;
  v18 = v12;
  v16 = v12;
  -[FSVolumeXPC writeTo:atOffset:fromBuffer:requestID:replyHandler:](proxy, "writeTo:atOffset:fromBuffer:requestID:replyHandler:", v15, a4, v14, a6, v17);

}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12;
  FSVolumeXPC *proxy;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v12 = a7;
  proxy = self->_proxy;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v16 = objc_msgSend(v14, "mutableBytes");

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100014FCC;
  v18[3] = &unk_100055238;
  v19 = v12;
  v17 = v12;
  -[FSVolumeXPC writeTo:atOffset:fromBuffer:requestID:replyHandler:](proxy, "writeTo:atOffset:fromBuffer:requestID:replyHandler:", v15, a4, v16, a6, v18);

}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10;
  FSVolumeXPC *proxy;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  proxy = self->_proxy;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000150A8;
  v15[3] = &unk_100054FE0;
  v16 = v10;
  v14 = v10;
  -[FSVolumeXPC xattrOf:named:requestID:replyHandler:](proxy, "xattrOf:named:requestID:replyHandler:", v13, v12, a5, v15);

}

- (FSVolumeXPC)proxy
{
  return (FSVolumeXPC *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
