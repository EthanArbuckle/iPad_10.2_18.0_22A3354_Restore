@implementation RAPUserInfoSection

- (RAPUserInfoSection)init
{
  RAPUserInfoSection *v2;
  uint64_t v3;
  ACAccount *account;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPUserInfoSection;
  v2 = -[RAPTablePartSection init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
    account = v2->_account;
    v2->_account = (ACAccount *)v3;

  }
  return v2;
}

- (int64_t)rowsCount
{
  return self->_account != 0;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  RAPDisplayUserContentTableViewCell *cell;
  RAPDisplayUserContentTableViewCell *v5;
  RAPDisplayUserContentTableViewCell *v6;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[RAPDisplayUserContentTableViewCell initWithStyle:reuseIdentifier:]([RAPDisplayUserContentTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("RAPUserInfoCell"));
    v6 = self->_cell;
    self->_cell = v5;

    cell = self->_cell;
  }
  return cell;
}

- (id)footerView
{
  TableViewSelectableFooterView *footerView;
  void *v4;
  TableViewSelectableFooterView *v5;
  TableViewSelectableFooterView *v6;

  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TableViewFooterOptions defaultRAPUserContentOptions](TableViewFooterOptions, "defaultRAPUserContentOptions"));
    v5 = -[TableViewSelectableFooterView initWithReuseIdentifier:options:]([TableViewSelectableFooterView alloc], "initWithReuseIdentifier:options:", CFSTR("RAPUserInfoFooterView"), v4);
    v6 = self->_footerView;
    self->_footerView = v5;

    -[TableViewSelectableFooterView setTarget:action:](self->_footerView, "setTarget:action:", self, "_footerViewTapped");
    footerView = self->_footerView;
  }
  return footerView;
}

- (void)_footerViewTapped
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.mapsrap")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection presentingViewController](self, "presentingViewController"));
  objc_msgSend(v4, "setPresentingViewController:", v3);

  objc_msgSend(v4, "present");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
