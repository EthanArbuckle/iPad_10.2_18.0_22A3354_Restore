@implementation MTAWorldClockTableViewCell

+ (float)defaultHeight
{
  double v2;

  +[MTUIWorldClockCellView defaultHeight](MTUIWorldClockCellView, "defaultHeight");
  return v2;
}

- (MTAWorldClockTableViewCell)init
{
  return -[MTAWorldClockTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, CFSTR("MTWorldClockCell"));
}

- (MTAWorldClockTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTAWorldClockTableViewCell *v4;
  MTAWorldClockTableViewCell *v5;
  void *v6;
  id v7;
  MTUIWorldClockCellView *v8;
  MTUIWorldClockCellView *clockCellView;
  MTAWorldClockTableViewCell *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTAWorldClockTableViewCell;
  v4 = -[MTAWorldClockTableViewCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTAWorldClockTableViewCell setOpaque:](v4, "setOpaque:", 0);
    -[MTAWorldClockTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v6, "setOpaque:", 0);
    v7 = objc_alloc((Class)MTUIWorldClockCellView);
    -[MTAWorldClockTableViewCell bounds](v5, "bounds");
    v8 = (MTUIWorldClockCellView *)objc_msgSend(v7, "initWithFrame:");
    clockCellView = v5->_clockCellView;
    v5->_clockCellView = v8;

    -[MTUIWorldClockCellView setDelegate:](v5->_clockCellView, "setDelegate:", v5);
    -[MTUIWorldClockCellView setAutoresizingMask:](v5->_clockCellView, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "addSubview:", v5->_clockCellView);
    v10 = v5;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MTUIWorldClockCellView setDelegate:](self->_clockCellView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockTableViewCell;
  -[MTAWorldClockTableViewCell dealloc](&v3, "dealloc");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockTableViewCell;
  -[MTAWorldClockTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[MTAWorldClockTableViewCell setCity:](self, "setCity:", 0);
  -[MTAWorldClockTableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[MTAWorldClockTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewCell contentView](self, "contentView", a3.width));
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[MTUIWorldClockCellView sizeThatFits:](self->_clockCellView, "sizeThatFits:", v7, height);
  v9 = v8;
  v11 = v10;
  -[MTAWorldClockTableViewCell _separatorFrame](self, "_separatorFrame");
  v13 = v11 + v12;
  v14 = v9;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockTableViewCell;
  -[MTAWorldClockTableViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  -[MTUIWorldClockCellView setFrame:](self->_clockCellView, "setFrame:");

}

- (void)updateShouldStackViewInCell:(BOOL)a3
{
  -[MTUIWorldClockCellView setShouldStackViews:](self->_clockCellView, "setShouldStackViews:", a3);
}

- (void)setCity:(id)a3
{
  WorldClockCity *v5;
  WorldClockCity **p_city;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  WorldClockCity *v12;

  v5 = (WorldClockCity *)a3;
  p_city = &self->_city;
  if (self->_city != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_city, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIWorldClockCellView nameLabel](self->_clockCellView, "nameLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WorldClockCity name](*p_city, "name"));
    objc_msgSend(v7, "setText:", v8);

    v9 = objc_alloc((Class)NSTimeZone);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WorldClockCity timeZone](*p_city, "timeZone"));
    v11 = objc_msgSend(v9, "initWithName:", v10);

    -[MTUIWorldClockCellView setTimeZone:](self->_clockCellView, "setTimeZone:", v11);
    if (!*p_city)
      goto LABEL_5;
    if ((-[MTUIWorldClockCellView started](self->_clockCellView, "started") & 1) != 0)
    {
      if (!*p_city)
      {
LABEL_5:
        if (-[MTUIWorldClockCellView started](self->_clockCellView, "started"))
          -[MTUIWorldClockCellView stop](self->_clockCellView, "stop");
      }
    }
    else
    {
      -[MTUIWorldClockCellView start](self->_clockCellView, "start");
    }

    v5 = v12;
  }

}

- (WorldClockCity)city
{
  return self->_city;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  MTUIWorldClockCellView *clockCellView;
  id v8;
  double v9;
  double v10;
  objc_super v11;

  v4 = a4;
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTAWorldClockTableViewCell;
  -[MTAWorldClockTableViewCell setEditing:animated:](&v11, "setEditing:animated:");
  clockCellView = self->_clockCellView;
  if (v5)
    v8 = -[MTAWorldClockTableViewCell showsReorderControl](self, "showsReorderControl");
  else
    v8 = 0;
  -[MTUIWorldClockCellView setEditing:animated:](clockCellView, "setEditing:animated:", v8, v4);
  if (v4)
  {
    +[UIView beginAnimations:context:](UIView, "beginAnimations:context:", CFSTR("EditingWorldClockTableViewCell"), 0);
    v9 = 15.0;
    if (v5)
      v9 = 45.0;
    -[MTAWorldClockTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v9, 0.0, 0.0);
    +[UIView commitAnimations](UIView, "commitAnimations");
  }
  else
  {
    v10 = 15.0;
    if (v5)
      v10 = 45.0;
    -[MTAWorldClockTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v10, 0.0, 0.0);
  }
}

- (void)willTransitionToState:(unint64_t)a3
{
  objc_super v5;

  if ((a3 & 1) == 0)
    -[MTAWorldClockTableViewCell setShowsReorderControl:](self, "setShowsReorderControl:", 0);
  v5.receiver = self;
  v5.super_class = (Class)MTAWorldClockTableViewCell;
  -[MTAWorldClockTableViewCell willTransitionToState:](&v5, "willTransitionToState:", a3);
}

- (MTUIWorldClockCellView)clockCellView
{
  return self->_clockCellView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockCellView, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

@end
