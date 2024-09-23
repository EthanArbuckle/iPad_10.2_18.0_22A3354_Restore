@implementation PXGScrollViewContainerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_scrollViewModel);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak(v4 + 2, WeakRetained);

  return v4;
}

- (unint64_t)hash
{
  return -[PXGScrollViewModel hash](self->_scrollViewModel, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "scrollViewModel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXGScrollViewContainerConfiguration scrollViewModel](self, "scrollViewModel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (!v8)
      {
        v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v5, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGScrollViewContainerConfiguration delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
      v9 = 1;
    else
      v9 = objc_msgSend(v10, "isEqual:", v11);

    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (PXGScrollViewModel)scrollViewModel
{
  return self->_scrollViewModel;
}

- (void)setScrollViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewModel, a3);
}

- (PXGScrollViewContainerDelegate)delegate
{
  return (PXGScrollViewContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollViewModel, 0);
}

@end
