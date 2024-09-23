@implementation MFSearchSuggestionAtom

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(self), self, self->_suggestion);
}

- (NSString)displayName
{
  return (NSString *)-[MUISearchScopedSuggestion atomTitle](self->_suggestion, "atomTitle");
}

- (MUISearchScopedSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSString)editingString
{
  return self->_editingString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingString, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
