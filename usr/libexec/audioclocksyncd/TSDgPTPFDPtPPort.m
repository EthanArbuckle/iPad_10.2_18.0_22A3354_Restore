@implementation TSDgPTPFDPtPPort

- (TSDgPTPFDPtPPort)initWithService:(id)a3 pid:(int)a4
{
  TSDgPTPFDPtPPort *v4;
  TSDgPTPFDPtPPort *v5;
  uint64_t v6;
  TSDgPTPPortStatistics *statistics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPFDPtPPort;
  v4 = -[TSDgPTPNetworkPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPFDPtPPort _statistics](v4, "_statistics"));
    statistics = v5->_statistics;
    v5->_statistics = (TSDgPTPPortStatistics *)v6;

    v5->_localPDelayLogMeanInterval = -[TSDgPTPFDPtPPort _localPDelayLogMeanInterval](v5, "_localPDelayLogMeanInterval");
    v5->_remotePDelayLogMeanInterval = -[TSDgPTPFDPtPPort _remotePDelayLogMeanInterval](v5, "_remotePDelayLogMeanInterval");
    v5->_multipleRemotes = -[TSDgPTPFDPtPPort _multipleRemotes](v5, "_multipleRemotes");
    v5->_measuringPDelay = -[TSDgPTPFDPtPPort _measuringPDelay](v5, "_measuringPDelay");
  }
  return v5;
}

- (void)updateProperties
{
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TSDgPTPFDPtPPort;
  -[TSDgPTPNetworkPort updateProperties](&v16, "updateProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPFDPtPPort _statistics](self, "_statistics"));
  v4 = -[TSDgPTPFDPtPPort _localPDelayLogMeanInterval](self, "_localPDelayLogMeanInterval");
  v5 = -[TSDgPTPFDPtPPort _remotePDelayLogMeanInterval](self, "_remotePDelayLogMeanInterval");
  v6 = -[TSDgPTPFDPtPPort _multipleRemotes](self, "_multipleRemotes");
  v7 = -[TSDgPTPFDPtPPort _measuringPDelay](self, "_measuringPDelay");
  v8 = objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012BD8;
  block[3] = &unk_10003C790;
  v12 = v4;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  block[4] = self;
  v11 = v3;
  v9 = v3;
  dispatch_async(v8, block);

}

- (id)_statistics
{
  return -[TSDgPTPPortStatistics initWithPort:]([TSDgPTPPortStatistics alloc], "initWithPort:", self);
}

- (char)_localPDelayLogMeanInterval
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalPDelayLogMeanInterval")));

  if (v3)
    v4 = objc_msgSend(v3, "charValue");
  else
    v4 = 0;

  return v4;
}

- (char)_remotePDelayLogMeanInterval
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemotePDelayLogMeanInterval")));

  if (v3)
    v4 = objc_msgSend(v3, "charValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_multipleRemotes
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MultipleRemotes")));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_measuringPDelay
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MeasuringPDelay")));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (TSDgPTPPortStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_statistics, a3);
}

- (char)localPDelayLogMeanInterval
{
  return self->_localPDelayLogMeanInterval;
}

- (void)setLocalPDelayLogMeanInterval:(char)a3
{
  self->_localPDelayLogMeanInterval = a3;
}

- (char)remotePDelayLogMeanInterval
{
  return self->_remotePDelayLogMeanInterval;
}

- (void)setRemotePDelayLogMeanInterval:(char)a3
{
  self->_remotePDelayLogMeanInterval = a3;
}

- (BOOL)multipleRemotes
{
  return self->_multipleRemotes;
}

- (void)setMultipleRemotes:(BOOL)a3
{
  self->_multipleRemotes = a3;
}

- (BOOL)measuringPDelay
{
  return self->_measuringPDelay;
}

- (void)setMeasuringPDelay:(BOOL)a3
{
  self->_measuringPDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
