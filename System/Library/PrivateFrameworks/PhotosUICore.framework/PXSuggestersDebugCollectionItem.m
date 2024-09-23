@implementation PXSuggestersDebugCollectionItem

- (PXSuggestersDebugCollectionItem)initWithSuggesterInfo:(id)a3
{
  id v5;
  PXSuggestersDebugCollectionItem *v6;
  uint64_t v7;
  NSString *name;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSuggestersDebugCollectionItem;
  v6 = -[PXSuggestersDebugCollectionItem init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uuid"));
    v7 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v7;

    objc_storeStrong((id *)&v6->_info, a3);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
