@implementation MTSettingsGroup

+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settings:(id)a5
{
  id v7;
  id v8;
  id v9;
  MTSettingsGroup *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MTSettingsGroup);
  -[MTSettingsGroup setGroupTitle:](v10, "setGroupTitle:", v7);
  -[MTSettingsGroup setGroupFooter:](v10, "setGroupFooter:", v8);
  -[MTSettingsGroup setGroupSettings:](v10, "setGroupSettings:", v9);
  -[MTSettingsGroup setCustomHeaderHeight:](v10, "setCustomHeaderHeight:", 0.0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), "setGroup:", v10, (_QWORD)v17);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  return v10;
}

+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settingsHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  MTSettingsGroup *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(MTSettingsGroup);
  -[MTSettingsGroup setGroupTitle:](v10, "setGroupTitle:", v9);

  -[MTSettingsGroup setGroupFooter:](v10, "setGroupFooter:", v8);
  -[MTSettingsGroup setSettingsHandler:](v10, "setSettingsHandler:", v7);

  -[MTSettingsGroup setCustomHeaderHeight:](v10, "setCustomHeaderHeight:", 0.0);
  return v10;
}

+ (id)footerAttributedString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v3, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedFooterConfiguration](UIListContentConfiguration, "groupedFooterConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textProperties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resolvedColor"));
  objc_msgSend(v4, "addAttribute:value:range:", NSForegroundColorAttributeName, v7, 0, objc_msgSend(v4, "length"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont sectionFooterFont](UIFont, "sectionFooterFont"));
  objc_msgSend(v4, "addAttribute:value:range:", NSFontAttributeName, v8, 0, objc_msgSend(v4, "length"));

  return v4;
}

+ (id)footerAttributedString:(id)a3 additionalAttributeName:(id)a4 additionalAttributeValue:(id)a5 additionalAttributeRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  length = a6.length;
  location = a6.location;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc((Class)NSMutableAttributedString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup footerAttributedString:](MTSettingsGroup, "footerAttributedString:", v12));

  v15 = objc_msgSend(v13, "initWithAttributedString:", v14);
  objc_msgSend(v15, "addAttribute:value:range:", v11, v10, location, length);

  return v15;
}

- (NSArray)groupSettings
{
  uint64_t (**groupSettings)(void *, SEL);
  uint64_t v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  groupSettings = (uint64_t (**)(void *, SEL))self->_groupSettings;
  if (!groupSettings)
  {
    groupSettings = (uint64_t (**)(void *, SEL))self->_settingsHandler;
    if (groupSettings)
    {
      v4 = groupSettings[2](groupSettings, a2);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue(v4);
      v6 = self->_groupSettings;
      self->_groupSettings = v5;

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = self->_groupSettings;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), "setGroup:", self, (_QWORD)v13);
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

      groupSettings = (uint64_t (**)(void *, SEL))self->_groupSettings;
    }
  }
  return (NSArray *)groupSettings;
}

- (NSString)groupTitle
{
  return self->_groupTitle;
}

- (void)setGroupTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSAttributedString)groupFooter
{
  return self->_groupFooter;
}

- (void)setGroupFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setGroupSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)settingsHandler
{
  return self->_settingsHandler;
}

- (void)setSettingsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MTSettingHeaderAction)headerAction
{
  return self->_headerAction;
}

- (void)setHeaderAction:(id)a3
{
  objc_storeStrong((id *)&self->_headerAction, a3);
}

- (double)customHeaderHeight
{
  return self->_customHeaderHeight;
}

- (void)setCustomHeaderHeight:(double)a3
{
  self->_customHeaderHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerAction, 0);
  objc_storeStrong(&self->_settingsHandler, 0);
  objc_storeStrong((id *)&self->_groupSettings, 0);
  objc_storeStrong((id *)&self->_groupFooter, 0);
  objc_storeStrong((id *)&self->_groupTitle, 0);
}

@end
