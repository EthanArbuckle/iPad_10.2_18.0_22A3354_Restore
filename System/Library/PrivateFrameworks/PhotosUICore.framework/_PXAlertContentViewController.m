@implementation _PXAlertContentViewController

- (_PXAlertContentViewController)initWithContentView:(id)a3
{
  id v5;
  _PXAlertContentViewController *v6;
  _PXAlertContentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXAlertContentViewController;
  v6 = -[_PXAlertContentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentView, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)_PXAlertContentViewController;
  -[_PXAlertContentViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[_PXAlertContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_contentView);
  objc_msgSend(v3, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  -[UIView setCenter:](self->_contentView, "setCenter:", MidX, CGRectGetMidY(v11));
  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 45);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
