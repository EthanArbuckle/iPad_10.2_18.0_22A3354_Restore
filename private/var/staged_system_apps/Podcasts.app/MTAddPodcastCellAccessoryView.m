@implementation MTAddPodcastCellAccessoryView

- (MTAddPodcastCellAccessoryView)initWithFrame:(CGRect)a3
{
  MTAddPodcastCellAccessoryView *v3;
  uint64_t v4;
  UIButton *button;
  UIButton *v6;
  void *v7;
  MTAddPodcastCellAccessoryView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTAddPodcastCellAccessoryView;
  v3 = -[MTAddPodcastCellAccessoryView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton setAdjustsImageWhenDisabled:](v3->_button, "setAdjustsImageWhenDisabled:", 1);
    -[UIButton setAdjustsImageWhenHighlighted:](v3->_button, "setAdjustsImageWhenHighlighted:", 0);
    -[UIButton setShowsTouchWhenHighlighted:](v3->_button, "setShowsTouchWhenHighlighted:", 0);
    -[UIButton setUserInteractionEnabled:](v3->_button, "setUserInteractionEnabled:", 0);
    v6 = v3->_button;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage multiUncheckIcon](UIImage, "multiUncheckIcon"));
    -[UIButton setImage:forState:](v6, "setImage:forState:", v7, 0);

    -[MTAddPodcastCellAccessoryView addSubview:](v3, "addSubview:", v3->_button);
    v8 = v3;
  }

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  UIButton *button;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAddPodcastCellAccessoryView;
  -[MTAddPodcastCellAccessoryView layoutSubviews](&v4, "layoutSubviews");
  button = self->_button;
  -[MTAddPodcastCellAccessoryView bounds](self, "bounds");
  -[UIButton setFrame:](button, "setFrame:");
}

- (void)setAdded:(BOOL)a3
{
  UIButton *button;
  uint64_t v4;
  id v5;

  if (self->_added != a3)
  {
    self->_added = a3;
    button = self->_button;
    if (a3)
      v4 = objc_claimAutoreleasedReturnValue(+[UIImage multiCheckIcon](UIImage, "multiCheckIcon"));
    else
      v4 = objc_claimAutoreleasedReturnValue(+[UIImage multiUncheckIcon](UIImage, "multiUncheckIcon"));
    v5 = (id)v4;
    -[UIButton setImage:forState:](button, "setImage:forState:", v4, 0);

  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[UIButton setEnabled:](self->_button, "setEnabled:");
}

- (BOOL)isAdded
{
  return self->_added;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
