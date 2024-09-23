@implementation UIMovieScrubberThumbnailView

- (void)setHasPlaceholderImage:(BOOL)a3
{
  *((_BYTE *)self + 512) = *((_BYTE *)self + 512) & 0xFE | a3;
}

- (BOOL)hasPlaceholderImage
{
  return *((_BYTE *)self + 512) & 1;
}

@end
