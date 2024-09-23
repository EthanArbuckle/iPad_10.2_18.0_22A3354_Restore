@implementation PXSurveyQuestionConfigurationHandlers

- (id)didSelectAssetHandler
{
  return self->_didSelectAssetHandler;
}

- (void)setDidSelectAssetHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)pushViewControllerHandler
{
  return self->_pushViewControllerHandler;
}

- (void)setPushViewControllerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)presentViewControllerHandler
{
  return self->_presentViewControllerHandler;
}

- (void)setPresentViewControllerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentViewControllerHandler, 0);
  objc_storeStrong(&self->_pushViewControllerHandler, 0);
  objc_storeStrong(&self->_didSelectAssetHandler, 0);
}

@end
