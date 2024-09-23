@implementation REFeatureValue

+ (REFeatureValue)featureValueWithDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value_type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value_value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(v5)
  {
    case 0:
      +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", objc_msgSend(v6, "BOOLValue"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", objc_msgSend(v6, "integerValue"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(v6, "doubleValue");
      +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            +[REFeatureValue featureValueWithDictionary:](REFeatureValue, "featureValueWithDictionary:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v13);
      }

      +[REFeatureValue featureValueWithSet:](REFeatureValue, "featureValueWithSet:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v9 = 0;
      break;
  }

  return (REFeatureValue *)v9;
}

+ (REFeatureValue)featureValueWithInt64:(int64_t)a3
{
  return (REFeatureValue *)+[_REIntegerFeatureValue featureValueWithInt64:](_REIntegerFeatureValue, "featureValueWithInt64:", a3);
}

+ (REFeatureValue)featureValueWithString:(id)a3
{
  return (REFeatureValue *)+[_REStringFeatureValue featureValueWithString:](_REStringFeatureValue, "featureValueWithString:", a3);
}

+ (REFeatureValue)featureValueWithDouble:(double)a3
{
  return (REFeatureValue *)+[_REDoubleFeatureValue featureValueWithDouble:](_REDoubleFeatureValue, "featureValueWithDouble:", a3);
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)BOOLValue
{
  return 0;
}

- (unint64_t)int64Value
{
  return 0;
}

- (double)doubleValue
{
  return 0.0;
}

- (NSString)stringValue
{
  return (NSString *)&stru_24CF92178;
}

- (NSSet)setValue
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

+ (REFeatureValue)featureValueWithBool:(BOOL)a3
{
  return (REFeatureValue *)+[_REBoolFeatureValue featureValueWithBool:](_REBoolFeatureValue, "featureValueWithBool:", a3);
}

+ (REFeatureValue)featureValueWithSet:(id)a3
{
  return (REFeatureValue *)+[_RESetFeatureValue featureValueWithSet:](_RESetFeatureValue, "featureValueWithSet:", a3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  REValueDescriptionStringFromFeatureValue(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (self == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

+ (id)nullValueForFeature:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;

  v3 = a3;
  if (nullValueForFeature__onceToken != -1)
    dispatch_once(&nullValueForFeature__onceToken, &__block_literal_global_196);
  v4 = objc_msgSend(v3, "featureType");
  v5 = &nullValueForFeature__NullValue;
  if (!v4)
    v5 = &nullValueForFeature__NullBinaryValue;
  v6 = (id)*v5;

  return v6;
}

void __49__REFeatureValue_NullValue__nullValueForFeature___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", -1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nullValueForFeature__NullValue;
  nullValueForFeature__NullValue = v0;

  +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)nullValueForFeature__NullBinaryValue;
  nullValueForFeature__NullBinaryValue = v2;

}

- (id)dictionaryEncoding
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  switch(-[REFeatureValue type](self, "type"))
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[REFeatureValue BOOLValue](self, "BOOLValue"));
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[REFeatureValue int64Value](self, "int64Value"));
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      v5 = (void *)MEMORY[0x24BDD16E0];
      -[REFeatureValue doubleValue](self, "doubleValue");
      objc_msgSend(v5, "numberWithDouble:");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[REFeatureValue stringValue](self, "stringValue");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = (void *)v3;
      break;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[REFeatureValue setValue](self, "setValue", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "dictionaryEncoding");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        }
        while (v9);
      }

      v4 = (void *)objc_msgSend(v6, "copy");
      break;
    default:
      v4 = &unk_24CFC1630;
      break;
  }
  v20[0] = CFSTR("value_type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[REFeatureValue type](self, "type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("value_value");
  v21[0] = v13;
  v21[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
