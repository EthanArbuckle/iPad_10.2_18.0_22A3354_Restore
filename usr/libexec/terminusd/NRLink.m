@implementation NRLink

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5
{
  NSObject *v9;
  char *v10;
  char *v11;
  NRLink *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  NRLink *v18;
  id v20;
  int IsLevelEnabled;
  id v22;
  id v23;
  int v24;
  id v25;
  int v26;
  id v27;
  int v28;
  id v29;
  int v30;
  id v31;
  int *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  objc_super v36;

  v9 = a3;
  v10 = (char *)a4;
  v11 = (char *)a5;
  if (!v9)
  {
    v20 = sub_10010E0B8();
    IsLevelEnabled = _NRLogIsLevelEnabled(v20, 17);

    if (!IsLevelEnabled)
      goto LABEL_22;
    v22 = sub_10010E0B8();
    _NRLogWithArgs(v22, 17, "%s called with null queue");
LABEL_21:

    v18 = 0;
    goto LABEL_11;
  }
  dispatch_assert_queue_V2(v9);
  if (!v10)
  {
    v23 = sub_10010E0B8();
    v24 = _NRLogIsLevelEnabled(v23, 17);

    if (!v24)
      goto LABEL_22;
    v22 = sub_10010E0B8();
    _NRLogWithArgs(v22, 17, "%s called with null linkDelegate");
    goto LABEL_21;
  }
  if (!v11)
  {
    v25 = sub_10010E0B8();
    v26 = _NRLogIsLevelEnabled(v25, 17);

    if (v26)
    {
      v22 = sub_10010E0B8();
      _NRLogWithArgs(v22, 17, "%s called with null nrUUID");
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if ((_NRIsUUIDNonZero(v11) & 1) == 0)
  {
    v27 = sub_10010E0B8();
    v28 = _NRLogIsLevelEnabled(v27, 17);

    if (v28)
    {
      v22 = sub_10010E0B8();
      _NRLogWithArgs(v22, 17, "called with all-zero nrUUID");
      goto LABEL_21;
    }
LABEL_22:
    v18 = 0;
    goto LABEL_11;
  }
  v36.receiver = self;
  v36.super_class = (Class)NRLink;
  v12 = -[NRLink init](&v36, "init");
  if (v12)
  {
    self = v12;
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeWeak((id *)&self->_linkDelegate, v10);
    objc_storeStrong((id *)&self->_nrUUID, a5);
    *(_WORD *)&self->_state = 1;
    self->_subtype = 0;
    self->_linkMTU = 1500;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
    a5 = sub_10012FFF4((uint64_t)NRDLocalDevice, v13);

    if (a5)
    {
      v14 = (void *)*((_QWORD *)a5 + 16);
      goto LABEL_8;
    }
  }
  else
  {
    v29 = sub_10010E0B8();
    v30 = _NRLogIsLevelEnabled(v29, 16);

    v11 = "-[NRLink initLinkWithQueue:linkDelegate:nrUUID:]";
    if (v30)
    {
      v31 = sub_10010E0B8();
      _NRLogWithArgs(v31, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRLink initLinkWithQueue:linkDelegate:nrUUID:]", 227);

    }
    v9 = _os_log_pack_size(12);
    v10 = (char *)&v35 - (((unint64_t)&v9[1].isa + 7) & 0xFFFFFFFFFFFFFFF0);
    v32 = __error();
    v33 = _os_log_pack_fill(v10, v9, *v32, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v33 = 136446210;
    *(_QWORD *)(v33 + 4) = "-[NRLink initLinkWithQueue:linkDelegate:nrUUID:]";
    v34 = sub_10010E0B8();
    _NRLogAbortWithPack(v34, v10);
  }
  v14 = 0;
LABEL_8:
  v15 = v14;
  self->_hasCompanionDatapath = objc_msgSend(v15, "hasCompanionDatapath");

  v16 = objc_alloc_init((Class)NSMutableArray);
  -[NRLink setPolicyIDs:](self, "setPolicyIDs:", v16);

  do
    v17 = __ldxr(&qword_1001E40D8);
  while (__stxr(v17 + 1, &qword_1001E40D8));
  self->_identifier = v17;
  self = self;

  v18 = self;
LABEL_11:

  return v18;
}

- (id)copyDescriptionInner
{
  id v3;
  void *StringFromNRLinkType;
  void *ShortStringFromNRLinkSubtype;
  id v6;
  void *v7;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("%llu"), -[NRLink identifier](self, "identifier"));
  if (-[NRLink isPrimary](self, "isPrimary"))
    objc_msgSend(v3, "appendString:", CFSTR(", PRIMARY"));
  StringFromNRLinkType = (void *)createStringFromNRLinkType(-[NRLink type](self, "type"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", %@"), StringFromNRLinkType);

  if (-[NRLink subtype](self, "subtype"))
  {
    ShortStringFromNRLinkSubtype = (void *)createShortStringFromNRLinkSubtype(-[NRLink subtype](self, "subtype"));
    objc_msgSend(v3, "appendFormat:", CFSTR("(%@)"), ShortStringFromNRLinkSubtype);

  }
  v6 = sub_10010E200(-[NRLink state](self, "state"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", %@"), v6);

  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    v7 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    objc_msgSend(v3, "appendFormat:", CFSTR(", %@"), v7);

  }
  return v3;
}

- (id)copyDescription
{
  id v3;
  id v4;
  id v5;

  v3 = objc_alloc((Class)NSString);
  v4 = -[NRLink copyDescriptionInner](self, "copyDescriptionInner");
  v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("[%@]"), v4);

  return v5;
}

- (NSString)description
{
  return (NSString *)-[NRLink copyDescription](self, "copyDescription");
}

- (id)copyShortDescriptionInner
{
  id v3;
  unint64_t identifier;
  unsigned int v5;
  void *ShortStringFromNRLinkType;
  unsigned int state;
  __CFString *v8;
  const char *v9;
  id v10;

  v3 = objc_alloc((Class)NSString);
  identifier = self->_identifier;
  v5 = -[NRLink isPrimary](self, "isPrimary");
  ShortStringFromNRLinkType = (void *)createShortStringFromNRLinkType(self->_type);
  state = self->_state;
  if (state == 8)
    v8 = CFSTR("Rdy");
  else
    v8 = (__CFString *)sub_10010E200(state);
  v9 = "";
  if (v5)
    v9 = " P";
  v10 = objc_msgSend(v3, "initWithFormat:", CFSTR("%llu%s %@ %@"), identifier, v9, ShortStringFromNRLinkType, v8);

  return v10;
}

- (id)copyShortDescription
{
  id v3;
  id v4;
  id v5;

  v3 = objc_alloc((Class)NSString);
  v4 = -[NRLink copyShortDescriptionInner](self, "copyShortDescriptionInner");
  v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("[%@]"), v4);

  return v5;
}

- (BOOL)start
{
  return 1;
}

- (BOOL)suspend
{
  return 1;
}

- (BOOL)resume
{
  void *v4;
  int IsLevelEnabled;
  uint64_t v6;
  void *v7;
  id v8;

  if (self->_ikeClassDEstablished || self->_ikeClassCEstablished)
    return 1;
  v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v4, 1);

  if (IsLevelEnabled)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    v8 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v7, 1, "%s%.30s:%-4d %@: Class D/C not yet established. Ignoring 'resume'", ", "-[NRLink resume]", 308, v8);

  }
  return 0;
}

- (unsigned)metric
{
  return -1;
}

- (id)copyStatusString
{
  return (id)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
}

- (BOOL)cancelWithReason:(id)a3
{
  return 1;
}

- (BOOL)sendControlData:(id)a3
{
  return 0;
}

- (void)reportEvent:(unsigned int)a3 details:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
  v7 = -[NRLink copyShortDescription](self, "copyShortDescription");
  sub_100121E18(v8, a3, v7, v6);

}

- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v8);

  -[NRLink reportEvent:details:](self, "reportEvent:details:", v4, v7);
}

- (void)reportEvent:(unsigned int)a3
{
  -[NRLink reportEvent:details:](self, "reportEvent:details:", *(_QWORD *)&a3, 0);
}

- (BOOL)changeStateTo:(unsigned __int8)a3 details:(id)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  NRLink *v8;
  uint64_t v9;
  int state;
  unint64_t linkReadyStartTime;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  id v18;
  unint64_t v19;
  uint64_t v20;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  switch(v4)
  {
    case 8u:
      v8 = self;
      v9 = 3004;
LABEL_7:
      -[NRLink reportEvent:details:](v8, "reportEvent:details:", v9, v7);
      goto LABEL_8;
    case 0xFFu:
      v8 = self;
      v9 = 3005;
      goto LABEL_7;
    case 9u:
      v8 = self;
      v9 = 3002;
      goto LABEL_7;
  }
  if (v6 && objc_msgSend(v6, "length"))
  {
    v18 = sub_10010E200(v4);
    -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3008, CFSTR("Changing state to %@ %@"), v18, v7);
  }
  else
  {
    v18 = sub_10010E200(v4);
    -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3008, CFSTR("Changing state to %@"), v18, v20);
  }

LABEL_8:
  state = self->_state;
  if (state != v4)
  {
    if (state == 8)
    {
      linkReadyStartTime = self->_linkReadyStartTime;
      v12 = mach_absolute_time();
      v15 = 0.0;
      if (linkReadyStartTime)
      {
        v16 = v12 - linkReadyStartTime;
        if (v12 > linkReadyStartTime)
        {
          if (qword_1001E48A8 != -1)
          {
            v19 = v12 - linkReadyStartTime;
            dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
            v16 = v19;
          }
          LODWORD(v13) = dword_1001E48B0;
          LODWORD(v14) = *(_DWORD *)algn_1001E48B4;
          v15 = (double)v16 * (0.000000001 * (double)v13) / (double)v14;
        }
      }
      self->_linkTotalReadyTimeInSec = self->_linkTotalReadyTimeInSec + v15;
    }
    if (v4 == 8)
    {
      self->_linkReadyStartTime = mach_absolute_time();
      -[NRLink setLinkMTU:](self, "setLinkMTU:", 1400);
    }
    else if (v4 == 255 || v4 == 9)
    {
      -[NRLink removePolicies](self, "removePolicies");
      if (v4 == 255 && state == 8 && -[NRLink virtualInterface](self, "virtualInterface"))
        -[NRLink setInterfaceAvailability](self, "setInterfaceAvailability");
    }
    self->_state = v4;
  }

  return state != v4;
}

- (BOOL)changeStateTo:(unsigned __int8)a3 detailsFormat:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v9);

  LOBYTE(v4) = -[NRLink changeStateTo:details:](self, "changeStateTo:details:", v4, v7);
  return v4;
}

- (BOOL)changeStateTo:(unsigned __int8)a3
{
  return -[NRLink changeStateTo:details:](self, "changeStateTo:details:", a3, 0);
}

- (void)setLinkMTU:(unsigned __int16)a3
{
  uint64_t v4;
  unsigned __int16 *v5;
  uint64_t v6;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  unsigned __int16 *v15;

  if (self->_linkMTU != a3 && self->_virtualInterface)
  {
    v4 = a3;
    v5 = (unsigned __int16 *)sub_10012FFF4((uint64_t)NRDLocalDevice, self->_nrUUID);
    if (!v5 || v5[14] < 0xCu)
      goto LABEL_12;
    v15 = v5;
    if (NEVirtualInterfaceSetMTU(self->_virtualInterface, v4))
    {
      self->_linkMTU = v4;
      v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
      IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0);

      v5 = v15;
      if (IsLevelEnabled)
      {
        v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
        v11 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v10, 0, "%s%.30s:%-4d %@: Successfully updated interface mtu to %u", ", "-[NRLink setLinkMTU:]", 444, v11, self->_linkMTU);
LABEL_11:

        v5 = v15;
      }
    }
    else
    {
      v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
      v13 = _NRLogIsLevelEnabled(v12, 17);

      v5 = v15;
      if (v13)
      {
        v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
        v11 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v10, 17, "%@: Failed to update interface mtu to %u", v11, self->_linkMTU);
        goto LABEL_11;
      }
    }
LABEL_12:

  }
}

- (void)dealloc
{
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0);

  if (IsLevelEnabled)
  {
    v6 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
    v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v6, 0, "%s%.30s:%-4d %@: Dealloc", ", "-[NRLink dealloc]", 482, v7);

  }
  -[NRLink invalidateLink](self, "invalidateLink");
  v8.receiver = self;
  v8.super_class = (Class)NRLink;
  -[NRLink dealloc](&v8, "dealloc");
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void)processIKEDisconnection:(unsigned __int8)a3 error:(id)a4
{
  uint64_t v4;
  id v6;
  int state;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id String;
  void *v14;
  unsigned int v15;
  id v16;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    state = self->_state;
    if (state == 8 || state == 9 && self->_type == 1)
    {
      v8 = NEIKEv2ErrorDomain;
      v16 = v6;
      v9 = objc_msgSend(v6, "code") == (id)3;
      v10 = v16;
      if (v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "domain"));
        v12 = objc_msgSend(v11, "isEqualToString:", v8);

        v10 = v16;
        if ((v12 & 1) != 0)
          goto LABEL_10;
      }
      String = v10;
      if (objc_msgSend(String, "code") != (id)4)
      {
LABEL_11:

        v6 = v16;
        goto LABEL_12;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(String, "domain"));
      v15 = objc_msgSend(v14, "isEqualToString:", v8);

      v6 = v16;
      if (v15)
      {
LABEL_10:
        String = (id)NRDataProtectionClassCreateString(v4);
        -[NRLink cancelWithReason:](self, "cancelWithReason:", CFSTR("%@ session disconnected due to no response from peer"), String);
        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

- (void)setIsCompanionLink:(BOOL)a3
{
  self->_isCompanionLink = a3;
}

- (BOOL)setInterfaceRank
{
  int v3;
  void *v4;
  id *v5;
  id v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  NEVirtualInterface_s *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v18;
  int IsLevelEnabled;
  id v20;
  uint64_t v21;
  char *v22;
  int *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;

  if (-[NRLink state](self, "state") != 9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
    v5 = (id *)sub_10012FFF4((uint64_t)NRDLocalDevice, v4);

    if (!v5)
    {
      v18 = sub_10010E0B8();
      IsLevelEnabled = _NRLogIsLevelEnabled(v18, 16);

      if (IsLevelEnabled)
      {
        v20 = sub_10010E0B8();
        _NRLogWithArgs(v20, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)", ", "-[NRLink setInterfaceRank]", 536);

      }
      v21 = _os_log_pack_size(12);
      v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = __error();
      v24 = _os_log_pack_fill(v22, v21, *v23, &_mh_execute_header, "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
      *(_DWORD *)v24 = 136446210;
      *(_QWORD *)(v24 + 4) = "-[NRLink setInterfaceRank]";
      v25 = sub_10010E0B8();
      _NRLogAbortWithPack(v25, v22);
    }
    v6 = v5[16];

    if (v6)
    {
      v7 = v5[16];
      v8 = objc_msgSend(v7, "requiresReachability");

      v9 = -[NRLink isCompanionLink](self, "isCompanionLink");
      v10 = v9;
      if (v8)
      {
        v11 = -[NRLink virtualInterface](self, "virtualInterface");
        if (!v10)
        {
          v12 = NEVirtualInterfaceSetRankPrimaryEligible(v11, 1);
LABEL_15:
          v3 = v12;

          return v3 != 0;
        }
LABEL_12:
        v12 = NEVirtualInterfaceSetRankLast(v11, 1);
        goto LABEL_15;
      }
      if ((v9 & 1) == 0)
      {
        v13 = v5[16];
        if ((objc_msgSend(v13, "hasPoliciesForProxyCriteria") & 1) != 0)
        {
          v14 = v5[16];
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "proxyProviderCriteria"));
          v16 = objc_msgSend(v15, "forwardNonMatchingTraffic");

          if (v16)
          {
            v11 = -[NRLink virtualInterface](self, "virtualInterface");
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
    }
    v12 = NEVirtualInterfaceSetRankNever(-[NRLink virtualInterface](self, "virtualInterface"), 1);
    goto LABEL_15;
  }
  v3 = NEVirtualInterfaceSetRankNever(-[NRLink virtualInterface](self, "virtualInterface"), 1);
  return v3 != 0;
}

- (BOOL)shouldCreateCompanionProxyAgent
{
  char *v2;
  char *v3;
  unsigned __int8 v4;
  id v6;
  int IsLevelEnabled;
  id v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v2 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->_nrUUID);
  if (!v2)
  {
    v6 = sub_10010E0B8();
    IsLevelEnabled = _NRLogIsLevelEnabled(v6, 16);

    if (IsLevelEnabled)
    {
      v8 = sub_10010E0B8();
      _NRLogWithArgs(v8, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)", ", "-[NRLink shouldCreateCompanionProxyAgent]", 580);

    }
    v9 = _os_log_pack_size(12);
    v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = __error();
    v12 = _os_log_pack_fill(v10, v9, *v11, &_mh_execute_header, "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
    *(_DWORD *)v12 = 136446210;
    *(_QWORD *)(v12 + 4) = "-[NRLink shouldCreateCompanionProxyAgent]";
    v13 = sub_10010E0B8();
    _NRLogAbortWithPack(v13, v10);
  }
  v3 = v2;
  v4 = sub_10010E128(v2);

  return v4;
}

- (void)setIkeClassCEstablished:(BOOL)a3
{
  unint64_t ikeClassDEstablishedTime;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  void *v12;
  int IsLevelEnabled;
  uint64_t v14;
  void *v15;
  id v16;
  NSUUID *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  int v22;
  id *v23;

  if (self->_ikeClassCEstablished != a3)
  {
    self->_ikeClassCEstablished = a3;
    if (self->_isPrimary && a3)
    {
      ikeClassDEstablishedTime = self->_ikeClassDEstablishedTime;
      v6 = mach_absolute_time();
      if (ikeClassDEstablishedTime)
      {
        v10 = v6 >= ikeClassDEstablishedTime;
        v11 = v6 - ikeClassDEstablishedTime;
        if (v11 != 0 && v10)
        {
          if (qword_1001E48A8 != -1)
            dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
          LODWORD(v8) = dword_1001E48B0;
          LODWORD(v9) = *(_DWORD *)algn_1001E48B4;
          if ((double)v11 * (0.000000001 * (double)v8) / (double)v9 > 1.0)
          {
            v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
            IsLevelEnabled = _NRLogIsLevelEnabled(v12, 0);

            if (IsLevelEnabled)
            {
              v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
              v16 = -[NRLink copyDescription](self, "copyDescription");
              _NRLogWithArgs(v15, 0, "%s%.30s:%-4d %@: setting interface availability for classC connect event", ", "-[NRLink setIkeClassCEstablished:]", 596, v16);

            }
            objc_opt_self(NRLinkDirector);
            if (qword_1001E4710 != -1)
              dispatch_once(&qword_1001E4710, &stru_1001B6E60);
            v23 = (id *)(id)qword_1001E4708;
            v17 = self->_nrUUID;
            if (!v23)
              goto LABEL_21;
            v18 = sub_10014CFBC();
            dispatch_assert_queue_V2(v18);

            if (v17)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23[25], "objectForKeyedSubscript:", v17));

              if (!v19)
              {
LABEL_21:

                return;
              }
              v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23[25], "objectForKeyedSubscript:", v17));
              sub_1000E2DE4((uint64_t)v20);
            }
            else
            {
              v21 = sub_1000A2640();
              v22 = _NRLogIsLevelEnabled(v21, 17);

              if (!v22)
                goto LABEL_21;
              v20 = sub_1000A2640();
              _NRLogWithArgs(v20, 17, "%s called with null nrUUID", "-[NRLinkDirector setInterfaceAvailabilityForCatchAllInterface:]");
            }

            goto LABEL_21;
          }
        }
      }
    }
  }
}

- (void)setIkeClassDEstablished:(BOOL)a3
{
  uint64_t v4;

  if (self->_ikeClassDEstablished != a3)
  {
    self->_ikeClassDEstablished = a3;
    if (a3)
      v4 = mach_absolute_time();
    else
      v4 = 0;
    self->_ikeClassDEstablishedTime = v4;
  }
}

- (void)setInterfaceAvailability
{
  uint64_t v3;
  void *v4;
  int IsLevelEnabled;
  uint64_t v6;
  id v7;
  id v8;

  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    v8 = (id)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    sub_100109BF4(v8);
  }
  else
  {
    v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v3);
    IsLevelEnabled = _NRLogIsLevelEnabled(v4, 17);

    if (!IsLevelEnabled)
      return;
    v8 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v8, 17, "%@: Attempting to set interface availability on a link with no interface", v7);

  }
}

- (BOOL)setInterfaceSubfamily
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  int v6;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  id v10;
  char v11;

  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    v4 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    v5 = -[NRLink type](self, "type");
    if (v5 > 5)
      v6 = 2;
    else
      v6 = dword_10015D064[v5];
    v11 = sub_100108088(v4, v6);
  }
  else
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v3);
    IsLevelEnabled = _NRLogIsLevelEnabled(v7, 17);

    if (!IsLevelEnabled)
      return 0;
    v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
    v10 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v4, 17, "%@: No interface to set interface sub-family", v10);

    v11 = 0;
  }

  return v11;
}

- (BOOL)setInterfacePeerEgressFunctionalType:(unsigned int)a3
{
  const char *v3;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  int IsLevelEnabled;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;

  v3 = *(const char **)&a3;
  if (!-[NRLink virtualInterface](self, "virtualInterface"))
  {
    v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17);

    if (IsLevelEnabled)
    {
      v6 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v6, 17, "%@: No interface to set interface sub-family", v11);
LABEL_8:

      v7 = 0;
      goto LABEL_9;
    }
    return 0;
  }
  if (!(_DWORD)v3)
  {
    v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
    v13 = _NRLogIsLevelEnabled(v12, 1);

    if (v13)
    {
      v6 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
      v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v6, 1, "%s%.30s:%-4d %@: Unsupported link type in trying to set the peer egress type.", ", "-[NRLink setInterfacePeerEgressFunctionalType:]", 652, v11);
      goto LABEL_8;
    }
    return 0;
  }
  v6 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
  v7 = sub_100108458(v6, v3);
LABEL_9:

  return v7;
}

- (BOOL)setNoACKPrioritization
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  int IsLevelEnabled;
  uint64_t v8;
  id v9;

  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    v4 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    v5 = sub_1001088C8(v4);
  }
  else
  {
    v6 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v3);
    IsLevelEnabled = _NRLogIsLevelEnabled(v6, 17);

    if (!IsLevelEnabled)
      return 0;
    v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v8);
    v9 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v4, 17, "%@: No interface to set interface no ack prioritization", v9);

    v5 = 0;
  }

  return v5;
}

- (void)setPowerAssertionState:(BOOL)a3
{
  id v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int IsLevelEnabled;
  uint64_t v13;
  void *v14;
  id v15;
  IOPMAssertionID powerAssertion;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  id v24;
  int v25;
  uint64_t v26;
  void *v27;
  id v28;
  int v29;
  uint64_t v30;
  void *v31;
  id v32;
  __CFString *AssertionName;

  if (a3)
  {
    if (!self || !self->_powerAssertion)
    {
      v4 = objc_alloc((Class)NSString);
      v5 = (objc_class *)objc_opt_class(self);
      v6 = NSStringFromClass(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      AssertionName = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@:[%llu]"), v7, -[NRLink identifier](self, "identifier"));

      v8 = IOPMAssertionCreateWithName(CFSTR("NoIdleSleepAssertion"), 0xFFu, AssertionName, &self->_powerAssertion);
      v10 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
      v11 = (void *)v10;
      if ((_DWORD)v8)
      {
        IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17);

        if (IsLevelEnabled)
        {
          v14 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v13);
          v15 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v14, 17, "%@: Failed to take power assertion: %d", v15, v8);

        }
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3301, CFSTR("Error: %d"), v8);
        self->_powerAssertion = 0;
      }
      else
      {
        v29 = _NRLogIsLevelEnabled(v10, 0);

        if (v29)
        {
          v31 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v30);
          v32 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v31, 0, "%s%.30s:%-4d %@: Successfully took power assertion", ", "-[NRLink setPowerAssertionState:]", 697, v32);

        }
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3300, CFSTR("id: %u"), self->_powerAssertion);
      }

    }
  }
  else if (self)
  {
    powerAssertion = self->_powerAssertion;
    if (powerAssertion)
    {
      v17 = IOPMAssertionRelease(powerAssertion);
      v19 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v18);
      v20 = (void *)v19;
      if ((_DWORD)v17)
      {
        v21 = _NRLogIsLevelEnabled(v19, 17);

        if (v21)
        {
          v23 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
          v24 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v23, 17, "%@: Failed to release power assertion: %d", v24, v17);

        }
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3303, CFSTR("Error: %d"), v17);
      }
      else
      {
        v25 = _NRLogIsLevelEnabled(v19, 0);

        if (v25)
        {
          v27 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v26);
          v28 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v27, 0, "%s%.30s:%-4d %@: Successfully released power assertion", ", "-[NRLink setPowerAssertionState:]", 710, v28);

        }
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3302, CFSTR("id: %u"), self->_powerAssertion);
      }
      self->_powerAssertion = 0;
    }
  }
}

- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3
{
  void *v4;
  int IsLevelEnabled;
  uint64_t v6;
  id v7;
  id v8;

  v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v4, 1);

  if (IsLevelEnabled)
  {
    v8 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v8, 1, "%s%.30s:%-4d %@: peer availability check is unsupported", ", "-[NRLink checkPeerAvailabilityWithForceAggressive:]", 720, v7);

  }
}

- (BOOL)publishDNSConfig:(id)a3
{
  id v4;
  NEVirtualInterface_s *v5;
  NEVirtualInterface_s *v6;
  void *v7;
  NEVirtualInterface_s *v8;
  void *v9;
  BOOL v10;
  void *v12;

  v4 = a3;
  if (-[NRLink virtualInterface](self, "virtualInterface") && -[NRLink state](self, "state") == 8)
  {
    v5 = -[NRLink virtualInterface](self, "virtualInterface");
    v6 = v5;
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostname"));
      v12 = v7;
      NEVirtualInterfaceSetDNSServers(v6, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

      v8 = -[NRLink virtualInterface](self, "virtualInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "port"));
      NEVirtualInterfaceSetDNSPort(v8, objc_msgSend(v9, "intValue"));

    }
    else
    {
      NEVirtualInterfaceSetDNSServers(v5, 0);
      NEVirtualInterfaceSetDNSPort(-[NRLink virtualInterface](self, "virtualInterface"), 0);
    }
    NEVirtualInterfaceUpdateAdHocService(-[NRLink virtualInterface](self, "virtualInterface"));
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)updateIKEv2Role:(BOOL *)a3
{
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  id v18;
  unsigned __int8 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int IsLevelEnabled;
  void *v24;
  uint64_t v25;
  void *v26;
  char *v27;

  v27 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->_nrUUID);
  -[NRLink setIkev2Role:](self, "setIkev2Role:", sub_10010DF88(v27));
  v5 = -[NRLink ikev2Role](self, "ikev2Role");
  v6 = -[NRLink ikev2Role](self, "ikev2Role");
  v7 = v6 == 1;
  if (v5 != 2 && v6 != 1)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[NRLink peerToken](self, "peerToken"));
    if (v8
      && (v9 = (void *)v8,
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localToken](self, "localToken")),
          v10,
          v9,
          v10))
    {
      v11 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NRLink localToken](self, "localToken"));
      v12 = (id)objc_claimAutoreleasedReturnValue(-[NRLink peerToken](self, "peerToken"));
    }
    else
    {
      if (v27)
        v13 = (void *)*((_QWORD *)v27 + 6);
      else
        v13 = 0;
      v14 = v13;

      if (!v14)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
        v22 = (void *)_NRCopyLogObjectForNRUUID(v20, v21);
        IsLevelEnabled = _NRLogIsLevelEnabled(v22, 17);

        if (IsLevelEnabled)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
          v26 = (void *)_NRCopyLogObjectForNRUUID(v24, v25);
          _NRLogWithArgs(v26, 17, "failed to determine ikev2 role");

        }
        v19 = 1;
        v7 = 1;
        goto LABEL_20;
      }
      objc_opt_self(NRLinkDirector);
      if (qword_1001E4710 != -1)
        dispatch_once(&qword_1001E4710, &stru_1001B6E60);
      v15 = (id)qword_1001E4708;
      v11 = sub_1000AFE70(v15, 0);

      if (v27)
        v16 = (void *)*((_QWORD *)v27 + 6);
      else
        v16 = 0;
      v12 = v16;
    }
    v17 = v12;
    v18 = objc_msgSend(v11, "compare:", v12);

    v7 = v18 == (id)-1;
    if (v18 == (id)-1)
      v19 = 1;
    else
      v19 = 2;
LABEL_20:
    -[NRLink setIkev2Role:](self, "setIkev2Role:", v19);
  }
  if (a3)
    *a3 = v7;

}

- (void)removePolicies
{
  NSMutableArray *policyIDs;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int IsLevelEnabled;
  uint64_t v22;
  id v23;
  id v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  int v36;
  uint64_t v37;
  char *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  policyIDs = self->_policyIDs;
  if (!policyIDs || !-[NSMutableArray count](policyIDs, "count"))
  {
    v20 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
    IsLevelEnabled = _NRLogIsLevelEnabled(v20, 0);

    if (!IsLevelEnabled)
      return;
    v39 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
    v23 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v39, 0, "%s%.30s:%-4d %@: No policies to remove", ", "-[NRLink removePolicies]", 815, v23);
    goto LABEL_22;
  }
  if (!self->_policyIdentifierString)
  {
    v35 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
    v36 = _NRLogIsLevelEnabled(v35, 17);

    if (!v36)
      return;
    v39 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v37);
    v23 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v39, 17, "%@: Invalid policy identifier string", v23);
LABEL_22:

    return;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = self->_policyIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "unsignedIntegerValue"))
        {
          objc_opt_self(NRDPolicySessionManager);
          if (qword_1001E4A20 != -1)
            dispatch_once(&qword_1001E4A20, &stru_1001B8590);
          v11 = (id)qword_1001E4A18;
          sub_10012742C((uint64_t)v11, self->_policyIdentifierString, v9);
          goto LABEL_12;
        }
        v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
        v13 = _NRLogIsLevelEnabled(v12, 16);

        if (v13)
        {
          v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
          v16 = -[NRLink copyDescription](self, "copyDescription");
          v38 = "";
          _NRLogWithArgs(v15, 16, "%s%.30s:%-4d %@: found invalid policyID %@ with session %@");

        }
        v17 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
        v18 = _NRLogIsLevelEnabled(v17, 17);

        if (v18)
        {
          v11 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v19);
          v38 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v11, 17, "%@: Found invalid policyID %@");

LABEL_12:
          continue;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v6);
  }

  objc_opt_self(NRDPolicySessionManager);
  if (qword_1001E4A20 != -1)
    dispatch_once(&qword_1001E4A20, &stru_1001B8590);
  v24 = (id)qword_1001E4A18;
  v25 = (id *)v24;
  if (v24)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v24 + 1));
    if ((objc_msgSend(v25[2], "apply") & 1) == 0)
      sub_100109270(CFSTR("NRPolicySessionManager"), CFSTR("ApplyPolicy Failed"), 0, 1, CFSTR("Failed to apply policies"), v26, v27, v28, (uint64_t)v38);
  }

  -[NSMutableArray removeAllObjects](self->_policyIDs, "removeAllObjects");
  *(_WORD *)&self->_hasRouteRulePolicy = 0;
  self->_hasClassDPolicies = 0;
  v30 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v29);
  v31 = _NRLogIsLevelEnabled(v30, 0);

  if (v31)
  {
    v33 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v32);
    v34 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v33, 0, "%s%.30s:%-4d %@: Removed all policies", ", "-[NRLink removePolicies]", 813, v34);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (BOOL)ikeClassCEstablished
{
  return self->_ikeClassCEstablished;
}

- (BOOL)ikeClassDEstablished
{
  return self->_ikeClassDEstablished;
}

- (double)linkTotalReadyTimeInSec
{
  return self->_linkTotalReadyTimeInSec;
}

- (BOOL)peerAvailabilityCheckInProgress
{
  return self->_peerAvailabilityCheckInProgress;
}

- (BOOL)isCompanionLink
{
  return self->_isCompanionLink;
}

- (NSString)peerToken
{
  return self->_peerToken;
}

- (void)setPeerToken:(id)a3
{
  objc_storeStrong((id *)&self->_peerToken, a3);
}

- (NSString)localToken
{
  return self->_localToken;
}

- (void)setLocalToken:(id)a3
{
  objc_storeStrong((id *)&self->_localToken, a3);
}

- (unsigned)ikev2Role
{
  return self->_ikev2Role;
}

- (BOOL)hasCompanionDatapath
{
  return self->_hasCompanionDatapath;
}

- (NSString)localInterfaceName
{
  return self->_localInterfaceName;
}

- (NWAddressEndpoint)localOuterEndpoint
{
  return self->_localOuterEndpoint;
}

- (NWAddressEndpoint)remoteOuterEndpoint
{
  return self->_remoteOuterEndpoint;
}

- (BOOL)noTransport
{
  return self->_noTransport;
}

- (void)setNoTransport:(BOOL)a3
{
  self->_noTransport = a3;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)suspendWhenReady
{
  return self->_suspendWhenReady;
}

- (void)setSuspendWhenReady:(BOOL)a3
{
  self->_suspendWhenReady = a3;
}

- (BOOL)hasRouteRulePolicy
{
  return self->_hasRouteRulePolicy;
}

- (void)setHasRouteRulePolicy:(BOOL)a3
{
  self->_hasRouteRulePolicy = a3;
}

- (BOOL)hasClassCPolicies
{
  return self->_hasClassCPolicies;
}

- (void)setHasClassCPolicies:(BOOL)a3
{
  self->_hasClassCPolicies = a3;
}

- (BOOL)hasClassDPolicies
{
  return self->_hasClassDPolicies;
}

- (void)setHasClassDPolicies:(BOOL)a3
{
  self->_hasClassDPolicies = a3;
}

- (NWNetworkAgentRegistration)proxyAgentRegistration
{
  return self->_proxyAgentRegistration;
}

- (void)setProxyAgentRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAgentRegistration, a3);
}

- (OS_nw_proxy_config)publishedMasqueProxyConfig
{
  return self->_publishedMasqueProxyConfig;
}

- (void)setPublishedMasqueProxyConfig:(id)a3
{
  objc_storeStrong((id *)&self->_publishedMasqueProxyConfig, a3);
}

- (NEVirtualInterface_s)virtualInterface
{
  return self->_virtualInterface;
}

- (NSMutableArray)policyIDs
{
  return self->_policyIDs;
}

- (void)setPolicyIDs:(id)a3
{
  objc_storeStrong((id *)&self->_policyIDs, a3);
}

- (NSMutableArray)appSvcPolicyIDs
{
  return self->_appSvcPolicyIDs;
}

- (void)setAppSvcPolicyIDs:(id)a3
{
  objc_storeStrong((id *)&self->_appSvcPolicyIDs, a3);
}

- (NSString)policyIdentifierString
{
  return self->_policyIdentifierString;
}

- (void)setPolicyIdentifierString:(id)a3
{
  objc_storeStrong((id *)&self->_policyIdentifierString, a3);
}

- (BOOL)startRequested
{
  return self->_startRequested;
}

- (unsigned)linkMTU
{
  return self->_linkMTU;
}

- (NSUUID)nrUUID
{
  return self->_nrUUID;
}

- (NRLinkDelegate)linkDelegate
{
  return (NRLinkDelegate *)objc_loadWeakRetained((id *)&self->_linkDelegate);
}

- (NRCompanionProxyAgent)companionProxyAgent
{
  return self->_companionProxyAgent;
}

- (NSUUID)proxyAgentUUID
{
  return self->_proxyAgentUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedProxyNotifyPayload, 0);
  objc_storeStrong((id *)&self->_policyIdentifierString, 0);
  objc_storeStrong((id *)&self->_appSvcPolicyIDs, 0);
  objc_storeStrong((id *)&self->_policyIDs, 0);
  objc_storeStrong((id *)&self->_publishedMasqueProxyConfig, 0);
  objc_storeStrong((id *)&self->_proxyAgentRegistration, 0);
  objc_storeStrong((id *)&self->_localToken, 0);
  objc_storeStrong((id *)&self->_peerToken, 0);
  objc_storeStrong((id *)&self->_proxyAgentUUID, 0);
  objc_storeStrong((id *)&self->_companionProxyAgent, 0);
  objc_storeStrong((id *)&self->_remoteOuterEndpoint, 0);
  objc_storeStrong((id *)&self->_localOuterEndpoint, 0);
  objc_destroyWeak((id *)&self->_linkDelegate);
  objc_storeStrong((id *)&self->_localInterfaceName, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLocalOuterEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_localOuterEndpoint, a3);
}

- (void)setRemoteOuterEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_remoteOuterEndpoint, a3);
}

- (void)setLocalInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_localInterfaceName, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (void)setSubtype:(unsigned __int8)a3
{
  self->_subtype = a3;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (void)setNrUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nrUUID, a3);
}

- (void)setStartRequested:(BOOL)a3
{
  self->_startRequested = a3;
}

- (void)setLinkDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_linkDelegate, a3);
}

- (void)setVirtualInterface:(NEVirtualInterface_s *)a3
{
  self->_virtualInterface = a3;
}

- (void)setIkev2Role:(unsigned __int8)a3
{
  self->_ikev2Role = a3;
}

- (void)invalidateLink
{
  id *v3;
  NRLink *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char *v18;
  __objc2_prot *v19;
  id v20;
  id v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *v24;
  id v25;
  id v26;
  int IsLevelEnabled;
  id v28;
  int *v29;
  uint64_t v30;
  id v31;
  NRLink *v32;
  _QWORD v33[4];
  char *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  objc_storeWeak((id *)&self->_linkDelegate, 0);
  *(_WORD *)&self->_ikeClassCEstablished = 0;
  -[NRLink unregisterProxyAgent](self, "unregisterProxyAgent");
  -[NRLink setPowerAssertionState:](self, "setPowerAssertionState:", 0);
  objc_opt_self(NRIKEv2Listener);
  if (qword_1001E44D8 != -1)
    dispatch_once(&qword_1001E44D8, &stru_1001B5E70);
  v3 = (id *)(id)qword_1001E44D0;
  v4 = self;
  if (!v3)
    goto LABEL_24;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = v3[3];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v6)
  {
    v16 = v5;
    goto LABEL_23;
  }
  v7 = v6;
  v32 = v4;
  v8 = *(_QWORD *)v38;
LABEL_7:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v38 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3[3], "objectForKeyedSubscript:", v10, v32));
    v12 = (void *)v11;
    if (!v11)
      goto LABEL_9;
    v13 = (uint64_t)v3;
    v14 = *(id *)(v11 + 24);
    v15 = objc_msgSend(v14, "identifier");
    if (v15 == (id)-[NRLink identifier](v32, "identifier"))
      break;

    v3 = (id *)v13;
LABEL_9:

    if (v7 == (id)++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v7)
        goto LABEL_7;
      v16 = v5;
      v4 = v32;
      goto LABEL_23;
    }
  }
  v16 = v10;

  v4 = v32;
  v3 = (id *)v13;
  if (!v16)
    goto LABEL_24;
  objc_msgSend(*(id *)(v13 + 24), "setObject:forKeyedSubscript:", 0, v16);
  if (qword_1001E44E8 != -1)
    dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
  if (_NRLogIsLevelEnabled(qword_1001E44E0, 0))
  {
    if (qword_1001E44E8 != -1)
      dispatch_once(&qword_1001E44E8, &stru_1001B5EE0);
    _NRLogWithArgs(qword_1001E44E0, 0, "%s%.30s:%-4d Successfully un-registered link %@", ", "-[NRIKEv2Listener unregisterLink:]", 465, v32);
  }
  sub_10000F2C4(v13);
LABEL_23:

LABEL_24:
  if (-[NRLink virtualInterface](v4, "virtualInterface"))
  {
    v17 = NEVirtualInterfaceCopyName(-[NRLink virtualInterface](v4, "virtualInterface"));
    if (v17)
    {
      v18 = (char *)v17;
      v19 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
      if (qword_1001E4980 == -1)
        goto LABEL_27;
    }
    else
    {
      v26 = sub_10010E0B8();
      IsLevelEnabled = _NRLogIsLevelEnabled(v26, 16);

      if (IsLevelEnabled)
      {
        v28 = sub_10010E0B8();
        _NRLogWithArgs(v28, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (interfaceName) != ((void *)0)", ", "-[NRLink(NRLinkProtected) invalidateLink]", 912);

      }
      v19 = (__objc2_prot *)_os_log_pack_size(12);
      v18 = (char *)&v33[-1] - ((__chkstk_darwin(v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = __error();
      v30 = _os_log_pack_fill(v18, v19, *v29, &_mh_execute_header, "%{public}s Assertion Failed: (interfaceName) != ((void *)0)");
      *(_DWORD *)v30 = 136446210;
      *(_QWORD *)(v30 + 4) = "-[NRLink(NRLinkProtected) invalidateLink]";
      v31 = sub_10010E0B8();
      _NRLogAbortWithPack(v31, v18);
    }
    dispatch_once(&qword_1001E4980, &stru_1001B7E98);
LABEL_27:
    if (_NRLogIsLevelEnabled(qword_1001E4978, 1))
    {
      if (v19[33].inst_props != (__objc2_prop_list *)-1)
        dispatch_once(&qword_1001E4980, &stru_1001B7E98);
      _NRLogWithArgs(qword_1001E4978, 1, "%s%.30s:%-4d Attempting to start interface leak monitor for %@", ", "-[NRLink(NRLinkProtected) invalidateLink]", 914, v18);
    }
    v20 = sub_100108C98(v18);
    if (v20)
    {
      v21 = objc_msgSend((id)objc_opt_class(v4), "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = dispatch_time(0, 5000000000);
      v24 = objc_claimAutoreleasedReturnValue(-[NRLink queue](v4, "queue"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1001117A8;
      v33[3] = &unk_1001B87A0;
      v34 = v18;
      v35 = v20;
      v36 = v22;
      v25 = v22;
      dispatch_after(v23, v24, v33);

    }
  }
}

- (void)invalidateVirtualInterface
{
  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    CFRelease(-[NRLink virtualInterface](self, "virtualInterface"));
    -[NRLink setVirtualInterface:](self, "setVirtualInterface:", 0);
  }
}

- (void)invalidateIKESession:(id *)a3
{
  void *v5;
  int IsLevelEnabled;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id location;

  if (*a3)
  {
    v5 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
    IsLevelEnabled = _NRLogIsLevelEnabled(v5, 0);

    if (IsLevelEnabled)
    {
      v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
      v9 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v8, 0, "%s%.30s:%-4d %@: Invalidating IKE Session %@", ", "-[NRLink(NRLinkProtected) invalidateIKESession:]", 953, v9, *a3);

    }
    objc_initWeak(&location, *a3);
    v10 = objc_msgSend((id)objc_opt_class(self), "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_time(0, 5000000000);
    v13 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001116E8;
    block[3] = &unk_1001B87F0;
    objc_copyWeak(&v18, &location);
    v14 = v11;
    v17 = v14;
    dispatch_after(v12, v13, block);

    objc_msgSend(*a3, "setStateUpdateBlock:", 0);
    objc_msgSend(*a3, "setChildStateUpdateBlock:", 0);
    objc_msgSend(*a3, "setConfigurationUpdateBlock:", 0);
    objc_msgSend(*a3, "setTrafficSelectorUpdateBlock:", 0);
    objc_msgSend(*a3, "setAdditionalAddressesUpdateBlock:", 0);
    objc_msgSend(*a3, "setShortDPDEventBlock:", 0);
    objc_msgSend(*a3, "setRedirectEventBlock:", 0);
    objc_msgSend(*a3, "setPrivateNotifyStatusEvent:", 0);
    objc_msgSend(*a3, "disconnect");
    objc_msgSend(*a3, "invalidate");
    v15 = *a3;
    *a3 = 0;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  if (a3 == 3)
  {
    -[NRLink setIkeClassCEstablished:](self, "setIkeClassCEstablished:", 0);
  }
  else if (a3 == 4)
  {
    -[NRLink setIkeClassDEstablished:](self, "setIkeClassDEstablished:", 0);
  }
}

- (void)unregisterProxyAgent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSUUID *proxyAgentUUID;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink proxyAgentRegistration](self, "proxyAgentRegistration"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink proxyAgentRegistration](self, "proxyAgentRegistration"));
    objc_msgSend(v4, "unregisterNetworkAgent");

    -[NRLink setProxyAgentRegistration:](self, "setProxyAgentRegistration:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink publishedMasqueProxyConfig](self, "publishedMasqueProxyConfig"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink publishedMasqueProxyConfig](self, "publishedMasqueProxyConfig"));
    nw_proxy_config_unpublish(v6);

    -[NRLink setPublishedMasqueProxyConfig:](self, "setPublishedMasqueProxyConfig:", 0);
  }
  proxyAgentUUID = self->_proxyAgentUUID;
  self->_proxyAgentUUID = 0;

}

- (BOOL)setupVirtualInterface
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  NEVirtualInterface_s *v10;
  void *v11;
  uint64_t v12;
  NEVirtualInterface_s *v13;
  void *v14;
  uint64_t v15;
  NEVirtualInterface_s *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NEVirtualInterface_s *v20;
  void *v21;
  uint64_t v22;
  NEVirtualInterface_s *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NEVirtualInterface_s *v27;
  void *v28;
  void *v29;
  int IsLevelEnabled;
  uint64_t v31;
  id v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  int v63;
  uint64_t v64;
  NEVirtualInterface_s *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  int v76;
  uint64_t v77;
  id v78;
  int v79;
  id v80;
  uint64_t v81;
  char *v82;
  int *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;

  if (!-[NRLink virtualInterface](self, "virtualInterface")
    && -[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    -[NRLink setVirtualInterface:](self, "setVirtualInterface:", sub_100111240(v3));

    if (!-[NRLink virtualInterface](self, "virtualInterface"))
    {
      v29 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
      IsLevelEnabled = _NRLogIsLevelEnabled(v29, 16);

      if (!IsLevelEnabled)
        return 0;
      v9 = (char *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v31);
      v32 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v9, 16, "%s%.30s:%-4d %@: failed to setup interface", ", "-[NRLink(NRLinkProtected) setupVirtualInterface]", 1009, v32);

      goto LABEL_51;
    }
    if (-[NRLink setInterfaceSubfamily](self, "setInterfaceSubfamily"))
    {
      if (-[NRLink setNoACKPrioritization](self, "setNoACKPrioritization"))
      {
        if (-[NRLink setInterfaceRank](self, "setInterfaceRank"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
          v9 = sub_10012FFF4((uint64_t)NRDLocalDevice, v8);

          if (!v9)
          {
            v78 = sub_10010E0B8();
            v79 = _NRLogIsLevelEnabled(v78, 16);

            if (v79)
            {
              v80 = sub_10010E0B8();
              _NRLogWithArgs(v80, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)", ", "-[NRLink(NRLinkProtected) setupVirtualInterface]", 1030);

            }
            v81 = _os_log_pack_size(12);
            v82 = (char *)&v86 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0);
            v83 = __error();
            v84 = _os_log_pack_fill(v82, v81, *v83, &_mh_execute_header, "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
            *(_DWORD *)v84 = 136446210;
            *(_QWORD *)(v84 + 4) = "-[NRLink(NRLinkProtected) setupVirtualInterface]";
            v85 = sub_10010E0B8();
            _NRLogAbortWithPack(v85, v82);
          }
          v10 = -[NRLink virtualInterface](self, "virtualInterface");
          v11 = (void *)sub_10013D1BC(v9);
          LODWORD(v10) = NEVirtualInterfaceAddAddress(v10, v11, CFSTR("ffff:ffff:ffff:ffff::"));

          if ((_DWORD)v10)
          {
            v13 = -[NRLink virtualInterface](self, "virtualInterface");
            v14 = (void *)sub_10013D220(v9);
            LODWORD(v13) = NEVirtualInterfaceAddAddress(v13, v14, CFSTR("ffff:ffff:ffff:ffff::"));

            if ((_DWORD)v13)
            {
              v16 = -[NRLink virtualInterface](self, "virtualInterface");
              v17 = (void *)sub_10013D52C(v9);
              LODWORD(v16) = NEVirtualInterfaceAddAddress(v16, v17, CFSTR("ffff:ffff:ffff:ffff::"));

              if ((_DWORD)v16)
              {
                if (NEVirtualInterfaceAddAddress(-[NRLink virtualInterface](self, "virtualInterface"), CFSTR("192.0.0.6"), CFSTR("255.255.255.255")))
                {
                  v20 = -[NRLink virtualInterface](self, "virtualInterface");
                  v21 = (void *)sub_10013D284(v9);
                  LODWORD(v20) = NEVirtualInterfaceAddIPv6Route(v20, v21, &off_1001C48B8, 0, 0);

                  if ((_DWORD)v20)
                  {
                    v23 = -[NRLink virtualInterface](self, "virtualInterface");
                    v24 = (void *)sub_10013D2E8(v9);
                    LODWORD(v23) = NEVirtualInterfaceAddIPv6Route(v23, v24, &off_1001C48B8, 0, 0);

                    if ((_DWORD)v23)
                    {
                      v26 = objc_opt_class(NRLinkFixedInterface);
                      if ((objc_opt_isKindOfClass(self, v26) & 1) != 0)
                      {
                        v27 = -[NRLink virtualInterface](self, "virtualInterface");
                        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
                        NEVirtualInterfaceSetDelegateInterface(v27, v28);

                        NEVirtualInterfaceSetRankNever(-[NRLink virtualInterface](self, "virtualInterface"), 1);
                      }
                      else if (-[NRLink type](self, "type") == 5)
                      {
                        v65 = -[NRLink virtualInterface](self, "virtualInterface");
                        v66 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
                        NEVirtualInterfaceSetDelegateInterface(v65, v66);

                      }
                      if (NEVirtualInterfaceUpdateAdHocService(-[NRLink virtualInterface](self, "virtualInterface")))
                      {
                        v68 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
                        v70 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v69);
                        v71 = _NRLogIsLevelEnabled(v70, 0);

                        if (v71)
                        {
                          v73 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v72);
                          v74 = -[NRLink copyDescription](self, "copyDescription");
                          _NRLogWithArgs(v73, 0, "%s%.30s:%-4d %@: Created virtual interface %@", ", "-[NRLink(NRLinkProtected) setupVirtualInterface]", 1074, v74, v68);

                        }
                        goto LABEL_45;
                      }
                      v75 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v67);
                      v76 = _NRLogIsLevelEnabled(v75, 17);

                      if (!v76)
                        goto LABEL_50;
                      v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v77);
                      v49 = -[NRLink copyDescription](self, "copyDescription");
                      _NRLogWithArgs(v48, 17, "%@: failed to update ad-hoc service", v49);
                      goto LABEL_49;
                    }
                    v62 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v25);
                    v63 = _NRLogIsLevelEnabled(v62, 17);

                    if (v63)
                    {
                      v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v64);
                      v49 = -[NRLink copyDescription](self, "copyDescription");
                      _NRLogWithArgs(v48, 17, "%@: failed to add ClassC route", v49);
                      goto LABEL_49;
                    }
LABEL_50:
                    -[NRLink invalidateVirtualInterface](self, "invalidateVirtualInterface");
LABEL_51:

                    return 0;
                  }
                  v59 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
                  v60 = _NRLogIsLevelEnabled(v59, 17);

                  if (!v60)
                    goto LABEL_50;
                  v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v61);
                  v49 = -[NRLink copyDescription](self, "copyDescription");
                  _NRLogWithArgs(v48, 17, "%@: failed to add ClassD route", v49);
                }
                else
                {
                  v56 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v19);
                  v57 = _NRLogIsLevelEnabled(v56, 17);

                  if (!v57)
                    goto LABEL_50;
                  v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v58);
                  v49 = -[NRLink copyDescription](self, "copyDescription");
                  _NRLogWithArgs(v48, 17, "%@: failed to add bogus IPv4 address", v49);
                }
              }
              else
              {
                v53 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v18);
                v54 = _NRLogIsLevelEnabled(v53, 17);

                if (!v54)
                  goto LABEL_50;
                v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v55);
                v49 = -[NRLink copyDescription](self, "copyDescription");
                _NRLogWithArgs(v48, 17, "%@: failed to add link-local address", v49);
              }
            }
            else
            {
              v50 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v15);
              v51 = _NRLogIsLevelEnabled(v50, 17);

              if (!v51)
                goto LABEL_50;
              v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v52);
              v49 = -[NRLink copyDescription](self, "copyDescription");
              _NRLogWithArgs(v48, 17, "%@: failed to add ClassC address", v49);
            }
          }
          else
          {
            v45 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v12);
            v46 = _NRLogIsLevelEnabled(v45, 17);

            if (!v46)
              goto LABEL_50;
            v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v47);
            v49 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v48, 17, "%@: failed to add ClassD address", v49);
          }
LABEL_49:

          goto LABEL_50;
        }
        v42 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
        v43 = _NRLogIsLevelEnabled(v42, 17);

        if (v43)
        {
          v36 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v44);
          v37 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v36, 17, "%@: failed to set interface rank", v37);
          goto LABEL_25;
        }
LABEL_26:
        -[NRLink invalidateVirtualInterface](self, "invalidateVirtualInterface");
        return 0;
      }
      v39 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
      v40 = _NRLogIsLevelEnabled(v39, 17);

      if (!v40)
        goto LABEL_26;
      v36 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v41);
      v37 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v36, 17, "%@: failed to setup no ack prioritization", v37);
    }
    else
    {
      v33 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
      v34 = _NRLogIsLevelEnabled(v33, 17);

      if (!v34)
        goto LABEL_26;
      v36 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v35);
      v37 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v36, 17, "%@: failed to setup interface sub family", v37);
    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_45:
  -[NRLink checkProxyAgentWithForceUpdate:](self, "checkProxyAgentWithForceUpdate:", 1);
  return -[NRLink state](self, "state") != 255;
}

- (void)checkProxyAgentWithForceUpdate:(BOOL)a3
{
  char *v5;
  id *v6;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSData *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  id v22;
  unsigned __int8 v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  int IsLevelEnabled;
  id v30;
  uint64_t v31;
  char *v32;
  int *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v5 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->_nrUUID);
  if (!v5)
  {
    v28 = sub_10010E0B8();
    IsLevelEnabled = _NRLogIsLevelEnabled(v28, 16);

    if (IsLevelEnabled)
    {
      v30 = sub_10010E0B8();
      _NRLogWithArgs(v30, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)", ", "-[NRLink(NRLinkProtected) checkProxyAgentWithForceUpdate:]", 1093);

    }
    v31 = _os_log_pack_size(12);
    v32 = (char *)&v36 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = __error();
    v34 = _os_log_pack_fill(v32, v31, *v33, &_mh_execute_header, "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
    *(_DWORD *)v34 = 136446210;
    *(_QWORD *)(v34 + 4) = "-[NRLink(NRLinkProtected) checkProxyAgentWithForceUpdate:]";
    v35 = sub_10010E0B8();
    _NRLogAbortWithPack(v35, v32);
  }
  v6 = (id *)v5;
  if (a3)
    goto LABEL_26;
  v7 = self->_usedProxyNotifyPayload;
  v8 = (NSData *)v6[12];
  if (v7 == v8)
  {

    goto LABEL_20;
  }
  v9 = v8;
  v10 = self->_usedProxyNotifyPayload;
  v11 = v6[12];
  v12 = -[NSData isEqual:](v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
LABEL_26:
    v13 = v6[16];
    v14 = objc_msgSend(v13, "proxyCapability");

    if (v14 == (id)2)
    {
      -[NRLink unregisterProxyAgent](self, "unregisterProxyAgent");
      objc_storeStrong((id *)&self->_usedProxyNotifyPayload, v6[12]);
      if (self->_usedProxyNotifyPayload)
      {
        v37 = 0;
        v38 = 0;
        v36 = 0;
        if (-[NRLink virtualInterface](self, "virtualInterface"))
        {
          v15 = NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
        }
        else
        {
          if (-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
          {
            v16 = 0;
LABEL_14:
            v17 = self->_usedProxyNotifyPayload;
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
            v19 = sub_10010F75C(v6, v17, v16, &v37, &v38, &v36, v18);

            if ((v19 & 1) != 0)
            {
              v20 = v37;
              -[NRLink setProxyAgentRegistration:](self, "setProxyAgentRegistration:", v37);
              v21 = v38;
              objc_storeStrong((id *)&self->_proxyAgentUUID, v38);
              -[NRLink setPublishedMasqueProxyConfig:](self, "setPublishedMasqueProxyConfig:", v36);
              if (v36)
              {
                v22 = v6[16];
                v23 = objc_msgSend(v22, "hasPoliciesForProxyCriteria");

                if ((v23 & 1) == 0)
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink policyIdentifierString](self, "policyIdentifierString"));
                  v25 = sub_100110B34(v21, v16, v24);
                  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

                  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink policyIDs](self, "policyIDs"));
                  objc_msgSend(v27, "addObjectsFromArray:", v26);

                }
              }
            }
            else
            {
              -[NRLink cancelWithReason:](self, "cancelWithReason:", CFSTR("Failed to configure proxy agent"));
              v20 = v37;
              v21 = v38;
            }

            goto LABEL_20;
          }
          v15 = objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
        }
        v16 = (void *)v15;
        goto LABEL_14;
      }
    }
  }
LABEL_20:

}

@end
