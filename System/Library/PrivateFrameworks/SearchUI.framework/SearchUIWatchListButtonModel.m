@implementation SearchUIWatchListButtonModel

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURL)punchoutURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPunchoutURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)storeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SearchUIWatchListState)watchListState
{
  return (SearchUIWatchListState *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWatchListState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (SFImage)thumbnailImage
{
  return (SFImage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setThumbnailImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_watchListState, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_punchoutURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
