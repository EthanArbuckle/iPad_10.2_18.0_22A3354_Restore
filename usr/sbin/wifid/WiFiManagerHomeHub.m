@implementation WiFiManagerHomeHub

- (WiFiManagerHomeHub)initWithManager:(__WiFiManager *)a3 queue:(id)a4 callback:(void *)a5
{
  id v9;
  WiFiManagerHomeHub *v10;
  WiFiManagerHomeHub *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WiFiManagerHomeHub;
  v10 = -[WiFiManagerHomeHub init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_manager = a3;
    objc_storeStrong((id *)&v10->_queue, a4);
    v11->_stateUpdatedCallback = a5;
    v11->_numberOfActiveEndpoints = 0;
  }

  return v11;
}

- (void)incrementActiveEndpointCount
{
  ++self->_numberOfActiveEndpoints;
  if ((id)-[WiFiManagerHomeHub numberOfActiveEndpoints](self, "numberOfActiveEndpoints") == (id)1)
    ((void (*)(__WiFiManager *))-[WiFiManagerHomeHub stateUpdatedCallback](self, "stateUpdatedCallback"))(-[WiFiManagerHomeHub manager](self, "manager"));
}

- (void)decrementActiveEndpointCount
{
  --self->_numberOfActiveEndpoints;
  if (!-[WiFiManagerHomeHub numberOfActiveEndpoints](self, "numberOfActiveEndpoints"))
    ((void (*)(__WiFiManager *))-[WiFiManagerHomeHub stateUpdatedCallback](self, "stateUpdatedCallback"))(-[WiFiManagerHomeHub manager](self, "manager"));
}

- (unint64_t)numberOfActiveEndpoints
{
  return self->_numberOfActiveEndpoints;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (void)stateUpdatedCallback
{
  return self->_stateUpdatedCallback;
}

- (void)setStateUpdatedCallback:(void *)a3
{
  self->_stateUpdatedCallback = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
