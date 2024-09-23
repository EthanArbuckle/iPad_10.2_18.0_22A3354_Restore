@implementation STUIStatusBarDataAggregatorUpdate

+ (id)updateWithEntry:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setEntry:", v4);

  objc_msgSend(v5, "setAnimated:", objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));
  return v5;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (STStatusBarDataEntry)entry
{
  return self->_entry;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
