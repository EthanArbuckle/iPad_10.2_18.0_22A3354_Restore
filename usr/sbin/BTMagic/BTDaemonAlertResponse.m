@implementation BTDaemonAlertResponse

+ (id)responseWithAlert:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  BTDaemonAlertResponse *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_new(BTDaemonAlertResponse);
  -[BTDaemonAlertResponse setAlert:](v7, "setAlert:", v6);

  -[BTDaemonAlertResponse setResponseHandler:](v7, "setResponseHandler:", v5);
  return v7;
}

- (BTDaemonAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
