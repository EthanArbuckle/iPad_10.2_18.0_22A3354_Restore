@implementation NSComparisonPredicate(PPSSQLitePredicate)

- (id)pps_sqlPredicateForSelect
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "leftExpression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "predicateOperatorType");
  if (v4 < 0xB && ((0x4BFu >> v4) & 1) != 0)
  {
    v6 = qword_243A6D5E8[v4];
    if (objc_msgSend(v2, "expressionType") == 3)
      objc_msgSend(v2, "keyPath");
    else
      objc_msgSend(v2, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "expressionType"))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unexpected constant value in right side of comparison expression: %@"), a1);
      v8 = 0;
    }
    else
    {
      objc_msgSend(v3, "constantValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "_checkTypeForValue:inKeyPath:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PPSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](PPSSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", v7, v9, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unsupported operator type in comparison expression: %@"), a1);
    v5 = 0;
  }

  return v5;
}

- (id)_checkTypeForValue:()PPSSQLitePredicate inKeyPath:
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v3)
      {
        v5 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v3, "timeIntervalSinceReferenceDate");
        objc_msgSend(v5, "numberWithDouble:");
        v4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v3)
        {
          objc_msgSend(v3, "UUIDString");
          v4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v3)
          {
            objc_msgSend(v3, "absoluteString");
            v4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || v3)
            goto LABEL_3;
        }
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!v3)
    goto LABEL_15;
LABEL_3:
  v4 = v3;
LABEL_16:
  v6 = v4;

  return v6;
}

@end
