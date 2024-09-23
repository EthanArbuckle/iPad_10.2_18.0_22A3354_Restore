@implementation MCDArtistsDataSource

- (id)requestItemKind
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](MPModelAlbum, "kindWithSongKind:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelArtist kindWithAlbumKind:](MPModelArtist, "kindWithAlbumKind:", v3));

  return v4;
}

- (id)requestLabel
{
  return CFSTR("Artists CarPlay View Controller");
}

- (id)requestItemProperties
{
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[0] = MPModelPropertyArtistName;
  v5[1] = MPModelPropertyArtistIsFavorite;
  v5[2] = MPModelPropertyArtistIsDisliked;
  v5[3] = MPModelPropertyArtistArtwork;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 4));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));

  return v3;
}

- (id)itemSortDescriptors
{
  void *v2;
  void *v3;
  void *v5;

  if (!-[_MCDLibraryDataSource limitedUI](self, "limitedUI"))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertyArtistLibraryAddedDate, 0));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x1000000;
}

@end
