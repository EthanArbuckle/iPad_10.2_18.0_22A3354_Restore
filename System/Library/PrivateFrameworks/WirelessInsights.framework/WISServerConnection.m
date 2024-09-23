@implementation WISServerConnection

- (WISServerConnection)initWithComponentId:(unsigned int)a3
{
  WISServerConnection *v4;
  wis::WISServerConnection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WISServerConnection;
  v4 = -[WISServerConnection init](&v7, sel_init);
  if (v4)
  {
    v5 = (wis::WISServerConnection *)operator new();
    wis::WISServerConnection::WISServerConnection(v5, a3);
    v4->fServerConnection = v5;
  }
  return v4;
}

- (WISServerConnection)initWithComponentId:(unsigned int)a3 andBlockOnConfiguration:(BOOL)a4
{
  WISServerConnection *v6;
  wis::WISServerConnection *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WISServerConnection;
  v6 = -[WISServerConnection init](&v9, sel_init);
  if (v6)
  {
    v7 = (wis::WISServerConnection *)operator new();
    wis::WISServerConnection::WISServerConnection(v7, a3, a4);
    v6->fServerConnection = v7;
  }
  return v6;
}

- (void)dealloc
{
  wis::WISServerConnection *fServerConnection;
  objc_super v4;

  fServerConnection = (wis::WISServerConnection *)self->fServerConnection;
  if (fServerConnection)
  {
    wis::WISServerConnection::~WISServerConnection(fServerConnection);
    MEMORY[0x24BD13BAC]();
    self->fServerConnection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WISServerConnection;
  -[WISServerConnection dealloc](&v4, sel_dealloc);
}

- (id)newMetricContainerWithIdentifier:(unsigned int)a3
{
  uint64_t v3;
  wis::MetricFactory *SharedMetricFactory;
  id result;
  wis::MetricContainer *v6;
  WISMetricContainer *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD *)&a3;
  SharedMetricFactory = (wis::MetricFactory *)wis::MetricFactory::getSharedMetricFactory((wis::MetricFactory *)self);
  result = wis::MetricFactory::newMetricContainerWithIdentifier(SharedMetricFactory, v3);
  if (result)
  {
    v6 = (wis::MetricContainer *)result;
    v7 = [WISMetricContainer alloc];
    v10 = (void *)objc_msgSend_initWithMetricId_(v7, v8, v3, v9);
    wis::MetricContainer::~MetricContainer(v6);
    MEMORY[0x24BD13BAC]();
    return v10;
  }
  return result;
}

- (BOOL)submitMetric:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *fServerConnection;
  wis *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  v8 = v4;
  fServerConnection = self->fServerConnection;
  if (fServerConnection)
  {
    v10 = (wis *)objc_msgSend_metricId(v4, v5, v6, v7);
    objc_msgSend_metric(v8, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WISPostMetric(v10, v14);

  }
  return fServerConnection != 0;
}

- (BOOL)registerQueriableMetric:(unsigned int)a3 callback:(id)a4
{
  id v6;
  void *v7;
  uint64_t *fServerConnection;
  char v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = v6;
  fServerConnection = (uint64_t *)self->fServerConnection;
  if (fServerConnection)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_24A58AC4C;
    v11[3] = &unk_251BE23C8;
    v12 = v6;
    v9 = wis::WISServerConnection::RegisterQueriableMetricCallbackForIdentifier(fServerConnection, (uint64_t)v11, a3);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)registerQueriableMetricCallback:(id)a3 forIdentifier:(unsigned int)a4
{
  return MEMORY[0x24BEDD108](self, sel_registerQueriableMetric_callback_, *(_QWORD *)&a4, a3);
}

- (BOOL)registerConfigChangeCallback:(id)a3
{
  id v4;
  void *v5;
  uint64_t *fServerConnection;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  fServerConnection = (uint64_t *)self->fServerConnection;
  if (fServerConnection)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_24A58AD14;
    v8[3] = &unk_251BE23F0;
    v9 = v4;
    LOBYTE(fServerConnection) = wis::WISServerConnection::registerCallBackForConfigChange(fServerConnection, v8);

  }
  return (char)fServerConnection;
}

- (id)getComponentConfigurationParameters
{
  wis::WISServerConnection *fServerConnection;

  fServerConnection = (wis::WISServerConnection *)self->fServerConnection;
  if (fServerConnection)
  {
    wis::WISServerConnection::copyComponentParameters(fServerConnection);
    fServerConnection = (wis::WISServerConnection *)objc_claimAutoreleasedReturnValue();
  }
  return fServerConnection;
}

- (void)registerComponentParametersChangeCallback:(id)a3
{
  id v4;
  void *v5;
  uint64_t *fServerConnection;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  fServerConnection = (uint64_t *)self->fServerConnection;
  if (fServerConnection)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_24A58AF3C;
    v7[3] = &unk_251BE2418;
    v8 = v4;
    wis::WISServerConnection::registerComponentParametersChangeCallback(fServerConnection, v7);

  }
}

- (void)flushToQueue:(dispatch_queue_s *)a3 block:(id)a4
{
  wis::WISServerConnection::flush((int)self->fServerConnection, (dispatch_object_t)a3, (uint64_t)a4);
}

- (BOOL)sendTriggerForEvent:(unsigned int)a3 observeEventWithCallback:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  wis::WISServerConnection *fServerConnection;
  BOOL v9;
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  fServerConnection = (wis::WISServerConnection *)self->fServerConnection;
  if (fServerConnection)
  {
    v11 = v6;
    v9 = wis::WISServerConnection::SendTriggerForEventAndObserveEventWithCallback(fServerConnection, v4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
