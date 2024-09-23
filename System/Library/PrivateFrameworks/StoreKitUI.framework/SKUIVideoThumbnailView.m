@implementation SKUIVideoThumbnailView

- (void)layoutSubviews
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIVideoThumbnailView layoutSubviews]";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playControlView, 0);
}

@end
