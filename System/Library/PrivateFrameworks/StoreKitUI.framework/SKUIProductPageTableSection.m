@implementation SKUIProductPageTableSection

- (double)heightForTextLayout:(id)a3 isExpanded:(BOOL)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;

  v5 = a3;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !(v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)))
  {
    if (v5)
      goto LABEL_5;
LABEL_11:
    v15 = 80.0;
    goto LABEL_12;
  }
  -[SKUIProductPageTableSection heightForTextLayout:isExpanded:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  if (!v5)
    goto LABEL_11;
LABEL_5:
  if (a4 || !objc_msgSend(v5, "requiresTruncation"))
    objc_msgSend(v5, "textSize");
  else
    objc_msgSend(v5, "truncatedSize");
  v15 = v14 + 10.0 + 22.0 + 2.0 + 12.0;
LABEL_12:

  return v15;
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIProductPageTableSection selectionActionForTableView:indexPath:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  return 0;
}

- (id)textBoxTableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUITextBoxTableViewCell *v13;
  void *v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageTableSection textBoxTableViewCellForTableView:indexPath:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("TB"));
  v13 = (SKUITextBoxTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = -[SKUITextBoxTableViewCell initWithStyle:reuseIdentifier:]([SKUITextBoxTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("TB"));
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITableViewCell setBottomBorderColor:](v13, "setBottomBorderColor:", v14);

    -[SKUITextBoxTableViewCell setSelectionStyle:](v13, "setSelectionStyle:", 0);
  }

  return v13;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)heightForTextLayout:(uint64_t)a3 isExpanded:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)selectionActionForTableView:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)textBoxTableViewCellForTableView:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
