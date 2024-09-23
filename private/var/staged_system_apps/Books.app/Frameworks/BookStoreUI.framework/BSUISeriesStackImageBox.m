@implementation BSUISeriesStackImageBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(BSUISeriesStackImageBoxLayout, a2);
}

- (NSArray)coverFilters
{
  return self->_coverFilters;
}

- (void)setCoverFilters:(id)a3
{
  objc_storeStrong((id *)&self->_coverFilters, a3);
}

- (NSArray)coverURLStrings
{
  return self->_coverURLStrings;
}

- (void)setCoverURLStrings:(id)a3
{
  objc_storeStrong((id *)&self->_coverURLStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverURLStrings, 0);
  objc_storeStrong((id *)&self->_coverFilters, 0);
}

@end
