@implementation SXWebContentConfigurationProvider

- (SXWebContentConfigurationProvider)initWithPresentationAttributesProvider:(id)a3 storeFrontProvider:(id)a4 liveActivityAttributesProvider:(id)a5 locale:(id)a6 location:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SXWebContentConfigurationProvider *v17;
  SXWebContentConfigurationProvider *v18;
  id v20;
  objc_super v21;

  v13 = a3;
  v20 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SXWebContentConfigurationProvider;
  v17 = -[SXWebContentConfigurationProvider init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_presentationAttributesProvider, a3);
    objc_msgSend(v13, "addObserver:", v18);
    objc_storeStrong((id *)&v18->_storeFrontProvider, a4);
    objc_storeStrong((id *)&v18->_liveActivityAttributesProvider, a5);
    objc_storeStrong((id *)&v18->_locale, a6);
    objc_storeStrong((id *)&v18->_location, a7);
  }

  return v18;
}

- (void)invokeChangeListener
{
  void *v3;
  void (**v4)(void);

  -[SXWebContentConfigurationProvider changeBlock](self, "changeBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXWebContentConfigurationProvider changeBlock](self, "changeBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (id)configurationForSize:(CGSize)a3 dataSources:(id)a4 sourceURL:(id)a5
{
  double height;
  double width;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  height = a3.height;
  width = a3.width;
  v9 = (objc_class *)MEMORY[0x24BE90778];
  v10 = a5;
  v11 = a4;
  v12 = [v9 alloc];
  -[SXWebContentConfigurationProvider storeFrontProvider](self, "storeFrontProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "storeFrontIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentConfigurationProvider locale](self, "locale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentConfigurationProvider presentationAttributesProvider](self, "presentationAttributesProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "presentationAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentSizeCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentConfigurationProvider location](self, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x24BE90798]);
  -[SXWebContentConfigurationProvider liveActivityAttributesProvider](self, "liveActivityAttributesProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = 0;
  LOBYTE(v22) = objc_msgSend(v19, "supportsLiveActivities");
  v20 = (void *)objc_msgSend(v12, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:", v13, v14, 0, v16, v11, v17, width, height, 0.0, 0.0, width, height, v10, 0, v18,
                  v22,
                  0,
                  0,
                  v23);

  return v20;
}

- (void)presentationAttributesDidChangeFrom:(id)a3 toAttributes:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "contentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqualToString:", v8);
  if ((v6 & 1) == 0)
    -[SXWebContentConfigurationProvider invokeChangeListener](self, "invokeChangeListener");
}

- (SXPresentationAttributesProvider)presentationAttributesProvider
{
  return self->_presentationAttributesProvider;
}

- (SXStoreFrontProvider)storeFrontProvider
{
  return self->_storeFrontProvider;
}

- (SXLiveActivityAttributesProvider)liveActivityAttributesProvider
{
  return self->_liveActivityAttributesProvider;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (SWLocation)location
{
  return self->_location;
}

- (id)changeBlock
{
  return self->_changeBlock;
}

- (void)setChangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeBlock, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_liveActivityAttributesProvider, 0);
  objc_storeStrong((id *)&self->_storeFrontProvider, 0);
  objc_storeStrong((id *)&self->_presentationAttributesProvider, 0);
}

@end
