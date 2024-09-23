@implementation SPRRemoteService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC14softposreaderd16SPRRemoteService *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10000C5EC(v7);

  return v9 & 1;
}

- (_TtC14softposreaderd16SPRRemoteService)init
{
  return (_TtC14softposreaderd16SPRRemoteService *)sub_10000AD1C(self, (uint64_t)a2, type metadata accessor for SPRRemoteService);
}

@end
