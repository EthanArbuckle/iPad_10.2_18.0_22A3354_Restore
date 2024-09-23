@implementation NEHelperServer

- (NEHelperServer)init
{
  __assert_rtn("-[NEHelperServer init]", "NEHelperServer.m", 107, "0");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
