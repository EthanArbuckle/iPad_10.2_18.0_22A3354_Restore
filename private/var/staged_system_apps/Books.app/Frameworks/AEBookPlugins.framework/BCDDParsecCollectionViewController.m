@implementation BCDDParsecCollectionViewController

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void (**v5)(void);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCDDParsecCollectionViewController dismissCompletionHandler](self, "dismissCompletionHandler", a3));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[BCDDParsecCollectionViewController dismissCompletionHandler](self, "dismissCompletionHandler"));
    v5[2]();

    -[BCDDParsecCollectionViewController setDismissCompletionHandler:](self, "setDismissCompletionHandler:", 0);
  }
}

@end
