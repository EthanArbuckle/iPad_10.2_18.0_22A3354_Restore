@implementation STSCategoryTableViewCell

- (STSCategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSCategoryTableViewCell;
  return -[STSCategoryTableViewCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, a3, a4);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSCategoryTableViewCell;
  -[STSCategoryTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[STSCategoryTableViewCell showSeperator:](self, "showSeperator:", 0);
}

- (void)showSeperator:(BOOL)a3
{
  -[UIView setHidden:](self->_seperator, "setHidden:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seperator, 0);
}

@end
