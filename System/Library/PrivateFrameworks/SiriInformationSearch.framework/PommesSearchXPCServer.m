@implementation PommesSearchXPCServer

- (PommesSearchXPCServer)init
{
  return (PommesSearchXPCServer *)PommesSearchServiceDelegate.init()();
}

- (void)dealloc
{
  PommesSearchXPCServer *v2;

  v2 = self;
  PommesSearchServiceDelegate.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  PommesSearchXPCServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized PommesSearchServiceDelegate.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

@end
