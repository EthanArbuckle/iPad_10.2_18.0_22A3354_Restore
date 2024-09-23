@implementation PBBridgeIDSMessageInstance

+ (id)newMessageInstanceOfType:(unsigned __int16)a3 retryCount:(int64_t)a4 retryInterval:(double)a5 withAction:(id)a6
{
  uint64_t v8;
  id v9;
  PBBridgeIDSMessageInstance *v10;
  void *v11;

  v8 = a3;
  v9 = a6;
  v10 = objc_alloc_init(PBBridgeIDSMessageInstance);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeIDSMessageInstance setSentAbsoluteTime:](v10, "setSentAbsoluteTime:", v11);

  -[PBBridgeIDSMessageInstance setTypeID:](v10, "setTypeID:", v8);
  -[PBBridgeIDSMessageInstance setRetryAction:](v10, "setRetryAction:", v9);

  -[PBBridgeIDSMessageInstance setRetryCount:](v10, "setRetryCount:", a4);
  -[PBBridgeIDSMessageInstance setRetryInterval:](v10, "setRetryInterval:", a5);
  return v10;
}

- (PBBridgeIDSMessageInstance)init
{
  PBBridgeIDSMessageInstance *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBBridgeIDSMessageInstance;
  result = -[PBBridgeIDSMessageInstance init](&v3, sel_init);
  if (result)
    result->_typeID = -1;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t retryCount;
  double retryInterval;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)PBBridgeIDSMessageInstance;
  -[PBBridgeIDSMessageInstance description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  retryCount = self->_retryCount;
  retryInterval = self->_retryInterval;
  v7 = (void *)MEMORY[0x212BD94D4](self->_retryAction);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@) Retries: %d Interval: %f Action: %@"), v4, retryCount, *(_QWORD *)&retryInterval, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)sentAbsoluteTime
{
  return self->_sentAbsoluteTime;
}

- (void)setSentAbsoluteTime:(id)a3
{
  objc_storeStrong((id *)&self->_sentAbsoluteTime, a3);
}

- (unsigned)typeID
{
  return self->_typeID;
}

- (void)setTypeID:(unsigned __int16)a3
{
  self->_typeID = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (double)retryInterval
{
  return self->_retryInterval;
}

- (void)setRetryInterval:(double)a3
{
  self->_retryInterval = a3;
}

- (id)retryAction
{
  return self->_retryAction;
}

- (void)setRetryAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryAction, 0);
  objc_storeStrong((id *)&self->_sentAbsoluteTime, 0);
}

@end
