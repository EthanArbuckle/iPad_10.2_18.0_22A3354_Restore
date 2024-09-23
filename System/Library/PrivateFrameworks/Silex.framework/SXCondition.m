@implementation SXCondition

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v4;
  __CFString *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testing")) & 1) != 0)
  {
    v5 = CFSTR("_anf_testing");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("newsletterSubscriptionStatus")) & 1) != 0)
  {
    v5 = CFSTR("newsletter");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("offerUpsellScenario")) & 1) != 0)
  {
    v5 = CFSTR("upsellScenario");
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXCondition;
    objc_msgSendSuper2(&v7, sel_jsonPropertyNameForObjCPropertyName_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (double)minViewportWidthWithValue:(id)a3 withType:(int)a4
{
  double result;

  if (a4 != 2)
    return 0.0;
  objc_msgSend(a3, "doubleValue");
  return result;
}

- (double)maxViewportWidthWithValue:(id)a3 withType:(int)a4
{
  double result;

  if (a4 != 2)
    return 1.79769313e308;
  objc_msgSend(a3, "doubleValue");
  return result;
}

- (double)minViewportAspectRatioWithValue:(id)a3 withType:(int)a4
{
  double result;

  if (a4 != 2)
    return 0.0;
  objc_msgSend(a3, "doubleValue");
  return result;
}

- (double)maxViewportAspectRatioWithValue:(id)a3 withType:(int)a4
{
  double result;

  if (a4 != 2)
    return 1.79769313e308;
  objc_msgSend(a3, "doubleValue");
  return result;
}

- (int64_t)horizontalSizeClassWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 3)
    return -[SXCondition interfaceSizeClassFromJSONSizeClass:](self, "interfaceSizeClassFromJSONSizeClass:", a3);
  else
    return 0;
}

- (int64_t)verticalSizeClassWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 3)
    return -[SXCondition interfaceSizeClassFromJSONSizeClass:](self, "interfaceSizeClassFromJSONSizeClass:", a3);
  else
    return 0;
}

- (id)minContentSizeCategoryWithValue:(id)a3 withType:(int)a4
{
  id v7;
  uint64_t v8;

  v7 = (id)*MEMORY[0x24BDF76C0];
  if (a4 == 3)
  {
    -[SXCondition contentSizeCategoryFromJSONContentSizeCategory:](self, "contentSizeCategoryFromJSONContentSizeCategory:", a3);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v8;
  }
  return v7;
}

- (id)maxContentSizeCategoryWithValue:(id)a3 withType:(int)a4
{
  id v7;
  uint64_t v8;

  v7 = (id)*MEMORY[0x24BDF76C0];
  if (a4 == 3)
  {
    -[SXCondition contentSizeCategoryFromJSONContentSizeCategory:](self, "contentSizeCategoryFromJSONContentSizeCategory:", a3);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v8;
  }
  return v7;
}

- (unint64_t)testingWithValue:(id)a3 withType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  unint64_t result;

  result = (unint64_t)a3;
  if (a3)
  {
    if (a4 == 2)
      return objc_msgSend(a3, "BOOLValue", v4, v5);
  }
  return result;
}

- (unint64_t)preferredColorSchemeWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    v7 = v5;
    if (objc_msgSend(v7, "length"))
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("light")) & 1) != 0)
      {
        v8 = 2;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("dark")) & 1) != 0)
      {
        v8 = 3;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("any")))
      {
        v8 = 4;
      }
      else
      {
        v8 = 1;
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)newsletterSubscriptionStatusWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    v7 = v5;
    v8 = v7;
    if (v7 && objc_msgSend(v7, "length"))
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("unavailable")) & 1) != 0)
      {
        v9 = 2;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("not_subscribed")) & 1) != 0)
      {
        v9 = 3;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("non_personalized")) & 1) != 0)
      {
        v9 = 4;
      }
      else if (objc_msgSend(v8, "isEqualToString:", CFSTR("personalized")))
      {
        v9 = 5;
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)offerUpsellScenarioWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  int64_t v9;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    v7 = v5;
    v8 = v7;
    if (v7 && objc_msgSend(v7, "length") && (objc_msgSend(v8, "isEqualToString:", CFSTR("undefined")) & 1) == 0)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
      {
        v9 = 2;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("news_plus")) & 1) != 0)
      {
        v9 = 3;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("bundle_any")) & 1) != 0)
      {
        v9 = 4;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("bundle_none")) & 1) != 0)
      {
        v9 = 5;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("bundle_savings")) & 1) != 0)
      {
        v9 = 6;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("bundle_price_reduction")) & 1) != 0)
      {
        v9 = 7;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("bundle_best_value")) & 1) != 0)
      {
        v9 = 8;
      }
      else if (objc_msgSend(v8, "isEqualToString:", CFSTR("bundle_suggestion")))
      {
        v9 = 9;
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)subscriptionActivationEligibilityWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  int64_t v9;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    v7 = v5;
    v8 = v7;
    if (v7 && objc_msgSend(v7, "length") && (objc_msgSend(v8, "isEqualToString:", CFSTR("unknown")) & 1) == 0)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("any")) & 1) != 0)
      {
        v9 = 2;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("none")) & 1) != 0)
      {
        v9 = 1;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("appleOneViaCarrier")) & 1) != 0)
      {
        v9 = 3;
      }
      else if (objc_msgSend(v8, "isEqualToString:", CFSTR("newsPlusViaHardware")))
      {
        v9 = 4;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSet)types
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  -[SXJSONObject JSONRepresentation](self, "JSONRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SXConditionTypes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intersectSet:", v6);

  return (NSSet *)v5;
}

- (int64_t)interfaceSizeClassFromJSONSizeClass:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("compact")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("regular")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)contentSizeCategoryFromJSONContentSizeCategory:(id)a3
{
  id v3;
  id *v4;
  int v5;
  id v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("XS")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF7690];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("S")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF76B8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("M")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF76A8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("L")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF76A0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("XL")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF7688];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("XXL")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF7680];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("XXXL")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF7678];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AX-M")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF7660];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AX-L")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF7658];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AX-XL")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF7650];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AX-XXL")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDF7648];
  }
  else
  {
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("AX-XXXL"));
    v4 = (id *)MEMORY[0x24BDF76C0];
    if (v5)
      v4 = (id *)MEMORY[0x24BDF7640];
  }
  v6 = *v4;

  return v6;
}

@end
