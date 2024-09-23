@implementation SKUIStorePagePinnedBackdropLayoutAttributes

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
  id v13;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStorePagePinnedBackdropLayoutAttributes copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIStorePagePinnedBackdropLayoutAttributes;
  v13 = -[UICollectionViewLayoutAttributes copyWithZone:](&v15, sel_copyWithZone_, a3);
  objc_msgSend(v13, "setBackdropColor:", self->_backdropColor);
  objc_msgSend(v13, "setBackdropGroupName:", self->_backdropGroupName);
  objc_msgSend(v13, "setBackdropStyle:", self->_backdropStyle);
  objc_msgSend(v13, "setHidesBackdropView:", self->_hidesBackdropView);
  objc_msgSend(v13, "setTransitionProgress:", self->_transitionProgress);
  return v13;
}

- (unint64_t)hash
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  objc_super v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIStorePagePinnedBackdropLayoutAttributes hash].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIStorePagePinnedBackdropLayoutAttributes;
  v11 = -[UICollectionViewLayoutAttributes hash](&v16, sel_hash);
  v12 = -[UIColor hash](self->_backdropColor, "hash") ^ v11;
  v13 = -[NSString hash](self->_backdropGroupName, "hash");
  v14 = 10000;
  if (!self->_hidesBackdropView)
    v14 = 0;
  return v12 ^ v13 ^ self->_backdropStyle ^ v14 ^ llround(self->_transitionProgress * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  SKUIStorePagePinnedBackdropLayoutAttributes *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIStorePagePinnedBackdropLayoutAttributes *v13;
  UIColor *backdropColor;
  NSString *backdropGroupName;
  BOOL v16;
  objc_super v18;

  v4 = (SKUIStorePagePinnedBackdropLayoutAttributes *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStorePagePinnedBackdropLayoutAttributes isEqual:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v4;
      v18.receiver = self;
      v18.super_class = (Class)SKUIStorePagePinnedBackdropLayoutAttributes;
      v16 = -[UICollectionViewLayoutAttributes isEqual:](&v18, sel_isEqual_, v13)
         && ((backdropColor = self->_backdropColor, backdropColor == v13->_backdropColor)
          || -[UIColor isEqual:](backdropColor, "isEqual:"))
         && ((backdropGroupName = self->_backdropGroupName, backdropGroupName == v13->_backdropGroupName)
          || -[NSString isEqualToString:](backdropGroupName, "isEqualToString:"))
         && self->_backdropStyle == v13->_backdropStyle
         && self->_hidesBackdropView == v13->_hidesBackdropView
         && self->_transitionProgress != v13->_transitionProgress;

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (UIColor)backdropColor
{
  return self->_backdropColor;
}

- (void)setBackdropColor:(id)a3
{
  objc_storeStrong((id *)&self->_backdropColor, a3);
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (void)setBackdropStyle:(int64_t)a3
{
  self->_backdropStyle = a3;
}

- (BOOL)hidesBackdropView
{
  return self->_hidesBackdropView;
}

- (void)setHidesBackdropView:(BOOL)a3
{
  self->_hidesBackdropView = a3;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)setTransitionProgress:(double)a3
{
  self->_transitionProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_backdropColor, 0);
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)hash
{
  OUTLINED_FUNCTION_1();
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
