@implementation SXConditionalComponentStyle

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditions")) & 1) != 0)
  {
    v5 = &__block_literal_global_31;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXConditionalComponentStyle;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __66__SXConditionalComponentStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

@end
