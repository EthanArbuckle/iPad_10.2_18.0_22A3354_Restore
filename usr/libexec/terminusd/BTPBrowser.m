@implementation BTPBrowser

- (BTPBrowser)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 bonjourType:(id)a5
{
  id v9;
  BTPBrowser *v10;
  BTPBrowser *v11;
  uint64_t v12;
  NSMutableDictionary *resolvers;
  BTPBrowser *v14;
  objc_super v16;

  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BTPBrowser;
  v10 = -[BTPBrowser init](&v16, "init");
  v11 = v10;
  if (v10)
  {
    v10->_sdRefBrowse = 0;
    v10->_srcIfIndex = a3;
    v10->_dstIfIndex = a4;
    objc_storeStrong((id *)&v10->_bonjourType, a5);
    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    resolvers = v11->_resolvers;
    v11->_resolvers = (NSMutableDictionary *)v12;

    v14 = v11;
  }
  else
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d super init failed", ", "-[BTPBrowser initWithSrcIfIndex:dstIfIndex:bonjourType:]", 170);
    }
  }

  return v11;
}

- (BOOL)start
{
  _DNSServiceRef_t **p_sdRefBrowse;
  BOOL result;
  uint64_t v5;
  _DNSServiceRef_t *sdRefBrowse;
  BOOL v7;
  DNSServiceErrorType v8;
  DNSServiceErrorType v9;
  _DNSServiceRef_t *v10;

  p_sdRefBrowse = &self->_sdRefBrowse;
  if (self->_sdRefBrowse)
    return 1;
  v5 = DNSServiceBrowse(p_sdRefBrowse, 0, self->_srcIfIndex, -[NSString UTF8String](self->_bonjourType, "UTF8String"), "local", (DNSServiceBrowseReply)sub_1000210AC, self);
  sdRefBrowse = self->_sdRefBrowse;
  if (sdRefBrowse)
    v7 = (_DWORD)v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    if (qword_1001E4590 != -1)
    {
      v10 = self->_sdRefBrowse;
      dispatch_once(&qword_1001E4590, &stru_1001B6418);
      sdRefBrowse = v10;
    }
    v8 = DNSServiceSetDispatchQueue(sdRefBrowse, (dispatch_queue_t)qword_1001E4588);
    if (!v8)
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      if (_NRLogIsLevelEnabled(qword_1001E4578, 2))
      {
        if (qword_1001E4580 != -1)
          dispatch_once(&qword_1001E4580, &stru_1001B63F8);
        _NRLogWithArgs(qword_1001E4578, 2, "%s%.30s:%-4d Successfully started browsing for %@ over %u", ", "-[BTPBrowser start]", 200, self->_bonjourType, self->_srcIfIndex);
      }
      return 1;
    }
    v9 = v8;
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d DNSServiceSetDispatchQueue failed %d", ", "-[BTPBrowser start]", 196, v9);
    }
    -[BTPBrowser stop](self, "stop");
    return 0;
  }
  else
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d DNSServiceBrowse for %@ failed %d", ", "-[BTPBrowser start]", 190, self->_bonjourType, v5);
    }
    result = 0;
    *p_sdRefBrowse = 0;
  }
  return result;
}

- (void)stop
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _DNSServiceRef_t *sdRefBrowse;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_resolvers;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resolvers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), (_QWORD)v10));
        objc_msgSend(v8, "stop");

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  sdRefBrowse = self->_sdRefBrowse;
  if (sdRefBrowse)
  {
    DNSServiceRefDeallocate(sdRefBrowse);
    self->_sdRefBrowse = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_sdRefBrowse)
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d _sdRefBrowse is still active", ", "-[BTPBrowser dealloc]", 218);
    }
    -[BTPBrowser stop](self, "stop");
  }
  v3.receiver = self;
  v3.super_class = (Class)BTPBrowser;
  -[BTPBrowser dealloc](&v3, "dealloc");
}

- (void)handleReplyName:(id)a3 type:(id)a4 domain:(id)a5 ifIndex:(unsigned int)a6 add:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v8;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  BTPResolver *v18;
  BTPResolver *v19;
  id v20;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v20 = a3;
  v12 = a4;
  v13 = a5;
  if (self->_srcIfIndex == (_DWORD)v8)
  {
    if (qword_1001E4580 != -1)
      dispatch_once(&qword_1001E4580, &stru_1001B63F8);
    if (_NRLogIsLevelEnabled(qword_1001E4578, 2))
    {
      if (qword_1001E4580 != -1)
        dispatch_once(&qword_1001E4580, &stru_1001B63F8);
      v14 = "Rmv";
      if (v7)
        v14 = "Add";
      _NRLogWithArgs(qword_1001E4578, 2, "%s%.30s:%-4d browse reply: %s %3u %-20@ %-20@ %@", ", "-[BTPBrowser handleReplyName:type:domain:ifIndex:add:]", 233, v14, v8, v13, v12, v20);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), v20, v12, v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resolvers, "objectForKeyedSubscript:", v15));
    v17 = v16;
    if (v7)
    {

      if (v17)
      {
        if (qword_1001E4580 != -1)
          dispatch_once(&qword_1001E4580, &stru_1001B63F8);
        if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
        {
          if (qword_1001E4580 != -1)
            dispatch_once(&qword_1001E4580, &stru_1001B63F8);
          _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d trying to add already existing resolver for %@", ", "-[BTPBrowser handleReplyName:type:domain:ifIndex:add:]", 237, v15);
        }
      }
      else
      {
        v18 = -[BTPResolver initWithSrcIfIndex:dstIfIndex:name:type:domain:]([BTPResolver alloc], "initWithSrcIfIndex:dstIfIndex:name:type:domain:", self->_srcIfIndex, self->_dstIfIndex, v20, v12, v13);
        v19 = v18;
        if (v18 && -[BTPResolver start](v18, "start"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resolvers, "setObject:forKeyedSubscript:", v19, v15);

      }
    }
    else
    {
      if (v16)
      {
        objc_msgSend(v16, "stop");
        -[NSMutableDictionary removeObjectForKey:](self->_resolvers, "removeObjectForKey:", v15);
      }
      else
      {
        if (qword_1001E4580 != -1)
          dispatch_once(&qword_1001E4580, &stru_1001B63F8);
        if (_NRLogIsLevelEnabled(qword_1001E4578, 16))
        {
          if (qword_1001E4580 != -1)
            dispatch_once(&qword_1001E4580, &stru_1001B63F8);
          _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d trying to remove unknown resolver for %@", ", "-[BTPBrowser handleReplyName:type:domain:ifIndex:add:]", 255, v15);
        }
      }

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
      _NRLogWithArgs(qword_1001E4578, 16, "%s%.30s:%-4d received update with invalid ifIndex %u != %u", ", "-[BTPBrowser handleReplyName:type:domain:ifIndex:add:]", 230, v8, self->_srcIfIndex);
    }
  }

}

- (_DNSServiceRef_t)sdRefBrowse
{
  return self->_sdRefBrowse;
}

- (void)setSdRefBrowse:(_DNSServiceRef_t *)a3
{
  self->_sdRefBrowse = a3;
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

- (NSString)bonjourType
{
  return self->_bonjourType;
}

- (void)setBonjourType:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourType, a3);
}

- (NSMutableDictionary)resolvers
{
  return self->_resolvers;
}

- (void)setResolvers:(id)a3
{
  objc_storeStrong((id *)&self->_resolvers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_bonjourType, 0);
}

@end
