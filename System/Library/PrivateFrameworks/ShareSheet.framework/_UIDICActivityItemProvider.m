@implementation _UIDICActivityItemProvider

- (_UIDICActivityItemProvider)initWithPlaceholderItem:(id)a3 documentInteractionController:(id)a4
{
  id v6;
  _UIDICActivityItemProvider *v7;
  _UIDICActivityItemProvider *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_UIDICActivityItemProvider;
  v7 = -[UIActivityItemProvider initWithPlaceholderItem:](&v10, sel_initWithPlaceholderItem_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_documentInteractionController, v6);

  return v8;
}

- (id)loadedURL
{
  void *v2;
  void *v3;

  -[_UIDICActivityItemProvider documentInteractionController](self, "documentInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[_UIDICActivityItemProvider item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.UIKit.activity.CopyToPasteboard"));

  if (v9)
  {
    -[UIActivityItemProvider activityViewControllerPlaceholderItem:](self, "activityViewControllerPlaceholderItem:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;

  return v11;
}

- (id)activityViewController:(id)a3 openURLAnnotationForActivityType:(id)a4
{
  void *v4;
  void *v5;

  -[_UIDICActivityItemProvider documentInteractionController](self, "documentInteractionController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)main
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDICActivityItemProvider;
  -[UIActivityItemProvider main](&v5, sel_main);
  -[_UIDICActivityItemProvider loadedURL](self, "loadedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ui_downloadOperationForActivity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "main");

}

- (BOOL)_shouldExecuteItemOperationForActivity:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (_shouldExecuteItemOperationForActivity__onceToken != -1)
    dispatch_once(&_shouldExecuteItemOperationForActivity__onceToken, &__block_literal_global_45);
  if (_shouldExecuteItemOperationForActivity__executeInShareUI)
    v4 = objc_msgSend(v3, "_activitySupportsPromiseURLs") ^ 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

- (UIDocumentInteractionController)documentInteractionController
{
  return (UIDocumentInteractionController *)objc_loadWeakRetained((id *)&self->_documentInteractionController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_documentInteractionController);
}

@end
