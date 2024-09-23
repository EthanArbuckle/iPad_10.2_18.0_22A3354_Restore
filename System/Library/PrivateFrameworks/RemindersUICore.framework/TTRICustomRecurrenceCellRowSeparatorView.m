@implementation TTRICustomRecurrenceCellRowSeparatorView

- (void)tintColorDidChange
{
  id v3;

  if (-[TTRICustomRecurrenceCellRowSeparatorView vibrant](self, "vibrant"))
  {
    -[TTRICustomRecurrenceCellRowSeparatorView tintColor](self, "tintColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[TTRICustomRecurrenceCellRowSeparatorView setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
}

- (BOOL)vibrant
{
  return self->_vibrant;
}

- (void)setVibrant:(BOOL)a3
{
  self->_vibrant = a3;
}

@end
