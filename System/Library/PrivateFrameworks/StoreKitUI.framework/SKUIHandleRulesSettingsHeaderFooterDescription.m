@implementation SKUIHandleRulesSettingsHeaderFooterDescription

- (SKUIHandleRulesSettingsHeaderFooterDescription)initWithClientContext:(id)a3
{
  id v5;
  SKUIHandleRulesSettingsHeaderFooterDescription *v6;
  SKUIHandleRulesSettingsHeaderFooterDescription *v7;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIHandleRulesSettingsHeaderFooterDescription initWithClientContext:].cold.1();
  }
  v6 = -[SKUIHandleRulesSettingsHeaderFooterDescription init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientContext, a3);

  return v7;
}

- (id)text
{
  SKUIClientContext *clientContext;

  clientContext = self->_clientContext;
  if (clientContext)
    -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_HANDLE_RULES"), CFSTR("Settings"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_HANDLE_RULES"), 0, CFSTR("Settings"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)showInvalid
{
  return self->_showInvalid;
}

- (void)setShowInvalid:(BOOL)a3
{
  self->_showInvalid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIHandleRulesSettingsHeaderFooterDescription initWithClientContext:]";
}

@end
