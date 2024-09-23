@implementation SKUIToggleStateItem

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIToggleStateItem copyWithZone:].cold.1();
  }
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 16) = self->_count;
  v6 = -[NSString copyWithZone:](self->_itemIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(_BYTE *)(v5 + 8) = self->_toggled;
  v8 = -[NSString copyWithZone:](self->_nonToggledString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_toggledString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  return (id)v5;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)nonToggleString
{
  return self->_nonToggledString;
}

- (void)setNonToggleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (char)toggled
{
  return self->_toggled;
}

- (void)setToggled:(char)a3
{
  self->_toggled = a3;
}

- (NSString)toggledString
{
  return self->_toggledString;
}

- (void)setToggledString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggledString, 0);
  objc_storeStrong((id *)&self->_nonToggledString, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (void)copyWithZone:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIToggleStateItem copyWithZone:]";
}

@end
