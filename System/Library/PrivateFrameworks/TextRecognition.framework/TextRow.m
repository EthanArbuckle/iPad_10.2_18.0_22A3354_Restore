@implementation TextRow

- (TextRow)init
{
  TextRow *v2;
  uint64_t v3;
  NSMutableArray *mutableTokens;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TextRow;
  v2 = -[TextRow init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    mutableTokens = v2->_mutableTokens;
    v2->_mutableTokens = (NSMutableArray *)v3;

    v2->_cachedScore = 0.0;
  }
  return v2;
}

- (void)addToken:(id)a3
{
  NSMutableArray *mutableTokens;

  mutableTokens = self->_mutableTokens;
  if (mutableTokens)
    -[NSMutableArray addObject:](mutableTokens, "addObject:", a3);
}

- (NSArray)tokens
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_mutableTokens);
}

- (unint64_t)tokenCount
{
  return -[NSMutableArray count](self->_mutableTokens, "count");
}

- (NSString)string
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_mutableTokens;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "string", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v10);

        if (v7 + v9 < -[TextRow tokenCount](self, "tokenCount") - 1)
          objc_msgSend(v3, "appendString:", CFSTR(" "));
        ++v9;
      }
      while (v6 != v9);
      v7 += v6;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSString *)v3;
}

- (double)score
{
  double cachedScore;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  cachedScore = self->_cachedScore;
  if (cachedScore == 0.0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_mutableTokens;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      cachedScore = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "score", (_QWORD)v11);
          cachedScore = cachedScore + v9;
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    else
    {
      cachedScore = 0.0;
    }

    self->_cachedScore = cachedScore;
  }
  return cachedScore;
}

- (NSArray)features
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_mutableTokens;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "features", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TextRow *v4;
  void *v5;

  v4 = objc_alloc_init(TextRow);
  v5 = (void *)-[NSMutableArray mutableCopy](self->_mutableTokens, "mutableCopy");
  -[TextRow setMutableTokens:](v4, "setMutableTokens:", v5);

  return v4;
}

- (NSMutableArray)mutableTokens
{
  return self->_mutableTokens;
}

- (void)setMutableTokens:(id)a3
{
  objc_storeStrong((id *)&self->_mutableTokens, a3);
}

- (double)cachedScore
{
  return self->_cachedScore;
}

- (void)setCachedScore:(double)a3
{
  self->_cachedScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTokens, 0);
}

@end
