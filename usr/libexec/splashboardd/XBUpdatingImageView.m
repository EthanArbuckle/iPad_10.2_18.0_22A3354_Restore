@implementation XBUpdatingImageView

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double left;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)XBUpdatingImageView;
  -[XBUpdatingImageView traitCollectionDidChange:](&v18, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView image](self, "image"));
  objc_msgSend(v4, "capInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  left = UIEdgeInsetsZero.left;
  if (v10 == UIEdgeInsetsZero.bottom && v12 == UIEdgeInsetsZero.right && v6 == UIEdgeInsetsZero.top && v8 == left)
    v17 = 4;
  else
    v17 = 0;
  -[XBUpdatingImageView setContentMode:](self, "setContentMode:", v17, UIEdgeInsetsZero.top, left);
}

@end
