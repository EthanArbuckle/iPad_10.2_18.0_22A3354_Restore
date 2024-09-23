@implementation SFAirDropTransferItem

- (SFAirDropTransferItem)init
{
  return -[SFAirDropTransferItem initWithType:isFile:](self, "initWithType:isFile:", &stru_1E483B8E8, 0);
}

- (SFAirDropTransferItem)initWithType:(id)a3 isFile:(BOOL)a4
{
  return -[SFAirDropTransferItem initWithType:subtype:isFile:](self, "initWithType:subtype:isFile:", a3, 0, a4);
}

- (SFAirDropTransferItem)initWithType:(id)a3 subtype:(id)a4 isFile:(BOOL)a5
{
  id v8;
  id v9;
  SFAirDropTransferItem *v10;
  uint64_t v11;
  NSString *type;
  uint64_t v13;
  NSString *subtype;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SFAirDropTransferItem;
  v10 = -[SFAirDropTransferItem init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    type = v10->_type;
    v10->_type = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    subtype = v10->_subtype;
    v10->_subtype = (NSString *)v13;

    v10->_count = 1;
    v10->_isFile = a5;
  }

  return v10;
}

- (void)incrementCount
{
  ++self->_count;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransferItem)initWithCoder:(id)a3
{
  id v4;
  SFAirDropTransferItem *v5;
  void *v6;
  uint64_t v7;
  NSString *type;
  void *v9;
  uint64_t v10;
  NSString *subtype;

  v4 = a3;
  v5 = -[SFAirDropTransferItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    type = v5->_type;
    v5->_type = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtype"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    subtype = v5->_subtype;
    v5->_subtype = (NSString *)v10;

    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
    v5->_isFile = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFile"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtype, CFSTR("subtype"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_count, CFSTR("count"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFile, CFSTR("isFile"));

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v10;

  objc_opt_class();
  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  if (self->_subtype)
  {
    v10 = v3;
    NSAppendPrintF();
    v5 = v10;

    v4 = v5;
  }
  NSAppendPrintF();
  v6 = v4;

  NSAppendPrintF();
  v7 = v6;

  NSAppendPrintF();
  v8 = v7;

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  -[SFAirDropTransferItem type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SFAirDropTransferItem count](self, "count") ^ v4;
  v6 = v5 ^ -[SFAirDropTransferItem isFile](self, "isFile");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SFAirDropTransferItem *v4;
  SFAirDropTransferItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int64_t v15;
  _BOOL4 v16;

  v4 = (SFAirDropTransferItem *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SFAirDropTransferItem subtype](v5, "subtype");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropTransferItem subtype](self, "subtype");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v11 = 0;
      }
      else
      {
        -[SFAirDropTransferItem subtype](v5, "subtype");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAirDropTransferItem subtype](self, "subtype");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        v11 = v10 ^ 1;
      }

      -[SFAirDropTransferItem type](self, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropTransferItem type](v5, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = 0;
      if (objc_msgSend(v13, "isEqual:", v14) && (v11 & 1) == 0)
      {
        v15 = -[SFAirDropTransferItem count](self, "count");
        if (v15 == -[SFAirDropTransferItem count](v5, "count"))
        {
          v16 = -[SFAirDropTransferItem isFile](self, "isFile");
          v12 = v16 ^ -[SFAirDropTransferItem isFile](v5, "isFile") ^ 1;
        }
        else
        {
          LOBYTE(v12) = 0;
        }
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)subtype
{
  return self->_subtype;
}

- (int64_t)count
{
  return self->_count;
}

- (BOOL)isFile
{
  return self->_isFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
