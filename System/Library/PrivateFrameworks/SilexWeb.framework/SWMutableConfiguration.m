@implementation SWMutableConfiguration

- (NSString)storeFront
{
  return self->storeFront;
}

- (void)setStoreFront:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSLocale)locale
{
  return self->locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)contentEnvironment
{
  return self->contentEnvironment;
}

- (void)setContentEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)is24HourTime
{
  return self->is24HourTime;
}

- (void)setIs24HourTime:(BOOL)a3
{
  self->is24HourTime = a3;
}

- (BOOL)supportsLiveActivities
{
  return self->supportsLiveActivities;
}

- (void)setSupportsLiveActivities:(BOOL)a3
{
  self->supportsLiveActivities = a3;
}

- (NSString)contentSizeCategory
{
  return self->contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->canvasSize.width;
  height = self->canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->canvasSize = a3;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->contentFrame.origin.x;
  y = self->contentFrame.origin.y;
  width = self->contentFrame.size.width;
  height = self->contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->contentFrame = a3;
}

- (NSDictionary)dataSources
{
  return self->dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (SWLocation)location
{
  return self->location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSURL)sourceURL
{
  return self->sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSURL)activePictureInPictureURL
{
  return self->activePictureInPictureURL;
}

- (void)setActivePictureInPictureURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (SWFeedConfiguration)feedConfiguration
{
  return self->feedConfiguration;
}

- (void)setFeedConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (SWKeyboardConfiguration)keyboardConfiguration
{
  return self->keyboardConfiguration;
}

- (void)setKeyboardConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (int64_t)networkStatus
{
  return self->networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->networkStatus = a3;
}

- (BOOL)isTransitioning
{
  return self->isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->isTransitioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->keyboardConfiguration, 0);
  objc_storeStrong((id *)&self->feedConfiguration, 0);
  objc_storeStrong((id *)&self->activePictureInPictureURL, 0);
  objc_storeStrong((id *)&self->sourceURL, 0);
  objc_storeStrong((id *)&self->location, 0);
  objc_storeStrong((id *)&self->dataSources, 0);
  objc_storeStrong((id *)&self->contentSizeCategory, 0);
  objc_storeStrong((id *)&self->contentEnvironment, 0);
  objc_storeStrong((id *)&self->locale, 0);
  objc_storeStrong((id *)&self->storeFront, 0);
}

@end
