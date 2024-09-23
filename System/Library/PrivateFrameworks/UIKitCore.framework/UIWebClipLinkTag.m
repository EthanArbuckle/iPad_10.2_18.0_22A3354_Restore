@implementation UIWebClipLinkTag

- (NSURL)hrefURL
{
  void *v3;

  v3 = -[NSString length](self->_href, "length");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", self->_href, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v3;
}

- (NSString)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)rel
{
  return self->_rel;
}

- (void)setRel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sizes
{
  return self->_sizes;
}

- (void)setSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)mediaMatchesPortraitOrientation
{
  return self->_mediaMatchesPortraitOrientation;
}

- (void)setMediaMatchesPortraitOrientation:(BOOL)a3
{
  self->_mediaMatchesPortraitOrientation = a3;
}

- (BOOL)mediaMatchesLandscapeOrientation
{
  return self->_mediaMatchesLandscapeOrientation;
}

- (void)setMediaMatchesLandscapeOrientation:(BOOL)a3
{
  self->_mediaMatchesLandscapeOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_rel, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end
