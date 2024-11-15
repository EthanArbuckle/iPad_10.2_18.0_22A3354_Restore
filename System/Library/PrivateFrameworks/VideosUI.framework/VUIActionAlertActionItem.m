@implementation VUIActionAlertActionItem

- (VUIActionAlertActionItem)initWithTitle:(id)a3 titleImage:(id)a4 action:(id)a5 metrics:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VUIActionAlertActionItem *v15;
  VUIActionAlertActionItem *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VUIActionAlertActionItem;
  v15 = -[VUIActionAlertActionItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_titleImage, a4);
    objc_storeStrong((id *)&v16->_action, a5);
    objc_storeStrong((id *)&v16->_metrics, a6);
  }

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_titleImage, a3);
}

- (VUIAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
