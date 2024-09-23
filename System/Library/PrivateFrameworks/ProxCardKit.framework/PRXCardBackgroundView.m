@implementation PRXCardBackgroundView

- (PRXCardBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = PRXCardContainerDefaultLayoutMargins();
  return -[PRXCardBackgroundView initWithFrame:containerLayoutMargins:](self, "initWithFrame:containerLayoutMargins:", x, y, width, height, v8, v9, v10, v11);
}

- (PRXCardBackgroundView)initWithFrame:(CGRect)a3 containerLayoutMargins:(NSDirectionalEdgeInsets)a4
{
  CGFloat trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  PRXCardBackgroundView *v8;
  PRXCardBackgroundView *v9;
  void *v10;
  PRXCardBackgroundView *v11;
  objc_super v13;

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  v13.receiver = self;
  v13.super_class = (Class)PRXCardBackgroundView;
  v8 = -[PRXCardBackgroundView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  if (v8)
  {
    v8->_containerLayoutMargins.top = top;
    v8->_containerLayoutMargins.leading = leading;
    v8->_containerLayoutMargins.bottom = bottom;
    v8->_containerLayoutMargins.trailing = trailing;
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardBackgroundView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[PRXCardBackgroundView _updateCornerRadius](v9, "_updateCornerRadius");
    v11 = v9;
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PRXCardBackgroundView;
  v4 = a3;
  -[PRXCardBackgroundView traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayCornerRadius", v14.receiver, v14.super_class);
  v6 = v5;

  -[PRXCardBackgroundView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayCornerRadius");
  v9 = v8;

  if (v6 != v9)
    -[PRXCardBackgroundView _updateCornerRadius](self, "_updateCornerRadius");
  -[PRXCardBackgroundView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PRXCardBackgroundView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "customBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v13);

  }
}

- (void)_updateCornerRadius
{
  void *v3;
  double v4;
  double v5;

  -[PRXCardBackgroundView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayCornerRadius");
  v5 = v4 - self->_containerLayoutMargins.bottom;

  -[PRXCardBackgroundView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", fmax(13.0, v5));
}

@end
