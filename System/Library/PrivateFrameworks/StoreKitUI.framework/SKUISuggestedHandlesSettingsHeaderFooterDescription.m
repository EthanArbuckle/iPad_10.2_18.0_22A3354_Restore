@implementation SKUISuggestedHandlesSettingsHeaderFooterDescription

- (SKUISuggestedHandlesSettingsHeaderFooterDescription)initWithSuggestedHandles:(id)a3 clientContext:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUISuggestedHandlesSettingsHeaderFooterDescription *v11;
  SKUISuggestedHandlesSettingsHeaderFooterDescription *v12;
  uint64_t v13;
  NSArray *suggestedHandles;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISuggestedHandlesSettingsHeaderFooterDescription initWithSuggestedHandles:clientContext:delegate:].cold.1();
  }
  v11 = -[SKUISuggestedHandlesSettingsHeaderFooterDescription init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientContext, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13 = objc_msgSend(v8, "copy");
    suggestedHandles = v12->_suggestedHandles;
    v12->_suggestedHandles = (NSArray *)v13;

  }
  return v12;
}

- (id)helpText
{
  NSUInteger v3;
  SKUIClientContext *clientContext;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;

  v3 = -[NSArray count](self->_suggestedHandles, "count");
  clientContext = self->_clientContext;
  if (!v3)
  {
    if (clientContext)
    {
      v5 = CFSTR("SETTINGS_PROFILE_EDIT_HANDLE_TAKEN");
      goto LABEL_6;
    }
    v7 = CFSTR("SETTINGS_PROFILE_EDIT_HANDLE_TAKEN");
LABEL_9:
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v7, 0, CFSTR("Settings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (!clientContext)
  {
    v7 = CFSTR("SETTINGS_PROFILE_EDIT_HANDLE_TAKEN_WITH_SUGGESTIONS");
    goto LABEL_9;
  }
  v5 = CFSTR("SETTINGS_PROFILE_EDIT_HANDLE_TAKEN_WITH_SUGGESTIONS");
LABEL_6:
  -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", v5, CFSTR("Settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (void)selectedHandleAtIndex:(unint64_t)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  -[NSArray objectAtIndex:](self->_suggestedHandles, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "suggestedHandlesSettingsHeaderFooterDescription:didSelectSuggestedHandle:", self, v9);

    }
  }

}

- (id)suggestedHandles
{
  return (id)-[NSArray copy](self->_suggestedHandles, "copy");
}

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (SKUISuggestedHandlesSettingsHeaderFooterDescriptionDelegate)delegate
{
  return (SKUISuggestedHandlesSettingsHeaderFooterDescriptionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestedHandles, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithSuggestedHandles:clientContext:delegate:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISuggestedHandlesSettingsHeaderFooterDescription initWithSuggestedHandles:clientContext:delegate:]";
}

@end
