@implementation _DASPolicyCriterion

+ (id)criterionWithFormat:(id)a3
{
  uint64_t v4;

  return (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:arguments:](NSPredicate, "predicateWithFormat:arguments:", a3, &v4));
}

+ (id)criterionWithPredicate:(id)a3
{
  return a3;
}

+ (id)policyCriteriaWithPredicates:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  char *i;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v4));
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", i));
      objc_msgSend(v5, "addObject:", v7);

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));

  return v8;
}

@end
