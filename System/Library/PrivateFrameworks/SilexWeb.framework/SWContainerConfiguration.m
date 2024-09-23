@implementation SWContainerConfiguration

- (SWContainerConfiguration)initWithStoreFront:(id)a3 locale:(id)a4 contentEnvironment:(id)a5 contentSizeCategory:(id)a6 canvasSize:(CGSize)a7 contentFrame:(CGRect)a8 dataSources:(id)a9 location:(id)a10 sourceURL:(id)a11 activePictureInPictureURL:(id)a12 feedConfiguration:(id)a13 supportsLiveActivities:(BOOL)a14
{
  double height;
  double width;
  double y;
  double x;
  double v23;
  double v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  SWContainerConfiguration *v34;
  SWContainerConfiguration *v35;
  id v37;
  objc_super v38;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v23 = a7.height;
  v24 = a7.width;
  v37 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a9;
  v30 = a10;
  v31 = a11;
  v32 = a12;
  v33 = a13;
  v38.receiver = self;
  v38.super_class = (Class)SWContainerConfiguration;
  v34 = -[SWContainerConfiguration init](&v38, sel_init);
  v35 = v34;
  if (v34)
  {
    -[SWContainerConfiguration setStoreFront:](v34, "setStoreFront:", v37);
    -[SWContainerConfiguration setLocale:](v35, "setLocale:", v26);
    -[SWContainerConfiguration setContentEnvironment:](v35, "setContentEnvironment:", v27);
    -[SWContainerConfiguration setContentSizeCategory:](v35, "setContentSizeCategory:", v28);
    -[SWContainerConfiguration setCanvasSize:](v35, "setCanvasSize:", v24, v23);
    -[SWContainerConfiguration setContentFrame:](v35, "setContentFrame:", x, y, width, height);
    -[SWContainerConfiguration setDataSources:](v35, "setDataSources:", v29);
    -[SWContainerConfiguration setLocation:](v35, "setLocation:", v30);
    -[SWContainerConfiguration setSourceURL:](v35, "setSourceURL:", v31);
    -[SWContainerConfiguration setActivePictureInPictureURL:](v35, "setActivePictureInPictureURL:", v32);
    -[SWContainerConfiguration setFeedConfiguration:](v35, "setFeedConfiguration:", v33);
    -[SWContainerConfiguration setSupportsLiveActivities:](v35, "setSupportsLiveActivities:", a14);
  }

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SWContainerConfiguration *v25;
  uint64_t v27;
  SWContainerConfiguration *v28;

  v28 = [SWContainerConfiguration alloc];
  -[SWContainerConfiguration storeFront](self, "storeFront");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerConfiguration locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerConfiguration contentEnvironment](self, "contentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerConfiguration contentSizeCategory](self, "contentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerConfiguration canvasSize](self, "canvasSize");
  v9 = v8;
  v11 = v10;
  -[SWContainerConfiguration contentFrame](self, "contentFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SWContainerConfiguration dataSources](self, "dataSources");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerConfiguration location](self, "location");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerConfiguration sourceURL](self, "sourceURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerConfiguration activePictureInPictureURL](self, "activePictureInPictureURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerConfiguration feedConfiguration](self, "feedConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = -[SWContainerConfiguration supportsLiveActivities](self, "supportsLiveActivities");
  v25 = -[SWContainerConfiguration initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:](v28, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:", v4, v5, v6, v7, v20, v21, v9, v11, v13, v15, v17, v19, v22, v23, v24, v27);

  return v25;
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contentEnvironment
{
  return self->_contentEnvironment;
}

- (void)setContentEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (NSDictionary)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SWLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)activePictureInPictureURL
{
  return self->_activePictureInPictureURL;
}

- (void)setActivePictureInPictureURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SWFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
}

- (void)setFeedConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)supportsLiveActivities
{
  return self->_supportsLiveActivities;
}

- (void)setSupportsLiveActivities:(BOOL)a3
{
  self->_supportsLiveActivities = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
  objc_storeStrong((id *)&self->_activePictureInPictureURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_contentEnvironment, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
}

@end
