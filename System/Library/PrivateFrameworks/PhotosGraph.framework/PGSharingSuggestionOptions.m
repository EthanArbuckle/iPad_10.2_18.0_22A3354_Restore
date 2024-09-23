@implementation PGSharingSuggestionOptions

- (PGSharingSuggestionOptions)init
{
  PGSharingSuggestionOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGSharingSuggestionOptions;
  result = -[PGSharingSuggestionOptions init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_sharingStream = xmmword_1CA8EDA20;
    *(_DWORD *)&result->_replaceMergeCandidates = 65537;
    result->_useContactSuggestion = 0;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PGSharingSuggestionOptions;
  -[PGSharingSuggestionOptions description](&v10, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = self->_sharingStream - 1;
  if (v6 > 2)
    v7 = &stru_1E8436F28;
  else
    v7 = off_1E842EAF8[v6];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - sharingStream:%@ replaceMergeCandidates:%d debugMode:%d fetchLimit:%lu includeUnverified:%d filterLowWeightResults:%d useContactSuggestion:%d"), v4, v7, self->_replaceMergeCandidates, self->_debugMode, self->_fetchLimit, self->_includeUnverified, self->_filterLowWeightResults, self->_useContactSuggestion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)sharingStream
{
  return self->_sharingStream;
}

- (void)setSharingStream:(unint64_t)a3
{
  self->_sharingStream = a3;
}

- (BOOL)replaceMergeCandidates
{
  return self->_replaceMergeCandidates;
}

- (void)setReplaceMergeCandidates:(BOOL)a3
{
  self->_replaceMergeCandidates = a3;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (BOOL)includeUnverified
{
  return self->_includeUnverified;
}

- (void)setIncludeUnverified:(BOOL)a3
{
  self->_includeUnverified = a3;
}

- (BOOL)filterLowWeightResults
{
  return self->_filterLowWeightResults;
}

- (void)setFilterLowWeightResults:(BOOL)a3
{
  self->_filterLowWeightResults = a3;
}

- (BOOL)useContactSuggestion
{
  return self->_useContactSuggestion;
}

- (void)setUseContactSuggestion:(BOOL)a3
{
  self->_useContactSuggestion = a3;
}

+ (id)optionsForClient:(unint64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (a3 == 3)
  {
    objc_msgSend(v5, "setSharingStream:", 1);
    objc_msgSend(v6, "setUseContactSuggestion:", 0);
    objc_msgSend(v6, "setIncludeUnverified:", 1);
    objc_msgSend(v6, "setFetchLimit:", 30);
  }
  else if (a3 == 2)
  {
    objc_msgSend(v5, "setSharingStream:", objc_msgSend(a1, "_shareSheetSharingStream"));
    objc_msgSend(v6, "setUseContactSuggestion:", 1);
    objc_msgSend(v6, "setIncludeUnverified:", 0);
    objc_msgSend(v6, "setFetchLimit:", 10);
    objc_msgSend(v6, "setFilterLowWeightResults:", 1);
  }
  return v6;
}

+ (unint64_t)_shareSheetSharingStream
{
  return 3;
}

@end
