@implementation SKUIImagePlaceholder

- (SKUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerRadius:(double)a6
{
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  SKUIImagePlaceholder *v21;
  _QWORD aBlock[5];

  v10 = a3;
  v11 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v12)
        -[SKUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerRadius:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  if (a6 >= 0.00000011920929)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __SKUIImagePlaceholderCornerPathBlockCreate_block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e53___UIBezierPath_40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    *(double *)&aBlock[4] = a6;
    v20 = _Block_copy(aBlock);
  }
  else if (a5 >= 0.00000011920929)
  {
    v20 = &__block_literal_global_55;
  }
  else
  {
    v20 = 0;
  }
  v21 = -[SKUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:](self, "initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:", v10, v11, v20, a5);

  return v21;
}

- (SKUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerPathBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SKUIImagePlaceholder *v22;
  SKUIImagePlaceholder *v23;
  uint64_t v24;
  id cornerPathBlock;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v14)
        -[SKUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUIImagePlaceholder;
  v22 = -[SKUIImagePlaceholder init](&v27, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_backgroundColor, a3);
    objc_storeStrong((id *)&v23->_borderColor, a4);
    v23->_borderWidth = a5;
    v24 = objc_msgSend(v13, "copy");
    cornerPathBlock = v23->_cornerPathBlock;
    v23->_cornerPathBlock = (id)v24;

  }
  return v23;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (id)cornerPathBlock
{
  return self->_cornerPathBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cornerPathBlock, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)initWithBackgroundColor:(uint64_t)a3 borderColor:(uint64_t)a4 borderWidth:(uint64_t)a5 cornerRadius:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBackgroundColor:(uint64_t)a3 borderColor:(uint64_t)a4 borderWidth:(uint64_t)a5 cornerPathBlock:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
