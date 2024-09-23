@implementation MCDGenresDataSource

- (id)requestItemKind
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](MPModelAlbum, "kindWithSongKind:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelGenre kindWithAlbumKind:](MPModelGenre, "kindWithAlbumKind:", v3));

  return v4;
}

- (id)requestItemProperties
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = MPModelPropertyGenreName;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));

  return v3;
}

- (id)requestSectionProperties
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = MPModelPropertySectionTitle;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));

  return v3;
}

- (id)itemSortDescriptors
{
  void *v2;
  void **v3;
  void *v4;
  void *v6;
  void *v7;

  if (-[_MCDLibraryDataSource limitedUI](self, "limitedUI"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyGenreLibraryAddedDate, 0));
    v7 = v2;
    v3 = &v7;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyGenreName, 1));
    v6 = v2;
    v3 = &v6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 1));

  return v4;
}

- (id)requestLabel
{
  return CFSTR("Genres CarPlay View Controller");
}

@end
