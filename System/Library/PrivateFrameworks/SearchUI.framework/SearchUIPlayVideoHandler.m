@implementation SearchUIPlayVideoHandler

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v4;
  SearchUIMediaPlayerViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  SearchUIMediaPlayerViewController *v9;

  v4 = a3;
  v5 = [SearchUIMediaPlayerViewController alloc];
  v6 = (void *)MEMORY[0x1E0D8C5E0];
  objc_msgSend(v4, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "punchoutWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SearchUIMediaPlayerViewController initWithDestination:](v5, "initWithDestination:", v8);

  return v9;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  -[SearchUICommandHandler viewController](self, "viewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "showFullScreenPresentationFromView:completion:", v7, 0);
}

- (unint64_t)destination
{
  return 3;
}

@end
