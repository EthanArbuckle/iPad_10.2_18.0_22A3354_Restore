@implementation PLAVPlayerView

- (PLAVPlayerView)initWithFrame:(CGRect)a3
{
  PLAVPlayerView *v3;
  PLAVPlayerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLAVPlayerView;
  v3 = -[PLAVPlayerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    objc_msgSend((id)-[PLAVPlayerView layer](v3, "layer"), "setContentsOpaque:", 1);
    -[PLAVPlayerView setScaleMode:](v4, "setScaleMode:", 1);
  }
  return v4;
}

- (AVPlayer)player
{
  return (AVPlayer *)objc_msgSend((id)-[PLAVPlayerView layer](self, "layer"), "player");
}

- (void)setPlayer:(id)a3
{
  objc_msgSend((id)-[PLAVPlayerView layer](self, "layer"), "setPlayer:", a3);
}

- (void)setScaleMode:(int64_t)a3
{
  -[PLAVPlayerView setScaleMode:duration:](self, "setScaleMode:duration:", a3, 0.0);
}

- (void)setScaleMode:(int64_t)a3 duration:(double)a4
{
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;

  v7 = -[PLAVPlayerView layer](self, "layer");
  if (v7)
  {
    v8 = (void *)v7;
    if (a4 > 0.0)
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", a4);
    v9 = (_QWORD *)MEMORY[0x1E0C8A6E0];
    v10 = (_QWORD *)MEMORY[0x1E0C8A6D0];
    if (a3 != 3)
      v10 = (_QWORD *)MEMORY[0x1E0C8A6D8];
    if (a3 != 2)
      v9 = v10;
    objc_msgSend(v8, "setVideoGravity:", *v9);
  }
  self->_scaleMode = a3;
}

- (CGRect)videoRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend((id)-[PLAVPlayerView layer](self, "layer"), "videoRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
