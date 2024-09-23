@implementation _UIDICActivityViewController

- (_UIDICActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 options:(unint64_t)a5
{
  _UIDICActivityViewController *v6;
  _UIDICActivityViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIDICActivityViewController;
  v6 = -[UIActivityViewController initWithActivityItems:applicationActivities:](&v9, sel_initWithActivityItems_applicationActivities_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_options = a5;
    -[UIActivityViewController setIsContentManaged:](v6, "setIsContentManaged:", a5 & 1);
  }
  return v7;
}

- (void)setDocumentInteractionActivityDelegate:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_storeWeak((id *)&self->_documentInteractionActivityDelegate, v4);
  location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71___UIDICActivityViewController_setDocumentInteractionActivityDelegate___block_invoke;
  v5[3] = &unk_1E4003BC0;
  objc_copyWeak(&v6, &location);
  -[UIActivityViewController setCompletionWithItemsHandler:](self, "setCompletionWithItemsHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (BOOL)hidesSystemActivities
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  return !-[_UIDICActivityViewController hidesSystemActivities](self, "hidesSystemActivities", a3);
}

- (void)_prepareActivity:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Mail"));

  v6 = v11;
  if (v5)
  {
    v7 = v11;
    objc_msgSend(v7, "subject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[_UIDICActivityViewController documentInteractionActivityDelegate](self, "documentInteractionActivityDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSubject:", v10);

    }
    v6 = v11;
  }

}

- (void)_performActivity:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDICActivityViewController;
  -[UIActivityViewController _performActivity:](&v5, sel__performActivity_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_documentInteractionActivityDelegate);
  -[_UIDICActivityViewController setDocumentInteractionActivityDelegateRetained:](self, "setDocumentInteractionActivityDelegateRetained:", WeakRetained);

  -[_UIDICActivityViewController setIsPerformingActivity:](self, "setIsPerformingActivity:", 1);
}

- (void)_willPerformInServiceActivityType:(id)a3 activitySpecificMetadata:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *openActivityTargetApplicationIdentifier;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (_UIActivityOpenInApplicationTypeForActivityType(v6))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("applicationIdentifier"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    openActivityTargetApplicationIdentifier = self->_openActivityTargetApplicationIdentifier;
    self->_openActivityTargetApplicationIdentifier = v8;

  }
  if (-[NSString length](self->_openActivityTargetApplicationIdentifier, "length"))
  {
    -[_UIDICActivityViewController documentInteractionActivityDelegate](self, "documentInteractionActivityDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityViewController:openActivityWillBeginSendingToApplication:", self, self->_openActivityTargetApplicationIdentifier);

  }
  v11.receiver = self;
  v11.super_class = (Class)_UIDICActivityViewController;
  -[UIActivityViewController _willPerformInServiceActivityType:activitySpecificMetadata:](&v11, sel__willPerformInServiceActivityType_activitySpecificMetadata_, v6, v7);

}

- (void)_handleDidFinishPerformingActivityType:(id)a3 completed:(BOOL)a4 resultItems:(id)a5 activityError:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  NSString *openActivityTargetApplicationIdentifier;
  id v14;

  v8 = a4;
  v14 = a3;
  v10 = a5;
  v11 = a6;
  -[_UIDICActivityViewController documentInteractionActivityDelegate](self, "documentInteractionActivityDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activityViewController:didFinishPresentingActivityType:", self, v14);
  if (-[_UIDICActivityViewController isPerformingActivity](self, "isPerformingActivity"))
  {
    -[_UIDICActivityViewController setIsPerformingActivity:](self, "setIsPerformingActivity:", 0);
    -[_UIDICActivityViewController setDocumentInteractionActivityDelegateRetained:](self, "setDocumentInteractionActivityDelegateRetained:", 0);
  }
  objc_msgSend(v12, "activityViewController:didFinishPerformingActivityType:completed:items:error:", self, v14, v8, v10, v11);
  if (self->_openActivityTargetApplicationIdentifier)
  {
    objc_msgSend(v12, "activityViewController:openActivityDidEndSendingToApplication:", self);
    openActivityTargetApplicationIdentifier = self->_openActivityTargetApplicationIdentifier;
    self->_openActivityTargetApplicationIdentifier = 0;

  }
}

- (_UIDICActivityViewControllerDelegate)documentInteractionActivityDelegate
{
  return (_UIDICActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_documentInteractionActivityDelegate);
}

- (BOOL)isPerformingActivity
{
  return self->_isPerformingActivity;
}

- (void)setIsPerformingActivity:(BOOL)a3
{
  self->_isPerformingActivity = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (_UIDICActivityViewControllerDelegate)documentInteractionActivityDelegateRetained
{
  return self->_documentInteractionActivityDelegateRetained;
}

- (void)setDocumentInteractionActivityDelegateRetained:(id)a3
{
  objc_storeStrong((id *)&self->_documentInteractionActivityDelegateRetained, a3);
}

- (NSString)openActivityTargetApplicationIdentifier
{
  return self->_openActivityTargetApplicationIdentifier;
}

- (void)setOpenActivityTargetApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_openActivityTargetApplicationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openActivityTargetApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_documentInteractionActivityDelegateRetained, 0);
  objc_destroyWeak((id *)&self->_documentInteractionActivityDelegate);
}

@end
