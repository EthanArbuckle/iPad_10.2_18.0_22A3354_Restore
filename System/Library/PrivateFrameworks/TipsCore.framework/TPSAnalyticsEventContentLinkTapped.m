@implementation TPSAnalyticsEventContentLinkTapped

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentLinkTapped)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventContentLinkTapped *v5;
  uint64_t v6;
  NSString *contentID;
  uint64_t v8;
  NSString *collectionID;
  uint64_t v10;
  NSString *correlationID;
  uint64_t v12;
  NSString *clientConditionID;
  uint64_t v14;
  NSString *bundleID;
  uint64_t v16;
  NSString *context;
  uint64_t v18;
  NSString *displayType;
  uint64_t v20;
  NSString *url;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSAnalyticsEventContentLinkTapped;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_ID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collection_ID"));
    v8 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_correlation_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client_condition"));
    v12 = objc_claimAutoreleasedReturnValue();
    clientConditionID = v5->_clientConditionID;
    v5->_clientConditionID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle_ID"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v16 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_type"));
    v18 = objc_claimAutoreleasedReturnValue();
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link_url"));
    v20 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v20;

  }
  return v5;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 url:(id)a7 bundleID:(id)a8 context:(id)a9 displayType:(id)a10
{
  id v17;
  id v18;
  TPSAnalyticsEventContentLinkTapped *v19;
  TPSAnalyticsEventContentLinkTapped *v20;
  uint64_t v21;
  NSString *url;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v17 = a7;
  v25 = a8;
  v24 = a9;
  v18 = a10;
  v30.receiver = self;
  v30.super_class = (Class)TPSAnalyticsEventContentLinkTapped;
  v19 = -[TPSAnalyticsEvent initWithDate:](&v30, sel_initWithDate_, 0);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_contentID, a3);
    objc_storeStrong((id *)&v20->_collectionID, a4);
    objc_storeStrong((id *)&v20->_correlationID, a5);
    objc_storeStrong((id *)&v20->_clientConditionID, a6);
    objc_msgSend(v17, "absoluteString", v24, v25, v26, v27, v28, v29);
    v21 = objc_claimAutoreleasedReturnValue();
    url = v20->_url;
    v20->_url = (NSString *)v21;

    objc_storeStrong((id *)&v20->_bundleID, a8);
    objc_storeStrong((id *)&v20->_context, a9);
    objc_storeStrong((id *)&v20->_displayType, a10);
  }

  return v20;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 url:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContentID:collectionID:correlationID:clientConditionID:url:bundleID:context:displayType:", v16, v15, v14, v13, v12, 0, 0, 0);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentLinkTapped;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientConditionID, CFSTR("client_condition"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayType, CFSTR("display_type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("link_url"));

}

- (void)setDataProvider:(id)a3
{
  NSString *displayType;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEventContentLinkTapped;
  -[TPSAnalyticsEvent setDataProvider:](&v9, sel_setDataProvider_, a3);
  displayType = self->_displayType;
  if (displayType)
  {
    v5 = displayType;
    v6 = self->_displayType;
    self->_displayType = v5;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayTypeForIdentifier:", self->_contentID);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_displayType;
    self->_displayType = v7;

  }
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("link_used"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_contentID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clientConditionID, CFSTR("client_condition"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_context, CFSTR("context"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_displayType, CFSTR("display_type"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_url, CFSTR("link_url"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("u65_flag"));

  return v3;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (NSString)clientConditionID
{
  return self->_clientConditionID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_clientConditionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
