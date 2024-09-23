@implementation _PSMLFeatureProvider

- (_PSMLFeatureProvider)init
{
  _PSMLFeatureProvider *v2;
  uint64_t v3;
  NSMutableDictionary *featureValues;
  uint64_t v5;
  NSMutableSet *featureNames;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PSMLFeatureProvider;
  v2 = -[_PSMLFeatureProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    featureValues = v2->_featureValues;
    v2->_featureValues = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    featureNames = v2->_featureNames;
    v2->_featureNames = (NSMutableSet *)v5;

  }
  return v2;
}

- (_PSMLFeatureProvider)initWithFeatureValues:(id)a3
{
  id v4;
  _PSMLFeatureProvider *v5;
  uint64_t v6;
  NSMutableDictionary *featureValues;
  id v8;
  void *v9;
  uint64_t v10;
  NSMutableSet *featureNames;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PSMLFeatureProvider;
  v5 = -[_PSMLFeatureProvider init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    featureValues = v5->_featureValues;
    v5->_featureValues = (NSMutableDictionary *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v4, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithArray:", v9);
    featureNames = v5->_featureNames;
    v5->_featureNames = (NSMutableSet *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[NSMutableDictionary copy](self->_featureValues, "copy");
  v6 = (void *)objc_msgSend(v4, "initWithFeatureValues:", v5);

  return v6;
}

- (void)setValue:(id)a3 forFeature:(id)a4
{
  NSMutableDictionary *featureValues;
  id v7;

  featureValues = self->_featureValues;
  v7 = a4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](featureValues, "setObject:forKeyedSubscript:", a3, v7);
  -[NSMutableSet addObject:](self->_featureNames, "addObject:", v7);

}

- (void)setNumber:(id)a3 forFeature:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = objc_retainAutorelease(a3);
  v6 = a4;
  if (!strcmp((const char *)objc_msgSend(v17, "objCType"), "i"))
  {
    v11 = (void *)MEMORY[0x1E0C9E918];
    v12 = (int)objc_msgSend(v17, "intValue");
    v13 = v11;
LABEL_11:
    objc_msgSend(v13, "featureValueWithInt64:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v7 = objc_retainAutorelease(v17);
  if (!strcmp((const char *)objc_msgSend(v7, "objCType"), "d"))
  {
    v14 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v14, "featureValueWithDouble:");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v10 = (void *)v15;
    goto LABEL_13;
  }
  v8 = objc_retainAutorelease(v7);
  if (!strcmp((const char *)objc_msgSend(v8, "objCType"), "B"))
  {
    v16 = (void *)MEMORY[0x1E0C9E918];
    v12 = objc_msgSend(v8, "BOOLValue");
LABEL_10:
    v13 = v16;
    goto LABEL_11;
  }
  v9 = objc_retainAutorelease(v8);
  if (!strcmp((const char *)objc_msgSend(v9, "objCType"), "q"))
  {
    v16 = (void *)MEMORY[0x1E0C9E918];
    v12 = objc_msgSend(v9, "longValue");
    goto LABEL_10;
  }
  v10 = 0;
LABEL_13:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_featureValues, "setObject:forKeyedSubscript:", v10, v6);
  -[NSMutableSet addObject:](self->_featureNames, "addObject:", v6);

}

- (void)setString:(id)a3 forFeature:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C9E918];
  v8 = a4;
  objc_msgSend(v6, "featureValueWithString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_featureValues, "setObject:forKeyedSubscript:", v7, v8);

  -[NSMutableSet addObject:](self->_featureNames, "addObject:", v8);
}

- (id)featureValueForName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_featureValues, "objectForKeyedSubscript:", a3);
}

- (NSSet)featureNames
{
  return &self->_featureNames->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_featureValues, 0);
}

@end
