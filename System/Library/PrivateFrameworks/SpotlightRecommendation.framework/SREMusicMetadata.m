@implementation SREMusicMetadata

- (SREMusicMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SREMusicMetadata;
  return -[SREMusicMetadata init](&v3, sel_init);
}

- (int64_t)adamID
{
  return self->adamID;
}

- (void)setAdamID:(int64_t)a3
{
  self->adamID = a3;
}

- (int64_t)artistAdamID
{
  return self->artistAdamID;
}

- (void)setArtistAdamID:(int64_t)a3
{
  self->artistAdamID = a3;
}

- (int64_t)albumAdamID
{
  return self->albumAdamID;
}

- (void)setAlbumAdamID:(int64_t)a3
{
  self->albumAdamID = a3;
}

- (NSString)genreID
{
  return self->genreID;
}

- (void)setGenreID:(id)a3
{
  objc_storeStrong((id *)&self->genreID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->genreID, 0);
}

@end
