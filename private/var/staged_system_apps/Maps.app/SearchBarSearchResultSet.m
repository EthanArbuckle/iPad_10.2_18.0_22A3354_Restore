@implementation SearchBarSearchResultSet

- (SearchBarSearchResultSet)initWithResults:(id)a3 maxCount:(unint64_t)a4
{
  id v6;
  SearchBarSearchResultSet *v7;
  NSArray *v8;
  NSArray *results;

  v6 = a3;
  v7 = -[SearchBarSearchResultSet init](self, "init");
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    results = v7->_results;
    v7->_results = v8;

    v7->_count = a4;
  }

  return v7;
}

- (NSArray)results
{
  return self->_results;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
