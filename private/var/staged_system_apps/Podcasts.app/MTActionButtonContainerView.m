@implementation MTActionButtonContainerView

- (MTActionButtonContainerView)initWithActionButtons:(id)a3
{
  id v4;
  MTActionButtonContainerView *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTActionButtonContainerView;
  v5 = -[MTActionButtonContainerView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[MTActionButtonContainerView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[MTActionButtonContainerView setActionButtons:](v5, "setActionButtons:", v4);
  }

  return v5;
}

- (void)setActionButtons:(id)a3
{
  NSArray *v4;
  NSArray *actionButtons;
  NSArray *v6;
  NSArray *v7;
  _QWORD v8[5];

  v4 = (NSArray *)a3;
  -[NSArray makeObjectsPerformSelector:](self->_actionButtons, "makeObjectsPerformSelector:", "removeFromSuperview");
  actionButtons = self->_actionButtons;
  self->_actionButtons = v4;
  v7 = v4;

  v6 = self->_actionButtons;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D698;
  v8[3] = &unk_1004A6090;
  v8[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v8);
  -[MTActionButtonContainerView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[7];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTActionButtonContainerView actionButtons](self, "actionButtons"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004D76C;
  v9[3] = &unk_1004A60B8;
  *(CGFloat *)&v9[5] = width;
  *(CGFloat *)&v9[6] = height;
  v9[4] = &v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  v7 = v6;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  _QWORD v4[6];
  _QWORD v5[4];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTActionButtonContainerView;
  -[MTActionButtonContainerView layoutSubviews](&v6, "layoutSubviews");
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTActionButtonContainerView actionButtons](self, "actionButtons"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004D880;
  v4[3] = &unk_1004A60E0;
  v4[4] = self;
  v4[5] = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  _Block_object_dispose(v5, 8);
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtons, 0);
}

@end
