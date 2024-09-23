@implementation BFFSpinnerController

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return 1;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
