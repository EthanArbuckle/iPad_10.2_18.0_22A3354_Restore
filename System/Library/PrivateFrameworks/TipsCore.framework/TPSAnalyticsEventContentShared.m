@implementation TPSAnalyticsEventContentShared

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentShared)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventContentShared *v5;
  uint64_t v6;
  NSString *contentID;
  uint64_t v8;
  NSString *collectionID;
  uint64_t v10;
  NSString *shareMethod;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventContentShared;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v13, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("share_method"));
    v10 = objc_claimAutoreleasedReturnValue();
    shareMethod = v5->_shareMethod;
    v5->_shareMethod = (NSString *)v10;

  }
  return v5;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 shareMethod:(id)a5
{
  id v9;
  id v10;
  id v11;
  TPSAnalyticsEventContentShared *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventContentShared;
  v12 = -[TPSAnalyticsEvent initWithDate:](&v15, sel_initWithDate_, 0);
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contentID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
  }

  return p_isa;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 shareMethod:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContentID:collectionID:shareMethod:", v10, v9, v8);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentShared;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shareMethod, CFSTR("share_method"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("content_shared"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_contentID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_shareMethod, CFSTR("share_method"));
  return v3;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
  objc_storeStrong((id *)&self->_contentID, a3);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_collectionID, a3);
}

- (NSString)shareMethod
{
  return self->_shareMethod;
}

- (void)setShareMethod:(id)a3
{
  objc_storeStrong((id *)&self->_shareMethod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMethod, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
