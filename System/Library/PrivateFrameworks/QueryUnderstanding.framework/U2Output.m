@implementation U2Output

- (NSArray)argIds
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[U2Output argIdsForTokens](self, "argIdsForTokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v9;
}

- (NSArray)argScores
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[U2Output argScoresForTokens](self, "argScoresForTokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v9;
}

- (NSNumber)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceScore, a3);
}

- (NSNumber)intentId
{
  return self->_intentId;
}

- (void)setIntentId:(id)a3
{
  objc_storeStrong((id *)&self->_intentId, a3);
}

- (NSNumber)safetyScore
{
  return self->_safetyScore;
}

- (void)setSafetyScore:(id)a3
{
  objc_storeStrong((id *)&self->_safetyScore, a3);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_storeStrong((id *)&self->_tokens, a3);
}

- (NSArray)tokenRanges
{
  return self->_tokenRanges;
}

- (void)setTokenRanges:(id)a3
{
  objc_storeStrong((id *)&self->_tokenRanges, a3);
}

- (NSArray)argIdsForTokens
{
  return self->_argIdsForTokens;
}

- (void)setArgIdsForTokens:(id)a3
{
  objc_storeStrong((id *)&self->_argIdsForTokens, a3);
}

- (NSArray)argScoresForTokens
{
  return self->_argScoresForTokens;
}

- (void)setArgScoresForTokens:(id)a3
{
  objc_storeStrong((id *)&self->_argScoresForTokens, a3);
}

- (unint64_t)predictionTime
{
  return self->_predictionTime;
}

- (void)setPredictionTime:(unint64_t)a3
{
  self->_predictionTime = a3;
}

- (unint64_t)embeddingsTime
{
  return self->_embeddingsTime;
}

- (void)setEmbeddingsTime:(unint64_t)a3
{
  self->_embeddingsTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argScoresForTokens, 0);
  objc_storeStrong((id *)&self->_argIdsForTokens, 0);
  objc_storeStrong((id *)&self->_tokenRanges, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_safetyScore, 0);
  objc_storeStrong((id *)&self->_intentId, 0);
  objc_storeStrong((id *)&self->_confidenceScore, 0);
}

@end
