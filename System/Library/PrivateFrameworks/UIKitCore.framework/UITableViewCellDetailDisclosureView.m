@implementation UITableViewCellDetailDisclosureView

- (UITableViewCellDetailDisclosureView)initWithTarget:(id)a3 action:(SEL)a4 cell:(id)a5 buttonType:(int64_t)a6 shouldReverseLayoutDirection:(BOOL)a7
{
  id v10;
  UITableViewCellDetailDisclosureView *v11;
  UITableViewCellDetailDisclosureView *v12;
  _QWORD v14[4];
  UITableViewCellDetailDisclosureView *v15;
  id v16;
  int64_t v17;
  BOOL v18;
  objc_super v19;

  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UITableViewCellDetailDisclosureView;
  v11 = -[UIControl initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_cell, v10);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __106__UITableViewCellDetailDisclosureView_initWithTarget_action_cell_buttonType_shouldReverseLayoutDirection___block_invoke;
    v14[3] = &unk_1E16C07C8;
    v15 = v12;
    v17 = a6;
    v16 = v10;
    v18 = a7;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);

  }
  return v12;
}

void __106__UITableViewCellDetailDisclosureView_initWithTarget_action_cell_buttonType_shouldReverseLayoutDirection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  UIImageView *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double Height;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double MaxX;
  CGFloat rect;
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  +[UIButton buttonWithType:](UIButton, "buttonWithType:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 464);
  *(_QWORD *)(v3 + 464) = v2;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(*(id *)(a1 + 40), "_disclosureChevronImage");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v38);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 472);
  *(_QWORD *)(v6 + 472) = v5;

  v8 = MEMORY[0x1E0C9D648];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  v14 = 0.0;
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "frame");
    v14 = CGRectGetMaxX(v39) + 12.0;
  }
  v15 = *(double *)(v8 + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "frame");
  v19 = v18;
  v21 = v20;
  v22 = v17;
  rect = v15;
  if (*(_BYTE *)(a1 + 56))
  {
    v40.origin.x = v14;
    v40.origin.y = v15;
    v40.size.width = v11;
    v40.size.height = v13;
    v23 = CGRectGetMaxX(v40) + 12.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setFrame:", v23, v19, v21, v22);
    v17 = v22;
  }
  else
  {
    v23 = v16;
  }
  v24 = v23;
  v25 = v19;
  v26 = v19;
  v27 = v21;
  v28 = v21;
  v29 = v17;
  Height = CGRectGetHeight(*(CGRect *)(&v17 - 3));
  v41.origin.x = v14;
  v41.origin.y = rect;
  v41.size.width = v11;
  v41.size.height = v13;
  v31 = (Height - CGRectGetHeight(v41)) * 0.5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrame:", v14, v31, v11, v13);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
  if (*(_BYTE *)(a1 + 56))
    v32 = v25;
  else
    v32 = v31;
  if (*(_BYTE *)(a1 + 56))
    v33 = v23;
  else
    v33 = v14;
  if (*(_BYTE *)(a1 + 56))
    v34 = v27;
  else
    v34 = v11;
  if (*(_BYTE *)(a1 + 56))
    v35 = v29;
  else
    v35 = v13;
  MaxX = CGRectGetMaxX(*(CGRect *)(&v32 - 1));
  v42.origin.x = v23;
  v42.origin.y = v25;
  v42.size.width = v27;
  v42.size.height = v29;
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", 0.0, 0.0, MaxX, CGRectGetHeight(v42));

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellDetailDisclosureView;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[UIImageView setSemanticContentAttribute:](self->_disclosureView, "setSemanticContentAttribute:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIView frame](self, "frame", a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  -[UIControl addTarget:action:forControlEvents:](self->_accessoryButton, "addTarget:action:forControlEvents:", a3, a4, a5);
}

- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  -[UIControl removeTarget:action:forControlEvents:](self->_accessoryButton, "removeTarget:action:forControlEvents:", a3, a4, a5);
}

- (void)_updateDisclosureChevronImage
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(WeakRetained, "_disclosureChevronImageWithBaseColor:", self->_accessoryTintColor);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_disclosureView, "setImage:", v3);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellDetailDisclosureView;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[UITableViewCellDetailDisclosureView _updateDisclosureChevronImage](self, "_updateDisclosureChevronImage");
}

- (void)setAccessoryTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIColor isEqual:](self->_accessoryTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    -[UITableViewCellDetailDisclosureView _updateDisclosureChevronImage](self, "_updateDisclosureChevronImage");
  }

}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_destroyWeak((id *)&self->_cell);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
}

@end
