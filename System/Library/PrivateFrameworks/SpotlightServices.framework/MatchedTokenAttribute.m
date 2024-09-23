@implementation MatchedTokenAttribute

- (id)initMatchedToken:(id)a3 query:(id)a4 matchedType:(id)a5
{
  id v8;
  id v9;
  id v10;
  MatchedTokenAttribute *v11;
  MatchedTokenAttribute *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MatchedTokenAttribute;
  v11 = -[MatchedTokenAttribute init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MatchedTokenAttribute setToken:](v11, "setToken:", v8);
    objc_msgSend(v8, "tokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MatchedTokenAttribute setTokenNum:](v12, "setTokenNum:", objc_msgSend(v13, "count"));

    objc_msgSend(v8, "original");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MatchedTokenAttribute setTokenLength:](v12, "setTokenLength:", objc_msgSend(v14, "length"));

    objc_msgSend(v9, "tokenMatchForMatchInfoToken:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indexes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MatchedTokenAttribute setQueryPositions:](v12, "setQueryPositions:", v16);

    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MatchedTokenAttribute setMatchedTypes:](v12, "setMatchedTypes:", v17);

  }
  return v12;
}

- (SSTokenizedString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (unint64_t)tokenNum
{
  return self->_tokenNum;
}

- (void)setTokenNum:(unint64_t)a3
{
  self->_tokenNum = a3;
}

- (unint64_t)tokenLength
{
  return self->_tokenLength;
}

- (void)setTokenLength:(unint64_t)a3
{
  self->_tokenLength = a3;
}

- (NSArray)queryPositions
{
  return self->_queryPositions;
}

- (void)setQueryPositions:(id)a3
{
  objc_storeStrong((id *)&self->_queryPositions, a3);
}

- (NSArray)matchedTypes
{
  return self->_matchedTypes;
}

- (void)setMatchedTypes:(id)a3
{
  objc_storeStrong((id *)&self->_matchedTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedTypes, 0);
  objc_storeStrong((id *)&self->_queryPositions, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
