@implementation PUSharedAlbumGadget

- (id)contentView
{
  void *v3;
  void *v4;

  -[PUSharedAlbumGadget albumCellContentView](self, "albumCellContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PUAlbumGadget albumListCellContentView](self, "albumListCellContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowsAvatarView:", 1);
    -[PUSharedAlbumGadget setAlbumCellContentView:](self, "setAlbumCellContentView:", v4);

  }
  return -[PUSharedAlbumGadget albumCellContentView](self, "albumCellContentView");
}

- (PUAlbumListCellContentView)albumCellContentView
{
  return self->_albumCellContentView;
}

- (void)setAlbumCellContentView:(id)a3
{
  objc_storeStrong((id *)&self->_albumCellContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumCellContentView, 0);
}

@end
