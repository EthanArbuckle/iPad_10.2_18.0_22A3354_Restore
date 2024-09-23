@implementation DirectionsTableViewCellBackgroundView

- (void)setHighlightedColor:(BOOL)a3
{
  id v4;

  if (self->_highlightedColor != a3)
  {
    self->_highlightedColor = a3;
    if (a3)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("DirectionsTableViewCellBackgroundView")));
      -[DirectionsTableViewCellBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v4);

    }
    else
    {
      -[DirectionsTableViewCellBackgroundView setBackgroundColor:](self, "setBackgroundColor:", 0);
    }
  }
}

- (BOOL)isHighlightedColor
{
  return self->_highlightedColor;
}

@end
