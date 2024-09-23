@implementation IMPodcastFeedChannelItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)IMPodcastFeedChannelItem;
  -[IMPodcastFeedChannelItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPodcastFeedChannelItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPodcastFeedChannelItem storeId](self, "storeId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Name: %@ ID: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  BOOL v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IMPodcastFeedChannelItem name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == v7 || objc_msgSend(v6, "isEqual:", v7))
      && (v8 = -[IMPodcastFeedChannelItem showCount](self, "showCount"), v8 == objc_msgSend(v5, "showCount"))
      && (v9 = -[IMPodcastFeedChannelItem availableShowCount](self, "availableShowCount"),
          v9 == objc_msgSend(v5, "availableShowCount")))
    {
      -[IMPodcastFeedChannelItem storeId](self, "storeId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "storeId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11 || objc_msgSend(v10, "isEqual:", v11))
      {
        -[IMPodcastFeedChannelItem displayType](self, "displayType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "displayType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 == v13 || objc_msgSend(v12, "isEqual:", v13))
        {
          v46 = v12;
          -[IMPodcastFeedChannelItem artworkURL](self, "artworkURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "artworkURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v14;
          if (v14 == v15 || objc_msgSend(v14, "isEqual:", v15))
          {
            v44 = v15;
            -[IMPodcastFeedChannelItem logoImageURL](self, "logoImageURL");
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "logoImageURL");
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = (void *)v16;
            v19 = (void *)v17;
            v43 = v18;
            if (v18 == (void *)v17 || objc_msgSend(v18, "isEqual:", v17))
            {
              v42 = v19;
              -[IMPodcastFeedChannelItem backgroundColor](self, "backgroundColor");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "backgroundColor");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20 == v21 || objc_msgSend(v20, "isEqual:", v21))
              {
                v41 = v21;
                -[IMPodcastFeedChannelItem logoImageHeight](self, "logoImageHeight");
                v23 = v22;
                objc_msgSend(v5, "logoImageHeight");
                if (v23 == v24
                  && (-[IMPodcastFeedChannelItem logoImageWidth](self, "logoImageWidth"),
                      v26 = v25,
                      objc_msgSend(v5, "logoImageWidth"),
                      v26 == v27))
                {
                  -[IMPodcastFeedChannelItem uberBackgroundImageURL](self, "uberBackgroundImageURL");
                  v28 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "uberBackgroundImageURL");
                  v29 = objc_claimAutoreleasedReturnValue();
                  v30 = (void *)v28;
                  v31 = (void *)v29;
                  v40 = v30;
                  if (v30 == (void *)v29 || objc_msgSend(v30, "isEqual:", v29))
                  {
                    -[IMPodcastFeedChannelItem uberBackgroundJoeColor](self, "uberBackgroundJoeColor", v31, v40);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "uberBackgroundJoeColor");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v32 == v33)
                    {
                      v36 = v32;
                      v37 = 1;
                    }
                    else
                    {
                      v34 = v33;
                      v35 = objc_msgSend(v32, "isEqual:", v33);
                      v33 = v34;
                      v36 = v32;
                      v37 = v35;
                    }

                    v31 = v39;
                  }
                  else
                  {
                    v37 = 0;
                  }

                }
                else
                {
                  v37 = 0;
                }
                v21 = v41;
              }
              else
              {
                v37 = 0;
              }

              v19 = v42;
            }
            else
            {
              v37 = 0;
            }

            v15 = v44;
          }
          else
          {
            v37 = 0;
          }

          v12 = v46;
        }
        else
        {
          v37 = 0;
        }

      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)subscriptionName
{
  return self->_subscriptionName;
}

- (void)setSubscriptionName:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionName, a3);
}

- (int64_t)showCount
{
  return self->_showCount;
}

- (void)setShowCount:(int64_t)a3
{
  self->_showCount = a3;
}

- (int64_t)availableShowCount
{
  return self->_availableShowCount;
}

- (void)setAvailableShowCount:(int64_t)a3
{
  self->_availableShowCount = a3;
}

- (NSString)storeId
{
  return self->_storeId;
}

- (void)setStoreId:(id)a3
{
  objc_storeStrong((id *)&self->_storeId, a3);
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (NSString)logoImageURL
{
  return self->_logoImageURL;
}

- (void)setLogoImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageURL, a3);
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (float)logoImageHeight
{
  return self->_logoImageHeight;
}

- (void)setLogoImageHeight:(float)a3
{
  self->_logoImageHeight = a3;
}

- (float)logoImageWidth
{
  return self->_logoImageWidth;
}

- (void)setLogoImageWidth:(float)a3
{
  self->_logoImageWidth = a3;
}

- (NSString)uberBackgroundImageURL
{
  return self->_uberBackgroundImageURL;
}

- (void)setUberBackgroundImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_uberBackgroundImageURL, a3);
}

- (NSString)uberBackgroundJoeColor
{
  return self->_uberBackgroundJoeColor;
}

- (void)setUberBackgroundJoeColor:(id)a3
{
  objc_storeStrong((id *)&self->_uberBackgroundJoeColor, a3);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)fallbackSubscriptionName
{
  return self->_fallbackSubscriptionName;
}

- (void)setFallbackSubscriptionName:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackSubscriptionName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackSubscriptionName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uberBackgroundJoeColor, 0);
  objc_storeStrong((id *)&self->_uberBackgroundImageURL, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_logoImageURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_subscriptionName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
