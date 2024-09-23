@implementation CREngineAccurateResult

- (NSArray)lines
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CREngineAccurateResult cachedLines](self, "cachedLines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CREngineAccurateResult blocks](self, "blocks", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "subregions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    -[CREngineAccurateResult setCachedLines:](self, "setCachedLines:", v4);
  }
  -[CREngineAccurateResult cachedLines](self, "cachedLines");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)blocks
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CRRecognizedTextRegion)titleRegion
{
  return (CRRecognizedTextRegion *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitleRegion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)filteredFeatureCount
{
  return self->_filteredFeatureCount;
}

- (void)setFilteredFeatureCount:(int64_t)a3
{
  self->_filteredFeatureCount = a3;
}

- (NSArray)cachedLines
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedLines:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLines, 0);
  objc_storeStrong((id *)&self->_titleRegion, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
