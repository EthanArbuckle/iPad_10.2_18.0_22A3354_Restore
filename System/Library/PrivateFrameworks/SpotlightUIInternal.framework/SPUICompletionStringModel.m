@implementation SPUICompletionStringModel

- (SPUICompletionStringModel)initWithTypedString:(id)a3 hasTokens:(BOOL)a4 queryId:(unint64_t)a5 hasMarkedText:(BOOL)a6
{
  id v11;
  SPUICompletionStringModel *v12;
  SPUICompletionStringModel *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SPUICompletionStringModel;
  v12 = -[SPUICompletionStringModel init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayedText, a3);
    v13->_searchFieldHasTokens = a4;
    v13->_queryId = a5;
    v13->_hasMarkedText = a6;
  }

  return v13;
}

- (NSString)displayedText
{
  return self->_displayedText;
}

- (BOOL)searchFieldHasTokens
{
  return self->_searchFieldHasTokens;
}

- (BOOL)hasMarkedText
{
  return self->_hasMarkedText;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedText, 0);
}

@end
