@implementation PXGSingleViewUserData

- (PXGSingleViewUserData)initWithContentView:(id)a3
{
  id v5;
  PXGSingleViewUserData *v6;
  PXGSingleViewUserData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGSingleViewUserData;
  v6 = -[PXGSingleViewUserData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentView, a3);

  return v7;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
