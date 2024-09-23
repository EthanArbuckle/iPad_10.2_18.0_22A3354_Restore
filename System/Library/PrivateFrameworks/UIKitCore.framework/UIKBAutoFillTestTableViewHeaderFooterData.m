@implementation UIKBAutoFillTestTableViewHeaderFooterData

- (UIKBAutoFillTestTableViewHeaderFooterData)initWithTitle:(id)a3 view:(id)a4 height:(double)a5
{
  id v8;
  id v9;
  UIKBAutoFillTestTableViewHeaderFooterData *v10;
  uint64_t v11;
  NSString *title;
  UIKBAutoFillTestTableViewHeaderFooterData *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIKBAutoFillTestTableViewHeaderFooterData;
  v10 = -[UIKBAutoFillTestTableViewHeaderFooterData init](&v15, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    objc_storeStrong((id *)&v10->_headerFooterView, a4);
    v10->_height = a5;
    v13 = v10;
  }

  return v10;
}

- (UIKBAutoFillTestTableViewHeaderFooterData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  UIKBAutoFillTestTableViewHeaderFooterData *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("headerFooterView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("height"));
  v8 = v7;

  v9 = -[UIKBAutoFillTestTableViewHeaderFooterData initWithTitle:view:height:](self, "initWithTitle:view:height:", v5, v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *title;
  UIView *headerFooterView;
  id v7;

  v4 = a3;
  title = self->_title;
  v7 = v4;
  if (title)
  {
    objc_msgSend(v4, "encodeObject:forKey:", title, CFSTR("title"));
    v4 = v7;
  }
  headerFooterView = self->_headerFooterView;
  if (headerFooterView)
  {
    objc_msgSend(v7, "encodeObject:forKey:", headerFooterView, CFSTR("headerFooterView"));
    v4 = v7;
  }
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("height"), self->_height);

}

- (NSString)title
{
  return self->_title;
}

- (UIView)headerFooterView
{
  return self->_headerFooterView;
}

- (double)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFooterView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
