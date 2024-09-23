@implementation REMLExplanation

+ (id)explanationForCondition:(id)a3
{
  id v3;
  _REMLConditionExplanation *v4;

  v3 = a3;
  if (REMLExplanationsEnabled())
    v4 = -[_REMLConditionExplanation initWithCondition:]([_REMLConditionExplanation alloc], "initWithCondition:", v3);
  else
    v4 = 0;

  return v4;
}

+ (id)explanationForFeature:(id)a3 mean:(float)a4 variance:(float)a5
{
  id v7;
  _REMLFeatureExplanation *v8;
  double v9;
  double v10;
  _REMLFeatureExplanation *v11;

  v7 = a3;
  if (REMLExplanationsEnabled())
  {
    v8 = [_REMLFeatureExplanation alloc];
    *(float *)&v9 = a4;
    *(float *)&v10 = a5;
    v11 = -[_REMLFeatureExplanation initWithFeature:mean:variance:](v8, "initWithFeature:mean:variance:", v7, v9, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)explanationForFilteringRule:(id)a3
{
  id v3;
  _REMLRuleExplanation *v4;

  v3 = a3;
  if (REMLExplanationsEnabled())
    v4 = -[_REMLRuleExplanation initWithRule:]([_REMLRuleExplanation alloc], "initWithRule:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_canCombineWithSimilarExplanation:(id)a3
{
  return 0;
}

- (int64_t)_rankExplanationToSimilarExplanation:(id)a3
{
  return 0;
}

- (BOOL)_isSystemFeature:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[REFeature systemFeatureNames](REFeature, "systemFeatureNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5);
  return (char)v3;
}

- (id)_formattedNameForFeature:(id)a3 style:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;

  v6 = a3;
  if (_formattedNameForFeature_style__onceToken != -1)
    dispatch_once(&_formattedNameForFeature_style__onceToken, &__block_literal_global_5_0);
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_formattedNameForFeature_style__CamelCaseRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), CFSTR("$1 $2"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedLowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1)
  {
    if (-[REMLExplanation _isSystemFeature:](self, "_isSystemFeature:", v6))
      v10 = CFSTR(" relevance");
    else
      v10 = CFSTR(" feature");
    objc_msgSend(v9, "stringByAppendingString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }

  return v9;
}

void __50__REMLExplanation__formattedNameForFeature_style___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([a-z])([A-Z])"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_formattedNameForFeature_style__CamelCaseRegex;
  _formattedNameForFeature_style__CamelCaseRegex = v0;

}

- (id)_formattedFeatureListFromFeatures:(id)a3 style:(unint64_t)a4
{
  id v6;
  id v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  id v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  REMLExplanation *v21;
  unint64_t v22;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[REMLExplanation _formattedNameForFeature:style:](self, "_formattedNameForFeature:style:", v7, a4);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = CFSTR(", and ");
      if (a4 != 1)
        v9 = 0;
      if (a4)
        v10 = v9;
      else
        v10 = CFSTR(", ");
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __59__REMLExplanation__formattedFeatureListFromFeatures_style___block_invoke;
      v16 = &unk_24CF914C8;
      v17 = v6;
      v18 = v11;
      v19 = (__CFString *)v10;
      v20 = CFSTR(", ");
      v21 = self;
      v22 = a4;
      v7 = v11;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v13);
      v8 = (__CFString *)objc_msgSend(v7, "copy", v13, v14, v15, v16);

    }
  }
  else
  {
    v8 = &stru_24CF92178;
  }

  return v8;
}

void __59__REMLExplanation__formattedFeatureListFromFeatures_style___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 == a3)
  {
    v5 = (_QWORD *)(a1 + 48);
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "appendString:", *v5);
    goto LABEL_6;
  }
  if (a3)
  {
    v5 = (_QWORD *)(a1 + 56);
    goto LABEL_5;
  }
LABEL_6:
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 64), "_formattedNameForFeature:style:", v8, *(_QWORD *)(a1 + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

}

- (BOOL)canCombineExplanationWithExplanation:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[REMLExplanation _canCombineWithSimilarExplanation:](self, "_canCombineWithSimilarExplanation:", v4);

  return v5;
}

- (BOOL)shouldProvideExplanation
{
  return 1;
}

- (REMLExplanation)explanationWithStyle:(unint64_t)a3
{
  return (REMLExplanation *)&stru_24CF92178;
}

- (int64_t)rankExplanationToExplanation:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isEqual:", objc_opt_class()))
  {
    v6 = -[REMLExplanation _rankExplanationToSimilarExplanation:](self, "_rankExplanationToSimilarExplanation:", v4);
  }
  else if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()))
  {
    v6 = 1;
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

@end
