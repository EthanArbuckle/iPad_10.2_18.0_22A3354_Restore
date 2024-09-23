@implementation HomeActionFooterViewModel

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_topMargin));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  HomeActionFooterViewModel *v4;
  HomeActionFooterViewModel *v5;
  uint64_t v6;
  HomeActionFooterViewModel *v7;
  HomeActionFooterViewDelegate *delegate;
  HomeActionFooterViewDelegate *v9;
  double topMargin;
  double v11;
  BOOL v12;

  v4 = (HomeActionFooterViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    delegate = self->_delegate;
    v9 = (HomeActionFooterViewDelegate *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterViewModel delegate](v7, "delegate"));
    if (delegate == v9 || -[HomeActionFooterViewDelegate isEqual:](delegate, "isEqual:", v9))
    {
      topMargin = self->_topMargin;
      -[HomeActionFooterViewModel topMargin](v7, "topMargin");
      v12 = topMargin == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (HomeActionFooterViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
