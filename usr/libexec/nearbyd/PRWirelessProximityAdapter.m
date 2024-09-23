@implementation PRWirelessProximityAdapter

- (PRWirelessProximityAdapter)initWithQueue:(id)a3
{
  id v6;
  PRWirelessProximityAdapter *v7;
  PRWirelessProximityAdapter *v8;
  WPRanging *v9;
  WPRanging *wpRanging;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRWirelessProximityAdapter.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PRWirelessProximityAdapter;
  v7 = -[PRWirelessProximityAdapter init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_queue, a3);
    v9 = (WPRanging *)objc_msgSend(objc_alloc((Class)WPRanging), "initWithDelegate:queue:", v8, v8->_queue);
    wpRanging = v8->_wpRanging;
    v8->_wpRanging = v9;

  }
  return v8;
}

- (void)enableSPMIMessagingWithHandler:(id)a3
{
  id v4;
  WPRanging *wpRanging;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  wpRanging = self->_wpRanging;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002ACF8C;
  v7[3] = &unk_100812748;
  v8 = v4;
  v6 = v4;
  -[WPRanging enableRanging:reply:](wpRanging, "enableRanging:reply:", 1, v7);

}

- (void)querySPMIMessagingStatusWithHandler:(id)a3
{
  id v4;
  WPRanging *wpRanging;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  wpRanging = self->_wpRanging;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002AD01C;
  v7[3] = &unk_100812770;
  v8 = v4;
  v6 = v4;
  -[WPRanging isRangingEnabledReply:](wpRanging, "isRangingEnabledReply:", v7);

}

- (void)rangingDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_wiproxStateHandler)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002AD0C0;
    v7[3] = &unk_100812798;
    v7[4] = self;
    v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);

  }
}

- (id)wiproxStateHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setWiproxStateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wiproxStateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wpRanging, 0);
}

@end
