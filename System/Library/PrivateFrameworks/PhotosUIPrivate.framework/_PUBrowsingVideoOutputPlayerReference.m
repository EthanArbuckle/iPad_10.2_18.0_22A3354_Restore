@implementation _PUBrowsingVideoOutputPlayerReference

- (PUBrowsingVideoPlayer)player
{
  return (PUBrowsingVideoPlayer *)objc_loadWeakRetained((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
}

@end
