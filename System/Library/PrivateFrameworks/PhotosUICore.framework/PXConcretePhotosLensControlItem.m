@implementation PXConcretePhotosLensControlItem

- (PXConcretePhotosLensControlItem)initWithIdentifier:(id)a3 title:(id)a4 symbolName:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXConcretePhotosLensControlItem *v12;
  PXConcretePhotosLensControlItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXConcretePhotosLensControlItem;
  v12 = -[PXConcretePhotosLensControlItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_symbolName, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](identifier, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
