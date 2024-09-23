@implementation SKUIIndexBarEntryDescriptor

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
  int64_t entryDescriptorType;
  unint64_t v12;
  uint64_t v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIIndexBarEntryDescriptor hash].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  entryDescriptorType = self->_entryDescriptorType;
  v12 = -[SKUIArtwork hash](self->_artwork, "hash") ^ entryDescriptorType;
  v13 = -[NSAttributedString hash](self->_attributedString, "hash");
  return v12 ^ v13 ^ -[UIImage hash](self->_image, "hash") ^ (unint64_t)(self->_size.width * 1000.0) ^ (unint64_t)(self->_size.height * 10000.0);
}

- (BOOL)isEqual:(id)a3
{
  SKUIIndexBarEntryDescriptor *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  UIImage *image;
  NSAttributedString *attributedString;
  SKUIArtwork *artwork;
  char v17;

  v4 = (SKUIIndexBarEntryDescriptor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIIndexBarEntryDescriptor isEqual:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (v4 == self)
    goto LABEL_20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || v4->_entryDescriptorType != self->_entryDescriptorType
    || (v4->_size.width == self->_size.width ? (v13 = v4->_size.height == self->_size.height) : (v13 = 0),
        !v13
     || (image = v4->_image, image != self->_image) && !-[UIImage isEqual:](image, "isEqual:")
     || (attributedString = v4->_attributedString, attributedString != self->_attributedString)
     && !-[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:")))
  {
    v17 = 0;
    goto LABEL_21;
  }
  artwork = v4->_artwork;
  if (artwork == self->_artwork)
  {
LABEL_20:
    v17 = 1;
    goto LABEL_21;
  }
  v17 = -[SKUIArtwork isEqual:](artwork, "isEqual:");
LABEL_21:

  return v17;
}

+ (id)entryDescriptorWithArtwork:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIIndexBarEntryDescriptor *v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIIndexBarEntryDescriptor entryDescriptorWithArtwork:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_alloc_init(SKUIIndexBarEntryDescriptor);
  -[SKUIIndexBarEntryDescriptor setEntryDescriptorType:](v12, "setEntryDescriptorType:", 2);
  -[SKUIIndexBarEntryDescriptor setArtwork:](v12, "setArtwork:", v3);

  return v12;
}

+ (id)entryDescriptorWithAttributedString:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIIndexBarEntryDescriptor *v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_alloc_init(SKUIIndexBarEntryDescriptor);
  -[SKUIIndexBarEntryDescriptor setEntryDescriptorType:](v12, "setEntryDescriptorType:", 1);
  -[SKUIIndexBarEntryDescriptor setAttributedString:](v12, "setAttributedString:", v3);

  return v12;
}

+ (id)entryDescriptorWithImage:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIIndexBarEntryDescriptor *v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIIndexBarEntryDescriptor entryDescriptorWithImage:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_alloc_init(SKUIIndexBarEntryDescriptor);
  -[SKUIIndexBarEntryDescriptor setEntryDescriptorType:](v12, "setEntryDescriptorType:", 3);
  -[SKUIIndexBarEntryDescriptor setImage:](v12, "setImage:", v3);

  return v12;
}

+ (id)placeholderEntryDescriptorWithSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIIndexBarEntryDescriptor *v13;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIIndexBarEntryDescriptor placeholderEntryDescriptorWithSize:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_alloc_init(SKUIIndexBarEntryDescriptor);
  -[SKUIIndexBarEntryDescriptor setEntryDescriptorType:](v13, "setEntryDescriptorType:", 0);
  -[SKUIIndexBarEntryDescriptor setSize:](v13, "setSize:", width, height);
  return v13;
}

- (void)setArtwork:(id)a3
{
  SKUIArtwork *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIArtwork *artwork;
  CGFloat v15;
  CGFloat v16;

  v5 = (SKUIArtwork *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIIndexBarEntryDescriptor setArtwork:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  artwork = self->_artwork;
  if (artwork != v5 && !-[SKUIArtwork isEqual:](artwork, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_artwork, a3);
    -[SKUIArtwork size](self->_artwork, "size");
    self->_size.width = v15;
    self->_size.height = v16;
  }

}

- (void)setAttributedString:(id)a3
{
  NSAttributedString *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSAttributedString *attributedString;
  NSAttributedString *v14;
  NSAttributedString *v15;
  CGFloat v16;
  CGFloat v17;

  v4 = (NSAttributedString *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIIndexBarEntryDescriptor setAttributedString:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  attributedString = self->_attributedString;
  if (attributedString != v4
    && !-[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:", v4))
  {
    v14 = (NSAttributedString *)-[NSAttributedString copy](v4, "copy");
    v15 = self->_attributedString;
    self->_attributedString = v14;

    -[NSAttributedString size](self->_attributedString, "size");
    self->_size.width = v16;
    self->_size.height = v17;
  }

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIImage *image;
  CGFloat v15;
  CGFloat v16;

  v5 = (UIImage *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIIndexBarEntryDescriptor setImage:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  image = self->_image;
  if (image != v5 && (-[UIImage isEqual:](image, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[UIImage size](self->_image, "size");
    self->_size.width = v15;
    self->_size.height = v16;
  }

}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (int64_t)entryDescriptorType
{
  return self->_entryDescriptorType;
}

- (void)setEntryDescriptorType:(int64_t)a3
{
  self->_entryDescriptorType = a3;
}

- (SKUIArtwork)artwork
{
  return self->_artwork;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int64_t)visibilityPriority
{
  return self->_visibilityPriority;
}

- (void)setVisibilityPriority:(int64_t)a3
{
  self->_visibilityPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

- (void)hash
{
  OUTLINED_FUNCTION_1();
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)entryDescriptorWithArtwork:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)entryDescriptorWithAttributedString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)entryDescriptorWithImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)placeholderEntryDescriptorWithSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setArtwork:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setAttributedString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
