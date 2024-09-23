@implementation _UISearchSuggestionController

- (NSArray)suggestionGroups
{
  return self->_suggestionGroups;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_UISearchSuggestionControllerDelegate)delegate
{
  return (_UISearchSuggestionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSuggestionGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
