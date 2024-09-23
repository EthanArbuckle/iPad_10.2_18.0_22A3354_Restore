@implementation TBRemoteFetchTileItem

- (TBRemoteFetchTileItem)initWithTile:(id)a3 status:(unint64_t)a4 etag:(id)a5 error:(id)a6
{
  NSError *v10;
  id v11;
  id v12;
  TBRemoteFetchTileItem *v13;
  uint64_t v14;
  NSArray *networks;
  TBFetchedTile *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  TBTile *tile;
  NSError *error;
  objc_super v23;

  v10 = (NSError *)a6;
  v23.receiver = self;
  v23.super_class = (Class)TBRemoteFetchTileItem;
  v11 = a5;
  v12 = a3;
  v13 = -[TBRemoteFetchTileItem init](&v23, sel_init);
  objc_msgSend(v12, "ess", v23.receiver, v23.super_class);
  v14 = objc_claimAutoreleasedReturnValue();
  networks = v13->_networks;
  v13->_networks = (NSArray *)v14;

  v13->_status = a4;
  v16 = [TBFetchedTile alloc];
  v17 = objc_msgSend(v12, "tileKey");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[TBFetchedTile initWithKey:etag:created:](v16, "initWithKey:etag:created:", v17, v11, v18);

  tile = v13->_tile;
  v13->_tile = (TBTile *)v19;

  error = v13->_error;
  v13->_error = v10;

  return v13;
}

- (TBRemoteFetchTileItem)initWithEmptyTileKey:(unint64_t)a3 etag:(id)a4 error:(id)a5
{
  NSError *v8;
  id v9;
  TBRemoteFetchTileItem *v10;
  TBFetchedTile *v11;
  void *v12;
  uint64_t v13;
  TBTile *tile;
  NSError *error;
  objc_super v17;

  v8 = (NSError *)a5;
  v17.receiver = self;
  v17.super_class = (Class)TBRemoteFetchTileItem;
  v9 = a4;
  v10 = -[TBRemoteFetchTileItem init](&v17, sel_init);
  v10->_status = 3;
  v11 = [TBFetchedTile alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date", v17.receiver, v17.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TBFetchedTile initWithKey:etag:created:](v11, "initWithKey:etag:created:", a3, v9, v12);

  tile = v10->_tile;
  v10->_tile = (TBTile *)v13;

  error = v10->_error;
  v10->_error = v8;

  return v10;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)networks
{
  return self->_networks;
}

- (unint64_t)status
{
  return self->_status;
}

- (TBTile)tile
{
  return self->_tile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
