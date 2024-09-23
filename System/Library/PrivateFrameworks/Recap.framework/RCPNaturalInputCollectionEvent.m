@implementation RCPNaturalInputCollectionEvent

- (RCPNaturalInputCollectionEvent)initWithManipulators:(id)a3 selections:(id)a4 phase:(int64_t)a5 timestamp:(unint64_t)a6 senderProperties:(id)a7
{
  id v11;
  id v12;
  id v13;
  RCPNaturalInputCollectionEvent *v14;
  uint64_t v15;
  NSArray *manipulators;
  uint64_t v17;
  NSArray *selections;
  uint64_t v19;
  RCPEventSenderProperties *senderProperties;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)RCPNaturalInputCollectionEvent;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = -[RCPNaturalInputCollectionEvent init](&v22, sel_init);
  v15 = objc_msgSend(v13, "copy", v22.receiver, v22.super_class);

  manipulators = v14->_manipulators;
  v14->_manipulators = (NSArray *)v15;

  v17 = objc_msgSend(v12, "copy");
  selections = v14->_selections;
  v14->_selections = (NSArray *)v17;

  v14->_phase = a5;
  v14->_timestamp = a6;
  v19 = objc_msgSend(v11, "copy");

  senderProperties = v14->_senderProperties;
  v14->_senderProperties = (RCPEventSenderProperties *)v19;

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RCPNaturalInputCollectionEvent manipulators](self, "manipulators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPNaturalInputCollectionEvent selections](self, "selections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RCPNaturalInputCollectionEvent phase](self, "phase");
  v8 = -[RCPNaturalInputCollectionEvent timestamp](self, "timestamp");
  -[RCPNaturalInputCollectionEvent senderProperties](self, "senderProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { Manipulators: %@, Selections: %@, Phase: %lu, Timestamp: %llu, Sender Properties: %@ }>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithManipulators:selections:phase:timestamp:senderProperties:", self->_manipulators, self->_selections, self->_phase, self->_timestamp, self->_senderProperties);
}

- (NSArray)manipulators
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)selections
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)phase
{
  return self->_phase;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (RCPEventSenderProperties)senderProperties
{
  return (RCPEventSenderProperties *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_selections, 0);
  objc_storeStrong((id *)&self->_manipulators, 0);
}

@end
