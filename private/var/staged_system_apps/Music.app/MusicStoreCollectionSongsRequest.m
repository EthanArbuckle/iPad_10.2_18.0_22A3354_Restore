@implementation MusicStoreCollectionSongsRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MusicStoreCollectionSongsRequest)initWithCoder:(id)a3
{
  id v4;
  MusicStoreCollectionSongsRequest *v5;
  id v6;
  uint64_t v7;
  MPIdentifierSet *collectionIdentifiers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MusicStoreCollectionSongsRequest;
  v5 = -[MusicStoreCollectionSongsRequest initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MPIdentifierSet), CFSTR("MusicStoreCollectionSongsRequestCollectionIdentifiers"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    collectionIdentifiers = v5->_collectionIdentifiers;
    v5->_collectionIdentifiers = (MPIdentifierSet *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicStoreCollectionSongsRequest;
  v4 = a3;
  -[MusicStoreCollectionSongsRequest encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionIdentifiers, CFSTR("MusicStoreCollectionSongsRequestCollectionIdentifiers"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MusicStoreCollectionSongsRequest;
  v4 = -[MusicStoreCollectionSongsRequest copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 1, self->_collectionIdentifiers);
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MusicStoreCollectionSongsRequestOperation *v5;
  id v6;
  MusicStoreCollectionSongsRequestOperation *v7;

  v4 = a3;
  v5 = [MusicStoreCollectionSongsRequestOperation alloc];
  v6 = -[MusicStoreCollectionSongsRequest copy](self, "copy");
  v7 = -[MusicStoreCollectionSongsRequestOperation initWithRequest:responseHandler:](v5, "initWithRequest:responseHandler:", v6, v4);

  return v7;
}

+ (MPPropertySet)allSupportedSectionProperties
{
  return (MPPropertySet *)+[MPModelStoreBrowseContentItemBuilder allSupportedProperties](MPModelStoreBrowseContentItemBuilder, "allSupportedProperties");
}

+ (MPPropertySet)allSupportedItemProperties
{
  return (MPPropertySet *)+[MPStoreModelSongBuilder allSupportedProperties](MPStoreModelSongBuilder, "allSupportedProperties");
}

- (MPIdentifierSet)collectionIdentifiers
{
  return self->_collectionIdentifiers;
}

- (void)setCollectionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIdentifiers, 0);
}

@end
