@implementation NRLinkDirectorRequest

- (NRLinkDirectorRequest)init
{
  NRLinkDirectorRequest *v2;
  NRLinkDirectorRequest *v3;
  NSArray *cancelIfLinkTypeReady;
  unint64_t v5;
  id v7;
  int IsLevelEnabled;
  id v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NRLinkDirectorRequest;
  v2 = -[NRLinkDirectorRequest init](&v16, "init");
  if (!v2)
  {
    v7 = sub_1001069E0();
    IsLevelEnabled = _NRLogIsLevelEnabled(v7, 16);

    if (IsLevelEnabled)
    {
      v9 = sub_1001069E0();
      _NRLogWithArgs(v9, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRLinkDirectorRequest init]", 43);

    }
    v10 = _os_log_pack_size(12);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = __error();
    v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "-[NRLinkDirectorRequest init]";
    v14 = sub_1001069E0();
    _NRLogAbortWithPack(v14, v11);
  }
  v3 = v2;
  v2->_requiredLinkType = 0;
  cancelIfLinkTypeReady = v2->_cancelIfLinkTypeReady;
  v2->_cancelIfLinkTypeReady = 0;

  v3->_type = 0;
  v3->_allowsSuspendedLink = 0;
  do
    v5 = __ldxr(&qword_1001E40C0);
  while (__stxr(v5 + 1, &qword_1001E40C0));
  v3->_uniqueIndex = v5;
  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  unint64_t uniqueIndex;
  const char *v6;
  id v7;
  id v8;
  uint64_t requiredLinkType;
  void *StringFromNRLinkType;
  const char *v11;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = v3;
  if (self)
  {
    uniqueIndex = self->_uniqueIndex;
    v6 = "Invalid";
    switch(self->_type)
    {
      case 0u:
        goto LABEL_14;
      case 1u:
        v6 = "UpdateWiFiAddress";
        goto LABEL_14;
      case 2u:
        v6 = "PreferWiFiEnable";
        goto LABEL_14;
      case 3u:
        v6 = "PreferWiFiDisable";
        goto LABEL_14;
      case 4u:
        v6 = "StopWiFi";
        goto LABEL_14;
      case 5u:
        v6 = "SuspendBluetooth";
        goto LABEL_14;
      case 6u:
        v6 = "Timer";
        goto LABEL_14;
      case 7u:
        v6 = "TimerPreferWiFiTimeout";
        goto LABEL_14;
      case 8u:
        v6 = "StopQuickRelay";
        goto LABEL_14;
      case 9u:
        v6 = "PreferWiFiAckEnable";
        goto LABEL_14;
      case 0xAu:
        v6 = "PreferWiFiAckDisable";
        goto LABEL_14;
      case 0xBu:
        v6 = "UpdateAWDLAddress";
        goto LABEL_14;
      default:
        v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("[Request %llu %@"), self->_uniqueIndex, CFSTR("Unknown"));
        requiredLinkType = self->_requiredLinkType;
        if (!self->_requiredLinkType)
          goto LABEL_17;
        goto LABEL_16;
    }
  }
  uniqueIndex = 0;
  v6 = "Invalid";
LABEL_14:
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v6);
  v8 = objc_msgSend(v4, "initWithFormat:", CFSTR("[Request %llu %@"), uniqueIndex, v7);

  if (self)
  {
    requiredLinkType = self->_requiredLinkType;
    if (self->_requiredLinkType)
    {
LABEL_16:
      StringFromNRLinkType = (void *)createStringFromNRLinkType(requiredLinkType);
      objc_msgSend(v8, "appendFormat:", CFSTR(" %@"), StringFromNRLinkType);

    }
LABEL_17:
    if (self->_complete)
      v11 = "C";
    else
      v11 = "Inc";
    objc_msgSend(v8, "appendFormat:", CFSTR(" %somplete"), v11);
    if (self->_attemptImmediately)
      objc_msgSend(v8, "appendString:", CFSTR(" Immediate"));
    if (self->_allowsSuspendedLink)
      objc_msgSend(v8, "appendString:", CFSTR(" AllowsSuspendedLink"));
    if (self->_type == 6)
    {
      objc_msgSend(v8, "appendFormat:", CFSTR(" Timeout %llus"), self->_timeout);
      if (self->_timerDescription)
        objc_msgSend(v8, "appendFormat:", CFSTR(" %@"), self->_timerDescription);
    }
  }
  else
  {
    objc_msgSend(v8, "appendFormat:", CFSTR(" %somplete"), "Inc");
  }
  objc_msgSend(v8, "appendString:", CFSTR("]"));
  return v8;
}

- (void)dealloc
{
  NSObject *source;
  OS_dispatch_source *v4;
  objc_super v5;

  if (qword_1001E4840 != -1)
    dispatch_once(&qword_1001E4840, &stru_1001B7AF0);
  if (_NRLogIsLevelEnabled(qword_1001E4838, 1))
  {
    if (qword_1001E4840 != -1)
      dispatch_once(&qword_1001E4840, &stru_1001B7AF0);
    _NRLogWithArgs(qword_1001E4838, 1, "%s%.30s:%-4d Dealloc: %@", ", "-[NRLinkDirectorRequest dealloc]", 113, self);
  }
  if (self)
  {
    source = self->_source;
    if (source)
    {
      dispatch_source_cancel(source);
      v4 = self->_source;
      self->_source = 0;

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NRLinkDirectorRequest;
  -[NRLinkDirectorRequest dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerDescription, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_cancelIfLinkTypeReady, 0);
}

@end
