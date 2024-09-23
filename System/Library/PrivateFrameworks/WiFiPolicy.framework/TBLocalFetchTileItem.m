@implementation TBLocalFetchTileItem

- (TBLocalFetchTileItem)initWithTile:(id)a3 error:(id)a4
{
  id v4;
  TBLocalFetchTileItem *v5;
  TBFetchedTile *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  TBTile *tile;
  void *v12;
  uint64_t v13;
  NSArray *networks;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TBLocalFetchTileItem;
  v4 = a3;
  v5 = -[TBLocalFetchTileItem init](&v16, sel_init);
  v5->_status = 1;
  v6 = [TBFetchedTile alloc];
  v7 = objc_msgSend(v4, "key", v16.receiver, v16.super_class);
  objc_msgSend(v4, "etag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "created");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TBFetchedTile initWithKey:etag:created:](v6, "initWithKey:etag:created:", v7, v8, v9);
  tile = v5->_tile;
  v5->_tile = (TBTile *)v10;

  objc_msgSend(v4, "networks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "allObjects");
  v13 = objc_claimAutoreleasedReturnValue();
  networks = v5->_networks;
  v5->_networks = (NSArray *)v13;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_error, 0);
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

@end
