@implementation WBSParsecSearchResult

- (WBSParsecSearchResult)init
{

  return 0;
}

- (WBSParsecSearchResult)initWithSFSearchResult:(id)a3
{
  id v5;
  WBSParsecSearchResult *v6;
  WBSParsecSearchResult *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *imageURL;
  WBSParsecSearchResult *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSParsecSearchResult;
  v6 = -[WBSParsecSearchResult init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sfSearchResult, a3);
    -[WBSParsecSearchResult sfSearchResultValue](v7, "sfSearchResultValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "thumbnail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_4;
    -[WBSParsecSearchResult sfSearchResultValue](v7, "sfSearchResultValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_4:
      objc_msgSend(v10, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("urlValue"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("address"));
      v15 = objc_claimAutoreleasedReturnValue();
      imageURL = v7->_imageURL;
      v7->_imageURL = (NSString *)v15;

    }
    v17 = v7;
  }

  return v7;
}

- (int64_t)type
{
  SFSearchResult *v2;
  int64_t v3;
  NSObject *v4;

  v2 = self->_sfSearchResult;
  v3 = +[WBSParsecSearchResult typeForSFSearchResult:](WBSParsecSearchResult, "typeForSFSearchResult:", v2);
  if (!v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXParsec();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[WBSParsecSearchResult type].cold.1(v4, v2);
  }

  return v3;
}

- (NSString)stringForType
{
  int64_t v2;

  v2 = -[WBSParsecSearchResult type](self, "type");
  if ((unint64_t)(v2 - 1) > 4)
    return (NSString *)CFSTR("unkown");
  else
    return &off_1E54450C0[v2 - 1]->isa;
}

+ (int64_t)typeForSFSearchResult:(id)a3
{
  id v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "resultType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("flights"));

  if ((v5 & 1) != 0)
  {
    v6 = 5;
  }
  else
  {
    objc_msgSend(v3, "resultType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("sports"));

    if ((v8 & 1) != 0)
    {
      v6 = 4;
    }
    else if (objc_msgSend(MEMORY[0x1E0D8A120], "isSMARTParsecResultsEnabled")
           && (objc_msgSend(v3, "resultType"),
               v9 = (void *)objc_claimAutoreleasedReturnValue(),
               v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("maps")),
               v9,
               (v10 & 1) != 0))
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(v3, "inlineCard");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cardSections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v22;
        v6 = 4;
        while (2)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = v13;
              goto LABEL_18;
            }
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v15)
            continue;
          break;
        }
      }

      objc_msgSend(v3, "resultTemplate", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E547C408, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v19, "integerValue");

LABEL_18:
    }
  }

  return v6;
}

- (int64_t)subtype
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SFSearchResult resultType](self->_sfSearchResult, "resultType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E547C430, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (NSString)title
{
  void *sfSearchResult;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SFSearchResult safari_firstInlineCardSectionOfClass:](self->_sfSearchResult, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
  sfSearchResult = (void *)objc_claimAutoreleasedReturnValue();
  v4 = sfSearchResult;
  if (sfSearchResult)
    goto LABEL_6;
  if (+[WBSParsecSearchResult typeForSFSearchResult:](WBSParsecSearchResult, "typeForSFSearchResult:", self->_sfSearchResult) != 3|| (-[SFSearchResult safari_firstInlineCardSectionOfClass:](self->_sfSearchResult, "safari_firstInlineCardSectionOfClass:", objc_opt_class()), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    sfSearchResult = self->_sfSearchResult;
LABEL_6:
    objc_msgSend(sfSearchResult, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v6 = v5;
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (NSString *)v8;
}

- (NSString)descriptionText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SFSearchResult safari_firstInlineCardSectionOfClass:](self->_sfSearchResult, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (+[WBSParsecSearchResult typeForSFSearchResult:](WBSParsecSearchResult, "typeForSFSearchResult:", self->_sfSearchResult) == 3&& (-[SFSearchResult safari_firstInlineCardSectionOfClass:](self->_sfSearchResult, "safari_firstInlineCardSectionOfClass:", objc_opt_class()), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v5 = v7;
      objc_msgSend(v7, "secondaryTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SFSearchResult descriptions](self->_sfSearchResult, "descriptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_msgSend(v8, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)identifier
{
  return (NSString *)-[SFSearchResult identifier](self->_sfSearchResult, "identifier");
}

- (NSString)feedbackIdentifier
{
  return (NSString *)-[SFSearchResult fbr](self->_sfSearchResult, "fbr");
}

- (NSString)urlString
{
  void *v2;
  void *v3;

  -[SFSearchResult url](self->_sfSearchResult, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sectionHeader
{
  return (NSString *)-[SFSearchResult sectionHeader](self->_sfSearchResult, "sectionHeader");
}

- (NSString)completion
{
  return (NSString *)-[SFSearchResult completion](self->_sfSearchResult, "completion");
}

- (NSString)query
{
  return (NSString *)-[SFSearchResult completedQuery](self->_sfSearchResult, "completedQuery");
}

- (unint64_t)minimumRankOfTopHitToSuppressResult
{
  return -[SFSearchResult minimumRankOfTopHitToSuppressResult](self->_sfSearchResult, "minimumRankOfTopHitToSuppressResult");
}

- (NSURL)appPunchoutURL
{
  void *v2;
  void *v3;

  -[SFSearchResult punchout](self->_sfSearchResult, "punchout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredOpenableURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)referrerForLoadingResult
{
  return (NSString *)-[SFSearchResult appleReferrer](self->_sfSearchResult, "appleReferrer");
}

- (BOOL)isPredictionFromServerMatchingUserTypedQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (-[SFSearchResult topHit](self->_sfSearchResult, "topHit"))
  {
    objc_msgSend(v4, "queryString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SFSearchResult completedQuery](self->_sfSearchResult, "completedQuery");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "hasPrefix:", v5))
        v9 = objc_msgSend(v8, "length") != 0;
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SFSearchResult)sfSearchResultValue
{
  return self->_sfSearchResult;
}

- (NSString)sectionBundleIdentifier
{
  return (NSString *)-[SFSearchResult sectionBundleIdentifier](self->_sfSearchResult, "sectionBundleIdentifier");
}

- (int64_t)parsecQueryID
{
  return 0;
}

- (WBSParsecImageRepresentation)icon
{
  void *v2;
  WBSParsecImageRepresentation *v3;

  -[SFSearchResult icon](self->_sfSearchResult, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[WBSParsecImageRepresentation initWithSFImage:]([WBSParsecImageRepresentation alloc], "initWithSFImage:", v2);
  else
    v3 = 0;

  return v3;
}

- (WBSParsecImageRepresentation)completionIcon
{
  void *v2;
  WBSParsecImageRepresentation *v3;

  -[SFSearchResult completionImage](self->_sfSearchResult, "completionImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[WBSParsecImageRepresentation initWithSFImage:]([WBSParsecImageRepresentation alloc], "initWithSFImage:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)iconWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WBSParsecSearchResult icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithSession:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)completionIconWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WBSParsecSearchResult completionIcon](self, "completionIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithSession:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)parsecDomainIdentifier
{
  return 0;
}

- (unint64_t)engagementDestination
{
  return 0;
}

- (BOOL)shouldAutocompleteQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (-[WBSParsecSearchResult isPredictionFromServerMatchingUserTypedQuery:](self, "isPredictionFromServerMatchingUserTypedQuery:", v4))
  {
    v5 = (void *)MEMORY[0x1E0D8A1A8];
    -[WBSParsecSearchResult urlString](self, "urlString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSParsecSearchResult query](self, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "shouldAutocompleteToURL:fromUserTypedString:withPredictedQueryString:", v6, v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSParsecSearchResult title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSParsecSearchResult urlString](self, "urlString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title = %@ url = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_sfSearchResult, 0);
}

- (void)type
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "resultTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Received result of unknown type %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
