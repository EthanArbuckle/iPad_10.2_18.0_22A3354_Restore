@implementation WBSURLCompletionMatchSnapshot

- (WBSURLCompletionMatchSnapshot)init
{

  return 0;
}

- (WBSURLCompletionMatchSnapshot)initWithURL:(id)a3 title:(id)a4 matchLocation:(int64_t)a5 isTopHit:(BOOL)a6 isSynthesizedTopHit:(BOOL)a7 isTopHitDueToTriggerMatch:(BOOL)a8 visitCount:(int64_t)a9 lastVisitTime:(id)a10
{
  id v16;
  id v17;
  id v18;
  WBSURLCompletionMatchSnapshot *v19;
  uint64_t v20;
  NSURL *url;
  uint64_t v22;
  NSString *title;
  uint64_t v24;
  NSString *userVisibleURLString;
  WBSURLCompletionMatchSnapshot *v26;
  objc_super v28;

  v16 = a3;
  v17 = a4;
  v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)WBSURLCompletionMatchSnapshot;
  v19 = -[WBSURLCompletionMatchSnapshot init](&v28, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v16, "copy");
    url = v19->_url;
    v19->_url = (NSURL *)v20;

    v22 = objc_msgSend(v17, "copy");
    title = v19->_title;
    v19->_title = (NSString *)v22;

    -[NSURL safari_userVisibleString](v19->_url, "safari_userVisibleString");
    v24 = objc_claimAutoreleasedReturnValue();
    userVisibleURLString = v19->_userVisibleURLString;
    v19->_userVisibleURLString = (NSString *)v24;

    v19->_topHit = a6;
    v19->_synthesizedTopHit = a7;
    v19->_topHitDueToTriggerMatch = a8;
    v19->_matchLocation = a5;
    v19->_visitCount = a9;
    objc_storeStrong((id *)&v19->_lastVisitTime, a10);
    v26 = v19;
  }

  return v19;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; url = \"%@\"; title = \"%@\"; matchLocation = %d; topHit = %d; synthesizedTopHit = %d; topHitDueToTriggerMatch = %d; visitCount = %ld; lastVisitTime = %@>"),
    v5,
    self,
    self->_url,
    self->_title,
    self->_matchLocation,
    self->_topHit,
    self->_synthesizedTopHit,
    self->_topHitDueToTriggerMatch,
    self->_visitCount,
    self->_lastVisitTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSURLCompletionMatchSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  WBSURLCompletionMatchSnapshot *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("matchLocation"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("topHit"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("synthesizedTopHit"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("topHitDueToTriggerMatch"));
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("visitCount"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastVisitTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[WBSURLCompletionMatchSnapshot initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:](self, "initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_matchLocation, CFSTR("matchLocation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_topHit, CFSTR("topHit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_synthesizedTopHit, CFSTR("synthesizedTopHit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_topHitDueToTriggerMatch, CFSTR("topHitDueToTriggerMatch"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_visitCount, CFSTR("visitCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastVisitTime, CFSTR("lastVisitTime"));

}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)userVisibleURLString
{
  return self->_userVisibleURLString;
}

- (int64_t)matchLocation
{
  return self->_matchLocation;
}

- (BOOL)isTopHit
{
  return self->_topHit;
}

- (BOOL)isSynthesizedTopHit
{
  return self->_synthesizedTopHit;
}

- (BOOL)isTopHitDueToTriggerMatch
{
  return self->_topHitDueToTriggerMatch;
}

- (int64_t)visitCount
{
  return self->_visitCount;
}

- (NSDate)lastVisitTime
{
  return self->_lastVisitTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVisitTime, 0);
  objc_storeStrong((id *)&self->_userVisibleURLString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
