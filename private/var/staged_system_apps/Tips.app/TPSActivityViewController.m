@implementation TPSActivityViewController

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom"))
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

@end
