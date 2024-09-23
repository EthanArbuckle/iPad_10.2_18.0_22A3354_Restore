@implementation SiriAnalyticsLogicalTimeStamp

- (SiriAnalyticsLogicalTimeStamp)init
{

  return 0;
}

- (SiriAnalyticsLogicalTimeStamp)initWithMachAbsoluteTime:(unint64_t)a3 clockIdentifier:(id)a4
{
  id v6;
  SiriAnalyticsLogicalTimeStamp *v7;

  v6 = a4;
  if (_SiriAnalyticsMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SiriAnalyticsMachAbsoluteTimeRate_onceToken, &__block_literal_global_391);
  v7 = -[SiriAnalyticsLogicalTimeStamp initWithNanosecondsSinceBoot:clockIdentifier:](self, "initWithNanosecondsSinceBoot:clockIdentifier:", (unint64_t)(*(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate * (double)a3), v6);

  return v7;
}

- (SiriAnalyticsLogicalTimeStamp)initWithNanosecondsSinceBoot:(unint64_t)a3 clockIdentifier:(id)a4
{
  id v7;
  SiriAnalyticsLogicalTimeStamp *v8;
  SiriAnalyticsLogicalTimeStamp *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SiriAnalyticsLogicalTimeStamp;
  v8 = -[SiriAnalyticsLogicalTimeStamp init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_nanoSecondsSinceBoot = a3;
    objc_storeStrong((id *)&v8->_clockIdentifier, a4);
  }

  return v9;
}

- (id)loggingRepresentation
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0D9A500]);
  -[SiriAnalyticsLogicalTimeStamp clockIdentifier](self, "clockIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithNSUUID:", v4);

  v6 = objc_alloc_init(MEMORY[0x1E0D9A450]);
  objc_msgSend(v6, "setClockIdentifier:", v5);
  objc_msgSend(v6, "setTimestampInNanoseconds:", -[SiriAnalyticsLogicalTimeStamp nanoSecondsSinceBoot](self, "nanoSecondsSinceBoot"));

  return v6;
}

- (unint64_t)nanoSecondsSinceBoot
{
  return self->_nanoSecondsSinceBoot;
}

- (NSUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

@end
