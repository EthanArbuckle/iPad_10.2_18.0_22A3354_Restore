@implementation MPModelLibraryRequest

- (id)requestForDetailFor:(id)a3 kind:(id)a4 requestedProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPModelLibraryRequest *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_4F2894(v8, (uint64_t)v9, (uint64_t)v10);

  return v12;
}

- (void)updateAlbumLibraryDataIfNeededWithModelAlbum:(id)a3 containerDetailViewModel:(id)a4
{
  id v6;
  id v7;
  MPModelLibraryRequest *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_4F2A8C((uint64_t)v6, (uint64_t)v7);

}

- (id)playbackIntentFor:(id)a3 itemKind:(id)a4 itemProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPModelLibraryRequest *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_4F3374(v8, (uint64_t)v9, (uint64_t)v10);

  return v12;
}

@end
