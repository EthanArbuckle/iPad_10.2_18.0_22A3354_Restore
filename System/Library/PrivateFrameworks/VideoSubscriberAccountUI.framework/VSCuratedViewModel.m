@implementation VSCuratedViewModel

- (VSCuratedViewModel)init
{
  VSCuratedViewModel *v2;
  VSOptional *v3;
  VSOptional *identityProviderDisplayName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSCuratedViewModel;
  v2 = -[VSViewModel init](&v6, sel_init);
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    identityProviderDisplayName = v2->_identityProviderDisplayName;
    v2->_identityProviderDisplayName = v3;

  }
  return v2;
}

- (void)configureWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[VSViewModel identityProvider](self, "identityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSCuratedViewModel setLogoAccessibilityLabel:](self, "setLogoAccessibilityLabel:", v7);

  objc_msgSend(v4, "requestingAppDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("APP_PRIVACY_NOTICE_FORMAT"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[VSCuratedViewModel setNotice:](self, "setNotice:", v11);
  v12.receiver = self;
  v12.super_class = (Class)VSCuratedViewModel;
  -[VSViewModel configureWithRequest:](&v12, sel_configureWithRequest_, v4);

}

- (NSItemProvider)logoProvider
{
  return self->_logoProvider;
}

- (void)setLogoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_logoProvider, a3);
}

- (UIImage)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
  objc_storeStrong((id *)&self->_logo, a3);
}

- (CGSize)preferredLogoSize
{
  double width;
  double height;
  CGSize result;

  width = self->preferredLogoSize.width;
  height = self->preferredLogoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredLogoSize:(CGSize)a3
{
  self->preferredLogoSize = a3;
}

- (BOOL)logoFinishedLoading
{
  return self->logoFinishedLoading;
}

- (void)setLogoFinishedLoading:(BOOL)a3
{
  self->logoFinishedLoading = a3;
}

- (NSString)logoAccessibilityLabel
{
  return self->_logoAccessibilityLabel;
}

- (void)setLogoAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isBeginValidationButtonEnabled
{
  return self->_beginValidationButtonEnabled;
}

- (void)setBeginValidationButtonEnabled:(BOOL)a3
{
  self->_beginValidationButtonEnabled = a3;
}

- (NSString)beginValidationButtonTitle
{
  return self->_beginValidationButtonTitle;
}

- (void)setBeginValidationButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (VSOptional)identityProviderDisplayName
{
  return self->_identityProviderDisplayName;
}

- (void)setIdentityProviderDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_identityProviderDisplayName, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)notice
{
  return self->_notice;
}

- (void)setNotice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)showFooter
{
  return self->_showFooter;
}

- (void)setShowFooter:(BOOL)a3
{
  self->_showFooter = a3;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_notice, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identityProviderDisplayName, 0);
  objc_storeStrong((id *)&self->_beginValidationButtonTitle, 0);
  objc_storeStrong((id *)&self->_logoAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_logoProvider, 0);
}

@end
