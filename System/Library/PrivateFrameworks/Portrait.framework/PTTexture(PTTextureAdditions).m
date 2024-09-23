@implementation PTTexture(PTTextureAdditions)

- (void)isRGB
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "PTTexture does not support this directly: Should be overridden in PTTextureRGBA or PTTextureYUV", v1, 2u);
}

@end
