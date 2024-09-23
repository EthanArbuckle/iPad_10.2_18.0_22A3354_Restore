@implementation BKNowPlayingIndicatorView

- (double)interLevelSpacing
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_interLevelSpacing);
}

- (void)setInterLevelSpacing:(double)a3
{
  double v3;

  v3 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_interLevelSpacing);
  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_interLevelSpacing) = a3;
  if (v3 != a3)
    -[BKNowPlayingIndicatorView setNeedsLayout](self, "setNeedsLayout");
}

- (double)levelCornerRadius
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelCornerRadius);
}

- (void)setLevelCornerRadius:(double)a3
{
  BKNowPlayingIndicatorView *v4;

  v4 = self;
  sub_100345724(a3);

}

- (double)levelWidth
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelWidth);
}

- (void)setLevelWidth:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelWidth) = a3;
  -[BKNowPlayingIndicatorView setNeedsLayout](self, "setNeedsLayout");
}

- (double)maximumLevelHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_maximumLevelHeight);
}

- (void)setMaximumLevelHeight:(double)a3
{
  BKNowPlayingIndicatorView *v3;

  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_maximumLevelHeight) = a3;
  v3 = self;
  sub_100346860();

}

- (double)minimumLevelHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_minimumLevelHeight);
}

- (void)setMinimumLevelHeight:(double)a3
{
  BKNowPlayingIndicatorView *v3;

  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_minimumLevelHeight) = a3;
  v3 = self;
  sub_100346860();

}

- (int64_t)numberOfLevels
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_numberOfLevels);
}

- (void)setNumberOfLevels:(int64_t)a3
{
  BKNowPlayingIndicatorView *v3;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_numberOfLevels) = (Class)a3;
  v3 = self;
  sub_100346374();

}

- (int64_t)playbackState
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_playbackState);
}

- (void)setPlaybackState:(int64_t)a3
{
  uint64_t v3;
  BKNowPlayingIndicatorView *v4;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_playbackState);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_playbackState) = (Class)a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_100346860();

  }
}

- (BOOL)showsLevelGutters
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_showsLevelGutters);
}

- (void)setShowsLevelGutters:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_showsLevelGutters) = a3;
  -[BKNowPlayingIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
}

- (UIColor)levelGuttersColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___BKNowPlayingIndicatorView_levelGuttersColor));
}

- (void)setLevelGuttersColor:(id)a3
{
  void *v4;
  BKNowPlayingIndicatorView *v5;
  char v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelGuttersColor);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelGuttersColor) = (Class)a3;
  v7 = a3;
  v5 = self;

  v6 = *((_BYTE *)&v5->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_needsLevelUpdate);
  *((_BYTE *)&v5->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_needsLevelUpdate) = 1;
  if ((v6 & 1) == 0)
    -[BKNowPlayingIndicatorView setNeedsDisplay](v5, "setNeedsDisplay");

}

- (UIColor)levelColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___BKNowPlayingIndicatorView_levelColor));
}

- (void)setLevelColor:(id)a3
{
  void *v4;
  BKNowPlayingIndicatorView *v5;
  char v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelColor);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelColor) = (Class)a3;
  v7 = a3;
  v5 = self;

  v6 = *((_BYTE *)&v5->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_needsLevelUpdate);
  *((_BYTE *)&v5->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_needsLevelUpdate) = 1;
  if ((v6 & 1) == 0)
    -[BKNowPlayingIndicatorView setNeedsDisplay](v5, "setNeedsDisplay");

}

- (BKNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  return (BKNowPlayingIndicatorView *)sub_100345B18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKNowPlayingIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100346F9C();
}

- (void)layoutSubviews
{
  BKNowPlayingIndicatorView *v2;

  v2 = self;
  NowPlayingIndicatorView.layoutSubviews()();

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BKNowPlayingIndicatorView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  NowPlayingIndicatorView.draw(_:)(x, y, width, height);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  _s5Books23NowPlayingIndicatorViewC12sizeThatFitsySo6CGSizeVAFF_0();
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingIndicatorView();
  v2 = v3.receiver;
  -[BKNowPlayingIndicatorView tintColorDidChange](&v3, "tintColorDidChange");
  if (*((_BYTE *)v2 + OBJC_IVAR___BKNowPlayingIndicatorView_showsLevelGutters) == 1)
    objc_msgSend(v2, "setNeedsDisplay", v3.receiver, v3.super_class);
  sub_100346374();

}

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingIndicatorView();
  return -[BKNowPlayingIndicatorView isHidden](&v3, "isHidden");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  BKNowPlayingIndicatorView *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for NowPlayingIndicatorView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[BKNowPlayingIndicatorView isHidden](&v9, "isHidden");
  v8.receiver = v6;
  v8.super_class = v5;
  -[BKNowPlayingIndicatorView setHidden:](&v8, "setHidden:", v3);
  if (!-[BKNowPlayingIndicatorView isHidden](v6, "isHidden") && v7)
    sub_100346860();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKNowPlayingIndicatorView_levelViews));

}

@end
