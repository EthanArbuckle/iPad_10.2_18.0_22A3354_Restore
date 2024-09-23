@implementation PKDynamicAssetIndex

- (PKDynamicAssetIndex)initWithContentsOfURL:(id)a3
{
  id v4;
  PKDynamicAssetIndex *v5;
  uint64_t v6;
  NSDictionary *index;
  uint64_t v8;
  NSDate *dateCreated;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDynamicAssetIndex;
  v5 = -[PKDynamicAssetIndex init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v4);
    index = v5->_index;
    v5->_index = (NSDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = objc_claimAutoreleasedReturnValue();
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v8;

  }
  return v5;
}

- (id)mappedAssetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_index, "objectForKeyedSubscript:", CFSTR("AssetIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v4;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Assets: mapped asset identifier %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);
    }
    v8 = v6;
  }
  else
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Assets: couldn't map asset identifier %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v8 = v4;
  }

  v9 = v8;
  return v9;
}

- (id)mappedStringIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_index, "objectForKeyedSubscript:", CFSTR("StringIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v4;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Assets: mapped string identifier %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);
    }
    v8 = v6;
  }
  else
  {
    PKLogFacilityTypeGetObject(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Assets: couldn't map string identifier %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v8 = v4;
  }

  v9 = v8;
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p;\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_index, "objectForKeyedSubscript:", CFSTR("AssetIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Asset identifiers:\n%@;\n"), v4);

  -[NSDictionary objectForKeyedSubscript:](self->_index, "objectForKeyedSubscript:", CFSTR("StringIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("String identifiers:\n%@;\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end
