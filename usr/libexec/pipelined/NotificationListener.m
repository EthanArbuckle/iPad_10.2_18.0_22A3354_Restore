@implementation NotificationListener

- (NotificationListener)initWithCallback:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  NotificationListener *v8;
  NotificationListener *v9;
  NotificationListener *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NotificationListener;
  v8 = -[NotificationListener init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    -[NotificationListener setQ:](v8, "setQ:", v7);
    -[NotificationListener setCb:](v9, "setCb:", v6);
    v10 = v9;
  }

  return v9;
}

- (void)notify
{
  void *v3;
  NSObject *queue;

  queue = objc_claimAutoreleasedReturnValue(-[NotificationListener q](self, "q"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationListener cb](self, "cb"));
  dispatch_async(queue, v3);

}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void)setQ:(id)a3
{
  objc_storeStrong((id *)&self->_q, a3);
}

- (id)cb
{
  return self->_cb;
}

- (void)setCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cb, 0);
  objc_storeStrong((id *)&self->_q, 0);
}

@end
