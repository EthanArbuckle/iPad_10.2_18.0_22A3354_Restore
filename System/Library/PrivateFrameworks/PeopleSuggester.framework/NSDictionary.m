@implementation NSDictionary

- (_PSFeatureDictionary)_ps_dictionaryByAddingEntryForObject:(void *)a3 withKey:
{
  id v5;
  id v6;
  id v7;
  _PSFeatureDictionary *v8;
  _PSFeatureDictionary *v9;

  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_11;
  -[_PSFeatureDictionary objectForKeyedSubscript:](a1, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    v9 = (_PSFeatureDictionary *)-[_PSFeatureDictionary copy](a1, "copy");
LABEL_8:
    a1 = v9;
    goto LABEL_11;
  }
  if (!-[_PSFeatureDictionary count](a1, "count"))
  {
    v9 = -[_PSFeatureDictionary initWithObjectsAndKeys:]([_PSFeatureDictionary alloc], "initWithObjectsAndKeys:", v5, v6, 0);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = (_PSFeatureDictionary *)-[_PSFeatureDictionary mutableCopy](a1, "mutableCopy");
  else
    v8 = -[_PSFeatureDictionary initWithDictionary:]([_PSFeatureDictionary alloc], "initWithDictionary:", a1);
  a1 = v8;
  -[_PSFeatureDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v5, v6);
LABEL_11:

  return a1;
}

@end
