@implementation PPHighlightedEventQuery

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPEventQuery fromDate](self, "fromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPEventQuery toDate](self, "toDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPHighlightedEventQuery f:%@ t:%@ o:%d>"), v4, v5, self->_highlightsOptions);

  return v6;
}

- (int)highlightsOptions
{
  return self->_highlightsOptions;
}

- (void)setHighlightsOptions:(int)a3
{
  self->_highlightsOptions = a3;
}

@end
