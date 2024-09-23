@implementation NRDTestServer

- (void)dealloc
{
  NSObject *udpInputSource;
  OS_dispatch_source *v4;
  NSObject *udpInputSourceCloud;
  OS_dispatch_source *v6;
  objc_super v7;

  if (qword_1001E4620 != -1)
    dispatch_once(&qword_1001E4620, &stru_1001B6910);
  if (_NRLogIsLevelEnabled(qword_1001E4618, 1))
  {
    if (qword_1001E4620 != -1)
      dispatch_once(&qword_1001E4620, &stru_1001B6910);
    _NRLogWithArgs(qword_1001E4618, 1, "%s%.30s:%-4d Dealloc: %@", ", "-[NRDTestServer dealloc]", 236, self);
  }
  if (self)
  {
    udpInputSource = self->_udpInputSource;
    if (udpInputSource)
    {
      dispatch_source_cancel(udpInputSource);
      v4 = self->_udpInputSource;
      self->_udpInputSource = 0;

    }
    udpInputSourceCloud = self->_udpInputSourceCloud;
    if (udpInputSourceCloud)
    {
      dispatch_source_cancel(udpInputSourceCloud);
      v6 = self->_udpInputSourceCloud;
      self->_udpInputSourceCloud = 0;

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)NRDTestServer;
  -[NRDTestServer dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePreferencesDictionary, 0);
  objc_storeStrong((id *)&self->_udpInputSourceCloud, 0);
  objc_storeStrong((id *)&self->_udpInputSource, 0);
  objc_storeStrong((id *)&self->_allConnections, 0);
  objc_storeStrong((id *)&self->_cloudServiceConnector, 0);
  objc_storeStrong((id *)&self->_serviceConnector, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
