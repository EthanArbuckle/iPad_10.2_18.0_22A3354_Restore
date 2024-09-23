@implementation ICDocCamExtractedDocumentPresentationController

- (ICDocCamExtractedDocumentPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDocCamExtractedDocumentPresentationController;
  return -[ICDocCamExtractedDocumentPresentationController initWithPresentedViewController:presentingViewController:](&v5, "initWithPresentedViewController:presentingViewController:", a3, a4);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDocCamExtractedDocumentPresentationController containerView](self, "containerView"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[ICDocCamExtractedDocumentPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[ICDocCamExtractedDocumentPresentationController presentedView](self, "presentedView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

@end
