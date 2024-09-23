@implementation PLNamedCombinedAssetSearchResult

- (PLNamedCombinedAssetSearchResult)initWithName:(id)a3 assetSearchResults:(id)a4 canOverlap:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  PLNamedCombinedAssetSearchResult *v9;
  uint64_t v10;
  NSString *name;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLNamedCombinedAssetSearchResult;
  v9 = -[PLCombinedAssetSearchResult initWithAssetSearchResults:canOverlap:](&v13, sel_initWithAssetSearchResults_canOverlap_, a4, v5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

  }
  return v9;
}

- (id)contentStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_name;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)matchCount
{
  void *v4;
  unint64_t v5;

  if (-[PLNamedCombinedAssetSearchResult hasSpecialName](self, "hasSpecialName"))
    return 1;
  -[PLNamedCombinedAssetSearchResult matchRanges](self, "matchRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)matchRanges
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[PLNamedCombinedAssetSearchResult hasSpecialName](self, "hasSpecialName"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, -[NSString length](self->_name, "length"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PLNamedCombinedAssetSearchResult;
    -[PLSearchResult matchRanges](&v7, sel_matchRanges);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)hasSpecialName
{
  void *v3;
  NSString *name;
  void *v5;
  _BOOL4 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLNamedCombinedAssetSearchResult;
  -[PLSearchResult contentStrings](&v8, sel_contentStrings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    name = self->_name;
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[NSString isEqualToString:](name, "isEqualToString:", v5);

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
