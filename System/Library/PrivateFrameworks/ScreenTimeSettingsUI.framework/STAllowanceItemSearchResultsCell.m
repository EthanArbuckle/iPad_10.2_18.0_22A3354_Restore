@implementation STAllowanceItemSearchResultsCell

- (UIImageView)iconImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setIconImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UILabel)nameLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setNameLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (UILabel)dashLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setDashLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (UILabel)categoryLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setCategoryLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_dashLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
