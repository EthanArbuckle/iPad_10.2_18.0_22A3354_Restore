@implementation QLCustomMessageForwarder

- (QLCustomMessageForwarder)initWithPreviewDelegate:(id)a3
{
  id v5;
  QLCustomMessageForwarder *v6;
  QLCustomMessageForwarder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLCustomMessageForwarder;
  v6 = -[QLCustomMessageForwarder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_previewDelegate, a3);

  return v7;
}

- (void)forwardMessageToHostOfCustomViewController:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  -[QLPreviewItemViewControllerDelegate previewItemViewController:wantsToForwardMessageToHost:completionHandler:](self->_previewDelegate, "previewItemViewController:wantsToForwardMessageToHost:completionHandler:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewDelegate, 0);
}

@end
