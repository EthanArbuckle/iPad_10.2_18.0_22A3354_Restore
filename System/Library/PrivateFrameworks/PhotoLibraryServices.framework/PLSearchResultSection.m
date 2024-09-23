@implementation PLSearchResultSection

- (PLSearchResultSection)initWithResultTypes:(unint64_t)a3 categoryMask:(unint64_t)a4 searchResults:(id)a5 assetSearchResultsForCompletions:(id)a6
{
  id v11;
  id v12;
  PLSearchResultSection *v13;
  PLSearchResultSection *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PLSearchResultSection;
  v13 = -[PLSearchResultSection init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_resultTypes = a3;
    v13->_categoryMask = a4;
    objc_storeStrong((id *)&v13->_searchResults, a5);
    objc_storeStrong((id *)&v14->_assetSearchResultsForCompletions, a6);
  }

  return v14;
}

- (unint64_t)resultTypes
{
  return self->_resultTypes;
}

- (unint64_t)categoryMask
{
  return self->_categoryMask;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (NSArray)assetSearchResultsForCompletions
{
  return self->_assetSearchResultsForCompletions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSearchResultsForCompletions, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end
