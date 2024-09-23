@implementation UIProgressIndicator

- (int)progressIndicatorStyle
{
  return -[UIActivityIndicatorView activityIndicatorViewStyle](self, "activityIndicatorViewStyle");
}

- (void)setProgressIndicatorStyle:(int)a3
{
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self, "setActivityIndicatorViewStyle:", a3);
}

+ (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "defaultSizeForStyle:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setAnimating:(BOOL)a3
{
  if (a3)
    -[UIActivityIndicatorView startAnimating](self, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](self, "stopAnimating");
}

@end
