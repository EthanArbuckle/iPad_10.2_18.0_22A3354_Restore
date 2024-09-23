@implementation PRRETableViewCell

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRRETableViewCell;
  -[PRRETableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PRRETableViewCell setTag:](self, "setTag:", 0);
}

- (void)_valueChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PRRETableViewCell _tableView](self, "_tableView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRRETableViewCell _currentValue](self, "_currentValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cell:valueChanged:", self, v5);

}

- (void)_configure
{
  void *v3;
  id v4;

  -[PRRETableViewCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSStringForPRSceneSetting(-[PRRETableViewCell tag](self, "tag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[PRRETableViewCell setContentConfiguration:](self, "setContentConfiguration:", v4);
}

- (id)_currentValue
{
  return 0;
}

@end
