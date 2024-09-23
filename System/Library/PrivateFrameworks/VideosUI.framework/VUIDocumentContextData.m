@implementation VUIDocumentContextData

- (NSDictionary)contextDataDict
{
  return self->_contextDataDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDataDict, 0);
}

- (VUIDocumentContextData)initWithDictionary:(id)a3
{
  id v4;
  VUIDocumentContextData *v5;
  uint64_t v6;
  NSDictionary *contextDataDict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDocumentContextData;
  v5 = -[VUIDocumentContextData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contextDataDict = v5->_contextDataDict;
    v5->_contextDataDict = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VUIDocumentContextData *v4;
  VUIDocumentContextData *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VUIDocumentContextData *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VUIDocumentContextData jsonData](self, "jsonData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDocumentContextData jsonData](v5, "jsonData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToDictionary:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)setContextDataDict:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
