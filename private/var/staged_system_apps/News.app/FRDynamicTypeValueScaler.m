@implementation FRDynamicTypeValueScaler

- (FRDynamicTypeValueScaler)init
{
  return -[FRDynamicTypeValueScaler initWithWithXS:S:M:L:XL:XXL:XXXL:AM:AL:AXL:AXXL:AXXXL:](self, "initWithWithXS:S:M:L:XL:XXL:XXXL:AM:AL:AXL:AXXL:AXXXL:", 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308, 0x7FEFFFFFFFFFFFFFLL, 0x7FEFFFFFFFFFFFFFLL, 0x7FEFFFFFFFFFFFFFLL, 0x7FEFFFFFFFFFFFFFLL);
}

- (FRDynamicTypeValueScaler)initWithWithXS:(double)a3 S:(double)a4 M:(double)a5 L:(double)a6 XL:(double)a7 XXL:(double)a8 XXXL:(double)a9 AM:(double)a10 AL:(double)a11 AXL:(double)a12 AXXL:(double)a13 AXXXL:(double)a14
{
  FRDynamicTypeValueScaler *result;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FRDynamicTypeValueScaler;
  result = -[FRDynamicTypeValueScaler init](&v23, "init");
  if (result)
  {
    result->_XS = a3;
    result->_S = a4;
    result->_M = a5;
    result->_L = a6;
    result->_XL = a7;
    result->_XXL = a8;
    result->_XXXL = a9;
    result->_AM = a10;
    result->_AL = a11;
    result->_AXL = a12;
    result->_AXXL = a13;
    result->_AXXXL = a14;
  }
  return result;
}

+ (id)valueSpecifierWithXS:(double)a3 L:(double)a4 XXXL:(double)a5 AXXXL:(double)a6
{
  FRDynamicTypeValueScaler *v10;

  v10 = objc_alloc_init(FRDynamicTypeValueScaler);
  -[FRDynamicTypeValueScaler setXS:](v10, "setXS:", a3);
  -[FRDynamicTypeValueScaler setL:](v10, "setL:", a4);
  -[FRDynamicTypeValueScaler setXXXL:](v10, "setXXXL:", a5);
  -[FRDynamicTypeValueScaler setAXXXL:](v10, "setAXXXL:", a6);
  return v10;
}

+ (id)valueSpecifierWithXSFactor:(double)a3 largeSize:(double)a4 XXXLFactor:(double)a5 AXXXLFactor:(double)a6
{
  return objc_msgSend(a1, "valueSpecifierWithXS:L:XXXL:AXXXL:", a3 * a4, a4, a4 * a5, a4 * a6);
}

- (double)scaledValueForCurrentPreferredSizeCategory
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  -[FRDynamicTypeValueScaler scaledValueForSizeCategory:](self, "scaledValueForSizeCategory:", v4);
  v6 = v5;

  return v6;
}

- (double)scaledValueForSizeCategory:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v10;
  void *v11;
  id v12;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;

  v4 = a3;
  if (!objc_msgSend(v4, "length") && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007AA78();
  -[FRDynamicTypeValueScaler specifiedValueForContentSizeCategory:](self, "specifiedValueForContentSizeCategory:", v4);
  v6 = v5;
  if (v5 == 1.79769313e308)
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v17 = 1.79769313e308;
    -[FRDynamicTypeValueScaler _previousSpecifiedCategoryStartingAtCategory:outValue:outIndex:](self, "_previousSpecifiedCategoryStartingAtCategory:outValue:outIndex:", v4, &v17, &v16);
    v15 = 1.79769313e308;
    -[FRDynamicTypeValueScaler _nextSpecifiedCategoryStartingAtCategory:outValue:outIndex:](self, "_nextSpecifiedCategoryStartingAtCategory:outValue:outIndex:", v4, &v15, &v14);
    if (v17 == 1.79769313e308 || v16 == 0x7FFFFFFFFFFFFFFFLL || v15 == 1.79769313e308 || v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[FRDynamicTypeValueScaler L](self, "L", 1.79769313e308, v15);
      v6 = v10;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10007A9A4();
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRDynamicTypeValueScaler orderedSizeCategories](self, "orderedSizeCategories", 1.79769313e308, v15));
      v12 = objc_msgSend(v11, "indexOfObject:", v4);

      v6 = v17 + (v15 - v17) / (double)(unint64_t)(v14 - v16) * (double)((unint64_t)v12 - v16);
    }
  }

  return v6;
}

- (double)specifiedValueForContentSizeCategory:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;

  v4 = a3;
  -[FRDynamicTypeValueScaler L](self, "L");
  v6 = v5;
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryExtraSmall))
  {
    -[FRDynamicTypeValueScaler XS](self, "XS");
LABEL_25:
    v6 = v7;
    goto LABEL_26;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategorySmall))
  {
    -[FRDynamicTypeValueScaler S](self, "S");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryMedium))
  {
    -[FRDynamicTypeValueScaler M](self, "M");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryLarge))
  {
    -[FRDynamicTypeValueScaler L](self, "L");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryExtraLarge))
  {
    -[FRDynamicTypeValueScaler XL](self, "XL");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryExtraExtraLarge))
  {
    -[FRDynamicTypeValueScaler XXL](self, "XXL");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryExtraExtraExtraLarge))
  {
    -[FRDynamicTypeValueScaler XXXL](self, "XXXL");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityMedium))
  {
    -[FRDynamicTypeValueScaler AM](self, "AM");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityLarge))
  {
    -[FRDynamicTypeValueScaler AL](self, "AL");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraLarge))
  {
    -[FRDynamicTypeValueScaler AXL](self, "AXL");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraExtraLarge))
  {
    -[FRDynamicTypeValueScaler AXXL](self, "AXXL");
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraExtraExtraLarge))
  {
    -[FRDynamicTypeValueScaler AXXXL](self, "AXXXL");
    goto LABEL_25;
  }
LABEL_26:

  return v6;
}

- (NSArray)orderedSizeCategories
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[12];

  v2 = (void *)qword_10010A500;
  if (!qword_10010A500)
  {
    v6[0] = UIContentSizeCategoryExtraSmall;
    v6[1] = UIContentSizeCategorySmall;
    v6[2] = UIContentSizeCategoryMedium;
    v6[3] = UIContentSizeCategoryLarge;
    v6[4] = UIContentSizeCategoryExtraLarge;
    v6[5] = UIContentSizeCategoryExtraExtraLarge;
    v6[6] = UIContentSizeCategoryExtraExtraExtraLarge;
    v6[7] = UIContentSizeCategoryAccessibilityMedium;
    v6[8] = UIContentSizeCategoryAccessibilityLarge;
    v6[9] = UIContentSizeCategoryAccessibilityExtraLarge;
    v6[10] = UIContentSizeCategoryAccessibilityExtraExtraLarge;
    v6[11] = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
    v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 12));
    v4 = (void *)qword_10010A500;
    qword_10010A500 = v3;

    v2 = (void *)qword_10010A500;
  }
  return (NSArray *)v2;
}

- (void)_previousSpecifiedCategoryStartingAtCategory:(id)a3 outValue:(double *)a4 outIndex:(unint64_t *)a5
{
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;

  v14 = a3;
  *a4 = 1.79769313e308;
  *a5 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRDynamicTypeValueScaler orderedSizeCategories](self, "orderedSizeCategories"));
  v9 = (int64_t)objc_msgSend(v8, "indexOfObject:", v14);

  if ((v9 & 0x8000000000000000) == 0)
  {
    do
    {
      if (*a4 != 1.79769313e308)
        break;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRDynamicTypeValueScaler orderedSizeCategories](self, "orderedSizeCategories", 1.79769313e308));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));
      -[FRDynamicTypeValueScaler specifiedValueForContentSizeCategory:](self, "specifiedValueForContentSizeCategory:", v11);
      *(_QWORD *)a4 = v12;

      *a5 = v9;
    }
    while (v9-- > 0);
  }

}

- (void)_nextSpecifiedCategoryStartingAtCategory:(id)a3 outValue:(double *)a4 outIndex:(unint64_t *)a5
{
  void *v8;
  char *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  *a4 = 1.79769313e308;
  *a5 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRDynamicTypeValueScaler orderedSizeCategories](self, "orderedSizeCategories"));
  v9 = (char *)objc_msgSend(v8, "indexOfObject:", v15);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRDynamicTypeValueScaler orderedSizeCategories](self, "orderedSizeCategories"));
  v11 = (char *)objc_msgSend(v10, "count") - 1;

  for (; v9 <= v11; *a5 = (unint64_t)v9++)
  {
    if (*a4 != 1.79769313e308)
      break;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRDynamicTypeValueScaler orderedSizeCategories](self, "orderedSizeCategories", 1.79769313e308));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v9));
    -[FRDynamicTypeValueScaler specifiedValueForContentSizeCategory:](self, "specifiedValueForContentSizeCategory:", v13);
    *(_QWORD *)a4 = v14;

  }
}

- (double)XS
{
  return self->_XS;
}

- (void)setXS:(double)a3
{
  self->_XS = a3;
}

- (double)S
{
  return self->_S;
}

- (void)setS:(double)a3
{
  self->_S = a3;
}

- (double)M
{
  return self->_M;
}

- (void)setM:(double)a3
{
  self->_M = a3;
}

- (double)L
{
  return self->_L;
}

- (void)setL:(double)a3
{
  self->_L = a3;
}

- (double)XL
{
  return self->_XL;
}

- (void)setXL:(double)a3
{
  self->_XL = a3;
}

- (double)XXL
{
  return self->_XXL;
}

- (void)setXXL:(double)a3
{
  self->_XXL = a3;
}

- (double)XXXL
{
  return self->_XXXL;
}

- (void)setXXXL:(double)a3
{
  self->_XXXL = a3;
}

- (double)AM
{
  return self->_AM;
}

- (void)setAM:(double)a3
{
  self->_AM = a3;
}

- (double)AL
{
  return self->_AL;
}

- (void)setAL:(double)a3
{
  self->_AL = a3;
}

- (double)AXL
{
  return self->_AXL;
}

- (void)setAXL:(double)a3
{
  self->_AXL = a3;
}

- (double)AXXL
{
  return self->_AXXL;
}

- (void)setAXXL:(double)a3
{
  self->_AXXL = a3;
}

- (double)AXXXL
{
  return self->_AXXXL;
}

- (void)setAXXXL:(double)a3
{
  self->_AXXXL = a3;
}

@end
