@implementation SKUITracklistColumn

- (void)setPreferredWidthForAttributedStrings:(id)a3
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
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  unint64_t v20;
  id v21;
  double v22;
  float v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUITracklistColumn setPreferredWidthForAttributedStrings:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v14)
  {

    v16 = 0;
LABEL_19:
    v23 = 0.0;
    goto LABEL_20;
  }
  v15 = v14;
  v16 = 0;
  v17 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v25 != v17)
        objc_enumerationMutation(v13);
      v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      if (v16)
      {
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "length", (_QWORD)v24);
        if (v20 > objc_msgSend(v16, "length"))
        {
          v21 = v19;

          v16 = v21;
        }
      }
      else
      {
        v16 = v19;
      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v15);

  if (!v16)
    goto LABEL_19;
  objc_msgSend(v16, "size");
  v23 = v22;
LABEL_20:
  -[SKUITracklistColumn setPreferredWidth:](self, "setPreferredWidth:", ceilf(v23), (_QWORD)v24);

}

- (id)description
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITracklistColumn description].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)SKUITracklistColumn;
  -[SKUITracklistColumn description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [ID: %ld, Width: %.2f]"), v12, self->_columnIdentifier, *(_QWORD *)&self->_width);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUITracklistColumn copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v13, "setColumnIdentifier:", self->_columnIdentifier);
  objc_msgSend(v13, "setContentAlignment:", self->_contentAlignment);
  objc_msgSend(v13, "setHeaderAlignment:", self->_headerAlignment);
  objc_msgSend(v13, "setMaximumWidthFraction:", self->_maximumWidthFraction);
  objc_msgSend(v13, "setPreferredWidth:", self->_preferredWidth);
  objc_msgSend(v13, "setShowsPreviewControl:", self->_showsPreviewControl);
  objc_msgSend(v13, "setSizesToFit:", self->_sizesToFit);
  objc_msgSend(v13, "setWidth:", self->_width);
  return v13;
}

- (int64_t)columnIdentifier
{
  return self->_columnIdentifier;
}

- (void)setColumnIdentifier:(int64_t)a3
{
  self->_columnIdentifier = a3;
}

- (int64_t)contentAlignment
{
  return self->_contentAlignment;
}

- (void)setContentAlignment:(int64_t)a3
{
  self->_contentAlignment = a3;
}

- (int64_t)headerAlignment
{
  return self->_headerAlignment;
}

- (void)setHeaderAlignment:(int64_t)a3
{
  self->_headerAlignment = a3;
}

- (double)maximumWidthFraction
{
  return self->_maximumWidthFraction;
}

- (void)setMaximumWidthFraction:(double)a3
{
  self->_maximumWidthFraction = a3;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (BOOL)showsPreviewControl
{
  return self->_showsPreviewControl;
}

- (void)setShowsPreviewControl:(BOOL)a3
{
  self->_showsPreviewControl = a3;
}

- (BOOL)sizesToFit
{
  return self->_sizesToFit;
}

- (void)setSizesToFit:(BOOL)a3
{
  self->_sizesToFit = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void)setPreferredWidthForAttributedStrings:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)description
{
  OUTLINED_FUNCTION_1();
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
