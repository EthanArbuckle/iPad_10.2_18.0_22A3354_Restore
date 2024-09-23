@implementation NRLinkQuickRelay

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  NRLinkQuickRelay *v11;
  OS_dispatch_group *v12;
  void *v13;
  OS_dispatch_source *v14;
  void *v15;
  NRAnalyticsCmpnLinkQuickRelay *v16;
  void *v17;
  void *v18;
  void *v19;
  NRLinkQuickRelay *v20;
  id v21;
  int IsLevelEnabled;
  id v23;
  id v24;
  int v25;
  id v26;
  int v27;
  id v28;
  int v29;
  id v30;
  int v31;
  id v32;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v21 = sub_10003BC58();
    IsLevelEnabled = _NRLogIsLevelEnabled(v21, 17);

    if (!IsLevelEnabled)
      goto LABEL_20;
    v23 = sub_10003BC58();
    _NRLogWithArgs(v23, 17, "%s called with null queue");
LABEL_16:

    goto LABEL_20;
  }
  dispatch_assert_queue_V2(v8);
  if (!v9)
  {
    v24 = sub_10003BC58();
    v25 = _NRLogIsLevelEnabled(v24, 17);

    if (!v25)
      goto LABEL_20;
    v23 = sub_10003BC58();
    _NRLogWithArgs(v23, 17, "%s called with null linkDelegate");
    goto LABEL_16;
  }
  if (!v10)
  {
    v26 = sub_10003BC58();
    v27 = _NRLogIsLevelEnabled(v26, 17);

    if (!v27)
      goto LABEL_20;
    v23 = sub_10003BC58();
    _NRLogWithArgs(v23, 17, "%s called with null nrUUID");
    goto LABEL_16;
  }
  if ((_NRIsUUIDNonZero(v10) & 1) == 0)
  {
    v28 = sub_10003BC58();
    v29 = _NRLogIsLevelEnabled(v28, 17);

    if (!v29)
      goto LABEL_20;
    v23 = sub_10003BC58();
    _NRLogWithArgs(v23, 17, "called with all-zero nrUUID");
    goto LABEL_16;
  }
  v34.receiver = self;
  v34.super_class = (Class)NRLinkQuickRelay;
  v11 = -[NRLink initLinkWithQueue:linkDelegate:nrUUID:](&v34, "initLinkWithQueue:linkDelegate:nrUUID:", v8, v9, v10);
  if (!v11)
  {
    v30 = sub_10003BC58();
    v31 = _NRLogIsLevelEnabled(v30, 17);

    if (v31)
    {
      v32 = sub_10003BC58();
      _NRLogWithArgs(v32, 17, "[NRLink initLinkWithQueue:] failed");

    }
    self = 0;
    goto LABEL_20;
  }
  self = v11;
  -[NRLink setType:](v11, "setType:", 4);
  v12 = (OS_dispatch_group *)objc_alloc_init((Class)NSMutableArray);
  v13 = *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7);
  *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7) = v12;

  v14 = (OS_dispatch_source *)objc_alloc_init((Class)NSMutableArray);
  v15 = *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7);
  *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7) = v14;

  v16 = objc_alloc_init(NRAnalyticsCmpnLinkQuickRelay);
  v17 = *(OS_nw_path_evaluator **)((char *)&self->_pathEvaluator + 7);
  *(OS_nw_path_evaluator **)((char *)&self->_pathEvaluator + 7) = (OS_nw_path_evaluator *)v16;

  if (!sub_10004429C(self))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  -[NRLink updateIKEv2Role:](self, "updateIKEv2Role:", &self->_isResponder);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  -[NRLink reportEvent:details:](self, "reportEvent:details:", 3000, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
  objc_msgSend(v19, "linkIsAvailable:", self);

  self = self;
  v20 = self;
LABEL_21:

  return v20;
}

- (void)invalidateLink
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t);
  void *v30;
  id v31;
  NRLinkQuickRelay *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)NRLinkQuickRelay;
  -[NRLink invalidateLink](&v33, "invalidateLink");
  sub_10003BDD4((uint64_t)self, v3);
  if (self)
  {
    v4 = *(void **)(&self->_ikeSessionTimeoutScheduledOnce + 1);
    if (v4)
    {
      v5 = v4;
      v6 = *(void **)(&self->_ikeSessionTimeoutScheduledOnce + 1);
      *(_QWORD *)(&self->_ikeSessionTimeoutScheduledOnce + 1) = 0;

      if (qword_1001E48F8 != -1)
        dispatch_once(&qword_1001E48F8, &stru_1001B7D20);
      v7 = (id)qword_1001E4900;
      v27 = _NSConcreteStackBlock;
      v28 = 3221225472;
      v29 = sub_100044F8C;
      v30 = &unk_1001B8778;
      v31 = v5;
      v32 = self;
      v8 = v5;
      dispatch_async(v7, &v27);

    }
    v9 = *(NSDate **)((char *)&self->_idsSessionStartTime + 7);
    if (v9)
    {
      objc_msgSend(v9, "cancel");
      v10 = *(NSDate **)((char *)&self->_idsSessionStartTime + 7);
      *(NSDate **)((char *)&self->_idsSessionStartTime + 7) = 0;

    }
    -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4, v27, v28, v29, v30);
    -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3);
    v11 = *(NSObject **)((char *)&self->_nexusOutputRing + 7);
    if (v11)
    {
      if (self->_dNexusReadSourceSuspended)
      {
        dispatch_resume(v11);
        self->_dNexusReadSourceSuspended = 0;
        v11 = *(NSObject **)((char *)&self->_nexusOutputRing + 7);
      }
      dispatch_source_cancel(v11);
      v12 = *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7);
      *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7) = 0;

    }
    v13 = *(NSObject **)((char *)&self->_dNexusReadSource + 7);
    if (v13)
    {
      if (self->_dNexusWriteSourceSuspended)
      {
        dispatch_resume(v13);
        self->_dNexusWriteSourceSuspended = 0;
        v13 = *(NSObject **)((char *)&self->_dNexusReadSource + 7);
      }
      dispatch_source_cancel(v13);
      v14 = *(OS_dispatch_source **)((char *)&self->_dNexusReadSource + 7);
      *(OS_dispatch_source **)((char *)&self->_dNexusReadSource + 7) = 0;

    }
    v15 = *(uint64_t *)((char *)&self->_ikePacketReceiver + 7);
    if (v15)
    {
      if (!*(OS_dispatch_source **)((char *)&self->_dNexusWriteSource + 7))
        os_channel_destroy(v15);
      *(NEIKEv2PacketReceiver **)((char *)&self->_ikePacketReceiver + 7) = 0;
    }
    v16 = *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7);
    *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7) = 0;

    v17 = *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7);
    *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7) = 0;

    v18 = *(NSObject **)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7);
    if (v18)
    {
      dispatch_source_cancel(v18);
      v19 = *(void **)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7);
      *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7) = 0;

    }
    v20 = *(NSObject **)((char *)&self->_linkIdleTimerSource + 7);
    if (v20)
    {
      dispatch_source_cancel(v20);
      v21 = *(OS_dispatch_source **)((char *)&self->_linkIdleTimerSource + 7);
      *(OS_dispatch_source **)((char *)&self->_linkIdleTimerSource + 7) = 0;

    }
    -[NRLink setVirtualInterface:](self, "setVirtualInterface:", 0);
    v23 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
    if (v23)
    {
      objc_msgSend(v23, "setAvailability:", 0);
      objc_msgSend(*(id *)((char *)&self->_ikeSessionClassC + 7), "cancel");
      v24 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
      *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7) = 0;

    }
    v25 = *(uint64_t *)((char *)&self->_receivedIKEPackets + 7);
    if (v25)
    {
      nw_path_evaluator_cancel(v25, v22);
      v26 = *(NSMutableArray **)((char *)&self->_receivedIKEPackets + 7);
      *(NSMutableArray **)((char *)&self->_receivedIKEPackets + 7) = 0;

    }
  }
  else
  {
    objc_msgSend(0, "invalidateIKESessionForClass:", 4);
    objc_msgSend(0, "invalidateIKESessionForClass:", 3);
    objc_msgSend(0, "setVirtualInterface:", 0);
  }
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int IsLevelEnabled;
  uint64_t v17;
  void *v18;
  id v19;
  id v21;
  int v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    dispatch_assert_queue_V2(v5);

    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v4, &v24);
    if (-[NRLink changeStateTo:details:](self, "changeStateTo:details:", 255, v6))
    {
      if (self)
      {
        v8 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v8)
        {
          *(_QWORD *)(v8 + 24) = *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7)
                               + *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
          v9 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
          if (v9)
          {
            *(_QWORD *)(v9 + 80) = *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7);
            v10 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
            if (v10)
              *(_QWORD *)(v10 + 88) = *(unint64_t *)((char *)&self->_bytesFromNexus + 7);
          }
        }
        -[NRLink linkTotalReadyTimeInSec](self, "linkTotalReadyTimeInSec");
        v12 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v12)
          *(_QWORD *)(v12 + 16) = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
        objc_msgSend(v13, "linkIsUnavailable:", self);

        -[NRLinkQuickRelay invalidateLink](self, "invalidateLink");
        v14 = *(OS_nw_path_evaluator **)((char *)&self->_pathEvaluator + 7);
      }
      else
      {
        objc_msgSend(0, "linkTotalReadyTimeInSec");
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "linkDelegate"));
        objc_msgSend(v23, "linkIsUnavailable:", 0);

        objc_msgSend(0, "invalidateLink");
        v14 = 0;
      }
      objc_msgSend(v14, "submit");
    }
    else
    {
      v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
      IsLevelEnabled = _NRLogIsLevelEnabled(v15, 0);

      if (IsLevelEnabled)
      {
        v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
        v19 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v18, 0, "%s%.30s:%-4d %@: link already cancelled", ", "-[NRLinkQuickRelay cancelWithReason:]", 297, v19);

      }
    }
  }
  else
  {
    v21 = sub_10003BC58();
    v22 = _NRLogIsLevelEnabled(v21, 17);

    if (!v22)
      goto LABEL_15;
    v6 = sub_10003BC58();
    _NRLogWithArgs(v6, 17, "%s called with null reasonFormat", "-[NRLinkQuickRelay cancelWithReason:]");
  }

LABEL_15:
  return v4 != 0;
}

- (unsigned)metric
{
  return 1024;
}

- (id)copyStatusString
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  void *v11;
  id v12;
  id v13;
  const char *v14;
  const char *v15;
  const char *v16;
  NEVirtualInterface_s *virtualInterface;
  void *v18;
  const char *v19;
  const char *v20;
  const char *v21;

  v3 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc((Class)NSMutableString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v6 = objc_msgSend(v4, "initWithString:", v5);

  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "nrUUID", self->super._nrUUID);
  if (self->super._startRequested)
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "startRequested", v7);
  if (self->_resumeRequested)
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "resumeRequested", v8);
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "idsService", *(_QWORD *)(&self->_ikeSessionTimeoutScheduledOnce + 1));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "idsSession", *(IDSService **)((char *)&self->_idsService + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "idsDestination", *(IDSSession **)((char *)&self->_idsSession + 7));
  if (self->_idsSessionStarted)
    v9 = "YES";
  else
    v9 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "idsSessionStarted", v9);
  if (self->_invitationInProgress)
    v10 = "YES";
  else
    v10 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "invitationInProgress", v10);
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sessionInvitationCounter", *(NSDate **)((char *)&self->_ikeClassCEstablishedTime + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "idsSessionStartTime", *(NSString **)((char *)&self->_idsDestination + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "connection", *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7));
  v11 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
  if (v11)
  {
    v12 = objc_msgSend(v11, "connectionState");
    if ((unint64_t)v12 >= 6)
      v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown[%lld]"), v12);
    else
      v13 = *(&off_1001B66E8 + (_QWORD)v12);
    objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "connectionState", v13);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "ikeListener", *(NSDate **)((char *)&self->_idsSessionStartTime + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "ikeSessionClassD", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "ikeClassDRetryCounter", self->_ikeClassDRetryCounter);
  if (self->super._ikeClassDEstablished)
    v14 = "YES";
  else
    v14 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "ikeClassDEstablished", v14);
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "ikeClassDEstablishedTime", *(NSMutableArray **)((char *)&self->_receivedDatagrams + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "ikeSessionClassC", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "ikeClassCRetryCounter", self->_ikeClassCRetryCounter);
  if (self->super._ikeClassCEstablished)
    v15 = "YES";
  else
    v15 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "ikeClassCEstablished", v15);
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "ikeClassCEstablishedTime", *(NSDate **)((char *)&self->_ikeClassDEstablishedTime + 7));
  if (self->_isResponder)
    v16 = "YES";
  else
    v16 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "isResponder", v16);
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "packetNexus", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "ikePacketReceiver", *(NEIPsecNexus **)((char *)&self->_packetNexus + 7));
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v18 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %@"), "virtualInterfaceName", v18);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %p"), "nexusChannel", *(NEIKEv2PacketReceiver **)((char *)&self->_ikePacketReceiver + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %p"), "nexusInputRing", *(channel **)((char *)&self->_nexusChannel + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %p"), "dNexusReadSource", *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %p"), "dNexusWriteSource", *(OS_dispatch_source **)((char *)&self->_dNexusReadSource + 7));
  if (self->_dNexusReadSourceSuspended)
    v19 = "YES";
  else
    v19 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusReadSourceSuspended", v19);
  if (self->_dNexusWriteSourceSuspended)
    v20 = "YES";
  else
    v20 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "dNexusWriteSourceSuspended", v20);
  if (self->_hasPendingInputAvailable)
    v21 = "YES";
  else
    v21 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %s"), "hasPendingInputAvailable", v21);
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesFromNexus", *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesFromQR", *(unint64_t *)((char *)&self->_bytesToQRSendFailed + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesToQRBeforeSend", *(unint64_t *)((char *)&self->_lastRecordedSessionInvitationCounter + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesToQRSent", *(unint64_t *)((char *)&self->_bytesToQRBeforeSend + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesToQRSendFailed", *(unint64_t *)((char *)&self->_bytesToQRSent + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "bytesToNexus", *(unint64_t *)((char *)&self->_bytesFromNexus + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "receivedDatagrams.count", objc_msgSend(*(id *)((char *)&self->_nexusGroup + 7), "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusInputAvailableCount", *(unint64_t *)((char *)&self->_bytesToNexus + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "nexusOutputAvailableCount", *(unint64_t *)((char *)&self->_nexusInputAvailableCount + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sentIKEv2PointToPoint", *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "recvIKEv2PointToPoint", *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sentUncompressedIP", *(unint64_t *)((char *)&self->_recvIKEv2PointToPoint + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "recvUncompressedIP", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP_ECT0 + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sentEncapsulated6LoWPAN", *(unint64_t *)((char *)&self->_sentUncompressedIP + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "recvEncapsulated6LoWPAN", *(unint64_t *)((char *)&self->_recvUncompressedIP + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_ESP", *(unint64_t *)((char *)&self->_sentEncapsulated6LoWPAN + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_ESP", *(unint64_t *)((char *)&self->_recvEncapsulated6LoWPAN + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_ESP_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_ESP_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_ESP_ClassC", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ECT0 + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_ESP_ClassC", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ECT0 + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_ESP_ClassC_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_ESP_ClassC_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_TCP", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC_ECT0 + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_TCP", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC_ECT0 + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "sentKnownIPv6Hdr_TCP_ECT0", *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP + 7));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %35s = %llu"), "recvKnownIPv6Hdr_TCP_ECT0", *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP + 7));
  return v6;
}

- (BOOL)start
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  void *v10;
  id v11;
  id v13;
  _BOOL4 idsSessionIsIncoming;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;

  v3 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[NRLink state](self, "state") == 255)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    IsLevelEnabled = _NRLogIsLevelEnabled(v7, 1);

    if (IsLevelEnabled)
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v10, 1, "%s%.30s:%-4d %@: Ignoring start request as link is cancelled", ", "-[NRLinkQuickRelay start]", 414, v11);

    }
    return 0;
  }
  if (-[NRLink state](self, "state") == 8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    objc_msgSend(v5, "linkIsReady:", self);

    return 1;
  }
  if (-[NRLink state](self, "state") != 9)
  {
    if (-[NRLink startRequested](self, "startRequested"))
      return 1;
    if (sub_10004429C(self))
    {
      -[NRLink setStartRequested:](self, "setStartRequested:", 1);
      -[NRLink reportEvent:](self, "reportEvent:", 3001);
      if (self)
      {
        v13 = *(id *)((char *)&self->_idsService + 7);
        if (v13)
        {
          idsSessionIsIncoming = self->_idsSessionIsIncoming;

          if (idsSessionIsIncoming)
          {
            v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
            v6 = 1;
            v17 = _NRLogIsLevelEnabled(v16, 1);

            if (v17)
            {
              v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
              v20 = -[NRLink copyDescription](self, "copyDescription");
              _NRLogWithArgs(v19, 1, "%s%.30s:%-4d %@: No need to send invitation as we are processing a received invite", ", "-[NRLinkQuickRelay start]", 443, v20);

            }
            return v6;
          }
        }
      }
      sub_100043EE0((uint64_t)self);
      return 1;
    }
    return 0;
  }
  return -[NRLinkQuickRelay resume](self, "resume");
}

- (BOOL)suspend
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int IsLevelEnabled;
  uint64_t v20;
  void *v21;
  id v22;

  v3 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (self && self->_shouldCancelOnSuspend)
  {
    self->_shouldCancelOnSuspend = 0;
    -[NRLinkQuickRelay cancelWithReason:](self, "cancelWithReason:", CFSTR("Cancelling after link timeout and after suspend"));
  }
  if (-[NRLink state](self, "state") == 255)
  {
    v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    IsLevelEnabled = _NRLogIsLevelEnabled(v18, 1);

    if (IsLevelEnabled)
    {
      v21 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
      v22 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v21, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'", ", "-[NRLinkQuickRelay suspend]", 464, v22);

    }
  }
  else
  {
    if (!-[NRLink changeStateTo:](self, "changeStateTo:", 9))
    {
      v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
      v7 = _NRLogIsLevelEnabled(v6, 1);

      if (v7)
      {
        v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        v10 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v9, 1, "%s%.30s:%-4d %@: link already suspended", ", "-[NRLinkQuickRelay suspend]", 469, v10);

      }
    }
    if (self->_dNexusReadSourceSuspended)
    {
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusOutputRing + 7));
      self->_dNexusReadSourceSuspended = 0;
    }
    if (!-[NRLink ikeClassDEstablished](self, "ikeClassDEstablished"))
      -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4);
    if (!-[NRLink ikeClassCEstablished](self, "ikeClassCEstablished"))
      -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3);
    self->_resumeRequested = 0;
    self->_hasPendingInputAvailable = 0;
    self->_ikeClassCRetryCounter = 0;
    self->_ikeClassDRetryCounter = 0;
    self->_invitationRetryCounter = 0;
    objc_msgSend(*(id *)((char *)&self->_ikeSessionClassC + 7), "setAvailability:", 0);
    sub_10003BDD4((uint64_t)self, v11);
    v12 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
    if (v12)
    {
      *(_QWORD *)(v12 + 24) = *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7)
                            + *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
      v13 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
      if (v13)
      {
        *(_QWORD *)(v13 + 80) = *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7);
        v14 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v14)
          *(_QWORD *)(v14 + 88) = *(unint64_t *)((char *)&self->_bytesFromNexus + 7);
      }
    }
    -[NRLink linkTotalReadyTimeInSec](self, "linkTotalReadyTimeInSec");
    v16 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
    if (v16)
      *(_QWORD *)(v16 + 16) = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    objc_msgSend(v17, "linkIsSuspended:", self);

    objc_msgSend(*(id *)((char *)&self->_pathEvaluator + 7), "submit");
    objc_msgSend(*(id *)((char *)&self->_pathEvaluator + 7), "reset");
    self->super._linkTotalReadyTimeInSec = 0.0;
    *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7) = 0;
    *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7) = 0;
    *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7) = 0;
    *(unint64_t *)((char *)&self->_bytesFromNexus + 7) = 0;
  }
  return 1;
}

- (BOOL)resume
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  _BOOL4 idsSessionIsIncoming;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int IsLevelEnabled;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  id v21;

  if (-[NRLink state](self, "state") == 255)
  {
    v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
    v5 = 1;
    IsLevelEnabled = _NRLogIsLevelEnabled(v14, 1);

    if (IsLevelEnabled)
    {
      v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
      v13 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v12, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'", ", "-[NRLinkQuickRelay resume]", 518, v13);
      goto LABEL_11;
    }
  }
  else if (-[NRLink state](self, "state") == 9)
  {
    if (!self)
      goto LABEL_16;
    v5 = 1;
    if (self->_resumeRequested)
      return v5;
    self->_resumeRequested = 1;
    v6 = *(id *)((char *)&self->_idsService + 7);
    if (!v6 || (idsSessionIsIncoming = self->_idsSessionIsIncoming, v6, !idsSessionIsIncoming))
    {
LABEL_16:
      sub_100043EE0((uint64_t)self);
      return 1;
    }
    v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    v5 = 1;
    v10 = _NRLogIsLevelEnabled(v9, 1);

    if (v10)
    {
      v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v11);
      v13 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v12, 1, "%s%.30s:%-4d %@: No need to send invitation as we are processing a received invite", ", "-[NRLinkQuickRelay resume]", 539, v13);
LABEL_11:

    }
  }
  else
  {
    v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    v18 = _NRLogIsLevelEnabled(v17, 1);

    if (v18)
    {
      v20 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v19);
      v21 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v20, 1, "%s%.30s:%-4d %@: link not suspended for resuming", ", "-[NRLinkQuickRelay resume]", 523, v21);

    }
    return 0;
  }
  return v5;
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  int v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NRLinkQuickRelay;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  -[NRLink invalidateIKESession:](self, "invalidateIKESession:", sub_10003D980((uint64_t)self, v3));
}

- (BOOL)sendControlData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v18;
  int v19;
  id v20;
  id v21;
  int IsLevelEnabled;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  id v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkQuickRelay connection](self, "connection"));

  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(objc_alloc((Class)NEIKEv2PrivateNotify), "initWithNotifyStatus:notifyData:", 50702, v4);
      v8 = v7 != 0;
      if (v7)
      {
        objc_initWeak(&location, self);
        v9 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
        v27 = v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100043DAC;
        v24[3] = &unk_1001B7978;
        objc_copyWeak(&v25, &location);
        objc_msgSend(v9, "sendPrivateNotifies:maxRetries:retryIntervalInMilliseconds:callbackQueue:callback:", v10, 10, 1000, v11, v24);

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
      else
      {
        v21 = sub_10003BC58();
        IsLevelEnabled = _NRLogIsLevelEnabled(v21, 17);

        if (IsLevelEnabled)
        {
          v23 = sub_10003BC58();
          _NRLogWithArgs(v23, 17, "NEIKEv2PrivateNotify init %u %@ failed", 50702, v4);

        }
      }

    }
    else
    {
      v18 = sub_10003BC58();
      v19 = _NRLogIsLevelEnabled(v18, 17);

      if (v19)
      {
        v20 = sub_10003BC58();
        _NRLogWithArgs(v20, 17, "%s called with null data", "-[NRLinkQuickRelay sendControlData:]");

      }
      v8 = 0;
    }
  }
  else
  {
    v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    v8 = 1;
    v13 = _NRLogIsLevelEnabled(v12, 1);

    if (v13)
    {
      v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
      v16 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v15, 1, "%s%.30s:%-4d %@: Not sending control data as there is no IDS session", ", "-[NRLinkQuickRelay sendControlData:]", 1499, v16);

    }
  }

  return v8;
}

- (BOOL)sendPacketData:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *IKEv2PacketString;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  unsigned __int16 v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  int v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  int IsLevelEnabled;
  id v49;
  id v51;
  int v52;
  id v53;
  uint64_t v54;
  char *v55;
  int *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  __int16 v60;
  __int16 v61;
  char v62;
  _QWORD v63[5];
  id v64;
  id v65;

  v4 = a3;
  if (!v4)
  {
    v47 = sub_10003BC58();
    IsLevelEnabled = _NRLogIsLevelEnabled(v47, 17);

    if (IsLevelEnabled)
    {
      v49 = sub_10003BC58();
      _NRLogWithArgs(v49, 17, "%s called with null data", "-[NRLinkQuickRelay sendPacketData:]");

      v19 = 0;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (self->super._state != 255)
  {
    v7 = *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
    IKEv2PacketString = (void *)createIKEv2PacketString(v4);
    v9 = (unsigned __int16)objc_msgSend(v4, "length");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkQuickRelay connection](self, "connection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkQuickRelay connection](self, "connection"));
    v12 = objc_msgSend(v11, "connectionState");
    if ((unint64_t)v12 >= 6)
      v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown[%lld]"), v12);
    else
      v13 = *(&off_1001B66E8 + (_QWORD)v12);
    -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3006, CFSTR("Sending IKEv2 packet #%llu %@ len %u connection %@ state %@"), v7, IKEv2PacketString, v9, v10, v13);

    ++*(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
    v20 = objc_alloc_init((Class)NSMutableData);
    v62 = 4;
    v61 = bswap32(objc_msgSend(v4, "length")) >> 16;
    objc_msgSend(v20, "appendBytes:length:", &v62, 1);
    objc_msgSend(v20, "appendBytes:length:", &v61, 2);
    objc_msgSend(v20, "appendData:", v4);
    v21 = objc_msgSend(v20, "bytes");
    v22 = (unsigned __int16)objc_msgSend(v20, "length");
    if (!v22)
    {
      v51 = sub_10003BC58();
      v52 = _NRLogIsLevelEnabled(v51, 16);

      if (v52)
      {
        v53 = sub_10003BC58();
        _NRLogWithArgs(v53, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: dataLen > 0", ", "nrChecksumFull", 109);

      }
      v54 = _os_log_pack_size(12);
      v55 = (char *)&v59 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v56 = __error();
      v57 = _os_log_pack_fill(v55, v54, *v56, &_mh_execute_header, "%{public}s Assertion Failed: dataLen > 0");
      *(_DWORD *)v57 = 136446210;
      *(_QWORD *)(v57 + 4) = "nrChecksumFull";
      v58 = sub_10003BC58();
      _NRLogAbortWithPack(v58, v55);
    }
    v60 = ~(unsigned __int16)os_inet_checksum(v21, v22, 0);
    objc_msgSend(v20, "appendBytes:length:", &v60, 2);
    v23 = v20;
    dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
    if (self->super._state == 255)
    {
      v28 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      v29 = _NRLogIsLevelEnabled(v28, 16);

      if (!v29)
        goto LABEL_27;
      v31 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v30);
      v32 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v31, 16, "%s%.30s:%-4d %@: Cannot write datagram as link is cancelled", ", "-[NRLinkQuickRelay writeDatagramToSession:]", 1535, v32);
    }
    else
    {
      v25 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
      if (v25)
      {
        if (objc_msgSend(v25, "connectionState") == (id)3)
        {
          *(unint64_t *)((char *)&self->_lastRecordedSessionInvitationCounter + 7) += (unint64_t)objc_msgSend(v23, "length");
          v26 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
          v65 = v23;
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = sub_100043AE0;
          v63[3] = &unk_1001B6630;
          v63[4] = self;
          v64 = v23;
          objc_msgSend(v26, "writeDatagrams:completionHandler:", v27, v63);

LABEL_27:
          v19 = 1;
          goto LABEL_31;
        }
        v36 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
        v37 = objc_msgSend(v36, "connectionState");
        if ((unint64_t)v37 >= 6)
          v38 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown[%lld]"), v37);
        else
          v38 = *(&off_1001B66E8 + (_QWORD)v37);
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 10022, CFSTR("cannot write to connection %@ state %@"), v36, v38);

        v40 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v39);
        v41 = _NRLogIsLevelEnabled(v40, 16);

        if (!v41)
          goto LABEL_27;
        v31 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v42);
        v43 = -[NRLink copyDescription](self, "copyDescription");
        v44 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
        v45 = objc_msgSend(v44, "connectionState");
        if ((unint64_t)v45 >= 6)
          v46 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown[%lld]"), v45);
        else
          v46 = *(&off_1001B66E8 + (_QWORD)v45);
        _NRLogWithArgs(v31, 16, "%s%.30s:%-4d %@: Cannot write to connection %@ state %@", ", "-[NRLinkQuickRelay writeDatagramToSession:]", 1551, v43, v44, v46);

LABEL_26:
        goto LABEL_27;
      }
      v33 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      v34 = _NRLogIsLevelEnabled(v33, 0);

      if (!v34)
        goto LABEL_27;
      v31 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v35);
      v32 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v31, 0, "%s%.30s:%-4d %@: Ignoring writing datagrams as connection does not exist", ", "-[NRLinkQuickRelay writeDatagramToSession:]", 1542, v32);
    }

    goto LABEL_26;
  }
  v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  v15 = _NRLogIsLevelEnabled(v14, 16);

  if (!v15)
  {
LABEL_30:
    v19 = 0;
    goto LABEL_31;
  }
  v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
  v18 = -[NRLink copyDescription](self, "copyDescription");
  _NRLogWithArgs(v17, 16, "%s%.30s:%-4d %@: Asked to send IKEv2 data but cancelled", ", "-[NRLinkQuickRelay sendPacketData:]", 2040, v18);

  v19 = 0;
LABEL_31:

  return v19;
}

- (void)setPacketReceiver:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int IsLevelEnabled;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  id v24;
  int v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a3;
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    dispatch_assert_queue_V2(v6);

    v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0);

    if (IsLevelEnabled)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
      v12 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v11, 0, "%s%.30s:%-4d %@: Setting IKEv2 packet receiver", ", "-[NRLinkQuickRelay setPacketReceiver:]", 2073, v12);

    }
    objc_storeStrong((id *)((char *)&self->_packetNexus + 7), a3);
    if (objc_msgSend(*(id *)((char *)&self->_ikeSessionTimeoutSource + 7), "count"))
    {
      v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v13);
      v15 = _NRLogIsLevelEnabled(v14, 1);

      if (v15)
      {
        v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
        v18 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v17, 1, "%s%.30s:%-4d %@: processing %llu previously received IKE packets", ", "-[NRLinkQuickRelay setPacketReceiver:]", 2077, v18, objc_msgSend(*(id *)((char *)&self->_ikeSessionTimeoutSource + 7), "count"));

      }
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = *(id *)((char *)&self->_ikeSessionTimeoutSource + 7);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)((char *)&self->_packetNexus + 7), "receivePacketData:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v21);
    }

    objc_msgSend(*(id *)((char *)&self->_ikeSessionTimeoutSource + 7), "removeAllObjects");
  }
  else
  {
    v24 = sub_10003BC58();
    v25 = _NRLogIsLevelEnabled(v24, 17);

    if (v25)
    {
      v26 = sub_10003BC58();
      _NRLogWithArgs(v26, 17, "%s called with null receiver", "-[NRLinkQuickRelay setPacketReceiver:]");

    }
  }

}

- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14;
  char *v15;
  id v16;
  id v17;
  unsigned int (**v18)(_QWORD, void *);
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  id v27;
  int state;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  char *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  unsigned __int8 v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NRDDecryptedIdentifier *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  id v65;
  NSUUID *v66;
  NSUUID *v67;
  uint64_t v68;
  NSUUID *v69;
  void *v70;
  unsigned __int8 v71;
  uint64_t v72;
  id v73;
  id v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  NSObject *v79;
  char *v80;
  _QWORD *v81;
  NSObject *v82;
  _QWORD *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  uint64_t v91;
  const __CFString *v92;
  void *v93;
  id v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  NSObject *v100;
  char *v101;
  void *v102;
  NSObject *v103;
  _QWORD *v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  int v114;
  uint64_t v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  id v120;
  int IsLevelEnabled;
  id v122;
  id v123;
  int v124;
  id v125;
  int v126;
  id v127;
  int v128;
  id v129;
  int v130;
  id v131;
  int v132;
  id v133;
  uint64_t v134;
  int *v135;
  uint64_t v136;
  id v137;
  void *v138;
  int v139;
  uint64_t v140;
  void *v141;
  id v142;
  int v143;
  uint64_t v144;
  void *v145;
  id v146;
  void *v147;
  int v148;
  uint64_t v149;
  NSUUID *v150;
  void *v151;
  int v152;
  uint64_t v153;
  NSUUID *v154;
  void *v155;
  id v156;
  id v157;
  id v158;
  id v159;
  unsigned int (**v160)(_QWORD, void *);
  char *v161;
  id v162;
  _QWORD v163[2];
  _QWORD v164[2];

  v14 = a3;
  v15 = (char *)a4;
  v16 = a5;
  v17 = a6;
  v18 = (unsigned int (**)(_QWORD, void *))a7;
  v19 = a8;
  v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v19;
  if (!v14)
  {
    v120 = sub_10003BC58();
    IsLevelEnabled = _NRLogIsLevelEnabled(v120, 17);

    if (!IsLevelEnabled)
      goto LABEL_24;
    v122 = sub_10003BC58();
    _NRLogWithArgs(v122, 17, "%s called with null listener");
LABEL_77:

    goto LABEL_24;
  }
  if (!v15)
  {
    v123 = sub_10003BC58();
    v124 = _NRLogIsLevelEnabled(v123, 17);

    if (!v124)
      goto LABEL_24;
    v122 = sub_10003BC58();
    _NRLogWithArgs(v122, 17, "%s called with null session");
    goto LABEL_77;
  }
  if (!v16)
  {
    v125 = sub_10003BC58();
    v126 = _NRLogIsLevelEnabled(v125, 17);

    if (!v126)
      goto LABEL_24;
    v122 = sub_10003BC58();
    _NRLogWithArgs(v122, 17, "%s called with null sessionConfig");
    goto LABEL_77;
  }
  if (!v18)
  {
    v127 = sub_10003BC58();
    v128 = _NRLogIsLevelEnabled(v127, 17);

    if (!v128)
      goto LABEL_24;
    v122 = sub_10003BC58();
    _NRLogWithArgs(v122, 17, "%s called with null validateAuthBlock");
    goto LABEL_77;
  }
  if (!v19)
  {
    v129 = sub_10003BC58();
    v130 = _NRLogIsLevelEnabled(v129, 17);

    if (!v130)
      goto LABEL_24;
    v122 = sub_10003BC58();
    _NRLogWithArgs(v122, 17, "%s called with null responseBlock");
    goto LABEL_77;
  }
  v21 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v21);

  v23 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v22);
  v24 = _NRLogIsLevelEnabled(v23, 0);

  if (v24)
  {
    v26 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v25);
    v27 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v26, 0, "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@", ", "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 2115, v27, v14, v15, v16, v17);

  }
  state = self->super._state;
  v162 = v17;
  if (state == 255)
    goto LABEL_21;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  v30 = objc_msgSend(v29, "identifierType");

  if (v30 == (id)11)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
    v33 = objc_msgSend(v32, "identifierType");

    if (v33 == (id)11)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
      v36 = sub_10012FFF4((uint64_t)NRDLocalDevice, v35);

      v161 = v36;
      if (!v36)
      {
        v131 = sub_10003BC58();
        v132 = _NRLogIsLevelEnabled(v131, 16);

        if (v132)
        {
          v133 = sub_10003BC58();
          _NRLogWithArgs(v133, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)", ", "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 2135);

        }
        v134 = _os_log_pack_size(12);
        v15 = (char *)&v156 - ((__chkstk_darwin(v134) + 15) & 0xFFFFFFFFFFFFFFF0);
        v135 = __error();
        v136 = _os_log_pack_fill(v15, v134, *v135, &_mh_execute_header, "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
        *(_DWORD *)v136 = 136446210;
        *(_QWORD *)(v136 + 4) = "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:val"
                                "idateAuthBlock:responseBlock:]";
        v137 = sub_10003BC58();
        _NRLogAbortWithPack(v137, v15);
LABEL_81:
        dispatch_once(&qword_1001E4920, &stru_1001B7D88);
LABEL_39:
        v73 = v162;
        v74 = (id)qword_1001E4918;
        v75 = objc_msgSend(v36, "isEqual:", v74);

        if (v75)
        {
          v76 = mach_absolute_time();
          v77 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
          if (v77)
          {
            *(_QWORD *)(v77 + 48) = v76;
            v78 = *(id *)((char *)&self->_pathEvaluator + 7);
            if (v78)
              ++v78[9];

            if (v73)
              goto LABEL_44;
          }
          else
          {

            if (v73)
            {
LABEL_44:
              v79 = sub_10014CFBC();
              dispatch_assert_queue_V2(v79);

              v80 = v161;
              v81 = sub_1001331E8(v161, CFSTR("0"));
              v82 = sub_10014CFBC();
              dispatch_assert_queue_V2(v82);

              v83 = sub_100133714(v80, CFSTR("0"));
              v40 = sub_100112798(0, v80, 4);
              v156 = objc_alloc((Class)NEIKEv2ConfigurationMessage);
              v84 = objc_alloc((Class)NEIKEv2InitiatorTransportIPv6Address);
              v157 = v83;
              v85 = objc_msgSend(v84, "initWithAddress:", v83);
              v164[0] = v85;
              v86 = objc_alloc((Class)NEIKEv2ResponderTransportIPv6Address);
              v158 = v81;
              v87 = objc_msgSend(v86, "initWithAddress:", v81);
              v164[1] = v87;
              v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v164, 2));
              v89 = objc_msgSend(v156, "initWithWithAttributes:", v88);
              objc_msgSend(v40, "setConfigurationReply:", v89);

              v18 = v160;
              if (v160[2](v160, v40))
              {
                v90 = v157;
                v91 = 4;
                -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4);
                objc_storeStrong((id *)((char *)&self->_ikeListener + 7), a4);
                v92 = CFSTR("ClassD %@");
LABEL_55:
                sub_10003DAF0(self, v91);
                -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3016, v92, v15);

LABEL_57:
                if (self->super._virtualInterface)
                {

                  v112 = sub_100112420();
                  ((void (**)(_QWORD, void *, id, NEVirtualInterface_s *))v20)[2](v20, v40, v112, self->super._virtualInterface);

                  v14 = v159;
                  goto LABEL_23;
                }
                v138 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v96);
                v139 = _NRLogIsLevelEnabled(v138, 17);

                if (v139)
                {
                  v141 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v140);
                  v142 = -[NRLink copyDescription](self, "copyDescription");
                  _NRLogWithArgs(v141, 17, "%@: virtualInterface is NULL", v142);

                }
                goto LABEL_63;
              }
              -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021, CFSTR("ClassD %@"), v15);
              goto LABEL_65;
            }
          }
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024, CFSTR("ClassD %@"), v15);
LABEL_62:
          v40 = 0;
LABEL_63:
          v14 = v159;
          v18 = v160;
          goto LABEL_66;
        }
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
        if (qword_1001E4930 != -1)
          dispatch_once(&qword_1001E4930, &stru_1001B7DA8);
        v94 = (id)qword_1001E4928;
        v95 = objc_msgSend(v93, "isEqual:", v94);

        if (!v95)
        {
          v40 = 0;
          v18 = v160;
          goto LABEL_57;
        }
        v97 = mach_absolute_time();
        v98 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v98)
        {
          *(_QWORD *)(v98 + 32) = v97;
          v99 = *(id *)((char *)&self->_pathEvaluator + 7);
          if (v99)
            ++v99[8];

          if (v73)
            goto LABEL_53;
        }
        else
        {

          if (v73)
          {
LABEL_53:
            v100 = sub_10014CFBC();
            dispatch_assert_queue_V2(v100);

            v101 = v161;
            v102 = (void *)sub_100133920(v161, CFSTR("0"));
            v103 = sub_10014CFBC();
            dispatch_assert_queue_V2(v103);

            v104 = sub_100133AD8(v101, CFSTR("0"));
            v40 = sub_100112798(0, v101, 3);
            v105 = objc_alloc((Class)NEIKEv2ConfigurationMessage);
            v106 = objc_alloc((Class)NEIKEv2InitiatorTransportIPv6Address);
            v157 = v104;
            v107 = objc_msgSend(v106, "initWithAddress:", v104);
            v163[0] = v107;
            v108 = objc_alloc((Class)NEIKEv2ResponderTransportIPv6Address);
            v158 = v102;
            v109 = objc_msgSend(v108, "initWithAddress:", v102);
            v163[1] = v109;
            v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v163, 2));
            v111 = objc_msgSend(v105, "initWithWithAttributes:", v110);
            objc_msgSend(v40, "setConfigurationReply:", v111);

            v18 = v160;
            if (v160[2](v160, v40))
            {
              v90 = v157;
              v91 = 3;
              -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3);
              sub_100043AC8((uint64_t)self, v15);
              v92 = CFSTR("ClassC %@");
              goto LABEL_55;
            }
            -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021, CFSTR("ClassC %@"), v15);
LABEL_65:

            v14 = v159;
            goto LABEL_66;
          }
        }
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024, CFSTR("ClassC %@"), v15);
        goto LABEL_62;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
      v39 = objc_msgSend(v37, "isEqual:", v38);

      v159 = v14;
      v160 = v18;
      if ((v39 & 1) != 0)
      {
        if (_os_feature_enabled_impl("terminus", "EncryptedIdentity") && v161[11])
        {
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3022, CFSTR("%@ %@"), v15, v161);
          v40 = 0;
LABEL_66:

          goto LABEL_22;
        }
LABEL_38:
        v36 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
        if (qword_1001E4920 == -1)
          goto LABEL_39;
        goto LABEL_81;
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
      if (qword_1001E4920 != -1)
        dispatch_once(&qword_1001E4920, &stru_1001B7D88);
      v51 = (id)qword_1001E4918;
      if (objc_msgSend(v50, "isEqual:", v51))
      {

      }
      else
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
        if (qword_1001E4930 != -1)
          dispatch_once(&qword_1001E4930, &stru_1001B7DA8);
        v53 = (id)qword_1001E4928;
        v54 = objc_msgSend(v52, "isEqual:", v53);

        if ((v54 & 1) == 0)
        {
          v113 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v55);
          v114 = _NRLogIsLevelEnabled(v113, 16);

          if (v114)
          {
            v116 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v115);
            v117 = -[NRLink copyDescription](self, "copyDescription");
            v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
            v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
            _NRLogWithArgs(v116, 16, "%s%.30s:%-4d %@: Local identifier %@ does not match remote identifier %@", ", "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 2143, v117, v118, v119);

          }
          goto LABEL_62;
        }
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
      v58 = sub_100130BF8((uint64_t)NRDLocalDevice, v56, v57, v15);

      v60 = _NRCopyLogObjectForNRUUID(self->super._nrUUID, v59);
      v61 = (void *)v60;
      if (v58)
      {
        v62 = _NRLogIsLevelEnabled(v60, 1);

        if (v62)
        {
          v64 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v63);
          v65 = -[NRLink copyDescription](self, "copyDescription");
          v66 = v58->_identity;
          _NRLogWithArgs(v64, 1, "%s%.30s:%-4d %@: Decrypted device identity %@", ", "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 2155, v65, v66);

        }
        v67 = v58->_nrUUID;

        if (v67)
        {
          v69 = v58->_nrUUID;
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
          v71 = -[NSUUID isEqual:](v69, "isEqual:", v70);

          if ((v71 & 1) != 0)
          {

            goto LABEL_38;
          }
          v151 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v72);
          v152 = _NRLogIsLevelEnabled(v151, 16);

          if (v152)
          {
            v145 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v153);
            v146 = -[NRLink copyDescription](self, "copyDescription");
            v150 = v58->_identity;
            v154 = v58->_nrUUID;
            v155 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
            _NRLogWithArgs(v145, 16, "%s%.30s:%-4d %@: Different device found for identity %@ (%@ != %@)", ", "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 2166, v146, v150, v154, v155);

            goto LABEL_90;
          }
        }
        else
        {
          v147 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v68);
          v148 = _NRLogIsLevelEnabled(v147, 16);

          if (v148)
          {
            v145 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v149);
            v146 = -[NRLink copyDescription](self, "copyDescription");
            v150 = v58->_identity;
            _NRLogWithArgs(v145, 16, "%s%.30s:%-4d %@: No device found for identity %@", ", "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 2159, v146, v150);
LABEL_90:

            goto LABEL_91;
          }
        }
      }
      else
      {
        v143 = _NRLogIsLevelEnabled(v60, 16);

        if (v143)
        {
          v145 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v144);
          v146 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v145, 16, "%s%.30s:%-4d %@: Failed to decrypt device identity", ", "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 2151, v146);
LABEL_91:

        }
      }
      -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3023, CFSTR("%@ %@"), v15, v161);

      goto LABEL_62;
    }
    v47 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v34);
    v48 = _NRLogIsLevelEnabled(v47, 16);

    if (v48)
    {
      v44 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v49);
      v45 = -[NRLink copyDescription](self, "copyDescription");
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
      _NRLogWithArgs(v44, 16, "%s%.30s:%-4d %@: Remote identifier has wrong type %zu", ", "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 2130, v45, objc_msgSend(v46, "identifierType"));
      goto LABEL_20;
    }
  }
  else
  {
    v41 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
    v42 = _NRLogIsLevelEnabled(v41, 16);

    if (v42)
    {
      v44 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v43);
      v45 = -[NRLink copyDescription](self, "copyDescription");
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
      _NRLogWithArgs(v44, 16, "%s%.30s:%-4d %@: Local identifier has wrong type %zu", ", "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 2126, v45, objc_msgSend(v46, "identifierType"));
LABEL_20:

    }
  }
LABEL_21:
  v40 = 0;
LABEL_22:
  v20[2](v20, 0, 0, 0);
LABEL_23:

  v17 = v162;
LABEL_24:

}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withOptions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  int IsLevelEnabled;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  int v66;
  id v67;
  id v68;
  int v69;
  id v70;
  int v71;
  uint64_t v72;
  void *v73;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v17);

  if (-[NRLink state](self, "state") != 255)
  {
    if (v12)
    {
      if (v13)
      {
        if (v14)
        {
          v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
          IsLevelEnabled = _NRLogIsLevelEnabled(v19, 1);

          if (IsLevelEnabled)
          {
            v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v21);
            v23 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v22, 1, "%s%.30s:%-4d %@: Invite received", ", "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]", 2278, v23);

          }
          v24 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v21);
          v25 = _NRLogIsLevelEnabled(v24, 1);

          if (v25)
          {
            v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v26);
            v28 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v27, 1, "%s%.30s:%-4d %@: \tservice: %@", ", "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]", 2279, v28, v12);

          }
          v29 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v26);
          v30 = _NRLogIsLevelEnabled(v29, 1);

          if (v30)
          {
            v32 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
            v33 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v32, 1, "%s%.30s:%-4d %@: \taccount: %@", ", "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]", 2280, v33, v13);

          }
          v34 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
          v35 = _NRLogIsLevelEnabled(v34, 1);

          if (v35)
          {
            v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
            v38 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v37, 1, "%s%.30s:%-4d %@: \tsession: %@", ", "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]", 2281, v38, v14);

          }
          v39 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
          v40 = _NRLogIsLevelEnabled(v39, 1);

          if (v40)
          {
            v42 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v41);
            v43 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v42, 1, "%s%.30s:%-4d %@: \tfrom: %@", ", "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]", 2282, v43, v15);

          }
          v44 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v41);
          v45 = _NRLogIsLevelEnabled(v44, 1);

          if (v45)
          {
            v47 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v46);
            v48 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v47, 1, "%s%.30s:%-4d %@: \toptions: %@", ", "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]", 2283, v48, v16);

          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sessionID"));
          v50 = objc_alloc_init((Class)NSMutableDictionary);
          objc_msgSend(v50, "setObject:forKeyedSubscript:", &off_1001C4690, CFSTR("State"));
          objc_msgSend(v50, "setObject:forKeyedSubscript:", v49, CFSTR("SessionID"));
          sub_100107BA4(CFSTR("IDS Session"), v50);

          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 10004, CFSTR("%@"), v14);
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->_ikeSessionTimeoutScheduledOnce + 1), "deviceForFromID:", v15));
          if ((objc_msgSend(v51, "isDefaultPairedDevice") & 1) != 0)
          {
            if (self->_invitationInProgress)
            {
              v52 = *(id *)((char *)&self->_pathEvaluator + 7);
              if (v52)
                ++v52[13];

              -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 10005, CFSTR("Cancelling sent: %@, keep received: %@"), *(IDSService **)((char *)&self->_idsService + 7), v14);
              -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 10007, CFSTR("%@"), *(IDSService **)((char *)&self->_idsService + 7));
              objc_msgSend(*(id *)((char *)&self->_idsService + 7), "cancelInvitation");
              v53 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
              if (v53)
                *(_QWORD *)(v53 + 112) = 0;
            }
            if (*(IDSService **)((char *)&self->_idsService + 7))
            {
              -[NRLink reportEvent:](self, "reportEvent:", 10019);
              sub_10003BDD4((uint64_t)self, v54);
            }
            objc_storeStrong((id *)((char *)&self->_idsService + 7), a5);
            self->_idsSessionIsIncoming = 1;
            v55 = *(id *)((char *)&self->_idsService + 7);
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
            objc_msgSend(v55, "setDelegate:queue:", self, v56);

            v72 = IDSSessionForceInternetInvitationKey;
            v73 = &__kCFBooleanTrue;
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1));
            objc_msgSend(v14, "setPreferences:", v57);

            objc_msgSend(v14, "acceptInvitation");
            -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 10006, CFSTR("%@"), *(IDSService **)((char *)&self->_idsService + 7));
            v58 = mach_absolute_time();
            v59 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
            if (v59)
              *(_QWORD *)(v59 + 128) = v58;
          }
          else
          {
            -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 10026, CFSTR("Remote device is not the default paired device: %@/%@"), v14, v15);
            objc_msgSend(v14, "declineInvitation");
          }

          goto LABEL_32;
        }
        v70 = sub_10003BC58();
        v71 = _NRLogIsLevelEnabled(v70, 17);

        if (!v71)
          goto LABEL_32;
        v67 = sub_10003BC58();
        _NRLogWithArgs(v67, 17, "%s called with null session");
      }
      else
      {
        v68 = sub_10003BC58();
        v69 = _NRLogIsLevelEnabled(v68, 17);

        if (!v69)
          goto LABEL_32;
        v67 = sub_10003BC58();
        _NRLogWithArgs(v67, 17, "%s called with null account");
      }
    }
    else
    {
      v65 = sub_10003BC58();
      v66 = _NRLogIsLevelEnabled(v65, 17);

      if (!v66)
        goto LABEL_32;
      v67 = sub_10003BC58();
      _NRLogWithArgs(v67, 17, "%s called with null service");
    }

    goto LABEL_32;
  }
  v60 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
  v61 = _NRLogIsLevelEnabled(v60, 1);

  if (v61)
  {
    v63 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v62);
    v64 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v63, 1, "%s%.30s:%-4d %@: Declining session invite due to link state", ", "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]", 2267, v64);

  }
  -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 10026, CFSTR("Link is cancelled: %@/%@/%@"), self, v14, v15);
  objc_msgSend(v14, "declineInvitation");
LABEL_32:

}

- (void)sessionStarted:(id)a3
{
  void *v3;
  IDSService *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  char **v13;
  void *v14;
  int v15;
  uint64_t v16;
  char *v17;
  char *v18;
  void *v19;
  int IsLevelEnabled;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  id v31;
  char **v32;
  id v33;
  id v34;
  int v35;
  id v36;
  id v37;
  int v38;
  id v39;
  int *v40;
  uint64_t v41;
  id v42;
  _QWORD block[4];
  id v45;
  char **v46;
  id v47;
  NRLinkQuickRelay *v48;

  v5 = (IDSService *)a3;
  v6 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  if (-[NRLink state](self, "state") == 255)
  {
    v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
    IsLevelEnabled = _NRLogIsLevelEnabled(v19, 1);

    if (IsLevelEnabled)
    {
      v17 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v21);
      v22 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v17, 1, "%s%.30s:%-4d %@: Ignoring callback as link is cancelled", ", "-[NRLinkQuickRelay sessionStarted:]", 2355, v22);

LABEL_24:
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (!v5)
  {
    v34 = sub_10003BC58();
    v35 = _NRLogIsLevelEnabled(v34, 17);

    if (v35)
    {
      v36 = sub_10003BC58();
      _NRLogWithArgs(v36, 17, "%s called with null session", "-[NRLinkQuickRelay sessionStarted:]");

    }
    goto LABEL_25;
  }
  v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
  v9 = _NRLogIsLevelEnabled(v8, 0);

  if (v9)
  {
    v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
    v12 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v11, 0, "%s%.30s:%-4d %@: Session started: %@", ", "-[NRLinkQuickRelay sessionStarted:]", 2360, v12, v5);

  }
  v13 = &selRef_terminateDataSession_completionHandler_;
  if (*(IDSService **)((char *)&self->_idsService + 7) == v5)
  {
    self->_idsSessionStarted = 1;
    self->_invitationInProgress = 0;
    self->_invitationRetryCounter = 0;
    v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_storeStrong((id *)((char *)&self->_idsDestination + 7), v17);
    v23 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
    if (!v23)
      goto LABEL_18;
    if (*(_QWORD *)(v23 + 112))
    {
      v24 = mach_absolute_time();
      v25 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
      if (!v25)
        goto LABEL_18;
      v26 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionSendInvitationEnd;
    }
    else
    {
      if (!*(_QWORD *)(v23 + 128)
        || (v24 = mach_absolute_time(), (v25 = *(uint64_t *)((char *)&self->_pathEvaluator + 7)) == 0))
      {
LABEL_18:
        v27 = mach_absolute_time();
        v28 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v28)
          *(_QWORD *)(v28 + 144) = v27;
        sub_10003C004((uint64_t)self);
        v29 = (id)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
        v18 = sub_10012FFF4((uint64_t)NRDLocalDevice, v29);

        if (v18)
        {
          sub_10013453C(v18, (NWDatagramConnection **)((char *)&self->_connection + 7));
          sub_100133C94(v18, (__uint32_t *)((char *)&self->_localAddrClassD.__u6_addr32[3] + 3));
          v29 = *(id *)(&self->_ikeSessionTimeoutScheduledOnce + 1);
          v13 = (char **)*(id *)((char *)&self->_idsService + 7);
          v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
          if (qword_1001E48F8 == -1)
          {
LABEL_22:
            v30 = (id)qword_1001E4900;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100043604;
            block[3] = &unk_1001B7898;
            v45 = v29;
            v46 = v13;
            v47 = v3;
            v48 = self;
            v31 = v3;
            v32 = v13;
            v33 = v29;
            dispatch_async(v30, block);

            goto LABEL_23;
          }
        }
        else
        {
          v37 = sub_10003BC58();
          v38 = _NRLogIsLevelEnabled(v37, 16);

          v17 = "-[NRLinkQuickRelay sessionStarted:]";
          if (v38)
          {
            v39 = sub_10003BC58();
            _NRLogWithArgs(v39, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)", ", "-[NRLinkQuickRelay sessionStarted:]", 2380);

          }
          v5 = (IDSService *)_os_log_pack_size(12);
          self = (NRLinkQuickRelay *)((char *)&block[-1] - ((__chkstk_darwin(v5) + 15) & 0xFFFFFFFFFFFFFFF0));
          v40 = __error();
          v41 = _os_log_pack_fill(self, v5, *v40, &_mh_execute_header, "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
          *(_DWORD *)v41 = 136446210;
          *(_QWORD *)(v41 + 4) = "-[NRLinkQuickRelay sessionStarted:]";
          v42 = sub_10003BC58();
          _NRLogAbortWithPack(v42, self);
        }
        dispatch_once(&qword_1001E48F8, &stru_1001B7D20);
        goto LABEL_22;
      }
      v26 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionReceiveInvitationEnd;
    }
    *(_QWORD *)(v25 + *v26) = v24;
    goto LABEL_18;
  }
  v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
  v15 = _NRLogIsLevelEnabled(v14, 17);

  if (v15)
  {
    v17 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
    v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v17, 17, "%@: Sessions do not match: expected %@, started %@", v18, *(IDSService **)((char *)&self->_idsService + 7), v5);
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v7;
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("_connection.connectionState"), a4, a5, a6))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003C138;
    block[3] = &unk_1001B8AE0;
    block[4] = self;
    dispatch_async(v7, block);

  }
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  int IsLevelEnabled;
  uint64_t v23;
  void *v24;
  id v25;
  int v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  int v47;
  id v48;
  id v49;

  v6 = *(_QWORD *)&a4;
  v49 = a3;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  if (-[NRLink state](self, "state") == 255)
  {
    v21 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
    IsLevelEnabled = _NRLogIsLevelEnabled(v21, 1);

    if (IsLevelEnabled)
    {
      v24 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v23);
      v25 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v24, 1, "%s%.30s:%-4d %@: Ignoring callback as link is cancelled", ", "-[NRLinkQuickRelay sessionEnded:withReason:error:]", 2520, v25);

    }
  }
  else
  {
    if (v49)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "sessionID"));
      v12 = v11;
      if (self)
      {
        v13 = objc_alloc_init((Class)NSMutableDictionary);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_1001C46C0, CFSTR("State"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("SessionID"));
        sub_100107BA4(CFSTR("IDS Session"), v13);

        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 10009, CFSTR("%@, %u, %@"), v49, v6, v8);
        v15 = *(IDSService **)((char *)&self->_idsService + 7);
      }
      else
      {

        objc_msgSend(0, "reportEvent:detailsFormat:", 10009, CFSTR("%@, %u, %@"), v49, v6, v8);
        v15 = 0;
      }
      v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
      if (v15 != v49)
      {
        v17 = _NRLogIsLevelEnabled(v16, 17);

        if (v17)
        {
          v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
          v20 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v19, 17, "%@: Sessions do not match: expected %@, started %@", v20, *(IDSService **)((char *)&self->_idsService + 7), v49);

        }
        goto LABEL_37;
      }
      v26 = _NRLogIsLevelEnabled(v16, 0);

      if (v26)
      {
        v28 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v27);
        v29 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v28, 0, "%s%.30s:%-4d %@: Session ended: %@ with reason %u, error %@", ", "-[NRLinkQuickRelay sessionEnded:withReason:error:]", 2529, v29, v49, v6, v8);

      }
      self->_idsSessionStarted = 0;
      self->_invitationInProgress = 0;
      v30 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
      if (!v30)
        goto LABEL_20;
      if (*(_QWORD *)(v30 + 144))
      {
        v31 = mach_absolute_time();
        v32 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (!v32)
        {
LABEL_20:
          v34 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
          if (v34)
            *(_DWORD *)(v34 + 100) = v6;
          if (self->_dNexusReadSourceSuspended)
          {
            dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusOutputRing + 7));
            self->_dNexusReadSourceSuspended = 0;
          }
          if ((_DWORD)v6 == 21
            && (-[NRLink ikeClassCEstablished](self, "ikeClassCEstablished")
             || -[NRLink ikeClassDEstablished](self, "ikeClassDEstablished")))
          {
            sub_10003BCC8(self);
          }
          else
          {
            if (-[NRLink ikeClassCEstablished](self, "ikeClassCEstablished")
              || -[NRLink ikeClassDEstablished](self, "ikeClassDEstablished"))
            {
              v36 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v35);
              v37 = _NRLogIsLevelEnabled(v36, 0);

              if (v37)
              {
                v39 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v38);
                v40 = -[NRLink copyDescription](self, "copyDescription");
                _NRLogWithArgs(v39, 0, "%s%.30s:%-4d %@: Not tearing down IKE", ", "-[NRLinkQuickRelay sessionEnded:withReason:error:]", 2559, v40);

              }
              sub_10003BDD4((uint64_t)self, v38);
            }
            else
            {
              v41 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v35);
              v42 = _NRLogIsLevelEnabled(v41, 0);

              if (v42)
              {
                v44 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v43);
                v45 = -[NRLink copyDescription](self, "copyDescription");
                _NRLogWithArgs(v44, 0, "%s%.30s:%-4d %@: Tearing down everything", ", "-[NRLinkQuickRelay sessionEnded:withReason:error:]", 2564, v45);

              }
              sub_10003BDD4((uint64_t)self, v43);
              -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4);
              -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3);
            }
            -[NRLinkQuickRelay suspend](self, "suspend");
          }
          goto LABEL_37;
        }
        v33 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionEnd;
      }
      else
      {
        if (!*(_QWORD *)(v30 + 112))
          goto LABEL_20;
        *(_BYTE *)(v30 + 96) = 1;
        v31 = mach_absolute_time();
        v32 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (!v32)
          goto LABEL_20;
        v33 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionSendInvitationEnd;
      }
      *(_QWORD *)(v32 + *v33) = v31;
      goto LABEL_20;
    }
    v46 = sub_10003BC58();
    v47 = _NRLogIsLevelEnabled(v46, 17);

    if (v47)
    {
      v48 = sub_10003BC58();
      _NRLogWithArgs(v48, 17, "%s called with null session", "-[NRLinkQuickRelay sessionEnded:withReason:error:]");

    }
  }
LABEL_37:

}

- (void)session:(id)a3 didReceiveData:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  int IsLevelEnabled;
  uint64_t v25;
  id v26;
  int v27;
  id v28;
  int v29;
  id v30;

  v30 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (-[NRLink state](self, "state") == 255)
  {
    v23 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    IsLevelEnabled = _NRLogIsLevelEnabled(v23, 1);

    if (IsLevelEnabled)
    {
      v21 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v25);
      v22 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v21, 1, "%s%.30s:%-4d %@: Ignoring callback as link is cancelled", ", "-[NRLinkQuickRelay session:didReceiveData:]", 2579, v22);
      goto LABEL_13;
    }
  }
  else
  {
    if (!v30)
    {
      v26 = sub_10003BC58();
      v27 = _NRLogIsLevelEnabled(v26, 17);

      if (!v27)
        goto LABEL_15;
      v21 = sub_10003BC58();
      _NRLogWithArgs(v21, 17, "%s called with null uniqueID");
      goto LABEL_14;
    }
    if (!v6)
    {
      v28 = sub_10003BC58();
      v29 = _NRLogIsLevelEnabled(v28, 17);

      if (!v29)
        goto LABEL_15;
      v21 = sub_10003BC58();
      _NRLogWithArgs(v21, 17, "%s called with null data");
      goto LABEL_14;
    }
    if (self)
      v9 = *(IDSService **)((char *)&self->_idsService + 7);
    else
      v9 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sessionID"));
    v11 = objc_msgSend(v10, "isEqualToString:", v30);

    if ((v11 & 1) == 0)
    {
      v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
      v14 = _NRLogIsLevelEnabled(v13, 17);

      if (v14)
      {
        v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
        v16 = -[NRLink copyDescription](self, "copyDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_idsService + 7), "sessionID"));
        _NRLogWithArgs(v15, 17, "%@: Received data from a different session: %@, expected %@", v16, v30, v17);

      }
    }
    v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    v19 = _NRLogIsLevelEnabled(v18, 0);

    if (v19)
    {
      v21 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
      v22 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v21, 0, "%s%.30s:%-4d %@: Session for %@ received data %@", ", "-[NRLinkQuickRelay session:didReceiveData:]", 2591, v22, v30, v6);
LABEL_13:

LABEL_14:
    }
  }
LABEL_15:

}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  int IsLevelEnabled;
  uint64_t v17;
  id v18;
  int v19;
  uint64_t v20;
  id v21;
  int v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (-[NRLink state](self, "state") == 255)
  {
    v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 1);

    if (!IsLevelEnabled)
      goto LABEL_14;
    v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
    v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 1, "%s%.30s:%-4d %@: Ignoring callback as link is cancelled", ", "-[NRLinkQuickRelay session:receivedInvitationAcceptFromID:]", 2598, v18);
LABEL_12:

    goto LABEL_13;
  }
  if (!v23)
  {
    v21 = sub_10003BC58();
    v22 = _NRLogIsLevelEnabled(v21, 17);

    if (!v22)
      goto LABEL_14;
    v13 = sub_10003BC58();
    _NRLogWithArgs(v13, 17, "%s called with null session", "-[NRLinkQuickRelay session:receivedInvitationAcceptFromID:]");
    goto LABEL_13;
  }
  if (self)
    v9 = *(IDSService **)((char *)&self->_idsService + 7);
  else
    v9 = 0;
  v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
  if (v9 == v23)
  {
    v19 = _NRLogIsLevelEnabled(v10, 0);

    if (!v19)
      goto LABEL_14;
    v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 0, "%s%.30s:%-4d %@: Destination %@ accepted invitation for session %@", ", "-[NRLinkQuickRelay session:receivedInvitationAcceptFromID:]", 2604, v18, v6, v23);
    goto LABEL_12;
  }
  v11 = _NRLogIsLevelEnabled(v10, 17);

  if (v11)
  {
    v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    v14 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 17, "%@: Sessions do not match: expected %@, started %@", v14, *(IDSService **)((char *)&self->_idsService + 7), v23);

LABEL_13:
  }
LABEL_14:

}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  int IsLevelEnabled;
  uint64_t v17;
  id v18;
  int v19;
  uint64_t v20;
  id v21;
  int v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (-[NRLink state](self, "state") == 255)
  {
    v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 1);

    if (!IsLevelEnabled)
      goto LABEL_14;
    v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
    v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 1, "%s%.30s:%-4d %@: Ignoring callback as link is cancelled", ", "-[NRLinkQuickRelay session:receivedInvitationCancelFromID:]", 2611, v18);
LABEL_12:

    goto LABEL_13;
  }
  if (!v23)
  {
    v21 = sub_10003BC58();
    v22 = _NRLogIsLevelEnabled(v21, 17);

    if (!v22)
      goto LABEL_14;
    v13 = sub_10003BC58();
    _NRLogWithArgs(v13, 17, "%s called with null session", "-[NRLinkQuickRelay session:receivedInvitationCancelFromID:]");
    goto LABEL_13;
  }
  if (self)
    v9 = *(IDSService **)((char *)&self->_idsService + 7);
  else
    v9 = 0;
  v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
  if (v9 == v23)
  {
    v19 = _NRLogIsLevelEnabled(v10, 0);

    if (!v19)
      goto LABEL_14;
    v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 0, "%s%.30s:%-4d %@: Destination %@ cancelled invitation for session %@", ", "-[NRLinkQuickRelay session:receivedInvitationCancelFromID:]", 2617, v18, v6, v23);
    goto LABEL_12;
  }
  v11 = _NRLogIsLevelEnabled(v10, 17);

  if (v11)
  {
    v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    v14 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 17, "%@: Sessions do not match: expected %@, started %@", v14, *(IDSService **)((char *)&self->_idsService + 7), v23);

LABEL_13:
  }
LABEL_14:

}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  int IsLevelEnabled;
  uint64_t v17;
  id v18;
  int v19;
  uint64_t v20;
  id v21;
  int v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (-[NRLink state](self, "state") == 255)
  {
    v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 1);

    if (!IsLevelEnabled)
      goto LABEL_14;
    v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
    v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 1, "%s%.30s:%-4d %@: Ignoring callback as link is cancelled", ", "-[NRLinkQuickRelay session:receivedInvitationDeclineFromID:]", 2624, v18);
LABEL_12:

    goto LABEL_13;
  }
  if (!v23)
  {
    v21 = sub_10003BC58();
    v22 = _NRLogIsLevelEnabled(v21, 17);

    if (!v22)
      goto LABEL_14;
    v13 = sub_10003BC58();
    _NRLogWithArgs(v13, 17, "%s called with null session", "-[NRLinkQuickRelay session:receivedInvitationDeclineFromID:]");
    goto LABEL_13;
  }
  if (self)
    v9 = *(IDSService **)((char *)&self->_idsService + 7);
  else
    v9 = 0;
  v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
  if (v9 == v23)
  {
    v19 = _NRLogIsLevelEnabled(v10, 0);

    if (!v19)
      goto LABEL_14;
    v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 0, "%s%.30s:%-4d %@: Destination %@ declined invitation for session %@", ", "-[NRLinkQuickRelay session:receivedInvitationDeclineFromID:]", 2630, v18, v6, v23);
    goto LABEL_12;
  }
  v11 = _NRLogIsLevelEnabled(v10, 17);

  if (v11)
  {
    v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    v14 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 17, "%@: Sessions do not match: expected %@, started %@", v14, *(IDSService **)((char *)&self->_idsService + 7), v23);

LABEL_13:
  }
LABEL_14:

}

- (NWDatagramConnection)connection
{
  return *(NWDatagramConnection **)((char *)&self->_linkAnalytics + 7);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_linkAnalytics + 7), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_linkAnalytics + 7), 0);
  objc_storeStrong((id *)((char *)&self->_pathEvaluator + 7), 0);
  objc_storeStrong((id *)((char *)&self->_receivedIKEPackets + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionTimeoutSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_linkIdleTimerSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeClassDEstablishedTime + 7), 0);
  objc_storeStrong((id *)((char *)&self->_receivedDatagrams + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusGroup + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusWriteSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_dNexusReadSource + 7), 0);
  objc_storeStrong((id *)((char *)&self->_nexusOutputRing + 7), 0);
  objc_storeStrong((id *)((char *)&self->_packetNexus + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassC + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassD + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_idsSessionStartTime + 7), 0);
  objc_storeStrong((id *)((char *)&self->_idsDestination + 7), 0);
  objc_storeStrong((id *)((char *)&self->_idsSession + 7), 0);
  objc_storeStrong((id *)((char *)&self->_idsService + 7), 0);
  objc_storeStrong((id *)(&self->_ikeSessionTimeoutScheduledOnce + 1), 0);
}

@end
