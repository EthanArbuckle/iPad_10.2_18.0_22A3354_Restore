@implementation RCPEvent

- (unint64_t)deliveryTimestamp
{
  return self->_deliveryTimestamp;
}

- (NSArray)preActions
{
  return self->_preActions;
}

+ (RCPEvent)eventWithHIDEvent:(__IOHIDEvent *)a3 deliveryTimeStamp:(unint64_t)a4 senderProperties:(id)a5 preActions:(id)a6
{
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;

  v10 = a5;
  v11 = a6;
  v12 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithDeliveryTimeStamp:", a4);
  CFRetain(a3);
  v13 = (void *)v12[2];
  v12[2] = v10;
  v12[3] = a3;
  v14 = v10;

  v15 = (void *)v12[4];
  v12[4] = v11;

  return (RCPEvent *)v12;
}

- (RCPEvent)initWithDeliveryTimeStamp:(unint64_t)a3
{
  RCPEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCPEvent;
  result = -[RCPEvent init](&v5, sel_init);
  if (result)
    result->_deliveryTimestamp = a3;
  return result;
}

- (__IOHIDEvent)hidEvent
{
  return self->_hidEvent;
}

- (RCPEventSenderProperties)senderProperties
{
  return self->_senderProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preActions, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
}

- (void)dealloc
{
  __IOHIDEvent *hidEvent;
  objc_super v4;

  hidEvent = self->_hidEvent;
  if (hidEvent)
    CFRelease(hidEvent);
  v4.receiver = self;
  v4.super_class = (Class)RCPEvent;
  -[RCPEvent dealloc](&v4, sel_dealloc);
}

- (RCPEvent)init
{
  return -[RCPEvent initWithDeliveryTimeStamp:](self, "initWithDeliveryTimeStamp:", mach_absolute_time());
}

- (RCPEvent)initWithCoder:(id)a3
{
  id v4;
  RCPEvent *v5;
  uint64_t v6;
  NSArray *preActions;
  NSArray *v8;
  uint64_t v9;
  RCPEventSenderProperties *senderProperties;
  RCPEventSenderProperties *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RCPEvent;
  v5 = -[RCPEvent init](&v13, sel_init);
  if (v5)
  {
    v5->_deliveryTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deliveryTimestamp"));
    v5->_hidEvent = (__IOHIDEvent *)MEMORY[0x1A85B7138](0, objc_msgSend(v4, "decodeObjectForKey:", CFSTR("hidEventData")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("preActions"));
    v6 = objc_claimAutoreleasedReturnValue();
    preActions = v5->_preActions;
    v5->_preActions = (NSArray *)v6;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = v5->_preActions;
      v5->_preActions = 0;

    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("senderProperties"));
    v9 = objc_claimAutoreleasedReturnValue();
    senderProperties = v5->_senderProperties;
    v5->_senderProperties = (RCPEventSenderProperties *)v9;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = v5->_senderProperties;
      v5->_senderProperties = 0;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const void *Data;
  RCPEventSenderProperties *senderProperties;
  NSArray *preActions;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInt64:forKey:", self->_deliveryTimestamp, CFSTR("deliveryTimestamp"));
  Data = (const void *)IOHIDEventCreateData();
  objc_msgSend(v7, "encodeObject:forKey:", CFAutorelease(Data), CFSTR("hidEventData"));
  senderProperties = self->_senderProperties;
  if (senderProperties)
    objc_msgSend(v7, "encodeObject:forKey:", senderProperties, CFSTR("senderProperties"));
  preActions = self->_preActions;
  if (preActions)
    objc_msgSend(v7, "encodeObject:forKey:", preActions, CFSTR("preActions"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchiveObjectWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (RCPEvent)eventWithHIDEvent:(__IOHIDEvent *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_opt_new();
  CFRetain(a3);
  v4[3] = a3;
  return (RCPEvent *)v4;
}

+ (RCPEvent)eventWithHIDEvent:(__IOHIDEvent *)a3 deliveryTimeStamp:(unint64_t)a4
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithDeliveryTimeStamp:", a4);
  CFRetain(a3);
  v5[3] = a3;
  return (RCPEvent *)v5;
}

- (unint64_t)timestamp
{
  return IOHIDEventGetTimeStamp();
}

- (id)eventAdjustedForDeliveryTimeInterval:(double)a3 eventEnvironment:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v6 = a4;
  v7 = (void *)-[RCPEvent copy](self, "copy");
  objc_msgSend(v6, "timeIntervalForMachAbsoluteTime:", -[RCPEvent deliveryTimestamp](self, "deliveryTimestamp"));
  v9 = a3 - v8;
  objc_msgSend(v7, "setDeliveryTimestamp:", objc_msgSend(v6, "machAbsoluteTimeForTimeInterval:", a3));
  objc_msgSend(v7, "hidEvent");
  objc_msgSend(v6, "timeIntervalForMachAbsoluteTime:", -[RCPEvent timestamp](self, "timestamp"));
  objc_msgSend(v6, "machAbsoluteTimeForTimeInterval:", v9 + v10);

  IOHIDEventSetTimeStamp();
  return v7;
}

- (void)setDeliveryTimestamp:(unint64_t)a3
{
  self->_deliveryTimestamp = a3;
}

- (void)setSenderProperties:(id)a3
{
  objc_storeStrong((id *)&self->_senderProperties, a3);
}

@end
