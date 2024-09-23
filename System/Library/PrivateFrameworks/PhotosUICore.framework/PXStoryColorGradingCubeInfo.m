@implementation PXStoryColorGradingCubeInfo

- (PXStoryColorGradingCubeInfo)init
{
  return -[PXStoryColorGradingCubeInfo initWithDictionary:](self, "initWithDictionary:", &unk_1E53F0EA8);
}

- (PXStoryColorGradingCubeInfo)initWithDictionary:(id)a3
{
  id v5;
  PXStoryColorGradingCubeInfo *v6;
  PXStoryColorGradingCubeInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryColorGradingCubeInfo;
  v6 = -[PXStoryColorGradingCubeInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingDict, a3);

  return v7;
}

- (NSString)resource
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_backingDict, "objectForKeyedSubscript:", CFSTR("resource"));
}

- (NSString)name
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_backingDict, "objectForKeyedSubscript:", CFSTR("name"));
}

- (NSString)tier
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_backingDict, "objectForKeyedSubscript:", CFSTR("tier"));
}

- (BOOL)isAutoSelectable
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_backingDict, "objectForKeyedSubscript:", CFSTR("auto-selectable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isUserSelectable
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_backingDict, "objectForKeyedSubscript:", CFSTR("user-selectable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSArray)categories
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_backingDict, "objectForKeyedSubscript:", CFSTR("categories"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingDict, 0);
}

@end
