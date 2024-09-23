@implementation TransitRouteRAPTableViewCell

+ (double)horizontalPadding
{
  return 16.0;
}

+ (double)leadingTextAlignmentMargin
{
  return 16.0;
}

+ (double)rowHeight
{
  return UITableViewAutomaticDimension;
}

- (TransitRouteRAPTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TransitRouteRAPTableViewCell *v4;
  TransitRouteRAPTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TransitRouteRAPTableViewCell;
  v4 = -[TransitRouteTableViewCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CenteredTableViewCell setMinimumHorizontalMargins:](v4, "setMinimumHorizontalMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
    -[TransitRouteRAPTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[TransitRouteTableViewCell setLeftPadding:](v5, "setLeftPadding:", 15.0);
  }
  return v5;
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v3;

  self->_checked = a3;
  if (a3)
    v3 = 3;
  else
    v3 = 0;
  -[TransitRouteRAPTableViewCell setAccessoryType:](self, "setAccessoryType:", v3);
}

- (double)_leadingInset
{
  return 0.0;
}

- (double)_trailingInset
{
  return 0.0;
}

- (BOOL)isChecked
{
  return self->_checked;
}

@end
