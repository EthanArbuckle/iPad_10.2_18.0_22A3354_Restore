@implementation CarplayDetailTableViewCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

- (BOOL)isSelectable
{
  return 1;
}

- (DetailTableViewCellDelegate)delegate
{
  return (DetailTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updateWithEvent:(id)a3
{
  uint64_t v5;

  objc_opt_class(CarplayDetailTableViewCell);
  sub_1000438B0((uint64_t)self, (uint64_t)a2, v5);
}

- (void)cellWasTapped
{
  uint64_t v4;

  objc_opt_class(CarplayDetailTableViewCell);
  sub_1000438B0((uint64_t)self, (uint64_t)a2, v4);
}

@end
