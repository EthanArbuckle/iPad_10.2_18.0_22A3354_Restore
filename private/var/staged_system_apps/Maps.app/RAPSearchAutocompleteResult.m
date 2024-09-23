@implementation RAPSearchAutocompleteResult

- (NSString)searchBarText
{
  return self->_searchBarText;
}

- (void)setSearchBarText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MKMapItem)selectedMapItem
{
  return self->_selectedMapItem;
}

- (void)setSelectedMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMapItem, 0);
  objc_storeStrong((id *)&self->_searchBarText, 0);
}

@end
