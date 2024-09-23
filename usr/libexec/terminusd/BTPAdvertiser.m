@implementation BTPAdvertiser

- (BTPAdvertiser)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 name:(id)a5 type:(id)a6 domain:(id)a7 hostTarget:(id)a8 port:(unsigned __int16)a9 txtRecord:(id)a10
{
  id v16;
  id v17;
  id v18;
  BTPAdvertiser *v19;
  BTPAdvertiser *v20;
  BTPAdvertiser *v21;
  void *v22;
  void *v23;
  id v26;
  id v27;
  objc_super v28;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v27 = a8;
  v26 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BTPAdvertiser;
  v19 = -[BTPAdvertiser init](&v28, "init");
  v20 = v19;
  if (v19)
  {
    v19->_sdRefRegister = 0;
    v19->_srcIfIndex = a3;
    v19->_dstIfIndex = a4;
    objc_storeStrong((id *)&v19->_bonjourName, a5);
    objc_storeStrong((id *)&v20->_bonjourType, a6);
    objc_storeStrong((id *)&v20->_bonjourDomain, a7);
    objc_storeStrong((id *)&v20->_hostTarget, a8);
    v20->_port = a9;
    objc_storeStrong((id *)&v20->_txtRecord, a10);
    v21 = v20;
    v23 = v26;
    v22 = v27;
  }
  else
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    v23 = v26;
    v22 = v27;
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d super init failed", ", "-[BTPAdvertiser initWithSrcIfIndex:dstIfIndex:name:type:domain:hostTarget:port:txtRecord:]", 376);
    }
  }

  return v20;
}

- (BOOL)start
{
  _DNSServiceRef_t **p_sdRefRegister;
  BOOL result;
  uint64_t v5;
  _DNSServiceRef_t *sdRefRegister;
  DNSServiceErrorType v7;
  DNSServiceErrorType v8;
  _DNSServiceRef_t *v9;

  p_sdRefRegister = &self->_sdRefRegister;
  if (self->_sdRefRegister)
    return 1;
  v5 = DNSServiceRegister(p_sdRefRegister, 0, self->_dstIfIndex, -[NSString UTF8String](self->_bonjourName, "UTF8String"), -[NSString UTF8String](self->_bonjourType, "UTF8String"), -[NSString UTF8String](self->_bonjourDomain, "UTF8String"), -[NSString UTF8String](self->_hostTarget, "UTF8String"), self->_port, (uint16_t)-[NSData length](self->_txtRecord, "length"), -[NSData bytes](self->_txtRecord, "bytes"), (DNSServiceRegisterReply)nullsub_5, self);
  sdRefRegister = self->_sdRefRegister;
  if (!sdRefRegister || (_DWORD)v5)
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d DNSServiceRegister for %@.%@.%@ %@:%d over %u failed %d", ", "-[BTPAdvertiser start]", 405, self->_bonjourName, self->_bonjourType, self->_bonjourDomain, self->_hostTarget, bswap32(self->_port) >> 16, self->_dstIfIndex, v5);
    }
    result = 0;
    *p_sdRefRegister = 0;
  }
  else
  {
    if (qword_1001E4590 != -1)
    {
      v9 = self->_sdRefRegister;
      dispatch_once(&qword_1001E4590, &stru_1001B6418);
      sdRefRegister = v9;
    }
    v7 = DNSServiceSetDispatchQueue(sdRefRegister, (dispatch_queue_t)qword_1001E4588);
    if (!v7)
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      if (_NRLogIsLevelEnabled(qword_1001E4578, 2))
      {
        if (qword_1001E4580 != -1)
          dispatch_once(&qword_1001E4580, &stru_1001B63F8);
        _NRLogWithArgs(qword_1001E4578, 2, "%s%.30s:%-4d Successfully registered %@.%@.%@ %@:%d over %u", ", "-[BTPAdvertiser start]", 416, self->_bonjourName, self->_bonjourType, self->_bonjourDomain, self->_hostTarget, bswap32(self->_port) >> 16, self->_dstIfIndex);
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
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d DNSServiceSetDispatchQueue failed %d", ", "-[BTPAdvertiser start]", 411, v8);
    }
    -[BTPAdvertiser stop](self, "stop");
    return 0;
  }
  return result;
}

- (void)stop
{
  _DNSServiceRef_t *sdRefRegister;

  sdRefRegister = self->_sdRefRegister;
  if (sdRefRegister)
  {
    DNSServiceRefDeallocate(sdRefRegister);
    self->_sdRefRegister = 0;
  }
  if (qword_1001E4580 != -1)
    dispatch_once(&qword_1001E4580, &stru_1001B63F8);
  if (_NRLogIsLevelEnabled(qword_1001E4578, 2))
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    _NRLogWithArgs(qword_1001E4578, 2, "%s%.30s:%-4d Successfully unregistered %@.%@.%@ %@:%d over %u", ", "-[BTPAdvertiser stop]", 427, self->_bonjourName, self->_bonjourType, self->_bonjourDomain, self->_hostTarget, bswap32(self->_port) >> 16, self->_dstIfIndex);
  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_sdRefRegister)
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d _sdRefRegister is still active", ", "-[BTPAdvertiser dealloc]", 433);
    }
    -[BTPAdvertiser stop](self, "stop");
  }
  v3.receiver = self;
  v3.super_class = (Class)BTPAdvertiser;
  -[BTPAdvertiser dealloc](&v3, "dealloc");
}

- (_DNSServiceRef_t)sdRefRegister
{
  return self->_sdRefRegister;
}

- (void)setSdRefRegister:(_DNSServiceRef_t *)a3
{
  self->_sdRefRegister = a3;
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

- (NSString)hostTarget
{
  return self->_hostTarget;
}

- (void)setHostTarget:(id)a3
{
  objc_storeStrong((id *)&self->_hostTarget, a3);
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (NSData)txtRecord
{
  return self->_txtRecord;
}

- (void)setTxtRecord:(id)a3
{
  objc_storeStrong((id *)&self->_txtRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_hostTarget, 0);
  objc_storeStrong((id *)&self->_bonjourDomain, 0);
  objc_storeStrong((id *)&self->_bonjourType, 0);
  objc_storeStrong((id *)&self->_bonjourName, 0);
}

@end
