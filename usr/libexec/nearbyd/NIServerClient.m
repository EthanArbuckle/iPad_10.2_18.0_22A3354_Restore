@implementation NIServerClient

+ (id)delegateProxyWithConnection:(id)a3
{
  id v3;
  NIServerClient *v4;

  v3 = a3;
  v4 = -[NIServerClient initWithConnection:]([NIServerClient alloc], "initWithConnection:", v3);

  return v4;
}

- (NIServerClient)initWithConnection:(id)a3
{
  id v6;
  NIServerClient *v7;
  NIServerClient *v8;
  PRNSXPCConnection *v9;
  UWBSessionDelegateProxyProtocol *connWrapper;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerClient.mm"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  v13.receiver = self;
  v13.super_class = (Class)NIServerClient;
  v7 = -[NIServerClient init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_connection, a3);
    v9 = -[PRNSXPCConnection initWithConnection:]([PRNSXPCConnection alloc], "initWithConnection:", v8->_connection);
    connWrapper = v8->_connWrapper;
    v8->_connWrapper = (UWBSessionDelegateProxyProtocol *)v9;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[UWBSessionDelegateProxyProtocol invalidate](self->_connWrapper, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NIServerClient;
  -[NIServerClient dealloc](&v3, "dealloc");
}

- (void)setConnection:(id)a3
{
  PRNSXPCConnection *v5;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  v5 = -[PRNSXPCConnection initWithConnection:]([PRNSXPCConnection alloc], "initWithConnection:", self->_connection);
  connWrapper = self->_connWrapper;
  self->_connWrapper = (UWBSessionDelegateProxyProtocol *)v5;

}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030824;
  v7[3] = &unk_1007FABF0;
  v8 = v4;
  v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003091C;
  v7[3] = &unk_1007FABF0;
  v8 = v4;
  v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a3;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100030A18;
  v9[3] = &unk_1007FAC18;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v9);

}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030B10;
  v7[3] = &unk_1007FABF0;
  v8 = v4;
  v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  UWBSessionDelegateProxyProtocol *connWrapper;
  _QWORD v5[6];

  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100030BCC;
  v5[3] = &unk_1007FAC38;
  v5[4] = a3;
  *(double *)&v5[5] = a4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v5);
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  UWBSessionDelegateProxyProtocol *connWrapper;
  _QWORD v5[6];

  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100030C8C;
  v5[3] = &unk_1007FAC38;
  v5[4] = a3;
  *(double *)&v5[5] = a4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v5);
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030D88;
  v7[3] = &unk_1007FABF0;
  v8 = v4;
  v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  connWrapper = self->_connWrapper;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100030EEC;
  v15[3] = &unk_1007FAC60;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v15);

}

- (void)didUpdateMotionState:(int64_t)a3
{
  UWBSessionDelegateProxyProtocol *connWrapper;
  _QWORD v4[5];

  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100030FA8;
  v4[3] = &unk_1007FAC80;
  v4[4] = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v4);
}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  UWBSessionDelegateProxyProtocol *connWrapper;
  _QWORD v4[5];

  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031060;
  v4[3] = &unk_1007FAC80;
  v4[4] = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v4);
}

- (void)relayDCKMessage:(id)a3
{
  id v4;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031158;
  v7[3] = &unk_1007FABF0;
  v8 = v4;
  v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031284;
  v11[3] = &unk_1007FACA8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v11);

}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v4;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003137C;
  v7[3] = &unk_1007FABF0;
  v8 = v4;
  v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  id v6;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a4;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003147C;
  v9[3] = &unk_1007FACD0;
  v11 = a3;
  v10 = v6;
  v8 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v9);

}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000315AC;
  v11[3] = &unk_1007FACA8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v11);

}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  UWBSessionDelegateProxyProtocol *connWrapper;
  _QWORD v4[4];
  BOOL v5;

  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031664;
  v4[3] = &unk_1007FACF0;
  v5 = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v4);
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031790;
  v11[3] = &unk_1007FACA8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v11);

}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000318BC;
  v11[3] = &unk_1007FACA8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v11);

}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000319E8;
  v11[3] = &unk_1007FACA8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v11);

}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  UWBSessionDelegateProxyProtocol *connWrapper;
  _QWORD v5[5];
  unsigned int v6;

  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100031AA4;
  v5[3] = &unk_1007FAD10;
  v6 = a3;
  v5[4] = a4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v5);
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  UWBSessionDelegateProxyProtocol *connWrapper;
  _QWORD v4[5];

  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031B60;
  v4[3] = &unk_1007FAC80;
  v4[4] = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v4);
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  UWBSessionDelegateProxyProtocol *connWrapper;
  _QWORD v4[5];

  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031C18;
  v4[3] = &unk_1007FAC80;
  v4[4] = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v4);
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  id v6;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v8;
  _QWORD v9[4];
  id v10;
  unsigned int v11;

  v6 = a4;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031D18;
  v9[3] = &unk_1007FAD38;
  v11 = a3;
  v10 = v6;
  v8 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v9);

}

- (void)systemDidUpdateState:(id)a3
{
  id v4;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031E14;
  v7[3] = &unk_1007FABF0;
  v8 = v4;
  v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  id v6;
  UWBSessionDelegateProxyProtocol *connWrapper;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a4;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031F14;
  v9[3] = &unk_1007FACD0;
  v11 = a3;
  v10 = v6;
  v8 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v9);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connWrapper, 0);
}

@end
