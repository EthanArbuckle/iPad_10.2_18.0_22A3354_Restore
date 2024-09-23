@implementation SBExternalDisplayServiceConnectionListenerFactory

- (id)newExternalDisplayServiceListenerForDelegate:(id)a3 serviceQueue:(id)a4
{
  id v5;
  id v6;
  _SBExternalDisplayServiceConnectionListener *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_SBExternalDisplayServiceConnectionListener initWithServiceQueue:]([_SBExternalDisplayServiceConnectionListener alloc], "initWithServiceQueue:", v5);

  -[_SBExternalDisplayServiceConnectionListener setDelegate:](v7, "setDelegate:", v6);
  return v7;
}

@end
