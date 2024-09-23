@implementation _DUISyncronousClientSessionDestination

- (id)serverDestinationProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->super._connection, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

@end
