@implementation SXDataTableColumnStyle

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
  {
    v5 = &__block_literal_global_60;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("selectors")) & 1) != 0)
  {
    v5 = &__block_literal_global_4_1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXDataTableColumnStyle;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __61__SXDataTableColumnStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __61__SXDataTableColumnStyle_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

@end
