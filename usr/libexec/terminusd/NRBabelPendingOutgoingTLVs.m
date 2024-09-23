@implementation NRBabelPendingOutgoingTLVs

- (NRBabelPendingOutgoingTLVs)initWithInterval:(unsigned __int16)a3
{
  unsigned int v3;
  NRBabelPendingOutgoingTLVs *v4;
  NRBabelPendingOutgoingTLVs *v5;
  double v6;
  NSMutableArray *v7;
  NSMutableArray *tlvs;
  id v10;
  int IsLevelEnabled;
  id v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  objc_super v19;

  v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NRBabelPendingOutgoingTLVs;
  v4 = -[NRBabelPendingOutgoingTLVs init](&v19, "init");
  if (!v4)
  {
    v10 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v10, 16);

    if (IsLevelEnabled)
    {
      v12 = sub_1000B093C();
      _NRLogWithArgs(v12, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelPendingOutgoingTLVs initWithInterval:]", 1298);

    }
    v13 = _os_log_pack_size(12);
    v14 = (char *)&v18 - ((__chkstk_darwin(v13) + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = __error();
    v16 = _os_log_pack_fill(v14, v13, *v15, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v16 = 136446210;
    *(_QWORD *)(v16 + 4) = "-[NRBabelPendingOutgoingTLVs initWithInterval:]";
    v17 = sub_1000B093C();
    _NRLogAbortWithPack(v17, v14);
  }
  v5 = v4;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v5->_minTime = v6 + (double)(unsigned __int16)((429496730 * (unint64_t)(9 * v3)) >> 32) * 0.01;
  v5->_maxTime = v6 + (double)v3 * 0.01;
  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  tlvs = v5->_tlvs;
  v5->_tlvs = v7;

  return v5;
}

- (NSMutableArray)tlvs
{
  return self->_tlvs;
}

- (void)setTlvs:(id)a3
{
  objc_storeStrong((id *)&self->_tlvs, a3);
}

- (double)minTime
{
  return self->_minTime;
}

- (void)setMinTime:(double)a3
{
  self->_minTime = a3;
}

- (double)maxTime
{
  return self->_maxTime;
}

- (void)setMaxTime:(double)a3
{
  self->_maxTime = a3;
}

- (BOOL)representsIHU
{
  return self->_representsIHU;
}

- (void)setRepresentsIHU:(BOOL)a3
{
  self->_representsIHU = a3;
}

- (BOOL)representsUpdate
{
  return self->_representsUpdate;
}

- (void)setRepresentsUpdate:(BOOL)a3
{
  self->_representsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlvs, 0);
}

@end
