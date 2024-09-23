@implementation MCDCuratedPlaylistsDataSource

- (MCDCuratedPlaylistsDataSource)initWithCurator:(id)a3
{
  id v5;
  MCDCuratedPlaylistsDataSource *v6;
  MCDCuratedPlaylistsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDCuratedPlaylistsDataSource;
  v6 = -[MCDCuratedPlaylistsDataSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_curator, a3);

  return v7;
}

- (int64_t)curatorID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDCuratedPlaylistsDataSource curator](self, "curator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "universalStore"));
  v5 = objc_msgSend(v4, "adamID");

  return (int64_t)v5;
}

- (MPModelCurator)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
{
  objc_storeStrong((id *)&self->_curator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curator, 0);
}

@end
