@implementation LiveFSVolumeCore_FSFileNameBridge

- (LiveFSVolumeCore_FSFileNameBridge)initWithConnection:(id)a3 errorHandler:(id)a4
{
  void *v5;
  LiveFSVolumeCore_FSFileNameBridge *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", a4));
  v6 = -[LiveFSVolumeCore_FSFileNameBridge initWithProxy:](self, "initWithProxy:", v5);

  return v6;
}

- (LiveFSVolumeCore_FSFileNameBridge)initWithSyncConnection:(id)a3 errorHandler:(id)a4
{
  void *v5;
  LiveFSVolumeCore_FSFileNameBridge *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "synchronousRemoteObjectProxyWithErrorHandler:", a4));
  v6 = -[LiveFSVolumeCore_FSFileNameBridge initWithProxy:](self, "initWithProxy:", v5);

  return v6;
}

- (LiveFSVolumeCore_FSFileNameBridge)initWithProxy:(id)a3
{
  id v5;
  LiveFSVolumeCore_FSFileNameBridge *v6;
  LiveFSVolumeCore_FSFileNameBridge *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LiveFSVolumeCore_FSFileNameBridge;
  v6 = -[LiveFSVolumeCore_FSFileNameBridge init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proxy, a3);
  if (!v7->_proxy)
  {

    v7 = 0;
  }

  return v7;
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

+ (id)newWithProxy:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithProxy:", v4);

  return v5;
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore abortSearch:requestID:reply:](self->_proxy, "abortSearch:requestID:reply:", a3, a4, a5);
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  -[LiveFSVolumeCore blockmapFile:range:startIO:flags:operationID:reply:](self->_proxy, "blockmapFile:range:startIO:flags:operationID:reply:", a3, a4.location, a4.length, *(_QWORD *)&a5, *(_QWORD *)&a6, a7);
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolumeCore checkAccessTo:requestedAccess:requestID:reply:](self->_proxy, "checkAccessTo:requestedAccess:requestID:reply:", a3, *(_QWORD *)&a4, a5, a6);
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolumeCore close:keepingMode:requestID:reply:](self->_proxy, "close:keepingMode:requestID:reply:", a3, *(_QWORD *)&a4, a5, a6);
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  LiveFSVolumeCore *proxy;
  id v12;
  id v13;
  id v14;
  id v15;

  proxy = self->_proxy;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore createIn:named:attributes:requestID:reply:](proxy, "createIn:named:attributes:requestID:reply:", v14, v15, v13, a6, v12);

}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  -[LiveFSVolumeCore endIO:range:status:flags:operationID:reply:](self->_proxy, "endIO:range:status:flags:operationID:reply:", a3, a4.location, a4.length, *(_QWORD *)&a5, *(_QWORD *)&a6, a7);
}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore fetchVolumeMachPortLabeled:requestID:reply:](self->_proxy, "fetchVolumeMachPortLabeled:requestID:reply:", a3, a4, a5);
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore fileAttributes:requestID:reply:](self->_proxy, "fileAttributes:requestID:reply:", a3, a4, a5);
}

- (void)getRootFileHandleWithError:(id)a3
{
  -[LiveFSVolumeCore getRootFileHandleWithError:](self->_proxy, "getRootFileHandleWithError:", a3);
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore listXattrsOf:requestID:reply:](self->_proxy, "listXattrsOf:requestID:reply:", a3, a4, a5);
}

- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  uint64_t v8;
  LiveFSVolumeCore *proxy;
  id v12;
  id v13;
  id v14;

  v8 = *(_QWORD *)&a5;
  proxy = self->_proxy;
  v12 = a7;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore lookupIn:name:usingFlags:requestID:reply:](proxy, "lookupIn:name:usingFlags:requestID:reply:", v13, v14, v8, a6, v12);

}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  uint64_t v10;
  LiveFSVolumeCore *proxy;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = *(_QWORD *)&a7;
  proxy = self->_proxy;
  v16 = a9;
  v17 = a6;
  v18 = a5;
  v19 = a3;
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:reply:](proxy, "makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:reply:", v19, v20, v18, v17, v10, a8, v16);

}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  LiveFSVolumeCore *proxy;
  id v12;
  id v13;
  id v14;
  id v15;

  proxy = self->_proxy;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore makeDirectoryIn:named:attributes:requestID:reply:](proxy, "makeDirectoryIn:named:attributes:requestID:reply:", v14, v15, v13, a6, v12);

}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  LiveFSVolumeCore *proxy;
  id v12;
  id v13;
  id v14;
  id v15;

  proxy = self->_proxy;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore makeLinkOf:named:inDirectory:requestID:reply:](proxy, "makeLinkOf:named:inDirectory:requestID:reply:", v14, v15, v13, a6, v12);

}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  LiveFSVolumeCore *proxy;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  proxy = self->_proxy;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore makeSymLinkIn:named:contents:attributes:requestID:reply:](proxy, "makeSymLinkIn:named:contents:attributes:requestID:reply:", v17, v18, v16, v15, a7, v14);

}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolumeCore open:withMode:requestID:reply:](self->_proxy, "open:withMode:requestID:reply:", a3, *(_QWORD *)&a4, a5, a6);
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  LiveFSVolumeCore *proxy;
  id v10;
  id v11;
  id v12;

  proxy = self->_proxy;
  v10 = a6;
  v11 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore otherAttributeOf:named:requestID:reply:](proxy, "otherAttributeOf:named:requestID:reply:", v11, v12, a5, v10);

}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore parentsAndAttributesForItemsByID:requestID:reply:](self->_proxy, "parentsAndAttributesForItemsByID:requestID:reply:", a3, a4, a5);
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore pathConfiguration:requestID:reply:](self->_proxy, "pathConfiguration:requestID:reply:", a3, a4, a5);
}

- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore pathsAndAttributesForItemsByIDs:requestID:reply:](self->_proxy, "pathsAndAttributesForItemsByIDs:requestID:reply:", a3, a4, a5);
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  -[LiveFSVolumeCore readDirectory:amount:cookie:verifier:requestID:reply:](self->_proxy, "readDirectory:amount:cookie:verifier:requestID:reply:", a3, a4, a5, a6, a7, a8);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  -[LiveFSVolumeCore readDirectory:intoBuffer:cookie:verifier:requestID:reply:](self->_proxy, "readDirectory:intoBuffer:cookie:verifier:requestID:reply:", a3, a4, a5, a6, a7, a8);
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  -[LiveFSVolumeCore readDirectory:amount:requestedAttributes:cookie:verifier:requestID:reply:](self->_proxy, "readDirectory:amount:requestedAttributes:cookie:verifier:requestID:reply:", a3, a4, a5, a6, a7, a8);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  -[LiveFSVolumeCore readDirectory:intoBuffer:requestedAttributes:cookie:verifier:requestID:reply:](self->_proxy, "readDirectory:intoBuffer:requestedAttributes:cookie:verifier:requestID:reply:", a3, a4, a5, a6, a7, a8);
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  -[LiveFSVolumeCore readFrom:atOffset:intoBuffer:requestID:reply:](self->_proxy, "readFrom:atOffset:intoBuffer:requestID:reply:", a3, a4, a5, a6, a7);
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  -[LiveFSVolumeCore readFrom:length:atOffset:requestID:reply:](self->_proxy, "readFrom:length:atOffset:requestID:reply:", a3, a4, a5, a6, a7);
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8;
  LiveFSVolumeCore *proxy;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  proxy = self->_proxy;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015870;
  v11[3] = &unk_100055260;
  v12 = v8;
  v10 = v8;
  -[LiveFSVolumeCore readLinkOf:requestID:reply:](proxy, "readLinkOf:requestID:reply:", a3, a4, v11);

}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore reclaim:requestID:reply:](self->_proxy, "reclaim:requestID:reply:", a3, a4, a5);
}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9;
  LiveFSVolumeCore *proxy;
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = *(_QWORD *)&a6;
  proxy = self->_proxy;
  v14 = a8;
  v15 = a4;
  v16 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "string"));
  -[LiveFSVolumeCore removeDirectory:from:named:usingFlags:requestID:reply:](proxy, "removeDirectory:from:named:usingFlags:requestID:reply:", v16, v15, v17, v9, a7, v14);

}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9;
  LiveFSVolumeCore *proxy;
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = *(_QWORD *)&a6;
  proxy = self->_proxy;
  v14 = a8;
  v15 = a4;
  v16 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "string"));
  -[LiveFSVolumeCore removeItem:from:named:usingFlags:requestID:reply:](proxy, "removeItem:from:named:usingFlags:requestID:reply:", v16, v15, v17, v9, a7, v14);

}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  LiveFSVolumeCore *proxy;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;

  proxy = self->_proxy;
  v18 = a11;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "string"));

  LODWORD(v25) = a9;
  -[LiveFSVolumeCore renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:reply:](proxy, "renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:reply:", v23, v26, v22, v21, v24, v19, v25, a10, v18);

}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolumeCore replenishSearchCreditsFor:credits:requestID:reply:](self->_proxy, "replenishSearchCreditsFor:credits:requestID:reply:", a3, *(_QWORD *)&a4, a5, a6);
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  -[LiveFSVolumeCore search:token:criteria:resumeAt:maxData:maxDelay:initialCredits:requestID:reply:](self->_proxy, "search:token:criteria:resumeAt:maxData:maxDelay:initialCredits:requestID:reply:", a3, a4, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a9, a8);
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolumeCore setFileAttributesOf:to:requestID:reply:](self->_proxy, "setFileAttributesOf:to:requestID:reply:", a3, a4, a5, a6);
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  LiveFSVolumeCore *proxy;
  id v12;
  id v13;
  id v14;
  id v15;

  proxy = self->_proxy;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore setOtherAttributeOf:named:value:requestID:reply:](proxy, "setOtherAttributeOf:named:value:requestID:reply:", v14, v15, v13, a6, v12);

}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  -[LiveFSVolumeCore setUpdateInterest:interest:requestID:reply:](self->_proxy, "setUpdateInterest:interest:requestID:reply:", a3, a4, a5, a6);
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9;
  LiveFSVolumeCore *proxy;
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = *(_QWORD *)&a6;
  proxy = self->_proxy;
  v14 = a8;
  v15 = a5;
  v16 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore setXattrOf:named:value:how:requestID:reply:](proxy, "setXattrOf:named:value:how:requestID:reply:", v16, v17, v15, v9, a7, v14);

}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore verifyItemExistenceByIDs:requestID:reply:](self->_proxy, "verifyItemExistenceByIDs:requestID:reply:", a3, a4, a5);
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  -[LiveFSVolumeCore volumeStatistics:requestID:reply:](self->_proxy, "volumeStatistics:requestID:reply:", a3, a4, a5);
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  -[LiveFSVolumeCore writeTo:atOffset:fromBuffer:requestID:reply:](self->_proxy, "writeTo:atOffset:fromBuffer:requestID:reply:", a3, a4, a5, a6, a7);
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  -[LiveFSVolumeCore writeTo:atOffset:sharedBuffer:requestID:reply:](self->_proxy, "writeTo:atOffset:sharedBuffer:requestID:reply:", a3, a4, a5, a6, a7);
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  LiveFSVolumeCore *proxy;
  id v10;
  id v11;
  id v12;

  proxy = self->_proxy;
  v10 = a6;
  v11 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  -[LiveFSVolumeCore xattrOf:named:requestID:reply:](proxy, "xattrOf:named:requestID:reply:", v11, v12, a5, v10);

}

- (LiveFSVolumeCore)proxy
{
  return (LiveFSVolumeCore *)objc_getProperty(self, a2, 8, 1);
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
