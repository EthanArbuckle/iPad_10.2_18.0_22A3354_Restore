@implementation SKUIApplicationLicensePage

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIApplicationLicensePage copyWithZone:].cold.1();
  }
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setLicenseAgreementHTML:", self->_licenseAgreementHTML);
  objc_msgSend(v5, "setTitle:", self->_title);
  return v5;
}

- (NSString)licenseAgreementHTML
{
  return self->_licenseAgreementHTML;
}

- (void)setLicenseAgreementHTML:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_licenseAgreementHTML, 0);
}

- (void)copyWithZone:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIApplicationLicensePage copyWithZone:]";
}

@end
