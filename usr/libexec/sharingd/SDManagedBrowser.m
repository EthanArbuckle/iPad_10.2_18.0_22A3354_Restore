@implementation SDManagedBrowser

+ (id)sharedBrowser
{
  if (qword_1007C6C30 != -1)
    dispatch_once(&qword_1007C6C30, &stru_100719F08);
  return (id)qword_1007C6C38;
}

- (SDManagedBrowser)init
{
  SDManagedBrowser *v2;
  SDManagedBrowser *v3;
  NSDictionary *servers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDManagedBrowser;
  v2 = -[SDManagedBrowser init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    servers = v2->_servers;
    v2->_servers = 0;

    v3->_clientCount = 0;
    v3->_sendNotification = 0;
  }
  return v3;
}

- (void)setServers:(id)a3
{
  id v5;

  v5 = a3;
  if (sub_1000CE998(self->_servers, v5))
  {
    objc_storeStrong((id *)&self->_servers, a3);
    self->_sendNotification = 1;
  }

}

- (NSArray)nodes
{
  return -[NSDictionary allValues](self->_servers, "allValues");
}

- (void)start
{
  int clientCount;
  _QWORD block[5];

  clientCount = self->_clientCount;
  self->_clientCount = clientCount + 1;
  if (!clientCount)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A5C4C;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)stop
{
  int v2;
  NSDictionary *servers;

  v2 = self->_clientCount - 1;
  self->_clientCount = v2;
  if (!v2)
  {
    servers = self->_servers;
    self->_servers = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servers, 0);
}

@end
