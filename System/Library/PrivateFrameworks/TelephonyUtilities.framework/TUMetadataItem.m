@implementation TUMetadataItem

- (TUMetadataItem)init
{
  TUMetadataItem *v2;
  uint64_t v3;
  NSMutableDictionary *callMetadata;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUMetadataItem;
  v2 = -[TUMetadataItem init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    callMetadata = v2->_callMetadata;
    v2->_callMetadata = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setMetadata:(id)a3 forProvider:(Class)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[TUMetadataItem callMetadata](self, "callMetadata");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (id)metadataForProvider:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[TUMetadataItem callMetadata](self, "callMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)callMetadata
{
  return self->_callMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callMetadata, 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUMetadataItem callMetadata](self, "callMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[TUMetadataItem callMetadata](self, "callMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

@end
