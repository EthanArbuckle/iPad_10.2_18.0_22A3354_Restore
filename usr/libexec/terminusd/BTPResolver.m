@implementation BTPResolver

- (BTPResolver)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 name:(id)a5 type:(id)a6 domain:(id)a7
{
  id v13;
  id v14;
  id v15;
  BTPResolver *v16;
  BTPResolver *v17;
  uint64_t v18;
  NSMutableArray *advertisers;
  BTPResolver *v20;
  objc_super v22;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BTPResolver;
  v16 = -[BTPResolver init](&v22, "init");
  v17 = v16;
  if (v16)
  {
    v16->_sdRefResolve = 0;
    v16->_srcIfIndex = a3;
    v16->_dstIfIndex = a4;
    objc_storeStrong((id *)&v16->_bonjourName, a5);
    objc_storeStrong((id *)&v17->_bonjourType, a6);
    objc_storeStrong((id *)&v17->_bonjourDomain, a7);
    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    advertisers = v17->_advertisers;
    v17->_advertisers = (NSMutableArray *)v18;

    v20 = v17;
  }
  else
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d super init failed", ", "-[BTPResolver initWithSrcIfIndex:dstIfIndex:name:type:domain:]", 275);
    }
  }

  return v17;
}

- (BOOL)start
{
  _DNSServiceRef_t **p_sdRefResolve;
  BOOL result;
  uint64_t v5;
  _DNSServiceRef_t *sdRefResolve;
  DNSServiceErrorType v7;
  DNSServiceErrorType v8;
  _DNSServiceRef_t *v9;

  p_sdRefResolve = &self->_sdRefResolve;
  if (self->_sdRefResolve)
    return 1;
  v5 = DNSServiceResolve(p_sdRefResolve, 0, self->_srcIfIndex, -[NSString UTF8String](self->_bonjourName, "UTF8String"), -[NSString UTF8String](self->_bonjourType, "UTF8String"), -[NSString UTF8String](self->_bonjourDomain, "UTF8String"), (DNSServiceResolveReply)sub_100020C8C, self);
  sdRefResolve = self->_sdRefResolve;
  if (!sdRefResolve || (_DWORD)v5)
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d DNSServiceResolve for %@.%@.%@ failed %d", ", "-[BTPResolver start]", 300, self->_bonjourName, self->_bonjourType, self->_bonjourDomain, v5);
    }
    result = 0;
    *p_sdRefResolve = 0;
  }
  else
  {
    if (qword_1001E4590 != -1)
    {
      v9 = self->_sdRefResolve;
      dispatch_once(&qword_1001E4590, &stru_1001B6418);
      sdRefResolve = v9;
    }
    v7 = DNSServiceSetDispatchQueue(sdRefResolve, (dispatch_queue_t)qword_1001E4588);
    if (!v7)
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      if (_NRLogIsLevelEnabled(qword_1001E4578, 2))
      {
        if (qword_1001E4580 != -1)
          dispatch_once(&qword_1001E4580, &stru_1001B63F8);
        _NRLogWithArgs(qword_1001E4578, 2, "%s%.30s:%-4d Successfully started resolving for %@.%@.%@ over %u", ", "-[BTPResolver start]", 311, self->_bonjourName, self->_bonjourType, self->_bonjourDomain, self->_srcIfIndex);
      }
      return 1;
    }
    v8 = v7;
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d DNSServiceSetDispatchQueue failed %d", ", "-[BTPResolver start]", 306, v8);
    }
    -[BTPResolver stop](self, "stop");
    return 0;
  }
  return result;
}

- (void)stop
{
  _DNSServiceRef_t *sdRefResolve;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  sdRefResolve = self->_sdRefResolve;
  if (sdRefResolve)
  {
    DNSServiceRefDeallocate(sdRefResolve);
    self->_sdRefResolve = 0;
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_advertisers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "stop", (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)dealloc
{
  objc_super v3;

  if (self->_sdRefResolve)
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d _sdRefResolve is still active", ", "-[BTPResolver dealloc]", 329);
    }
    -[BTPResolver stop](self, "stop");
  }
  v3.receiver = self;
  v3.super_class = (Class)BTPResolver;
  -[BTPResolver dealloc](&v3, "dealloc");
}

- (void)handleReplyFullName:(id)a3 hostTarget:(id)a4 port:(unsigned __int16)a5 txtRecord:(id)a6 ifIndex:(unsigned int)a7
{
  unsigned int v9;
  id v12;
  id v13;
  BTPAdvertiser *v14;
  BTPAdvertiser *v15;
  uint64_t v16;
  id v17;

  v9 = a5;
  v17 = a3;
  v12 = a4;
  v13 = a6;
  if (self->_srcIfIndex == a7)
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 2))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 2, "%s%.30s:%-4d received result for %@.%@.%@ : fullName %@ hostTarget %@ port %d txtRecord %@", ", "-[BTPResolver handleReplyFullName:hostTarget:port:txtRecord:ifIndex:]", 345, self->_bonjourName, self->_bonjourType, self->_bonjourDomain, v17, v12, __rev16(v9), v13);
    }
    LOWORD(v16) = v9;
    v14 = -[BTPAdvertiser initWithSrcIfIndex:dstIfIndex:name:type:domain:hostTarget:port:txtRecord:]([BTPAdvertiser alloc], "initWithSrcIfIndex:dstIfIndex:name:type:domain:hostTarget:port:txtRecord:", self->_srcIfIndex, self->_dstIfIndex, self->_bonjourName, self->_bonjourType, self->_bonjourDomain, v12, v16, v13);
    v15 = v14;
    if (v14)
    {
      -[BTPAdvertiser start](v14, "start");
      -[NSMutableArray addObject:](self->_advertisers, "addObject:", v15);
    }

  }
  else
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d received update with invalid ifIndex %u != %u", ", "-[BTPResolver handleReplyFullName:hostTarget:port:txtRecord:ifIndex:]", 341, a7, self->_srcIfIndex);
    }
  }

}

- (_DNSServiceRef_t)sdRefResolve
{
  return self->_sdRefResolve;
}

- (void)setSdRefResolve:(_DNSServiceRef_t *)a3
{
  self->_sdRefResolve = a3;
}

- (unsigned)srcIfIndex
{
  return self->_srcIfIndex;
}

- (void)setSrcIfIndex:(unsigned int)a3
{
  self->_srcIfIndex = a3;
}

- (unsigned)dstIfIndex
{
  return self->_dstIfIndex;
}

- (void)setDstIfIndex:(unsigned int)a3
{
  self->_dstIfIndex = a3;
}

- (NSString)bonjourName
{
  return self->_bonjourName;
}

- (void)setBonjourName:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourName, a3);
}

- (NSString)bonjourType
{
  return self->_bonjourType;
}

- (void)setBonjourType:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourType, a3);
}

- (NSString)bonjourDomain
{
  return self->_bonjourDomain;
}

- (void)setBonjourDomain:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourDomain, a3);
}

- (NSMutableArray)advertisers
{
  return self->_advertisers;
}

- (void)setAdvertisers:(id)a3
{
  objc_storeStrong((id *)&self->_advertisers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisers, 0);
  objc_storeStrong((id *)&self->_bonjourDomain, 0);
  objc_storeStrong((id *)&self->_bonjourType, 0);
  objc_storeStrong((id *)&self->_bonjourName, 0);
}

@end
