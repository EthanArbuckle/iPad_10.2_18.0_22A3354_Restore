@implementation SBSBackgroundActivityAssertionAcquisitionHandlerEntry

- (SBSBackgroundActivityAssertionAcquisitionHandlerEntry)init
{
  return -[SBSBackgroundActivityAssertionAcquisitionHandlerEntry initWithHandler:queue:](self, "initWithHandler:queue:", 0, 0);
}

- (SBSBackgroundActivityAssertionAcquisitionHandlerEntry)initWithHandler:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  SBSBackgroundActivityAssertionAcquisitionHandlerEntry *v8;
  uint64_t v9;
  id handler;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSBackgroundActivityAssertionAcquisitionHandlerEntry;
  v8 = -[SBSBackgroundActivityAssertionAcquisitionHandlerEntry init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    handler = v8->_handler;
    v8->_handler = (id)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
  }

  return v8;
}

- (id)handler
{
  return self->_handler;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
