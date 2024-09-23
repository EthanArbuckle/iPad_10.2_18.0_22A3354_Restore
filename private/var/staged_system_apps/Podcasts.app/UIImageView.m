@implementation UIImageView

- (void)mt_configureForDisplayingArtworkWithRadius:(double)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self, "layer"));
  objc_msgSend(v9, "setCornerRadius:", a3);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.08)));
  objc_msgSend(v9, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "scale");
  v8 = v7;

  objc_msgSend(v9, "setBorderWidth:", 1.0 / v8);
  -[UIImageView setClipsToBounds:](self, "setClipsToBounds:", 1);

}

@end
