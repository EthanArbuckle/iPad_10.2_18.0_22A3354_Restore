@implementation SBContinuitySessionServiceConnectionListenerFactory

- (id)newContinuitySessionServiceListenerForDelegate:(id)a3 serviceQueue:(id)a4
{
  id v5;
  id v6;
  _SBContinuitySessionServiceConnectionListener *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_SBContinuitySessionServiceConnectionListener initWithServiceQueue:]([_SBContinuitySessionServiceConnectionListener alloc], "initWithServiceQueue:", v5);

  -[_SBContinuitySessionServiceConnectionListener setDelegate:](v7, "setDelegate:", v6);
  return v7;
}

@end
