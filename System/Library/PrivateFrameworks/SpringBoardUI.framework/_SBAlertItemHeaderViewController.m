@implementation _SBAlertItemHeaderViewController

- (_SBAlertItemHeaderViewController)initWithImage:(id)a3
{
  id v5;
  _SBAlertItemHeaderViewController *v6;
  uint64_t v7;
  UIImageView *imageView;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItem.m"), 500, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_SBAlertItemHeaderViewController;
  v6 = -[_SBAlertItemHeaderViewController init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v5);
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v7;

  }
  return v6;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  UIImageView *imageView;
  double v13;
  id v14;

  -[_SBAlertItemHeaderViewController image](self, "image");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v4 = v3;
  v6 = v5;
  -[_SBAlertItemHeaderViewController _expectedSize](self, "_expectedSize");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, v7, v9);
  objc_msgSend(v11, "setSize:", v8, v10);
  objc_msgSend(v11, "setBackgroundColor:", 0);
  objc_msgSend(v11, "addSubview:", self->_imageView);
  imageView = self->_imageView;
  -[_SBAlertItemHeaderViewController _topMarginOffset](self, "_topMarginOffset");
  -[UIImageView setFrame:](imageView, "setFrame:", 0.0, v13, v4, v6);
  objc_msgSend(v11, "size");
  -[_SBAlertItemHeaderViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[_SBAlertItemHeaderViewController setView:](self, "setView:", v11);

}

- (CGSize)_expectedSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[UIImageView size](self->_imageView, "size");
  v4 = v3;
  -[UIImageView size](self->_imageView, "size");
  v6 = v5;
  -[_SBAlertItemHeaderViewController _topMarginOffset](self, "_topMarginOffset");
  v8 = v6 + v7;
  -[_SBAlertItemHeaderViewController _bottomMarginOffset](self, "_bottomMarginOffset");
  v10 = v8 + v9;
  v11 = v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (double)_topMarginOffset
{
  return 20.0;
}

- (double)_bottomMarginOffset
{
  return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
