@implementation SREMusicCandidate

- (SREMusicCandidate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SREMusicCandidate;
  return -[SREMusicCandidate init](&v3, sel_init);
}

- (id)genresDebugString
{
  void *v2;
  void *v3;

  -[SREMusicCandidate genreIDs](self, "genreIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("trackId=%ld"), -[SREMusicCandidate trackId](self, "trackId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[SREMusicCandidate trackName](self, "trackName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[SREMusicCandidate trackName](self, "trackName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("trackName=%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[SREMusicCandidate artistName](self, "artistName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[SREMusicCandidate artistName](self, "artistName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("artistName=%@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  if (-[SREMusicCandidate collectionId](self, "collectionId"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("collectionId=%ld"), -[SREMusicCandidate collectionId](self, "collectionId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  -[SREMusicCandidate collectionName](self, "collectionName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    -[SREMusicCandidate collectionName](self, "collectionName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("collectionName=%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  -[SREMusicCandidate genreIDs](self, "genreIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    -[SREMusicCandidate genresDebugString](self, "genresDebugString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("genreID=%@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

  }
  -[SREMusicCandidate artworkURL](self, "artworkURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    -[SREMusicCandidate artworkURL](self, "artworkURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("artworkURL=%@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

  }
  if (-[SREMusicCandidate trackTimeMillis](self, "trackTimeMillis"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("trackTimeMillis=%ld"), -[SREMusicCandidate trackTimeMillis](self, "trackTimeMillis"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v27);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("trackExplicitness=%d"), -[SREMusicCandidate trackExplicitness](self, "trackExplicitness"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("  "));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (int64_t)trackId
{
  return self->_trackId;
}

- (void)setTrackId:(int64_t)a3
{
  self->_trackId = a3;
}

- (NSString)trackName
{
  return self->_trackName;
}

- (void)setTrackName:(id)a3
{
  objc_storeStrong((id *)&self->_trackName, a3);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_storeStrong((id *)&self->_artistName, a3);
}

- (int64_t)collectionId
{
  return self->_collectionId;
}

- (void)setCollectionId:(int64_t)a3
{
  self->_collectionId = a3;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (void)setCollectionName:(id)a3
{
  objc_storeStrong((id *)&self->_collectionName, a3);
}

- (NSArray)genreIDs
{
  return self->_genreIDs;
}

- (void)setGenreIDs:(id)a3
{
  objc_storeStrong((id *)&self->_genreIDs, a3);
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (int64_t)trackTimeMillis
{
  return self->_trackTimeMillis;
}

- (void)setTrackTimeMillis:(int64_t)a3
{
  self->_trackTimeMillis = a3;
}

- (unsigned)trackExplicitness
{
  return self->_trackExplicitness;
}

- (void)setTrackExplicitness:(unsigned __int8)a3
{
  self->_trackExplicitness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_genreIDs, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_trackName, 0);
}

@end
