@implementation SXAdvertisementPlacementType

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
  {
    v5 = &__block_literal_global_6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXAdvertisementPlacementType;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __67__SXAdvertisementPlacementType_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
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
    v11.super_class = (Class)&OBJC_METACLASS___SXAdvertisementPlacementType;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (Class)v9;
}

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

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; enabled: %d"),
    -[SXAdvertisementPlacementType enabled](self, "enabled"));
  -[SXAdvertisementPlacementType layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; layout: %@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("; frequency: %lu"),
    -[SXAdvertisementPlacementType frequency](self, "frequency"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; bannerType: %lu"),
    -[SXAdvertisementPlacementType bannerType](self, "bannerType"));
  v5 = -[SXAdvertisementPlacementType distanceFromMedia](self, "distanceFromMedia");
  -[SXAdvertisementPlacementType distanceFromMedia](self, "distanceFromMedia");
  objc_msgSend(v3, "appendFormat:", CFSTR("; distanceFromMedia: %f - %lu"), v5, v6);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

@end
