@implementation VUIFamilySharingGenre

- (NSArray)genreIdentifiers
{
  return self->_genreIdentifiers;
}

- (void)setGenreIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_genreIdentifiers, a3);
}

- (NSString)genreTitle
{
  return self->_genreTitle;
}

- (void)setGenreTitle:(id)a3
{
  objc_storeStrong((id *)&self->_genreTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreTitle, 0);
  objc_storeStrong((id *)&self->_genreIdentifiers, 0);
}

@end
