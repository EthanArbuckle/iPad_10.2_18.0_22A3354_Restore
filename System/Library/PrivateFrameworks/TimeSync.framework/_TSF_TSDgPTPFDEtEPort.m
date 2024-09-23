@implementation _TSF_TSDgPTPFDEtEPort

- (_TSF_TSDgPTPFDEtEPort)initWithService:(id)a3 pid:(int)a4
{
  _TSF_TSDgPTPFDEtEPort *v4;
  _TSF_TSDgPTPFDEtEPort *v5;
  uint64_t v6;
  _TSF_TSDgPTPPortStatistics *statistics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPFDEtEPort;
  v4 = -[_TSF_TSDgPTPNetworkPort initWithService:pid:](&v9, sel_initWithService_pid_, a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    -[_TSF_TSDgPTPFDEtEPort _statistics](v4, "_statistics");
    v6 = objc_claimAutoreleasedReturnValue();
    statistics = v5->_statistics;
    v5->_statistics = (_TSF_TSDgPTPPortStatistics *)v6;

  }
  return v5;
}

- (void)updateProperties
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TSF_TSDgPTPFDEtEPort;
  -[_TSF_TSDgPTPNetworkPort updateProperties](&v8, sel_updateProperties);
  -[_TSF_TSDgPTPFDEtEPort _statistics](self, "_statistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41___TSF_TSDgPTPFDEtEPort_updateProperties__block_invoke;
  v6[3] = &unk_1E694B118;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (id)_statistics
{
  return -[_TSF_TSDgPTPPortStatistics initWithPort:]([_TSF_TSDgPTPPortStatistics alloc], "initWithPort:", self);
}

- (_TSF_TSDgPTPPortStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_statistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
