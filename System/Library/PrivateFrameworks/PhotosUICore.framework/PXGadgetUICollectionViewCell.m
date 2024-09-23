@implementation PXGadgetUICollectionViewCell

- (void)_updateFocusRing
{
  +[PXFocusRing updateView:infoProviderBlock:](PXFocusRing, "updateView:infoProviderBlock:");
}

- (void)setGadgetContentView:(id)a3
{
  UIView *v5;
  UIView **p_gadgetContentView;
  UIView *gadgetContentView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v5 = (UIView *)a3;
  p_gadgetContentView = &self->_gadgetContentView;
  gadgetContentView = self->_gadgetContentView;
  if (gadgetContentView != v5)
  {
    -[UIView superview](gadgetContentView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGadgetUICollectionViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[UIView removeFromSuperview](*p_gadgetContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_gadgetContentView, a3);
    if (*p_gadgetContentView)
    {
      -[UIView setAutoresizingMask:](*p_gadgetContentView, "setAutoresizingMask:", 0);
      -[PXGadgetUICollectionViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", *p_gadgetContentView);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak(&location, self);
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __53__PXGadgetUICollectionViewCell_setGadgetContentView___block_invoke;
        v15 = &unk_1E5148D30;
        objc_copyWeak(&v16, &location);
        -[UIView setFocusInfoChangeHandler:](*p_gadgetContentView, "setFocusInfoChangeHandler:", &v12);
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
      -[PXGadgetUICollectionViewCell contentView](self, "contentView", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNeedsLayout");

    }
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGadgetUICollectionViewCell;
  -[PXGadgetUICollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PXGadgetUICollectionViewCell setGadgetContentView:](self, "setGadgetContentView:", 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  PXGadgetUICollectionViewCell *v7;
  PXGadgetUICollectionViewCell *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGadgetUICollectionViewCell;
  -[PXGadgetUICollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:](&v10, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem");
  v7 = (PXGadgetUICollectionViewCell *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    -[PXGadgetUICollectionViewCell gadgetContentView](self, "gadgetContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

LABEL_8:
      -[PXGadgetUICollectionViewCell _updateFocusRing](self, "_updateFocusRing");
      goto LABEL_9;
    }
  }
  objc_msgSend(v6, "previouslyFocusedItem");
  v8 = (PXGadgetUICollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  else

  if (v8 == self)
    goto LABEL_8;
LABEL_9:

}

- (id)focusEffect
{
  return 0;
}

- (UIView)gadgetContentView
{
  return self->_gadgetContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetContentView, 0);
}

void __53__PXGadgetUICollectionViewCell_setGadgetContentView___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isFocused");

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_updateFocusRing");

  }
}

id __48__PXGadgetUICollectionViewCell__updateFocusRing__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "gadgetContentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "focusInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

@end
