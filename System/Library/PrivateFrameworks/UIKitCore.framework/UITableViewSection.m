@implementation UITableViewSection

+ (id)sectionWithRows:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setRows:", v3);

  return v4;
}

- (UITableViewSection)initWithCoder:(id)a3
{
  id v4;
  UITableViewSection *v5;
  uint64_t v6;
  UIView *headerView;
  uint64_t v8;
  NSString *headerTitle;
  uint64_t v10;
  UIView *footerView;
  uint64_t v12;
  NSString *footerTitle;
  uint64_t v14;
  NSArray *rows;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UITableViewSection;
  v5 = -[UITableViewSection init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITableSectionHeaderView"));
    v6 = objc_claimAutoreleasedReturnValue();
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITableSectionHeaderTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    headerTitle = v5->_headerTitle;
    v5->_headerTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITableSectionFooterView"));
    v10 = objc_claimAutoreleasedReturnValue();
    footerView = v5->_footerView;
    v5->_footerView = (UIView *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITableSectionFooterTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    footerTitle = v5->_footerTitle;
    v5->_footerTitle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITableSectionRows"));
    v14 = objc_claimAutoreleasedReturnValue();
    rows = v5->_rows;
    v5->_rows = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *rows;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*(_OWORD *)&self->_headerTitle != 0)
    objc_msgSend(v4, "encodeObject:forKey:");
  if (self->_footerView || self->_footerTitle)
    objc_msgSend(v7, "encodeObject:forKey:");
  rows = self->_rows;
  v6 = v7;
  if (rows)
  {
    objc_msgSend(v7, "encodeObject:forKey:", rows, CFSTR("UITableSectionRows"));
    v6 = v7;
  }

}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (void)setFooterTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
