@implementation TSDgPTPFDEtEPort

- (TSDgPTPFDEtEPort)initWithService:(id)a3 pid:(int)a4
{
  TSDgPTPFDEtEPort *v4;
  TSDgPTPFDEtEPort *v5;
  uint64_t v6;
  TSDgPTPPortStatistics *statistics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPFDEtEPort;
  v4 = -[TSDgPTPNetworkPort initWithService:pid:](&v9, "initWithService:pid:", a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPFDEtEPort _statistics](v4, "_statistics"));
    statistics = v5->_statistics;
    v5->_statistics = (TSDgPTPPortStatistics *)v6;

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
  v8.super_class = (Class)TSDgPTPFDEtEPort;
  -[TSDgPTPNetworkPort updateProperties](&v8, "updateProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPFDEtEPort _statistics](self, "_statistics"));
  v4 = objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014458;
  v6[3] = &unk_10003C610;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (id)_statistics
{
  return -[TSDgPTPPortStatistics initWithPort:]([TSDgPTPPortStatistics alloc], "initWithPort:", self);
}

- (TSDgPTPPortStatistics)statistics
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
