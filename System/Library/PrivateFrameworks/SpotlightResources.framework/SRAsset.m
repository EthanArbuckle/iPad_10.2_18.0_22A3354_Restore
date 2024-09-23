@implementation SRAsset

- (id)pathWithName:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_paths, "objectForKeyedSubscript:", a3);
}

- (NSArray)contentNames
{
  return -[NSDictionary allKeys](self->_paths, "allKeys");
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSArray)contentPaths
{
  return -[NSDictionary allValues](self->_paths, "allValues");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

+ (id)assetWithLocaleIdentifier:(id)a3 contentType:(id)a4 deliveryType:(int64_t)a5 resourceRoot:(id)a6 pathNames:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SRAsset *v22;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v25 = a4;
  v10 = a6;
  v11 = a7;
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v10, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v12, "count"))
  {
    v21 = v25;
    v20 = v26;
    v22 = -[SRAsset initWithLocaleIdentifier:contentType:deliveryType:paths:]([SRAsset alloc], "initWithLocaleIdentifier:contentType:deliveryType:paths:", v26, v25, a5, v12);
  }
  else
  {
    v22 = 0;
    v21 = v25;
    v20 = v26;
  }

  return v22;
}

+ (id)assetWithLocaleIdentifier:(id)a3 contentType:(id)a4 deliveryType:(int64_t)a5 path:(id)a6
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  SRAsset *v17;

  v9 = a3;
  v10 = a4;
  v11 = (objc_class *)MEMORY[0x24BDBCED8];
  v12 = a6;
  v13 = objc_alloc_init(v11);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v14, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v15);

  }
  if (objc_msgSend(v13, "count"))
    v17 = -[SRAsset initWithLocaleIdentifier:contentType:deliveryType:paths:]([SRAsset alloc], "initWithLocaleIdentifier:contentType:deliveryType:paths:", v9, v10, a5, v13);
  else
    v17 = 0;

  return v17;
}

+ (id)deliveryTypeString:(int64_t)a3
{
  NSObject *v5;

  if ((unint64_t)a3 < 6)
    return off_251908428[a3];
  SRLogCategoryGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SRAsset deliveryTypeString:].cold.1(a3, v5);

  return CFSTR("Unknown");
}

+ (int64_t)deliveryTypeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Required")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Optional")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Optional2024")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Delta")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Optional2024Test")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DeltaTest")))
  {
    v4 = 5;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (SRAsset)initWithLocaleIdentifier:(id)a3 contentType:(id)a4 deliveryType:(int64_t)a5 paths:(id)a6
{
  id v10;
  id v11;
  id v12;
  SRAsset *v13;
  uint64_t v14;
  NSString *localeIdentifier;
  uint64_t v16;
  NSString *contentType;
  uint64_t v18;
  NSDictionary *paths;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SRAsset;
  v13 = -[SRAsset init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    localeIdentifier = v13->_localeIdentifier;
    v13->_localeIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    contentType = v13->_contentType;
    v13->_contentType = (NSString *)v16;

    v13->_deliveryType = a5;
    v18 = objc_msgSend(v12, "copy");
    paths = v13->_paths;
    v13->_paths = (NSDictionary *)v18;

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *contentType;
  NSString *localeIdentifier;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[SRAsset deliveryTypeString:](SRAsset, "deliveryTypeString:", self->_deliveryType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  localeIdentifier = self->_localeIdentifier;
  contentType = self->_contentType;
  -[NSDictionary allKeys](self->_paths, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@\n\t <%@>"), v4, localeIdentifier, contentType, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)deliveryType
{
  return self->_deliveryType;
}

+ (void)deliveryTypeString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_24798C000, a2, OS_LOG_TYPE_ERROR, "Invalid asset delivery type %ld", (uint8_t *)&v2, 0xCu);
}

@end
