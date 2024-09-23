@implementation _UISearchSuggestionItemGroup

- (_UISearchSuggestionItemGroup)initWithHeaderTitle:(id)a3 suggestionItems:(id)a4
{
  id v6;
  id v7;
  _UISearchSuggestionItemGroup *v8;
  uint64_t v9;
  NSString *headerTitle;
  uint64_t v11;
  NSArray *suggestionItems;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISearchSuggestionItemGroup;
  v8 = -[_UISearchSuggestionItemGroup init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    headerTitle = v8->_headerTitle;
    v8->_headerTitle = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    suggestionItems = v8->_suggestionItems;
    v8->_suggestionItems = (NSArray *)v11;

  }
  return v8;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSArray)suggestionItems
{
  return self->_suggestionItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionItems, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
