@implementation IMExternalVideoView

- (void)setVideoLayer:(id)a3
{
  AVPlayerLayer *v5;
  AVPlayerLayer **p_videoLayer;
  AVPlayerLayer *videoLayer;
  void *v8;
  AVPlayerLayer *v9;

  v5 = (AVPlayerLayer *)a3;
  p_videoLayer = &self->_videoLayer;
  videoLayer = self->_videoLayer;
  if (videoLayer != v5)
  {
    v9 = v5;
    -[AVPlayerLayer removeFromSuperlayer](videoLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_videoLayer, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMExternalVideoView layer](self, "layer"));
    objc_msgSend(v8, "addSublayer:", *p_videoLayer);

    v5 = v9;
  }

}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL4 IsEmpty;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)IMExternalVideoView;
  v4 = a3;
  -[IMExternalVideoView layoutSublayersOfLayer:](&v17, "layoutSublayersOfLayer:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMExternalVideoView layer](self, "layer", v17.receiver, v17.super_class));

  if (v5 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMExternalVideoView videoLayer](self, "videoLayer"));
    objc_msgSend(v6, "bounds");
    IsEmpty = CGRectIsEmpty(v18);

    if (IsEmpty)
    {
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    }
    -[IMExternalVideoView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMExternalVideoView videoLayer](self, "videoLayer"));
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    if (IsEmpty)
      +[CATransaction commit](CATransaction, "commit");
  }
}

- (AVPlayerLayer)videoLayer
{
  return self->_videoLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoLayer, 0);
}

@end
