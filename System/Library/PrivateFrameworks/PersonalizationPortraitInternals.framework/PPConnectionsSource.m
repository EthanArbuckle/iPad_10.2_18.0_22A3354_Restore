@implementation PPConnectionsSource

+ (id)sharedInstance
{
  return 0;
}

+ (id)identifier
{
  return CFSTR("unknown");
}

- (PPConnectionsLocationSourceDelegate)delegate
{
  return (PPConnectionsLocationSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
