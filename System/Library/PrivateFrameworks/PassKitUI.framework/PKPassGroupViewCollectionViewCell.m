@implementation PKPassGroupViewCollectionViewCell

- (void)setGroupView:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_groupView, a3);
  if (self->_groupView)
  {
    -[PKPassGroupView superview](self->_groupView, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PKPassGroupViewCollectionViewCell contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", self->_groupView);

      -[PKPassGroupViewCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKPassGroupViewCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v20, sel_layoutSubviews);
  if (self->_groupView)
  {
    -[PKPassGroupViewCollectionViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupView superview](self->_groupView, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 == v3)
    {
      -[PKPassGroupView center](self->_groupView, "center");
      v6 = v5;
      v8 = v7;
      v9 = *MEMORY[0x1E0C9D538];
      v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);

      if (v6 == v9 && v8 == v10)
      {
        -[PKPassGroupView bounds](self->_groupView, "bounds");
        -[PKPassGroupView anchorPoint](self->_groupView, "anchorPoint");
        v13 = v12;
        v15 = v14;
        objc_msgSend(v3, "bounds");
        PKSizeAlignedInRect();
        -[PKPassGroupView setCenter:](self->_groupView, "setCenter:", v16 + v13 * v17, v18 + v15 * v19);
      }
    }
    else
    {

    }
  }
}

- (PKPassGroupView)groupView
{
  return self->_groupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupView, 0);
}

@end
