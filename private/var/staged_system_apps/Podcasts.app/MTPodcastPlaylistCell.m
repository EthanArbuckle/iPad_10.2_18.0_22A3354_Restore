@implementation MTPodcastPlaylistCell

- (MTPodcastPlaylistCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTPodcastPlaylistCell *v4;
  MTPodcastPlaylistCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTPodcastPlaylistCell;
  v4 = -[MTPodcastCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[MTPodcastPlaylistCell setClipsToBounds:](v4, "setClipsToBounds:", 1);
  return v5;
}

- (id)countView
{
  return 0;
}

- (void)layoutSubviews
{
  UIView *disabledView;
  UIView *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTPodcastPlaylistCell;
  -[MTGenericCell layoutSubviews](&v7, "layoutSubviews");
  if (self->_disabledView)
  {
    -[MTPodcastPlaylistCell bringSubviewToFront:](self, "bringSubviewToFront:");
    disabledView = self->_disabledView;
    -[MTPodcastPlaylistCell bounds](self, "bounds");
    -[UIView setFrame:](disabledView, "setFrame:");
    v4 = self->_disabledView;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.5));
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v6);

  }
}

+ (CGSize)artworkSizeForViewWidth:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 44.0;
  v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setAdded:(BOOL)a3
{
  uint64_t v3;

  self->_added = a3;
  if (a3)
    v3 = 3;
  else
    v3 = 0;
  -[MTPodcastPlaylistCell setAccessoryType:](self, "setAccessoryType:", v3);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTPodcastPlaylistCell;
  -[MTGenericCell prepareForReuse](&v3, "prepareForReuse");
  -[MTPodcastPlaylistCell setAdded:](self, "setAdded:", 0);
  -[MTPodcastPlaylistCell setEnabled:](self, "setEnabled:", 1);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  UIView *disabledView;
  UIView *v6;
  UIView *v7;
  UIView *v8;

  v3 = a3;
  disabledView = self->_disabledView;
  if (a3)
  {
    if (disabledView)
    {
      -[UIView removeFromSuperview](disabledView, "removeFromSuperview");
      v6 = self->_disabledView;
      self->_disabledView = 0;

    }
  }
  else if (!disabledView)
  {
    v7 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v8 = self->_disabledView;
    self->_disabledView = v7;

    -[MTPodcastPlaylistCell addSubview:](self, "addSubview:", self->_disabledView);
    -[MTPodcastPlaylistCell setNeedsLayout](self, "setNeedsLayout");
  }
  -[MTPodcastPlaylistCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
}

- (BOOL)isAdded
{
  return self->_added;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledView, 0);
}

@end
