@implementation TTRIRowSeparatorView

- (void)tintColorDidChange
{
  id v3;

  if (-[TTRIRowSeparatorView isVibrant](self, "isVibrant"))
  {
    -[TTRIRowSeparatorView tintColor](self, "tintColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[TTRIRowSeparatorView setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
}

- (BOOL)isVibrant
{
  return self->_isVibrant;
}

- (void)setIsVibrant:(BOOL)a3
{
  self->_isVibrant = a3;
}

@end
