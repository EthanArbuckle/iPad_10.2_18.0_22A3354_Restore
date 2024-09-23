@implementation QLSpotlightFetcher

- (QLSpotlightFetcher)initWithSearchableItemUniqueIdentifier:(id)a3 queryString:(id)a4 applicationBundleIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  QLSpotlightFetcher *v12;
  QLSpotlightFetcher *v13;
  uint64_t v14;
  QLSpotlightSearchableItemInfo *info;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)QLSpotlightFetcher;
  v12 = -[QLItemFetcher init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchableItemUniqueIdentifier, a3);
    objc_storeStrong((id *)&v13->_queryString, a4);
    objc_storeStrong((id *)&v13->_applicationBundleIdentifier, a5);
    +[QLSpotlightSearchableItemInfo spotlightInfoWithUniqueIdentifier:queryString:applicationBundleIdentifier:](QLSpotlightSearchableItemInfo, "spotlightInfoWithUniqueIdentifier:queryString:applicationBundleIdentifier:", v13->_searchableItemUniqueIdentifier, v13->_queryString, v13->_applicationBundleIdentifier);
    v14 = objc_claimAutoreleasedReturnValue();
    info = v13->_info;
    v13->_info = (QLSpotlightSearchableItemInfo *)v14;

  }
  return v13;
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  QLSpotlightFetcher *v15;
  id v16;

  v9 = a3;
  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__QLSpotlightFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
  v13[3] = &unk_1E9EFC1C8;
  v14 = v9;
  v15 = self;
  v16 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(a4, "addOperationWithBlock:", v13);

}

void __95__QLSpotlightFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_opt_class()))
  {
    objc_msgSend(*(id *)(a1 + 40), "setFetchingState:", 1);
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "info");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (id)itemSize
{
  return &unk_1E9F080C0;
}

- (BOOL)isLongFetchOperation
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLSpotlightFetcher;
  v4 = a3;
  -[QLItemFetcher encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchableItemUniqueIdentifier, CFSTR("searchableItemUniqueIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryString, CFSTR("queryString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));

}

- (QLSpotlightFetcher)initWithCoder:(id)a3
{
  id v4;
  QLSpotlightFetcher *v5;
  uint64_t v6;
  NSString *searchableItemUniqueIdentifier;
  uint64_t v8;
  NSString *queryString;
  uint64_t v10;
  NSString *applicationBundleIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLSpotlightFetcher;
  v5 = -[QLItemFetcher initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchableItemUniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchableItemUniqueIdentifier = v5->_searchableItemUniqueIdentifier;
    v5->_searchableItemUniqueIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryString"));
    v8 = objc_claimAutoreleasedReturnValue();
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;

  }
  return v5;
}

- (QLSpotlightSearchableItemInfo)info
{
  return (QLSpotlightSearchableItemInfo *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_searchableItemUniqueIdentifier, 0);
}

@end
