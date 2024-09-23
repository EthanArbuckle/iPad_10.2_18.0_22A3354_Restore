@implementation SBRotatedIconListModel

+ (BOOL)supportsRotatedLayout
{
  return 0;
}

- (id)activeTransactionCreatingIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[SBRotatedIconListModel unrotatedIconListModel](self, "unrotatedIconListModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTransactionCreatingIfNecessary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)markIconStateDirty
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBRotatedIconListModel;
  -[SBIconListModel markIconStateDirty](&v4, sel_markIconStateDirty);
  -[SBRotatedIconListModel unrotatedIconListModel](self, "unrotatedIconListModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markIconStateDirty");

}

- (SBIconListModel)unrotatedIconListModel
{
  return (SBIconListModel *)objc_loadWeakRetained((id *)&self->_unrotatedIconListModel);
}

- (void)setUnrotatedIconListModel:(id)a3
{
  objc_storeWeak((id *)&self->_unrotatedIconListModel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unrotatedIconListModel);
}

@end
