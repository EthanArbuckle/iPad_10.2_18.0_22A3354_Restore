@implementation SXJSONAdvertisementSettings

- (unint64_t)bannerTypeWithValue:(id)a3 withType:(int)a4
{
  id v4;
  unint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("any")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("standard")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("double_height")) & 1) != 0)
    {
      v5 = 3;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("large")))
    {
      v5 = 4;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  if (v5 <= 1)
    v5 = 1;

  return v5;
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("layout")))
  {
    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXJSONAdvertisementSettings;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (Class)v9;
}

@end
