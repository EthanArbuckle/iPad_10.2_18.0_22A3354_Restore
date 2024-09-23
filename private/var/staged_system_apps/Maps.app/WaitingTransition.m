@implementation WaitingTransition

- (ContaineeProtocol)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (ContaineeProtocol)oldViewController
{
  return (ContaineeProtocol *)objc_loadWeakRetained((id *)&self->_oldViewController);
}

- (void)setOldViewController:(id)a3
{
  objc_storeWeak((id *)&self->_oldViewController, a3);
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (BOOL)switchContext
{
  return self->_switchContext;
}

- (void)setSwitchContext:(BOOL)a3
{
  self->_switchContext = a3;
}

- (BOOL)isAlreadyInStack
{
  return self->_isAlreadyInStack;
}

- (void)setIsAlreadyInStack:(BOOL)a3
{
  self->_isAlreadyInStack = a3;
}

- (id)postProcess
{
  return self->_postProcess;
}

- (void)setPostProcess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_postProcess, 0);
  objc_destroyWeak((id *)&self->_oldViewController);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
