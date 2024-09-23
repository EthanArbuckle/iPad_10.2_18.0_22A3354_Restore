@implementation STSCategoryResult

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)clearButtonHidden
{
  return self->_clearButtonHidden;
}

- (void)setClearButtonHidden:(BOOL)a3
{
  self->_clearButtonHidden = a3;
}

- (SFSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (SFSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
