@implementation TPSCellularNetworkItem

- (TPSCellularNetworkItem)init
{
  -[TPSCellularNetworkItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSCellularNetworkItem)initWithIdentifier:(id)a3 name:(id)a4 localizedName:(id)a5
{
  id v8;
  id v9;
  id v10;
  TPSCellularNetworkItem *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *localizedName;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TPSCellularNetworkItem;
  v11 = -[TPSCellularNetworkItem init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TPSCellularNetworkItem isEqualToCellularNetworkItem:](self, "isEqualToCellularNetworkItem:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[TPSCellularNetworkItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TPSCellularNetworkItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[TPSCellularNetworkItem localizedName](self, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqualToCellularNetworkItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[TPSCellularNetworkItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[TPSCellularNetworkItem name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[TPSCellularNetworkItem localizedName](self, "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
