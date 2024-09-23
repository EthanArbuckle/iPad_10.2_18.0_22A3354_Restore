@implementation RCPGlobalPositionEvent

- (RCPGlobalPositionEvent)initWithLocation:(CGFloat)a3 zPosition:(double)a4 orientation:(__n128)a5 timestamp:(uint64_t)a6 senderProperties:(unint64_t)a7
{
  RCPEventSenderProperties *v13;
  RCPGlobalPositionEvent *v14;
  RCPEventSenderProperties *senderProperties;
  objc_super v18;

  v13 = a8;
  v18.receiver = a1;
  v18.super_class = (Class)RCPGlobalPositionEvent;
  v14 = -[RCPGlobalPositionEvent init](&v18, sel_init);
  v14->_location.x = a2;
  v14->_location.y = a3;
  v14->_zPosition = a4;
  *(__n128 *)&v14[1].super.isa = a5;
  senderProperties = v14->_senderProperties;
  v14->_timestamp = a7;
  v14->_senderProperties = v13;

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  unint64_t v19;
  void *v20;
  void *v21;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RCPGlobalPositionEvent location](self, "location");
  v6 = v5;
  -[RCPGlobalPositionEvent location](self, "location");
  v8 = v7;
  -[RCPGlobalPositionEvent zPosition](self, "zPosition");
  v10 = v9;
  -[RCPGlobalPositionEvent orientation](self, "orientation");
  v12 = v11;
  -[RCPGlobalPositionEvent orientation](self, "orientation");
  v14 = v13;
  -[RCPGlobalPositionEvent orientation](self, "orientation");
  v16 = v15;
  -[RCPGlobalPositionEvent orientation](self, "orientation");
  v18 = v17;
  v19 = -[RCPGlobalPositionEvent timestamp](self, "timestamp");
  -[RCPGlobalPositionEvent senderProperties](self, "senderProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { Location: (%f, %f), zPosition: %f, Orientation: (%f, %f, %f, %f), Timestamp: %llu, Sender Properties: %@ }>"), v4, v6, v8, v10, *(_QWORD *)&v12, *(_QWORD *)&v14, *(_QWORD *)&v16, *(_QWORD *)&v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLocation:zPosition:orientation:timestamp:senderProperties:", self->_timestamp, self->_senderProperties, self->_location.x, self->_location.y, self->_zPosition, *(double *)&self[1].super.isa);
}

- (CGPoint)location
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_location, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (double)orientation
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 48), 16, 1, 0);
  return *(double *)&v2;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (RCPEventSenderProperties)senderProperties
{
  return (RCPEventSenderProperties *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderProperties, 0);
}

@end
