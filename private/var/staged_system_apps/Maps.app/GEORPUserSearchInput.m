@implementation GEORPUserSearchInput

- (id)initWithRAPUserSearchInput:(id)a3
{
  id v4;
  GEORPUserSearchInput *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEORPUserSearchInput;
  v5 = -[GEORPUserSearchInput init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchString"));
    -[GEORPUserSearchInput setSearchString:](v5, "setSearchString:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "singleLineAddressString"));
    -[GEORPUserSearchInput setSingleLineAddressString:](v5, "setSingleLineAddressString:", v7);

    -[GEORPUserSearchInput setOrigin:](v5, "setOrigin:", objc_msgSend(v4, "origin"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "coordinate"));
    -[GEORPUserSearchInput setCoordinate:](v5, "setCoordinate:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeMapItemStorage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeData"));
    -[GEORPUserSearchInput setPlace:](v5, "setPlace:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionStorage"));
    objc_msgSend(v11, "applyToUserSearchInput:", v5);

  }
  return v5;
}

@end
