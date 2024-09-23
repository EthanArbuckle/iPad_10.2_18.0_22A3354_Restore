@implementation WLKBasicSportingEventMetadata

- (WLKBasicSportingEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  WLKBasicSportingEventMetadata *v5;
  void *v6;
  uint64_t v7;
  NSDate *startGameTime;
  void *v9;
  uint64_t v10;
  NSString *leagueName;
  void *v12;
  uint64_t v13;
  NSString *leagueShortName;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WLKBasicSportingEventMetadata;
  v5 = -[WLKBasicContentMetadata initWithDictionary:](&v16, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("startGameTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    startGameTime = v5->_startGameTime;
    v5->_startGameTime = (NSDate *)v7;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("leagueName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    leagueName = v5->_leagueName;
    v5->_leagueName = (NSString *)v10;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("leagueShortName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    leagueShortName = v5->_leagueShortName;
    v5->_leagueShortName = (NSString *)v13;

  }
  return v5;
}

- (NSDate)startGameTime
{
  return self->_startGameTime;
}

- (NSString)leagueName
{
  return self->_leagueName;
}

- (NSString)leagueShortName
{
  return self->_leagueShortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leagueShortName, 0);
  objc_storeStrong((id *)&self->_leagueName, 0);
  objc_storeStrong((id *)&self->_startGameTime, 0);
}

@end
