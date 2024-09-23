@implementation RFHighlightedSubstring

- (RFHighlightedSubstring)initWithProtobuf:(id)a3
{
  id v4;
  RFHighlightedSubstring *v5;
  void *v6;
  void *v7;
  RFHighlightedSubstring *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RFHighlightedSubstring;
  v5 = -[RFHighlightedSubstring init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "substring");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "substring");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFHighlightedSubstring setSubstring:](v5, "setSubstring:", v7);

    }
    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFHighlightedSubstring)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFHighlightedSubstring *v6;
  RFHighlightedSubstring *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFHighlightedSubstring initWithData:]([_SFPBRFHighlightedSubstring alloc], "initWithData:", v5);
  v7 = -[RFHighlightedSubstring initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFHighlightedSubstring *v6;

  v4 = a3;
  v6 = -[_SFPBRFHighlightedSubstring initWithFacade:]([_SFPBRFHighlightedSubstring alloc], "initWithFacade:", self);
  -[_SFPBRFHighlightedSubstring data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFHighlightedSubstring *v2;
  void *v3;

  v2 = -[_SFPBRFHighlightedSubstring initWithFacade:]([_SFPBRFHighlightedSubstring alloc], "initWithFacade:", self);
  -[_SFPBRFHighlightedSubstring dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFHighlightedSubstring *v2;
  void *v3;

  v2 = -[_SFPBRFHighlightedSubstring initWithFacade:]([_SFPBRFHighlightedSubstring alloc], "initWithFacade:", self);
  -[_SFPBRFHighlightedSubstring jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFHighlightedSubstring substring](self, "substring");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSubstring:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFHighlightedSubstring *v4;
  RFHighlightedSubstring *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (RFHighlightedSubstring *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[RFHighlightedSubstring isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[RFHighlightedSubstring substring](self, "substring");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFHighlightedSubstring substring](v5, "substring");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[RFHighlightedSubstring substring](self, "substring");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[RFHighlightedSubstring substring](self, "substring");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFHighlightedSubstring substring](v5, "substring");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RFHighlightedSubstring substring](self, "substring");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)substring
{
  return self->_substring;
}

- (void)setSubstring:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substring, 0);
}

@end
