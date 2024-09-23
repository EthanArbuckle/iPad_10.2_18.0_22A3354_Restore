@implementation SIOrderedEvent

- (SIOrderedEvent)initWithTimestamp:(id)a3 messageUUID:(id)a4 topLevelUnionType:(id)a5
{
  id v9;
  id v10;
  id v11;
  SIOrderedEvent *v12;
  SIOrderedEvent *v13;
  SILogicalTimestampInternal *v14;
  void *v15;
  SILogicalTimestampInternal *v16;
  SIOrderedEventInternal *v17;
  SIOrderedEventInternal *underlying;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SIOrderedEvent;
  v12 = -[SIOrderedEvent init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_underlyingTimestamp, a3);
    v14 = [SILogicalTimestampInternal alloc];
    objc_msgSend(v9, "clockIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SILogicalTimestampInternal initWithClockIdentifier:nanosecondsSinceBoot:](v14, "initWithClockIdentifier:nanosecondsSinceBoot:", v15, objc_msgSend(v9, "nanoSecondsSinceBoot"));

    v17 = -[SIOrderedEventInternal initWithLogicalTimestamp:messageUUID:tluEvent:]([SIOrderedEventInternal alloc], "initWithLogicalTimestamp:messageUUID:tluEvent:", v16, v10, v11);
    underlying = v13->_underlying;
    v13->_underlying = v17;

  }
  return v13;
}

- (SIOrderedEvent)initWithInternalType:(id)a3
{
  id v5;
  SIOrderedEvent *v6;
  SIOrderedEvent *v7;
  SILogicalTimestamp *v8;
  void *v9;
  uint64_t v10;
  SILogicalTimestamp *underlyingTimestamp;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIOrderedEvent;
  v6 = -[SIOrderedEvent init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlying, a3);
    v8 = [SILogicalTimestamp alloc];
    -[SIOrderedEventInternal logicalTimestamp](v7->_underlying, "logicalTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SILogicalTimestamp initWithInternalType:](v8, "initWithInternalType:", v9);
    underlyingTimestamp = v7->_underlyingTimestamp;
    v7->_underlyingTimestamp = (SILogicalTimestamp *)v10;

  }
  return v7;
}

- (SIOrderedEvent)initWithData:(id)a3
{
  id v4;
  SIOrderedEventInternal *v5;
  SIOrderedEvent *v6;

  v4 = a3;
  v5 = -[SIOrderedEventInternal initWithData:]([SIOrderedEventInternal alloc], "initWithData:", v4);

  if (v5)
  {
    self = -[SIOrderedEvent initWithInternalType:](self, "initWithInternalType:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SILogicalTimestamp)logicalTimestamp
{
  return self->_underlyingTimestamp;
}

- (SISchemaTopLevelUnionType)topLevelUnionType
{
  return -[SIOrderedEventInternal tluEvent](self->_underlying, "tluEvent");
}

- (NSUUID)messageUUID
{
  return -[SIOrderedEventInternal messageUUID](self->_underlying, "messageUUID");
}

- (id)serialize
{
  return (id)-[SIOrderedEventInternal serialize](self->_underlying, "serialize");
}

- (id)data
{
  return (id)-[SIOrderedEventInternal data](self->_underlying, "data");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingTimestamp, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

+ (id)deserializeFromData:(id)a3
{
  void *v3;
  SIOrderedEvent *v4;

  +[SIOrderedEventInternal deserializeFrom:](SIOrderedEventInternal, "deserializeFrom:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SIOrderedEvent initWithInternalType:]([SIOrderedEvent alloc], "initWithInternalType:", v3);
  else
    v4 = 0;

  return v4;
}

@end
