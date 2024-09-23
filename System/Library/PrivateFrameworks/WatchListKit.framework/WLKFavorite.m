@implementation WLKFavorite

- (WLKFavorite)initWithDictionary:(id)a3
{
  id v4;
  WLKFavorite *v5;
  void *v6;
  uint64_t v7;
  NSString *ID;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSString *leagueID;
  WLKFavorite *v15;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)WLKFavorite;
    v5 = -[WLKFavorite init](&v17, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("id"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      ID = v5->_ID;
      v5->_ID = (NSString *)v7;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v10;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("leagueId"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      leagueID = v5->_leagueID;
      v5->_leagueID = (NSString *)v13;

    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (WLKFavorite)init
{
  return -[WLKFavorite initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p name:%@ ID:%@ leagueID:%@>"), v5, self, self->_name, self->_ID, self->_leagueID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WLKFavorite)initWithID:(id)a3 name:(id)a4 leagueID:(id)a5
{
  id v8;
  id v9;
  id v10;
  WLKFavorite *v11;
  uint64_t v12;
  NSString *ID;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *leagueID;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WLKFavorite;
  v11 = -[WLKFavorite init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    ID = v11->_ID;
    v11->_ID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    leagueID = v11->_leagueID;
    v11->_leagueID = (NSString *)v16;

  }
  return v11;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)leagueID
{
  return self->_leagueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leagueID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
