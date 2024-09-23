@implementation SFMoreResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMoreResults)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMoreResults *v6;
  SFMoreResults *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBMoreResults initWithData:]([_SFPBMoreResults alloc], "initWithData:", v5);
  v7 = -[SFMoreResults initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMoreResults *v6;

  v4 = a3;
  v6 = -[_SFPBMoreResults initWithFacade:]([_SFPBMoreResults alloc], "initWithFacade:", self);
  -[_SFPBMoreResults data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMoreResults *v2;
  void *v3;

  v2 = -[_SFPBMoreResults initWithFacade:]([_SFPBMoreResults alloc], "initWithFacade:", self);
  -[_SFPBMoreResults dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMoreResults *v2;
  void *v3;

  v2 = -[_SFPBMoreResults initWithFacade:]([_SFPBMoreResults alloc], "initWithFacade:", self);
  -[_SFPBMoreResults jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFMoreResults label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLabel:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFMoreResults *v4;
  SFMoreResults *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SFMoreResults *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFMoreResults isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SFMoreResults label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMoreResults label](v5, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFMoreResults label](self, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFMoreResults label](self, "label");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMoreResults label](v5, "label");
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

  -[SFMoreResults label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

- (SFMoreResults)initWithProtobuf:(id)a3
{
  id v4;
  SFMoreResults *v5;
  void *v6;
  void *v7;
  SFMoreResults *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFMoreResults;
  v5 = -[SFMoreResults init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMoreResults setLabel:](v5, "setLabel:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (void)loadSearchResultsWithCompletionAndErrorHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__SFMoreResults_Handwritten__loadSearchResultsWithCompletionAndErrorHandler___block_invoke;
  v6[3] = &unk_1E40417A8;
  v7 = v4;
  v5 = v4;
  SFResourceLoaderLoadMoreResults(self, v6);

}

- (void)loadSearchResultsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SFMoreResults_Handwritten__loadSearchResultsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E40417A8;
  v7 = v4;
  v5 = v4;
  -[SFMoreResults loadSearchResultsWithCompletionAndErrorHandler:](self, "loadSearchResultsWithCompletionAndErrorHandler:", v6);

}

uint64_t __69__SFMoreResults_Handwritten__loadSearchResultsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__SFMoreResults_Handwritten__loadSearchResultsWithCompletionAndErrorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
