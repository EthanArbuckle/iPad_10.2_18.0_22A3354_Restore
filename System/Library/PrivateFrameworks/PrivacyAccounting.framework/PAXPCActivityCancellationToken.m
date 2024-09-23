@implementation PAXPCActivityCancellationToken

- (PAXPCActivityCancellationToken)initWithActivity:(id)a3
{
  id v5;
  PAXPCActivityCancellationToken *v6;
  PAXPCActivityCancellationToken *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PAXPCActivityCancellationToken;
  v6 = -[PAXPCActivityCancellationToken init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_activity, a3);

  return v7;
}

- (BOOL)cancelled
{
  return xpc_activity_should_defer(self->_activity);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
