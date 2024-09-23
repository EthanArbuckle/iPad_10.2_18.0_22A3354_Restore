@implementation PXMemoriesFeedScrollFilter

- (PXMemoriesFeedScrollFilter)initWithScrollViewController:(id)a3
{
  id v5;
  PXMemoriesFeedScrollFilter *v6;
  PXMemoriesFeedScrollFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMemoriesFeedScrollFilter;
  v6 = -[PXMemoriesFeedScrollFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollViewController, a3);
    -[PXScrollViewController registerObserver:](v7->_scrollViewController, "registerObserver:", v7);
  }

  return v7;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToShouldRequestAdditionalContent = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setSpec:(id)a3
{
  double v5;
  PXMemoriesSpec *v6;

  v6 = (PXMemoriesSpec *)a3;
  if (self->_spec != v6)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXMemoriesSpec feedAdditionalContentThreshold](v6, "feedAdditionalContentThreshold");
    self->_additionalContentThreshold = v5;
  }

}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat MaxY;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  CGRect v24;

  v4 = a3;
  if (self->_delegateFlags.respondsToShouldRequestAdditionalContent)
  {
    v23 = v4;
    objc_msgSend(v4, "visibleRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v23, "scrollViewContentSize");
    v14 = v13;
    v24.origin.x = v6;
    v24.origin.y = v8;
    v24.size.width = v10;
    v24.size.height = v12;
    MaxY = CGRectGetMaxY(v24);
    v4 = v23;
    if (v14 - MaxY < self->_additionalContentThreshold)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMemoriesFeedScrollFilter _lastAdditionalContentRequestDate](self, "_lastAdditionalContentRequestDate");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17
        || (v18 = (void *)v17,
            -[PXMemoriesFeedScrollFilter _lastAdditionalContentRequestDate](self, "_lastAdditionalContentRequestDate"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v16, "timeIntervalSinceDate:", v19),
            v21 = v20,
            v19,
            v18,
            v21 > 1.0))
      {
        -[PXMemoriesFeedScrollFilter _setLastAdditionalContentRequestDate:](self, "_setLastAdditionalContentRequestDate:", v16);
        -[PXMemoriesFeedScrollFilter delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scrollFilterShouldRequestAdditionalContent:", self);

      }
      v4 = v23;
    }
  }

}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (PXMemoriesSpec)spec
{
  return self->_spec;
}

- (PXMemoriesFeedScrollFilterDelegate)delegate
{
  return (PXMemoriesFeedScrollFilterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDate)_lastAdditionalContentRequestDate
{
  return self->__lastAdditionalContentRequestDate;
}

- (void)_setLastAdditionalContentRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->__lastAdditionalContentRequestDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lastAdditionalContentRequestDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
}

@end
