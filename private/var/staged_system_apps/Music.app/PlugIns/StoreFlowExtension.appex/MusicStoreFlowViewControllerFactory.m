@implementation MusicStoreFlowViewControllerFactory

- (id)newPlaceholderViewController
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicStoreFlowViewControllerFactory;
  v2 = -[MusicStoreFlowViewControllerFactory newPlaceholderViewController](&v6, "newPlaceholderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SUGradient gradientWithColor:](SUGradient, "gradientWithColor:", v3));
  objc_msgSend(v2, "setDefaultBackgroundGradient:", v4);

  objc_msgSend(v2, "setShouldShowLoadingView:", 0);
  return v2;
}

@end
