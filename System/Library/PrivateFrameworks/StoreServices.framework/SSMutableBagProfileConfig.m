@implementation SSMutableBagProfileConfig

- (SSMutableBagProfileConfig)init
{
  SSMutableBagProfileConfig *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mutableBagKeysDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSMutableBagProfileConfig;
  v2 = -[SSBagProfileConfig init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableBagKeysDictionary = v2->_mutableBagKeysDictionary;
    v2->_mutableBagKeysDictionary = v3;

  }
  return v2;
}

- (id)bagKeysDictionary
{
  void *v2;
  void *v3;

  -[SSMutableBagProfileConfig mutableBagKeysDictionary](self, "mutableBagKeysDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)registerBagKey:(id)a3 valueType:(unint64_t)a4
{
  -[SSMutableBagProfileConfig registerBagKey:valueType:defaultValue:](self, "registerBagKey:valueType:defaultValue:", a3, a4, 0);
}

- (void)registerBagKey:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SSBagKey *v11;

  v8 = a5;
  v9 = a3;
  v11 = -[SSBagKey initWithStringRepresentation:valueType:defaultValue:]([SSBagKey alloc], "initWithStringRepresentation:valueType:defaultValue:", v9, a4, v8);

  -[SSMutableBagProfileConfig mutableBagKeysDictionary](self, "mutableBagKeysDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v9);

}

- (NSMutableDictionary)mutableBagKeysDictionary
{
  return self->_mutableBagKeysDictionary;
}

- (void)setMutableBagKeysDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mutableBagKeysDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableBagKeysDictionary, 0);
}

@end
