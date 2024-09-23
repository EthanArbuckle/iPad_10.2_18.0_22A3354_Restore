@implementation VKImageDataRequirements

+ (VKImageDataRequirements)stickerRequirements
{
  VKImageDataRequirements *v2;
  void *v3;

  v2 = objc_alloc_init(VKImageDataRequirements);
  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageDataRequirements setUti:](v2, "setUti:", v3);

  -[VKImageDataRequirements setMaxLength:](v2, "setMaxLength:", 900);
  -[VKImageDataRequirements setMinLength:](v2, "setMinLength:", 300);
  -[VKImageDataRequirements setMaxDataLength:](v2, "setMaxDataLength:", 500000);
  return v2;
}

+ (VKImageDataRequirements)stickerThumbnailRequirements
{
  VKImageDataRequirements *v2;
  void *v3;

  v2 = objc_alloc_init(VKImageDataRequirements);
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageDataRequirements setUti:](v2, "setUti:", v3);

  -[VKImageDataRequirements setMaxLength:](v2, "setMaxLength:", 100);
  -[VKImageDataRequirements setMinLength:](v2, "setMinLength:", 50);
  -[VKImageDataRequirements setMaxDataLength:](v2, "setMaxDataLength:", 500000);
  return v2;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_storeStrong((id *)&self->_uti, a3);
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)maxDataLength
{
  return self->_maxDataLength;
}

- (void)setMaxDataLength:(unint64_t)a3
{
  self->_maxDataLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uti, 0);
}

@end
