@implementation TBMutableTileFetchResponse

- (TBMutableTileFetchResponse)init
{
  TBMutableTileFetchResponse *v2;
  uint64_t v3;
  NSMutableSet *mutableTiles;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TBMutableTileFetchResponse;
  v2 = -[TBMutableTileFetchResponse init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = objc_claimAutoreleasedReturnValue();
  mutableTiles = v2->_mutableTiles;
  v2->_mutableTiles = (NSMutableSet *)v3;

  return v2;
}

- (void)addResponse:(id)a3
{
  void *v4;
  NSMutableSet *mutableTiles;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "tiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    mutableTiles = self->_mutableTiles;
    objc_msgSend(v8, "tiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObjectsFromArray:](mutableTiles, "addObjectsFromArray:", v7);

  }
}

- (NSSet)tiles
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_mutableTiles);
}

- (NSError)error
{
  return self->error;
}

- (NSArray)results
{
  return self->results;
}

- (NSDictionary)resultsByBSSID
{
  return self->resultsByBSSID;
}

- (NSMutableSet)mutableTiles
{
  return self->_mutableTiles;
}

- (void)setMutableTiles:(id)a3
{
  objc_storeStrong((id *)&self->_mutableTiles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTiles, 0);
  objc_storeStrong((id *)&self->resultsByBSSID, 0);
  objc_storeStrong((id *)&self->results, 0);
  objc_storeStrong((id *)&self->error, 0);
}

@end
