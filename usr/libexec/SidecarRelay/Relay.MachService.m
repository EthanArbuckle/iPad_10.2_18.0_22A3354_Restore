@implementation Relay.MachService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtCC12SidecarRelay5Relay11MachService *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10003413C((uint64_t)v8, v7);

  return v9 & 1;
}

- (void).cxx_destruct
{

}

@end
