@implementation AutocompleteMatchInfo

+ (AutocompleteMatchInfo)matchInfoWithType:(unint64_t)a3
{
  return (AutocompleteMatchInfo *)objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithType:", a3);
}

- (AutocompleteMatchInfo)initWithType:(unint64_t)a3
{
  AutocompleteMatchInfo *v4;
  AutocompleteMatchInfo *v5;
  NSHashTable *v6;
  NSHashTable *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AutocompleteMatchInfo;
  v4 = -[AutocompleteMatchInfo init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_ageInSeconds = -1;
    v4->_peopleSuggesterRank = 0.0;
    v4->_fractionOfMatch = 0.0;
    v4->_matchType = a3;
    v6 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 5);
    observers = v5->_observers;
    v5->_observers = v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AutocompleteMatchInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[AutocompleteMatchInfo initWithType:]([AutocompleteMatchInfo alloc], "initWithType:", -[AutocompleteMatchInfo matchType](self, "matchType"));
  -[AutocompleteMatchInfo peopleSuggesterRank](self, "peopleSuggesterRank");
  -[AutocompleteMatchInfo setPeopleSuggesterRank:](v4, "setPeopleSuggesterRank:");
  -[AutocompleteMatchInfo setAgeInSeconds:](v4, "setAgeInSeconds:", -[AutocompleteMatchInfo ageInSeconds](self, "ageInSeconds"));
  -[AutocompleteMatchInfo fractionOfMatch](self, "fractionOfMatch");
  -[AutocompleteMatchInfo setFractionOfMatch:](v4, "setFractionOfMatch:");
  -[AutocompleteMatchInfo setShownToUser:](v4, "setShownToUser:", -[AutocompleteMatchInfo shownToUser](self, "shownToUser"));
  if (-[AutocompleteMatchInfo hasClientRankingDebug](self, "hasClientRankingDebug"))
  {
    -[AutocompleteMatchInfo clientRankingDebug](self, "clientRankingDebug");
    -[AutocompleteMatchInfo setClientRankingDebug:](v4, "setClientRankingDebug:");
  }
  if (-[AutocompleteMatchInfo hasSortPriorityDebug](self, "hasSortPriorityDebug"))
    -[AutocompleteMatchInfo setSortPriorityDebug:](v4, "setSortPriorityDebug:", -[AutocompleteMatchInfo sortPriorityDebug](self, "sortPriorityDebug"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMatchInfo prefixLastTokenMatchCover](self, "prefixLastTokenMatchCover"));
  -[AutocompleteMatchInfo setPrefixLastTokenMatchCover:](v4, "setPrefixLastTokenMatchCover:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMatchInfo prefixMatchCover](self, "prefixMatchCover"));
  -[AutocompleteMatchInfo setPrefixMatchCover:](v4, "setPrefixMatchCover:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMatchInfo prefixMatchPosition](self, "prefixMatchPosition"));
  -[AutocompleteMatchInfo setPrefixMatchPosition:](v4, "setPrefixMatchPosition:", v7);

  -[AutocompleteMatchInfo setPrefixMatchesWordBoundary:](v4, "setPrefixMatchesWordBoundary:", -[AutocompleteMatchInfo prefixMatchesWordBoundary](self, "prefixMatchesWordBoundary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMatchInfo firstPrefixToken](self, "firstPrefixToken"));
  -[AutocompleteMatchInfo setFirstPrefixToken:](v4, "setFirstPrefixToken:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteMatchInfo secondPrefixToken](self, "secondPrefixToken"));
  -[AutocompleteMatchInfo setSecondPrefixToken:](v4, "setSecondPrefixToken:", v9);

  return v4;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setPeopleSuggesterRank:(double)a3
{
  if (self->_peopleSuggesterRank != a3)
  {
    self->_peopleSuggesterRank = a3;
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }
}

- (void)setAgeInSeconds:(int)a3
{
  if (self->_ageInSeconds != a3)
  {
    self->_ageInSeconds = a3;
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }
}

- (void)setShownToUser:(BOOL)a3
{
  if (self->_shownToUser != a3)
  {
    self->_shownToUser = a3;
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }
}

- (void)setFractionOfMatch:(double)a3
{
  if (self->_fractionOfMatch != a3)
  {
    self->_fractionOfMatch = a3;
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }
}

- (void)setClientRankingDebug:(double)a3
{
  if (!self->_hasClientRankingDebug || self->_clientRankingDebug != a3)
  {
    self->_hasClientRankingDebug = 1;
    self->_clientRankingDebug = a3;
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }
}

- (void)setSortPriorityDebug:(int64_t)a3
{
  if (!self->_hasSortPriorityDebug || self->_sortPriorityDebug != a3)
  {
    self->_hasSortPriorityDebug = 1;
    self->_sortPriorityDebug = a3;
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }
}

- (void)setPrefixLastTokenMatchCover:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_prefixLastTokenMatchCover, "isEqualToNumber:"))
  {
    objc_storeStrong((id *)&self->_prefixLastTokenMatchCover, a3);
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }

}

- (void)setPrefixMatchCover:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_prefixMatchCover, "isEqualToNumber:"))
  {
    objc_storeStrong((id *)&self->_prefixMatchCover, a3);
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }

}

- (void)setPrefixMatchPosition:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_prefixMatchPosition, "isEqualToNumber:"))
  {
    objc_storeStrong((id *)&self->_prefixMatchPosition, a3);
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }

}

- (void)setPrefixMatchesWordBoundary:(BOOL)a3
{
  if (self->_prefixMatchesWordBoundary != a3)
  {
    self->_prefixMatchesWordBoundary = a3;
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
  }
}

- (void)setFirstPrefixToken:(id)a3
{
  AutocompleteQueryToken *v5;
  AutocompleteQueryToken *v6;

  v5 = (AutocompleteQueryToken *)a3;
  if (self->_firstPrefixToken != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_firstPrefixToken, a3);
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
    v5 = v6;
  }

}

- (void)setSecondPrefixToken:(id)a3
{
  AutocompleteQueryToken *v5;
  AutocompleteQueryToken *v6;

  v5 = (AutocompleteQueryToken *)a3;
  if (self->_secondPrefixToken != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_secondPrefixToken, a3);
    -[AutocompleteMatchInfo notifyObserversOfChange](self, "notifyObserversOfChange");
    v5 = v6;
  }

}

- (void)notifyObserversOfChange
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = -[NSHashTable copy](self->_observers, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "autocompleteMatchInfoDidUpdate:", self, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (double)peopleSuggesterRank
{
  return self->_peopleSuggesterRank;
}

- (int)ageInSeconds
{
  return self->_ageInSeconds;
}

- (double)fractionOfMatch
{
  return self->_fractionOfMatch;
}

- (BOOL)shownToUser
{
  return self->_shownToUser;
}

- (NSNumber)prefixLastTokenMatchCover
{
  return self->_prefixLastTokenMatchCover;
}

- (NSNumber)prefixMatchCover
{
  return self->_prefixMatchCover;
}

- (NSNumber)prefixMatchPosition
{
  return self->_prefixMatchPosition;
}

- (BOOL)prefixMatchesWordBoundary
{
  return self->_prefixMatchesWordBoundary;
}

- (AutocompleteQueryToken)firstPrefixToken
{
  return self->_firstPrefixToken;
}

- (AutocompleteQueryToken)secondPrefixToken
{
  return self->_secondPrefixToken;
}

- (BOOL)hasClientRankingDebug
{
  return self->_hasClientRankingDebug;
}

- (double)clientRankingDebug
{
  return self->_clientRankingDebug;
}

- (BOOL)hasSortPriorityDebug
{
  return self->_hasSortPriorityDebug;
}

- (int64_t)sortPriorityDebug
{
  return self->_sortPriorityDebug;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondPrefixToken, 0);
  objc_storeStrong((id *)&self->_firstPrefixToken, 0);
  objc_storeStrong((id *)&self->_prefixMatchPosition, 0);
  objc_storeStrong((id *)&self->_prefixMatchCover, 0);
  objc_storeStrong((id *)&self->_prefixLastTokenMatchCover, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
