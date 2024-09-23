@implementation PSIRankedGroupV2

- (PSIRankedGroupV2)initWithGroup:(id)a3 displayString:(id)a4 isMePerson:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PSIRankedGroupV2 *v10;
  uint64_t v11;
  NSString *displayString;
  uint64_t v13;
  NSString *contentString;
  uint64_t v15;
  NSString *lookupIdentifier;
  double v17;
  CFIndex Count;
  CFArrayRef Copy;
  PLSearchSuggestionComponent *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t assetCount;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  PLSearchSuggestionComponent *suggestionComponent;
  objc_super v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PSIRankedGroupV2;
  v10 = -[PSIRankedGroupV2 init](&v30, sel_init);
  if (v10)
  {
    if (v5)
    {
      PLServicesLocalizedFrameworkString();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v9, "length"))
    {
      v11 = objc_msgSend(v9, "copy");
    }
    else
    {
      objc_msgSend(v8, "contentString");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    displayString = v10->_displayString;
    v10->_displayString = (NSString *)v11;

    objc_msgSend(v8, "contentString");
    v13 = objc_claimAutoreleasedReturnValue();
    contentString = v10->_contentString;
    v10->_contentString = (NSString *)v13;

    v10->_groupId = objc_msgSend(v8, "groupId");
    v10->_searchIndexingCategory = (int)objc_msgSend(v8, "category");
    objc_msgSend(v8, "lookupIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    lookupIdentifier = v10->_lookupIdentifier;
    v10->_lookupIdentifier = (NSString *)v15;

    objc_msgSend(v8, "score");
    *(float *)&v17 = v17;
    v10->_graphRankingScore = *(float *)&v17;
    v10->_isMePerson = v5;
    Count = objc_msgSend(v8, "assetIds");
    if (Count)
      Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v8, "assetIds"));
    v10->_assetCount = Count;
    Copy = (CFArrayRef)objc_msgSend(v8, "assetIds");
    if (Copy)
      Copy = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v8, "assetIds"));
    v10->_groupAssetIds = Copy;
    v10->_rankingScore = 9.2234e18;
    v20 = [PLSearchSuggestionComponent alloc];
    objc_msgSend(v8, "contentString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v8, "groupId");
    v23 = objc_msgSend(v8, "owningGroupId");
    assetCount = v10->_assetCount;
    v25 = (int)objc_msgSend(v8, "category");
    objc_msgSend(v8, "lookupIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSIRankedGroupV2 rankingScore](v10, "rankingScore");
    v27 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](v20, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v21, v22, v23, assetCount, 0, v25, v26, 4, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    suggestionComponent = v10->_suggestionComponent;
    v10->_suggestionComponent = (PLSearchSuggestionComponent *)v27;

  }
  return v10;
}

- (float)rankingScore
{
  float result;
  double v4;
  double v5;
  float v6;

  result = self->_rankingScore;
  if (result == 9.2234e18)
  {
    if (-[PSIRankedGroupV2 assetCount](self, "assetCount"))
    {
      +[PLScopedSearchSuggestionGeneration initialSuggestionScoreForIndexCategory:](PLScopedSearchSuggestionGeneration, "initialSuggestionScoreForIndexCategory:", -[PSIRankedGroupV2 searchIndexingCategory](self, "searchIndexingCategory"));
      v5 = v4;
      -[PSIRankedGroupV2 graphRankingScore](self, "graphRankingScore");
      result = v5 + v6;
    }
    else
    {
      result = 0.0;
    }
    self->_rankingScore = result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PSIRankedGroupV2 *v4;
  PSIRankedGroupV2 *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (PSIRankedGroupV2 *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PSIRankedGroupV2 groupId](self, "groupId");
      if (v6 == -[PSIRankedGroupV2 groupId](v5, "groupId")
        && (v7 = -[PSIRankedGroupV2 assetCount](self, "assetCount"),
            v7 == -[PSIRankedGroupV2 assetCount](v5, "assetCount")))
      {
        -[PSIRankedGroupV2 suggestionComponent](self, "suggestionComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSIRankedGroupV2 suggestionComponent](v5, "suggestionComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[PSIRankedGroupV2 isMePerson](self, "isMePerson");
  return -[PSIRankedGroupV2 assetCount](self, "assetCount") ^ v3 ^ self->_groupId;
}

- (id)description
{
  void *v3;
  NSString *displayString;
  unint64_t groupId;
  NSString *contentString;
  unint64_t searchIndexingCategory;
  NSString *lookupIdentifier;
  double graphRankingScore;
  float v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PSIRankedGroupV2;
  -[PSIRankedGroupV2 description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  groupId = self->_groupId;
  displayString = self->_displayString;
  contentString = self->_contentString;
  searchIndexingCategory = self->_searchIndexingCategory;
  lookupIdentifier = self->_lookupIdentifier;
  graphRankingScore = self->_graphRankingScore;
  -[PSIRankedGroupV2 rankingScore](self, "rankingScore");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("content string: %@, display string: %@, groupId: %llu, group indexing category: %tu, lookupIdentifier:%@, graph ranking score:%f, ranking score: %f, nAssetIds: %tu"), contentString, displayString, groupId, searchIndexingCategory, lookupIdentifier, *(_QWORD *)&graphRankingScore, v10, self->_assetCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PSIRankedGroupV2)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int16 v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  PSIGroup *v17;
  PSIRankedGroupV2 *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PSIRankedGroupPropertyContentString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PSIRankedGroupPropertyDisplayString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PSIRankedGroupPropertyGroupId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PSIRankedGroupPropertySearchIndexingCategory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PSIRankedGroupPropertySearchLookupIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PSIRankedGroupPropertyGroupScore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PSIRankedGroupPropertyIsMePerson"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "BOOLValue");
  v17 = -[PSIGroup initWithContentString:normalizedString:lookupIdentifier:category:groupId:owningGroupId:score:]([PSIGroup alloc], "initWithContentString:normalizedString:lookupIdentifier:category:groupId:owningGroupId:score:", v5, v5, v11, v10, v8, 0, v14);
  v18 = -[PSIRankedGroupV2 initWithGroup:displayString:isMePerson:](self, "initWithGroup:displayString:isMePerson:", v17, v6, v16);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contentString;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  contentString = self->_contentString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contentString, CFSTR("PSIRankedGroupPropertyContentString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayString, CFSTR("PSIRankedGroupPropertyDisplayString"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_groupId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("PSIRankedGroupPropertyGroupId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_searchIndexingCategory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("PSIRankedGroupPropertySearchIndexingCategory"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_lookupIdentifier, CFSTR("PSIRankedGroupPropertySearchLookupIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_graphRankingScore);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("PSIRankedGroupPropertyGroupScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMePerson);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("PSIRankedGroupPropertyIsMePerson"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_assetCount);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("PSIRankedGroupPropertyAssetCount"));

}

- (id)jsonDictionary
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[8];
  _QWORD v22[9];

  v22[8] = *MEMORY[0x1E0C80C00];
  v3 = -[PSIRankedGroupV2 isMePerson](self, "isMePerson");
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  v21[0] = CFSTR("content_string");
  -[PSIRankedGroupV2 contentString](self, "contentString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("display_string");
  -[PSIRankedGroupV2 displayString](self, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  v21[2] = CFSTR("group_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PSIRankedGroupV2 groupId](self, "groupId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v6;
  v21[3] = CFSTR("index_category");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PSIRankedGroupV2 searchIndexingCategory](self, "searchIndexingCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v7;
  v21[4] = CFSTR("graph_ranking_score");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PSIRankedGroupV2 graphRankingScore](self, "graphRankingScore");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v9;
  v21[5] = CFSTR("is_me_person");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v10;
  v21[6] = CFSTR("asset_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PSIRankedGroupV2 assetCount](self, "assetCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v11;
  v21[7] = CFSTR("overall_ranking_score");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PSIRankedGroupV2 rankingScore](self, "rankingScore");
  objc_msgSend(v12, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v4, "initWithDictionary:", v14);

  -[PSIRankedGroupV2 lookupIdentifier](self, "lookupIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PSIRankedGroupV2 lookupIdentifier](self, "lookupIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("lookup_identifier"));

  }
  v18 = (void *)objc_msgSend(v15, "copy");

  return v18;
}

- (void)dealloc
{
  __CFArray *groupAssetIds;
  objc_super v4;

  groupAssetIds = self->_groupAssetIds;
  if (groupAssetIds)
    CFRelease(groupAssetIds);
  v4.receiver = self;
  v4.super_class = (Class)PSIRankedGroupV2;
  -[PSIRankedGroupV2 dealloc](&v4, sel_dealloc);
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)contentString
{
  return self->_contentString;
}

- (unint64_t)searchIndexingCategory
{
  return self->_searchIndexingCategory;
}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (BOOL)isMePerson
{
  return self->_isMePerson;
}

- (void)setRankingScore:(float)a3
{
  self->_rankingScore = a3;
}

- (PLSearchSuggestionComponent)suggestionComponent
{
  return self->_suggestionComponent;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (__CFArray)groupAssetIds
{
  return self->_groupAssetIds;
}

- (float)graphRankingScore
{
  return self->_graphRankingScore;
}

- (void)setGraphRankingScore:(float)a3
{
  self->_graphRankingScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionComponent, 0);
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
