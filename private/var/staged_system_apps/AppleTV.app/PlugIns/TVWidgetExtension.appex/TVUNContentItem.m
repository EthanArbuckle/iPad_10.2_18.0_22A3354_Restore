@implementation TVUNContentItem

+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4 cropCode:(id)a5 format:(id)a6
{
  double height;
  double width;
  const __CFString *v10;
  id v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  if (a6)
    v10 = (const __CFString *)a6;
  else
    v10 = CFSTR("jpg");
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[WLKArtworkVariant artworkURLFromTemplate:forSize:cropCode:format:](WLKArtworkVariant, "artworkURLFromTemplate:forSize:cropCode:format:", a3, a5, v10, width, height));

  return v12;
}

+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4
{
  return objc_msgSend(a1, "artworkURLFromTemplate:forSize:cropCode:format:", a3, 0, 0, a4.width, a4.height);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitleShort
{
  return self->_subtitleShort;
}

- (void)setSubtitleShort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)subtitleComposed
{
  return self->_subtitleComposed;
}

- (void)setSubtitleComposed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)playbackPercentage
{
  return self->_playbackPercentage;
}

- (void)setPlaybackPercentage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)rentalExpirationDate
{
  return self->_rentalExpirationDate;
}

- (void)setRentalExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isLiveEvent
{
  return self->_liveEvent;
}

- (void)setLiveEvent:(BOOL)a3
{
  self->_liveEvent = a3;
}

- (BOOL)isNewEpisode
{
  return self->_newEpisode;
}

- (void)setNewEpisode:(BOOL)a3
{
  self->_newEpisode = a3;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)imageURLTemplate
{
  return self->_imageURLTemplate;
}

- (void)setImageURLTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (double)imageAspectRatio
{
  return self->_imageAspectRatio;
}

- (void)setImageAspectRatio:(double)a3
{
  self->_imageAspectRatio = a3;
}

- (NSString)badgeURLTemplate
{
  return self->_badgeURLTemplate;
}

- (void)setBadgeURLTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)badgeRequiresTransparency
{
  return self->_badgeRequiresTransparency;
}

- (void)setBadgeRequiresTransparency:(BOOL)a3
{
  self->_badgeRequiresTransparency = a3;
}

- (NSString)cropCode
{
  return self->_cropCode;
}

- (void)setCropCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropCode, 0);
  objc_storeStrong((id *)&self->_badgeURLTemplate, 0);
  objc_storeStrong((id *)&self->_imageURLTemplate, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_rentalExpirationDate, 0);
  objc_storeStrong((id *)&self->_playbackPercentage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_subtitleComposed, 0);
  objc_storeStrong((id *)&self->_subtitleShort, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
