@implementation TSKUIAlertViewCompletionHandlerDelegate

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKUIAlertViewCompletionHandlerDelegate;
  -[TSKUIAlertViewCompletionHandlerDelegate dealloc](&v3, sel_dealloc);
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  void (**v5)(id, int64_t);

  v5 = -[TSKUIAlertViewCompletionHandlerDelegate completionHandler](self, "completionHandler", a3);
  if (v5)
    v5[2](v5, a4);
}

- (id)completionHandler
{
  return self->mCompletionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
