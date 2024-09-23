@implementation _UIAlertControllerCarActionHighlightedBackgroundView

- (void)tintColorDidChange
{
  id v3;

  -[UIView tintColor](self, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  id v4;

  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", a3);

}

- (void)setHighlighted:(BOOL)a3
{
  -[UIView setHidden:](self, "setHidden:", !a3);
}

@end
