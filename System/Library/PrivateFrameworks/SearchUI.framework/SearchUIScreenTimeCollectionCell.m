@implementation SearchUIScreenTimeCollectionCell

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIScreenTimeCollectionCell;
  v4 = a3;
  -[SearchUICollectionViewCell updateWithRowModel:](&v10, sel_updateWithRowModel_, v4);
  -[SearchUIScreenTimeCollectionCell screenTimeView](self, "screenTimeView", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[SearchUIScreenTimeCollectionCell setScreenTimeView:](self, "setScreenTimeView:", v6);

    -[SearchUIScreenTimeCollectionCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIScreenTimeCollectionCell screenTimeView](self, "screenTimeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

  }
  -[SearchUIScreenTimeCollectionCell screenTimeView](self, "screenTimeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithRowModel:", v4);

}

- (SearchUIScreenTimeView)screenTimeView
{
  return (SearchUIScreenTimeView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setScreenTimeView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTimeView, 0);
}

@end
