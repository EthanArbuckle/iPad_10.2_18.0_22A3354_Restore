@implementation OADTableStyleCollection

- (OADTableStyleCollection)init
{
  OADTableStyleCollection *v2;
  uint64_t v3;
  NSMutableArray *styles;
  uint64_t v5;
  NSMutableDictionary *styleMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADTableStyleCollection;
  v2 = -[OADTableStyleCollection init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    styles = v2->_styles;
    v2->_styles = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    styleMap = v2->_styleMap;
    v2->_styleMap = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)addTableStyle:(id)a3
{
  NSMutableDictionary *styleMap;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableArray addObject:](self->_styles, "addObject:");
  styleMap = self->_styleMap;
  objc_msgSend(v6, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](styleMap, "setObject:forKeyedSubscript:", v6, v5);

}

- (id)tableStyles
{
  return self->_styles;
}

- (id)tableStyleWithId:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_styleMap, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)defaultTableStyleId
{
  return self->_defaultTableStyleId;
}

- (void)setDefaultTableStyleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTableStyleId, 0);
  objc_storeStrong((id *)&self->_styleMap, 0);
  objc_storeStrong((id *)&self->_styles, 0);
}

@end
