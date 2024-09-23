@implementation SOSEnginePeerMessageCallBackInfo

- (SOSEnginePeerMessageCallBackInfo)initWithEngine:(__OpaqueSOSEngine *)a3 peer:(__OpaqueSOSPeer *)a4 localManifest:(__OpaqueSOSManifest *)a5 proposedManifest:(__OpaqueSOSManifest *)a6 confirmedManifest:(__OpaqueSOSManifest *)a7 andMessage:(__OpaqueSOSMessage *)a8
{
  SOSEnginePeerMessageCallBackInfo *v15;
  SOSEnginePeerMessageCallBackInfo *v16;
  id callbackBlock;
  SOSEnginePeerMessageCallBackInfo *v18;
  objc_super v20;

  if (qword_1003412B8 != -1)
    dispatch_once(&qword_1003412B8, &stru_1002E7840);
  if (byte_10033FE20)
  {
    v20.receiver = self;
    v20.super_class = (Class)SOSEnginePeerMessageCallBackInfo;
    v15 = -[SOSEnginePeerMessageCallBackInfo init](&v20, "init");
    v16 = v15;
    if (v15)
    {
      callbackBlock = v15->_callbackBlock;
      v15->_callbackBlock = 0;

      if (a3)
        CFRetain(a3);
      v16->_engine = a3;
      if (a4)
        CFRetain(a4);
      v16->_peer = a4;
      if (a5)
        CFRetain(a5);
      v16->_local = a5;
      if (a6)
        CFRetain(a6);
      v16->_proposed = a6;
      if (a7)
        CFRetain(a7);
      v16->_confirmed = a7;
      if (a8)
        CFRetain(a8);
      v16->_message = a8;
    }
    self = v16;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)callCallback:(BOOL)a3
{
  if (qword_1003412B8 != -1)
    dispatch_once(&qword_1003412B8, &stru_1002E7840);
  if (byte_10033FE20)
    (*((void (**)(void))self->_callbackBlock + 2))();
}

- (void)setCallback:(id)a3
{
  id v4;
  id v5;
  id callbackBlock;
  id v7;
  id v8;

  v4 = a3;
  if (qword_1003412B8 != -1)
  {
    v8 = v4;
    dispatch_once(&qword_1003412B8, &stru_1002E7840);
    v4 = v8;
  }
  if (byte_10033FE20)
  {
    v7 = v4;
    v5 = objc_retainBlock(v4);
    callbackBlock = self->_callbackBlock;
    self->_callbackBlock = v5;

    v4 = v7;
  }

}

- (void)setCoder:(__OpaqueSOSCoder *)a3
{
  if (qword_1003412B8 != -1)
    dispatch_once(&qword_1003412B8, &stru_1002E7840);
  if (byte_10033FE20)
  {
    if (a3)
      CFRetain(a3);
    self->_coder = a3;
  }
}

- (void)dealloc
{
  __OpaqueSOSEngine *engine;
  __OpaqueSOSPeer *peer;
  __OpaqueSOSManifest *local;
  __OpaqueSOSManifest *proposed;
  __OpaqueSOSManifest *confirmed;
  __OpaqueSOSMessage *message;
  __OpaqueSOSCoder *coder;
  objc_super v10;

  if (qword_1003412B8 != -1)
    dispatch_once(&qword_1003412B8, &stru_1002E7840);
  if (byte_10033FE20)
  {
    engine = self->_engine;
    if (engine)
    {
      self->_engine = 0;
      CFRelease(engine);
    }
    peer = self->_peer;
    if (peer)
    {
      self->_peer = 0;
      CFRelease(peer);
    }
    local = self->_local;
    if (local)
    {
      self->_local = 0;
      CFRelease(local);
    }
    proposed = self->_proposed;
    if (proposed)
    {
      self->_proposed = 0;
      CFRelease(proposed);
    }
    confirmed = self->_confirmed;
    if (confirmed)
    {
      self->_confirmed = 0;
      CFRelease(confirmed);
    }
    message = self->_message;
    if (message)
    {
      self->_message = 0;
      CFRelease(message);
    }
    coder = self->_coder;
    if (coder)
      CFRelease(coder);
  }
  v10.receiver = self;
  v10.super_class = (Class)SOSEnginePeerMessageCallBackInfo;
  -[SOSEnginePeerMessageCallBackInfo dealloc](&v10, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  SOSEnginePeerMessageCallBackInfo *v4;
  __OpaqueSOSEngine *engine;
  __OpaqueSOSPeer *peer;
  __OpaqueSOSManifest *local;
  __OpaqueSOSManifest *proposed;
  __OpaqueSOSManifest *confirmed;
  __OpaqueSOSMessage *message;

  if (qword_1003412B8 != -1)
    dispatch_once(&qword_1003412B8, &stru_1002E7840);
  if (!byte_10033FE20)
    return 0;
  v4 = objc_opt_new(SOSEnginePeerMessageCallBackInfo);
  if (v4)
  {
    engine = self->_engine;
    if (engine)
      CFRetain(self->_engine);
    -[SOSEnginePeerMessageCallBackInfo setEngine:](v4, "setEngine:", engine);
    peer = self->_peer;
    if (peer)
      CFRetain(self->_peer);
    -[SOSEnginePeerMessageCallBackInfo setPeer:](v4, "setPeer:", peer);
    local = self->_local;
    if (local)
      CFRetain(self->_local);
    -[SOSEnginePeerMessageCallBackInfo setLocal:](v4, "setLocal:", local);
    proposed = self->_proposed;
    if (proposed)
      CFRetain(self->_proposed);
    -[SOSEnginePeerMessageCallBackInfo setProposed:](v4, "setProposed:", proposed);
    confirmed = self->_confirmed;
    if (confirmed)
      CFRetain(self->_confirmed);
    -[SOSEnginePeerMessageCallBackInfo setConfirmed:](v4, "setConfirmed:", confirmed);
    message = self->_message;
    if (message)
      CFRetain(self->_message);
    -[SOSEnginePeerMessageCallBackInfo setMessage:](v4, "setMessage:", message);
    -[SOSEnginePeerMessageCallBackInfo setCoder:](v4, "setCoder:", self->_coder);
    -[SOSEnginePeerMessageCallBackInfo setCallbackBlock:](v4, "setCallbackBlock:", self->_callbackBlock);
  }
  return v4;
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)setCallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (__OpaqueSOSEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(__OpaqueSOSEngine *)a3
{
  self->_engine = a3;
}

- (__OpaqueSOSPeer)peer
{
  return self->_peer;
}

- (void)setPeer:(__OpaqueSOSPeer *)a3
{
  self->_peer = a3;
}

- (__OpaqueSOSCoder)coder
{
  return self->_coder;
}

- (__OpaqueSOSManifest)local
{
  return self->_local;
}

- (void)setLocal:(__OpaqueSOSManifest *)a3
{
  self->_local = a3;
}

- (__OpaqueSOSManifest)proposed
{
  return self->_proposed;
}

- (void)setProposed:(__OpaqueSOSManifest *)a3
{
  self->_proposed = a3;
}

- (__OpaqueSOSManifest)confirmed
{
  return self->_confirmed;
}

- (void)setConfirmed:(__OpaqueSOSManifest *)a3
{
  self->_confirmed = a3;
}

- (__OpaqueSOSMessage)message
{
  return self->_message;
}

- (void)setMessage:(__OpaqueSOSMessage *)a3
{
  self->_message = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callbackBlock, 0);
}

@end
