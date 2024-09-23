@implementation VIACacheHitContextBuilder

- (id)setQueryID:(unint64_t)a3
{
  *((_QWORD *)self + 1) = a3;
  return self;
}

- (id)setCachedResultQueryID:(unint64_t)a3
{
  *((_QWORD *)self + 2) = a3;
  return self;
}

- (id)setApplicationIdentifer:(id)a3
{
  NSString *v4;
  NSString *applicationIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  applicationIdentifier = self->_applicationIdentifier;
  self->_applicationIdentifier = v4;

  return self;
}

- (id)setEngagementSuggestionType:(id)a3
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, a3);
  return self;
}

- (id)build
{
  return -[VIACacheHitContext initWithQueryID:cachedResultQueryID:applicationIdentifier:engagementSuggestionType:]([VIACacheHitContext alloc], "initWithQueryID:cachedResultQueryID:applicationIdentifier:engagementSuggestionType:", self->_queryID, self->_cachedResultsQueryID, self->_applicationIdentifier, self->_engagementSuggestionType);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
