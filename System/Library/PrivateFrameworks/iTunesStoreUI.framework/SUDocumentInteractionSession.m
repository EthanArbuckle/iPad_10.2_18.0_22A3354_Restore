@implementation SUDocumentInteractionSession

- (SUDocumentInteractionSession)initWithDocumentInteractionController:(id)a3
{
  SUDocumentInteractionSession *v4;
  UIDocumentInteractionController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUDocumentInteractionSession;
  v4 = -[SUDocumentInteractionSession init](&v7, sel_init);
  if (v4)
  {
    v5 = (UIDocumentInteractionController *)a3;
    v4->_documentInteractionController = v5;
    -[UIDocumentInteractionController setDelegate:](v5, "setDelegate:", v4);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIDocumentInteractionController setDelegate:](self->_documentInteractionController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUDocumentInteractionSession;
  -[SUDocumentInteractionSession dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  SUDocumentInteractionSession *v3;

  -[UIDocumentInteractionController setDelegate:](self->_documentInteractionController, "setDelegate:", 0);
  -[UIDocumentInteractionController dismissMenuAnimated:](self->_documentInteractionController, "dismissMenuAnimated:", 1);
  if (self->_completionHandler)
  {
    v3 = self;
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(id)a3
{
  SUDocumentInteractionSession *v4;

  if (self->_completionHandler)
  {
    v4 = self;
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)documentInteractionController:(id)a3 willBeginSendingToApplication:(id)a4
{
  SUDocumentInteractionSession *v5;

  objc_msgSend(a3, "setDelegate:", 0);
  if (self->_completionHandler)
  {
    v5 = self;
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
