@implementation WBSFrequentlyVisitedSiteCandidate

- (WBSFrequentlyVisitedSiteCandidate)initWithURLString:(id)a3 title:(id)a4 score:(float)a5
{
  id v9;
  id v10;
  WBSFrequentlyVisitedSiteCandidate *v11;
  WBSFrequentlyVisitedSiteCandidate *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *v17;
  WBSFrequentlyVisitedSiteCandidate *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WBSFrequentlyVisitedSiteCandidate;
  v11 = -[WBSFrequentlyVisitedSiteCandidate init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_urlString, a3);
    v12->_score = a5;
    v13 = objc_msgSend(v10, "length");
    if (v13)
    {
      __67__WBSFrequentlyVisitedSiteCandidate_initWithURLString_title_score___block_invoke(v13, v10);
      v14 = objc_claimAutoreleasedReturnValue();
      title = v12->_title;
      v12->_title = (NSString *)v14;
    }
    else
    {
      title = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v9);
      -[NSString safari_userVisibleHostWithoutWWWSubdomain](title, "safari_userVisibleHostWithoutWWWSubdomain");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v12->_title;
      v12->_title = (NSString *)v16;

    }
    v18 = v12;
  }

  return v12;
}

id __67__WBSFrequentlyVisitedSiteCandidate_initWithURLString_title_score___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("\\(\\d+\\)"), 0, 0);
  objc_msgSend(v3, "replaceMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_1E4B40D18);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSString)title
{
  return self->_title;
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
