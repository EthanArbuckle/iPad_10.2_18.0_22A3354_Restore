@implementation _PXPhotosDetailsBarItem

- (_PXPhotosDetailsBarItem)initWithIdentifier:(id)a3
{
  id v5;
  _PXPhotosDetailsBarItem *v6;
  _PXPhotosDetailsBarItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXPhotosDetailsBarItem;
  v6 = -[_PXPhotosDetailsBarItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_PXPhotosDetailsBarItem;
  -[_PXPhotosDetailsBarItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ identifier:%@>"), v4, self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
