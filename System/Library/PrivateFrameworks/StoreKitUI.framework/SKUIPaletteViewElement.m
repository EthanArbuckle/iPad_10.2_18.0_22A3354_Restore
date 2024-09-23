@implementation SKUIPaletteViewElement

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPaletteViewElement enumerateChildrenUsingBlock:].cold.1();
  }
  v7[1] = 3221225472;
  v7[2] = __54__SKUIPaletteViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_1E73A1F80;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SKUIPaletteViewElement;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v4;
  -[SKUIViewElement enumerateChildrenUsingBlock:](&v6, sel_enumerateChildrenUsingBlock_, v7);

}

void __54__SKUIPaletteViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = v3 > 0x3E || ((1 << v3) & 0x4004010100001000) == 0;
  if (!v4 || v3 - 95 <= 0x2E && ((1 << (v3 - 95)) & 0x480000004001) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)enumerateChildrenUsingBlock:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPaletteViewElement enumerateChildrenUsingBlock:]";
}

@end
