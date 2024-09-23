@implementation SearchBarSearchManagerRequest

- (NSString)searchName
{
  return self->_searchName;
}

- (void)setSearchName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)searchMode
{
  return self->_searchMode;
}

- (void)setSearchMode:(unsigned int)a3
{
  self->_searchMode = a3;
}

- (AutocompleteContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (int)originationType
{
  return self->_originationType;
}

- (void)setOriginationType:(int)a3
{
  self->_originationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_searchName, 0);
}

@end
