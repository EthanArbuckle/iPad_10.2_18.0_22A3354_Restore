@implementation _UIStatusBarDataAggregatorUpdate

+ (id)updateWithEntry:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setEntry:", v4);

  objc_msgSend(v5, "setAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
  return v5;
}

- (_UIStatusBarDataEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
