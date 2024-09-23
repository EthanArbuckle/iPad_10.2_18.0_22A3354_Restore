@implementation WBSURLCompletionMatch

- (NSString)titlePrefix
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[WBSURLCompletionMatch title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled"))
  {
    objc_msgSend(v2, "lowercaseString");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  if ((unint64_t)objc_msgSend(v2, "length") > 0x63)
    v4 = 100;
  else
    v4 = objc_msgSend(v2, "length");
  objc_msgSend(v2, "substringWithRange:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (int64_t)matchLocationForString:(id)a3 inURLString:(id)a4
{
  return SafariShared::computeURLMatchLocation((CFStringRef)a4, (NSString *)a3, (WBSURLCompletionUserTypedString *)a3);
}

+ (int64_t)matchLocationForString:(id)a3 inTitle:(id)a4
{
  return SafariShared::computeTitleMatchLocation((CFStringRef)a4, (NSString *)a3, (WBSURLCompletionUserTypedString *)a3);
}

- (WBSURLCompletionMatch)initWithMatchLocation:(int64_t)a3 userInput:(id)a4 forQueryID:(int64_t)a5
{
  id v8;
  WBSURLCompletionMatch *v9;
  WBSURLCompletionMatch *v10;
  uint64_t v11;
  NSString *userInput;
  WBSURLCompletionMatch *v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSURLCompletionMatch;
  v9 = -[WBSURLCompletionMatch init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_matchLocation = a3;
    v11 = objc_msgSend(v8, "copy");
    userInput = v10->_userInput;
    v10->_userInput = (NSString *)v11;

    v10->_parsecQueryID = a5;
    v13 = v10;
  }

  return v10;
}

- (BOOL)matchLocationIsInURL
{
  return (self->_matchLocation > 0xAuLL) | (0x627u >> self->_matchLocation) & 1;
}

- (NSString)description
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
  -[WBSURLCompletionMatch title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSURLCompletionMatch userVisibleURLString](self, "userVisibleURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title = \"%@\"; URL = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)matchesAutocompleteTrigger
{
  return 0;
}

- (id)originalURLString
{
  return 0;
}

- (id)title
{
  return 0;
}

- (id)userVisibleURLString
{
  return 0;
}

- (int64_t)visitCountScore
{
  return -1;
}

- (float)topSitesScore
{
  return -1.0;
}

- (BOOL)isTopHit
{
  return 0;
}

- (BOOL)shouldPreload
{
  return 0;
}

- (BOOL)containsBookmark
{
  return 0;
}

- (BOOL)onlyContainsCloudTab
{
  return 0;
}

- (NSString)cloudTabDeviceName
{
  return 0;
}

- (double)lastVisitTimeInterval
{
  return 0.0;
}

- (NSString)uuidString
{
  NSString *uuidString;
  void *v4;
  NSString *v5;
  NSString *v6;

  uuidString = self->_uuidString;
  if (!uuidString)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uuidString;
    self->_uuidString = v5;

    uuidString = self->_uuidString;
  }
  return uuidString;
}

- (NSString)parsecDomainIdentifier
{
  return (NSString *)CFSTR("other");
}

- (SFSearchResult)sfSearchResultValue
{
  SFSearchResult *sfSearchResultValue;
  SFSearchResult *v4;
  SFSearchResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  sfSearchResultValue = self->_sfSearchResultValue;
  if (!sfSearchResultValue)
  {
    objc_msgSend(MEMORY[0x1E0D8C6A8], "safari_sfSearchResultWithUniqueIdentifier");
    v4 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sfSearchResultValue;
    self->_sfSearchResultValue = v4;

    -[WBSURLCompletionMatch parsecDomainIdentifier](self, "parsecDomainIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setResultBundleId:](self->_sfSearchResultValue, "setResultBundleId:", v6);

    -[WBSURLCompletionMatch parsecDomainIdentifier](self, "parsecDomainIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSectionBundleIdentifier:](self->_sfSearchResultValue, "setSectionBundleIdentifier:", v7);

    -[SFSearchResult setType:](self->_sfSearchResultValue, "setType:", 2);
    -[SFSearchResult setUserInput:](self->_sfSearchResultValue, "setUserInput:", self->_userInput);
    v8 = (void *)MEMORY[0x1E0C99E98];
    -[WBSURLCompletionMatch originalURLString](self, "originalURLString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchResult setPunchout:](self->_sfSearchResultValue, "setPunchout:", v11);

    }
    if (-[WBSURLCompletionMatch isTopHit](self, "isTopHit"))
      -[SFSearchResult setTopHit:](self->_sfSearchResultValue, "setTopHit:", 2);
    sfSearchResultValue = self->_sfSearchResultValue;
  }
  return sfSearchResultValue;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (id)matchingStringWithUserTypedPrefix:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;

  v4 = a3;
  -[WBSURLCompletionMatch userVisibleURLString](self, "userVisibleURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length") || !objc_msgSend(v4, "length"))
  {
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  v6 = -[WBSURLCompletionMatch matchLocation](self, "matchLocation");
  if ((unint64_t)(v6 - 6) >= 3 && v6 != 3)
  {
    if (v6 == 4)
      goto LABEL_18;
    v7 = objc_msgSend(v4, "rangeOfString:", CFSTR(":")) == 0x7FFFFFFFFFFFFFFFLL
       ? objc_msgSend(v5, "rangeOfString:", CFSTR(":")) + 1
       : 0;
    v12 = objc_msgSend(v5, "rangeOfString:options:range:", v4, 1, v7, objc_msgSend(v5, "length") - v7);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL && v7)
      v12 = objc_msgSend(v5, "rangeOfString:options:", v4, 1);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_18;
    v17 = 0;
    objc_msgSend(v5, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 5, 0, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "length");
    v15 = v17;
    if (v14 + v12 > objc_msgSend(v8, "length") + v15)
    {
      v16 = v5;
LABEL_25:
      objc_msgSend(v16, "substringFromIndex:", v12);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (v12 >= v17)
    {
      v16 = v8;
      v12 -= v17;
      goto LABEL_25;
    }
    objc_msgSend(v5, "substringWithRange:", v12, v17 - v12 + objc_msgSend(v8, "length"));
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v10 = (void *)v11;
    goto LABEL_12;
  }
  -[WBSURLCompletionMatch title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfString:options:", v4, 1);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "substringFromIndex:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

LABEL_19:
  return v10;
}

- (int64_t)matchLocation
{
  return self->_matchLocation;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (NSString)alternativeDisplayTextForURL
{
  return self->_alternativeDisplayTextForURL;
}

- (void)setAlternativeDisplayTextForURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeDisplayTextForURL, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
}

@end
