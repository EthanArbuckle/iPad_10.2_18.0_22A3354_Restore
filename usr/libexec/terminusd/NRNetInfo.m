@implementation NRNetInfo

- (void)dealloc
{
  OS_nw_path_evaluator *evaluator;
  objc_super v4;

  if (qword_1001E4528 != -1)
    dispatch_once(&qword_1001E4528, &stru_1001B6248);
  if (_NRLogIsLevelEnabled(qword_1001E4520, 1))
  {
    if (qword_1001E4528 != -1)
      dispatch_once(&qword_1001E4528, &stru_1001B6248);
    _NRLogWithArgs(qword_1001E4520, 1, "%s%.30s:%-4d dealloc", ", "-[NRNetInfo dealloc]", 113);
  }
  if (self)
  {
    self->_invalidated = 1;
    if (self->_evaluator)
    {
      nw_path_evaluator_cancel();
      evaluator = self->_evaluator;
      self->_evaluator = 0;

    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NRNetInfo;
  -[NRNetInfo dealloc](&v4, "dealloc");
}

- (id)description
{
  __CFString *v3;
  id v5;
  unsigned int version;
  unint64_t pathStatus;
  id v8;
  __CFString *v9;
  id v10;
  unsigned int pathFlags;
  NSArray *resolverConfigs;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  const __CFString *v18;
  __CFString *v19;
  const __CFString *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  if (!_NRIsAppleInternal(self))
    return CFSTR("NRNetInfo[<redacted>]");
  if (self)
  {
    if (self->_isIncoming && self->_forcedUpdateIdentifier)
      v3 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR(" (forced:%u)"), self->_forcedUpdateIdentifier);
    else
      v3 = &stru_1001B95A0;
    v5 = objc_alloc((Class)NSMutableString);
    version = self->_version;
    pathStatus = self->_pathStatus;
    if (pathStatus >= 4)
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("unknown(%u)"), self->_pathStatus);
    else
      v8 = *(&off_1001B6268 + pathStatus);
    v9 = CFSTR("other");
    switch(self->_pathInterfaceType)
    {
      case 0u:
        break;
      case 1u:
        v9 = CFSTR("wifi");
        break;
      case 2u:
        v9 = CFSTR("cellular");
        break;
      case 3u:
        v9 = CFSTR("wired");
        break;
      case 4u:
        v9 = CFSTR("loopback");
        break;
      default:
        v9 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("unknown(%u)"), self->_pathInterfaceType);
        break;
    }
  }
  else
  {
    v5 = objc_alloc((Class)NSMutableString);
    v8 = 0;
    version = 0;
    v9 = 0;
    v3 = &stru_1001B95A0;
  }
  v10 = objc_msgSend(v5, "initWithFormat:", CFSTR("NRNetInfo:[v%d%@, %@, %@, "), version, v3, v8, v9);

  if (self)
  {
    pathFlags = self->_pathFlags;
    if ((pathFlags & 1) != 0)
    {
      objc_msgSend(v10, "appendString:", CFSTR("dns, "));
      pathFlags = self->_pathFlags;
      if ((pathFlags & 2) == 0)
      {
LABEL_20:
        if ((pathFlags & 4) == 0)
          goto LABEL_21;
        goto LABEL_46;
      }
    }
    else if ((pathFlags & 2) == 0)
    {
      goto LABEL_20;
    }
    objc_msgSend(v10, "appendString:", CFSTR("ipv4, "));
    pathFlags = self->_pathFlags;
    if ((pathFlags & 4) == 0)
    {
LABEL_21:
      if ((pathFlags & 8) == 0)
        goto LABEL_22;
      goto LABEL_47;
    }
LABEL_46:
    objc_msgSend(v10, "appendString:", CFSTR("ipv6, "));
    pathFlags = self->_pathFlags;
    if ((pathFlags & 8) == 0)
    {
LABEL_22:
      if ((pathFlags & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_48;
    }
LABEL_47:
    objc_msgSend(v10, "appendString:", CFSTR("expensive, "));
    if ((self->_pathFlags & 0x10) == 0)
    {
LABEL_23:
      if (!self->_isImmediate)
      {
LABEL_25:
        if ((self->_pathFlags & 0x20) != 0)
          objc_msgSend(v10, "appendString:", CFSTR("roaming, "));
        if (*(_OWORD *)&self->_estimatedUploadThroughput != 0)
          objc_msgSend(v10, "appendFormat:", CFSTR("%llu/%llu, "), self->_estimatedUploadThroughput, self->_estimatedDownloadThroughput);
        objc_msgSend(v10, "appendString:", CFSTR("["));
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        resolverConfigs = self->_resolverConfigs;
        goto LABEL_30;
      }
LABEL_24:
      objc_msgSend(v10, "appendString:", CFSTR("immediate, "));
      goto LABEL_25;
    }
LABEL_48:
    objc_msgSend(v10, "appendString:", CFSTR("constrained, "));
    if (!self->_isImmediate)
      goto LABEL_25;
    goto LABEL_24;
  }
  objc_msgSend(v10, "appendString:", CFSTR("["));
  resolverConfigs = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
LABEL_30:
  v13 = resolverConfigs;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v10, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  objc_msgSend(v10, "appendString:", CFSTR("]"));
  if (self && self->_wifiSSIDData)
  {
    v18 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", self->_wifiSSIDData, 4);
    v19 = (__CFString *)v18;
    v20 = CFSTR("<unavailable>");
    if (v18)
      v20 = v18;
    objc_msgSend(v10, "appendFormat:", CFSTR(", wifi %@"), v20);

  }
  objc_msgSend(v10, "appendString:", CFSTR("]"));

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolverConfigs, 0);
  objc_storeStrong((id *)&self->_lastSeenDefaultIPv6Addresses, 0);
  objc_storeStrong((id *)&self->_lastSeenDefaultIPv4Addresses, 0);
  objc_storeStrong((id *)&self->_lastFetchedSendData, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wifiSSIDData, 0);
}

@end
