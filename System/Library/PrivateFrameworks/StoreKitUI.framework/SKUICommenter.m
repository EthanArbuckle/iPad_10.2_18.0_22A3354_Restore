@implementation SKUICommenter

- (SKUICommenter)initWithAuthor:(id)a3
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
  SKUICommenter *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICommenter initWithAuthor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUICommenter;
  v13 = -[SKUICommenter init](&v19, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "thumbnailImageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMediaSocialAuthor setThumbnailImageURL:](v13, "setThumbnailImageURL:", v14);

    objc_msgSend(v4, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMediaSocialAuthor setName:](v13, "setName:", v15);

    objc_msgSend(v4, "authorType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMediaSocialAuthor setAuthorType:](v13, "setAuthorType:", v16);

    objc_msgSend(v4, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMediaSocialAuthor setIdentifier:](v13, "setIdentifier:", v17);

  }
  return v13;
}

- (NSString)attributedName
{
  return self->_attributedName;
}

- (void)setAttributedName:(id)a3
{
  objc_storeStrong((id *)&self->_attributedName, a3);
}

- (BOOL)isAttributed
{
  return self->_isAttributed;
}

- (void)setIsAttributed:(BOOL)a3
{
  self->_isAttributed = a3;
}

- (BOOL)isMySelf
{
  return self->_isMySelf;
}

- (void)setIsMySelf:(BOOL)a3
{
  self->_isMySelf = a3;
}

- (BOOL)useImageCopy
{
  return self->_useImageCopy;
}

- (void)setUseImageCopy:(BOOL)a3
{
  self->_useImageCopy = a3;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_attributedName, 0);
}

- (void)initWithAuthor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
