@implementation TUINowPlayingView

+ (id)renderModelWithIdentifier:(id)a3 playing:(BOOL)a4 color:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _TUINowPlayingRenderModel *v9;
  TUIRenderModelView *v10;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init(_TUINowPlayingRenderModel);
  -[_TUINowPlayingRenderModel setPlaying:](v9, "setPlaying:", v5);
  -[_TUINowPlayingRenderModel setColor:](v9, "setColor:", v7);

  v10 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierNowPlayingView"), v8, v9);
  return v10;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  _TUINowPlayingRenderModel *v6;
  _TUINowPlayingRenderModel *renderModel;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUINowPlayingView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v12, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v12.receiver, v12.super_class));

  v6 = (_TUINowPlayingRenderModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  renderModel = self->_renderModel;
  self->_renderModel = v6;

  self->_playing = -[_TUINowPlayingRenderModel playing](self->_renderModel, "playing");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TUINowPlayingRenderModel color](self->_renderModel, "color"));
  v9 = v8;
  if (!v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  objc_storeStrong((id *)&self->_color, v9);
  if (!v8)

  -[MPUNowPlayingIndicatorView setLevelGuttersColor:](self->_nowPlayingIndicatorView, "setLevelGuttersColor:", self->_color);
  v10 = 0.6;
  if (self->_playing)
  {
    v10 = 1.0;
    v11 = 1;
  }
  else
  {
    v11 = 2;
  }
  -[MPUNowPlayingIndicatorView setAlpha:](self->_nowPlayingIndicatorView, "setAlpha:", v10);
  -[MPUNowPlayingIndicatorView setPlaybackState:](self->_nowPlayingIndicatorView, "setPlaybackState:", v11);

}

- (TUINowPlayingView)initWithFrame:(CGRect)a3
{
  TUINowPlayingView *v3;
  id v4;
  MPUNowPlayingIndicatorView *v5;
  MPUNowPlayingIndicatorView *nowPlayingIndicatorView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUINowPlayingView;
  v3 = -[TUINowPlayingView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)MPUNowPlayingIndicatorView);
    -[TUINowPlayingView bounds](v3, "bounds");
    v5 = (MPUNowPlayingIndicatorView *)objc_msgSend(v4, "initWithFrame:");
    nowPlayingIndicatorView = v3->_nowPlayingIndicatorView;
    v3->_nowPlayingIndicatorView = v5;

    -[MPUNowPlayingIndicatorView setInterLevelSpacing:](v3->_nowPlayingIndicatorView, "setInterLevelSpacing:", 1.0);
    -[MPUNowPlayingIndicatorView setLevelCornerRadius:](v3->_nowPlayingIndicatorView, "setLevelCornerRadius:", 1.0);
    -[MPUNowPlayingIndicatorView setLevelWidth:](v3->_nowPlayingIndicatorView, "setLevelWidth:", 2.5);
    -[MPUNowPlayingIndicatorView setMaximumLevelHeight:](v3->_nowPlayingIndicatorView, "setMaximumLevelHeight:", 10.0);
    -[MPUNowPlayingIndicatorView setMinimumLevelHeight:](v3->_nowPlayingIndicatorView, "setMinimumLevelHeight:", 2.0);
    -[MPUNowPlayingIndicatorView setNumberOfLevels:](v3->_nowPlayingIndicatorView, "setNumberOfLevels:", 4);
    -[TUINowPlayingView addSubview:](v3, "addSubview:", v3->_nowPlayingIndicatorView);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUINowPlayingView;
  -[TUINowPlayingView layoutSubviews](&v3, "layoutSubviews");
  -[TUINowPlayingView bounds](self, "bounds");
  -[MPUNowPlayingIndicatorView setFrame:](self->_nowPlayingIndicatorView, "setFrame:");
}

- (_TUINowPlayingRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (BOOL)playing
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_nowPlayingIndicatorView, 0);
}

@end
