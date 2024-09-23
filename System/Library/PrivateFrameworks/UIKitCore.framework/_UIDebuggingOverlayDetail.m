@implementation _UIDebuggingOverlayDetail

+ (id)detailWithTitle:(id)a3 detail:(id)a4
{
  id v7;
  id v8;
  id *v9;
  id *v10;

  v7 = a3;
  v8 = a4;
  v9 = (id *)objc_alloc_init((Class)objc_opt_class());
  v10 = v9;
  if (a1)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong(v10 + 2, a4);
  }

  return v10;
}

- (UIView)view
{
  return 0;
}

- (UIViewController)viewController
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_storeStrong((id *)&self->_detail, a3);
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(int64_t)a3
{
  self->_accessoryType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
