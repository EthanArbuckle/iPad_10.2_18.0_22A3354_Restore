@implementation PRSQueryRankingConfiguration

+ (void)updateMailVIP:(id)a3 phoneFavorites:(id)a4 meEmailAddresses:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  updateVIPRankingQuery(v7);
  updatePhoneFavoritesQuery(v8);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "objectForKeyedSubscript:", CFSTR("emailAddresses"), (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  updateVIPList(v11, v10);
  updateMeEmailAddresses(v9);

}

- (NSOrderedSet)requiredAttributes
{
  return self->_requiredAttributes;
}

- (void)setRequiredAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_requiredAttributes, a3);
}

- (NSArray)rankingQueries
{
  return self->_rankingQueries;
}

- (void)setRankingQueries:(id)a3
{
  objc_storeStrong((id *)&self->_rankingQueries, a3);
}

- (unint64_t)strongRankingQueryCount
{
  return self->_strongRankingQueryCount;
}

- (void)setStrongRankingQueryCount:(unint64_t)a3
{
  self->_strongRankingQueryCount = a3;
}

- (unint64_t)dominantRankingQueryCount
{
  return self->_dominantRankingQueryCount;
}

- (void)setDominantRankingQueryCount:(unint64_t)a3
{
  self->_dominantRankingQueryCount = a3;
}

- (unint64_t)dominatedRankingQueryCount
{
  return self->_dominatedRankingQueryCount;
}

- (void)setDominatedRankingQueryCount:(unint64_t)a3
{
  self->_dominatedRankingQueryCount = a3;
}

- (unint64_t)shortcutBit
{
  return self->_shortcutBit;
}

- (void)setShortcutBit:(unint64_t)a3
{
  self->_shortcutBit = a3;
}

- (unint64_t)highMatchBit
{
  return self->_highMatchBit;
}

- (void)setHighMatchBit:(unint64_t)a3
{
  self->_highMatchBit = a3;
}

- (unint64_t)lowMatchBit
{
  return self->_lowMatchBit;
}

- (void)setLowMatchBit:(unint64_t)a3
{
  self->_lowMatchBit = a3;
}

- (unint64_t)highRecencyBit
{
  return self->_highRecencyBit;
}

- (void)setHighRecencyBit:(unint64_t)a3
{
  self->_highRecencyBit = a3;
}

- (unint64_t)lowRecencyBit
{
  return self->_lowRecencyBit;
}

- (void)setLowRecencyBit:(unint64_t)a3
{
  self->_lowRecencyBit = a3;
}

- (unint64_t)rankingBitCount
{
  return self->_rankingBitCount;
}

- (void)setRankingBitCount:(unint64_t)a3
{
  self->_rankingBitCount = a3;
}

- (BOOL)allowAnonymousDataCollection
{
  return self->_allowAnonymousDataCollection;
}

- (void)setAllowAnonymousDataCollection:(BOOL)a3
{
  self->_allowAnonymousDataCollection = a3;
}

- (uint64_t)fuzzyMatchMask
{
  return *(_QWORD *)(a1 + 128);
}

- (void)setFuzzyMatchMask:(PRSQueryRankingConfiguration *)self
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)self->_fuzzyMatchMask = v2;
  *(_QWORD *)&self->_fuzzyMatchMask[8] = v3;
}

- (uint64_t)fuzzyMatchCheck
{
  return *(_QWORD *)(a1 + 144);
}

- (void)setFuzzyMatchCheck:(PRSQueryRankingConfiguration *)self
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)self->_fuzzyMatchCheck = v2;
  *(_QWORD *)&self->_fuzzyMatchCheck[8] = v3;
}

- (double)minL2Score
{
  return self->_minL2Score;
}

- (void)setMinL2Score:(double)a3
{
  self->_minL2Score = a3;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (double)minCount
{
  return self->_minCount;
}

- (void)setMinCount:(double)a3
{
  self->_minCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_requiredAttributes, 0);
}

@end
