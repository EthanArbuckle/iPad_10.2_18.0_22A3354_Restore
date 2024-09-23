@implementation RTDaemonClientRegistrar

- (RTDaemonClientRegistrar)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RTDaemonClientRegistrar;
  return -[RTDaemonClientRegistrar init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (int64_t)countOfPendingInvocations
{
  return 0;
}

- (BOOL)invocationsPending
{
  return 0;
}

- (BOOL)registered
{
  return 0;
}

@end
