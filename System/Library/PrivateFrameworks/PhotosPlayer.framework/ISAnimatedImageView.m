@implementation ISAnimatedImageView

- (ISAnimatedImageView)initWithAnimatedImage:(id)a3
{
  id v4;
  ISAnimatedImagePlayer *v5;
  ISAnimatedImageView *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ISAnimatedImagePlayer initWithAnimatedImage:]([ISAnimatedImagePlayer alloc], "initWithAnimatedImage:", v4);

  }
  else
  {
    v5 = 0;
  }
  v6 = -[ISAnimatedImageView initWithAnimatedImagePlayer:](self, "initWithAnimatedImagePlayer:", v5);

  return v6;
}

- (ISAnimatedImageView)initWithAnimatedImagePlayer:(id)a3
{
  id v5;
  ISAnimatedImageView *v6;
  ISAnimatedImageView *v7;

  v5 = a3;
  v6 = -[ISAnimatedImageView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    -[ISAnimatedImagePlayer registerDestination:](v7->_player, "registerDestination:", v7);
  }

  return v7;
}

- (void)setPlayer:(id)a3
{
  ISAnimatedImagePlayer *v5;
  ISAnimatedImagePlayer *player;
  void *v7;
  UIImageView *placeholderImageView;
  ISAnimatedImagePlayer *v9;

  v5 = (ISAnimatedImagePlayer *)a3;
  player = self->_player;
  if (player != v5)
  {
    v9 = v5;
    -[ISAnimatedImagePlayer unregisterDestination:](player, "unregisterDestination:", self);
    objc_storeStrong((id *)&self->_player, a3);
    if (v9)
    {
      -[ISAnimatedImagePlayer registerDestination:](self->_player, "registerDestination:", self);
LABEL_6:
      v5 = v9;
      goto LABEL_7;
    }
    -[ISAnimatedImageView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsDisplay");

    v5 = 0;
    placeholderImageView = self->_placeholderImageView;
    if (placeholderImageView)
    {
      -[UIImageView setHidden:](placeholderImageView, "setHidden:", 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)dealloc
{
  objc_super v3;

  -[ISAnimatedImagePlayer unregisterDestination:](self->_player, "unregisterDestination:", self);
  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImageView;
  -[ISAnimatedImageView dealloc](&v3, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ISAnimatedImagePlayer animatedImage](self->_player, "animatedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pixelSize");
  if (v7 == 0.0)
  {
    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v8 = v6;
    v9 = v7;
    if (height != 0.0 && width != 0.0)
    {
      v12 = v6 / v7;
      if (width / height <= v8 / v7)
      {
        v8 = width;
        v9 = width / v12;
      }
      else
      {
        v8 = height * v12;
        v9 = height;
      }
    }
  }

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImageView;
  -[ISAnimatedImageView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[ISAnimatedImagePlayer updateAnimation](self->_player, "updateAnimation");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImageView;
  -[ISAnimatedImageView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[ISAnimatedImagePlayer updateAnimation](self->_player, "updateAnimation");
}

- (void)setAlpha:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISAnimatedImageView;
  -[ISAnimatedImageView setAlpha:](&v4, sel_setAlpha_, a3);
  -[ISAnimatedImagePlayer updateAnimation](self->_player, "updateAnimation");
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISAnimatedImageView;
  -[ISAnimatedImageView setHidden:](&v4, sel_setHidden_, a3);
  -[ISAnimatedImagePlayer updateAnimation](self->_player, "updateAnimation");
}

- (void)animatedImagePlayerFrameDidChange:(id)a3
{
  id v3;

  -[ISAnimatedImageView layer](self, "layer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

}

- (BOOL)animatedImagePlayerIsReadyToDisplay:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  double v7;

  -[ISAnimatedImageView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ISAnimatedImageView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (-[ISAnimatedImageView isHidden](self, "isHidden") & 1) == 0)
    {
      -[ISAnimatedImageView alpha](self, "alpha");
      v6 = v7 > 0.0;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)animatedImagePlayerDidBeginAnimating:(id)a3
{
  UIImageView *placeholderImageView;

  placeholderImageView = self->_placeholderImageView;
  if (placeholderImageView)
    -[UIImageView setHidden:](placeholderImageView, "setHidden:", 1);
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  ISAnimatedImagePlayer *v6;
  id v7;

  v7 = a3;
  -[ISAnimatedImagePlayer animatedImage](self->_player, "animatedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 != v7)
  {
    if (v7)
      v6 = -[ISAnimatedImagePlayer initWithAnimatedImage:]([ISAnimatedImagePlayer alloc], "initWithAnimatedImage:", v7);
    else
      v6 = 0;
    -[ISAnimatedImageView setPlayer:](self, "setPlayer:", v6);

    v5 = v7;
  }

}

- (PFAnimatedImage)image
{
  return -[ISAnimatedImagePlayer animatedImage](self->_player, "animatedImage");
}

- (void)setPlaying:(BOOL)a3
{
  -[ISAnimatedImagePlayer setPlaying:](self->_player, "setPlaying:", a3);
}

- (BOOL)isPlaying
{
  return -[ISAnimatedImagePlayer isPlaying](self->_player, "isPlaying");
}

- (void)setDisplayedFrameIndex:(unint64_t)a3
{
  -[ISAnimatedImagePlayer setDisplayedFrameIndex:](self->_player, "setDisplayedFrameIndex:", a3);
}

- (unint64_t)displayedFrameIndex
{
  return -[ISAnimatedImagePlayer displayedFrameIndex](self->_player, "displayedFrameIndex");
}

- (void)setPlaceholderImageView:(id)a3
{
  UIImageView *placeholderImageView;
  UIImageView *v5;
  UIImageView *v6;

  placeholderImageView = self->_placeholderImageView;
  if (placeholderImageView != a3)
  {
    v6 = (UIImageView *)a3;
    -[UIImageView removeFromSuperview](placeholderImageView, "removeFromSuperview");
    self->_placeholderImageView = v6;
    -[ISAnimatedImageView addSubview:](self, "addSubview:");
    v5 = self->_placeholderImageView;
    -[ISAnimatedImageView bounds](self, "bounds");
    -[UIImageView setFrame:](v5, "setFrame:");
    -[UIImageView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[ISAnimatedImagePlayer updateAnimation](self->_player, "updateAnimation");

  }
}

- (void)displayLayer:(id)a3
{
  ISAnimatedImagePlayer *player;
  id v4;

  player = self->_player;
  v4 = a3;
  objc_msgSend(v4, "setContents:", -[ISAnimatedImagePlayer currentImage](player, "currentImage"));

}

- (UIImageView)placeholderImageView
{
  return self->_placeholderImageView;
}

- (ISAnimatedImagePlayer)player
{
  return self->_player;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
}

@end
