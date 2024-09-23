@implementation SKUIDynamicShelfViewElement

- (SKUIViewElement)cellTemplateViewElement
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIViewElement *cellTemplateViewElement;
  _QWORD v13[5];

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIDynamicShelfViewElement cellTemplateViewElement].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  cellTemplateViewElement = self->_cellTemplateViewElement;
  if (!cellTemplateViewElement)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__SKUIDynamicShelfViewElement_cellTemplateViewElement__block_invoke;
    v13[3] = &unk_1E73A12A8;
    v13[4] = self;
    -[SKUIShelfViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v13);
    cellTemplateViewElement = self->_cellTemplateViewElement;
  }
  return cellTemplateViewElement;
}

void __54__SKUIDynamicShelfViewElement_cellTemplateViewElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 304), a2);
  *a3 = 1;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIDynamicShelfViewElement *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SKUIViewElement *cellTemplateViewElement;
  objc_super v16;

  v4 = (SKUIDynamicShelfViewElement *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDynamicShelfViewElement applyUpdatesWithElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIDynamicShelfViewElement;
  -[SKUIShelfViewElement applyUpdatesWithElement:](&v16, sel_applyUpdatesWithElement_, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != self || objc_msgSend(v13, "updateType"))
  {
    cellTemplateViewElement = self->_cellTemplateViewElement;
    self->_cellTemplateViewElement = 0;

  }
  return v13;
}

- (BOOL)isDynamicContainer
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIDynamicShelfViewElement isDynamicContainer].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

- (void)setShelfItemViewElementValidator:(id)a3
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
  SKUIViewElement *cellTemplateViewElement;
  objc_super v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDynamicShelfViewElement setShelfItemViewElementValidator:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIDynamicShelfViewElement;
  -[SKUIShelfViewElement setShelfItemViewElementValidator:](&v14, sel_setShelfItemViewElementValidator_, v4);
  cellTemplateViewElement = self->_cellTemplateViewElement;
  self->_cellTemplateViewElement = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellTemplateViewElement, 0);
}

- (void)cellTemplateViewElement
{
  OUTLINED_FUNCTION_1();
}

- (void)applyUpdatesWithElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)isDynamicContainer
{
  OUTLINED_FUNCTION_1();
}

- (void)setShelfItemViewElementValidator:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
