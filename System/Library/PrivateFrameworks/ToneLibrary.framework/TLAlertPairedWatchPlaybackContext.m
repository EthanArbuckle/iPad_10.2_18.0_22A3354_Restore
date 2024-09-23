@implementation TLAlertPairedWatchPlaybackContext

- (TLAlertPairedWatchPlaybackContext)initWithAlert:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  TLAlertPairedWatchPlaybackContext *v9;
  TLAlertPairedWatchPlaybackContext *v10;
  uint64_t v11;
  id completionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLAlertPairedWatchPlaybackContext;
  v9 = -[TLAlertPairedWatchPlaybackContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alert, a3);
    v11 = objc_msgSend(v8, "copy");
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v11;

  }
  return v10;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NACAlertProxy)alertProxy
{
  return self->_alertProxy;
}

- (void)setAlertProxy:(id)a3
{
  objc_storeStrong((id *)&self->_alertProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertProxy, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
