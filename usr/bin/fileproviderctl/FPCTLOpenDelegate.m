@implementation FPCTLOpenDelegate

- (void)openResourceOperationDidComplete:(id)a3
{
  void (**completionHandler)(id, _QWORD);

  completionHandler = (void (**)(id, _QWORD))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, 0);
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  void (**completionHandler)(id, id);

  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, a4);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
