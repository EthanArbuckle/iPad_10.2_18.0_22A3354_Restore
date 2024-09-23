@implementation WFScanChannel

- (WFScanChannel)initWithChannel:(int64_t)a3 flags:(int64_t)a4
{
  WFScanChannel *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFScanChannel;
  result = -[WFScanChannel init](&v7, sel_init);
  if (result)
  {
    result->_channel = a3;
    result->_flags = a4;
  }
  return result;
}

- (WFScanChannel)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFScanChannel init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: Channel: %d Flags: %d>"), v5, -[WFScanChannel channel](self, "channel"), -[WFScanChannel flags](self, "flags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

@end
