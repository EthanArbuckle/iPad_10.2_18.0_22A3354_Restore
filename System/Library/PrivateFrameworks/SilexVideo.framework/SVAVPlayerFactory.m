@implementation SVAVPlayerFactory

- (SVAVPlayerFactory)initWithAudioMode:(int)a3 playerItemFactory:(id)a4
{
  id v7;
  SVAVPlayerFactory *v8;
  SVAVPlayerFactory *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SVAVPlayerFactory;
  v8 = -[SVAVPlayerFactory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_audioMode = a3;
    objc_storeStrong((id *)&v8->_playerItemFactory, a4);
  }

  return v9;
}

- (id)createPlayerWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SVAVPlayer *v7;

  v4 = a3;
  -[SVAVPlayerFactory playerItemFactory](self, "playerItemFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createPlayerItemWithURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SVAVPlayer initWithPlayerItem:audioMode:]([SVAVPlayer alloc], "initWithPlayerItem:audioMode:", v6, -[SVAVPlayerFactory audioMode](self, "audioMode"));
  return v7;
}

- (int)audioMode
{
  return self->_audioMode;
}

- (SVAVPlayerItemFactory)playerItemFactory
{
  return self->_playerItemFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItemFactory, 0);
}

@end
