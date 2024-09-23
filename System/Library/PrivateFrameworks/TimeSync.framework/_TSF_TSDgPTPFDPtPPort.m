@implementation _TSF_TSDgPTPFDPtPPort

- (_TSF_TSDgPTPFDPtPPort)initWithService:(id)a3 pid:(int)a4
{
  _TSF_TSDgPTPFDPtPPort *v4;
  _TSF_TSDgPTPFDPtPPort *v5;
  uint64_t v6;
  _TSF_TSDgPTPPortStatistics *statistics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPFDPtPPort;
  v4 = -[_TSF_TSDgPTPNetworkPort initWithService:pid:](&v9, sel_initWithService_pid_, a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    -[_TSF_TSDgPTPFDPtPPort _statistics](v4, "_statistics");
    v6 = objc_claimAutoreleasedReturnValue();
    statistics = v5->_statistics;
    v5->_statistics = (_TSF_TSDgPTPPortStatistics *)v6;

    v5->_localPDelayLogMeanInterval = -[_TSF_TSDgPTPFDPtPPort _localPDelayLogMeanInterval](v5, "_localPDelayLogMeanInterval");
    v5->_remotePDelayLogMeanInterval = -[_TSF_TSDgPTPFDPtPPort _remotePDelayLogMeanInterval](v5, "_remotePDelayLogMeanInterval");
    v5->_multipleRemotes = -[_TSF_TSDgPTPFDPtPPort _multipleRemotes](v5, "_multipleRemotes");
    v5->_measuringPDelay = -[_TSF_TSDgPTPFDPtPPort _measuringPDelay](v5, "_measuringPDelay");
  }
  return v5;
}

- (void)updateProperties
{
  void *v3;
  char v4;
  char v5;
  BOOL v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  char v12;
  char v13;
  BOOL v14;
  BOOL v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_TSF_TSDgPTPFDPtPPort;
  -[_TSF_TSDgPTPNetworkPort updateProperties](&v16, sel_updateProperties);
  -[_TSF_TSDgPTPFDPtPPort _statistics](self, "_statistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_TSF_TSDgPTPFDPtPPort _localPDelayLogMeanInterval](self, "_localPDelayLogMeanInterval");
  v5 = -[_TSF_TSDgPTPFDPtPPort _remotePDelayLogMeanInterval](self, "_remotePDelayLogMeanInterval");
  v6 = -[_TSF_TSDgPTPFDPtPPort _multipleRemotes](self, "_multipleRemotes");
  v7 = -[_TSF_TSDgPTPFDPtPPort _measuringPDelay](self, "_measuringPDelay");
  -[_TSF_TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___TSF_TSDgPTPFDPtPPort_updateProperties__block_invoke;
  block[3] = &unk_1E694B2E8;
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
  return -[_TSF_TSDgPTPPortStatistics initWithPort:]([_TSF_TSDgPTPPortStatistics alloc], "initWithPort:", self);
}

- (char)_localPDelayLogMeanInterval
{
  void *v2;
  void *v3;
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalPDelayLogMeanInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

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

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemotePDelayLogMeanInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

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
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MultipleRemotes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

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
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MeasuringPDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (_TSF_TSDgPTPPortStatistics)statistics
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
