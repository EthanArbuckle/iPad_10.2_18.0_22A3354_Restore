@implementation PUInternalImageQualityFeedbackActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BD70];
}

- (id)activityTitle
{
  return CFSTR("(Internal) Image Quality Feedback");
}

- (id)_systemImageName
{
  return CFSTR("photo");
}

- (id)assets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v2, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D7B8B0], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canShowInternalUI");

  if (v5)
  {
    -[PXActivity itemSourceController](self, "itemSourceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isPreparingIndividualItems") && v6)
      objc_msgSend(v6, "requestAssetsMediaTypeCount");

  }
  return 0;
}

- (id)activityViewController
{
  PXFeedbackImageQualityUIViewController *feedbackController;
  id v4;
  void *v5;
  PXFeedbackImageQualityUIViewController *v6;
  PXFeedbackImageQualityUIViewController *v7;

  feedbackController = self->_feedbackController;
  if (!feedbackController)
  {
    v4 = objc_alloc(MEMORY[0x1E0D7B420]);
    -[PUInternalImageQualityFeedbackActivity assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (PXFeedbackImageQualityUIViewController *)objc_msgSend(v4, "initWithAssets:delegate:", v5, self);
    v7 = self->_feedbackController;
    self->_feedbackController = v6;

    -[PXFeedbackImageQualityUIViewController setModalPresentationStyle:](self->_feedbackController, "setModalPresentationStyle:", 0);
    feedbackController = self->_feedbackController;
  }
  return feedbackController;
}

- (void)feedbackImageQualityUIViewController:(id)a3 didFinish:(BOOL)a4
{
  PXFeedbackImageQualityUIViewController *feedbackController;

  -[UIActivity activityDidFinish:](self, "activityDidFinish:", a4);
  feedbackController = self->_feedbackController;
  self->_feedbackController = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackController, 0);
}

@end
