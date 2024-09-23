@implementation IMMutableBagKeySet

- (NSMutableDictionary)valueTypeMap
{
  return self->_valueTypeMap;
}

- (void)addBagKey:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a3;
  v9 = a5;
  if (v9)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaultValueMap, "setObject:forKeyedSubscript:", v9, v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueTypeMap, "setObject:forKeyedSubscript:", v10, v8);

  v11.receiver = self;
  v11.super_class = (Class)IMMutableBagKeySet;
  -[AMSMutableBagKeySet addBagKey:valueType:defaultValue:](&v11, sel_addBagKey_valueType_defaultValue_, v8, a4, v9);

}

- (IMMutableBagKeySet)init
{
  IMMutableBagKeySet *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *defaultValueMap;
  NSMutableDictionary *v5;
  NSMutableDictionary *valueTypeMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMMutableBagKeySet;
  v2 = -[AMSBagKeySet init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    defaultValueMap = v2->_defaultValueMap;
    v2->_defaultValueMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    valueTypeMap = v2->_valueTypeMap;
    v2->_valueTypeMap = v5;

  }
  return v2;
}

- (NSMutableDictionary)defaultValueMap
{
  return self->_defaultValueMap;
}

- (void)setDefaultValueMap:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValueMap, a3);
}

- (void)setValueTypeMap:(id)a3
{
  objc_storeStrong((id *)&self->_valueTypeMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTypeMap, 0);
  objc_storeStrong((id *)&self->_defaultValueMap, 0);
}

@end
