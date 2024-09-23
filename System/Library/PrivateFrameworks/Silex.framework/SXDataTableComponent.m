@implementation SXDataTableComponent

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("sortBy")) & 1) != 0)
  {
    v5 = &__block_literal_global_95;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXDataTableComponent;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __59__SXDataTableComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

- (unint64_t)dataOrientationWithValue:(id)a3 withType:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 3)
    return objc_msgSend(a3, "isEqualToString:", CFSTR("vertical"), v4, v5);
  else
    return 0;
}

- (BOOL)showDescriptorLabelsWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 2)
    return objc_msgSend(a3, "BOOLValue");
  else
    return 1;
}

@end
