@implementation PUPXOneUpPresentationImplementationDelegate

- (void)oneUpPresentation:(id)a3 registerStateChangeHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerStateChangeHandler:", v5);

}

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewDidAppear:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewDidAppear:", v4);

}

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewWillAppear:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewWillAppear:", v4);

}

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewIsAppearing:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewIsAppearing:", v4);

}

- (void)oneUpPresentationInvalidatePresentingGeometry:(id)a3
{
  id v3;

  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidatePresentingGeometry");

}

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewWillDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewWillDisappear:", v4);

}

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewDidDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewDidDisappear:", v4);

}

- (BOOL)oneUpPresentation:(id)a3 canStartAnimated:(BOOL)a4
{
  uint64_t v4;
  void *v5;

  v4 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "canStartAnimated:", v4);

  return v4;
}

- (id)oneUpPresentationLastViewedAssetReference:(id)a3
{
  void *v3;
  void *v4;

  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastViewedAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)oneUpPresentation:(id)a3 startWithConfigurationHandler:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "startWithConfigurationHandler:", v5);

  return v7;
}

- (id)previewViewControllerForOneUpPresentation:(id)a3 allowingActions:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;

  v4 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewViewControllerAllowingActions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)oneUpPresentation:(id)a3 didDismissPreviewViewController:(id)a4 committing:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didDismissPreviewViewController:committing:", v7, v5);

}

- (void)oneUpPresentation:(id)a3 commitPreviewViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commitPreviewViewController:", v5);

}

- (BOOL)oneUpPresentationCanStop:(id)a3
{
  void *v3;
  char v4;

  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canStop");

  return v4;
}

- (void)oneUpPresentation:(id)a3 stopAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAnimated:", v4);

}

- (BOOL)oneUpPresentation:(id)a3 handlePresentingPinchGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:](PUPXOneUpPresentationImplementation, "implementationForOneUpPresentation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "handlePresentingPinchGestureRecognizer:", v5);

  return v7;
}

@end
