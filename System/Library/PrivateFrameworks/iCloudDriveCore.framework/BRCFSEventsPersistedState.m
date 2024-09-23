@implementation BRCFSEventsPersistedState

- (BRCFSEventsPersistedState)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRCFSEventsPersistedState;
  return -[BRCFSEventsPersistedState init](&v4, sel_init, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCFSEventsPersistedState;
  -[BRCPersistedState encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
