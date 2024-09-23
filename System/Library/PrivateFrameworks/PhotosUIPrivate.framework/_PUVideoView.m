@implementation _PUVideoView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_player, a3);
  -[_PUVideoView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachToPlayerLayerIfNeeded:", v5);

  v6 = v8;
  if (!v8)
  {
    -[_PUVideoView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWrappedPlayer:", 0);

    v6 = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
}

@end
