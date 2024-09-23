@implementation PLSearchSuggestionComponent

- (PLSearchSuggestionComponent)initWithContentString:(id)a3 groupId:(unint64_t)a4 owningGroupId:(unint64_t)a5 matchedAssetsCount:(unint64_t)a6 matchedCollectionsCount:(unint64_t)a7 indexCategory:(unint64_t)a8 lookupIdentifier:(id)a9 score:(float)a10 suggestionType:(unint64_t)a11 matchedText:(id)a12 matchRangeOfSearchText:(_NSRange)a13
{
  id v20;
  id v21;
  id v22;
  PLSearchSuggestionComponent *v23;
  uint64_t v24;
  NSString *contentString;
  uint64_t v26;
  NSString *lookupIdentifier;
  void *v29;
  objc_super v31;

  v20 = a3;
  v21 = a9;
  v22 = a12;
  if (!objc_msgSend(v20, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionComponent.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentString.length > 0"));

  }
  v31.receiver = self;
  v31.super_class = (Class)PLSearchSuggestionComponent;
  v23 = -[PLSearchSuggestionComponent init](&v31, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v20, "copy");
    contentString = v23->_contentString;
    v23->_contentString = (NSString *)v24;

    v23->_psiGroupId = a4;
    v23->_psiOwningGroupId = a5;
    v23->_indexCategory = a8;
    v26 = objc_msgSend(v21, "copy");
    lookupIdentifier = v23->_lookupIdentifier;
    v23->_lookupIdentifier = (NSString *)v26;

    v23->_score = a10;
    v23->_suggestionType = a11;
    v23->_matchedAssetsCount = a6;
    v23->_matchedCollectionsCount = a7;
    objc_storeStrong((id *)&v23->_matchedText, a12);
    v23->_matchRangeOfSearchText = a13;
  }

  return v23;
}

- (PLSearchSuggestionComponent)initWithGroup:(id)a3 matchedAssetsCount:(unint64_t)a4 matchedCollectionsCount:(unint64_t)a5 suggestionType:(unint64_t)a6 matchedText:(id)a7 matchRangeOfSearchText:(_NSRange)a8
{
  PSIGroup *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  PLSearchSuggestionComponent *v21;
  PSIGroup *group;
  void *v24;
  void *v25;

  v11 = (PSIGroup *)a3;
  v12 = a7;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionComponent.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("group"));

  }
  -[PSIGroup contentString](v11, "contentString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionComponent.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("group.contentString.length > 0"));

  }
  -[PSIGroup contentString](v11, "contentString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PSIGroup groupId](v11, "groupId");
  v17 = -[PSIGroup owningGroupId](v11, "owningGroupId");
  v18 = -[PSIGroup category](v11, "category");
  -[PSIGroup lookupIdentifier](v11, "lookupIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIGroup score](v11, "score");
  *(float *)&v20 = v20;
  v21 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](self, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v15, v16, v17, a4, a5, v18, v20, v19, a6, v12, a8.location, a8.length);

  group = v21->_group;
  v21->_group = v11;

  return v21;
}

- (unint64_t)userCategory
{
  return PLSearchUserCategoryForCategory(-[PLSearchSuggestionComponent indexCategory](self, "indexCategory"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  float v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PLSearchSuggestionComponent contentString](self, "contentString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v6, "isEqualToString:", v7);

    v40 = -[PLSearchSuggestionComponent psiGroupId](self, "psiGroupId");
    v39 = objc_msgSend(v5, "psiGroupId");
    v38 = -[PLSearchSuggestionComponent psiOwningGroupId](self, "psiOwningGroupId");
    v37 = objc_msgSend(v5, "psiOwningGroupId");
    v36 = -[PLSearchSuggestionComponent indexCategory](self, "indexCategory");
    v35 = objc_msgSend(v5, "indexCategory");
    -[PLSearchSuggestionComponent lookupIdentifier](self, "lookupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lookupIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
      v34 = 0;
    }
    else
    {
      -[PLSearchSuggestionComponent lookupIdentifier](self, "lookupIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lookupIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      v34 = v12 ^ 1;
    }

    -[PLSearchSuggestionComponent score](self, "score");
    v15 = v14;
    objc_msgSend(v5, "score");
    v17 = v16;
    v33 = -[PLSearchSuggestionComponent suggestionType](self, "suggestionType");
    v18 = objc_msgSend(v5, "suggestionType");
    v32 = -[PLSearchSuggestionComponent matchedAssetsCount](self, "matchedAssetsCount");
    v19 = objc_msgSend(v5, "matchedAssetsCount");
    v31 = -[PLSearchSuggestionComponent matchedCollectionsCount](self, "matchedCollectionsCount");
    v20 = objc_msgSend(v5, "matchedCollectionsCount");
    -[PLSearchSuggestionComponent matchedText](self, "matchedText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchedText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[PLSearchSuggestionComponent matchRangeOfSearchText](self, "matchRangeOfSearchText");
    v25 = v24;
    v26 = objc_msgSend(v5, "matchRangeOfSearchText");
    v13 = 0;
    if (v41
      && v40 == v39
      && v38 == v37
      && v36 == v35
      && (v34 & 1) == 0
      && v15 == v17
      && v33 == v18
      && v32 == v19
      && v31 == v20)
    {
      v13 = v21 == v22 && v23 == v26 && v25 == v27;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = -[PLSearchSuggestionComponent psiGroupId](self, "psiGroupId");
  -[PLSearchSuggestionComponent matchedText](self, "matchedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[PLSearchSuggestionComponent matchRangeOfSearchText](self, "matchRangeOfSearchText");
  v7 = v5 ^ v3 ^ v6;
  v8 = -[PLSearchSuggestionComponent matchRangeOfSearchText](self, "matchRangeOfSearchText");
  v9 = v8 ^ -[PLSearchSuggestionComponent matchedAssetsCount](self, "matchedAssetsCount");
  v10 = v7 ^ v9 ^ -[PLSearchSuggestionComponent matchedCollectionsCount](self, "matchedCollectionsCount");
  v11 = v10 ^ -[PLSearchSuggestionComponent suggestionType](self, "suggestionType");

  return v11;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  float v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  NSRange v20;

  PLDebugStringForSearchIndexCategory(-[PLSearchSuggestionComponent indexCategory](self, "indexCategory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLSearchSuggestionComponent suggestionType](self, "suggestionType");
  if (v4 - 1 > 3)
    v5 = CFSTR("PLSearchSuggestionTypeNone");
  else
    v5 = off_1E3669388[v4 - 1];
  v19 = v5;
  v20.location = -[PLSearchSuggestionComponent matchRangeOfSearchText](self, "matchRangeOfSearchText");
  NSStringFromRange(v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchSuggestionComponent contentString](self, "contentString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLSearchSuggestionComponent psiGroupId](self, "psiGroupId");
  v10 = -[PLSearchSuggestionComponent psiOwningGroupId](self, "psiOwningGroupId");
  -[PLSearchSuggestionComponent lookupIdentifier](self, "lookupIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchSuggestionComponent score](self, "score");
  v13 = v12;
  v14 = -[PLSearchSuggestionComponent matchedAssetsCount](self, "matchedAssetsCount");
  v15 = -[PLSearchSuggestionComponent matchedCollectionsCount](self, "matchedCollectionsCount");
  -[PLSearchSuggestionComponent matchedText](self, "matchedText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("content string: %@, groupId: %llu, owning groupId: %llu, indexCategory: %@, lookupIdentifier: %@, score: %f, suggestion type: %@, matched asset count: %tu, matched collection count: %tu, matched text: %@, match range of search text: %@"), v8, v9, v10, v3, v11, *(_QWORD *)&v13, v19, v14, v15, v16, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (PLSearchSuggestionComponent)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  double v22;
  PLSearchSuggestionComponent *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyContentString"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyPSIGroupId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v4, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyPSIOwningGroupId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyIndexCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertySuggestionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyMatchedAssetCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyMatchedCollectionCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyMatchedText"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyMatchRangeOfSearchText"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "rangeValue");
  v17 = v16;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyScore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionPropertyLookupIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v22) = v20;
  v23 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](self, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v28, v27, v26, v10, v12, v25, v22, v21, v8, v13, v15, v17);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contentString;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  contentString = self->_contentString;
  v14 = a3;
  objc_msgSend(v14, "encodeObject:forKey:", contentString, CFSTR("PLSearchSuggestionPropertyContentString"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_psiGroupId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("PLSearchSuggestionPropertyPSIGroupId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_psiOwningGroupId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("PLSearchSuggestionPropertyPSIOwningGroupId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_indexCategory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("PLSearchSuggestionPropertyIndexCategory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_suggestionType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("PLSearchSuggestionPropertySuggestionType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_matchedAssetsCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("PLSearchSuggestionPropertyMatchedAssetCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_matchedCollectionsCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("PLSearchSuggestionPropertyMatchedCollectionCount"));

  objc_msgSend(v14, "encodeObject:forKey:", self->_matchedText, CFSTR("PLSearchSuggestionPropertyMatchedText"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_matchRangeOfSearchText.location, self->_matchRangeOfSearchText.length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("PLSearchSuggestionPropertyMatchRangeOfSearchText"));

  *(float *)&v12 = self->_score;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("PLSearchSuggestionPropertyScore"));

  objc_msgSend(v14, "encodeObject:forKey:", self->_lookupIdentifier, CFSTR("PLSearchSuggestionPropertyLookupIdentifier"));
}

- (NSString)contentString
{
  return self->_contentString;
}

- (unint64_t)indexCategory
{
  return self->_indexCategory;
}

- (unint64_t)suggestionType
{
  return self->_suggestionType;
}

- (unint64_t)matchedAssetsCount
{
  return self->_matchedAssetsCount;
}

- (unint64_t)matchedCollectionsCount
{
  return self->_matchedCollectionsCount;
}

- (unint64_t)psiGroupId
{
  return self->_psiGroupId;
}

- (unint64_t)psiOwningGroupId
{
  return self->_psiOwningGroupId;
}

- (_NSRange)matchRangeOfSearchText
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_matchRangeOfSearchText.length;
  location = self->_matchRangeOfSearchText.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)matchedText
{
  return self->_matchedText;
}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (float)score
{
  return self->_score;
}

- (PSIGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_matchedText, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
