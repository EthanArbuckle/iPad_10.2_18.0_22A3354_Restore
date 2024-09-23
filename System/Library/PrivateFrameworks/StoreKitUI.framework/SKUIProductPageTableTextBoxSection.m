@implementation SKUIProductPageTableTextBoxSection

- (SKUIProductPageTableTextBoxSection)initWithClientContext:(id)a3
{
  id v5;
  SKUIProductPageTableTextBoxSection *v6;
  SKUIProductPageTableTextBoxSection *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableTextBoxSection initWithClientContext:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIProductPageTableTextBoxSection;
  v6 = -[SKUIProductPageTableTextBoxSection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientContext, a3);

  return v7;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  void *v5;
  double v6;
  double v7;

  -[SKUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageTableSection heightForTextLayout:isExpanded:](self, "heightForTextLayout:isExpanded:", v5, self->_isExpanded);
  v7 = v6;

  return v7;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SKUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_isExpanded || !objc_msgSend(v5, "requiresTruncation"))
  {
    v7 = 0;
  }
  else
  {
    self->_isExpanded = 1;
    +[SKUIProductPageAction actionWithType:](SKUIProductPageAction, "actionWithType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SKUIClientContext *clientContext;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  -[SKUIProductPageTableSection textBoxTableViewCellForTableView:indexPath:](self, "textBoxTableViewCellForTableView:indexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBottomBorderColor:", v7);

  }
  -[SKUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textBoxView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setFixedWidthTextFrame:", objc_msgSend(v8, "textFrame"));
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMoreButtonTitle:", v12);

    if (self->_isExpanded)
      v13 = 0;
    else
      v13 = 5;
    objc_msgSend(v10, "setNumberOfVisibleLines:", v13);
    -[SKUIProductPageTableTextBoxSection subtitle](self, "subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSubtitle:", v14);

    -[SKUIProductPageTableTextBoxSection title](self, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v15);

    objc_msgSend(v10, "setColorScheme:", self->_colorScheme);
  }
  else
  {
    objc_msgSend(v9, "reset");
  }

  return v5;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (int64_t)stringIndex
{
  return self->_stringIndex;
}

- (void)setStringIndex:(int64_t)a3
{
  self->_stringIndex = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SKUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void)setTextLayoutCache:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutCache, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageTableTextBoxSection initWithClientContext:]";
}

@end
