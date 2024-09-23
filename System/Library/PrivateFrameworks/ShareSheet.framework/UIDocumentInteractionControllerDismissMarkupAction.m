@implementation UIDocumentInteractionControllerDismissMarkupAction

- (UIDocumentInteractionControllerDismissMarkupAction)initWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIDocumentInteractionControllerDismissMarkupAction *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  id completionHandler;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UIDocumentInteractionControllerDismissMarkupAction;
  v11 = -[UIDocumentInteractionControllerDismissMarkupAction init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    objc_storeStrong((id *)&v11->_image, a4);
    v14 = objc_msgSend(v10, "copy");
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = (id)v14;

  }
  return v11;
}

+ (id)actionWithTitle:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  UIDocumentInteractionControllerDismissMarkupAction *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[UIDocumentInteractionControllerDismissMarkupAction initWithTitle:image:handler:]([UIDocumentInteractionControllerDismissMarkupAction alloc], "initWithTitle:image:handler:", v6, 0, v5);

  return v7;
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  UIDocumentInteractionControllerDismissMarkupAction *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[UIDocumentInteractionControllerDismissMarkupAction initWithTitle:image:handler:]([UIDocumentInteractionControllerDismissMarkupAction alloc], "initWithTitle:image:handler:", v9, v8, v7);

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
