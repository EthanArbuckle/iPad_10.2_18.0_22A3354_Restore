@implementation RelatedSearchSuggestionSubstitute

- (RelatedSearchSuggestionSubstitute)initWithLocation:(unint64_t)a3 substitute:(id)a4
{
  id v7;
  RelatedSearchSuggestionSubstitute *v8;
  RelatedSearchSuggestionSubstitute *v9;
  NSString *substituteText;
  unsigned int v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  NSString *v16;
  NSUInteger v17;
  objc_super v19;

  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RelatedSearchSuggestionSubstitute;
  v8 = -[RelatedSearchSuggestionSubstitute init](&v19, "init");
  v9 = v8;
  if (v8)
  {
    substituteText = v8->_substituteText;
    v8->_substituteText = (NSString *)&stru_1011EB268;

    v9->_isRelatedSearchSuggestion = 0;
    v11 = objc_msgSend(v7, "substituteType");
    if (v11 == 2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relatedSearchSuggestion"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "displayString"));
      v16 = v9->_substituteText;
      v9->_substituteText = (NSString *)v15;

      v9->_isRelatedSearchSuggestion = 1;
    }
    else if (v11 == 1)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interpretedQuery"));
      v13 = v9->_substituteText;
      v9->_substituteText = (NSString *)v12;

    }
    v17 = -[NSString length](v9->_substituteText, "length");
    v9->_range.location = a3;
    v9->_range.length = v17;
    objc_storeStrong((id *)&v9->_pdSubstitute, a4);
  }

  return v9;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)substituteText
{
  return self->_substituteText;
}

- (BOOL)isRelatedSearchSuggestion
{
  return self->_isRelatedSearchSuggestion;
}

- (GEODisplayHeaderSubstitute)pdSubstitute
{
  return self->_pdSubstitute;
}

- (void)setPdSubstitute:(id)a3
{
  objc_storeStrong((id *)&self->_pdSubstitute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdSubstitute, 0);
  objc_storeStrong((id *)&self->_substituteText, 0);
}

@end
