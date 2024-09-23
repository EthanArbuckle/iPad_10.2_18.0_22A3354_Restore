@implementation _SBUserNotificationAlertElement

- (void)setAlertHost:(id)a3
{
  void *v4;
  id obj;

  obj = a3;
  if (-[_SBUserNotificationAlertElement preventsAutomaticDismissal](self, "preventsAutomaticDismissal"))
  {
    objc_storeWeak((id *)&self->_alertHost, obj);
    objc_msgSend(obj, "alertAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAutomaticallyInvalidatable:lockingWithKey:reason:", 0, CFSTR("_SBUserNotificationAlertElement"), CFSTR("_SBUserNotificationAlertElement.preventsAutomaticDismissal is YES"));

  }
}

- (id)alertHost
{
  return objc_loadWeakRetained((id *)&self->_alertHost);
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
  objc_storeStrong((id *)&self->_keyColor, a3);
}

- (BOOL)preventsAutomaticDismissal
{
  return self->_preventsAutomaticDismissal;
}

- (void)setPreventsAutomaticDismissal:(BOOL)a3
{
  self->_preventsAutomaticDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_destroyWeak((id *)&self->_alertHost);
}

@end
