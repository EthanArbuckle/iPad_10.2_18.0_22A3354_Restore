@implementation RMXPCEvent

+ (id)newXPCEventForStream:(id)a3 notificationName:(id)a4 descriptor:(id)a5
{
  id v7;
  id v8;
  id v9;
  RMXPCEvent *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RMXPCEvent initWithStreamName:notificationName:descriptor:]([RMXPCEvent alloc], "initWithStreamName:notificationName:descriptor:", v9, v8, v7);

  return v10;
}

+ (id)newXPCEventForDarwinNotification:(id)a3
{
  id v3;
  RMXPCEvent *v4;
  void *v5;
  RMXPCEvent *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [RMXPCEvent alloc];
  v8 = CFSTR("Notification");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RMXPCEvent initWithStreamName:notificationName:descriptor:](v4, "initWithStreamName:notificationName:descriptor:", CFSTR("com.apple.notifyd.matching"), v3, v5);

  return v6;
}

+ (id)newXPCEventForDistributedNotification:(id)a3
{
  id v3;
  RMXPCEvent *v4;
  void *v5;
  RMXPCEvent *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [RMXPCEvent alloc];
  v8 = CFSTR("Name");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RMXPCEvent initWithStreamName:notificationName:descriptor:](v4, "initWithStreamName:notificationName:descriptor:", CFSTR("com.apple.distnoted.matching"), v3, v5);

  return v6;
}

- (RMXPCEvent)initWithStreamName:(id)a3 notificationName:(id)a4 descriptor:(id)a5
{
  id v9;
  id v10;
  id v11;
  RMXPCEvent *v12;
  RMXPCEvent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RMXPCEvent;
  v12 = -[RMXPCEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_streamName, a3);
    objc_storeStrong((id *)&v13->_notificationName, a4);
    objc_storeStrong((id *)&v13->_descriptor, a5);
  }

  return v13;
}

+ (id)eventKeyForStream:(id)a3 notificationName:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), a3, a4);
}

- (NSString)eventKey
{
  void *v3;
  void *v4;
  void *v5;

  -[RMXPCEvent streamName](self, "streamName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMXPCEvent notificationName](self, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMXPCEvent eventKeyForStream:notificationName:](RMXPCEvent, "eventKeyForStream:notificationName:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  RMXPCEvent *v4;
  BOOL v5;

  v4 = (RMXPCEvent *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[RMXPCEvent isEqualToEvent:](self, "isEqualToEvent:", v4);
  }

  return v5;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[RMXPCEvent streamName](self, "streamName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "streamName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[RMXPCEvent notificationName](self, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[RMXPCEvent descriptor](self, "descriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "descriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToDictionary:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[RMXPCEvent streamName](self, "streamName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RMXPCEvent notificationName](self, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RMXPCEvent descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RMXPCEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RMXPCEvent *v11;

  v4 = [RMXPCEvent alloc];
  -[RMXPCEvent streamName](self, "streamName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[RMXPCEvent notificationName](self, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[RMXPCEvent descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = -[RMXPCEvent initWithStreamName:notificationName:descriptor:](v4, "initWithStreamName:notificationName:descriptor:", v6, v8, v10);

  return v11;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (NSDictionary)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
}

@end
