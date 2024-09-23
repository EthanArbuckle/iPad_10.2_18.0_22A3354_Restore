@implementation SKUIMediaPlayer

- (SKUIMediaPlayerItemStatus)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_playerItem, a3);
}

- (MPAVController)player
{
  return (MPAVController *)objc_loadWeakRetained((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (MPAVItem)currentItem
{
  return (MPAVItem *)objc_loadWeakRetained((id *)&self->_currentItem);
}

- (void)setCurrentItem:(id)a3
{
  objc_storeWeak((id *)&self->_currentItem, a3);
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (void)setPeriodicTimeObserver:(id)a3
{
  objc_storeStrong(&self->_periodicTimeObserver, a3);
}

- (BOOL)playing
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_destroyWeak((id *)&self->_currentItem);
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end
