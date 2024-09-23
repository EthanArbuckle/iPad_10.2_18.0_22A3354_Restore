@implementation REExportedValue

+ (id)exportedValueForArray:(id)a3
{
  id v3;
  REExportedArrayValue *v4;
  REExportedArrayValue *v5;

  v3 = a3;
  if (v3)
  {
    v4 = -[REExportedArrayValue initWithArray:]([REExportedArrayValue alloc], "initWithArray:", v3);
  }
  else
  {
    +[REExportedNullValue sharedInstance](REExportedNullValue, "sharedInstance");
    v4 = (REExportedArrayValue *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)exportedValueForDictionary:(id)a3
{
  id v3;
  REExportedDictionaryValue *v4;
  REExportedDictionaryValue *v5;

  v3 = a3;
  if (v3)
  {
    v4 = -[REExportedDictionaryValue initWithDictionary:]([REExportedDictionaryValue alloc], "initWithDictionary:", v3);
  }
  else
  {
    +[REExportedNullValue sharedInstance](REExportedNullValue, "sharedInstance");
    v4 = (REExportedDictionaryValue *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)exportedValueForDate:(id)a3
{
  id v3;
  REExportedDateValue *v4;
  REExportedDateValue *v5;

  v3 = a3;
  if (v3)
  {
    v4 = -[REExportedDateValue initWithDate:]([REExportedDateValue alloc], "initWithDate:", v3);
  }
  else
  {
    +[REExportedNullValue sharedInstance](REExportedNullValue, "sharedInstance");
    v4 = (REExportedDateValue *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)exportedValueForNumber:(id)a3
{
  id v3;
  REExportedNumberValue *v4;
  REExportedNumberValue *v5;

  v3 = a3;
  if (v3)
  {
    v4 = -[REExportedNumberValue initWithNumber:]([REExportedNumberValue alloc], "initWithNumber:", v3);
  }
  else
  {
    +[REExportedNullValue sharedInstance](REExportedNullValue, "sharedInstance");
    v4 = (REExportedNumberValue *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)exportedValueForString:(id)a3
{
  id v3;
  REExportedStringValue *v4;
  REExportedStringValue *v5;

  v3 = a3;
  if (v3)
  {
    v4 = -[REExportedStringValue initWithString:]([REExportedStringValue alloc], "initWithString:", v3);
  }
  else
  {
    +[REExportedNullValue sharedInstance](REExportedNullValue, "sharedInstance");
    v4 = (REExportedStringValue *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)exportedValueForObject:(id)a3
{
  objc_class *v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  __objc2_class *v12;

  v4 = (objc_class *)a3;
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (object_isClass(v5))
      {
        NSStringFromClass(v5);
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (objc_class *)v6;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "_exportedValueForTable:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "exportedValueForString:", v5);
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "exportedValueForNumber:", v5);
            v7 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(a1, "exportedValueForArray:", v5);
              v7 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(a1, "exportedValueForDictionary:", v5);
                v7 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(a1, "exportedValueForDate:", v5);
                  v7 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[objc_class allObjects](v5, "allObjects");
                    v8 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(a1, "exportedValueForArray:", v8);
                    v9 = objc_claimAutoreleasedReturnValue();

LABEL_25:
                    v5 = (objc_class *)v9;
                    return v5;
                  }
                  +[RESingleton sharedInstance](REInterfaceCache, "sharedInstance");
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = objc_msgSend(v10, "exportedInterfaceClass:", objc_opt_class());

                  if (v11)
                    v12 = REExportedObjectValue;
                  else
                    v12 = REExportedUnknownObjectValue;
                  v7 = objc_msgSend([v12 alloc], "initWithObject:", v5);
                }
              }
            }
          }
        }
      }
      v9 = v7;
      goto LABEL_25;
    }
  }
  else
  {
    +[REExportedNullValue sharedInstance](REExportedNullValue, "sharedInstance");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)_exportedValueForTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("$attrib-"), "stringByAppendingString:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("table"), v6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "sortable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("$attrib-"), "stringByAppendingString:", CFSTR("sortable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v8);

  objc_msgSend(v4, "header");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("header"));

  if (objc_msgSend(v4, "rowsCount"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v4, "rowAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      ++v10;
    }
    while (v10 < objc_msgSend(v4, "rowsCount"));
  }
  objc_msgSend(a1, "exportedValueForDictionary:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)arrayValue
{
  return 0;
}

- (id)dictionaryValue
{
  return 0;
}

- (id)objectValue
{
  return 0;
}

- (id)stringValue
{
  return 0;
}

- (id)numberValue
{
  return 0;
}

- (id)dateValue
{
  return 0;
}

- (unint64_t)propertyCount
{
  return 0;
}

- (unint64_t)type
{
  return 6;
}

- (BOOL)shouldEncodeProperty:(id)a3
{
  return 1;
}

- (id)exportedValueForKey:(id)a3
{
  return +[REExportedNullValue sharedInstance](REExportedNullValue, "sharedInstance", a3);
}

@end
