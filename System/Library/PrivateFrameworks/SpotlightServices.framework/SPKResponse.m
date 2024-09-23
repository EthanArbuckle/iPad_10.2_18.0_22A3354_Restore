@implementation SPKResponse

- (SPKResponse)initWithQueryID:(unint64_t)a3 kind:(int)a4 sections:(id)a5 groupedResults:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  SPKResponse *v15;
  SPKResponse *v16;
  uint64_t v17;
  NSDictionary *groupedResults;
  uint64_t v19;
  PRSRankingConfiguration *rankingConfiguration;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *sections;
  uint64_t v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v38.receiver = self;
  v38.super_class = (Class)SPKResponse;
  v15 = -[SPKResponse init](&v38, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_queryId = a3;
    v17 = objc_msgSend(v13, "copy");
    groupedResults = v16->_groupedResults;
    v16->_groupedResults = (NSDictionary *)v17;

    v16->_kind = a4;
    objc_storeStrong((id *)&v16->_error, a7);
    v19 = objc_opt_new();
    rankingConfiguration = v16->_rankingConfiguration;
    v16->_rankingConfiguration = (PRSRankingConfiguration *)v19;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = v12;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v22)
    {
      v23 = v22;
      v33 = v14;
      v24 = 0;
      v25 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (!v24)
            v24 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
          objc_msgSend(v27, "mutableDeepCopy");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v24, "addObject:", v28);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v23);

      v14 = v33;
      if (v24)
      {
        v29 = -[NSArray copy](v24, "copy");
        sections = v16->_sections;
        v16->_sections = (NSArray *)v29;

LABEL_15:
        goto LABEL_16;
      }
    }
    else
    {

    }
    v31 = objc_msgSend(v21, "copy");
    v24 = v16->_sections;
    v16->_sections = (NSArray *)v31;
    goto LABEL_15;
  }
LABEL_16:

  return v16;
}

- (SPKResponse)initWithQueryID:(unint64_t)a3 kind:(int)a4 sections:(id)a5 groupedResults:(id)a6
{
  return -[SPKResponse initWithQueryID:kind:sections:groupedResults:error:](self, "initWithQueryID:kind:sections:groupedResults:error:", a3, *(_QWORD *)&a4, a5, a6, 0);
}

- (SPKResponse)initWithQueryID:(unint64_t)a3 kind:(int)a4 sections:(id)a5
{
  return -[SPKResponse initWithQueryID:kind:sections:groupedResults:error:](self, "initWithQueryID:kind:sections:groupedResults:error:", a3, *(_QWORD *)&a4, a5, 0, 0);
}

- (SPKResponse)initWithQueryID:(unint64_t)a3 sections:(id)a4
{
  return -[SPKResponse initWithQueryID:kind:sections:groupedResults:error:](self, "initWithQueryID:kind:sections:groupedResults:error:", a3, 4, a4, 0, 0);
}

- (SPKResponse)initWithQueryID:(unint64_t)a3 error:(id)a4
{
  return -[SPKResponse initWithQueryID:kind:sections:groupedResults:error:](self, "initWithQueryID:kind:sections:groupedResults:error:", a3, 0, 0, 0, a4);
}

- (id)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  const __CFString *v17;

  if (!-[SPKResponse kind](self, "kind")
    || (-[SPKResponse error](self, "error"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = -[SPKResponse kind](self, "kind");
    if (v5 > 5)
      v6 = CFSTR("unknown");
    else
      v6 = off_1E6E42EB8[v5];
    -[SPKResponse userQueryString](self, "userQueryString");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = CFSTR("nil");
    -[SPKResponse error](self, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<response:%@ userQueryString:%@ error:%@>"), v6, v9, v10);
LABEL_10:
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  -[SPKResponse userQueryString](self, "userQueryString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = -[SPKResponse kind](self, "kind");
  if (v13)
  {
    if (v15 > 5)
      v16 = CFSTR("unknown");
    else
      v16 = off_1E6E42EB8[v15];
    -[SPKResponse userQueryString](self, "userQueryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPKResponse sections](self, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("<response:%@ userQueryString:%@ sections:%@>"), v16, v8, v10);
    goto LABEL_10;
  }
  if (v15 > 5)
    v17 = CFSTR("unknown");
  else
    v17 = off_1E6E42EB8[v15];
  -[SPKResponse sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<response:%@ sections:%@>"), v17, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v11;
}

- (PRSRankingConfiguration)rankingConfiguration
{
  return (PRSRankingConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRankingConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int)kind
{
  return self->_kind;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)sections
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)groupedResults
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)topHitIsIn
{
  return self->_topHitIsIn;
}

- (void)setTopHitIsIn:(BOOL)a3
{
  self->_topHitIsIn = a3;
}

- (BOOL)noChangeInResultsSinceLastResponse
{
  return self->_noChangeInResultsSinceLastResponse;
}

- (void)setNoChangeInResultsSinceLastResponse:(BOOL)a3
{
  self->_noChangeInResultsSinceLastResponse = a3;
}

- (BOOL)parsecFinished
{
  return self->_parsecFinished;
}

- (void)setParsecFinished:(BOOL)a3
{
  self->_parsecFinished = a3;
}

- (BOOL)metadataFinished
{
  return self->_metadataFinished;
}

- (void)setMetadataFinished:(BOOL)a3
{
  self->_metadataFinished = a3;
}

- (BOOL)corespotlightFinished
{
  return self->_corespotlightFinished;
}

- (void)setCorespotlightFinished:(BOOL)a3
{
  self->_corespotlightFinished = a3;
}

- (NSString)fbq
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFbq:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)queryResponseComplete
{
  return self->_queryResponseComplete;
}

- (void)setQueryResponseComplete:(BOOL)a3
{
  self->_queryResponseComplete = a3;
}

- (NSString)userQueryString
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUserQueryString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)isRewrite
{
  return self->_isRewrite;
}

- (void)setIsRewrite:(BOOL)a3
{
  self->_isRewrite = a3;
}

- (BOOL)didReceiveLaterThanRenderTimeout
{
  return self->_didReceiveLaterThanRenderTimeout;
}

- (void)setDidReceiveLaterThanRenderTimeout:(BOOL)a3
{
  self->_didReceiveLaterThanRenderTimeout = a3;
}

- (NSString)correctedQuery
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCorrectedQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)suggestionsAreBlended
{
  return self->_suggestionsAreBlended;
}

- (void)setSuggestionsAreBlended:(BOOL)a3
{
  self->_suggestionsAreBlended = a3;
}

- (NSArray)serverSuggestionResults
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setServerSuggestionResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)localSuggestionResults
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLocalSuggestionResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)added
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)changed
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (NSArray)removed
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_changed, 0);
  objc_storeStrong((id *)&self->_added, 0);
  objc_storeStrong((id *)&self->_localSuggestionResults, 0);
  objc_storeStrong((id *)&self->_serverSuggestionResults, 0);
  objc_storeStrong((id *)&self->_correctedQuery, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_groupedResults, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_rankingConfiguration, 0);
}

@end
