@implementation PKDashboardPassGroupItemPresenter

- (PKDashboardPassGroupItemPresenter)initWithPassGroupView:(id)a3
{
  id v5;
  PKDashboardPassGroupItemPresenter *v6;
  PKDashboardPassGroupItemPresenter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPassGroupItemPresenter;
  v6 = -[PKDashboardPassGroupItemPresenter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_groupView, a3);

  return v7;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("groupItemPresenter");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "peerPaymentAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v10, "pkui_viewControllerFromResponderChain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("groupItemPresenter"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassGroupItemPresenter _configureCell:forItem:](self, "_configureCell:forItem:", v9, v8);

  return v9;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  objc_msgSend(a4, "bounds", a3);
  -[PKPassGroupView sizeThatFits:](self->_groupView, "sizeThatFits:", v6, 1.79769313e308);
  v8 = v7;
  v10 = v9;
  -[PKPassGroupView alignmentRectInsets](self->_groupView, "alignmentRectInsets");
  v13 = v8 - (v11 + v12);
  v16 = v10 - (v14 + v15);
  v17 = v13;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(v5, "setWantsCustomAppearance:", 1);
  objc_msgSend(v5, "setMaskType:", 0);
  objc_msgSend(v5, "setGroupView:", self->_groupView);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_groupView, 0);
}

@end
