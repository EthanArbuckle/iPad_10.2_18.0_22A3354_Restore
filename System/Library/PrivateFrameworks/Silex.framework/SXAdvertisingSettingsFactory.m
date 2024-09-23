@implementation SXAdvertisingSettingsFactory

- (SXAdvertisingSettingsFactory)initWithDocumentProvider:(id)a3 debugSettingsProvider:(id)a4
{
  id v7;
  id v8;
  SXAdvertisingSettingsFactory *v9;
  SXAdvertisingSettingsFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXAdvertisingSettingsFactory;
  v9 = -[SXAdvertisingSettingsFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_debugSettingsProvider, a4);
  }

  return v10;
}

- (id)createAdvertisingSettingsWithDOMObjectProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SXAutoPlacementAdvertisingSettings *v7;
  void *v8;
  void *v9;
  SXAutoPlacementAdvertisingSettings *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  -[SXAdvertisingSettingsFactory debugSettingsProvider](self, "debugSettingsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "autoPlacement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "advertisement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!objc_msgSend(v9, "enabled"))
      {
        v7 = 0;
        goto LABEL_9;
      }
      v10 = [SXAutoPlacementAdvertisingSettings alloc];
      v11 = objc_msgSend(v9, "frequency");
      v12 = objc_msgSend(v9, "bannerType");
      objc_msgSend(v9, "layout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v9, "distanceFromMedia");
      v7 = -[SXAutoPlacementAdvertisingSettings initWithFrequency:bannerType:layout:distanceFromMedia:](v10, "initWithFrequency:bannerType:layout:distanceFromMedia:", v11, v12, v13, v14, v15);
    }
    else
    {
      -[SXAdvertisingSettingsFactory documentProvider](self, "documentProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "document");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "advertisingSettings");
      v7 = (SXAutoPlacementAdvertisingSettings *)objc_claimAutoreleasedReturnValue();

    }
LABEL_9:

    goto LABEL_10;
  }
  v7 = v6;
LABEL_10:

  return v7;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXDebugAdvertisementSettingsProvider)debugSettingsProvider
{
  return self->_debugSettingsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugSettingsProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end
