@implementation BKSearchResult

+ (id)mutableSearchResult
{
  return objc_alloc_init(BKSearchResult);
}

- (id)pageLocation
{
  BKLocation *location;
  uint64_t v4;
  BKPageLocation *v5;

  location = self->_location;
  objc_opt_class(BKPageLocation);
  if ((objc_opt_isKindOfClass(location, v4) & 1) != 0)
    v5 = self->_location;
  else
    v5 = -[BKPageLocation initWithOrdinal:andOffset:]([BKPageLocation alloc], "initWithOrdinal:andOffset:", self->_ordinal, self->_pageOffset);
  return v5;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_NSRange)searchStringRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_searchStringRange.length;
  location = self->_searchStringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSearchStringRange:(_NSRange)a3
{
  self->_searchStringRange = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(int64_t)a3
{
  self->_ordinal = a3;
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  self->_pageOffset = a3;
}

- (BKLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
