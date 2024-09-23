@implementation SXMapComponent

+ (id)typeString
{
  return CFSTR("map");
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("items")) & 1) != 0)
  {
    v5 = &__block_literal_global_92;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXMapComponent;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __53__SXMapComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

- (unint64_t)defaultMapTypeWithValue:(id)a3 withType:(int)a4
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("standard")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("satellite")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("hybrid")))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
