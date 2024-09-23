@implementation SLMessageComposeViewControllerDelegateAdapter

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  -[SLMessageComposeViewControllerDelegateAdapter resultHandler](self, "resultHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SLMessageComposeViewControllerDelegateAdapter resultHandler](self, "resultHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, int64_t))v7)[2](v7, v8, a4);

  }
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
}

@end
