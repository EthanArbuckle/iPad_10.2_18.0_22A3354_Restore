@implementation SBActivityProvidedContentElement

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (SAActivityHosting)activityHost
{
  return (SAActivityHosting *)objc_loadWeakRetained((id *)&self->_activityHost);
}

- (void)setActivityHost:(id)a3
{
  objc_storeWeak((id *)&self->_activityHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityHost);
}

@end
