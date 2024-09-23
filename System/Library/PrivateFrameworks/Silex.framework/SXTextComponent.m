@implementation SXTextComponent

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("inlineTextStyles")) & 1) != 0)
  {
    v5 = &__block_literal_global_43;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
  {
    v5 = &__block_literal_global_6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXTextComponent;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)typeString
{
  return CFSTR("text");
}

uint64_t __54__SXTextComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __54__SXTextComponent_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

- (unint64_t)traits
{
  return 1;
}

@end
